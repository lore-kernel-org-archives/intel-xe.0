Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2703C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 14:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8049310E82E;
	Wed, 26 Feb 2025 14:01:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E6010E822;
 Wed, 26 Feb 2025 14:01:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Workaround_fixes=2C_impro?=
 =?utf-8?q?vements=2C_additions_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Feb 2025 14:01:05 -0000
Message-ID: <174057846528.2350650.15429491125025654603@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
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

Series: Workaround fixes, improvements, additions (rev3)
URL   : https://patchwork.freedesktop.org/series/144112/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cfb7a9a3734021b639be7b3b4d87666019011903
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Wed Feb 26 11:21:06 2025 +0000

    drm/xe: Add performance tunings to debugfs
    
    Add a list of active tuning workarounds to debugfs, analogous to the
    existing "plain" workarounds list.
    
    Rationale being that it seems to make sense to either have both or none.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 4a2f1c823287a84dc0bd46c5a93545dfe49967f2 drm-intel
129db98c8f87 drm/xe: Fix GT "for each engine" workarounds
20b79c3311ae drm/xe/gen12: Add Wa_1604555607
4f368268fb8e drm/xe/gen12: L3 recommended hashing mask
cfb7a9a37340 drm/xe: Add performance tunings to debugfs


