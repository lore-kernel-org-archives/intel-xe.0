Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38340C47071
	for <intel-xe@archiver.kernel.org>; Sat, 18 Nov 2023 04:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030E010E02A;
	Sat, 18 Nov 2023 04:01:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A40610E02A;
 Sat, 18 Nov 2023 04:01:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 98141AADEF;
 Sat, 18 Nov 2023 04:01:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Sat, 18 Nov 2023 04:01:24 -0000
Message-ID: <170028008461.12899.6255424740164626138@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116151242.2125-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231116151242.2125-1-michal.wajdeczko@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5Bv2=2C1/4=5D_drm/xe/guc=3A_Fix_wrong_asser?=
 =?utf-8?q?t_about_full=5Flen?=
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

Series: series starting with [v2,1/4] drm/xe/guc: Fix wrong assert about full_len
URL   : https://patchwork.freedesktop.org/series/126539/
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
commit b282b10aa1070c9d33059686ec3893443a7b2b2a
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Nov 16 16:12:42 2023 +0100

    drm/xe/guc: Use valid scratch register for posting read
    
    There are only 4 scratch registers VF_SW_FLAG(0..3) on each GuC.
    We shouldn't use non-existing register VF_SW_FLAG(4) for posting
    read.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch cb9b702d436952ddec33b020d549c7998cace9e2 drm-intel
6cd29910b drm/xe/guc: Fix wrong assert about full_len
ac7d6d826 drm/xe/guc: Copy response data from proper registers
b5b93b698 drm/xe/guc: Fix handling of GUC_HXG_TYPE_NO_RESPONSE_BUSY
b282b10aa drm/xe/guc: Use valid scratch register for posting read


