Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB27ACDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 23:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB53210E346;
	Tue, 17 Oct 2023 23:21:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DA3F210E346;
 Tue, 17 Oct 2023 23:21:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D86BBAA915;
 Tue, 17 Oct 2023 23:21:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Tue, 17 Oct 2023 23:21:33 -0000
Message-ID: <169758489388.14379.15816715802141232545@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231017231843.1790243-5-matthew.d.roper@intel.com>
In-Reply-To: <20231017231843.1790243-5-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Em?=
 =?utf-8?q?it_SVG_3DSTATE_during_LRC_init?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Emit SVG 3DSTATE during LRC init
URL   : https://patchwork.freedesktop.org/series/125255/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0098d78acacdad7f12f8b3cdaa19f9b2c1c66e24
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Oct 17 16:18:47 2023 -0700

    drm/xe/xe2: Update SVG state handling
    
    As with DG2/MTL, Xe2 also fails to emit instruction headers for SVG
    state instructions if no explicit state has been set.  The SVG part of
    the LRC is nearly identical to DG2/MTL; the only change is that
    3DSTATE_DRAWING_RECTANGLE has been replaced by
    3DSTATE_DRAWING_RECTANGLE_FAST, so we can just re-use the same state
    table and handle that single instruction when we encounter it.
    
    Bspec: 65182
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 4d039d7be23937e2b498ed783aa5b0d8801b377b drm-intel
e6eda054e drm/xe: Prepare to emit non-register state while recording default LRC
-:78: ERROR:SPACING: space required before the open parenthesis '('
#78: FILE: drivers/gpu/drm/xe/xe_lrc.c:1132:
+	switch(GRAPHICS_VERx100(xe)) {

total: 1 errors, 0 warnings, 0 checks, 88 lines checked
9ea636cf7 drm/xe: Emit SVG state on RCS during driver load on DG2 and MTL
0098d78ac drm/xe/xe2: Update SVG state handling


