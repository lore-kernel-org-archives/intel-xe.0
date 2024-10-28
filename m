Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4036D33991
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 14:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9961810E4C8;
	Mon, 28 Oct 2024 14:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khHX36+g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B2F10E4C8
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 14:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730126242; x=1761662242;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sT9nmFwigGkJU1GrXCVyxp7VmIVPuRCRUkVvA0qKccY=;
 b=khHX36+gbvCYLvT5S6sl6pnYyUZgtJkr/Gf2+mVw1XKWWoD+JtxyZHXi
 wpYaQq88gYt9CJj9qxBbWl5SIoxzq/PmTRWqcqMHNSSyDY/S3DSwX5ZAo
 /+dxDhauDwCg/MnU9FjwgVPdBpvwYaELbm6Si1iQbLhLnt21AjHXQu+dT
 d5aiPbzry32YTIYMItCl5KlBl2y1KkKE8D+Bg9SRXmsRtqGQSiP513nBR
 QJJuBn/IhNLhjYt321Hor54zvXMEiaQP7oGF+O0hDMWV7o3Ar232GxxtK
 H1WbhDWmrKL19JOqSAF/GYiKDaNcQudoawcbfHA7ludLZPIgnKq1I/yXz A==;
X-CSE-ConnectionGUID: BMbUEhheTbW/oDFrM/haqA==
X-CSE-MsgGUID: ur5JuK4xTAaBWBLQMyVKfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52277338"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52277338"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 07:37:22 -0700
X-CSE-ConnectionGUID: SbQyGiPvQY2BaQ7jLr64fA==
X-CSE-MsgGUID: bUj7PWVmQg2QJRv7Hoo85w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81742129"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 07:37:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 07:37:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 07:37:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 07:37:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnzPq/Sth/6GRk3tlX7WeXsClfc+O1gxN+KeHtGDas3c2O8nAHN1n2kiZ5k5CKPjpbGgyUWeVsQpwq1n+Uq+z9VzrQYvbB41oItBXSn2lSulLfRu5gNLPP2H+sWHoKoUNMx9P7lZcrpK+WXPfPOP1YhJJxiGIeoHPpBfOySblqF1eAmyIlHQOw1tQ8K/EGwBBlKi3/WCkfc8mBXEcmRunbCZBhi+4+iOGbohicgEB4VQxRyrnddwc33Zm/xfY23KYgs0xwxosqBA9PR8p9hbHqNExU+GsfaRZ89MTh/Md5/gNfnNgn1MlxQQKGCimq911KUIHhyZFhEN+g2nda8qvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sT9nmFwigGkJU1GrXCVyxp7VmIVPuRCRUkVvA0qKccY=;
 b=X+oNShkJ1H3fEfXucgr9nvR8Te3/qCoh71nEhsIVCdUtPtjErgGVNDnhBd2lSQC0KcliLZAXRCp6vhe7t9an2O7LsqMZl9x1jw+SRp8DP68Dc7F9Ae2L8QNHAAVceQbqkotRn4YZCxjNN5PnAA60AzOSW5mCbPmc39SnTX24VHy/5QvKWUIBVpdLZziDrRITMZRxSjA0TDs8P19A4ygpoRtQp/koixT9DDh47Aw+NPlKEkueRYT5IXgocdaNgNP2C8xwN65p6fT2p0VSG1xKjiAnP8LXoTifdbPEFAOJwMArLAe61SkXK1emO0S4OycZcb9UVfSaSRR/coE5zunj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB8860.namprd11.prod.outlook.com (2603:10b6:806:468::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 14:37:18 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8093.025; Mon, 28 Oct 2024
 14:37:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/3] drm/xe: Add trace to lrc timestamp update
