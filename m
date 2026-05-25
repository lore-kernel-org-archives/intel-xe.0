Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3789CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 18:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1FF10E223;
	Mon, 25 May 2026 18:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDCRVP7z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD9C10E223
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 18:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779732821; x=1811268821;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l4YgzIzh/Am/dW7c6TnIqY8+dK2mNBQBfSK8M2dcf3o=;
 b=UDCRVP7zlZnzibzGriejRfZ7JfbbxrWhwQayXiD4QRnC5fa+VmoO6ylE
 3KJznr3gXjMHWLiHvcXDv7M9OktXSk0oe8HSiFBJFOMflwqUXznE+U9WW
 Jy6EaNf0Glu/uWg+su1z4LwG58vXzvqafwiVyTzdIWEbUb6MnR0rcJ9h8
 3PgyjcpMObORq6RHUkBTijYXqyB6XJNAWiYfWiY2LZOEGn5IVdjgmLZOf
 JIrW7w/Bq356GbZ4CBCMiwasgtmdc7H5N0IWt4i2s1U8dPRxi1dRUFeDE
 hDAGXLjBO6mdJSslkK3uoi1ZdygDZP1yoOtZP8V4TeY2P5sU3wnxAeRJX w==;
X-CSE-ConnectionGUID: 1mVzb/J2Q+6ju1p26ucMYA==
X-CSE-MsgGUID: w/ULxDgdS0SaxehTMWl7gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="79698857"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="79698857"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:13:41 -0700
X-CSE-ConnectionGUID: M/8wAlcZSH6WwsjPjdPtTg==
X-CSE-MsgGUID: Qh3rdGHtTvmgOgKNwxsp6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="265249208"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:13:40 -0700
Date: Mon, 25 May 2026 20:13:37 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/6] drm/xe: Drop unused param from xe_device_create()
Message-ID: <ahSRUdPv_JdKBQ_u@black.igk.intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-2-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525160529.15890-2-michal.wajdeczko@intel.com>
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

On Mon, May 25, 2026 at 06:05:24PM +0200, Michal Wajdeczko wrote:
> We never used or need anything from the struct pci_device_id there.
> And while around, add simple kernel-doc for this function.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
