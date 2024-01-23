Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7079DC47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 22:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A2610E476;
	Tue, 23 Jan 2024 22:09:20 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5413710E476;
 Tue, 23 Jan 2024 22:09:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Use_LRC_prefix_?=
 =?utf-8?q?rather_than_CTX_prefix_in_lrc_desc_defines_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 23 Jan 2024 22:09:19 -0000
Message-ID: <170604775934.685200.2060828314759573063@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240123212638.1605626-1-matthew.brost@intel.com>
In-Reply-To: <20240123212638.1605626-1-matthew.brost@intel.com>
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

Series: drm/xe: Use LRC prefix rather than CTX prefix in lrc desc defines (rev2)
URL   : https://patchwork.freedesktop.org/series/129098/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
b2ca823f819193c33ab811dfac08c614138d6d46
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 15e3ceffdc044e3c524f2f518047609634106590
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jan 23 13:26:38 2024 -0800

    drm/xe: Use LRC prefix rather than CTX prefix in lrc desc defines
    
    The sparc build fails [1] due to CTX_VALID being redefined. Fix this by
    using a better naming convention of LRC_VALID as this define is used in
    setting bits in the lrc descriptor. To be uniform, change other define
    with LRC prefix too.
    
    [1] http://kisskb.ellerman.id.au/kisskb/buildresult/15112267/
    
    v2:
    - s/LEGACY_64B_CONTEXT/LRC_LEGACY_64B_CONTEXT (Lucas)
    
    Fixes: 0bc519d20ffa ("drm/xe: Remove GEN[0-9]*_ prefixes")
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c drm-intel
15e3ceffd drm/xe: Use LRC prefix rather than CTX prefix in lrc desc defines
-:20: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '0bc519d20ffa', maybe rebased or not pulled?
#20: 
Fixes: 0bc519d20ffa ("drm/xe: Remove GEN[0-9]*_ prefixes")

total: 0 errors, 1 warnings, 0 checks, 32 lines checked


