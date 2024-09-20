Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615EACF9C5E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 17:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E84910E85A;
	Fri, 20 Sep 2024 17:18:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E9710E85A;
 Fri, 20 Sep 2024 17:18:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Xe2_performance_tuning_up?=
 =?utf-8?q?dates_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Sep 2024 17:18:19 -0000
Message-ID: <172685269961.1051582.10716983211412707561@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920171223.64969-1-gustavo.sousa@intel.com>
In-Reply-To: <20240920171223.64969-1-gustavo.sousa@intel.com>
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

Series: Xe2 performance tuning updates (rev2)
URL   : https://patchwork.freedesktop.org/series/138844/
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
commit 7c393ec5aa2ce3e0af7949e9e3558208e8b1453e
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Sep 20 14:12:11 2024 -0300

    drm/xe/xe2: Add performance tuning for L3 cache flushing
    
    A recommended performance tuning for LNL related to L3 cache flushing
    was recently introduced in Bspec. Implement it.
    
    v2:
      - Fix reference to Bspec. (Sai Teja, Tejas)
      - Use correct register name for "Tuning: L3 RW flush all Cache". (Sai
        Teja)
      - Use SCRATCH3_LBCF (with the underscore) for better readability.
    
    Bspec: 72161
    Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 128ccc5f71d7b9d84ce8f0651aa713ae490f4990 drm-intel
6432dc524edf drm/xe/mcr: Use Xe2_LPM steering tables for Xe2_HPM
d54aae9cb026 drm/xe/xe2: Extend performance tuning to media GT
9151b8400f5e drm/xe/xe2: Assume tuning settings also apply for future media GT
7c393ec5aa2c drm/xe/xe2: Add performance tuning for L3 cache flushing


