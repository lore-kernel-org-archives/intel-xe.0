Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D30C3DA6D
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 07:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C4010E3E3;
	Mon, 19 May 2025 07:57:53 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D3C10E3E3;
 Mon, 19 May 2025 07:57:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/psr=3A_Underrun_?=
 =?utf-8?q?on_idle_PSR_wa_only_when_pkgc_latency_=3E_delayed_vblank?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 May 2025 07:57:51 -0000
Message-ID: <174764147181.92857.3823261832877519267@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250519075223.443266-1-jouni.hogander@intel.com>
In-Reply-To: <20250519075223.443266-1-jouni.hogander@intel.com>
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

Series: drm/i915/psr: Underrun on idle PSR wa only when pkgc latency > delayed vblank
URL   : https://patchwork.freedesktop.org/series/149170/
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
commit 8a6304d56c9551582a186eb7f58e168b51809e37
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Mon May 19 10:52:23 2025 +0300

    drm/i915/psr: Underrun on idle PSR wa only when pkgc latency > delayed vblank
    
    Underrun on idle PSR workaround (Wa_16025596647) is supposed to be
    applied only when pkg c latency > delayed vblank. Currently we are
    applying it always when other criterias are met.
    
    Fix this by adding new boolean flag which is supposed to be set when
    calculating watermark levels and pkgc latency > delayed vblank is
    detected. currently this scenario is blocked but might be added
    later. Due to this add also TODO comment into
    skl_max_wm_level_for_vblank.
    
    Bspec: 74151
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch ac591277cad35a421daf3256c60e89d0a4be9fda drm-intel
8a6304d56c95 drm/i915/psr: Underrun on idle PSR wa only when pkgc latency > delayed vblank


