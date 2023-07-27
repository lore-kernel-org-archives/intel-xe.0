Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27930C001DC
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 13:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65BF10E58D;
	Thu, 27 Jul 2023 13:48:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7944010E58B;
 Thu, 27 Jul 2023 13:48:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 758B8AADE0;
 Thu, 27 Jul 2023 13:48:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Thu, 27 Jul 2023 13:48:40 -0000
Message-ID: <169046572047.19797.15750958958008460128@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230727132630.7-1-francois.dugast@intel.com>
In-Reply-To: <20230727132630.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Re?=
 =?utf-8?q?move_use_of_BUG=5FON?=
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

Series: Remove use of BUG_ON
URL   : https://patchwork.freedesktop.org/series/121439/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8a03933ba1386d7d94c1078a5b507d026a31e741
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Jul 27 13:26:30 2023 +0000

    drm/xe/macro: Display XE_WARN_ON messages only in debug mode
    
    Make printing of XE_WARN_ON messages depend on Xe debug flag
    CONFIG_DRM_XE_DEBUG, so that those messages are not printed in production
    environments.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 6dc7ee6d03e78d12f132a503fa47428fb2d4bb41 drm-intel
8276ca00a drm/xe/macro: Remove unused constant
b62d3dc56 drm/xe: Prefer WARN() over BUG() to avoid crashing the kernel
8a03933ba drm/xe/macro: Display XE_WARN_ON messages only in debug mode


