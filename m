Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B02DE82CC3
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 19:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043A710E5A3;
	Wed, 27 Sep 2023 19:42:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C80110E5A3;
 Wed, 27 Sep 2023 19:42:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1C550AADD5;
 Wed, 27 Sep 2023 19:42:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 27 Sep 2023 19:42:38 -0000
Message-ID: <169584375811.20756.7075895497386916151@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230927193902.2849159-1-lucas.demarchi@intel.com>
In-Reply-To: <20230927193902.2849159-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Re?=
 =?utf-8?q?factor_kernel_setting_of_PAT_=28rev3=29?=
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

Series: Refactor kernel setting of PAT (rev3)
URL   : https://patchwork.freedesktop.org/series/124225/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2b217121da60a7db8e75c93cf1270ca941554285
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Sep 27 12:39:02 2023 -0700

    fixup! drm/xe/display: Implement display support
    
    Fix build break due to previous commit. Squash on "Implement display
    support" to be moved above the previous commit.
    
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch bce60b0ff2937cb2ea51841a479bc1a2da65052b drm-intel
1c6000087 drm/xe: Normalize pte/pde encoding
b9d06142c drm/xe: Remove check for vma == NULL
d26b2b0bc drm/xe: Use vfunc for pte/pde ppgtt encoding
0623cbd3d drm/xe/migrate: Do not hand-encode pte
80272d9ba drm/xe: Use vfunc to initialize PAT
7eaa05269 drm/xe/dg2: Fix using wrong PAT table
91b60d4c9 drm/xe/pat: Prefer the arch/IP names
0665bcd62 drm/xe/pat: Keep track of relevant indexes
6d154a2bf drm/xe: Use pat_index to encode pde/pte
a96770a78 drm/xe: Use vfunc for ggtt pte encoding
2b217121d fixup! drm/xe/display: Implement display support


