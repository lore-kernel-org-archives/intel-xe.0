Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1169C761A6
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 03:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C23910F37B;
	Sat,  1 Apr 2023 03:05:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCE2E10E0DF;
 Sat,  1 Apr 2023 03:05:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A98ABAADDD;
 Sat,  1 Apr 2023 03:05:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Sat, 01 Apr 2023 03:05:29 -0000
Message-ID: <168031832967.8631.12917344551135954708@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230401030300.22568-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230401030300.22568-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Get_xe=5Fmigrate=5Ftest_working_=28rev2=29?=
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

Series: drm/xe: Get xe_migrate_test working (rev2)
URL   : https://patchwork.freedesktop.org/series/115949/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit cbd8b47f28266aad8f9786be9a1899e3f0e0f2e0
Author:     Matt Roper <matthew.d.roper@intel.com>
AuthorDate: Mon Mar 27 10:34:33 2023 -0700
Commit:     Matt Roper <matthew.d.roper@intel.com>
CommitDate: Fri Mar 31 17:06:44 2023 -0700

    fixup! drm/xe/pat: Handle unicast vs MCR PAT registers
    
    Somehow I dropped the error message when sending this; add it back.
    
    To be squashed next time the Xe driver is rebased.
    
    Fixes: 11946af00717 ("drm/xe/pat: Handle unicast vs MCR PAT registers")
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
    Link: https://lore.kernel.org/r/20230327173433.2957645-1-matthew.d.roper@intel.com
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
=== git am output follows ===
Applying: drm/xe/tests: Use proper batch base address
Applying: drm/xe/tests: Set correct expectation
Applying: drm/xe: Use proper vram offset


