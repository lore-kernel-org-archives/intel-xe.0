Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC6F606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lKq6nle1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4275F10F76B;
	Tue, 24 Nov 2026 15:56:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544A310F76A
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795535778; x=1827071778;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DIOy6Nt/mZoqN3zg9IiL7zshFeKBn0dcSOQzIHWTTac=;
 b=lKq6nle132VfbvidthzN5q8Gz8Mq6Up2VcBNBCXOGaftiIVEp0aM/Gsh
 /WiPS9pyPnoL3q1+SYMCm0rtU25OYzsef+qauvKTybC63ZzMn3a9TgcKx
 VlCwIzEImu0AJjINEUEKIEl0fgCHEecxE/x+VJ7roSeveUOOz0cRdiRoH
 6U6829a3R7K9boRSz/NxN4Q5XdgDdUQhkg8IUZmTTFPpBLZ+Za++GP+j/
 rGgZ9rHnGPHJb5io6PF1fPNokWef7g0kgqYIpLQ0ql7Ak/pCD3Lfv6fWj
 WEIy9T63sYGGrQXYyKjAEqyBKVW3pN6bed580oL8nxd5+bqURRJZXr3lI Q==;
X-CSE-ConnectionGUID: YrGhzlgERkO6tTiERliTAw==
X-CSE-MsgGUID: QNcz41TORhOH0JCdabAwLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4404650"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4404650"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 07:48:13 -0800
X-CSE-ConnectionGUID: hNudhpkhQ6uxW4HNAR+LAw==
X-CSE-MsgGUID: lITZKx8kQfielxAMgM4UCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11797516"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.154])
 ([172.28.182.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 07:45:09 -0800
Message-ID: <22820f2a-896c-42ad-8761-e8a439edd0b3@linux.intel.com>
Date: Tue, 24 Nov 2026 16:45:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe/pf: Extract VFs enabling revert helper
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20261124105009.3431301-1-piotr.piorkowski@intel.com>
 <20261124105009.3431301-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261124105009.3431301-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/24/2026 11:50 AM, Piórkowski, Piotr wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> Both the error path of the pf_enable_vfs() and the pf_disable_vfs()
> are releasing the same set of resources acquired during VFs enabling:
> VF VRAM BAR size, extra runtime PM reference and the VFs enabling
> guard. Extract this common code into a helper.
>
> The PF reprovisioning and VFs unprovisioning are kept outside of the
> helper, as they depend on the provisioning mode, and during the VFs
> disabling we want to restore the PF scheduling settings before the
> potentially slow VFs reset.
>
> Note that in pf_disable_vfs() the VF VRAM BAR will now be resized
> back at the end, but since at this point the VFs are already disabled,
> this should not matter.
>
> v2:
> - keep VFs unprovisioning out of the helper (Marcin)
> - keep PF reprovisioning out of the helper
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci_sriov.c | 23 +++++++++++++----------
>   1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 3bf995736502..d0536322dc05 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -125,6 +125,16 @@ static void pf_finish_vfs_enabling(struct xe_device *xe)
>   	xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, false, NULL);
>   }
>   
> +static void pf_enable_vfs_revert(struct xe_device *xe)
> +{
> +	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> +
> +	/* Release additional PM reference obtained in pf_enable_vfs() */
> +	xe_pm_runtime_put(xe);
> +
> +	pf_finish_vfs_enabling(xe);
> +}
> +
>   static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -151,7 +161,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>   	 * With PF being in D0 state, all VFs will also behave as in D0 state.
>   	 * This will also keep GuC alive with all VFs' configurations.
>   	 *
> -	 * We will release this additional PM reference in pf_disable_vfs().
> +	 * We will release this additional PM reference in pf_enable_vfs_revert().
>   	 */
>   	xe_pm_runtime_get_noresume(xe);
>   
> @@ -177,11 +187,9 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>   	return num_vfs;
>   
>   failed:
> -	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
>   	xe_sriov_pf_reprovision_default(xe);
>   	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
> -	xe_pm_runtime_put(xe);
> -	pf_finish_vfs_enabling(xe);
> +	pf_enable_vfs_revert(xe);
>   out:
>   	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>   			num_vfs, str_plural(num_vfs), ERR_PTR(err));
> @@ -206,18 +214,13 @@ static int pf_disable_vfs(struct xe_device *xe)
>   
>   	pci_disable_sriov(pdev);
>   
> -	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> -
>   	xe_sriov_pf_reprovision_default(xe);
>   
>   	pf_reset_vfs(xe, num_vfs);
>   
>   	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>   
> -	/* not needed anymore - see pf_enable_vfs() */
> -	xe_pm_runtime_put(xe);
> -
> -	pf_finish_vfs_enabling(xe);
> +	pf_enable_vfs_revert(xe);
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>   
>   	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
>   	return 0;
