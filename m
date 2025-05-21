Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D130FC54E71
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 15:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1B710E06B;
	Wed, 21 May 2025 15:46:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB16510E06B;
 Wed, 21 May 2025 15:46:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Improve_wedged_?=
 =?utf-8?q?mode_handling_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 May 2025 15:46:16 -0000
Message-ID: <174784237670.10286.10343314580338611354@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250521122511.5760-1-lukasz.laguna@intel.com>
In-Reply-To: <20250521122511.5760-1-lukasz.laguna@intel.com>
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

Series: drm/xe: Improve wedged mode handling (rev6)
URL   : https://patchwork.freedesktop.org/series/148214/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bba33879644eced4f5cb6de87599b80b4be67fbf
Author: Lukasz Laguna <lukasz.laguna@intel.com>
Date:   Wed May 21 14:25:11 2025 +0200

    drm/xe/pf: Allow upon-any-hang wedged mode only in debug config
    
    The GuC reset policy is global, so disabling it on PF can affect all
    running VFs. To avoid unintended side effects, restrict setting
    upon-any-hang (2) wedged mode on the PF to debug builds only.
    
    Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch 2d8dc23f1e6ce72fe9e45fd0db71076d90a4e1aa drm-intel
80966c00007b drm/xe: Validate wedged_mode parameter and define enum for modes
3d0379e08e0f drm/xe: Don't update wedged mode in case of an error
0b6fa35d3678 drm/xe/vf: Disallow setting wedged mode to upon-any-hang
bba33879644e drm/xe/pf: Allow upon-any-hang wedged mode only in debug config


