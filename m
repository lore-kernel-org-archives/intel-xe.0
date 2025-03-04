Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809F1C021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 10:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A21510E25C;
	Tue,  4 Mar 2025 10:25:30 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B3710E25C;
 Tue,  4 Mar 2025 10:25:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_PMU_support_for_function_?=
 =?utf-8?q?engine_activity?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 10:25:28 -0000
Message-ID: <174108392895.479656.14128743382790363362@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304095743.3274062-1-riana.tauro@intel.com>
In-Reply-To: <20250304095743.3274062-1-riana.tauro@intel.com>
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

Series: PMU support for function engine activity
URL   : https://patchwork.freedesktop.org/series/145755/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 82f1fdf0fa52e181cc4c7d0fe6104fd5fc2b2912
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Tue Mar 4 15:27:43 2025 +0530

    drm/xe/pf: Enable per-function engine activity stats
    
    Enable per-function engine activity stats when VF's are enabled
    and disable when VF's are disabled
    
    v2: fix commit message
        remove reset stats from pf config (Michal)
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 1cf56e26a93292ca26fbf891368b75a67e8700dc drm-intel
5b216a93d5d1 drm/xe: Add support for per-function engine activity
3f4800eecf11 drm/xe/xe_pmu: Add PMU support for per-function engine activity stats
82f1fdf0fa52 drm/xe/pf: Enable per-function engine activity stats


