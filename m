Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61B5C04FF6
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 09:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B711882B5;
	Tue, 16 Apr 2024 09:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jETTcXIE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDE2112B51
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713260241; x=1744796241;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BqE+zPtcwuBD54EWHp9tmG6ByeI8MOrdKFJ5icdiPIo=;
 b=jETTcXIEX+ktEewQSVNGAT2NZgpKkN8x4x2Z5ui9kjECdUUNlCEFrpDx
 l4atVciSJxrvVugRl41l9AMB0au3WXgPsHF7pqV6TUDD9svWkNMz/Jbsy
 X+eNXOXgANOEceXUzdpjyHe8IF3S5pwvVb4XvwVJtQIuX/TeYtiy/XZEY
 b1vI1x5hSQxhbg3DCh6hlvs2Fnxp+IvJ/HvYIoPzYBjFNSMh7StV8IIlW
 2WzVrnjyBIl95NfFw7cS8I1AO2c9IOLba14SrTGpnUUQHRVnML2L0ll41
 wirT42MKbaend0CiwNYqmSN4dsNYjadFxSdYk8nKEbk4IkT3RtNp5NRma g==;
X-CSE-ConnectionGUID: AF/J6GNISQKBl59h3d8oQw==
X-CSE-MsgGUID: IGnl1cncRo+ByeYQUe/iag==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8797482"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8797482"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:37:20 -0700
X-CSE-ConnectionGUID: kQvheYwQRY66YW6vHXQETQ==
X-CSE-MsgGUID: HkSTlU/sQVONtRQBp2tMqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22276037"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.221])
 ([10.94.250.221])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:37:19 -0700
Message-ID: <fe015f91-762f-4e82-9998-4b9ac47826e7@linux.intel.com>
Date: Tue, 16 Apr 2024 11:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-5-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240416030454.3739862-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 4/16/2024 5:04 AM, Lucas De Marchi wrote:
> XE_ENGINE_CLASS_OTHER was missing from the str conversion. Add it and
> remove the default handling so it's protected by -Wswitch-enum.
> Currently the only user is xe_hw_engine_class_sysfs_init(), which
> already skips XE_ENGINE_CLASS_OTHER, so there's no change in behavior.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_engine.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 8f72f324eee7..ab227fa8984a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -971,9 +971,13 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
>   		return "vecs";
>   	case XE_ENGINE_CLASS_COPY:
>   		return "bcs";
> +	case XE_ENGINE_CLASS_OTHER:
> +		return "other";
>   	case XE_ENGINE_CLASS_COMPUTE:
>   		return "ccs";
> -	default:
> -		return NULL;
> +	case XE_ENGINE_CLASS_MAX:
> +		break;
>   	}
> +
> +	return NULL;
>   }
