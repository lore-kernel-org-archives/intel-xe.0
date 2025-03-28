Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F345C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 16:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5809410EA7D;
	Fri, 28 Mar 2025 16:36:28 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7372E10EA7B;
 Fri, 28 Mar 2025 16:36:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Expose_modifiers/formats_?=
 =?utf-8?q?supported_by_async_flips_=28rev14=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Mar 2025 16:36:27 -0000
Message-ID: <174317978746.16128.1652289205448500482@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
In-Reply-To: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
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

Series: Expose modifiers/formats supported by async flips (rev14)
URL   : https://patchwork.freedesktop.org/series/140934/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9eff0a1969cce3849e91d11e0b3e98fe47ca3f8a
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Fri Mar 28 21:26:24 2025 +0530

    drm/i915/display: Indexed 8bit format does not support async flip
    
    Async flip is not supported with Indexed 8 bit format as it depends on
    LUT and can't be updated atomically.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 4cac9bb1b5db81d533be95f97dd30c03a8733871 drm-intel
79ae6f2ed79b drm/plane: Add new plane property IN_FORMATS_ASYNC
cf1b5af8c955 drm/plane: modify create_in_formats to acommodate async
98e8625d655c drm/i915/display: Acomodate format check in intel_plane_can_async_flip()
0e4857abb156 drm/i915/display: Add i915 hook for format_mod_supported_async
9eff0a1969cc drm/i915/display: Indexed 8bit format does not support async flip


