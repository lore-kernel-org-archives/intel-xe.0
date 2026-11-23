Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557A7606A6A3
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 10:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CrB0AtrQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E9F10EC53;
	Mon, 23 Nov 2026 10:48:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38A310EC60
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795430905; x=1826966905;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bjYcaQgNPclNFyzHXjZEkOx2ENAfm4uUfsaAovzl4Bo=;
 b=CrB0AtrQ1czTfHrYKsxFRTxp1NdjNeq03ZAKTPPxAC6oV4RFIs4qqPBA
 AfqouKtoeBplBCUYnCEfI7n9Dv6HPianT3roawwP+k1YXl39oPov5ya9X
 +Iebcl1rjI5opfCtSWGji/Z36UKShrrgsXBcYy8NIZCdANmdkAoTAEFor
 HSq87ClynLnlaNPeyKpzVq1RJLwx3+SosxyGRB/xPoP1eI5sAz4krnhRJ
 LHahK/2XOgJ8Pzdi5FIBo9dYY4JJFnGBwct5X6BrEn+CS/QiJ0DbWYqGA
 Qp6LJANWsChja3LPHgXEeGUq9vLsCVzmQqNLZmb8OIfNXmdwzHL+urs6P g==;
X-CSE-ConnectionGUID: QCXiV4KMQuGidAY87dztfA==
X-CSE-MsgGUID: bmxwUNxbRumeK61fSJs6HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4118373"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4118373"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:48:25 -0800
X-CSE-ConnectionGUID: 5eEQRQSyTMqqIdqo7b0/8w==
X-CSE-MsgGUID: 4PqsseK0R+C9U+AEiKKQUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="13070761"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.154])
 ([172.28.182.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:48:24 -0800
Message-ID: <95f6d4ec-aaac-4f5c-87d0-4f609e495ae9@linux.intel.com>
Date: Mon, 23 Nov 2026 11:48:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/xe/pf: Extract VFs enabling revert helper
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20261123094607.3300722-1-piotr.piorkowski@intel.com>
 <20261123094607.3300722-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261123094607.3300722-2-piotr.piorkowski@intel.com>
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


On 11/23/2026 10:46 AM, Piórkowski, Piotr wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> Both the error path of the pf_enable_vfs() and the pf_disable_vfs()
> are releasing the same set of resources acquired during VFs enabling:
> VF VRAM BAR size, VFs provisioning, extra runtime PM reference and
> the VFs enabling guard. Extract this common code into a helper.
>
> Note that in pf_disable_vfs() the VF VRAM BAR will now be resized
> back after the PF reprovisioning and VFs reset, but since at this
> point the VFs are already disabled, this should not matter.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci_sriov.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 31abcee55211..6c839eff0db8 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -125,6 +125,18 @@ static void pf_finish_vfs_enabling(struct xe_device *xe)
>   	xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, false, NULL);
>   }
>   
> +static void pf_enable_vfs_revert(struct xe_device *xe, int num_vfs)
> +{
> +	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> +
> +	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
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
> @@ -151,7 +163,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>   	 * With PF being in D0 state, all VFs will also behave as in D0 state.
>   	 * This will also keep GuC alive with all VFs' configurations.
>   	 *
> -	 * We will release this additional PM reference in pf_disable_vfs().
> +	 * We will release this additional PM reference in pf_enable_vfs_revert().
>   	 */
>   	xe_pm_runtime_get_noresume(xe);
>   
> @@ -177,10 +189,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>   	return num_vfs;
>   
>   failed:
> -	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> -	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
> -	xe_pm_runtime_put(xe);
> -	pf_finish_vfs_enabling(xe);
> +	pf_enable_vfs_revert(xe, num_vfs);
>   out:
>   	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>   			num_vfs, str_plural(num_vfs), ERR_PTR(err));
> @@ -205,18 +214,11 @@ static int pf_disable_vfs(struct xe_device *xe)
>   
>   	pci_disable_sriov(pdev);
>   
> -	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> -
>   	xe_sriov_pf_reprovision_default(xe);
>   
>   	pf_reset_vfs(xe, num_vfs);
I assume xe_sriov_pf_reprovision_default() is intentionally kept out of
pf_enable_vfs_revert() so the PF is restored before the potentially slow
pf_reset_vfs() (as per 24ac010a97b6)? If so, the error path would need
it explicitly too (see link in the cover letter reply).
--
marcin
>   
> -	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
> -
> -	/* not needed anymore - see pf_enable_vfs() */
> -	xe_pm_runtime_put(xe);
> -
> -	pf_finish_vfs_enabling(xe);
> +	pf_enable_vfs_revert(xe, num_vfs);
>   
>   	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
>   	return 0;
