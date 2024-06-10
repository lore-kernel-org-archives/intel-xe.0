Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C31C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 13:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A6C10E2CE;
	Mon, 10 Jun 2024 13:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPzajK37";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE7E10E2CE
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 13:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718024737; x=1749560737;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=3mvdR8R6nwuuQnlNY1JIN9h9XJz4OwBmV3yTo4o0IKo=;
 b=fPzajK37JGcOZw0UNTaymEzA5W6q4Tg1n3PGzfsvs8wsP2gx452yAYwd
 Xt/luWrPGv98H0VWom4xMJm7yKr/nsY5DTpwwTCIx54VZOlwux8vekI0o
 HsQoWm8z4zWm7fRxo5jx5Kl/dfo/QbEqZz1Dz9uQVKgLVB6VROI+4nsvu
 02jmq4FRE3fR85Xu2mcZZRZOST3fH3BqBhqpNifgeU5HWOANJvA2fOnKI
 3W6Qf3rYh4KCACasfh8489OVZZM/QPJflAio2eiUVu/cso6dW0+kImrc5
 qUOHeMmah76IgDHWxg7eZS7j5ez074W/EydT2dpIALFy1HC5LYYLmlp2W g==;
X-CSE-ConnectionGUID: zjRCVbagSB+vbECKMvhzCg==
X-CSE-MsgGUID: XcjpdWWdSueRaKHmBIhvGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26094588"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="26094588"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:05:37 -0700
X-CSE-ConnectionGUID: Jj5Atf8SSv6RpInh/XIS5Q==
X-CSE-MsgGUID: jDR8BZjhQtGnHyycZUFCOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="76511539"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.36.65])
 ([10.246.36.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:05:37 -0700
Message-ID: <bb43131b-cd9e-4f14-b155-c3d6a8787e09@linux.intel.com>
Date: Mon, 10 Jun 2024 15:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add kernel-doc for HXG Fast Request
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240610120411.1768-1-michal.wajdeczko@intel.com>
 <20240610120411.1768-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240610120411.1768-3-michal.wajdeczko@intel.com>
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


On 6/10/2024 2:04 PM, Michal Wajdeczko wrote:
> We have kernel-doc for all HXG message types but Fast Request.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_messages_abi.h | 28 +++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> index e32142e3fe41..f6ed4dfd215c 100644
> --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> @@ -91,6 +91,34 @@
>   #define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffffu << 0)
>   #define GUC_HXG_REQUEST_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
>   
> +/**
> + * DOC: HXG Fast Request
> + *
> + * The `HXG Request`_ message should be used to initiate asynchronous activity
> + * for which confirmation or return data is not expected.
> + *
> + * If confirmation is required then `HXG Request`_ shall be used instead.
> + *
> + * The recipient of this message may only use `HXG Failure`_ message if it was
> + * unable to accept this request (like invalid data).
> + *
> + * Format of `HXG Fast Request`_ message is same as `HXG Request`_ except @TYPE.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN - see `HXG Message`_                                  |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = `GUC_HXG_TYPE_FAST_REQUEST`_                          |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 - see `HXG Request`_                                   |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION - see `HXG Request`_                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + *  |...|       | DATAn - see `HXG Request`_                                   |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +
>   /**
>    * DOC: HXG Event
>    *
