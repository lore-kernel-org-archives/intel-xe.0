Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2566CEFD0C
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 21:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666A410E004;
	Tue,  6 Jan 2026 21:51:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B09E10E004;
 Tue,  6 Jan 2026 21:51:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Bump_GUC_ve?=
 =?utf-8?q?rsion_for_NVL-S=2C_CRI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Jan 2026 21:51:42 -0000
Message-ID: <176773630243.130801.12501833385149293905@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260106212758.1172984-6-julia.filipchuk@intel.com>
In-Reply-To: <20260106212758.1172984-6-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: Bump GUC version for NVL-S, CRI
URL   : https://patchwork.freedesktop.org/series/159711/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9e1a92a090cad966d7c5716d89a852c27778239a
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Tue Jan 6 13:27:07 2026 -0800

    topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
    
    Define GuC firmware, still using the mpp version that is intended to be
    merged only to help with the platform enabling in topic/for-xe-CI.
    
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Link: https://patch.msgid.link/20251021-cri-v1-2-bf11e61d9f49@intel.com
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 3d6700a02638d446a4e8ad92a8212c3efef84ae0 drm-intel
32ee3d76fb47 Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:20: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
9a06d9f434d2 Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
ac8d0b2bc252 drm/xe/nvls: Define GuC firmware for NVL-S
9e1a92a090ca topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI


