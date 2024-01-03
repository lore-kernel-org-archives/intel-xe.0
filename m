Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DC9C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 14:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6293510E319;
	Wed,  3 Jan 2024 14:19:29 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7524810E319;
 Wed,  3 Jan 2024 14:19:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Refactor_xe=5Fexec=5Fqueu?=
 =?utf-8?q?e=5Fcreate_to_fix_user_extensions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Wed, 03 Jan 2024 14:19:28 -0000
Message-ID: <170429156847.82.6337223704936793419@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240102211731.6720-1-brian.welty@intel.com>
In-Reply-To: <20240102211731.6720-1-brian.welty@intel.com>
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

Series: Refactor xe_exec_queue_create to fix user extensions
URL   : https://patchwork.freedesktop.org/series/128128/
State : success

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
commit bcd3e69ab9af5d44cb7ed619d6826f962188d433
Author: Brian Welty <brian.welty@intel.com>
Date:   Tue Jan 2 13:17:31 2024 -0800

    drm/xe: Finish refactoring of exec_queue_create
    
    Setting of exec_queue user extensions is moved from the end of the ioctl
    function earlier, into __xe_exec_queue_alloc().
    This fixes bug in that the USM attributes for access counters were being
    applied too late, and effectively were ignored.
    
    However, in order to apply user extensions this early, we can no longer
    call q->ops functions.  Instead, make it more efficient. The user extension
    functions can simply update the q->sched_props values and they will be
    applied by the backend during q->ops->init().
    
    Signed-off-by: Brian Welty <brian.welty@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
0732589a8 drm/xe: Refactor __xe_exec_queue_create()
70ad80cd9 drm/xe: Add exec_queue.sched_props.job_timeout_ms
e4035b927 drm/xe: Add exec_queue.sched_props.priority
bcd3e69ab drm/xe: Finish refactoring of exec_queue_create


