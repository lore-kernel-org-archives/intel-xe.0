Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11FDE9A02A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 17:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7333C10E1C2;
	Tue, 17 Feb 2026 17:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U27Pn5Sh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E4810E1C2
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 17:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771350927; x=1802886927;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qxdHhZp45XlmfkxWIE8bz9RBabvMcdFuB3sU0C8w4kc=;
 b=U27Pn5ShphNrRSWKZi4Lkyx2mbcPXUEcrsmrVN/swSEagHPnI0U65PE9
 +vPrEMRF2soVO8D6HyhyNxKpWZH3WPVCkMiUWETozwk2oseDERa6N38xR
 D4Ezk0+4HN9ZhBlQsgU7QIZxrQ7/78+evGuguwBEFx5sK88b3R8PN6NJS
 CuX4wNBHn0EniXZAcp5b64vLdoM+IYWrkw2gq3GtUiH2DLkic/UrHrkE/
 epz8R29pq6HCnJpvIhC5KaAfcfbXt4BQ0aXrGERW1F79GtujdF2UlY6RS
 Ma1SCdnIHQVhWC7sQU1/6YZkGhel3fj/J7FRx4219i90JPJG55iKZzsGA Q==;
X-CSE-ConnectionGUID: fWWN5szGRkGg/BUb/sN+cw==
X-CSE-MsgGUID: mjlwDwyORS+JK2dOhsdOIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76267863"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="76267863"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 09:55:27 -0800
X-CSE-ConnectionGUID: kwqLjwNkQvagFqISwGd80w==
X-CSE-MsgGUID: SbncHKSUT+SXLHp4OuZPOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="244542237"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 09:55:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 09:55:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 09:55:25 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 09:55:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMD3YCYNLC+y2fgPggyymAv/+M80ZxyRTJivDoA/YCvVPkgFRWDro3kNC4pp3Ktlr9sdUQykcLjvT7UdtGvpvLKrGqpjtdcF1t1tkkgbT00kSL5NY/HOYazyrjIfwUeEEEntncBPD78+VEV79WTCxlwnp31EE5bGZIHUggp3q0Is3afa3Xgze6gfOhIjfKWymHutAD/Ode6h81qAf675Aie3w3DnguHICAaKzY1CeIFSJ+rNJrwmheTG4UeGWhzRNwGJaS9ntls57HjCIFFqwFBZTbGncXgxEL8qt3jxmTlcD+gt5z7GJJAqDkvQCCtvNoofmIqGl6uZ3W/gJnoWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxdHhZp45XlmfkxWIE8bz9RBabvMcdFuB3sU0C8w4kc=;
 b=ZVTOwST67NgDOcCsbBf5oYV7vvCnhmRioQ8Z9cUcnepa7ZtVvx4K8ZO32cwMSh26Bm48dfYg/enQGLh2i1I1a+vtXLLX5iO7unp847r0iiB9dL+DPerhlZwECPsJH5fMRZPsGJionjb3aMQwp7z9iRv4b5HEMa/+TK2QZxEgRNa+ckM3pk4v7/BF3LBleuvHZKctQi5TyfWn9q2ri/CNQm2wtQ57n//W2kHLB0v1VImptds2wOHZKnthn/UHs8rqw6c4Yz0g+jL6nzQLPqu4/UI65UjvIdznlf+xXpXH4dSz3k9Gdbd7x9P0FkKlULXFF2pm7fh8IsdRuL28pP0Vdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5447.namprd11.prod.outlook.com (2603:10b6:208:315::17)
 by SJ2PR11MB8321.namprd11.prod.outlook.com (2603:10b6:a03:546::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 17:55:08 +0000
Received: from BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::9f88:5b88:b76b:271e]) by BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::9f88:5b88:b76b:271e%6]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 17:55:08 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Winiarski, Michal" <michal.winiarski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Osterlund, Sebastian"
 <sebastian.osterlund@intel.com>
