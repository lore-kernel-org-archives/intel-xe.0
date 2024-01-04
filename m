Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916CAC4706F
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 04:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4AE10E372;
	Thu,  4 Jan 2024 04:03:30 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36BE10E371;
 Thu,  4 Jan 2024 04:03:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_GuC_CT_tweaks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 04 Jan 2024 04:03:29 -0000
Message-ID: <170434100973.151.9980439451075392248@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231229043507.1002411-1-matthew.brost@intel.com>
In-Reply-To: <20231229043507.1002411-1-matthew.brost@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/128062/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit df0f6b200163b65a449b320929ebff059e5d2c9d
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Dec 28 20:35:07 2023 -0800

    drm/xe/guc: Flush G2H handler when turning off CTs
    
    Make sure G2H handler is not running when changing the CT state to drop
    messages or disabled. This will help prevent races in the code ensuring
    that G2H are not being processed after changing the state.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
1bb9374fb drm/xe/guc: Add more GuC CT states
-:202: WARNING:TYPO_SPELLING: 'recieved' may be misspelled - perhaps 'received'?
#202: FILE: drivers/gpu/drm/xe/xe_guc_ct_types.h:80:
+ * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
                                                          ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 181 lines checked
27bb6ffbb drm/xe: Move TLB invalidation reset before HW reset
fd3180362 drm/xe/guc: Protect queuing of G2H handler with fast lock
df0f6b200 drm/xe/guc: Flush G2H handler when turning off CTs


