Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12038C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 20:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA2E10E4B7;
	Mon, 12 May 2025 20:41:06 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF09410E4B1;
 Mon, 12 May 2025 20:41:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Create_an_app_info?=
 =?utf-8?q?_option_for_wedge_events_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 20:41:05 -0000
Message-ID: <174708246577.71634.10408141917243224573@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512203437.989894-1-andrealmeid@igalia.com>
In-Reply-To: <20250512203437.989894-1-andrealmeid@igalia.com>
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

Series: drm: Create an app info option for wedge events (rev3)
URL   : https://patchwork.freedesktop.org/series/145636/
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
commit 850d6e9972c621c4cd46eccd53db782dfc3a7385
Author: André Almeida <andrealmeid@igalia.com>
Date:   Mon May 12 17:34:37 2025 -0300

    drm/amdgpu: Make use of drm_wedge_app_info
    
    To notify userspace about which app (if any) made the device get in a
    wedge state, make use of drm_wedge_app_info parameter, filling it with
    the app PID and name.
    
    Signed-off-by: André Almeida <andrealmeid@igalia.com>
+ /mt/dim checkpatch 7958e22a62e9dd7cb706d0a271ccbe3f82275f17 drm-intel
d1b294dc96df drm: Create an app info option for wedge events
-:76: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#76: FILE: drivers/gpu/drm/drm_drv.c:565:
+	char *envp[] = { event_string, NULL, NULL, NULL };

total: 0 errors, 1 warnings, 0 checks, 94 lines checked
a3b9522e886b drm/doc: Add a section about "App information" for the wedge API
850d6e9972c6 drm/amdgpu: Make use of drm_wedge_app_info


