Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549DBCDE00B
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 00:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10BC10F3D5;
	Fri, 26 Jun 2026 00:00:56 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D7710F3D5;
 Fri, 26 Jun 2026 00:00:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/tests/rtp=3A_Add_k?=
 =?utf-8?q?unit_test_for_whitelist_upper_bounds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jun 2026 00:00:55 -0000
Message-ID: <178243205554.119165.16032216254667192114@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625-kunit_whitelist_bounds-v1-1-d8f5f055f1f0@intel.com>
In-Reply-To: <20260625-kunit_whitelist_bounds-v1-1-d8f5f055f1f0@intel.com>
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

Series: drm/xe/tests/rtp: Add kunit test for whitelist upper bounds
URL   : https://patchwork.freedesktop.org/series/169229/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cdf595b4577c3d0d8ae45406ed36d7fe80a81892
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Jun 25 16:37:54 2026 -0700

    drm/xe/tests/rtp: Add kunit test for whitelist upper bounds
    
    Xe must only add registers to the GT whitelist if they are listed in the
    "Software Allowlist" section of the bspec.  These registers have been
    carefully reviewed by the architecture/security teams to ensure that
    they are safe to whitelist from a security perspective.  The list of
    allowed registers changes from platform to platform, and it is not safe
    to assume that a register is safe to whitelist on a new platform/IP just
    because it was whitelisted on older ones.  This means that whitelist
    entries in the driver that used undefined upper bounds
    (XE_RTP_END_VERSION_UNDEFINED) for their version ranges should always be
    considered illegal since they could potentially open unexpected security
    holes on future platforms.  Add a kunit test to scan the whitelist RTP
    table and ensure that all entries have well-defined upper bounds on IP
    version ranges.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 5fe805765b01f6e3519421039c3ade7cff1074ca drm-intel
cdf595b4577c drm/xe/tests/rtp: Add kunit test for whitelist upper bounds
-:83: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#83: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:46:
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(

total: 0 errors, 0 warnings, 1 checks, 63 lines checked


