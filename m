Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66732C021B2
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 07:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE4610E14A;
	Sat, 22 Feb 2025 07:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7NAIvkw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7182C10E14A
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 07:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740208014; x=1771744014;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qpYa3D0wkJW+J5ZeKkDQJRjWxWW7mCJujR8O/P6Q3OQ=;
 b=A7NAIvkwQJqS3cXrWbTCzrYWA1MjVG9zHfAw1lSAb8yKT9A1c1wwRrZc
 CbHv8zPtRO3woRdcPzcQ5pYvqn2RXZNKL04U3sW+hmPtqGj2YwZviX+vx
 gWLWQWMCwZJfiDpmPmuJmJVhDNNci6GIIEeBdxKHOPVKqzH3UhKEpwJYP
 yI3iZyHHPkIXpyjoJUDhsXlnC510veRsdBz+Tl6K9JWtpTB3TZ9sujYLD
 +QB7J3FD2xdtOLzv765Y4mrtxEIgrovGAp8OSs9g94IhTvloKJ5+Hg5nL
 4A7Hyl4IzeEjCg4bkHEjJ/4gYN6s+XiQB+/gMMFdRCsjshtk+3+cwQcdS w==;
X-CSE-ConnectionGUID: Hh65m+R7TuGwCOk3se5RwA==
X-CSE-MsgGUID: rug5m7a0RymkI7c1ynR4YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41046813"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; d="scan'208";a="41046813"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 23:06:54 -0800
X-CSE-ConnectionGUID: ahT/G4nSQmGKSfED2NYgeA==
X-CSE-MsgGUID: rEGu4v3ETRiO2O8lCECFEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146466884"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 23:06:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 23:06:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 23:06:52 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 23:06:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgS1V/tCNES9jZQDZMYc3lT3sQNT5ensCqQkMCs2DQ1037aQXdiicCiaqmMCFGZnEFDrX0HOFbw7zKOaRuPC2nY7SHu8/uidOPQhm+ljlnydQiwh0ZHA7iP2qUPzKecs2JtdYBGkpRqxXY0PMaJlypegzcn4CRkrIxgIaLmeCf+ZM7lhWJcuOWnRS7bKSsLuWO6GtA1tmNziC1s8+xUy4gdlNVsv9K38BXHk2ScGMptS2XHUY7FUudi14BUgempYfarX5NY12FGkJ20F9Nj4C4MNbZ09wInReBnBVk2KBocQecvtHCvCOs2IqtGXhf96NDIz0IjMkuWWhuUEx73wJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auGB5y0wFAAute7K03bQ7FrmA6eJjKz9XwaFe9ObuZc=;
 b=Q5VnsCDBDOTh6Xge0w6JPHE5mVFY8kNS0gJ41ZA1ahiVHmUhL2jcBpK/WmvogK6gR1tVtp1bT0C0qYw5w3tdxr7kO2NtO3vM1NRrX+YIqF1lTSvyJpZ47r/K6SommHubZwBLupBLh3dqA9ELYcrpFutL7+ZPyOtO3A6HtrXlnSKnjA721CBbGAkgxNb8b/kCGD7/A82oUPkDQm0VnjURjkuGG/+q3SmnJNEvuV0Kg0SbXzBqfiEx3542GuHMigatD1pHb1pA9aEgeI+0MMoNSZSUbmJWQqSYlCOdFM0ScNYLiV6p7kz3tsxcOoy1Ak0I3quC9TQ9coNQcJ1RFUGpyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Sat, 22 Feb
 2025 07:06:17 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8466.015; Sat, 22 Feb 2025
 07:06:17 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, "Morek, Szymon"
 <szymon.morek@intel.com>, "Souza, Jose" <jose.souza@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH V8] drm/xe/uapi: Use hint for guc to set GT frequency
