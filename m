Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300B1C0015E
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 03:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB3310E306;
	Tue,  1 Aug 2023 03:30:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D7FF10E307;
 Tue,  1 Aug 2023 03:30:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 390CCAA3D8;
 Tue,  1 Aug 2023 03:30:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 01 Aug 2023 03:30:28 -0000
Message-ID: <169086062822.10128.4240061981919082939@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230801032748.434509-1-matthew.brost@intel.com>
In-Reply-To: <20230801032748.434509-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DR?=
 =?utf-8?q?M_scheduler_changes_for_upstream?=
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

Series: DRM scheduler changes for upstream
URL   : https://patchwork.freedesktop.org/series/121654/
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
commit 0e7bf9828c93f142343cac263dd7c8cf1a77fc6e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Jul 31 20:27:48 2023 -0700

    fixup! drm/sched: Convert drm scheduler to use a work queue rather than kthread
+ /mt/dim checkpatch d74e8f8407bc922b04ba50e8f4e888bedb31330a drm-intel
573935229 fixup! drm/sched: Submit job before starting TDR
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:80: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 65 lines checked
0e7bf9828 fixup! drm/sched: Convert drm scheduler to use a work queue rather than kthread
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:130: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 113 lines checked


