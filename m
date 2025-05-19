Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890D0C2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 13:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5147410E10F;
	Mon, 19 May 2025 13:56:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609A110E10F;
 Mon, 19 May 2025 13:56:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=5Fmst=3A_Work?=
 =?utf-8?q?_around_Thunderbolt_sink_disconnect_after_SINK=5FCOUNT=5FESI_read?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 May 2025 13:56:50 -0000
Message-ID: <174766301038.12.6664913751762861915@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250516170946.1313722-1-imre.deak@intel.com>
In-Reply-To: <20250516170946.1313722-1-imre.deak@intel.com>
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

Series: drm/i915/dp_mst: Work around Thunderbolt sink disconnect after SINK_COUNT_ESI read (rev2)
URL   : https://patchwork.freedesktop.org/series/149130/
State : warning

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
commit 10c1b8120a8176065135e16333168b13e03c73a6
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon May 19 16:34:17 2025 +0300

    drm/i915/dp_mst: Work around Thunderbolt sink disconnect after SINK_COUNT_ESI read
    
    Due to a problem in the iTBT DP-in adapter's firmware the sink on a TBT
    link may get disconnected inadvertently if the SINK_COUNT_ESI and the
    DP_LINK_SERVICE_IRQ_VECTOR_ESI0 registers are read in a single AUX
    transaction. Work around the issue by reading these registers in
    separate transactions.
    
    The issue affects MTL+ platforms and will be fixed in the DP-in adapter
    firmware, however releasing that firmware fix may take some time and is
    not guaranteed to be available for all systems. Based on this apply the
    workaround on affected platforms.
    
    See HSD #13013007775.
    
    v2: Cc'ing Mika Westerberg.
    
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13760
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14147
    Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Imre Deak <imre.deak@intel.com>
    Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
+ /mt/dim checkpatch 36da6a9300fc8686d01b5450723200dafd89526f drm-intel
10c1b8120a81 drm/i915/dp_mst: Work around Thunderbolt sink disconnect after SINK_COUNT_ESI read
-:56: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 23 lines checked


