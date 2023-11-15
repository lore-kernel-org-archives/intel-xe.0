Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02920C07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 12:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BF810E54D;
	Wed, 15 Nov 2023 12:34:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C4FB10E54D;
 Wed, 15 Nov 2023 12:34:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0A966AADF1;
 Wed, 15 Nov 2023 12:34:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Wed, 15 Nov 2023 12:34:28 -0000
Message-ID: <170005166804.649.7954226406049052217@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231115113748.1949-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231115113748.1949-1-michal.wajdeczko@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/4=5D_drm/xe/guc=3A_Fix_wrong_assert_abo?=
 =?utf-8?q?ut_full=5Flen?=
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

Series: series starting with [1/4] drm/xe/guc: Fix wrong assert about full_len
URL   : https://patchwork.freedesktop.org/series/126458/
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
commit 2fcca3efcd99e90120ba04ba8e1145b2a0d5f9fa
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Nov 15 12:37:48 2023 +0100

    drm/xe/guc: Use valid scratch register for posting read
    
    There are only 4 scratch registers VF_SW_FLAG(0..3) on each GuC.
    We shouldn't use non-existing register VF_SW_FLAG(4) for posting
    read.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 14d1d786caacdb3438d07ab86fabf2e36c8151cc drm-intel
03f757525 drm/xe/guc: Fix wrong assert about full_len
9cc8a0b12 drm/xe/guc: Copy response data from proper registers
f4f11457c drm/xe/guc: Fix handling of GUC_HXG_TYPE_NO_RESPONSE_BUSY
2fcca3efc drm/xe/guc: Use valid scratch register for posting read


