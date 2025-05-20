Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E23C3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 08:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFCB10E4EA;
	Tue, 20 May 2025 08:22:31 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F89E10E4EA;
 Tue, 20 May 2025 08:22:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_Program?=
 =?utf-8?q?_double_buffered_LUT_registers_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 May 2025 08:22:29 -0000
Message-ID: <174772934964.3915.14366735614331742073@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520075537.4074010-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20250520075537.4074010-1-chaitanya.kumar.borah@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/display: Program double buffered LUT registers (rev8)
URL   : https://patchwork.freedesktop.org/series/142436/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f0956872f477a622b4ff848dac159d6c518fdd20
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Tue May 20 13:25:37 2025 +0530

    drm/i915: Disable updating of LUT values during vblank
    
    Do not schedule vblank worker for LUT update if the registers are
    double buffered
    
    v2: Do not schedule the worker at all (Ville)
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Reviewed-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch 33cee98498d898245e2d985b0369161dfdff7d47 drm-intel
d6413c4f17c3 drm/i915/dsb: Extract intel_dsb_ins_align()
965f62d304fc drm/i915/dsb: Extract assert_dsb_tail_is_aligned()
e392bbe6dbc3 drm/i915/dsb: Extract intel_dsb_{head,tail}()
2e40d1a6718d drm/i915/dsb: Implement intel_dsb_gosub()
51ecb1d52fec drm/i915/dsb: add intel_dsb_gosub_finish()
39deb80453c5 drm/i915/dsb: Add support for GOSUB interrupt
bd72a0d3f64d drm/i915: s/dsb_color_vblank/dsb_color
a71b7c9ae647 drm/i915/display: use GOSUB to program double buffered LUT registers
1e5c9db4d16d drm/i915: Program DB LUT registers before vblank
819b242b73fa drm/i915/color: Do not pre-load LUTs with DB registers
f0956872f477 drm/i915: Disable updating of LUT values during vblank


