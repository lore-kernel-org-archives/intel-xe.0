Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294A7F44868
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 13:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E357610E95F;
	Fri, 10 Apr 2026 13:22:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB4A10E95F;
 Fri, 10 Apr 2026 13:22:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_support?=
 =?utf-8?q?_for_NO=5FRESPONSE=5FBUSY_in_CTB_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Apr 2026 13:22:24 -0000
Message-ID: <177582734417.451162.7244309891020131855@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260410110457.573-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260410110457.573-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Add support for NO_RESPONSE_BUSY in CTB (rev3)
URL   : https://patchwork.freedesktop.org/series/164357/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f6f6f91fea33eb9d2f96031bfda96a2c21af5c79
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Apr 10 13:04:57 2026 +0200

    drm/xe/guc: Add support for NO_RESPONSE_BUSY in CTB
    
    We only have support for G2H NO_RESPONSE_BUSY messages over MMIO,
    but it turned out that GuC also uses that type of messages in CTB.
    
    The following error was recently observed on BMG after adding VGT
    policy updates to the GT restart sequence:
    
     [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: G2H channel broken on read, type=3, reset required
     [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: CT dequeue failed: -95
     ...
     [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: Timed out wait for G2H, fence 21965, action 5502, done no
     [] xe 0000:03:00.0: [drm] PF: Tile0: GT1: Failed to push 1 policy KLV (-ETIME)
     [] xe 0000:03:00.0: [drm] Tile0: GT1: { key 0x8004 : no value } # engine_group_config
    
    where type=3 was this unrecognized NO_RESPONSE_BUSY message.
    
    Note that GuC might send the real RESPONSE message right after
    the BUSY message, so we must be prepared to update our g2h_fence
    data twice before sender actually wakes up and clears the flags.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 56a9321dbb8dd1a1d5e85fc86bd30c4a0d5147db drm-intel
f6f6f91fea33 drm/xe/guc: Add support for NO_RESPONSE_BUSY in CTB
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
 [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: G2H channel broken on read, type=3, reset required

total: 0 errors, 1 warnings, 0 checks, 99 lines checked


