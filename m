Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8256C4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 20:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B0610E67E;
	Wed, 10 Jan 2024 20:44:14 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3375410E690;
 Wed, 10 Jan 2024 20:44:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Refactor_xe=5Fexec=5Fqueu?=
 =?utf-8?q?e=5Fcreate_to_fix_user_extensions_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Wed, 10 Jan 2024 20:44:13 -0000
Message-ID: <170491945321.270231.912548367882061821@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110173252.16707-1-brian.welty@intel.com>
In-Reply-To: <20240110173252.16707-1-brian.welty@intel.com>
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

Series: Refactor xe_exec_queue_create to fix user extensions (rev3)
URL   : https://patchwork.freedesktop.org/series/128128/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
414601bf14e77eeb048ecf6d1c25190801399524
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 289dfa22c72c848caa9f896ffeac4b33b82a5061
Author: Brian Welty <brian.welty@intel.com>
Date:   Wed Jan 10 09:32:52 2024 -0800

    drm/xe: Remove set_job_timeout_ms() from exec_queue_ops
    
    This function is no longer used as the job_timeout is now
    updated prior to calling queue_ops.init().
    
    Signed-off-by: Brian Welty <brian.welty@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch bb9e8031d2feb59becdea41e54e62f1bc47f3ef9 drm-intel
b401e30c6 drm/xe: Refactor __xe_exec_queue_create()
828964f61 drm/xe: Add exec_queue.sched_props.job_timeout_ms
01a9c39aa drm/xe: Finish refactoring of exec_queue_create
289dfa22c drm/xe: Remove set_job_timeout_ms() from exec_queue_ops


