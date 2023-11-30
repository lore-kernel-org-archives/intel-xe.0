Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2307AC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 11:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E491310E6E1;
	Thu, 30 Nov 2023 11:17:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A95B310E504;
 Thu, 30 Nov 2023 11:17:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A6627A02F0;
 Thu, 30 Nov 2023 11:17:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 30 Nov 2023 11:17:31 -0000
Message-ID: <170134305167.15642.9159378296197271298@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231130111423.434744-2-matthew.auld@intel.com>
In-Reply-To: <20231130111423.434744-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_fi?=
 =?utf-8?q?xup!_drm/xe/uapi=3A_Add_support_for_CPU_caching_mode?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: fixup! drm/xe/uapi: Add support for CPU caching mode
URL   : https://patchwork.freedesktop.org/series/127113/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 40b67d4f29270cd2adddf259075f0fea426d77da
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Nov 30 11:14:24 2023 +0000

    fixup! drm/xe/uapi: Add support for CPU caching mode
    
    Add back the padding check. It was removed since we originally used the
    other u16 for the coh_mode, but that was removed and never merged.
    
    Testcase: igt@xe_create@create-invalid-mbz
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Pallavi Mishra <pallavi.mishra@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch afdc645350a4b30d1ba6c52deed4ecc11bf7c083 drm-intel
40b67d4f2 fixup! drm/xe/uapi: Add support for CPU caching mode


