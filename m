Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A27D5B85E
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 18:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1D710E2B6;
	Mon, 15 Dec 2025 18:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKg5T5Y5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AD010E2B6
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 18:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765821627; x=1797357627;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sNh3C82DFuPQFCI5/ziG4d4cdo6v2RbZdnELQ6ig3ng=;
 b=JKg5T5Y51aYD583kfsd+IX+95D/TL9DkmmERvRsFOFyt80gPNbTBESsW
 XPAVwZtzxVXLYrFpkO0gpmafc5WgWq0YncNv6K9kMCG3YWeCCC7sRbBMU
 hJT4HoDCSp1wEslj0GDJZZpR0M9gJVz/jxbYX7Spd5RFFsQFpYTRACn4h
 QugmhWv5w4emMBjGrpreMLPF65jtn+DvvwS/5nPeB8Zr4pSxNjbTZlxTh
 n2NnQR7Vrjfih6cIHT1AqAgEAvsNhJkRBnrv/YdataJmfN0P0b/h7FNwD
 JRg2JxRUh06zRTkeZWcgKclXe0X/8eRzD07kUWw5yrpp3RvB/BA0shna2 A==;
X-CSE-ConnectionGUID: lZEUYnVMQLKjPUX/bbFvCQ==
X-CSE-MsgGUID: 9EOznfe6RwuvQ8AGvblKfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66915070"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="66915070"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 10:00:27 -0800
X-CSE-ConnectionGUID: CiUgiJK/R4K+94S5QZLaew==
X-CSE-MsgGUID: OD7TuJJVQzewWFzowehZyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="228863297"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 10:00:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 10:00:25 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 10:00:25 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.29)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 10:00:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFqfTFhEsYWitKMUShMVLhxZvXfN76p+cMgAWbamkP+in1kdTjQIpg2e/lui9vOp4OLiEqttqmNmL+Im73S/iDxdNbOYZ+fzcm5r/q8adSFqw9rvK+azkF+nVfA+rgtFardulUVsFEGJAoRU3beHgN/2BHu5u5DbVvGetqWmYeMJeeE1Sy7xt3R0dzYuzATXB6oNwbFufEHzOTU8xqdpVZJnSR9Mp2hDkRcxw/iVJSBR40DhdZ0rn/g9r+Y3N2B+rh0VKils+3HElGL/4Pq4E4UlARpE6UEb9qbT/b9rlohfTQwBQTpYJ/BTPSFNibiabLixXHRuCyFNIwDYDe4Hgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaUi3KLvx1nkzNqQ/fbMHVi+4oS111VBUKZvINFBm5s=;
 b=SkG7JTmnwF5fcAsjuVmk+Wy9usYj0b89W2TEd8uEe0s9PhzmJvcvngkyudYwDHYcUklXLmGylefiwI3MupktixtF1Yl83OKRhaRZcae4yxx8HKPJa79vsqSIg5cszEjPMlUTRaAkAi+BMa0cCaU/QIyYdcjwH5ihrGZ0dnfvycSDjERSqsXuTUXGOaPVZivgFNR8Vy80ygdZW2iEFN02ihPCnhAN1dhLR7hBfer/arCUkTyZkkrSXPAd7l/WMHOg3qXqvD+dw6j5R1iBd5gsKX+6kdumJqcKUnF2NDwJAtAcWyFsRj20TkmDUPC9ttCkwmb4wBd/ZpduM0L7VD8edg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 18:00:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 18:00:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2] drm/xe/xe_guc_ct: Prevent compiler read/write
 optimization breaks
Thread-Topic: [PATCH v2] drm/xe/xe_guc_ct: Prevent compiler read/write
 optimization breaks
Thread-Index: AQHcafykmIis3n5C9USFX/Tl5OSDd7Ui/OuAgAAAmRA=
Date: Mon, 15 Dec 2025 18:00:21 +0000
Message-ID: <CH0PR11MB54444EE0367FE3902378C680E5ADA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251210174412.71084-2-jonathan.cavitt@intel.com>
 <aUBFmxDVaCHKn8Eo@intel.com>
