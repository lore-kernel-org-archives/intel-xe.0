Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CEEC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 09:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94F310EC70;
	Fri, 12 Jul 2024 09:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWpLQaBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67C810EC70
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720776185; x=1752312185;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LRvt2NVBPEQFStFl5/uOKyH1f8PBF3IG3RuPn0qv+MQ=;
 b=RWpLQaBBLP+D64V3A6giTU5H+u2J6sH9qo9s7z9jLYM4BuMxLrQnb7YN
 2yaznOBXxZu/iyhawKzjFmDzK01dIKlashRIOb2c3MGiUjfysIuRH/mb1
 fBCzMXmKHf7IqoghH1WcIiTjmUmx1YOdRjrRFyOIgLyYRX7c3K2akXBy5
 hCFJEuZr+MuxxB/Dp5LLy3SKlfZTOyWO+CM7iWRhLHgY+/ZWwrXewL8Nl
 zQuPuceoAqoE8rKJy/6jypx20Gh9TttBvTUAJA3ztlXV6NmFY1INNnHc/
 2keTex4XqtbatWo5P2oXEns9eQ8/zFzrZtH9zLT2rICR0t2rrNQcC/S3U A==;
X-CSE-ConnectionGUID: PVNQMtgBTXa4p6szLn1k/Q==
X-CSE-MsgGUID: jiCwWipwSA6vDUecHPSoDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18410853"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="18410853"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 02:23:04 -0700
X-CSE-ConnectionGUID: oGPFKGaRSWiM0DxWw42ruw==
X-CSE-MsgGUID: /ccCFGqXSxO74u3gwmUAgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="79970162"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 02:23:03 -0700
Date: Fri, 12 Jul 2024 11:23:00 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Expose display alignment requirement
Message-ID: <20240712092300.7zcqrtvw3u3aggqw@zkempczy-mobl2>
References: <20240711090925.179366-1-zbigniew.kempczynski@intel.com>
 <20240711090925.179366-3-zbigniew.kempczynski@intel.com>
 <ZpBSOJRDHJfmsX_h@intel.com>
 <20240712090013.ex2peruaomb6q5e5@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240712090013.ex2peruaomb6q5e5@zkempczy-mobl2>
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

On Fri, Jul 12, 2024 at 11:00:13AM +0200, Zbigniew Kempczyński wrote:

<cut>

> 
> At the moment I've mitigated this issue seen in kms_ccs for bmg
> in series: https://patchwork.freedesktop.org/series/135994/
> but this is not temporary and not fully correct solution until kernel

s/not temporary/temporary/

> will switch to 64K physical alignment for scanout buffers.
>
--
Zbigniew
