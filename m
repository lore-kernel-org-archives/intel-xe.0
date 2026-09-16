Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CE7C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 07:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FF110E035;
	Wed, 16 Sep 2026 07:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/tAj0q3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92AC10E035;
 Wed, 16 Sep 2026 07:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789543678; x=1821079678;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=okyjy1G14/n3lf60I65suA9bybfpLi4oR6u/qSbAVac=;
 b=N/tAj0q3dL6Pma/6yoXy2273nim2BZnJCStcP01fPuItn6hTL0a07QFH
 SJqxesV9k1n2DEZpkAxO6gnngPXY/H8ciaeFkT8hp0PXusWT0IBDo5V63
 mlWHNv0aOygrUSSTIVG/3/mfMKpVljne1wePGXPXu8+ouZNIrX7jbwnVv
 V8oHICDrhhQokpePUUWVi76A8wgfIhU7ehfIdZGQSB2/32TBqnIgG95b/
 rTeizZVGdwV9KRPk7Z/6bwl77bBebliWpkL1J/bWiezIrCWl3tFKBouOK
 NjDgp9gdMbBAdm9d5igMGIKirarW5Z1E8htrTBARKK1oK3VrSyEYMTB2S g==;
X-CSE-ConnectionGUID: vczuQyTiSYitvUWCYOrXqA==
X-CSE-MsgGUID: kLMyrF3QTX6OVgPFtvPBog==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89050469"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89050469"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 00:27:56 -0700
X-CSE-ConnectionGUID: Xxnx4EHDSaiL6LApKq4c/A==
X-CSE-MsgGUID: NS1/gCsATQ2q/aYj33g9mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271480599"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 00:27:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: imre.deak@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/dp: use EXPORT_SYMBOL_IF_KUNIT() for kunit
 helpers
In-Reply-To: <aqogWoTeD5hCQgXq@ideak-desk.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260915160620.779372-1-jani.nikula@intel.com>
 <aqmS6M-FARktEMow@ideak-desk.lan> <aqogWoTeD5hCQgXq@ideak-desk.lan>
Date: Wed, 16 Sep 2026 10:27:52 +0300
Message-ID: <96b06c0f2b846afde41582b5f291a2fd51680c44@intel.com>
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

On Wed, 16 Sep 2026, Imre Deak <imre.deak@intel.com> wrote:
> On Tue, Sep 15, 2026 at 09:48:14PM +0300, Imre Deak wrote:
>> On Tue, Sep 15, 2026 at 07:06:20PM +0300, Jani Nikula wrote:
>> > Use EXPORT_SYMBOL_IF_KUNIT() instead of the regular EXPORT_SYMBOL() to
>> > export the symbols to the kunit namespace. Otherwise, the symbols get
>> > exported for all the kernel to see, and the corresponding
>> > MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING") in the tests is
>> > meaningless.
>>=20
>> Yes, these symblols are only used by kunit, so no need to export them
>> otherwise. Should've thought about it while typing the above
>> MODULE_IMPORT_NS():
>>=20
>> Reviewed-by: Imre Deak <imre.deak@intel.com>
>
> Actually, the symbols are defined and exported only if KUNIT is enabled
> without this patch already, as both of these are in an
> IS_ENABLED(CONFIG_KUNIT) block.

That only gates whether they're exported or not. The change is about
exporting them to the kunit namespace when they're exported.

BR,
Jani.



>
>> > Fixes: 2eb9982ff179 ("drm/i915/kunit: Export link training and caps fu=
ncs for testing")
>> > Cc: Imre Deak <imre.deak@intel.com>
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_dp_link_caps.c     | 6 ++++--
>> >  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 ++--
>> >  2 files changed, 6 insertions(+), 4 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drive=
rs/gpu/drm/i915/display/intel_dp_link_caps.c
>> > index 98657aa4d3d5..abec3e2519ca 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
>> > @@ -3,6 +3,8 @@
>> >   * Copyright =C2=A9 2026 Intel Corporation
>> >   */
>> >=20=20
>> > +#include <kunit/visibility.h>
>> > +
>> >  #include <linux/bitops.h>
>> >  #include <linux/debugfs.h>
>> >  #include <linux/log2.h>
>> > @@ -1302,14 +1304,14 @@ void intel_dp_link_caps_cleanup(struct intel_d=
p_link_caps *link_caps)
>> >  const struct intel_dp_link_caps_test_ops i915_display_dp_link_caps_te=
st_ops =3D {
>> >  	INTEL_DP_LINK_CAPS_TEST_OPS_INIT
>> >  };
>> > -EXPORT_SYMBOL(i915_display_dp_link_caps_test_ops);
>> > +EXPORT_SYMBOL_IF_KUNIT(i915_display_dp_link_caps_test_ops);
>> >=20=20
>> >  #else
>> >=20=20
>> >  const struct intel_dp_link_caps_test_ops intel_display_dp_link_caps_t=
est_ops =3D {
>> >  	INTEL_DP_LINK_CAPS_TEST_OPS_INIT
>> >  };
>> > -EXPORT_SYMBOL(intel_display_dp_link_caps_test_ops);
>> > +EXPORT_SYMBOL_IF_KUNIT(intel_display_dp_link_caps_test_ops);
>> >=20=20
>> >  #endif	/* I915 */
>> >=20=20
>> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/d=
rivers/gpu/drm/i915/display/intel_dp_link_training.c
>> > index cb92cff90614..9a692f4fdfee 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>> > @@ -2825,14 +2825,14 @@ void intel_dp_link_training_cleanup(struct int=
el_dp_link_training *link_training
>> >  const struct intel_dp_link_training_test_ops i915_display_dp_link_tra=
ining_test_ops =3D {
>> >  	INTEL_DP_LINK_TRAINING_TEST_OPS_INIT
>> >  };
>> > -EXPORT_SYMBOL(i915_display_dp_link_training_test_ops);
>> > +EXPORT_SYMBOL_IF_KUNIT(i915_display_dp_link_training_test_ops);
>> >=20=20
>> >  #else
>> >=20=20
>> >  const struct intel_dp_link_training_test_ops intel_display_dp_link_tr=
aining_test_ops =3D {
>> >  	INTEL_DP_LINK_TRAINING_TEST_OPS_INIT
>> >  };
>> > -EXPORT_SYMBOL(intel_display_dp_link_training_test_ops);
>> > +EXPORT_SYMBOL_IF_KUNIT(intel_display_dp_link_training_test_ops);
>> >=20=20
>> >  #endif	/* I915 */
>> >=20=20
>> > --=20
>> > 2.47.3
>> >=20

--=20
Jani Nikula, Intel
