Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C71C677C4
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 15:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B788310E69A;
	Wed, 11 Jun 2025 15:41:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02F210E69A;
 Wed, 11 Jun 2025 15:41:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_use_drm-=3Ede?=
 =?utf-8?q?bugfs=5Froot_when_creating_debugfs_files?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Jun 2025 15:41:03 -0000
Message-ID: <174965646374.68250.10766924221030482832@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1749653354.git.jani.nikula@intel.com>
In-Reply-To: <cover.1749653354.git.jani.nikula@intel.com>
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

Series: drm/i915: use drm->debugfs_root when creating debugfs files
URL   : https://patchwork.freedesktop.org/series/150106/
State : warning

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
commit 4cf6797905375910cc7454cbe94fd9aa84a667b5
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Jun 11 17:51:16 2025 +0300

    drm/i915: use drm->debugfs_root for creating debugfs files
    
    Since commit 0b30d57acafc ("drm/debugfs: rework debugfs directory
    creation v5") we should be using drm->debugfs_root instead of
    minor->debugfs_root for creating debugfs files.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch f57bafbaa0afbf3d806650a26740caf623e7ca51 drm-intel
68129305c749 drm/i915/display: use drm->debugfs_root for creating debugfs files
d1df49e931a7 drm/i915/gvt: use drm->debugfs_root for creating debugfs files
4cf679790537 drm/i915: use drm->debugfs_root for creating debugfs files
-:54: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR' are not preferred. Consider using octal permissions '0400'.
#54: FILE: drivers/gpu/drm/i915/i915_debugfs.c:730:
+	debugfs_create_file("i915_forcewake_user", S_IRUSR, debugfs_root,

-:61: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
#61: FILE: drivers/gpu/drm/i915/i915_debugfs.c:733:
+		debugfs_create_file(i915_debugfs_files[i].name, S_IRUGO | S_IWUSR,

total: 0 errors, 2 warnings, 0 checks, 100 lines checked


