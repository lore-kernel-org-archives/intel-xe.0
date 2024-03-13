Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC28C54E5D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 01:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2002D10EED3;
	Wed, 13 Mar 2024 01:55:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B7110EF0A;
 Wed, 13 Mar 2024 01:55:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Ftracer=3A_Ali?=
 =?utf-8?q?gn_fence_output_format_in_ftrace_log_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Mar 2024 01:55:25 -0000
Message-ID: <171029492545.714563.3612835009864411744@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240313014915.1400077-1-shuicheng.lin@intel.com>
In-Reply-To: <20240313014915.1400077-1-shuicheng.lin@intel.com>
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

Series: drm/xe/xe_tracer: Align fence output format in ftrace log (rev2)
URL   : https://patchwork.freedesktop.org/series/131005/
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
commit ad86dd126b1dd7dc8b2a499ca630a5a530c99414
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Wed Mar 13 01:49:15 2024 +0000

    drm/xe/xe_tracer: Align fence output format in ftrace log
    
    The fence print in xe_gt_tlb_invalidation_fence and xe_hw_fence
    is with "%p", change fence print in xe_sched_job to "%p" also.
    Add the "0x" prefix as the "%p" is with hex format.
    
    Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 8762453258673794e13e4d59cb9df1042b97ba01 drm-intel
ad86dd126b1d drm/xe/xe_tracer: Align fence output format in ftrace log


