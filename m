Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B829CD1D887
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 16:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8514610E5B7;
	Tue, 15 Oct 2024 16:24:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B4210E5B7;
 Tue, 15 Oct 2024 16:24:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe3lpg=3A_Extend_W?=
 =?utf-8?q?a=5F18034896535_to_Xe3=5FLPG=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Oct 2024 16:24:42 -0000
Message-ID: <172900948242.1269830.5935686875581518312@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241015161938.845996-1-shekhar.chauhan@intel.com>
In-Reply-To: <20241015161938.845996-1-shekhar.chauhan@intel.com>
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

Series: drm/xe/xe3lpg: Extend Wa_18034896535 to Xe3_LPG.
URL   : https://patchwork.freedesktop.org/series/140010/
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
commit fb2cbc035061b5c384fc04ccd8cf1613367d223f
Author: Shekhar Chauhan <shekhar.chauhan@intel.com>
Date:   Tue Oct 15 21:49:38 2024 +0530

    drm/xe/xe3lpg: Extend Wa_18034896535 to Xe3_LPG.
    
    Extend Wa_18034896535 to Xe3_LPG (IP 30.00), steppings A0 to B0.
    
    BSpec: 56852
    Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
+ /mt/dim checkpatch 01c7b2c084e5c84313f382734c10945b9aa49823 drm-intel
fb2cbc035061 drm/xe/xe3lpg: Extend Wa_18034896535 to Xe3_LPG.


