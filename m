Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE3CC47DDF
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 13:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4502D10FA56;
	Fri, 26 Jan 2024 13:14:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2304F10FA4D;
 Fri, 26 Jan 2024 13:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706274880; x=1737810880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aCsa8LdmpzdGBqHhYfinS3TtkTIEhBqH4XCAzkCW1e0=;
 b=DTjXFCoVb75eAxfDRdeTP2KoZGQLnzVbiAPMIWT2KZrgBs0CBWADgEm3
 +dUG99wA7JbGr9VmZ5jtGT1IEJlgGEc5n/mfQdLhWj/+9hZTyOf0VfSy8
 KJ2e4aWEDKWm961RkZmW7bY/K/iiwoEp48cbZFEYKWoq4ebitJEYMOD/4
 OpbXA7W4jWE9xPi8/iAhub6IWVe6/S6MO32E1+GsDeXhLk668jcTYHoqr
 7/hvraTdSO9yEkWTxwz5+wApul6hxk5sSUlNVEF/rgPHQREkJl0DoJGml
 VRfNz1jRmd6mU7gZd838jbqYlzmfvmYvO4ljM2sHd1IhvxPYa7oKQ1f4f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="15823970"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15823970"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 05:14:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2661999"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.21.59])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 05:14:37 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 0/3] lib/kunit: Support writable filter* parameters
 of kunit module
Date: Fri, 26 Jan 2024 14:14:34 +0100
Message-ID: <13875046.RDIVbhacDa@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <o5um4wakpooxbxd5algtfpgqmwar5lb2dkahdrc5zkma3nvlul@j6jyzvai4aht>
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
 <o5um4wakpooxbxd5algtfpgqmwar5lb2dkahdrc5zkma3nvlul@j6jyzvai4aht>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Lucas,

Thanks for looking at this.

On Thursday, 25 January 2024 18:25:55 CET Lucas De Marchi wrote:
> On Thu, Jan 25, 2024 at 05:52:09PM +0100, Janusz Krzysztofik wrote:
> >Instead of wasting resources on reloading the base Kunit module each time
> >a different set of filter parameters is needed, try to write the required
> >values to sysfs representation of those parameters.  If that fails (e.g.
> >on older LTS kernels with read-only filter parameters), fall back to
> 
> we can't really execute anything on LTS kernel. 

Yes, we can, and we do, since modules of DRM generic selftests like drm_buddy 
or drm_mm and a couple of KMS related ones were converted from i915 selftest 
format to KUnit and our IGT counterparts that load those modules and execute 
those tests were updated accordingly.  Maybe our CI no longer exercises IGT 
tests on LTS kernels, but the community may still do, I believe.

Thanks,
Janusz


> I don't think think it's
> worth keeping the multiple fallbacks we have now.
> 
> I think trying to maintain compat is good, but I'm not sure it makes
> sense for these tightly coupled tests with the kernel.
> 
> Lucas De Marchi
> 




