Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F01C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 12:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73DC10E6A0;
	Wed, 24 Jul 2024 12:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRG3e6Wz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F03B10E6A0
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721824021; x=1753360021;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rUzXAubaBEsc/YaBlMog2AOkQHaZOuNbkT2gwUquBUU=;
 b=FRG3e6WzqiwWzUWDC7po1NezylCp7Jo/3m9jlVW0SfdEIlLdUYsRcKMA
 TpZor8mUFEjnFJJ1WC9ZAv2Bi3qKtWtN6JLYB/WFx2gfvp4Yeuqc9/4n7
 3VGfVBUzlSaKuL4mSoeJrPHM2QBvob2dCKN9QroYmTW94pfk2WNw5dMSU
 usj90U/wwuEdSOwIKLYUyUwoDSZCa4Xbaw7tHeu6qzeZkdFzjq0JTU3VT
 ORfj0Fb5weEOYMueHugRnxlJnZ9LiQUKNwvrZkfqRQtwenVXP/qI6kfR0
 HXUYMH8cpRco9EClE7xoULHKOiWNkytJApxfqzZp7gDnfv8vayJYeaqHD g==;
X-CSE-ConnectionGUID: VWACpKs8Qo+0qo9SmPAzaw==
X-CSE-MsgGUID: VAj1NGQFRFeullfewO+N1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19351695"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="19351695"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 05:27:01 -0700
X-CSE-ConnectionGUID: uX8DsQ/ZTbyigVD2n9/ntg==
X-CSE-MsgGUID: +EWbHz1bREeTKD0F0Mb+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="90034502"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 05:27:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 05:26:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 05:26:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 05:26:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHivgj3YTE/xxXcOb28hNqwgdSQB9OKo7lMVliIHjUAGm9V3MMX1pueXuRKjwTQ7gIoJClBULXTUwSZ6ui6O1n5rLZHxZO0eS9HDTimuTMQ8XmNSsgLAa5TOZ61dxSmpD7pWm3yCX8KD+CqDoNndPdgpxDpYn1BIhQC3/lCfHxkrWA0s8HNvU2kVlk487pYLT7mRpJx+4HcdNVhVGp8zE/ue/fHoxLOogqo7gqzRzu8cwVJjn5TaPR2EtDD6yeVLCPb6kt+tA80t1JCXUma+TTishdblrL8nngvA0ykYdBXsBOXPKVHBO+r4g6GVnVYPMhOQ5VqiuTn/BiNINzuODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bleDyyc+rcjhOAJhayXGY576g0WUp7mcvoLjMTNCy9E=;
 b=eXgzPxA4j/Djc0G43mdvXixqRf/XTCshG84No5nhs5DmdEYMo30IaADsfsaeOt4mXiPDNsLRnerAmt03MaNu845sbdjVJDrfRGa4dDSBzu8aP4MWPNCTYTw+SGJGPoNFDrl2rHC4p8ZAxJEttz5Rj80OAOFkVyJKTX0SiqfXWT13We/R5mT/OXW4BMe7/hpQ7PYA87aR0+lA3BGQDmmoQcibCWOdWeRP1ao8+3lqvykRVSl3JK+iz1oivYJ9IRBVXX++vIp1Ysa/lXivi1jGLUDtP6LKqQztcXtkFdbYJfZPSDZCZjnIZLbYwgAeIw23gS7PtP4NCXTduDWB6bw5aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Wed, 24 Jul
 2024 12:26:55 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 12:26:55 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/xe: Add assert for XE_WA() usage
