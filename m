Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A7DC02190
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 05:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DEE10E1B9;
	Mon,  3 Feb 2025 05:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="guPaCmuW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4BC10E1B9
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 05:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738560648; x=1770096648;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dRWuUD5t9jCQiMibZAGoTbkNTW0hu/Pa67ELtnnMTyc=;
 b=guPaCmuWilv1IfRBj8TIgwF8Cz9xGD8uVNpYycAMa7fgEtZVMCgEY3st
 aS8WOYksZkX7mi+84izUP+7BbXstUCCJ7Q4b0t+9XmXNtt3z4iZ8ls4Lr
 N7UHsofVdgok/Izrz+pizDdLo6hGeWBcJkpOZ5iDaWgj7bPJZHvkToNwc
 4jF3LOXbHCoF/LT1G1GAyaJjUxe4Cp86mcrV73lwY9g+tYavAPlVuaq7O
 rnvcWTcX3QR1SOEom2/RHZNTyvBq3LHFFx9c/Hr0zOhILC6YxonW3pPP0
 cuSb38XO7mHiDNwPYNjtc7/KMUkSXQJix2qgI4TNwFdgq1r9Qi7SyRHM7 Q==;
X-CSE-ConnectionGUID: Lyu9xL+RQ/G9R8aLGh8F2A==
X-CSE-MsgGUID: HGZ9S4FBR72Z6BQ8ZiuLwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39143166"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39143166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 21:30:47 -0800
X-CSE-ConnectionGUID: Ok4wRBIYTvOCpk4EDJIU/A==
X-CSE-MsgGUID: TnjlSbmSQ0y8KAgUA7FVEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111052863"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 21:30:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 21:30:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 21:30:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 21:30:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rX096/4bnlG956xjtMk957LwFZo7M0YEjNr9w7SBUqRkL1uGrV0ynlkNx7EHeTbR1tCN4J2R9Ix8BQ72DZFd24+jD5cxJrmBPTLZ+6STe9hswJMOvsJSMUYSkZUqjLqCY9r9xtOZP4x/Acam/9pJOZqe0WCf//SaKzcr7kIHBS+ICYVLDMUCotvhn4voaZK4b+JfpD/pDiqVN7szQUd1RVjTTH63Lk5DMBu3BCEznpUVrTin/ZtGaBOVFJKVCrDHm1wRMEwdL0LpwTljGK5fyUEvefeXyMAMsxVLeMT4Sr0fhqsp7V8P/8S+C0f8D2TKk4ywP+HgySpqyrjgG4wgfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyUf10gj2oco6Lr1jcbLkAGJcE0pMfzY2825xM1ka80=;
 b=T/lRQj7AYGY6kI34TjVHgC7ShFfFIgQr7Q47DhN2NvQmoMm20whgmcmbPutxoWn8/winhGb3W28TVty4Cx68RBfYukg6Yhr5Lpr4GccRadArmSrZPHRDJwwRE/n+AoMPtnuJFtIH/VCNGVppziozQpGDOjsBG1M62/9EXRr1e5xmcuInf8aB17emxCWjpQYXzDAD8iv6jCER6GRj6KhD1UGOSyF+8VG0SYduv9/wZQSrS6MQdTgOPYa70pQKbSd10qG85z0rCHQluQZ9p4dIsjTx/IXmOuznKjBjfuZgcfuFzx09PdZhbjPsF/KMZpLEwXTloRrYWBBd3qKr0pijIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS7PR11MB7906.namprd11.prod.outlook.com (2603:10b6:8:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 05:30:45 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 05:30:45 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Mrozek, Michal" <michal.mrozek@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Morek, Szymon" <szymon.morek@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH V7] drm/xe/uapi: Use hint for guc to set GT frequency
