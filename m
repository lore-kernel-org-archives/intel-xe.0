Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEA8C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 20:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A92410E88A;
	Wed, 19 Feb 2025 20:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YK4uM4PR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D96310E88A
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 20:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739996361; x=1771532361;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jMH7+4Mpq6on3k87rw0axDK3HC/N27PlTCpx3KU1uu0=;
 b=YK4uM4PRqkYqk1Dh7g4ZUBq6br91PmdZXza5Hxa/fz6cgI6gMm24XqTC
 6QynmwhdNTsKyJ6SWxoTaW9/+k52o972CBhAvAm47sZur/sVKrFKrISIt
 DTDCVM5rYn74MSvS7Zff+gx6GGw0MFEvwhyiCVjq+VkmRoHiWYYoSUUqE
 wN2qEciCndMyDUooBIHNqMc0Z8kpcKNuOS5eU7G3Yrqxqg+xC9G3nhzUg
 oonknvg2wa7ZSQ8/ROup9RNZALvVbBvjCR8nJv5QcxquPqJAcKSO77gMA
 yHo91tQVLXYIzQfq4ezI1FgRJd2lYZ/r6/Gxjn23ZmPUAGLr5UsnFFz7T w==;
X-CSE-ConnectionGUID: 8m7eqV2QRbmR1Wvc5V1Umg==
X-CSE-MsgGUID: 9pHpcXi+SXGGXHjdAYQINQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="52160512"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="52160512"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 12:19:21 -0800
X-CSE-ConnectionGUID: wOXZVJmfQQSBcWexg3l7UA==
X-CSE-MsgGUID: NwIJ5tL3SsqV+XyOOGukCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="119920682"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2025 12:19:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Feb 2025 12:19:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Feb 2025 12:19:19 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 12:19:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvpreuzBv6OZIZZ3kdfUjBQCxP1qVrsrDvBvQ5BZPjsD0A/l+UpHo2/f4qOowrv4qbMR5PTRYiwonx1ZpR7K9nopKS9Y0v2qFTo3Jj4YnVyuryso2yIw50t70MSLIF7EyVVbAqQ0NRcUYCFPu51aC06TVSyx3uINhwMNK/YPHulflRi2sL+TcvlzIIvKFo0q0kk14oGuhn6w0uyjYxIoZliSTQdZO59d70UtRG07GjPaSsKROu74e1rh0qzLlixp8FE5ia7G/R2TnHzbgA9JCAxLEeN7aiwNzyuyQmHWDa9TZxBLxNKl/RFiqfTTH/75sxsYNv9SnLy3xf8Y2TRG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eyy+PY+65ugkhMJ6hwvQWLQOY8KPKF+K6VcrF5I9zPM=;
 b=R4jYQwNBw8P4GFQlmDDBDcbIgtYfXH7FsP3iVNlYFbzPA+gCXwxl9ggymesh6F+YHImZDFJ64dYfgH6j5asmGrtCTXGMqqgTTAojAHVEmBbW825wZacuJ9+HBK3nWxYzKC55jvjcEHnk4tnDjUucKl7JIGRrIsWNazrSYZ+QerA3mz0KRqr6SeZ4cZGZOTaLEhzBdG7K6zpS+fOYq+jWQd3RPhYtH2JM+Orss4cnqTrPpF3hzPVCGBCyH+7p+ub/9edvjGjR+s8/HukyRAUImZPtLvOSrDJeFNNDbjWirM8eBvzxua10DaEnFf4phnv6Scqmuqli2XVJz6REeH2SjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 by PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 20:19:10 +0000
Received: from MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf]) by MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf%5]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 20:19:10 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/3] drm/xe: Clear scratch page on vm_bind
Thread-Topic: [PATCH 2/3] drm/xe: Clear scratch page on vm_bind
Thread-Index: AQHbfbwiW0zKdWzmBUORLH9hu4aiD7NO8RoAgAAdjFA=
Date: Wed, 19 Feb 2025 20:19:10 +0000
Message-ID: <MN2PR11MB4728C3F81D6F795E5C08AACB92C52@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
 <20250213022331.265424-2-oak.zeng@intel.com>
 <Z7YZGEgvzjY5mjN5@lstrano-desk.jf.intel.com>
