Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B0CCAC59A
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 21:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2689510EA9E;
	Fri, 19 Sep 2025 21:59:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340D310EA9E;
 Fri, 19 Sep 2025 21:59:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?b?4pyXIENJLmNoZWNrcGF0Y2g6IHdhcm5pbmcgZm9yIGRybS9pOTE1OiByZW5hbWUg?=
 =?utf-8?b?dmx2X2dldF9jY2tfY2xvY2soKSB0byB2bHZfY2xvY2tfZ2V0X2Njaygp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Sep 2025 21:59:48 -0000
Message-ID: <175831918820.350138.659599111755948397@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250919215413.1006296-1-michal.grzelak@intel.com>
In-Reply-To: <20250919215413.1006296-1-michal.grzelak@intel.com>
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

Series: drm/i915: rename vlv_get_cck_clock() to vlv_clock_get_cck()
URL   : https://patchwork.freedesktop.org/series/154800/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 28f5b3f2df9c84dec1d9266451ae82527c8fd0a1
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Fri Sep 19 23:54:13 2025 +0200

    drm/i915: rename vlv_get_cck_clock() to vlv_clock_get_cck()
    
    Keep the convention of naming vlv_clock* instead of vlv_*_clock.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
+ /mt/dim checkpatch 6279a928fb7ed7a69e44171637abf2bf50668a9c drm-intel
28f5b3f2df9c drm/i915: rename vlv_get_cck_clock() to vlv_clock_get_cck()
-:40: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#40: FILE: drivers/gpu/drm/i915/display/vlv_clock.c:70:
+		display->vlv_clock.czclk_freq = vlv_clock_get_cck(drm, "czclk", CCK_CZ_CLOCK_CONTROL,

total: 0 errors, 1 warnings, 0 checks, 38 lines checked


