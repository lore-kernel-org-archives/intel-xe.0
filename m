Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F12F606A337
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 07:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mv7Ir+yg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD65310E073;
	Fri, 23 Oct 2026 07:26:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBBB10E073
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 07:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792740372; x=1824276372;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cwZcCVrSbEStQgidU+VTUhMvlP/v/K+F8wmMOKQPHR0=;
 b=mv7Ir+yghb/Pz0vvrAnA+8HHZFydKYvrGE6xhbnZzimoStFLQYuKc30V
 32omK5Lg+AlDhy7e8KcxqH878vlo0J+IBL/VyxEnl2wpjg9mi2eXS0oB9
 /iANWi0dWg1L7MSxouf+7Sz5ey3ExUONUoc6vEb6/RfnSDgiKpSraqSw/
 JpKdhT8R7FiRKcIAJl0WYmH3o/3OhW9NC0r223iPjjRcYzsr8rTDoAN7T
 8O2dKJXHgGcNSyiH2IkxwXgvECnG56CJrSN0W/qxMfxoLJGSTwJ9xeBnd
 +tpE1tu7TADeJLi8Z2m168HtxvDXFoLyWbyc/J39xDNov8AEKBh0Tpmaj w==;
X-CSE-ConnectionGUID: ikGcuemGThyMwuNurqCjSQ==
X-CSE-MsgGUID: 8VslQi5ITrevSCJhBme3Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1508682"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1508682"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 00:26:12 -0700
X-CSE-ConnectionGUID: TNDiX4WaRWyilNOEPyh7yg==
X-CSE-MsgGUID: 1jETEBYfQniMDtiU6Xvkzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3530562"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.106])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 00:26:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v1] drm/xe: Register drm device at the end of probe
In-Reply-To: <20261023030446.337222-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261023030446.337222-1-raag.jadav@intel.com>
Date: Fri, 23 Oct 2026 10:26:05 +0300
Message-ID: <480b4c14a37c56c289606c850e6ab3074c67b72a@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026, Raag Jadav <raag.jadav@intel.com> wrote:
> Call drm_dev_register() to advertice the device to user space and register
> it with other core subsystems. As per documentation, this should be done
> last in the device initialization sequence to make sure userspace can't
> access an inconsistent state. Also reflect this reordering in driver
> remove sequence.

You could read the whole commit message thinking the drm_dev_register()
call is being added in this patch. Which it's obviously not.

BR,
Jani.


>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 8 --------
>  drivers/gpu/drm/xe/xe_pci.c    | 7 +++++++
>  2 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index a07655b4c7a9..6fbcc06c0e45 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1052,10 +1052,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	err = drm_dev_register(&xe->drm, 0);
> -	if (err)
> -		return err;
> -
>  	xe_display_register(xe);
>  
>  	err = xe_oa_register(xe);
> @@ -1099,8 +1095,6 @@ int xe_device_probe(struct xe_device *xe)
>  
>  err_unregister_display:
>  	xe_display_unregister(xe);
> -	drm_dev_unregister(&xe->drm);
> -
>  	return err;
>  }
>  
> @@ -1108,8 +1102,6 @@ void xe_device_remove(struct xe_device *xe)
>  {
>  	xe_display_unregister(xe);
>  
> -	drm_dev_unplug(&xe->drm);
> -
>  	xe_bo_pci_dev_remove_all(xe);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 605c452a9c33..e71e48ad1564 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1119,6 +1119,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  {
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  
> +	drm_dev_unplug(&xe->drm);
> +
>  	if (IS_SRIOV_PF(xe))
>  		xe_pci_sriov_configure(pdev, 0);
>  
> @@ -1297,6 +1299,11 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
>  	if (err)
>  		goto err_driver_cleanup;
>  
> +	/* Must be last */
> +	err = drm_dev_register(&xe->drm, 0);
> +	if (err)
> +		goto err_driver_cleanup;
> +
>  	return 0;
>  
>  err_driver_cleanup:

-- 
Jani Nikula, Intel
