Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB210C001DF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 10:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF49C10E678;
	Thu, 13 Jul 2023 10:37:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F3EE10E676;
 Thu, 13 Jul 2023 10:37:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 86E3EAADD2;
 Thu, 13 Jul 2023 10:37:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 13 Jul 2023 10:37:43 -0000
Message-ID: <168924466354.14984.14053541392264278609@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230713094125.326709-5-matthew.auld@intel.com>
In-Reply-To: <20230713094125.326709-5-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5B1/4=5D_drm/xe/selftests=3A_hold_rpm_?=
 =?utf-8?b?Zm9yIGV2aWN0X3Rlc3RfcnVuX2RldmljZSgp?=
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

Series: series starting with [1/4] drm/xe/selftests: hold rpm for evict_test_run_device()
URL   : https://patchwork.freedesktop.org/series/120661/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: ccde55837 drm/xe: handle TLB invalidations from CT fast-path
=== git am output follows ===
Applying: drm/xe/selftests: hold rpm for evict_test_run_device()
Applying: drm/xe/selftests: hold rpm for ccs_test_migrate()
Applying: drm/xe/selftests: restart GT after xe_bo_restore_kernel()
Applying: drm/xe: add missing bulk_move reset


