Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095DFD40CEB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 23:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1BD10E0AB;
	Tue,  5 Nov 2024 23:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzHE9zb7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F15C10E0AB
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 23:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730848358; x=1762384358;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yAypRQNnndNNCm0if+yBDLHBusNAhabUkV9TgkymDYg=;
 b=gzHE9zb7nb7EriMnuuy3hHLHEY7x24wBVXUPIsJj/eBawjZyAHB6HGUt
 /8onCnoXloSET29cy5IOik0tu68ZNUmj5lRDuNzNCso1ktGWPc9Yok2Vx
 QpekV0bPWn/WqMT3KAby7KQ/zzlXCwhb0Yw4ZaYTvMlUpjBnvBnxyeiMb
 pTz1BYUx8t6gz3bEKpZbTTldSmJ/z9HkwDzA3moLw80K7ooh3DLzJBVp8
 awQno2jkhtpli2LTccHE86NHf9ceockcfApHOYZwUS4HsiTYPD/5ANqkR
 CEn4fScDcJi6WzTmfAZglmITycoiNUz6dkBwHcRGhF5KoARdZ04+DWbBW A==;
X-CSE-ConnectionGUID: wPm6jUzLSL6nKPn+P7g1lg==
X-CSE-MsgGUID: tlrkzzX2T62u760XsN7p4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53191125"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53191125"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 15:12:37 -0800
X-CSE-ConnectionGUID: J6iM3lYBTHG+IygFqHI3TQ==
X-CSE-MsgGUID: RnwI13ufQZezaFOcI4rAZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="88710750"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 15:12:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 15:12:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 15:12:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 15:12:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXM2gMcLvzKWq+/+7O/GdBEmwOXua1OM0BcHyPQ0aXUmeywYTC4KTQZU8L8nsJTXuM60b/Q58p4NJtIbR6vke98nPKlo8r7tOtngMTJsFkASmoJ3qeELek44FShZCJaqO06ByfQBYfy/q3gZAvydkvETsPZ/REmEp8Ecv0tWj4yMLudThroaxYmO/nJoGfKve9rrEz6wGjYzqqL++svk+J/btY3TDAVHjw0LGJFRH01j12vTV1m9Vq6euEABlUJIZlAnIQeVEfwP9OnPmDoXqCkftHmbBuHLHt+wjzRL+2qcNai4w/zSBUVlT5760EXF+XgBxOQIZ+xlfQA0JNZlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2tZz+SxlasKEKJX40pB+nx2iv5/7yIyKrNJ1eSEgIU=;
 b=vdlNinLfw7yNXAZnCHUqN8/1No+zg7T2qRP31tn2ZMjM7433bq5/3Ohc1JUDGLMfrE06Ls8ovvjIzLQmriVtmgouTRi/T6KXt1eP/8znMQbQ517nXw+06tYlnVhpjP/WXL/safD2C6SNwNTYlTWzzlDvbxRGvOyKoj15uZCdrOP6S3JPvqJY/idoaqX14ctgJFgkPejVdAUCJZYnjVgsMs1ZDfepnsvue8knL49J6zw8xxnkR/PNW4dRP4KyRUwJ1O5iNeJSuCwk0I/CiIzHzDbL5JiO0nvxRjPY2aTiUPny97D3b9KcLqUsrashTUr7oxdwT7nrd2+ofW1YqdEJEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB8068.namprd11.prod.outlook.com (2603:10b6:806:2e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 23:12:32 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 23:12:32 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 5/5] drm/xe: Sample gpu timestamp closer to exec queues
Thread-Topic: [PATCH v3 5/5] drm/xe: Sample gpu timestamp closer to exec queues
Thread-Index: AQHbLseCbdhAgrQ2Z0mmFOAWuFiS2rKnO7+wgAIMxYCAAAn/gA==
Date: Tue, 5 Nov 2024 23:12:32 +0000
Message-ID: <CH0PR11MB54446ACBB121D91072F4B5E5E5522@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241104143815.2112272-1-lucas.demarchi@intel.com>
 <20241104143815.2112272-6-lucas.demarchi@intel.com>
 <BL1PR11MB54450989B36755C082301F49E5512@BL1PR11MB5445.namprd11.prod.outlook.com>
 <gaojnshpsrdej7lyq3tq2wpxy2cg6cmgjrdnut4u4ocrq573az@6mv6744pet5w>
