Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35282FED9F0
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 17:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21B710E5E7;
	Tue, 17 Mar 2026 17:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTPQaJ17";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DF810E5E6
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 17:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773767795; x=1805303795;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TKg4bfkdXGxrjNmdQjMxQAuZeKEJB91Zcop6yMz5Y1k=;
 b=hTPQaJ17b3KIN/bPjWwWzhNTPp6BmRhShp44FP6nL4vW6o1BDemosuLG
 qXWsnsUOyQwKsySVPmDAjVUoVbyuSRDrRhAdD59+3r5pxsRx6wDmeswxX
 0+6LIMowvK1fbcdZJFbBtV5KWFVgS0URVenUVs+Oc1BWxfobhDaQaUcnn
 QXxyT2ul/cVA5Y3OPG8A8VPHVGqUwZaFwRJwh89ChNRv4ACJSMLtP8zA6
 KqSTIz02mTpoUvneRctC/OSg+NfdpxqXlmRkN35Tej7FoXAWbhIK3CPnk
 z2PNjkxeeQHh/VcC9OKuPZpzn65AaD3RRjsroRLyJM9VxPWEn/DAqnjN+ g==;
X-CSE-ConnectionGUID: kfxm53BkTgeezPfKeAgDwA==
X-CSE-MsgGUID: S2d5ODTkSsWcOTqrJz2WBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85886715"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="85886715"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 10:16:35 -0700
X-CSE-ConnectionGUID: 3nrPAn8FRqKfw9j7ujJLgQ==
X-CSE-MsgGUID: rr1ZPDcaQ92VMyd45C7+GQ==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 10:16:33 -0700
Date: Tue, 17 Mar 2026 18:16:31 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, heikki.krogerus@linux.intel.com,
 andi.shyti@linux.intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v1] drm/xe/i2c: Assert/Deassert I2C IRQ
Message-ID: <abmMbyWv7MoQc78S@ashyti-mobl2.lan>
References: <20260313080438.4166251-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313080438.4166251-1-raag.jadav@intel.com>
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

Hi Raag,

On Fri, Mar 13, 2026 at 01:34:38PM +0530, Raag Jadav wrote:
> I2C IRQ is triggered using virtual wire. Assert/Deassert it in IRQ
> handler to allow subsequent interrupt generation.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
