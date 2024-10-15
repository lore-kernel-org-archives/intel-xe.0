Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB34CFC26E
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 06:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3589710E2AA;
	Tue, 15 Oct 2024 06:17:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6032010E2AA;
 Tue, 15 Oct 2024 06:17:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_6k_resolution_support?=
 =?utf-8?q?_for_a_single_CRTC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Oct 2024 06:17:35 -0000
Message-ID: <172897305539.1267823.18416131628447398824@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241015061011.2087826-1-suraj.kandpal@intel.com>
In-Reply-To: <20241015061011.2087826-1-suraj.kandpal@intel.com>
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

Series: Add 6k resolution support for a single CRTC
URL   : https://patchwork.freedesktop.org/series/139979/
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
commit 0baf933ec221c88f16ce18b27f5a95dcb5bde066
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Oct 15 11:40:11 2024 +0530

    drm/i915/xe3lpd: Prune modes for YUV420
    
    We only support resolution up to 4k for single pipe when using
    YUV420 format so we prune these modes and restrict the plane size
    at src.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch f6087efed4047ae323633876dc9b3222bee4ec41 drm-intel
5980bcfa2a26 drm/i915/xe3lpd: Increase resolution for plane to support 6k
24de16399486 drm/i915/xe3lpd: Increase max_h max_v for PSR
1fca3fba893d drm/i914/xe3lpd: Increase bigjoiner limitations
0baf933ec221 drm/i915/xe3lpd: Prune modes for YUV420


