Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23721D3CC82
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 22:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D636610E0F6;
	Wed, 14 Jan 2026 22:56:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2428110E0F6;
 Wed, 14 Jan 2026 22:56:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/rtp=3A_Miscellaneo?=
 =?utf-8?q?us_improvements_to_rule_matching?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Jan 2026 22:56:00 -0000
Message-ID: <176843136014.155664.6766766059541150061@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
In-Reply-To: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
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

Series: drm/xe/rtp: Miscellaneous improvements to rule matching
URL   : https://patchwork.freedesktop.org/series/160111/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 26f219749411e3887b93861ab0bb226f48e812a6
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Wed Jan 14 19:49:56 2026 -0300

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
+ /mt/dim checkpatch 733664f1edf3c01cc68e6dd0bbdb135158a98a1d drm-intel
1c254a2d3cae drm/xe/rtp: Write kunit test cases specific for rule matching
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 368 lines checked
d335263a721d drm/xe/rtp: Drop rule matching cases from rtp_to_sr_cases and rtp_cases
4bda76858802 drm/xe/rtp: Do not break parsing when missing context
59abe5f04f4a drm/xe/rtp: Extract rule_match_item()
4a3ffdb8306b drm/xe/rtp: Fully parse the ruleset
26f219749411 drm/xe/rtp: Implement a structured parser for rule matching


