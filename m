Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57368C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 04:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9A110E107;
	Tue, 30 Jul 2024 04:14:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C7010E107;
 Tue, 30 Jul 2024 04:14:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_i915/display/dp=3A_Comput?=
 =?utf-8?q?e_AS_SDP_when_vrr_is_also_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Jul 2024 04:14:44 -0000
Message-ID: <172231288488.426984.13347031593795158886@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725133110.112401-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20240725133110.112401-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: i915/display/dp: Compute AS SDP when vrr is also enabled
URL   : https://patchwork.freedesktop.org/series/136650/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7b537a014c4c1a32250e342541870b03977fa7a4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9d68ae4539f150d5b5ced9b266fdfcf49eace5f6
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Tue Jul 30 09:39:40 2024 +0530

    i915/display/dp: Compute AS SDP when vrr is also enabled
    
    AS SDP should be computed when VRR timing generator is also enabled.
    Correct the compute condition to compute params of Adaptive sync SDP
    when VRR timing genrator is enabled along with sink support indication.
    
    --v2:
    Modify if condition (Jani).
    
    Fixes: b2013783c445 ("drm/i915/display: Cache adpative sync caps to use it later")
    Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Cc: Arun R Murthy <arun.r.murthy@intel.com>
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Cc: intel-gfx@lists.freedesktop.org
    Cc: intel-xe@lists.freedesktop.org
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch b6f9528c7fffc2f65c8e4969d35d9346fd503c9b drm-intel
9d68ae4539f1 i915/display/dp: Compute AS SDP when vrr is also enabled


