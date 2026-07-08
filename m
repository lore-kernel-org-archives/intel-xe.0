Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E058C43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 15:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3D410F171;
	Wed,  8 Jul 2026 15:29:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA97710F171;
 Wed,  8 Jul 2026 15:29:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/nvm=3A_fix_writabl?=
 =?utf-8?q?e_override_for_CRI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Jul 2026 15:29:24 -0000
Message-ID: <178352456495.165378.14017993258380532696@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260708-cri_nvm_fdo_flip-v1-1-792373667334@intel.com>
In-Reply-To: <20260708-cri_nvm_fdo_flip-v1-1-792373667334@intel.com>
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

Series: drm/xe/nvm: fix writable override for CRI
URL   : https://patchwork.freedesktop.org/series/170015/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a555ebdbe01b1b50aa5d6cd04bea8637df24b541
Author: Alexander Usyskin <alexander.usyskin@intel.com>
Date:   Wed Jul 8 18:00:17 2026 +0300

    drm/xe/nvm: fix writable override for CRI
    
    The witable override should be set when FDO_MODE bit is enabled.
    Fix the comparison to distingush this case from legacy systems
    where bit should be disabled to have override.
    
    Cc: stable@vger.kernel.org
    Fixes: 9dde74fd9e65 ("drm/xe/nvm: enable cri platform")
    Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
+ /mt/dim checkpatch d2b771941e0c8aec7b6648b0c47d81161136944d drm-intel
a555ebdbe01b drm/xe/nvm: fix writable override for CRI
-:29: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#29: FILE: drivers/gpu/drm/xe/xe_nvm.c:68:
+		test_val = test_bit = FDO_MODE;

total: 0 errors, 0 warnings, 1 checks, 42 lines checked


