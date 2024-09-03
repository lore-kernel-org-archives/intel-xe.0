Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747E2CD37B5
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 22:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E1910E615;
	Tue,  3 Sep 2024 22:44:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9774B10E615;
 Tue,  3 Sep 2024 22:44:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_Clean-u?=
 =?utf-8?q?p_PM_sequences?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Sep 2024 22:44:00 -0000
Message-ID: <172540344060.930912.14377957349080620325@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240903223803.380711-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240903223803.380711-1-rodrigo.vivi@intel.com>
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

Series: drm/xe/display: Clean-up PM sequences
URL   : https://patchwork.freedesktop.org/series/138163/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 268be7702d56193e37c8ab7bb121f26be184549d
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Sep 3 18:38:03 2024 -0400

    drm/xe/display: Reduce and streamline d3cold display sequence
    
    When going to d3cold we surely don't need to flush commits,
    nor handle fbdev. So, clean this up a bit.
    
    Also move the opregion call to make the function more symmetric.
    
    Cc: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch e159ed9ab3ec08042286fb8af2560dbc540beccb drm-intel
d89a10743d46 drm/xe/display: Spin-off xe_display runtime/d3cold sequences
8a2205e2788a drm/xe/display: Remove i915_drv.h include
7848de276b2d drm/xe/display: Kill useless has_display
268be7702d56 drm/xe/display: Reduce and streamline d3cold display sequence


