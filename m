Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBD2C61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 07:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D27410EB98;
	Tue,  1 Sep 2026 07:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkcczVvX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320AA10E3AF;
 Tue,  1 Sep 2026 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788249397; x=1819785397;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=8daCacT/zuWHyfxg5Aav/+ZYYgaHPfAQnTkT2vNLRyw=;
 b=hkcczVvX2Q1n5wScA8iNd3Qj3eUDafLa79loTFUSppbA1URK23XMzJFy
 uJyzX7ombNHZsueSfbz4u4wq5GXKDnFdiBG+gV07buB2280RMt9ZOG7Jd
 TCEfPJ6LJ2TYxGWP4B6VKJM30nMjdvNvNK3Ll51KX4hkiCeyLkgmh76aW
 Im6gE0CvADyC91WzBwWQVy3iG59odbT61E1s/P4JHI4rBXSj/dLBWUIKP
 o7kp7/JvJLCw5ayl9WamCnB7S9TTY2Fmuiug9JO7O3XV6w1bHW1IVQf0W
 wXxVDpdAlWQ5A78sjayuPwyVuoCGb5toe280jjCCTrSnsSqWl0TTo5SQW A==;
X-CSE-ConnectionGUID: svPsEEcPQEmF0oqFsYOzbg==
X-CSE-MsgGUID: fUvHN34sSTSustgk00wXlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87807447"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="87807447"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 00:56:35 -0700
X-CSE-ConnectionGUID: dIGimtwPShWarwkr5TVndw==
X-CSE-MsgGUID: IMgueQ3nQh+zeXaxDH7vVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="265305908"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.213])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 00:56:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>
Subject: Re: [PATCH v11 0/8] Vswing / Pre-emphasis Override
In-Reply-To: <20260813160918.918857-1-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260813160918.918857-1-michal.grzelak@intel.com>
Date: Tue, 01 Sep 2026 10:56:31 +0300
Message-ID: <3a9f683f18c23e5439b45af72bc054378f2247c6@intel.com>
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

On Thu, 13 Aug 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> Next version of [1]. v5 of IGT part is at [2].
>
> Removed dead NULL check of devdata which is no longer needed.
> Also improved code style of previous version.

On the whole,

Acked-by: Jani Nikula <jani.nikula@intel.com>

but please look into the Sashiko comments. I think there's some valid
feedback there, but see for yourself.


BR,
Jani.



