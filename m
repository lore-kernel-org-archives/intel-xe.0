Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16142C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 10:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B996010E1F0;
	Tue, 29 Jul 2025 10:03:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4693F10E1F0;
 Tue, 29 Jul 2025 10:03:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_use_drm-=3Ede?=
 =?utf-8?q?bugfs=5Froot_when_creating_debugfs_files_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Jul 2025 10:03:07 -0000
Message-ID: <175378338728.195916.8120694127841081716@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1753782998.git.jani.nikula@intel.com>
In-Reply-To: <cover.1753782998.git.jani.nikula@intel.com>
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

Series: drm/i915: use drm->debugfs_root when creating debugfs files (rev2)
URL   : https://patchwork.freedesktop.org/series/150106/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2b5857cf8e615237ea56762508594ab0bf82350f
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Jul 29 12:57:39 2025 +0300

    drm/i915: use drm->debugfs_root for creating debugfs files
    
    Since commit 0b30d57acafc ("drm/debugfs: rework debugfs directory
    creation v5") we should be using drm->debugfs_root instead of
    minor->debugfs_root for creating debugfs files.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch c2d04724123c8df9ecec874f1db3007540c264e6 drm-intel
45e359d65c68 drm/i915/display: use drm->debugfs_root for creating debugfs files
c381a6f414d6 drm/i915/gvt: use drm->debugfs_root for creating debugfs files
2b5857cf8e61 drm/i915: use drm->debugfs_root for creating debugfs files
-:54: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR' are not preferred. Consider using octal permissions '0400'.
#54: FILE: drivers/gpu/drm/i915/i915_debugfs.c:730:
+	debugfs_create_file("i915_forcewake_user", S_IRUSR, debugfs_root,

-:61: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
#61: FILE: drivers/gpu/drm/i915/i915_debugfs.c:733:
+		debugfs_create_file(i915_debugfs_files[i].name, S_IRUGO | S_IWUSR,

total: 0 errors, 2 warnings, 0 checks, 100 lines checked


