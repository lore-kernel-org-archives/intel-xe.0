Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C80D729E1
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 14:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FB310E067;
	Fri, 29 Nov 2024 14:52:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCC310E067;
 Fri, 29 Nov 2024 14:52:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_convert_to?=
 =?utf-8?q?_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Nov 2024 14:52:44 -0000
Message-ID: <173289196483.319839.7046531842548435217@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1732891498.git.jani.nikula@intel.com>
In-Reply-To: <cover.1732891498.git.jani.nikula@intel.com>
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

Series: drm/i915/dp: convert to struct intel_display
URL   : https://patchwork.freedesktop.org/series/141928/
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
commit e0265bbc186e9a23dd1d416256f0c3bca35787b7
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Nov 29 16:45:33 2024 +0200

    drm/i915/dp: finish link training conversion to struct intel_display
    
    Convert the final stragglers to struct intel_display now that we have
    platform identification via it too.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 108f610005f88de624c1a8c4f85d5cab9f530ddb drm-intel
8376b3ab05f4 drm/i915/dp: s/intel_encoder/encoder/
53fd0fbd1307 drm/i915/dp: s/intel_connector/connector/
336f5cd995ce drm/i915/dp: convert to struct intel_display
14e127c45311 drm/i915/dp: convert interfaces to struct intel_display
e0265bbc186e drm/i915/dp: finish link training conversion to struct intel_display


