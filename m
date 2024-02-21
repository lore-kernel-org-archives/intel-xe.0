Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9268C48BF6
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 07:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CF510E374;
	Wed, 21 Feb 2024 07:39:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DCB10E38F;
 Wed, 21 Feb 2024 07:39:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/ttm=3A_Fix_an_invalid?=
 =?utf-8?q?_freeing_on_already_freed_page_in_error_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Feb 2024 07:39:01 -0000
Message-ID: <170850114135.178729.9683689246742251395@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221073324.3303-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240221073324.3303-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm: Fix an invalid freeing on already freed page in error path
URL   : https://patchwork.freedesktop.org/series/130171/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8bfa8f49e15f52fee4d81d0f40b5acc6091d0ef0
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Feb 21 08:33:24 2024 +0100

    drm/ttm: Fix an invalid freeing on already freed page in error path
    
    If caching mode change fails due to, for example, OOM we
    free the allocated pages in a two-step process. First the pages
    for which the caching change has already succeeded. Secondly
    the pages for which a caching change did not succeed.
    
    However the second step was incorrectly freeing the pages already
    freed in the first step.
    
    Fix.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Fixes: 379989e7cbdc ("drm/ttm/pool: Fix ttm_pool_alloc error path")
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Dave Airlie <airlied@redhat.com>
    Cc: Christian Koenig <christian.koenig@amd.com>
    Cc: Huang Rui <ray.huang@amd.com>
    Cc: dri-devel@lists.freedesktop.org
    Cc: <stable@vger.kernel.org> # v6.4+
+ /mt/dim checkpatch 4b8a238dee9c18201f3652695414587cd2ef6d8f drm-intel
8bfa8f49e15f drm/ttm: Fix an invalid freeing on already freed page in error path


