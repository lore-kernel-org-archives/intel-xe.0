Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC912C47077
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 01:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757A710E54A;
	Wed, 10 Jan 2024 01:00:24 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC05110E54A;
 Wed, 10 Jan 2024 01:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_GuC_CT_tweaks_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 10 Jan 2024 01:00:22 -0000
Message-ID: <170484842290.240792.13368245317851318720@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240109230149.1399302-1-matthew.brost@intel.com>
In-Reply-To: <20240109230149.1399302-1-matthew.brost@intel.com>
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

Series: GuC CT tweaks (rev2)
URL   : https://patchwork.freedesktop.org/series/128062/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
414601bf14e77eeb048ecf6d1c25190801399524
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 206eb3a84b96340d00ab643e0b550e1e6d3fab69
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jan 9 15:01:49 2024 -0800

    drm/xe/guc: Flush G2H handler when turning off CTs
    
    Make sure G2H handler is not running when changing the CT state to drop
    messages or disabled. This will help prevent races in the code ensuring
    that G2H are not being processed after changing the state.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch d6ef9c52d8d2ae4c85bc598b74a259db081fff26 drm-intel
630faacb3 drm/xe/guc: Add more GuC CT states
-:223: WARNING:TYPO_SPELLING: 'recieved' may be misspelled - perhaps 'received'?
#223: FILE: drivers/gpu/drm/xe/xe_guc_ct_types.h:80:
+ * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
                                                          ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 195 lines checked
e3bdc2816 drm/xe: Move TLB invalidation reset before HW reset
206eb3a84 drm/xe/guc: Flush G2H handler when turning off CTs


