Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B789FC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 11:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F5310E9BD;
	Fri, 11 Jul 2025 11:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IszqNpFz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257598926F
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 11:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752233015; x=1783769015;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nU3NSUrDgjrfNwIsoxJVzNJ4h4ZiXzCBWDpnrlOmHAY=;
 b=IszqNpFzY3Px9usLd6fGPL7DJWAZaP9/s+6CnJiT2TWB51gwNiOecufz
 1pV0qqPH0NW5cC+DYYChWkFHRaXDNY7JmkskZGV2udYn4mFMTGZKlyKDP
 SQi7/FzosIj7aLy49ZOEm2igRVSzI66VvouQFnUFbUmdmKOj+aJfruSWT
 uMQENhvUX0Q0K5cJxITe/QKWbgI4gOX5RhhJCSaNt4OeLP00m1bKBlh5v
 5JNAdlLGCZRx8VOxOnfELFm2ZDvoZunyOIgXNgi/R/Qp+bNDI7d3QR1el
 /5cYDEmsWwDEbtZcWHupKTZ8XZzhxCEuTsZYnQKncsgVT36qAB04ydLFt g==;
X-CSE-ConnectionGUID: dMR1b4ciS0qqqs7mEyf57Q==
X-CSE-MsgGUID: uQArLasBQMqPipNpfTxygQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="42160221"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="42160221"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 04:23:35 -0700
X-CSE-ConnectionGUID: TIo2g8X0TwCLAicrKZLEsw==
X-CSE-MsgGUID: IbwC/+cRRCiWkZgavH1Row==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="156466105"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 04:23:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 04:23:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 04:23:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 04:23:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6HjaBxk5hV3jCk8tpFCd9koHjpshxz3oySOsIkkpEiajjnYORj+K3PxRPJ1KB7icXvOXn13aj7XeabZmXPbom9lDh/UZgyS7vKn0Inqgjzwph9YIGeXeAAcTyVCSHEFOiVDkxaVCrRkxzGkFM2DElz03CnToc8nnf+8hp8lh/Lkmrh+gK6HPTYM20r8cQfplALgsQvy06DMlPY/zTGtTHhkk3QsUOohLXUKDu+HcFYifjYOMzPWRWetFi+n4F5SYtAUjG8DG92qDxr9naaZDZSs8uQ16PQC23k0189a1xoQPID86kLPqMazFQGIBKfEfWUmBxixDMhw20IwmwfH1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkVSSAEqjoNPS7ZNv9SQWsRHbMaoB/wUM0GS2F7/jb8=;
 b=Q8ndiMfippmOjS7uyKIZ8GENs7jETqhGFzZYNewAFDDznUtpobsHHmRsqS6aGPEv7DejbG9isyaxs9i8sGimCuPXzLnu0JiwE2Y8vH9LurHLjAfuGkAv34Io7nFw2tSlAi+iFNYls91zXbfnn7VYChehUO27IlQM1nR0A6H1doCTE51/GsnzSzSq9Q7Vq8s/6RuVP7vXibah88aZq7L5XKzZagZC8dOR/8v9EnfOEhbgjqpFYM5g7kxSYBIdWQiBYIAQrHHVYkkZjVJEKkj5QB8/f76vYTrwn6Rp1KtlRm31GcUWOZP96QGdUzbdtmsRabVpb4iPINZ9uB/n9rH8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by DM4PR11MB8202.namprd11.prod.outlook.com (2603:10b6:8:18b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 11:23:31 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%7]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 11:23:31 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY
Thread-Topic: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY
Thread-Index: AQHb8WyVx+v7hfX8Fk+d+eHNW7iiF7QrpxaAgAAE7ACAAQagoA==
Date: Fri, 11 Jul 2025 11:23:30 +0000
Message-ID: <IA3PR11MB8987A6A67808237A6D1FF253D04BA@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20250710075435.407068-1-nitin.r.gote@intel.com>
 <5gwyv6u4qtbqbmnnxaat6zjlbp3hgdl65dqron4w6qcxhyq5ua@h7vffx4fs3uc>
 <aHAEnkKnOuJRUF8l@lstrano-desk.jf.intel.com>
