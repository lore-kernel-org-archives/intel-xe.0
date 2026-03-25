Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27897109C035
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 15:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D466C10E7BF;
	Wed, 25 Mar 2026 15:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQBE7GOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C8B10E774;
 Wed, 25 Mar 2026 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774453588; x=1805989588;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=WBB65l9OBFw+9pnYayIgJzufeZyyxnunGyj6OrmuCq0=;
 b=MQBE7GOQWqXcHYYdJIkgYTvRowFF4jJt0NGTTvcYiOKNxVq2uurvWG43
 fKyMiPflWYBbiETxtT6j1I4CxyX4yVHzvpqq64nEL/+gRlz6QkyLBvbdQ
 1IJ9cUOjy2EzRmPyrrrUwyTCoLBMF2pkeNMXZARwo3VQmRBk7dJHriv70
 VHwzrdfF8FasCSNjII2qXR8fCRYR7fpYKNp/9eLd+SMhmgFxNEEL45EbA
 Y4zKjl6yU6HQC6u6IKnnybC8vdhDYqBq9BiOG6zKecCgLDREsM9463wrH
 T74QQvn6zH/2kepdFEpBPWqmCpqVqNFQKydh++14hmjnb9r3i4AgTc3tM w==;
X-CSE-ConnectionGUID: 9qOfRT8yTy+qrboJ5RUwPg==
X-CSE-MsgGUID: IwqyKhX1QOKOz3jpXfeVzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86574476"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="86574476"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:46:28 -0700
X-CSE-ConnectionGUID: wC9U70AKTEaOUa+5UaVqkA==
X-CSE-MsgGUID: OUqyT2WeSd2/pofv++oWmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="255220305"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:46:27 -0700
Date: Wed, 25 Mar 2026 16:46:25 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm/i915: Eliminate out of place "HBlank"
 CamelCase
In-Reply-To: <20260325135849.12603-6-ville.syrjala@linux.intel.com>
Message-ID: <cc6c7a73-805c-2656-8b0b-872a31692659@intel.com>
References: <20260325135849.12603-1-ville.syrjala@linux.intel.com>
 <20260325135849.12603-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1022169058-1774452149=:294612"
Content-ID: <cedf91d4-34c1-a020-ba66-eef624682ff1@intel.com>
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

--8323329-1022169058-1774452149=:294612
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <f199942b-1b87-265f-8a77-bff970f6e43f@intel.com>

On Wed, 25 Mar 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Nothing else in the crtc state dump uses CamelCase, so
> don't use it for "HBlank" either.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Certainly.

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1022169058-1774452149=:294612--
