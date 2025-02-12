Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEBDC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 17:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6797210E93C;
	Wed, 12 Feb 2025 17:08:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC3110E93C;
 Wed, 12 Feb 2025 17:08:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_support_for_Mesa_GPU_?=
 =?utf-8?q?hang_replay_tool_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 17:08:50 -0000
Message-ID: <173938013032.1363296.17818551364794632963@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250211022006.23234-1-carlos.santa@intel-corp-partner.google.com>
In-Reply-To: <20250211022006.23234-1-carlos.santa@intel-corp-partner.google.com>
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

Series: Add support for Mesa GPU hang replay tool (rev2)
URL   : https://patchwork.freedesktop.org/series/143868/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e97fcd429bfa458f2fce0158b3c77d957e4a034b
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Feb 10 18:20:06 2025 -0800

    drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
    
    Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which sets the exec
    queue default state to user data passed in. The intent is for a Mesa
    tool to use this replay GPU hangs.
    
    v2:
     - Enable the flag DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
     - Fix the page size math calculation to avoid a crash
    
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b9696aa14a67620661572e94f4141df2a4b6b5cd drm-intel
063b032cc28d drm/xe: Add properties line to VM snapshot capture
647c4da6bda1 drm/xe: Add "null_sparse" type to VM snap properties
30cabde527c5 drm/xe: Add mem_region to properties line in VM snapshot capture
facd90c48045 drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
2f775e3df2f1 drm/xe: Add replay_offset and replay_length lines to LRC HWCTX snapshot
e97fcd429bfa drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE


