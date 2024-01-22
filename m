Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76786C47DDC
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3696110EF7C;
	Mon, 22 Jan 2024 21:04:52 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FE710EF7C;
 Mon, 22 Jan 2024 21:04:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_GuC_CT_tweaks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Mon, 22 Jan 2024 21:04:50 -0000
Message-ID: <170595749095.665193.8728727068303449557@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240122210156.1517444-1-matthew.brost@intel.com>
In-Reply-To: <20240122210156.1517444-1-matthew.brost@intel.com>
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

Series: GuC CT tweaks
URL   : https://patchwork.freedesktop.org/series/129050/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e4912ac69a7b64bd91b457572b84b66db6fcce55
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Jan 22 13:01:56 2024 -0800

    drm/xe/guc: Flush G2H handler when turning off CTs
    
    Make sure G2H handler is not running when changing the CT state to drop
    messages or disabled. This will help prevent races in the code ensuring
    that G2H are not being processed after changing the state.
    
    v2:
    - s/flush_g2h_handler/stop_g2h_handler (Michal)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c drm-intel
3c86d2fb1 drm/xe/guc: Add more GuC CT states
e245e4cde drm/xe: Move TLB invalidation reset before HW reset
e4912ac69 drm/xe/guc: Flush G2H handler when turning off CTs
-:29: CHECK:LINE_SPACING: Please don't use multiple blank lines
#29: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:354:
+
+

total: 0 errors, 0 warnings, 1 checks, 37 lines checked


