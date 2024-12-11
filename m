Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3837E77180
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 18:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8565510E60B;
	Wed, 11 Dec 2024 18:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d944jo6l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B31510E60B
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 18:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733943205; x=1765479205;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ro7wxyRtvedUio6U/H4Ji8IFIAD9IFmLN11rFjSbZ1g=;
 b=d944jo6lPJljOdCIM8+lUwasPevCFiew+TE5NAFdeWViu0LMzq8PoLCG
 IqgTqoSYwXOJNWd6dzF4NE2bZ1jgnSwZPUxLgnsuzb1rfauYrE9aycGo4
 BQi16xjF4QHqeuOouUrblZUGOPdr/P4CYdHvwjyV9WRBMXqYOwkTMvWq3
 qo5N5oLjJjZ02rX4pYDhHRP0l3J6eqr9YLpGJpT6bvdkdqv7MgwI0xeGI
 TQzBSqOgFkrBRfSfn1wJhlz9CDrVElTYUGZTAIwJP3xBT77Fjtq8wUIFp
 +BZ8XQY0yZ6Re9CRH6nYiLtcJI+lseF5JR5sPdh9v+5Nmd0Nmupd8k6e8 Q==;
X-CSE-ConnectionGUID: HFQWVrQWTxe0WIaGG3Zqxw==
X-CSE-MsgGUID: KtP88J/5TQKUHg9vtaChiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34475292"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34475292"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 10:53:24 -0800
X-CSE-ConnectionGUID: w8Dh7nrlSGC5PGC7CoADmw==
X-CSE-MsgGUID: UwubY05IRmSLgTmJdZnCkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="95774538"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 10:53:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 10:53:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 10:53:22 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 10:53:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGE5QmlUICfXEcuhWKaVUrKrG1soC5XFvCvzFu9O9aSgbi9JLmRng2LeLGHZUxqttc6ldSxWDqB9mZCo64Ye3yHuHrMuU5t+vJKrD/mBCBed/Rn/tMOiryZSDR2Pcg/58rRe06vTxUdXO888IAs/9B3aJeC0O1q2OnjaA7GK/sONfe9WsY9SH4rmpBgT67WFRVH2Q2rsIlocR+OV1nhXX56Qth4yAxuj+DntRa4DVB335V6RfUIVaabxpY4kFBBL//4ovoePCdxjykuRKeXXdis37gP47ma1U+dfUBtLyYA+gIvDdNJbgLNaaHOpAI4dvHW7xG5P20/v0pzwltMZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kwUORFFajzdJq4fvqtoODOfneeyhkYYDra0U2OtgZY=;
 b=gaxq7/U9dRrNWF3C4rYT1lPPZNRX5z7ojmJAi0tBqgKz/VkWnx2WxQ/5Fn90b5xeYyUM58lsilNWYpy8v3/8yiWpYnvJbk8j5Xrb88LYuz+Wp/RN601qd6+o+4tQqsbC7sWCDW6e6aEpD4y0iOzQMSIC27UxTlnKrhneWZpFkU3614UCrknhkZ8e3Inm91rQphw5FnCqgK0o1FOYJzbHCavXVX6g9SuIw+s5c+15Jowr2VV9YaRiVA7v+X1/JKAxlYMZN6KbJp0C5SA33qVjd6FtN9NhGLCl0jL41eWayzJKfUMmbfZqo1tT9LL1Z1cTBRpEqk2OwBXoCAnfmTtlwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Wed, 11 Dec
 2024 18:52:37 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%3]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 18:52:37 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/ptl: Add missing device ID
Thread-Topic: [PATCH] drm/xe/ptl: Add missing device ID
Thread-Index: AQHbS9YrJRBnHlrvq0yivDk9ICyfHrLhWjGAgAABOjA=
Date: Wed, 11 Dec 2024 18:52:37 +0000
Message-ID: <SJ1PR11MB620402597212EED8751116A3813E2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241211141306.2156467-1-tejas.upadhyay@intel.com>
 <Z1nXNwEpER3vwazN@intel.com>
