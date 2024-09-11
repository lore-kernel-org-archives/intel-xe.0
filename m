Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755CEEE57D0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D329810EA81;
	Wed, 11 Sep 2024 20:08:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B35210EA83;
 Wed, 11 Sep 2024 20:08:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe=3A_Fix_build_by_setting_the_correct_parameter_to_int?=
 =?utf-8?q?el=5Fdmc=5Fsuspend=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Sep 2024 20:08:48 -0000
Message-ID: <172608532836.987894.13898901087015134576@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240911200218.130219-1-jose.souza@intel.com>
In-Reply-To: <20240911200218.130219-1-jose.souza@intel.com>
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

Series: series starting with [1/3] drm/xe: Fix build by setting the correct parameter to intel_dmc_suspend()
URL   : https://patchwork.freedesktop.org/series/138542/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b52a3d3587a77d8d88b51ebd65fb9a5614d281ab
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Wed Sep 11 13:02:18 2024 -0700

    drm/xe/oa: Fix overflow in oa batch buffer
    
    By default xe_bb_create_job() appends a MI_BATCH_BUFFER_END to batch
    buffer, this is not a problem if batch buffer is only used once but
    oa reuses the batch buffer for the same metric and at each call
    it appends a MI_BATCH_BUFFER_END, printing the warning below and then
    overflowing.
    
    [  381.072016] ------------[ cut here ]------------
    [  381.072019] xe 0000:00:02.0: [drm] Assertion `bb->len * 4 + bb_prefetch(q->gt) <= size` failed!
                   platform: LUNARLAKE subplatform: 1
                   graphics: Xe2_LPG / Xe2_HPG 20.04 step B0
                   media: Xe2_LPM / Xe2_HPM 20.00 step B0
                   tile: 0 VRAM 0 B
                   GT: 0 type 1
    
    Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 16fcff5c446e35c66d7addecadabf9f362a09bf1 drm-intel
1a674d089ddc drm/xe: Fix build by setting the correct parameter to intel_dmc_suspend()
e3703daed353 drm/xe: Add a parameter to xe_bb_create_job() to append or not batch buffer end instruction
-:13: WARNING:REPEATED_WORD: Possible repeated word: 'adding'
#13: 
That will be fixed in the next patch, here just adding adding

total: 0 errors, 1 warnings, 0 checks, 84 lines checked
b52a3d3587a7 drm/xe/oa: Fix overflow in oa batch buffer


