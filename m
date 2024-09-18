Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FE7CDD55C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 22:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB3810E20D;
	Wed, 18 Sep 2024 22:22:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A0510E20D;
 Wed, 18 Sep 2024 22:22:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/pps=3A_hide_VLV/?=
 =?utf-8?q?CHV_PPS_pipe_stuff_inside_intel=5Fpps=2Ec_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 22:22:44 -0000
Message-ID: <172669816427.1027297.5422180129250871486@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1726681620.git.jani.nikula@intel.com>
In-Reply-To: <cover.1726681620.git.jani.nikula@intel.com>
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

Series: drm/i915/pps: hide VLV/CHV PPS pipe stuff inside intel_pps.c (rev2)
URL   : https://patchwork.freedesktop.org/series/138403/
State : success

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
commit 63b45d06ab2bf5798d6645cb82bb857a5ff66cf0
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Sep 18 20:47:49 2024 +0300

    drm/i915/pps: move vlv_active_pipe() to intel_pps.c
    
    All the users for vlv_active_pipe() are within intel_pps.c now, and
    there are already uses of g4x_dp_port_enabled() and intel_dp->output_reg
    in there, so seems fine to reduce interfaces and move vlv_active_pipe()
    to intel_pps.c too.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 2141344f9b4f0bcd6bb20a45afaef94209743c0d drm-intel
caeca55f7de3 drm/i915/pps: add vlv_ prefix to pps_pipe and active_pipe members
0b64ee245b45 drm/i915/pps: add bxt_ prefix to pps_reset
2e57888f70db drm/i915/pps: only touch the vlv_ members on VLV/CHV
f8738b096b8e drm/i915/pps: add vlv_pps_pipe_init()
0787c3b6d72f drm/i915/pps: add vlv_pps_pipe_reset()
9a7bef177791 drm/i915/pps: add vlv_pps_port_disable()
9b0ea3faf3be drm/i915/pps: rename vlv_pps_init() to vlv_pps_port_enable_unlocked()
cec03d919c0b drm/i915/pps: add vlv_pps_backlight_initial_pipe()
63b45d06ab2b drm/i915/pps: move vlv_active_pipe() to intel_pps.c