Thread-Topic: [PATCH v2] drm/xe: Add assert for XE_WA() usage
Thread-Index: AQHa3FFrZKsAN74wnUuuvdR++VNwVrIF0Keg
Date: Wed, 24 Jul 2024 12:26:54 +0000
Message-ID: <SJ1PR11MB6204F43614C1090C075985AB81AA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240722160815.4085605-1-lucas.demarchi@intel.com>
In-Reply-To: <20240722160815.4085605-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB8100:EE_
x-ms-office365-filtering-correlation-id: 397d3398-44fa-48fd-3f0a-08dcabdbe789
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?iie6pnc05JVgyL3VCE3JgdZ0KRVusYbD5TOQdBNFzk4xnaQYPMt2qxbssGlb?=
 =?us-ascii?Q?QFAbre1UNhuLmPh4sV3yVOKxMVaYbZH7LFWnMzY5nLpZC5CbY0eZDzFNEP3b?=
 =?us-ascii?Q?4XN8WDKYPKO/SM9i0Ze72TKK1FyhywwYxbxXw2pnDTMf8yo1EFIW0upVRgLf?=
 =?us-ascii?Q?DwtaZmp63qyvNk0OqD0y/LRUuYNQdfGMlEma+ZIyGeyGElvk738VljhJ5CwZ?=
 =?us-ascii?Q?Pzd6ACclw5PmGwtSdeGTTcqpTFl65exxUmEqfPWCvPimjIMCysZa74F7GnZx?=
 =?us-ascii?Q?1MUVagXKM6EdU8cwpTlVyQds9J2Es7YYHM1dZCG4qjfBSqvSeezvjvtqtnW0?=
 =?us-ascii?Q?nQqV1+/dme5SbTFgSQCeFhigG+bnNJpC0+wb/HVBL3xdzFx39w3ixLeIVDKi?=
 =?us-ascii?Q?VBHMkR0iDjbrxBZfKYJGNOVQhrW5d31uwhPXwhcMTBoNbDGgSJtvdXltj8Nh?=
 =?us-ascii?Q?4vmgNXPEIyXTn/EBKCPUR/Fam7wnDgj3h13MfizPgRLVO5BmDJJZGg7eENMM?=
 =?us-ascii?Q?X5Q59fooKqAywmgh5bJjkQneHQDJ/xX1Cl0Jm47EE1gYd7Lgx3Zi8vnO/Sfl?=
 =?us-ascii?Q?1JmL0qO3qvP5vHus2OrqMQfm3POArNyg6g8qg3pICkEYwsCjZadazmsIpgTA?=
 =?us-ascii?Q?U9QiNo2fq0lpzZVA1wbvz4FqSBmFWnzK8iBPUsG+AnuzlOGOA6mSo2G8qCTY?=
 =?us-ascii?Q?/lHtmB0mTxzeAREyeKWl+ifyZhW0t3htRRkbRg8TtW/3kzfiN+p8AgoSqC5/?=
 =?us-ascii?Q?Fz1qxIZLJkRavrbwF7hnPPSggw2Oes/vrBL6ocbyWWKROkme8sQUs313iGM0?=
 =?us-ascii?Q?oxqcLqbc004Iech2P8e8Nz14wWs9XKlLUevTlYJMloJYtOm29cpEt7s7Sc8/?=
 =?us-ascii?Q?FkT3SrvRHpaio46N5052OSdGkTjZ2IRXczKAr8QceglnYETf/e9oDTAFRPUo?=
 =?us-ascii?Q?WeDvhYyhqdbQ3nFr6sml/jbKW1oTmOvMMRB06b56/fTSgJYOG3KQ1430ICt5?=
 =?us-ascii?Q?/CjiTEjvlWKhGXMlL9g7AGti+pRZc3HeyWcmcQwAO4JDFcuKPy+DdAGi9Te0?=
 =?us-ascii?Q?ogtY1mUtQBUqzDEVofZ4ofJ8afLYjXe1jHritYoRuMUoTPe0NS4sKcH0yUog?=
 =?us-ascii?Q?1ABLdUCMYmBJC9ROUeVo1ZSrjzgQlH/Ud/vSplkzygvptEfySA5wNagQyggu?=
 =?us-ascii?Q?fOH8VPFiTaTpr4KwMDru1UDY/9SFkvguhQQx2YNXx+xcxOK/Vuknwt7isj0Q?=
 =?us-ascii?Q?mIo5nSI4Oi7ahfRfE1MaO7XhjWctrrrevfdppr0+xeV6a+4tkFM88KY3cGIA?=
 =?us-ascii?Q?ECsgPc6rShSZgbgkrDAv49BL29X+IhQe56QOF0L/27nVjYFAePn+O4RpSq+P?=
 =?us-ascii?Q?47htmW88P/MSyQg4o72cBst3VellWO64xLCh91loRyAKDSrXVQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PZ7L+ePNIMlfiIzdcKQC0rWzUWn+AVzbi/54drXf0BDW3JNRDgbWD+FcuakG?=
 =?us-ascii?Q?dW/A1GraN4Z9HS9y5pr0+nf7xa1QwUtc8OIKTktpJ3CoHWl08qQipcs1Ikhm?=
 =?us-ascii?Q?qxmY0Rg91N234Lg7asW9jAbiyjut1sN/bXif/GcXa73iZtsXJAhgCRa/gnCB?=
 =?us-ascii?Q?mYFvFkUfstHbj85BBl6HAz2p2mm4nxQYF0dULqZfJ+irVsczewkiiZnm+m0S?=
 =?us-ascii?Q?+5NMOZAZGMpLytR+tceHHvdrV9AswlRtPTkbGX9Ov3BDZ2cTkClbdne0SZBf?=
 =?us-ascii?Q?nYCf+/U+4eTTeEueo5gby75xkp6cROat24D7hW+wGd73zHo6QN3ajmJUNABx?=
 =?us-ascii?Q?29Df16VIFzKGdcscTkUwN8Q3IjTrizyME1Xdv8iTm0C76Vlb+EmsvPr5vauT?=
 =?us-ascii?Q?6I8zyc2UsAy0pKq5zXjA5VGEshucYkFZIH+sYL6+XlgiMMlHo5wtc4o6rX8i?=
 =?us-ascii?Q?idKnPcXTqmmhiTA3oe+Z5Qa9F6ejo7yxmp6uXvHFz9mvGP0DCTll/wJ5Vwek?=
 =?us-ascii?Q?04/La44q3fPbZLUNn+L28gaw0OLKZM/7AIkkUBrJMaokxSnfdIvgYV+blupv?=
 =?us-ascii?Q?unYOuQ5ww6MBb+KvXJucnH4a1b+Tg5muKMJNMumYoKtT3CPnfVExFq4BBGYW?=
 =?us-ascii?Q?A6J8CDc9hEDTd/Sykcu3WPJd69631sa1BpeZ93X6sKmkyYazkP7Za8OB3JD8?=
 =?us-ascii?Q?v3UNYsZduoMX8XPAe4taTuaCfBlsuc3qQIaMgMJBQ3bbE/h78+J90FpIohJ7?=
 =?us-ascii?Q?bz3eG49RGbnl3CW655Ngl8Gl96wKbi+NbDlJxH+P3fFvEP4uyTPh4PUsm0l3?=
 =?us-ascii?Q?8tz13e39qSePYFl3HSgNVo7e/7zu8yHzYt1qwBr5EyZZlQGWj/iVKHUVScaF?=
 =?us-ascii?Q?pNTWfywAbQHy4xRLSwY0bjmILPajGjnnPJIzK1tnLHTpOa7aKvzAivjXZ79O?=
 =?us-ascii?Q?RsTwjAAmV1dFzS7hmeushPUB1XBCjfqbxFf8lEDMJwaXO4oYMALRwZdIkeWB?=
 =?us-ascii?Q?yBVdPT68hj3gufc/xFFb9i9kbG6iNZxyIPAJqiDFrgGsAisXLrw/pwbRQ9Ps?=
 =?us-ascii?Q?pk/E+P1gu0TfIO1GKgm98d/UfkTyvbciERMUDdCkBtLmerZE0cDgHI5EGSVm?=
 =?us-ascii?Q?1HJKCU/P89MP3oHpoHZx30Z/GexzHcWCfyZWHY+w3qNTSO1+cQdvqD17nOhc?=
 =?us-ascii?Q?IQhELMPN7xdynw61Ah1JHIUTI8BK40RIx0KoVODaqng58/PSDHRShIGm7J+D?=
 =?us-ascii?Q?wuqoXq/aGxYwQfSsd2rA/XBNX4MoZP3HJYzZM2AKcKR6uP3rUyFI5T4qjtZ9?=
 =?us-ascii?Q?Cgf+FvJ/dlwUWwxwKzmUknykSGHccPWzT1/n/Oikt5OumWxZWrF05GNKLRbE?=
 =?us-ascii?Q?97Z6sBYqlGo4Pn28L3yNjBzAEKEVJ2CFKuQekShDqzTr401X+73o3/RKP6vG?=
 =?us-ascii?Q?Mw0+PHIleP+uG0YmkbDVApnU7oRJ0ea0JG5T5oXPXqxIVL3nI7MO4h4MPssP?=
 =?us-ascii?Q?XXPUGzfMXIE0CfK+KkTtu4piZNNQP5DCqwXvO6JG7dVx6oBK9lp8tOBXWIjT?=
 =?us-ascii?Q?oskEDXxI0DPqs8htwq3SXc6rfXWAGVhClni6F1pH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397d3398-44fa-48fd-3f0a-08dcabdbe789
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2024 12:26:55.0070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nh12Nzl8x3D+m3mT7em+7UvHKiwpD9Q4DzN2xYb0EUtdQirnoyFzixwYNxhgXBQvHwIAQXOBqYktVA92KE4mF1BUgeFCwnJ8V1Mv30LrFvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Monday, July 22, 2024 9:37 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: [PATCH v2] drm/xe: Add assert for XE_WA() usage
>=20
> It's not always safe to call XE_WA() in the driver initialization. Add a
> xe_gt_assert() so this doesn't go unnoticed.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> ---
>=20
> v2:
>   - Fix kernel-doc (Tejas)
>   - Remove needless initialization (Tejas)
>=20
>  drivers/gpu/drm/xe/xe_gt_types.h | 6 ++++++
>  drivers/gpu/drm/xe/xe_wa.c       | 1 +
>  drivers/gpu/drm/xe/xe_wa.h       | 7 ++++++-
>  3 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> b/drivers/gpu/drm/xe/xe_gt_types.h
> index ef68c4a92972..4dd01adf63c6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -389,6 +389,12 @@ struct xe_gt {
>  		unsigned long *lrc;
>  		/** @wa_active.oob: bitmap with active OOB workaroudns
> */
>  		unsigned long *oob;
> +		/**
> +		 * @wa_active.oob_initialized: mark oob as initialized to help
> +		 * detecting misuse of XE_WA() - it can only be called on
> +		 * initialization after OOB WAs have being processed
> +		 */
> +		bool oob_initialized;
>  	} wa_active;
>=20
>  	/** @user_engines: engines present in GT and available to userspace
> */ diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index fd009b2c68fa..564e32e44e3b 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -755,6 +755,7 @@ void xe_wa_process_oob(struct xe_gt *gt)
>=20
>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.oob,
>  						  ARRAY_SIZE(oob_was));
> +	gt->wa_active.oob_initialized =3D true;
>  	xe_rtp_process(&ctx, oob_was);
>  }
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h inde=
x
> db9ddeaf69bf..52337405b5bc 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_WA_
>  #define _XE_WA_
>=20
> +#include "xe_assert.h"
> +
>  struct drm_printer;
>  struct xe_gt;
>  struct xe_hw_engine;
> @@ -25,6 +27,9 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer
> *p);
>   * @gt__: gt instance
>   * @id__: XE_OOB_<id__>, as generated by build system in
> generated/xe_wa_oob.h
>   */
> -#define XE_WA(gt__, id__) test_bit(XE_WA_OOB_ ## id__, (gt__)-
> >wa_active.oob)
> +#define XE_WA(gt__, id__) ({						\
> +	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized);		\
> +	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
> +})
>=20
>  #endif
> --
> 2.43.0

