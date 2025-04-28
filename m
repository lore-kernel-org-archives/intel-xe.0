Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D2EC369D5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 15:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BBF10E037;
	Mon, 28 Apr 2025 15:11:06 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAEC10E037;
 Mon, 28 Apr 2025 15:11:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Use_intel=5Fc?=
 =?utf-8?q?onnector_for_DP_and_HDMI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Apr 2025 15:11:04 -0000
Message-ID: <174585306484.20740.10657899965777934659@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428134716.3396802-1-imre.deak@intel.com>
In-Reply-To: <20250428134716.3396802-1-imre.deak@intel.com>
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

Series: drm/i915: Use intel_connector for DP and HDMI
URL   : https://patchwork.freedesktop.org/series/148368/
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
commit 1953bbaa5475731ca285a6d0d477f92f5563d65c
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon Apr 28 16:47:16 2025 +0300

    drm/i915/hdmi: Use an intel_connector pointer everywhere
    
    Following the convention, convert intel_hdmi.c to use an intel_connector
    pointer everywhere, calling this pointer connector. If the intel
    connector must be casted from a drm_connector, call this pointer
    _connector and use this pointer only for the casting.
    
    v2: Use for_each_new_intel_connector_in_state(). (Jani)
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 4dfede9f7f69716060d29d84a1267f893da9dbee drm-intel
e60ad3a0bfac drm/i915/dp: Use an intel_connector pointer everywhere
1953bbaa5475 drm/i915/hdmi: Use an intel_connector pointer everywhere


