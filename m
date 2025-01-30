Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF3BC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 12:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5648F10E950;
	Thu, 30 Jan 2025 12:43:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC4110E22E;
 Thu, 30 Jan 2025 12:43:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Workaround_fixes=2C_impro?=
 =?utf-8?q?vements=2C_additions_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jan 2025 12:43:47 -0000
Message-ID: <173824102730.2853433.14758477265553740960@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250130110337.11237-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250130110337.11237-1-tvrtko.ursulin@igalia.com>
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

Series: Workaround fixes, improvements, additions (rev2)
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
commit d4de1011a433bb4a3dc42c87f2d9ab46b5a7c1f6
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Jan 30 11:03:37 2025 +0000

    drm/xe: Add performance tunings to debugfs
    
    Add a list of active tuning workarounds to debugfs, analogous to the
    existing "plain" workarounds list.
    
    Rationale being that it seems to make sense to either have both or none.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch c2a5da40b8b1c5af77dcdabed8516069949fea3b drm-intel
5edc2f0652a5 drm/xe: Fix GT "for each engine" workaround handling
fb67e666d7de drm/xe/gen12: Add Wa_1604555607
d432fa8b0a5c drm/xe/gen12: L3 recommended hashing mask
d4de1011a433 drm/xe: Add performance tunings to debugfs


