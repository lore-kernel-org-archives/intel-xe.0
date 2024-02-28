Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF78C54E41
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 06:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CEB10E131;
	Wed, 28 Feb 2024 06:41:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2191B10E131;
 Wed, 28 Feb 2024 06:41:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Refactor_and_fix_mocs_liv?=
 =?utf-8?q?e_kunit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Feb 2024 06:41:07 -0000
Message-ID: <170910246713.356522.6429024481669675698@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228061048.3661978-1-lucas.demarchi@intel.com>
In-Reply-To: <20240228061048.3661978-1-lucas.demarchi@intel.com>
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

Series: Refactor and fix mocs live kunit
URL   : https://patchwork.freedesktop.org/series/130474/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9ab59fc4b7cb7663906ac4471a262434aef57f03
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 24806279305bb6786c262e775ef9cf5c5923d2ff
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Feb 27 22:10:48 2024 -0800

    drm/xe/mocs: Fix DG2 kunit
    
    LNCFCMOCS31[31:16] is read-only for DG2 and MTL, so it's not possible to
    check set it. While trying to set doesn't cause any issue, later when
    it's read back to check if the value got correctly recorded causes the
    test to fail. Now that test is reliable for an odd number of entries,
    reduce it so the last entry is ignored.
    
    Bspec: 55267
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1253
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1233
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 269ea0ff7988bc743e1f66a928e778950eabf59c drm-intel
9a1d0248fb7b drm/xe/mocs: Refactor mocs/l3cc loop
97062248e33d drm/xe/mocs: Be explicit when logging number of entries
fbb6803bd23c drm/xe/mocs: Move warn/assertion up
45f57746e6d4 drm/xe/mocs: Allow odd number of entries on test
24806279305b drm/xe/mocs: Fix DG2 kunit


