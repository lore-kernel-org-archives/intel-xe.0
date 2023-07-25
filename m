Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1116EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 21:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C36C10E18F;
	Tue, 25 Jul 2023 21:24:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44AA610E18F;
 Tue, 25 Jul 2023 21:24:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 41593AA3D8;
 Tue, 25 Jul 2023 21:24:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 25 Jul 2023 21:24:04 -0000
Message-ID: <169032024426.27667.18303575602177082191@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
In-Reply-To: <20230725202836.3854908-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fi?=
 =?utf-8?q?x_stolen_setup_for_MTL+?=
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

Series: Fix stolen setup for MTL+
URL   : https://patchwork.freedesktop.org/series/121329/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 335608385aaad8aaa6474b0a03938d1cbc7f9f58
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Jul 25 13:28:36 2023 -0700

    drm/xe: Sort xe_regs.h
    
    Sort it by register address, but  keeping a few exceptions when a
    register for a platform changed the address, but has the same
    functionality as an already existing register.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 3eb59fdaff17b28970c5be4fd00dba25b3ffb3f1 drm-intel
67f6632f5 drm/xe: Fix MTL+ stolen memory mapping
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '8d8d062be6b9', maybe rebased or not pulled?
#6: 
Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT

total: 0 errors, 1 warnings, 0 checks, 33 lines checked
803ba65ce drm/xe: Carve out top of DSM as reserved
105f1a0e7 fixup! fixup! drm/xe/display: Implement display support
335608385 drm/xe: Sort xe_regs.h


