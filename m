Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76DFC4706F
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 04:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDF810E034;
	Thu,  4 Jan 2024 04:52:59 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A484B10E385;
 Thu,  4 Jan 2024 04:52:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_fix_typ?=
 =?utf-8?q?e_of_intel=5Funcore=5Fread*=28=29_functions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Coelho, Luciano" <luciano.coelho@intel.com>
Date: Thu, 04 Jan 2024 04:52:58 -0000
Message-ID: <170434397867.1841.10619117367959282507@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231228110526.383245-1-luciano.coelho@intel.com>
In-Reply-To: <20231228110526.383245-1-luciano.coelho@intel.com>
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

Series: drm/xe/display: fix type of intel_uncore_read*() functions
URL   : https://patchwork.freedesktop.org/series/128054/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 660bc614b142a9d83fcb7b4aeb3889a493dda8e7
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Thu Dec 28 13:05:26 2023 +0200

    drm/xe/display: fix type of intel_uncore_read*() functions
    
    Some of the backported intel_uncore_read*() functions used the wrong
    types.  Change the function declarations accordingly.
    
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
660bc614b drm/xe/display: fix type of intel_uncore_read*() functions


