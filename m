Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C7DC02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 17:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FC789ABE;
	Fri, 17 Jan 2025 17:22:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C9910E336;
 Fri, 17 Jan 2025 17:22:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_MAINTAINERS=3A_Also_exclu?=
 =?utf-8?q?de_xe_for_drm-misc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 17:22:34 -0000
Message-ID: <173713455448.801064.16373703143066862570@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117164529.393503-1-lucas.demarchi@intel.com>
In-Reply-To: <20250117164529.393503-1-lucas.demarchi@intel.com>
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

Series: MAINTAINERS: Also exclude xe for drm-misc
URL   : https://patchwork.freedesktop.org/series/143681/
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
commit f7cee7316f33478fcc48659ddbbe17e6ad6774a8
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Jan 17 08:45:29 2025 -0800

    MAINTAINERS: Also exclude xe for drm-misc
    
    When the xe driver was added, it didn't extend the exclude entries for
    drm-misc, as done in commit 5a44d50f0072 ("MAINTAINERS: Update drm-misc
    entry to match all drivers"). Exclude it like is done for i915 and other
    drivers with dedicated maintainers.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch db09bf4e722f65089b91798e6d490d21b8dd8143 drm-intel
f7cee7316f33 MAINTAINERS: Also exclude xe for drm-misc


