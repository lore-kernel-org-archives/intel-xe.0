Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0811BC83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 13:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F6810E0B9;
	Mon, 28 Jul 2025 13:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0ls/Ewe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22B010E0B9
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 13:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753710242; x=1785246242;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ko433oKiOG3orI4RJzsW6QFrWitC6rlwiuhR3Y+yuQA=;
 b=J0ls/EweGr7qkYSzxqW0OUXQHsanVCG0+TPvjIx8pQmgfbuAnXXzvJHQ
 Vs7qLmUbzglchpmuwc05bbE3hSir3TxEcJ8iBqjFgnU/Gs9hDpICtC8aW
 X/gDVGNahIOgiWtaX9GNW5xH1m0spWU70s4hJThyR53NAE9w8KkrHj6fM
 33J2jgtv8zyJfCd015f2fVBrxiI00XWx4FtV2NXTEDM1gyBKLlOsu2Zmt
 xVpTYB4BJHlWyQVeJqc4p9KzsPe5s8FTsqcrVHQuFxPXdiD4QCGWdcb+8
 23DjEFFyivBL2qC2F8qCt8vWHEZdtsrRteONoHCg4KkkSk8FGlp9OisWz g==;
X-CSE-ConnectionGUID: StE2sNy6T3qZ719PIpe++Q==
X-CSE-MsgGUID: 7+BknYMYS6mEiy8JDh9SNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="73406945"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="73406945"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 06:44:01 -0700
X-CSE-ConnectionGUID: TxeFoJi3THKVV/e07Qqw+w==
X-CSE-MsgGUID: 6bFqkgsSQVKw2o2h9g/jVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162287170"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
 by fmviesa006.fm.intel.com with ESMTP; 28 Jul 2025 06:43:56 -0700
Message-ID: <f6437802-ab77-45f3-beb3-c5db54d6d8f1@linux.intel.com>
Date: Mon, 28 Jul 2025 16:43:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] i2c: designware: Use polling by default when there
 is no irq resource
To: Raag Jadav <raag.jadav@intel.com>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, andriy.shevchenko@linux.intel.com,
 mika.westerberg@linux.intel.com, jsd@semihalf.com, andi.shyti@kernel.org,
 riana.tauro@intel.com, srinivasa.adatrao@intel.com,
 michael.j.ruhl@intel.com, intel-xe@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20250710071612.2714990-1-raag.jadav@intel.com>
 <20250710071612.2714990-2-raag.jadav@intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250710071612.2714990-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 7/10/25 10:16 AM, Raag Jadav wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> The irq resource itself can be used as a generic way to
> determine when polling is needed.
> 
> This not only removes the need for special additional device
> properties that would soon be needed when the platform may
> or may not have the irq, but it also removes the need to
> check the platform in the first place in order to determine
> is polling needed or not.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
