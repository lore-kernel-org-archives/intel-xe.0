Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B319BC021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 20:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1E410E038;
	Mon, 24 Feb 2025 20:58:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4E410E038;
 Mon, 24 Feb 2025 20:58:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_*Prepare_RTP_to_define_SR?=
 =?utf-8?q?-IOV_specific_rules?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 20:58:54 -0000
Message-ID: <174043073483.1725150.16721801665981377209@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250224150700.1778-1-michal.wajdeczko@intel.com>
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

Series: *Prepare RTP to define SR-IOV specific rules
URL   : https://patchwork.freedesktop.org/series/145337/
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
commit 1c3a3c54b97dfca3b7a26545c91a6a5338d9f9a2
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Feb 24 16:07:00 2025 +0100

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
+ /mt/dim checkpatch 9c30a334a46272b014f3923d3d5c29ba0f962de7 drm-intel
a667a3d0a378 drm/xe/rtp: Prepare RTP to define SR-IOV specific rules
d22e5fe7b6bf drm/xe/sriov: Prepare IS_SRIOV_PF to accept const pointer
67d4b5970dbb drm/xe/kunit: Export xe_step_name for KUNIT
5fe068597cec drm/xe/kunit: Update RTP tests with SR-IOV rules
1c3a3c54b97d drm/xe/rtp: Remove redundant rule to omit VF


