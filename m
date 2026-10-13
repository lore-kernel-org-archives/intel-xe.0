Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D12CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 21:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBBD10F9CD;
	Tue, 13 Oct 2026 21:24:56 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F8410F9CD;
 Tue, 13 Oct 2026 21:24:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_SKL=5FDSSM_/_DE=5FCAP_cle?=
 =?utf-8?q?anup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Oct 2026 21:24:55 -0000
Message-ID: <179192669562.20764.14672952214981676466@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
In-Reply-To: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
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

Series: SKL_DSSM / DE_CAP cleanup
URL   : https://patchwork.freedesktop.org/series/176081/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7f51c29d2c506f21051a4d2ca3947c04f6e2d03d
Author: Michał Grzelak <michal.grzelak@linux.intel.com>
Date:   Tue Oct 13 22:47:04 2026 +0200

    drm/i915/display: log eDP TC support and DBuf overlap detection state
    
    edp_tc_support and dbuf_overlap_detection are only fields of display's
    runtime info which state is not logged. Show it along other fields.
    
    While at it, move dbuf_overlap_detection to have display runtime info's
    fields in alphabetical order.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
+ /mt/dim checkpatch 83b6bc1390606facc1c0426727905f9fcd75836d drm-intel
74681c07e60a drm/i915/display: clean SKL_DSSM register macros
9b8e73b4f552 drm/i915/3dlut: disable 3D LUT for pre-GLK
030a03d453f0 drm/i915/3dlut: log 3D LUT's status
11fa53daa4f3 drm/i915/3dlut: disable 3D LUT if unsupported
7f51c29d2c50 drm/i915/display: log eDP TC support and DBuf overlap detection state
-:27: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#27: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:2009:
+	drm_printf(p, "has_dbuf_overlap_detection: %s\n", str_yes_no(runtime->has_dbuf_overlap_detection));

total: 0 errors, 1 warnings, 0 checks, 20 lines checked


