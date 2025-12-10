Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BC7D3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 06:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8709210E10E;
	Wed, 10 Dec 2025 06:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XxRqFImE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407DB10E10E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 06:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765349346; x=1796885346;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9I9pXDsYFppSqxCAbEVaal6IVliq6t7Hkp/iw9xIon8=;
 b=XxRqFImEjwoQ+C4tdCcyXUUXzR0czIKvx7g+RZNB/ovpB4oKTKHhn5nw
 +jXGjz+1QGnCGdIhlV1/RMe1YV+lYU27+Od++xXf9NlyoWj8ECvs5d8WB
 ttsG/zNcmQM8yD7CmILbEjssvsz0poM+sQUJFaWwg/F5HYKdd6d6DMDtO
 N7eWqokkRIfRk+NsJRqFcDSDkaf5g2FPr4BnIXXQR9YdsTH0M7zwh5wI0
 6tstLIKauTNb8YPfaSA43JEtM0vKJPSwAxax7y1LVS1l5XVjPt4fn1Gu8
 SGTQ74lei8elvXBlOwXPYIs8xhAtNj8gN8wJd3OTJh6mc9knLYa5RqNvx w==;
X-CSE-ConnectionGUID: IQEMax+qQReYxLtQ2LkEdw==
X-CSE-MsgGUID: VpG2PX5MQmuK8k1JFAYHTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77633560"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="77633560"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:49:05 -0800
X-CSE-ConnectionGUID: FxYyePtcRhavG09wxaAZ1A==
X-CSE-MsgGUID: OWG9UOYlSPGhe1tncd76ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="227097291"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:49:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 22:49:04 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 22:49:04 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 22:49:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCxk3XG1oWTLNRxF+vD6XsDi3Gtw8SeECiNUt5Lp1Rw4/Dr9q+/KapOtAGhUfgQyORzvEU8HokoWYxn8BFE4xiDkZR9XYKuotFXUM04g/qDUM1NVSqSqMDktAavdZOulbxG7wYVwb74XxRwI8mAM1tlVu83ZrSBxJx9JZJv8pGPK+r043lFMhLsXbWufFnahO0d6zrQRjkjv3vmGBfBlGCXZxThjcftd2REgoDAER9suBgx5WceEmYy4xoTvVJ/00xfqqAGQpfXamtQYfY66b6wJkVzuw0QYQEmaZQwjVxleXt/2RKQyaxzVthl1AT/GSl4BFxYXjwlXkfNVD3MNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnzA0f+X1eOgz587XXKCVHPn6KzC3lJDHzRYDuAhQbM=;
 b=iNSJoIPqtGmLXZn5p+Op6rvTj/r9UOANOoxQOw4LS0fHpyrtao674fU5EKKxoI9K0T2Qf8thfP7zs/hk0t9joyWg7LUoxMn8iQoLknDDNU4iQJdHd+v5OzbojixrkqT0rNWuyL6ulFwjvl7x5lVXyxyrlARHnf34I/ooNQy8QVbZpXe5yI9PTRXSPzB0LEB1BhOPK5MEM0C1heVZIcXj3wD+rp6voKHHXvnY1yfYnXbU8ZL8ZHnk/LPMcNOtI31N8Of+CS3tI4fClkNs9VhlcgflRkU4xqn0vpSeJAqrLqWzqVwd0N87XCmmUfpVNAHwEcw8hwPp/aNa9kmS9M+8zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH8PR11MB6659.namprd11.prod.outlook.com (2603:10b6:510:1c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 06:49:02 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 06:49:02 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v5 09/10] drm/xe: Optimize flushing of L2$ by skipping
 unnecessary page reclaim
Thread-Topic: [PATCH v5 09/10] drm/xe: Optimize flushing of L2$ by skipping
 unnecessary page reclaim
