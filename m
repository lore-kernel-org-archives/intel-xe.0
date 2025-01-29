Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C16BC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 16:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D9C10E835;
	Wed, 29 Jan 2025 16:32:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C503110E835;
 Wed, 29 Jan 2025 16:32:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/6=5D_drm/i915/dp=3A_constify_struct_link=5Fconfig=5Flimits_point?=
 =?utf-8?q?ers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 16:32:25 -0000
Message-ID: <173816834580.2489503.3355137206708131683@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1738161945.git.jani.nikula@intel.com>
In-Reply-To: <cover.1738161945.git.jani.nikula@intel.com>
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

Series: series starting with [1/6] drm/i915/dp: constify struct link_config_limits pointers
URL   : https://patchwork.freedesktop.org/series/144106/
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
commit 85adbb8162439f11ff16cda852103018dc9f74a9
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Jan 29 16:46:38 2025 +0200

    drm/i915/mst: use min_array() and max_array() instead of hand-rolling
    
    Improve code clarity by using existing min_array() and max_array()
    helpers to find the lowest and highest values in an array.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch bdfc862a5c719d934efbdedb050ef891b9feef15 drm-intel
ee1843fedb03 drm/i915/dp: constify struct link_config_limits pointers
8e5574335fc9 drm/i915/dp: change the order of intel_dp_mtp_tu_compute_config() params
e6079f40885c drm/i915/mst: change where lane_count and port_clock are set
d4acab971741 drm/i915/mst: handle mst pbn_div in intel_dp_mtp_tu_compute_config()
7a36f489bc53 drm/i915/mst: remove unnecessary mst_stream_find_vcpi_slots_for_bpp()
85adbb816243 drm/i915/mst: use min_array() and max_array() instead of hand-rolling


