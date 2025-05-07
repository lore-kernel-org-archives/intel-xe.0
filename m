Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1154CC3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 21:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C663210E1CE;
	Wed,  7 May 2025 21:30:05 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C535910E1CE;
 Wed,  7 May 2025 21:30:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_Mesa_GPU_?=
 =?utf-8?q?hang_replay_tool_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 May 2025 21:30:04 -0000
Message-ID: <174665340480.57599.14084851509121762868@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250507201539.1316770-1-matthew.brost@intel.com>
In-Reply-To: <20250507201539.1316770-1-matthew.brost@intel.com>
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

Series: Add support for Mesa GPU hang replay tool (rev4)
URL   : https://patchwork.freedesktop.org/series/143868/
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
commit bcd6fc37f0d358656c5b8348642d6e8d6c6e9bc4
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed May 7 13:15:39 2025 -0700

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
+ /mt/dim checkpatch ca0305cadc2d34c8887b891b96226af17571b2a3 drm-intel
626551edc1ed drm/xe: Add properties line to VM snapshot capture
a62510daf5a2 drm/xe: Add "null_sparse" type to VM snap properties
99c9692b64a4 drm/xe: Add mem_region to properties line in VM snapshot capture
3eaab382c4ce drm/xe: Add pat_index to properties line in VM snapshot capture
c0526f8c3d72 drm/xe: Add cpu_caching to properties line in VM snapshot capture
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
[<vma address>]: <permissions>|<type>|mem_region=0x%x|pat_index=%d|cpu_caching=%d

total: 0 errors, 1 warnings, 0 checks, 31 lines checked
f19ce6ca94d2 drm/xe: Add VM.uapi_flags to VM snapshot capture
4383b7daf3d1 drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
fd0980570440 drm/xe: Add replay_offset and replay_length lines to LRC HWCTX snapshot
bcd6fc37f0d3 drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE


