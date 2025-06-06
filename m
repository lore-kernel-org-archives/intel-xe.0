Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F024C61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 21:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B2010EB9D;
	Fri,  6 Jun 2025 21:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lqS3ds0k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5B810EB9D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 21:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749244864; x=1780780864;
 h=message-id:subject:from:reply-to:to:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vRjWLSLcyuhidZvehjR1ipqVjQEEVFJ8+0ujt+ex2iw=;
 b=lqS3ds0kAyI7JJiAxE1yElp0n1WNXraZTDdKbKZz4QK5tsxrMJgDCf5r
 DnC1XYik4p3lYSpet9LCdLa4efS2rTnr3OaD2zlTULTtSQUJmswLqvssc
 3pm5t43PCHY+0wKAFQUCGeIh7PmKbHDzmsdjU+55WEayibnnTspg+MBGN
 YsyLYo3F2HoMRBSvMKGCdz/e5VK9jcum0LRFQu1rIycgONvcw6uNHwYPq
 KRMyHoEE3n4QBj15noW23SPhMa9iqfFFGBsNwjzy0tAFoThO7e3aY5/I2
 WSV921NfyQPa/Gm9k7gXhYpRKRX20EMSWtP64N4KID3UoFiwQ01AclfuP g==;
X-CSE-ConnectionGUID: 2gUNyAy+SPG7pmw7h9+Njg==
X-CSE-MsgGUID: bSu53b8rQay3H0tboDCKaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51500078"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="51500078"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:21:01 -0700
X-CSE-ConnectionGUID: bmMn6acASX65PM2T8lgPpg==
X-CSE-MsgGUID: XDNaHgEcTXSsImD8770sMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="176810209"
Received: from aschofie-mobl2.amr.corp.intel.com ([10.124.222.251])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:21:00 -0700
Message-ID: <57730404f39eab74df30dcc575495879972324ef.camel@linux.intel.com>
Subject: Re: [PATCH v3 05/11] platform/x86/intel/pmt: use guard(mutex)
From: "David E. Box" <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com,  rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com,  simona@ffwll.ch
Date: Fri, 06 Jun 2025 14:20:59 -0700
In-Reply-To: <20250605184444.515556-6-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
 <20250605184444.515556-6-michael.j.ruhl@intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
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
Reply-To: david.e.box@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 2025-06-05 at 14:44 -0400, Michael J. Ruhl wrote:
> Update the mutex paths to use the new guard() mechanism.
>=20
> With the removal of goto, do some minor cleanup of the current logic
> path.
>=20
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> =C2=A0drivers/platform/x86/intel/pmt/crashlog.c | 32 +++++++++++---------=
---
> =C2=A01 file changed, 15 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> b/drivers/platform/x86/intel/pmt/crashlog.c
> index e997fc48b9ce..94858bfb52f8 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -155,9 +155,9 @@ enable_store(struct device *dev, struct device_attrib=
ute
> *attr,
> =C2=A0	if (result)
> =C2=A0		return result;
> =C2=A0
> -	mutex_lock(&entry->control_mutex);
> +	guard(mutex)(&entry->control_mutex);
> +
> =C2=A0	pmt_crashlog_set_disable(&entry->entry, !enabled);
> -	mutex_unlock(&entry->control_mutex);
> =C2=A0
> =C2=A0	return count;
> =C2=A0}
> @@ -189,26 +189,24 @@ trigger_store(struct device *dev, struct
> device_attribute *attr,
> =C2=A0	if (result)
> =C2=A0		return result;
> =C2=A0
> -	mutex_lock(&entry->control_mutex);
> +	guard(mutex)(&entry->control_mutex);
> =C2=A0
> =C2=A0	if (!trigger) {
> =C2=A0		pmt_crashlog_set_clear(&entry->entry);
> -	} else if (pmt_crashlog_complete(&entry->entry)) {
> -		/* we cannot trigger a new crash if one is still pending */
> -		result =3D -EEXIST;
> -		goto err;
> -	} else if (pmt_crashlog_disabled(&entry->entry)) {
> -		/* if device is currently disabled, return busy */
> -		result =3D -EBUSY;
> -		goto err;
> -	} else {
> -		pmt_crashlog_set_execute(&entry->entry);
> +		return count;
> =C2=A0	}
> =C2=A0
> -	result =3D count;
> -err:
> -	mutex_unlock(&entry->control_mutex);
> -	return result;
> +	/* we cannot trigger a new crash if one is still pending */
> +	if (pmt_crashlog_complete(&entry->entry))
> +		return -EEXIST;
> +
> +	/* if device is currently disabled, return busy */
> +	if (pmt_crashlog_disabled(&entry->entry))
> +		return -EBUSY;
> +
> +	pmt_crashlog_set_execute(&entry->entry);
> +
> +	return count;
> =C2=A0}
> =C2=A0static DEVICE_ATTR_RW(trigger);
> =C2=A0

Don't see include for cleanup.h. If add then

Reviewed-by: David E. Box <david.e.box@linux.intel.com>

