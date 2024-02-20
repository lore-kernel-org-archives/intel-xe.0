Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE45C48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 21:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5992C10E539;
	Tue, 20 Feb 2024 21:12:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE8710E404;
 Tue, 20 Feb 2024 21:12:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_cast_on_tra?=
 =?utf-8?q?ce_variable_again?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Feb 2024 21:12:04 -0000
Message-ID: <170846352457.132371.16430122034608448450@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240220205607.1873084-1-lucas.demarchi@intel.com>
In-Reply-To: <20240220205607.1873084-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Fix cast on trace variable again
URL   : https://patchwork.freedesktop.org/series/130151/
State : success

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
commit add9d59f1c3c519952f569e519c943a1b1a16808
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Feb 20 12:56:07 2024 -0800

    drm/xe: Fix cast on trace variable again
    
    Same fix as commit 8d038f49c1f3 ("drm/xe: Fix cast on trace variable")
    that has been inadvertently reverted by a later commit.
    
    Fixes: a0df2cc858c3 ("drm/xe/xe_bo_move: Enhance xe_bo_move trace")
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
    Cc: Oak Zeng <oak.zeng@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 52e6f4fe13d7b1f498009a367c6ce19466f167cc drm-intel
add9d59f1c3c drm/xe: Fix cast on trace variable again


