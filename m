Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F69C001DF
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 17:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8AD10E3EC;
	Tue, 25 Jul 2023 17:15:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 08F5A10E3EC;
 Tue, 25 Jul 2023 17:15:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 060C3AADF2;
 Tue, 25 Jul 2023 17:15:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 25 Jul 2023 17:15:57 -0000
Message-ID: <169030535702.27663.1820343513829744834@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230725164344.3797085-1-lucas.demarchi@intel.com>
In-Reply-To: <20230725164344.3797085-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_MTL+_stolen_memory_mapping?=
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

Series: drm/xe: Fix MTL+ stolen memory mapping
URL   : https://patchwork.freedesktop.org/series/121325/
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
commit feb6040476e7ab3c839fa77e035855d320d39cb0
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Jul 25 09:43:44 2023 -0700

    drm/xe: Fix MTL+ stolen memory mapping
    
    Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT
    mapping"). For stolen on MTL and beyond, the address in the PTE is the
    offset from DSM base. While at it, update the comments explaining each
    part of the calculation.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch c7ed768399f6a4769bc4c18f92605d14201b0793 drm-intel
feb604047 drm/xe: Fix MTL+ stolen memory mapping
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '8d8d062be6b9', maybe rebased or not pulled?
#6: 
Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT

total: 0 errors, 1 warnings, 0 checks, 24 lines checked


