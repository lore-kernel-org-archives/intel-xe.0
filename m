Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AA9C43602
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDF810E0F6;
	Tue, 30 Jun 2026 13:12:21 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B0D10E0F6;
 Tue, 30 Jun 2026 13:12:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Structured_RAS_?=
 =?utf-8?q?error_logging_infrastructure_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Jun 2026 13:12:20 -0000
Message-ID: <178282514034.133156.14995153346073878777@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
In-Reply-To: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
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

Series: drm/xe: Structured RAS error logging infrastructure (rev4)
URL   : https://patchwork.freedesktop.org/series/168333/
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
commit 9a95d12e48286e2810e870556a2d6fd26d502613
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Date:   Tue Jun 30 17:25:09 2026 +0530

    drm/xe: Replace critical drm_err log with xe_ras_log_probe
    
    Replace the drm_err() call with xe_ras_log_probe
    starting from the xe_pci_probe considering the only considering the
    init paths for the object such mmio, pcode, pci etc. are fall under
    the xe_ras_log_probe() category.
    
    Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 7f7679b1095483510f6a8404e46154c706576577 drm-intel
47d2b3043d6a drm/xe: Add SIG_IDs for RAS error logging
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 136 lines checked
13b8611e7c69 drm/xe: Add RAS logging helpers
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 134 lines checked
0f8670a3d869 drm/xe: use xe_ras_log_wedged macro in xe_device_declare_wedged
6f241091c83f drm/xe: Use RAS logging to report survivability mode
9a95d12e4828 drm/xe: Replace critical drm_err log with xe_ras_log_probe


