Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634C4E83855
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 06:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1317A10E442;
	Tue, 17 Feb 2026 06:00:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA0C10E441;
 Tue, 17 Feb 2026 06:00:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/displayid=3A_reduce_D?=
 =?utf-8?q?isplayID_checksum_error_logging_to_debug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vidya Srinivas" <vidya.srinivas@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Feb 2026 06:00:43 -0000
Message-ID: <177130804354.258529.12753287732833887542@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260217055002.245099-1-vidya.srinivas@intel.com>
In-Reply-To: <20260217055002.245099-1-vidya.srinivas@intel.com>
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

Series: drm/displayid: reduce DisplayID checksum error logging to debug
URL   : https://patchwork.freedesktop.org/series/161686/
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
commit 2218b5b178a2a83afe1935701d5f44d60b0dc04b
Author: Vidya Srinivas <vidya.srinivas@intel.com>
Date:   Tue Feb 17 11:20:01 2026 +0530

    drm/displayid: reduce DisplayID checksum error logging to debug
    
    The patch "drm/displayid: add quirk to ignore DisplayID
    checksum errors" introduced a mechanism to bypass checksum validation
    for certain panels. However, even when ignoring the error, the code
    continues to log a DRM_NOTE.
    
    On affected hardware, this results in persistent "DisplayID checksum
    invalid" messages in the system log. This noise often misleads users
    into thinking there is a critical hardware failure or a functional
    regression, despite the quirk successfully handling the issue.
    
    Downgrade the log level from DRM_NOTE to DRM_DEBUG_KMS. This keeps
    the diagnostic information available for kernel developers while
    silencing the unnecessary warning for end-users.
    
    Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
+ /mt/dim checkpatch d8a2676d71fe28909d78ed9707ca9c6871ff1e14 drm-intel
2218b5b178a2 drm/displayid: reduce DisplayID checksum error logging to debug
-:33: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#33: FILE: drivers/gpu/drm/drm_displayid.c:73:
+		DRM_DEBUG_KMS("DisplayID checksum invalid, remainder is %d%s\n", csum,
 			 ignore_checksum ? " (ignoring)" : "");

total: 0 errors, 0 warnings, 1 checks, 8 lines checked


