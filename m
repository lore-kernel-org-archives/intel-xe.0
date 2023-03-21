Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDE8C76195
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 22:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC61F10E0A7;
	Tue, 21 Mar 2023 22:08:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 71EDE10E090;
 Tue, 21 Mar 2023 22:08:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5A8F8A0003;
 Tue, 21 Mar 2023 22:08:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 21 Mar 2023 22:08:34 -0000
Message-ID: <167943651434.18679.13280164790202879090@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
In-Reply-To: <20230321220527.595462-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Unit_tests_for_rtp_and_GT_wa/tuning?=
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

Series: Unit tests for rtp and GT wa/tuning
URL   : https://patchwork.freedesktop.org/series/115463/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 1ae4dd9e82429e075aa7121404b06ce170da5848
Author:     Matthew Auld <matthew.auld@intel.com>
AuthorDate: Tue Mar 21 11:44:07 2023 +0000
Commit:     Matthew Auld <matthew.auld@intel.com>
CommitDate: Tue Mar 21 14:03:29 2023 +0000

    drm/xe/buddy: add compatible and intersects hooks
    
    Copy this from i915. We need .compatible for vram -> vram transfers, so
    they don't just get nooped by ttm, if need to move something from
    mappable to non-mappble or vice versa. The .intersects is needed for
    eviction, to determine if a victim resource is worth eviction. e.g if we
    need mappable space there is no point in evicting a resource that has
    zero mappable pages.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
=== git am output follows ===
Applying: drm/xe: Add basic unit tests for rtp
Applying: drm/xe: Extract function to initialize xe->info
Applying: drm/xe: Move test infra out of xe_pci.[ch]
Applying: drm/xe: Use XE_KUNIT for symbol namespace
Applying: drm/xe: Generalize fake device creation
Applying: drm/xe/reg_sr: Save errors for kunit integration
Applying: drm/xe: Add test for GT workarounds and tunings


