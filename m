Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141A6606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C9AKNIfN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5D810E920;
	Fri, 20 Nov 2026 14:38:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7634E10E920;
 Fri, 20 Nov 2026 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795185513; x=1826721513;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=2zgiYX1rxcn2bvRDsivsL0YVaICp/6jy4ymrROzCGZA=;
 b=C9AKNIfNHBqRHDc1lP9vO1Qy5a1mn9AZcq3BdWlk1/DuezxxE3RC5F9T
 e8yGjv3BWCjQj17Yil/jnAytzm+KBK/kyHUkWB6cT53L3BPcQJ4auQLor
 hZRtgajTvUP5UyVksn1uhMKqI3EMA5abs2t+U/oRwCiZ7iZeyDvyvMd2/
 oNt2FS76z4kRfe5rqDrkZpCL0Zbftm4MJ9imVUZhpbc56KQuQWWdPc/x5
 6BTBE+gDnZHCDXN2aUu38XFLV5Xwp7BtN+bU5NaPL9nPounTjVA/Oo/jz
 290XYxcwOd/0akO9wgTVKkREMudlVgr4cDmPzpAsnL8NjaPWZ0csJ4Not A==;
X-CSE-ConnectionGUID: 1sZCjPVeQnWYmg0DibxN1g==
X-CSE-MsgGUID: NkcYVcfJQqypvz81g6bQ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3954548"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3954548"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:38:32 -0800
X-CSE-ConnectionGUID: 6raTj0lDQk2PNluxPZxoyA==
X-CSE-MsgGUID: diQIaR6FSqKSmHh7TlIlaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10784615"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:38:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915: move FBC_RT_BASE register macros to
 intel_gt_regs.h
In-Reply-To: <av8X3kGJ99JEAT0u@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261119151644.4097956-1-jani.nikula@intel.com>
 <20261119151644.4097956-2-jani.nikula@intel.com>
 <av8X3kGJ99JEAT0u@intel.com>
Date: Fri, 20 Nov 2026 16:38:27 +0200
Message-ID: <8fbc6c44d165f967e85e7431c59efd3575e79bee@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Nov 19, 2026 at 05:16:44PM +0200, Jani Nikula wrote:
>> The FBC_RT_BASE registers are in the SVL unit, not display. Move them to
>> intel_gt_regs.h, and reducing display includes from i915 core in the
>> process.
>
> Yeah, we don't use the FBC hardware render tracking so we have no
> need for these in the display code. I was worried we might still be
> writing them anyway, but looks like I removed all that in
> commit b339088d81c8 ("drm/i915: Don't write IVB_FBC_RT_BASE") and
> commit 644398586f00 ("drm/i915/fbc: Remove the FBC_RT_BASE setup for
> ILK/SNB")
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed both to din.

>
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_fbc_regs.h | 7 -------
>>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 7 +++++++
>>  drivers/gpu/drm/i915/gt/intel_workarounds.c   | 2 --
>>  3 files changed, 7 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbc_regs.h b/drivers/gpu=
/drm/i915/display/intel_fbc_regs.h
>> index 4178e602d7d7..3ce018ebb27c 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbc_regs.h
>> +++ b/drivers/gpu/drm/i915/display/intel_fbc_regs.h
>> @@ -111,19 +111,12 @@
>>  #define XE3_FBC_DIRTY_CTL(fbc_id)	_MMIO_PIPE((fbc_id), 0x43234, 0x43274)
>>  #define   FBC_DIRTY_RECT_EN		REG_BIT(31)
>>=20=20
>> -#define ILK_FBC_RT_BASE		_MMIO(0x2128)
>> -#define   ILK_FBC_RT_VALID	REG_BIT(0)
>> -#define   SNB_FBC_FRONT_BUFFER	REG_BIT(1)
>> -
>>  #define SNB_DPFC_CTL_SA		_MMIO(0x100100)
>>  #define   SNB_DPFC_FENCE_EN		REG_BIT(29)
>>  #define   SNB_DPFC_FENCENO_MASK		REG_GENMASK(4, 0)
>>  #define   SNB_DPFC_FENCENO(fence)	REG_FIELD_PREP(SNB_DPFC_FENCENO_MASK,=
 (fence))
>>  #define SNB_DPFC_CPU_FENCE_OFFSET	_MMIO(0x100104)
>>=20=20
>> -#define IVB_FBC_RT_BASE			_MMIO(0x7020)
>> -#define IVB_FBC_RT_BASE_UPPER		_MMIO(0x7024)
>> -
>>  #define MSG_FBC_REND_STATE(fbc_id)	_MMIO_PIPE((fbc_id), 0x50380, 0x5038=
4)
>>  #define   FBC_REND_NUKE			REG_BIT(2)
>>  #define   FBC_REND_CACHE_CLEAN		REG_BIT(1)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i=
915/gt/intel_gt_regs.h
>> index 3ba9b2206b79..7b892fa50088 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> @@ -202,6 +202,10 @@
>>  #define   CM0_DEPTH_WRITE_DISABLE		(1 << 1)
>>  #define   CM0_RC_OP_FLUSH_DISABLE		(1 << 0)
>>=20=20
>> +#define ILK_FBC_RT_BASE				_MMIO(0x2128)
>> +#define   ILK_FBC_RT_VALID			REG_BIT(0)
>> +#define   SNB_FBC_FRONT_BUFFER			REG_BIT(1)
>> +
>>  #define GFX_FLSH_CNTL				_MMIO(0x2170) /* 915+ only */
>>=20=20
>>  /*
>> @@ -471,6 +475,9 @@
>>  #define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE	REG_BIT(13)
>>  #define   BDW_HIZ_POWER_COMPILER_CLOCK_GATING_DISABLE	REG_BIT(3)
>>=20=20
>> +#define IVB_FBC_RT_BASE				_MMIO(0x7020)
>> +#define IVB_FBC_RT_BASE_UPPER			_MMIO(0x7024)
>> +
>>  #define XEHP_CULLBIT2				MCR_REG(0x7030)
>>=20=20
>>  #define GEN8_L3CNTLREG				_MMIO(0x7034)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/d=
rm/i915/gt/intel_workarounds.c
>> index 24ea5d8d529c..a2f00fc8589d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> @@ -20,8 +20,6 @@
>>  #include "intel_ring.h"
>>  #include "intel_workarounds.h"
>>=20=20
>> -#include "display/intel_fbc_regs.h"
>> -
>>  /**
>>   * DOC: Hardware workarounds
>>   *
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
