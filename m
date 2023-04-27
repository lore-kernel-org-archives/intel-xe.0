Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04EEC77B61
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 12:55:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C5310EB33;
	Thu, 27 Apr 2023 12:55:46 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBCC10EB33
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 12:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682600145; x=1714136145;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=amP30AbmUjlRfr34/LbGvfp0TlNWLUNz1o29GtSCShg=;
 b=lVfQHe4hfwRDTRc/o/EI53dImc9QMGf/sSK8yuBM4IPKJLpfRysfhsTR
 NGIkaD9XUGqbix87bQyr0m/p8q8AKx8b26/PSCpbc/hoC4Qyy3RydNPgv
 1syTXijhlQEov7tnAHdJg0Tu9qPc8EJ2UhEohVJRM2WjCjGM9DZC7Xy6q
 eZmmKDF6BW6oRRbRJpHBLRTh/mWbgXxhK/b6EzUyt7AIdUFWH9GEulT4n
 Rm76ekng/8n51JSt6y6Qss+mTBuwiTW2kn6IAXGKi/hVRBvrA6cxInKWQ
 5BQpWwkml6w3xleyqJJ62a4iQBZge1g218u/lBtBknzu4bwPav0MaP7r0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="327037266"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="327037266"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 05:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="818518355"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="818518355"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 05:55:43 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230427114648.35124-1-maarten.lankhorst@linux.intel.com>
References: <20230427114648.35124-1-maarten.lankhorst@linux.intel.com>
Date: Thu, 27 Apr 2023 15:53:25 +0300
Message-ID: <87a5ytpjui.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove extra xe_mmio_read32 from
 xe_mmio_wait32
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Maarten Lankhorst <maarten.lankhorst@linux.intel.com> writes:

> Commit 5a2be6ba6ba0 ("drm/xe: Let's return last value read on
> xe_mmio_wait32.") mentions that we should return the last value read,
> but we never actually return it. This breaks display which depends on
> the value being actually returned where needed.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Fixes: 5a2be6ba6ba0 ("drm/xe: Let's return last value read on xe_mmio_wait32.")

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index a36c52bc098b..1a32e0f52261 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -85,9 +85,6 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, u32 reg, u32 val, u32 mask,
>  	u32 read;
>  
>  	for (;;) {
> -		if ((xe_mmio_read32(gt, reg) & mask) == val)
> -			return 0;
> -
>  		read = xe_mmio_read32(gt, reg);
>  		if ((read & mask) == val) {
>  			ret = 0;
> -- 
> 2.37.2
