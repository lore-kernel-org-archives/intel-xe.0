Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158CAC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 17:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A512010F522;
	Fri, 12 Apr 2024 17:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSFwmSD3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4575910F4D0
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 17:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712942661; x=1744478661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r6Uib6+oxQWRYtzwW+jDd8nEhyIyCYV+/tjacQmMTDg=;
 b=DSFwmSD3Hm1eF+2EQTv1OZv3U7TAXrxCvA8TO1bXmS5ZSJf4SOi5cBuv
 FAWwtBcuqqlCkqw//THccgEK2eBVdWG4zA0OxQP3johbiimjzUaa1k2iB
 8d+NCwbtpH/ibd0Y0NKC1iFOwRFSum8eiFYAt1tUz1AtxJfH2ou4FRdcM
 tu36Co5APnIcKrmGZlsX7YIcLqRihVw5Y0XgTPTp7BEn34t292bC4P7yG
 DWfDLE6FaVBM/LenduLymCOSI4bCJu6/zB3AYJEAg2+CphoMNbPeQvdpa
 wYDItgXf4ozvZ4oOo1sNQUvk1gfNzERXv7wsfXVBDBCj+brTWEUyyBWec A==;
X-CSE-ConnectionGUID: zhNjhiHyRM+DO2TiaS8d5A==
X-CSE-MsgGUID: 7FaEvTJeRxubRW3cBxLUJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8276564"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8276564"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 10:24:20 -0700
X-CSE-ConnectionGUID: JkxxR9GOQQGWfSBR7IJZpA==
X-CSE-MsgGUID: 0UcPx0xfR/C4+9pTvh8rkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="26090306"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 10:24:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 10:24:20 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 10:24:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 10:24:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 10:24:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZlZwIiMLOo8JvfBxEReMuqsj9NY84jPLnt0Z+Pxn2F1urWJTFMEQ8lr2tUJpvvXzjWFqwVoKt/xIF8hunjk205bkiz/7qAjm3ZC4tljJX0pDwayQcIbRDismLIJuMC3VzmTpWjCzY1qBm33K1YYUyr3bm4gsFjlf1lDMwnMjnKzxmyASSbq4zaZJdqk/G8xV6FziKUIXeyD+jXJDbY9m59lfj6BTdVCm2Ec9nbIIhEKwOB7CmGMSbrjNcIZMtcATuZmznmlzoWW3B4J058yEppUyjqiEmrLmAEdWaKy+D+2T2eYFV4wM7IKr+gSqmnPX1loYimVzLvtZw4Zt1lFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVUIwjTLTAXX+98UiXy0gs2wP58c2uHeRve/RneZGlk=;
 b=NcX1XHEv/CORT47f+M9d1qHAaE6cN/LbhD9+k3Ix3I8lub1hA6Qo7P8oEAkEhMXVDke0dfzJlG2KiuThWoLCHRM88vEbp8522ctWhzktGjJQ8YvTZOwEAt43A3BsFpHkECZZ1ac5qT6qQpA6B2raWGZWTxEGZ5GOGn1PKM6rC5KOFHmv9WhxbMfSuYZfzkgXCr8G0COOR4L00s+wDnUyGMFpx83v+Qv4UyC2O9dF3dB/5HbM4gD3zbjZ2KtKMSbRz3AsIuGDemrLabhiMe2gVABtBm6zKHzQSSs2cjL1yQue3W6kPlOcPoGgKH3AlhLo1U/LAMzTiS6Fzfu2nXHtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 12 Apr
 2024 17:24:06 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 12 Apr 2024
 17:24:06 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [v2 27/31] drm/xe/svm: Handle CPU page fault
Thread-Topic: [v2 27/31] drm/xe/svm: Handle CPU page fault
Thread-Index: AQHairlbYWseFE6xEUWVygHR4om6n7FiVI2AgAEE3GA=
Date: Fri, 12 Apr 2024 17:24:06 +0000
Message-ID: <SA1PR11MB69919A436E1D1098148A1E0992042@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-28-oak.zeng@intel.com>
 <ZhdF33hVByZy0od2@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZhdF33hVByZy0od2@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|IA1PR11MB6348:EE_
