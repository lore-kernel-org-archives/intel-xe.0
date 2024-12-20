Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3BCE77184
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 02:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1947410EE41;
	Fri, 20 Dec 2024 02:59:53 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB6610EE43;
 Fri, 20 Dec 2024 02:59:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fixes_for_MI=5FREPORT=5FP?=
 =?utf-8?q?ERF=5FCOUNT_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Dec 2024 02:59:51 -0000
Message-ID: <173466359112.631041.4252655998993467849@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241220002234.554135-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20241220002234.554135-1-umesh.nerlige.ramappa@intel.com>
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

Series: Fixes for MI_REPORT_PERF_COUNT (rev4)
URL   : https://patchwork.freedesktop.org/series/141811/
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
commit 2b86068d7964268929c4a51b6daa585f9786520f
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Thu Dec 19 16:22:34 2024 -0800

    xe/oa: Drop the unused logic to parse context image
    
    Now that all register configurations are using MI_LOAD_REGISTER_IMM,
    drop the logic to parse context image for offset.
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch ab84fe2ea6aa04785306a9c4b095e4390627cba8 drm-intel
f5488cc72f88 xe/oa: Fix query mode of operation for OAR/OAC
2b86068d7964 xe/oa: Drop the unused logic to parse context image


