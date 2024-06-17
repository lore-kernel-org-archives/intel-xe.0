Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCA0C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 15:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705C610E40C;
	Mon, 17 Jun 2024 15:00:20 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCC010E40B;
 Mon, 17 Jun 2024 15:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_FW_guard_class?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jun 2024 15:00:18 -0000
Message-ID: <171863641884.99140.11796949449179968048@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240617143430.641-1-michal.wajdeczko@intel.com>
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

Series: FW guard class
URL   : https://patchwork.freedesktop.org/series/134958/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 668dd1f4af6faff4e2e43db52498cad45087c4a9
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Jun 17 16:34:30 2024 +0200

    drm/xe: Use new FW guard in xe_pat.c
    
    Start using new FW guard to minimize risk of leaking force-wake
    references.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch c00c421245452a4a82a893cd2e1bfd9663a761fb drm-intel
e2b4b475362c drm/xe: Introduce force-wake guard class
-:99: WARNING:NEW_TYPEDEFS: do not add new typedefs
#99: FILE: drivers/gpu/drm/xe/xe_force_wake_types.h:96:
+typedef struct xe_force_wake_guard class_xe_fw_t;

total: 0 errors, 1 warnings, 0 checks, 74 lines checked
57eebd6cf5a2 drm/xe: Use new FW guard in xe_mocs.c
668dd1f4af6f drm/xe: Use new FW guard in xe_pat.c


