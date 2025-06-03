Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35333C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 07:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FB710E5A4;
	Tue,  3 Jun 2025 07:56:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BB710E1C6;
 Tue,  3 Jun 2025 07:56:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Handle_Firmware_reported_?=
 =?utf-8?q?Hardware_Errors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 07:56:15 -0000
Message-ID: <174893737568.42648.18088751705622370279@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603081409.1509709-1-riana.tauro@intel.com>
In-Reply-To: <20250603081409.1509709-1-riana.tauro@intel.com>
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

Series: Handle Firmware reported Hardware Errors
URL   : https://patchwork.freedesktop.org/series/149756/
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
commit fdc05b0c10777047982a5578a151c0f05bfe2a0d
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Tue Jun 3 13:44:00 2025 +0530

    drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors
    
    Add support to handle CSC firmware reported errors. When CSC firmware
    errors are encoutered, a error interrupt is received by the GFX device as
    a MSI interrupt.
    
    Device Source control registers indicates the source of the error as CSC
    The HEC error status register indicates that the error is firmware reported
    Depending on the type of error, the error cause is written to the HEC
    Firmware error register.
    
    On encountering such CSC firmware errors, the graphics device is
    non-recoverable from driver context. The only way to recover from these
    errors is firmware flash. The device is then wedged and userspace is
    notified with a drm uevent
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch ca1365e3f2388040c758942fcdf3d046016cd649 drm-intel
28557d7a85c9 drm: Add a firmware flash method to device wedged uevent
82350e17c799 drm/xe: Add a helper function to set recovery method
e420ef398dbb drm/xe: Add support to handle hardware errors
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 174 lines checked
fdc05b0c1077 drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors


