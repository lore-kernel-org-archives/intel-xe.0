Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C45D2124B
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 08:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B5810E1CF;
	Thu, 17 Oct 2024 08:42:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB5810E1CF;
 Thu, 17 Oct 2024 08:42:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_support_for_3_VDSC_en?=
 =?utf-8?q?gines_12_slices_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Oct 2024 08:42:33 -0000
Message-ID: <172915455318.1277717.9407335980240990034@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241017082348.3413727-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241017082348.3413727-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for 3 VDSC engines 12 slices (rev3)
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
commit c481a39c23169810aee4f13c9f5fdcc1c3018704
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Oct 17 13:53:48 2024 +0530

    drm/i915/dp: Add support for 3 vdsc engines and 12 slices.
    
    Certain resolutions require 12 DSC slices support along with ultrajoiner.
    For such cases, the third VDSC Engine per Pipe is enabled. Each VDSC
    Engine processes 1 Slice, resulting in a total of 12 VDSC Instances
    (4 Pipes * 3 VDSC Instances per Pipe).
    Add support for 12 DSC slices and 3 VDSC engines for such modes.
    
    v2: Add missing check for 3 slices support only with 4 joined pipes.
    (Suraj)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 6f9cc21188c822a692fbbcfaa7cb40cbd8082df0 drm-intel
ea38abd005a7 drm/i915/display: Prepare for dsc 3 stream splitter
71d225049ef7 drm/i915/vdsc: Use VDSC0/VDSC1 for LEFT/RIGHT VDSC engine
a0684e91ccbf drm/i915/vdsc: Add register bits for VDSC2 engine
fb852b9b76a4 drm/i915/vdsc: Add support for read/write PPS for DSC3
e3d78588be97 drm/i915/dp: Add check for hdisplay divisible by slice count
cb957e75696a drm/i915/display: Add DSC pixel replication
5b964dd73e1b drm/i915/dp: Compute pixel replication count for DSC 12 slices case
328bd6afad00 drm/i915/display: Account for pixel replication in pipe_src
6888f12e0900 drm/i915/dsc: Account for Odd pixel removal
c481a39c2316 drm/i915/dp: Add support for 3 vdsc engines and 12 slices.


