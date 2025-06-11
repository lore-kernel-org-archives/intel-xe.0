Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07A2C71134
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 08:37:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866C210E610;
	Wed, 11 Jun 2025 08:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzTH8Z8E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DC110E5FA
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749631064; x=1781167064;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dchvZ9Q+pyoa/JIkFMWnMjwIICKheJaebEAlKae+ubg=;
 b=JzTH8Z8EbXUk3t8sdqIUNu6kEkYaXT47+Cy6+X+qyE8YVUprJX2waFp8
 GIXhGIwYHpWCh6lYAv9FgFLUVh7d/k9xHZ4hzIkdMzpOWxMuyvmxoZnVK
 E7Ao7ItIcJhmIQdT9BlamP43zDjY4EktQUGkkPKWJB1vYuu0xjpVXyoHA
 mRSH/e7Zf0wjwix2m9fX6KXNvSwAYr+1rMhlSmF4gn0MoLfu63CuDXnmi
 NS4jry71H519iGx6Qyp87teDSM77vb9e3nvh0DLkrj8T9Sf+RKy9Bl/hf
 J95Fgd5iiOgK0QJvLzd+NCWDmjnuFXhEsBWYn0zYcnFzHltOEGdvOVLcb Q==;
X-CSE-ConnectionGUID: hBA3dzdCShqre3ZPP9MyNg==
X-CSE-MsgGUID: 1s3akJz8SOShfsv2Lg62sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="50873314"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="50873314"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 01:37:44 -0700
X-CSE-ConnectionGUID: IAhwMbZHRjaJoaIUwEfOZw==
X-CSE-MsgGUID: jOCMjPSwR2qXKvf28beKbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="170296310"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
 by fmviesa002.fm.intel.com with ESMTP; 11 Jun 2025 01:37:40 -0700
Message-ID: <2b0575b8-ff9f-44e7-8ad3-71e02c724c41@linux.intel.com>
Date: Wed, 11 Jun 2025 11:37:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] i2c: designware: Add quirk for Intel Xe
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250610100311.2245871-1-heikki.krogerus@linux.intel.com>
 <20250610100311.2245871-2-heikki.krogerus@linux.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250610100311.2245871-2-heikki.krogerus@linux.intel.com>
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

On 6/10/25 1:03 PM, Heikki Krogerus wrote:
> The regmap is coming from the parent also in case of Xe
> GPUs. Reusing the Wangxun quirk for that.
> 
> Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