In-Reply-To: <Z7YZGEgvzjY5mjN5@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4728:EE_|PH0PR11MB7424:EE_
x-ms-office365-filtering-correlation-id: 8fe66a9c-dcd7-4aee-b96b-08dd5122ab99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yl00uTHgM6U1mJAXqUeCS7Ytmm1zKDEULHpuLpCY8qyyfGZN2gcAGgSCBOA3?=
 =?us-ascii?Q?exRVYAMYUGciu7XSDzP37iDFPLYF5kPtKkTN3VI93fvoduE8ClXpbrLdtyoc?=
 =?us-ascii?Q?euu1ohO6mjBsGX9S3yb0gMP8hVENjRFhrK9Y7uV7INUHPrG3eMS0Aaf5qo9/?=
 =?us-ascii?Q?kS4mWQQJKIUoEsuDL8H2mLJwhNPMklM+Wxqk4rOlDTu98/XryEzvxlFpwt7Z?=
 =?us-ascii?Q?5MqADMzAY+zzG9oGcfYO8p9MF6gwG+k07c9dW5oDzH9ERqHOfjP3eILlNv6I?=
 =?us-ascii?Q?gxIU+uO35ZaAb0cx8rT4DDFGW8DJhEzplrSO8fZ5LiK+uYWz3RT/vwZ7m9Vp?=
 =?us-ascii?Q?1dssq8zZO6geMZFs78F6zG5ahYve3CFOMimxY2dfOa80HEYcbAWtjmDgy8lE?=
 =?us-ascii?Q?PVRP1h5iA+p7WtLL6pkbhOxbP7HMFCHBVtQJpfFIDUlBPjy96bqTbzrf2x4Z?=
 =?us-ascii?Q?DasZ+p3493A6ioMUWsTGZzP1MrVlkuWR75lQj0jJpjGS0lv4SXBcsq/z4k31?=
 =?us-ascii?Q?REGPPeV9MBDdQ5mRW+TvRFrXQ0BtA9SrgBQJGOIo7JE6HrwVKIaVSKYQ6tFj?=
 =?us-ascii?Q?RNkC2OYioM6jqVw1g/rDbEu/+Tx2TzjI47uZD5q5Ov8n3XtD7X/g/SPsgJlF?=
 =?us-ascii?Q?j4MKLyBcW3C0QGDmwf1/CXT7LK4Fe5Els+O871TUIqsLbANg+iq3lKxUObBX?=
 =?us-ascii?Q?M+kRC6lAW0VveVVGiI3oWadtBdLbLPqLcX0PKc7NlUxIvEo6PadcjhYX0I8x?=
 =?us-ascii?Q?qpmWyDVoNVSKDYBP/Nd7MFrqlg0LcU6qrBRIzsRo6G/q7PZlbfdWxfGGm+7d?=
 =?us-ascii?Q?n3hVoVC3pweaw11ABY+PJxzFteFirbtvnS5OHxAgMiqBEyZ9DFB+cl7iMp6D?=
 =?us-ascii?Q?/KSvQQsdHS6IWEcA472DPJ/3emhlWzQq1+4e9fJynL2iMwwG/nGtiqT5ggtv?=
 =?us-ascii?Q?BT8AoFS0SKywhTxJ6Dsp0Evyqo5L3YONEN5s8xz703Qw9KPD6TXDzGWRBU7f?=
 =?us-ascii?Q?W865wCBgU0+l8EDvLZaytGm6pd8hpyJXEf0Rna7ZzcIC+f2FmFqAz9/Q16WM?=
 =?us-ascii?Q?Yr/gE9WfA3S3LA/yRQ/EqrFW4c1tuOmPPSsauCvlQQp/l5AGeDg8asVBKfZK?=
 =?us-ascii?Q?4qHx6ewvIxmOxizVsnAEtJDPpwhzxxt2FHk7PoJ07fJtXG0KyVirTS+09KIQ?=
 =?us-ascii?Q?BMlz50p5elFYRsF001r/lLTTVHzQ8JYG8uQ0o6sQBB0m/uRRkB0GXboot4Xa?=
 =?us-ascii?Q?DFDdoM3xpEml5jgLxCnDHH7KvYNu0tzXoHl244P2b+29+PzerxvSrOVQbu/c?=
 =?us-ascii?Q?snrxUqydTaLGXFs4GwxQFC6T5SCsiOl+tNAATCqk5xanwV8jlLIMV6earGkU?=
 =?us-ascii?Q?+rs6vVUDrCufkuojJCi7vihSQ1UeYrYiO0fgY3FpFbov36qvMvLyJD8WUXxQ?=
 =?us-ascii?Q?zDf1loJkB/mfDjpT0wCq/AhOI4cR9tAV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SDhyAQnRqwMNmG6UCY++QdAxn7MRa6ajcKowv3LPEAxFFx69tCLkpsGx+IrC?=
 =?us-ascii?Q?/SMMweIwzyh4F3YDeO5H3PupfB96DbX8DaeKnXudExmRG2JK/mThDJfMgkRC?=
 =?us-ascii?Q?Pes1zTnBKcOtWEnxE88XnEFIwHtZkCqm3JKCTD4MvL9cCRcgcfur3nuicDTm?=
 =?us-ascii?Q?wYcHChjiD8yigO3lUcrZVxlZ57QROOaZLZK0g4jWPcR+c4RfiKFEUcl2HaXd?=
 =?us-ascii?Q?fSxPj17m69z7bnamU3mv2/SAXRInFi7OFhX2qWeb0nMTz8r9q2gRbm+5fVCh?=
 =?us-ascii?Q?rtlGJtltDEMEBdu3NmYcTNqSRZ5tG9KsKo593y/ir8vqUf4E5hGdnymjp9ng?=
 =?us-ascii?Q?s1JbRgxKqfhT280dCNSgua8xctz51X5wPy9eSrBjaZUZxtqmapsBGp2F801p?=
 =?us-ascii?Q?Yqt1VX8TXBlrRUM7GS8Rm5DODCe+GFNfUHwgW2O0gP++q2SyLLa+xbySLzuv?=
 =?us-ascii?Q?qPNg1xYG3qixWEep+7Q5E+BOFXpVr7nfGX/gyahUE4ywy8PeBOcBrQd5qELv?=
 =?us-ascii?Q?r6+rbMZGPGm2N4Cz6W75Ofj0dJOYrDYOT67TusAUp6REwu+wah5tmpnXpWzj?=
 =?us-ascii?Q?+uSbrk4oAlJw+P1t2XrnfanrSUejg0OVIL3Wgv2MOjSbOn8B8Z1sSvfrI7B/?=
 =?us-ascii?Q?GvYaqUV1pTrR9DwbhuP99rsvLrQhDBfa7bO705b/hXZCurXab4Fp7ovQjLKM?=
 =?us-ascii?Q?Pbo7CgcRNWogzzIXNwEo55wJK/BFEb1bZPouIcGecCXELKBCnvnqSspbARYX?=
 =?us-ascii?Q?L1OqWMu9DsHYCY1RXHvjNHw3XMBuGNGp8iwqZ3QPc/F76yLWqAONsG3zu1eB?=
 =?us-ascii?Q?R/i+EogirfOLtXa1jzxZ5O1w7O0HpV82yB86YnsnkFKCc03s00x9aGFHxXxa?=
 =?us-ascii?Q?M0tN/POKpFojhXP0MBAltcz6w0Ot61cjRPgCj4jHO8fEZ+smrAFFjqZb3oeD?=
 =?us-ascii?Q?e1gcn8KfpGW5RhiFcCXXotF15GTsVVKqPoZy2eema8FgD48W3oIC+WhmXeAo?=
 =?us-ascii?Q?nZP5CTyIfroaU4fKCtIs8lVwbbgVNbC5oN9ITXQmum+V5IU2zd6QBr2zqnAu?=
 =?us-ascii?Q?78ahzoSqMedRD2S5WxNtJqyDIiXtEC2oI3oht6CDkxCk7MEdrVgBurZlkQzy?=
 =?us-ascii?Q?VeRujH+2d3A5nX+G0ioGMtiS/dGd/5hSgly4MBotBs1jFrJQ4k8OF3YDF6KO?=
 =?us-ascii?Q?L+puNq0u9wgq/eVpUko1ybj58SCWn80jOTIN35Mx6eGARxVDLxQXjT27UUED?=
 =?us-ascii?Q?2sDbiOYW68j6EodxEtSDl4s4fFpCvNHmEW/uHCM6LK4tlcjMXwmxrCzxgry9?=
 =?us-ascii?Q?WKZaIBA87shLSk3hEyBY8ktTEk7v90I9yupK5lvtirPsmvGRo0vVIAVsSX2d?=
 =?us-ascii?Q?QMxxjVBX7Qd1SWlQZVXrAFSNI+EpiimjNIDHswcIedE20AKdPfIiBFh9bbOW?=
 =?us-ascii?Q?hRB0Z7NvnFMJ0lGGOmtcHdBvfbmRUcXZaz6gem1JUaRecyEUnxwPV3wnlSxA?=
 =?us-ascii?Q?kotPVQ1bTFiXxMgpqgd8Sq0FA+2fwg/vPBwu2SQUK/FBP/m+30Ev9dSv/z8U?=
 =?us-ascii?Q?ssNGRg3nXb+zjs4mWD4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe66a9c-dcd7-4aee-b96b-08dd5122ab99
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 20:19:10.5961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MylTvmUkImxXHEsfsfvigEaRcSBB/udh1kDji/yYYsnmgmi3G+iktddV98Ffv27Ejo+oHeBP5RRFNsIcShsKuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
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
> Sent: February 19, 2025 12:47 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org;
> Thomas.Hellstrom@linux.intel.com; Cavitt, Jonathan
> <jonathan.cavitt@intel.com>
> Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page on vm_bind
>=20
> On Wed, Feb 12, 2025 at 09:23:30PM -0500, Oak Zeng wrote:
> > When a vm runs under fault mode, if scratch page is enabled, we
> need
> > to clear the scratch page mapping on vm_bind for the vm_bind
> address
> > range. Under fault mode, we depend on recoverable page fault to
> > establish mapping in page table. If scratch page is not cleared, GPU
> > access of address won't cause page fault because it always hits the
> > existing scratch page mapping.
> >
> > When vm_bind with IMMEDIATE flag, there is no need of clearing as
> > immediate bind can overwrite the scratch page mapping.
> >
> > So far only is xe2 and xe3 products are allowed to enable scratch
> page
> > under fault mode. On other platform we don't allow scratch page
> under
> > fault mode, so no need of such clearing.
> >
> > v2: Rework vm_bind pipeline to clear scratch page mapping. This is
> similar
> > to a map operation, with the exception that PTEs are cleared
> instead of
> > pointing to valid physical pages. (Matt, Thomas)
> >
> > TLB invalidation is needed after clear scratch page mapping as larger
> > scratch page mapping could be backed by physical page and cached
> in
> > TLB. (Matt, Thomas)
> >
> > v3: Fix the case of clearing huge pte (Thomas)
> >
> > Improve commit message (Thomas)
> >
> > v4: TLB invalidation on all LR cases, not only the clear on bind
> > cases (Thomas)
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c       | 53
> ++++++++++++++++++++++++--------
> >  drivers/gpu/drm/xe/xe_pt_types.h |  2 ++
> >  drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++++++++---
> >  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
> >  4 files changed, 70 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> b/drivers/gpu/drm/xe/xe_pt.c
> > index 1ddcc7e79a93..319769056893 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
> >  	 * granularity.
> >  	 */
> >  	bool needs_64K;
> > +	/* @clear_pt: clear page table entries during the bind walk */
> > +	bool clear_pt;
> >  	/**
> >  	 * @vma: VMA being mapped
> >  	 */
> > @@ -415,6 +417,10 @@ static bool xe_pt_hugepte_possible(u64
> addr, u64 next, unsigned int level,
> >  	if (xe_vma_is_null(xe_walk->vma))
> >  		return true;
> >
> > +	/* if we are clearing page table, no dma addresses*/
> > +	if (xe_walk->clear_pt)
> > +		return true;
> > +
> >  	/* Is the DMA address huge PTE size aligned? */
> >  	size =3D next - addr;
> >  	dma =3D addr - xe_walk->va_curs_start +
> xe_res_dma(xe_walk->curs);
> > @@ -497,16 +503,19 @@ xe_pt_stage_bind_entry(struct xe_ptw
> *parent, pgoff_t offset,
> >
> >  		XE_WARN_ON(xe_walk->va_curs_start !=3D addr);
> >
> > -		pte =3D vm->pt_ops->pte_encode_vma(is_null ? 0 :
> > -						 xe_res_dma(curs) +
> xe_walk->dma_offset,
> > -						 xe_walk->vma,
> pat_index, level);
> > +		pte =3D vm->pt_ops->pte_encode_vma(is_null ||
> xe_walk->clear_pt ?
> > +				0 : xe_res_dma(curs) + xe_walk-
> >dma_offset,
> > +				xe_walk->vma, pat_index, level);
> >  		pte |=3D xe_walk->default_pte;
> >
> > +		if (xe_walk->clear_pt)
> > +			pte =3D 0;
>=20
> Is there a way to move this clear to later in the pipeline? e.g. At the
> step which actually programs the page tables via a GPU job or the CPU?

Isn't the design here generate all the page table entries in this stage_bin=
d stage,
And actual programming of page table using cpu/gpu just focus on writing th=
e
Page table entries to the actual page table? From this perspective, it is m=
ore
Natural to set the entries to 0 here for clear_pt case.

Of cause you can do it later, but it is at the cost of sacrifice the design=
.


> I
> ask as I think our userptr code is broken for invalidations which could
> hook into clearing to fix this.=20

Can you elaborate how the userptr invalidation is broken? Is it broken by t=
his patch?
I don't follow here. As I understand it, the userptr invalidation doesn't g=
o to this=20
Stage_bind function. It goes to xe_pt_zap_ptes. So I don't follow how userp=
tr invalidate
Is broken...

Oak =20


Also I think prefetch for SVM could also
> make use of this too.
>=20
> I believe for this use case this patch is correct though.
>=20
> Matt
>=20
> > +
> >  		/*
> >  		 * Set the XE_PTE_PS64 hint if possible, otherwise if
> >  		 * this device *requires* 64K PTE size for VRAM, fail.
> >  		 */
> > -		if (level =3D=3D 0 && !xe_parent->is_compact) {
> > +		if (level =3D=3D 0 && !xe_parent->is_compact
> && !xe_walk->clear_pt) {
> >  			if (xe_pt_is_pte_ps64K(addr, next, xe_walk))
> {
> >  				xe_walk->vma->gpuva.flags |=3D
> XE_VMA_PTE_64K;
> >  				pte |=3D XE_PTE_PS64;
> > @@ -519,7 +528,7 @@ xe_pt_stage_bind_entry(struct xe_ptw
> *parent, pgoff_t offset,
> >  		if (unlikely(ret))
> >  			return ret;
> >
> > -		if (!is_null)
> > +		if (!is_null && !xe_walk->clear_pt)
> >  			xe_res_next(curs, next - addr);
> >  		xe_walk->va_curs_start =3D next;
> >  		xe_walk->vma->gpuva.flags |=3D (XE_VMA_PTE_4K <<
> level);
> > @@ -589,6 +598,7 @@ static const struct xe_pt_walk_ops
> xe_pt_stage_bind_ops =3D {
> >   * @vma: The vma indicating the address range.
> >   * @entries: Storage for the update entries used for connecting the
> tree to
> >   * the main tree at commit time.
> > + * @clear_pt: Clear the page table entries.
> >   * @num_entries: On output contains the number of @entries
> used.
> >   *
> >   * This function builds a disconnected page-table tree for a given
> address
> > @@ -602,7 +612,8 @@ static const struct xe_pt_walk_ops
> xe_pt_stage_bind_ops =3D {
> >   */
> >  static int
> >  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> > -		 struct xe_vm_pgtable_update *entries, u32
> *num_entries)
> > +		 struct xe_vm_pgtable_update *entries,
> > +		 bool clear_pt, u32 *num_entries)
> >  {
> >  	struct xe_device *xe =3D tile_to_xe(tile);
> >  	struct xe_bo *bo =3D xe_vma_bo(vma);
> > @@ -622,10 +633,19 @@ xe_pt_stage_bind(struct xe_tile *tile,
> struct xe_vma *vma,
> >  		.vma =3D vma,
> >  		.wupd.entries =3D entries,
> >  		.needs_64K =3D (xe_vma_vm(vma)->flags &
> XE_VM_FLAG_64K) && is_devmem,
> > +		.clear_pt =3D clear_pt,
> >  	};
> >  	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile->id];
> >  	int ret;
> >
> > +	if (clear_pt) {
> > +		ret =3D xe_pt_walk_range(&pt->base, pt->level,
> xe_vma_start(vma),
> > +				       xe_vma_end(vma),
> &xe_walk.base);
> > +
> > +		*num_entries =3D xe_walk.wupd.num_used_entries;
> > +		return ret;
> > +	}
> > +
> >  	/**
> >  	 * Default atomic expectations for different allocation
> scenarios are as follows:
> >  	 *
> > @@ -981,12 +1001,14 @@ static void xe_pt_free_bind(struct
> xe_vm_pgtable_update *entries,
> >
> >  static int
> >  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> > -		   struct xe_vm_pgtable_update *entries, u32
> *num_entries)
> > +		   struct xe_vm_pgtable_update *entries,
> > +		   bool invalidate_on_bind, u32 *num_entries)
> >  {
> >  	int err;
> >
> >  	*num_entries =3D 0;
> > -	err =3D xe_pt_stage_bind(tile, vma, entries, num_entries);
> > +	err =3D xe_pt_stage_bind(tile, vma, entries, invalidate_on_bind,
> > +			       num_entries);
> >  	if (!err)
> >  		xe_tile_assert(tile, *num_entries);
> >
> > @@ -1661,6 +1683,7 @@ static int bind_op_prepare(struct xe_vm
> *vm, struct xe_tile *tile,
> >  		return err;
> >
> >  	err =3D xe_pt_prepare_bind(tile, vma, pt_op->entries,
> > +				 pt_update_ops->invalidate_on_bind,
> >  				 &pt_op->num_entries);
> >  	if (!err) {
> >  		xe_tile_assert(tile, pt_op->num_entries <=3D
> > @@ -1681,11 +1704,11 @@ static int bind_op_prepare(struct
> xe_vm *vm, struct xe_tile *tile,
> >  		 * If !rebind, and scratch enabled VMs, there is a
> chance the scratch
> >  		 * PTE is already cached in the TLB so it needs to be
> invalidated.
> >  		 * On !LR VMs this is done in the ring ops preceding a
> batch, but on
> > -		 * non-faulting LR, in particular on user-space batch
> buffer chaining,
> > -		 * it needs to be done here.
> > +		 * LR, in particular on user-space batch buffer chaining,
> it needs to
> > +		 * be done here.
> >  		 */
> >  		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> > -		     xe_vm_in_preempt_fence_mode(vm)))
> > +		     xe_vm_in_lr_mode(vm)))
> >  			pt_update_ops->needs_invalidation =3D true;
> >  		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
> >  			/* We bump also if batch_invalidate_tlb is
> true */
> > @@ -1759,9 +1782,13 @@ static int op_prepare(struct xe_vm *vm,
> >
> >  	switch (op->base.op) {
> >  	case DRM_GPUVA_OP_MAP:
> > -		if (!op->map.immediate &&
> xe_vm_in_fault_mode(vm))
> > +		if (!op->map.immediate &&
> xe_vm_in_fault_mode(vm) &&
> > +		    !op->map.invalidate_on_bind)
> >  			break;
> >
> > +		if (op->map.invalidate_on_bind)
> > +			pt_update_ops->invalidate_on_bind =3D true;
> > +
> >  		err =3D bind_op_prepare(vm, tile, pt_update_ops, op-
> >map.vma);
> >  		pt_update_ops->wait_vm_kernel =3D true;
> >  		break;
> > @@ -1871,6 +1898,8 @@ static void bind_op_commit(struct xe_vm
> *vm, struct xe_tile *tile,
> >  	}
> >  	vma->tile_present |=3D BIT(tile->id);
> >  	vma->tile_staged &=3D ~BIT(tile->id);
> > +	if (pt_update_ops->invalidate_on_bind)
> > +		vma->tile_invalidated |=3D BIT(tile->id);
> >  	if (xe_vma_is_userptr(vma)) {
> >  		lockdep_assert_held_read(&vm-
> >userptr.notifier_lock);
> >  		to_userptr_vma(vma)->userptr.initial_bind =3D true;
> > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> b/drivers/gpu/drm/xe/xe_pt_types.h
> > index 384cc04de719..3d0aa2a5102e 100644
> > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > @@ -108,6 +108,8 @@ struct xe_vm_pgtable_update_ops {
> >  	bool needs_userptr_lock;
> >  	/** @needs_invalidation: Needs invalidation */
> >  	bool needs_invalidation;
> > +	/** @invalidate_on_bind: Invalidate the range before bind */
> > +	bool invalidate_on_bind;
> >  	/**
> >  	 * @wait_vm_bookkeep: PT operations need to wait until VM
> is idle
> >  	 * (bookkeep dma-resv slots are idle) and stage all future VM
> activity
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> b/drivers/gpu/drm/xe/xe_vm.c
> > index d664f2e418b2..813d893d9b63 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1921,6 +1921,23 @@ static void print_op(struct xe_device *xe,
> struct drm_gpuva_op *op)
> >  }
> >  #endif
> >
> > +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm
> *vm, u32 bind_flags)
> > +{
> > +	if (!xe_vm_in_fault_mode(vm))
> > +		return false;
> > +
> > +	if (!NEEDS_SCRATCH(vm->xe))
> > +		return false;
> > +
> > +	if (!xe_vm_has_scratch(vm))
> > +		return false;
> > +
> > +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> >  /*
> >   * Create operations list from IOCTL arguments, setup operations
> fields so parse
> >   * and commit steps are decoupled from IOCTL arguments. This
> step can fail.
> > @@ -1991,6 +2008,8 @@ vm_bind_ioctl_ops_create(struct xe_vm
> *vm, struct xe_bo *bo,
> >  			op->map.is_null =3D flags &
> DRM_XE_VM_BIND_FLAG_NULL;
> >  			op->map.dumpable =3D flags &
> DRM_XE_VM_BIND_FLAG_DUMPABLE;
> >  			op->map.pat_index =3D pat_index;
> > +			op->map.invalidate_on_bind =3D
> > +
> 	__xe_vm_needs_clear_scratch_pages(vm, flags);
> >  		} else if (__op->op =3D=3D DRM_GPUVA_OP_PREFETCH) {
> >  			op->prefetch.region =3D prefetch_region;
> >  		}
> > @@ -2188,7 +2207,8 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> >  				return PTR_ERR(vma);
> >
> >  			op->map.vma =3D vma;
> > -			if (op->map.immediate
> || !xe_vm_in_fault_mode(vm))
> > +			if (op->map.immediate
> || !xe_vm_in_fault_mode(vm) ||
> > +			    op->map.invalidate_on_bind)
> >
> 	xe_vma_ops_incr_pt_update_ops(vops,
> >  							      op-
> >tile_mask);
> >  			break;
> > @@ -2416,9 +2436,10 @@ static int op_lock_and_prep(struct
> drm_exec *exec, struct xe_vm *vm,
> >
> >  	switch (op->base.op) {
> >  	case DRM_GPUVA_OP_MAP:
> > -		err =3D vma_lock_and_validate(exec, op->map.vma,
> > -					    !xe_vm_in_fault_mode(vm)
> ||
> > -					    op->map.immediate);
> > +		if (!op->map.invalidate_on_bind)
> > +			err =3D vma_lock_and_validate(exec, op-
> >map.vma,
> > +
> 	    !xe_vm_in_fault_mode(vm) ||
> > +						    op-
> >map.immediate);
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> >  		err =3D check_ufence(gpuva_to_vma(op-
> >base.remap.unmap->va));
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 52467b9b5348..dace04f4ea5e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -297,6 +297,8 @@ struct xe_vma_op_map {
> >  	bool is_null;
> >  	/** @dumpable: whether BO is dumped on GPU hang */
> >  	bool dumpable;
> > +	/** @invalidate: invalidate the VMA before bind */
> > +	bool invalidate_on_bind;
> >  	/** @pat_index: The pat index to use for this operation. */
> >  	u16 pat_index;
> >  };
> > --
> > 2.26.3
> >
