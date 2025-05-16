Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17985C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 06:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D534F10E9AD;
	Fri, 16 May 2025 06:37:36 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0D910E9AF;
 Fri, 16 May 2025 06:37:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/psr=3A_Do_not_re?=
 =?utf-8?q?ad_PSR2=5FSU=5FSTATUS_on_AlderLake_and_onwards_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 06:37:36 -0000
Message-ID: <174737745632.86767.17310211676421060654@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516063019.2126702-1-jouni.hogander@intel.com>
In-Reply-To: <20250516063019.2126702-1-jouni.hogander@intel.com>
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

Series: drm/i915/psr: Do not read PSR2_SU_STATUS on AlderLake and onwards (rev2)
URL   : https://patchwork.freedesktop.org/series/147814/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 622b8e6a2779ec7e7559ae7e857141a2af4ae469
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri May 16 09:30:19 2025 +0300

    drm/i915/psr: Do not read PSR2_SU_STATUS on AlderLake and onwards
    
    Bspec comment on PSR2_SU_STATUS:
    
    "This register has been tied-off since DG2/ADL-P (it returns zeros only)
    and it has been removed on Xe2_LPD."
    
    v2: fix inversed logic
    
    Bspec: 69889
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28 drm-intel
622b8e6a2779 drm/i915/psr: Do not read PSR2_SU_STATUS on AlderLake and onwards


