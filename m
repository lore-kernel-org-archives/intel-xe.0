Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA44F3D311
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 15:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8423D10EC15;
	Thu,  5 Mar 2026 15:44:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD5110EC15;
 Thu,  5 Mar 2026 15:44:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Xe_driver_asynchronous_no?=
 =?utf-8?q?tification_mechanism?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Mar 2026 15:44:05 -0000
Message-ID: <177272544582.322277.6429439272005821718@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260304125220.165004-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260304125220.165004-1-thomas.hellstrom@linux.intel.com>
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

Series: Xe driver asynchronous notification mechanism
URL   : https://patchwork.freedesktop.org/series/162577/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 57fc74537672651e31616fa65c377e90f98c42ba
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Mar 4 13:52:20 2026 +0100

    drm/xe: Add watch_queue-based device event notification
    
    Add a watch_queue notification channel tied to struct xe_vm so that
    userspace can subscribe to asynchronous GPU device events via the
    general kernel notification mechanism.
    
    Introduce DRM_IOCTL_XE_WATCH_QUEUE to let userspace subscribe a
    notification pipe (opened with pipe2(O_NOTIFICATION_PIPE)) to the device
    event stream.  Embed the watch_id field (0-255) in the WATCH_INFO_ID
    field of every notification, allowing multiple watches to share a single
    pipe and be told apart by the reader.
    
    Deliver notifications as struct drm_xe_watch_notification records, with
    type always set to WATCH_TYPE_DRM_XE_NOTIFY and subtype drawn from enum
    drm_xe_watch_event.  Define DRM_XE_WATCH_EVENT_DEVICE_RESET as the
    first event, to be posted by the GPU reset path to inform userspace that
    in-flight work has been lost.  Expose xe_watch_queue_post_event() as the
    in-kernel posting API.
    
    Add event definitions in a separate uapi header, <drm/xe_drm_events.h>.
    The main reason is that the header needs to include <linux/watch_queue.h>
    which in turn includes <linux/fcntl.h> which may conflict with the
    system <fcntl.h>. Hence user-space must pay special attention when including
    this file.
    
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 9565ad1c312903452467b9f685c59e2f47f512e5 drm-intel
1c086979e576 watch_queue: Add a DRM_XE_NOTIFY watch type and export init_watch()
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#16: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#16: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 36 lines checked
57fc74537672 drm/xe: Add watch_queue-based device event notification
-:29: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#29: 
system <fcntl.h>. Hence user-space must pay special attention when including

-:32: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#32: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:32: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#32: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:187: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#187: 
new file mode 100644

-:256: WARNING:ALLOC_WITH_SIZEOF: Prefer kzalloc_obj over kzalloc with sizeof
#256: FILE: drivers/gpu/drm/xe/xe_watch_queue.c:65:
+	watch = kzalloc(sizeof(*watch), GFP_KERNEL | __GFP_ACCOUNT);

-:349: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#349: FILE: include/uapi/drm/xe_drm.h:130:
+#define DRM_IOCTL_XE_WATCH_QUEUE		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_WATCH_QUEUE, struct drm_xe_watch_queue)

total: 1 errors, 5 warnings, 0 checks, 366 lines checked


