Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC83C5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 12:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E005710E209;
	Mon, 26 Aug 2024 12:58:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDF310E204;
 Mon, 26 Aug 2024 12:58:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Remove_dou?=
 =?utf-8?q?ble_assignment_in_intel=5Fdp=5Fcompute=5Fas=5Fsdp=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yuesong Li" <liyuesong@vivo.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Aug 2024 12:58:53 -0000
Message-ID: <172467713383.784413.11307916102896785516@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823023612.3027849-1-liyuesong@vivo.com>
In-Reply-To: <20240823023612.3027849-1-liyuesong@vivo.com>
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

Series: drm/i915/dp: Remove double assignment in intel_dp_compute_as_sdp()
URL   : https://patchwork.freedesktop.org/series/137795/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8fb02fd299cccc3297bc1732287fee683b03c94e
Author: Yuesong Li <liyuesong@vivo.com>
Date:   Fri Aug 23 10:36:12 2024 +0800

    drm/i915/dp: Remove double assignment in intel_dp_compute_as_sdp()
    
    cocci report a double assignment warning. 'as_sdp->duration_incr_ms'
    was assigned twice in intel_dp_compute_as_sdp().
    
    Signed-off-by: Yuesong Li <liyuesong@vivo.com>
+ /mt/dim checkpatch 3180bea570dadc713d6f1cc50662818d684cfb4a drm-intel
8fb02fd299cc drm/i915/dp: Remove double assignment in intel_dp_compute_as_sdp()


