Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70644C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 19:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB9988A72;
	Thu, 20 Mar 2025 19:32:52 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE6410E6C0;
 Thu, 20 Mar 2025 19:32:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_Mesa_GPU_?=
 =?utf-8?q?hang_replay_tool_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Mar 2025 19:32:51 -0000
Message-ID: <174249917183.60761.517003205974504396@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250320192831.3842138-1-matthew.brost@intel.com>
In-Reply-To: <20250320192831.3842138-1-matthew.brost@intel.com>
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

Series: Add support for Mesa GPU hang replay tool (rev3)
URL   : https://patchwork.freedesktop.org/series/143868/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 40423b7f190f9b463b45ec50b433a642d0b08360
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Mar 20 12:28:31 2025 -0700

    drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
    
    Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which sets the exec
    queue default state to user data passed in. The intent is for a Mesa
    tool to use this replay GPU hangs.
    
    v2:
     - Enable the flag DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
     - Fix the page size math calculation to avoid a crash
    
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 8fad36bea0fabfbcaec658039f98c833425252e7 drm-intel
b628e54960b5 drm/xe: Add properties line to VM snapshot capture
171890daa355 drm/xe: Add "null_sparse" type to VM snap properties
ac3d2390fdaa drm/xe: Add mem_region to properties line in VM snapshot capture
7372f9cf51a6 drm/xe: Add pat_index to properties line in VM snapshot capture
e8d966d44747 drm/xe: Add cpu_caching to properties line in VM snapshot capture
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
[<vma address>]: <permissions>|<type>|mem_region=0x%x|pat_index=%d|cpu_caching=%d

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
445c8b436561 drm/xe: Add VM.uapi_flags to VM snapshot capture
c382f666a8cf drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
9f997864955f drm/xe: Add replay_offset and replay_length lines to LRC HWCTX snapshot
40423b7f190f drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE


