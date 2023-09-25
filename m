Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB94CE79A4
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 22:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F8810E335;
	Mon, 25 Sep 2023 22:14:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1134D10E335;
 Mon, 25 Sep 2023 22:14:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0DF2BA0003;
 Mon, 25 Sep 2023 22:14:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Mon, 25 Sep 2023 22:14:36 -0000
Message-ID: <169568007605.21535.13867536764461626343@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
In-Reply-To: <20230925221049.2681491-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Re?=
 =?utf-8?q?factor_kernel_setting_of_PAT?=
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

Series: Refactor kernel setting of PAT
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
commit 6bcdb926e71a755b73c93b3ca40ca4667466fde1
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Sep 25 15:10:49 2023 -0700

    fixup! drm/xe/display: Implement display support
    
    Fix build break due to previous commit. Squash on "Implement display
    support" to be moved above the previous commit.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch fc8ec3c56efa5c15b630ddc17c89100440fe03ef drm-intel
ac886e195 drm/xe: Normalize pte/pde encoding
b1d8a2a8e drm/xe: Remove check for vma == NULL
765d093f6 drm/xe: Use vfunc for pte/pde ppgtt encoding
e92116ef4 drm/xe/migrate: Do not hand-encode pte
c3ecdc091 drm/xe: Use vfunc to initialize PAT
84cb739c4 drm/xe/pat: Keep track of relevant indexes
723ffff0e drm/xe: Use pat_index to encode pte
7bf2ea52c drm/xe: Use vfunc for ggtt pte encoding
6bcdb926e fixup! drm/xe/display: Implement display support


