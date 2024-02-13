Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E921C4829E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 01:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9CF10E114;
	Tue, 13 Feb 2024 01:21:16 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C8310E114;
 Tue, 13 Feb 2024 01:21:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Support/debug_for_slow_Gu?=
 =?utf-8?q?C_loads_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 01:21:14 -0000
Message-ID: <170778727499.1183349.6112580086017812443@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
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

Series: Support/debug for slow GuC loads (rev2)
URL   : https://patchwork.freedesktop.org/series/129598/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d501e55f17f765c5447da8f8cdfb40c373cc6383
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Mon Feb 12 16:34:26 2024 -0800

    drm/xe/guc: Port over the slow GuC loading support from i915
    
    GuC loading can take longer than it is supposed to for various
    reasons. So add in the code to cope with that and to report it when it
    happens. There are also many different reasons why GuC loading can
    fail, so add in the code for checking for those and for reporting
    issues in a meaningful manner rather than just hitting a timeout and
    saying 'fail: status = %x'.
    
    Also, remove the 'FIXME' comment about an i915 bug that has never been
    applicable to Xe!
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch bd80d96780e6c0ce95fa6e69b2616388a1397ce9 drm-intel
ce2c99d96 drm/xe: Make read_perf_limit_reasons globally accessible
d501e55f1 drm/xe/guc: Port over the slow GuC loading support from i915


