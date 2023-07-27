Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF9AC001DC
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 18:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B135C10E03F;
	Thu, 27 Jul 2023 18:51:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C066010E03F;
 Thu, 27 Jul 2023 18:51:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BCE52A882E;
 Thu, 27 Jul 2023 18:51:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 27 Jul 2023 18:51:11 -0000
Message-ID: <169048387177.19795.10250231142024344371@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230727174107.532275-1-matthew.brost@intel.com>
In-Reply-To: <20230727174107.532275-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Call_=5F=5Fguc=5Fengine=5Ffini=5Fasync_direct_for_KERNE?=
 =?utf-8?q?L_engines?=
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

Series: drm/xe: Call __guc_engine_fini_async direct for KERNEL engines
URL   : https://patchwork.freedesktop.org/series/121464/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bbfdd2504538c3221aa0685b1532f1e7a027800e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jul 27 10:41:07 2023 -0700

    drm/xe: Call __guc_engine_fini_async direct for KERNEL engines
    
    Usually we call __guc_engine_fini_async via a worker as the engine fini
    can be done from within the GPU scheduler which creates a circular
    dependency without a worker. Kernel engines are fini'd at driver unload
    (not from within the GPU scheduler) so it is safe to directly call
    __guc_engine_fini_async.
    
    Reported-by: Oded Gabbay <ogabbay@kernel.org>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 580f19a11f9c682fa0f2c6b89578ae07226c3793 drm-intel
bbfdd2504 drm/xe: Call __guc_engine_fini_async direct for KERNEL engines
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

total: 0 errors, 1 warnings, 0 checks, 33 lines checked


