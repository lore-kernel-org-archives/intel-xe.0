Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D997EC54FCC
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 08:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D8810E353;
	Fri, 20 Feb 2026 08:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUt/tXIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E602510E1ED;
 Fri, 20 Feb 2026 08:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771574788; x=1803110788;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=agtpy0zBRQH19MbljJyff70mXp7cKE3leYmZlja+h0E=;
 b=DUt/tXIMnXzpngRoDSfjnqDCN994S0vvmWekqwCIo/im1//BQcm0yNAG
 iByIFShuhuevw7jysMnd+T9uhTsSyu3x057WrcrC1l5EWca4BvDlMqPd2
 5Zi2QcwuLUt6YQ5KYzxipT3jpFRroiDW+Rcz+BmZMbbi6MoGxkvUoq9wb
 81SHU3DphgTD3rOClviflAZjXmVMcj1n4uQA7Pk0VwMY4vFQCuLAC/wcn
 xH7cLE5/d1PrMNeHvenDZN6LW92MDCYGxxv3vQLQif0zFIWbupNTT622n
 gl3u2HOgptppU289r9oei1i3wo6sfUKk8tgfLKYDaj6OoxZsSualpw9eP g==;
X-CSE-ConnectionGUID: aGiJnbv9Rli4QeorwAAniw==
X-CSE-MsgGUID: t9ZuYculQ766118U/oJeog==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="84028800"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="84028800"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 00:06:27 -0800
X-CSE-ConnectionGUID: YaRkZ0PAT2yVpRmxppKDTQ==
X-CSE-MsgGUID: +ZKggmGaQtKVVG2ZIOCR8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="212933048"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 00:06:26 -0800
Date: Fri, 20 Feb 2026 09:06:24 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: =?ISO-8859-15?Q?Jouni_H=F6gander?= <jouni.hogander@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Animesh Manna <animesh.manna@intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/alpm: ALPM disable fixes
In-Reply-To: <20260212062731.397801-1-jouni.hogander@intel.com>
Message-ID: <ad4e98ae-3a64-f570-fb1a-77355ecc431a@intel.com>
References: <20260212062731.397801-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="1527428566-21081126-1771574787=:851205"
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

--1527428566-21081126-1771574787=:851205
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 12 Feb 2026, Jouni Högander wrote:
> PORT_ALPM_CTL is supposed to be written only before link training. Remove
> writing it from ALPM disable.
>
> Also clearing ALPM_CTL_ALPM_AUX_LESS_ENABLE and is not about disabling ALPM
> but switching to AUX-Wake ALPM. Stop touching this bit on ALPM disable.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7153
> Fixes: 1ccbf135862b ("drm/i915/psr: Enable ALPM on source side for eDP Panel replay")
> Cc: Animesh Manna <animesh.manna@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.10+
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>

BR,
Michał
--1527428566-21081126-1771574787=:851205--
