Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1631DC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 15:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79B810E8F1;
	Wed, 12 Feb 2025 15:21:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D6A10E8F0;
 Wed, 12 Feb 2025 15:21:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Improve_type-safety_on_PO?=
 =?utf-8?q?WER=5FDOMAIN=5F*=28=29_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 15:21:05 -0000
Message-ID: <173937366587.1334884.12484117449466249841@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212132658.323640-1-gustavo.sousa@intel.com>
In-Reply-To: <20250212132658.323640-1-gustavo.sousa@intel.com>
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

Series: Improve type-safety on POWER_DOMAIN_*() macros
URL   : https://patchwork.freedesktop.org/series/144727/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2118901f4534761d88c8db1681da93bf4fe74813
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Wed Feb 12 10:26:38 2025 -0300

    drm/i915/display: Make POWER_DOMAIN_*() always result in enum intel_display_power_domain
    
    In the hope of contributing to type safety in our code, let's ensure
    that the type returned by the POWER_DOMAIN_*() macros is always of type
    enum intel_display_power_domain.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch cbd90e3e74e3102b4a3eeca23e0136382e8a478f drm-intel
dd8910569109 drm/i915/display: Use explicit cast in POWER_DOMAIN_*() macros
2118901f4534 drm/i915/display: Make POWER_DOMAIN_*() always result in enum intel_display_power_domain


