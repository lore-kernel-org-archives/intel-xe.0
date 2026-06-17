Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A28CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 11:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B400B10EFB3;
	Wed, 17 Jun 2026 11:11:18 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B808B10EFB3;
 Wed, 17 Jun 2026 11:11:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Structured_RAS_?=
 =?utf-8?q?error_logging_infrastructure_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jun 2026 11:11:17 -0000
Message-ID: <178169467775.89426.8499248721568565006@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
In-Reply-To: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
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

Series: drm/xe: Structured RAS error logging infrastructure (rev3)
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
commit 6df66520c1d16299c9345600a09b22c984143055
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Date:   Wed Jun 17 16:17:15 2026 +0530

    drm/xe: use XE_RAS_WEDGED macro in xe_device_declare_wedged
    
    Replace the open-coded drm_err() call with XE_RAS_WEDGED()
    macro so that wedge events are reported through the unified
    RAS/SIG logging path with a consistent format, CPER severity,
    and errno.
    
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 1f1e03ee0c160129c336e9301aeed557f406153b drm-intel
f4f11020d39d drm/xe: Add error Signature IDs for RAS logging
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 29 lines checked
c994e6fd52f4 drm/xe: Add RAS logging helpers
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 178 lines checked
6df66520c1d1 drm/xe: use XE_RAS_WEDGED macro in xe_device_declare_wedged


