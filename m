Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D16EB64D0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 17:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DB110E350;
	Tue, 13 Jun 2023 17:49:55 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3789B10E36F;
 Tue, 13 Jun 2023 17:49:54 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3376BAADEC;
 Tue, 13 Jun 2023 17:49:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Tue, 13 Jun 2023 17:49:54 -0000
Message-ID: <168667859420.21696.10001797552855676708@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230613174740.786041-1-anusha.srivatsa@intel.com>
In-Reply-To: <20230613174740.786041-1-anusha.srivatsa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe/kunit=3A_Handle_fake_device?=
 =?utf-8?q?_creation_for_all_platform/subplatform_cases?=
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

Series: series starting with [1/2] drm/xe/kunit: Handle fake device creation for all platform/subplatform cases
URL   : https://patchwork.freedesktop.org/series/119291/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 847eadc2721da4e082531d47d4fff68978a287e4
Author: Anusha Srivatsa <anusha.srivatsa@intel.com>
Date:   Tue Jun 13 10:47:40 2023 -0700

    drm/xe: Add missing ADL entries to xe_test_wa
    
    With the fake device creation fix in the previous patch,
    adding Alderlake P platform in xe_wa_test.
    With this, driver is able to run the kunit test for
    ADLP properly.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
+ /mt/dim checkpatch 014f4a7195f282a084602e4cfd42ac8d641e585e drm-intel
f836622f4 drm/xe/kunit: Handle fake device creation for all platform/subplatform cases
847eadc27 drm/xe: Add missing ADL entries to xe_test_wa


