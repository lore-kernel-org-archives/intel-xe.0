Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED9EC021A0
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 01:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCF910E784;
	Wed, 12 Feb 2025 01:08:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B19510E784;
 Wed, 12 Feb 2025 01:08:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Ensure_that_?=
 =?utf-8?q?polled_read_returns_latest_data?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 01:08:15 -0000
Message-ID: <173932249543.1117684.6662123845798114573@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212010255.1423343-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250212010255.1423343-1-umesh.nerlige.ramappa@intel.com>
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

Series: drm/xe/oa: Ensure that polled read returns latest data
URL   : https://patchwork.freedesktop.org/series/144684/
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
commit e74173e7482e71f8d674b897245f1361abe71b99
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Tue Feb 11 17:02:55 2025 -0800

    drm/xe/oa: Ensure that polled read returns latest data
    
    In polled mode, user calls poll() for read data to be available before
    performing a read(). In the duration between these 2 calls, there may be
    new data available in the OA buffer. To ensure user reads all available
    data, check for latest data in the OA buffer in polled read.
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 76120b67a3d5e7a38cbc92fc39846297130fc6d0 drm-intel
e74173e7482e drm/xe/oa: Ensure that polled read returns latest data


