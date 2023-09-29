Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AF9E77343
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 22:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A8010E577;
	Fri, 29 Sep 2023 22:20:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5811C10E577;
 Fri, 29 Sep 2023 22:20:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 56B8BA00CC;
 Fri, 29 Sep 2023 22:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Fri, 29 Sep 2023 22:20:35 -0000
Message-ID: <169602603535.19498.11209683406962669068@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929201659.2840724-1-anusha.srivatsa@intel.com>
In-Reply-To: <20230929201659.2840724-1-anusha.srivatsa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Ad?=
 =?utf-8?q?d_Raptorlake_Support_=28rev2=29?=
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

Series: Add Raptorlake Support (rev2)
URL   : https://patchwork.freedesktop.org/series/123801/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 969c355c5b6fee0d3779ee4a52b69626d5ce6f2f
Author: Anusha Srivatsa <anusha.srivatsa@intel.com>
Date:   Fri Sep 29 13:16:59 2023 -0700

    drm/xe: Add missing ADL entries to xe_test_wa
    
    With all ADl platforms and subplatforms added,
    also add support to xe_wa_test kunit tests for checking
    their WAs.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
+ /mt/dim checkpatch 22fcf2404f56a8e7aea6734298e0b2b265136313 drm-intel
b84e4d9f4 drm/xe/rplu: s/ADLP/ALDERLAKE_P
86244fec6 drm/xe: s/ADL_P/ALDERLAKE_P
531d36e26 drm/xe/rpls: Add RPLS Support
1025071a2 drm/xe/rpls: Add Stepping info for RPLS
969c355c5 drm/xe: Add missing ADL entries to xe_test_wa


