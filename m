Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C619F606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nsNQRWNY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B94010E093;
	Tue, 10 Nov 2026 10:45:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF52310EFAC
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794307502; x=1825843502;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=NwfED7qdgWy5v7Q8aelilEwkEWRZdrFIGWr1kC0pxLo=;
 b=nsNQRWNY+lSEW7E4YuSSSGLr7xPDydn7e03rs2uKAzaCdF235ngRCpJf
 HWWq389NMqUG7tfPwlQdAIkovGqBBZR/JB67CWQ3EB+OE53LwhhXOzk/+
 aBCK+vXHgVS41HhXX7bhpCKD0Nu+P5y/6s5sVkWjgfteZ6cVcQ0MiT72X
 CFR+oyLhfZRTfKCtj3xrwf66qL982uht6tiDRmmZaFPZ4yDbG0W94iqOl
 YtbbOhHgAF9c5n+/AL9ONGaxwX/xc4AOBZRsRBvFUbnXTtY3mmRu+suNu
 uC0CCTcZjvhrtxYnDoZnMC3a9LgjXmOMUIYAwNmgVZvgq4M0mxGiOp1+k g==;
X-CSE-ConnectionGUID: d6wsHeu9QDaOvvjXReFOrw==
X-CSE-MsgGUID: 9ZKHDzefTaKua4HXztxk1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3082884"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3082884"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:45:01 -0800
X-CSE-ConnectionGUID: dsjE+dfIRwydNOlMEeqkYg==
X-CSE-MsgGUID: NlUdbBU3RDqiQCB8Hp/fFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7992096"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.154])
 ([172.28.182.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:45:00 -0800
Message-ID: <7e9b4208-ec8f-45fa-8ed7-bafc8b447e89@linux.intel.com>
Date: Tue, 10 Nov 2026 11:44:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] drm/xe/pf: Split the bulk priority provisioning
 function
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
 <20261027103009.1259199-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261027103009.1259199-2-piotr.piorkowski@intel.com>
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
> During VGPU profile provisioning we will want to reuse the current
> code that converts the scheduling priority into the schedule-if-idle
> policy, while already holding the master mutex.
>
> Move that code into a static helper that expects the caller to hold
> the master mutex, and let the public function take that mutex. As a
> side effect, the schedule-if-idle policy is now updated on all GTs
> under a single lock, instead of taking the lock separately for each
> GT.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 35 ++++++++++++++--------
>   1 file changed, 22 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index c37e422b5a5c..91670063f706 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -376,18 +376,7 @@ int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u
>   	return !count ? -ENODATA : 0;
>   }
>   
> -/**
> - * xe_sriov_pf_provision_bulk_apply_priority() - Change scheduling priority of all VFs and PF.
> - * @xe: the PF &xe_device
> - * @prio: scheduling priority to set
> - *
> - * Change the scheduling priority provisioning on all tiles/GTs.
> - *
> - * This function can only be called on PF.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio)
> +static int pf_bulk_apply_priority(struct xe_device *xe, u32 prio)
>   {
>   	bool sched_if_idle;
>   	struct xe_gt *gt;
> @@ -395,6 +384,8 @@ int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio)
>   	int result = 0;
>   	int err;
>   
> +	lockdep_assert_held(xe_sriov_pf_master_mutex(xe));
> +
>   	/*
>   	 * Currently, priority changes that involves VFs are only allowed using
>   	 * the 'sched_if_idle' policy KLV, so only LOW and NORMAL are supported.
> @@ -403,13 +394,31 @@ int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio)
>   	sched_if_idle = prio == GUC_SCHED_PRIORITY_NORMAL;
>   
>   	for_each_gt(gt, xe, id) {
> -		err = xe_gt_sriov_pf_policy_set_sched_if_idle(gt, sched_if_idle);
> +		err = xe_gt_sriov_pf_policy_set_sched_if_idle_locked(gt, sched_if_idle);
>   		result = result ?: err;
>   	}
>   
>   	return result;
>   }
>   
> +/**
> + * xe_sriov_pf_provision_bulk_apply_priority() - Change scheduling priority of all VFs and PF.
> + * @xe: the PF &xe_device
> + * @prio: scheduling priority to set
> + *
> + * Change the scheduling priority provisioning on all tiles/GTs.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio)
> +{
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
> +	return pf_bulk_apply_priority(xe, prio);
> +}
> +
>   /**
>    * xe_sriov_pf_provision_apply_vf_priority() - Change VF's scheduling priority.
>    * @xe: the PF &xe_device
