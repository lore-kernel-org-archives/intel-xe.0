Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A722E810BA
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 10:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A84C10E4B5;
	Wed, 27 Sep 2023 10:08:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1BD6710E4B5;
 Wed, 27 Sep 2023 10:08:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1D9FEAADF4;
 Wed, 27 Sep 2023 10:08:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Date: Wed, 27 Sep 2023 10:08:18 -0000
Message-ID: <169580929811.20756.8623348246019626819@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230918071231.288885-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230918071231.288885-1-chaitanya.kumar.borah@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re?=
 =?utf-8?q?vert_=22FIXME=3A_drm/i915/ips=3A_apparently_silence_warnings=22?=
 =?utf-8?q?_=28rev2=29?=
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

Series: Revert "FIXME: drm/i915/ips: apparently silence warnings" (rev2)
URL   : https://patchwork.freedesktop.org/series/123844/
State : warning

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
commit 7bb19c62f24c9f9f5fad00b8c05ccdc504da8385
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Mon Sep 18 12:42:31 2023 +0530

    Revert "FIXME: drm/i915/ips: apparently silence warnings"
    
    This reverts commit 004360063d3b8a29cdf599ed18dc6a23c6e61513.
    
    There seems to be no effect of this patch i.e. removing this
    patch yields no compiler warnings. Hence, revert.
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch fc8ec3c56efa5c15b630ddc17c89100440fe03ef drm-intel
7bb19c62f Revert "FIXME: drm/i915/ips: apparently silence warnings"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '004360063d3b8a29cdf599ed18dc6a23c6e61513', maybe rebased or not pulled?
#6: 
This reverts commit 004360063d3b8a29cdf599ed18dc6a23c6e61513.

total: 0 errors, 1 warnings, 0 checks, 18 lines checked


