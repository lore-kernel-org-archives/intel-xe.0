Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573D7CD6E7B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 10:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132DE11A747;
	Fri,  5 Jun 2026 10:49:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1878711A747;
 Fri,  5 Jun 2026 10:49:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/rtp=3A_Fix_build_e?=
 =?utf-8?q?rror_with_clang_=3C_21_and_non-const_initializers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jun 2026 10:49:25 -0000
Message-ID: <178065656509.47432.12160963297460165612@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260605093305.110598-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260605093305.110598-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe/rtp: Fix build error with clang < 21 and non-const initializers
URL   : https://patchwork.freedesktop.org/series/167940/
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
commit a92edbd3bb87b5fad6771a66cdbcb98e4c1fc4cf
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Jun 5 11:33:05 2026 +0200

    drm/xe/rtp: Fix build error with clang < 21 and non-const initializers
    
    Clang < 21 treats const-qualified compound literals at function scope as
    having static storage duration, which requires all initializer elements
    to be compile-time constants.  When xe_hw_engine.c initializes a local
    struct xe_rtp_table_sr using XE_RTP_TABLE_SR(), the compound literals in
    XE_RTP_TABLE_SR end up containing runtime values (e.g. blit_cctl_val
    derived from gt->mocs.uc_index), triggering:
    
      xe_hw_engine.c:361: error: initializer element is not a compile-time constant
      xe_hw_engine.c:416: error: initializer element is not a compile-time constant
    
    ARRAY_SIZE() cannot be used as a replacement because it expands through
    __must_be_array() -> __BUILD_BUG_ON_ZERO_MSG() -> _Static_assert inside
    sizeof(struct{}), which clang < 21 also rejects in the same context.
    
    Replace ARRAY_SIZE() with an open-coded sizeof(arr)/sizeof(elem) in
    XE_RTP_TABLE_SR and XE_RTP_TABLE to avoid both issues.
    
    Fixes: 5ff004fdc737 ("drm/xe/rtp: Add struct types for RTP tables")
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Gustavo Sousa <gustavo.sousa@intel.com>
    Cc: Violet Monti <violet.monti@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Cc: intel-xe@lists.freedesktop.org
    Reported-by: Mark Brown <broonie@kernel.org>
    Closes: https://lore.kernel.org/intel-xe/bfb0dee8-b243-47ba-a89d-71472b0d51c5@sirena.org.uk/
    Assisted-by: GitHub_Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 6be5b7e4d84efd8d8d3fbf91fcacbcb6a0df055c drm-intel
a92edbd3bb87 drm/xe/rtp: Fix build error with clang < 21 and non-const initializers
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
  xe_hw_engine.c:361: error: initializer element is not a compile-time constant

total: 0 errors, 1 warnings, 0 checks, 24 lines checked


