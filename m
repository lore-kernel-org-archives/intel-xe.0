Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C641C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 01:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6A810E157;
	Fri, 24 Mar 2023 01:52:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0064310E157;
 Fri, 24 Mar 2023 01:52:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ED5D4A7DFF;
 Fri, 24 Mar 2023 01:52:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Fri, 24 Mar 2023 01:52:22 -0000
Message-ID: <167962274293.30854.467608996820296811@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230324012329.1195977-1-matthew.brost@intel.com>
In-Reply-To: <20230324012329.1195977-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Use_fast_virtual_copy_engine_for_migrate_engine_on?=
 =?utf-8?q?_PVC_=28rev2=29?=
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

Series: drm/xe: Use fast virtual copy engine for migrate engine on PVC (rev2)
URL   : https://patchwork.freedesktop.org/series/115575/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit b21af01dbac717cd5ff86a7b9806225e82e9f323
Author:     Matthew Brost <matthew.brost@intel.com>
AuthorDate: Mon Mar 20 13:58:36 2023 -0700
Commit:     Matthew Brost <matthew.brost@intel.com>
CommitDate: Thu Mar 23 15:47:07 2023 -0700

    drm/xe: Fix potential deadlock handling page faults
    
    Within a class the GuC will hault scheduling if the head of the queue
    can't be scheduled the queue will block. This can lead to deadlock if
    BCS0-7 all have faults and another engine on BCS0-7 is at head of the
    GuC scheduling queue as the migration engine used to fix tthe fault will
    be blocked. To work around this set the migration engine to the highest
    priority when servicing page faults.
    
    v2 (Maarten): Set priority to kernel once at creation
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Brian Welty <brian.welty@intel.com>
=== git am output follows ===
Applying: drm/xe: Use fast virtual copy engine for migrate engine on PVC


