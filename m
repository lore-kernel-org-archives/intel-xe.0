Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D85E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 15:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402A310E229;
	Tue, 10 Dec 2024 15:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PREZ4VzO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC85210E229
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733844322; x=1765380322;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8vm7iIfOSmmE5PigvrHG3Z4+FfDHWSt3AHF5GpwIy2U=;
 b=PREZ4VzOgBcqRvmQnuF2yziJ2MP/EjpVhXdagj0t319nZY5r1b8lFixM
 fh7fwA6MLuOD+h4Kq4kl4b0d7uc4EJG5M177iJiZ7zqme2Sxu+C7YwPZZ
 m43oGzohDfEtEqOZqPP+ZDH7xnuO3PSneYBXx4YjimKWsi3sfw1dj5uBA
 5ba6VDqi6Afu7jEMTKHAS3ENiYbIpUVNDVYTfrpfeUSmj2umVc0x8oQr/
 tXWtXr3qCa3zafWrD7v67oJ6ecrsR6i5Rm9CtQVqLNhmKbNVYwypJa5Ga
 hAAfRQ0HPzrUyK6jgfn2UHCGLHqZ3M8UQ1I8jbNims3ngzihA9K6mR4bt A==;
X-CSE-ConnectionGUID: DGzFu+nwSFChYSvGXOz8OQ==
X-CSE-MsgGUID: fHdwgLY3SEG5at/YshzcJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37877969"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="37877969"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:25:21 -0800
X-CSE-ConnectionGUID: r7dbT3mrRSmEMaBDz0JnLQ==
X-CSE-MsgGUID: OKMMVnYqTRevkrR1X1J50w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95776591"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.171])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:25:20 -0800
Date: Tue, 10 Dec 2024 07:25:15 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 10/11] drm/xe: Split init of xe_gt_init_hwconfig to
 xe_gt_init and *_early
Message-ID: <cfyy7aff2eavdf4wisztvev6vkuuajngxe53ekh2pkcoa36gtf@3xzilixxu5qm>
References: <20241210083111.230484-1-dev@lankhorst.se>
 <20241210083111.230484-11-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241210083111.230484-11-dev@lankhorst.se>
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

On Tue, Dec 10, 2024 at 09:31:10AM +0100, Maarten Lankhorst wrote:
> static void dump_pat_on_error(struct xe_gt *gt)
>@@ -419,6 +438,18 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 		goto err_hw_fence_irq;
> 	}
>
>+	err = xe_uc_init(&gt->uc);

what does this have to do with gt_fw_domain_init()?  We should look at
removing unrelated stuff from this function rather than stashing more.

Lucas De Marchi
