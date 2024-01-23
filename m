Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6508C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 12:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EA610E7CC;
	Tue, 23 Jan 2024 12:34:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788E910E7CC;
 Tue, 23 Jan 2024 12:34:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Document_nested?=
 =?utf-8?q?_struct_members_according_to_guidelines?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 23 Jan 2024 12:34:11 -0000
Message-ID: <170601325149.682640.367599494062901790@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240123120840.8250-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240123120840.8250-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Document nested struct members according to guidelines
URL   : https://patchwork.freedesktop.org/series/129086/
State : success

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
commit cdeb78d40187ee67c5b3dafd10c53e7243869452
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Jan 23 13:08:40 2024 +0100

    drm/xe: Document nested struct members according to guidelines
    
    Document nested struct members with full names as described in
    Documentation/doc-guide/kernel-doc.rst.
    
    For this documentation we allow a column with of to make
    it more readable.
    
    This fixes warnings similar to:
    drivers/gpu/drm/xe/xe_lrc_types.h:45: warning: Excess struct member 'size' description in 'xe_lrc'
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 741c439503ee0986a7b7c5b590cbd9813b8841f6 drm-intel
cdeb78d40 drm/xe: Document nested struct members according to guidelines


