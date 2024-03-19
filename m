Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC58C54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 01:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA22010E59C;
	Tue, 19 Mar 2024 01:51:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BCC10E825;
 Tue, 19 Mar 2024 01:51:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/uc=3A_Use_u64_for_?=
 =?utf-8?q?offsets_for_which_we_use_upper=5F32=5Fbits=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 01:51:03 -0000
Message-ID: <171081306345.900715.11371902954644054510@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318184225.3808240-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240318184225.3808240-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/uc: Use u64 for offsets for which we use upper_32_bits()
URL   : https://patchwork.freedesktop.org/series/131282/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 47f20d7b9edcaf57a480097983f37aa0e4305081
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Mar 18 11:42:25 2024 -0700

    drm/xe/uc: Use u64 for offsets for which we use upper_32_bits()
    
    The GGTT is currently a 32 bit address space, but the HW and GuC
    support 48b addresses in GGTT-related operations, both to keep the
    interface/HW paths common between PPGTT and GGTT and to allow for
    future increase of the GGTT size.
    This leaves us having to program a 64b field with a 32b offset, which
    currently we're in some cases doing this by using an upper_32_bits()
    call on a 32b variable, which doesn't make any sense. To do this cleanly
    we have 2 options:
    
    1 - Set the upper 32 bits directly to zero.
    2 - Use 64b variables for the offset and keep programming the whole thing,
        so we're ready if we ever have bigger offsets.
    
    This patch goes with option #2 and switches the related variables to u64.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9 drm-intel
47f20d7b9edc drm/xe/uc: Use u64 for offsets for which we use upper_32_bits()


