Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079D4D462BF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 15:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0D810E723;
	Wed, 13 Nov 2024 15:24:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2499A10E723;
 Wed, 13 Nov 2024 15:24:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display/xe3lpd?=
 =?utf-8?q?=3A_Avoid_setting_YUV420=5FMODE_in_PIPE=5FMISC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 15:24:29 -0000
Message-ID: <173151146914.3650263.13411278986306393457@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113115531.3394962-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241113115531.3394962-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/display/xe3lpd: Avoid setting YUV420_MODE in PIPE_MISC
URL   : https://patchwork.freedesktop.org/series/141284/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 87bc96a6fd633f8994846dc60bb33d02f166ea3a
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Wed Nov 13 17:25:31 2024 +0530

    drm/i915/display/xe3lpd: Avoid setting YUV420_MODE in PIPE_MISC
    
    For Xe3_LPD the PIPE_MISC YUV420 Enable (bit 27), already implies enabling
    full blend YUV420 mode and YUV420 Mode (bit 26) is removed.
    Therefore, avoid setting YUV420 Mode for Xe3_LPD+ while programming
    PIPE_MISC for YCbCr420 output format.
    
    Bspec: 69749
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 169c7cd31a373ed31054abb423981856eb5fb119 drm-intel
87bc96a6fd63 drm/i915/display/xe3lpd: Avoid setting YUV420_MODE in PIPE_MISC


