Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993B5C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 22:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BC310E25B;
	Fri, 17 Jan 2025 22:15:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C21510E25B;
 Fri, 17 Jan 2025 22:15:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dmc=5Fwl=3A_Intr?=
 =?utf-8?q?oduce_debugfs_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 22:15:11 -0000
Message-ID: <173715211143.893178.8822298804884552280@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117220747.87927-1-gustavo.sousa@intel.com>
In-Reply-To: <20250117220747.87927-1-gustavo.sousa@intel.com>
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

Series: drm/i915/dmc_wl: Introduce debugfs interface
URL   : https://patchwork.freedesktop.org/series/143695/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8f97b80ac65525f29524b7635330abc6e9e58ccf
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Jan 17 19:06:55 2025 -0300

    drm/i915/dmc_wl: Enable the debugfs only with enable_dmc_wl_debugfs=1
    
    We use a spinlock to protect DMC wakelock debugfs data, since it is also
    accessed by the core DMC wakelock logic. Taking the spinlock when the
    debugfs is not in use introduces a small but unnecessary penalty.
    
    Since the debugfs functionality is only expected to be used for, uh,
    debugging sessions, let's protect it behind a module parameter
    enable_dmc_wl_debugfs. That way, we only take the lock if the feature
    was enabled in the first place.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4 drm-intel
e695cd7c6aa7 drm/i915/dmc_wl: Pass offset instead of reg to range table iterator
967f0c2eefea drm/i915/dmc_wl: Add debugfs for untracked offsets
-:106: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#106: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 340 lines checked
1de8ab53cc6c drm/i915/dmc_wl: Add extra_ranges debugfs
8f97b80ac655 drm/i915/dmc_wl: Enable the debugfs only with enable_dmc_wl_debugfs=1
-:27: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#27: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:137:
+intel_display_param_named_unsafe(enable_dmc_wl_debugfs, bool, 0400,
+	"Enable DMC wakelock debugfs"

total: 0 errors, 0 warnings, 1 checks, 60 lines checked


