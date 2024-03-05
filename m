Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25E4C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 13:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C47112ACC;
	Tue,  5 Mar 2024 13:18:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35644112AC9;
 Tue,  5 Mar 2024 13:18:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Reduce_GGTT_dis?=
 =?utf-8?q?play_pinning_latency=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Mar 2024 13:18:04 -0000
Message-ID: <170964468422.524851.3231548492659925597@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Reduce GGTT display pinning latency.
URL   : https://patchwork.freedesktop.org/series/130739/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 61e1865fece40c66451dfedd60f6ac7d701b09ba
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Mar 5 14:12:50 2024 +0100

    drm/xe: Move xe_ggtt_invalidate out from ggtt->lock
    
    Considering the caller of the GGTT functions should keep the
    backing storage alive before the function completes, it's not
    necessary to invalidate with the GGTT lock held. This just adds
    latency for every user of the GGTT.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 1d6fe19a74ebc7356b6cbed32aa1dedb215b4aff drm-intel
78169bdff307 fix "drm/xe: Cleanup some layering in GGTT"
026c6e214f64 drm/xe: Do not grab forcewakes when issuing GGTT TLB invalidation via GuC
9e04fecb0fd9 drm/xe: Do not perform GuC TLB invalidation for display GGTT
61e1865fece4 drm/xe: Move xe_ggtt_invalidate out from ggtt->lock


