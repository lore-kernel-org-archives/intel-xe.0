Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557F1C021B7
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 13:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC7010EA6B;
	Fri, 21 Feb 2025 13:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LW7+SDaP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D461110EA6B
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 13:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740146338; x=1771682338;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sDUnGuwbMvE1U7uT5BfY7/c4qJQjsLjRxkRXzHDJuD4=;
 b=LW7+SDaPeCTM6zHA+Q25BgrWoNk5xRnG6sSBVkARFqjZHSlb7Y31TWgY
 A8i1lWhvNFNBgjf5UGu+yurT7v0vR+z3gWsXPi9Y2AjMi/EEoL6AZ/tkj
 +r/brL0Pr2pmIxM+EfrGKQoPA6OHceAtQou11NAC2mZGAbNONH+gB4+00
 XUht91s/j1/Se6iaexrD8jGsK8+96XtsM9Qqmf0PuMDElvmDi/kAOLhTn
 wRduPiFVM1lkWokasIsU1O3zCuxVmebpvLInrT3SxXJWp3td8mK7VJObm
 jt6OOHnO2W7cMTZC0ciN5eeIR5mtMwFMETnVYn6htYjkrgw7e1f3Yimkd Q==;
X-CSE-ConnectionGUID: I78mO/NVRTODbjpm5rISfA==
X-CSE-MsgGUID: mgR7A/F4TwekCwQG23+wLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51590473"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="51590473"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 05:58:58 -0800
X-CSE-ConnectionGUID: 3QNerU2GT42Hdw3lGppPYA==
X-CSE-MsgGUID: b90dktQvQnmjwal+RyMpew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="115334291"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 21 Feb 2025 05:58:56 -0800
Received: from [10.245.96.217] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.217])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 70C5633EB6;
 Fri, 21 Feb 2025 13:58:54 +0000 (GMT)
Message-ID: <2c07c68a-be51-4662-87c6-87e26ad0f2d4@intel.com>
Date: Fri, 21 Feb 2025 14:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/pf: Create a link between PF and VF devices
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250221110712.29994-1-satyanarayana.k.v.p@intel.com>
 <20250221110712.29994-2-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250221110712.29994-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 21.02.2025 12:07, Satyanarayana K V P wrote:
> When both PF and VF devices are enabled on the host, they
> resume simultaneously during system resume.
> 
> However, the PF must finish provisioning the VF before any
> VFs can successfully resume.
> 
> Establish a parent-child device link between the PF and VF
> devices to ensure the correct order of resumption.
> 
> V2 -> V3:
> - Added function documentation for xe_pci_pf_get_vf_dev().
> - Added assertion if not called from PF.
> V1 -> V2:
> - Added a helper function to get VF pci_dev.
> - Updated xe_sriov_notice() to xe_sriov_warn() if vf pci_dev
>   is not found.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Reviewed-by: Piotr Piorkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci_sriov.c | 60 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci_sriov.h |  6 ++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index aaceee748287..b9ac3b4e0497 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -62,6 +62,64 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
>  			xe_gt_sriov_pf_control_trigger_flr(gt, n);
>  }
>  
> +/**
> + * xe_pci_pf_get_vf_dev - Get VF pci_dev.
> + * @pdev: the &pci_dev
> + * @vf_id: the VF identifier
> + *
> + * This function can only be called on PF.
> + *
> + * This function can be called to get VF (Virtual Function) pci_dev
> + * using PF (Physical Function) pci_dev for a given VF id.
> + *
> + * Return: pci_dev structure of VF on success or NULL on error.
> + */
> +struct pci_dev *xe_pci_pf_get_vf_dev(struct pci_dev *pdev, unsigned int vf_id)

it doesn't look that function is used elsewhere, shouldn't it be static?

and as static function it could take "xe" as param

struct pci_dev *pf_lookup_vf_pdev(struct xe_device *xe,
				  unsigned int vf_id)

> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	/* caller must use pci_dev_put() */
> +	return pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
> +			pdev->bus->number,
> +			pci_iov_virtfn_devfn(pdev, vf_id));
> +}
> +
> +static void pf_link_vfs(struct xe_device *xe, int num_vfs)
> +{
> +	struct pci_dev *pdev_pf = to_pci_dev(xe->drm.dev);
> +	struct device_link *link;
> +	struct pci_dev *pdev_vf;
> +	unsigned int n;
> +
> +	for (n = 1; n <= num_vfs; n++) {
> +		pdev_vf = xe_pci_pf_get_vf_dev(pdev_pf, n - 1);
> +
> +		if (!pdev_vf) {
> +			xe_sriov_warn(xe, "Can't link PF and VF%d due to missing pci dev..\n", n);

xe_sriov_warn() will add a "PF: " prefix to the output so likely "PF"
inside the message is redundant

n is unsigned so the VF format should be VF%u

what does "missing pci dev" really mean to the user?
and this looks like a serious problem that would affect all VFs so maybe
we should just abort and say:
	"Can't find VF%u device, aborting link%s creation!"
	n, str_plural(num_vfs)

two dots at the end (likely none is needed)

> +			continue;
> +		}
> +
> +		/*
> +		 * When both PF and VF devices are enabled on the host, during system
> +		 * resume they are resuming in parallel.
> +		 *
> +		 * But PF has to complete the provision of VF first to allow any VFs to
> +		 * successfully resume.
> +		 *
> +		 * Create a parent-child device link between PF and VF devices that will
> +		 * enforce correct resume order.
> +		 */

I would move that comment just before the "for" loop

> +		link = device_link_add(&pdev_vf->dev, &pdev_pf->dev,
> +				       DL_FLAG_AUTOREMOVE_CONSUMER);
> +		if (!link)
> +			xe_sriov_notice(xe, "Failed linking PF and VF%u\n", n);
> +
> +		pci_dev_put(pdev_vf);
> +	}
> +}
> +
>  static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -92,6 +150,8 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	if (err < 0)
>  		goto failed;
>  
> +	pf_link_vfs(xe, num_vfs);
> +
>  	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
>  		      num_vfs, total_vfs, str_plural(total_vfs));
>  	return num_vfs;
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
> index c76dd0d90495..f66b68a25b20 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
> @@ -10,11 +10,17 @@ struct pci_dev;
>  
>  #ifdef CONFIG_PCI_IOV
>  int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
> +struct pci_dev *xe_pci_pf_get_vf_dev(struct pci_dev *pdev, unsigned int vf_id);
>  #else
>  static inline int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
>  {
>  	return 0;
>  }
> +
> +static inline struct pci_dev *xe_pci_pf_get_vf_dev(struct pci_dev *pdev, unsigned int vf_id)
> +{
> +	return NULL;
> +}
>  #endif

both chunks likely unneeded

>  
>  #endif

