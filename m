Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4DCC25B75
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F351110EAE1;
	Tue, 21 May 2024 10:45:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D022610EAE1;
 Tue, 21 May 2024 10:45:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Prefer_forward_declaratio?=
 =?utf-8?q?ns_in_headers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 May 2024 10:45:34 -0000
Message-ID: <171628833485.2162156.11889785540413828291@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521102828.668-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240521102828.668-1-michal.wajdeczko@intel.com>
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

Series: Prefer forward declarations in headers
URL   : https://patchwork.freedesktop.org/series/133873/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0dc6c6705d89eef01fd6a627b739f9e6ff20992a
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue May 21 12:28:28 2024 +0200

    drm/xe: Fix xe_guc_pc.h
    
    Prefer forward declaration over #include xe_guc_pc_types.h
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 362550fd170e1450157834793cf333b521d96133 drm-intel
576c505e4be7 drm/xe: Fix xe_uc.h
277100096c2d drm/xe: Fix xe_gsc.h
2234b39be755 drm/xe: Fix xe_huc.h
0dc6c6705d89 drm/xe: Fix xe_guc_pc.h


