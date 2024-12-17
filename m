Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4366AE77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 23:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E12C10E2FE;
	Tue, 17 Dec 2024 23:04:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0211810E2FE;
 Tue, 17 Dec 2024 23:04:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Check_if_is_vblank_too_sh?=
 =?utf-8?q?ort?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Dec 2024 23:04:30 -0000
Message-ID: <173447667000.4012497.4836978966208310367@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217180710.1048355-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20241217180710.1048355-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Check if is vblank too short
URL   : https://patchwork.freedesktop.org/series/142746/
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
commit 5fe880d4c77da5097ccc2ac900e82de90a70ce53
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Tue Dec 17 23:37:10 2024 +0530

    drm/i915/dsc: Check if dsc prefill sufficient for vblank
    
    Check if dsc prefill latency is sufficient for vblank.
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch 69607bbcaccc29ae254d974a5e547d873e7c0ac0 drm-intel
bb84823e1dc4 drm/i915/scaler: Add and compute scaling factors
677735565d0d drm/i915/scaler: Add member to track scaler user
16c5367210d3 drm/i915/scaler: Use crtc_state to setup plane or pipe scaler
9ec2b5f31a66 drm/i915/scaler: Compute scling factors for pipe scaler
5bf4b509ffd0 drm/i915/scaler: Check if vblank is sufficient for scaler
5fe880d4c77d drm/i915/dsc: Check if dsc prefill sufficient for vblank


