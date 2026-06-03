Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727BACD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 23:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FDF112494;
	Wed,  3 Jun 2026 23:12:07 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96761112494;
 Wed,  3 Jun 2026 23:12:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Vswing_/_Preemphasis_Over?=
 =?utf-8?q?ride_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Jun 2026 23:12:05 -0000
Message-ID: <178052832561.41956.7739914154358321160@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260603230544.1993439-1-michal.grzelak@intel.com>
In-Reply-To: <20260603230544.1993439-1-michal.grzelak@intel.com>
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

Series: Vswing / Preemphasis Override (rev2)
URL   : https://patchwork.freedesktop.org/series/167757/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fda92ca39470ace54f4e574b80e22500f5b6fa84
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Thu Jun 4 01:05:44 2026 +0200

    drm/i915/bios: remove VS/PE-O warning
    
    There is not much use of warning when port asks to override default
    VS/PE since it is already logged. Remove drm_WARN() and child_device
    from print_ddi_port() since drm_WARN() was the only user of it.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 740ac771c704c3fa301d7c99952028fe579c7f0b drm-intel
fd8d4984ec24 drm/i915/bios: search for VBT #57 by default
cd5efa935f31 drm/i915/bios: store VBT #57's metadata in intel_vbt_data
b7438f5ee365 drm/i915/bios: print VS/PE-O port info
6988c9fcb065 drm/i915/bios: de/allocate VS/PE-O buffer for each port
c290402eaf2b drm/i915: override LT's VS/PE when requested
f3019ccac1f8 drm/i915: override Snps's VS/PE when requested
45ceec8cdb99 drm/i915: override Combo's VS/PE when requested
-:71: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#71: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3950:
+	for (level = 0; level < num_rows; level++) {
+

total: 0 errors, 0 warnings, 1 checks, 115 lines checked
fda92ca39470 drm/i915/bios: remove VS/PE-O warning


