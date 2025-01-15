Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321E5C02183
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 22:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED92610E477;
	Wed, 15 Jan 2025 22:49:30 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C064C10E477;
 Wed, 15 Jan 2025 22:49:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Set_stream-?=
 =?utf-8?q?=3Epollin_in_xe=5Foa=5Fbuffer=5Fcheck=5Funlocked?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jan 2025 22:49:29 -0000
Message-ID: <173698136978.4085111.10071204930278543796@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250115222029.3002103-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250115222029.3002103-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlocked
URL   : https://patchwork.freedesktop.org/series/143575/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 22e49c582a1e2eb7d0bb2c38c7b3af272af50350
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Wed Jan 15 14:20:29 2025 -0800

    drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlocked
    
    We rely on stream->pollin to decide whether or not to block during
    poll/read calls. However, currently there are blocking read code paths
    which don't even set stream->pollin. The best place to consistently set
    stream->pollin for all code paths is therefore to set it in
    xe_oa_buffer_check_unlocked.
    
    Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 83dd30e2ec24ab8307774b149fcd998a4191eec2 drm-intel
22e49c582a1e drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlocked


