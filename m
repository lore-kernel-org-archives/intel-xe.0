Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C36606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d0VEaId3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B027210E8EF;
	Wed, 25 Nov 2026 13:51:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AF210FC6E;
 Wed, 25 Nov 2026 13:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795614706; x=1827150706;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=3+Cybg17Zv1Ix8PXfYC38+Cze3dDxBucdVj1cYt2Ke0=;
 b=d0VEaId3L+TZt8xiz/ejX21CwBzdixYoFbHsBKyefVrb4UJM9tx0WxPY
 p4DR19VT4KDwS49MYWNMcTb4sj1gfchczjuS+i4XPBgSJkubDva45vMGi
 BTFrIzqFPkng+hBOlPsnpgbMckJ/tgJwuLFC6AkcO+pJGZg9LrtK2TBne
 Pe+/T6TfFzRoU67gFEgU2HfYygadwqqCEHexqJKuW8VuwaGE4FPGpExr9
 INzcKaJrjLeLWeLxMIdJ6Z1Q6pNuNNM0u97vGmIfjHXfu9VGyy+23Ehrp
 PvXCk9VWaeLJcMlIgNBaRCGH6Ho4tKdwMCLEOaWbRdy8+JLA9Zq/Skc0P A==;
X-CSE-ConnectionGUID: 8FdKaO+1RNuUL7Jnp92ZKw==
X-CSE-MsgGUID: nPqoX8ZDQ+SInLS8a4lC/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4499592"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4499592"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 05:51:16 -0800
X-CSE-ConnectionGUID: vTB/5+HoT4WjBBFkfK8T6Q==
X-CSE-MsgGUID: 1MlBNn/mRBmBAO0WWL0z6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="12303956"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 05:51:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: use local __VLV_DISPLAY_BASE for i915 registers
In-Reply-To: <awXrzzoa9yH_scGZ@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261124133156.1504267-1-jani.nikula@intel.com>
 <awXrzzoa9yH_scGZ@intel.com>
Date: Wed, 25 Nov 2026 15:51:12 +0200
Message-ID: <56954cfc1a740b49d16331b0dfa3b00a1db4229c@intel.com>
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Nov 24, 2026 at 03:31:56PM +0200, Jani Nikula wrote:
>> Avoid including intel_display_reg_defs.h just for VLV_DISPLAY_BASE. It's
>> not great to have multiple definitions, but for now just break the
>> dependency.
>>=20
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_reg.h              | 19 ++++++++++---------
>>  include/drm/intel/intel_gmd_interrupt_regs.h | 14 ++++++++------
>>  2 files changed, 18 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915=
_reg.h
>> index 32f8bb39babf..06b3ee0ad1b9 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -26,7 +26,6 @@
>>  #define _I915_REG_H_
>>=20=20
>>  #include "i915_reg_defs.h"
>> -#include "display/intel_display_reg_defs.h"
>>=20=20
>>  /**
>>   * DOC: The i915 register macro definition style guide
>> @@ -116,6 +115,8 @@
>>   *  #define GEN8_BAR                    _MMIO(0xb888)
>>   */
>>=20=20
>> +#define __VLV_DISPLAY_BASE		0x180000
>> +
>>  #define GU_CNTL				_MMIO(0x101010)
>>  #define   LMEM_INIT			REG_BIT(7)
>>  #define   DRIVERFLR			REG_BIT(31)
>> @@ -152,7 +153,7 @@
>>  /*
>>   * IOSF sideband
>>   */
>> -#define VLV_IOSF_DOORBELL_REQ			_MMIO(VLV_DISPLAY_BASE + 0x2100)
>> +#define VLV_IOSF_DOORBELL_REQ			_MMIO(__VLV_DISPLAY_BASE + 0x2100)
>>  #define   IOSF_DEVFN_SHIFT			24
>>  #define   IOSF_OPCODE_SHIFT			16
>>  #define   IOSF_PORT_SHIFT			8
>> @@ -174,8 +175,8 @@
>>  #define   CHV_IOSF_PORT_GPIO_SE			0x48
>>  #define   CHV_IOSF_PORT_GPIO_E			0xa8
>>  #define   CHV_IOSF_PORT_GPIO_SW			0xb2
>> -#define VLV_IOSF_DATA				_MMIO(VLV_DISPLAY_BASE + 0x2104)
>> -#define VLV_IOSF_ADDR				_MMIO(VLV_DISPLAY_BASE + 0x2108)
>> +#define VLV_IOSF_DATA				_MMIO(__VLV_DISPLAY_BASE + 0x2104)
>> +#define VLV_IOSF_ADDR				_MMIO(__VLV_DISPLAY_BASE + 0x2108)
>>=20=20
>>  /* DPIO registers */
>>  #define DPIO_DEVFN			0
>> @@ -325,8 +326,8 @@
>>  #define GEN7_MEDIA_MAX_REQ_COUNT	_MMIO(0x4070)
>>  #define GEN7_GFX_MAX_REQ_COUNT		_MMIO(0x4074)
>>=20=20
>> -#define VLV_GU_CTL0	_MMIO(VLV_DISPLAY_BASE + 0x2030)
>> -#define VLV_GU_CTL1	_MMIO(VLV_DISPLAY_BASE + 0x2034)
>> +#define VLV_GU_CTL0	_MMIO(__VLV_DISPLAY_BASE + 0x2030)
>> +#define VLV_GU_CTL1	_MMIO(__VLV_DISPLAY_BASE + 0x2034)
>>  #define GEN2_IER	_MMIO(0x20a0)
>>  #define GEN2_IIR	_MMIO(0x20a4)
>>  #define GEN2_IMR	_MMIO(0x20a8)
>> @@ -336,10 +337,10 @@
>>  					      GEN2_IER, \
>>  					      GEN2_IIR)
>>=20=20
>> -#define VLV_GUNIT_CLOCK_GATE	_MMIO(VLV_DISPLAY_BASE + 0x2060)
>> +#define VLV_GUNIT_CLOCK_GATE	_MMIO(__VLV_DISPLAY_BASE + 0x2060)
>>  #define   GINT_DIS		(1 << 22)
>>  #define   GCFG_DIS		(1 << 8)
>> -#define VLV_GUNIT_CLOCK_GATE2	_MMIO(VLV_DISPLAY_BASE + 0x2064)
>> +#define VLV_GUNIT_CLOCK_GATE2	_MMIO(__VLV_DISPLAY_BASE + 0x2064)
>>=20=20
>>  #define EIR		_MMIO(0x20b0)
>>  #define EMR		_MMIO(0x20b4)
>> @@ -608,7 +609,7 @@
>>  #define VLV_CLK_CTL2			_MMIO(0x101104)
>>  #define   CLK_CTL2_CZCOUNT_30NS_SHIFT	28
>>=20=20
>> -#define VLV_DPFLIPSTAT				_MMIO(VLV_DISPLAY_BASE + 0x70028)
>> +#define VLV_DPFLIPSTAT				_MMIO(__VLV_DISPLAY_BASE + 0x70028)
>>  #define   PIPEB_LINE_COMPARE_INT_EN			REG_BIT(29)
>>  #define   PIPEB_HLINE_INT_EN			REG_BIT(28)
>>  #define   PIPEB_VBLANK_INT_EN			REG_BIT(27)
>
> I have a commit in some branch that moves that into the display
> header where it belongs. I should dig that up...
>
> I suppose for the rest of these registers we could even call it
> VLV_GUNIT_BASE or something, but doesn't really matter I suppose.
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed to din.

