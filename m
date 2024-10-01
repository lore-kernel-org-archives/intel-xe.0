Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01EACE7D18
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 12:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7000810E02D;
	Tue,  1 Oct 2024 12:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpyOVZS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4062810E02D
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 12:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727784059; x=1759320059;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=s3q77XJUMAwQLHyP6TAARYc5GVSFMv/qPM/gfOjjVH0=;
 b=EpyOVZS5WlP/Mjj64lBD1tooHmYH99DiCFyliGHqa4UgrV8ZgdkEEIn3
 ukG1J+yWQwotWMp3J3/Tz4I7PdMBQFXOjie8nlxJ/eYX5oe3XH9U6tqfd
 jNqOR6MpP54pw7e4zhU9eZadS4adtiCP/jxpIfHIlj/+d/ClKUw/rBpMC
 p6rwCXK9dgMahRVZV8OxuiEq15VMltZKrS+BKxB3KLkfLIezGAIvY/rBa
 XGIlhWRJzovMaAB+CMA4RuQc7Z/l/NlXZOIFM6erOvrOnlT+YF72WMMrI
 gSDgCbOAni7mtOBQSchIOF8NZeZMGZcPlbLyr+8qHMJHQ/L3i8eY7hqva A==;
X-CSE-ConnectionGUID: CG7GDw4bTHyV0PGJtxgjGQ==
X-CSE-MsgGUID: 1649aKkQRmKqzVr/xCRvcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26374343"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="26374343"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 05:00:58 -0700
X-CSE-ConnectionGUID: t+wpZ8lXTZGkoAscm/e+OA==
X-CSE-MsgGUID: 5m9DAVTfS+2N/yvprCUnWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73961731"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.188])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 05:00:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/compat: remove unused i915_gpu_error.h
In-Reply-To: <6b737bba-619c-4e5e-a245-94571defa95e@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240930164052.3862911-1-jani.nikula@intel.com>
 <6b737bba-619c-4e5e-a245-94571defa95e@linux.intel.com>
Date: Tue, 01 Oct 2024 14:59:59 +0300
Message-ID: <87o744uj7k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 01 Oct 2024, Nirmoy Das <nirmoy.das@linux.intel.com> wrote:
> On 9/30/2024 6:40 PM, Jani Nikula wrote:
>> The last user of the compat header was removed in commit d6b933912df0
>> ("drm/i915/dmc: convert intel_dmc_print_error_state() to drm_printer").
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Thanks, pushed to drm-xe-next.

BR,
Jani.

>
>
>> ---
>>  .../drm/xe/compat-i915-headers/i915_gpu_error.h | 17 -----------------
>>  1 file changed, 17 deletions(-)
>>  delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_erro=
r.h
>>
>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h b/d=
rivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
>> deleted file mode 100644
>> index 98e9dd78f670..000000000000
>> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -/* SPDX-License-Identifier: MIT */
>> -/*
>> - * Copyright =C2=A9 2023 Intel Corporation
>> - */
>> -
>> -#ifndef _I915_GPU_ERROR_H_
>> -#define _I915_GPU_ERROR_H_
>> -
>> -struct drm_i915_error_state_buf;
>> -
>> -__printf(2, 3)
>> -static inline void
>> -i915_error_printf(struct drm_i915_error_state_buf *e, const char *f, ..=
.)
>> -{
>> -}
>> -
>> -#endif

--=20
Jani Nikula, Intel
