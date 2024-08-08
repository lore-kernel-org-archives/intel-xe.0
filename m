Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE767C52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 20:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C39910E7F9;
	Thu,  8 Aug 2024 20:16:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA1310E7F9;
 Thu,  8 Aug 2024 20:16:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Rename_enable?=
 =?utf-8?q?=5Fdisplay_module_param?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Aug 2024 20:16:26 -0000
Message-ID: <172314818611.550585.14387605956706748172@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240808180154.2495634-1-lucas.demarchi@intel.com>
In-Reply-To: <20240808180154.2495634-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Rename enable_display module param
URL   : https://patchwork.freedesktop.org/series/137060/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
be41dd201d01bbf73d9e4ab77e74ab47923582e5
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9e58e901435336257e1cd2778d6f3a81e49dc2e8
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Aug 8 10:49:42 2024 -0700

    drm/xe: Rename enable_display module param
    
    The different approach used by xe regarding the initialization of
    display HW has been proved a great additional for early driver bring up:
    core xe can be tested without having all the bits sorted out on the
    display side.
    
    On the other hand, the approach exposed by i915-display is to *actively*
    disable the display by programming it if needed, i.e. if it was left
    enabled by firmware. It also has its use to make sure the HW is actually
    disabled and not wasting power.
    
    However having both the way it is in xe doesn't expose a good interface
    wrt module params. From modinfo:
    
            disable_display:Disable display (default: false) (bool)
            enable_display:Enable display (bool)
    
    Rename enable_display do probe_display to try to convey the message that
    the HW is being touched and improve the module param description. To
    avoid confusion, the enable_display is renamed everywhere, not only in
    the module param. New description for the parameters:
    
            disable_display:Disable display (default: false) (bool)
            probe_display:Probe display HW, otherwise it's left untouched (default: true) (bool)
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 6eced4bb82542c5f00a48e4d7b66a10905736961 drm-intel
9e58e9014353 drm/xe: Rename enable_display module param
-:28: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#28: 
	probe_display:Probe display HW, otherwise it's left untouched (default: true) (bool)

total: 0 errors, 1 warnings, 0 checks, 251 lines checked


