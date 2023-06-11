Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09686C7EE23
	for <intel-xe@archiver.kernel.org>; Sun, 11 Jun 2023 22:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2EA10E13B;
	Sun, 11 Jun 2023 22:28:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 510DA10E13B;
 Sun, 11 Jun 2023 22:27:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4E2BEA0BA8;
 Sun, 11 Jun 2023 22:27:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Sun, 11 Jun 2023 22:27:59 -0000
Message-ID: <168652247931.6758.2933693059559695591@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230611222447.2837573-1-lucas.demarchi@intel.com>
In-Reply-To: <20230611222447.2837573-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/5=5D_drm/xe=3A_Rename_pte/pde_encoding_?=
 =?utf-8?q?functions?=
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

Series: series starting with [1/5] drm/xe: Rename pte/pde encoding functions
URL   : https://patchwork.freedesktop.org/series/119174/
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
commit e32436c6aab824b7200fecf89ea786ab37d7e918
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Sun Jun 11 15:24:47 2023 -0700

    drm/xe: Fix GMD_ID to revid
    
    In order to calculate revid, let peek_gmdid() return the raw value of
    the register, then calculate arch, release and rev. Also rename the
    variables to make clear what are the assigned values.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch e24e730ad5d4c3af599fa4e1e05527120adca322 drm-intel
b26eba8ec drm/xe: Rename pte/pde encoding functions
a4a7c23a1 drm/xe/guc: Fix typo s/enabled/enable/
b48e000da drm/xe/guc: Normalize error messages with %#x
3cd9035ba drm/xe: Skip applying copy engine fuses
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '69a3738ba57f', maybe rebased or not pulled?
#6: 
Like commit 69a3738ba57f ("drm/i915: Skip applying copy engine fuses"),

total: 0 errors, 1 warnings, 0 checks, 9 lines checked
e32436c6a drm/xe: Fix GMD_ID to revid


