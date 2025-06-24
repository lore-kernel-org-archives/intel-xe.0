Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51512C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 20:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A4B10E12F;
	Tue, 24 Jun 2025 20:37:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB4B10E12F;
 Tue, 24 Jun 2025 20:37:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Relax_VF/PF_version_negot?=
 =?utf-8?q?iation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Jun 2025 20:37:41 -0000
Message-ID: <175079746117.106099.11080468091915668943@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250624200923.1348-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250624200923.1348-1-michal.wajdeczko@intel.com>
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

Series: Relax VF/PF version negotiation
URL   : https://patchwork.freedesktop.org/series/150711/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8bc0599f5945870d5e0a1e9c9fc692e8aab76c0d
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jun 24 22:09:23 2025 +0200

    drm/xe/vf: Store negotiated VF/PF ABI version at device level
    
    There is no need to maintain PF ABI version on per-GT level.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch e8efdbd16eab3b11b9500cb343b29878f3349d74 drm-intel
2dcd9c493650 drm/xe: Combine PF and VF device data into union
92f0522913c2 drm/xe: Move PF and VF device types to separate headers
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 111 lines checked
447a72dfee28 drm/xe/pf: Expose basic info about VFs in debugfs
4dbc8f0f754a drm/xe/pf: Stop requiring VF/PF version negotiation on every GT
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 815 lines checked
8bc0599f5945 drm/xe/vf: Store negotiated VF/PF ABI version at device level


