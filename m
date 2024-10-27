Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBC3D13560
	for <intel-xe@archiver.kernel.org>; Sun, 27 Oct 2024 13:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016DA10E2EA;
	Sun, 27 Oct 2024 13:49:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CD610E145;
 Sun, 27 Oct 2024 13:49:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_support_for_3_VDSC_en?=
 =?utf-8?q?gines_12_slices_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 27 Oct 2024 13:49:37 -0000
Message-ID: <173003697755.1352737.12585891945702351330@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241027134557.862036-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241027134557.862036-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for 3 VDSC engines 12 slices (rev6)
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
commit 2bbe6e6ea28d2a9c565ad6b36fa656e0311af1fe
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Sun Oct 27 19:15:57 2024 +0530

    drm/i915/dp: Enable 3 DSC engines for 12 slices
    
    Certain resolutions require 12 DSC slices support along with ultrajoiner.
    For such cases, the third DSC Engine per Pipe is enabled. Each DSC
    Engine processes 1 Slice, resulting in a total of 12 VDSC slices
    (4 Pipes * 3 DSC Instances per Pipe).
    Add support for 12 DSC slices and 3 DSC engines for such modes.
    
    v2: Add missing check for 3 slices support only with 4 joined pipes.
    (Suraj)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 3ec61d11c7429a65dcc3ac46b9e845f13891a306 drm-intel
95bb3dbf56ca drm/i915/dp: Update Comment for Valid DSC Slices per Line
460d55687f4a drm/i915/display: Prepare for dsc 3 stream splitter
7479d270d760 drm/i915/vdsc: Use VDSC0/VDSC1 for LEFT/RIGHT VDSC engine
61ec849b5673 drm/i915/vdsc: Introduce 3rd VDSC engine VDSC2
db381e151383 drm/i915/vdsc: Add support for read/write PPS for 3rd DSC engine
35d73ca2d501 drm/i915/dp: Ensure hactive is divisible by slice count
2bbe6e6ea28d drm/i915/dp: Enable 3 DSC engines for 12 slices


