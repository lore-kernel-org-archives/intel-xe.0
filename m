Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BC6CCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 09:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B8C89E2A;
	Fri, 16 Oct 2026 09:01:48 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD0489E2A;
 Fri, 16 Oct 2026 09:01:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Isolate_permane?=
 =?utf-8?q?ntly_wedged_devices_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Oct 2026 09:01:47 -0000
Message-ID: <179214130717.34319.289986298750630348@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261016085527.311660-1-arvind.yadav@intel.com>
In-Reply-To: <20261016085527.311660-1-arvind.yadav@intel.com>
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

Series: drm/xe: Isolate permanently wedged devices (rev2)
URL   : https://patchwork.freedesktop.org/series/176267/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c2d7752040439a84e60ae6841e8ceaf19c4915b5
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Fri Oct 16 14:25:27 2026 +0530

    drm/xe: Isolate permanently wedged devices
    
    DO NOT REVIEW
    
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch db553ec4f89142f8416ae559bfedc0b03b0b5ae7 drm-intel
c2d775204043 drm/xe: Isolate permanently wedged devices
-:1064: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1064: FILE: drivers/gpu/drm/xe/xe_guc_tlb_inval.c:92:
+			CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt),
+						    XE_FW_GT);

total: 0 errors, 0 warnings, 1 checks, 1450 lines checked


