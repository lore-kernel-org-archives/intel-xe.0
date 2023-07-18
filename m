Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1D4EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 20:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769B210E3B8;
	Tue, 18 Jul 2023 20:16:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7DCCE10E3B8;
 Tue, 18 Jul 2023 20:16:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7A492AADD5;
 Tue, 18 Jul 2023 20:16:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 18 Jul 2023 20:16:01 -0000
Message-ID: <168971136149.22205.17334529176199631890@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230718193924.3084759-1-lucas.demarchi@intel.com>
In-Reply-To: <20230718193924.3084759-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe=3A_Normalize_XE=5FVM=5FFLAG?=
 =?utf-8?q?*_names?=
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

Series: series starting with [1/2] drm/xe: Normalize XE_VM_FLAG* names
URL   : https://patchwork.freedesktop.org/series/120937/
State : warning

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
commit a9ae6923391e95c9eaa56c0c2251335f59d64588
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Jul 18 12:39:24 2023 -0700

    drm/xe: Use FIELD_PREP/FIELD_GET for tile id encoding
    
    Use FIELD_PREP()/FIELD_GET() to encode the tile id into flags. Besides
    protecting for eventual overflow it also makes it easier to see a new
    flag can't be added as BIT(7).
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch ef15638ca08763b3c7a08b4207b1237b5eb08854 drm-intel
bef247905 drm/xe: Normalize XE_VM_FLAG* names
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '4e6715bd2a5e', maybe rebased or not pulled?
#7: 
s/GT/TILE/ that got missed in commit 4e6715bd2a5e ("drm/xe: Move

total: 0 errors, 1 warnings, 0 checks, 93 lines checked
a9ae69233 drm/xe: Use FIELD_PREP/FIELD_GET for tile id encoding


