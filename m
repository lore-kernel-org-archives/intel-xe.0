Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8F5EB362C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 20:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C3810E370;
	Mon,  2 Mar 2026 20:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zi4DYvf4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC4E10E370;
 Mon,  2 Mar 2026 20:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772482057; x=1804018057;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=mE1w5Pi4OJFtZTLw0/VcxNy9WP4AHuQLne83/Nebxpk=;
 b=Zi4DYvf4cLVYWI+vM7ReCnC29pPtY45jComNlUtzGs2B7LjXZat5abjI
 xE/LZBMhyb8n2Zwf1H0ErIO6gmWz08jzkoTWlJ63j8vjWev04h/lO277+
 6FtrLb+bQK/B2sN29j6Zyq6gGDv5dBR1FL568AgHIa7O0LiEjPs0yM4Cz
 zTJd6AhNRHHBazcDHM0PYFTbPMGtp8xplzwdLa525qXGpCNT9OdeFhS9l
 tDDhoFDyTI96feuy648fMG18tWLTfBYOwu94Y/xKU1AXAP5+6JkWYRPIb
 ZOZGssQWyditSY7v8iWiPKoMJD3ED5zeloQoqLS4p5oW5N8Xz6vXn0XiE A==;
X-CSE-ConnectionGUID: Ndu6tKZFTzKlQkX1yhceYw==
X-CSE-MsgGUID: IFgMeWOqRHmTFVEMDFGDtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73371312"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73371312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:07:37 -0800
X-CSE-ConnectionGUID: j/ihIlk8STuIT/ERH1ciYg==
X-CSE-MsgGUID: yQzH7JWsReeDIpbm7N5UJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="244756654"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:07:35 -0800
Date: Mon, 2 Mar 2026 21:07:33 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/xe/display: clean up xe_initial_plane.c includes
In-Reply-To: <637eab7df00a540df6b7ca1ca345302864b6342f.1772212579.git.jani.nikula@intel.com>
Message-ID: <ba0ec5b3-03ce-a6ff-4492-07aff9ca030c@intel.com>
References: <cover.1772212579.git.jani.nikula@intel.com>
 <637eab7df00a540df6b7ca1ca345302864b6342f.1772212579.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="1527428566-1703035154-1772476328=:1836696"
Content-ID: <085694e6-9e52-f8f9-1808-36a35aefb743@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1527428566-1703035154-1772476328=:1836696
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <543dd1b4-0366-97ea-bcee-9d943b0e1e44@intel.com>

On Fri, 27 Feb 2026, Jani Nikula wrote:
> Remove excess includes, group and sort include directives.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--1527428566-1703035154-1772476328=:1836696--