In-Reply-To: <aUBFmxDVaCHKn8Eo@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB6237:EE_
x-ms-office365-filtering-correlation-id: 20d27f26-9547-4252-6b47-08de3c03d069
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?VMO2DE9Bz6bDAkcFUOlc7cYe22wbIwFz1JS7EhGJA1MdxgY51hPw6t9C1WEf?=
 =?us-ascii?Q?Q3h45+ig4yyynA0nr4L8bAf/q5Of8ie4QV+aI6S9zFV1ZIlXy1lxhKsSL4w9?=
 =?us-ascii?Q?FExhZDTAPlcS7ELo+5TOv052gQXrTEANZWc5euHi42rglqzlmi0CR6s4MTgY?=
 =?us-ascii?Q?2b+vC8/FV3jyO/Av4JpN8ihdbRAMNLuR7yPbCenDn1Q92hTweLbuG6b9xtzP?=
 =?us-ascii?Q?HtqQx/of6x0+HhXB7y4RpYyEsL6m+sd4Z/TwWc4wNMI7sta/IwmaBrxXKQIT?=
 =?us-ascii?Q?RRc8dCmuvcH4NYlMiOTSQcdAc+AgEJTge/GS5TUWxO71lT9Rv71WoDM14FET?=
 =?us-ascii?Q?NhB6eZDmqsDM1xDnn4iKX0Ge1AUxO221awu1DV6XwJMtPpbjIKFUP5K/bg6a?=
 =?us-ascii?Q?2aGYa7hbiZ+KgqU3MWjSaYX5x+CaKjanOe5dazKGsx5fo6wBk74BbyBvrpqe?=
 =?us-ascii?Q?MuV7aFv/9nbCnaZulrYpQ/qDHbvZOgxo7WEFuft7o/NOdF483A2aRvY0GMeu?=
 =?us-ascii?Q?AoeoUQPHUbpioXmOvAbT0XChbYNnSKa8YdM0NtaXwkGn7kTVhYa4Oy4zi+QF?=
 =?us-ascii?Q?Oij0/2ByNHRZwA7iYAbbwWNr8JdozOils2lGHxCZ03iN4vWEinqSeK2sl4re?=
 =?us-ascii?Q?0aN9u+tkAC1/DUODXFGZ9Cx7RzjikFVxDX+B1rIqhyOdtmaejnTc5zZ2EtB/?=
 =?us-ascii?Q?K9cjxRzQNc9iddtYC2u7eHSHg33Gtigz/7xaFH+xySVX0mCl1ArMxlO7GksM?=
 =?us-ascii?Q?nOKM2Zc3HeEu5Z54aZpxuBriyv/mLkPc/11tlkrWdTIvX08T2c59H+5tx/vL?=
 =?us-ascii?Q?ChuQzKzdFihPjlL0F6q6eOljhFOOQOf+wc1JwWtCoDogNkDVucCaMpltRo16?=
 =?us-ascii?Q?4sKhbBRvkw6W9+Twb7NzX2AJRcVtsPkp6UU+tjasD1O0gQsKYRHsl43N5rj5?=
 =?us-ascii?Q?sNB7b99rWAt1UTaHCyv+XVlxxW8/g6iX9ytwStA02K6/oQzcfCnUEYQIZ9P3?=
 =?us-ascii?Q?kIP2NxmhVbuZ1KH86ruIAUycrnWoVyvsLGuhr7DXIFaxrZwy4DMqqaHhTFue?=
 =?us-ascii?Q?XYHM7xcPZoxPq5Dz0kf++DSnj28QdFIbnwKQ094g8Q5/BQ5NVj3sf3Akg0jP?=
 =?us-ascii?Q?tKScLiA3iuhYmIq31k4M12hwgbqdwLDGXxjpbfOENNXxCXsjZ2iVK/gAZD+G?=
 =?us-ascii?Q?MSiOLdHl3irpwGzZKU5rZTGNew6J4jjKZdFJvzyLd7F6e1iRbGL/F4/CrxPs?=
 =?us-ascii?Q?FbS55kzq+1Xbb41ENPH7akXm2UdRyS0y1Hil6/Ng6lf8eoEZUiP+hp5enZ16?=
 =?us-ascii?Q?LFixGAjcNTAQn8uC88CjigZbOf3vZdr7dILBT5QDQ7E2cWD5jMLhWPR/zQFc?=
 =?us-ascii?Q?8PKznkRk+dk/aTiYoXUs3F9oxA0HfaQOBheG4tO/+1VbLdzkuMd9poZI/XLt?=
 =?us-ascii?Q?L17s+r3+27tvIs/goYKF+1U0uhaEnF2nbHLG43vTKgiq1yxNawLkp7TCLg4C?=
 =?us-ascii?Q?oFKZxV62Rwip75hDiITk3d++IyWPizAikL5l?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A+iuMz/WGjRi8ni3hi3Tw9Z7ZPwTeGD9Uuxk4xbs0cpyp5VWHjMqpysUQPd6?=
 =?us-ascii?Q?1CfqoXDhB5mDdL4pEoTo0BKZq/HInuCja9urMlz3T2ggUhFXC94BLTd00nXk?=
 =?us-ascii?Q?booQ1Jn8nySXjiwcnErdblvPpi7ZVNiTXOg5cWElLwyWU/be3O9hq9Lw363w?=
 =?us-ascii?Q?pO6nX4Be8ZUWYvM15gRF+kqo4/s8ZX8042+e8ro9QSuk4/hJcKgCMw7l2IdI?=
 =?us-ascii?Q?Edqh4im6/65DPyJUAQuJrqaxTlUyBGz7JZ0tWg05tyNGarqioAYk1yESHJGF?=
 =?us-ascii?Q?ZDYqOIrN0tM1/iDUzgMSj3cejCRBaBICQt2zWmhwBYtZ/GJggEe4FKPmrTX8?=
 =?us-ascii?Q?oOsoYlohMJ4f9QiBaFgwjnXcj0no4wpm8o3/C2MaMwb8/QFeCoCjdNSz+3Hw?=
 =?us-ascii?Q?tNW7dst6Kb0nrtRMQK5tIcP6n/s24FLslgEfPYaLIekHnYlLpdJ3Og7OMHMs?=
 =?us-ascii?Q?ZSF8wZShn2CfaYTbA8UeayeOj0x34JZvJkBjgsLuiAmKV+4bo1ED6TKHPMlA?=
 =?us-ascii?Q?oPHxp6iUXtgTYTonDHaRK08tZ1XJG2kafJz32cJGmHNj88Hq6vHbiA+QPCpf?=
 =?us-ascii?Q?zf3yGq4/+XRy2lfsxvZqe/5hSWxXtbo3sqEMjF3iZf6h3eeGqiyPLdlnQ0gF?=
 =?us-ascii?Q?yrfclqfaJpP74pu9sxLC33vRUn3OgaRCTnw+xPERQt5GOjyAwU+nHNmeK9UE?=
 =?us-ascii?Q?Exk3hTXIqkqdG1oR1tJ6b1by/fFzPx7RInJLhOcpKdBXEfZ0IsStiOddXpkn?=
 =?us-ascii?Q?6poPs5Y/ZMsyuhaJiWstObA1CiIwpkO4ExGcT/FnY1qVra7J5ufxL1WwA+Vy?=
 =?us-ascii?Q?paCSPu+FK5EeSKKfZptgWJUBTVs/RbmnZhyIqfWwQ0xjVykLKj7mgdcoosMj?=
 =?us-ascii?Q?dP6sw5jI0Dd7oMQYfAvPyByoPca9r7uKwK64CBmbdBisD5GL83NNwnKb6K9u?=
 =?us-ascii?Q?wqmECev9+8X4FfXTYQ28mtZsJg3lfGviP+XPmapYCvQZj1//VWj7/9v7Tlrv?=
 =?us-ascii?Q?ja+pBrq9Ee+ukK9lUbDE8yFpIMD8TbmveR/eyrMkg9Dst5TQuIt4OkhHG9lb?=
 =?us-ascii?Q?gF8PTnRFs6HUrRamnLSUxk02CwMWYAptc0PGmfSnXOiqmUZ4U5pU3RjWc4Yx?=
 =?us-ascii?Q?41N51AKR7vYf9uanjxpm3BR2tiPYykUZcQYVoudigKbOnJQ8IUf7zb+hnrtM?=
 =?us-ascii?Q?K09ZrDEP3dAGBM5mLrsGiQuAyNIr40sLZuAlZmAgc+PtavYiwp0USYD7RdqG?=
 =?us-ascii?Q?xf6lmwyzGTM4cI8mVU8CnsHPDGvzxq7OmJ9zRuMk9ohytoh7a8g+hoh4FLPM?=
 =?us-ascii?Q?eTWCwJuLXP/DfPv0xmDLapzz+Yqy9VphRjqAnW4rWAQFMQGr5cgotTncIb7d?=
 =?us-ascii?Q?26L7AauO5/ZvKuu7Ie76xfAUwZpZTgQBESPtwhxWBqvV/ZpGf54dpFGJZUHV?=
 =?us-ascii?Q?rUCtsmBJ7bA8iwlqm+Y8K7Opy1HCo8YaUdnwOnUuqIf5417mK7GYkTjslvUe?=
 =?us-ascii?Q?tZyCfT19geObjk3H2gq5jrPKDfrQTIEQU5DYT0BbiMRaqGPWOn3kp9dFPRwN?=
 =?us-ascii?Q?jm1ZIGkCe76dlhw99OAFls/LLY1Yc1WZtCC2qpFcEYa9ynxZL1vHs2R1sFR/?=
 =?us-ascii?Q?ZpiYUnkIDm/s/VIuJkgsSNLgqWTOLdeIyoKpCEsFo11U?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d27f26-9547-4252-6b47-08de3c03d069
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 18:00:21.1802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Sdki/r3jmUeS/m4qHpayY04hiZCDrcJK4OsF6uVDeXRtgGh3eAvOHP1zcd4v4waCjjrAFfxVCoKPpMuMTXjGKMtUXb2kX+jFSxTRJ7rp+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
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
From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
Sent: Monday, December 15, 2025 9:30 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, Saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@in=
tel.com>; Brost, Matthew <matthew.brost@intel.com>; Ceraolo Spurio, Daniele=
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe_guc_ct: Prevent compiler read/write optim=
ization breaks
>=20
> On Wed, Dec 10, 2025 at 05:44:13PM +0000, Jonathan Cavitt wrote:
> > Use READ_ONCE and WRITE_ONCE when operating on ct->state and the
> > g2h_fence->done values to prevent the compiler from ignoring these
> > necessary operations.
> >=20
> > v2: (Matt Brost)
> > - Add Fixes tags
> > - Add comments
> >=20
> > Fixes: 94de94d24ea8 ("drm/xe/guc: Cancel ongoing H2G requests when stop=
ping CT")
> > Fixes: dc75d03716fe ("drm/xe/guc: Add more GuC CT states")
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs=
")
> > Fixes: 0b93b7dcd9eb ("drm/xe: Fix early wedge on GuC load failure")
>=20
> I really doubt that a 4 line patch is fixing 4 different patches...
> I believe the important thing here is to identify the original patch
> that introduced the wrong concept, not all individual patches that latest
> touched that line...
>=20
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++++---
> >  drivers/gpu/drm/xe/xe_guc_ct.h |  6 ++++--
> >  2 files changed, 15 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc=
_ct.c
> > index 648f0f523abb..4ee628fe34b9 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -206,7 +206,9 @@ static void g2h_fence_cancel(struct g2h_fence *g2h_=
fence)
> >  {
> >  	g2h_fence->cancel =3D true;
> >  	g2h_fence->fail =3D true;
> > -	g2h_fence->done =3D true;
> > +
> > +	/* WRITE_ONCE pairs with wait_event_timeout in guc_ct_send_recv */
> > +	WRITE_ONCE(g2h_fence->done, true);


The function g2h_fence_cancel was introduced in its entirety by
94de94d24ea8 ("drm/xe/guc: Cancel ongoing H2G requests when stopping CT")
and did not exist in any other form before then.

You could argue that setting g2h_fence->done this was had precedent
from the initial Xe commit, but as this function did not exist before commi=
t
94de94d24ea8 ("drm/xe/guc: Cancel ongoing H2G requests when stopping CT"),
it would be difficult to argue the change to this function fixes anything p=
rior.


> >  }
> > =20
> >  static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
> > @@ -527,7 +529,12 @@ static void guc_ct_change_state(struct xe_guc_ct *=
ct,
> >  	if (ct->g2h_outstanding)
> >  		xe_pm_runtime_put(ct_to_xe(ct));
> >  	ct->g2h_outstanding =3D 0;
> > -	ct->state =3D state;
> > +
> > +	/*
> > +	 * WRITE_ONCE pairs with READ_ONCEs in xe_guc_ct_initialized and
> > +	 * xe_guc_ct_enabled.
> > +	 */
> > +	WRITE_ONCE(ct->state, state);


The function guc_ct_change_state was introduced in commit
dc75d03716fe ("drm/xe/guc: Add more GuC CT states").

This patch also introduced the ct->state flag, replacing the previous
ct->enabled Boolean.  So, this concept did not exist before then.


> > =20
> >  	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
> >  		  state =3D=3D XE_GUC_CT_STATE_STOPPED ? "stopped" :
> > @@ -1496,7 +1503,8 @@ static int parse_g2h_response(struct xe_guc_ct *c=
t, u32 *msg, u32 len)
> > =20
> >  	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
> > =20
> > -	g2h_fence->done =3D true;
> > +	/* WRITE_ONCE pairs with wait_event_timeout in guc_ct_send_recv */
> > +	WRITE_ONCE(g2h_fence->done, true);


This section of parse_g2h_response has been untouched since the initial
Xe commit
dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs").


> >  	smp_mb();
> > =20
> >  	wake_up_all(&ct->g2h_fence_wq);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc=
_ct.h
> > index 5599939f8fe1..8d318b094f33 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -30,12 +30,14 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct d=
rm_printer *p, bool want_ctb)
> > =20
> >  static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
> >  {
> > -	return ct->state !=3D XE_GUC_CT_STATE_NOT_INITIALIZED;
> > +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
> > +	return READ_ONCE(ct->state) !=3D XE_GUC_CT_STATE_NOT_INITIALIZED;


xe_guc_ct_initialized was added as a part of the patch
0b93b7dcd9eb ("drm/xe: Fix early wedge on GuC load failure").

One could argue that this function was added with precedent
set by the patch
dc75d03716fe ("drm/xe/guc: Add more GuC CT states"),
which also introduced the XE_GUC_CT_STATE_NOT_INITIALIZED
flag.  However, as this function did not exist prior to
0b93b7dcd9eb ("drm/xe: Fix early wedge on GuC load failure"),
it would be difficult to argue that the change made to this function
fixed any commits prior to its existence.


> >  }
> > =20
> >  static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> >  {
> > -	return ct->state =3D=3D XE_GUC_CT_STATE_ENABLED;
> > +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
> > +	return READ_ONCE(ct->state) =3D=3D XE_GUC_CT_STATE_ENABLED;


The function xe_guc_ct_enabled was introduced in the patch
dc75d03716fe ("drm/xe/guc: Add more GuC CT states").

-Jonathan Cavitt


> >  }
> > =20
> >  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> > --=20
> > 2.43.0
> >=20
>=20
