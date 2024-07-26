Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29205C3DA64
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 03:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC5E10E0A3;
	Fri, 26 Jul 2024 03:28:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BAF10E0A3;
 Fri, 26 Jul 2024 03:28:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_rtp_when_processing_O?=
 =?utf-8?q?OB_workarounds_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 03:28:45 -0000
Message-ID: <172196452541.384626.13797179014599660603@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725220956.737987-1-lucas.demarchi@intel.com>
In-Reply-To: <20240725220956.737987-1-lucas.demarchi@intel.com>
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

Series: Fix rtp when processing OOB workarounds (rev2)
URL   : https://patchwork.freedesktop.org/series/136538/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7dd80e86d3f138a7ce9d85113b2be3047f6ebaa4
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Jul 25 15:09:56 2024 -0700

    drm/xe/kunit: Test active rtp entries
    
    Enabling active tracking in the rtp context and check for all the tests
    the expected entries become active.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch e4d74e86acba1cf96e4513a63046b793ae43ece7 drm-intel
bb03f5937960 drm/xe/rtp: Fix off-by-one when processing rules
3d8bd519d068 drm/xe/rtp: Simplify marking active workarounds
fe65305b8fda drm/xe/kunit: Test WAs for BMG
17a156a78995 drm/xe/kunit: Rename count to sr_entries
7dd80e86d3f1 drm/xe/kunit: Test active rtp entries


