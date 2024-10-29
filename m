Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD90ED74943
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 21:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4D210E3B7;
	Tue, 29 Oct 2024 21:47:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3576A10E3B7;
 Tue, 29 Oct 2024 21:47:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Revert_=22drm/xe/xe=5Fguc?=
 =?utf-8?q?=5Fads=3A_save/restore_OA_registers_and_allowlist_regs=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 21:47:11 -0000
Message-ID: <173023843121.1361174.4173007621573992936@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029200147.1476513-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241029200147.1476513-1-ashutosh.dixit@intel.com>
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

Series: Revert "drm/xe/xe_guc_ads: save/restore OA registers and allowlist regs"
URL   : https://patchwork.freedesktop.org/series/140691/
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
commit fa70a4992709fe745c4c341c3291490a95d6df86
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Tue Oct 29 13:01:47 2024 -0700

    Revert "drm/xe/xe_guc_ads: save/restore OA registers and allowlist regs"
    
    This reverts commit 55858fa7eb2f163f7aa34339fd3399ba4ff564c6.
    
    '55858fa7eb2f ("drm/xe/xe_guc_ads: save/restore OA registers and allowlist
    regs")' was not properly reviewed and also causes dmesg asserts in
    CI. Revert it.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3295
    Fixes: 55858fa7eb2f ("drm/xe/xe_guc_ads: save/restore OA registers and allowlist regs")
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 91b5d7af697c6765039b8700127c1740da858065 drm-intel
fa70a4992709 Revert "drm/xe/xe_guc_ads: save/restore OA registers and allowlist regs"


