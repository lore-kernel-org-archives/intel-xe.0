Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF55C61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 21:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1444310E044;
	Fri,  6 Jun 2025 21:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHaG87qZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EF810E044
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 21:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749244444; x=1780780444;
 h=message-id:subject:from:reply-to:to:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dKocegu1RoKqNsUiRsL4JZ8am3/3Dpvrr4Mek2kK+og=;
 b=mHaG87qZqbxWbGMyx1IibjEbPUbeHzgjoZlF1NVdXk0b7wrAB/B+zbbw
 jJFs8g+R1hkqcX8RFKpMeb5NbXtPwswSHV1f2Ge/2nNBVBg8fgOaQUKyb
 neMWUmpv3wfNbSbmH1dPN6Jylmp2O6Xh4d2vqBITmJR4bZu28XZK0icI8
 oBOXmmJ7qqVx6+a9Lq9xehxNp3XgNZovWfXAcE+wY6s3m2Ht5xJiImjGt
 LOx7FLCRIlcxyaPF9gVnKbGnACmRfWUZbw8j+Pqh49sgEmv37XxcYYFT/
 9mAMhkvzpMejosXMGAJi25eiVN5Qd/A7gJwBYJyi5moFsy/RuWfAJg55P w==;
X-CSE-ConnectionGUID: lV3RhVZRTguVayOC/Xw3kw==
X-CSE-MsgGUID: ap2pKnpJTbCdhy+NbwN5fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="73932934"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="73932934"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:14:03 -0700
X-CSE-ConnectionGUID: wohOPFd5SKG9KOdYu6sHjw==
X-CSE-MsgGUID: 4098TrMiSWG+3bWPNYsTjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="149759530"
Received: from aschofie-mobl2.amr.corp.intel.com ([10.124.222.251])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:14:02 -0700
Message-ID: <1aaee1ffddf26619f045ef82789385828e8bdde9.camel@linux.intel.com>
Subject: Re: [PATCH v3 04/11] platform/x86/intel/pmt: white space cleanup
From: "David E. Box" <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com,  rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com,  simona@ffwll.ch
Date: Fri, 06 Jun 2025 14:14:02 -0700
In-Reply-To: <20250605184444.515556-5-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
 <20250605184444.515556-5-michael.j.ruhl@intel.com>
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
> Noticed two white space issues; cleaned them.
>=20
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> =C2=A0drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> b/drivers/platform/x86/intel/pmt/crashlog.c
> index 74ce199e59f0..e997fc48b9ce 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -143,7 +143,7 @@ enable_show(struct device *dev, struct device_attribu=
te
> *attr, char *buf)
> =C2=A0
> =C2=A0static ssize_t
> =C2=A0enable_store(struct device *dev, struct device_attribute *attr,
> -	=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
> +	=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
> =C2=A0{
> =C2=A0	struct crashlog_entry *entry;
> =C2=A0	bool enabled;
> @@ -177,7 +177,7 @@ trigger_show(struct device *dev, struct device_attrib=
ute
> *attr, char *buf)
> =C2=A0
> =C2=A0static ssize_t
> =C2=A0trigger_store(struct device *dev, struct device_attribute *attr,
> -	=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
> =C2=A0{
> =C2=A0	struct crashlog_entry *entry;
> =C2=A0	bool trigger;

Reviewed-by: David E. Box <david.e.box@linux.intel.com>

