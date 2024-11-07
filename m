Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB64AD5AE66
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 06:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC87B10E7AC;
	Thu,  7 Nov 2024 06:11:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B450910E7AC;
 Thu,  7 Nov 2024 06:11:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_gt=5Fid_to_?=
 =?utf-8?q?xe=5Fsched=5Fjob_traces?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 06:11:44 -0000
Message-ID: <173095990473.1420231.10038504013302317532@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241107060606.3130885-1-lucas.demarchi@intel.com>
In-Reply-To: <20241107060606.3130885-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Add gt_id to xe_sched_job traces
URL   : https://patchwork.freedesktop.org/series/141039/
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
commit b428bfe4cd190a2b37eef66a7aad98cb61f95b7d
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Nov 6 22:06:06 2024 -0800

    drm/xe: Add gt_id to xe_sched_job traces
    
    In order to uniquely identify the jobs, xe_sched_job tracepoints need
    to have the tuple (gt_id, guc_id). Find a "hole" where the next entry is
    unaligned and add one more field.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3 drm-intel
b428bfe4cd19 drm/xe: Add gt_id to xe_sched_job traces


