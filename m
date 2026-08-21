Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CB4C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 12:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD39E10E704;
	Fri, 21 Aug 2026 12:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVzTicNI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE0E10E6E2
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787315227; x=1818851227;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xo2LCxNl0c27eZVdffOMpnxqMCxFvGcBF+Dlx8P3K3g=;
 b=bVzTicNI10Zs1l3nYg/Xanl3fadQlW+B5O+jr8/JsuSV62xD4Nc1qvLg
 T/rz3/R6N+JpYfCoGCIox4AZmdyle+MMzsxsHmShN1kjWV1eLoNdIlRf6
 escs67wtaBOa3edNer7Czd6m1OdDS5oWn92TQd8FPLNgu1Qx2i6ZjVjh9
 5x1Nr5g4eSe/c4Ke3J8uEzL7BQ7en7CzeD8RjPN3Y3TyLdMEXEEY6z9Sm
 HwKuug22UGNfE+6hEnDKvwYTtzNWe7wWw3u1m1fcoUaygEvzcitlTWlTU
 rjkd4NAD/LofGPnnal15F2SSPnfq30UMaRRn5/tcT47c+1kerv1sZFP5K Q==;
X-CSE-ConnectionGUID: FmWgpB0VS+eUmWxgacC1ig==
X-CSE-MsgGUID: f8Kg8OKRRPiR3XZAMsvXdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="75399012"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="75399012"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 05:27:07 -0700
X-CSE-ConnectionGUID: RXOHsWAkQTWlH99ucPgp8g==
X-CSE-MsgGUID: nGOOwZ1aQeCKU45BwsD4nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="291183397"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 05:27:03 -0700
Date: Fri, 21 Aug 2026 14:27:01 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, dev@lankhorst.se, jani.nikula@intel.com,
 zhanjun.dong@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v9 08/10] drm/xe: Improve wedged state management
Message-ID: <aohEFbWxak1-vNBD@black.igk.intel.com>
References: <20260701083051.450259-1-raag.jadav@intel.com>
 <20260701083051.450259-9-raag.jadav@intel.com>
 <alASTH5nHedKPPP8@gsse-cloud1.jf.intel.com>
 <alB8ubrXvqWSTOQL@black.igk.intel.com>
 <363aea8d-10ee-4b44-abdc-be759aec822f@intel.com>
 <aogaeU6a5i1kyaMg@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aogaeU6a5i1kyaMg@black.igk.intel.com>
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

On Fri, Aug 21, 2026 at 11:29:35AM +0200, Raag Jadav wrote:
> On Fri, Aug 21, 2026 at 10:26:58AM +0200, Laguna, Lukasz wrote:
> > On 7/10/2026 07:01, Raag Jadav wrote:
> 
> ...
> 
> > > +bool xe_device_wedged(struct xe_device *xe)
> > > +{
> > > +	return atomic_read(&xe->wedged.ref);
> > > +}
> > 
> > __guc_ct_send_locked() and g2h_read() return -ENOTRECOVERABLE when
> > xe_device_wedged() is true, but with the new refcount approach device may
> > only be temporarily wedged.
> 
> Good catch. I was expecting this path to not be hit during FLR as we're
> tearing down exec queues and disabling interrupts, but fully agree that
> there's a whole lot of TODOs we need to revisit as a follow up. I'll add
> this one too.

I've sent a standalone fix[1] for this. However, I'm unsure about it's
correctness, so please weigh in.

Raag

[1] https://lore.kernel.org/intel-xe/20260821122114.567725-1-raag.jadav@intel.com
