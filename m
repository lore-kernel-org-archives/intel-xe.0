Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9277EC5AE59
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 01:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4349D10E398;
	Tue, 27 May 2025 01:38:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8D710E398;
 Tue, 27 May 2025 01:38:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_quirk_for_panels_that?=
 =?utf-8?q?_support_HBR3_without_TPS4_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 01:38:22 -0000
Message-ID: <174830990203.22163.283646735734235292@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250514084356.1558407-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250514084356.1558407-1-ankit.k.nautiyal@intel.com>
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

Series: Add quirk for panels that support HBR3 without TPS4 (rev2)
URL   : https://patchwork.freedesktop.org/series/149004/
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
commit 33c6a5422f20f961c845606a3432ca9fa9ac5071
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Wed May 14 14:13:56 2025 +0530

    drm/dp: Add quirk for panel with HBR3 without TPS4
    
    For DP, TPS4 is a requirement for supporting HBR3, but for eDP its a
    bit ambiguous. Some broken eDP sinks declare support for HBR3 without
    TPS4, but are unable to produce a stable output. For these panels
    add a quirk to reject HBR3 rate if TPS4 is not supported.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
876ae8104d42 Revert "drm/i915/dp: Reject HBR3 when sink doesn't support TPS4"
33c6a5422f20 drm/dp: Add quirk for panel with HBR3 without TPS4


