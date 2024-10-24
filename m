Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE200D0BB62
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 20:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8913010E3B2;
	Thu, 24 Oct 2024 20:27:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0E010E3B2;
 Thu, 24 Oct 2024 20:27:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_6k_resolution_support?=
 =?utf-8?q?_for_a_single_CRTC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 20:27:46 -0000
Message-ID: <172980166610.1327227.12477798547033441604@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241024035552.94363-1-suraj.kandpal@intel.com>
In-Reply-To: <20241024035552.94363-1-suraj.kandpal@intel.com>
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

Series: Add 6k resolution support for a single CRTC (rev2)
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
commit 46043549b642767e8c2bf3a4206f344cb6de8576
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Oct 24 09:25:52 2024 +0530

    drm/i915/xe3lpd: Prune modes for YUV420
    
    We only support resolution up to 4k for single pipe when using
    YUV420 format so we prune these modes and restrict the plane size
    at src.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 4a625fda23b27dd0fc6007ac5ba422a0fe6dfe48 drm-intel
30604e6960c6 drm/i915/xe3lpd: Increase resolution for plane to support 6k
e118e343c64a drm/i915/xe3lpd: Increase max_h max_v for PSR
0a1051a77c10 drm/i914/xe3lpd: Increase bigjoiner limitations
46043549b642 drm/i915/xe3lpd: Prune modes for YUV420


