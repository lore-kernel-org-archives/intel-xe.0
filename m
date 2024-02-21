Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7721DC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 08:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBC910E2E1;
	Wed, 21 Feb 2024 08:42:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E723910E256;
 Wed, 21 Feb 2024 08:42:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Do_not_include_?=
 =?utf-8?q?current_dir_for_generated/xe=5Fwa=5Foob=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dhirschfeld@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Feb 2024 08:42:17 -0000
Message-ID: <170850493794.178559.10984408685674485232@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221083622.1584492-1-dhirschfeld@habana.ai>
In-Reply-To: <20240221083622.1584492-1-dhirschfeld@habana.ai>
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

Series: drm/xe: Do not include current dir for generated/xe_wa_oob.h
URL   : https://patchwork.freedesktop.org/series/130179/
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
commit 8668695e5d887e3d3e6d8298f97b7e4f6c2ac931
Author: Dafna Hirschfeld <dhirschfeld@habana.ai>
Date:   Wed Feb 21 10:36:22 2024 +0200

    drm/xe: Do not include current dir for generated/xe_wa_oob.h
    
    The generated file 'generated/xe_wa_oob.h' is included using:
    "generated/xe_wa_oob.h"
    which first look inside the source code. But the file resides
    in the build directory and should therefore be included using:
    <generated/xe_wa_oob.h>
    
    Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch b895612a4da69e73804cd5fc2dedfa44fda1da99 drm-intel
8668695e5d88 drm/xe: Do not include current dir for generated/xe_wa_oob.h


