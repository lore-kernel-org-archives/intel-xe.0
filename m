Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ADBCD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 08:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2691010F501;
	Fri, 22 May 2026 08:51:58 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7160F10F4FD;
 Fri, 22 May 2026 08:51:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/rtp=3A_Miscellaneo?=
 =?utf-8?q?us_improvements_to_rule_matching_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 May 2026 08:51:57 -0000
Message-ID: <177943991745.99438.11333683756986698758@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260522-rtp-rule-parser-v3-0-0c51039899f4@intel.com>
In-Reply-To: <20260522-rtp-rule-parser-v3-0-0c51039899f4@intel.com>
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

Series: drm/xe/rtp: Miscellaneous improvements to rule matching (rev3)
URL   : https://patchwork.freedesktop.org/series/160111/
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
commit 3ff4d38af9fcc3b95f655d1f0d4c50cf8c007c96
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri May 22 05:45:22 2026 -0300

    drm/xe/rtp: Implement a structured parser for rule matching
    
    The current unwritten grammar for RTP rules is as follows:
    
              rules = disjunction;
        disjunction = conjunction, { "OR", conjunction };
        conjunction = single_rule, { single_rule };
                               (* the AND operator is implicit *)
        single_rule = ? GRAPHICS_VERSION(...), MEDIA_VERSION(...),
                        FUNC(...), etc ?
    
    While rule_matches() currently works for the grammar above, it doesn't
    easily resemble it.  Let's replace it with an implementation that is
    structured in a way to resemble the grammar.
    
    Such a new implementation, although a bit more verbose, is arguably
    easier to reason about and to adapt to any extension we do to the
    grammer in the future.
    
    Also take this opportunity to update the kernel-doc for XE_RTP_RULES()
    to include the grammar, so that it is not unwritten anymore.
    
    v2:
      - Include the grammar in the code documentation. (Matt)
    
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Violet Monti <violet.monti@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 7e25390024f8a4a9fdd6ec50f000ee25c006c02f drm-intel
27e654b42971 drm/xe/rtp: Write kunit test cases specific for rule matching
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 375 lines checked
2dc606cc2bbe drm/xe/rtp: Drop rule matching cases from rtp_to_sr_cases and rtp_cases
46f03fbfccb0 drm/xe/rtp: Don't short-circuit to false in or-yes case
f1dbb612121a drm/xe/rtp: Do not break parsing when missing context
c475c70d868f drm/xe/rtp: Extract rule_match_item()
d201e4a2dc16 drm/xe/rtp: Fully parse the ruleset
3ff4d38af9fc drm/xe/rtp: Implement a structured parser for rule matching


