Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08884C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 09:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9097310F281;
	Fri, 21 Aug 2026 09:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOloWxpU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE89D10F281
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787304576; x=1818840576;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s4I94EvdTSrwCQT+MAZnHpvToScsGi/x+TEMoBhPPLs=;
 b=gOloWxpUDBk01/OJ+HVufwTt+vfs61AM4jFnVILw9MBMswm5UBEv1Yv5
 6Ted2OGJI8uH85QDNrY3zOB0UKM8NIYia74zjyoNslDpBkz/2J4v0o5xS
 8OlvXwty9eXoE5kGyLo5tEkbY0zPfqs5hqlaJCopwF75obac39tJJh75o
 MXMmk2RMm7aFs3gUy6Kvw70AXYc9G8w0xzZdSgtUE6FBkP9y2RDD3StTd
 E1NXiZhPI4U7Bll5JiDMnGW+xOnmq2bWq/UauKBhI9rkEa5X9gii9+eut
 LSxDIUiq6QduK7tmwe5+pu8kPHnQzZ0h19j7gfnp27DWTncAIMdjMYWke Q==;
X-CSE-ConnectionGUID: qe6NCeCoSo+GTrQ5rEghtg==
X-CSE-MsgGUID: kI4mnYEIQfSQIcqXBbQvpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87869295"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87869295"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:29:35 -0700
X-CSE-ConnectionGUID: MK/9pWcNQyauh/f42fTGnQ==
X-CSE-MsgGUID: 1OGnHZWySdCLejHB5ub5HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="291140397"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:29:31 -0700
Date: Fri, 21 Aug 2026 11:29:29 +0200
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
Message-ID: <aogaeU6a5i1kyaMg@black.igk.intel.com>
References: <20260701083051.450259-1-raag.jadav@intel.com>
 <20260701083051.450259-9-raag.jadav@intel.com>
 <alASTH5nHedKPPP8@gsse-cloud1.jf.intel.com>
 <alB8ubrXvqWSTOQL@black.igk.intel.com>
 <363aea8d-10ee-4b44-abdc-be759aec822f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <363aea8d-10ee-4b44-abdc-be759aec822f@intel.com>
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

On Fri, Aug 21, 2026 at 10:26:58AM +0200, Laguna, Lukasz wrote:
> On 7/10/2026 07:01, Raag Jadav wrote:

...

> > +bool xe_device_wedged(struct xe_device *xe)
> > +{
> > +	return atomic_read(&xe->wedged.ref);
> > +}
> 
> __guc_ct_send_locked() and g2h_read() return -ENOTRECOVERABLE when
> xe_device_wedged() is true, but with the new refcount approach device may
> only be temporarily wedged.

Good catch. I was expecting this path to not be hit during FLR as we're
tearing down exec queues and disabling interrupts, but fully agree that
there's a whole lot of TODOs we need to revisit as a follow up. I'll add
this one too.

Raag
