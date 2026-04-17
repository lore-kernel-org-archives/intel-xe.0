Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8948F8E4A5
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 05:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8103D10E11B;
	Fri, 17 Apr 2026 05:04:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081F710E11B;
 Fri, 17 Apr 2026 05:03:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/psr=3A_Disable_P?=
 =?utf-8?q?SR2_on_Xiaomi_Book_Pro_14_2026_as_a_quirk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Apr 2026 05:03:59 -0000
Message-ID: <177640223902.471087.10249560053362276737@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260417044926.750354-1-jouni.hogander@intel.com>
In-Reply-To: <20260417044926.750354-1-jouni.hogander@intel.com>
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

Series: drm/i915/psr: Disable PSR2 on Xiaomi Book Pro 14 2026 as a quirk
URL   : https://patchwork.freedesktop.org/series/165034/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 19c0cd17d86b48e0b905616f826a7eceef85215f
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Apr 17 07:49:26 2026 +0300

    drm/i915/psr: Disable PSR2 on Xiaomi Book Pro 14 2026 as a quirk
    
    Add new quirk (QUIRK_DISABLE_PSR2) for disabling PSR2 as a quirk for
    problematic setups. Apply this newly added quirk on Xiaomi Book Pro 14 2026.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7677
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 3b9ca4c40814c96c38986ae2ba6651e43757ca5f drm-intel
19c0cd17d86b drm/i915/psr: Disable PSR2 on Xiaomi Book Pro 14 2026 as a quirk
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
problematic setups. Apply this newly added quirk on Xiaomi Book Pro 14 2026.

total: 0 errors, 1 warnings, 0 checks, 40 lines checked


