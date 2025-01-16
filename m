Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4ADC02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 10:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E7B10E929;
	Thu, 16 Jan 2025 10:12:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD20510E929;
 Thu, 16 Jan 2025 10:12:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Correct_ma?=
 =?utf-8?q?x_compressed_bpp_bounds_by_using_link_bpp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Jan 2025 10:12:02 -0000
Message-ID: <173702232276.231007.1044085858525364281@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116095416.68325-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250116095416.68325-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/dp: Correct max compressed bpp bounds by using link bpp
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
commit 21e936897f01d16e22d3e56ea4c1bbea22ed9d51
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Jan 16 15:24:16 2025 +0530

    drm/i915/dp: Correct max compressed bpp bounds by using link bpp
    
    While setting the bounds for compressed bpp we ensure that the
    compressed bpp is less than the pipe bpp.
    
    This gives an issue with 420 output format where effective link bpp is
    half that of the pipe bpp. Therefore instead of pipe bpp use link bpp to
    set the bounds for the compressed bpp.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 4840e56bcc47f3af6bbc58bcc83b094540e5efa0 drm-intel
21e936897f01 drm/i915/dp: Correct max compressed bpp bounds by using link bpp


