Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5B1C76196
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 23:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A792F10F347;
	Fri, 31 Mar 2023 23:11:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8375810F347;
 Fri, 31 Mar 2023 23:11:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 58540AADD1;
 Fri, 31 Mar 2023 23:11:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 31 Mar 2023 23:11:31 -0000
Message-ID: <168030429132.14984.443100373920637297@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230331230902.1603294-1-lucas.demarchi@intel.com>
In-Reply-To: <20230331230902.1603294-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Fix_platform_order?=
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

Series: drm/xe: Fix platform order
URL   : https://patchwork.freedesktop.org/series/115973/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 1616dcb868ec1b3dd5b3e7e2cf94104e67c9e608
Author:     Lucas De Marchi <lucas.demarchi@intel.com>
AuthorDate: Thu Mar 23 22:17:52 2023 -0700
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Fri Mar 31 14:01:36 2023 -0700

    drm/xe: Remove unused revid from firmware name
    
    The rev field is always 0 so it ends up never used. In i915 it was
    introduced because of CML: up to rev 5 it reuses the guc and huc
    firmware blobs from KBL. After that there is a specific firmware for
    that platform.  This can be reintroduced later if ever needed.
    
    With the removal of revid the packed attribute in
    uc_fw_platform_requirement, which is there only for reducing the space
    these tables take, can also be removed since it has even more limited
    usefulness: currently there's only padding of 2 bytes. Remove the
    attribute to avoid the unaligned access.
    
            $ pahole -C uc_fw_platform_requirement build64/drivers/gpu/drm/xe/xe_uc_fw.o
            struct uc_fw_platform_requirement {
                    enum xe_platform           p;                    /*     0     4 */
                    const struct uc_fw_blob    blob;                 /*     4    10 */
    
                    /* size: 16, cachelines: 1, members: 2 */
                    /* padding: 2 */
                    /* last cacheline: 16 bytes */
            };
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Link: https://lore.kernel.org/r/20230324051754.1346390-2-lucas.demarchi@intel.com
=== git am output follows ===
Applying: drm/xe: Fix platform order


