Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F95C3065B
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 19:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5918910E074;
	Mon,  1 Jul 2024 19:38:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D7510E056;
 Mon,  1 Jul 2024 19:38:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_global-out-?=
 =?utf-8?q?of-bounds_in_rule=5Fmatches?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jul 2024 19:38:32 -0000
Message-ID: <171986271242.3396.5597512323540187937@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240701153702.21824-1-nirmoy.das@intel.com>
In-Reply-To: <20240701153702.21824-1-nirmoy.das@intel.com>
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

Series: drm/xe: Fix global-out-of-bounds in rule_matches
URL   : https://patchwork.freedesktop.org/series/135604/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cd3c02d358175ab3e135efcd3da76fb7870d839c
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Mon Jul 1 17:37:02 2024 +0200

    drm/xe: Fix global-out-of-bounds in rule_matches
    
    Do post-increment instead of pre-increment to fix:
    [ 9344.404516] BUG: KASAN: global-out-of-bounds in rule_matches+0xb72/0x11c0 [xe]
    [ 9344.411887] Read of size 1 at addr ffffffffa330b210 by task xe_module_load/248463
    
    Fixes: dc72c52a42e0 ("drm/xe/rtp: Allow to OR rules")
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 886eeb6d89b58f914ee5045fcac54b59a73d8299 drm-intel
cd3c02d35817 drm/xe: Fix global-out-of-bounds in rule_matches


