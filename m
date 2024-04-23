Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70823C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 03:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9EE10F96E;
	Tue, 23 Apr 2024 03:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6Q2Ha5O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D4710F749
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 03:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713842253; x=1745378253;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ODiDt9dLvpnegONDuF7fXeY95bg2JIMPp5zzWsVNHy8=;
 b=K6Q2Ha5OtdfdnMjcs5/rNACpmg0HlhKixB1q7zq8TUQ6FpJ8zikCKVBP
 JN1/LaAQ/0quxmOeWznxImgco33TNwxtgFQg0/kVxi6/ug6TB1jSe5Kla
 oKiGQeoItoNURQA+83FAtP9Cntv2ZTnPVkkDuepKJGmdwbszVbPIXrX1B
 FXv3w6HGOr0rLir72YS9HAYTAaGclxbRZx1x1ZgK1c6nNdp44i18Hz65a
 iFoitbBt2WbCJnGZCJJRs0I/wNSVsbc76GYcGCCOnDHBV1otIbfZJ0QsQ
 0Pt3wLtArpiM3OrYPGwEOJqFqUycp+WLUVDq5ZGpRYcxroG2DZUQ69BVk w==;
X-CSE-ConnectionGUID: 4gqyhAX6QKe3+fCeKk3XoA==
X-CSE-MsgGUID: ADy3GWJWTWi26rfXswVbVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9283637"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9283637"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 20:17:31 -0700
X-CSE-ConnectionGUID: U9zJmYvAQYatbcomauTOxQ==
X-CSE-MsgGUID: A3n/N9QBR6iyrJ54N2MSNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="61674096"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 20:17:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 20:17:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 20:17:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 20:17:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 20:17:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nppUu9ucT+GU7EvifZyzOme5lBNNsUfH81ZFj+AZu3SCgPn2Ef0jVh4A/hNyQuIio4bU4t/xbj7aXVBCNAfznb6rPZR5zSDZ+YBczvAby3tnv2ShS8fD4jV4Xv5XUf57B75ThEGbF04b/KPETe4NFcUpA+/8xraB9WesAwV84tpwxdvXXU2Ui6vF43yuO2mIiqhIzlg1hE78bCrGr3RQZNgEMv3DpQW+JofUHHyBDsmuo+c/cIACk9VhVFJOs30DrnwvCUy22kAbXUZcqiLaQ7RVSqHRr5Re1pteHn495rBMFOe+7fCtlwQJyEyWnus8BxBddU/5Qa88y3ZKxWwfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73RRS1HiefXMT9HJ96LEkIG3Fi2BIVe9rnf+OblSmcg=;
 b=ALQJ7xeiKwyyVdoK26xjp3AmsWrlVl7f5q4oLkMp3rJsAzXTnGJqF8zM7WIEnN3pStUwO9h8tkhq/4V0V5cj5FqhUWm4BK/ZcPXlNsuZtYKEDcBieyQI09kiTc9iyF2nPHgbPvvN8R4SrWBPRrsKryamu8Lr3xXtWQ0uDnquZGrE+sfoOoMSSuu39aOIGjAWHnvO5jN5NEHy/R94HldMZcDEyID0Oe8PqOomrsIXQPb3m8K4d/8sklj+47jVIxFNU0yjXWXRXTBIqsN4lX9Guxpy1x/xPRyXlvdC6pz/tsEJuSJmrCrbB1kdMypL6p7raJEe8AKWqW2lnWy+k+Q1sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 03:17:25 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 03:17:25 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 05/13] drm/xe: Use xe_vma_ops to implement xe_vm_rebind
Thread-Topic: [PATCH 05/13] drm/xe: Use xe_vma_ops to implement xe_vm_rebind
Thread-Index: AQHaiwm2vy3hET/BjEeusMhbYXbvSrFu/1DQgAAKtYCABjkVIA==
Date: Tue, 23 Apr 2024 03:17:25 +0000
Message-ID: <SA1PR11MB6991A32A2B42FEB231AC146292112@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-6-matthew.brost@intel.com>
 <SA1PR11MB699140DE94F7D680AADD7A3E920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZiHvm7C6I9n5XoG6@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZiHvm7C6I9n5XoG6@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|LV2PR11MB6070:EE_
