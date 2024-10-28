Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E853D33992
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 15:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E696910E4E0;
	Mon, 28 Oct 2024 15:00:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83AA10E4E0;
 Mon, 28 Oct 2024 15:00:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_6k_resolution_support?=
 =?utf-8?q?_for_a_single_CRTC_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Oct 2024 15:00:44 -0000
Message-ID: <173012764481.1354457.5747075189275324231@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241028074333.182041-1-suraj.kandpal@intel.com>
In-Reply-To: <20241028074333.182041-1-suraj.kandpal@intel.com>
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

Series: Add 6k resolution support for a single CRTC (rev5)
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
commit f65fc86fd66868da940406c2955b8d8b881ccc14
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Mon Oct 28 13:13:33 2024 +0530

    drm/i914/xe3lpd: Increase bigjoiner limitations
    
    With 6k resolution support for a single crtc being added
    bigjoiner will only come into picture when hdisplay > 6144
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 24707cf2a7c47d4cd192c97e73d58aa4011de154 drm-intel
6d1dc33faeea drm/i915/xe3lpd: Increase resolution for plane to support 6k
8a1a02071b4a drm/i915/psr: Change psr size limits check
f65fc86fd668 drm/i914/xe3lpd: Increase bigjoiner limitations