Thread-Topic: [PATCH V7] drm/xe/uapi: Use hint for guc to set GT frequency
Thread-Index: AQHbcKwpLuP7snD29EejeJZl+bnTP7M1F/gA
Date: Mon, 3 Feb 2025 05:30:45 +0000
Message-ID: <SJ1PR11MB62042A9D0EC63ABF8A77963A81F52@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250127110751.1548253-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250127110751.1548253-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS7PR11MB7906:EE_
x-ms-office365-filtering-correlation-id: 51f52042-7071-4491-dbb6-08dd4413e864
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?agralk9Or4Hm+PSntv3w7WvkUK2/kz01+Cmkdkt+cj0e8AY+9wpvJE8ooW9m?=
 =?us-ascii?Q?6ELVCJYnQYrboFz19Q74IrlbylGbpfiRzMwNl2isDAnEdyhQut7VwlSvLDyS?=
 =?us-ascii?Q?JFZ0h5OV/pjgEjoGRwBMDzgHzN04iCBtDiltE4rWcK99OLctrTmpgP6yyufC?=
 =?us-ascii?Q?1GuihNm/JLFlP5QPb6Db65aSmdxj++KRe64Y8jU+u1JjHRfFv1EBV9seU1DA?=
 =?us-ascii?Q?BUvdLuaGaqMVZewvCb3p322m9djCvTSigbwz+hmXchFemLRc8knX73uHR0Qv?=
 =?us-ascii?Q?9RY3epKprNhNCsJfNoDodJV+CdKpfR54jD9zeEC9GDPGxMiClaLcDDZJZJWu?=
 =?us-ascii?Q?8iwEQPGeVEFRiJVqaj4k1bbFZVk5tm7b31TScf5L/6i+JM6xxwzPeGpl+lGN?=
 =?us-ascii?Q?Gk+4wDOHB5OztD7n90RCHuUmnaalFzTE5A2cTNmlap5sPOEWyi+qcg39w+/8?=
 =?us-ascii?Q?SdeOE0J6g8JHV05jNGK7BfEe0zto5ttQnMAJYu4PmtklttJpEyjvo9TbVlPs?=
 =?us-ascii?Q?poD9k9C6tBUnNdH97Egvz1yf9gLx1iwC6lBRVbSBs57cf/1Pt49v01lAKz20?=
 =?us-ascii?Q?rdZ2LrKqwiRpADi6mBaBp7JVtuDWRvxTcTc9qTEpmaWkK6EGeU+3tswx6kit?=
 =?us-ascii?Q?hW+Ags9popvr9caB/KYZFewzVH54SbhVlEwSx+C3+j1s84TVoxXrMsjiYm6c?=
 =?us-ascii?Q?lg6Qmaqr+WmOyxtlYtQwz2zo+MnLpmpHKyB7QeblBYvtjwsRy36y0+xCgGBD?=
 =?us-ascii?Q?5mEJl1TZJVd4OF0sQyU0H2HhaXZ4K46717EmJTx4DRrrLW0wGG7b2Rl2Y23X?=
 =?us-ascii?Q?md3vnLDQDFhxebIAVic3Kllu6u7OmT1cxzK1Z2Z1/dTNCgR0vwxWUpP0e/sP?=
 =?us-ascii?Q?Hp0UdjSpeipHZBTm2W6gIXEVvg1JQhHW7RNTccDSgWqU1bl0vZEw3+QZZB2P?=
 =?us-ascii?Q?oMAQ9mYbUXiDIGt8zebpNkIhm73PxapdC+IUdTJBBIbN/M0tIdIlDh1eAENx?=
 =?us-ascii?Q?kyPqKOy9dqYIr6TQLzZr4+XEOofdTmqX3nJ+FEDt+SvfUOni5jy7Dc1/Ap/Q?=
 =?us-ascii?Q?awjFqqbbjqbF860lZfn6QtL+10xe7U/+GD0/k/uXSO+5GreZCR1URCa5kWWK?=
 =?us-ascii?Q?lseb8nzcN0sRXKcdThndwSnovwkyyNVZE4MXlxAkFL5u4mW+LItoFulRkHAm?=
 =?us-ascii?Q?ZUnCRFLZTiAv9wuIeU4rZI/97PWrAKZpENofM778r4nBT6Gma7xVRGBMG9l3?=
 =?us-ascii?Q?sNJYKLRH46gI63wWjepsbNXUU/z7eQq037G2mYpv+FnvAB1/4A7EcA4NLtT4?=
 =?us-ascii?Q?oCrHmGLflTrwECPTUHRZTNOWrErbu8X8Ga+d5UMlw57g33qslIy0mX6RkgCi?=
 =?us-ascii?Q?YuZ7Rjcl+f1bsNdIg71FPsumOA0a?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GNZkXlXj+NRDKBOkkswt6pKqrwgxh+4aWkrOmxxRIGTmb8Funczz9LiI4q+b?=
 =?us-ascii?Q?VhE7MYxvy4tXYTU3WyLtHoKFQ8xpoZLhzsdfHz+MdXYKFaS2hR1oeITrJ2yH?=
 =?us-ascii?Q?kGqDDe5+XR8s9s9WDhWjx1smJz97qHk2X/jqZorAPOIeNjX+5Lwerb660E/E?=
 =?us-ascii?Q?7BwpiFnbxIlSxHuu6lzlh4avUsLQ6bx0affMnxNx9y3qVctxpmCkUPj2HOZA?=
 =?us-ascii?Q?Pckk+lgiJv4gCoDp9c68PLiAL4bmH9VxiX/DF7br9zntejjJ2+q5b9iVmvat?=
 =?us-ascii?Q?EPmcVXXQa5hu/nMRYRPrZjUVcEtiBu2dmjEf6yC0Csgr6RCcc37G2dLZpuog?=
 =?us-ascii?Q?SC82FXuTvLMO1nWTP1SgDwaCEI0nkucAUtg+lxVUPRTPwKSzQC9w04H1c83Y?=
 =?us-ascii?Q?bIjihYdlv43JGtOnznXbEFijXmR0Xm63srcche3Dm3ETLZKWpuRbOkp5eJfb?=
 =?us-ascii?Q?2gQoTm5kvyTDveTFgxBIss4q+Q9zxFe3gTAIx09FnqfYbGNPIOFGFqBBN64r?=
 =?us-ascii?Q?Mh/TLHYKir2l5sLUkoRmlYmnDPwes90VsM7z7ZfqyVIvqFkbcBqQm+Ky+OYO?=
 =?us-ascii?Q?2xiRrzjATlSYPjNhDBV/LSVBOSh02KcQCFqwtw8KHKh2yIj7tv6GrvksRfNC?=
 =?us-ascii?Q?93mXw4ZeoKWZDVKPqHz+iwGvVSxNcaE1qJJpPLoO9VFtxu516GoIYAv1HwOS?=
 =?us-ascii?Q?kYa362VnNEUmYZxpFxzPRCyEi+5Xdu+RI3O0DYigB+yGWm/dvhyfgcIZ6A0S?=
 =?us-ascii?Q?ghP/zDTMGXQ+Haq6HY1a5rQg6h72OntOd+xk5TfRNqw7VjTPmHD8xifRp1Te?=
 =?us-ascii?Q?3A3gmG5y75Sh+CNEooL1tLBEdxg2PAkBfUaiJdThP70CSSW5pEKJyvuVCSJX?=
 =?us-ascii?Q?BbTW4ovQ6YWMXE0S9SSbHo0xMduNWKiZh+ANSoTVe/eG1L9F4bjR+lN6LSEX?=
 =?us-ascii?Q?O3ReCIch9KO3GxADTRjcAC8dKNxS0vASXzFLTfiP/e1a+VmSv0ROnbjDvBn6?=
 =?us-ascii?Q?zWpcaAjuyg6BsmE0bNCwfVgzIez3FYJYf2rNKXhL6cQkGqpv6Z4KYTFZbmDv?=
 =?us-ascii?Q?wnxRD7l9V1pZFnG2Z6ihejv/KGGO3fhGdzf74Xcr5nrM4D3GQGG4HQi5ghxo?=
 =?us-ascii?Q?Ekdio9nLfwrL4T6Q37txxdNj5UvXFPLhSlrO4SuGCbTIQHzehVtuVHep9CR6?=
 =?us-ascii?Q?0AT8sTvY+8Uc2VCsMI5qbsMpPziknKrAxOzI+tmLc3RMqs+boclBtCQozo/8?=
 =?us-ascii?Q?WEV+0KtvRC5Vct2ZVv2R4ss5XxnnDWzvRhjSwQn18/ptF592AOe5f26HGqcs?=
 =?us-ascii?Q?jbbBsm57L2c34+RXXPFrUpvBazrZHDs/UBHOJZLo4XqPqZe9kycbzGbvPY6i?=
 =?us-ascii?Q?4JZWWwfgNcZuRU0kChiJ+tjp4ovAOd75fBUK4qeQpj2ukwpZXl6ZIGEyGgfI?=
 =?us-ascii?Q?DSWJNKDKcsOnUk5WkE63QmqtsyHI/hPyswVwsg9dL2FzyZcA7I+ZBfChlDOp?=
 =?us-ascii?Q?Cj2oQ6NK67/zlWkBNCxP0+88Gu/vHUCCg6TcKIDaXzTRymCM6prQZhU5oboH?=
 =?us-ascii?Q?F1aFGJGbsfzgJy79scXMQrJExox+DvdF1Oyl3IMn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f52042-7071-4491-dbb6-08dd4413e864
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 05:30:45.0313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z4mAvB9vMAC6NZQ4xZfoq6xBVY+279+DvoQ1meyuN5uii2HacPmbHqU/5MDKRcU+p80C1yVKGY0qyq9cFRaQDkOQyvfiUd5oUxcy+/capqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7906
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

