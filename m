Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160C2E9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 10:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA7E10E288;
	Thu, 19 Feb 2026 10:45:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A7310E288;
 Thu, 19 Feb 2026 10:45:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_On_DPCD_in?=
 =?utf-8?q?it/caps_wake_the_DPRx?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Feb 2026 10:45:17 -0000
Message-ID: <177149791764.265880.15552252534672568376@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
In-Reply-To: <20260219094326.34922-1-arun.r.murthy@intel.com>
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

Series: drm/i915/dp: On DPCD init/caps wake the DPRx
URL   : https://patchwork.freedesktop.org/series/161817/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6a253cafe4938078a6bdf6897e3e24f610d69d7e
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Thu Feb 19 15:13:26 2026 +0530

    drm/i915/dp: On DPCD init/caps wake the DPRx
    
    Before reading the DPCD caps for eDP wake the sink device and for DP
    after reading the lttpr caps and before reading the dpcd caps wake up
    the sink device.
    
    Closes: https://issues.redhat.com/browse/RHEL-120913
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch c81e41f7aca96f583296a2a875f0179484b7a81f drm-intel
6a253cafe493 drm/i915/dp: On DPCD init/caps wake the DPRx
-:52: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#52: FILE: drivers/gpu/drm/i915/display/intel_dp.c:4739:
+		/* Sink in D0 or even if read fails a minimum of 1ms is required to wake and respond */

total: 0 errors, 1 warnings, 0 checks, 69 lines checked


