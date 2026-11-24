Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBDC606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 11:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KFu9Z52M
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87AC10E86E;
	Tue, 24 Nov 2026 11:38:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC34110F4B1
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 11:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795520330; x=1827056330;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+ZN21KMt+cD6W65tR/7yLSOslN/XZEHBirQzPGpncMA=;
 b=KFu9Z52MRq2jb4OTQPdIzXgVPq8f+BcJahbkWWXm5vn4Ii2TTzZBlneY
 1pNmhwyGEYDFvrPNuq01sJW/OEZPbdlcu9niVeExm/beb/cw43L83ftuf
 O35xpw/Wy0mahaNe/dqFlmYgDvf01JESR7eIAHzgS5GyyhoxvzQ1Qnhml
 nhNuUcNcxLoFZFaWBNTSDWaMie5C5aECSMHeleYzH+5Pa9lKeKy2mEP6M
 yPOdaBEzTgxdY1z5o7wCSh93/F6q3vkKJy3lbEmBrwSb86APh2QKJwOu2
 8DwCwrAw26A1Fk7e6gGSUX8iP64lW6aLACJBvUbECX0UD4sp8mQy5o62y g==;
X-CSE-ConnectionGUID: qXCRnsduTO6SGOX356Jb8Q==
X-CSE-MsgGUID: CbJVW/J7Qial7XIFMxv4JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4261578"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4261578"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 03:38:50 -0800
X-CSE-ConnectionGUID: b7EhUPT8SU6gVnnZiW9S5Q==
X-CSE-MsgGUID: E8UU/AVJQKeunHGrK+FVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11874074"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.172])
 ([10.245.245.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 03:38:49 -0800
Message-ID: <0bde8dd3-4e61-4ce3-b983-d7a12e28c19e@intel.com>
Date: Tue, 24 Nov 2026 11:38:47 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/cri: Increase default CCS preempt timeout to
 7.5s
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
References: <20261123123436.2114961-3-himal.prasad.ghimiray@intel.com>
 <20261123123436.2114961-4-himal.prasad.ghimiray@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261123123436.2114961-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/11/2026 12:34, Himal Prasad Ghimiray wrote:
> CRI uses thread-group preemption for compute, as mid-thread preemption
> cannot be used there. A context can then only be preempted at a
> work-group boundary, so the default 640ms preempt timeout is too short
> under concurrency and leads to engine resets. Default the CCS preempt
> timeout to 7.5s on CRI; it remains tunable via sysfs.
> 
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_hw_engine.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 7f304b9fe0e1..959661ecb1a2 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -581,6 +581,13 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   			}
>   		}
>   
> +		/* CRI compute uses thread-group preemption, which needs a longer timeout */
> +		if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND &&
> +		    hwe->class == XE_ENGINE_CLASS_COMPUTE)
> +			hwe->eclass->sched_props.preempt_timeout_us =
> +				min_t(u32, 7500 * 1000,
> +				      hwe->eclass->sched_props.preempt_timeout_max);
> +
>   		/* Record default props */
>   		hwe->eclass->defaults = hwe->eclass->sched_props;
>   	}

