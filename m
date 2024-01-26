Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A270C47DDF
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 16:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F94710FBD0;
	Fri, 26 Jan 2024 16:32:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C563110FAA9;
 Fri, 26 Jan 2024 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706286720; x=1737822720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PpN1PLXHIsKfzva3hPfmTbQUMCKHSJQfoqVZUPSAPx0=;
 b=lMx1wPQRC9VkWaKFP6RwdcJkI/28gArXVufgrh7S3wGOE/lGruvI3IdC
 aWa77tyRe0CPaiqeuU+2Nlbpk2cHgHrdsON3QVjQsp5LP3mavjiS+n+9l
 ORavHGiTXakJrv+gfz11D4FJeKndi9JQ48p6kYA2vBPSDDv7tcl9FQmu+
 UkJYmL8cDCyLRBypgv6wwEdTktp6B43HHvPAYVkmnhED9UqzRLUZgvzlx
 zuJBVg47YURiPgfPlL+QcSFe3pTRdkkddTBlflbENz8KueS+N7IlDmi4T
 z8ATzkNXmfb4bHyWPyT3MoXCGl/8l/EKqKUb5gQp+3arznafbO6bIkr4j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2382015"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2382015"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 08:31:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="906357703"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="906357703"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.21.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 08:31:56 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 0/3] lib/kunit: Support writable filter* parameters
 of kunit module
Date: Fri, 26 Jan 2024 17:31:53 +0100
Message-ID: <2221731.72vocr9iq0@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <kiflqa7ksoazk52b7ffmzktapvtx3yayqqmqm6gulylvdu7mx3@dzp5fpbsblty>
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
 <o5um4wakpooxbxd5algtfpgqmwar5lb2dkahdrc5zkma3nvlul@j6jyzvai4aht>
 <kiflqa7ksoazk52b7ffmzktapvtx3yayqqmqm6gulylvdu7mx3@dzp5fpbsblty>
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
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Friday, 26 January 2024 15:46:54 CET Lucas De Marchi wrote:
> On Thu, Jan 25, 2024 at 11:25:55AM -0600, Lucas De Marchi wrote:
> >On Thu, Jan 25, 2024 at 05:52:09PM +0100, Janusz Krzysztofik wrote:
> >>Instead of wasting resources on reloading the base Kunit module each time
> >>a different set of filter parameters is needed, try to write the required
> >>values to sysfs representation of those parameters.  If that fails (e.g.
> >>on older LTS kernels with read-only filter parameters), fall back to
> >
> >we can't really execute anything on LTS kernel. I don't think think it's
> >worth keeping the multiple fallbacks we have now.
> >q
> >I think trying to maintain compat is good, but I'm not sure it makes
> >sense for these tightly coupled tests with the kernel.
> 
> I gave it a try and it doesn't really work for me. It seems that after
> you list the tests, the filter_action remains on skip, so the tests just
> skips.
> 
> $ sudo ./build/tests/xe_live_ktest --r dmabuf
> ...
> Subtest dmabuf: SKIP (0.078s)
> $ sudo grep . /sys/module/kunit/parameters/*
> /sys/module/kunit/parameters/action:(null)
> /sys/module/kunit/parameters/filter:module=none
> /sys/module/kunit/parameters/filter_action:skip
> /sys/module/kunit/parameters/filter_glob:*
> /sys/module/kunit/parameters/stats_enabled:1
> 
> This works for me (with my additional patch to rename the module):
> 
> # # list tests
> # modprobe xe_live_test
> # echo -n 'skip' > /sys/module/kunit/parameters/filter_action
> # echo -n '*' > /sys/module/kunit/parameters/filter_glob
> # modprobe xe_live_test
> 
> # # run just xe_dma_buf
> # modprobe -r xe_live_test
> # echo -ne '0x00' > /sys/module/kunit/parameters/filter_action
> # echo -n 'xe_dma_buf' > /sys/module/kunit/parameters/filter_glob
> # modprobe xe_live_test
> 
> I  think the main issue is that kunit have some different code paths for
> not param == NULL and also that writting an empty string is not really
> working as it doesn't issue a write() syscall. If you force a \0 and use
> len + 1, then I think it might work, but I didn't test it completely.
> I may have to enhance the patch on the kernel side to handle that more
> effectively.

OK, if you are going to enhance the kernel side then I'll hold on for now and 
get back to it when we can call the ABI stable.

Thanks,
Janusz

> 
> Lucas De Marchi
> 