In-Reply-To: <aHAEnkKnOuJRUF8l@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|DM4PR11MB8202:EE_
x-ms-office365-filtering-correlation-id: dae3ac39-d427-4c89-1ac3-08ddc06d5d92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?w+zrHCRLdfCdRyYbu28WfwbYAH+OIcOxUH9oifir60wm8qAsiRfzhKdwdY?=
 =?iso-8859-1?Q?1r1FJ8FQvFU65Hm1NxcLDbzQei9cEuusdakq5KPwoygiD2MgFdU3VA8m6s?=
 =?iso-8859-1?Q?fcMmf2xdmwSFjAlk8MVC/5/Mh0dfNMQeuvGIcaPZwmyTlmlwzTNkn/5+eV?=
 =?iso-8859-1?Q?7lKjzc0Iii8OLhaGQ30RZMh/VbWi16hY/3rX1PVzCprB3lhvC5zTncRatZ?=
 =?iso-8859-1?Q?Q5BMmpbD8qpRgtKEYoHHHyWjhbPsZ448mxSX7Hr3GZuF4gQXiJfJ66HGBd?=
 =?iso-8859-1?Q?N5Yz3KgbBmThdtWr6h1HYQ4tK08scnW9dI2/DCKUarCQ8U0GWC5JfEW1bw?=
 =?iso-8859-1?Q?RCchGO41gKilzPa68dKfEb9kfIohCLglQmcw2ghvOpQIUhhpLKEcMmyfmu?=
 =?iso-8859-1?Q?ffXuU/RyJXURSoZOWc3YCSt3ZeM4e0x3rm5zOzwBzWnNkgGiE5YHXlQjCP?=
 =?iso-8859-1?Q?n+BQ57gfEcOljTG/NWqzbMcw2g9AEolJVTe5EgpCn72FgScZaqqBlLO53K?=
 =?iso-8859-1?Q?2r2r1r8I2LJJM3sL0Yw3rAP4GQXLWSpFpgpoo7NGAXZyOQoFrAEafInWIq?=
 =?iso-8859-1?Q?aLwjEyteiK+EgkjDiSEQl7aKBPyhSk6vElbdCPtayCue2JQfslPpJi5qPQ?=
 =?iso-8859-1?Q?etknGdNdXpNcDvEBQ6YxJgffg4fxDRmS80EBSs0dTBdeYGYXAhzKHsxXT4?=
 =?iso-8859-1?Q?ZxAJ5W9IpIQ2AdeW2hp89Pp8srg1WtEmDjJZq81nAzvJuY3c6kyc7fbarO?=
 =?iso-8859-1?Q?9OLLg/tukDkU3ASr+G/QFKKAwQgepfRF6mvrR9AbpVmjtn+rKu3MZPNL5r?=
 =?iso-8859-1?Q?lMcRfLKmAZrih/M0vNq6Sr9xemsEdTgTWYJhVtBWex/N2DWq948bk24SiK?=
 =?iso-8859-1?Q?K/nlb0VUQHk+KkEBlfb5Fq3G2QivunzUTsHj7QQFSV92UK/wSvslX1NxF4?=
 =?iso-8859-1?Q?LD7gwxCUKTYDUBZJiuzHQJAGjXnxjWNF5Yqq0Gwz/oYkd0uFCrrYK9BMo1?=
 =?iso-8859-1?Q?bpqQH4HOWNeULkbJwP2q/uThQ1fkmeN77JDJlKhJ5r1oKWclNdB7/h2WbL?=
 =?iso-8859-1?Q?Ta6WvziYj58X42Gfk7j1YpAh9sUxqDGurdc/At7T7nQswikgR35lxgqdgW?=
 =?iso-8859-1?Q?BmS3/odtWrMOkII3fcPs9kfdWVrO1ZS+qourMcCBOWTV5MCCvM5dsWe0HB?=
 =?iso-8859-1?Q?Gk4EafLkoiaAv9G8KeJ2NQPuwKG4KxpEmIZPVIsshdigJPIKRxsBN8xTwi?=
 =?iso-8859-1?Q?E+UuBYS4GUOpjTLOzFAGN7KXmmYSJfFsU0rblx6HSGn+eUdr2ZGjqlU/aL?=
 =?iso-8859-1?Q?Vc8Obdxuks+3vyhWw2LHI4MRsN04h0oVptNLxwtsu9mHoJ7LectrzX79cA?=
 =?iso-8859-1?Q?4Xwn82rUWb1yNNuprO+yJsidNVeh6wSwSd65nSVzYfbI3iuchv/idttKGS?=
 =?iso-8859-1?Q?iClq+sSSJWxPfpJ9YnsoKHh5AabEgyVelz4DyfH3A3X4zbv66Z7mrpvhy4?=
 =?iso-8859-1?Q?M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DH9FTYVXdCaXxgNJG9TB/iuU6PSL+DhMluXim9227SWvx2rmKe7yIJIRO1?=
 =?iso-8859-1?Q?r+xTKC9fu/cBeL/2Ecy4fj+6EfCEEzBxGCnnR0lXXLMe/Cm630IsrxeeD0?=
 =?iso-8859-1?Q?neStHmZiiSTNilJYZlZgaAq4kM538oaPOIjfVHT/8Lpfn17Efukl51Lnqi?=
 =?iso-8859-1?Q?F+J85XI2u+ASeTouk8VoFvKxrE2COsCoAVhn8SrMvmiFUP6fkeTnm8I55P?=
 =?iso-8859-1?Q?jbT3m1v+nNT3nAU4CCH+oyH7uAuSjikaon8tKzdEaEI36IIZJVqY/xb5h0?=
 =?iso-8859-1?Q?HHa1kPVbDtWDTFmEtiM44HF4a2ZzjJ7RS21zemAWD24sa6b91fIlh6OkYD?=
 =?iso-8859-1?Q?fzyIB0OzSgjb8DLgied+7oSBHbkLmrOGWmC/6G732tCoU/u3xnWUEKUvZR?=
 =?iso-8859-1?Q?nJW1tv2a++GHdBvvtZ3tifT7/7sP9S6cbIvVMrt4YWuenadU1KTgyNGiqC?=
 =?iso-8859-1?Q?L5XNwjJ61dkhYGQa3rKJSEduCE8bYJXOHkxiP94m+YqThqEolccym6HMeI?=
 =?iso-8859-1?Q?H9oGBSvb2XWslYOr80nzpJITPLpbAdFHS4X0nHEv1X0F5N9eVVm/TDbhL4?=
 =?iso-8859-1?Q?Y2xodtbf40O5g76X4EXqNw4osFA30Cn+6kAGTL684zs/iroi57QN3I459N?=
 =?iso-8859-1?Q?5BGFfTykjWdQaYYsSbPxaFDIUL25xagKUnatJzSqp3Tnrj+xSuu7OouEXn?=
 =?iso-8859-1?Q?0xgzZikludE4hP0hc94JIc0tsCRPuUPGlq/q2s0KFN2msQoWOGp/ZsnyZd?=
 =?iso-8859-1?Q?R4j18JkTkbbrlcPyf1hfHlInI/rvRZ+WU4vM3xLHviJhpHTQPy1TLhp12S?=
 =?iso-8859-1?Q?fXpLe4dECL5b1tiGxihf3kaij1Lqx1cZvxI5kHbiBr32yZp2ofk6BkJwYq?=
 =?iso-8859-1?Q?w7F1qx6S3ujlPRWW/0gMy81PM3mfmVgqkH5fpeeUBgiavc7RrKajzzDgTV?=
 =?iso-8859-1?Q?e3WffcV2DQW84KRG3TpUTVZ2/79+qApbgkQfaVHIZbmaEGmKMSEb9C+s7C?=
 =?iso-8859-1?Q?BIuYS1Pf04/xqeaauzKbuWaltmKg/R7FhVvqBmOezOvTmNCXUjBXz3Y4y/?=
 =?iso-8859-1?Q?Sy7saAqPLGVKoMwkxtv1eq0+RalBNCRm6ROWZULLtZuXh2vvxGJWvIBUKT?=
 =?iso-8859-1?Q?0iRJs/+W1TdDJoqxj/H+eIubRKDv/032R3KeeKWd+QuJxVvcdElBLIvi0g?=
 =?iso-8859-1?Q?hNWslBcLSf7llF7Zsk7CpJM1OE+C6goqx+YhlTNmrXuEi6fYPlgwW+Fk+z?=
 =?iso-8859-1?Q?97LCJjDOQm4cJ/PCR2faE+TcrV2emoNTfdiUcH+k7uSdwMiF0NgSOIJMFK?=
 =?iso-8859-1?Q?1IpIGbphm2X1rmyXwTx7gIUMgsXnM4ZKA2bcrEOsJFq5pjYxA1j+TuQjfT?=
 =?iso-8859-1?Q?eKqxLUqyfLTInCzPA6IH071+odXf80qckXTjHOieyGkYY5g7opE+HJz0Kq?=
 =?iso-8859-1?Q?IJtj1jvb0Yc63mbkivizzLtgJenvM1uRPun7+Rk2Gt2Dq9IwKN8qoqhWqA?=
 =?iso-8859-1?Q?sNCobDDLXQ1pU7dfu6miNEtP3VENcvdkTpeEAYBSJwSmU608Ru0659BeVx?=
 =?iso-8859-1?Q?gcPEX4k9BYxVfjXxe3q3clUe0zPBPmXLKVnGPNIiYnPBB44nx13ALo4qin?=
 =?iso-8859-1?Q?Dc1dqj2dsIGCRFIH2qtqo5vwtQG8QJGU0W?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae3ac39-d427-4c89-1ac3-08ddc06d5d92
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 11:23:30.9879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tVJ7Q5b+DO1J0WzYBeF+wm9ZwU1FrG3RNUKOBGAA8dof9vNySOxvBBXYbIg55VCpWQMhM6jnR6rsRbHsVrkI9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8202
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

