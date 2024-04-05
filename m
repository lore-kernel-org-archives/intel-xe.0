Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358F0C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 22:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41E210EAA1;
	Fri,  5 Apr 2024 22:28:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1AE10EAA3;
 Fri,  5 Apr 2024 22:28:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_Fix_dou?=
 =?utf-8?q?ble_mutex_initialization?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 22:28:20 -0000
Message-ID: <171235610091.1239329.11950081805195685674@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405200711.2041428-1-lucas.demarchi@intel.com>
In-Reply-To: <20240405200711.2041428-1-lucas.demarchi@intel.com>
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

Series: drm/xe/display: Fix double mutex initialization
URL   : https://patchwork.freedesktop.org/series/132101/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eaf98cdc992d70ea6ffb45e36c4d73df4fa5509b
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Apr 5 13:07:11 2024 -0700

    drm/xe/display: Fix double mutex initialization
    
    All of these mutexes are already initialized by the display side since
    commit 3fef3e6ff86a ("drm/i915: move display mutex inits to display
    code"), so the xe shouldn´t initialize them.
    
    Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Cc: Arun R Murthy <arun.r.murthy@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 11155f150a41d028c6ac7a141924fd4c8798721d drm-intel
eaf98cdc992d drm/xe/display: Fix double mutex initialization


