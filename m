Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BD2C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 15:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38A710E569;
	Tue,  5 Dec 2023 15:56:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5CCB810E569;
 Tue,  5 Dec 2023 15:56:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 590CAAADD5;
 Tue,  5 Dec 2023 15:56:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 05 Dec 2023 15:56:56 -0000
Message-ID: <170179181636.24286.12226574444227086146@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205133954.2089546-1-lucas.demarchi@intel.com>
In-Reply-To: <20231205133954.2089546-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5BCI=2C1/4=5D_drm/xe/kunit=3A_Remove_handli?=
 =?utf-8?q?ng_of_XE=5FTEST=5FSUBPLATFORM=5FANY?=
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

Series: series starting with [CI,1/4] drm/xe/kunit: Remove handling of XE_TEST_SUBPLATFORM_ANY
URL   : https://patchwork.freedesktop.org/series/127361/
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
commit 2da4f84bbf5073ba59607b51f9ba3a55a34257fd
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Dec 5 05:39:54 2023 -0800

    drm/xe/kunit: Test WAs for MTL and LNL
    
    Now that the kunit infra has proper support for GMD_ID platforms, add a
    few variants of MTL and LNL.
    
    v2: Remove bogus check for setting both media and graphics version in
        test (Matt Roper)
    
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Link: https://lore.kernel.org/r/20231129232807.1499826-6-lucas.demarchi@intel.com
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch ac7b89571d802765762e7c15d78a6dcd5d92c41b drm-intel
33ae027c6 drm/xe/kunit: Remove handling of XE_TEST_SUBPLATFORM_ANY
e95ec6066 drm/xe/kunit: Move fake pci data to test-priv
4db319bf9 drm/xe/kunit: Add stub to read_gmdid
2da4f84bb drm/xe/kunit: Test WAs for MTL and LNL


