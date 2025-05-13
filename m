Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D978AC3ABC9
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 05:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDBB10E2F1;
	Tue, 13 May 2025 05:54:00 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A6510E324;
 Tue, 13 May 2025 05:53:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_ALPM_rework_and_fixes_=28?=
 =?utf-8?q?rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 05:53:59 -0000
Message-ID: <174711563927.73347.1630294370375128802@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513054814.3702977-1-jouni.hogander@intel.com>
In-Reply-To: <20250513054814.3702977-1-jouni.hogander@intel.com>
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

Series: ALPM rework and fixes (rev4)
URL   : https://patchwork.freedesktop.org/series/148619/
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
commit 1e179f3db41e4174d75bb4624bb022233dd3fcc6
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Tue May 13 08:48:14 2025 +0300

    drm/i915/alpm: Stop writing ALPM registers when PSR is enabled
    
    Currently we are seeing these on PTL:
    
    xe 0000:00:02.0: [drm] *ERROR* Timeout waiting for DDI BUF A to get active
    
    These seem to be caused by writing ALPM registers while Panel Replay is
    enabled.
    
    Fix this by writing ALPM registers only when Panel Replay is about to be
    enabled.
    
    v4: improve comment on intel_psr_panel_replay_enable_sink call
    v3: enable/disable ALPM from PSR code
    
    Fixes: 172757acd6f6 ("drm/i915/lobf: Add lobf enablement in post plane update")
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch ccbe266e6269fe62cb8f5d80cd9226134ea38e97 drm-intel
037095ab9707 drm/i915/alpm: Make intel_alpm_enable_sink available for PSR
1e179f3db41e drm/i915/alpm: Stop writing ALPM registers when PSR is enabled


