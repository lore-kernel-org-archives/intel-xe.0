Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A59C3600C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 06:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E22510E5CF;
	Tue,  8 Apr 2025 06:11:40 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7030C10E5CF;
 Tue,  8 Apr 2025 06:11:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/alpm=3A_use_vari?=
 =?utf-8?q?able_from_intel=5Fcrtc=5Fstate_instead_of_intel=5Fpsr?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 06:11:39 -0000
Message-ID: <174409269945.46164.16728019155883752800@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250408060539.4167353-1-jouni.hogander@intel.com>
In-Reply-To: <20250408060539.4167353-1-jouni.hogander@intel.com>
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

Series: drm/i915/alpm: use variable from intel_crtc_state instead of intel_psr
URL   : https://patchwork.freedesktop.org/series/147368/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 25f48b3442a4476b9e7d57ff30a9c879834f041d
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Tue Apr 8 09:05:39 2025 +0300

    drm/i915/alpm: use variable from intel_crtc_state instead of intel_psr
    
    Currently code is making assumption that PSR is enabled when
    intel_alpm_configure is called. This doesn't work if alpm is configured
    before PSR is enabled.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 6fda8f56691fba89be9c617abcccb7b883938168 drm-intel
25f48b3442a4 drm/i915/alpm: use variable from intel_crtc_state instead of intel_psr


