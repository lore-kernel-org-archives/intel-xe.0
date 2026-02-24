Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531FBEFB819
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 08:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031D610E517;
	Tue, 24 Feb 2026 08:57:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9851310E517;
 Tue, 24 Feb 2026 08:57:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/debugfs=3A_Add_i?=
 =?utf-8?q?915=5Fextended=5Fwakeup=5Ftimeout_debugfs_entry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Bilal" <mohammed.bilal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Feb 2026 08:57:33 -0000
Message-ID: <177192345360.280493.2608160825007853301@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260224083734.2947885-1-mohammed.bilal@intel.com>
In-Reply-To: <20260224083734.2947885-1-mohammed.bilal@intel.com>
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

Series: drm/i915/debugfs: Add i915_extended_wakeup_timeout debugfs entry
URL   : https://patchwork.freedesktop.org/series/162050/
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
commit 3f1c371b9c50ab81d63686ed8bccfd54e91f6a97
Author: Mohammed Bilal <mohammed.bilal@intel.com>
Date:   Tue Feb 24 14:07:34 2026 +0530

    drm/i915/debugfs: Add i915_extended_wakeup_timeout debugfs entry
    
    Add debugfs interface to expose extended wakeup timeout information for
    DP connectors. This shows whether a retimer is present, the
    current mode (transparent vs non-transparent), and the wakeup timeout
    value in milliseconds.
    This helps verify whether the extended wakeup timeout is functioning
    as expected.
    
    Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
+ /mt/dim checkpatch 941c811e3df7426f70c740ba9c70801fa0772eb0 drm-intel
3f1c371b9c50 drm/i915/debugfs: Add i915_extended_wakeup_timeout debugfs entry
-:76: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#76: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:1365:
+		if (!ret) {
+

total: 0 errors, 0 warnings, 1 checks, 90 lines checked


