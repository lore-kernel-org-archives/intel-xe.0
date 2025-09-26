Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAE3CAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 19:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696F10E097;
	Fri, 26 Sep 2025 19:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4Zw6X12";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D03B10E097
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 19:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758915331; x=1790451331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wvupXxRd3NAQ8qutdgL9Nl5NEoQvXFkiKP76Yy/5d6w=;
 b=e4Zw6X12p1LgnFeq3MDx7seQRSBdbw+QkNymZugYJY4id1/0hJgEHzVR
 YIEfcSCauvGL/6BV9wNHw/FDMGNA6MX+QEpJH+5x6fU+PLpeCVJlYcFMm
 y3piE67CD6j87eZsx8akDL3MK4Txo7DBLo3I8XgNXHyZCvMmNWMErenLJ
 e4mHaY4fwVmzs9AA8HHmYovEEPr0gVNsYiPiQd+xa8WiwnW2LP/VyGv/K
 KjAOr1sptBD3taYk+skXJybuKDvaTrmuRzNBDxjgwJYPx8lYD4sOdMdnZ
 NhGgBUSQzt7DIx8orpFTKjsTreMer1wDGrR2Hk7YWTZnckgC5/KOG/pAM A==;
X-CSE-ConnectionGUID: ZuPOJXIGQ46yL/9YwX0qVg==
X-CSE-MsgGUID: mD6eZ9vdTKGn5M24vPBFQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="78684760"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="78684760"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 12:35:31 -0700
X-CSE-ConnectionGUID: 2MysgqXzTUOAbJ0b4oCkhQ==
X-CSE-MsgGUID: QcNtouqiTO6QynvriJ8QPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="178143486"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.11])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 12:35:29 -0700
Date: Fri, 26 Sep 2025 22:35:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v12 11/13] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
Message-ID: <aNbq_j39EipWw_pV@intel.com>
References: <aNKMKSIGSPfmPBEc@intel.com>
 <afd72823-2b19-4d15-b87e-bd879568ad02@igalia.com>
 <aNKer6J7Op2gGmtC@intel.com>
 <f0fbf72f-4791-4aff-a4cb-299bf9ef265f@igalia.com>
 <aNK0E7KMBW5iOzSo@intel.com>
 <e2cb2159-367b-4f43-babc-a5250fc9914d@igalia.com>
 <aNRx66g6y4c-eoZk@intel.com>
 <7e07606b-d542-4407-a092-476f202cc8e2@igalia.com>
 <cfc54165-b391-4905-a00a-27d2889225e3@igalia.com>
 <aNZDxGoYxVFfRNOu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNZDxGoYxVFfRNOu@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Sep 26, 2025 at 10:41:56AM +0300, Ville Syrjälä wrote:
> I reverse engineered this a bit and there's definitely a
> MOCS issue at play.
> 
> First I noticed that if filled the entire MOCS table with
> UC the problem went away. I then filled the entire table
> with WB and essentially bisected what I need to make UC
> to fix it. And I had to repeat that same process starting
> from the other end of table.
> 
> Looks like there is some undocumented magic in the hardware.
> 
> MOCS 61 really is special:
> - MOCS 61 UC, others WB, select MOCS 61 -> no corruption
> 
> MOCS 0 and 63 are special in other ways:
> - MOCS X UC, others WB, select MOCS X -> corruption
> - MOCS X+0 UC, others WB, select MOCS X -> corruption
> - MOCS X+63 UC, others WB, select MOCS X -> corruption
> - MOCS X+0+63 UC, others WB, select MOCS X -> no corruption
>   where X != 61

OK, the MOCS 63 issue was caused by me having L3=WB still in
MOCS X. If I change MOCS X to L3=UC, MOCS 63 no longer makes
a difference. I suppose that means MOCS 63 is still used for
L3 evictions, even though bspec no longer mentions that fact
explicitly.

So MOCS 0 is the thing that really matters for CCS. And for
MOCS 0 only the LLC WB vs. UC selection matters. L3 WB vs. UC
doesn't seem to make any difference.

It's interesting that MOCS 60 is documented as a "CCS special case",
but in reality it's MOCS 0 that matters for CCS. I wonder if some
wires got crossed in the hw design and the wrong MOCS entry ended
up being used for CCS and no one noticed...

> 
> I didn't actually test all values of X there, but I did spot
> check a handful of them.
> 
> Also, ADL is affected, but TGL doesn't seem to be. Though I
> still need to check the situation on TGL a bit more thoroughly.

TGL actually works exactly the same as ADL. The only reason why
TGL worked correctly out of the box was that we use a different
MOCS table for TGL/RKL (IIRC because we started out with the
wrong table and early Mesa versions depended on that), and in
that table MOCS 0 is just 0x0, whereas on ADL MOCS 0 is WB.

And now I'm wondering how much performance we're leaving on
the floor with CCS by having a suboptimal MOCS 0 on TGL/RKL...

And I'm also curious about older platforms. I think those also
have MOCS 0 as UC. I'll need to test if those also have this
MOCS 0 special case for CCS...

-- 
Ville Syrjälä
Intel
