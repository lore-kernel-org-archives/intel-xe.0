Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC11BCCF9F8
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 03:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB6910E312;
	Thu,  6 Nov 2025 03:52:59 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E830510E312;
 Thu,  6 Nov 2025 03:52:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915/display=3A_Add_register_definitions_for_common_SDP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Nov 2025 03:52:57 -0000
Message-ID: <176240117792.23579.12031210480498890020@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251106034729.259128-1-suraj.kandpal@intel.com>
In-Reply-To: <20251106034729.259128-1-suraj.kandpal@intel.com>
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

Series: series starting with [1/2] drm/i915/display: Add register definitions for common SDP
URL   : https://patchwork.freedesktop.org/series/157115/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7715cc68e8ecd3268e0ca29e345357c78d9314db
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Thu Nov 6 09:17:29 2025 +0530

    drm/i915/ddi: Set common SDP transmission line
    
    Set common base transmission line for eDP/DP (VSC EXT, PPS, GMP) and the
    corresponding stagerring is set to hardware defaults.
    
    Bspec: 74384, 74385
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 893c123d23de1f19f4b609970cfe56caabd9ff96 drm-intel
056e5745bab6 drm/i915/display: Add register definitions for common SDP
-:34: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#34: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1933:
+#define CMN_SDP_TL_STGR_CTL(display, trans)	_MMIO_TRANS2(display, (trans), _CMN_SDP_TL_STGR_CTL_A)

total: 0 errors, 1 warnings, 0 checks, 31 lines checked
7715cc68e8ec drm/i915/ddi: Set common SDP transmission line


