Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E637D17142
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 23:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4454410E5C3;
	Mon, 21 Oct 2024 23:06:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C48010E5C3;
 Mon, 21 Oct 2024 23:06:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fguc=5Fads=3A_?=
 =?utf-8?q?save/restore_OA_registers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 23:06:32 -0000
Message-ID: <172955199210.1306617.9238197810052293530@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021222401.95833-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241021222401.95833-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_guc_ads: save/restore OA registers
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
commit fb010daaeb3447a25f5d477c451db6271914d0dd
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Mon Oct 21 22:24:01 2024 +0000

    drm/xe/xe_guc_ads: save/restore OA registers
    
    Several OA registers were missing from the save restore list for GuC and
    could be lost during an engine reset.  Add them to the list.
    
    Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Suggested-by: John Harrison <john.c.harrison@intel.com>
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch aa0898115bcff3eda6d021cc66eb8a1c3b264c56 drm-intel
fb010daaeb34 drm/xe/xe_guc_ads: save/restore OA registers


