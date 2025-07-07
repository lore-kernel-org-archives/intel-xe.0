Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E0FC8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 13:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4FE10E479;
	Mon,  7 Jul 2025 13:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwyFhk5c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2523410E479
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 13:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751894212; x=1783430212;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=wZ50eUzAJEbcViakKc1q1ZspbN1swY6ah9qZ0lfe7EU=;
 b=OwyFhk5crIvc5GVWlpBG2nUxBdS8En2k78sOINcKYm7rGacUOMQ7sxDc
 iJ+upZLjWlXSxL5TNGnvJkFeL0YrI1GbDPcnk9dZ2LvvMKDsiimyVWwoz
 9QH0GF72qBEvPdQfJ1vaCZnr6khBWBqgKwEsxVKkKHHnc0cEzXdEeHw2O
 6l3dUK4ksqhWgJDqHvJsizDrwoUiGIrzHkHZFmEoXjjB0fP+XEMKO/jrq
 WYn19uwSieaN0WMY33lVh4/xGVM34gdgG7LazbpmOrpUvgro9ZT4pWC+M
 qGeaPdEd4YvNOooRys6dt3121YjkMSzmLKirNev5wgE9KpQTcczVAZDUC Q==;
X-CSE-ConnectionGUID: zmR097WlRRC18JEiWUGnuw==
X-CSE-MsgGUID: Jto0BuJ0TK2b0y88gnHhFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79546149"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="79546149"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 06:16:52 -0700
X-CSE-ConnectionGUID: 5q00i4vMRi2NYq8RvLvFrQ==
X-CSE-MsgGUID: Cy52GPmZQXS79b3JZ30kdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="160868490"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.104])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 06:16:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Jul 2025 16:16:44 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH v6 04/12] platform/x86/intel/pmt: mutex clean up
In-Reply-To: <20250703211150.135320-5-michael.j.ruhl@intel.com>
Message-ID: <31b70656-f673-5086-2c48-3ba94a63a5bd@linux.intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com>
 <20250703211150.135320-5-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1894421471-1751894204=:941"
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

--8323328-1894421471-1751894204=:941
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 3 Jul 2025, Michael J. Ruhl wrote:

> The header file for mutex usage and mutex_destroy() cleanup code is
> absent from this module.

Hi Michael,

While not end of the world, it's generally better to spell out what=20
module (/driver/etc.) you're talking about instead of using "this" even if=
=20
the change will contain other references that will tell what the module is.

No need to send another version of this series just because of that unlees=
=20
there are going to be other changes.

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


> Add the header file and mutex_destroy().
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index d40c8e212733..6e32fc1f8f1d 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -12,6 +12,7 @@
>  #include <linux/intel_vsec.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
> @@ -262,8 +263,12 @@ static void pmt_crashlog_remove(struct auxiliary_dev=
ice *auxdev)
>  =09struct pmt_crashlog_priv *priv =3D auxiliary_get_drvdata(auxdev);
>  =09int i;
> =20
> -=09for (i =3D 0; i < priv->num_entries; i++)
> -=09=09intel_pmt_dev_destroy(&priv->entry[i].entry, &pmt_crashlog_ns);
> +=09for (i =3D 0; i < priv->num_entries; i++) {
> +=09=09struct crashlog_entry *crashlog =3D &priv->entry[i];
> +
> +=09=09intel_pmt_dev_destroy(&crashlog->entry, &pmt_crashlog_ns);
> +=09=09mutex_destroy(&crashlog->control_mutex);
> +=09}
>  }
> =20
>  static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
>=20

--=20
 i.

--8323328-1894421471-1751894204=:941--
