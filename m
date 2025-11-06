Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4946CCFA13
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 14:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A07310E008;
	Thu,  6 Nov 2025 14:52:54 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA57810E008;
 Thu,  6 Nov 2025 14:52:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/rps=3A_call_rps_?=
 =?utf-8?q?functions_through_the_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Nov 2025 14:52:52 -0000
Message-ID: <176244077269.25862.10720101505552176130@10055242dc62>
X-Patchwork-Hint: ignore
References: <cover.1762440096.git.jani.nikula@intel.com>
In-Reply-To: <cover.1762440096.git.jani.nikula@intel.com>
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

Series: drm/i915/rps: call rps functions through the parent interface
URL   : https://patchwork.freedesktop.org/series/157164/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 87c8660a8fae098e6ff1c2f23f145c64caa84868
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Nov 6 16:43:13 2025 +0200

    drm/xe/rps: build RPS as part of xe
    
    Reduce the conditional compilation in i915 by building
    intel_display_rps.c as part of the xe module. This doesn't actually
    enable RPS on xe, but it's a step in the right direction.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 6aa8d62a50c33f091548cc961a713223d488d6ad drm-intel
04574e5cd0c0 drm/i915/rps: store struct dma_fence in struct wait_rps_boost
9c67deea060f drm/i915/rps: call RPS functions via the parent interface
db88dd0ebb03 drm/i915/rps: postpone i915 fence check to boost
343465870af4 drm/i915/rps: make fence priority setting part of the rps interface
-:79: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#79: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 56 lines checked
87c8660a8fae drm/xe/rps: build RPS as part of xe


