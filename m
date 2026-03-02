Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C497EB3632
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 20:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC1610E5AE;
	Mon,  2 Mar 2026 20:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHgJMrAX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0A510E370;
 Mon,  2 Mar 2026 20:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772482139; x=1804018139;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=6hXPHfI5UC9lcjJIOSuidtiO2TZOECAwl7dlEutGNcY=;
 b=IHgJMrAXixn0iXli5PhVTyUXdpX3UdRbn6Pm6KUPcSrUhbBum9ZBOYg0
 9gLiHYq23mZp5v2ZnRLZuj6990/OSqdsaAc85RrhpCJ+LbV97Zl0zp1ve
 JJtMGK/Hw5pBdNWdZsNs+xSThFK5rps1J4jg88NMApdRJxMBJdesTLh9d
 fX9bNV2bhDwbU3eFhixsLja9tvvnBte7mDAWDRNPuvIP2WbCL373m8H++
 WgipRoVFv3wTuq8VI0O0GE54QJ9U1UqAkgWJYO7PQbo8Z14IITyvYVwjZ
 RtowDhymTJbPjefG4GRShTFSUQu3dBo2oRYuKVIfBLmQGTfww1izNTNO9 A==;
X-CSE-ConnectionGUID: ZPSw/YAHTf+Yqb/6zxoJ+w==
X-CSE-MsgGUID: cTI7WpU9QwaELn5QnZef7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="90896943"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="90896943"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:08:59 -0800
X-CSE-ConnectionGUID: tjLYl5kHQ36A2k3mBKQfLg==
X-CSE-MsgGUID: hCJ6bzHLQUaw8Lg3JpnhDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="214935653"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:08:57 -0800
Date: Mon, 2 Mar 2026 21:08:55 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 4/8] drm/i915/perf: prefer REG_MASKED_FIELD_ENABLE() and
 REG_MASKED_FIELD_DISABLE()
In-Reply-To: <93caec439ad10ef8b163162c52407abf36df69f5.1772042022.git.jani.nikula@intel.com>
Message-ID: <fdec40df-6021-8b2e-bf87-5cfedbba9c27@intel.com>
References: <cover.1772042022.git.jani.nikula@intel.com>
 <93caec439ad10ef8b163162c52407abf36df69f5.1772042022.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="1527428566-460606139-1772480614=:1836696"
Content-ID: <dee300f2-7565-a0f4-f563-58316d33c4aa@intel.com>
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

--1527428566-460606139-1772480614=:1836696
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <171aa852-5334-827a-6db3-c92411d8e2ef@intel.com>

On Wed, 25 Feb 2026, Jani Nikula wrote:
> Using REG_MASKED_FIELD_ENABLE() and REG_MASKED_FIELD_DISABLE() is more
> obvious to the reader than having the ternary expression inside
> REG_MASKED_FIELD().
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--1527428566-460606139-1772480614=:1836696--
