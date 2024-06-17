Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8762C2BA15
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 14:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E65610E402;
	Mon, 17 Jun 2024 14:50:06 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836AC10E402;
 Mon, 17 Jun 2024 14:50:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_make_struct_i?=
 =?utf-8?q?ntel=5Ffrontbuffer_opaque?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jun 2024 14:50:04 -0000
Message-ID: <171863580453.96445.10135233273799306419@a6498e030952>
X-Patchwork-Hint: ignore
References: <cover.1718633874.git.jani.nikula@intel.com>
In-Reply-To: <cover.1718633874.git.jani.nikula@intel.com>
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

Series: drm/i915: make struct intel_frontbuffer opaque
URL   : https://patchwork.freedesktop.org/series/134956/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b083f7f593ba28e18a0658032051527786d558a1
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Jun 17 17:19:02 2024 +0300

    drm/i915/frontbuffer: make struct intel_frontbuffer opaque
    
    Hide struct intel_frontbuffer implementation details within
    intel_frontbuffer.c.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch c00c421245452a4a82a893cd2e1bfd9663a761fb drm-intel
939978e71d87 drm/i915/frontbuffer: un-inline frontbuffer bits checks
d49a78c91263 drm/i915/frontbuffer: hide ->bits more
2c5b836be197 drm/i915/frontbuffer: add low-level kref accessors
97ad4b231b4f drm/i915/frontbuffer: hide ->write
b083f7f593ba drm/i915/frontbuffer: make struct intel_frontbuffer opaque


