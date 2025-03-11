Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D051C28B2E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 05:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4232510E0C3;
	Tue, 11 Mar 2025 05:40:56 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870AF10E10B;
 Tue, 11 Mar 2025 05:40:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_survivabili?=
 =?utf-8?q?ty?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 05:40:54 -0000
Message-ID: <174167165454.16784.18216583385454317599@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310-fix-survivability-v1-0-7af31432bbd0@intel.com>
In-Reply-To: <20250310-fix-survivability-v1-0-7af31432bbd0@intel.com>
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

Series: drm/xe: Fix survivability
URL   : https://patchwork.freedesktop.org/series/146116/
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
commit 84a1886b224ebd4bc346be8aa169b3e04cbf2c05
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Mar 10 22:35:17 2025 -0700

    drm/xe: Allow to inject error in xe_pcode_probe_early()
    
    Allow to test if driver behaves correctly when xe_pcode_probe_early()
    fails. Note that this is not sufficient for testing survivability mode
    as it's still required to read the hw to check for errors, which doesn't
    happen on an injected failure.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 003c44ec0b7d86569bd13d4a810ee24176c3d034 drm-intel
0f51cacae337 drm/xe: Move survivability back to xe
84a1886b224e drm/xe: Allow to inject error in xe_pcode_probe_early()


