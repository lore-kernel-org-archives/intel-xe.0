Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22196C10F15
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 12:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07E311A410;
	Thu, 25 Apr 2024 12:22:11 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7C911A410;
 Thu, 25 Apr 2024 12:22:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_skip_error_capt?=
 =?utf-8?q?ure_when_exec_queue_is_killed?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Apr 2024 12:22:11 -0000
Message-ID: <171404773104.1650497.1057659934732356244@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240425122931.1851837-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240425122931.1851837-1-tejas.upadhyay@intel.com>
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

Series: drm/xe: skip error capture when exec queue is killed
URL   : https://patchwork.freedesktop.org/series/132906/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7d93ba0167616a98b17ea9f53e6da57c92d87900
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Apr 25 17:59:31 2024 +0530

    drm/xe: skip error capture when exec queue is killed
    
    When user closes exec queue soon after job submission,
    we are generating error coredump. Instead check if
    exec queue is killed during job timeout then skip
    error coredump capture, just free the job and return
    proper scheduler state.
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 972738688dc48cf04e4aec9a39ef4703c78aa17b drm-intel
7d93ba016761 drm/xe: skip error capture when exec queue is killed
-:23: ERROR:TRAILING_WHITESPACE: trailing whitespace
#23: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:974:
+^Iif (exec_queue_killed(q) || $

total: 1 errors, 0 warnings, 0 checks, 9 lines checked


