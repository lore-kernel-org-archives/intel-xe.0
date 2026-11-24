Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACA4606A32D
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VD7RgYY1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D71B10F76A;
	Tue, 24 Nov 2026 15:56:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B8310F76A
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795535784; x=1827071784;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0YjX5pEqW3sI+5s8CQh1NVHL/kSMLPp7ACHW6DqQDjA=;
 b=VD7RgYY155eslve2tBDj7QiA36X9nMK71toqoOlyjnlE0AFe+HXWltqY
 IK4DtowHaCwwn1HgCiLCJiPfVyLyXjaO9cgHwKDPBQnwhQcHXYUKcTz4e
 sk8L0mngN+wSFfX2yc1AGXO8riRMQ3AqtjuQIsi5SHTguevp/wsXDMik3
 y5U852pnv785qgxnllFMJgoabROCszvbEoXX3Wc6jUYnY6RfggzC943zV
 10fexeLTH1yFu+yK7OK11Rv9It03BhDH05+s66dNTz5LGEB73ICrv7yrW
 cnok2AStvdY+4MCsNnqsvkWEx5IRt701RSrMkXeqTnBiRQVKKn+8HHoyp g==;
X-CSE-ConnectionGUID: +tR7ZLo0SzOSVWAh6WcLYw==
X-CSE-MsgGUID: aF+qeD9TQzeKYa2Ge9Gsow==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4404651"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4404651"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 07:48:13 -0800
X-CSE-ConnectionGUID: 7sqaMZASR9yXP99ODzhFgQ==
X-CSE-MsgGUID: 9nHwLYv/TxGryye0qaveug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11797524"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.154])
 ([172.28.182.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 07:45:44 -0800
Message-ID: <a0221841-7b74-44fa-a0d5-70164bb7490a@linux.intel.com>
Date: Tue, 24 Nov 2026 16:45:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/pf: Split VFs enabling into prepare and
 commit steps
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20261124105009.3431301-1-piotr.piorkowski@intel.com>
 <20261124105009.3431301-4-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261124105009.3431301-4-piotr.piorkowski@intel.com>
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
>   drivers/gpu/drm/xe/xe_pci_sriov.c | 69 +++++++++++++++++++++----------
>   1 file changed, 47 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index d0536322dc05..b0cfa6e46d8b 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -129,30 +129,23 @@ static void pf_enable_vfs_revert(struct xe_device *xe)
>   {
>   	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
>   
> -	/* Release additional PM reference obtained in pf_enable_vfs() */
> +	/* Release additional PM reference obtained in pf_enable_vfs_prepare() */
>   	xe_pm_runtime_put(xe);
>   
>   	pf_finish_vfs_enabling(xe);
>   }
>   
> -static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
> +static int pf_enable_vfs_prepare(struct xe_device *xe)
>   {
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
> @@ -165,35 +158,67 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>   	 */
>   	xe_pm_runtime_get_noresume(xe);
>   
> -	err = xe_sriov_pf_provision_vfs(xe, num_vfs);
> -	if (err < 0)
> -		goto failed;
> +	return 0;
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
>   	xe_sriov_pf_reprovision_default(xe);
>   	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>   	pf_enable_vfs_revert(xe);
> -out:
> +failed:
>   	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
> -			num_vfs, str_plural(num_vfs), ERR_PTR(err));
> -	return err;
> +			num_vfs, str_plural(num_vfs), ERR_PTR(ret));
> +	return ret;
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>   }
>   
>   static int pf_disable_vfs(struct xe_device *xe)
