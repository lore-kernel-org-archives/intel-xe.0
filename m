Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDECD6EBFF
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 11:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573BE10E361;
	Fri, 29 Nov 2024 11:27:45 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A01E10E4A9;
 Fri, 29 Nov 2024 11:27:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915/display=3A_add_hdcp_sub-struct_to_struct_intel=5Fd?=
 =?utf-8?q?igital=5Fport?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Nov 2024 11:27:43 -0000
Message-ID: <173287966354.254751.14610126192074280634@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241129112012.474228-1-jani.nikula@intel.com>
In-Reply-To: <20241129112012.474228-1-jani.nikula@intel.com>
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

Series: series starting with [1/2] drm/i915/display: add hdcp sub-struct to struct intel_digital_port
URL   : https://patchwork.freedesktop.org/series/141922/
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
commit 4678e69bc1f55e199cc3c0c31a2e1ff6df0fb0f1
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Nov 29 13:20:12 2024 +0200

    drm/i915/display: add intel_dig_port_alloc()
    
    Add a common allocator function for struct intel_digital_port, with some
    member default initialization to deduplicate them from everywhere else.
    
    At least for now, place this in intel_encoder.[ch]. We don't have a
    dedicated file for dig port stuff, and there wouldn't be much to add
    there anyway. A digital port is a sort of subclass of encoder, so the
    location isn't far off the mark.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4f5b3a832a6480c82639b5500d731d7222b7eee7 drm-intel
a998fcca4437 drm/i915/display: add hdcp sub-struct to struct intel_digital_port
4678e69bc1f5 drm/i915/display: add intel_dig_port_alloc()


