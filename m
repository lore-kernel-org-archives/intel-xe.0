Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7171CD6E6D
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 14:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B90C10E135;
	Thu,  4 Jun 2026 14:24:09 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5501E10E131;
 Thu,  4 Jun 2026 14:24:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/ggtt=3A_clear_rese?=
 =?utf-8?q?rved_areas_at_init_runtime_for_!VFs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jun 2026 14:24:08 -0000
Message-ID: <178058304834.43098.10397248981158927053@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260604134501.17302-1-dev@lankhorst.se>
In-Reply-To: <20260604134501.17302-1-dev@lankhorst.se>
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

Series: drm/xe/ggtt: clear reserved areas at init runtime for !VFs (rev2)
URL   : https://patchwork.freedesktop.org/series/167881/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b2a6afe705f317c5e9431e8cb85e24ff2de7c88b
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Jun 4 15:56:29 2026 +0200

    drm/xe/ggtt: clear reserved areas at init runtime for !VFs
    
    When initialising GGTT, we never clear the part below wopcm,
    or above GUC_GGTT_TOP.
    
    Add a member to &xe_ggtt that holds the full GGTT size, and clear
    both reserved areas during xe_ggtt_initial_clear.
    
    Since by design those areas are reserved, do not check the
    assertions for those areas.
    
    Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 318a793f49855ae3defbe795513b173675b7465c drm-intel
b2a6afe705f3 drm/xe/ggtt: clear reserved areas at init runtime for !VFs
-:18: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#18: 
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

total: 0 errors, 1 warnings, 0 checks, 134 lines checked


