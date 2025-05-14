Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D71C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 18:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D8310E2D9;
	Wed, 14 May 2025 18:52:00 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB5810E2C5;
 Wed, 14 May 2025 18:51:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Don=27t_allocate_managed_?=
 =?utf-8?q?BO_for_each_policy_change_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 18:51:59 -0000
Message-ID: <174724871903.80831.468565048023653418@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512220018.172-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250512220018.172-1-michal.wajdeczko@intel.com>
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

Series: Don't allocate managed BO for each policy change (rev2)
URL   : https://patchwork.freedesktop.org/series/148913/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 87cbea2a4ab2a721a5c7a64a29136f050c58a8db
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue May 13 00:00:18 2025 +0200

    drm/xe/guc: Don't allocate managed BO for each policy change
    
    We shouldn't use xe_managed_bo_create_from_data() to allocate
    temporary BO, as it will be released only on unload and every
    change in wedge_mode policy will consume resources (including
    precious GGTT). Instead just switchover to GuC buffer cache.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch dd6a856541dd90fa4ef755783898fcfbea3b9961 drm-intel
9d0e69a55ae9 drm/xe/guc: Unblock GuC buffer cache for all modes
87cbea2a4ab2 drm/xe/guc: Don't allocate managed BO for each policy change


