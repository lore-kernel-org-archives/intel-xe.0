Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827CBC27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 08:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D5010EF30;
	Fri, 21 Jun 2024 08:09:36 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB3510EF2F;
 Fri, 21 Jun 2024 08:09:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Consi?=
 =?utf-8?q?der_adjusted=5Fpixel=5Frate_to_be_u64?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jun 2024 08:09:35 -0000
Message-ID: <171895737544.130958.16556266534487726164@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240621073454.1421676-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20240621073454.1421676-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: drm/i915/display: Consider adjusted_pixel_rate to be u64
URL   : https://patchwork.freedesktop.org/series/135164/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8da6d85107ae36e866dafa2f94dcdfe66ad7ac83
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Fri Jun 21 13:04:54 2024 +0530

    drm/i915/display: Consider adjusted_pixel_rate to be u64
    
    Consider adjusted_pixel_rate to be a u64 to match the return
    type of mul_u32_u32() and avoid any compiler dependency for
    do_div.
    
    Fixes: 1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")
    Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Nathan Chancellor <nathan@kernel.org>
    Cc: intel-xe@lists.freedesktop.org
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch 40deb379b103746ee4c9df5f0f1919bd4703c9cc drm-intel
8da6d85107ae drm/i915/display: Consider adjusted_pixel_rate to be u64


