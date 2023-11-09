Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DF8C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 18:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69C810E110;
	Thu,  9 Nov 2023 18:06:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC71910E21F;
 Thu,  9 Nov 2023 18:06:00 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6927AA7DFB;
 Thu,  9 Nov 2023 18:06:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Thu, 09 Nov 2023 18:06:00 -0000
Message-ID: <169955316042.26589.7619699899871117984@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231109170754.3836109-1-ashutosh.dixit@intel.com>
In-Reply-To: <20231109170754.3836109-1-ashutosh.dixit@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/rtp=3A_Fix_displayed_whitelisted_register_range?=
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

Series: drm/xe/rtp: Fix displayed whitelisted register range
URL   : https://patchwork.freedesktop.org/series/126209/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 50bb4764b7b5a57d9ecb356d78173b6c3f8b302b
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Thu Nov 9 09:07:54 2023 -0800

    drm/xe/rtp: Fix displayed whitelisted register range
    
    Fix displayed whitelisted register range. For example, with:
    
            XE_RTP_ACTIONS(WHITELIST(0xdafc, RING_FORCE_TO_NONPRIV_RANGE_4))
    
    Before we would show:
            xe REG[0xdaf0-0xdaff]: allow read access
    
    With this patch we show:
            xe REG[0xdafc-0xdb0b]: allow read access
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 2096aea11094f62fea27af97d949423bea156686 drm-intel
50bb4764b drm/xe/rtp: Fix displayed whitelisted register range


