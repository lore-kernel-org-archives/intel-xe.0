Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFB0C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 12:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A0210E3AF;
	Mon, 29 Jul 2024 12:20:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D048D10E3AD;
 Mon, 29 Jul 2024 12:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/uapi=3A_restructur?=
 =?utf-8?q?e_query_config_types_in_an_enum_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ohad Sharabi" <osharabi@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jul 2024 12:20:14 -0000
Message-ID: <172225561484.422416.15281873452256850704@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240729121227.446958-1-osharabi@habana.ai>
In-Reply-To: <20240729121227.446958-1-osharabi@habana.ai>
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

Series: drm/xe/uapi: restructure query config types in an enum (rev2)
URL   : https://patchwork.freedesktop.org/series/136611/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 47f5d5c91f4a781ebda76a64f72df7815f507a33
Author: Ohad Sharabi <osharabi@habana.ai>
Date:   Mon Jul 29 15:12:27 2024 +0300

    drm/xe/uapi: restructure query config types in an enum
    
    The config query has entries per config type.
    
    In query_config(), an array is allocated using the last element of
    the query config to dictate the array length.
    
    Instead, a more robust approach would be to use the standard "number of
    elements" last element of an enum such that one wouldn't need to modify
    the ioctl each time another entry is added.
    
    Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
+ /mt/dim checkpatch 6f226dd91cbd83b14b375dac4246f617f0b98288 drm-intel
47f5d5c91f4a drm/xe/uapi: restructure query config types in an enum


