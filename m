Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3984DD35E4D
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 20:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E541C10E432;
	Tue,  5 Nov 2024 20:52:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C0F10E432;
 Tue,  5 Nov 2024 20:52:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_GuC=3A_Improve_handling_o?=
 =?utf-8?q?f_the_malformed_G2H_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 20:52:05 -0000
Message-ID: <173083992523.1414110.8378864404458193675@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105173032.1947-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241105173032.1947-1-michal.wajdeczko@intel.com>
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

Series: GuC: Improve handling of the malformed G2H (rev2)
URL   : https://patchwork.freedesktop.org/series/140958/
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
commit 43654a6093affcf59de7da37631b9316179121d7
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Nov 5 21:45:57 2024 +0100

    drm/xe/guc: Don't treat GuC generic CAT error as protocol error
    
    GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any
    context. We shouldn't treat that as G2H protocol error that would
    justify a GT reset, as it may happen due to some VF activity.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 1051f5a468c5531923b01ba67999e502ce47a6b0 drm-intel
050b8d4feb40 drm/xe/guc: Log content of the failed G2H message
efcccb2a195d drm/xe/guc: Drop redundant logs about invalid G2H length
864281ab1aea drm/xe/guc: Don't read data from G2H prior to length check
43654a6093af drm/xe/guc: Don't treat GuC generic CAT error as protocol error


