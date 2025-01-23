Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CFBC02181
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 01:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A90210E3D3;
	Thu, 23 Jan 2025 01:24:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE8710E784;
 Thu, 23 Jan 2025 01:24:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_support_for_Mesa_GPU_?=
 =?utf-8?q?hang_replay_tool?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 01:24:48 -0000
Message-ID: <173759548897.3314796.9806674770470340612@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250123011513.362430-1-matthew.brost@intel.com>
In-Reply-To: <20250123011513.362430-1-matthew.brost@intel.com>
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

Series: Add support for Mesa GPU hang replay tool
URL   : https://patchwork.freedesktop.org/series/143868/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2b96c84f02e5606bd8da8c768938e14eefe3e9d1
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jan 22 17:15:13 2025 -0800

    drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
    
    Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which sets the exec
    queue default state to user data passed in. The intent is for a Mesa
    tool to use this replay GPU hangs.
    
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch db7cf8d52a41001ea2780cf834fed3dc490343d2 drm-intel
e33d6b2f83e9 drm/xe: Add properties line to VM snapshot capture
58c9c0f72755 drm/xe: Add "null_sparse" type to VM snap properties
ba2ddcdd4d66 drm/xe: Add mem_region to properties line in VM snapshot capture
b084a83ca8af drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
490e705be3dc drm/xe: Add replay_offset and replay_length lines to LRC HWCTX snapshot
2b96c84f02e5 drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE


