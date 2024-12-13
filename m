Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92F6E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 05:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3F110E074;
	Fri, 13 Dec 2024 05:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgWq1y8B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D4610E074
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 05:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734068667; x=1765604667;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RKBUmq5f+kogYEsBOvxD2JojCoSVgIhxYsRUMfvbFDU=;
 b=bgWq1y8BlBnsC6bYhwmkzwfZav/5VEqufZ6PogaKqYzgLD12zDLZNbvS
 05BK0QegzkJlNcl80yJk9kNY5dAX5PnRUJjytXl0efKv1T3hSpgIuFGoZ
 oyCDhkO+1qCwsFHugWyfa0ALBpvEUhrGRxMKnKG++itP09NakB4JYu7JT
 Z7CRTZi7F3FAR8ZLNFcLQ+ypzxMof6HXaMawLoKnPEFIzwTQYsne3L4uj
 btvA/R3G9pb8/c1SOGqaB/oOktOz72XO3aHfXvArTBaDgHtl5N9n5HVgd
 ZcrVxHlVm5irRd86ZOPZc6De788CR+GYbiEAoAU6+gKmVXk+RxyjNyJAj A==;
X-CSE-ConnectionGUID: DYnVIUH1QTSxHKEt9BgeFg==
X-CSE-MsgGUID: I+GexbT7R0yf6ygfomAp2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34559842"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34559842"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 21:44:26 -0800
X-CSE-ConnectionGUID: U6yQOE63QEuIfZzzRCq3lw==
X-CSE-MsgGUID: AlZTCbwHQne7UEZ/Yk2LXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="96347116"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.169])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 21:44:24 -0800
Date: Thu, 12 Dec 2024 23:44:15 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com, 
 umesh.nerlige.ramappa@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, 
 aravind.iddamsetty@intel.com, john.c.harrison@intel.com,
 ashutosh.dixit@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v2 7/8] drm/xe/guc: Expose engine busyness only for
 supported GuC version
Message-ID: <u3bmt4wjtini2n7bes6gyq2f23kboagca4ee3ekg3oer3qjujj@mh5ct5xwggo6>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-8-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241121063904.3033754-8-riana.tauro@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 21, 2024 at 12:09:03PM +0530, Riana Tauro wrote:
>Engine busyness is supported only on GuC versions >= 70.32.0
>Allow enabling/reading engine busyness only on supported
>GuC versions. Warn once if not supported.

did i915 used a different version of the guc api?

There's no platform supporting GuC >= 70.32.0. We will need to add one
to be able to test.

Lucas De Marchi
