Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED08CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 20:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB7310E129;
	Fri, 29 Aug 2025 20:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHXF9X0z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0884110E129
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 20:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756501021; x=1788037021;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CU9Ov1xu1eOFKBbi9l+zTIcWuAdj5HqZXDuwGEueuk4=;
 b=BHXF9X0z3hhazx64xYjW/xICjP/0CSn2bZEo4Gq3K/OMjoBDqkwCTNeQ
 XpgymVnRUgOoRMy4/9b81VuTNLnNA3ZTPvw5JyQEBbzhz0nfKxcE4aY1I
 qI4E+1MLca4IhijByMPjeVgNadq/IaqtUOwZT0IR2BuDrqNl/5mhcNGhm
 llGiVv9XOMNa/sXt5o/DFKQ4Hq4LC7TlK8rPoEM7LwcIMtjMwf3Drbrui
 S1KZTQxZl69FQCc7x5lRNgA0Gx0dpul7tbLo40/LtKbJzzCxauzyOXW9N
 /Ekekd524hQAJdm1Yg1gi6wvWJJ5V+kEPxiHU71+4GoM/7KP9nzYlSdO7 g==;
X-CSE-ConnectionGUID: rB86BrCBTnq8JHc061E84A==
X-CSE-MsgGUID: LatsjDBFQISlN1ZOZuAnSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="57820290"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="57820290"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 13:57:00 -0700
X-CSE-ConnectionGUID: O1vBhJcGSwe3ytJMxgd/Hw==
X-CSE-MsgGUID: aPGF0cx5QD2JzoCO68onFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169724151"
Received: from agladkov-desk.ger.corp.intel.com (HELO [10.245.245.245])
 ([10.245.245.245])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 13:56:59 -0700
Message-ID: <ead117c6cde4312a4c52e6d9977d0e4502718e27.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Allow the pm notifier to continue on failure
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org, Matthew Brost	
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Date: Fri, 29 Aug 2025 22:56:55 +0200
In-Reply-To: <aLHgK7edrKFfGIqw@intel.com>
References: <20250829113350.40959-1-thomas.hellstrom@linux.intel.com>
 <20250829113350.40959-3-thomas.hellstrom@linux.intel.com>
 <45929eb2-bd6d-46d3-86a1-fe4f233d3c70@intel.com>
 <aLHgK7edrKFfGIqw@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Fri, 2025-08-29 at 13:15 -0400, Rodrigo Vivi wrote:
> On Fri, Aug 29, 2025 at 04:50:01PM +0100, Matthew Auld wrote:
> > On 29/08/2025 12:33, Thomas Hellstr=C3=B6m wrote:
> > > Its actions are opportunistic anyway and will be completed
> > > on device suspend.
> > >=20
> > > Also restrict the scope of the pm runtime reference to
> > > the notifier callback itself to make it easier to
> > > follow.
> > >=20
> > > Marking as a fix to simplify backporting of the fix
> > > that follows in the series.
> > >=20
> > > Fixes: c6a4d46ec1d7 ("drm/xe: evict user memory in PM notifier")
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: <stable@vger.kernel.org> # v6.16+
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/xe/xe_pm.c | 14 ++++----------
> > > =C2=A0 1 file changed, 4 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > > b/drivers/gpu/drm/xe/xe_pm.c
> > > index a2e85030b7f4..b57b46ad9f7c 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -308,28 +308,22 @@ static int xe_pm_notifier_callback(struct
> > > notifier_block *nb,
> > > =C2=A0=C2=A0	case PM_SUSPEND_PREPARE:
> > > =C2=A0=C2=A0		xe_pm_runtime_get(xe);
> > > =C2=A0=C2=A0		err =3D xe_bo_evict_all_user(xe);
> > > -		if (err) {
> > > +		if (err)
> > > =C2=A0=C2=A0			drm_dbg(&xe->drm, "Notifier evict user
> > > failed (%d)\n", err);
> > > -			xe_pm_runtime_put(xe);
> > > -			break;
> > > -		}
> > > =C2=A0=C2=A0		err =3D xe_bo_notifier_prepare_all_pinned(xe);
> > > -		if (err) {
> > > +		if (err)
> > > =C2=A0=C2=A0			drm_dbg(&xe->drm, "Notifier prepare pin
> > > failed (%d)\n", err);
> > > -			xe_pm_runtime_put(xe);
> > > -		}
> > > +		xe_pm_runtime_put(xe);
> >=20
> > IIRC I was worried that this ends up triggering runtime suspend at
> > some
> > later point and then something wakes it up again before the actual
> > forced
> > suspend triggers, which looks like it would undo all the
> > prepare_all_pinned() work, so I opted for keeping it held over the
> > entire
> > sequence. Is that not a concern here?

Good point.

>=20
> I was seeing this more like a umbrella to shut-up our inner callers
> warnings
> since runtime pm references will be taken prior to pm state
> transitions
> by base/power.
>=20
> However on a quick look I couldn't connect the core code that takes
> the
> runtime pm directly with this notify now. So, perhaps let's indeed
> play
> safe and keep our own references here?!...

I'll keep the references, and perhaps add a comment about that so that
nobody tries this again.

Any concerns about ignoring errors?

/Thomas


>=20
> >=20
> > > =C2=A0=C2=A0		break;
> > > =C2=A0=C2=A0	case PM_POST_HIBERNATION:
> > > =C2=A0=C2=A0	case PM_POST_SUSPEND:
> > > +		xe_pm_runtime_get(xe);
> > > =C2=A0=C2=A0		xe_bo_notifier_unprepare_all_pinned(xe);
> > > =C2=A0=C2=A0		xe_pm_runtime_put(xe);
> > > =C2=A0=C2=A0		break;
> > > =C2=A0=C2=A0	}
> > > -	if (err)
> > > -		return NOTIFY_BAD;
> > > -
> > > =C2=A0=C2=A0	return NOTIFY_DONE;
> > > =C2=A0 }
> >=20