In-Reply-To: <gaojnshpsrdej7lyq3tq2wpxy2cg6cmgjrdnut4u4ocrq573az@6mv6744pet5w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB8068:EE_
x-ms-office365-filtering-correlation-id: de18d4a0-738e-46f1-5306-08dcfdef53d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?whWN4ZiaGe7UshSh3ElvBfUEGmGqPLhwoPM+xAGkzP+W3TEMJsaqIIFtX7mH?=
 =?us-ascii?Q?V6lQ9t2L+TW/LbVxy4D3GnBpBpmdwFdxgmea2SBaBlA0hPdxMeUXhAN4DFno?=
 =?us-ascii?Q?eLsejGxNlvia0NcZnRTZJQv0r7zmKHiiYgUGyue/IVpIoVyfr4OK3lwAJzUa?=
 =?us-ascii?Q?wZf6zFNXNV5+abld9eXRwTpTQ8/6kBe2WNP+daL0iQ3DT4vkxFroFRMYmzRS?=
 =?us-ascii?Q?3YvQ6PInMhEh9Gno9ZLhfrxzTTLDOQoqk5L26Sciel/vS3Gnz/3EH8m+P/E+?=
 =?us-ascii?Q?33LyaNOih/gq3uCdis0Z/0Tk6AlaD1pZIoMlAoKYgXU3zj5C4OS0atKJrvjL?=
 =?us-ascii?Q?TZ6K1OQi6CFxdQ84zZcJgNZsijTpWccsYGOggwMLzXVEHoSyO00BHqdv3lSM?=
 =?us-ascii?Q?LZdXeNYZkPnLWd9sBHO2x2Drl4ARBHKa8nlYkbK1JJBd9Az7I4CU2HXdyNUR?=
 =?us-ascii?Q?iLT8oEHH4JsMFMRalAjaPJVegcXTaNwI7U3NB0WRCVnOymvQv7aD5wb0stbC?=
 =?us-ascii?Q?kJeri3tTBsYixv7LEiNiXMU1ZKZdnZWfTKpqhGan9LF9EUaN33Ny0TJuz3/7?=
 =?us-ascii?Q?RRHP2tD/nwdB7VTIhC+bZgcR9laoc8CmizQPSn7jiUhClpBvj5wQ7AUhwIo4?=
 =?us-ascii?Q?dmf2m/3VRGLjFTanyKojakTDQJyWF+URa50U2JslFKV2G67CvolkmoHgdJ6h?=
 =?us-ascii?Q?fp3KNa4dmTs7Tu7nv3h2+jMfsqXbiZtRk5zV/olvnxC3yDBoXXy5PoneTrcd?=
 =?us-ascii?Q?dUhc2xrMpoaUZluZihm2JYVIEvYdSIBbOOu+aH05fggw1GeZlddD/f22QbYp?=
 =?us-ascii?Q?CUE4HPII/5huZbzwYkcLZOaOjIP/xJxoSsDJ9k7pGdQZ+O5kX35NhgH9fpey?=
 =?us-ascii?Q?QThoPH3kXgLHSJRi+2p6XbYjhw8d/r4NgtYmE+Rp7cjG8G0JgbvM7jSH/ln1?=
 =?us-ascii?Q?FJlrrtCfwAAFYJOi5CVsas4udMokAyVSY1ckMCGbFaGHJAr30TCuZXQ5GKSt?=
 =?us-ascii?Q?W6Kec6sY0GKio8SozrezHNIxpj0DxWjaLMuxt5/GzK/J4s33z6Qj90hoQoYJ?=
 =?us-ascii?Q?X07mNyDzH2dP2aC3tH7KlUNuQjiM5p3DC7AcEbl3nRuoEigCKvA+kayN0WlG?=
 =?us-ascii?Q?wAvB92zXF1i2FUOY7/bsex1i0RbAL9PGViatvGoPxmXQ/fsE7AfYcpYWidD2?=
 =?us-ascii?Q?OFe/IObIR4owcBuwmqo9da5tqdTe8jJz0+2AZmGTTxbbfOO+BWNTejSZFCJV?=
 =?us-ascii?Q?aiizzEHfOsp/d4XLA9xK2y7JlytEkLltJIT8BkaRymRRBph3x69a0rJjTp+N?=
 =?us-ascii?Q?bx7q/K3KcZvDwFBG1f2jNFXAcOnkjUkR5zaeVMvUrTETM20rylYBhgzf5ZNv?=
 =?us-ascii?Q?VzJtLwk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cj0g/890vs2b7kvtLh0VMviCKYAUnVycTgeWY4ej/nZOCMXu14BObZqyFeJy?=
 =?us-ascii?Q?Hx7VYEHcrg54pUmnRFxXzNe5iUBXOgEdq6Erq2RT1jEMC3j6tAIE9QBL3k/a?=
 =?us-ascii?Q?dMUvmS9gN9Tx651OdQuWSVkB5C8PVHRHmjuc6ehac7xI88Y8OWHOFyBBePQY?=
 =?us-ascii?Q?lqsPjK4v7056N+PspWxMAbFWN1FfUdugPDZWJ1P2GpNyKE3EvR3pEVvbIE5z?=
 =?us-ascii?Q?hjc8qqWQdVW+u95oJQxP+1SAgErmzkdzCfK0wn6EQC94TWNxPCqPNF5aBjrf?=
 =?us-ascii?Q?52G6wcSy4uEtKEuc4DFuJ0WahNxd7V866jTlF1KuoXhc+CYAUVZ7byE67paT?=
 =?us-ascii?Q?LT1laV4inGYYDPi/jmHTt259Y22jze0WlYwJkRSo69w1zY42Ht8R4DeaWEWm?=
 =?us-ascii?Q?BQfin0z/QXP9OuSeV7bFnBxCqOYEWkWnR8laueqv72hnP6N87wykOqB12jBb?=
 =?us-ascii?Q?qeIJTkZdHGI+xlrGhaceeGiK4xaxIYzuLuNpV0BgiMVw1T2ndqwmjFlRXKh6?=
 =?us-ascii?Q?x8HjyKJFbUrbKLofWP5Xr54/SwFNkDSoOcjGiMyP1PToPdGKx2ENN95v4Dj1?=
 =?us-ascii?Q?IJ53uhPQdOT9B0BolMMjwU40dtHBhZAcGnzXkeCVx4FML8nmk2nEB6WW9VdG?=
 =?us-ascii?Q?8iTOsrRZbBgD+fvB8dodXLhb9PErrk0AEN2IZELNIdjplRPh27ZgNMrwteRQ?=
 =?us-ascii?Q?ZzekDyx0tO+6j9c2HkSIXHP76kqkdi2z9nLJ7mM6CFsUee1AG2QBzJBVmCRd?=
 =?us-ascii?Q?N0AAtnlTJeSBWKKvQTHfOO1DXivF6iq4MLCHh/izCoJKg5kWchZe/40JPp45?=
 =?us-ascii?Q?vCJ+qthq4M+EO29itbCJCZxfRr9b0XXTVW7JiEuLY8G8btIwigYJonL2owfs?=
 =?us-ascii?Q?2YbdfDGFrWXvqiGK7WRZb2XT5KBMD1J2tI+9IAOkqxMDnxZzVs5UIpxfbkrR?=
 =?us-ascii?Q?ziKgkMw+gXFV0j43V0vJQ2gDeuEOLv07bz+108lFdMCAA2LAG8sI1E0Sethc?=
 =?us-ascii?Q?ijBbf8WIdpL8elhZqvh9kqBguo2eFZwnlF2x5c260FDm4J+Ej27AC1nFMJ3Y?=
 =?us-ascii?Q?Yz6MlBUwh1US5xYuMarfDfwit9/+so4O3TEqySiWWXfJoUked7a5MZT2EKj0?=
 =?us-ascii?Q?TO/wmHRbz0lsLN79AbR5iJcVQBKZ/oI57nMktFmS3/DiDxr8GcG8oTojGiKh?=
 =?us-ascii?Q?CrfvDLU3AiwF7yyjRkAxXdLmrsUhWgAI0NyJFr4HYsglU9LdDYE82NxrVcAM?=
 =?us-ascii?Q?barN5Ej7Go8xqZJ4N3aUkU5sydtuPkexrQPWO8CLAJXo/V/T6isdBRTEeJr0?=
 =?us-ascii?Q?9Mi8KI2IrgLoWvxt33JwjzYRsk4mogNpfzcIyAvHlIQWL24In2QwcD95fg2o?=
 =?us-ascii?Q?A+TqRHDgQZuLkl8crZgmHeZEtfnXA3pHR9txtYWCJFqiic/J3EmRLYGUBu5T?=
 =?us-ascii?Q?HpQX7j/LqlKVhF6Y4BxTUCxH8/3ESE4uiD+Q5Lw80AAYZhXid+Ndepcj6ClN?=
 =?us-ascii?Q?DUBlUmkIGffGg8qT+hHJVbGRWUNC//4JRLvDWPeZl9glmfAZcyjU6v/GrAEh?=
 =?us-ascii?Q?F0FpaNaBHcVB/EPZdsEK3s6GXrDuYP3XOzpzvNGp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de18d4a0-738e-46f1-5306-08dcfdef53d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 23:12:32.4564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: apFVJKjNgwhU1F3akVbIqdX8PLa9rO+SEDAlXfVsotu4aJ+UtPvoo9m1O89n0i+BUCghcmQxpP8zbc3NWLNsfjBlxSE4tW7KKXoY4Y03rXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8068
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

