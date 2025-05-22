Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6A2C54ED0
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 01:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3861F11A793;
	Thu, 22 May 2025 01:26:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F065711A78B;
 Thu, 22 May 2025 01:26:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Test_new_Gu?=
 =?utf-8?q?C_v70=2E45=2E2_for_BMG=2C_LNL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 May 2025 01:26:06 -0000
Message-ID: <174787716685.11760.15950507005556840509@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250522012045.323747-1-julia.filipchuk@intel.com>
In-Reply-To: <20250522012045.323747-1-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: Test new GuC v70.45.2 for BMG, LNL
URL   : https://patchwork.freedesktop.org/series/149360/
State : warning

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
commit ebcd1a95c3a854b95e7a5784f1bd850697d2854d
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Wed May 21 18:20:45 2025 -0700

    drm/xe/guc: Test new GuC v70.45.2 for BMG, LNL
    
    UAPI compatiblity version 1.21.2
    
    This patch is for testing only. If testing is successful the binary
    blobs will replace the major versioned *_guc_70.bin files for given
    platforms.
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch a14f4b245a1b5b1c3c0160457837415c5c49ee40 drm-intel
ebcd1a95c3a8 drm/xe/guc: Test new GuC v70.45.2 for BMG, LNL
-:6: WARNING:TYPO_SPELLING: 'compatiblity' may be misspelled - perhaps 'compatibility'?
#6: 
UAPI compatiblity version 1.21.2
     ^^^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 10 lines checked


