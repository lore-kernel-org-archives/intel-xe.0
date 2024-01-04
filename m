Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E710C47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 09:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018A710E475;
	Thu,  4 Jan 2024 09:35:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CC510E483;
 Thu,  4 Jan 2024 09:35:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Check_skip=5Fgu?=
 =?utf-8?q?c=5Fpc_before_setting_SLPC_flag?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Date: Thu, 04 Jan 2024 09:35:10 -0000
Message-ID: <170436091088.1841.10055508034951997959@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231222210109.533215-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20231222210109.533215-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: Check skip_guc_pc before setting SLPC flag
URL   : https://patchwork.freedesktop.org/series/128001/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9afc9a50b6c10506e8d064f504e04955714fe29a
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Fri Dec 22 13:01:09 2023 -0800

    drm/xe: Check skip_guc_pc before setting SLPC flag
    
    Don't set SLPC GuC feature ctl flag if skip_guc_pc is true.
    
    Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
9afc9a50b drm/xe: Check skip_guc_pc before setting SLPC flag
-:8: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '975e4a3795d4', maybe rebased or not pulled?
#8: 
Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")

total: 0 errors, 1 warnings, 0 checks, 13 lines checked


