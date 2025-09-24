Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43794CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 16:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E0110E140;
	Wed, 24 Sep 2025 16:12:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2358D10E140;
 Wed, 24 Sep 2025 16:12:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_drm/xe/configfs=3A_Fix_engine_class_parsing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Sep 2025 16:12:50 -0000
Message-ID: <175873037011.362669.16675784824198399130@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250924152709.659483-3-lucas.demarchi@intel.com>
In-Reply-To: <20250924152709.659483-3-lucas.demarchi@intel.com>
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

Series: series starting with [v2,1/2] drm/xe/configfs: Fix engine class parsing
URL   : https://patchwork.freedesktop.org/series/154981/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2b319283facab584148d079de4bd2dc524b13203
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Sep 24 08:27:11 2025 -0700

    drm/xe/configfs: Improve doc for ctx_restore* attributes
    
    Spell out the syntax instead of only using examples. Particularly
    important the <engine-class> part since that's different than
    engines_allowed and may confuse users. The same batch buffer is used for
    all engines of a certain class.
    
    Cc: Raag Jadav <raag.jadav@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch a4d9163251f4832a7d34d4b59449f9a68b9b7adf drm-intel
f6154b1285b1 drm/xe/configfs: Fix engine class parsing
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#16: 
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>


total: 0 errors, 1 warnings, 0 checks, 10 lines checked
2b319283faca drm/xe/configfs: Improve doc for ctx_restore* attributes


