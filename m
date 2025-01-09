Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5130E7719A
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 23:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9132710E388;
	Thu,  9 Jan 2025 23:38:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0037A10E3A9;
 Thu,  9 Jan 2025 23:38:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915/guc/slpc=3A_Allow_GuC_SLPC_default_strategies_on_M?=
 =?utf-8?q?TL+?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 23:38:42 -0000
Message-ID: <173646592200.1742394.4551642307792877782@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109225755.992867-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250109225755.992867-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/2] drm/i915/guc/slpc: Allow GuC SLPC default strategies on MTL+
URL   : https://patchwork.freedesktop.org/series/143358/
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
commit fb7d3fffeb9ed731f4381f0543d39513691f102c
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Jan 9 17:57:55 2025 -0500

    drm/i915/guc/slpc: Print more SLPC debug status information
    
    Let's peek on the Balancer and DCC status, now that we
    are using the default strategies.
    
    v2: fix identation
    v3: fix typo (Vinay)
    
    Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 2184d26341419e5318ba5284fe00646d2d1d4d27 drm-intel
ac9e9d28f820 drm/i915/guc/slpc: Allow GuC SLPC default strategies on MTL+
fb7d3fffeb9e drm/i915/guc/slpc: Print more SLPC debug status information


