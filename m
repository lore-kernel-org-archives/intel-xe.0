Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB70CFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 06:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBF510E16A;
	Thu, 27 Nov 2025 06:02:42 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C57F10E16A;
 Thu, 27 Nov 2025 06:02:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_Mesa_GPU_?=
 =?utf-8?q?hang_replay_tool_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Nov 2025 06:02:40 -0000
Message-ID: <176422336043.32692.6189586089878694795@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251126185952.546277-1-matthew.brost@intel.com>
In-Reply-To: <20251126185952.546277-1-matthew.brost@intel.com>
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

Series: Add support for Mesa GPU hang replay tool (rev6)
URL   : https://patchwork.freedesktop.org/series/143868/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 86a190406f0857fc9d107b84043bb3ba2762ba33
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Nov 26 10:59:52 2025 -0800

    drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
    
    Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which sets the exec
    queue default state to user data passed in. The intent is for a Mesa
    tool to use this replay GPU hangs.
    
    v2:
     - Enable the flag DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
     - Fix the page size math calculation to avoid a crash
    v4:
     - Use vmemdup_user (Maarten)
     - Copy default state first into LRC, then replay state (Testing, Carlos)
    
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch e7a767430515c3a6e8aee91c2a68cba8b06fe884 drm-intel
7bbf1ffd257e drm/xe: Add properties line to VM snapshot capture
e4c79d30ffc9 drm/xe: Add "null_sparse" type to VM snap properties
26b55f7ccdd9 drm/xe: Add mem_region to properties line in VM snapshot capture
188880640ebc drm/xe: Add pat_index to properties line in VM snapshot capture
5ceb9a221d51 drm/xe: Add cpu_caching to properties line in VM snapshot capture
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
[<vma address>]: <permissions>|<type>|mem_region=0x%x|pat_index=%d|cpu_caching=%d

total: 0 errors, 1 warnings, 0 checks, 31 lines checked
1d4c5216f889 drm/xe: Add VM.uapi_flags to VM snapshot capture
2ac73c168ae5 drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
ffd13f75c632 drm/xe: Add replay_offset and replay_length lines to LRC HWCTX snapshot
86a190406f08 drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE


