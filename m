Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A73EEE14C3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 19:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E269C10E1EC;
	Wed,  6 Sep 2023 19:38:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id ECF3010E1EC;
 Wed,  6 Sep 2023 19:38:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ECC43A00E8;
 Wed,  6 Sep 2023 19:38:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 06 Sep 2023 19:38:15 -0000
Message-ID: <169402909596.17390.14627609017521349554@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230906193009.1912129-1-lucas.demarchi@intel.com>
In-Reply-To: <20230906193009.1912129-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/pat=3A_Use_0_instead_of_space_on_error?=
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

Series: drm/xe/pat: Use 0 instead of space on error
URL   : https://patchwork.freedesktop.org/series/123354/
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
commit d44acb301d6f6af35faa4b8c2238fa6e388f24f3
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Sep 6 12:30:09 2023 -0700

    drm/xe/pat: Use 0 instead of space on error
    
    Use 0 in format string instead of space so it shows as
    
            [drm] *ERROR* Missing PAT table for platform with graphics version 20.04!
    
    instead of
    
            [drm] *ERROR* Missing PAT table for platform with graphics version 20. 4!
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 62fe9fa9afd1a2065c9e762e9da1216ac04b042f drm-intel
d44acb301 drm/xe/pat: Use 0 instead of space on error


