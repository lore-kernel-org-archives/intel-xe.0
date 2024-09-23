Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28642CF9C6E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 12:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC36D10E3E7;
	Mon, 23 Sep 2024 12:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JaDx+P0v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402A610E3E7
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727092962; x=1758628962;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MaY2qKQCEmmwrO4S49ptDbA5w1QZtt1tZBQi/73cKmI=;
 b=JaDx+P0v+3tyUngXjbCqxRWAOL/8UE2F1T+8YNVl4kwaV1CfcCsiWk/1
 4a4BPnYTSvgcagMWq8TRm8Md/O/a7lu2A/ZifxAQoTtbbm0BuX7ymNfdD
 QnxarqAwjcNhTMF5B88puSgC225h7HZEkYBgzI9zerR4OPW/DeQdd2zQ4
 Uy/RdmrkzSpMU/+IXjDArhx6VyWxSIeXUwUJn92BolsZoH7ioXbBNBGtg
 wpwh5tkiCJ2G2bcqnFR7fIokFqqEJIe8T1JKoRMOl4QwKMaZp5Mm9WKQ0
 eFDxyURnPd1AAys4ZjIQ2PdsY4ZyDt1zYWRwVZok4I7bHg6TrylYwr5Yu Q==;
X-CSE-ConnectionGUID: SbkSRtamQgOAs+Rc6OKiAQ==
X-CSE-MsgGUID: 1sMwQvU/QcOH3m5dWjrNQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43508465"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="43508465"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 05:02:42 -0700
X-CSE-ConnectionGUID: 2N9+G5hARei8ymGAkIufEw==
X-CSE-MsgGUID: opzMLgioQ0KzARakJy3Fgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="71875803"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 23 Sep 2024 05:02:41 -0700
Received: from [10.245.84.117] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.117])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7E55527BC1;
 Mon, 23 Sep 2024 13:02:39 +0100 (IST)
Message-ID: <b015dd94-4b39-4f9a-ad1e-8ec7b7cfe346@intel.com>
Date: Mon, 23 Sep 2024 14:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe/vf: Start post-migration fixups with GuC MMIO
 handshake
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20240920222926.846985-1-tomasz.lis@intel.com>
 <20240920222926.846985-4-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240920222926.846985-4-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 21.09.2024 00:29, Tomasz Lis wrote:
> During post-migration recovery, only MMIO communication to GuC is
> allowed. But that communication requires initialization.

shouldn't this be patch 2/4 ie. before actually trying to send anything

> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 40 ++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 459fa936aaba..3cea2d21525f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -22,6 +22,36 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  	INIT_WORK(&xe->sriov.vf.migration_worker, migration_worker_func);
>  }
>  
> +/**
> + * vf_post_migration_reinit_guc - Re-initialize GuC communication.
> + * @xe: the &xe_device struct instance
> + *
> + * After migration, we need to reestablish communication with GuC and
> + * re-query all VF configuration to make sure they match previous
> + * provisioning. Note that most of VF provisioning shall be the same,
> + * except GGTT range, since GGTT is not virtualized per-VF.
> + *
> + * Returns: 0 if the operation completed successfully, or a negative error

correct tag is "Return:" see [1]

[1] https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation

> + * code otherwise.
> + */
> +static int vf_post_migration_reinit_guc(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int err, ret;
> +
> +	err = 0;
> +	xe_pm_runtime_get(xe);

again, maybe PM can be done once in vf_post_migration_recovery()

> +	for_each_gt(gt, xe, id) {
> +		ret = xe_gt_sriov_vf_bootstrap(gt);
> +		if (!err)
> +			err = ret;
> +	}
> +	xe_pm_runtime_put(xe);
> +
> +	return err;

do we care about sending a reset to those GuCs that successfully
completed handshake or we assume that going wedge is sufficient?

> +}
> +
>  /*
>   * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
>   * @xe: the &xe_device struct instance
> @@ -44,10 +74,20 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>  
>  static void vf_post_migration_recovery(struct xe_device *xe)
>  {
> +	int err;
> +
>  	drm_dbg(&xe->drm, "migration recovery in progress\n");
> +	err = vf_post_migration_reinit_guc(xe);
> +	if (unlikely(err))
> +		goto fail;
> +
>  	/* FIXME: add the recovery steps */
>  	vf_post_migration_notify_resfix_done(xe);
>  	drm_notice(&xe->drm, "migration recovery completed\n");
> +	return;
> +fail:
> +	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
> +	xe_device_declare_wedged(xe);
>  }
>  
>  static void migration_worker_func(struct work_struct *w)

