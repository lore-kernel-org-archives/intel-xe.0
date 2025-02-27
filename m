Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0109C021BE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 09:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECFC10E30E;
	Thu, 27 Feb 2025 09:59:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF70E10E30E;
 Thu, 27 Feb 2025 09:59:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/vdsc=3A_Use_the_?=
 =?utf-8?q?DSC_config_tables_for_DSI_panels?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 09:59:16 -0000
Message-ID: <174065035697.2657113.8983693424951510556@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227095337.263091-1-suraj.kandpal@intel.com>
In-Reply-To: <20250227095337.263091-1-suraj.kandpal@intel.com>
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

Series: drm/i915/vdsc: Use the DSC config tables for DSI panels
URL   : https://patchwork.freedesktop.org/series/145560/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e9a8192e1cca43d8c1c2acf1387d593f612163a9
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Feb 27 15:23:37 2025 +0530

    drm/i915/vdsc: Use the DSC config tables for DSI panels
    
    Some DSI panel vendors end up hardcoding PPS params because of which
    it does not listen to the params sent from the source. We use the
    default config tables for DSI panels when using DSC 1.1 rather than
    calculate our own rc parameters.
    
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13719
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 5460e22a4f99bc3f40c96600528a0a4bc2318c34 drm-intel
e9a8192e1cca drm/i915/vdsc: Use the DSC config tables for DSI panels


