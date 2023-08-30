Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42519C83F14
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 09:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1AC10E4E3;
	Wed, 30 Aug 2023 09:37:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF87510E4DF;
 Wed, 30 Aug 2023 09:37:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CAC4FAADD6;
 Wed, 30 Aug 2023 09:37:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Date: Wed, 30 Aug 2023 09:37:28 -0000
Message-ID: <169338824882.15232.2128408024581751416@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230830063332.347344-1-kelbaz@habana.ai>
In-Reply-To: <20230830063332.347344-1-kelbaz@habana.ai>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_fix_error_handling_flow_when_device_probing_fails?=
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

Series: drm/xe: fix error handling flow when device probing fails
URL   : https://patchwork.freedesktop.org/series/123049/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a3456eb433379acd23e6e0f5822a67c91dca498a
Author: Koby Elbaz <kelbaz@habana.ai>
Date:   Wed Aug 30 09:33:32 2023 +0300

    drm/xe: fix error handling flow when device probing fails
    
    Upon device probe failure, rolling back the initialization
    should be done in reversed order.
    
    Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
    Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
+ /mt/dim checkpatch 7af4e65956a8d0346547567b534d49acf30085e0 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


