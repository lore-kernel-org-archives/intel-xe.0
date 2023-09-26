Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B54E7F143
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 23:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCD710E44A;
	Tue, 26 Sep 2023 23:07:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B71A10E44A;
 Tue, 26 Sep 2023 23:07:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6F63AA00E8;
 Tue, 26 Sep 2023 23:07:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 26 Sep 2023 23:07:43 -0000
Message-ID: <169576966345.20978.6350198040463383707@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
In-Reply-To: <20230926223631.2807873-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Re?=
 =?utf-8?q?factor_kernel_setting_of_PAT_=28rev2=29?=
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

Series: Refactor kernel setting of PAT (rev2)
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
commit f9e3b3f9974031e965febe8192b36b6e5e132381
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Sep 26 15:36:31 2023 -0700

    fixup! drm/xe/display: Implement display support
    
    Fix build break due to previous commit. Squash on "Implement display
    support" to be moved above the previous commit.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch fc8ec3c56efa5c15b630ddc17c89100440fe03ef drm-intel
445e45a31 drm/xe: Normalize pte/pde encoding
1b159bde8 drm/xe: Remove check for vma == NULL
10ab234db drm/xe: Use vfunc for pte/pde ppgtt encoding
9d7394a66 drm/xe/migrate: Do not hand-encode pte
f05e72c58 drm/xe: Use vfunc to initialize PAT
624796d2c drm/xe/dg2: Fix using wrong PAT table
ae1cc0b84 drm/xe/pat: Prefer the arch/IP names
e366ad736 drm/xe/pat: Keep track of relevant indexes
6ac5dfe83 drm/xe: Use pat_index to encode pde/pte
e4e3289bb drm/xe: Use vfunc for ggtt pte encoding
f9e3b3f99 fixup! drm/xe/display: Implement display support