>
>> diff --git a/include/drm/intel/intel_gmd_interrupt_regs.h b/include/drm/=
intel/intel_gmd_interrupt_regs.h
>> index 0d85ec907396..fcfd8bc093b8 100644
>> --- a/include/drm/intel/intel_gmd_interrupt_regs.h
>> +++ b/include/drm/intel/intel_gmd_interrupt_regs.h
>> @@ -4,6 +4,8 @@
>>  #ifndef _INTEL_GMD_INTERRUPT_REGS_H_
>>  #define _INTEL_GMD_INTERRUPT_REGS_H_
>>=20=20
>> +#define __VLV_DISPLAY_BASE		0x180000
>> +
>>  #define I915_PM_INTERRUPT				(1 << 31)
>>  #define I915_ISP_INTERRUPT				(1 << 22)
>>  #define I915_LPE_PIPE_B_INTERRUPT			(1 << 21)
>> @@ -62,12 +64,12 @@
>>  #define  SCPD_FBC_IGNORE_3D			(1 << 6)
>>  #define  CSTATE_RENDER_CLOCK_GATE_DISABLE	(1 << 5)
>>=20=20
>> -#define VLV_IIR_RW	_MMIO(VLV_DISPLAY_BASE + 0x2084)
>> -#define VLV_IER		_MMIO(VLV_DISPLAY_BASE + 0x20a0)
>> -#define VLV_IIR		_MMIO(VLV_DISPLAY_BASE + 0x20a4)
>> -#define VLV_IMR		_MMIO(VLV_DISPLAY_BASE + 0x20a8)
>> -#define VLV_ISR		_MMIO(VLV_DISPLAY_BASE + 0x20ac)
>> -#define VLV_PCBR	_MMIO(VLV_DISPLAY_BASE + 0x2120)
>> +#define VLV_IIR_RW	_MMIO(__VLV_DISPLAY_BASE + 0x2084)
>> +#define VLV_IER		_MMIO(__VLV_DISPLAY_BASE + 0x20a0)
>> +#define VLV_IIR		_MMIO(__VLV_DISPLAY_BASE + 0x20a4)
>> +#define VLV_IMR		_MMIO(__VLV_DISPLAY_BASE + 0x20a8)
>> +#define VLV_ISR		_MMIO(__VLV_DISPLAY_BASE + 0x20ac)
>> +#define VLV_PCBR	_MMIO(__VLV_DISPLAY_BASE + 0x2120)
>>  #define VLV_PCBR_ADDR_SHIFT	12
>>=20=20
>>  #endif
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
