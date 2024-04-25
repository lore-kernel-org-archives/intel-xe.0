Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4337C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 19:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77484113FDD;
	Thu, 25 Apr 2024 19:16:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82735113FDD;
 Thu, 25 Apr 2024 19:16:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_early_probe?=
 =?utf-8?q?_order?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Apr 2024 19:16:28 -0000
Message-ID: <171407258853.1668155.10160098779888736931@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
In-Reply-To: <20240425182410.2705061-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Fix early probe order
URL   : https://patchwork.freedesktop.org/series/132920/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 895bd6f817411eb138c5bd40898b61fe3eb2b452
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Apr 25 11:24:10 2024 -0700

    drm/xe: Move sw-only pcode initialization
    
    Move it to xe_gt_init_early() that initializes the sw-only part for each
    gt.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 92b848b529903fb99d21168491692474aae4872c drm-intel
959551b3639b drm/xe: Drop __engine_mask
6752bb7d8953 drm/xe: Drop useless forcewake get/put
f76a2667ef3c drm/xe: Move xe_gt_init_early() where it belongs
25ac894ffac4 drm/xe: Move xe_force_wake_init_gt() inside gt initialization
895bd6f81741 drm/xe: Move sw-only pcode initialization


