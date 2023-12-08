Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1594C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 04:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F8410E12E;
	Fri,  8 Dec 2023 04:12:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 158F810E14C;
 Fri,  8 Dec 2023 04:12:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 11F65AADF5;
 Fri,  8 Dec 2023 04:12:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_xe=3A_Add_IP_versions_to_?=
 =?utf-8?q?GT_query_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Fri, 08 Dec 2023 04:12:07 -0000
Message-ID: <170200872707.7327.9867161265557643106@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208002218.1287673-4-matthew.d.roper@intel.com>
In-Reply-To: <20231208002218.1287673-4-matthew.d.roper@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: xe: Add IP versions to GT query (rev2)
URL   : https://patchwork.freedesktop.org/series/127457/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ccefff048726398a2821971d5b3195a6e183a0f8
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Dec 7 16:22:21 2023 -0800

    drm/xe/uapi: Add IP version and stepping to GT list query
    
    For modern platforms (MTL and later), both kernel and userspace drivers
    are expected to apply GT programming and workarounds based on the IP
    version and stepping self-reported by the GT hardware via the GMD_ID
    registers.  Since userspace drivers can't access these registers
    directly, pass along the version and stepping information via the GT
    list query.  Note that the new query fields will remain 0's when running
    on pre-GMD_ID platforms.  Userspace is expected to continue using PCI
    devid / revid on those older platforms.
    
    Although the hardware also has a GMD_ID register for display
    version/stepping, that value is intentionally *not* included anywhere in
    the Xe uapi.  Display userspace should be using platform-agnostic APIs
    and auto-detecting platform capabilities rather than matching specific
    IP versions.
    
    v2:
     - s/revid/rev/  (Lucas)
     - Fix kerneldoc copy/paste mistakes
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 2fb92bd630cfa05b0c63fb268f0f5ebce08cce54 drm-intel
62bf3e34e drm/xe: Stash GMD_ID value in xe_gt
ccefff048 drm/xe/uapi: Add IP version and stepping to GT list query


