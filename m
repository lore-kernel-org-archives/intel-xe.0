Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B42EB64D9
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 00:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D18410E35A;
	Wed, 28 Jun 2023 00:19:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 36C0010E012;
 Wed, 28 Jun 2023 00:19:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 33F63AADD7;
 Wed, 28 Jun 2023 00:19:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 28 Jun 2023 00:19:48 -0000
Message-ID: <168791158820.32037.4761604206302583828@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230628001642.3170070-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230628001642.3170070-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/slpc=3A_Start_SLPC_before_GuC_submission_on_reset?=
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

Series: drm/xe/slpc: Start SLPC before GuC submission on reset
URL   : https://patchwork.freedesktop.org/series/119953/
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
commit 696bbc36794a659071dcbd39c96d05f5f8778e73
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Jun 27 17:16:42 2023 -0700

    drm/xe/slpc: Start SLPC before GuC submission on reset
    
    The SLPC code has a strict 5ms timeout from when the start command is
    queued to when we expect the reply to appear in memory. This works if
    the CT channel is empty, but if the channel is busy there might be an
    extra delay that causes the process to exceeded the timeout. We see
    this issue when a reset occurs while userspace keeps submitting,
    because the submission code is re-enabled first and it will start using
    the channel to service those submissions.
    To fix this, we can simply start SLPC before re-enabling submission.
    This has also the benefit of not allowing submissions to go through with
    an uninitialized SLPC.
    
    Reference: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/375
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch abdb420db479bae28a2abd7ba2c66229b7e8cb77 drm-intel
696bbc367 drm/xe/slpc: Start SLPC before GuC submission on reset
-:17: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'Reference:', use 'Link:' instead
#17: 
Reference: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/375

-:38: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#38: FILE: drivers/gpu/drm/xe/xe_guc.c:808:
+	return xe_guc_submit_start(guc);;

total: 0 errors, 2 warnings, 0 checks, 15 lines checked