>
> This series still does not include LT patches.
>
> Tested by loading xe with custom VBT#57 on PTL. Same for i915 on EHL.
>
> Custom VBT#57 from PTL decoded by [2]:
>
> Block 57 min size 2 less than block size 1154
> BDB block 57 (1154 bytes, min 2 bytes) - Vswing Preemph:
>         Number of vswing tables: 6
>         Number of columns: 3
>         Number of rows: 16
>         PHY type: Cx0
>         Vswing Table #1 (C10: DP 1.4 RBR/HBR; C20: UNUSED):
>                 Preset #01: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #02: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #03: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #04: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #05: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #06: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #07: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #08: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #09: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #10: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>         Vswing Table #2 (C10: DP 1.4 HBR2/HBR3; C20: UNUSED):
>                 Preset #01: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #02: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #03: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #04: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #05: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #06: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #07: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #08: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #09: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #10: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>         Vswing Table #3 (C10: eDP non-HBR3; C20: UNUSED):
>                 Preset #01: vswing: 0x0000001a, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #02: vswing: 0x00000021, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000006
>                 Preset #03: vswing: 0x00000026, pre-cursor: 0x00000000, p=
ost-cursor: 0x0000000b
>                 Preset #04: vswing: 0x0000002b, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000013
>                 Preset #05: vswing: 0x00000027, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #06: vswing: 0x0000002d, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000007
>                 Preset #07: vswing: 0x0000002e, pre-cursor: 0x00000000, p=
ost-cursor: 0x0000000d
>                 Preset #08: vswing: 0x0000002e, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #09: vswing: 0x00000037, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000007
>                 Preset #10: vswing: 0x0000003e, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>         Vswing Table #4 (C10: eDP HBR3; C20: UNUSED):
>                 Preset #01: vswing: 0x0000001a, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #02: vswing: 0x00000021, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000006
>                 Preset #03: vswing: 0x00000026, pre-cursor: 0x00000000, p=
ost-cursor: 0x0000000b
>                 Preset #04: vswing: 0x0000002b, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000013
>                 Preset #05: vswing: 0x00000027, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #06: vswing: 0x0000002d, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000007
>                 Preset #07: vswing: 0x0000002e, pre-cursor: 0x00000000, p=
ost-cursor: 0x0000000d
>                 Preset #08: vswing: 0x0000002e, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #09: vswing: 0x00000037, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000007
>                 Preset #10: vswing: 0x0000003e, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>         Vswing Table #5 (C10: UNUSED; C20: DP 1.4):
>                 Preset #01: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #02: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #03: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #04: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #05: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #06: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #07: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #08: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #09: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #10: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>         Vswing Table #6 (C10: UNUSED; C20: DP 2.X):
>                 Preset #01: vswing: 0x00000030, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000000
>                 Preset #02: vswing: 0x0000002b, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000005
>                 Preset #03: vswing: 0x00000028, pre-cursor: 0x00000000, p=
ost-cursor: 0x00000008
>                 Preset #04: vswing: 0x00000025, pre-cursor: 0x00000000, p=
ost-cursor: 0x0000000b
>                 Preset #05: vswing: 0x00000021, pre-cursor: 0x00000000, p=
ost-cursor: 0x0000000f
>                 Preset #06: vswing: 0x0000002e, pre-cursor: 0x00000002, p=
ost-cursor: 0x00000000
>                 Preset #07: vswing: 0x0000002a, pre-cursor: 0x00000002, p=
ost-cursor: 0x00000004
>                 Preset #08: vswing: 0x00000026, pre-cursor: 0x00000002, p=
ost-cursor: 0x00000008
>                 Preset #09: vswing: 0x00000023, pre-cursor: 0x00000002, p=
ost-cursor: 0x0000000b
>                 Preset #10: vswing: 0x00000021, pre-cursor: 0x00000002, p=
ost-cursor: 0x0000000d
>                 Preset #11: vswing: 0x0000002c, pre-cursor: 0x00000004, p=
ost-cursor: 0x00000000
>                 Preset #12: vswing: 0x00000028, pre-cursor: 0x00000004, p=
ost-cursor: 0x00000004
>                 Preset #13: vswing: 0x00000025, pre-cursor: 0x00000004, p=
ost-cursor: 0x00000007
>                 Preset #14: vswing: 0x00000021, pre-cursor: 0x00000004, p=
ost-cursor: 0x0000000b
>                 Preset #15: vswing: 0x00000028, pre-cursor: 0x00000008, p=
ost-cursor: 0x00000000
>                 Preset #16: vswing: 0x0000001e, pre-cursor: 0x00000002, p=
ost-cursor: 0x00000002
>
> Custom VBT#57 from EHL decoded by [2]:
>
> Block 57 min size 2 less than block size 1322
> BDB block 57 (1322 bytes, min 2 bytes) - Vswing Preemph:
>         Warning: purpose of tables varies between EHL & JSL
>         Number of vswing tables: 3
>         Number of columns: 11
>         Number of rows: 10
>         PHY type: Combo
>         Vswing Table #1 (High Vswing eDP/DP upto HBR3):
>           V0-P0:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V0-P1:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V0-P2:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V0-P3:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V1-P0:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V1-P1:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V1-P2:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V2-P0:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V2-P1:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V3-P0:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>         Vswing Table #2 (Low Vswing eDP upto HBR2):
>           V0-P0:
>             dw2_swing_sel:      0x0000000a, dw7_n_scalar:       0x0000003=
3, dw4_cursor_coeff:   0x0000003f,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V0-P1:
>             dw2_swing_sel:      0x0000000a, dw7_n_scalar:       0x0000004=
7, dw4_cursor_coeff:   0x00000038,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
7, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V0-P2:
>             dw2_swing_sel:      0x0000000c, dw7_n_scalar:       0x0000006=
4, dw4_cursor_coeff:   0x00000033,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
c, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V0-P3:
>             dw2_swing_sel:      0x00000006, dw7_n_scalar:       0x0000007=
f, dw4_cursor_coeff:   0x0000002f,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000001=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V1-P0:
>             dw2_swing_sel:      0x0000000a, dw7_n_scalar:       0x0000004=
6, dw4_cursor_coeff:   0x0000003f,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V1-P1:
>             dw2_swing_sel:      0x0000000c, dw7_n_scalar:       0x0000006=
4, dw4_cursor_coeff:   0x00000037,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
8, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V1-P2:
>             dw2_swing_sel:      0x00000006, dw7_n_scalar:       0x0000007=
f, dw4_cursor_coeff:   0x00000032,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
d, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V2-P0:
>             dw2_swing_sel:      0x0000000c, dw7_n_scalar:       0x0000006=
1, dw4_cursor_coeff:   0x0000003f,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V2-P1:
>             dw2_swing_sel:      0x00000006, dw7_n_scalar:       0x0000007=
f, dw4_cursor_coeff:   0x00000037,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
8, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V3-P0:
>             dw2_swing_sel:      0x00000006, dw7_n_scalar:       0x0000007=
f, dw4_cursor_coeff:   0x0000003f,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>         Vswing Table #3 (Low Vswing eDP upto HBR3):
>           V0-P0:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V0-P1:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V0-P2:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V0-P3:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V1-P0:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V1-P1:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V1-P2:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V2-P0:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V2-P1:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>           V3-P0:
>             dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x0000000=
0, dw4_cursor_coeff:   0x00000000,
>             dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000=
0, rcomp_scalar:       0x00000000,
>             rterm_select:       0x00000000, tap3_disable:       0x0000000=
0, tap2_disable:       0x00000000,
>             cursor_program:     0x00000000, coeff_polarity:     0x00000000
>
>
> BR,
> Micha=C5=82
>
> [1] https://lore.kernel.org/intel-gfx/20260702185839.4042397-1-michal.grz=
elak@intel.com/
> [2] https://lore.kernel.org/igt-dev/20260702182619.3973788-1-michal.grzel=
ak@intel.com/
>
> ---
> Changelog:
> v10->v11
> - remove no-longer-relevant check for NULL devdata (Jani)
> - initialize local variables at declaration block (Jani)
> - branch with 'else` instead of initializing twice (Jani)
> - use blank line before 'return` (Jani)
>
> v9->v10
> - drop deconstifying default tables (Suraj, Jani)
> - add separate non-const field for `entries` caching
> - cache `entries` into const field after data is overwritten (Jani)
> - call dedicated VS/PE-O vfunc
>
> v8->v9=20
> - init vspeo before using it
> - deconstify intel_ddi_buf_trans_entry in separate commit
>
> v7->v8
> - remove comments (Suraj)
> - add check for LT (Suraj)
>
> v6->v7
> - parse VBT#57 before blocks dependant on child device list (Jani)
> - expand VS/PE-O acronym in debug logging (Jani)
> - handle VS/PE-O's VBT details in intel_bios_* functions (Jani)
> - remove vspeo's cast to (void *) (Jani)
> - check devdata->vspeo if VS/PE-O was requested
> - call encoder->get_buf_trans() once (Jani)
> - return NULL from intel_bios_get_* when using default (Jani)
> - validate VS/PE-O in intel_bios.c (Jani)
> - inline *_get_vspeo_buf_trans()
> - remove temporarily LT
>
> v5->v6
> - check if devdata is not NULL
> - add Bspec (Suraj)
> - remove drm_WARN_ONCE (Suraj)
> - pass default VS/PE tables to LT's BIOS accessor (Suraj)
> - set txswing & _level from default VS/PE tables (Suraj)
> - add helper checking if VS/PE-O has been allocated (Suraj)
>
> v4->v5
> - set devdata->vspeo->num_entries in intel_bios.c
> - add if-ladder instead of function pointer
> - blend index computation with table parsing
> - remove WARN and debug messages
> - remove enums entirely
> - add spaces around operators (Suraj)
> - remove spaces after type casting (Suraj)
> - remove INTEL_DISPLAY_STATE_WARN (Suraj)
> - change funcs prefix from snps_ to mtl_ (Suraj)
>
> v3->v4
> - add Bspec (Suraj)
> - remove unnecessary init of VS/PE-O metadata (Suraj)
> - add helper for computing number of rows (Suraj)
> - fix num_rows's type (Jani, Suraj)
> - declare num_rows (Suraj)
> - change debug message when requesting VS/PE-O (Suraj)
> - stick to solely changing VBT data into current structures (Jani)
> - move iterator declaration to declaration block (Suraj)
>
> v2->v3
> - remove unnecessary braces from if block (Suraj)
> - return -EINVAL instead of -1 (Suraj)
>
> Micha=C5=82 Grzelak (8):
>   drm/i915/bios: search for VBT #57 by default
>   drm/i915/bios: store VBT #57's metadata in intel_vbt_data
>   drm/i915/bios: print VS/PE-O port info
>   drm/i915/bios: de/allocate VS/PE-O buffers for each port
>   drm/i915/buf_trans: add vfunc for VS/PE-O
>   drm/i915: override Snps's VS/PE when requested
>   drm/i915: override Combo's VS/PE when requested
>   drm/i915/bios: remove VS/PE-O warning
>
>  drivers/gpu/drm/i915/display/intel_bios.c     | 267 +++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_bios.h     |  14 +
>  .../drm/i915/display/intel_ddi_buf_trans.c    |  86 +++++-
>  .../gpu/drm/i915/display/intel_display_core.h |   7 +
>  .../drm/i915/display/intel_display_types.h    |   3 +
>  5 files changed, 363 insertions(+), 14 deletions(-)

--=20
Jani Nikula, Intel
