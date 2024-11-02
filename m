Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F36EE67805
	for <intel-xe@archiver.kernel.org>; Sat,  2 Nov 2024 16:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B82F10E30F;
	Sat,  2 Nov 2024 16:18:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F0910E1A1;
 Sat,  2 Nov 2024 16:18:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_devcoredump_doc?=
 =?utf-8?q?umentation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 02 Nov 2024 16:18:47 -0000
Message-ID: <173056432778.1389421.1802128271465538591@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241102161254.1818604-1-lucas.demarchi@intel.com>
In-Reply-To: <20241102161254.1818604-1-lucas.demarchi@intel.com>
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

Series: drm/xe: devcoredump documentation
URL   : https://patchwork.freedesktop.org/series/140842/
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
commit 5637aa6d4b54325cee756a8ba2384905839ac5fe
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Sat Nov 2 09:12:54 2024 -0700

    drm/xe: Wire up devcoredump in documentation
    
    Add a documentation page to detail the device coredump as implemented by
    xe - it was documented in the source code, but not visible in the
    rendered (html) documentation.
    
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Raag Jadav <raag.jadav@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20241031182916.1441987-3-lucas.demarchi@intel.com
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 2a0d989e396396f20ee5cfc4fad5b9dbbb2307d5 drm-intel
3b9330c21fd4 drm/xe: Improve devcoredump documentation
5637aa6d4b54 drm/xe: Wire up devcoredump in documentation
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 19 lines checked


