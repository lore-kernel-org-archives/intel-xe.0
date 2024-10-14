Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6ECCFC500
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 08:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FDE10E3D0;
	Mon, 14 Oct 2024 08:33:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3353C10E3CE;
 Mon, 14 Oct 2024 08:33:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_support_for_3_VDSC_en?=
 =?utf-8?q?gines_12_slices_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Oct 2024 08:33:05 -0000
Message-ID: <172889478520.1247056.4296513326474975131@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241014081000.2844245-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241014081000.2844245-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for 3 VDSC engines 12 slices (rev2)
URL   : https://patchwork.freedesktop.org/series/139933/
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
commit 79acc50d4c6b3a8d9b75649a55926db8d4523eef
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Oct 14 13:40:00 2024 +0530

    drm/i915/dp: Add support for 3 vdsc engines and 12 slices.
    
    Certain resolutions require 12 DSC slices support along with ultrajoiner.
    For such cases, the third VDSC Engine per Pipe is enabled. Each VDSC
    Engine processes 1 Slice, resulting in a total of 12 VDSC Instances
    (4 Pipes * 3 VDSC Instances per Pipe).
    Add support for 12 DSC slices and 3 VDSC engines for such modes.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch b3b6cc77bee51d59ae1b3d2e534b05d2a635dc90 drm-intel
65656903010a drm/i915/display: Prepare for dsc 3 stream splitter
e74fab005535 drm/i915/vdsc: Use VDSC0/VDSC1 for LEFT/RIGHT VDSC engine
1c552cf444f0 drm/i915/vdsc: Add register bits for VDSC2 engine
7b2be4fe41e6 drm/i915/vdsc: Add support for read/write PPS for DSC3
c3979c7ed8bc drm/i915/dp: Add check for hdisplay divisible by slice count
cedaabb4f412 drm/i915/display: Add DSC pixel replication
a09b729708f3 drm/i915/dp: Compute pixel replication count for DSC 12 slices case
3d4d4ff60deb drm/i915/dsc: Account for Odd pixel removal
79acc50d4c6b drm/i915/dp: Add support for 3 vdsc engines and 12 slices.


