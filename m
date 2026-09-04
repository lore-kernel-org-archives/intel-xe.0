Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FCCC61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9C110E132;
	Fri,  4 Sep 2026 12:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGedp0bd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D7C10E132;
 Fri,  4 Sep 2026 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788525115; x=1820061115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dcoVxXnAzbM4TpzYoXwcgao4/w/nDQsDss5Q4NdW7OI=;
 b=KGedp0bdv+38PMZmVq4T7C7HoCbjm4ENt+KJ/mQkooRuWJtHqjWMkVIF
 w2VL/H6nMDg4y9j4LlApzDnsgrQMbJPjEApDjxe3nHtjJt979K+mloMXx
 MSu1dMCOj66v5p26sEwTt3iBTKhJ4++jm0FL25hH9gTjpMm6vpGmiPTXu
 7eGzZDfm0qye3hrZW3K6g+aphU2Mlc/VTDdpGKkq1c9Nay+iu9UBCQ1rV
 rPytQvFJmet5/Cfb6mJ4vJJ5+5i08BldjSDETsp+fua9HReN1+wQkKZh0
 5RVpl3SzrvUkMSink2jyX7rGeIyH+JzfNyQLEifVHGGH9qsPD6vb/LytM g==;
X-CSE-ConnectionGUID: EzS51AwJSS+jIr60CrBBbQ==
X-CSE-MsgGUID: GgRl7NCOSe2hk+J61uTz9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92896565"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="92896565"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:31:55 -0700
X-CSE-ConnectionGUID: nvknPNlESZWng225dXQf8w==
X-CSE-MsgGUID: xvGBkAYrQL6xwUWqV5llqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="275311552"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 04 Sep 2026 05:31:53 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v12 0/8] Vswing / Pre-emphasis Override
Date: Fri,  4 Sep 2026 14:31:40 +0200
Message-ID: <20260904123148.2165596-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next version of [1]. v5 of IGT part is at [2].

Sashiko pointed out couple issues. Those include: outdated commit
message for EHL; setting number of entries per PHY; and leaking memory
on driver removal.

Major comments regarded: lack of handling of low vswing eDP on EHL;
reversed order of setting indices for JSL.

This series does not include patches for LT.

Tested by loading xe with custom VBT#57 on PTL. Same for i915 on EHL.

Custom VBT#57 for PTL decoded by [2]:

Block 57 min size 2 less than block size 1154
BDB block 57 (1154 bytes, min 2 bytes) - Vswing Preemph:
        Number of vswing tables: 6
        Number of columns: 3
        Number of rows: 16
        PHY type: Cx0
        Vswing Table #1 (C10: DP 1.4 RBR/HBR; C20: UNUSED):
                Preset #01: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #02: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #03: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #04: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #05: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #06: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #07: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #08: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #09: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #10: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
        Vswing Table #2 (C10: DP 1.4 HBR2/HBR3; C20: UNUSED):
                Preset #01: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #02: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #03: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #04: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #05: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #06: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #07: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #08: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #09: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #10: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
        Vswing Table #3 (C10: eDP non-HBR3; C20: UNUSED):
                Preset #01: vswing: 0x0000001a, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #02: vswing: 0x00000021, pre-cursor: 0x00000000, post-cursor: 0x00000006
                Preset #03: vswing: 0x00000026, pre-cursor: 0x00000000, post-cursor: 0x0000000b
                Preset #04: vswing: 0x0000002b, pre-cursor: 0x00000000, post-cursor: 0x00000013
                Preset #05: vswing: 0x00000027, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #06: vswing: 0x0000002d, pre-cursor: 0x00000000, post-cursor: 0x00000007
                Preset #07: vswing: 0x0000002e, pre-cursor: 0x00000000, post-cursor: 0x0000000d
                Preset #08: vswing: 0x0000002e, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #09: vswing: 0x00000037, pre-cursor: 0x00000000, post-cursor: 0x00000007
                Preset #10: vswing: 0x0000003e, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
        Vswing Table #4 (C10: eDP HBR3; C20: UNUSED):
                Preset #01: vswing: 0x0000001a, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #02: vswing: 0x00000021, pre-cursor: 0x00000000, post-cursor: 0x00000006
                Preset #03: vswing: 0x00000026, pre-cursor: 0x00000000, post-cursor: 0x0000000b
                Preset #04: vswing: 0x0000002b, pre-cursor: 0x00000000, post-cursor: 0x00000013
                Preset #05: vswing: 0x00000027, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #06: vswing: 0x0000002d, pre-cursor: 0x00000000, post-cursor: 0x00000007
                Preset #07: vswing: 0x0000002e, pre-cursor: 0x00000000, post-cursor: 0x0000000d
                Preset #08: vswing: 0x0000002e, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #09: vswing: 0x00000037, pre-cursor: 0x00000000, post-cursor: 0x00000007
                Preset #10: vswing: 0x0000003e, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
        Vswing Table #5 (C10: UNUSED; C20: DP 1.4):
                Preset #01: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #02: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #03: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #04: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #05: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #06: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #07: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #08: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #09: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #10: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
        Vswing Table #6 (C10: UNUSED; C20: DP 2.X):
                Preset #01: vswing: 0x00000030, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #02: vswing: 0x0000002b, pre-cursor: 0x00000000, post-cursor: 0x00000005
                Preset #03: vswing: 0x00000028, pre-cursor: 0x00000000, post-cursor: 0x00000008
                Preset #04: vswing: 0x00000025, pre-cursor: 0x00000000, post-cursor: 0x0000000b
                Preset #05: vswing: 0x00000021, pre-cursor: 0x00000000, post-cursor: 0x0000000f
                Preset #06: vswing: 0x0000002e, pre-cursor: 0x00000002, post-cursor: 0x00000000
                Preset #07: vswing: 0x0000002a, pre-cursor: 0x00000002, post-cursor: 0x00000004
                Preset #08: vswing: 0x00000026, pre-cursor: 0x00000002, post-cursor: 0x00000008
                Preset #09: vswing: 0x00000023, pre-cursor: 0x00000002, post-cursor: 0x0000000b
                Preset #10: vswing: 0x00000021, pre-cursor: 0x00000002, post-cursor: 0x0000000d
                Preset #11: vswing: 0x0000002c, pre-cursor: 0x00000004, post-cursor: 0x00000000
                Preset #12: vswing: 0x00000028, pre-cursor: 0x00000004, post-cursor: 0x00000004
                Preset #13: vswing: 0x00000025, pre-cursor: 0x00000004, post-cursor: 0x00000007
                Preset #14: vswing: 0x00000021, pre-cursor: 0x00000004, post-cursor: 0x0000000b
                Preset #15: vswing: 0x00000028, pre-cursor: 0x00000008, post-cursor: 0x00000000
                Preset #16: vswing: 0x0000001e, pre-cursor: 0x00000002, post-cursor: 0x00000002

