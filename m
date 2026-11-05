Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17D6606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 05:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762C610E933;
	Thu,  5 Nov 2026 05:11:39 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EEF10E933;
 Thu,  5 Nov 2026 05:11:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_driver_core=3A_platform?=
 =?utf-8?q?=3A_tests=3A_add_a_shared_software_node_test_case_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 05:11:38 -0000
Message-ID: <179385549803.122507.13266210412917775816@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261104202419.30180-2-stuart.summers@intel.com>
In-Reply-To: <20261104202419.30180-2-stuart.summers@intel.com>
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

Series: driver core: platform: tests: add a shared software node test case (rev2)
URL   : https://patchwork.freedesktop.org/series/177785/
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
commit ee0c4f28f3b428ceb1e7569ab283e1713e2e90b6
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Wed Nov 4 20:24:16 2026 +0000

    driver core: platform: tests: add a shared software node test case
    
    Cover the pattern used by drm/xe + i2c-designware, where a software node
    assigned as a platform device's primary firmware node is handed to a
    second device via device_set_node(), and make sure removing that second
    device leaves the owner's node intact.
    
    A potential fix for this issue in the drm/xe driver is being discussed
    in [1].
    
    The signature in this case looks like this:
    Oops: general protection fault, probably for non-canonical address
    0x6b6b6b6b6b6b6b73
    RIP: platform_device_release+0x6f/0x80
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
    Assisted-by: LLM
    
    [1]: https://patchwork.freedesktop.org/series/175858/
+ /mt/dim checkpatch 39c3efaee12b7c3e5e66247abea832c1986f15e3 drm-intel
ee0c4f28f3b4 driver core: platform: tests: add a shared software node test case
-:21: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#21: 
Assisted-by: LLM

-:21: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#21: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 66 lines checked


