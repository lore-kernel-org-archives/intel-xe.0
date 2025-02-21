Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D86C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 20:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FF210E2E1;
	Fri, 21 Feb 2025 20:15:23 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B63110E2E1;
 Fri, 21 Feb 2025 20:15:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Prepare_RTP_to_define_SR-?=
 =?utf-8?q?IOV_specific_rules?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 20:15:22 -0000
Message-ID: <174016892230.558804.13261739887969363362@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221190038.1734-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250221190038.1734-1-michal.wajdeczko@intel.com>
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

Series: Prepare RTP to define SR-IOV specific rules
URL   : https://patchwork.freedesktop.org/series/145269/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 41ddd1828a43c18e64fd19c9c385b1a861741ccd
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Feb 21 20:00:38 2025 +0100

    drm/xe/rtp: Remove redundant rule to omit VF
    
    After recent updates to RTP processing which to not enable
    rules when running on the VF driver, explicit disabling of
    rule using FUNC(xe_rtp_match_not_sriov_vf) is now redundant.
    
    This patch reverts commit 70b8e6e3226f ("drm/xe/vf: Don't
    apply Wa_22019338487 for VF") and commit c2e52eb73d99
    ("drm/xe/rtp: Add match helper to omit SR-IOV VF device")
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch f2a2bd676bde0942c9dfe5c55d54eec298260f88 drm-intel
d44c90178f3f drm/xe/rtp: Prepare RTP to define SR-IOV specific rules
7bd2eaea3285 drm/xe/kunit: Export xe_step_name for KUNIT
f364a55d2974 drm/xe/kunit: Update RTP tests with SR-IOV rules
41ddd1828a43 drm/xe/rtp: Remove redundant rule to omit VF


