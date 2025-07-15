Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF44C83F1D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 11:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA6510E37F;
	Tue, 15 Jul 2025 11:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c3ehclnq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF9410E37F
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752577252; x=1784113252;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=F1O7pPpweUSP6ibi15oUf/pE1p/vaHxPY0bJy4+jkQY=;
 b=c3ehclnqE0IRYQrAfsX80gSXDf0oIuJgjFecQoE+bObOeDSt8UILCfUy
 pTEwPzPI4KrzyR+KyUd9d7WAOSzzLw6fvcnDdX9zz4QyJg2XPqBt/X9fZ
 oZlWhruPqygVCAjBsk7/K1BUm2CYHzDXBAVjP9XXO8SjRlSatJmZKXNSk
 otSIxhE7Cu9li2gXuE2tb4CtBQ6vmu++b+x6bG0oFeB7SN/ARXvYfKhZF
 UFgfMxvBh/SIMh4T2NOrg6gpuP+/V+oP5UO3RvFHbQMfDuh6oeFpVLpl8
 0f9h2Cac+7FvBL33/UwmG/Lz4yQxPw50GY5HXLxAC8iHrttjsDBu3fVrZ Q==;
X-CSE-ConnectionGUID: R31iNnMkRp2IluBc9I+cuA==
X-CSE-MsgGUID: aHtDGsdsQNq3Tva5XZ3CVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65361406"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="65361406"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 04:00:51 -0700
X-CSE-ConnectionGUID: Vw0ek7qFSviSonJSwHwMbw==
X-CSE-MsgGUID: IcESN/10Skm1Bsm5lbBDSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157913473"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 15 Jul 2025 04:00:50 -0700
Received: from [10.245.253.198] (unknown [10.245.253.198])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A252A28791;
 Tue, 15 Jul 2025 12:00:48 +0100 (IST)
Message-ID: <9bb24742-27c7-42c1-a167-fa8b7c543315@intel.com>
Date: Tue, 15 Jul 2025 13:00:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI v4 6/7] drm/xe/pf: Stop requiring VF/PF version negotiation
 on every GT
To: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250713103625.1964-1-michal.wajdeczko@intel.com>
 <20250713103625.1964-7-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250713103625.1964-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 13.07.2025 12:36, Michal Wajdeczko wrote:
> While some VF/PF relay actions must be handled on the GT level,
> like query for runtime registers, it was clarified by the arch
> team that initial version negotiation can be done by the VF just
> once, by using any available GuC/GT.
> 
> Move handling of the VF/PF ABI version negotiation on the PF side
> from the GT level functions to the device level functions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

for the record, since this series is already merged, considering
cross-OS support this patch (and its prerequisites) might also deserve tag:

Fixes: 98e62805921c ("drm/xe/pf: Add SR-IOV GuC Relay PF services")

