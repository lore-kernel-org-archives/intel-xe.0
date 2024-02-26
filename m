Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A553BC48BF6
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 13:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689EA10E73A;
	Mon, 26 Feb 2024 13:54:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EFB10E684;
 Mon, 26 Feb 2024 13:54:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_use_KMEM=5FCACH?=
 =?utf-8?q?E=28=29_to_create_xe=5Fhw=5Ffence_cache?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunwu Chan" <chentao@kylinos.cn>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Feb 2024 13:54:04 -0000
Message-ID: <170895564461.299440.18325290249473942394@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226021912.1779715-1-chentao@kylinos.cn>
In-Reply-To: <20240226021912.1779715-1-chentao@kylinos.cn>
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

Series: drm/xe: use KMEM_CACHE() to create xe_hw_fence cache
URL   : https://patchwork.freedesktop.org/series/130387/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2dd5e5410a50454ac218b0f2bba00b8fb983ae6a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 21e02202158f6d415bd7e88b7db214cfd592ef96
Author: Kunwu Chan <chentao@kylinos.cn>
Date:   Mon Feb 26 10:19:12 2024 +0800

    drm/xe: use KMEM_CACHE() to create xe_hw_fence cache
    
    Use the KMEM_CACHE() macro instead of kmem_cache_create() to simplify
    the creation of SLAB caches when the default values are used.
    
    Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
+ /mt/dim checkpatch be399e928738f94c998c4791f78cbbf96af08443 drm-intel
21e02202158f drm/xe: use KMEM_CACHE() to create xe_hw_fence cache


