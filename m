Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21967E77198
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 18:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB3D10E02B;
	Mon,  6 Jan 2025 18:13:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B0F10E02B;
 Mon,  6 Jan 2025 18:13:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Revert_=22vmstat=3A_disab?=
 =?utf-8?q?le_vmstat=5Fwork_on_vmstat=5Fcpu=5Fdown=5Fprep=28=29=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Jan 2025 18:13:13 -0000
Message-ID: <173618719375.359706.1297891614778035689@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106172455.1184656-1-lucas.demarchi@intel.com>
In-Reply-To: <20250106172455.1184656-1-lucas.demarchi@intel.com>
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

Series: Revert "vmstat: disable vmstat_work on vmstat_cpu_down_prep()"
URL   : https://patchwork.freedesktop.org/series/143161/
State : warning

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
commit e8e6f60807a5740a939122541d92b57b92f8daf0
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Jan 6 09:24:55 2025 -0800

    Revert "vmstat: disable vmstat_work on vmstat_cpu_down_prep()"
    
    This reverts commit adcfb264c3ed51fbbf5068ddf10d309a63683868.
    
    It completely tanks the CI and nothing gets tested. This is being either
    reverted upstream or the fix will conflict with the revert and we will
    find out when it does.
    
    Link: https://lore.kernel.org/all/g4sefofdrwu72ijhse7k57wuvrwhvn2eoqmc4jdoepkcgs7h5n@hmuhkwnye6pe/#t
    References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13464
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Acked-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch c35d5fa6bfbf59ce911ce2050613eeecf10344d3 drm-intel
e8e6f60807a5 Revert "vmstat: disable vmstat_work on vmstat_cpu_down_prep()"
-:14: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#14: 
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13464

total: 0 errors, 1 warnings, 0 checks, 15 lines checked


