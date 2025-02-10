Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E0FC02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 18:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4338E10E1F7;
	Mon, 10 Feb 2025 18:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWL2bIOh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C62910E1F7
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 18:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739211283; x=1770747283;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qcagHSjg4l/MBwf7An3A+k3Gvlf7m/yQdrYYPXe0T48=;
 b=hWL2bIOhG83t/VYhahfE+PHNCOelPn+dfGH4NQn5wZGwredX7tgHlkHn
 UtZw6ktx0pDx2KKyG5bTYk9TPK3pTzS8S5UsaSyuCghN52ub4UbswJ99E
 szJPegj+Oj3vX8oMU5XQDQkxtDpDZ9UNXxzFljHKcWxfHcu/imhBxKmPt
 9xppnu4BO1ceasHYquD2QtoAw1HE8wiyFxPyJKuBMPRbpHWSFll046P7Z
 Kb3c6aDLBj+e2W4m/M7e7eA2W3mFsVyBsjzn636L7O+r+EcxyO5IxEdCG
 oBpIi2f/O5Oax50BB4+GOVe/ZLzrvRqN8jRsgK83JYukz7lzMiLhqcSjs g==;
X-CSE-ConnectionGUID: wPLu1WN1Tc+2wm49agFj0Q==
X-CSE-MsgGUID: RwQeJqm0TG6vcyIZGvnlow==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="65158767"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="65158767"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:14:34 -0800
X-CSE-ConnectionGUID: d0b2q+DGQk6ho17MovVOCg==
X-CSE-MsgGUID: SlIonlwJTgqQqOFMviAcbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112220451"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 10:14:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:14:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:14:31 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:14:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bO6oIoSCz+UekjMtuhFbN5QXlUh/+nhxc60vqHt+psGiLMVSIB+mf+G953wH6UUJgOwc/+PFmtiOpM/Njf53HMK0lpbc/wFr48SIUB1dLWL61uqFHJgyROBS6ZDJ21mtod8dyCrDMKKeodOlRBt2U9uMdRSGY00zP3DMN6UaX0HDieiCT5IcC4yXonpFKCZDQX421DH++dCDlUQZKo+DP++luAYMfr7cL3zDYWiZYYYIb+0vbQtc4Ui5O6z88T9r3k/ZvcR5t0/azRLiOosyatuMXcYvbe4y3TLE80tyE2EpjovtThEUs9T0jG7KvlKodjBFRmp4oFvuoKTVdScRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hc4qUGZqciPO1wVcN2gso4i9+XLZxJ+GPKiiEIkYDy4=;
 b=mw4dNZZVzs1r3+8sLCt8c1im6QMY0NMkhSHNAL+0icv5N0/pBqqDxlPy+ZnrnjmDX0JK6g9RTJ9xxfeEJwAWezq4o7rs+t3423H5VoFUd7LjgcT/Vs/k8hZnDawlWYydNoSoCyAZ0Yf8e58+nPz6+6NZhNMYR5lWfVFyvXyAe249TjS5d5yTn6CSetPSG5eqNgpk4MQJ3mf+1TjkkYbHcv5tcUVhq3GO0aQJMPxFp4DJZ15JmTp1kNgf/HD5zppB7Vzq1N27wgUCeaKpUmfh5mSpfvwr89IqoytcPe9Vx32VxsL4W6hMEgthn0TXiys3WiQxrosu5rPUklcAe6a8lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB7438.namprd11.prod.outlook.com (2603:10b6:806:32b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 18:14:10 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:14:10 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Das, Nirmoy"
 <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2 2/2] drm/xe: Add a WARN_ON for NULL job in
 xe_sync_entry_signal
Thread-Topic: [PATCH v2 2/2] drm/xe: Add a WARN_ON for NULL job in
 xe_sync_entry_signal
