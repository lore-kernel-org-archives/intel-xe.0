Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30ADC3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 23:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B704F10E8FF;
	Tue, 16 Jul 2024 23:00:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7915B10E8FF;
 Tue, 16 Jul 2024 23:00:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Implement_compression_sup?=
 =?utf-8?q?port_on_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jul 2024 23:00:36 -0000
Message-ID: <172117083650.253774.4753651458449474526@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1721170212.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1721170212.git.akshata.jahagirdar@intel.com>
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

Series: Implement compression support on BMG
URL   : https://patchwork.freedesktop.org/series/136164/
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
commit 9322a859812880627fc68a1a15ccb2c39cbeeabd
Author: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Date:   Tue Jul 16 22:54:09 2024 +0000

    drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear()
    
    Parameterize clearing ccs and bo data in xe_migrate_clear() which  higher
    layers can utilize. This patch will be used later on when doing bo data
    clear for igfx as well.
    
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
+ /mt/dim checkpatch 49a697d7731bfbd13087d4167151cc91ec613f13 drm-intel
307acf20808a drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
ce327fc069fa drm/xe/migrate: Add kunit to test clear functionality
16ecdeec841d drm/xe/migrate: Add helper function to program identity map
2dc919b64ca0 drm/xe/xe2: Introduce identity map for compressed pat for vram
784075458fd4 drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
c16290147414 drm/xe/migrate: Add kunit to test migration functionality for BMG
8291c59419f9 drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
9322a8598128 drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear()


