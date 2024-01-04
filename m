Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028CCC47074
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 15:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E7B10E49A;
	Thu,  4 Jan 2024 15:43:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B10F10E49A;
 Thu,  4 Jan 2024 15:43:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Refactor_xe=5Fexec=5Fqueu?=
 =?utf-8?q?e=5Fcreate_to_fix_user_extensions_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Thu, 04 Jan 2024 15:43:12 -0000
Message-ID: <170438299230.20586.10857246590978444002@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240103184408.17844-1-brian.welty@intel.com>
In-Reply-To: <20240103184408.17844-1-brian.welty@intel.com>
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

Series: Refactor xe_exec_queue_create to fix user extensions (rev2)
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
commit 617d369df56b823c12c9941f7b49e0d70ffc3093
Author: Brian Welty <brian.welty@intel.com>
Date:   Wed Jan 3 10:44:08 2024 -0800

    drm/xe: Remove set_job_timeout_ms() from exec_queue_ops
    
    This function is no longer used as the job_timeout is now
    updated prior to calling queue_ops.init().
    
    Signed-off-by: Brian Welty <brian.welty@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
6628d003b drm/xe: Refactor __xe_exec_queue_create()
df63619d8 drm/xe: Add exec_queue.sched_props.job_timeout_ms
6db446e81 drm/xe: Add exec_queue.sched_props.priority
b0e469acd drm/xe: Finish refactoring of exec_queue_create
617d369df drm/xe: Remove set_job_timeout_ms() from exec_queue_ops


