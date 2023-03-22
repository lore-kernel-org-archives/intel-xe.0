Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C61C74A5B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB2010E95D;
	Wed, 22 Mar 2023 14:22:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C10110E95D;
 Wed, 22 Mar 2023 14:22:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 150F8A0169;
 Wed, 22 Mar 2023 14:22:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 22 Mar 2023 14:22:36 -0000
Message-ID: <167949495608.13421.7601934371035248123@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230322141936.297612-1-matthew.auld@intel.com>
In-Reply-To: <20230322141936.297612-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_uAPI_bits_for_small-bar?=
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

Series: uAPI bits for small-bar
URL   : https://patchwork.freedesktop.org/series/115515/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 94f34a97d723731486ed3a84ee9ec2e7a215d70f
Author:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
AuthorDate: Tue Feb 28 11:17:30 2023 +0100
Commit:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CommitDate: Wed Mar 22 13:43:39 2023 +0100

    drm/xe: Use atomic instead of mutex for xe_device_mem_access_ongoing
    
    xe_guc_ct_fast_path() is called from an irq context, and cannot lock
    the mutex used by xe_device_mem_access_ongoing().
    
    Fortunately it is easy to fix, and the atomic guarantees are good enough
    to ensure xe->mem_access.hold_rpm is set before last ref is dropped.
    
    As far as I can tell, the runtime ref in device access should be
    killable, but don't dare to do it yet.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
=== git am output follows ===
Applying: drm/xe/bo: support tiered vram allocation for small-bar
Applying: drm/xe/uapi: add the userspace bits for small-bar
Applying: drm/xe: fully turn on small-bar support