Thread-Index: AQHcaXa1J8OpU4lECUO9luXXKGwHhrUaYl3AgAAEkICAAAaLgA==
Date: Wed, 10 Dec 2025 06:49:02 +0000
Message-ID: <SJ1PR11MB620497323D0CAD04F74EAD1181A0A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20251210014517.3184135-12-brian3.nguyen@intel.com>
 <20251210014517.3184135-21-brian3.nguyen@intel.com>
 <SJ1PR11MB62042A41A4F6B342ABB9A87C81A0A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <aTkQ6y+ydM96tsqx@lstrano-desk.jf.intel.com>
In-Reply-To: <aTkQ6y+ydM96tsqx@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH8PR11MB6659:EE_
x-ms-office365-filtering-correlation-id: e1658ea3-7218-4c1a-6387-08de37b83447
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tsd6xHeQSHvrMlnjO+diVoD8tLgzXX5jDd5Rshu1P/UyJx2GonPwEZN9mhTP?=
 =?us-ascii?Q?O3HnglPsvdzkfUyBHk5AoHQFlfEF6AmBZzD8bH3CCNblt64meob7tiCwQunv?=
 =?us-ascii?Q?0qDcEJsPNfEgr5HbBTiP+s8eh8D3ZSQL3EU8x6COApREkNIPj4/ubJH33k1m?=
 =?us-ascii?Q?DEwE/lJmInze2QrymnPyYgEibLXa5vKjF+LbRaRfyQbhVnpBuIpHpFVpaVSE?=
 =?us-ascii?Q?+Gu9GcqjEKx690yTw6Gnpl1cAuf9QePwMbliwpytrQi5Kb5820JE6bg9o8WH?=
 =?us-ascii?Q?8u4OYRJN8LqP4FYripZp9r6qU4/7ohxNdc1x6x4UeGJI35ZSAMtLfral7vC7?=
 =?us-ascii?Q?iz/kR6Ie2z5iQZ6SLelwe/Nec4UrV1KGly5FRD/WgRSMlYaVFPsshAybIOBF?=
 =?us-ascii?Q?yiCAQdQf5ntzrXr8B3tMKse8dP1DchoN3te+RIN3gzEWt7sPZTPfEaWJxgVk?=
 =?us-ascii?Q?eD+7VMJnmr9ZM1CW0YkfrPvTTGfk/9uGLG+WD3bSd/KQUKQ1SDrBDoo+HOvc?=
 =?us-ascii?Q?+ES2t3zQlC1CUxsKMgqmOLJqJcV7YQ0tiFdxkQQ2ysPjyumAJ55AecE0C8FG?=
 =?us-ascii?Q?0Lk0oam7Yhirpfpnjvyj9ivhRez6OH2UGPPU9iaHMHwan9kESDGKU+FicYc8?=
 =?us-ascii?Q?HkGfPrqt4gdf/aKfg5+UXx/a83YvRwQPMKiA+740Ilv5dLGPUXj38mYI+xJq?=
 =?us-ascii?Q?Dmi2qzp7lf/A2ByUOrslpXVhNC7oz5FV2sHl7O9Fnju8KePRjWEspJZ9OgmK?=
 =?us-ascii?Q?L2V3veLsLOb7YY7KTpytqdOo52blLYzKosvvCVCNwKFifAOqXgEaEc+L4/gO?=
 =?us-ascii?Q?nEiF9Nxvl8GinhaSUfkR/6KLOMUngchdCm0X1u0vyN5GUGuOUN8KNotmKm7i?=
 =?us-ascii?Q?RDbUIeKKfXH6beKhn8zZG8hMMo2wxii3j6YMb9RVvDDn7oaIKdT4ySLZ1LVz?=
 =?us-ascii?Q?/qfnEp3XumWS0Q3CBW1EiM2/7O5D0wzQLT9l9WaBr1wvBS/UnSUNWVzHjOmo?=
 =?us-ascii?Q?+fyuTGThTj1oOz4ZMHxdL6NHuxxQBLypB4+iCl95EjDULM2ZiZoSTKrNOZFc?=
 =?us-ascii?Q?tcJVlkmsUBSqYRw/ZeJ9n3/vT2j3cSeMl1j/B4Mm24uq8DMBRorRvVJ1T1Qg?=
 =?us-ascii?Q?42e+mbnA80KGa/ngMV/C+DgJthyIk+rKWpV6OT2qQQ+PFNZQi71qcTSOETu5?=
 =?us-ascii?Q?YGm5TdUYO8ntIZaLFzz83+vdhRSDy2JWIclfBfHJLT3zFxHIunV2Q+XqxYE0?=
 =?us-ascii?Q?YFnBZdgOuksiDIR8kChc0RoEe9E+5vLzTThIyattkTJp8fF0VSj/fl08wwrn?=
 =?us-ascii?Q?/WuI7tAObJUFqOmY3jCENcrhM+6eBE2prAQv0ziUUIja46/Yb5aRyNlfQK4l?=
 =?us-ascii?Q?H/vokAg2w7HRpaBPYYy0eAupF1FS7UGFlyHXzyvsOAxPN4pqZITr+CUZwoAT?=
 =?us-ascii?Q?QhTYVc2J6UDzt/tn87O0PAOydy729/5jU1L7/Cx9ABHGsu/QZ/0TI/zYLIo6?=
 =?us-ascii?Q?MjNIbbcQl/Mpi8ShpnCDiBI7mE84I9EaiN69?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7tjYsrL7VUI1bjEK+fv5HVyJArZ+bn+SrG2+9kTTSoP/MA+kIbVt230cWsKw?=
 =?us-ascii?Q?E4CzpNwuLY4qvrqpsRz3mpt9FWlPLqOVzcMiUP1/o/ex3rBFnSRasm303ESq?=
 =?us-ascii?Q?4puVGNPqzZaf/6Fd6jFFdHVFDj/sIdEkVcYE2DA6pnotuEIyKlKc+Fmz/pic?=
 =?us-ascii?Q?m7Ri7gGS9rdBFp3xKRMHfEYgWH/qsFBcsNl5igkpjHVy8d9nIgb1/5QITL8b?=
 =?us-ascii?Q?Jdsv4xKKQOFTjmsG0fdcAniq9PkN4bTe7UDheVetTofyrJQqL7ba9O7DuNmk?=
 =?us-ascii?Q?5MEch4Orxmm0wkDqi9SqveiYBtDtf18+lZkg8f/LeiJol73qwhyr5c3/i39c?=
 =?us-ascii?Q?kyG7BY82gUvLvx/w3GlZkt+QxrrlCLXxY/wlbA+H7zUPE9BONMbmdnvrxazH?=
 =?us-ascii?Q?pEHUewAvfuOpHMYNJwZp6JwdaP5MtXGVhP6uCxvkVHnc0th59mepk1dOJsHr?=
 =?us-ascii?Q?xYowGkJgnzALIzkY02VzjHfBxbn7tNKcDZ1p+00gI1CyEuMckSGvJh6HclMr?=
 =?us-ascii?Q?nyqSezz8KKXv6t5eahhw4Dtjqit9ngMt7v7z8tvIIMNlk7Txx9cZ/c0KZ8JW?=
 =?us-ascii?Q?OQcyP35n8kqXnuGwG9pJP8wgKU7bn5hccNGHPDMOQZOiH4pZG5WL214KptwB?=
 =?us-ascii?Q?VJKcmgMmHJm5OAyJOMIy7lfgRv2f12f2KYi9/hMZD1tyNt/z+R6A0QI0q383?=
 =?us-ascii?Q?rZqSFOlAZZqujyLlggto8GgLRoi87juNPG1gOWMMz0sYhMAb2Z0AcoflX6n4?=
 =?us-ascii?Q?lqYbvV/sI9J2AGx/saBPCDxfceRbK+ljyOgDI0nlk5OkSQEs0O+CqBoO43Kl?=
 =?us-ascii?Q?Ln/Ko7w0hi0kD2JUD2vm5g17hYJcoG9sWs4LGku0RrX0lsUyclb/NrzZigPO?=
 =?us-ascii?Q?KLvw6ZWTtQvV5MH/VbR8YqsprZLF97IsTT7VIIQcexME65jQQ3jE1w0RAT/s?=
 =?us-ascii?Q?cpvKjiYjm+/LXGmqspozFQ7EY47Ij1FcUTXLR6l9HEwRXQT4tqqcCLk4W0fk?=
 =?us-ascii?Q?NOch1IV9H0qGqMTJrE4Tcr6DTM77jY56tlXRgnfu2B95v5hlebpOaD6D8Rnc?=
 =?us-ascii?Q?oVE6cSuPf7vNHnRsVIYZe0v71kWQbi6wulQFZ6RsAlz7Pd95/PalNJ8Tgkqm?=
 =?us-ascii?Q?QzrzxiORWcSHxfB0ODBGPg0Z3TU4Hcdx4UcnyDS4KaNjmbhKNPy5XZJ8Fckl?=
 =?us-ascii?Q?rR72e3y21PmIkUVSbwJW1/9opDY6J46k1MKo0lVPWhi5t+QPqvXNyc+85iPq?=
 =?us-ascii?Q?U6QgqeAzIO7dij1k7t1rHCUND9bHr8eq5hS6Al7zDMpyIVEVXnHVjPzKOY3d?=
 =?us-ascii?Q?OITcuOUGyfv325naSclCjWvEyudRvXl5RehfV79YzaB51jKQPYDgvLLEBjDE?=
 =?us-ascii?Q?YJMNZ7EZZrX/KISm7QGRHn2uQmZCeaJHpRCIPjU0ejkg4jgtxxSomznooiMg?=
 =?us-ascii?Q?OvQQPtq42oZFBn7sKl+aChGuHAaRWFoBdDCDDVadbRHyYtH/X0zhpiVUt+st?=
 =?us-ascii?Q?aPUG3wLU/otzqeER5JcI598QCVjUqdndXtLhq16MiDq9H3UCp1g4U8+zViK6?=
 =?us-ascii?Q?jOj+9owDTtNZH4XXoa0mUV4S0mnWtUUmSTnQ83vo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1658ea3-7218-4c1a-6387-08de37b83447
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 06:49:02.3739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MfwJLLJIx8t6lW4Qh9HOVCj/r3yz18Ps4uijEa73fKMphHMUetFsgkm5iIyURk8YbQcShN6IGUldo+ZPsWOnh0JtAhuRQnubcrMdWcIyUeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6659
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
> Sent: 10 December 2025 11:49
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: Nguyen, Brian3 <brian3.nguyen@intel.com>; intel-
> xe@lists.freedesktop.org; Lin, Shuicheng <shuicheng.lin@intel.com>;
> Summers, Stuart <stuart.summers@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>
> Subject: Re: [PATCH v5 09/10] drm/xe: Optimize flushing of L2$ by skippin=
g
> unnecessary page reclaim
>=20
> On Tue, Dec 09, 2025 at 11:08:16PM -0700, Upadhyay, Tejas wrote:
> >
> >
> > > -----Original Message-----
> > > From: Nguyen, Brian3 <brian3.nguyen@intel.com>
> > > Sent: 10 December 2025 07:15
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Brost, Matthew
> > > <matthew.brost@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>;
> > > Summers, Stuart <stuart.summers@intel.com>; Auld, Matthew
> > > <matthew.auld@intel.com>
> > > Subject: [PATCH v5 09/10] drm/xe: Optimize flushing of L2$ by
> > > skipping unnecessary page reclaim
> > >
> > > There are additional hardware managed L2$ flushing such as the
> > > transient display. In those scenarios, page reclamation is
> > > unnecessary resulting in redundant cacheline flushes, so skip over th=
ose
> corresponding ranges.
> > >
> > > v2:
> > >  - Elaborated on reasoning for page reclamation skip based on
> > >    Tejas's discussion. (Matthew A, Tejas)
> > >
> > > v3:
> > >  - Removed MEDIA_IS_ON due to racy condition resulting in removal of
> > >    relevant registers and values. (Matthew A)
> > >  - Moved l3 policy access to xe_pat. (Matthew A)
> > >
> > > v4:
> > >  - Updated comments based on previous change. (Tejas)
> > >  - Move back PAT index macros to xe_pat.c.
> > >
> > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_page_reclaim.c | 32
> > > ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_page_reclaim.h
> > > |  3 +++
> > >  drivers/gpu/drm/xe/xe_pat.c          |  8 +++++++
> > >  drivers/gpu/drm/xe/xe_pat.h          | 10 +++++++++
> > >  drivers/gpu/drm/xe/xe_pt.c           |  3 ++-
> > >  5 files changed, 55 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > index 0cce5ad2e33b..fd8c33761127 100644
> > > --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > @@ -13,8 +13,40 @@
> > >  #include "regs/xe_gt_regs.h"
> > >  #include "xe_assert.h"
> > >  #include "xe_macros.h"
> > > +#include "xe_mmio.h"
> > > +#include "xe_pat.h"
> > >  #include "xe_sa.h"
> > >  #include "xe_tlb_inval_types.h"
> > > +#include "xe_vm.h"
> > > +
> > > +/**
> > > + * xe_page_reclaim_skip() - Decide whether PRL should be skipped
> > > +for a VMA
> > > + * @tile: Tile owning the VMA
> > > + * @vma: VMA under consideration
> > > + *
> > > + * PPC flushing may be handled by HW for specific PAT encodings.
> > > + * Skip PPC flushing/Page Reclaim for scenarios below due to
> > > +redundant
> > > + * flushes.
> > > + * - pat_index is transient display (1)
> > > + *
> > > + * Return: true when page reclamation is unnecessary, false otherwis=
e.
> > > + */
> > > +bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma) =
{
> > > +	u8 l3_policy;
> > > +
> > > +	l3_policy =3D xe_pat_index_get_l3_policy(tile->xe,
> > > +vma->attr.pat_index);
> > > +
> > > +	/*
> > > +	 *   - l3_policy:   0=3DWB, 1=3DXD ("WB - Transient Display"), 3=3D=
UC
> > > +	 * Transient display flushes is taken care by HW, l3_policy =3D 1.
> > > +	 *
> > > +	 * HW will sequence these transient flushes at various sync points =
so
> > > +	 * any event of page reclamation will hit these sync points before
> > > +	 * page reclamation could execute.
> > > +	 */
> > > +	return (l3_policy =3D=3D XE_L3_POLICY_XD); }
> >
> > I think you do not want to skip anything here as far current HW capabil=
ities
> concerned on upstream. Though normal flow of transient display flush by
> KMD driver will flush, you cant be sure and you need to flush full at pag=
e
> reclamation. The idea of skipping came because of HW capability to flush
> which is not there in any of upstream platforms. Probably we can drop thi=
s
> patch itself!

