Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A68606A320
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 15:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEE510E272;
	Sun, 22 Nov 2026 15:38:46 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2040710E2E0;
 Sun, 22 Nov 2026 15:38:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Drop_repeated_SIGID_loggi?=
 =?utf-8?q?ng?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 22 Nov 2026 15:38:46 -0000
Message-ID: <179536192612.66247.11772254395658152732@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261122153015.877434-4-riana.tauro@intel.com>
In-Reply-To: <20261122153015.877434-4-riana.tauro@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: Drop repeated SIGID logging
URL   : https://patchwork.freedesktop.org/series/179303/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit da71c1d4b8d4c0f7961c2472976922e34252fa42
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Sun Nov 22 21:00:18 2026 +0530

    drm/xe/ras: Drop SIGID logging for sysctrl errors
    
    The sysctrl mailbox layer already logs the failure with its group and
    command IDs via SIGID. Drop SIGID logging and replace with plain xe_err logs
    to avoid multiple CPERs.
    
    Fixes: 6d8ad0217f9d ("drm/xe/xe_ras: Add support to query page offline queue and list")
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 579369fbe7227f6b00acc883ac90606a5266932a drm-intel
9b73deceb610 drm/xe/ras: Drop SIGID logging in page offline flow
da71c1d4b8d4 drm/xe/ras: Drop SIGID logging for sysctrl errors
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
command IDs via SIGID. Drop SIGID logging and replace with plain xe_err logs

total: 0 errors, 1 warnings, 0 checks, 57 lines checked


