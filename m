Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998ACD58083
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 12:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A91710E625;
	Mon, 25 Nov 2024 12:06:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7732D10E625;
 Mon, 25 Nov 2024 12:06:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?1=2C1/1=5D_drm/xe=3A_fix_the_ERR=5FPTR=28=29_returned_on_failure_?=
 =?utf-8?q?to_allocate_tiny_pt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mirsad Todorovac" <mtodorovac69@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Nov 2024 12:06:01 -0000
Message-ID: <173253636150.2810552.7381335388751737918@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121212057.1526634-2-mtodorovac69@gmail.com>
In-Reply-To: <20241121212057.1526634-2-mtodorovac69@gmail.com>
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

Series: series starting with [v1,1/1] drm/xe: fix the ERR_PTR() returned on failure to allocate tiny pt
URL   : https://patchwork.freedesktop.org/series/141746/
State : warning

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
commit 6ef1c04fad1e1eaaa2547847b07f90231a842293
Author: Mirsad Todorovac <mtodorovac69@gmail.com>
Date:   Thu Nov 21 22:20:58 2024 +0100

    drm/xe: fix the ERR_PTR() returned on failure to allocate tiny pt
    
    Running coccinelle spatch gave the following warning:
    
    ./drivers/gpu/drm/xe/tests/xe_migrate.c:226:5-11: inconsistent IS_ERR and PTR_ERR on line 228.
    
    The code reports PTR_ERR(pt) when IS_ERR(tiny) is checked:
    
    → 211         pt = xe_bo_create_pin_map(xe, tile, m->q->vm, XE_PAGE_SIZE,
      212                                   ttm_bo_type_kernel,
      213                                   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
      214                                   XE_BO_FLAG_PINNED);
      215         if (IS_ERR(pt)) {
      216                 KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
      217                            PTR_ERR(pt));
      218                 goto free_big;
      219         }
      220
      221         tiny = xe_bo_create_pin_map(xe, tile, m->q->vm,
    → 222                                     2 * SZ_4K,
      223                                     ttm_bo_type_kernel,
      224                                     XE_BO_FLAG_VRAM_IF_DGFX(tile) |
      225                                     XE_BO_FLAG_PINNED);
    → 226         if (IS_ERR(tiny)) {
    → 227                 KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
    → 228                            PTR_ERR(pt));
      229                 goto free_pt;
      230         }
    
    Now, the IS_ERR(tiny) and the corresponding PTR_ERR(pt) do not match.
    
    Returning PTR_ERR(tiny), as the last failed function call, seems logical.
    
    Fixes: dd08ebf6c3525 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Philippe Lecluse <philippe.lecluse@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: David Airlie <airlied@gmail.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
    Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
    Cc: Simona Vetter <simona@ffwll.ch>
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
    Cc: David Kershner <david.kershner@intel.com>
    Cc: intel-xe@lists.freedesktop.org
    Cc: dri-devel@lists.freedesktop.org
    Cc: linux-kernel@vger.kernel.org
    Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>
+ /mt/dim checkpatch b21f1413ea1860e80fd278112e820e6dadfc9df9 drm-intel
6ef1c04fad1e drm/xe: fix the ERR_PTR() returned on failure to allocate tiny pt
-:32: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#32: 
→ 227                 KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",

-:41: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")'
#41: 
Fixes: dd08ebf6c3525 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 2 warnings, 0 checks, 10 lines checked


