Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C208C3DA6E
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jan 2024 00:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF8910E087;
	Sat,  6 Jan 2024 00:56:55 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5AF10E08D;
 Sat,  6 Jan 2024 00:56:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fixes_for_settting_exec?=
 =?utf-8?q?=5Fqueue_priority?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Sat, 06 Jan 2024 00:56:54 -0000
Message-ID: <170450261412.57734.5791421417744604925@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240105190440.9908-1-brian.welty@intel.com>
In-Reply-To: <20240105190440.9908-1-brian.welty@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Fixes for settting exec_queue priority
URL   : https://patchwork.freedesktop.org/series/128279/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ceb02757000f675742315d0833e0bbd265ac0b03
Author: Brian Welty <brian.welty@intel.com>
Date:   Fri Jan 5 11:04:40 2024 -0800

    drm/xe: Fix modifying exec_queue priority in xe_migrate_init
    
    After exec_queue has been created, we cannot simply modify q->priority.
    This needs to be done by the backend via q->ops.  However in this case,
    it would be more efficient to simply pass a flag when creating the
    exec_queue and set the desired priority upfront during queue creation.
    
    To that end: new flag EXEC_QUEUE_FLAG_HIGH_PRIORITY is introduced.
    The priority field is moved to be with other scheduling properties and
    is now exec_queue.sched_props.priority. This is no longer set to initial
    value by the backend, but is now set within __xe_exec_queue_create().
    
    Fixes: b4eecedc75c1 ("drm/xe: Fix potential deadlock handling page faults")
    Signed-off-by: Brian Welty <brian.welty@intel.com>
+ /mt/dim checkpatch cca0607b6f6a21bee68c092ed7ad9f3322e54523 drm-intel
957ac8dcf drm/xe: Fix guc_exec_queue_set_priority
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#10: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 9 lines checked
ceb027570 drm/xe: Fix modifying exec_queue priority in xe_migrate_init
-:16: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'b4eecedc75c1', maybe rebased or not pulled?
#16: 
Fixes: b4eecedc75c1 ("drm/xe: Fix potential deadlock handling page faults")

total: 0 errors, 1 warnings, 0 checks, 83 lines checked


