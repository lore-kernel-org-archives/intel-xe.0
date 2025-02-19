Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0FBC021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 20:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EF610E044;
	Wed, 19 Feb 2025 20:33:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C660710E044;
 Wed, 19 Feb 2025 20:33:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Check_respo?=
 =?utf-8?q?nse_data_of_CLIENT=5FSOFT=5FRESET_action?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Feb 2025 20:33:55 -0000
Message-ID: <173999723580.4133976.4595921520757736486@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250219192710.281-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250219192710.281-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Check response data of CLIENT_SOFT_RESET action
URL   : https://patchwork.freedesktop.org/series/145122/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ba98be1595ff182515c7c71c8865e5bb55b24f4c
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Feb 19 20:27:10 2025 +0100

    drm/xe/guc: Check response data of CLIENT_SOFT_RESET action
    
    Treat unexpected non-zero response data from GuC as -EPROTO error.
    This will also prevent passing positive value to ERR_PTR().
    
    Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
    Closes: https://lore.kernel.org/intel-xe/5fd5a4b9-88ee-47f1-ac3e-32a20960c5b0@stanley.mountain/
    Fixes: 12f95f9900c0 ("drm/xe/guc: Prefer GT oriented logs for GuC messages")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Dan Carpenter <dan.carpenter@linaro.org>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch e19eb43c82480789a93ce0c452e22bbd851b93c6 drm-intel
ba98be1595ff drm/xe/guc: Check response data of CLIENT_SOFT_RESET action


