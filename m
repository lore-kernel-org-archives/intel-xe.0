Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A08DC55838
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 11:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0484510E155;
	Tue,  4 Aug 2026 11:45:21 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC64D10E155;
 Tue,  4 Aug 2026 11:45:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D/disp?=
 =?utf-8?q?lay=3A_add_core_workaround_query_to_display_parent_interface_=28r?=
 =?utf-8?q?ev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Aug 2026 11:45:19 -0000
Message-ID: <178584391989.17168.16284169843332769339@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260803115417.1760484-1-jani.nikula@intel.com>
In-Reply-To: <20260803115417.1760484-1-jani.nikula@intel.com>
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

Series: drm/{i915, xe}/display: add core workaround query to display parent interface (rev3)
URL   : https://patchwork.freedesktop.org/series/171199/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 11159c74a8e3ae1052a625fd6e9f9e358bfa40ae
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Aug 3 14:54:17 2026 +0300

    drm/{i915, xe}/display: add core workaround query to display parent interface
    
    There are workarounds display needs to apply depending on information
    only available to the core driver. Add a display parent interface for
    the query. For starters, there's only one workaround like this, so keep
    it simple instead of over-engineering.
    
    This lets us drop an #ifdef I915 as well as xe dependency on some
    display headers.
    
    v2: git add xe_display_wa.h
    
    v3: Add a comments about usage (Suraj)
    
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 11c46820ac5b8e1451b8d0c0b82d2b9b0b0f9e1e drm-intel
11159c74a8e3 drm/{i915, xe}/display: add core workaround query to display parent interface
-:116: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#116: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 102 lines checked


