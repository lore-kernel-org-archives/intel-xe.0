Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A5BC5478C
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 06:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AE71128A9;
	Tue,  5 Mar 2024 06:53:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA6C1128A9;
 Tue,  5 Mar 2024 06:53:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Fix_the_co?=
 =?utf-8?q?mputation_for_compressed=5Fbpp_for_DISPLAY_=3C_13?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Mar 2024 06:53:25 -0000
Message-ID: <170962160531.503981.5526412755125511871@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240305054443.2489895-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240305054443.2489895-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/dp: Fix the computation for compressed_bpp for DISPLAY < 13
URL   : https://patchwork.freedesktop.org/series/130709/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
4dc7d0cc630cdd9ac56065b1a22afc329345a519
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 66978de322273b334be8243fdec4c3376ad4753b
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue Mar 5 11:14:43 2024 +0530

    drm/i915/dp: Fix the computation for compressed_bpp for DISPLAY < 13
    
    For DISPLAY < 13, compressed bpp is chosen from a list of
    supported compressed bpps. Fix the condition to choose the
    appropriate compressed bpp from the list.
    
    Fixes: 1c56e9a39833 ("drm/i915/dp: Get optimal link config to have best compressed bpp")
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Cc: <stable@vger.kernel.org> # v6.7+
    Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10162
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch e90b5046fce6ed727427eec0d52e4f9626609ed0 drm-intel
66978de32227 drm/i915/dp: Fix the computation for compressed_bpp for DISPLAY < 13


