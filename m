Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62ED7D1CA3F
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 07:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1EE10E28F;
	Tue,  5 Nov 2024 07:32:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156B210E28F;
 Tue,  5 Nov 2024 07:32:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_case_for_as?=
 =?utf-8?q?serts_in_documentation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 07:32:11 -0000
Message-ID: <173079193106.1410467.6695728248743024597@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105071539.2623727-1-lucas.demarchi@intel.com>
In-Reply-To: <20241105071539.2623727-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Fix case for asserts in documentation
URL   : https://patchwork.freedesktop.org/series/140925/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3b9d07b2bda46bbb4979f59d446536beb4e2d749
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Nov 4 23:15:39 2024 -0800

    drm/xe: Fix case for asserts in documentation
    
    The rendered html documentation for "Xe ASSERTs" doesn't look nice with
    the mixed caps and gives the impression it was a typo. Use Title Case
    Style.
    
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20241104140813.1992885-1-lucas.demarchi@intel.com
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 88648ee3df948615dc0959a61d59e437d29a4c5a drm-intel
3b9d07b2bda4 drm/xe: Fix case for asserts in documentation


