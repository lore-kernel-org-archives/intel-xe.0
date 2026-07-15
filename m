Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66449C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 11:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B4310F005;
	Wed, 15 Jul 2026 11:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRkDyoKb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EDD10F005
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 11:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784114578; x=1815650578;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=c0w8gHbaKzhIyQmr/1NPVuV4XBOy1fDyuE0NQOg5exQ=;
 b=VRkDyoKbwgvnENe4ktTzJT4bLzq5F1knwHRAgw4nyQ5BIwMjXglxjnMk
 WGI2oECDl50XR2V1BYBRzmoR1lW7OZJnhXlODTo9EtDzKwwm8XEfEg7WB
 6jBI5XUnLmOl1ZghC39u1jToFNeC6/OCEPiQ7Oyh42AZvhzedIIbmmYnT
 GfIo/XNhaYBJqwjCMk9HiQv7+d3U8bKySPTcfhkYTe4Tzjit4DuOPhoI8
 2xpIXwYV2JYYPa5y9ZW44xEnvJYilC4RDoWM7XYRoaiUP+wXITX6UDK33
 UC8rTeAD6W8aLi+zmUqo+rFyXYkVLTqiGOPJF2uWVODbiWgOPpp65vpW+ w==;
X-CSE-ConnectionGUID: 0DzImVXVQF6GlafdlqwjGg==
X-CSE-MsgGUID: OXDwdoWUS4iMY/pB/+XmMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88651952"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="88651952"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 04:22:58 -0700
X-CSE-ConnectionGUID: F2tOz2J9RZWvmNjPVQIFYA==
X-CSE-MsgGUID: CAI+9p0fTZyhpMkUpojvyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="286228892"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.145])
 ([10.245.244.145])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 04:22:57 -0700
Message-ID: <f9bd11224a5efc2bd76fe81603f6fbe2a6823cbe.camel@linux.intel.com>
Subject: Re: Fixes tags need work in the drm-xe tree
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Date: Wed, 15 Jul 2026 13:22:54 +0200
In-Reply-To: <aldqsddPPF4VaFCU@sirena.org.uk>
References: <aldqsddPPF4VaFCU@sirena.org.uk>
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

Hi, Mark.

On Wed, 2026-07-15 at 12:10 +0100, Mark Brown wrote:
> In commit
>=20
> =C2=A0 3b1f4d5e47b36 ("drm/amd/display: Fix dangling pointer in connector
> reset function")
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

This appears in the drm-xe tree only after a backmerge of drm-next, so
I don't think drm-xe is to blame here.

Thanks,
Thomas