Hi,

>=20
> On Thu, Jul 10, 2025 at 01:03:41PM -0500, Lucas De Marchi wrote:
> > On Thu, Jul 10, 2025 at 01:24:35PM +0530, Nitin Gote wrote:
> > > Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY
> device query
> > > flag which indicates whether a device supports DIS_NULL_QUERY
> > > (Disable null anyhit shader query mechanism). The intent is for UMDs
> > > to use this query and opt-in DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY
> > > flag to disable null query mechanism for anyhit shader by setting
> > > DIS_NULL_QUERY bit of RT_CTRL register for Xe2.
> >
> > it seems like this commit has been over squashed and this commit
> > message doesn't really match what it's doing. This isn't just adding a
> > DRM_XE_QUERY_* (what the title implies), it's actually implementing
> > the
> > DRM_XE_EXEC_QUEUE_*
> >
> > >
> > > v2:
> > >   - Use xe_rtp_match_first_render_or_compute() api to check
> > >     render_or_compute. (Tejas)
> > >   - Validate args->flags (Tejas/Matthew)
> > >   - Add proper kernel-doc for both DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
> > >     and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)
> > >
> > > v3:
> > >   - Rename DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY to
> > >     DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY. (Matthew)
> > >   - Move implementaion from exec queue creation time to
> > >     WA BB program. (Matthew)
> > >
> > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > ---
> > > Hi,
> > >
> > > Please note the review comments from previous rev2, addressed in this=
 patch.
