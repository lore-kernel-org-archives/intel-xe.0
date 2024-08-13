Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBA3C52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 19:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08A210E3E4;
	Tue, 13 Aug 2024 19:23:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055D010E3E4;
 Tue, 13 Aug 2024 19:22:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Rename_enable?=
 =?utf-8?q?=5Fdisplay_module_param_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Aug 2024 19:22:59 -0000
Message-ID: <172357697901.614602.12546569857014870716@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240813191709.3285685-1-lucas.demarchi@intel.com>
In-Reply-To: <20240813191709.3285685-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Rename enable_display module param (rev3)
URL   : https://patchwork.freedesktop.org/series/137060/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 120d782a897bf40e4e99f5c1abbaeac30b25c90c
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Aug 13 12:17:09 2024 -0700

    drm/xe: Rename enable_display module param
    
    The different approach used by xe regarding the initialization of
    display HW has been proved a great addition for early driver bring up:
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
    
    Rename enable_display to probe_display to try to convey the message that
    the HW is being touched and improve the module param description. To
    avoid confusion, the enable_display is renamed everywhere, not only in
    the module param. New description for the parameters:
    
            disable_display:Disable display (default: false) (bool)
            probe_display:Probe display HW, otherwise it's left untouched (default: true) (bool)
    
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20240808180154.2495634-1-lucas.demarchi@intel.com
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch eb97e8bfe4c4f91fee7cfa354d300164f605aa83 drm-intel
120d782a897b drm/xe: Rename enable_display module param
-:28: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#28: 
	probe_display:Probe display HW, otherwise it's left untouched (default: true) (bool)

total: 0 errors, 1 warnings, 0 checks, 255 lines checked


