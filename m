Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFE5C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 23:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CE510E381;
	Thu,  9 Nov 2023 23:01:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A32E10E391;
 Thu,  9 Nov 2023 23:00:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 33662A7E03;
 Thu,  9 Nov 2023 23:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Date: Thu, 09 Nov 2023 23:00:14 -0000
Message-ID: <169957081420.26590.16413637829224936187@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231109003339.399480-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20231109003339.399480-1-vinay.belgaumkar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Raise_GT_frequency_before_GuC/HuC_load_=28rev2=29?=
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

Series: drm/xe: Raise GT frequency before GuC/HuC load (rev2)
URL   : https://patchwork.freedesktop.org/series/126162/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4b0f0e12bbe73db24b4eb0f7381f5f61bdaf2789
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Wed Nov 8 16:33:39 2023 -0800

    drm/xe: Raise GT frequency before GuC/HuC load
    
    Starting GT freq is usually RPn. Raising freq to RP0 will
    help speed up GuC load times. As an example, this data was
    collected on DG2-
    
    GuC Load time @RPn ~ 41 ms
    GuC Load time @RP0 ~ 11 ms
    
    v2: Raise GT freq before hwconfig init. This will speed up
    both HuC and GuC loads. Address review comments (Rodrigo).
    Also add a small usleep after requesting frequency which gives
    pcode some time to react.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch b11007e91f8785a96903d9d3c3d1efbe7e969eaf drm-intel
4b0f0e12b drm/xe: Raise GT frequency before GuC/HuC load
-:93: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#93: FILE: drivers/gpu/drm/xe/xe_guc_pc.c:278:
+	uint32_t rpnswreq;

total: 0 errors, 0 warnings, 1 checks, 105 lines checked


