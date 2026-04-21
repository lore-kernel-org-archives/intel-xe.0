Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B54F8FA71
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 12:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0676D10EC53;
	Tue, 21 Apr 2026 12:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6HZWDHR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028E110EC53
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776776208; x=1808312208;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sBIwrIZJoZOFkpQ99TCDzWQ0txu4V5sviLQR2Rz5/UU=;
 b=W6HZWDHRiqhLMBL8bnUjz5WajN1Q/KYVYMUqZx+17dmUfO4E8JZ5VEef
 u2rF5D+LASr+T5sNYjcWVLaLQzaD5i1aH+KzuArd0KPcnzU4KgBLFUduf
 cY39fTJ6VWOeVwT+DuHGWXcyUmqPjcCBkIyva4VcDL/T5xGQ6hedaVhiD
 pUDBW/1sltxaC0N/Zb1der7SG2WLFpU4hmVg0BTCRiAPqw8zukBUX0q3r
 4LC7K9AEqzClJ2GnvgkFBT7aDAHyffP5wQbhJ2AXNNkujqFn9EFzb4M/x
 vUNiuKXPojaImxWytEgQkrOtxT55Y0qGutqEqYkX6pe7cluEgF2Sv7I1W Q==;
X-CSE-ConnectionGUID: Oh7MqqhLSta3ukpamW3vew==
X-CSE-MsgGUID: Yr7FSo5OTau1jExrN8VOLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77408259"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="77408259"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 05:56:47 -0700
X-CSE-ConnectionGUID: tGpQtz6rQhe/tuoOjtl7hw==
X-CSE-MsgGUID: q6KSZTm7Snu3kP2sowBuDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="262420088"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.31])
 ([10.245.245.31])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 05:56:46 -0700
Message-ID: <60f1def43bb1f5a4fc738e2dcc915e3f5be72134.camel@linux.intel.com>
Subject: Re: [CI] drm: Ensure ioctls are drained before device unplug
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Apr 2026 14:56:43 +0200
In-Reply-To: <aecuhmp/Yi8vjT1q@gsse-cloud1.jf.intel.com>
References: <20260414091552.6153-1-thomas.hellstrom@linux.intel.com>
 <aecuhmp/Yi8vjT1q@gsse-cloud1.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Tue, 2026-04-21 at 01:00 -0700, Matthew Brost wrote:
> On Tue, Apr 14, 2026 at 11:15:52AM +0200, Thomas Hellstr=C3=B6m wrote:
> > There is a check that blocks ioctls after device unplug,
> > but we have no check that running ioctls have actually
> > completed at unplug time. (And for some IOCTLs like
> > fence waits, that actually makes sense).
> > However, implement ioctl draining to have CI check for
> > lockdep issues.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
>=20
> CI patch, but this seems entirely correct=E2=80=94unless there=E2=80=99s =
some black
> magic or hand-wavy behavior involved for not protecting IOCTLs
> against
> unplug.
>=20
> So=E2=80=A6
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks for reviewing, Matt.=20

Although I think for some Ioctls that can wait extensively for GPU,
like fence waits and exec, we actually need to exit dev when waiting,
otherwise that waiting would block the unplug rather than let the
unplug through to kill the running jobs and terminate the wait.

So requires some careful thinking. Might be best if we set an IOTCTL
flag to indicate that we want this behaviour.

Thomas



>=20
> > ---
> > =C2=A0drivers/gpu/drm/drm_ioctl.c | 11 +++++++----
> > =C2=A01 file changed, 7 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_ioctl.c
> > b/drivers/gpu/drm/drm_ioctl.c
> > index ff193155129e..c87a925f0fe4 100644
> > --- a/drivers/gpu/drm/drm_ioctl.c
> > +++ b/drivers/gpu/drm/drm_ioctl.c
> > @@ -789,19 +789,22 @@ long drm_ioctl_kernel(struct file *file,
> > drm_ioctl_t *func, void *kdata,
> > =C2=A0{
> > =C2=A0	struct drm_file *file_priv =3D file->private_data;
> > =C2=A0	struct drm_device *dev =3D file_priv->minor->dev;
> > -	int ret;
> > +	int ret, idx;
> > =C2=A0
> > =C2=A0	/* Update drm_file owner if fd was passed along. */
> > =C2=A0	drm_file_update_pid(file_priv);
> > =C2=A0
> > -	if (drm_dev_is_unplugged(dev))
> > +	if (!drm_dev_enter(dev, &idx))
> > =C2=A0		return -ENODEV;
> > =C2=A0
> > =C2=A0	ret =3D drm_ioctl_permit(flags, file_priv);
> > =C2=A0	if (unlikely(ret))
> > -		return ret;
> > +		goto out;
> > =C2=A0
> > -	return func(dev, kdata, file_priv);
> > +	ret =3D func(dev, kdata, file_priv);
> > + out:
> > +	drm_dev_exit(idx);
> > +	return ret;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(drm_ioctl_kernel);
> > =C2=A0
> > --=20
> > 2.53.0
> >=20
