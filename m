Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DA8C021A4
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 08:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E915F10E03A;
	Thu, 13 Feb 2025 08:32:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567B610E03A;
 Thu, 13 Feb 2025 08:32:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/hdcp=3A_Create_f?=
 =?utf-8?q?orce=5Fhdcp14_debug_fs_entry_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 08:32:54 -0000
Message-ID: <173943557434.1599031.12080931260795867192@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213082541.3772212-1-suraj.kandpal@intel.com>
In-Reply-To: <20250213082541.3772212-1-suraj.kandpal@intel.com>
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

Series: drm/i915/hdcp: Create force_hdcp14 debug fs entry (rev3)
URL   : https://patchwork.freedesktop.org/series/144460/
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
commit 30a9f6ca9600a727f50846d37598caa30778ada6
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Feb 13 13:55:42 2025 +0530

    drm/i915/hdcp: Create force_hdcp14 debug fs entry
    
    Testing HDCP 1.4 becomes tough since the only way our code comes to
    HDCP 1.4 pathway is if the monitor only supports HDCP 1.4 which
    becomes tough to find sometimes.
    Setting this debug_fs entry will force use to use the HDCP 1.4 path
    so that more robust HDCP 1.4 testing can take place.
    
    --v2
    -Move the code to intel_hdcp.c [Jani]
    -Remove useless debug logging [Jani]
    -Remove Force_HDCP from the debug file [Jani]
    
    --v3
    -Remove leftover debug loggings [Jani]
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 29cb041089384718629a4357f6d0d44bfe313cb5 drm-intel
30a9f6ca9600 drm/i915/hdcp: Create force_hdcp14 debug fs entry


