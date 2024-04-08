Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A08C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 17:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AB0112916;
	Mon,  8 Apr 2024 17:46:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CC7112916;
 Mon,  8 Apr 2024 17:46:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remove_dead_clo?=
 =?utf-8?q?ck_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Apr 2024 17:46:57 -0000
Message-ID: <171259841762.1286639.5316627346522917240@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240408151312.2100304-1-lucas.demarchi@intel.com>
In-Reply-To: <20240408151312.2100304-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Remove dead clock code
URL   : https://patchwork.freedesktop.org/series/132159/
State : success

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
commit f08884d0cb17089eaf782be2f1a2009b108079e3
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Apr 8 08:13:12 2024 -0700

    drm/xe: Remove dead clock code
    
    xe_gt_clock_cycles_to_ns() is not called from anywhere after PMU
    handling was removed in commit 90a8b23f9b85 ("drm/xe/pmu: Remove PMU
    from Xe till uapi is finalized"). Drop it.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a533b51ca017728c1228432e8e1e9aba4fd65b02 drm-intel
f08884d0cb17 drm/xe: Remove dead clock code


