Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43B3C02196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 05:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6741E10E106;
	Thu,  6 Feb 2025 05:04:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4303E10E106;
 Thu,  6 Feb 2025 05:04:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Compute_as=5Fsdp_when_vrr?=
 =?utf-8?q?_is_enabled_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 05:04:46 -0000
Message-ID: <173881828627.1786638.3863639385638695885@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206045001.2919360-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250206045001.2919360-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Compute as_sdp when vrr is enabled (rev2)
URL   : https://patchwork.freedesktop.org/series/144308/
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
commit abf547590cd77fa9a2ec9f2cadff41379a343f22
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Thu Feb 6 10:20:01 2025 +0530

    Revert "drm/i915/dp: Compute as_sdp based on if vrr possible"
    
    This reverts commit 08277aa5d5a44befd71717de35b956f55e1e8401.
    
    Compute AS SDP params only when VRR is enabled to maintain
    PSR exclusivity.
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 7a632b6798b6a05b63725249e3209afea13ea499 drm-intel
c613e59c9334 drm/i915/display: Skip state checker for AS SDP infoframe enable
abf547590cd7 Revert "drm/i915/dp: Compute as_sdp based on if vrr possible"


