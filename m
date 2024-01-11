Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92A2C47073
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 01:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5F010E028;
	Thu, 11 Jan 2024 01:02:04 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F8D10E07A;
 Thu, 11 Jan 2024 01:02:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/guc=3A_Use_HXG_definitions_on_HXG_messages?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Thu, 11 Jan 2024 01:02:02 -0000
Message-ID: <170493492293.270358.8313473053162647606@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110195951.453-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240110195951.453-1-michal.wajdeczko@intel.com>
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

Series: series starting with [1/2] drm/xe/guc: Use HXG definitions on HXG messages
URL   : https://patchwork.freedesktop.org/series/128448/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1b112713405d84929a8da1cb4d888104585a85e7
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jan 10 20:59:51 2024 +0100

    drm/xe/guc: Fix arguments passed to relay G2H handlers
    
    By default CT code was passing just payload of the G2H event
    message, while Relay code expects full G2H message including
    HXG header which contains DATA0 field. Fix that.
    
    Fixes: 152577060697 ("drm/xe/guc: Start handling GuC Relay event messages")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch df1fa62a45f2e5d5d32d1bf90e4b669bf7f3f2fc drm-intel
de28c7f1e drm/xe/guc: Use HXG definitions on HXG messages
1b1127134 drm/xe/guc: Fix arguments passed to relay G2H handlers
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '152577060697', maybe rebased or not pulled?
#10: 
Fixes: 152577060697 ("drm/xe/guc: Start handling GuC Relay event messages")

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