Subject: RE: [PATCH] drm/xe/pf: Fix use-after-free in migration restore
Thread-Topic: [PATCH] drm/xe/pf: Fix use-after-free in migration restore
Thread-Index: AQHcoCQLEB60zrLfLEC9AOPTg7+VW7WHLAnA
Date: Tue, 17 Feb 2026 17:55:08 +0000
Message-ID: <BL1PR11MB5447F97AFAE9454DEB07D0F6EA6DA@BL1PR11MB5447.namprd11.prod.outlook.com>
References: <20260217154118.176902-1-michal.winiarski@intel.com>
In-Reply-To: <20260217154118.176902-1-michal.winiarski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5447:EE_|SJ2PR11MB8321:EE_
x-ms-office365-filtering-correlation-id: 0f79640c-4b99-4b71-b90d-08de6e4db0a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?amZXYk9oNnRla3U1WmloR2N5VDI2WnJJdU51d2gxUEw4djdyczh4MkVWTnZy?=
 =?utf-8?B?NlJxWDFNNXRJMHpKeWRuR1QzTURHR3R6aWRwRjkvdjNCVHBpeGh0ZHBDaUNN?=
 =?utf-8?B?ODVEOUJZT0FEcVo5c3hydVBWUTVGUFo3ZnZha0NzR0RtVGFJOVdpZ2dYVUY2?=
 =?utf-8?B?Q05jeDR3NzRLck45Y0NsYzhzcmFRWTRPWW5YNDJLUUUxZlpZRVUzTHc5dkRp?=
 =?utf-8?B?c0NTQ0lFVnlXbWFEa0ZHeWF0ZVdDQUhjNzVmUUY5UWFHWFJhcXAyaGRoMmN3?=
 =?utf-8?B?MmNiV0lzd0pzRHh1QXFXUHpBaS9xQW9uNGEzVDVsVlBYTkcvL1djYTMxazhJ?=
 =?utf-8?B?T3Fya1JlY2QySmRXdE55dEJjYjUwSTJRTUo3dm9jdEVJcWdZbFVhS2RpcUIv?=
 =?utf-8?B?Ung2Q055SVBEcEFIMUdGQXgyNnBxZlEvdlNOQ3ZoTFVhcFNKWUE1Skc1V1Yv?=
 =?utf-8?B?aUNyRGFyUlFUOFBSZFA4ZXJoTXhDRFMzQytmMjIvcUxGYlJRNVhlMlhGVXpj?=
 =?utf-8?B?eS9QeHY3T0tqSlJLN3hBREFudCt0cDJPVjEzNjYwRDBnTU1mZ3d2RVNEc2FD?=
 =?utf-8?B?UzluNHNUeWErQ25ENjBhenNla3lUbFhUZDBVNW15Z3V5Zzh1eTZESzljWXFB?=
 =?utf-8?B?OS9UaWJuZ1VQQ1lJUTRVOUtXYUozOGx5cnVhNjhwS0ZFNmVlNlBIUk5lbGhl?=
 =?utf-8?B?bFplQTZtaXROZG5tQ3Y1UGNQa2c1QUI0eUlLUnVNaklpYkhYREpwQlZuR2tt?=
 =?utf-8?B?NmVTaWN1eFhaSFZkZXhldlQvdkhXKzdqU0pQcmF2dUxjUnJQaks5WlJSaUli?=
 =?utf-8?B?Rk84T2M1QTg2VFAxNDNvN0RPVXV0SmUwMWZFZExPempOd0dpNU9BTmNERXIv?=
 =?utf-8?B?RkpLdXVIcWU2RXBYOXUrcUFlV1QrRFJGM29lQ3ZocDJhb1Y3ckNjN1lUS0Jt?=
 =?utf-8?B?SThKS2NzNDkvQW9keVAxT1FwK1c0TDdzekVhQi9TbWVHaVh6b2ZKU0wyaXZS?=
 =?utf-8?B?Zk5uMUt5TjZhSVRrYXRURDd3SlllMm9IUWVhY0VYOExxMlhuYkNaR3NCU2tv?=
 =?utf-8?B?SFp2K1JXOHY3VWZDK0pVaHZVZHNQSEJPKzlqY2xNWEUyTjJOVStYWVJzMHhU?=
 =?utf-8?B?OHhNcjZJQlM5dmlVL2tKalFqcVBKWWtBS0VwR1FrRE9ESXV0K0pZZXhMNkh6?=
 =?utf-8?B?K3c2bVlTV0t4YTVHd2JWbnIwMThTQmhGZ3FRdk8xbGptZWhjRGx1dnI2T2o5?=
 =?utf-8?B?aCszSE1qSjdxY0g2YnEzSWZ4YlZZQW13T2tSeXYzanhxU0wrNFMzSjlqVFN3?=
 =?utf-8?B?WHozTGlOeGxUNG4yQTBVUHNqWU1XTEkyaitqV2ZRRHNUY2tGNXY4NCs3UCtu?=
 =?utf-8?B?Q2hOME01eE1PTkdPZTNMRldxUlJHblJBa09aMU9raXZuRFc3S3NrVFYwN0k3?=
 =?utf-8?B?V3RUajc1RmQ3YzFFLytIeUw3NWlpMWtXT2w1cTB0bTVmS3NWYjJtekVpOFJ3?=
 =?utf-8?B?R3lVaHVnbUVuYllZeERnckNvdEFWamZSdzFNV2k0Qk5xWkhCemVyanRKb2xK?=
 =?utf-8?B?TkpQcDFEMWJWY1AvUzZlZGlHQ2NBV0ZHazlSSFpPenU3dWpjOXBJOGVPbENI?=
 =?utf-8?B?ZHpscStZcTYvc250bHFtQnlJZ3pFUXlka1lpcmxpMHgrbDF4MXVXekR0MFVt?=
 =?utf-8?B?amc3YmZENmdkdytOY3pNbkQ4K1VkeVk5Vi9vUzZTaWt6bTVxL2NzamRYZG8w?=
 =?utf-8?B?VXNQbnRRL2VyNDN5TWpJNkMrNUNMdHNyZy83SjlYOGxlMmJ1ajV4c0pnQ3M5?=
 =?utf-8?B?aUY3R3hmeE9ZTmNrcHh5Q2d3U2d4Q3hucGVzU0NqOG9JQlpVbTlVYVJCdXFL?=
 =?utf-8?B?UzF5dTNVRW5rcjF6d2tVbG9qM3NBRkNyWmRUdGFBdUhnSG1PUmJtRGNaSHVZ?=
 =?utf-8?B?QXpMbTRlSEg5c3gza2cwOGZsOWM1M0hIcGdHLzlJM3pVeFVxSm1HWm02STJj?=
 =?utf-8?B?UTJaT01EMmlsdm1NQjRPMHp5ODZWdlBqN1o1Ynl6WDFMQVVzamZVVzJvclRk?=
 =?utf-8?B?VG4xRS9QRUcvbXV6eVFPb2QxTXEvOStpeWJHR2pjN2VtL2lPK016TXJoQVVL?=
 =?utf-8?Q?22FKkUMQWi0jumoEtyldLZTND?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5447.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1ZNNTFpTlJhWUU5Q3B4TEhQTEpRTS9IYzR5RVVLd1dDN0UrNVRjT0ZZcTh4?=
 =?utf-8?B?dTNKNTRjS05acUZGS0Y4clJORTlsVC9wSU1aTDBSMXltNXFGZ1I5cTVmb2V0?=
 =?utf-8?B?SEdxdHB3N0FGdGdGQU5GQ1RId3lEVjFZbDdDMnk2dzdKK3lRZkZFNENVZXp2?=
 =?utf-8?B?bTBKSWFiMis3WWg4T1ByYXVvaWc5emk5MURPMXhmQlJzdHgyVHVyT05kaTlo?=
 =?utf-8?B?K2NnaWR5SDNnV2ZnQTZZd3grUUNCMStzK1RBY1VFVm9QYitvOXpaRUREV1RY?=
 =?utf-8?B?M2NXYzh4THhQU2JWaEd6OGZWbTBKNnhTZ1lkK1loSnBXNUxkWXVBNTIvYVUx?=
 =?utf-8?B?K0hITEdTVXhDc1l2Sm9YbUEwL3JJT1psMlRsQVdsVHNPTW94bDJOVW9Yai9T?=
 =?utf-8?B?OWdEaVNRMW5PK25ERHN6NGp3VEUrTHBlYmgydjExZGZ3S2NYM3cvNG9HTmxi?=
 =?utf-8?B?QnorVHJxUnNQM2FKUEF5bnBMa2R4Tkdmd2JJZlIxRDQzdjZUdHFsUSsrZWJx?=
 =?utf-8?B?dHRTdHlDSy9JTGg0WG1OOVpjYVZVbko1Y0JvKzBZblNQNUFCclRjWXpYNW9u?=
 =?utf-8?B?OGFCZkJIdS9wV3ZpZ09zNEVBUm5kNlJYQWREcVNWUG0zUHoyWnZQM2M3cGZL?=
 =?utf-8?B?MXRLSk9NMjZEdW1vYzJ6TUJtZzZGRlBXdGVNYm5zSW9KOFc0blRSS0NJeWgy?=
 =?utf-8?B?UTJ4djExSGdEdnJZazBmZU1WTys5YSt4NTRmM1djUjVHWGJiM0h2TGdCNWp4?=
 =?utf-8?B?cStDMlZCcllWQ0xJM3VkS3RZRTdzVXdpVzYzMkY2cW5SdlNibTgxc2gwc2p1?=
 =?utf-8?B?WDBBUFRkWGVXelZxYWNIdEU3UjdYb1V3TVFlekdhbmd5VVJ0elJJWFg4QjFX?=
 =?utf-8?B?R0dVaGxlUlk4eWNJdnRLamtPRnZoYzQzeHQwUVJET2JQR25LZ3RDZ2M3TWt0?=
 =?utf-8?B?M3J1R1FzczBGaGJubitieDNBU2k0MEN3Y1JGWjkyTkI3YUR2akJncXlXdGJK?=
 =?utf-8?B?dkFpS0xZNG1vSmVjNXVRZk1iZlEzTDd1WTM3UTljSnR4MnNtbkdnUjNUYkM3?=
 =?utf-8?B?Zm56UHVVNWVEUVJzbURSKzVsd0VIYkRIZ3lzanBWR0VUTXpubDZhM1VhbEwx?=
 =?utf-8?B?Zy9hU0dvY3JtSnpQV29uZVlrVTJxZ1h3Z3VJZWxvSm5OS2FpMEpCZnNFdm95?=
 =?utf-8?B?Sk5MNGlDa3E3eWI1SW9NZ3E2VlNrQkV2TGU5ZFJOSmJLNU9WYkFQUjljQXBh?=
 =?utf-8?B?cTBLTzVvS0c1d3doMUFCRGhCa3F1VGpIbHRzSFV2ZThtb1VhTTAyeXN2dHla?=
 =?utf-8?B?QkJPcTIwUGJsMkx5d2tkYWZrSlZudG9pYnB0b3prMHhEaENmdkJlcyt5NFBw?=
 =?utf-8?B?SlVDcWx4MmFXbFJDK1o4dXdwcDVwUDNqS3h4SmowYTA0aklSdm9IUE05dktU?=
 =?utf-8?B?cCtsS2FzMzBpWnBlK3BtVTVlRzZzOEIxM0NVWXR6REJoVFluSUEyaitMN0w4?=
 =?utf-8?B?cFkwVEd5TkFCeVFtUmUzaWxnblJHZWVJeHhGcVZMa2VMVDZpdlg2aEp5blBE?=
 =?utf-8?B?RC82TmtFWkJoaWFPUHp5VFd3OGVBbU1wSWZIQ2hlNkxLNmdPR1c2OWRpaFJi?=
 =?utf-8?B?TU1DcFhZeHRyT05OaldYV0YzK3pDS0x6U2YrbnllaG1tbG5lb1Bhc2ovUnlr?=
 =?utf-8?B?T3p2dG5JSlljUXhKL2tlLy95dGd1Y2pQUlAwZHZOMjBVQzRUcnBzeDJGTEl3?=
 =?utf-8?B?YklVOXU5YXNRN0JYT2ZmWFhNSUYyZEdhYURkS0pIeXBFQ29hSnQ2Z216YXdL?=
 =?utf-8?B?YUVacDBmYWhQKzZGdThuRE1QUXc4TW1XTHBhVTJyL01yMStwUWJDOGdaRUdn?=
 =?utf-8?B?Q2hPOUFmNWRybzBua0FwU2RRQ2NiM2t1aStRRlNYcnlla1ZJdi91UTEzWnpr?=
 =?utf-8?B?Ym1FZjBmNDhGai8xenFjYy92UmtacWRaQlVxbFpuWnFqODhBd2hERVlGY2N1?=
 =?utf-8?B?NVJqak5GTG5WL1pOb1RVcEJuRTFlZVk2K0VrU09ZaWxuUHNQUjVOU1U3dDgv?=
 =?utf-8?B?cWV0a1g5SGNTUDRUOHdqTGd6S2xtdk0vZU9IRVZYT2JtcFA4MzJCNzMvanZx?=
 =?utf-8?B?bnFPWXZzbkROL0Q1SW1mcm53RUtyTVpnN2FRRVlSdEptMWRBa0ZOQWZ2VTYr?=
 =?utf-8?B?NEtsZVhWdlpZVHF6djUrVDVhaFlGOUpvSWJ2MWNMaENGK2QxSCtTeUp1RUp0?=
 =?utf-8?B?ODlsekprdGxWS3QyK3kzMGJOcms0UmNJTGlVK2ZOQzdyanZ2VDFGcGVNZ0Y1?=
 =?utf-8?B?RGxDVTJBN2lXYkZzU2k1WENyRWV1WFpkS1pOS2ZIK0JiRGpJYXBDdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f79640c-4b99-4b71-b90d-08de6e4db0a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 17:55:08.8355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OkLawpOVJKVPtEkXnxXlUbO7CEgcgh/J3OvYx0AGN5OF3w0b7S00dajnaoL0RJUNPKHtcaxPR+kMYC+cl7spWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8321
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

