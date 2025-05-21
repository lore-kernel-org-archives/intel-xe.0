Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A594C2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 15:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A1110FA47;
	Wed, 21 May 2025 15:57:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B01F10FA0D;
 Wed, 21 May 2025 15:57:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Create_a_task_info?=
 =?utf-8?q?_option_for_wedge_events?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 May 2025 15:57:29 -0000
Message-ID: <174784304917.10286.12887547475914441673@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250521153323.935974-1-andrealmeid@igalia.com>
In-Reply-To: <20250521153323.935974-1-andrealmeid@igalia.com>
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

Series: drm: Create a task info option for wedge events
URL   : https://patchwork.freedesktop.org/series/149332/
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
commit 31e76dc1708a823bacf3fe8faccf756db7a0069d
Author: André Almeida <andrealmeid@igalia.com>
Date:   Wed May 21 12:33:23 2025 -0300

    drm/amdgpu: Make use of drm_wedge_task_info
    
    To notify userspace about which task (if any) made the device get in a
    wedge state, make use of drm_wedge_task_info parameter, filling it with
    the task PID and name.
    
    Signed-off-by: André Almeida <andrealmeid@igalia.com>
+ /mt/dim checkpatch 2d8dc23f1e6ce72fe9e45fd0db71076d90a4e1aa drm-intel
0048782eb049 drm: Create a task info option for wedge events
-:84: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#84: FILE: drivers/gpu/drm/drm_drv.c:567:
+	char *envp[] = { event_string, NULL, NULL, NULL };

-:92: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'info->pid >= 0'
#92: FILE: drivers/gpu/drm/drm_drv.c:589:
+	if (info && ((info->comm && info->comm[0] != '\0')) && (info->pid >= 0)) {

total: 0 errors, 1 warnings, 1 checks, 101 lines checked
61cf01402432 drm/doc: Add a section about "Task information" for the wedge API
31e76dc1708a drm/amdgpu: Make use of drm_wedge_task_info


