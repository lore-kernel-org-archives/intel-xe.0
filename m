Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3532D2C55D
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 14:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED8A10E32E;
	Tue, 22 Oct 2024 14:16:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F5D10E32E;
 Tue, 22 Oct 2024 14:16:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fguc=5Fads=3A_?=
 =?utf-8?q?save/restore_OA_registers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Oct 2024 14:16:17 -0000
Message-ID: <172960657787.1310194.5791792027491711510@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241022141054.5311-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241022141054.5311-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_guc_ads: save/restore OA registers (rev2)
URL   : https://patchwork.freedesktop.org/series/140281/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 277fc6c8ae6efa9c0c4c6ce4d482774255eb6111
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Tue Oct 22 14:10:54 2024 +0000

    drm/xe/xe_guc_ads: save/restore OA registers
    
    Several OA registers and allowlist registers were missing from the
    save/restore list for GuC and could be lost during an engine reset.  Add
    them to the list.
    
    v2:
    - Fix commit message (Umesh)
    - Add missing closes (Ashutosh)
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2249
    Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Suggested-by: John Harrison <john.c.harrison@intel.com>
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 4456dc1cd52e3e6db4513bacc85e6982ac9e101d drm-intel
277fc6c8ae6e drm/xe/xe_guc_ads: save/restore OA registers


