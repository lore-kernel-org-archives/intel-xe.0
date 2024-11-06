Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73535D59F53
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 16:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4214B10E736;
	Wed,  6 Nov 2024 16:51:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413A210E73E;
 Wed,  6 Nov 2024 16:51:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_demote_sou?=
 =?utf-8?q?rce_OUI_read/write_failure_logging_to_debug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Nov 2024 16:51:33 -0000
Message-ID: <173091189326.1417936.5946720116409169317@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241106162325.4065078-1-jani.nikula@intel.com>
In-Reply-To: <20241106162325.4065078-1-jani.nikula@intel.com>
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

Series: drm/i915/dp: demote source OUI read/write failure logging to debug
URL   : https://patchwork.freedesktop.org/series/141015/
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
commit addb95f5dc6b2ee7b4ad183a42792737ee8ff438
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Nov 6 18:23:25 2024 +0200

    drm/i915/dp: demote source OUI read/write failure logging to debug
    
    Commit 1f12d63a14d7 ("drm/i915/dp: Write the source OUI for non-eDP
    sinks as well") started writing source OUI for non-eDP sinks as well,
    increasing the possibilities of hitting read/write failures either due
    to the sink behaviour or hotplug or whatever.
    
    Even before that, commit 3fb0501f0c07 ("drm/i915/display/dp: Reduce log
    level for SOURCE OUI write failures") already reduced write failures to
    info level when source OUI was just for eDP.
    
    Further reduce the log level to just debug. Switch to struct intel_dp
    while at it.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3372
    Cc: Clint Taylor <clinton.a.taylor@intel.com>
    Cc: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 438ef86a725b59a171dba81fc258bb23a0ff536c drm-intel
addb95f5dc6b drm/i915/dp: demote source OUI read/write failure logging to debug


