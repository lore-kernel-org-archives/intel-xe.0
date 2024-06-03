Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84209C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 14:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0858924B;
	Mon,  3 Jun 2024 14:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESiehVk0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CEA8924B
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 14:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717424362; x=1748960362;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=dShy4XpRHQ6LffBNCWJJ/ZfNZJKsrKEgEbw6IPOlm+Q=;
 b=ESiehVk0xfErZFszzT2316veQA+NRjsa3Gp0Z/wrnIPJODCTWWG6Lsyb
 DK0p0mhkI1bRh9lgX6uj7MFXuI5zV5iE+SZmgZPLtKNA68apOobv0NZf0
 d5BIh0uMoPtd/DNtZMF0xQhFXvtUoLRRBQTBl3mvj64WyWLIBIyOsQFDv
 hnhJUJunPPs3ZIYl0jX/VPk+OhNOuI8N8hNUP0c+0AaPYHM5P9jk+xrYW
 /YIohNEG3oE2/LGH5AcxSOQ6ojgoySR7HMc/E6CTTkNMkX77Y08McW5YC
 7a/kwCDksYFISEcXZSX3mdcgv5dOLsLvWGzfC8Fyo8w73BhLYucAuTi5t Q==;
X-CSE-ConnectionGUID: wbfzgX7FROyBCC+cCpF8AA==
X-CSE-MsgGUID: p36eX4x2QbS3o7/mC7yFKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14144059"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="14144059"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 07:19:21 -0700
X-CSE-ConnectionGUID: BDYsQnjWRy+WcKmY0OjsHg==
X-CSE-MsgGUID: pFTtY7pRQoCzMVjlbvS2BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36868974"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 03 Jun 2024 07:19:21 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2B197125B4;
 Mon,  3 Jun 2024 15:19:19 +0100 (IST)
Message-ID: <452de901-f35e-49df-8e5f-c4ce676ece0b@intel.com>
Date: Mon, 3 Jun 2024 16:19:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use missing lock in relay_needs_worker
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240603081723.18775-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240603081723.18775-1-nirmoy.das@intel.com>
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



On 03.06.2024 10:17, Nirmoy Das wrote:
> Add missing lock that is protecting relay->incoming_actions.

good catch!

> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_relay.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> index c3bbaf474f9a..ade6162dc259 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> @@ -761,7 +761,14 @@ static void relay_process_incoming_action(struct xe_guc_relay *relay)
>  
>  static bool relay_needs_worker(struct xe_guc_relay *relay)
>  {
> -	return !list_empty(&relay->incoming_actions);
> +	bool is_empty;
> +
> +	spin_lock(&relay->lock);
> +	is_empty = list_empty(&relay->incoming_actions);
> +	spin_unlock(&relay->lock);
> +
> +	return !is_empty;
> +
>  }

alternate solution could be to just rely on the new return value from
relay_process_incoming_action() that could tell us if there was nothing
to dequeue so then we wont start new worker (at potential cost of one
extra worker cycle to see that), but this LGTM too, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
