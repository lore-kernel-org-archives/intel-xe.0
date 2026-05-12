Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15345CD4F21
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 20:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CF810E29D;
	Tue, 12 May 2026 20:01:50 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B5110E29D;
 Tue, 12 May 2026 20:01:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_cold_reset_reco?=
 =?utf-8?q?very_method_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 May 2026 20:01:49 -0000
Message-ID: <177861610929.64493.13510752671962612009@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512132614.1793083-7-mallesh.koujalagi@intel.com>
In-Reply-To: <20260512132614.1793083-7-mallesh.koujalagi@intel.com>
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

Series: Introduce cold reset recovery method (rev4)
URL   : https://patchwork.freedesktop.org/series/163428/
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
commit a79d5bd93252dadcce27348c33a788bc65101732
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Date:   Tue May 12 18:56:20 2026 +0530

    drm/xe: Suppress Surprise Link Down on non-hotplug device
    
    If the slot is not hotplug capable, pcie_suppress_surprise_link_down()
    masks the Surprise Link Down bit (PCI_ERR_UNC_SURPDN) in the USP's AER
    Uncorrectable Error Mask register before punit_error_handler()
    triggers the cold reset.
    
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 161329a551bb5ebd34524b781cd7fb3d84b994be drm-intel
a5017d918bd9 Introduce Xe Uncorrectable Error Handling
-:251: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#251: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1175 lines checked
da3ec0ffd6c7 drm: Add DRM_WEDGE_RECOVERY_COLD_RESET recovery method
6dabe53ee46a drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET recovery method
e3fceda65961 drm/xe: Handle PUNIT errors by requesting cold-reset recovery
a79d5bd93252 drm/xe: Suppress Surprise Link Down on non-hotplug device


