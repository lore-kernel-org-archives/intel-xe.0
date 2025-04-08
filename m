Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910D8C36010
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 20:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5519510E74A;
	Tue,  8 Apr 2025 20:24:11 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5E810E74D;
 Tue,  8 Apr 2025 20:24:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Revert_=22libata=3A_Downg?=
 =?utf-8?q?rade_unsupported_feature_warnings_to_notifications=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 20:24:10 -0000
Message-ID: <174414385084.49899.616703974348775439@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250408194331.11046-1-lucas.demarchi@intel.com>
In-Reply-To: <20250408194331.11046-1-lucas.demarchi@intel.com>
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

Series: Revert "libata: Downgrade unsupported feature warnings to notifications"
URL   : https://patchwork.freedesktop.org/series/147428/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f13f20b0cfd4ceae42275f412214c1d5c3777fdc
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Apr 8 12:43:31 2025 -0700

    Revert "libata: Downgrade unsupported feature warnings to notifications"
    
    This reverts commit 3f412047c54e28ecd50c10bdcec698f166c861e8.
    
    Tentative removal from topic/core-for-CI.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 1951437999630d299a063863fb92d235dd8dc3d1 drm-intel
f13f20b0cfd4 Revert "libata: Downgrade unsupported feature warnings to notifications"
-:23: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#23: FILE: drivers/ata/libata-core.c:2182:
+			ata_dev_warn(dev,
 				"ATA Identify Device Log not supported\n");

-:52: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#52: FILE: drivers/ata/libata-core.c:2941:
+				ata_dev_warn(dev,
 	"supports DRM functions and may not be fully accessible\n");

-:60: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#60: FILE: drivers/ata/libata-core.c:2948:
+				ata_dev_warn(dev,
 	"supports DRM functions and may not be fully accessible\n");

total: 0 errors, 0 warnings, 3 checks, 52 lines checked


