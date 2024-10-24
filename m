Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87780D0BB5C
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 11:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A3610E900;
	Thu, 24 Oct 2024 11:09:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3617410E900;
 Thu, 24 Oct 2024 11:09:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?1=2C1/1=5D_drm/xe/guc=3A_Fix_missing_init_value_and_add_register_?=
 =?utf-8?q?order_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 11:09:40 -0000
Message-ID: <172976818021.1327036.11280228217274794814@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023192307.746525-1-zhanjun.dong@intel.com>
In-Reply-To: <20241023192307.746525-1-zhanjun.dong@intel.com>
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

Series: series starting with [v1,1/1] drm/xe/guc: Fix missing init value and add register order check
URL   : https://patchwork.freedesktop.org/series/140392/
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
commit abc8993578c4b73d13401c948d6368c6add3bba7
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Wed Oct 23 12:23:07 2024 -0700

    drm/xe/guc: Fix missing init value and add register order check
    
    Fix missing initial value for last_value.
    For GuC capture register definition, it is required to define 64bit
    register in a pair of 2 consecutive 32bit register entries, low first,
    then hi. Add code to check this order.
    
    Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into capture list")
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 121cd95da591284c97d6f9ac1c58c7a79d27b201 drm-intel
abc8993578c4 drm/xe/guc: Fix missing init value and add register order check


