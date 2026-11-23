Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11487606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 10:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=emVZ5SfD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C562410E059;
	Mon, 23 Nov 2026 10:54:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02CF10E059
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 10:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795431247; x=1826967247;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lFNgMUQBhs3L06DtZSSa8WWiw6t8DbpgEmYBzUVt7mU=;
 b=emVZ5SfDw1WAcwWLYCBOgxwdEC3kEC+kJvTFWMK8cJP95bXzMniK7Ly6
 mDNrBKXUVeYDJqr4Cpha/dauRqZGtMr0ccOOtw8Kai/hI+4sIE7IDDUiE
 jnO+eQsgCeFkYLj2ELXRwlSVlUyLYHX+U7qB7g16838GcIZeFuXURlFWb
 NQ9Eet3oo7mp3PL2B5k6POQ8pAyLRo5Q4/eiAisU9MbudVKY3pKX+vGVX
 xxmTgk35YuLWaDfXsTyHu08VCRHD/pr1RCJ7GclLH3w3j0rLUBIm5gclp
 AcIeH9C5NMpi/DeeZ4i31DkHSxnS6NaqncLKhafSbqo7UZb9JxTLUR6KT g==;
X-CSE-ConnectionGUID: vsauyseDRvqkNBCQiF7gGA==
X-CSE-MsgGUID: xELC2u0yRU2kab8hApfaTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4143133"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4143133"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:54:06 -0800
X-CSE-ConnectionGUID: JZZO5u5LSTyWiMXJYkDc5A==
X-CSE-MsgGUID: zp0c/4mRTQagMTUQu8jPMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11289202"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.154])
 ([172.28.182.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:54:05 -0800
Message-ID: <5eff17e5-b524-4e8d-b1af-f5f441a3091e@linux.intel.com>
Date: Mon, 23 Nov 2026 11:54:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/xe/pf: Split VFs enabling into prepare and
 commit steps
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20261123094607.3300722-1-piotr.piorkowski@intel.com>
 <20261123094607.3300722-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261123094607.3300722-3-piotr.piorkowski@intel.com>
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
> Split the pf_enable_vfs() into separate steps: prepare, which waits
> for the PF readiness and takes the extra runtime PM reference, and
> commit, which resizes VF VRAM BAR and actually enables the VFs.
> The VFs provisioning is now done between those two steps.
>
> This is a preparation for the upcoming VGPU profiles support, where
> we will want to use a different provisioning step while keeping the
> same prepare and commit steps.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci_sriov.c | 91 ++++++++++++++++++++-----------
>   1 file changed, 58 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 6c839eff0db8..e91e75d64174 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -125,36 +125,17 @@ static void pf_finish_vfs_enabling(struct xe_device *xe)
>   	xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, false, NULL);
>   }
>   
> -static void pf_enable_vfs_revert(struct xe_device *xe, int num_vfs)
> +static int pf_enable_vfs_prepare(struct xe_device *xe)
>   {
> -	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> -
> -	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
> -
> -	/* Release additional PM reference obtained in pf_enable_vfs() */
> -	xe_pm_runtime_put(xe);
> -
> -	pf_finish_vfs_enabling(xe);
> -}
> -
> -static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
> -{
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	int total_vfs = xe_sriov_pf_get_totalvfs(xe);
>   	int err;
>   
> -	xe_assert(xe, IS_SRIOV_PF(xe));
> -	xe_assert(xe, num_vfs > 0);
> -	xe_assert(xe, num_vfs <= total_vfs);
> -	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
> -
>   	err = xe_sriov_pf_wait_ready(xe);
>   	if (err)
> -		goto out;
> +		return err;
>   
>   	err = pf_prepare_vfs_enabling(xe);
>   	if (err)
> -		goto out;
> +		return err;
>   
>   	/*
>   	 * We must hold additional reference to the runtime PM to keep PF in D0
> @@ -167,33 +148,77 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>   	 */
>   	xe_pm_runtime_get_noresume(xe);
>   
> -	err = xe_sriov_pf_provision_vfs(xe, num_vfs);
> -	if (err < 0)
> -		goto failed;
> +	return 0;
> +}
> +
> +static void pf_enable_vfs_revert(struct xe_device *xe, int num_vfs)
> +{
> +	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> +
> +	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
> +
> +	/* Release additional PM reference obtained in pf_enable_vfs_prepare() */
> +	xe_pm_runtime_put(xe);
> +
> +	pf_finish_vfs_enabling(xe);
> +}
> +
> +static int pf_enable_vfs_commit(struct xe_device *xe, int num_vfs)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int err;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, num_vfs > 0);
> +	xe_assert(xe, num_vfs <= xe_sriov_pf_get_totalvfs(xe));
>   
>   	pf_resize_vf_vram_bar(xe, num_vfs);
>   
>   	err = pci_enable_sriov(pdev, num_vfs);
>   	if (err < 0)
> -		goto failed;
> +		return err;
>   
>   	pf_link_vfs(xe, num_vfs);
>   
> -	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
> -		      num_vfs, total_vfs, str_plural(total_vfs));
> -
>   	xe_sriov_pf_sysfs_link_vfs(xe, num_vfs);
>   
>   	pf_engine_activity_stats(xe, num_vfs, true);
>   
>   	return num_vfs;
> +}
>   
> -failed:
> +static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
> +{
> +	int total_vfs = xe_sriov_pf_get_totalvfs(xe);
> +	int ret;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, num_vfs > 0);
> +	xe_assert(xe, num_vfs <= total_vfs);
> +	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
> +
> +	ret = pf_enable_vfs_prepare(xe);
> +	if (ret < 0)
> +		goto failed;
> +
> +	ret = xe_sriov_pf_provision_vfs(xe, num_vfs);
> +	if (ret < 0)
> +		goto revert;
> +
> +	ret = pf_enable_vfs_commit(xe, num_vfs);
> +	if (ret < 0)
> +		goto revert;
> +
> +	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
> +		      num_vfs, total_vfs, str_plural(total_vfs));
> +	return num_vfs;
> +
> +revert:
>   	pf_enable_vfs_revert(xe, num_vfs);
Now that provisioning is a separate step between prepare and commit,
should xe_sriov_pf_unprovision_vfs() stay in pf_enable_vfs_revert(), or
rather be called here next to xe_sriov_pf_reprovision_default(), so the
VGPU profiles code could use its own unprovisioning step?
--
marcin
> -out:
> +failed:
>   	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
> -			num_vfs, str_plural(num_vfs), ERR_PTR(err));
> -	return err;
> +			num_vfs, str_plural(num_vfs), ERR_PTR(ret));
> +	return ret;
>   }
>   
>   static int pf_disable_vfs(struct xe_device *xe)
