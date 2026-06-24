Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3374CDB47C
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 10:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1DB10EE5D;
	Wed, 24 Jun 2026 10:02:35 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9179810EE64;
 Wed, 24 Jun 2026 10:02:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe/pf=3A_Do_not_return_an_error_for_unrecognized_VF_eve?=
 =?utf-8?q?nts?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jun 2026 10:02:34 -0000
Message-ID: <178229535458.110632.15769334517364948862@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260624095634.1250956-1-michal.winiarski@intel.com>
In-Reply-To: <20260624095634.1250956-1-michal.winiarski@intel.com>
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

Series: series starting with [1/3] drm/xe/pf: Do not return an error for unrecognized VF events
URL   : https://patchwork.freedesktop.org/series/169091/
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
commit 7aad9b8d4ee7dbb17d44efd1b1aebfb198cab97a
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Wed Jun 24 11:56:34 2026 +0200

    drm/xe/pf: Add the definition of VF resfix abort event
    
    The VF RESFIX_ABORT event is similar to FIXUP_DONE event, in that
    there's no handling required from PF perspective.
    Add the definition to avoid the "unrecognized event" message.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch b2817f6a1517bc9ecdef5229b84e8a44d983de82 drm-intel
577b40dfbdb3 drm/xe/pf: Do not return an error for unrecognized VF events
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
b101faf39066 drm/xe/pf: Add support for VF Pause abort event
7aad9b8d4ee7 drm/xe/pf: Add the definition of VF resfix abort event


