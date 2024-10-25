Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C70D116F7
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 06:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EE810E2A6;
	Fri, 25 Oct 2024 06:08:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C4B10E2A6;
 Fri, 25 Oct 2024 06:08:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_6k_resolution_support?=
 =?utf-8?q?_for_a_single_CRTC_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 06:08:06 -0000
Message-ID: <172983648615.1330678.8244511364160297985@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025060136.9884-1-suraj.kandpal@intel.com>
In-Reply-To: <20241025060136.9884-1-suraj.kandpal@intel.com>
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

Series: Add 6k resolution support for a single CRTC (rev3)
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
commit 7cee7850ce6de09e2a278174461a45551dfa7dff
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Oct 25 11:31:36 2024 +0530

    drm/i914/xe3lpd: Increase bigjoiner limitations
    
    With 6k resolution support for a single crtc being added
    bigjoiner will only come into picture when hdisplay > 6144
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 75eab7b9ee32a121d95a42ac704b679097f1fac4 drm-intel
c51a51fe98d1 drm/i915/display: Fix the plane max height and width limits
5dbe1e027756 drm/i915/xe3lpd: Increase resolution for plane to support 6k
12e74b2c5376 drm/i915/psr: Increase psr size limits for Xe2
3f2b96926995 drm/i915/xe3lpd: Increase max_h max_v for PSR
7cee7850ce6d drm/i914/xe3lpd: Increase bigjoiner limitations


