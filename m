Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA0CC5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 22:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB9510E18D;
	Wed, 28 May 2025 22:29:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6353C10E18D;
 Wed, 28 May 2025 22:29:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_configfs_to?=
 =?utf-8?q?_load_with_fewer_engines_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 22:29:53 -0000
Message-ID: <174847139340.29902.14199301590998826242@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
In-Reply-To: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
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

Series: drm/xe: Add configfs to load with fewer engines (rev4)
URL   : https://patchwork.freedesktop.org/series/149259/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0bf6ff05612119f23e8ba7fa72a0dc305cba5922
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed May 28 14:54:08 2025 -0700

    drm/xe/configfs: Add internal API to documentation
    
    Add the internal configfs API like is done with other parts of the
    driver. Also ensure the correct number of '=' chars are used for the
    header.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 2f74377e0846598397723197386e6d9d65b7711e drm-intel
56d4d506d6b5 drm/xe/configfs: Drop trailing semicolons
b2e5c793af72 drm/xe: Convert "fused off" messages to be gt-based
dc7b396843ca drm/xe: Allow to disable engines
331b7e34b854 drm/xe/configfs: Add attribute to disable engines
0bf6ff056121 drm/xe/configfs: Add internal API to documentation


