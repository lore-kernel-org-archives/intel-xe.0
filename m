Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B81C27C4F
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 02:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892E910E136;
	Mon,  1 Jul 2024 02:19:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9930910E15B;
 Mon,  1 Jul 2024 02:19:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/rtp=3A_Fix_out-of-?=
 =?utf-8?q?bounds_array_access_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jul 2024 02:19:12 -0000
Message-ID: <171980035262.459.4166740418841494770@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240628161726.836734-1-lucas.demarchi@intel.com>
In-Reply-To: <20240628161726.836734-1-lucas.demarchi@intel.com>
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

Series: drm/xe/rtp: Fix out-of-bounds array access (rev2)
URL   : https://patchwork.freedesktop.org/series/135527/
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
commit 4bcae3cc1c39f69ba236e06bc90d2aefb7dfbc4d
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Jun 28 09:17:26 2024 -0700

    drm/xe/rtp: Fix out-of-bounds array access
    
    Increment the counter before checking for number of rules, otherwise
    when there's no XE_RTP_MATCH_OR an out-of-bounds access is done, as
    reported by kasan:
    
            BUG: KASAN: global-out-of-bounds in rule_matches+0xb6d/0x11c0 [xe]
            Read of size 1 at addr ffffffffa0a50b70 by task systemd-udevd/243
    
    Fixes: dc72c52a42e0 ("drm/xe/rtp: Allow to OR rules")
    Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 886eeb6d89b58f914ee5045fcac54b59a73d8299 drm-intel
4bcae3cc1c39 drm/xe/rtp: Fix out-of-bounds array access


