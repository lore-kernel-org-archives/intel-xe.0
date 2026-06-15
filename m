Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF76CD98DE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 23:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8762C10E68A;
	Mon, 15 Jun 2026 23:41:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED5610E563;
 Mon, 15 Jun 2026 23:41:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Don=27t_whitelist_OA_regi?=
 =?utf-8?q?sters_unconditionally_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Jun 2026 23:41:45 -0000
Message-ID: <178156690577.81567.704600052262198971@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260615224227.34880-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260615224227.34880-1-ashutosh.dixit@intel.com>
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

Series: Don't whitelist OA registers unconditionally (rev4)
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
commit 4d85ae4ba934f56a843c39d8c5eb5bd9e53b909d
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Mon Jun 15 15:42:27 2026 -0700

    drm/xe/rtp: Ensure locking/ref counting for OA whitelists
    
    Since multiple OA streams might be open in parallel on a gt, ensure that
    proper locking is in place. Also ensure that OA registers are whitelisted
    when the first OA stream is open and de-whitelisted after the last OA
    stream is closed.
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch c585a0a7e48a48aca80f7c0acb7294c7bf301bb7 drm-intel
d124651dd2c8 drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA whitelists
ec44f4986e6e drm/xe/rtp: Maintain OA whitelists separately
-:74: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#74: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:108:
+static const struct xe_rtp_table_sr oa_whitelist = XE_RTP_TABLE_SR(

total: 0 errors, 0 warnings, 1 checks, 50 lines checked
7e38563088b2 drm/xe/rtp: Keep track of non-OA nonpriv slots
ccc4f836a023 drm/xe/rtp: Generalize whitelist_apply_to_hwe
22d91fdbc1d5 drm/xe/rtp: Save OA nonpriv registers to register save/restore lists
b126d67e9029 drm/xe/rtp: Toggle 'deny' bit to (de-)whitelist OA regs
fafe4e9f7584 drm/xe/rtp: (De-)whitelist OA registers for all hwe's for a gt
86080ea892f3 drm/xe/oa: (De-)whitelist OA registers on OA stream open/release
4d85ae4ba934 drm/xe/rtp: Ensure locking/ref counting for OA whitelists


