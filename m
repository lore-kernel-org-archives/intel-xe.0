Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7526C61CE7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 10:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C3D10E618;
	Wed, 11 Jun 2025 10:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5eYTSqP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA6110E617
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 10:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749638769; x=1781174769;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=fKzQ6/PxMRvg6pvmN0Jg2JkCgKPX7E5u70SSFZzZ0o8=;
 b=P5eYTSqP/r5IdFfbDvNByG50HJfh8eVON5jiOukgEFG3qe3+WL7MKUj+
 F43/k7wD2lj0V/IEXhtik3kadG5CU5nbvaZdOybfn0Uxfnfzna1aHZ25k
 NcxPPlRhveB32KeYhy7FF5T39YpIPPU0y99FD/2j5KOIQUGJ+38MEleNe
 pj+RTKHjHiMABd9vgAafQGSz+P8btHZbZ7kOPRD2R8m3pC/qCLabzWPnc
 neJyv6flMI/F2s8J0MXctlcL8izYEDqbemEGO7WNruwYMF250D4uPQXca
 E19Lfu0BQ1qeDadAbGfchy119EKBe5ziIuv9rnarJcVQ9UynztefLZoB1 A==;
X-CSE-ConnectionGUID: 6KKzLUBmT+OsvgfLlDbGJA==
X-CSE-MsgGUID: JsjfhECIQG6mgxod/53y7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="50998749"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="50998749"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:46:09 -0700
X-CSE-ConnectionGUID: lJza57DAS/q9quE94dXNVw==
X-CSE-MsgGUID: ZJdwZc6MRFaoG7xzDAuWsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147652734"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.183])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:46:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Jun 2025 13:46:02 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH v4 05/10] platform/x86/intel/pmt: re-order trigger
 logic
In-Reply-To: <20250610211225.1085901-6-michael.j.ruhl@intel.com>
Message-ID: <3f0c7164-7cef-a8b2-e989-ccc58e0ef592@linux.intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
 <20250610211225.1085901-6-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-584342154-1749638762=:957"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-584342154-1749638762=:957
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 10 Jun 2025, Michael J. Ruhl wrote:

> Setting the clear bit or checking the complete bit before checking to
> see if crashlog is disabled seems incorrect.
>=20
> Check disable before accessing any other bits.
>=20
> Reviewed-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index 1525e702e993..3d3b72451c01 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -192,6 +192,10 @@ trigger_store(struct device *dev, struct device_attr=
ibute *attr,
> =20
>  =09guard(mutex)(&entry->control_mutex);
> =20
> +=09/* if device is currently disabled, return busy */
> +=09if (pmt_crashlog_disabled(&entry->entry))
> +=09=09return -EBUSY;
> +
>  =09if (!trigger) {
>  =09=09pmt_crashlog_set_clear(&entry->entry);
>  =09=09return count;
> @@ -201,10 +205,6 @@ trigger_store(struct device *dev, struct device_attr=
ibute *attr,
>  =09if (pmt_crashlog_complete(&entry->entry))
>  =09=09return -EEXIST;
> =20
> -=09/* if device is currently disabled, return busy */
> -=09if (pmt_crashlog_disabled(&entry->entry))
> -=09=09return -EBUSY;
> -
>  =09pmt_crashlog_set_execute(&entry->entry);
> =20
>  =09return count;
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-584342154-1749638762=:957--
