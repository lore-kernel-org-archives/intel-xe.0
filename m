Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ECBC3DA63
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 06:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0506910E7DD;
	Fri, 26 Jul 2024 06:50:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9814210E17A;
 Fri, 26 Jul 2024 06:50:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_rtp_when_processing_O?=
 =?utf-8?q?OB_workarounds_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 06:50:04 -0000
Message-ID: <172197660461.385062.5253137950808457035@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
In-Reply-To: <20240726064337.797576-1-lucas.demarchi@intel.com>
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

Series: Fix rtp when processing OOB workarounds (rev3)
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
commit 1cef870309d16cf60cbd02de13dbe96d0c3bd5cd
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Jul 25 23:43:37 2024 -0700

    drm/xe/rtp: Simplify marking active workarounds
    
    Stop doing the calculation both in rtp_mark_active() and in its caller.
    The caller easily knows the number of entries to mark, so just pass it
    forward. That also simplifies rtp_mark_active() since now it doesn't
    have a special case when handling 1 entry.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch edd84625d093bb52bfb1c0c6feb12cff308d81b7 drm-intel
b9565cf6c0ca drm/xe/kunit: Test WAs for BMG
32ac6cad7b50 drm/xe/kunit: Rename count to sr_entries
2b41addc1e5e drm/xe/kunit: Test active rtp entries
61172ab59596 drm/xe/kunit: Rename rtp test cases
45a477522575 drm/xe/rtp: Fix off-by-one when processing rules
840669ad4298 drm/xe/kunit: Test rtp with no actions
1cef870309d1 drm/xe/rtp: Simplify marking active workarounds