I just rethought, I think this will be executed only when has_hw_page_recla=
mantion is true. And when page_reclamation turns true indirectly transient =
display flush will be take care by HW.

So it should be good to go, with that :
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas =20
>=20
> Well maybe (?) - tbh I haven't the spec on this skipping.
>=20
> But if any upstream platform correctly reports a cap, future platforms re=
port
> the different cap, completely reasonable to merge now.
>=20
> Hoe about a bspec link in the commit...
>=20
> e.g.
>=20
> Bspec: <number>
>=20
> So we can all get on the same page.
>=20
> Matt
>=20
> >
> > Tejas
> > >
> > >  /**
> > >   * xe_page_reclaim_create_prl_bo() - Back a PRL with a suballocated
> > > GGTT BO diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > index f5f07e2e114f..0faea29f3964 100644
> > > --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > @@ -18,6 +18,8 @@
> > >
> > >  struct xe_tlb_inval;
> > >  struct xe_tlb_inval_fence;
> > > +struct xe_tile;
> > > +struct xe_vma;
> > >
> > >  struct xe_guc_page_reclaim_entry {
> > >  	u64 qw;
> > > @@ -68,6 +70,7 @@ static inline bool
> > > xe_page_reclaim_list_valid(struct xe_page_reclaim_list *prl)
> > >  	       prl->num_entries !=3D XE_PAGE_RECLAIM_INVALID_LIST;  }
> > >
> > > +bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma
> > > +*vma);
> > >  struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct
> > > xe_tlb_inval *tlb_inval,
> > >  						   struct xe_page_reclaim_list
> *prl,
> > >  						   struct xe_tlb_inval_fence
> > > *fence); diff --git a/drivers/gpu/drm/xe/xe_pat.c
> > > b/drivers/gpu/drm/xe/xe_pat.c index 6f48d34711a6..2c3375e0250b
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.c
> > > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > > @@ -9,6 +9,7 @@
> > >
> > >  #include <generated/xe_wa_oob.h>
> > >
> > > +#include "regs/xe_gt_regs.h"
> > >  #include "regs/xe_reg_defs.h"
> > >  #include "xe_assert.h"
> > >  #include "xe_device.h"
> > > @@ -231,6 +232,13 @@ bool xe_pat_index_get_comp_en(struct
> xe_device
> > > *xe, u16 pat_index)
> > >  	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);  }
> > >
> > > +u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index) =
{
> > > +	WARN_ON(pat_index >=3D xe->pat.n_entries);
> > > +
> > > +	return REG_FIELD_GET(XE2_L3_POLICY, xe-
> > > >pat.table[pat_index].value); }
> > > +
> > >  static void program_pat(struct xe_gt *gt, const struct
> > > xe_pat_table_entry table[],
> > >  			int n_entries)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_pat.h
> > > b/drivers/gpu/drm/xe/xe_pat.h index 5749a488d9a9..d5dadfb7f924
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.h
> > > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > > @@ -69,4 +69,14 @@ u16 xe_pat_index_get_coh_mode(struct xe_device
> > > *xe, u16 pat_index);
> > >   */
> > >  bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
> > >
> > > +#define XE_L3_POLICY_WB		0 /* Write-back */
> > > +#define XE_L3_POLICY_XD		1 /* WB - Transient Display */
> > > +#define XE_L3_POLICY_UC		3 /* Uncached */
> > > +/**
> > > + * xe_pat_index_get_l3_policy - Extract the L3 policy for the given
> pat_index.
> > > + * @xe: xe device
> > > + * @pat_index: The pat_index to query  */
> > > +u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16
> > > +pat_index);
> > > +
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index
> > > 78e2f037f8e1..43426979b164 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -2030,7 +2030,8 @@ static int unbind_op_prepare(struct xe_tile
> *tile,
> > >  		xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
> > >
> > >  	/* Page reclaim may not be needed due to other features, so skip
> > > the corresponding VMA */
> > > -	pt_op->prl =3D (xe_page_reclaim_list_valid(&pt_update_ops->prl)) ?
> > > &pt_update_ops->prl : NULL;
> > > +	pt_op->prl =3D (xe_page_reclaim_list_valid(&pt_update_ops->prl) &&
> > > +		     !xe_page_reclaim_skip(tile, vma)) ? &pt_update_ops->prl :
> > > NULL;
> > >
> > >  	err =3D vma_reserve_fences(tile_to_xe(tile), vma);
> > >  	if (err)
> > > --
> > > 2.52.0
> >
