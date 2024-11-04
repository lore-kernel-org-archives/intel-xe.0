Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23E7D1BDE5
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 19:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E3E10E3ED;
	Mon,  4 Nov 2024 19:32:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201E410E3ED;
 Mon,  4 Nov 2024 19:32:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Fix_missing?=
 =?utf-8?q?_init_value_and_add_register_order_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Nov 2024 19:32:08 -0000
Message-ID: <173074872812.1406741.6779958590850981308@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241104182425.162007-1-zhanjun.dong@intel.com>
In-Reply-To: <20241104182425.162007-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Fix missing init value and add register order check
URL   : https://patchwork.freedesktop.org/series/140889/
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
commit 3313c3719d1e716ef3e3fda63655732bc6729468
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Mon Nov 4 10:24:25 2024 -0800

    drm/xe/guc: Fix missing init value and add register order check
    
    Fix missing initial value for last_value.
    For GuC capture register definition, it is required to define 64bit
    register in a pair of 2 consecutive 32bit register entries, low first,
    then hi. Add code to check this order.
    
    Fixes: ecb633646391 ("drm/xe/guc: Plumb GuC-capture into dev coredump")
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    
    Changes from prior revs:
     v2:- Correct the fix tag pointed commit
          Add examples in comments for warning
          Add 1 missing hi condition check
+ /mt/dim checkpatch 0a6cc4357ae4d824f909468ca1deed28ae5ac96f drm-intel
3313c3719d1e drm/xe/guc: Fix missing init value and add register order check


