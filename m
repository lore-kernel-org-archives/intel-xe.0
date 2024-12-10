Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACABE7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 20:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF9710E3C4;
	Tue, 10 Dec 2024 20:00:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BF010E3C4;
 Tue, 10 Dec 2024 20:00:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Expose_dsc_sink_max_slice?=
 =?utf-8?q?_count_via_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Dec 2024 20:00:52 -0000
Message-ID: <173386085208.928132.16157049172959912488@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210164252.2118155-1-swati2.sharma@intel.com>
In-Reply-To: <20241210164252.2118155-1-swati2.sharma@intel.com>
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

Series: Expose dsc sink max slice count via debugfs
URL   : https://patchwork.freedesktop.org/series/142362/
State : warning

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
commit de0141561fcc657672a32a7456620a1e5f0f67c1
Author: Swati Sharma <swati2.sharma@intel.com>
Date:   Tue Dec 10 22:12:52 2024 +0530

    drm/i915/dsc: Expose dsc sink max slice count via debugfs
    
    Expose dsc sink max slice count via i915_dsc_fec_support debugfs.
    This debugfs entry is required in cases, where sink doesn't support
    minimum of 8 slices in case of ultrajoiner and minimum of 4 slices
    in case of big joiner.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3387
    Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
+ /mt/dim checkpatch 6fc9ce9b9be4070a485c20b372b34a7fe6a3897e drm-intel
de0141561fcc drm/i915/dsc: Expose dsc sink max slice count via debugfs
-:27: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#27: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:1021:
+				   drm_dp_dsc_sink_max_slice_count((connector->dp.dsc_dpcd), false));

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


