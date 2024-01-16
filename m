Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC21C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 22:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C90310E0C6;
	Tue, 16 Jan 2024 22:08:14 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1533D10E0C6;
 Tue, 16 Jan 2024 22:08:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/doc/rfc=3A_Removing_m?=
 =?utf-8?q?issing_reference_to_xe=2Erst?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 16 Jan 2024 22:08:13 -0000
Message-ID: <170544289308.519235.14585933639379299286@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116220331.145607-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240116220331.145607-1-rodrigo.vivi@intel.com>
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

Series: drm/doc/rfc: Removing missing reference to xe.rst
URL   : https://patchwork.freedesktop.org/series/128850/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a4bd0593a03c88d7921059fa5d8f754088b29154
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Jan 16 17:03:31 2024 -0500

    drm/doc/rfc: Removing missing reference to xe.rst
    
    The file has already been deleted as the tasks were completed.
    However the index reference was missed behind.
    
    Fixes: d11dc7aa98e5 ("drm/doc/rfc: Remove Xe's pre-merge plan")
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch b6b50ad4c8d61b14de0ffcf0d52ae2adc0ef39cf drm-intel
a4bd0593a drm/doc/rfc: Removing missing reference to xe.rst
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'd11dc7aa98e5', maybe rebased or not pulled?
#9: 
Fixes: d11dc7aa98e5 ("drm/doc/rfc: Remove Xe's pre-merge plan")

total: 0 errors, 1 warnings, 0 checks, 3 lines checked


