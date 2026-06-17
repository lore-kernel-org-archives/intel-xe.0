Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8615BCD98F2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 13:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B6910EA3B;
	Wed, 17 Jun 2026 13:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdU9mmRb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91A8890D2;
 Wed, 17 Jun 2026 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781702962; x=1813238962;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VvYcSOAAXRb5TKmyBHYiQ4vCBjDY2E5V8abY5hyWkGM=;
 b=IdU9mmRbycXA+jq5AZ2W8n7jD/jvsoTJ9T2+S/ESUTiMyvRxoHddBith
 VTubb5djW1zXuYvimAIAzXss5dH8UFSnEQ3H9mCLttvHcCYYjtQ8d7hBX
 fugBCFi5L0n/UvnE4cc2dRKjmKrYmY+HVtVvZquisF13ukvvtfHCy2ALM
 QAbUP4cRvrkC5c/P79seiDe8i59mIARLxN8IJR2ltWlyB4dgrPfRhs8ML
 73/Ys7d2TtuLt54b4BSv3moz5cCtbQKAGMZZJNrmRlIzMjc+b/upS5PWq
 BRHd1p4uouWNjFrh0HzKgEiB5tn5+T30JPBDnPTrhVSRL6JYsvDSvtYi+ A==;
X-CSE-ConnectionGUID: a/qG3uLOQtOkPw57JuKD0g==
X-CSE-MsgGUID: M/g/OqUjSHiGuxVobOKpJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82587191"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82587191"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 06:29:21 -0700
X-CSE-ConnectionGUID: EoOBR697RC+oKJMF2lnVTQ==
X-CSE-MsgGUID: PRB1d35kShyCBJ1+btEIDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="248145725"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.158])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 06:29:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, tools@kernel.org, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 01/14] drm/i915/cdclk: Don't bail if pcode post nofify
 fails
In-Reply-To: <511da82834da302ac50a326c082c45f6134b2556@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-2-ville.syrjala@linux.intel.com>
 <511da82834da302ac50a326c082c45f6134b2556@intel.com>
Date: Wed, 17 Jun 2026 16:29:16 +0300
Message-ID: <8c18eca330bd63182319a18f238e78f1c451ede2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 10 Jun 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 10 Jun 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>
>> We already changed the actual cdclk frequency by the time we do
>> the pcode post notify. So skipping the subsequent readout is plain
>> wrong.
>
> Fixes: ?

Turns out posing the question about Fixes: trailer like that leads to b4
shazam literally adding that trailer. Please clean them up before
pushing!

Cc: tools@k.o and Konstantin, FYI


BR,
Jani.


--=20
Jani Nikula, Intel
