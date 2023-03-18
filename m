Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B2FC6FD1D
	for <intel-xe@archiver.kernel.org>; Sat, 18 Mar 2023 03:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B50A10E28B;
	Sat, 18 Mar 2023 03:08:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E965D10E28B;
 Sat, 18 Mar 2023 03:08:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E316AAA917;
 Sat, 18 Mar 2023 03:08:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Sat, 18 Mar 2023 03:08:37 -0000
Message-ID: <167910891790.6191.14398747981795689358@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230318030643.557464-1-matthew.brost@intel.com>
In-Reply-To: <20230318030643.557464-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drn/xe=3A_Drop_usm_lock_around_ASID_xarray?=
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

Series: drn/xe: Drop usm lock around ASID xarray
URL   : https://patchwork.freedesktop.org/series/115341/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 3873fe420b3e91b76e192a0ff13586e08e839f91
Author:     Lucas De Marchi <lucas.demarchi@intel.com>
AuthorDate: Fri Mar 10 11:14:30 2023 -0800
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Fri Mar 17 09:34:59 2023 -0700

    drm/xe: Fix module load without display IP
    
    When the device info initialization moved to the display part, one use
    case was left behind: platforms without display IP. In order to keep the
    knowledge about the display in xe_display.c, xe_display_info_init()
    should be the place where this is set.
    
    Remove the warning and set the info accordingly. This moves a later
    check from  intel_device_info_runtime_init() into a very earlier one,
    when no HW access is being done yet.
    
    Fixes: 2a0f49c7ae5b ("drm/xe/display: Move device info initialization to display")
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
    Link: https://lore.kernel.org/r/20230310191430.2229799-1-lucas.demarchi@intel.com
=== git am output follows ===
Applying: drn/xe: Drop usm lock around ASID xarray


