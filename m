Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6171C3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 08:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7695688C11;
	Fri, 19 Jul 2024 08:50:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4155C10EB68;
 Fri, 19 Jul 2024 08:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Revert_=22drm/i?=
 =?utf-8?q?915=3A_Disable_DSB_in_Xe_KMD=22_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manna, Animesh" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Jul 2024 08:50:23 -0000
Message-ID: <172137902326.288091.8243894317725576810@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708055630.4058818-1-animesh.manna@intel.com>
In-Reply-To: <20240708055630.4058818-1-animesh.manna@intel.com>
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

Series: drm/xe: Revert "drm/i915: Disable DSB in Xe KMD" (rev5)
URL   : https://patchwork.freedesktop.org/series/131488/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 215467f119d8315e444b2851dbaa7334e841fb3d
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Mon Jul 8 11:26:30 2024 +0530

    drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
    
    This reverts commit c27f010aa1884276ee5dae72034d84987060c769.
    
    After fix from [1] dsb timeout issue is not reproducible on local testing
    with xe driver. Checking CI result to confirm and not for review.
    
    [1] https://patchwork.freedesktop.org/series/130783/
    
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 429649ac8c43c4f3548aa2ceb48c2a57be041c5c drm-intel
215467f119d8 drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"


