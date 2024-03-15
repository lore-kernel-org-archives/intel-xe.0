Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D43C54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 14:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D2311226B;
	Fri, 15 Mar 2024 14:07:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C4D11226B;
 Fri, 15 Mar 2024 14:07:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/6=5D_drm/xe=3A_Introduce_a_simple_busted_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Mar 2024 14:07:01 -0000
Message-ID: <171051162100.795787.13840092384038150725@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240315140108.217862-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/6] drm/xe: Introduce a simple busted state
URL   : https://patchwork.freedesktop.org/series/131188/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eb9bcdb9cc0302b0fdf1802e0cb32e2b46dd3f8f
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Mar 15 10:01:08 2024 -0400

    drm/xe: Introduce the busted_mode debugfs
    
    So, the busted mode can be selected at runtime with the device
    granularity, rather then a module policy.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 475ba6bf5ef939a53adf5fc2b93c21713c1735fd drm-intel
c7f78737bebb drm/xe: Introduce a simple busted state
84c3edfe1782 drm/xe: declare busted upon GuC load failure
0c07e21bc23c drm/xe: Add extra busted protection for the no GuC reset
29529ea87560 drm/xe: Force busted state and block GT reset upon any GPU hang
892d0ea21ede drm/xe: Introduce the busted_mode debugfs
eb9bcdb9cc03 drm/xe: Introduce the busted_mode debugfs


