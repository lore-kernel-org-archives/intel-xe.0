Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6144C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 11:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6933610E56B;
	Tue, 21 Jan 2025 11:55:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA2210E56B;
 Tue, 21 Jan 2025 11:55:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Fix_sizeof?=
 =?utf-8?q?=2832=29_typo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jan 2025 11:55:01 -0000
Message-ID: <173746050189.2580601.15012050485106779755@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121094832.588-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250121094832.588-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Fix sizeof(32) typo
URL   : https://patchwork.freedesktop.org/series/143787/
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
commit a671abeddbb76263f85602276818aac322e5407f
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jan 21 10:48:32 2025 +0100

    drm/xe/guc: Fix sizeof(32) typo
    
    A small typo leads to the following static code checker warning:
    
            drivers/gpu/drm/xe/xe_guc_buf.c:81 xe_guc_buf_reserve()
            warn: sizeof(NUMBER)?
    
    Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
    Closes: https://lore.kernel.org/intel-xe/0d5bcbf1-79f9-4a10-a221-ddbaec9f6122@stanley.mountain/
    Fixes: 696bfdf273ea ("drm/xe/guc: Introduce the GuC Buffer Cache")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Dan Carpenter <dan.carpenter@linaro.org>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7727d97a1f38c61a60e87b2d38f7cc5a4aae277b drm-intel
a671abeddbb7 drm/xe/guc: Fix sizeof(32) typo


