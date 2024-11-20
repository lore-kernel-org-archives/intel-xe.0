Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A933D743D1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 20:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A09810E3CA;
	Wed, 20 Nov 2024 20:06:09 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D6810E17F;
 Wed, 20 Nov 2024 20:06:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Sort_again_the_?=
 =?utf-8?q?info_flags_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Nov 2024 20:06:07 -0000
Message-ID: <173213316769.837841.10368575630657807780@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120195710.3447100-1-lucas.demarchi@intel.com>
In-Reply-To: <20241120195710.3447100-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Sort again the info flags (rev2)
URL   : https://patchwork.freedesktop.org/series/141521/
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
commit 07737c81372ba8effb9381c0edf65fe0879c3192
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Nov 20 11:57:10 2024 -0800

    drm/xe: Sort again the info flags
    
    Those flags are supposed to be kept sorted alphabetically. Unfortunately
    it's a constant battle as new flags are added to the end or at random
    places. Sort it again.
    
    v2: Include the other non-has_* 1-bit flags in the sort
    v3: Add comment to keep flags sorted
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 0cb17ecec562c61d45997a2fced4e5ed99b31f99 drm-intel
07737c81372b drm/xe: Sort again the info flags


