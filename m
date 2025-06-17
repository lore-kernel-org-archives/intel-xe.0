Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B329C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 13:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E2310E65D;
	Tue, 17 Jun 2025 13:02:09 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEE210E660;
 Tue, 17 Jun 2025 13:02:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Create_a_task_info?=
 =?utf-8?q?_option_for_wedge_events_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Jun 2025 13:02:08 -0000
Message-ID: <175016532816.87049.17247239020843497451@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
In-Reply-To: <20250617124949.2151549-1-andrealmeid@igalia.com>
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

Series: drm: Create a task info option for wedge events (rev4)
URL   : https://patchwork.freedesktop.org/series/149332/
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
commit f1450e0cc9dd2cb66292eb9a7ec0ca537d1c5a0e
Author: André Almeida <andrealmeid@igalia.com>
Date:   Tue Jun 17 09:49:49 2025 -0300

    drm/amdgpu: Make use of drm_wedge_task_info
    
    To notify userspace about which task (if any) made the device get in a
    wedge state, make use of drm_wedge_task_info parameter, filling it with
    the task PID and name.
    
    Signed-off-by: André Almeida <andrealmeid@igalia.com>
+ /mt/dim checkpatch 95f0ac069cc2eee10b5d5e0ba67502ccea089de8 drm-intel
435096e5d727 drm: amdgpu: Allow NULL pointers at amdgpu_vm_put_task_info()
e1f5813609f9 drm: amdgpu: Create amdgpu_vm_print_task_info()
47231879768f drm: Create a task info option for wedge events
-:90: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#90: FILE: drivers/gpu/drm/drm_drv.c:568:
+	char *envp[] = { event_string, NULL, NULL, NULL };

-:103: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'info->pid >= 0'
#103: FILE: drivers/gpu/drm/drm_drv.c:592:
+	if (info && (info->comm[0] != '\0') && (info->pid >= 0)) {

total: 0 errors, 1 warnings, 1 checks, 116 lines checked
92ab33a51557 drm/doc: Add a section about "Task information" for the wedge API
e5250d0c0d09 drm: amdgpu: Use struct drm_wedge_task_info inside of struct amdgpu_task_info
-:26: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#26: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1789:
+			seq_printf(m, "pid:%d\tProcess:%s ----------\n", ti->task.pid, ti->process_name);

-:181: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#181: FILE: drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c:363:
+				  KFD_EVENT_FMT_PROCESS(task_info->task.pid,
+				  task_info->task.comm));

total: 0 errors, 1 warnings, 1 checks, 119 lines checked
f1450e0cc9dd drm/amdgpu: Make use of drm_wedge_task_info