Thread-Topic: [PATCH V8] drm/xe/uapi: Use hint for guc to set GT frequency
Thread-Index: AQHbeSc/keaJxXMMxUmqg4V+9XZbz7NCgLIAgA+mSICAANcX4A==
Date: Sat, 22 Feb 2025 07:06:17 +0000
Message-ID: <SJ1PR11MB62043CF2B00EF7B52591793281C62@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250207061223.2072753-1-tejas.upadhyay@intel.com>
 <b0a880c9-2800-4087-85f4-42bd6c3cf77b@intel.com> <Z7jC2UlmAGPTpQUP@intel.com>
In-Reply-To: <Z7jC2UlmAGPTpQUP@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB6217:EE_
x-ms-office365-filtering-correlation-id: 65fc680f-b09c-4939-6851-08dd530f66f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?bg00Ti/XalTujYI21kWERQs+SGyczU3tphHav3kenkI2jr9cawSvNLovFR5X?=
 =?us-ascii?Q?0v3i9cGAuNuMIM0TTxomYhihXQK15KdvW0yX6YEyqidC5GtpR/PVMJWT3Ewo?=
 =?us-ascii?Q?+T2AvIfnmt2tvtLB7WVVvbSDkFbhDdOqEbLvwupTaTKsGwyf7itI+gJqQB4W?=
 =?us-ascii?Q?gIfkw5y65kFbxWNPy6qTStkb+161Zzbb02rPgXjKHIzn3uo0pcyp6UHZN1I0?=
 =?us-ascii?Q?uP5V1dihM5TRkd/0PKqFi+Onxl6DWBe5zbQ6GVFGr/vNuptRNXYEkHmQ0w7H?=
 =?us-ascii?Q?HaUDhPl2XBBlJoJ0FkrBLY70NN28QtcVc14L7cvUAiXrlfqyxy/cK4mLxUAL?=
 =?us-ascii?Q?xwv3dMFBnKCabWJ74CVvfpYxEJYIiDpgVVctrKsCdOfrK89qG6+jUL4h5kOu?=
 =?us-ascii?Q?XSP7tgxNE2jkzjwYsn0lR5sdhTx0r1Rg4/bw9I5iWUfhVPuLTN2PU/wIA1lG?=
 =?us-ascii?Q?CZfxNg3Wcg/b8y2cyic25gXQtkj3kUU799gPHT8qgZAUmT7WoOck5BI01FVq?=
 =?us-ascii?Q?3MCTut/ttsZAV5eLNZfSzmuNLmQmSM3byi9HtkkCWNHPI8ZPDirL0uTy3+f6?=
 =?us-ascii?Q?Zea5VA+jw30x0z2l3K6lRaLInBqA/uyjKqqGFQvuPMePNrlprEWY21FQ18gp?=
 =?us-ascii?Q?K2b+kLywYbFBYdTIypNgaonPimrmSD4w1L9LG1QnZIORYr31EaJabFOFuPPJ?=
 =?us-ascii?Q?uxp/XMGDCNrgYBVRUmy3MrndTMByJXVMYZf+jPMai7WP0F6866APNr9GIbjI?=
 =?us-ascii?Q?lhiMN3It5Z0KUqRqu3f8TDwY2ox9qQ0izMZU+ljI6BiN6WU1x9up9cvFQY7h?=
 =?us-ascii?Q?t6XpwF4h3EV/SFIGB+aPsNrvIv/EY0plYb8vypMvrxMbO75Zxq2JsrsaypJp?=
 =?us-ascii?Q?L3/1CSqHT4RpnXKDY3BHogaVbtWeAy2xXjHpwaXcRyHFa3o+siiQ2Chg5YaW?=
 =?us-ascii?Q?jyEdwloi42q+1C7TMujlqobryz29WuEsKpGF9bjxelljXOwLbOGqAnPeh3NF?=
 =?us-ascii?Q?aGqgM9h7BWdcsXRoolY6U2JBwKFQDHNMiWHoFWrLXoGmB4ouAS9QlAQMAtdj?=
 =?us-ascii?Q?QBcItHboWvC42iGEAzsiNCnqR8ig7NYfqfCmRQD3IDxAWAe6BiWy1eOqd7dR?=
 =?us-ascii?Q?TbDMApS9w2noApcwjZX55ZKLFuFT0HnXR2GAOlpvaLEQ/CA8STeUYl3qVY/Y?=
 =?us-ascii?Q?RnkScxkjnRpGnKwLVHCTyw44qD0aionqbl8DK8peSM+HUoxnWDr1LExqSdpB?=
 =?us-ascii?Q?2MbiwiS1KOKjN/97cDXmo/PdQvawb8ya7ibTnVVAHUiwtbLkqn5rcl6sXZ/P?=
 =?us-ascii?Q?yTvfKXyWb7U0uItRpNm5SKmf4c5U0E5tvHCPzatGB6gA8I/Xkw7JsnNgG5v0?=
 =?us-ascii?Q?W39kqfOkVviBbqCyQ3BxCPwYDpXy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bGILDeQL6ySV5A9scY8TMQm/J5dQdTeczzrjfO+aYn6yaqThGDBkNRFaHl3p?=
 =?us-ascii?Q?jbrHg3IyOMxIaWNnWaP/6GgUrmwr3r+CQCHsFXth8RsOieQJwct6LJgdihCE?=
 =?us-ascii?Q?85fzATeaX2q/QGvYEDSwOBxsoOKdGRJRUlSFxe0dFDabb5NkAXawFY7F28pj?=
 =?us-ascii?Q?qEPoFGkM3hjCbqpypjZ4dehiy5e916IKEvtPlEQ/xdRMjrRQuTSvAipT84Ov?=
 =?us-ascii?Q?5ciL3cziicJ2jCsjYLUazKJoEljyOczsrr5T3Mv5BIRY3fFX26e05z4iS2zs?=
 =?us-ascii?Q?Yy8e93ogH+Pq0vBP26TkAR3IefUj16ZVOqdb6vhc+deyizkFJHoO4IpdAGQi?=
 =?us-ascii?Q?s99WUg6lWVx26RVJ6xAoQz3/86rvz1wbOa6fH/uYmU34Ywdy+b50Z1YT+gyn?=
 =?us-ascii?Q?tGuqx1eW6nAz5izHGyc0af+7agex8uYD0DBFOa+FUxff0cgHvVivJYsw71oq?=
 =?us-ascii?Q?Yef6zKPocYUr+UQE+Qr/NIy/4mYFzQUVQgq4V7/2cVWewNbbUOXpGV28A+80?=
 =?us-ascii?Q?MJXQv5LhXM8qT09S6YaJwwY2eVuDSUxgwGgS7SzMBeGycBuMVDdJuSXI3UTb?=
 =?us-ascii?Q?EpJIq8ecMZyu/pC/Y0e+6J9cYMNbONJP5QwQN+lJIg8gV6OiH39UKzIIh9Tg?=
 =?us-ascii?Q?FE65Ya4C5E7Fz+hVlZqiCuerUlK4x/JbUnQO6qV0rBU0/+MGAq+NAh7vvAPP?=
 =?us-ascii?Q?XxpG5mcCSnI3+5fskjFo0B977ClcYOlAg9WeX2FcN1JhW1rWC54k3CoStBKk?=
 =?us-ascii?Q?6eAR4Y3FXxTLv15WTT+6MmqaPFUcUXvg9PaFnq6I2Xqnie2jFxNTWaZIFaA/?=
 =?us-ascii?Q?x6TMmWhaR1YL2VX/HP050TfIcxNUPkw9fD85whTdWql2wSW572rpjcV6uURi?=
 =?us-ascii?Q?2vFzJ6wG2grOLHcPCZdy/260F2uiYFV6V7wj6Y8WMg+z+y0YO5eOGMKQ0VvY?=
 =?us-ascii?Q?3+94h3uD9nRQ7TZZvxM6kc+XXIBFS2BvaHX/RPRoy6OocrH3kYMYofDyxddt?=
 =?us-ascii?Q?x042WGJ0QBqHObzBDm+brRi5uKMagt9IAm9D8GJXGpgTc7IronTFroiIAttl?=
 =?us-ascii?Q?+OlEnkkrOVmySO/ubiL69hzi8kcP+mi4pYaR1hBRSBCc9oVsIkyY88kQgpX9?=
 =?us-ascii?Q?vcAtSIFIClQj4Ixvt1QUeCSC/mrXJGaAPhDgnmB+bu/buwVL2mNVjX6inbNZ?=
 =?us-ascii?Q?iWac1cIA33BIWX3YHJGbSrBK59uipgJxrQRo6z0wjISGJm0GosqRxb+HjJFd?=
 =?us-ascii?Q?FcX1ExofISAjKRqYtkHK2rO/fO87Kziui7ROjqQInba6H/4qF9pFEIhBeuvE?=
 =?us-ascii?Q?APNMQpV6K5J7bMrziakToqD0Lsl+QcvZmV4coGIcZvzK/8POccNuGfWm+lqb?=
 =?us-ascii?Q?prK21NHUozIkPicAGNt5cm1AGouCSLXbyaPgz2P6EALxGDBMf7iIhM83Mkf7?=
 =?us-ascii?Q?/BFvwCXIJDXLbZuxBePOUTXpq1t95QfT+KJIhvUt9iAV3sqWYuQcFeA6lPra?=
 =?us-ascii?Q?4Vym/jcY14HZPdJKjKv9VTQrMyIUL6FsdfPmi9KsLhy2/IUSCi+fwyhm9fVo?=
 =?us-ascii?Q?qPtV/Stm6md6bLcXtmvXBCe2gqK41YcXxWshXtOd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fc680f-b09c-4939-6851-08dd530f66f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2025 07:06:17.2887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rKgRC5HuYtVGIMMULjPs2uHDNY24hnAGg/F9AGaNNJQ7t2o+n6D20KCei/rME2MIbmnC5LWJw8FMLopHWue30tnYNst8xPWNc/VAnLpGJbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
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
> Sent: Friday, February 21, 2025 11:46 PM
> To: Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org; Mrozek, Michal <michal.mrozek@intel.com>;
> Morek, Szymon <szymon.morek@intel.com>; Souza, Jose
> <jose.souza@intel.com>; Auld, Matthew <matthew.auld@intel.com>
> Subject: Re: [PATCH V8] drm/xe/uapi: Use hint for guc to set GT frequency
>=20
> On Tue, Feb 11, 2025 at 11:16:50AM -0800, Belgaumkar, Vinay wrote:
> >
> > On 2/6/2025 10:12 PM, Tejas Upadhyay wrote:
> > > Allow user to provide a low latency hint. When set, KMD sends a hint
> > > to GuC which results in special handling for that process.
> > nit: realign this line length, seems to be longer than others in the
> > commit message.
> > > SLPC will ramp the GT frequency aggressively every time it switches
> > > to this process.
> > >
> > > We need to enable the use of SLPC Compute strategy during init, but
> > > it will apply only to processes that set this bit during process
> > > creation.
> > >
> > > Improvement with this approach as below:
> > >
> > > Before,
> > >
> > > :~$ NEOReadDebugKeys=3D1 EnableDirectSubmission=3D0 clpeak
> > > --kernel-latency
> > > Platform: Intel(R) OpenCL Graphics
> > >    Device: Intel(R) Graphics [0xe20b]
> > >      Driver version  : 24.52.0 (Linux x64)
> > >      Compute units   : 160
> > >      Clock frequency : 2850 MHz
> > >      Kernel launch latency : 283.16 us
> > >
> > > After,
> > >
> > > :~$ NEOReadDebugKeys=3D1 EnableDirectSubmission=3D0 clpeak
> > > --kernel-latency
> > > Platform: Intel(R) OpenCL Graphics
> > >    Device: Intel(R) Graphics [0xe20b]
> > >      Driver version  : 24.52.0 (Linux x64)
> > >      Compute units   : 160
> > >      Clock frequency : 2850 MHz
> > >
> > >      Kernel launch latency : 63.38 us
> > >
> > > UMD Compute PR : https://github.com/intel/compute-runtime/pull/794
> > > UMD Mesa PR :
> > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214
> > >
> > > v8(Vinay):
> > >    - Add separate example for using low latency hint
> > > v7(Jose):
> > >    - Update UMD PR
> > >    - applicable to all gpus
> > > V6:
> > >    - init flags, remove redundant flags check (MAuld)
> > > V5:
> > >    - Move uapi doc to documentation and GuC ABI specific change (Rodr=
igo)
> > >    - Modify logic to restrict exec queue flags (MAuld)
> > > V4:
> > >    - To make it clear, dont use exec queue word (Vinay)
> > >    - Correct typo in description of flag (Jose/Vinay)
> > >    - rename set_strategy api and replace ctx with exec queue(Vinay)
> > >    - Start with 0th bit to indentify user flags (Jose)
> > > V3:
> > >    - Conver user flag to kernel internal flag and use (Oak)
> > >    - Support query config for use to check kernel support (Jose)
> > >    - Dont need to take runtime pm (Vinay)
> > > V2:
> > >    - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for
> other hint(Szymon)
> > >    - Add motivation to description (Lucas)
> > >
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >   Documentation/gpu/drm-uapi.rst                | 18 ++++++++++++++++
> > >   drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
> > >   drivers/gpu/drm/xe/xe_exec_queue.c            | 10 ++++++---
> > >   drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 ++
> > >   drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++
> > >   drivers/gpu/drm/xe/xe_guc_submit.c            |  8 +++++++
> > >   drivers/gpu/drm/xe/xe_query.c                 |  2 ++
> > >   include/uapi/drm/xe_drm.h                     | 21 ++++++++++++++++=
++-
> > >   8 files changed, 76 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/gpu/drm-uapi.rst
> > > b/Documentation/gpu/drm-uapi.rst index b75cc9a70d1f..234c38ef26e3
> > > 100644
> > > --- a/Documentation/gpu/drm-uapi.rst
> > > +++ b/Documentation/gpu/drm-uapi.rst
> > > @@ -583,3 +583,21 @@ dma-buf interoperability
> > >   Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst f=
or
> > >   information on how dma-buf is integrated and exposed within DRM.
> > > +
> > > +Low latency hint by user
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > +
> > > +Allow users to provide a hint to kernel for cases demanding low late=
ncy
> profile.
> > > +
> > nit: extra line.
> > > +user need to indicate low latency hint with flag while creating
> > > +exec queue
> > s/user need to/User can/ - this was in the last review as well. Might
> > be good to indicate that this will affect power consumption.
> > > +as mentioned below,
> > > +
> > > +     struct drm_xe_exec_queue_create exec_queue_create =3D {
> > > +          .flags =3D DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT
> > missing "," at eol
> > > +          .extensions =3D 0,
> > > +          .vm_id =3D vm,
> > > +          .num_bb_per_exec =3D 1,
> > > +          .num_eng_per_bb =3D 1,
> > > +          .instances =3D to_user_pointer(&instance),
> > > +     };
> > > +     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> > > b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> > > index 85abe4f09ae2..b28c8fa061f7 100644
> > > --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> > > @@ -174,6 +174,9 @@ struct slpc_task_state_data {
> > >   	};
> > >   } __packed;
> > > +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE		REG_BIT(28)
> > > +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
> > > +
> > >   struct slpc_shared_data_header {
> > >   	/* Total size in bytes of this shared buffer. */
> > >   	u32 size;
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 6051db78d706..f68b597f5270 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -605,11 +605,12 @@ int xe_exec_queue_create_ioctl(struct
> drm_device *dev, void *data,
> > >   	struct xe_tile *tile;
> > >   	struct xe_exec_queue *q =3D NULL;
> > >   	u32 logical_mask;
> > > +	u32 flags =3D 0;
> > >   	u32 id;
> > >   	u32 len;
> > >   	int err;
> > > -	if (XE_IOCTL_DBG(xe, args->flags) ||
> > > +	if (XE_IOCTL_DBG(xe, args->flags &
> > > +~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
> > >   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > >   		return -EINVAL;
> > > @@ -626,6 +627,9 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
> > >   	if (XE_IOCTL_DBG(xe, eci[0].gt_id >=3D xe->info.gt_count))
> > >   		return -EINVAL;
> > > +	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
> > > +		flags |=3D EXEC_QUEUE_FLAG_LOW_LATENCY;
> > > +
> > >   	if (eci[0].engine_class =3D=3D DRM_XE_ENGINE_CLASS_VM_BIND) {
> > >   		if (XE_IOCTL_DBG(xe, args->width !=3D 1) ||
> > >   		    XE_IOCTL_DBG(xe, args->num_placements !=3D 1) || @@ -
> 634,8
> > > +638,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void
> *data,
> > >   		for_each_tile(tile, xe, id) {
> > >   			struct xe_exec_queue *new;
> > > -			u32 flags =3D EXEC_QUEUE_FLAG_VM;
> > > +			flags |=3D EXEC_QUEUE_FLAG_VM;
> > >   			if (id)
> > >   				flags |=3D
> EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
> > > @@ -682,7 +686,7 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
> > >   		}
> > >   		q =3D xe_exec_queue_create(xe, vm, logical_mask,
> > > -					 args->width, hwe, 0,
> > > +					 args->width, hwe, flags,
> > >   					 args->extensions);
> > >   		up_read(&vm->lock);
> > >   		xe_vm_put(vm);
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index 6eb7ff091534..cc1cffb5c87f 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -85,6 +85,8 @@ struct xe_exec_queue {
> > >   #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
> > >   /* kernel exec_queue only, set priority to highest level */
> > >   #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> > > +/* flag to indicate low latency hint to guc */
> > > +#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
> > >   	/**
> > >   	 * @flags: flags for this exec queue, should statically setup
> > > aside from ban diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > b/drivers/gpu/drm/xe/xe_guc_pc.c index 02409eedb914..25040efa043f
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > @@ -995,6 +995,17 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
> > >   	return ret;
> > >   }
> > > +static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val) {
> > > +	int ret =3D 0;
> > > +
> > > +	ret =3D pc_action_set_param(pc,
> > > +				  SLPC_PARAM_STRATEGIES,
> > > +				  val);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >   /**
> > >    * xe_guc_pc_start - Start GuC's Power Conservation component
> > >    * @pc: Xe_GuC_PC instance
> > > @@ -1054,6 +1065,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> > >   	}
> > >   	ret =3D pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> > > +	if (ret)
> > > +		goto out;
> > > +
> > > +	/* Enable SLPC Optimized Strategy for compute */
> > > +	ret =3D pc_action_set_strategy(pc,
> SLPC_OPTIMIZED_STRATEGY_COMPUTE);
> > >   out:
> > >   	xe_force_wake_put(gt_to_fw(gt), fw_ref); diff --git
> > > a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 913c74d6e2ae..f2ce3086838c 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -15,6 +15,7 @@
> > >   #include <drm/drm_managed.h>
> > >   #include "abi/guc_actions_abi.h"
> > > +#include "abi/guc_actions_slpc_abi.h"
> > >   #include "abi/guc_klvs_abi.h"
> > >   #include "regs/xe_lrc_layout.h"
> > >   #include "xe_assert.h"
> > > @@ -400,6 +401,7 @@ static void
> __guc_exec_queue_policy_add_##func(struct exec_queue_policy *policy,
> > >   MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum,
> EXECUTION_QUANTUM)
> > >   MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout,
> PREEMPTION_TIMEOUT)
> > >   MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
> > > +MAKE_EXEC_QUEUE_POLICY_ADD(slpc_exec_queue_freq_req,
> > > +SLPM_GT_FREQUENCY)
> > >   #undef MAKE_EXEC_QUEUE_POLICY_ADD
> > >   static const int xe_exec_queue_prio_to_guc[] =3D { @@ -414,14
> > > +416,20 @@ static void init_policies(struct xe_guc *guc, struct
> xe_exec_queue *q)
> > >   	struct exec_queue_policy policy;
> > >   	enum xe_exec_queue_priority prio =3D q->sched_props.priority;
> > >   	u32 timeslice_us =3D q->sched_props.timeslice_us;
> > > +	u32 slpc_exec_queue_freq_req =3D 0;
> > >   	u32 preempt_timeout_us =3D q->sched_props.preempt_timeout_us;
> > >   	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > > +	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
> > > +		slpc_exec_queue_freq_req |=3D
> SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> > > +
> > >   	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
> > >   	__guc_exec_queue_policy_add_priority(&policy,
> xe_exec_queue_prio_to_guc[prio]);
> > >   	__guc_exec_queue_policy_add_execution_quantum(&policy,
> timeslice_us);
> > >   	__guc_exec_queue_policy_add_preemption_timeout(&policy,
> > > preempt_timeout_us);
> > > +	__guc_exec_queue_policy_add_slpc_exec_queue_freq_req(&policy,
> > > +
> slpc_exec_queue_freq_req);
> > >   	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
> > >   		       __guc_exec_queue_policy_action_size(&policy), 0, 0); diff
> > > --git a/drivers/gpu/drm/xe/xe_query.c
> > > b/drivers/gpu/drm/xe/xe_query.c index 042f87a688e7..102923d3dc74
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -336,6 +336,8 @@ static int query_config(struct xe_device *xe, str=
uct
> drm_xe_device_query *query)
> > >   	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> > >   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =3D
> > >   			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> > > +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> > > +			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> > >   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =3D
> > >   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K :
> SZ_4K;
> > >   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] =3D xe->info.va_bits;
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 892f54d3aa09..7f8a51fa54a3 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
> > >    *
> > >    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the
> device
> > >    *      has usable VRAM
> > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if
> the device
> > > + *      has low latency hint support
> > >    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory
> alignment
> > >    *    required by this device, typically SZ_4K or SZ_64K
> > >    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual
> > > address @@ -409,6 +411,7 @@ struct drm_xe_query_config {
> > >   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> > >   #define DRM_XE_QUERY_CONFIG_FLAGS			1
> > >   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 <<
> 1)
> > >   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > >   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > >   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > > @@ -1204,6 +1207,21 @@ struct drm_xe_vm_bind {
> > >    *     };
> > >    *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> &exec_queue_create);
> > >    *
> > > + *     Allow users to provide a hint to kernel for cases demanding l=
ow
> latency profile.
> > > +
> > same issues as above, extra line
> > > + *     user need to indicate low latency hint with flag while creati=
ng exec
> queue
> > s/user need to/User can
> > > + *     as mentioned below,
> > > + *
> > > + *     struct drm_xe_exec_queue_create exec_queue_create =3D {
> > > + *          .flags =3D DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT
> > missing "," at eol
> > > + *          .extensions =3D 0,
> > > + *          .vm_id =3D vm,
> > > + *          .num_bb_per_exec =3D 1,
> > > + *          .num_eng_per_bb =3D 1,
> > > + *          .instances =3D to_user_pointer(&instance),
> > > + *     };
> > > + *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> &exec_queue_create);
> > > + *
> > >    */
> > >   struct drm_xe_exec_queue_create {
> > >   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY
> 	0
> > > @@ -1222,7 +1240,8 @@ struct drm_xe_exec_queue_create {
> > >   	/** @vm_id: VM to use for this exec queue */
> > >   	__u32 vm_id;
> > > -	/** @flags: MBZ */
> > > +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> > > +	/** @flags: flags to use for this exec queue */
> > >   	__u32 flags;
> >
> > With above minor cosmetic issues fixed, this is
>=20
> Any v9 coming soon? It looks we don't have further concerns with this and=
 we
> could get this in soon...

Hi, It is on patchwork already, https://patchwork.freedesktop.org/patch/636=
620/ .

Tejas
>=20
> >
> > Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> >
> > >   	/** @exec_queue_id: Returned exec queue ID */
