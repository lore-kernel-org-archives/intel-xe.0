Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E529C02199
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 18:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6583E10E914;
	Thu,  6 Feb 2025 18:18:09 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A69A10E914;
 Thu,  6 Feb 2025 18:18:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=5Fmst=3A_Fix_?=
 =?utf-8?q?disabling_the_minimum_HBlank_time?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 18:18:08 -0000
Message-ID: <173886588816.2166030.6528171299003407542@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206164624.3185280-1-imre.deak@intel.com>
In-Reply-To: <20250206164624.3185280-1-imre.deak@intel.com>
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

Series: drm/i915/dp_mst: Fix disabling the minimum HBlank time
URL   : https://patchwork.freedesktop.org/series/144431/
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
commit aac60e2d0b752d5b08cd7960358841daf798a29b
Author: Imre Deak <imre.deak@intel.com>
Date:   Thu Feb 6 18:46:24 2025 +0200

    drm/i915/dp_mst: Fix disabling the minimum HBlank time
    
    Disable the minimum HBlank time only on LNL+, where this functionality
    and corresponding register exists.
    
    Fixes: a5ebe00c2ace ("drm/i915/dp: Guarantee a minimum HBlank time")
    Cc: Arun R Murthy <arun.r.murthy@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 68225b9bc1d285bd2ab63355e94f9e661d2f895e drm-intel
aac60e2d0b75 drm/i915/dp_mst: Fix disabling the minimum HBlank time


