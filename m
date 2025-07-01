Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A359C83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 13:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0952310E086;
	Tue,  1 Jul 2025 13:15:39 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2902B10E086;
 Tue,  1 Jul 2025 13:15:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Relax_VF/PF_version_negot?=
 =?utf-8?q?iation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Jul 2025 13:15:38 -0000
Message-ID: <175137573816.123904.9978030600728040589@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250701125646.1568-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250701125646.1568-1-michal.wajdeczko@intel.com>
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

Series: Relax VF/PF version negotiation (rev3)
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
commit 0911f71313b820e3cce58063f6eab977cc6c154c
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jul 1 14:56:46 2025 +0200

    drm/xe/vf: Store negotiated VF/PF ABI version at device level
    
    There is no need to maintain PF ABI version on per-GT level.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch d41bbdd6e5ee20cb3bf706fce73919e5a99904b3 drm-intel
c44dd116680b drm/xe: Combine PF and VF device data into union
e0780025beb4 drm/xe: Move PF and VF device types to separate headers
-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 111 lines checked
f6dc4d190135 drm/xe: Introduce xe_tile_is_root helper
1a85bdf79f04 drm/xe: Introduce xe_gt_is_main_type helper
2a7abdbbc8cc drm/xe/pf: Expose basic info about VFs in debugfs
36ac918e775f drm/xe/pf: Stop requiring VF/PF version negotiation on every GT
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 788 lines checked
0911f71313b8 drm/xe/vf: Store negotiated VF/PF ABI version at device level


