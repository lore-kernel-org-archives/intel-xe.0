Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B914A10706D6
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 10:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787EA10E04D;
	Wed, 18 Mar 2026 10:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfUn4Sgq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874AB10E04D;
 Wed, 18 Mar 2026 10:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773829146; x=1805365146;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=A8QEN1n0Un7HZ5Jrcwq9ZMEZkOGZwfjFT6RrPBOzi9w=;
 b=WfUn4SgqeD+igjVEFQH7w6f2blsD4kvWaYt0jf3dO11gLnidNmuTVn5M
 s/S9whWTHBbgSybKq9wv/un6YcboEjeqJ9/bKtm8OhMJzvrLfL99SZbzj
 yMdFDTDSzN3c9qWopfEkcTYAPI2zmJVig+bPHHrSdwz+YYq2TLogpoo6a
 Q8P5g5HpzEw9TMSGLXgOyQGkWAcj1K7LaXRIGd25PPlBn+84LgIcRN2TZ
 cTnA0xfXSWiZ98rQzwbAywVuCPGNt7DvK68tbxYVgtTMl9zcbDA3TNyyM
 up0bqv9O8iY6Xw9HIQsCSKUYedVCiudTRV7QU3UFsCiFfcc/z7R0I34gF Q==;
X-CSE-ConnectionGUID: CnMIa+c3SwaCSy6jkNZawQ==
X-CSE-MsgGUID: VRe/kE7nQQuPT9176njhzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74578822"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74578822"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 03:19:05 -0700
X-CSE-ConnectionGUID: XNfADGAKTiiGhcjX9B49hw==
X-CSE-MsgGUID: M5P8126mSfWrmmV5rfp4HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="221816684"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.79])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 03:19:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: samasth.norway.ananda@oracle.com, ville.syrjala@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH v2 0/2] drm/i915/gmbus: fix bugs
In-Reply-To: <98b08a93d554455ea7db69f148d2928e1ee728c1@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260316231920.135438-1-samasth.norway.ananda@oracle.com>
 <98b08a93d554455ea7db69f148d2928e1ee728c1@intel.com>
Date: Wed, 18 Mar 2026 12:19:00 +0200
Message-ID: <61f99ea781c8e5d4d8a2588241fa3b91675e8f8a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 17 Mar 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> On Mon, 16 Mar 2026, Samasth Norway Ananda <samasth.norway.ananda@oracle.com> wrote:
>> v1 -> v2
>> v1 just included both changes, the bug fix and typo change in same patch.
>> Separated them to two different patches for clarity.
>
> Thanks for the patches.
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

And pushed to drm-intel-next.

Thanks,
Jani.

>
>
>>
>> Samasth Norway Ananda (2):
>>   drm/i915/gmbus: fix spurious timeout on 512-byte burst reads
>>   drm/i915/gmbus: fix a typo in comment message
>>
>>  drivers/gpu/drm/i915/display/intel_gmbus.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)

-- 
Jani Nikula, Intel
