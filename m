Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809E6C02185
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 06:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4403410EA56;
	Fri, 17 Jan 2025 06:04:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B2710EA5D;
 Fri, 17 Jan 2025 06:04:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Correct_ma?=
 =?utf-8?q?x_compressed_bpp_bounds_by_using_link_bpp_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 06:04:48 -0000
Message-ID: <173709388852.588872.7914019128318501615@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117050713.152012-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250117050713.152012-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/dp: Correct max compressed bpp bounds by using link bpp (rev2)
URL   : https://patchwork.freedesktop.org/series/143596/
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
commit 85858157ff9e2cf068633e3ac5d445985552b171
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri Jan 17 10:37:13 2025 +0530

    drm/i915/dp: Correct max compressed bpp bounds by using link bpp
    
    While setting the bounds for compressed bpp, we ensure that the
    compressed bpp is less than the pipe bpp.
    
    This causes an issue with the 420 output format, where the effective
    link bpp (or output bpp) is half that of the pipe bpp. Therefore instead
    of using pipe bpp, use the output bpp to set the bounds for the
    compressed bpp.
    
    v2: Use identifier output_bpp instead of link_bpp (Imre)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch d8c883b9b7702b39eb913a72fd7158ad9a6ea11f drm-intel
85858157ff9e drm/i915/dp: Correct max compressed bpp bounds by using link bpp


