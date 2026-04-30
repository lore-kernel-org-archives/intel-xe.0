Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BF0CD13D2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 21:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7457C10F46F;
	Thu, 30 Apr 2026 21:02:23 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A45110F46F;
 Thu, 30 Apr 2026 21:02:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/rtp=3A_Miscellaneo?=
 =?utf-8?q?us_improvements_to_rule_matching_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Apr 2026 21:02:22 -0000
Message-ID: <177758294262.29832.5927820976259752383@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
In-Reply-To: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
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

Series: drm/xe/rtp: Miscellaneous improvements to rule matching (rev2)
URL   : https://patchwork.freedesktop.org/series/160111/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 13cc1b21faaa3125e44ce269a527ee8bbe0857c5
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Thu Apr 30 17:20:08 2026 -0300

    drm/xe/rtp: Implement a structured parser for rule matching
    
    The current unwritten grammar for RTP rules is as follows:
    
              rules = disjunction;
        disjunction = conjunction { "OR" conjunction };
        conjunction = single_rule { single_rule }
                                  /* AND operator is implicit */;
        single_rule = ? GRAPHICS_VERSION(...), MEDIA_VERSION(...),
                         FUNC(...), etc ?;
    
    While rule_matches() currently works for the grammar above, it doesn't
    easily resemble it.  Let's replace it with an implementation that is
    structured in a way to resemble the grammar.
    
    Such a new implementation, although a bit more verbose, is arguably
    easier to reason about and to adapt to any extension we do to the
    grammer in the future.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 6472756e8384e3945f12b6726dd9dc1ac12f3bb4 drm-intel
cb48f6472499 drm/xe/rtp: Write kunit test cases specific for rule matching
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 375 lines checked
4ee58c896b2c drm/xe/rtp: Drop rule matching cases from rtp_to_sr_cases and rtp_cases
92c7ed729a91 drm/xe/rtp: Don't short-circuit to false in or-yes case
98e7bebf82e4 drm/xe/rtp: Do not break parsing when missing context
d0834eae65c7 drm/xe/rtp: Extract rule_match_item()
65a8e6a31912 drm/xe/rtp: Fully parse the ruleset
13cc1b21faaa drm/xe/rtp: Implement a structured parser for rule matching


