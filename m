Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7D4C6FD19
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 13:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B884810E189;
	Thu, 16 Mar 2023 13:04:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 88C8B10E0FA;
 Thu, 16 Mar 2023 13:04:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8176FAADD2;
 Thu, 16 Mar 2023 13:04:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Thu, 16 Mar 2023 13:04:39 -0000
Message-ID: <167897187952.19097.9081406083854620784@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230316130125.1629081-1-francois.dugast@intel.com>
In-Reply-To: <20230316130125.1629081-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Split_code_between_common_and_platform_specific_=28rev3=29?=
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

Series: Split code between common and platform specific (rev3)
URL   : https://patchwork.freedesktop.org/series/114630/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit d233ef6c23b736a8831475ded1820b3889b46e48
Author:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
AuthorDate: Thu Mar 16 11:30:56 2023 +0100
Commit:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CommitDate: Thu Mar 16 13:24:45 2023 +0100

    drm/xe: Fix Alderlake-P and DG2 display info
    
    DG2 has cdclk squash, without which we calculate the CDCLK wrongly.
    Alderlake-P is LPD, not gen 12 display.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/210
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
=== git am output follows ===
Applying: drm/xe: Introduce function pointers in xe_gt.c with local structure
Applying: drm/xe: Introduce function pointers in xe_guc_pc.c with local structure
Applying: drm/xe: Add platform specific functions for a new platform


