Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7CDC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 11:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF8110E1A9;
	Thu,  6 Feb 2025 11:34:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C5A10E1A9;
 Thu,  6 Feb 2025 11:34:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_MAINTAINERS=3A_Add_TTM_re?=
 =?utf-8?q?viewers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 11:34:11 -0000
Message-ID: <173884165102.1996665.3796890817768735375@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
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

Series: MAINTAINERS: Add TTM reviewers
URL   : https://patchwork.freedesktop.org/series/144409/
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
commit cd4f449f609424f099c0d27adc5cd8bb74bf2c80
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Feb 6 11:35:44 2025 +0100

    MAINTAINERS: Add TTM reviewers
    
    Add Matthew Auld and Matthew Brost as TTM reviewers
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Dave Airlie <airlied@gmail.com>
    Cc: Simona Vetter <simona.vetter@ffwll.ch>
    Cc: dri-devel@lists.freedesktop.org
    Cc: linux-kernel@vger.kernel.org
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch 5cd5f595e2d183e974b3695aa5938390594f8e99 drm-intel
cd4f449f6094 MAINTAINERS: Add TTM reviewers


