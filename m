Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10B6606A332
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 15:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PLK1ohan
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6965110E038;
	Tue,  3 Nov 2026 15:32:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF4410E038
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 15:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793719941; x=1825255941;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dMyQDYeLhVuzO8nQZdTfMCUCAKJ+eYLtmPCiF7YnzJQ=;
 b=PLK1ohany5xxd8kkdcaCoIAweR4+2xaUpIfdHCNDpo+gk/3nInPjF9Eq
 SN9gBHGeT1nXUiGNHKPFzeGzZdA9vf3Qm6UHDKxVn81rXpDHSpDbsvlwx
 pfrc32HEnuhuzIyk6cVAcciIrlDFprr4gmXqrezlt7OzCg/PcVSg8n5MT
 1IwLoeeVVhckElQ53B0cm88kgWCqGkOjm3RGSzuW6+TH/XfD6huFkrPVc
 Yv+DrrIIGYEVXZWesS/XmivuOCNaiScQbnxxliAePsA/dhU5P24uZemIT
 dVUq4lUFI0XRFPP/g/52IPbb0z8QBpdJ3ZhPZJrh0VGZxPL4k3CZ4ZIpH g==;
X-CSE-ConnectionGUID: 4qXD5OrTQkC3c4B2ODUlLw==
X-CSE-MsgGUID: EDC2Vg8MTAmrqlAXGjLHOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2357901"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2357901"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 07:32:20 -0800
X-CSE-ConnectionGUID: 53Qm8Fq9RvKZy9u3uC6ZpQ==
X-CSE-MsgGUID: 42royXd0Sfa3ojjqqxsA/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6518669"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.245.121])
 ([10.245.245.121])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 07:32:19 -0800
Message-ID: <bc86567cb914a435dd65d5e3eb463eb4ebf57ae4.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Add a per-client debugfs file reporting bo NUMA
 node distribution
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: intel-xe@lists.freedesktop.org, Himal Prasad Ghimiray	
 <himal.prasad.ghimiray@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Tue, 03 Nov 2026 16:32:16 +0100
In-Reply-To: <auHk62MFrf-H4tms@zenone.zhora.eu>
References: <20261028103237.70129-1-thomas.hellstrom@linux.intel.com>
 <auHk62MFrf-H4tms@zenone.zhora.eu>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 2026-10-28 at 16:07 +0100, Andi Shyti wrote:
> Hi Thomas,
>=20
> On Wed, Oct 28, 2026 at 11:32:37AM +0100, Thomas Hellstr=C3=B6m wrote:
> > When debugging NUMA placement of bo system memory, there is
> > currently
> > no way to tell on which nodes the pages backing a bo reside. The
> > /proc/<pid>/numa_maps interface doesn't help since bo CPU mappings
> > are
> > VM_PFNMAP, and clients may have thousands of bos, so a dump of all
> > bos
> > is undesirable.
>=20
> ...
>=20
> > Example:
> > =C2=A0 exec 3<>/sys/kernel/debug/dri/client-<id>/bo_numa
> > =C2=A0 echo <handle1> >&3
> > =C2=A0 cat <&3
> > =C2=A0 echo <handle2> >&3
> > =C2=A0 cat <&3
> > =C2=A0 exec 3>&-
> >=20
> > The client id can be obtained from the drm-client-id fdinfo key.
> >=20
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Assisted-by: LLM
>=20
> Please drop the Assisted-by and add your SoB :-)
>=20
> ...
>=20
> > +	do {
> > +		kvfree(buf);
> > +		bufsize *=3D 2;
> > +		buf =3D kvzalloc(bufsize, GFP_KERNEL_ACCOUNT);
> > +		if (!buf) {
> > +			ret =3D -ENOMEM;
> > +			goto out_unlock;
> > +		}
> > +
> > +		iter =3D (struct drm_print_iterator) {
> > +			.data =3D buf,
> > +			.remain =3D bufsize,
> > +		};
> > +		p =3D drm_coredump_printer(&iter);
> > +		ret =3D xe_bo_print_numa_info(file, handle, &p);
> > +		if (ret)
> > +			goto out_free;
> > +	} while (!iter.remain);
>=20
> this is basically
>=20
> 	} while(drm_coredump_printer_is_full(&p));
>=20
> The rest looks good to me.
>=20
> Andi

Thanks for reviewing, Andi. Will fix.

Thanks,
Thomas

