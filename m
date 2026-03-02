Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22443EB3624
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 20:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F3610E5B4;
	Mon,  2 Mar 2026 20:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYrJ2i+h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7696C10E5B1;
 Mon,  2 Mar 2026 20:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772482286; x=1804018286;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=I3AdwyhKSGoW5lQFv4faV1IAcqFSg5LYQQcRywJysnc=;
 b=GYrJ2i+h0jTzggYHLwkfODh9NSENpowrVwYbRJXENJQkISYEmCNhO78z
 GnBVJln/WT/0+aEsS1NHZ9/PMcwJNDEM5rBG+wiSpJxfJ0JfobT5ue3sn
 HQV5Wpud+lpeUmKq5/TXBKEjTlnFPQkOQQHsPk77eto7XbCGwDFOaoD4N
 xxhYoH88lLqfZezE1HmQ4E0SHoDdZZLUjaPRCgFeTHv34bHvn0rWAGK+t
 /PFM7g90/07AowHeIen1fjvzblqGz7IA8tWTO3A4AV8KEbAsFBXPTxUBZ
 Dcn+izvdCBGTja0tHO6YwKsu6MtmHr8pBeadhifTZQTYPRMIwjflzihBe g==;
X-CSE-ConnectionGUID: M/b0jBuYTxS8A2YvM+RZ3Q==
X-CSE-MsgGUID: qS2K+MYeStCdrHeWJqLbqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="90897235"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="90897235"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:11:25 -0800
X-CSE-ConnectionGUID: YmYsZ/kvSEWnRDXdmB9E5w==
X-CSE-MsgGUID: v3Oki26iRdqnqSd/ME6G/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="214936064"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:11:24 -0800
Date: Mon, 2 Mar 2026 21:11:22 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 6/8] drm/intel: add reg_bits.h for the various register
 content helpers
In-Reply-To: <e641fe6dcecef92367471f3e0d150f9f47ae4edc.1772042022.git.jani.nikula@intel.com>
Message-ID: <6ff978f1-ac8d-a699-66c8-8b49d72739c7@intel.com>
References: <cover.1772042022.git.jani.nikula@intel.com>
 <e641fe6dcecef92367471f3e0d150f9f47ae4edc.1772042022.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="1527428566-759392480-1772481884=:1837396"
Content-ID: <8cd73f65-7259-acbf-3d18-1ef9656d7095@intel.com>
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

--1527428566-759392480-1772481884=:1837396
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <9d180b50-e5be-e72e-dfd1-2632b8e5d244@intel.com>

On Wed, 25 Feb 2026, Jani Nikula wrote:
> Add a shared header that's used by i915, xe, and i915 display.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--1527428566-759392480-1772481884=:1837396--
