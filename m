Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09B9D5E147
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 08:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D53110E939;
	Fri,  8 Nov 2024 08:55:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA5C10E939;
 Fri,  8 Nov 2024 08:55:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/watermark=3A_Mod?=
 =?utf-8?q?ify_latency_programmed_into_PKG=5FC=5FLATENCY?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Nov 2024 08:55:47 -0000
Message-ID: <173105614751.1426263.5819556862285505850@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241108085048.919665-1-suraj.kandpal@intel.com>
In-Reply-To: <20241108085048.919665-1-suraj.kandpal@intel.com>
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

Series: drm/i915/watermark: Modify latency programmed into PKG_C_LATENCY
URL   : https://patchwork.freedesktop.org/series/141092/
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
commit ac3e8df001fd9f49acfc0e221a5178a03e8b122a
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Nov 8 14:20:49 2024 +0530

    drm/i915/watermark: Modify latency programmed into PKG_C_LATENCY
    
    Increase the latency programmed into PKG_C_LATENCY latency to be
    a multiple of line time which is written into WM_LINETIME.
    
    --v2
    -Fix commit subject line [Sai Teja]
    -Use individual DISPLAY_VER checks instead of range [Sai Teja]
    -Initialize max_linetime [Sai Teja]
    
    WA: 22020299601
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 5f445c6723de9ac7087170f4ee8fcb2050ab8346 drm-intel
ac3e8df001fd drm/i915/watermark: Modify latency programmed into PKG_C_LATENCY


