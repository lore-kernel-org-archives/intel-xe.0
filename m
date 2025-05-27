Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF16C54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 05:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E223D10E086;
	Tue, 27 May 2025 05:54:34 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246F510E0BE;
 Tue, 27 May 2025 05:54:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Allow_HBR3?=
 =?utf-8?q?_without_TPS4_support_for_eDP_panels?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 05:54:33 -0000
Message-ID: <174832527312.22871.17227534459574787182@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520072023.1661211-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250520072023.1661211-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/dp: Allow HBR3 without TPS4 support for eDP panels
URL   : https://patchwork.freedesktop.org/series/149229/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3b7e72922fbec6197c0fe816b466432c7ba58cd7
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue May 20 12:50:23 2025 +0530

    drm/i915/dp: Allow HBR3 without TPS4 support for eDP panels
    
    Commit 584cf613c24a ("drm/i915/dp: Reject HBR3 when sink doesn't support
    TPS4") introduced a blanket rejection of HBR3 link rate when the sink does
    not support TPS4. While this was intended to address instability observed
    on certain eDP panels [1], the TPS4 requirement is only mandated for DPRX
    and not for eDPRX.
    
    This change inadvertently causes blank screens on some eDP panels that do
    not advertise TPS4 support, and require HBR3 to operate at their fixed
    native resolution.
    
    To restore functionality for such panels do not reject HBR3 when sink
    doesn't support TPS4. Instead reject HBR3 for specific panel that are
    not able to handle HBR3 [1].
    
    [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5969
    
    Fixes: 584cf613c24a ("drm/i915/dp: Reject HBR3 when sink doesn't support TPS4")
    Cc: stable@vger.kernel.org
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
3b7e72922fbe drm/i915/dp: Allow HBR3 without TPS4 support for eDP panels


