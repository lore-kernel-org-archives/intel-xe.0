Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624FDC52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 16:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3184410EC6D;
	Fri, 23 Aug 2024 16:27:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CDF10EC6D;
 Fri, 23 Aug 2024 16:27:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Revert_=22drm/xe=3A_Inval?=
 =?utf-8?q?idate_media=5Fgt_TLBs_in_PT_code=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 16:27:13 -0000
Message-ID: <172443043373.747368.1928804599705635245@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823162207.2168887-1-matthew.brost@intel.com>
In-Reply-To: <20240823162207.2168887-1-matthew.brost@intel.com>
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

Series: Revert "drm/xe: Invalidate media_gt TLBs in PT code"
URL   : https://patchwork.freedesktop.org/series/137724/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 29bbc9cf1b164db6d768f04b2c07069fabb654b5
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Aug 23 09:22:07 2024 -0700

    Revert "drm/xe: Invalidate media_gt TLBs in PT code"
    
    This reverts commit 40520283e0fd11237ed9dfc0991503b3403d5fa4.
    
    We can't install dma-fence-chain in timeline sync objs.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch a5ff876a886312067d4afa5d8bfa97fd8e8d6260 drm-intel
29bbc9cf1b16 Revert "drm/xe: Invalidate media_gt TLBs in PT code"


