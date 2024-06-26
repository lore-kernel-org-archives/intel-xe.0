Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72915C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 18:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382FC10E009;
	Wed, 26 Jun 2024 18:26:23 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BA910E009;
 Wed, 26 Jun 2024 18:26:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Add_NO=5FPRE?=
 =?utf-8?q?EMPT_property_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 18:26:22 -0000
Message-ID: <171942638253.162140.6895291505958917668@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626181817.1516229-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240626181817.1516229-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Add NO_PREEMPT property (rev6)
URL   : https://patchwork.freedesktop.org/series/135382/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e5f34a118e036b5ee5ca661473f925bd2b2af0cc
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Wed Jun 26 11:18:17 2024 -0700

    drm/xe/oa/uapi: Allow preemption to be disabled on the stream exec queue
    
    Mesa VK_KHR_performance_query use case requires preemption and timeslicing
    to be disabled for the stream exec queue. Implement this functionality
    here.
    
    v2: Minor change to debug print to print both ret values (Umesh)
    
    Acked-by: José Roberto de Souza <jose.souza@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch c02b84a0d04c551044f5b479e6599692c7c1f954 drm-intel
4263be2dcc34 drm/xe/oa: Allow stream enable/disable functions to return error
e5f34a118e03 drm/xe/oa/uapi: Allow preemption to be disabled on the stream exec queue


