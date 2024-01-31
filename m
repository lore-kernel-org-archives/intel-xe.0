Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E140DC46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 02:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A179E113852;
	Wed, 31 Jan 2024 02:07:02 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5B1113851;
 Wed, 31 Jan 2024 02:07:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_ccs_compressed_fra?=
 =?utf-8?q?mebuffers_on_Xe2_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Wed, 31 Jan 2024 02:07:01 -0000
Message-ID: <170666682124.860255.5482355838005005575@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130193652.374270-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240130193652.374270-1-juhapekka.heikkila@gmail.com>
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

Series: Enable ccs compressed framebuffers on Xe2 (rev5)
URL   : https://patchwork.freedesktop.org/series/128946/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d9750980f39a971afd1ba981d4544b53d871fd6f
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Tue Jan 30 21:36:52 2024 +0200

    drm/i915/display: On Xe2 always enable decompression with tile4
    
    With Xe2 always treat tile4 as if it was using flat ccs.
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Reviewed-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 3d244fce99b65e012c4409d8a22bb9168c41f101 drm-intel
65e202e43 drm/xe/pat: annotate pat index table with compression info
444ed558f drm/xe: add bind time pat index to xe_bo structure
bc843dc58 drm/xe/xe2: Limit ccs framebuffers to tile4 only
d9750980f drm/i915/display: On Xe2 always enable decompression with tile4