> > > https://patchwork.freedesktop.org/patch/660580/?series=3D150601&rev=
=3D2
> > >
> > >
> > > .../gpu/drm/xe/instructions/xe_mi_commands.h  |  4 ++
> > > drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  2 +
> > > drivers/gpu/drm/xe/xe_exec_queue.c            |  9 ++-
> > > drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 +
> > > drivers/gpu/drm/xe/xe_gt_mcr.c                |  1 -
> > > drivers/gpu/drm/xe/xe_lrc.c                   | 65 ++++++++++++++++++=
+
> > > drivers/gpu/drm/xe/xe_query.c                 |  3 +-
> > > include/uapi/drm/xe_drm.h                     | 12 ++++
> > > 8 files changed, 95 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > index e3f5e8bb3ebc..84e889528464 100644
> > > --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > @@ -80,4 +80,8 @@
> > > #define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
> > > #define MI_SET_APPID_SESSION_ID(x)
> 	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
> > >
> > > +#define MI_SEMAPHORE_WAIT		__MI_INSTR(0x1c)
> > > +#define  MI_SEMAPHORE_POLL		(1 << 15)
> > > +#define  MI_SEMAPHORE_SAD_EQ_SDD	(4 << 12)
> > > +#define  MI_SEMAPHORE_REGISTER_POLL	(1 << 16)
> >
> > look at the defines above and implement it according to them. There
> > are multiple things wrong wrt coding style here:
> >
> > 1) the MI definition is sorted by its number. 0x1c shouldn't be the
> > last in the file
> > 2) bits definition should be sorted, highest number first, to follow
> > the bspec and be easy to compare
> > 3) don't use shifts, use REG_BIT()
> > 4) there's a missing space in the bits definitions
> >
>=20
> Thanks Lucas - it was late when I was reviewing this and apparently misse=
d a ton
> things.
>=20
> Agree with everything Lucas says here.

