Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F407EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 20:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E7E10E092;
	Thu, 29 Jun 2023 20:54:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2962910E3EC;
 Thu, 29 Jun 2023 20:54:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C04A3A0169;
 Thu, 29 Jun 2023 20:54:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 29 Jun 2023 20:54:50 -0000
Message-ID: <168807209078.28965.7148308749779315849@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230629205134.111849-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230629205134.111849-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_two_bind_races?=
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

Series: drm/xe: Fix two bind races
URL   : https://patchwork.freedesktop.org/series/120031/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 520ea8e88572877fe3e0d50578fdd4c8d1cd91e0
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Jun 29 22:51:34 2023 +0200

    drm/xe: Fix the separate bind-engine race using coarse-granularity dependencies
    
    Separate bind-engines operating on the same VM range might race updating
    page-tables. To make sure that doesn't happen, each page-table update
    operation needs to collect internal dependencies to await before the
    job is executed.
    
    Provide an infrastructure to do that. Initially we save a single dma-fence
    for the entire VM, which thus removes the benefit of separate bind-engines
    in favour of fixing the race, but a more fine-grained dependency
    tracking can be achieved by using, for example, the same method as the
    i915 vma_resources (an interval tree storing unsignaled fences). That
    of course comes with increasing code complexity.
    
    This patch will break the xe_vm@bind-engines-independent igt test, but that
    would need an update anyway to avoid the independent binds using the
    same address range. In any case, such a test would not work with the
    initial xe implementation unless the binds were using different vms.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 2ec46ad7578ebba3048d6031c1a75c21920f0e19 drm-intel
245d25479 drm/xe: Make page-table updates using the default engine happen in order
520ea8e88 drm/xe: Fix the separate bind-engine race using coarse-granularity dependencies


