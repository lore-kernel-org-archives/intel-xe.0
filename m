Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EE1D6EBFD
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 10:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D9710E272;
	Fri, 29 Nov 2024 10:31:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7888510EDCA;
 Fri, 29 Nov 2024 10:31:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_repla?=
 =?utf-8?q?ce_dig=5Fport-=3Esaved=5Fport=5Fbits_with_flags?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Nov 2024 10:31:39 -0000
Message-ID: <173287629948.250258.12101591941596886909@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241129102503.452272-1-jani.nikula@intel.com>
In-Reply-To: <20241129102503.452272-1-jani.nikula@intel.com>
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

Series: drm/i915/display: replace dig_port->saved_port_bits with flags
URL   : https://patchwork.freedesktop.org/series/141919/
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
commit 33ef07235b592587e4ca88782a74411b937f738e
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Nov 29 12:25:03 2024 +0200

    drm/i915/display: replace dig_port->saved_port_bits with flags
    
    dig_port->saved_port_bits is used to permanently store two DDI_BUF_CTL
    bits, DDI_BUF_PORT_REVERSAL and DDI_A_4_LANES. Store them separately as
    bools to make their use more logical and less about storing state as
    register bits.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4f5b3a832a6480c82639b5500d731d7222b7eee7 drm-intel
33ef07235b59 drm/i915/display: replace dig_port->saved_port_bits with flags