This version uses different VBT#57; custom block for EHL decoded by [2]:

Block 57 min size 2 less than block size 1322
BDB block 57 (1322 bytes, min 2 bytes) - Vswing Preemph:
        Warning: purpose of tables varies between EHL & JSL
        Number of vswing tables: 3
        Number of columns: 11
        Number of rows: 10
        PHY type: Combo
        Vswing Table #1 (High Vswing eDP/DP upto HBR3):
          V0-P0:
            dw2_swing_sel:      0x0000000a, dw7_n_scalar:       0x00000033, dw4_cursor_coeff:   0x0000003f,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V0-P1:
            dw2_swing_sel:      0x0000000a, dw7_n_scalar:       0x00000047, dw4_cursor_coeff:   0x00000038,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000007, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V0-P2:
            dw2_swing_sel:      0x0000000c, dw7_n_scalar:       0x00000064, dw4_cursor_coeff:   0x00000033,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000c, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V0-P3:
            dw2_swing_sel:      0x00000006, dw7_n_scalar:       0x0000007f, dw4_cursor_coeff:   0x0000002f,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000010, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V1-P0:
            dw2_swing_sel:      0x0000000a, dw7_n_scalar:       0x00000046, dw4_cursor_coeff:   0x0000003f,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V1-P1:
            dw2_swing_sel:      0x0000000c, dw7_n_scalar:       0x00000064, dw4_cursor_coeff:   0x00000037,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000008, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V1-P2:
            dw2_swing_sel:      0x00000006, dw7_n_scalar:       0x0000007f, dw4_cursor_coeff:   0x00000032,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x0000000d, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V2-P0:
            dw2_swing_sel:      0x0000000c, dw7_n_scalar:       0x00000061, dw4_cursor_coeff:   0x0000003f,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V2-P1:
            dw2_swing_sel:      0x00000006, dw7_n_scalar:       0x0000007f, dw4_cursor_coeff:   0x00000037,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000008, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V3-P0:
            dw2_swing_sel:      0x00000006, dw7_n_scalar:       0x0000007f, dw4_cursor_coeff:   0x0000003f,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
        Vswing Table #2 (Low Vswing eDP upto HBR2):
          V0-P0:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V0-P1:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V0-P2:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V0-P3:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V1-P0:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V1-P1:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V1-P2:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V2-P0:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V2-P1:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V3-P0:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
        Vswing Table #3 (Low Vswing eDP upto HBR3):
          V0-P0:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V0-P1:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V0-P2:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V0-P3:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V1-P0:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V1-P1:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V1-P2:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V2-P0:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V2-P1:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000
          V3-P0:
            dw2_swing_sel:      0x00000000, dw7_n_scalar:       0x00000000, dw4_cursor_coeff:   0x00000000,
            dw4_post_cursor_2:  0x00000000, dw4_post_cursor_1:  0x00000000, rcomp_scalar:       0x00000000,
            rterm_select:       0x00000000, tap3_disable:       0x00000000, tap2_disable:       0x00000000,
            cursor_program:     0x00000000, coeff_polarity:     0x00000000

