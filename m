Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69A6CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 06:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6B910E6B7;
	Wed, 22 Oct 2025 06:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EzzmGVHQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314F610E6B7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 06:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761114923; x=1792650923;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8iNPxNaXku2GTngRMfsvKNltZ7mfVr3c/D5UCzuC3cc=;
 b=EzzmGVHQsOQBS6Z6ByZqoX3RIPyB5xUo4lNu3IKwwDBzn52q6rZDHydR
 aApNb2W1EDI9MbsZdcOt3ErviJQo+CeMKNzSM9LJh317z4G+J89GC2Z7W
 rulgRpqT4sAoWr7tc7RN3vCas69U92+llWgUt34ACluxCxpJOvAXKf6rP
 0K90CTiGCDdX2FNwEinlrSt8Q9+o3oQdmlRL6nOzMkLDxL6Wb4C/wQAP3
 MoKfQZ88KYYsjuobbrz8pZgM60KpKG9oU72c7Vpr6n9Z7XMZIvGr9l+yU
 /5OZyyixmtzejEZec2SWSnNFxZnr0KfqPhFjXp0MWM4aFot/pR4Wq7leC Q==;
X-CSE-ConnectionGUID: /CruB/C8RXuCxJDXX62ISA==
X-CSE-MsgGUID: UgWBrbznT2WM3ryxESh0Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50827149"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="50827149"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 23:35:17 -0700
X-CSE-ConnectionGUID: yZmn7OCxTWa9olZBUz3g8Q==
X-CSE-MsgGUID: 9fiJHYT7Tvyi4WO17xa5DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="214733064"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 23:35:16 -0700
Date: Wed, 22 Oct 2025 08:35:13 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 6/12] drm/xe/pm: Enable D3cold WAKE# support
Message-ID: <aPh7IYvOZWOLFvAf@black.igk.intel.com>
References: <20251021-cri-v1-6-bf11e61d9f49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-cri-v1-6-bf11e61d9f49@intel.com>
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

On Tue, Oct 21, 2025 at 10:17:38PM -0700, Raag Jadav wrote:
> CRI supports signalling the host through WAKE# pin on smbus alerts while
> in D3cold. Enable/disable this feature based on device/host configuration.

Thanks for picking this up. Although this made sense when I originally
wrote it, looking at it now I think this can be improved.

Let me spin this out separately if it's okay with you.

Raag

> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
