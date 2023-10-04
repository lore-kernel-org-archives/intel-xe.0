Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA7FE8FDDD
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 08:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF1910E34D;
	Wed,  4 Oct 2023 08:51:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D50E10E349;
 Wed,  4 Oct 2023 08:51:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 12BCBAADF2;
 Wed,  4 Oct 2023 08:51:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janga Rahul Kumar" <janga.rahul.kumar@intel.com>
Date: Wed, 04 Oct 2023 08:51:19 -0000
Message-ID: <169640947907.7834.1549726333904693999@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231004085138.1825175-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20231004085138.1825175-1-janga.rahul.kumar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Extend_query_ioctl_to_expose_tile_count?=
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

Series: drm/xe: Extend query ioctl to expose tile count
URL   : https://patchwork.freedesktop.org/series/124597/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 519044812df9edc5d3a1cd67a5da99a46ddb53cc
Author: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Date:   Wed Oct 4 14:21:38 2023 +0530

    drm/xe: Extend query ioctl to expose tile count
    
    Tile count can be queried by UMD's using the query ioctl.
    VM bind ioctl has tile mask param whose valid range can be
    determined based on the tile count info.
    
    Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
+ /mt/dim checkpatch 090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36 drm-intel
519044812 drm/xe: Extend query ioctl to expose tile count


