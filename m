Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F54C5B549
	for <intel-xe@archiver.kernel.org>; Sat, 31 May 2025 05:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CC710E26F;
	Sat, 31 May 2025 05:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVA3efCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5A410E8C9
 for <intel-xe@lists.freedesktop.org>; Sat, 31 May 2025 05:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748668754; x=1780204754;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=LZfhHf3shbz/AJHKGDKDL3O8LWYkEAABvMj3JNXts80=;
 b=mVA3efCwwcwqOhmC85BqqEqII6HqFJv08ui3/iFm/QhU5Qaa2eKRglP6
 ihS5lDoq2CEb5T2z0SXgrOO9mGpFSPrVf/BrY8tpNwagTR8KOmnUwnvaA
 HhvssNm4emAo1+H891uRE6nUbfTAb9GNWPZaf6c9WsspnaDS8raKOSDhA
 tdxUSycoYJgfkThi8ErnjXLNBlfz1lZjapTKpo7RDBHMnhMpjDqgbnt6O
 nc07kIggdPAqPqfam1ZvJ+kl3FSE6XBQkUWa0zFIpVoAMPtJVS2vZxHWz
 pW+NlNwyftqwCuFubFPi0sGu6ORrT3KnzJ6OyUQMj9smdO/Asb/MImRbS w==;
X-CSE-ConnectionGUID: 2r0QEJ2CQHS9awNaLFKsdg==
X-CSE-MsgGUID: Rk/knSvtQju5Vnq0d6ym6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54556996"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="54556996"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 22:19:14 -0700
X-CSE-ConnectionGUID: 0A10xtbtTkewl6O4GyBrFQ==
X-CSE-MsgGUID: mGt0qhYUTZm9eZDWzaYXQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="144530347"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 22:19:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 31 May 2025 08:19:08 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 02/10] platform/x86/intel/pmt: white space cleanup
In-Reply-To: <20250530203356.190234-2-michael.j.ruhl@intel.com>
Message-ID: <5f5ca773-5c6d-f020-e8a4-1fb0020e4119@linux.intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
 <20250530203356.190234-2-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2006411038-1748668748=:937"
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

--8323328-2006411038-1748668748=:937
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 30 May 2025, Michael J. Ruhl wrote:

> Noticed two white space issues; cleaned them.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index 6a9eb3c4b313..d40c8e212733 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -143,7 +143,7 @@ enable_show(struct device *dev, struct device_attribu=
te *attr, char *buf)
> =20
>  static ssize_t
>  enable_store(struct device *dev, struct device_attribute *attr,
> -=09    const char *buf, size_t count)
> +=09     const char *buf, size_t count)
>  {
>  =09struct crashlog_entry *entry;
>  =09bool enabled;
> @@ -177,7 +177,7 @@ trigger_show(struct device *dev, struct device_attrib=
ute *attr, char *buf)
> =20
>  static ssize_t
>  trigger_store(struct device *dev, struct device_attribute *attr,
> -=09    const char *buf, size_t count)
> +=09      const char *buf, size_t count)
>  {
>  =09struct crashlog_entry *entry;
>  =09bool trigger;
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-2006411038-1748668748=:937--
