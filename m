Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8C1C021A4
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 06:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED7A10EA2A;
	Thu, 13 Feb 2025 06:59:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF7F10EA29;
 Thu, 13 Feb 2025 06:59:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/hdcp=3A_Create_f?=
 =?utf-8?q?orce=5Fhdcp14_debug_fs_entry_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 06:59:01 -0000
Message-ID: <173942994157.1574581.9857748959943783369@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213060259.3768384-1-suraj.kandpal@intel.com>
In-Reply-To: <20250213060259.3768384-1-suraj.kandpal@intel.com>
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

Series: drm/i915/hdcp: Create force_hdcp14 debug fs entry (rev2)
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
commit 7d89a2423b35fc26e5ac03b97b4b886076b81624
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Feb 13 11:32:59 2025 +0530

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
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 1be945721fec4f48df1fb728863be1b9a594b571 drm-intel
7d89a2423b35 drm/i915/hdcp: Create force_hdcp14 debug fs entry