T24gVHVlLCBGZWIgMTcsIDIwMjYgNzo0MSBBTSBNaWNoYcWCIFdpbmlhcnNraSB3cm90ZToNCj4g
V2hlbiBhbiBlcnJvciBpcyByZXR1cm5lZCBmcm9tIHhlX3NyaW92X3BmX21pZ3JhdGlvbl9yZXN0
b3JlX3Byb2R1Y2UoKSwNCj4gdGhlIGRhdGEgcG9pbnRlciBpcyBub3Qgc2V0IHRvIE5VTEwsIHdo
aWNoIGNhbiB0cmlnZ2VyIHVzZS1hZnRlci1mcmVlIGluDQo+IHN1YnNlcXVlbnQgLndyaXRlKCkg
Y2FsbHMuDQo+IFNldCB0aGUgcG9pbnRlciB0byBOVUxMIHVwb24gZXJyb3IgdG8gZml4IHRoZSBw
cm9ibGVtLg0KPiANCj4gRml4ZXM6IDFlZDMwMzk3YzBiOTIgKCJkcm0veGUvcGY6IEFkZCBzdXBw
b3J0IGZvciBlbmNhcC9kZWNhcCBvZg0KPiBiaXRzdHJlYW0gdG8vZnJvbSBwYWNrZXQiKQ0KPiBS
ZXBvcnRlZC1ieTogU2ViYXN0aWFuIMOWc3Rlcmx1bmQgPHNlYmFzdGlhbi5vc3Rlcmx1bmRAaW50
ZWwuY29tPg0KPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUv
a2VybmVsLy0vaXNzdWVzLzcyMzANCj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBXaW5pYXJza2kg
PG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPg0KDQpMR1RNLg0KUmV2aWV3ZWQtYnk6IFNodWlj
aGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3NyaW92X3BhY2tldC5jIHwgMiArKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9z
cmlvdl9wYWNrZXQuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zcmlvdl9wYWNrZXQuYw0K
PiBpbmRleCA3YTRjM2RlNjYyZTU2Li4xZGI1ZjQzNzBlOWUxIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfc3Jpb3ZfcGFja2V0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3NyaW92X3BhY2tldC5jDQo+IEBAIC0zNDEsNiArMzQxLDggQEAgc3NpemVfdCB4ZV9z
cmlvdl9wYWNrZXRfd3JpdGVfc2luZ2xlKHN0cnVjdCB4ZV9kZXZpY2UNCj4gKnhlLCB1bnNpZ25l
ZCBpbnQgdmZpZCwNCj4gIAkJcmV0ID0geGVfc3Jpb3ZfcGZfbWlncmF0aW9uX3Jlc3RvcmVfcHJv
ZHVjZSh4ZSwgdmZpZCwgKmRhdGEpOw0KPiAgCQlpZiAocmV0KSB7DQo+ICAJCQl4ZV9zcmlvdl9w
YWNrZXRfZnJlZSgqZGF0YSk7DQo+ICsJCQkqZGF0YSA9IE5VTEw7DQo+ICsNCj4gIAkJCXJldHVy
biByZXQ7DQo+ICAJCX0NCj4gDQo+IC0tDQo+IDIuNTMuMA0KDQo=