x-ms-office365-filtering-correlation-id: 10a901b6-1483-4282-aca6-08dc6343e617
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?SbxmYhsD2F3vYOwahGzxOdUKjTdSTdVoOjm/KrmC1smA/RLO6YpyDZQ6+hgZ?=
 =?us-ascii?Q?Xs/oZNQTHVaLOGsq9mEo1hPaPDaebh26kAH2eHeCNujDx4f+QefTSdOPTF+p?=
 =?us-ascii?Q?ruSqB5Hm4tyQjgXorBR7Gk+M6nA0aV7qkWi34dUVj4VhMk577A5KITHrhn52?=
 =?us-ascii?Q?7otUodmiWlpwOLXSvf0eWdlfE5Yd9lZKPAuPNnLNESYIRrow/FBiqHYofWLQ?=
 =?us-ascii?Q?LeWcKaqJ0jl9tVFtKXCXXJ6Fvj5bDSHfktLZKidgOVjk5ihV96MGxo6SfLzC?=
 =?us-ascii?Q?WxtAtnfZfm9R1ybkWkq7oLOR0CHX712GjO7MpzMw3U1nowsk29b6PEvsm8Bg?=
 =?us-ascii?Q?/E4ofPOV/wtq7WseD6AhXKcua/RoRZeWxamh6JnZDATRvH7Bp4/jOOnHted4?=
 =?us-ascii?Q?G05iJRPTf0Ev+r3CPYuIiXAnwFWHQRaUya2qz4kwpOqi88CwOvjWXWbuPGy4?=
 =?us-ascii?Q?5HI9+/h6J8M/tHp9nZ5HyxuQefbdqh5WeN7DVAENyNaU2aDvUtDHhVztNIO4?=
 =?us-ascii?Q?h28JxLXWSFRrVL5STflylDfXbfNbDiD9ZGFaUlis0gpouvxTNhGngNqIONpf?=
 =?us-ascii?Q?8hKD6mNkTqQbvYc9mMErzfS4LXbSUb+9pj1YtiFktpCidskfvyXs410n2cz1?=
 =?us-ascii?Q?oVwFExhgntviTVb0DCdNYL3ajHgCr9j2U3pFIdzSSU6A0WWG0nHazH+E3sJo?=
 =?us-ascii?Q?yceJx8xu7g2ru2iXWeRF3K/SiPcCAi5F9GoTjVFXW9IRtl/kvT4H1u5OCo3/?=
 =?us-ascii?Q?LW+p3bQjZUvZYsrzqMUkX8lfY5+cxnOfySykuA9kBCf2CbEgZPOymx4+mWIj?=
 =?us-ascii?Q?FEKWlzn2pPqgrt/jF3OLPBYzQDMyYEQrHdT0HwPyHHfPOLo/roaLJv3QiQ36?=
 =?us-ascii?Q?o8OEoMByZPfpp5zwEASKlHg8OUBKY6t/wFI2vHi0Rhw4H3iUIgvovnDPoGCL?=
 =?us-ascii?Q?+DGcgb93KcX90Yhj9oqrP2wR+aA5qUkSZx6XDxT4xl1R3of1+IvtOQASoVUQ?=
 =?us-ascii?Q?JpFmrJ7LCyBmUEno7w7TNOQajC3WlJLGJwpywC+Bt9zV/w02ZkRhafHICpS8?=
 =?us-ascii?Q?8f5Wpk9aQ/XESBlhZAbT+xM8vMfbu7u3xkz+2+J7RXC0nj0ZRmaZtY8C/rSx?=
 =?us-ascii?Q?4X0qnYoRF3JxfIafcomsQKfnOYr6AV84GamryqpXoc6hk43tXyjiIubbsfGB?=
 =?us-ascii?Q?1jeQJOs/BWm0qzNN/zqBHm7ctFMc3gx7diT3vxn+mRXCW7e6TTHQsiqdDi/8?=
 =?us-ascii?Q?DmGAweSDkpRe7HWPBneQTB1YW92sjRlKhi1o4Vo32vlN7buSGtcXuIW4p3Qr?=
 =?us-ascii?Q?eEL0/6eJyfMGtrrJ5IqNqj794hEnecaZz+tCTeCC/xxU8g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0ySuhpJc9aLd6Kl4I1yrEl2+pgpQOtifuSrS36GFz6hmdTDPtlTbqCat15V1?=
 =?us-ascii?Q?GbBmfWk2RiJ/CoNVQf58cfacyAs8iAuOhbUBtBwW38kHt6LFoLxNN1QxEd8j?=
 =?us-ascii?Q?SDnDhPzj0rry1P+sAGfZEUxAeBcceEO0Dl71IwIjDnUmiE8Tty1qKfYsAPLO?=
 =?us-ascii?Q?l+DkLypMQka/sUzKPysgYBtd155g+nkKcViEDk6clUIy/Y6++kivXGgT5QRs?=
 =?us-ascii?Q?kr65CNiiXjnQoyWG7m7QbDBThzinDX9L30l2CvmNzskmacdJWfaro0QNox3h?=
 =?us-ascii?Q?fxGt4Pf8/gZaeU8vdg60piShsTWjaT7/3TshNaeowuRjrzy1WhKzfvhkobUa?=
 =?us-ascii?Q?Dtu/VudtVll0hKGr2GE8tjdoWbfcz5gqErjaPnCeBfGkXr0zeHmddVgG7zvg?=
 =?us-ascii?Q?TEY0XWrhDSc1Vhwy0O0aJUZcPrThqOw0I61/onvc+ca758sULWrAZddBMPDn?=
 =?us-ascii?Q?UlUmT56uqT041O80n/lLNMSeyx55mdQ2FofR6Aw5h2gcuEOHWPW7xd/LaRdt?=
 =?us-ascii?Q?tt81dhOsMKQN6oXQgnzxmPqXnb/09VMioJdWgNFGbSTdenTrXUZtpiYzy2t1?=
 =?us-ascii?Q?j5iTi+rdz5v9QJtaOszXUJViAHXCMP1ESS50wVt5IWYGLDFPaju75LHtNffk?=
 =?us-ascii?Q?aUrT1eh01Ybv4nmS6VaTExvjnlBAEPVROD/DpImCrEvONIA3rPN2Q1Hl+qz+?=
 =?us-ascii?Q?M/bDcxq6qLUB28Khu2EjVswp+Upbmc4VZzHWHjcFPAHFeEOnPQIC0IxLlAQ4?=
 =?us-ascii?Q?3BHOGwuhtDfw04S6i/2VeEtrgaaAYleux53yQ6BvYEUWHxGKgv8euLjp+OlE?=
 =?us-ascii?Q?S9m2FELsbxMgeDsQiUA9JO1q3tkBOqHybIaY6MbrQ5yacYt5EmoUKC9iwhBJ?=
 =?us-ascii?Q?TKr/I7kLGNvOJFX/wISMQx92iE6doMhAP1u94CeG3HmWOB3BrxttbTCE176v?=
 =?us-ascii?Q?iIe3nt82udUPG6omB70mSm7US1ITHLK/uf1kaPd3EMbkVEqfJeP2MamJ+gX6?=
 =?us-ascii?Q?qKUlwbHLMW/5uAQrV6PlTxUmOmrcVWbbAvH/JVV1TrHfRR9yJMUZFbeHdIkn?=
 =?us-ascii?Q?FN1v28MBwzxJUxSu+2Z/2NbZd8SWt645DAeIpCn/T/44z7QDjmXWXQ6yOX1M?=
 =?us-ascii?Q?LMBf6K6DZVciGsX486SsrdZD5XQiFYGulf8GAz9mNZBzixpvIjrcbaSTzmKl?=
 =?us-ascii?Q?usf+yu9Ur6FT6NVmYrJNy65gPRcpbMQypoP8a+gbQls5w0VnvHYvhMJXsc32?=
 =?us-ascii?Q?G13MzfO/4ZA+KrneMJB24XBYc+xRSAtTEB3ppJHbByCB+C6Jy9No9sCHS0s7?=
 =?us-ascii?Q?rqmU3NwFhnlePLVMZodkBg42LDVkDbCK889qJvSQSb56tK17EqTfGNgbLlXH?=
 =?us-ascii?Q?5M84YZ7Lv/v3hJRpxOSEGXbWZykAzGPer+ramueh6nJomL51WKaIK+h3HGsL?=
 =?us-ascii?Q?KttVBTNd7OfkNVizs5M/pEHPwANoED/Sky0V6S3cs0604X8su7x/Wa6nCcxt?=
 =?us-ascii?Q?8RpsTOYYarmYR7++WvZrtfQoNa4cVwtOBImM4sUu/cq7XMRKqtZRQVI7/2sf?=
 =?us-ascii?Q?Qr9uBVCBA6cjWc/0X5U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a901b6-1483-4282-aca6-08dc6343e617
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 03:17:25.3677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jWaFZ7YEOFyVfqOd29AcRLI0L7MExCAUpn1TSlKlR3DonADPJETiaQeOv2gkca1XamUNShG3FNkXneGSVXKPAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6070
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
> Sent: Friday, April 19, 2024 12:14 AM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH 05/13] drm/xe: Use xe_vma_ops to implement
> xe_vm_rebind
>=20
> On Thu, Apr 18, 2024 at 09:43:06PM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > Matthew Brost
> > > Sent: Wednesday, April 10, 2024 1:41 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Brost, Matthew <matthew.brost@intel.com>
> > > Subject: [PATCH 05/13] drm/xe: Use xe_vma_ops to implement
> > > xe_vm_rebind
> > >
> > > All page tables updates are moving to a xe_vma_ops interface to
> > > implement 1 job per VM bind IOCTL.
> >
> > Just want to make sure I understand it correctly. So far after this pat=
ch, the
> rebind is still many jobs (one job per vma), right?
> >
>=20
> Yes. A follow on series will convert to 1 job for all of the rebind list.
>=20
> >
> >  Convert xe_vm_rebind to use a
> > > xe_vma_ops based interface.
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 78
> +++++++++++++++++++++++++++++++-
> > > ------
> > >  1 file changed, 64 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 4cd485d5bc0a..9d82396cf5d5 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -811,37 +811,87 @@ int xe_vm_userptr_check_repin(struct xe_vm
> *vm)
> > >  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
> > >  }
> > >
> > > -static struct dma_fence *
> > > -xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> > > -	       struct xe_sync_entry *syncs, u32 num_syncs,
> > > -	       bool first_op, bool last_op);
> > > +static void xe_vm_populate_rebind(struct xe_vma_op *op, struct
> xe_vma
> > > *vma,
> > > +				  u8 tile_mask)
> > > +{
> > > +	INIT_LIST_HEAD(&op->link);
> > > +	op->base.op =3D DRM_GPUVA_OP_MAP;
> > > +	op->base.map.va.addr =3D vma->gpuva.va.addr;
> > > +	op->base.map.va.range =3D vma->gpuva.va.range;
> > > +	op->base.map.gem.obj =3D vma->gpuva.gem.obj;
> > > +	op->base.map.gem.offset =3D vma->gpuva.gem.offset;
> > > +	op->map.vma =3D vma;
> > > +	op->map.immediate =3D true;
> > > +	op->map.dumpable =3D vma->gpuva.flags & XE_VMA_DUMPABLE;
> > > +	op->map.is_null =3D xe_vma_is_null(vma);
> > > +}
> > > +
> > > +static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct
> xe_vma
> > > *vma,
> > > +				u8 tile_mask)
> > > +{
> > > +	struct xe_vma_op *op;
> > > +
> > > +	op =3D kzalloc(sizeof(*op), GFP_KERNEL);
> > > +	if (!op)
> > > +		return -ENOMEM;
> > > +
> > > +	xe_vm_populate_rebind(op, vma, tile_mask);
> > > +	list_add_tail(&op->link, &vops->list);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static struct dma_fence *ops_execute(struct xe_vm *vm,
> > > +				     struct xe_vma_ops *vops,
> > > +				     bool cleanup);
> > > +static void xe_vma_ops_init(struct xe_vma_ops *vops);
> > >
> > >  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> > >  {
> > >  	struct dma_fence *fence;
> > >  	struct xe_vma *vma, *next;
> > > +	struct xe_vma_ops vops;
> > > +	struct xe_vma_op *op, *next_op;
> > > +	int err;
> > >
> > >  	lockdep_assert_held(&vm->lock);
> > > -	if (xe_vm_in_lr_mode(vm) && !rebind_worker)
> > > +	if ((xe_vm_in_lr_mode(vm) && !rebind_worker) ||
> > > +	    list_empty(&vm->rebind_list))
> > >  		return 0;
> > >
> > > +	xe_vma_ops_init(&vops);
> > > +
> > >  	xe_vm_assert_held(vm);
> > > -	list_for_each_entry_safe(vma, next, &vm->rebind_list,
> > > -				 combined_links.rebind) {
> > > +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind)
> > > {
> > >  		xe_assert(vm->xe, vma->tile_present);
> > >
> > > -		list_del_init(&vma->combined_links.rebind);
> > >  		if (rebind_worker)
> > >  			trace_xe_vma_rebind_worker(vma);
> > >  		else
> > >  			trace_xe_vma_rebind_exec(vma);
> > > -		fence =3D xe_vm_bind_vma(vma, NULL, NULL, 0, false, false);
> > > -		if (IS_ERR(fence))
> > > -			return PTR_ERR(fence);
> > > +
> > > +		err =3D xe_vm_ops_add_rebind(&vops, vma,
> > > +					   vma->tile_present);
> > > +		if (err)
> > > +			goto free_ops;
> > > +	}
> > > +
> > > +	fence =3D ops_execute(vm, &vops, false);
> > > +	if (IS_ERR(fence)) {
> > > +		err =3D PTR_ERR(fence);
> >
> > So here, if above ops_execute partially succeed (some vma bind failed,
> some succeed), for those vmas which are successfully bound, it is kept in=
 the
> vm's rebind_list. Is this the correct behavior? Next time we will rebind =
them
> again....
> >
>=20
> The VM is killed if any VMA ops fails so it doesn't really matter, also
> it safe to issue a rebind twice.
>=20
> In the follow up series, once we have 1 job per the rebind list we can
> cope with errors and not kill the VM. In that case we must leave
> everything on the rebind list.
>=20
> So this patch is correct now and for the follow on series.

I see. Patch is:

Reviewed-by: Oak Zeng <oak.zeng@intel.com>


>=20
> Matt
>=20
> >
> > Oak
> >
> >
> > > +	} else {
> > >  		dma_fence_put(fence);
> > > +		list_for_each_entry_safe(vma, next, &vm->rebind_list,
> > > +					 combined_links.rebind)
> > > +			list_del_init(&vma->combined_links.rebind);
> > > +	}
> > > +free_ops:
> > > +	list_for_each_entry_safe(op, next_op, &vops.list, link) {
> > > +		list_del(&op->link);
> > > +		kfree(op);
> > >  	}
> > >
> > > -	return 0;
> > > +	return err;
> > >  }
> > >
> > >  static void xe_vma_free(struct xe_vma *vma)
> > > @@ -2516,7 +2566,7 @@ static struct dma_fence *op_execute(struct
> xe_vm
> > > *vm, struct xe_vma *vma,
> > >  {
> > >  	struct dma_fence *fence =3D NULL;
> > >
> > > -	lockdep_assert_held_write(&vm->lock);
> > > +	lockdep_assert_held(&vm->lock);
> > >
> > >  	xe_vm_assert_held(vm);
> > >  	xe_bo_assert_held(xe_vma_bo(vma));
> > > @@ -2635,7 +2685,7 @@ xe_vma_op_execute(struct xe_vm *vm, struct
> > > xe_vma_op *op)
> > >  {
> > >  	struct dma_fence *fence =3D ERR_PTR(-ENOMEM);
> > >
> > > -	lockdep_assert_held_write(&vm->lock);
> > > +	lockdep_assert_held(&vm->lock);
> > >
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > > --
> > > 2.34.1
> >
