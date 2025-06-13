Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4D9C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7CE10E527;
	Fri, 13 Jun 2025 19:21:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED96210E4AC;
 Fri, 13 Jun 2025 19:21:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Create_a_task_info?=
 =?utf-8?q?_option_for_wedge_events_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 19:21:55 -0000
Message-ID: <174984251596.78545.4267947333858614425@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613184348.1761020-1-andrealmeid@igalia.com>
In-Reply-To: <20250613184348.1761020-1-andrealmeid@igalia.com>
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

Series: drm: Create a task info option for wedge events (rev2)
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
commit 2367d766a594558add76622491dd566aa60ca87a
Author: André Almeida <andrealmeid@igalia.com>
Date:   Fri Jun 13 15:43:48 2025 -0300

    drm/amdgpu: Make use of drm_wedge_task_info
    
    To notify userspace about which task (if any) made the device get in a
    wedge state, make use of drm_wedge_task_info parameter, filling it with
    the task PID and name.
    
    Signed-off-by: André Almeida <andrealmeid@igalia.com>
+ /mt/dim checkpatch 4d016d6e602638e0ebc3895331224e057508c07a drm-intel
cd74716ebc6c drm: amdgpu: Create amdgpu_vm_print_task_info()
b130b63bd360 drm: Create a task info option for wedge events
-:86: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#86: FILE: drivers/gpu/drm/drm_drv.c:568:
+	char *envp[] = { event_string, NULL, NULL, NULL };

-:94: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'info->pid >= 0'
#94: FILE: drivers/gpu/drm/drm_drv.c:590:
+	if (info && (info->comm[0] != '\0') && (info->pid >= 0)) {

total: 0 errors, 1 warnings, 1 checks, 102 lines checked
6b6fcf9cf02c drm/doc: Add a section about "Task information" for the wedge API
60675e990cc9 drm: amdgpu: Use struct drm_wedge_task_info inside of struct amdgpu_task_info
-:25: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#25: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1789:
+			seq_printf(m, "pid:%d\tProcess:%s ----------\n", ti->task.pid, ti->process_name);

-:180: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#180: FILE: drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c:363:
+				  KFD_EVENT_FMT_PROCESS(task_info->task.pid,
+				  task_info->task.comm));

total: 0 errors, 1 warnings, 1 checks, 119 lines checked
2367d766a594 drm/amdgpu: Make use of drm_wedge_task_info


