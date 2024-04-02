Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C816C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 22:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3A81120BF;
	Tue,  2 Apr 2024 22:00:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4DC1120BE;
 Tue,  2 Apr 2024 22:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Refactor_BO_flags=2C_batc?=
 =?utf-8?q?h_2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Apr 2024 22:00:33 -0000
Message-ID: <171209523396.1155818.16886588250238255915@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240402215455.1839828-1-lucas.demarchi@intel.com>
In-Reply-To: <20240402215455.1839828-1-lucas.demarchi@intel.com>
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

Series: Refactor BO flags, batch 2
URL   : https://patchwork.freedesktop.org/series/131953/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 596d541164427635c65b2bbee0d0296dee1749c3
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Apr 2 14:54:55 2024 -0700

    drm/xe: Drop XE_BO_FLAG_VRAM_IF_DGFX()
    
    Now that each tile has a default placement for BOs, it's not needed
    anymore to pass it to the various bo_create functions. There are a few
    cases in which it's needed to override the default, coming from tests:
    when xe_bo_create_user() is used with tile set to NULL, but the test
    is specific to VRAM[0|1] rather than going to the root tile.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 817f62236d84505e987511af22a06bb051755029 drm-intel
1ecc5c1bed9f drm/xe/tile: Set default memory placement for BOs
-:72: WARNING:TYPO_SPELLING: 'overriden' may be misspelled - perhaps 'overridden'?
#72: FILE: drivers/gpu/drm/xe/xe_device_types.h:180:
+		 * May still be overriden when creating a bo by setting a
 		                ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 70 lines checked
596d54116442 drm/xe: Drop XE_BO_FLAG_VRAM_IF_DGFX()


