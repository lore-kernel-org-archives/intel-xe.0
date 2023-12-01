Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFCCC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 03:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C46810E7AB;
	Fri,  1 Dec 2023 03:21:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C8E910E7AB;
 Fri,  1 Dec 2023 03:21:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 03762AADF1;
 Fri,  1 Dec 2023 03:21:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Date: Fri, 01 Dec 2023 03:21:23 -0000
Message-ID: <170140088301.19689.5477568256487539111@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231130180135.628368-1-tejas.upadhyay@intel.com>
In-Reply-To: <20231130180135.628368-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/xe2=3A_Add_workaround_16020292621_=28rev8=29?=
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

Series: drm/xe/xe2: Add workaround 16020292621 (rev8)
URL   : https://patchwork.freedesktop.org/series/126644/
State : success

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
commit 313d051b28b020d79e81317a20e074658df97cef
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Nov 30 23:31:35 2023 +0530

    drm/xe/xe2: Add workaround 16020292621
    
    Workaround applies to Graphics 20.04 as part of ring
    submission
    
    V4(MattR):
      - Rule for engine in oob WA not supported, add explicitly
    V3(MattR):
      - Pass hwe and rename API name to hint end of ring work
      - Use existing RING_NOPID API
    V2:
      - Marking this WA for 20.04 instead of 20.00
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 84f2c2adec155170779f65ff63b4e80a51d22448 drm-intel
313d051b2 drm/xe/xe2: Add workaround 16020292621


