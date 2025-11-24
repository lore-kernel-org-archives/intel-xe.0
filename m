Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF1DCFD31C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 17:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF3189364;
	Mon, 24 Nov 2025 17:48:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1D189364;
 Mon, 24 Nov 2025 17:48:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_fbcon=3A_Reschedule_curso?=
 =?utf-8?q?r_worker_if_try_lock_fails_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Nov 2025 17:48:42 -0000
Message-ID: <176400652238.21836.16635254508224585867@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251121083138.468339-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251121083138.468339-1-chaitanya.kumar.borah@intel.com>
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

Series: fbcon: Reschedule cursor worker if try lock fails (rev2)
URL   : https://patchwork.freedesktop.org/series/157885/
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
commit 6c92e7fe818a21417bf8294b58f7ef4c1d58e8cb
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Fri Nov 21 14:01:38 2025 +0530

    fbcon: Reschedule cursor worker if try lock fails
    
    With the removal of timer implementation for cursor work[1],
    the cursor delayed work does not get rescheduled if it fails
    to acquire the console lock.
    
    This has been found to cause issue during the resume sequence
    of the IGT test kms_fbcon_fbt@fbc-suspend[2]. The test expects
    cursor blinking to start after the system resumes from suspend
    state.
    
     fbcon_resumed()
             redraw_screen()
                     set_cursor()
                             fb_flashcursor()
    
    But the cursor work fails to acuire the lock and it never gets
    rescheduled unless some other function comes in and invokes
    fbcon_add_cursor_work() which adds the worker to the queue.
    From empirical evidence this happens if we tweak the console
    log level.
    
    Push the cursor work to the queue if we fail to acquire the lock.
    
    v2:
     - s/opt/par
    
    [1] commit 3b0fb6ab25dd ("fbcon: Use delayed work for cursor")
    [2] https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17565/re-mtlp-11/igt@kms_fbcon_fbt@fbc-suspend.html
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 1313821419324cad5cc45003ce9e2aaf1e1fed75 drm-intel
6c92e7fe818a fbcon: Reschedule cursor worker if try lock fails
-:32: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#32: 
[2] https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17565/re-mtlp-11/igt@kms_fbcon_fbt@fbc-suspend.html

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


