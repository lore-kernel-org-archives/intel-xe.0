Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E03C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 07:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A9D10E32F;
	Tue, 30 Apr 2024 07:48:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76CD10E414;
 Tue, 30 Apr 2024 07:48:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Extend_wa=5F14020756599_t?=
 =?utf-8?q?o_xe2lpg/lpm_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Apr 2024 07:48:23 -0000
Message-ID: <171446330394.1778343.8559249227893516267@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240430075609.2216291-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240430075609.2216291-1-tejas.upadhyay@intel.com>
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

Series: Extend wa_14020756599 to xe2lpg/lpm (rev2)
URL   : https://patchwork.freedesktop.org/series/132948/
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
commit d4920464589c03dc8b13f0f578e0df6d4e6e38cc
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue Apr 30 13:26:09 2024 +0530

    drm/xe/xe2lpm: Add permanent wa_14020756599
    
    For xe2_lpm Wa_14020756599 is applied to
    all steppings.
    
    V2:
      - Remove engine filter video decode
      - Fix typo GRAPHICS/MEDIA/s - Himal
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 429c710ab5eee230e239c85040716ed068fff345 drm-intel
004cd5152982 drm/xe/xe2lpg: Add permanent wa_14020756599
d4920464589c drm/xe/xe2lpm: Add permanent wa_14020756599


