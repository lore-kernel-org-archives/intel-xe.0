Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4327CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 12:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A84E10E28C;
	Wed, 15 Oct 2025 12:10:40 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BA510E28C;
 Wed, 15 Oct 2025 12:10:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Update_auto-provisi?=
 =?utf-8?q?oning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 12:10:39 -0000
Message-ID: <176053023908.16680.2658261578794185851@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015091211.592-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251015091211.592-1-michal.wajdeczko@intel.com>
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

Series: PF: Update auto-provisioning
URL   : https://patchwork.freedesktop.org/series/155971/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d055e7b39769b433dc0a931fbba0a372e937b100
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Oct 15 11:12:09 2025 +0200

    drm/xe/pf: Allow to restore auto-provisioning mode
    
    After doing tweaks to the VFs provisioning we may want to restore
    back the auto-provisioning mode. Allow that unless VFs are still
    enabled. This can be also used to release all VFs resources.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 6a9cafb6723c47062cc4d593804d5bb69155d81a drm-intel
5447c799f763 drm/xe/pf: Promote VFs provisioning helpers
-:103: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#103: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 175 lines checked
1440b156c542 drm/xe/pf: Automatically provision VFs only in auto-mode
-:60: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#60: 
new file mode 100644

-:86: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#86: FILE: drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h:22:
+};
+static_assert(XE_SRIOV_PROVISIONING_MODE_AUTO == 0);

total: 0 errors, 1 warnings, 1 checks, 88 lines checked
f4d0d7ec4587 drm/xe/pf: Disable auto-provisioning if changed using debugfs
d055e7b39769 drm/xe/pf: Allow to restore auto-provisioning mode


