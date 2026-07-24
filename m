Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F07C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 21:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE43610F3F1;
	Fri, 24 Jul 2026 21:30:33 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D548610F3F1;
 Fri, 24 Jul 2026 21:30:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Changes_for_Xe3?=
 =?utf-8?q?p=5FHPM_media_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jul 2026 21:30:32 -0000
Message-ID: <178492863286.225757.15300117021890171724@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260724212454.2823014-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260724212454.2823014-1-ashutosh.dixit@intel.com>
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

Series: drm/xe: Changes for Xe3p_HPM media (rev2)
URL   : https://patchwork.freedesktop.org/series/171088/
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
commit ecca340ae14d5cefca91342fea1a91b59a59cf66
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri Jul 24 14:24:54 2026 -0700

    drm/xe/oa: Extend OAM unit hwe assignment for new dGfx
    
    dGfx vecs hwe's for media version 35.00 and later follow the same
    assignment to OAM units as vcs engines.
    
    Bspec: 77977
    
    Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 03696c1dc9eabc0658baefcff8787dab48c89d93 drm-intel
a23bea422291 drm/xe/mcr: Take vcs1/vecs1 into account for first media slice
ecca340ae14d drm/xe/oa: Extend OAM unit hwe assignment for new dGfx
-:26: ERROR:SPACING: space prohibited before that close parenthesis ')'
#26: FILE: drivers/gpu/drm/xe/xe_oa.c:2581:
+		 MEDIA_VERx100(gt_to_xe(hwe->gt)) < 3500 )

total: 1 errors, 0 warnings, 0 checks, 14 lines checked


