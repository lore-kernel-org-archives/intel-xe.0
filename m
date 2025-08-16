Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED7ACA0EE4
	for <intel-xe@archiver.kernel.org>; Sat, 16 Aug 2025 03:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B684910E36F;
	Sat, 16 Aug 2025 03:42:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E49A10E2CC;
 Sat, 16 Aug 2025 03:42:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Document_GuC_submission_b?=
 =?utf-8?q?ackend_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 16 Aug 2025 03:42:17 -0000
Message-ID: <175531573743.241319.17300707936554445736@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250816033605.2551575-1-matthew.brost@intel.com>
In-Reply-To: <20250816033605.2551575-1-matthew.brost@intel.com>
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

Series: Document GuC submission backend (rev2)
URL   : https://patchwork.freedesktop.org/series/153000/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4f5ba139e2f6775b0fd2c305d6a528a32a69836c
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Aug 15 20:36:05 2025 -0700

    drm/xe/guc: Document GuC submission backend
    
    Add kernel-doc to xe_guc_submit.c describing the submission path,
    the per-queue single-threaded model with pause/resume, the driver shadow
    state machine and lost-H2G replay, job timeout handling, recovery flows
    (GT reset, PM resume, VF resume), and reclaim constraints.
    
    v2:
     - Mirror tweaks for clarity
     - Add new doc to Xe rst files
    
    Signed-off-by: <Matthew Brost matthew.brost@intel.com>
+ /mt/dim checkpatch 2dd142b066d35475dab4eff4052ca931c7c210fe drm-intel
4f5ba139e2f6 drm/xe/guc: Document GuC submission backend
-:15: ERROR:BAD_SIGN_OFF: Unrecognized email address: '<Matthew Brost matthew.brost@intel.com>'
#15: 
Signed-off-by: <Matthew Brost matthew.brost@intel.com>

-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

-:271: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Matthew Brost <matthew.brost@intel.com>'

total: 2 errors, 1 warnings, 0 checks, 239 lines checked