Hi Folks,

Do we have any inputs? If all looks good can we go ahead with change?

Tejas
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Teja=
s
> Upadhyay
> Sent: Monday, January 27, 2025 4:38 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Mrozek, Michal <michal.mrozek@intel.com>; Belgaumkar, Vinay
> <vinay.belgaumkar@intel.com>; Morek, Szymon
> <szymon.morek@intel.com>; Souza, Jose <jose.souza@intel.com>; Auld,
> Matthew <matthew.auld@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH V7] drm/xe/uapi: Use hint for guc to set GT frequency
>=20
> Allow user to provide a low latency hint. When set, KMD sends a hint to G=
uC
> which results in special handling for that process.
> SLPC will ramp the GT frequency aggressively every time it switches to th=
is
> process.
>=20
> We need to enable the use of SLPC Compute strategy during init, but it wi=
ll
> apply only to processes that set this bit during process creation.
>=20
> Improvement with this approach as below:
>=20
> Before,
>=20
> :~$ NEOReadDebugKeys=3D1 EnableDirectSubmission=3D0 clpeak --kernel-laten=
cy
> Platform: Intel(R) OpenCL Graphics
>   Device: Intel(R) Graphics [0xe20b]
>     Driver version  : 24.52.0 (Linux x64)
>     Compute units   : 160
>     Clock frequency : 2850 MHz
>     Kernel launch latency : 283.16 us
>=20
> After,
>=20
> :~$ NEOReadDebugKeys=3D1 EnableDirectSubmission=3D0 clpeak --kernel-laten=
cy
> Platform: Intel(R) OpenCL Graphics
>   Device: Intel(R) Graphics [0xe20b]
>     Driver version  : 24.52.0 (Linux x64)
>     Compute units   : 160
>     Clock frequency : 2850 MHz
>=20
>     Kernel launch latency : 63.38 us
>=20
> UMD Compute PR : https://github.com/intel/compute-runtime/pull/794
> UMD Mesa PR :  https://gitlab.freedesktop.org/mesa/mesa/-
> /merge_requests/33214
>=20
> v7(Jose):
>   - Update UMD PR
>   - applicable to all gpus
> V6:
>   - init flags, remove redundant flags check (MAuld)
> V5:
>   - Move uapi doc to documentation and GuC ABI specific change (Rodrigo)
>   - Modify logic to restrict exec queue flags (MAuld)
> V4:
>   - To make it clear, dont use exec queue word (Vinay)
>   - Correct typo in description of flag (Jose/Vinay)
>   - rename set_strategy api and replace ctx with exec queue(Vinay)
>   - Start with 0th bit to indentify user flags (Jose)
> V3:
>   - Conver user flag to kernel internal flag and use (Oak)
>   - Support query config for use to check kernel support (Jose)
>   - Dont need to take runtime pm (Vinay)
> V2:
>   - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other
> hint(Szymon)
>   - Add motivation to description (Lucas)
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  Documentation/gpu/drm-uapi.rst                | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
>  drivers/gpu/drm/xe/xe_exec_queue.c            | 10 +++++++---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 ++
>  drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c            |  8 ++++++++
>  drivers/gpu/drm/xe/xe_query.c                 |  2 ++
>  include/uapi/drm/xe_drm.h                     |  7 ++++++-
>  8 files changed, 62 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-
> uapi.rst index b75cc9a70d1f..234c38ef26e3 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -583,3 +583,21 @@ dma-buf interoperability
>=20
>  Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
> information on how dma-buf is integrated and exposed within DRM.
> +
> +Low latency hint by user
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Allow users to provide a hint to kernel for cases demanding low latency
> profile.
> +
> +user need to indicate low latency hint with flag while creating exec
> +queue as mentioned below,
> +
> +     struct drm_xe_exec_queue_create exec_queue_create =3D {
> +          .flags =3D DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT
> +          .extensions =3D 0,
> +          .vm_id =3D vm,
> +          .num_bb_per_exec =3D 1,
> +          .num_eng_per_bb =3D 1,
> +          .instances =3D to_user_pointer(&instance),
> +     };
> +     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> index 85abe4f09ae2..b28c8fa061f7 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> @@ -174,6 +174,9 @@ struct slpc_task_state_data {
>  	};
>  } __packed;
>=20
> +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE		REG_BIT(28)
> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
> +
>  struct slpc_shared_data_header {
>  	/* Total size in bytes of this shared buffer. */
>  	u32 size;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 8948f50ee58f..0c116faaccf7 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -549,11 +549,12 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
>  	struct xe_tile *tile;
>  	struct xe_exec_queue *q =3D NULL;
>  	u32 logical_mask;
> +	u32 flags =3D 0;
>  	u32 id;
>  	u32 len;
>  	int err;
>=20
> -	if (XE_IOCTL_DBG(xe, args->flags) ||
> +	if (XE_IOCTL_DBG(xe, args->flags &
> +~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>=20
> @@ -570,6 +571,9 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, eci[0].gt_id >=3D xe->info.gt_count))
>  		return -EINVAL;
>=20
> +	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
> +		flags |=3D EXEC_QUEUE_FLAG_LOW_LATENCY;
> +
>  	if (eci[0].engine_class =3D=3D DRM_XE_ENGINE_CLASS_VM_BIND) {
>  		if (XE_IOCTL_DBG(xe, args->width !=3D 1) ||
>  		    XE_IOCTL_DBG(xe, args->num_placements !=3D 1) || @@ -
> 578,8 +582,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev,
> void *data,
>=20
>  		for_each_tile(tile, xe, id) {
>  			struct xe_exec_queue *new;
> -			u32 flags =3D EXEC_QUEUE_FLAG_VM;
>=20
> +			flags |=3D EXEC_QUEUE_FLAG_VM;
>  			if (id)
>  				flags |=3D
> EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
>=20
> @@ -626,7 +630,7 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
>  		}
>=20
>  		q =3D xe_exec_queue_create(xe, vm, logical_mask,
> -					 args->width, hwe, 0,
> +					 args->width, hwe, flags,
>  					 args->extensions);
>  		up_read(&vm->lock);
>  		xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5af5419cec7a..b6fdc7ca687e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -85,6 +85,8 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
>  /* kernel exec_queue only, set priority to highest level */
>  #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> +/* flag to indicate low latency hint to guc */
> +#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>=20
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside fro=
m
> ban diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> b/drivers/gpu/drm/xe/xe_guc_pc.c index 44b5211066ef..e926f89e4ce9
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1014,6 +1014,17 @@ static int slpc_set_policies(struct xe_guc_pc *pc)
>  	return 0;
>  }
>=20
> +static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val) {
> +	int ret =3D 0;
> +
> +	ret =3D pc_action_set_param(pc,
> +				  SLPC_PARAM_STRATEGIES,
> +				  val);
> +
> +	return ret;
> +}
> +
>  /**
>   * xe_guc_pc_start - Start GuC's Power Conservation component
>   * @pc: Xe_GuC_PC instance
> @@ -1077,6 +1088,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	}
>=20
>  	ret =3D pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> +	if (ret)
> +		goto out;
> +
> +	/* Enable SLPC Optimized Strategy for compute */
> +	ret =3D pc_action_set_strategy(pc,
> SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>=20
>  out:
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref); diff --git
> a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 913c74d6e2ae..f2ce3086838c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_managed.h>
>=20
>  #include "abi/guc_actions_abi.h"
> +#include "abi/guc_actions_slpc_abi.h"
>  #include "abi/guc_klvs_abi.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_assert.h"
> @@ -400,6 +401,7 @@ static void
> __guc_exec_queue_policy_add_##func(struct exec_queue_policy *policy,
> MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum,
> EXECUTION_QUANTUM)
> MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout,
> PREEMPTION_TIMEOUT)  MAKE_EXEC_QUEUE_POLICY_ADD(priority,
> SCHEDULING_PRIORITY)
> +MAKE_EXEC_QUEUE_POLICY_ADD(slpc_exec_queue_freq_req,
> SLPM_GT_FREQUENCY)
>  #undef MAKE_EXEC_QUEUE_POLICY_ADD
>=20
>  static const int xe_exec_queue_prio_to_guc[] =3D { @@ -414,14 +416,20 @@
> static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>  	struct exec_queue_policy policy;
>  	enum xe_exec_queue_priority prio =3D q->sched_props.priority;
>  	u32 timeslice_us =3D q->sched_props.timeslice_us;
> +	u32 slpc_exec_queue_freq_req =3D 0;
>  	u32 preempt_timeout_us =3D q->sched_props.preempt_timeout_us;
>=20
>  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>=20
> +	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
> +		slpc_exec_queue_freq_req |=3D
> SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> +
>  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>  	__guc_exec_queue_policy_add_priority(&policy,
> xe_exec_queue_prio_to_guc[prio]);
>  	__guc_exec_queue_policy_add_execution_quantum(&policy,
> timeslice_us);
>  	__guc_exec_queue_policy_add_preemption_timeout(&policy,
> preempt_timeout_us);
> +	__guc_exec_queue_policy_add_slpc_exec_queue_freq_req(&policy,
> +
> slpc_exec_queue_freq_req);
>=20
>  	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
>  		       __guc_exec_queue_policy_action_size(&policy), 0, 0); diff -
> -git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c inde=
x
> c059639613f7..64acb3488406 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -335,6 +335,8 @@ static int query_config(struct xe_device *xe, struct
> drm_xe_device_query *query)
>  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =3D
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =3D
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K :
> SZ_4K;
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] =3D xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> e2160330ad01..decbb3b2df36 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
>   *
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>   *      has usable VRAM
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if
> the device
> + *      has low latency hint support
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory
> alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -409,6 +411,7 @@ struct drm_xe_query_config {
>  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>  #define DRM_XE_QUERY_CONFIG_FLAGS			1
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 <<
> 1)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -1124,6 +1127,7 @@ struct drm_xe_vm_bind {
>   *         .engine_class =3D DRM_XE_ENGINE_CLASS_RENDER,
>   *     };
>   *     struct drm_xe_exec_queue_create exec_queue_create =3D {
> + *          .flags =3D DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT
>   *          .extensions =3D 0,
>   *          .vm_id =3D vm,
>   *          .num_bb_per_exec =3D 1,
> @@ -1150,7 +1154,8 @@ struct drm_xe_exec_queue_create {
>  	/** @vm_id: VM to use for this exec queue */
>  	__u32 vm_id;
>=20
> -	/** @flags: MBZ */
> +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> +	/** @flags: flags to use for this exec queue */
>  	__u32 flags;
>=20
>  	/** @exec_queue_id: Returned exec queue ID */
> --
> 2.43.0

