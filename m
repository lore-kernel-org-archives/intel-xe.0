Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE07FC43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 17:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8462310E0A2;
	Thu,  9 Jul 2026 17:05:07 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F222510E0A2;
 Thu,  9 Jul 2026 17:05:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Gate_UHBR_?=
 =?utf-8?q?SST_SDP_splitting_on_sink_capability?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jul 2026 17:05:05 -0000
Message-ID: <178361670598.171724.324303263073421013@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260709164903.1949947-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260709164903.1949947-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: drm/i915/dp: Gate UHBR SST SDP splitting on sink capability
URL   : https://patchwork.freedesktop.org/series/170143/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7857c5984d22fac50255fe3905cb6dc3c9a34e49
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Thu Jul 9 22:19:03 2026 +0530

    drm/i915/dp: Gate UHBR SST SDP splitting on sink capability
    
    SDP splitting for 128b/132b (UHBR) SST audio must only be enabled when
    the sink advertises support for it. Previously sdp_split_enable
    was set for every UHBR SST stream carrying audio, regardless of sink
    capability.
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch 02380f41438b80a4b0cb83f407faa5005bc67668 drm-intel
7857c5984d22 drm/i915/dp: Gate UHBR SST SDP splitting on sink capability
-:61: CHECK:LINE_SPACING: Please don't use multiple blank lines
#61: FILE: drivers/gpu/drm/i915/display/intel_dp.c:4429:
+
+

total: 0 errors, 0 warnings, 1 checks, 59 lines checked


