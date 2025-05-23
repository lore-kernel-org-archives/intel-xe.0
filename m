Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5232BC3DA6D
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 11:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A98F10E2C0;
	Fri, 23 May 2025 11:40:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0422710E2C0;
 Fri, 23 May 2025 11:40:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_trans_push_mechanism_?=
 =?utf-8?q?to_generate_frame_change_event_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 May 2025 11:40:46 -0000
Message-ID: <174800044601.17257.7311193557262571239@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250523110555.3494901-1-jouni.hogander@intel.com>
In-Reply-To: <20250523110555.3494901-1-jouni.hogander@intel.com>
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

Series: Use trans push mechanism to generate frame change event (rev3)
URL   : https://patchwork.freedesktop.org/series/139831/
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
commit 1b30976148fa2b1212bb7b5418be8695eef4a315
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri May 23 14:05:55 2025 +0300

    drm/i915/vrr: Use TRANS_PUSH mechanism for PSR frame change
    
    On Lunarlake and onwards it is possible to generate "PSR frame change"
    event using TRANS_PUSH mechanism. Implement function to enable this and
    take PSR into account in intel_vrr_send_push. Also use
    intel_vrr_send_push in intel_psr_trigger_frame_change_event.
    
    v3:
      - use rmw when enabling/disabling
      - keep LNL_TRANS_PUSH_PSR_PR_EN set always on LunarLake and onwards
    v2: use intel_vrr_trans_push_enabled_set_clear instead of rmw
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch b93f7d5c722241ec6d23a3f03c99a844227c50db drm-intel
0bbc292ebde0 drm/i915/psr: Do not trigger Frame Change events from frontbuffer flush
e79029a375e6 drm/i915/display: Send push before waiting vblanks
3b9657270506 drm/i915/psr: Add TRANS_PUSH register bit definition for PSR
1b30976148fa drm/i915/vrr: Use TRANS_PUSH mechanism for PSR frame change


