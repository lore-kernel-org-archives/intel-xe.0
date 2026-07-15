Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53995C44501
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 11:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC91710F005;
	Wed, 15 Jul 2026 11:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9YF1M7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F2610F005
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 11:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784114651; x=1815650651;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rNJoJRHuCJsSKh01J+7U4FAtfd8OXRl6CUyW9/RG1Ls=;
 b=d9YF1M7fZ9IoxVQtH7bILqdJJT3n8mApoakq8yaEsgHdxn8q3O9MsTK8
 L9DKUREQAwfM14kYFGzs8+iNbWtsfC8cSGGJye75z38hNotpbjCx2GP2e
 bIXtyXEzt6NsCWmimZ5XDekzsookE3/DG4s1hRTchhRFBiJNWLKDlPets
 sOmUvf7aizdgsKb8s1gGZVTh4qnQcMasbISS3ZMozvKapisA+pHEs1DXD
 dPbz51ZKck/3hULRETOIyXNUbCHBTzxcyK1WlxHbuMGs59EbQCzHL7bwv
 TSpGKwesRrxas1CtUoBI/2y6fIed5Aa3c09mjbT6dWHZwBnwhuSag+jOt w==;
X-CSE-ConnectionGUID: aE6p/OZvS2WWek54frcAEQ==
X-CSE-MsgGUID: lAbfrfu0QOeK5k2pbscn7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84602702"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84602702"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 04:24:11 -0700
X-CSE-ConnectionGUID: ozUKoBqgQGigHt9xKHhD8w==
X-CSE-MsgGUID: oJJkCey7QtubiDaZnrBPVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="261062420"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.145])
 ([10.245.244.145])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 04:24:09 -0700
Message-ID: <55bb83d586d6f009b734e13c7b1ed95325129e5b.camel@linux.intel.com>
Subject: Re: Fixes tags need work in the drm-xe tree
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Date: Wed, 15 Jul 2026 13:24:07 +0200
In-Reply-To: <aldq1bH-I9hhdc7q@sirena.org.uk>
References: <aldq1bH-I9hhdc7q@sirena.org.uk>
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

On Wed, 2026-07-15 at 12:11 +0100, Mark Brown wrote:
> In commit
>=20
> =C2=A0 0aeed866cb938 ("drm/amd/display: Fix dangling pointer in CRTC rese=
t
> function")
>=20
> Fixes tag
>=20
> =C2=A0 Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and
> dm_crtc_state")
>=20
> has these problem(s):
>=20
> =C2=A0 - Subject does not match target commit subject
> =C2=A0=C2=A0=C2=A0 Just use
> 	git log -1 --format=3D'Fixes: %h ("%s")'

Same with this one. It's an amd commit and only appears in drm-xe-next
after a backmerge.

Thanks,
Thomas
