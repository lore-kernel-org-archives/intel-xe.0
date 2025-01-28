Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BDCC0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 23:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DF610E27B;
	Tue, 28 Jan 2025 23:36:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637F110E27B;
 Tue, 28 Jan 2025 23:36:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Revert_=22drm/xe/lnl=3A_E?=
 =?utf-8?q?nable_GuC_SLPC_DCC_task=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jan 2025 23:36:54 -0000
Message-ID: <173810741440.2144892.1258939957839377002@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250128223248.660748-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250128223248.660748-1-rodrigo.vivi@intel.com>
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

Series: Revert "drm/xe/lnl: Enable GuC SLPC DCC task"
URL   : https://patchwork.freedesktop.org/series/144074/
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
commit 04c171a70f8677a55222e066d48a5234c409e810
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Jan 28 17:32:48 2025 -0500

    Revert "drm/xe/lnl: Enable GuC SLPC DCC task"
    
    This reverts commit 50554bf3e56dd0c78ef1eedb685d0ab36c9c9987.
    
    DCC in LNL should be disabled. It was a mistake to decide
    to go against GuC platform defaults in this case and this
    could lead to regressions in some TDP limited scenarios
    instead of helping.
    
    Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79 drm-intel
04c171a70f86 Revert "drm/xe/lnl: Enable GuC SLPC DCC task"