Thread-Index: AQHaeVVpuVGcW9oJfkiSn3WuJBbdprNC2eJggAACcXA=
Date: Mon, 10 Feb 2025 18:14:10 +0000
Message-ID: <SJ1PR11MB6204901EA3778167D38E572281F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240318164342.3094-1-nirmoy.das@intel.com>
 <20240318164342.3094-2-nirmoy.das@intel.com>
 <SJ1PR11MB6204FD95B72316F43BF8FF7881F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6204FD95B72316F43BF8FF7881F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB7438:EE_
x-ms-office365-filtering-correlation-id: 101d6458-7288-48e6-e1ee-08dd49feb757
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5MTPA6PE/Okl09whCeeoyp06FN6oFzSXU3RU1hEjnTfw44jh7A2JB1szvKuy?=
 =?us-ascii?Q?0G76B/RSQpWQQ9bsmp5NUQ4UG7tdk7H2ErqnYyw4LhsNKf6wa7y+Bkx0bBSI?=
 =?us-ascii?Q?MqIubhQcvS6X/cPiiah8ham+p6BWQkhSQ4G1pLGN6XuxHSkaBR+v0WiPHPy0?=
 =?us-ascii?Q?gYM/CDalLGvSI84TdeqEwJT0tsGZrULEUGNWSIctsgskT4aX0uOVf5INLbIx?=
 =?us-ascii?Q?ZH/MdT/FO6YHJhyFXXIH7bIiSuEo6dqEz5cmlN6Rz65VerUxj+ZElxopWOF2?=
 =?us-ascii?Q?M4nbJf2dpIYwGmi0e1dD9hS+76xiUo0eNv5S7sFCTuv/ZlAHDtRL9O4pVqGx?=
 =?us-ascii?Q?znocqZAgsQMk2oq7sYku+Ws5VVUMAQ4+yp3pmualn1KnyBN+toREz9EXB0hB?=
 =?us-ascii?Q?X0p0z6+iwNprv+bTdP3pneDmCcV979Hg2tPuiVadhFQipiNrNR5L9D0dlACH?=
 =?us-ascii?Q?gMKt+Vjk3KzhU8y0hbSuQxP9d4rqibtvfvy8WC2jwpi0BJyOKh950ECU5ELL?=
 =?us-ascii?Q?cW0N5/XlZzdTHilGDdCyIjGGIO55KcbFGnjgIf1yrIoH1YsXz/exA7L3nzJb?=
 =?us-ascii?Q?qtDJcfTi6kG0+KPtCDYRczCAyEP8/TebVBHimVSvWoyoybhSyIg1ClULrqKv?=
 =?us-ascii?Q?tlkt9IojP/D5JZ7Qz/dQ9mwolRPqToQp3K5A7WRNnX2goMSISU2ptlf6zMGW?=
 =?us-ascii?Q?J+fBH2xsAL0xdRpq/hrHQLdRoT6qA92riTaEFVwiWUID8w6mc/P+Me5p6rTM?=
 =?us-ascii?Q?rpGgzG8STLVOS53yhT9YnN40jGgK2KM+fHrVqn5EbFFOWE56Ks+aVBFBspxN?=
 =?us-ascii?Q?DhxyJ93QECEGLJ++64iLbFB0qksH24Iapezd3eIcVY/NWw87CihB63L6J/Fz?=
 =?us-ascii?Q?kcS0G7AL7jq63FRfS5OM5EY03E+YCTspVrNfD1JaN9qhAraXyf3hf1zvyxE7?=
 =?us-ascii?Q?a+CXaiSc0s+yoVsYlD/UuRy8Ty9QDsOqmfbODFvGVgEjYDkKlQEHRlgl7xMo?=
 =?us-ascii?Q?kQzy1du3hpsqhEAg+vZJPF7TTqKtHZRAHVbDVS9ns9qynxOUByffUz6rZ9SP?=
 =?us-ascii?Q?fQjMrTJbxWlhq3LtrMt42SonbbovQJrJhTtJ1t9IoT1QOTk+qE5UKp8c9OiP?=
 =?us-ascii?Q?5V+KDF/C94Henk9TDaYF72CA2hjrAKwjJbFppnNLy+X+JBvVsJ02ARhF3rzd?=
 =?us-ascii?Q?va5RW9w9D/+okpwbKxh3U84BtA0SpmDX2hR991p4DOJEvFs2JjS1EAlgXz9z?=
 =?us-ascii?Q?Z7YJRVuAmPWTvqEN1bb3DoXdZtNEV26CKQD1jrRsWWvyf28qEBVMJitY+aRa?=
 =?us-ascii?Q?V3DxQMUEuXn5xHBP/fjcZ0GBfUdB/+pz8URaAueZSYEYu404WJX23hWUUVKh?=
 =?us-ascii?Q?y08zPCrvH8cubjsTWyc6gS8ebAmr9aABYMRRQlzeBqVuQLXne6tP8j10jNO0?=
 =?us-ascii?Q?rKyo2GGFy3MLBWeqxfn6PjCory/Oai21?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T3TEsKcnXdgos26P92KAgjZtUrveXY2K5pzl2VadC7lqflJyUcgEwXclT3yJ?=
 =?us-ascii?Q?l/ymJuuJQjfLKNTsVmHzJqz+1V+1Q2MAwWYkQXKfsNiRav6HFRu+Jbo8e8x8?=
 =?us-ascii?Q?SL3mPulEy8kcXK1FLS4BJ+MNs2MwZ2QfkZQotRbgLKdRr0uPA/F07BBA2p6k?=
 =?us-ascii?Q?3h7U+CSZKM8WGRsa5UVueAQehn3PCHCZMFtFIuabZ17b1oQZtL6f6CFVrIPi?=
 =?us-ascii?Q?c1ZaA7SUfni5/xNbSMtwWF//NQsX8ypA2jVoaaWqomWdXO+WZNcA02RPk799?=
 =?us-ascii?Q?V02SLda7qJoYUMsEjxe1FjzA3aeTOZk94l3ud0hbYZp4+aIvpFdab/si+q1U?=
 =?us-ascii?Q?BMbRFCsi+AgQVoPf8r1wEZ5G6A0oACwHMPCCUZDAo3qx4GI8fR9Hz0GJyW/1?=
 =?us-ascii?Q?oaz4+51GZeshcDRTaeaw36puPXR0OVGEL7IVu+ra/XUaz6l3DlkMWvhYmqGh?=
 =?us-ascii?Q?tZ5bCL3Lf/+s901xVFr/25FsqSaXkTOvYvqilBv/ptYZ3tKSz/wFXj6at603?=
 =?us-ascii?Q?2Fy1cUEqi57hhpqiJPMmSUuGvdD9myocQCk03ELnf5JKtcI9ILrGQltfSekT?=
 =?us-ascii?Q?lTfpjqqrv5biKoVT6UURnrgh4ZtUZ9l562UxbMbl/Jlsxg17Ysip9/hS2MYb?=
 =?us-ascii?Q?6xFAd9+TrJRirKZkY4fie3mygaJJ7UDA6dpU3jXQeOCdd3W/06KTBaSI+zEQ?=
 =?us-ascii?Q?AzYO4j/x68aT3KSwxLtqEYh7bmDKbIou3geiD984KMgJzMRlLiF0XVQo/EDu?=
 =?us-ascii?Q?zbk10SEmpjWp0p/zbPTNSLa1+4vzzbdjLBsbbKpQfxDzSD9omME18+bvUDXS?=
 =?us-ascii?Q?dMIEnhZOi0bSR9NoSPfXpFC31vi1t9J5Mbn/5ubtvDfVT1J+jS4WJAqXtL/w?=
 =?us-ascii?Q?H2VXnqLICFuHMxOnOPOu43wVe9w1Huw7eFAYeYta7jpzG42FZzEXDMYVFxWy?=
 =?us-ascii?Q?xQJEiJF/ItePlS5TChFObOgj+Ha3icojo2W+gH7a+mzgdEqWMBsWz8phXCAA?=
 =?us-ascii?Q?+dmL645j0EvDxwrFIXqMevnbR+faCdxDQTdmkeNom+M46S4NcU2XATn+12Gv?=
 =?us-ascii?Q?fp9CUNSbjzc6UcIJ3EViMq1GR/OAXEuKbfKbh2qFnscg0rDNZ8Via1A6JiSJ?=
 =?us-ascii?Q?NrFI2dWV5e58tBKF+uxZ4qE1EmF16CzUFwLeQA28ZYqouSBq7XX+FFrMCR6o?=
 =?us-ascii?Q?jczUo3hN4e/yDQoHwYCzDp4Ok4ICRd92ufJqWLOUFwLM2qYOEj3F6gPJn4cP?=
 =?us-ascii?Q?Pz6jWwUdszXhsWetpdhYQHOKB5UXeXCxdALj1OlC7rtFZane484l/MjOAuTa?=
 =?us-ascii?Q?ziJJLIOZMH0r0hgacEjvGQUV2YPkuVwfzPCv6pvAU8fWHS2zOxVfn5IiCy1e?=
 =?us-ascii?Q?lA6SeFp6nAoL/jxVTBRMkl8Td+BujXarVzl/2f2C/IN8Df/KUacDbanxWCyP?=
 =?us-ascii?Q?umGovRbv20JosNUf9zDDVJTb861wpPZ7CDSjoahBMrNi66q4jets3ZNjXJZG?=
 =?us-ascii?Q?xLtJT1FPijLInHlth2j9gu+mZoGyjbQ1XX370y2MDs/jm51qihyr1dJslW6n?=
 =?us-ascii?Q?enfOZ3TZqtalHZgzvAa3CgQXF1iEtG3maq4mzrkD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 101d6458-7288-48e6-e1ee-08dd49feb757
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 18:14:10.2893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LOrWHv0iI42tBUvZpVU/64eVP8ZMcQxWPkQnDYYQ/5ftI3DsSJ7NZOUaQQzPZi+EfJHY44ZAnpRlIl53xSpVANd/v0o5JRYJ7c0EqzDC5YA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7438
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

