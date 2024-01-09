Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046DFC47077
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 23:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DF610E541;
	Tue,  9 Jan 2024 23:23:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A960F10E540;
 Tue,  9 Jan 2024 23:23:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/guc=3A_Use_proper_definitions_while_processing_G2H_e?=
 =?utf-8?q?vents?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Tue, 09 Jan 2024 23:23:34 -0000
Message-ID: <170484261469.216241.4947118554821236335@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240109230015.365-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240109230015.365-1-michal.wajdeczko@intel.com>
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

Series: series starting with [1/2] drm/xe/guc: Use proper definitions while processing G2H events
URL   : https://patchwork.freedesktop.org/series/128396/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
414601bf14e77eeb048ecf6d1c25190801399524
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4adc40d3439dd17cdf04724b24bb296a03185e25
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jan 10 00:00:15 2024 +0100

    drm/xe/guc: Fix arguments passed to relay G2H handlers
    
    By default CT code was passing just payload of th G2H event/request
    message, while Relay code expects full G2H message including HXG
    header which contains DATA0 field. Fix that.
    
    Fixes: 152577060697 ("drm/xe/guc: Start handling GuC Relay event messages")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch d6ef9c52d8d2ae4c85bc598b74a259db081fff26 drm-intel
9ec3b3ec6 drm/xe/guc: Use proper definitions while processing G2H events
4adc40d34 drm/xe/guc: Fix arguments passed to relay G2H handlers
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '152577060697', maybe rebased or not pulled?
#10: 
Fixes: 152577060697 ("drm/xe/guc: Start handling GuC Relay event messages")

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


