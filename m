Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C18CA0FE5
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 15:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACACD10E721;
	Fri,  1 Sep 2023 15:58:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95DB210E772;
 Fri,  1 Sep 2023 15:57:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 92159AADF2;
 Fri,  1 Sep 2023 15:57:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Fri, 01 Sep 2023 15:57:58 -0000
Message-ID: <169358387859.9813.14237610787962032584@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230901142824.316711-3-matthew.auld@intel.com>
In-Reply-To: <20230901142824.316711-3-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe/selftests=3A_consider_multi?=
 =?utf-8?q?-GT_for_eviction_test?=
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

Series: series starting with [1/2] drm/xe/selftests: consider multi-GT for eviction test
URL   : https://patchwork.freedesktop.org/series/123181/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9a06072fe64bce0a033b97105e19fadd070968e0
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Sep 1 15:28:26 2023 +0100

    drm/xe/selftests: make eviction test tile centric
    
    The concern here is that we may have platforms with dedicated media GT,
    and we anyway allocate the object on the tile, which just means running
    the same test twice (i.e primary vs media GT).
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch e4a0387635ffa6ccbc6207c9195896bcc4e59de2 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


