Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F34E92FCF
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 00:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE2510E085;
	Fri,  6 Oct 2023 00:48:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F163E10E4B1;
 Fri,  6 Oct 2023 00:48:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EF064AADD1;
 Fri,  6 Oct 2023 00:48:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Fri, 06 Oct 2023 00:48:51 -0000
Message-ID: <169655333197.6466.3389103470196303148@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
In-Reply-To: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Ad?=
 =?utf-8?q?d_Raptorlake_Support_=28rev4=29?=
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

Series: Add Raptorlake Support (rev4)
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
commit 1bf288033e0846cf6f1e4a564f5946df4f4a7822
Author: Anusha Srivatsa <anusha.srivatsa@intel.com>
Date:   Thu Oct 5 13:54:50 2023 -0700

    drm/xe: Add missing ADL entries to xe_test_wa
    
    With all ADl platforms and subplatforms added,
    also add support to xe_wa_test kunit tests for checking
    their WAs.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch b3daf7f07d6accbe43feafcadeb0b0498063761e drm-intel
f4cea32f6 fixup! drm/xe/display: Implement display support
97d6f9e68 drm/xe/rplu: s/ADLP/ALDERLAKE_P
67042b556 drm/xe/rpls: Add RPLS Support
c1c3b59cd drm/xe/rpls: Add Stepping info for RPLS
1bf288033 drm/xe: Add missing ADL entries to xe_test_wa


