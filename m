Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B42CA0EE1
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 05:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0890910E144;
	Fri, 30 Aug 2024 05:18:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF8510E144;
 Fri, 30 Aug 2024 05:18:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Fix_xe=5Fforce=5Fwak?=
 =?utf-8?q?e=5Fget=28=29_failure_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Aug 2024 05:18:27 -0000
Message-ID: <172499510738.850425.15436092421680390144@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
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

Series: Fix xe_force_wake_get() failure handling
URL   : https://patchwork.freedesktop.org/series/137982/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: d77e26a2d2f1 drm-tip: 2024y-08m-30d-01h-37m-46s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Error handling in xe_force_wake_get()
Applying: drm/xe: Ensure __must_check for xe_force_wake_get() return
Applying: drm/xe/gsc: call xe_force_wake_put() only if xe_force_wake_get() succeeds
Applying: drm/xe/gt: call xe_force_wake_put() only if xe_force_wake_get() succeeds
Applying: drm/xe/guc: call xe_force_wake_put() only if xe_force_wake_get() succeeds
Applying: drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
Applying: drm/xe/gt_tlb_invalidation_ggtt: Call xe_force_wake_put if xe_force_wake_get succeds
Applying: drm/xe: Change return type to void for xe_force_wake_put
Applying: drm/xe: forcewake debugfs open fails on xe_forcewake_get failure


