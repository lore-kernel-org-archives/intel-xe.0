Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2436AE909DE
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 17:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD1610E523;
	Tue, 17 Feb 2026 17:03:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FC510E51F;
 Tue, 17 Feb 2026 17:03:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Avoid_oops_on_illegal_VGA?=
 =?utf-8?q?_register_access?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <simon.richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Feb 2026 17:03:34 -0000
Message-ID: <177134781471.260105.782228647758033423@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260217165214.236482-1-Simon.Richter@hogyros.de>
In-Reply-To: <20260217165214.236482-1-Simon.Richter@hogyros.de>
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

Series: Avoid oops on illegal VGA register access
URL   : https://patchwork.freedesktop.org/series/161721/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2682c4e0d6717a1613bf522b0e269e694f4fe52a
Author: Simon Richter <Simon.Richter@hogyros.de>
Date:   Wed Feb 18 01:51:02 2026 +0900

    drm/i915: handle failure from vga_get
    
    This function returns an error code. If that code is non-zero, VGA decoding
    is undefined, and the lock counter has not been increased, so it is not valid
    to access registers or call vga_put afterwards.
    
    Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1824
+ /mt/dim checkpatch e66c64e4f12e55cad35c680f1e328a7c7ee92cab drm-intel
2682c4e0d671 drm/i915: handle failure from vga_get
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
is undefined, and the lock counter has not been increased, so it is not valid

-:23: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#23: FILE: drivers/gpu/drm/i915/display/intel_vga.c:116:
+static int __must_check intel_vga_get(struct intel_display *display,
+	bool mmio, bool *old_io_decode)

-:28: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#28: FILE: drivers/gpu/drm/i915/display/intel_vga.c:121:
 	if (mmio)
+	{

-:40: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#40: FILE: drivers/gpu/drm/i915/display/intel_vga.c:138:
 	if (display->platform.dgfx)
+	{

total: 2 errors, 1 warnings, 1 checks, 58 lines checked


