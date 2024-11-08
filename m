Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE1FD64099
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D691610E027;
	Fri,  8 Nov 2024 23:11:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8EF10E2A4;
 Fri,  8 Nov 2024 23:11:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Disallow_OA_from_being_en?=
 =?utf-8?q?abled_on_active_exec=5Fqueue=27s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Nov 2024 23:11:37 -0000
Message-ID: <173110749784.1429282.3417317176879588762@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241108230602.2984959-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241108230602.2984959-1-ashutosh.dixit@intel.com>
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

Series: Disallow OA from being enabled on active exec_queue's
URL   : https://patchwork.freedesktop.org/series/141121/
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
commit 7b1bd9d731f802db8e0a79fd24ee0a3c7bcfd579
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri Nov 8 15:06:01 2024 -0800

    drm/xe/oa: Allow subsequent OA streams to be opened on an exec_queue
    
    The restriction that OA not be enabled on an active exec queue only applies
    to the first OA stream opened on the exec queue. Subsequent OA streams can
    be opened on the exec queue since this will not toggle the
    OAC_CONTEXT_ENABLE bit.
    
    Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
    Cc: stable@vger.kernel.org
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 5d94c05a3b9625a569b92a4ed208ce04e241f122 drm-intel
8db8efc7e8c2 drm/xe/oa: Disallow OA from being enabled on active exec_queue's
7b1bd9d731f8 drm/xe/oa: Allow subsequent OA streams to be opened on an exec_queue


