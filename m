Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0A1CD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 22:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B4510F9EA;
	Mon,  8 Jun 2026 22:42:17 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6454310F9EA;
 Mon,  8 Jun 2026 22:42:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Don=27t_whitelist_OA_regi?=
 =?utf-8?q?sters_unconditionally_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jun 2026 22:42:16 -0000
Message-ID: <178095853640.54354.16064028634106892566@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
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

Series: Don't whitelist OA registers unconditionally (rev2)
URL   : https://patchwork.freedesktop.org/series/166809/
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
commit 2fcf32539142e7965e9aa416dad4c65be68bcebe
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Mon Jun 8 15:36:24 2026 -0700

    drm/xe/rtp: Ensure locking/ref counting for OA whitelists
    
    Since multiple OA streams might be open in parallel on a gt, ensure that
    proper locking is in place. Also ensure that OA registers are whitelisted
    when the first OA stream is open and de-whitelisted after the last OA
    stream is closed.
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch da64ed1114e5dad3d82db1a1925fc82c3c593745 drm-intel
882a689cb613 drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA whitelists
25a68b887995 drm/xe/rtp: Maintain OA whitelists separately
-:74: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#74: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:108:
+static const struct xe_rtp_table_sr oa_whitelist = XE_RTP_TABLE_SR(

total: 0 errors, 0 warnings, 1 checks, 50 lines checked
ac83539540df drm/xe/rtp: Keep track of non-OA nonpriv slots
91a7614c6ada drm/xe/rtp: Generalize whitelist_apply_to_hwe
4254dac0b472 drm/xe/rtp: Save OA nonpriv registers to register save/restore lists
b0b7b020cb9f drm/xe/rtp: Toggle 'deny' bit to (de-)whitelist OA regs
993b320d05ae drm/xe/rtp: (De-)whitelist OA registers for all hwe's for a gt
07805fd5b851 drm/xe/oa: (De-)whitelist OA registers on OA stream open/release
2fcf32539142 drm/xe/rtp: Ensure locking/ref counting for OA whitelists


