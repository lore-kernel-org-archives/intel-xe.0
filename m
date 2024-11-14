Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74795D6A221
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 18:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4580010E2BF;
	Thu, 14 Nov 2024 18:30:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A850F10E2BF;
 Thu, 14 Nov 2024 18:30:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_handl?=
 =?utf-8?q?e_hdmi_connector_init_failures?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Nov 2024 18:30:18 -0000
Message-ID: <173160901868.4146016.15388633410187844931@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1731599468.git.jani.nikula@intel.com>
In-Reply-To: <cover.1731599468.git.jani.nikula@intel.com>
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

Series: drm/i915/display: handle hdmi connector init failures
URL   : https://patchwork.freedesktop.org/series/141364/
State : warning

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
commit 1dc888a53bd3511f145266225d05ce1d4ca6fa68
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Nov 14 17:52:17 2024 +0200

    drm/i915/ddi: propagate errors from intel_ddi_init_hdmi_connector()
    
    Propagate connector init errors from
    intel_ddi_init_hdmi_connector(). The caller already handles the
    allocation failures, and this is all similar to
    intel_ddi_init_dp_connector().
    
    Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
    Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d drm-intel
85c58bda7a29 drm/i915/hdmi: propagate errors from intel_hdmi_init_connector()
-:68: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#68: FILE: drivers/gpu/drm/i915/display/intel_hdmi.h:26:
+bool intel_hdmi_init_connector(struct intel_digital_port *dig_port,
+			      struct intel_connector *intel_connector);

total: 0 errors, 0 warnings, 1 checks, 46 lines checked
17d9447cad41 drm/i915/hdmi: add error handling in g4x_hdmi_init()
1dc888a53bd3 drm/i915/ddi: propagate errors from intel_ddi_init_hdmi_connector()


