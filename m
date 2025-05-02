Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF67C3ABAC
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 09:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C1510E8C3;
	Fri,  2 May 2025 09:00:58 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5670A10E8C3;
 Fri,  2 May 2025 09:00:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_remov?=
 =?utf-8?q?e_intel=5Fde=5F*=28=29_compat_wrappers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 May 2025 09:00:57 -0000
Message-ID: <174617645734.34266.7356714601490936395@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1746175756.git.jani.nikula@intel.com>
In-Reply-To: <cover.1746175756.git.jani.nikula@intel.com>
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

Series: drm/i915/display: remove intel_de_*() compat wrappers (rev2)
URL   : https://patchwork.freedesktop.org/series/148181/
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
commit ceed8249e8ccf2e921f07cc65873b649dab4795a
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri May 2 11:49:56 2025 +0300

    drm/i915/de: drop drm_i915_private compat wrappers from intel_de_*()
    
    All the users of intel_de_*() functions now pass in struct
    intel_display, and we can remove the __to_intel_display() _Generic()
    compat wrappers.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch cdf42c84d8714384d23c24b5ef5f726c0061a028 drm-intel
f9cfce8234fa drm/i915/dpt: convert intel_dpt_common.c to struct intel_display
40fba4792bce drm/i915/hdmi: convert rest of intel_hdmi.c to struct intel_display
ceed8249e8cc drm/i915/de: drop drm_i915_private compat wrappers from intel_de_*()


