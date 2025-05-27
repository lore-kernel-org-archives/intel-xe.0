Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E727AC54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 04:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF9B10E0B8;
	Tue, 27 May 2025 04:09:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B75810E0ED;
 Tue, 27 May 2025 04:08:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/oa=3A_Expose_media?=
 =?utf-8?q?_OA_units_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 04:08:59 -0000
Message-ID: <174831893946.22623.15599614673187544339@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250516204750.2135983-2-ashutosh.dixit@intel.com>
In-Reply-To: <20250516204750.2135983-2-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Expose media OA units (rev2)
URL   : https://patchwork.freedesktop.org/series/149133/
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
commit 245d6ce81e2fa5a934ea4b2de481f17bc22d9920
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri May 16 13:47:51 2025 -0700

    drm/xe/oa: Expose media OA units
    
    On Xe2+ platforms, media engines are attached to "SCMI" OA media (OAM)
    units. One or two SCMI OAM units might be present on a platform. In
    addition there is another OAM unit for global events, called
    OAM-SAG. Performance metrics for media workloads can be obtained from these
    OAM units, similar to OAG.
    
    Expose these OAM units for userspace to use. OAM-SAG is exposed as an OA
    unit without any attached engines.
    
    Bspec: 70819, 67103, 63844, 72572, 74476, 61284
    
    v2: Fix xe_gt_WARN_ON in __hwe_oam_unit for < 12.7 platforms
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
245d6ce81e2f drm/xe/oa: Expose media OA units
-:154: WARNING:TYPO_SPELLING: 'implemenation' may be misspelled - perhaps 'implementation'?
#154: FILE: drivers/gpu/drm/xe/xe_oa.c:2637:
+	/* Needed for OAM implemenation here */
 	                  ^^^^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 140 lines checked