Thanks Lucas - I will update it.

>=20
> One follow up below.
>=20
> >
> > > #endif
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index 5cd5ab8529c5..8234789f05b7 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -55,6 +55,8 @@
> > > #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
> > > #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
> > >
> > > +#define STEER_SEMAPHORE
> 	XE_REG(0xFD0)
> >
> > ditto, should be sorted too, but it also clashes with
> > MCFG_MCR_SELECTOR. I'm actually not sure why we are using
> > MCFG_MCR_SELECTOR name... probably a copy & paste from i915. That
> > register is indeed called STEER_SEMAPHORE in bspec.
> >
> > > +
> > > #define PS_INVOCATION_COUNT			XE_REG(0x2348)
> > >
> > > #define XELP_GLOBAL_MOCS(i)			XE_REG(0x4000 + (i) *
> 4)
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 8991b4aed440..18a0bee38eed 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -131,6 +131,9 @@ static int __xe_exec_queue_init(struct
> xe_exec_queue *q)
> > > 			flags |=3D XE_LRC_CREATE_RUNALONE;
> > > 	}
> > >
> > > +	if (q->flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
> > > +		flags |=3D EXEC_QUEUE_DISABLE_NULL_QUERY;
> > > +
> > > 	for (i =3D 0; i < q->width; ++i) {
> > > 		q->lrc[i] =3D xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec,
> flags);
> > > 		if (IS_ERR(q->lrc[i])) {
> > > @@ -597,7 +600,8 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
> > > 	u32 len;
> > > 	int err;
> > >
> > > -	if (XE_IOCTL_DBG(xe, args->flags &
> ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
> > > +	if (XE_IOCTL_DBG(xe, args->flags &
> > > +	    ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT |
> > > +DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY)) ||
> > > 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > 		return -EINVAL;
> > >
> > > @@ -616,6 +620,9 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
> > > 	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
> > > 		flags |=3D EXEC_QUEUE_FLAG_LOW_LATENCY;
> > >
> > > +	if (args->flags & DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY)
> > > +		flags |=3D EXEC_QUEUE_DISABLE_NULL_QUERY;
> > > +
> > > 	if (eci[0].engine_class =3D=3D DRM_XE_ENGINE_CLASS_VM_BIND) {
> > > 		if (XE_IOCTL_DBG(xe, args->width !=3D 1) ||
> > > 		    XE_IOCTL_DBG(xe, args->num_placements !=3D 1) || diff --git
> > > a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index cc1cffb5c87f..b62502a18c1b 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -87,6 +87,8 @@ struct xe_exec_queue {
> > > #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> > > /* flag to indicate low latency hint to guc */
> > > #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
> > > +/* flag to indicate disable null query hint */
> > > +#define EXEC_QUEUE_DISABLE_NULL_QUERY		BIT(6)
> >
> > 		     ^ missing FLAG here to follow the other defines
> > >
> > > 	/**
> > > 	 * @flags: flags for this exec queue, should statically setup aside
> > > from ban diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > b/drivers/gpu/drm/xe/xe_gt_mcr.c index 64a2f0d6aaf9..a7624b30d0c9
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > @@ -46,7 +46,6 @@
> > >  * MCR registers are not available on Virtual Function (VF).
> > >  */
> > >
> > > -#define STEER_SEMAPHORE		XE_REG(0xFD0)
> > >
> > > static inline struct xe_reg to_xe_reg(struct xe_reg_mcr reg_mcr) {
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > > b/drivers/gpu/drm/xe/xe_lrc.c index d2ad8fe737eb..6fc09df67442
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -13,6 +13,7 @@
> > > #include "instructions/xe_gfxpipe_commands.h"
> > > #include "instructions/xe_gfx_state_commands.h"
> > > #include "regs/xe_engine_regs.h"
> > > +#include "regs/xe_gt_regs.h"
> > > #include "regs/xe_lrc_layout.h"
> > > #include "xe_bb.h"
> > > #include "xe_bo.h"
> > > @@ -25,6 +26,7 @@
> > > #include "xe_map.h"
> > > #include "xe_memirq.h"
> > > #include "xe_mmio.h"
> > > +#include "xe_rtp.h"
> > > #include "xe_sriov.h"
> > > #include "xe_trace_lrc.h"
> > > #include "xe_vm.h"
> > > @@ -972,9 +974,56 @@ static ssize_t wa_bb_setup_utilization(struct xe=
_lrc
> *lrc, struct xe_hw_engine *
> > > 	return cmd - batch;
> > > }
> > >
> > > +/*
> > > + * wa_bb_disable_null_query() - Emit commands in the WA BB
> > > + * to disable or enable NULL Anyhit Shader Query Mechanism.
> > > + *
> > > + * Some platforms require a workaround to disable (or enable) the
> > > + * Anyhit Shader NULL QUERY for specific engines (typically the
> > > + * first render or compute engine). This function emits a sequence
> > > + * of MI commands into the workaround batch buffer (WA BB) to
> > > +perform
> > > + * a multicast write to the RT_CTRL register, setting or clearing
> > > +the
> > > + * DIS_NULL_QUERY bit.
> > > + *
> > > + * The sequence includes a semaphore wait to ensure proper
> > > +ordering,
> > > + * followed by MI_LOAD_REGISTER_IMM commands to write the desired
> > > +value
> > > + * to the RT_CTRL register, and finally restores the semaphore state=
.
> > > + *
> > > + */
> > > +static ssize_t wa_bb_disable_null_query(struct xe_gt *gt, struct
> xe_hw_engine *hwe,
> > > +					u32 *batch, size_t max_size, u32 value)
> {
> > > +	u32 *cmd =3D batch;
> > > +	struct xe_reg_mcr reg_mcr =3D RT_CTRL;
> > > +	struct xe_reg reg =3D reg_mcr.__reg;
> > > +	struct xe_reg reg_sema =3D STEER_SEMAPHORE;
> > > +
> > > +	/* Add WARN_ON check for minimum required space (10 DWORDs) */
> >
> > no need for this comment
> >
> > > +	if (xe_gt_WARN_ON(gt, max_size < 10))
> > > +		return -ENOSPC;
> > > +
> > > +	if (xe_rtp_match_first_render_or_compute(gt, hwe)) {
> > > +		*cmd++ =3D (MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL |
> > > +			  MI_SEMAPHORE_SAD_EQ_SDD |
> MI_SEMAPHORE_REGISTER_POLL);
> > > +		*cmd++ =3D 1;
> > > +		*cmd++ =3D reg_sema.addr;
> >
> > I think we can simply use
> >
> > 		*cmd++ =3D STEER_SEMAPHORE.addr
> >
> > and similarly in other places here and let go the local vars above.
> >
> > > +		*cmd++ =3D 0;
> > > +		*cmd++ =3D MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) |
> MI_LRI_MMIO_REMAP_EN;
> > > +		*cmd++ =3D reg.addr;
> > > +		*cmd++ =3D value;
> > > +		*cmd++ =3D MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) |
> MI_LRI_MMIO_REMAP_EN;
> > > +		*cmd++ =3D reg_sema.addr;
> > > +		*cmd++ =3D 1;
> > > +	}
> > > +
> > > +	return cmd - batch;
> > > +}
> > > +
> > > struct wa_bb_setup {
> > > 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > > 			 u32 *batch, size_t max_size);
> > > +	ssize_t (*disable_null_query)(struct xe_gt *gt, struct xe_hw_engine
> *hwe,
> > > +				      u32 *batch, size_t max_size, u32 value);
> >
> > this is not how this works... you should define just your function,
> > and add it to the array below as a "setup function".
> >
> > > };
> > >
> > > static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> > > @@ -982,6 +1031,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struc=
t
> xe_hw_engine *hwe)
> > > 	const size_t max_size =3D LRC_WA_BB_SIZE;
> > > 	static const struct wa_bb_setup funcs[] =3D {
> > > 		{ .setup =3D wa_bb_setup_utilization },
> > > +		{ .disable_null_query =3D wa_bb_disable_null_query },
> >
> > should have been:
> >
> > 		{ .setup =3D wa_bb_disable_null_query },
> >
> > But also beware we are refactoring this a little bit, so on next rev
> > you will hit some conflicts. See
> >
> > drm/xe: LRC refactors @
> > https://patchwork.freedesktop.org/series/151152/
> > More missing XeLP workarounds @
> > https://patchwork.freedesktop.org/series/149097/
> >
> >
> >
> > > 	};
> > > 	ssize_t remain;
> > > 	u32 *cmd, *buf =3D NULL;
> > > @@ -1000,6 +1050,18 @@ static int setup_wa_bb(struct xe_lrc *lrc, str=
uct
> xe_hw_engine *hwe)
> > > 	for (size_t i =3D 0; i < ARRAY_SIZE(funcs); i++) {
> > > 		ssize_t len =3D funcs[i].setup(lrc, hwe, cmd, remain);
> > >
> > > +		if (((GRAPHICS_VER(gt_to_xe(lrc->gt)) >=3D 20) &&
> >
> > this check should be inside the setup function, not here.

I will update it.

> >
> > Also, is this a WA? It's looking like it, which means you need a WA
> > number, add it to drivers/gpu/drm/xe/xe_wa_oob.rules with the graphics
> > range where it applies and then in wa_bb_disable_null_query() you use:
> >
> > 	if (!XE_WA(gt, ...))
> > 		return 0;
> >

We do not have a=A0WA number; it seems to be tuning.

> > > +		     (GRAPHICS_VER(gt_to_xe(lrc->gt)) < 30))) {
> > > +			if (lrc->flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
> > > +				len +=3D funcs[i].disable_null_query(lrc->gt, hwe,
> > > +								   cmd, remain,
> > > +
> DIS_NULL_QUERY);
> > > +			else
> > > +				len +=3D funcs[i].disable_null_query(lrc->gt, hwe,
> > > +								   cmd, remain,
> > > +
> ~DIS_NULL_QUERY);
> > > +		}
> > > +
> > > 		remain -=3D len;
> > >
> > > 		/*
> > > @@ -1175,6 +1237,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, stru=
ct
> xe_hw_engine *hwe,
> > > 	map =3D __xe_lrc_start_seqno_map(lrc);
> > > 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno -
> > > 1);
> > >
> > > +	if (init_flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
> >
> > ahn? Please don't mix LRC_*_FLAGS and EXEC_QUEUE_*_FLAGS. This is a
> > recipe for disaster. I don't see why you'd need to set any flag in
> > lrc.
> >
>=20
> I think the caller (__xe_exec_queue_init) needs to go from
> EXEC_QUEUE_DISABLE_NULL_QUERY -> to an LRC specific flag and pass it via
> init_flags.
>=20

Yes. And that's why it's part of init_flags.=20
Do you foresee any issues here?

- Nitin

> Matt
>=20
> > Lucas De Marchi
> >
> > > +		lrc->flags |=3D EXEC_QUEUE_DISABLE_NULL_QUERY;
> > > +
> > > 	err =3D setup_wa_bb(lrc, hwe);
> > > 	if (err)
> > > 		goto err_lrc_finish;
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c
> > > b/drivers/gpu/drm/xe/xe_query.c index d517ec9ddcbf..5b48befd32cd
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe, str=
uct
> drm_xe_device_query *query)
> > > 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> > >
> 	DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> > > 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> > > -			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> > > +			(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY
> |
> > > +
> 	DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY);
> > > 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =3D
> > > 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K :
> SZ_4K;
> > > 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] =3D xe->info.va_bits; diff
> > > --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> > > e2426413488f..adab49e63757 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
> > >  *      has low latency hint support
> > >  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is
> set if the
> > >  *      device has CPU address mirroring support
> > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY - Flag
> is set if the
> > > + *      device has null query support for anyhit shader.
> > >  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory
> alignment
> > >  *    required by this device, typically SZ_4K or SZ_64K
> > >  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual
> > > address @@ -415,6 +417,7 @@ struct drm_xe_query_config {
> > > 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> > > 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 <<
> 1)
> > > 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> 	(1 << 2)
> > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY
> 	(1 << 3)
> > > #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > > #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > > #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > > @@ -1270,7 +1273,16 @@ struct drm_xe_exec_queue_create {
> > > 	/** @vm_id: VM to use for this exec queue */
> > > 	__u32 vm_id;
> > >
> > > +	/** DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - \
> > > +	 *	Flag is set if the device has low latency hint support
> > > +	 */
> > > #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> > > +
> > > +	/** DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY - \
> > > +	 *	flag is use to disable null query check for Anyhit shader
> > > +	 */
> > > +#define DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY	(1 << 1)
> > > +
> > > 	/** @flags: flags to use for this exec queue */
> > > 	__u32 flags;
> > >
> > > --
> > > 2.25.1
> > >