BR,
Michał

[1] https://lore.kernel.org/intel-gfx/20260813160918.918857-1-michal.grzelak@intel.com
[2] https://lore.kernel.org/igt-dev/20260702182619.3973788-1-michal.grzelak@intel.com

---
Changelog:
v11->v12
- don't set vspeo->num_entries per PHY/platform
- set vspeo->num_entries once (Sashiko)
- free allocated vspeo->entries (Sashiko)
- don't refer to 1st table as fallback for non-DP for C10 (Sashiko)
- check for low vswing eDP for EHL (Sashiko)
- reverse order of indices for JSL (Sashiko)

v10->v11
- remove no-longer-relevant check for NULL devdata (Jani)
- initialize local variables at declaration block (Jani)
- branch with 'else` instead of initializing twice (Jani)
- use blank line before 'return` (Jani)

v9->v10
- drop deconstifying default tables (Suraj, Jani)
- add separate non-const field for `entries` caching
- cache `entries` into const field after data is overwritten (Jani)
- call dedicated VS/PE-O vfunc

v8->v9 
- init vspeo before using it
- deconstify intel_ddi_buf_trans_entry in separate commit

v7->v8
- remove comments (Suraj)
- add check for LT (Suraj)

v6->v7
- parse VBT#57 before blocks dependant on child device list (Jani)
- expand VS/PE-O acronym in debug logging (Jani)
- handle VS/PE-O's VBT details in intel_bios_* functions (Jani)
- remove vspeo's cast to (void *) (Jani)
- check devdata->vspeo if VS/PE-O was requested
- call encoder->get_buf_trans() once (Jani)
- return NULL from intel_bios_get_* when using default (Jani)
- validate VS/PE-O in intel_bios.c (Jani)
- inline *_get_vspeo_buf_trans()
- remove temporarily LT

v5->v6
- check if devdata is not NULL
- add Bspec (Suraj)
- remove drm_WARN_ONCE (Suraj)
- pass default VS/PE tables to LT's BIOS accessor (Suraj)
- set txswing & _level from default VS/PE tables (Suraj)
- add helper checking if VS/PE-O has been allocated (Suraj)

v4->v5
- set devdata->vspeo->num_entries in intel_bios.c
- add if-ladder instead of function pointer
- blend index computation with table parsing
- remove WARN and debug messages
- remove enums entirely
- add spaces around operators (Suraj)
- remove spaces after type casting (Suraj)
- remove INTEL_DISPLAY_STATE_WARN (Suraj)
- change funcs prefix from snps_ to mtl_ (Suraj)

v3->v4
- add Bspec (Suraj)
- remove unnecessary init of VS/PE-O metadata (Suraj)
- add helper for computing number of rows (Suraj)
- fix num_rows's type (Jani, Suraj)
- declare num_rows (Suraj)
- change debug message when requesting VS/PE-O (Suraj)
- stick to solely changing VBT data into current structures (Jani)
- move iterator declaration to declaration block (Suraj)

v2->v3
- remove unnecessary braces from if block (Suraj)
- return -EINVAL instead of -1 (Suraj)

Michał Grzelak (8):
  drm/i915/bios: search for VBT #57 by default
  drm/i915/bios: store VBT #57's metadata in intel_vbt_data
  drm/i915/bios: print VS/PE-O port info
  drm/i915/bios: de/allocate VS/PE-O buffers for each port
  drm/i915/buf_trans: add vfunc for VS/PE-O
  drm/i915: override Snps's VS/PE when requested
  drm/i915: override Combo's VS/PE when requested
  drm/i915/bios: remove VS/PE-O warning

 drivers/gpu/drm/i915/display/intel_bios.c     | 262 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_bios.h     |  14 +
 .../drm/i915/display/intel_ddi_buf_trans.c    |  87 +++++-
 .../gpu/drm/i915/display/intel_display_core.h |   7 +
 .../drm/i915/display/intel_display_types.h    |   3 +
 5 files changed, 359 insertions(+), 14 deletions(-)

-- 
2.45.2