x-ms-office365-filtering-correlation-id: 721a89d6-1a09-4de4-7009-08dc5b155b94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xYLh5z/b/mnRJXynPoRXhg+6uLJR1N5ggiwUNjwrmBuokjuGoncjByrvbi/Xv2A77Q6IzyhnYDa4cpaHwCRvNI+71mlpu4xYgANXuyB3377OyvrRoBTfBvRhRzjtbGrsgqEhhl7VuF4twoDqU4coQTk99iT+peyTcdeoe6nWJcAWpZzZ2GxK3gqvxXrFJem8Tt3jKjU4mZpzsslcwxqc4lVwasssRI/NBRqtxG8x6DWrodtktSbzZ27mfuM1oyDePZAu1l1dmLr2x4d9pk9FAg2B+T7YNHGqun10pHn/oEEcfsbBiwYKVKoCC3kS/oLQeg5Yatyf7P1mE9C+bSP9cZAhJ/SAtwnJrQSjBWJfqexuwC7y2DBQGads6Rb/4hLugEeqQQLCVbYQLwwcr85arYYFr+7cdMm2xKdqMf5OrFX/JRrjI62ypmARHCob4IdRB/eBStYoRgia+eP2rQQp7xmR12Pu0IM3I0G8vvN+Hn2VxlhBwp3m6lgNRLdoQBB+G5rvK13+PE1flaYLljvU34XAE3r4PhdIs/ISWQ2pqRYzjOSdXsJWKEdytvbymT17fXbcX7u9EKXgVbdJDNomP15yEB20Vm4D2RrAhuzUqknMyd+pZAtYFGiPk5NFGQmntv/oir4joVx3G8BcvOWTYW12J871UT0z7SnxY+vegZM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?39mpzMBvYjZw/9573lor6LzhVS4ieYSXB+Ag6E9SFNlAx9xffsuqOj1Ust?=
 =?iso-8859-1?Q?NZWBKphOQt2nMhFgBzvOwCv6Mi2P4u8bVn9iXLssZTg8X/MpGwV2icBcp9?=
 =?iso-8859-1?Q?CQGTs3mObKqyep5K5T/9Z5FjhYOteJifcR+ZBxYKOyCoR1UgGP9j1xDj9C?=
 =?iso-8859-1?Q?BilrroVwf+gQccMYwMRP7gpbPlRVQaij5TA8V3zr1strOt9CTkKoZsUNSt?=
 =?iso-8859-1?Q?v76VbZeSADZ6jvRZ4RnM+NlvCrDujvWtVt1lpjbltvWvDs0hP45DZooz62?=
 =?iso-8859-1?Q?CDay9YcBX1V5AmThZW+FKDaCZhRxstEhqoUs4IRN+FnaOa1/djbhS+hnAD?=
 =?iso-8859-1?Q?1Y/rOtKsjF/Lflm9rD/yB7CZ4lZjzE4+Rowv9Y/PPaSFuNQIr7BJXwULAu?=
 =?iso-8859-1?Q?dd9BPeJL4geZsJx05PZrS2GDEn9Q2HfdELdKdKT9MQvuxjra5k0v26GXmI?=
 =?iso-8859-1?Q?rP4yoVOWKj9zorR9GTMczTECnzsDEGH8JNtLBqMtQ0nCo80gmw6LYpO/eC?=
 =?iso-8859-1?Q?frXsBEpJMmFN9Hda76b16tbBQqBSDS0mSHb2GcrTTxQmuNAnyyejbzTFGW?=
 =?iso-8859-1?Q?wy8D5SqHgwBr4DY6tZLaEyrAAZLt8CzagxXYsQiSX4TTXTuLd179gO4uT6?=
 =?iso-8859-1?Q?DFTPgpoKUDFZ9Iaa9bb9/JOUT+s6Q4hc+SY6FMKYQK21/jPQu6c5c3Qnzd?=
 =?iso-8859-1?Q?oNFCeTeJY8mWjr+eaK2PWY5c91miECZE9GzdkUDlL/w2FUhsTT1a30NqfD?=
 =?iso-8859-1?Q?2461W+xAPcpXsmNo92ca0MHyzUYaqkbRQs8bBX9rJC/DOTw6ScmIUQXUFC?=
 =?iso-8859-1?Q?SkFnbxYu/LiutHjXZ0JOzPcaOPtnEMI8yhDXO0jaqkZxldhX1qph9Q0XnA?=
 =?iso-8859-1?Q?ppyWByH8JyvlWo1GlZYvsM/BBJ++7MsnQXxIJ5IveU194U5dYVcLcC8SvW?=
 =?iso-8859-1?Q?jDt0zDI8xIadGzgW6uatQPKlupzHxrWCEHyyGOIW6HTToq6NqyjPRcvNx4?=
 =?iso-8859-1?Q?wdp4/GizunmPi2GzAZZ0NPjgSAxZWBdQ2/ETdsNVStHRuQ8SBdGZyPTxk7?=
 =?iso-8859-1?Q?SCMo4GF2KIHfQC3+M65GOrl5Siyyszsob3VC+js7cpbH2lw1bNGV2VInjo?=
 =?iso-8859-1?Q?sA/Z5gIDL/ingwThwUT/ZtNcslqccG34kq9icl5y4x+ndruEAyt0LF+92T?=
 =?iso-8859-1?Q?kARc662p6Frjh1FoI9HacczJVdfFfVDSeztNdyeXZ2YqRtQX3E9NVrv5Wk?=
 =?iso-8859-1?Q?8q+3/Gp06Bf2scAwOnOS8D0cravX86omqXkKhzXtXLMC5+2tYfyAJZdM9Q?=
 =?iso-8859-1?Q?5CdaQKS09iDilYnqIDTL0nXjTyGxhE3U3bdL5wJNWmQnceuDN1vIRSRECA?=
 =?iso-8859-1?Q?K7PRULXg6Owqv6y7jiF95HM3WVAkqbKAg7vZSWd5hOusI5S8yqWFdEgumQ?=
 =?iso-8859-1?Q?pO1hddD24dZMO0yN+r2OlMDC+1/0h6du69mFTQwVEYxMHUQu7sArhBIeZ/?=
 =?iso-8859-1?Q?aoxTqaBqoq4dZaDQrk7Ks7bQaMIQf9Kggq1k1PE+0LlbCDHQQNT97W06s4?=
 =?iso-8859-1?Q?z/kH//sYTisuJK+4xV7xPA2gakdeQa/2cTHtzStVrVpJiA7K4S9XUXaNOn?=
 =?iso-8859-1?Q?2QIZRVlPECDko=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 721a89d6-1a09-4de4-7009-08dc5b155b94
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 17:24:06.8266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlEdkHsVYmkz7VsZt0NIcjUPdHwcNekKDVfeb9dPzRpfSrBN0kRNLKaERqizO50U4f42j1cehUuTUPONQvbvdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6348
X-OriginatorOrg: intel.com
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, April 10, 2024 10:07 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> Brian <brian.welty@intel.com>
> Subject: Re: [v2 27/31] drm/xe/svm: Handle CPU page fault
>=20
> On Tue, Apr 09, 2024 at 04:17:38PM -0400, Oak Zeng wrote:
> > Under the picture of svm, CPU and GPU program share one same
> > virtual address space. The backing store of this virtual address
> > space can be either in system memory or device memory. Since GPU
> > device memory is remaped as DEVICE_PRIVATE, CPU can't access it.
> > Any CPU access to device memory causes a page fault. Implement
> > a page fault handler to migrate memory back to system memory and
> > map it to CPU page table so the CPU program can proceed.
> >
> > Also unbind this page from GPU side, and free the original GPU
> > device page
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Co-developed-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > Cc: Brian Welty <brian.welty@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile         |   1 +
> >  drivers/gpu/drm/xe/xe_svm.h         |   8 +-
> >  drivers/gpu/drm/xe/xe_svm_devmem.c  |   7 +-
> >  drivers/gpu/drm/xe/xe_svm_migrate.c | 222
> ++++++++++++++++++++++++++++
> >  4 files changed, 230 insertions(+), 8 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_svm_migrate.c
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index f89d77b6d654..65289acdd563 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -131,6 +131,7 @@ xe-y +=3D xe_bb.o \
> >  	xe_step.o \
> >  	xe_svm.o \
> >  	xe_svm_devmem.o \
> > +	xe_svm_migrate.o \
>=20
> See comments about file org, same thing applies here. Let's put all of
> the svm implementation in a single file.
>=20
> >  	xe_sync.o \
> >  	xe_tile.o \
> >  	xe_tile_sysfs.o \
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index f601dffe3fc1..c9e4239c44b4 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -7,11 +7,11 @@
> >  #define __XE_SVM_H
> >
> >  #include <linux/mm_types.h>
> > +#include <linux/mm.h>
> >  #include "xe_device_types.h"
> >  #include "xe_device.h"
> >  #include "xe_assert.h"
> > -
> > -struct xe_vm;
> > +#include "xe_vm_types.h"
> >
> >  /**
> >   * struct xe_svm - data structure to represent a shared
> > @@ -31,6 +31,9 @@ struct xe_svm {
> >  	struct list_head vm_list;
> >  };
> >
> > +#define xe_svm_for_each_vm(svm, vm)
> 	\
> > +		list_for_each_entry(vm, &svm->vm_list, svm_link)
> > +
>=20
> Don't think this is need, see below.
>=20
> >  extern struct xe_svm *xe_create_svm(void);
> >  void xe_destroy_svm(struct xe_svm *svm);
> >  extern struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
> > @@ -79,4 +82,5 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
> >
> >  void xe_devm_free_blocks(struct list_head *blocks);
> >  void xe_devm_page_free(struct page *page);
> > +vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf);
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > index 088ac209ad80..32ada458f1dd 100644
> > --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > @@ -37,11 +37,6 @@ struct xe_svm_block_meta {
> >  	unsigned long bitmap[];
> >  };
> >
> > -static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > -{
> > -	return 0;
> > -}
> > -
> >  static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
> >  {
> >  	/** DRM buddy's block offset is 0-based*/
> > @@ -168,7 +163,7 @@ void xe_devm_free_blocks(struct list_head *blocks)
> >
> >  static const struct dev_pagemap_ops xe_devm_pagemap_ops =3D {
> >  	.page_free =3D xe_devm_page_free,
> > -	.migrate_to_ram =3D xe_devm_migrate_to_ram,
> > +	.migrate_to_ram =3D xe_svm_migrate_to_sram,
>=20
> Again single file so this will be static function, no reason to export
> this.
>=20
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c
> b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > new file mode 100644
> > index 000000000000..0db831af098e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > @@ -0,0 +1,222 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =A9 2023 Intel Corporation
> > + */
> > +
> > +#include <linux/gfp.h>
> > +#include <linux/migrate.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/dma-fence.h>
> > +#include <linux/bitops.h>
> > +#include <linux/bitmap.h>
> > +#include <linux/kernel.h>
> > +#include <linux/slab.h>
> > +#include <drm/drm_buddy.h>
> > +#include "xe_device_types.h"
> > +#include "xe_device.h"
> > +#include "xe_trace.h"
> > +#include "xe_migrate.h"
> > +#include "xe_ttm_vram_mgr_types.h"
> > +#include "xe_assert.h"
> > +#include "xe_pt.h"
> > +#include "xe_svm.h"
> > +#include "xe_vm.h"
> > +
> > +
> > +/**
> > + * alloc_host_page() - allocate one host page for the fault vma
> > + *
> > + * @dev: (GPU) device that will access the allocated page
> > + * @vma: the fault vma that we need allocate page for
> > + * @addr: the fault address. The allocated page is for this address
> > + * @dma_addr: used to output the dma address of the allocated page.
> > + * This dma address will be used for gpu to access this page. GPU
> > + * access host page through a dma mapped address.
> > + * @pfn: used to output the pfn of the allocated page.
> > + *
> > + * This function allocate one host page for the specified vma. It
> > + * also does some prepare work for GPU to access this page, such
> > + * as map this page to iommu (by calling dma_map_page).
> > + *
> > + * When this function returns, the page is locked.
> > + *
> > + * Return struct page pointer when success
> > + * NULL otherwise
> > + */
> > +static struct page *alloc_host_page(struct device *dev,
> > +							 struct vm_area_struct
> *vma,
> > +							 unsigned long addr,
> > +							 dma_addr_t
> *dma_addr,
> > +							 unsigned long *pfn)
>=20
> Weird alignment, also I don't think we are want to allocate a page at
> time...
>=20
> Beyond that, can't say I'm a fan of 2 arguments being return and
> populated here either (dma_addr_t *dma_addr, unsigned long *pfn). I
> haven't seen a lot that style function in Linux.
>=20
> Probably makes more sense to have a function which allocates pages,
> locks them, and populates the pfn array (migrate_pfn) rather than doing
> this a page at a time.
>=20
> > +{
> > +	struct page *page;
> > +
> > +	page =3D alloc_page_vma(GFP_HIGHUSER, vma, addr);
> > +	if (unlikely(!page))
> > +		return NULL;
> > +
> > +	/**Lock page per hmm requirement, see hmm.rst*/
> > +	lock_page(page);
> > +	*dma_addr =3D dma_map_page(dev, page, 0, PAGE_SIZE,
> DMA_FROM_DEVICE);
>=20
> The device is writing to these pages so I think DMA_BIDIRECTIONAL is
> needed, right? As mentioned above I think this should be broken out into
> a different step too.
>=20
> > +	if (unlikely(dma_mapping_error(dev, *dma_addr))) {
> > +		unlock_page(page);
> > +		__free_page(page);
> > +		return NULL;
> > +	}
> > +
> > +	*pfn =3D migrate_pfn(page_to_pfn(page));
> > +	return page;
> > +}
> > +
> > +static void free_host_page(struct page *page)
> > +{
> > +	unlock_page(page);
> > +	put_page(page);
> > +}
> > +
> > +/**
> > + * migrate_page_vram_to_ram() - migrate one page from vram to ram
> > + *
> > + * @vma: The vma that the page is mapped to
> > + * @addr: The virtual address that the page is mapped to
> > + * @src_pfn: src page's page frame number
> > + * @dst_pfn: used to return dstination page (in system ram)'s pfn
> > + *
> > + * Allocate one page in system ram and copy memory from device memory
> > + * to system ram.
> > + *
> > + * Return: 0 if this page is already in sram (no need to migrate)
> > + * 1: successfully migrated this page from vram to sram.
> > + * error code otherwise
> > + */
> > +static int migrate_page_vram_to_ram(struct vm_area_struct *vma,
> unsigned long addr,
> > +						unsigned long src_pfn,
> unsigned long *dst_pfn)
> > +{
>=20
> We definitely don't want to copy 1 page at time. I touch on this in [1].
> Basically this going to perform poorly unless we use larger copies, the
> migrate code supports non-contigous sram addresses, and vram addresses
> will likely be contigous due to the buddy allocator.
>=20
> [1] https://patchwork.freedesktop.org/patch/588548/?series=3D132229&rev=
=3D1
>=20
> > +	struct xe_mem_region *mr;
> > +	struct xe_tile *tile;
> > +	struct xe_device *xe;
> > +	struct device *dev;
> > +	dma_addr_t dma_addr =3D 0;
> > +	struct dma_fence *fence;
> > +	struct page *host_page;
> > +	struct page *src_page;
> > +	u64 src_dpa;
> > +
> > +	src_page =3D migrate_pfn_to_page(src_pfn);
> > +	if (unlikely(!src_page || !(src_pfn & MIGRATE_PFN_MIGRATE)))
>=20
> I'm going to say this is a bug if !src_page ||
> !is_zone_device_page(src_page) || !(src_pfn & MIGRATE_PFN_MIGRATE) and
> we return -EFAULT (or another error code if that makes more sense). We
> are migrating from the device where we know we have backing store from
> the original fault.
>=20
> > +		return 0;
> > +
> > +	mr =3D xe_page_to_mem_region(src_page);
> > +	tile =3D xe_mem_region_to_tile(mr);
> > +	xe =3D tile_to_xe(tile);
> > +	dev =3D xe->drm.dev;
> > +
> > +	src_dpa =3D xe_mem_region_pfn_to_dpa(mr, src_pfn);
> > +	host_page =3D alloc_host_page(dev, vma, addr, &dma_addr, dst_pfn);
> > +	if (!host_page)
> > +		return -ENOMEM;
> > +
> > +	fence =3D xe_migrate_pa(tile->migrate, src_dpa, true,
> > +						dma_addr, false, PAGE_SIZE);
> > +	if (IS_ERR(fence)) {
> > +		dma_unmap_page(dev, dma_addr, PAGE_SIZE,
> DMA_FROM_DEVICE);
> > +		free_host_page(host_page);
> > +		return PTR_ERR(fence);
> > +	}
> > +
> > +	dma_fence_wait(fence, false);
>=20
> Even if we did want to migrate a page at a time, we only need to wait on
> the last fence due to the ordered nature of exec queues.
>=20
> > +	dma_fence_put(fence);
> > +	dma_unmap_page(dev, dma_addr, PAGE_SIZE, DMA_FROM_DEVICE);
>=20
> With above, will likely unmap all dma pages in a single function once
> the last fence is signaled.
>=20
> > +	return 1;
> > +}
> > +
> > +/**
> > + * xe_svm_migrate_to_sram() - Migrate memory back to sram on CPU page
> fault
> > + *
> > + * @vmf: cpu vm fault structure, contains fault information such as vm=
a etc.
> > + *
> > + * Note, this is in CPU's vm fault handler, caller holds the mmap read=
 lock.
> > + *
> > + * This function migrate one gpu vma which contains the fault address =
to
> sram.
> > + * We try to maintain a 1:1 mapping b/t the CPU vma and gpu vma (i.e.,
> create one
> > + * gpu vma for one cpu vma initially and try not to split it). So this=
 scheme
> end
> > + * up migrate at the vma granularity. This might not be the best perfo=
rmant
> scheme
> > + *
> > + * This can be tunned with a migration granularity for  performance, f=
or
> example,
> > + * migration 2M for each CPU page fault, or let user specify how much =
to
> migrate.
> > + * This is more complex due to vma splitting.
> > + *
> > + * This function should also update GPU page table, so the fault virtu=
al
> address
> > + * points to the same sram location from GPU side. This is TBD.
> > + *
> > + * Return:
> > + * 0 on success
> > + * VM_FAULT_SIGBUS: failed to migrate page to system memory,
> application
> > + * will be signaled a SIGBUG
> > + */
> > +vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf)
> > +{
> > +	struct xe_mem_region *mr =3D xe_page_to_mem_region(vmf->page);
> > +	struct xe_tile *tile =3D xe_mem_region_to_tile(mr);
> > +	struct xe_device *xe =3D tile_to_xe(tile);
> > +	struct vm_area_struct *vma =3D vmf->vma;
> > +	struct mm_struct *mm =3D vma->vm_mm;
> > +	struct xe_svm *svm =3D xe_lookup_svm_by_mm(mm);
>=20
> I don't think this is needed... More below.
>=20
> > +	unsigned long addr =3D vma->vm_start;
> > +	u64 npages =3D vma_pages(vma);
> > +	struct xe_vma *xe_vma;
> > +	vm_fault_t ret =3D 0;
> > +	struct xe_vm *vm;
> > +	void *buf;
> > +	int i;
> > +
> > +	struct migrate_vma migrate_vma =3D {
> > +		.vma		=3D vmf->vma,
> > +		.start		=3D vma->vm_start,
> > +		.end		=3D vma->vm_end,
>=20
> So I know in my PoC I had the fault user pointer (xe_vma) =3D=3D struct
> vm_area_struct of the GPU fault. That is definitely wrong. We likely
> want to allocate sub-range of vm_area_struct for the xe_vma, we can call
> this a chunk size. Logical chunks sizes would be aligned 2MB, 64k, and
> finally 4k in sizes trying the largest first... The chunk sizes are
> trivial as we likely can just have table with values, the key here is
> the vm_area_struct vm_start / vm_end are not what we want to use here
> rather xe_vma_start(vma) and xe_vma_end(vma). I think we get the xe_vma
> from the faulting page vmf->page->zone_device_data field unless you have
> another use that field...

You are right. Such work is planned in the memory attributes part that Hima=
l is working on. We have a migration_granularity attribute which allow user=
 to set the chunk size.

>=20
> I also comment on my patch with my suggestion implement chunk sizes too.
>=20
> > +		.pgmap_owner	=3D xe,
>=20
> Again helper for this.
>=20
> > +		.flags		=3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > +		.fault_page =3D vmf->page,
> > +	};
> > +
> > +	buf =3D kvcalloc(npages, 2* sizeof(*migrate_vma.src), GFP_KERNEL);
> > +	migrate_vma.src =3D buf;
> > +	migrate_vma.dst =3D buf + npages;
> > +	if (migrate_vma_setup(&migrate_vma) < 0) {
> > +		ret =3D VM_FAULT_SIGBUS;
> > +		goto free_buf;
> > +	}
> > +
> > +	if (!migrate_vma.cpages)
>=20
> This is an error, need to set a return value.
>=20
> > +		goto free_buf;
> > +
>=20
> We probably should check migrate.cpages !=3D npages too as I also think
> this is an error.
>=20
> > +	for (i =3D 0; i < npages; i++) {
> > +		ret =3D migrate_page_vram_to_ram(vma, addr,
> migrate_vma.src[i],
> > +							migrate_vma.dst + i);
> > +		if (ret < 0) {
> > +			ret =3D VM_FAULT_SIGBUS;
> > +			break;
> > +		}
> > +
> > +		/** Migration has been successful, free source page */
> > +		if (ret =3D=3D 1) {
> > +			struct page *src_page =3D
> migrate_pfn_to_page(migrate_vma.src[i]);
> > +
> > +			xe_devm_page_free(src_page);
> > +		}
> > +
> > +		addr +=3D PAGE_SIZE;
> > +	}
>=20
> I touch on this above, this should be reworked to roughly:
>=20
> - alloc pages and populate migrate_vma.dst
> - dma map sram pages
> - migrate a chunk of contigous vram addresses at a time
> - wait on last dma fence from migrate
> - unmap dma pages
> - unlock and free all pages
>=20
> > +
> > +	xe_svm_for_each_vm(svm, vm) {
> > +		xe_assert(xe, vm->mm =3D=3D mm);
> > +		xe_vma =3D xe_vm_lookup_vma(vm, vmf->address);
> > +		if (xe_vma)
> > +			xe_vm_invalidate_vma(xe_vma);
> > +	}
>=20
> I've touched on why this isn't needed... I think one of these
> migrate_vma_* functions will trigger all MMU notifiers registered for
> the range. The notifier owns the invalidate then.

Very good point. Yes after read migrate_vma_setup function, I agree this fu=
nction will call mmu notifiers with MMU_NOTIFY_MIGRATE event. Today we inva=
lidate vma with this event. So yes, above codes are not needed.

I do identified one potential improvement: when mmu notifier is called back=
 with MMU_NOTIFY_MIGRATE event, if the migrate_vma_setup is called from the=
 gpu page fault path, we can ignore the gpu vma invalidation as we will upd=
ate gpu page table later after migration anyway. I think an page table inva=
lidation is not needed in such case. But this should be just a minor improv=
ement.


>=20
> Beyond this, maybe I'm confused about a few things and how this fits all
> together. Doesn't every user process have its own unique mm, fd, and vm
> (e.g. own address space)? If a user want a shared address space then use
> threads with a single mm, fd, and vm.

Yes, this is also my understanding. Each user process has its own mm struct=
 and device fds.=20

In a shared address space case, such as there are multiple pthread created =
through pthread_create in one process, all those pthreads should have diffe=
rent kernel task_struct, but all those task_struct (say we get it from "cur=
rent" macro) should share one same mm struct, which means they all lives in=
side one cpu address space.

Now with this work, we are now basically extending this shared cpu address =
space to gpu program. So both cpu program and gpu program can share one add=
ress space.

Since we allow user to create multiple gpu vm for one device (lets focus on=
 one device for now), so each shared address space can have multiple gpu vm=
... each gpuvm should be able to register its own mmu notifier to core mm, =
even if those notifier has the same address range. But I will have to test =
this out. If all this works, above codes are not needed. If different gpuvm=
 can't register mmu notifier for same address range, then we would need a f=
ix....


>=20
> So even if we had to resolve the xe_vma's here and do an invalidate here
> very confused what this is doing. This is this the case with multiple
> devices and each VM points to a different device?=20

Right now I only focus on single device. See above. This is to solve one gp=
u device but multiple gpu vm case. But as said above, for now I don't think=
 this is needed. I need to test more on the mmu notifier behavior: whether =
it allow us to insert two notifiers for the same range for one mm....

Oak

Again so that case I
> don't think a xe_svm structure would be needed, on GPU fault we should
> be to detect from the faulting page zone_device_data and pgmap owner
> if the fault already has a physical backing on another GPU and resolve
> how to map it into GPU with a fault... Jason suggests this in the
> following thread [2] and I think I agree with him.
>=20
> [2] https://lore.kernel.org/all/5495090e-dee1-4c8e-91bc-
> 240632fd3e35@amd.com/T/
>=20
> > +	migrate_vma_pages(&migrate_vma);
>=20
> This logic is going to change but ...
>=20
> On an error I think we only want to call migrate_vma_finalize to revert
> pages back to the original state (i.e. migrate_vma_pages commits the
> page changes which we don't want to do on an error).
>=20
> > +	migrate_vma_finalize(&migrate_vma);
> > +free_buf:
> > +	kvfree(buf);
> > +	return 0;
>=20
> I don't think 0 should blindly be return here, if there is an error
> return VM_FAULT_SIGBUS. We likely want a high level error message too.
>=20
> Matt
>=20
> > +}
> > --
> > 2.26.3
> >
