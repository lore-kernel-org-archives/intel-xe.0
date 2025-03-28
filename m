Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C16C36010
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 18:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35D710EA95;
	Fri, 28 Mar 2025 18:39:58 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F65010EA95;
 Fri, 28 Mar 2025 18:39:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Make_PPHWSP_siz?=
 =?utf-8?q?e_explicit_in_xe=5Fgt=5Flrc=5Fsize=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Mar 2025 18:39:58 -0000
Message-ID: <174318719805.16575.8846096842210094658@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328-explicit-pphwsp-size-in-xe_gt_lrc_size-v1-1-ceb9ce7c8bc1@intel.com>
In-Reply-To: <20250328-explicit-pphwsp-size-in-xe_gt_lrc_size-v1-1-ceb9ce7c8bc1@intel.com>
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

Series: drm/xe: Make PPHWSP size explicit in xe_gt_lrc_size()
URL   : https://patchwork.freedesktop.org/series/146970/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b443fe8b96c4117cb37ef512669d3e3c62d10b82
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Mar 28 13:50:50 2025 -0300

    drm/xe: Make PPHWSP size explicit in xe_gt_lrc_size()
    
    The context of each engine starts with a 4k scratch memory space for the
    "Per-process HW status page" (PPHWSP). In xe_gt_lrc_size(), we have been
    implicitly accounting for that page in the switch statement on the
    engine class.
    
    Since the PPHWSP is common to all engines, let's extract that into it's
    own assignment. That makes the context structure more explicit in the
    code and aligns better with the descriptions in Bspec.
    
    Another advantage of keeping it separate is that now the sizes used in
    the switch statement match the sizes we calculate engine-specific
    context images, which have their own Bspec pages.
    
    Bspec: 67296, 60159, 45554
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 2e2d39cb4f3dd3465c7bca7b8f2290570e85aa1b drm-intel
b443fe8b96c4 drm/xe: Make PPHWSP size explicit in xe_gt_lrc_size()


