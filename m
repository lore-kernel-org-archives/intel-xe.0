Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9656CDE001
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 17:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7963910E668;
	Thu, 25 Jun 2026 17:11:03 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB99410E668;
 Thu, 25 Jun 2026 17:11:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/hdcp=3A_check_st?=
 =?utf-8?q?reams=5B=5D_bounds_before_overflow?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jun 2026 17:11:01 -0000
Message-ID: <178240746195.118243.1653920016466460520@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625170304.1104723-1-jani.nikula@intel.com>
In-Reply-To: <20260625170304.1104723-1-jani.nikula@intel.com>
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

Series: drm/i915/hdcp: check streams[] bounds before overflow
URL   : https://patchwork.freedesktop.org/series/169210/
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
commit 3b2fa5a515f5ca3179139f790aadefdc7ef18907
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Jun 25 20:03:04 2026 +0300

    drm/i915/hdcp: check streams[] bounds before overflow
    
    The data->streams[] overflow check is done after the buffer overflow has
    already happened. Move the overflow check before the write.
    
    Side note, emitting a warning splat with a backtrace might be overkill
    here, but prefer not changing the behaviour other than not doing the
    overrun.
    
    Discovered using AI-assisted static analysis confirmed by Intel Product
    Security.
    
    Reported-by: Martin Hodo <martin.hodo@intel.com>
    Fixes: e03187e12cae ("drm/i915/hdcp: MST streams support in hdcp port_data")
    Cc: <stable@vger.kernel.org> # v5.12+
    Cc: Anshuman Gupta <anshuman.gupta@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch e6102c1e8d8afa97ddf3c4b73e36545b518e075e drm-intel
3b2fa5a515f5 drm/i915/hdcp: check streams[] bounds before overflow
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#16: 
Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: e03187e12cae ("drm/i915/hdcp: MST streams support in hdcp port_data")

total: 0 errors, 1 warnings, 0 checks, 17 lines checked


