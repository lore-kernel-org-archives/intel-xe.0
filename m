Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CDB606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 10:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OHMYUtpY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC3110E093;
	Tue, 10 Nov 2026 10:49:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5BA10E093
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 10:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794307755; x=1825843755;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=1QNamPVEPAVWpEG+9NGr7QRJwiPb+ia1y8aBjuogIgo=;
 b=OHMYUtpYiMS+lh+OIps11azMeQdMSoQRJw5zpu4uPPAGgMc+y8K+fhU0
 G8t6+5xpIzpJgrGKZbSuel52BP0bKRgG1nzCRp1Kea+Mr5ZXssAh0us3u
 hBVAu8uAKvTHbx7bYb4dqIeWBfmEVtmkFPcs6S4qhPYbAO+VN1x3bpmnV
 /v3kh0pFwrUgMjQBd+WKvF27Aysd5uX1BenpOZrzwCHVGEHRJBWDy2eUu
 pQxboOLZLCu5NM2H0x3pk+H9P/A8RUnIfVhVD2UQl8xa37JiP28MN3GlX
 ZIuZhsmEAODQWDUhtHF8ymYGxLyLPum5nY5jFV1Eu2vWeGo3CzqwxkNF1 Q==;
X-CSE-ConnectionGUID: 1eTQAp9QRdqvg6XKzzLSFg==
X-CSE-MsgGUID: iWyHjvCnRc2kizOCpqipdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3075217"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3075217"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:49:15 -0800
X-CSE-ConnectionGUID: z52IGquFSgusmZr8EG1cMg==
X-CSE-MsgGUID: y9bOwBP8TfmrubzsSQAtQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="9987417"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.154])
 ([172.28.182.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:49:14 -0800
Message-ID: <3dc3e65a-1d1c-429c-8e95-566e47f13b5e@linux.intel.com>
Date: Tue, 10 Nov 2026 11:49:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] drm/xe/pf: Split the provisioning mode change
 function
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
 <20261027103009.1259199-6-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261027103009.1259199-6-piotr.piorkowski@intel.com>
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

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

On 10/27/2026 11:30 AM, Piórkowski, Piotr wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> During VGPU profile provisioning we will need to change the
> provisioning mode while already holding the master mutex.
>
> Move the mode change logic into a static helper that expects the
> caller to hold the master mutex. The caller identity, used only in
> the debug message, is now passed explicitly, as the helper will be
> called from different places.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 41 +++++++++++++---------
>   1 file changed, 24 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index 6ea2a24fef6e..7357b9369522 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -154,6 +154,29 @@ int xe_sriov_pf_reprovision_default(struct xe_device *xe)
>   	return pf_reprovision_default(xe);
>   }
>   
> +static int pf_change_mode(struct xe_device *xe, enum xe_sriov_provisioning_mode mode, void *who)
> +{
> +	lockdep_assert_held(xe_sriov_pf_master_mutex(xe));
> +
> +	if (mode == xe->sriov.pf.provision.mode)
> +		return 0;
> +
> +	if (mode == XE_SRIOV_PROVISIONING_MODE_AUTO) {
> +		if (xe_sriov_pf_num_vfs(xe)) {
> +			xe_sriov_dbg(xe, "can't restore %s: VFs must be disabled!\n",
> +				     mode_to_string(mode));
> +			return -EBUSY;
> +		}
> +		pf_unprovision_all_vfs(xe);
> +	}
> +
> +	xe_sriov_dbg(xe, "mode %s changed to %s by %ps\n",
> +		     mode_to_string(xe->sriov.pf.provision.mode),
> +		     mode_to_string(mode), who);
> +	xe->sriov.pf.provision.mode = mode;
> +	return 0;
> +}
> +
>   /**
>    * xe_sriov_pf_provision_set_mode() - Change VFs provision mode.
>    * @xe: the PF &xe_device
> @@ -176,23 +199,7 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
>   
>   	guard(mutex)(xe_sriov_pf_master_mutex(xe));
>   
> -	if (mode == xe->sriov.pf.provision.mode)
> -		return 0;
> -
> -	if (mode == XE_SRIOV_PROVISIONING_MODE_AUTO) {
> -		if (xe_sriov_pf_num_vfs(xe)) {
> -			xe_sriov_dbg(xe, "can't restore %s: VFs must be disabled!\n",
> -				     mode_to_string(mode));
> -			return -EBUSY;
> -		}
> -		pf_unprovision_all_vfs(xe);
> -	}
> -
> -	xe_sriov_dbg(xe, "mode %s changed to %s by %ps\n",
> -		     mode_to_string(xe->sriov.pf.provision.mode),
> -		     mode_to_string(mode), __builtin_return_address(0));
> -	xe->sriov.pf.provision.mode = mode;
> -	return 0;
> +	return pf_change_mode(xe, mode, __builtin_return_address(0));
>   }
>   
>   /**
