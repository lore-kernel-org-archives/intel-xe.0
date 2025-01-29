Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62177C02193
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 17:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B38010E84D;
	Wed, 29 Jan 2025 17:43:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7E410E10A;
 Wed, 29 Jan 2025 17:43:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Workaround_fixes=2C_impro?=
 =?utf-8?q?vements=2C_additions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 17:43:14 -0000
Message-ID: <173817259451.2510226.1710324377144081178@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
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

Series: Workaround fixes, improvements, additions
URL   : https://patchwork.freedesktop.org/series/144112/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c6770b4dd4cb2bc224de9b84a0dc16b73c05e900
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Wed Jan 29 15:56:27 2025 +0000

    drm/xe: Move a couple static workarounds/tunings to the static list
    
    One workaround and one tuning are completely static so can be moved to the
    respective static lists in xe_wa.c and xa_tunings.c respectively.
    Advantage being that they will be shown in debugfs as active, when active.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch bdfc862a5c719d934efbdedb050ef891b9feef15 drm-intel
cdbbc949c5d1 drm/xe: Fix GT workaround handling
b7fc29d10188 drm/xe/gen12: Add Wa_1604555607
c97d45fade30 drm/xe/gen12: L3 recommended hashing mask
8cd97c45001f drm/xe: Add performance tunings to debugfs
c6770b4dd4cb drm/xe: Move a couple static workarounds/tunings to the static list


