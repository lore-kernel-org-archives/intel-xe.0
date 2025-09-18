Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F16ACAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 12:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBCD10E7CA;
	Thu, 18 Sep 2025 12:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n++qnLYO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3C610E755;
 Thu, 18 Sep 2025 12:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758199360; x=1789735360;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=g9B3TaS7wzSK4EcApirkw4C3VfY7xGr5T0N0nMoLNcY=;
 b=n++qnLYOZgwZ04H03zGr+evW82jU1t4j4DwMnCD7+72gDdcFOeL3oSdS
 ANgtMD11/aJpXDPrfdp8SHv8/KFkHih7ZS1cNP6cEht+cEVjWhf/uBbvh
 cv6M6uVIlpuqlVpB2CtIzeD3OC4a79jeoDKEOkxqGZ4Hqiarm5Ajqn67J
 AgkPCXUwnYGuOCjqJDkyWPTKJONGzOF8HsM8WawDlaP+IEjxA4LfSdEkv
 tWWEPfvIfNKjto6OCJT/swikp8dV4no4AGZz6GwN8R7ulctul7a+gQ9Yi
 RfSK/wGCVRU9HfSHNwhEJaV3fChsvGztinDJ05ZJvA+q+srCfXuKn8xIH Q==;
X-CSE-ConnectionGUID: yaN7PV93R2ChUc+AEytfmg==
X-CSE-MsgGUID: IRNaD+YjT7KLq9e/4bWk0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71207955"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="71207955"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:42:40 -0700
X-CSE-ConnectionGUID: nX2PayxJQaKbSHgETYrXKA==
X-CSE-MsgGUID: l6QL1P0HSDWlWglEAsdkYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="175612056"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:42:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/5] drm/i915/irq: add ilk_display_irq_reset()
In-Reply-To: <aMv8fwO34utdfIBP@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1758198300.git.jani.nikula@intel.com>
 <903f35b109acea1f70b942a76392e58e88b0b720.1758198300.git.jani.nikula@intel.com>
 <aMv8fwO34utdfIBP@intel.com>
Date: Thu, 18 Sep 2025 15:42:35 +0300
Message-ID: <0169f1407a3df2acfff0e5ee06994113761f20ff@intel.com>
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

On Thu, 18 Sep 2025, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Sep 18, 2025 at 03:25:48PM +0300, Jani Nikula wrote:
>> -	gen2_irq_reset(uncore, DE_IRQ_REGS);
>> -	display->irq.ilk_de_imr_mask =3D ~0u;
>> -
>>  	if (GRAPHICS_VER(dev_priv) =3D=3D 7)
>>  		intel_uncore_write(uncore, GEN7_ERR_INT, 0xffffffff);
>
> GEN7_ERR_INT is display stuff as well.

D'oh. v2 on the list.


--=20
Jani Nikula, Intel
