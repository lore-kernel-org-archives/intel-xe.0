Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F94C3600B
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 04:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED2C10E102;
	Wed, 26 Mar 2025 04:23:16 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C3610E102;
 Wed, 26 Mar 2025 04:23:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_VRR_Register_Read/Write_U?=
 =?utf-8?q?pdates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Mar 2025 04:23:15 -0000
Message-ID: <174296299533.3802.10609260615356094026@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326040538.504861-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250326040538.504861-1-ankit.k.nautiyal@intel.com>
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

Series: VRR Register Read/Write Updates
URL   : https://patchwork.freedesktop.org/series/146777/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a65df8f4c9615600d417ae1f1d1f0d6bea0f0ce4
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Wed Mar 26 09:35:38 2025 +0530

    drm/i915/display: Avoid use of VTOTAL.Vtotal bits
    
    For platforms that always use VRR Timing Generator, the VTOTAL.Vtotal
    bits are not required. Since the support for these bits is going to
    be deprecated in upcoming platforms, avoid writing these bits for the
    platforms that do not use legacy Timing Generator.
    
    Since for these platforms TRAN_VMIN is always filled with crtc_vtotal,
    use TRAN_VRR_VMIN to get the vtotal for adjusted_mode.
    
    v2: Avoid having a helper for manipulating VTOTAL register, and instead
    just make the change where required. (Ville)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch afc2e1fea0a406eedbaf632e96cdb6832a45ebb7 drm-intel
7e606dc8633e drm/i915/display: Introduce transcoder_has_vrr() helper
a65df8f4c961 drm/i915/display: Avoid use of VTOTAL.Vtotal bits


