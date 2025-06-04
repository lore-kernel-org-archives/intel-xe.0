Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0534EC5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 23:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B288710E04A;
	Wed,  4 Jun 2025 23:29:43 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B248E10E0A2;
 Wed,  4 Jun 2025 23:29:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Small_improvements_in_top?=
 =?utf-8?q?ology_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Jun 2025 23:29:41 -0000
Message-ID: <174907978172.49780.2090019744232375834@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604202908.769-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250604202908.769-1-michal.wajdeczko@intel.com>
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

Series: Small improvements in topology code
URL   : https://patchwork.freedesktop.org/series/149851/
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
commit d4c8af4651697dd275792955cf7fc865480535fe
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jun 4 22:29:08 2025 +0200

    drm/xe/topology: Stop trying to fix programming mistakes
    
    We shouldn't ever pass more DSS registers than our hardcoded limit,
    it should be sufficient to just assert that instead of trying to
    fix it, as this will never happen in the production driver.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 9becf23dcd5721a2ddb80f01d4964a1657117f11 drm-intel
9805eb4501b8 drm/xe/topology: Simplify code for loading DSS mask
b65e1ce4f78d drm/xe/topology: Use register array size instead magic number
d4c8af465169 drm/xe/topology: Stop trying to fix programming mistakes