-----Original Message-----
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Tuesday, November 5, 2024 2:36 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 5/5] drm/xe: Sample gpu timestamp closer to exec que=
ues
>=20
> On Mon, Nov 04, 2024 at 04:11:16PM +0000, Cavitt, Jonathan wrote:
> >-----Original Message-----
> >From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luc=
as De Marchi
> >Sent: Monday, November 4, 2024 6:38 AM
> >To: intel-xe@lists.freedesktop.org
> >Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
> >Subject: [PATCH v3 5/5] drm/xe: Sample gpu timestamp closer to exec queu=
es
> >>
> >> Move the force_wake_get to the beginning of the function so the gpu
> >> timestamp can be closer to the sampled value for exec queues. This
> >> avoids additional delays waiting for force wake ack which can make the
> >> proportion between cycles/total_cycles fluctuate either to more or to
> >> less than the real value,
> >
> >s/either to more or to less than/around
>=20
> changed
>=20
> >
> >> depending if the delay happened in the first
> >> or second sample of a top-like application:
> >
> >Top-like application?  You mean a spinning application?
>=20
> no, I meant an app like gputop/htop/nvtop/qmassa, that read 2 samples,
> like below, calculate the delta and then show what was the utilization.
>=20
> >
> >>
> >> 	sample 0:
> >> 		read_exec_queue_timestamp
> >> 					<<<< (A)
> >> 		read_gpu_timestamp
> >> 	sample 1:
> >> 		read_exec_queue_timestamp
> >> 					<<<<< (B)
> >> 		read_gpu_timestamp
> >>
> >> Additional delay in (A) will cause the utilization to be bigger
> >> than it should. Additional delay in (B) will cause the utilization to =
be
> >> smaller than it should.
> >
> >Maybe:
> >
> >"""
> >In the above case, utilization can be bigger or smaller than it should
> >be, depending on if (A) or (B) receives additional delay, respectively.
> >"""
>=20
> changed
>=20
> >
> >>
> >> With this a LNL system that was failing after ~60 iterations, get to r=
un
> >> to 100 without a failure. This is still not perfect, and it's easy to
> >> introduce errors by just loading the CPU with `stress --cpu $(nproc)` =
-
> >> the same igt test in this case fails after 2 or 3 iterations.
> >
> >I'd say either specify the failing IGT test or cut this paragraph.
>=20
> I don't like to give the impression I think this is a perfect fix. I
> will reword it a little bit for the next version.
>=20
> >
> >>
> >> Although not perfect, this could be viewed as just extracting that ugl=
y
> >> loop to "find the forcewake for any available engine" into a separate
> >> function, and at the same time improving the results a little bit.
> >
> >This seems like an aside and can probably be cut, though if
> >you think it's necessary to keep this section to make this
> >patch more likely to successfully land, then IMO you
> >should probably merge it with the first paragraph.
>=20
> I will merge this with the paragraph above it.
>=20
> >
> >Something like:
> >
> >"""
> >Move the force_wake_get to the beginning of the show_run_ticks
> >function so the gpu timestamp can be closer to the sampled value
> >for exec queues.  This cleans the code by extracting the for-loop
> >that finds the forcewake of the first available engine into its own
> >function.  Additionally, this helps avoid additional delays waiting
> >for force wake ack which can...
> >"""
> >
> >Note that by saying it "helps avoid" rather than "avoids", we go
> >from a full fix to one that reduces harm, meaning we don't have
> >to specify the imperfection of this fix later.
>=20
> I like concrete numbers. I like when people actually tested the patch
> and make it clear in the commit message.
>=20
> >
> >>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_drm_client.c | 63 ++++++++++++++++++-----------=
-
> >>  1 file changed, 39 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/x=
e_drm_client.c
> >> index 24a0a7377abf2..874c2157baf49 100644
> >> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> >> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> >> @@ -269,6 +269,40 @@ static void show_meminfo(struct drm_printer *p, s=
truct drm_file *file)
> >>  	}
> >>  }
> >>
> >> +static bool force_wake_get_for_gpu_timestamp(struct xe_device *xe,
> >> +					     struct xe_hw_engine **phwe,
> >> +					     unsigned int *pfw_ref)
> >> +{
> >
> >This is amenable, though perhaps we should just call it
> >"force_wake_get_any_engine" or
> >"force_wake_get_first_engine"?
>=20
> I'd agree, but then I read the feedback from Umesh and decided to keep
> it as is. The reason is that this function may in future use a cached
> hwe and that hwe only makes sense for this specific use.
>=20
> >
> >> +	struct xe_gt *gt;
> >> +	unsigned long gt_id;
> >> +
> >> +	for_each_gt(gt, xe, gt_id) {
> >> +		struct xe_hw_engine *hwe;
> >> +		enum xe_force_wake_domains domain;
> >> +		unsigned int fw_ref;
> >> +		struct xe_force_wake *fw;
> >> +
> >> +		hwe =3D xe_gt_any_hw_engine(gt);
> >> +		if (!hwe)
> >> +			continue;
> >> +
> >> +		domain =3D xe_hw_engine_to_fw_domain(hwe);
> >> +		fw =3D gt_to_fw(gt);
> >> +
> >> +		fw_ref =3D xe_force_wake_get(fw, domain);
> >> +		if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
> >> +			xe_force_wake_put(fw, fw_ref);
> >> +			return false;
> >> +		}
> >> +
> >> +		*phwe =3D hwe;
> >> +		*pfw_ref =3D fw_ref;
> >> +		return true;
> >> +	}
> >> +
> >> +	return false;
> >> +}
> >> +
> >>  static void show_run_ticks(struct drm_printer *p, struct drm_file *fi=
le)
> >>  {
> >>  	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] =3D { }=
;
> >> @@ -282,6 +316,9 @@ static void show_run_ticks(struct drm_printer *p, =
struct drm_file *file)
> >>
> >>  	xe_pm_runtime_get(xe);
> >>
> >> +	if (!force_wake_get_for_gpu_timestamp(xe, &hwe, &fw_ref))
> >> +		return;
> >> +
> >>  	/* Accumulate all the exec queues from this client */
> >>  	mutex_lock(&xef->exec_queue.lock);
> >>  	xa_for_each(&xef->exec_queue.xa, i, q) {
> >> @@ -295,27 +332,7 @@ static void show_run_ticks(struct drm_printer *p,=
 struct drm_file *file)
> >>  	}
> >>  	mutex_unlock(&xef->exec_queue.lock);
> >>
> >> -	/* Get the total GPU cycles */
> >> -	for_each_gt(gt, xe, gt_id) {
> >> -		enum xe_force_wake_domains fw;
> >> -
> >> -		hwe =3D xe_gt_any_hw_engine(gt);
> >> -		if (!hwe)
> >> -			continue;
> >> -
> >> -		fw =3D xe_hw_engine_to_fw_domain(hwe);
> >> -
> >> -		fw_ref =3D xe_force_wake_get(gt_to_fw(gt), fw);
> >> -		if (!xe_force_wake_ref_has_domain(fw_ref, fw)) {
> >> -			hwe =3D NULL;
> >> -			xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >> -			break;
> >> -		}
> >> -
> >> -		gpu_timestamp =3D xe_hw_engine_read_timestamp(hwe);
> >> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >> -		break;
> >> -	}
> >> +	gpu_timestamp =3D xe_hw_engine_read_timestamp(hwe);
> >>
> >>  	/*
> >>  	 * Wait for any exec queue going away: their cycles will get updated=
 on
> >> @@ -324,11 +341,9 @@ static void show_run_ticks(struct drm_printer *p,=
 struct drm_file *file)
> >>  	wait_var_event(&xef->exec_queue.pending_removal,
> >>  		       !atomic_read(&xef->exec_queue.pending_removal));
> >>
> >> +	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
> >>  	xe_pm_runtime_put(xe);
> >>
> >> -	if (unlikely(!hwe))
> >> -		return;
> >> -
> >>  	for (class =3D 0; class < XE_ENGINE_CLASS_MAX; class++) {
> >>  		const char *class_name;
> >>
> >> --
> >
> >I know I've written a lot of suggestions at this point, but none of them
> >are particularly blocking, so just clean up the commit message a bit and
> >this is
>=20
> thanks
>=20
> Lucas De Marchi
>=20
> >
> >Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >-Jonathan Cavitt

I read all responses and it all looks good to me.  Above RB still stands.
-Jonathan Cavitt

> >
> >> 2.47.0
> >>
> >>
>=20
