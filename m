Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99994C3600C
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 09:13:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550A010E3A3;
	Mon, 31 Mar 2025 09:13:53 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF16310E3A7;
 Mon, 31 Mar 2025 09:13:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/psr=3A_Prevent_D?=
 =?utf-8?q?P_Panel_Replay_as_well_when_CRC_is_enable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Mar 2025 09:13:52 -0000
Message-ID: <174341243297.19320.17809805188939192120@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250331090747.2964028-1-jouni.hogander@intel.com>
In-Reply-To: <20250331090747.2964028-1-jouni.hogander@intel.com>
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

Series: drm/i915/psr: Prevent DP Panel Replay as well when CRC is enable
URL   : https://patchwork.freedesktop.org/series/147013/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b66b2fcaff512d8a6a4cf7bfcfd600988c201da5
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Mon Mar 31 12:07:47 2025 +0300

    drm/i915/psr: Prevent DP Panel Replay as well when CRC is enable
    
    We are seeing timeouts in opening CRC fd when testing on setup where DP
    Panel Replay can be enabled. Fix these by checking if CRC is enabled for DP
    Panel Replay as well.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch bddac84ead9a05c92f47845e6ef4f3f64ca53444 drm-intel
b66b2fcaff51 drm/i915/psr: Prevent DP Panel Replay as well when CRC is enable


