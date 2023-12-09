Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951DFC4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 15:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F2E10E1CA;
	Sat,  9 Dec 2023 15:42:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BA4910E1CA;
 Sat,  9 Dec 2023 15:42:02 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 83DFFAADDA;
 Sat,  9 Dec 2023 15:42:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Huge_PTE_and_scratch_page?=
 =?utf-8?q?_updates_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Sat, 09 Dec 2023 15:42:02 -0000
Message-ID: <170213652253.20047.6296694305224948427@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231209151843.7903-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231209151843.7903-1-thomas.hellstrom@linux.intel.com>
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

Series: Huge PTE and scratch page updates (rev2)
URL   : https://patchwork.freedesktop.org/series/127565/
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
commit 494f8b47d8de99b3884238f69f926f000961b4f2
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sat Dec 9 16:18:42 2023 +0100

    drm/xe: Use NULL PTEs as scratch PTEs
    
    Currently scratch PTEs are write-enabled and points to a single scratch
    page. This has the side effect that buggy applications with out-of-bounds
    memory accesses may not notice the bad access since what's written may
    be read back.
    
    Instead use NULL PTEs as scratch PTEs. These always return 0 when reading,
    and writing has no effect. As a slight benefit, we can also use huge NULL
    PTEs.
    
    One drawback pointed out is that debugging may be hampered since previously
    when inspecting the content of the scratch page, it might be possible to
    detect writes to out-of-bound addresses and possibly also
    from where the out-of-bounds address originated. However since the scratch
    page-table structure is kept, it will be easy to add back the single
    RW-enabled scratch page under a debug define if needed.
    
    Also update the kerneldoc accordingly and move the function to create the
    scratch page-tables from xe_pt.c to xe_pt.h since it is accessing
    vm structure internals and this also makes it possible to make it static.
    
    v2:
    - Don't try to encode scratch PTEs larger than 1GiB.
    - Move xe_pt_create_scratch(), Update kerneldoc.
    v3:
    - Rebase.
    
    Cc: Brian Welty <brian.welty@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com> #for general direction.
    Reviewed-by: Brian Welty <brian.welty@intel.com>
+ /mt/dim checkpatch 1fc141d1f445b8e5ab4ff14645b0482dd98460b9 drm-intel
fdb250436 drm/xe: Restrict huge PTEs to 1GiB
494f8b47d drm/xe: Use NULL PTEs as scratch PTEs


