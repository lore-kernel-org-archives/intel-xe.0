Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBFCC48295
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 14:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA4F10E36A;
	Mon,  5 Feb 2024 14:24:23 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F8110E36A;
 Mon,  5 Feb 2024 14:24:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_Introduce_TTM_?=
 =?utf-8?q?lru_list_links_of_different_types?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Feb 2024 14:24:22 -0000
Message-ID: <170714306228.1024443.12328103113908387185@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240205135158.100766-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240205135158.100766-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm: Introduce TTM lru list links of different types
URL   : https://patchwork.freedesktop.org/series/129542/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 617b3e1552813ab35fffd619dd079ebaaa6eb124
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Feb 5 14:51:58 2024 +0100

    drm/ttm: Introduce TTM lru list links of different types
    
    These will come in handy when LRU list iterators attach themselves
    to the current list position with a LRU hitch.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 89404d6657779870d0d97f80a267f75a36c6744b drm-intel
617b3e155 drm/ttm: Introduce TTM lru list links of different types
-:207: CHECK:LINE_SPACING: Please don't use multiple blank lines
#207: FILE: include/drm/ttm/ttm_resource.h:52:
 
+

total: 0 errors, 0 warnings, 1 checks, 212 lines checked


