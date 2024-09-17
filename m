Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A977ECAC597
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 19:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5194510E1D1;
	Tue, 17 Sep 2024 19:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhCQoDh3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A995F10E1D1
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 19:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726600581; x=1758136581;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Gl/5FJhYToWsTyaTJ71jEcU2/kxrvhSkzuQ+fW5s0Jg=;
 b=BhCQoDh3svre/GooYSjdQFU1zQghOvi6oSIU/jLeIMZqcYXGRFgeDitI
 gj6cytQnr/Yxj/Nc2QVZaIQ64nMA8sDwThq9Il+3JPeDY/+uz2P3F7xDW
 UVAaKuTmkBxMDUKLvtRVF0mVDblaQ/mspF97ZnJPk+VosELuehUhtnUBU
 3aKPh09dj1k70u1t5U/NB0xQs537ZTnxADrQ5MpwFnqY/oFm9SCqwljFl
 tJo4uZQYAFgrEM6hFAMbvOjhHCtB8/i3mK/ojbp8MPdBcbPfwdPF6UkYJ
 cUdC3ieROrThNrv7oxy2NBnNUQyoy5Oojv8I9Xl5YjdfXFNpNfQl6fT3X A==;
X-CSE-ConnectionGUID: sSKMTgfZSOej6JjBaX59+A==
X-CSE-MsgGUID: izAHEawjQratexBJI2o2iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="47990263"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="47990263"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 12:16:21 -0700
X-CSE-ConnectionGUID: wpgS4sWAQpCNQJqDW3nktg==
X-CSE-MsgGUID: ZM1JKXVbQCyOQm7o6+DkBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="73652576"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2024 12:16:19 -0700
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D8F8C312C9;
 Tue, 17 Sep 2024 20:16:17 +0100 (IST)
Message-ID: <bd9ae509-1ef8-49fd-aac1-3b5a5a3c0c19@intel.com>
Date: Tue, 17 Sep 2024 21:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] drm/xe: Introduce xe_device_uses_memirq()
To: Ilia Levi <illevi@habana.ai>, intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, jonathan.cavitt@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
References: <20240917112307.1242329-1-illevi@habana.ai>
 <20240917112307.1242329-3-illevi@habana.ai>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240917112307.1242329-3-illevi@habana.ai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 17.09.2024 13:23, Ilia Levi wrote:
> From: Ilia Levi <ilia.levi@intel.com>
> 
> Simplify some memirq usage scenarios and asserts in memirq infrastructure.
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