Thread-Topic: [PATCH 1/3] drm/xe: Add trace to lrc timestamp update
Thread-Index: AQHbJ8n0e439Hyg1eUiYApxs+LgBI7KcPfKQ
Date: Mon, 28 Oct 2024 14:37:17 +0000
Message-ID: <CH0PR11MB54448CC11FA14E4B6947D7CEE54A2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-3-lucas.demarchi@intel.com>
In-Reply-To: <20241026170952.94670-3-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB8860:EE_
x-ms-office365-filtering-correlation-id: 56c2fb08-6da0-434c-ab44-08dcf75e05f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UjBGRmFub0FCRUtZWURXcExMZzZSUUhnaHZnTWdwcjVLOWZEVVZZajNsYVlj?=
 =?utf-8?B?T1lsQ1lkemYwRG03REZFTDBaQzhzTkxhVTdQV1RRdkUvS3llMFNlemNtclJV?=
 =?utf-8?B?TTdnQytDTUdvbVdPcHIxbDJXT0dWSDRvL1VXR3FJd05STTA4NnY5TjUzL0FD?=
 =?utf-8?B?alUvTlZ1MTRzdDZlc2hLT0hlZC9NeC9lR2hoY3dWRU9EWndicU1tMFFNUFNx?=
 =?utf-8?B?YzZHY2dEamFjUStIUGtJb0plbXF0MFkrdmxMRmJYbzFabDVxZEJOSWRhTkhm?=
 =?utf-8?B?a0cxaklmdEJtaGpZa1NxM3kySHNaYkVmeG5pY2Y4SWQrTkNMNWI5Nld2MUI5?=
 =?utf-8?B?Wmc3SURhTEFTSzZONXd2b0h1S29JK2EwQ3ZHT2Z3VFFVTUd6TXkzZE9Tb0lw?=
 =?utf-8?B?ai9nUk43cDRIZjdWR1hYV21LR0RhbktGcGhLODFUVW9KU0MwOGdvU01JMWN4?=
 =?utf-8?B?OXU3bFZCbjdhaUdFb01WbGtYMVprSUtnbTdnNHNOdGtVVTUwcVI5cndvekpx?=
 =?utf-8?B?cFowM2ZzcS9rWlZwRWtyYkU0NkU5MUJwN1Fpd3pOY0gwdFpuWHA0cG85MEhn?=
 =?utf-8?B?SytpdlcrL2M3alhUeGt6MGJGVVZoTlNPZGxiKzNaV0ZZbjVUTWFKQytWMkxN?=
 =?utf-8?B?Z3ZaREVwTndZMzZFTk5ycUNXYTNmNWxCc2dtQ3ZoS0VUby8zdHEyZEcwOWFr?=
 =?utf-8?B?OUROWTV1bmcreDhvbFk4MEFjZ3NzMnNvM2xZMkpTa2pqVWJ2dUVXOVMyaVp1?=
 =?utf-8?B?RU1WVFhzS3liUnc1cVZ3eGdEUUNZK2EzQzRSN2hodDUxRjdTaHVhNEIvL1Ux?=
 =?utf-8?B?dWVCTExWcytzQUQySlVLd0VTWEFVQVBRdDdjZ0dkaFFJc0N6S0pkV3o2NzdU?=
 =?utf-8?B?YzVSbFJNbUxHV2NiZ1pSRlpZOHFXSVMrVERoUHExMXBGMmUwNXR1RUdodi8r?=
 =?utf-8?B?cmd6Q1MvU3g3djVKYjd1RHF4KzZpNUp1RWc0dlc3L0c4SndZamdDMFRiM1dF?=
 =?utf-8?B?aUFWM2hyU2ZxbWFjTXFCL2FKM0VpTStkcVRDOVpTTHI5dHZXc0FKNmdkVVNk?=
 =?utf-8?B?eXNPZkZqYjJVVHJ5ZDJsbkVqNFB1MVJuckFmdEZhOVdXSEh6NkEyV1l4MEdP?=
 =?utf-8?B?MGJhOEw2aGF2ZFV5a3pBWERlMEpPcDN2aVJJYnQwL3FTNU5YblN0VWMzZi9w?=
 =?utf-8?B?cXVOSDJQRnNiOUFLM0pQM2RqZEZrTE9pdmltQjNzbHRhWjY4WWoyNC80WjF6?=
 =?utf-8?B?bVlCU0xkM3lxNit4V2hoSlFLaW5PQ1ZueHN3SXJkZGNwUVo0MldmeTlqRzFK?=
 =?utf-8?B?SEU3NDlsRTFzWTZrMVVVSGxJaWcrTXZsbldWTXA4Y0x4QlA1ZzEvNkwyVUx5?=
 =?utf-8?B?NVNzRlRpcGNsVm5VdVdCMW4zNGY5VENWNytCYmRDOCtwblVPWWtTcmd3Q3Ez?=
 =?utf-8?B?VEtpL2RkbVk0UGlhdGtma1hZV09RaVI3WWFPVko5SzNrSTlxdEZOSTlnNnhn?=
 =?utf-8?B?NXhiY2NRTERqb1NEcFlwN3RCMXBkY3JmMnpEb2VHS3pTL2pKNlMzcFN3TE96?=
 =?utf-8?B?QmJTbkxOWlYxdWZuanFoWVZFNnpqYm9XYmxvRU0xV3RIcHk5Wjd2NjFFaG1G?=
 =?utf-8?B?NHR5ZjluejdkUjZFOER4ODNFa2o1Ry9HYlA3R2hoUlJjbUljWmRKRHo0NllT?=
 =?utf-8?B?QXF3aDBXYUh3UXljMWZmVjZoUTdlOWxrU3R1QWpwL3BDRVpQbitMWjR3bFNS?=
 =?utf-8?B?V3hya2RGeVVsWnhCZ05BaXVlUnhxZTA5U0M4cHRTcWIyYkFJbm1mSDd1NXFC?=
 =?utf-8?Q?Fa8pLNU791QiFS/YxZVFdnKAqO2c9AklWUB3U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MG9jaVY1NFVDWlhocVQ5MXFyZUZUWVNZdTZKSHZIWlE2NElkWXVINCtLL25O?=
 =?utf-8?B?dXJoUytuM0JoQU1qNTJ1OFZJWm1wSitHQ3FvUlQ2U1U2akFBR21MZ0x4UEN5?=
 =?utf-8?B?ZmtGL2V4VkRpc2VlWmNmbm5uNGxJUWhhRmZJZU55MkNZMCs1S0xNc0lnejRI?=
 =?utf-8?B?K2h3elN1VE5adktNeDFuVjlLV1VLbW81bWM3bmJlcHlwbWUyWVlwbkEzMDBk?=
 =?utf-8?B?ZkZYSUUvZ2ZwMUIvalFMRGlTOXQvQU1jSE1vSEpiNXRzQWRpM3J6dTBXbDA0?=
 =?utf-8?B?LzlLSG1qR0ZqSVZLdkNWMDZxZ2FzakNxWXB0R3pIR1N2dnFad2VpSmVBeUJx?=
 =?utf-8?B?Y1ozNGt6MXVwbERrQ3RSZ0lzcGpSbDltZFhQVERBMVFWMkNSUUNzYTExaGdR?=
 =?utf-8?B?T3cwVHBqTHFia1VnOGtPdFVkKzJxYVQ3dXRyZjFpbzhyUFk5SWRYWEZDOWM3?=
 =?utf-8?B?UkpnaHBob09lZE5sMEIxZk1aRkpIZUwwSkFEN2t6dzRUVFNxMjRkOHpNNXVu?=
 =?utf-8?B?Tjl3TGpTT25qWmRkZWxQNlkzWWpha3R1cDZoMHhGc0dvZi96TWxlN3lZc0FM?=
 =?utf-8?B?VXVaM1dHQzh5S2tNbW9YekVsVXdJd01HR1drd2d4ckhEdWFzWi8wU1FLQmh0?=
 =?utf-8?B?Vlhxb1J2VVFtV2dzNDJjUzJCVlNkYkVZbkYvQkZaRkJ2Y25BTWVpeElSbFZT?=
 =?utf-8?B?QlpQU3R5eHo5cjEzMzFBZWVSajNTQVFiajhMTlVqK2Q1VWswVHVxdnFMdStU?=
 =?utf-8?B?dFJNY0ZpeWFkak9NVkJRT2pUQjJUc3Z6ZWRzRStpS3hnZFN4bWMzQVRxcmxl?=
 =?utf-8?B?cE5lTU9hVGs5c3RqUmd4VkpSR3pZcDRtZVBna0JLbGE0UG5KOVFmcFI2MmlY?=
 =?utf-8?B?UDBKOTU1cGxGS0dJMFNvVjdkeXVLaDNHMlYzc0VDMWRMMGlZbk5EMHpnQUh2?=
 =?utf-8?B?a2pVY2RjejFGVXpEYW1BTFJTNjVZdGdYOTJsdnZEY0syTEI2RjkvM0xNbVND?=
 =?utf-8?B?b3VoK0NmdlVxeS9FRkg0R2lRUnhkZnNVbnNZUndPSWlqTEEzTDFYSGMzUkQ4?=
 =?utf-8?B?K3ZINzNBM01VS01HS2FyN29yZTJ6N3U3WXhJU3N5VHlkQ2ZHbms4eFBJakZJ?=
 =?utf-8?B?cCthdEdYYmkwbjFCNjR3QUFISFhDdWNjeGZZK3ZpbkpwMmxnV2x5dEFpRDRS?=
 =?utf-8?B?bS9TbDJWZFlQTm9vb3FocDdiRzZoTklJNlNoL2xHNnZDSmMwanJDNlZKa2Iv?=
 =?utf-8?B?Y3NueS9vK0NYOVp5OFNlRFlrS2tpZWMzSTEwZk96QmF1aXY2NmtMc1FQSFRr?=
 =?utf-8?B?Y2d1bW5NUmtlaVQ1b212MXltTk9OS0FUTGg0K1lJdXRsUTRMY2NrRjYrZ3Z6?=
 =?utf-8?B?UXJoOUZnWFVMMnI4QktYZHU2MXBGSUp1VTFFK3hYVHpqYkp5SnJJZUlCY2Jl?=
 =?utf-8?B?VEdjdEVJRDhPVzhWNG1TYlJHQ2RyeXgvdHRocjQ4L2hOWS9rMU1EUENkOGFv?=
 =?utf-8?B?K25nSXNJbmlDM29qTFhmanpYcndHcVgrMFo0OG83NWQvQlNVMGZ3NHVyVjFJ?=
 =?utf-8?B?Y1RISGx1V1JNMFBudURkdjZkc1IxSFJFcUVzWFdnQ0JrTEdWWVFpWGZaQkpD?=
 =?utf-8?B?cTVFY0tUOE1IV3BWdzRDS0l1S3A5MTBrb2JqQTBJcUZ5ZDY1WXpRL2hwcnBw?=
 =?utf-8?B?bWpQRkhjNHYvSlNNdWtndmxJU1BjM0ZCMkVtRXdFSm0vSVhYL1pkNGZVS1Q4?=
 =?utf-8?B?bGVkdS81V2E2OC8yRlp1RzhZZWdZTmg4clpZMnRHNHo2Sno3YjJFYkxSRGly?=
 =?utf-8?B?WWt3bGpVTWtKalFKOHptK0tKQVVPUGw4d0RQMlN0TXA5cFl6cksvcGREdkhF?=
 =?utf-8?B?WFhtbUpMOTBTTWhGU1pyZUREK0F1UW5wajlVQ2o3TE16dTE3ZTVHdDRWOUpD?=
 =?utf-8?B?TlhUV2tZeUZSOTZjUjBaQWRoWngzVTlLWE5kU21vM2VVRFU2QUdGb0ZPMTY4?=
 =?utf-8?B?dmFyMUtxTHBzYlBxT2x4SnR1MnkyUVFNUS9wQVZvVnRtS1dqTHhsbThCcWxj?=
 =?utf-8?B?a0doVWVYWWcvV2dhQzA3OHRzS1lzZHN4Vks3MDdVODMrdlNIZlk1ZUZFQXlD?=
 =?utf-8?Q?HAr+GesOjKeZpNSt6x53Y57U2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c2fb08-6da0-434c-ab44-08dcf75e05f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 14:37:17.8385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b5Ofjtwam/Sn6pWVWZ3fF2v2W4Y6KMnx55b10lUi4ymib2b8DJzXwZrujoxpHJSOtGBy8YtMtcAbWZIVEsASHzro9odmxuIyTjXj4lkeZgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8860
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2Fz
LmRlbWFyY2hpQGludGVsLmNvbT4gDQpTZW50OiBTYXR1cmRheSwgT2N0b2JlciAyNiwgMjAyNCAx
MDowOSBBTQ0KVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IENhdml0dCwg
Sm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBOZXJsaWdlIFJhbWFwcGEsIFVt
ZXNoIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPjsgRGUgTWFyY2hpLCBMdWNhcyA8
bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KU3ViamVjdDogW1BBVENIIDEvM10gZHJtL3hlOiBB
ZGQgdHJhY2UgdG8gbHJjIHRpbWVzdGFtcCB1cGRhdGUNCj4gDQo+IEhlbHAgZGVidWdnaW5nIHdo
ZW4gTFJDIHRpbWVzdGFtcCBpcyB1cGRhdGVkIGZvciBhIGV4ZWMgcXVldWUuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCg0K
TEdUTQ0KUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVs
LmNvbT4NCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9N
YWtlZmlsZSAgICAgICB8ICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYyAgICAg
ICB8ICAzICsrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2VfbHJjLmMgfCAgOSArKysr
KysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZV9scmMuaCB8IDUyICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCj4gIDQgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygr
KQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZV9scmMu
Yw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZV9scmMu
aA0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSBiL2RyaXZl
cnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiBpbmRleCBiYzdhMDRjZTY5ZmQuLjIxZDY5OTM1YzMz
NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiBAQCAtMTAxLDYgKzEwMSw3IEBAIHhlLXkgKz0g
eGVfYmIubyBcDQo+ICAJeGVfdHJhY2UubyBcDQo+ICAJeGVfdHJhY2VfYm8ubyBcDQo+ICAJeGVf
dHJhY2VfZ3VjLm8gXA0KPiArCXhlX3RyYWNlX2xyYy5vIFwNCj4gIAl4ZV90dG1fc3lzX21nci5v
IFwNCj4gIAl4ZV90dG1fc3RvbGVuX21nci5vIFwNCj4gIAl4ZV90dG1fdnJhbV9tZ3IubyBcDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbHJjLmMNCj4gaW5kZXggNGY2NGM3ZjRlNjhkLi40YjY1ZGE3N2M2ZTAgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfbHJjLmMNCj4gQEAgLTI1LDYgKzI1LDcgQEANCj4gICNpbmNsdWRlICJ4ZV9t
YXAuaCINCj4gICNpbmNsdWRlICJ4ZV9tZW1pcnEuaCINCj4gICNpbmNsdWRlICJ4ZV9zcmlvdi5o
Ig0KPiArI2luY2x1ZGUgInhlX3RyYWNlX2xyYy5oIg0KPiAgI2luY2x1ZGUgInhlX3ZtLmgiDQo+
ICAjaW5jbHVkZSAieGVfd2EuaCINCj4gIA0KPiBAQCAtMTc1OCw1ICsxNzU5LDcgQEAgdTMyIHhl
X2xyY191cGRhdGVfdGltZXN0YW1wKHN0cnVjdCB4ZV9scmMgKmxyYywgdTMyICpvbGRfdHMpDQo+
ICANCj4gIAlscmMtPmN0eF90aW1lc3RhbXAgPSB4ZV9scmNfY3R4X3RpbWVzdGFtcChscmMpOw0K
PiAgDQo+ICsJdHJhY2VfeGVfbHJjX3VwZGF0ZV90aW1lc3RhbXAobHJjLCAqb2xkX3RzKTsNCj4g
Kw0KPiAgCXJldHVybiBscmMtPmN0eF90aW1lc3RhbXA7DQo+ICB9DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2VfbHJjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dHJhY2VfbHJjLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAw
Li5hYjliN2UyOTcwYmMNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdHJhY2VfbHJjLmMNCj4gQEAgLTAsMCArMSw5IEBADQo+ICsvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjQg
SW50ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9fQ0hFQ0tFUl9fDQo+
ICsjZGVmaW5lIENSRUFURV9UUkFDRV9QT0lOVFMNCj4gKyNpbmNsdWRlICJ4ZV90cmFjZV9scmMu
aCINCj4gKyNlbmRpZg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNl
X2xyYy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlX2xyYy5oDQo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNWM2NjlhMGIyMTgwDQo+IC0tLSAvZGV2
L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlX2xyYy5oDQo+IEBAIC0w
LDAgKzEsNTIgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkg
Ki8NCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiAr
ICovDQo+ICsNCj4gKyN1bmRlZiBUUkFDRV9TWVNURU0NCj4gKyNkZWZpbmUgVFJBQ0VfU1lTVEVN
IHhlDQo+ICsNCj4gKyNpZiAhZGVmaW5lZChfWEVfVFJBQ0VfTFJDX0hfKSB8fCBkZWZpbmVkKFRS
QUNFX0hFQURFUl9NVUxUSV9SRUFEKQ0KPiArI2RlZmluZSBfWEVfVFJBQ0VfTFJDX0hfDQo+ICsN
Cj4gKyNpbmNsdWRlIDxsaW51eC90cmFjZXBvaW50Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvdHlw
ZXMuaD4NCj4gKw0KPiArI2luY2x1ZGUgInhlX2d0X3R5cGVzLmgiDQo+ICsjaW5jbHVkZSAieGVf
bHJjLmgiDQo+ICsjaW5jbHVkZSAieGVfbHJjX3R5cGVzLmgiDQo+ICsNCj4gKyNkZWZpbmUgX19k
ZXZfbmFtZV9scmMobHJjKQlkZXZfbmFtZShndF90b194ZSgobHJjKS0+ZmVuY2VfY3R4Lmd0KS0+
ZHJtLmRldikNCj4gKw0KPiArVFJBQ0VfRVZFTlQoeGVfbHJjX3VwZGF0ZV90aW1lc3RhbXAsDQo+
ICsJICAgIFRQX1BST1RPKHN0cnVjdCB4ZV9scmMgKmxyYywgdWludDMyX3Qgb2xkKSwNCj4gKwkg
ICAgVFBfQVJHUyhscmMsIG9sZCksDQo+ICsJICAgIFRQX1NUUlVDVF9fZW50cnkoDQo+ICsJCSAg
ICAgX19maWVsZChzdHJ1Y3QgeGVfbHJjICosIGxyYykNCj4gKwkJICAgICBfX2ZpZWxkKHUzMiwg
b2xkKQ0KPiArCQkgICAgIF9fZmllbGQodTMyLCBuZXcpDQo+ICsJCSAgICAgX19zdHJpbmcobmFt
ZSwgbHJjLT5mZW5jZV9jdHgubmFtZSkNCj4gKwkJICAgICBfX3N0cmluZyhkZXZpY2VfaWQsIF9f
ZGV2X25hbWVfbHJjKGxyYykpDQo+ICsJICAgICksDQo+ICsNCj4gKwkgICAgVFBfZmFzdF9hc3Np
Z24oDQo+ICsJCSAgIF9fZW50cnktPmxyYwk9IGxyYzsNCj4gKwkJICAgX19lbnRyeS0+b2xkID0g
b2xkOw0KPiArCQkgICBfX2VudHJ5LT5uZXcgPSBscmMtPmN0eF90aW1lc3RhbXA7DQo+ICsJCSAg
IF9fYXNzaWduX3N0cihuYW1lKTsNCj4gKwkJICAgX19hc3NpZ25fc3RyKGRldmljZV9pZCk7DQo+
ICsJCSAgICksDQo+ICsJICAgIFRQX3ByaW50aygibHJjPTolcCBscmMtPm5hbWU9JXMgb2xkPSV1
IG5ldz0ldSBkZXZpY2VfaWQ6JXMiLA0KPiArCQkgICAgICBfX2VudHJ5LT5scmMsIF9fZ2V0X3N0
cihuYW1lKSwNCj4gKwkJICAgICAgX19lbnRyeS0+b2xkLCBfX2VudHJ5LT5uZXcsDQo+ICsJCSAg
ICAgIF9fZ2V0X3N0cihkZXZpY2VfaWQpKQ0KPiArKTsNCj4gKw0KPiArI2VuZGlmDQo+ICsNCj4g
Ky8qIFRoaXMgcGFydCBtdXN0IGJlIG91dHNpZGUgcHJvdGVjdGlvbiAqLw0KPiArI3VuZGVmIFRS
QUNFX0lOQ0xVREVfUEFUSA0KPiArI3VuZGVmIFRSQUNFX0lOQ0xVREVfRklMRQ0KPiArI2RlZmlu
ZSBUUkFDRV9JTkNMVURFX1BBVEggLi4vLi4vZHJpdmVycy9ncHUvZHJtL3hlDQo+ICsjZGVmaW5l
IFRSQUNFX0lOQ0xVREVfRklMRSB4ZV90cmFjZV9scmMNCj4gKyNpbmNsdWRlIDx0cmFjZS9kZWZp
bmVfdHJhY2UuaD4NCj4gLS0gDQo+IDIuNDcuMA0KPiANCj4gDQo=
