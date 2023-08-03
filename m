Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338A7C04A94
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 03:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB71D10E075;
	Thu,  3 Aug 2023 03:28:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D25810E075;
 Thu,  3 Aug 2023 03:28:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9A866A3ECB;
 Thu,  3 Aug 2023 03:28:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 03 Aug 2023 03:28:09 -0000
Message-ID: <169103328963.5269.15878484588973901662@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230803032317.706386-1-matthew.brost@intel.com>
In-Reply-To: <20230803032317.706386-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Set_max_pte_size_when_skipping_rebinds?=
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

Series: drm/xe: Set max pte size when skipping rebinds
URL   : https://patchwork.freedesktop.org/series/121919/
State : warning

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
commit f154c0a62ad07f9d1299ad9a7f4d317bd9aa9c05
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Aug 2 20:23:17 2023 -0700

    drm/xe: Set max pte size when skipping rebinds
    
    When a rebind is skipped, we must set the max pte size of the newly
    created vma to value of the old vma as we do not pte walk for the new
    vma. Without this future rebinds may be incorrectly skipped due to the
    wrong max pte size. Null binds are more likely to expose this bug as
    larger ptes are more frequently used compared to normal bindings.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Testcase: dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_24
    Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Fixes: a042bb4ca894 ("drm/xe: Avoid doing rebinds")
    Reference: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23045
+ /mt/dim checkpatch f16c04291100aa92caddd4d09e17b56bf7f4833c drm-intel
f154c0a62 drm/xe: Set max pte size when skipping rebinds
-:14: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#14: 
Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Fixes: a042bb4ca894 ("drm/xe: Avoid doing rebinds")

total: 0 errors, 1 warnings, 0 checks, 40 lines checked