Oops landed on wrong patch, please ignore.

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Upadhyay, Tejas
> Sent: Monday, February 10, 2025 11:36 PM
> To: Das, Nirmoy <nirmoy.das@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>; Brost, Matthew <matthew.brost@intel.com>
> Subject: RE: [PATCH v2 2/2] drm/xe: Add a WARN_ON for NULL job in
> xe_sync_entry_signal
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Nirmoy Das
> > Sent: Monday, March 18, 2024 10:14 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Das, Nirmoy <nirmoy.das@intel.com>; Auld, Matthew
> > <matthew.auld@intel.com>; Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v2 2/2] drm/xe: Add a WARN_ON for NULL job in
> > xe_sync_entry_signal
> >
> > Add a warn for NULL job when sync->type is
> > DRM_XE_SYNC_TYPE_USER_FENCE. This should be a programming error
> and
> > should never happen so warn and let the kernel crash if that ever happe=
ns.
> >
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sync.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c index 02c9577fe418..247505c3478d
> 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -255,6 +255,7 @@ void xe_sync_entry_signal(struct xe_sync_entry
> > *sync, struct xe_sched_job *job,
> >  			dma_fence_put(fence);
> >  		}
> >  	} else if (sync->type =3D=3D DRM_XE_SYNC_TYPE_USER_FENCE) {
> > +		XE_WARN_ON(!job);
>=20
> LGTM,
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>=20
> >  		job->user_fence.used =3D true;
> >  		job->user_fence.addr =3D sync->addr;
> >  		job->user_fence.value =3D sync->timeline_value;
> > --
> > 2.42.0

