Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0107DE83824
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 18:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA44410E0D7;
	Mon, 16 Feb 2026 18:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fhcevrDc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0580410E0D7
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 18:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771267930; x=1802803930;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GFzxIixOeUqrCefOaxTU8ZYM/Wt7OmXVFGg2/RtEjKs=;
 b=fhcevrDcBSm9qR9WMKwd39hFSMkldJQmeoagz5FllPOyjKujEmrtLhIH
 r4bJs6HZUJPV420MpWMlx7kWWvKbAvoZ7Cse7oFkeowbk0qhctlEd2CC3
 Xp/pc86Jfpo9WYzBUqdyJXJKwhUUh2vEFxd68eUNIvwO9OnOkgsHTnTQ7
 6rMDmQQkH6ajpVZqKhPCRB9rJvCvoiclIzXkogo+v5Wa5CF10z2gHEu/G
 O9L2bOn+nVCJEIBoRB97SeR7idDEqRDUS+5ROW0OxAlv6QvpiPORt4pHF
 Fpk+jFhWouQ4vBpg9u0V08d1E+V4YhUw7KfqhBRAng1UUVPFwLPhohnk5 w==;
X-CSE-ConnectionGUID: hpZCW1amReuNpOMPxmMqmg==
X-CSE-MsgGUID: NlxJ61fQRramqRUEzEpPAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="75970618"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="75970618"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 10:52:09 -0800
X-CSE-ConnectionGUID: 4kIFMizcSp+krB3M8rEVEA==
X-CSE-MsgGUID: QZfmjyLzT+m7BmSMxTheJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="213517080"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 10:52:07 -0800
Date: Mon, 16 Feb 2026 19:52:04 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/pf: Don't configure VFs if already wedged
Message-ID: <aZNnVJyb7wJcH9nM@black.igk.intel.com>
References: <20260216172659.520-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216172659.520-1-michal.wajdeczko@intel.com>
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

On Mon, Feb 16, 2026 at 06:26:59PM +0100, Michal Wajdeczko wrote:
> If driver has already declared device being in the wedged state,
> there is no point in attempting to enable or disable VFs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci_sriov.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 3fd22034f03e..ddc081f55657 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -232,6 +232,9 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
>  	if (num_vfs && pci_num_vf(pdev))
>  		return -EBUSY;
>  
> +	if (xe_device_wedged(xe))
> +		return -EHOSTDOWN;

I thought -EHOSTDOWN was used in client/server world. Rather make it
consistent with ioctl returns? i.e. -ECANCELED.

Raag

>  	guard(xe_pm_runtime)(xe);
>  	if (num_vfs > 0)
>  		return pf_enable_vfs(xe, num_vfs);
> -- 
> 2.47.1
> 
