Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C3EC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 10:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653FF10E07C;
	Tue, 25 Jun 2024 10:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfV30hFC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5797710E07C
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 10:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719309656; x=1750845656;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2xcZaGh/AeB6/aSR0azQCSU4RigRFASM5EtK2e8rfVM=;
 b=SfV30hFCjwr5mJyOeL1Q3O9uP9xLgd1p0lPnsA2h8ZxixaRlDTEwvSK+
 gKR/7f78QcUqjoNl1JulATw4ANC/8tTnaes4SP/FH8mD16hvHv0JOYJRs
 d2S05hincPf78eUNHaOvRUTbrZLjraCbQv8kxrD8tei7A97i8mETIn4Q4
 TgLRV+ZbA3BFn93DQG/9pUCFQtN7/Gr+/nE+MVG0cs8eyNe7Rqo2ibMkP
 3Je2VmVrQC75LzDzwPr4GwF/NmCTI5arngRA07dcmsyp3h14igcra7qS1
 0Cv8wWansms8X19kEQ3rH2dFXJjkJwqgP8etDPJA8MiZW6qaQ9HyNfQcJ g==;
X-CSE-ConnectionGUID: mA9DyHZmSHqjXXi6OKwMug==
X-CSE-MsgGUID: 5HS1BRbqQlW439Iu8Z6O0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16002150"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="16002150"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 03:00:55 -0700
X-CSE-ConnectionGUID: CD6wrt74QEGpQ34uqAxagQ==
X-CSE-MsgGUID: F12itQ3lRMiRY/8cxUgwCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="74796001"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.50.115])
 ([10.246.50.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 03:00:53 -0700
Message-ID: <cc52ae09-8398-4061-a01e-76919faf9f27@linux.intel.com>
Date: Tue, 25 Jun 2024 12:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/xe/client: Check return value of
 xe_force_wake_get
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240625094228.5327-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240625094228.5327-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

This was earlier part of https://patchwork.freedesktop.org/series/134437/

which I did get enough time to work on yet and there is a another series 
to fix that from

Michal,  https://patchwork.freedesktop.org/series/134958/.  This patch 
is independent of those series

and partially reviewed so let's get that merge to silence static 
analyzer tool.


Regards,

Nirmoy

On 6/25/2024 11:42 AM, Nirmoy Das wrote:
> xe_force_wake_get() can return error so check it's return value
> before reading gpu_timestamp value.
>
> v2: set HWE to NULL instead of setting timestamp to 0(Lucas)
>      Add a warn on for xe_force_wake_put(Himal)
>
> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 4a19b771e3a0..4bdb909eabfc 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -264,9 +264,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>   		if (!hwe)
>   			continue;
>   
> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT)) {
> +			hwe = NULL;
> +			break;
> +		}
> +
>   		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>   		break;
>   	}
>   
