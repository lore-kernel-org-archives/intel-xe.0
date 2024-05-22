Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB09C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 22:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D1310E00E;
	Wed, 22 May 2024 22:29:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE82910E00E;
 Wed, 22 May 2024 22:29:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Docouple_job_se?=
 =?utf-8?q?qno_and_lrc_seqno?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 May 2024 22:29:26 -0000
Message-ID: <171641696697.2168995.454502088644046955@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240522205250.1578514-1-matthew.brost@intel.com>
In-Reply-To: <20240522205250.1578514-1-matthew.brost@intel.com>
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

Series: drm/xe: Docouple job seqno and lrc seqno
URL   : https://patchwork.freedesktop.org/series/133939/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3c2ff6e378af9c22c25e02778963375bb57547e4
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed May 22 13:52:50 2024 -0700

    drm/xe: Docouple job seqno and lrc seqno
    
    Tightly coupling these seqno presents problems if alternative fences for
    jobs are used. Best to decouple these for correctness.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Matthew Brost <mathhew.brost@intel.com>
+ /mt/dim checkpatch b912a794bf8a370cde8be56c138f5c82de0dde8f drm-intel
3c2ff6e378af drm/xe: Docouple job seqno and lrc seqno
-:70: ERROR:CODE_INDENT: code indent should use tabs where possible
#70: FILE: drivers/gpu/drm/xe/xe_ring_ops.c:417:
+^I^I^I^I        xe_sched_job_lrc_seqno(job));$

-:203: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Matthew Brost <matthew.brost@intel.com>' != 'Signed-off-by: Matthew Brost <mathhew.brost@intel.com>'

total: 1 errors, 1 warnings, 0 checks, 145 lines checked


