Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D96CCD6E56
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 12:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44AC113293;
	Mon,  1 Jun 2026 12:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMNoFM5R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4250113293
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 12:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780316004; x=1811852004;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pO2MAPtqmK9Dtev3GMIQsTJ30nvZpveeeaY+QIzHdkU=;
 b=GMNoFM5RJ6T6SGg/RsMW8aABqs01AV70BUAvf7RWnC7CRQOn0ZfGGSuF
 X78SVFBseM9YHGkG6e/PCbDI7PMeQi65pp+gRdWlm94FScSTAP3DjssFt
 efLacLce2IwN4JydfATBK8KikJg2Jm0OLW4RyyMxKrLX0gRjgORRGhF7C
 ytBzSiqR/Tqg8WXCZ3E5lZhCiBbztA4XJR6MuI7VWRyL/2owpf4jDnX1J
 cCx4mBVoMvhNUEi1m9zZmR0ac36//7bqw5uN0JPd05pi/Glr3dQm+c2Vc
 v5DgCnTFVHczueOFlJ6+ktswSgMDD75suwWLlGruhoJI0kwUpYb2jLJUd w==;
X-CSE-ConnectionGUID: f53S3tbhQzSWN2Jth4OeRw==
X-CSE-MsgGUID: CaZPhVarTV29BGzYWylbow==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="103741211"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="103741211"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 05:13:24 -0700
X-CSE-ConnectionGUID: Og5HTFtaSfSM3Ku5rLNQwQ==
X-CSE-MsgGUID: 7jje66DGRsmkiwEVLYgySw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="273839468"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 05:13:21 -0700
Date: Mon, 1 Jun 2026 14:13:18 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, Anoop Vijay <anoop.c.vijay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v8 5/6] drm/xe: Move xe drm_ras initialization
Message-ID: <ah13XmBaPlq2mtlO@black.igk.intel.com>
References: <20260601084146.3808639-8-riana.tauro@intel.com>
 <20260601084146.3808639-13-riana.tauro@intel.com>
 <3857c423-2ac1-4822-ab49-cd96ae8a41f7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3857c423-2ac1-4822-ab49-cd96ae8a41f7@intel.com>
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

On Mon, Jun 01, 2026 at 01:27:10PM +0200, Michal Wajdeczko wrote:
> On 6/1/2026 10:41 AM, Riana Tauro wrote:
> > Move xe drm_ras registration to RAS initialization flow and keep
> > hardware error initialization for processing errors reported
> > via irq.
> > 
> > Move soc remapper and system controller initialization
> > up in xe_device_probe as RAS initialization depends on both.

...

> > ---
> > v2: remove unnecessary log (Raag)
> > ---

...

> > +void xe_ras_init(struct xe_device *xe)
> > +{
> > +	if (xe->info.platform != XE_PVC)
> > +		return;
> > +
> > +	xe_drm_ras_init(xe);
> 
> but here, we don't, is it really ok to ignore such errors?

xe_drm_ras_init() already logs it for us, so we decided to drop it in v2.
But I'd have expected it to be explained in commit message to avoid such
confusion.

Raag
