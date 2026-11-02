Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E719C606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 18:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEC510F131;
	Mon,  2 Nov 2026 18:26:17 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E52910F131;
 Mon,  2 Nov 2026 18:26:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/1=5D_drm/xe=3A_Add_support_for_Wa=5F14028250015?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 18:26:17 -0000
Message-ID: <179364397718.106081.16572624568508052068@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102180516.1551869-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20261102180516.1551869-2-alan.previn.teres.alexis@intel.com>
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

Series: series starting with [1/1] drm/xe: Add support for Wa_14028250015
URL   : https://patchwork.freedesktop.org/series/177497/
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
commit 3e3d9f9dbb351cfb63b19cd1f2683481d463c4fc
Author: Alan Previn <alan.previn.teres.alexis@intel.com>
Date:   Mon Nov 2 10:05:16 2026 -0800

    drm/xe: Add support for Wa_14028250015
    
    The WA is implemented by the GuC, so we just need to enable it via the
    dedicated KLV. It makes the GuC complete page reclaim requests that
    end in an error, instead of leaving them pending. It is only needed
    when the page reclaim HW assist is in use. This WA only applies to
    graphics version 3510.
    
    v2: Update "Wa" tag to align with others. Don't gate against value of
        has_page_reclaim_hw_assist. Change the #define name to match GuC
        specs. (Gustavo).
    
    Assisted-by: LLM
    Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
+ /mt/dim checkpatch 2cd78713d917a02987f21b437561a5e1e13ddda2 drm-intel
3e3d9f9dbb35 drm/xe: Add support for Wa_14028250015
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#16: 
Assisted-by: LLM

-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#16: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 22 lines checked


