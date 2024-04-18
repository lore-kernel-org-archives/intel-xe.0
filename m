Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5448EC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 00:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D84810F93E;
	Thu, 18 Apr 2024 00:13:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B15710F93E;
 Thu, 18 Apr 2024 00:13:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/gsc=3A_Turn_off_GSCCS_interrupts_when_disabling_the_?=
 =?utf-8?q?engine?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Apr 2024 00:13:42 -0000
Message-ID: <171339922263.1483937.16501412943716940544@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240417211224.1359313-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240417211224.1359313-1-daniele.ceraolospurio@intel.com>
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

Series: series starting with [1/2] drm/xe/gsc: Turn off GSCCS interrupts when disabling the engine
URL   : https://patchwork.freedesktop.org/series/132581/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f5fb02e01091a469b6325b72a47b3a0a1e96309c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cfe7a7e17a661bbf16976e925f5a8f3ee624a61a
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Apr 17 14:12:24 2024 -0700

    drm/xe/gsc: define GSCCS for LNL
    
    LNL has 1 GSCCS, same as MTL. Note that the GSCCS will be disabled until
    we have a GSC FW defined, but having it in the list of engine is a
    requirement to add such definition.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3 drm-intel
3425da7fa4dd drm/xe/gsc: Turn off GSCCS interrupts when disabling the engine
cfe7a7e17a66 drm/xe/gsc: define GSCCS for LNL