In-Reply-To: <Z1nXNwEpER3vwazN@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH3PR11MB8434:EE_
x-ms-office365-filtering-correlation-id: 904662a3-62fa-4802-265c-08dd1a14fb45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?g7Q9giTaNe7mjL6FcQQJcZBsFjyEOA7uMuEwYPZsjjQU2A72DVkywImhtGSx?=
 =?us-ascii?Q?jOnYGJbldfKOz0eK45j2W5XdOXnOOcc0sDxJHR5qLjQGiYgTOjlGx0exK9D3?=
 =?us-ascii?Q?q9+ZkOHxCfTqHpoTD3UtLE6p8LcJTcZxNo1/U1hROxvQXjaGCBKZPVqwhheB?=
 =?us-ascii?Q?rQCL2N/EtHwcWSx04fFR5ERsc6qgV2RSv7Qd6VQdcTixRf4rSxkqnCV+SrXP?=
 =?us-ascii?Q?1wSivOlLF5MjLbunfgs0cA3+oHcaZl0hq53J69+MavGOub64/2V8/C+FIFz7?=
 =?us-ascii?Q?FzEeYgmBjW8dg+fv3F9fiJS1bxAApxGTJFwIjOENYbVVX6Y7tTNoO57ZpEbG?=
 =?us-ascii?Q?j8ANcXqrJ5QQNdkGde+HymKPyo3SdeVErzUGxgEIMFX+e2/Q6zN8uTcD/ae9?=
 =?us-ascii?Q?zj2oPft7VY7HgQShENX7yu7buQMEoXhmKo7vP6lju50QYmL5cPvca0rJcKN+?=
 =?us-ascii?Q?/gYfhZr/0L4TnpdFvWaWbt4Kw9t87w8yYd2Z8FzwMmngcnqUc4UkFPpUKO76?=
 =?us-ascii?Q?ZsY9MMvuyDuBL24O8siemQ9YdyZldOY6WmzPgCzhqKd6pJdpDYfydu9eC0cN?=
 =?us-ascii?Q?9uu6vUauv7yZGtYII4tETVJBWJQkvyATf7W8xk8Le/zHxY++eV4pZOEEmrvX?=
 =?us-ascii?Q?VZBFnCrpUEgT3V433xJpUTdOWXOtf0LbqMalKNN7tALVwNn2NUACfOJoUghJ?=
 =?us-ascii?Q?9BD6TFJVVZga4N5P7V3bQsOR/SSbpv2W6lqyP7huf+hefLbjKWL1F6zIKHdp?=
 =?us-ascii?Q?WEEb85I+hE5FT2qxVK4aeUnrJHG/sWZmKrCfzWv3GSQza1Sr7VSz8QXRGV8f?=
 =?us-ascii?Q?24QVvNWLp3jU90vCjCzpvrN4qhJyeDgD+qDvbmC53bH+f1lAxVP7wLtyr1Py?=
 =?us-ascii?Q?otQmGitEw/swn2gBpfRFeI4mvnlzi63go9zgW5DfB/kw3bQL/ZDXxMO8pYhP?=
 =?us-ascii?Q?ZkSdbG/MfnEtQFotTeA/ww8pSV/LjMLmadrWZk1VQLB4LH0DjXLR3BJVuQ9/?=
 =?us-ascii?Q?j99hEXwqumDMfECGUeKPU2Qhm4heFXoEFSjXs3aQW1O+vIf8eUYwA+D8AG94?=
 =?us-ascii?Q?xvCepFwKfaSWSPNXEuNF+LP+DptaW1073DI2hJDA3OWf/axqtB4cIJfwYJz2?=
 =?us-ascii?Q?HgTsrWs9pj2Gq0brqUCmZrwkVx4BP9d1Wft/ZNjy8bf1jNTYp2XBBbUUsiYZ?=
 =?us-ascii?Q?TDA2dyw7G9/l4LMABvV/yKv6b+JiJZGlcHMjPzsgKqje6ECQc84wIwZ02/9u?=
 =?us-ascii?Q?sBkIT795en+R+tIt46pigRQbt8ZQF3mgbXLsDwOmp1QhpJU+MSktBEGkSjxw?=
 =?us-ascii?Q?hN0u5tfbdMAI71Eiahtv9XQhlqwUrQhPi+c+7v9ar3MzcBsz36dpMZ2ZdIlY?=
 =?us-ascii?Q?m6g6/0q+JG81ukTP+OUcfDqWZeZA6U6eOY7SkC4j6l9mutSxbA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OQrxMhG6EM/b+n++ZSRVHmdzEQ4Be4pFNvlUIC5ldEyq+RXBh5HP8TPPFexh?=
 =?us-ascii?Q?tLI6rjp6ftWfMhO4sgh5g6L56cU6dQ1Nd9+c4+YSX4zUyC2wOpyM5eN9Dty7?=
 =?us-ascii?Q?EgAcWMRk5ECoiNxRAlq3hWqXC3Q5vB7yosKTfL/bnuAFEwJLl2tqyaahRqB7?=
 =?us-ascii?Q?iXcIn9MR1rk2anGNpDMF6L7d2ILSOkhSz/Kv5KiVLVU1PnehyIlw6lqyjDeR?=
 =?us-ascii?Q?w5huhb0SeQOS7H2vO4fElSlfUN6FSTi42Hw0xZ7Dv485TDVPEfAMJGwKV+yK?=
 =?us-ascii?Q?KMUzYVQov2V0MMgeS3uvW75Fo10x4/2PiX2ppx2KZ2bCzDzazxgJv2VZNajP?=
 =?us-ascii?Q?5qkJMi0bs0uJHuEyahZLt8Ouf3eKkZqodxdVJJlhqtrceS+31oSzZIEa8G8x?=
 =?us-ascii?Q?DKJ7ykwOcU1cvpoel21XZOdE9K6ckpz7+NX/vaDm/JrhMkXjf5xMcTP8o10A?=
 =?us-ascii?Q?AdYlF1PWsRzO/9QwGLIcd76krSdQzXn2NG4bqgxcuOcSWfd6K8KDzSiQdVbT?=
 =?us-ascii?Q?FmZFpB1bQ9EgMvA6k5YdcG6+XFYcLg/DfyOBckx2WW0uti6SQrDO9rZHi/Ud?=
 =?us-ascii?Q?qtnWdTUfwbhXYwRTrHM1HHryrocvnrG5eujv0ycHOydGvYr+ZfMaiRXXdnBK?=
 =?us-ascii?Q?YN/mUYR9iEMcWhhVi7A3XMmGuFxvpqSKNd8WgjromGZyCi/1nlpNm3qDI0dE?=
 =?us-ascii?Q?EYm88cRg6Mk+F5KVb4KsEnm+9MXnpeJIfcdaxie2gvKqtvcL5ggbWIy/2vMQ?=
 =?us-ascii?Q?hvou2GPibDl2FvjzYH2HSCI7Y9/hOzfgAdG7Car2hVUdJ/L36gFL3Xhdxw6t?=
 =?us-ascii?Q?bNCg9Sm6o7HiElb0DiQuo10RQIt7aL/4TEl91xx+bP7oDbiWzI/yxmCkyldb?=
 =?us-ascii?Q?m3/siAJyPeyGgzKwNfnYqanCX+27laTJSqfjTR9P4FrN02ZPyWPd2X24b99y?=
 =?us-ascii?Q?fHElWfPhaSOL3p7uJjQ5FSJJNfJBlBATjwBpNBfMUsfFR2Fz0Vg3EuhIsGXC?=
 =?us-ascii?Q?pYchj546IS0U2rRAWdegPvKAXDvxwmXG6CmMxmsv72/F54Rx9S4j6X+7ObUJ?=
 =?us-ascii?Q?ROztNcKDADA5ptzDxF9lo/EF4vzhoGNn29mRXqmDrzSzu8KvdtAjFnOgQj4X?=
 =?us-ascii?Q?KF/A2mmXJ0J0fm3pbHJBxKTqkDaIRNK6D5E0b6C/Gd3Nsx39yTzDfO7EbFfb?=
 =?us-ascii?Q?S0SeuNWX31iaOmf2RTxgMR42q0EPrZSIjt986cwSNWPI3F4NODQSIYRPFn7x?=
 =?us-ascii?Q?r+I1IjCGkMroDKPVVliY/nWWf6TnitO1WptPfl47tdZto8/xnSWsTPnAFtHB?=
 =?us-ascii?Q?4RX5Ei8iJPERpAEISQZeseozWUkxbH/G43dVhaBcX5VWinkuklK7CX60dKyk?=
 =?us-ascii?Q?S8S3ZAK/fuL0+0yQGhuRu/EnjZuX4m540fyMi/RJVYwo2+4QL8VWLZFGI//v?=
 =?us-ascii?Q?O0W+D/MmBno8AeKoKDJcvgM2CRIdibYlQMT63qOQ5xR7VatnafrERilA4/tK?=
 =?us-ascii?Q?sAKc89SDqirRI7wskugmNWovsxEMQ7/fCucY/azKsJ9W2Nzcm+VerrxSFWEq?=
 =?us-ascii?Q?z3eNzgJ0X2atnRHYzREVs1g6L124bYWfXbC/jVsG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904662a3-62fa-4802-265c-08dd1a14fb45
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 18:52:37.3224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5BqexoqhgJJWqNfTw6FqmkG39rPUSj/qpWGl3n4yP8mBRhKr2jBxp1cko+ssUzemi6lqInzmFqfWtXChrDJeB9YADHstHOfmWaFGWMzs8OA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8434
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Wednesday, December 11, 2024 11:47 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe/ptl: Add missing device ID
>=20
> On Wed, Dec 11, 2024 at 07:43:06PM +0530, Tejas Upadhyay wrote:
> > Probably during movement from xe_pciids.h to pciids.h PTL device id is
> missed.
>=20
> Please check if this is indeed true and if true add this with certainty a=
nd with
> a Fixes tag. Otherwise keep the message simply as 'Add a missing PCI ID' =
or
> 'Add a new PTL PCI ID'. Always imperative mode.

Yes for sure its missed. We used to have this PCIID in xe_pciids.h.
=20
However, I just found out, drm-tip has this PCIID so probably some next bac=
kmerges will take care of this. Please, lets drop this patch.

Tejas=20

>=20
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  include/drm/intel/pciids.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> > index 32480b5563db..7883384acd5e 100644
> > --- a/include/drm/intel/pciids.h
> > +++ b/include/drm/intel/pciids.h
> > @@ -829,6 +829,7 @@
> >  	MACRO__(0xB092, ## __VA_ARGS__), \
> >  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> >  	MACRO__(0xB0A1, ## __VA_ARGS__), \
> > -	MACRO__(0xB0A2, ## __VA_ARGS__)
> > +	MACRO__(0xB0A2, ## __VA_ARGS__), \
> > +	MACRO__(0xB0B0, ## __VA_ARGS__)
> >
> >  #endif /* __PCIIDS_H__ */
> > --
> > 2.34.1
> >
