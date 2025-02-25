Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01401C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 22:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6A310E817;
	Tue, 25 Feb 2025 22:54:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B44510E817;
 Tue, 25 Feb 2025 22:54:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Eliminate_usage?=
 =?utf-8?q?_of_TIMESTAMP=5FOVERRIDE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 22:54:54 -0000
Message-ID: <174052409423.2117652.17214751123696534638@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225224908.1671554-2-matthew.d.roper@intel.com>
In-Reply-To: <20250225224908.1671554-2-matthew.d.roper@intel.com>
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

Series: drm/xe: Eliminate usage of TIMESTAMP_OVERRIDE
URL   : https://patchwork.freedesktop.org/series/145437/
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
commit 6758b8fc825d74a5ccbaf463654ba090e2dd8736
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Feb 25 14:49:09 2025 -0800

    drm/xe: Eliminate usage of TIMESTAMP_OVERRIDE
    
    Recent discussions with the hardware architects have revealed that
    the TIMESTAMP_OVERRIDE register is never expected to hold a valid/useful
    value on production hardware.  That register would only get used by
    hardware workarounds (although there are none that use it today) or
    during early internal hardware testing.
    
    Due to lack of documentation it's not clear exactly what the driver
    should be doing if CTC_MODE[0] is set (or even whether that's a setting
    that would ever be encountered on real hardware), but it's definitely
    not what Xe and i915 have been doing.  So drop the incorrect code trying
    to use TIMESTAMP_REGISTER.  If the driver does encounter CTC_MODE[0] in
    the wild, we'll print a warning and just continue trying to use the
    crystal clock frequency since that's probably less incorrect than what
    we're doing today.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 533a24b8fa29455518aed9ac72209c834d814238 drm-intel
6758b8fc825d drm/xe: Eliminate usage of TIMESTAMP_OVERRIDE


