Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC028D3176B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 17:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A2E10E417;
	Tue,  5 Nov 2024 17:38:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E0810E417;
 Tue,  5 Nov 2024 17:38:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_GuC=3A_Improve_handling_o?=
 =?utf-8?q?f_the_malformed_G2H?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 17:38:42 -0000
Message-ID: <173082832273.1412890.2267332513681799283@2413ebb6fbb6>
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

Series: GuC: Improve handling of the malformed G2H
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
commit dd8d29addab2a9e993d2d35236888f12f9e2d96c
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Nov 5 18:30:32 2024 +0100

    drm/xe/guc: Don't treat GuC generic CAT error as protocol error
    
    GuC uses GUC_ID_MAX if it can not map the CAT fault to any PF/VF
    context. We shouldn't treat that as G2H protocol error that would
    justify a GT reset, as it may happen due to some VF activity.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b925cb281e79b763990ed64267ef82a87ace5060 drm-intel
8ea263d76f85 drm/xe/guc: Log content of the failed G2H message
ef569ffe3403 drm/xe/guc: Drop redundant logs about invalid G2H length
31059625466c drm/xe/guc: Don't read data from G2H prior to length check
dd8d29addab2 drm/xe/guc: Don't treat GuC generic CAT error as protocol error


