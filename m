Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0928C28B2F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 07:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B422D10E513;
	Tue, 11 Mar 2025 07:02:09 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6892610E12B;
 Tue, 11 Mar 2025 07:02:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_PMU_support_for_function_?=
 =?utf-8?q?engine_activity_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 07:02:08 -0000
Message-ID: <174167652842.16998.2063189706515963645@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250311071759.2117211-1-riana.tauro@intel.com>
In-Reply-To: <20250311071759.2117211-1-riana.tauro@intel.com>
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

Series: PMU support for function engine activity (rev2)
URL   : https://patchwork.freedesktop.org/series/145755/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0a999fc3890567692934a83ca852246bcb15110a
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Tue Mar 11 12:47:59 2025 +0530

    drm/xe/pf: Enable per-function engine activity stats
    
    Enable per-function engine activity stats when VF's are enabled
    and disable when VF's are disabled
    
    v2: fix commit message
        remove reset stats from pf config (Michal)
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 003c44ec0b7d86569bd13d4a810ee24176c3d034 drm-intel
8744bb0ba341 drm/xe: Add support for per-function engine activity
44a88b725b0d drm/xe/xe_pmu: Add PMU support for per-function engine activity stats
0a999fc38905 drm/xe/pf: Enable per-function engine activity stats


