Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285C8C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 11:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E634110E306;
	Fri,  6 Jun 2025 11:48:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1320F10EA36;
 Fri,  6 Jun 2025 11:48:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Move_DSB_l2_flush_to_a_more_sensible_place?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 11:48:35 -0000
Message-ID: <174921051507.55714.1144124265119693365@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250606104546.1996818-3-matthew.auld@intel.com>
In-Reply-To: <20250606104546.1996818-3-matthew.auld@intel.com>
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

Series: series starting with [1/2] drm/xe: Move DSB l2 flush to a more sensible place
URL   : https://patchwork.freedesktop.org/series/149935/
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
commit e09eda9036a8a83d9149602536fe9416992f2501
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Jun 6 11:45:48 2025 +0100

    drm/xe: move DPT l2 flush to a more sensible place
    
    Only need the flush for DPT host updates here. Normal GGTT updates don't
    need special flush.
    
    Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: <stable@vger.kernel.org> # v6.12+
+ /mt/dim checkpatch 170e9c2094942ba18f0839ad32048f29ea79cfcf drm-intel
332d71425f9e drm/xe: Move DSB l2 flush to a more sensible place
e09eda9036a8 drm/xe: move DPT l2 flush to a more sensible place


