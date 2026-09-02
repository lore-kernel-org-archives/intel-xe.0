Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B40FC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 06:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C6D10E179;
	Wed,  2 Sep 2026 06:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b2ViS0TD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B62510E179;
 Wed,  2 Sep 2026 06:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788329400; x=1819865400;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9lvRmmu+bLpP0+vxzMJFPb/+1lzNfAZ+8B49bgQI3hc=;
 b=b2ViS0TDyiSBNoJRpkcbESLWnxKPXla3mu9X0rmeUvIME6Zxa79bWhZX
 2yokYB6rnaKLpIsVo2+BBrcAlxCw/71sy+UIo8DBn3MK9bWNzGb1I0H1l
 ghTSQG2xRJUXUOL0xfLPaudAzWRJUfVXJq2byT5kUoGSX0MEkgdaE+cmJ
 H0jNmSrzYeDVjPpNuY4y38VfTVotEPugaeAZ6gyqiLAHUqRKACwrpLLT2
 X6gvQ6IJDFMYNv68iYILDEx3hUMjs7VL8TM4JUJSu5mwDdIRkdnpLUCQh
 fb+Pn0Y/kaasmydd3ZyeKzuD4UFRngVDOm+xc0fPlTvbCHt8SL4D8zlht g==;
X-CSE-ConnectionGUID: aPRQWnQ7QpGJiixdpQo4Ig==
X-CSE-MsgGUID: 5fXGHEDpTmi3tZ8W54xCTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88900091"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88900091"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 23:10:00 -0700
X-CSE-ConnectionGUID: iCXeEPCgTVaM0tuuJb1wtQ==
X-CSE-MsgGUID: n0CEtq1NTfu5tuHnNvuMuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="263167828"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 23:10:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 23:09:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 23:09:59 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 23:09:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYRy5NpnllJ7oQPC2pG/zp7Dzle1qVeoqv7yFOfMBjv+9yb1nK81HEaS1Fg9/Hp1AfoZZzkoU0+EMjQp+K1NVq/aZE3eB1l8fiWfeSVYzY0KlnDLBfRXXfhxI/wzZDSNMD75kw8w6YgenTRAxs3fgyyw7HlmxcWRySp0qdm8zrQbFdDa4fsGEwiunTklGVqljIBsvi9hbCmeyICTINGwDBcJXMJ1GOJ+tOL0v5UgqiN3na3+zTqFFIRDTPM9kF8sv1VI57nLmnLXhSQEf7gBXWBlXS3K3x3e6WH3wwGxvMFxJ1BeegHG7nfEFOB25Fjv85IFgj0lvfpwi5stlwIeqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lvRmmu+bLpP0+vxzMJFPb/+1lzNfAZ+8B49bgQI3hc=;
 b=PAK79WZrxTFeLBRjmk2k4nwypZuu0QedLbAFOqD8ak0MFptUaMivkm9Ta7hMb4fk0+QrUwRSsYvO3DoLMEAPLRTcatm8Xazte7Ty+nFjT3kIoYrNTgtcHW4UcXXyhJ5QbDt63ALm2XtzVSESe9DUes6MnSJY4e4kLiQN0ZVuW1q0Ji262bJrd9e020Dd5V+GyFCndBwOtc8BcwMJCmO21n5yB+wipcwguLU1ISuBXy2RMDPYACSR7WPRWQsy27mSqr7tnI08SXJ771fXCY0+Ls//qmpn6TI9cg3uOslvtRO53IR2gVYFCMOWp1UwcmTqkZ4KznM7nHIlPYSlsLsmaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 06:09:51 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 06:09:51 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna, 
 Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v5 03/15] drm/i915/alpm: alpm_init() for DP2.1
Thread-Topic: [PATCH v5 03/15] drm/i915/alpm: alpm_init() for DP2.1
Thread-Index: AQHdNFmqx5rhlilqGkuZ8QTfVA0Keba62p6A
Date: Wed, 2 Sep 2026 06:09:51 +0000
Message-ID: <4eea170652a40dc402e348e34c9c4cff658b18c4.camel@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-4-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-4-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA1PR11MB6323:EE_
x-ms-office365-filtering-correlation-id: d641dc6f-4d9d-442c-4536-08df08b8cce8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: X5YtY6yeF/5sUxrjeoza5FF00k410S4L2lU1DCUlyH2CpF23BmGbJXWfQp4xWNVBg5PaZIKtz2R0k4OUU9RUOwLcYgFMFvvJ77/7M0z8vOFzJvD95HzHbk3+7eXAsABVV2FT2pBlFvsOs0T+e1f28SjL65cDp4Oc/MtSwFQYLHU5YC+Y6ZU1s8HNihgJZtIa4djtBNnHeFL6HQyIYaaV2pWW4vfpTnQnZLgKCB6AcrzsO6wuHNQ2K+902ROm4OeV5ZAJnmpAQ9WQKwt2VbxcNq7osFZ1qDtZpcAKJVUriijWqEDJJDgkYtv6diKhKBrphX/iDD9TtNLe+LkLhnrZqzLIImM+IWlIyqmbTlUOTWUbfOUbKFzvp6zzaZeYPIaFabTjjDB/nhadqZ2Wy2HG1XpdmUqLm8kibhOZHPobqBvzrlXKdsIxSA4rmIoaNTR3bngwTNYTQyxFM6acxgvaavG5yCBHZm6G197CdtUxsfY4WPZ7sp5XZdhziuNdEbinNunYfx7UC8/FxmPzu2IPFrLxpLx9I0TXBXOXuKofgKaUFu5+JBScWTHV9SNR9Gm22pmUQi7T1SCYM8mFoMCzILAhdi8REa+V0gcou7T0MlnIoS4hM1cj+WHBRukaOye8Y+xwreGeb0UKh46tjh6EW2MmaAtPf6jBlPb+zGfINU7a2vEPytRKkndJU76Gfu9gmtLgZmO4QaRmfp28zT+jRn3OcGo/gyr97S7zzUw1Vqc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVd5VjV1N3cyL01NMDFSKyt4L01YOFNFNGR2QkpkeEMzbzdFbXE5SWZjTGRH?=
 =?utf-8?B?eDRDVU02cVFMQVIyT0FrUnQ5ZjhqSkFRMVc3eFQ4cTZoVkkycUc5MTJYcG9Z?=
 =?utf-8?B?Vk1RWFpHL0xqVlhsM3dTQ0dtUHpaQUdhLzgvbzJaYkJra1dLRk96dklXN0dF?=
 =?utf-8?B?NDdGSGZEZkZIb1hyZWtSSloySTZxR1ZuUmN6WlQwM3JBMzRMSnJwWjdIbk1h?=
 =?utf-8?B?bEU4MHVMSnl0bjl1dG1valNxYy82YThuNVg3QVRJRW1YcmVKS1ZTR1UxR0U5?=
 =?utf-8?B?N09MYWJOTERha0JQSGJXcjNFQlBiZU1yM1YySzNPdHIxRVBOMXVUdG1kK0pG?=
 =?utf-8?B?d2p0UzNQbDg2WENwWlFrSTl0WWZUaWlEeEpnNEhZODBvSmx4b1ZtUWg1eUgw?=
 =?utf-8?B?RGdxQk9JcGovSlpJUW1QSjQwaEVKeWFwNkdHZFRyNG9VQTF4L1F4SlMwZWND?=
 =?utf-8?B?N3ljR3RUTUF4NkZ3K2x5MWFkRWdpZC9RbG4xbXJWYUswOXFsRkpHQXRZR3I0?=
 =?utf-8?B?Y2Q1TXYzRlBKQmVlc0t2SW9jMzEzYXBEd2E5aUQ1bnpQTXFSMUJmK0FqUFFO?=
 =?utf-8?B?WnBLRDMwb1NKU0hNUlh0d3pPR0FNOTd4d2lWN0k4a1ZnY0xrVG9NSjdJWk9s?=
 =?utf-8?B?eFdPQXRSVWs3b3NNd1lmM0NMWWFnUzUxaWVUeTY5dE5VUXZFTW1WN0pYcWpq?=
 =?utf-8?B?SFRUbkRnREtyZFVocmt0b1VCaFhKWnBTNHVCMzNrUmhmcmRySjVTVkNwQWU2?=
 =?utf-8?B?Tmlzc3U5a0h3TVBLb25XVnlBcFNRVEoxSkx3dzNpNHcyV1JkMm1idGVNZmVx?=
 =?utf-8?B?eUU1TzNRRm1GUzZQcm9ZUVZ1YkJ1SXVyZnAvdFNaUHpQa2QxaEEzTWpVMThT?=
 =?utf-8?B?SloxaVZTclBFb0MzUzl1WGZESjJ0UEZzeDBwNVpsSk1qOGp5V2hwRnNhVFhx?=
 =?utf-8?B?Nk1INDFSeVdKbUJTYWpJalIxQmNIeDRUR2pYVmhRcjNzWGNDZVVVU2pEU051?=
 =?utf-8?B?WXRWWFlNMDVrK0ZqSEdxWW51YTlzbm4xdjgzaWdLQ3JhVHJqcktrOXVyYjVq?=
 =?utf-8?B?T2cybVVLa2duaVprSFZvNFBDSVorV21OcG4vTnZDbllMOHo0SHhqUkowZ0NM?=
 =?utf-8?B?K2JJcWtyL0ZHQVlCVzhicGFyWHRWbHprS0pyS0MwRTlRbWxaMkdZSGRXaWsz?=
 =?utf-8?B?VnJZS3pRMlZmTmZpR3JoTHdyblowaStBczh0U3dWd1h4cUdEQTU1cWdBRWVa?=
 =?utf-8?B?WFhKWXlhRmZ0WFlNcjdyZXRodjE0UVFtUEc0YzRHNmRZa256YkZzZ3didmwz?=
 =?utf-8?B?ZDJLZzlMMW43UFZNRHIrQ0t4SGNWNnJOeTdIVEdLQkhORXF0S3crMlF5elhH?=
 =?utf-8?B?NUxHTzhwK1FSUlVTLzBzaEVIMDdPWXdaS2xlbzAvK2VMemxXZ3FFVWJ3UHZs?=
 =?utf-8?B?aWFMdjdCd1kzRTFiN0diV2IzL3JCaHlORXo4b0h2dGhqV1hqcHRiU2JtZmNm?=
 =?utf-8?B?ZUtxKzgrcllSZm11c1lQWHRuVWttWWM0Qm1KWjBPckp5bmM2dkNkWFR6Y0Fs?=
 =?utf-8?B?b1puSWtydHArZE9QZjZScXM5dVJZckYzYmlIbjZydHd4YXA3WVNPSUU2eTdR?=
 =?utf-8?B?ZjhTcmdtVHB5NWpRNVFyNEJJYmpHVHdwRVI2TTNLV2txbC8yaTBmZ3BzTjV2?=
 =?utf-8?B?dk1vTUNEV3FEd1FzeDhVRDVTMHhzVHlUWHJSR2N3RU9uVzRXRDJ1Q1Q0Mk9U?=
 =?utf-8?B?VmtlQjFDeE9oZCtBT2NwTTFBSjBoeW5mSHQxUHNQb2hBOUR4NG5tMitFMzlP?=
 =?utf-8?B?RmJUZlVSS0pLbUdqWFIyVStqcFhDWjRUN2xUaU1zKzAveURLcDNJLzBPN2tY?=
 =?utf-8?B?dHdUU0srOXhCVWEycGc3eGxmc2lsVkRpcE96a2pRdWh5ZVRmRk41TUpyYkJE?=
 =?utf-8?B?Z2pqaklzaEh4NWdsUEx2UlFacmlXY3pSeXoyaEQwRndrY1hBRmlYMlV5cjVo?=
 =?utf-8?B?SjRneGRCelN0YmpQcU1VdGx5MUxua3FmYlBXNFJvZmFlaWw4cTRpdThwRU5u?=
 =?utf-8?B?bTF3UVFCQWRuMDZXNTF1a0lzZCtxRFozeFJrM3dablJaUTZXa1VPb0NkZnRo?=
 =?utf-8?B?T1FTbzEvY2lFY2Uzc3BjdW1qRkhuY2NPTUlzbVF0Q21GTzNxTzYwRE9Kem93?=
 =?utf-8?B?aG5HMXR4MjdjOEYvRXBTTlpheC8veWxmWk9aSjFmc056Nk1uUzU1RkZCOWVl?=
 =?utf-8?B?VnJTTkNwajk3YitxVkVxM2VBVVNiT1R0T2dtVjd4ZVRZbWNXQndSQm9MRHV5?=
 =?utf-8?B?SmQxUXBySzRmeTVlRGNJWG51OTBCOCthWW5oNUcxUjBqZUxBc3Y3TWRXUFhN?=
 =?utf-8?Q?Vq00eZ4PHnYUPfr0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <600FE936E0B7EC42846A9EB1114687BF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CZcMJSORZUJEQO7kb5niGv6E0+la92ZiVklGBUAjXpak4mEZLeBBNcRZV195YDKOtfbukGh1TQW/WF3xOKRHoDd4kJg1b0QIwZjAvIh6nswc3xUn+6cVTxtFfHo209OnYtj2clYm+p6bbOo23rx7ZY7hqndGBxnzUI7Emz9i1wX3KJQCQKY/Smgiw1eY86ci/egGNJ+3sQgO4S9I8wfIfvvf4v5LdWGc4dKY9sFdAXwhDxEK/lth2LR75CvUFG0FtpLO44gEzqA3PCPDayKP4WA0r5iaKQxhkaTG02toFGMMi+M2MNCaAi81YXW4cVkkDwkBbUkozqxnRZmczzZBaw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d641dc6f-4d9d-442c-4536-08df08b8cce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 06:09:51.4569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QOLx1jb4mv1XuW+aGgdJeJ+7vsC/9bg8vozx0HTShCbIIJ4YOyzX49nG1Y6VnAUiK3hhGg8QLMA+llfnKIBxOjHJAfvC38NMgkULPXeUUPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
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

T24gVHVlLCAyMDI2LTA4LTI1IGF0IDExOjE1ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBJbml0aWFsaXplIEFMUE0gZm9yIERQMi4xIGFuZCBzZXBhcmF0ZSBvdXQgQUxQTSBtdXRleC1p
bml0DQo+IGZyb20gYWxwbS1pbml0Lg0KPiANCj4gdjI6IFNlcGFyYXRlIG91dCBtdXRleC1pbml0
LiBbSmFuaV0NCj4gdjM6IFJlZmFjdG9yIGZ1cnRoZXIgdG8gYXZvaWQgRElTUExBWV9WRVIgY2hl
Y2sgaW4gbXVsdGlwbGUgcGxhY2VzLg0KPiBbSmFuaV0NCj4gVjQ6IENvc21ldGljIGNoYW5nZXMu
IFtTdXJhal0NCj4gDQo+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVs
LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVs
LmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBt
LmMgfCAxMyArKysrKysrKysrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9hbHBtLmggfMKgIDEgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuY8KgwqAgfMKgIDggKysrKysrLS0NCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDIwIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2FscG0uYw0KPiBpbmRleCA1NDI5MDBlMjlhMDEuLjA4YWQ3N2NkMzJmOCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gQEAg
LTQzLDYgKzQzLDE5IEBAIGJvb2wgaW50ZWxfYWxwbV9pc19hbHBtX2F1eF9sZXNzKHN0cnVjdCBp
bnRlbF9kcA0KPiAqaW50ZWxfZHAsDQo+IMKgCQkoY3J0Y19zdGF0ZS0+aGFzX2xvYmYgJiYNCj4g
aW50ZWxfYWxwbV9hdXhfbGVzc193YWtlX3N1cHBvcnRlZChpbnRlbF9kcCkpOw0KPiDCoH0NCj4g
wqANCj4gK2Jvb2wgaW50ZWxfYWxwbV9zb3VyY2Vfc3VwcG9ydGVkKHN0cnVjdCBpbnRlbF9jb25u
ZWN0b3IgKmNvbm5lY3RvcikNCj4gK3sNCj4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxh
eSA9IHRvX2ludGVsX2Rpc3BsYXkoY29ubmVjdG9yKTsNCj4gKw0KPiArCWlmICghKChjb25uZWN0
b3ItPmJhc2UuY29ubmVjdG9yX3R5cGUgPT0NCj4gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQ
b3J0ICYmDQo+ICsJwqDCoMKgwqDCoMKgIERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDM1KSB8fA0K
PiArCcKgwqDCoCAoY29ubmVjdG9yLT5iYXNlLmNvbm5lY3Rvcl90eXBlID09DQo+IERSTV9NT0RF
X0NPTk5FQ1RPUl9lRFAgJiYNCj4gKwnCoMKgwqDCoCBESVNQTEFZX1ZFUihkaXNwbGF5KSA+PSAy
MCkpKQ0KDQpTZWUgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYzo6X3Bz
cl9pbml0X2RwY2QuIFRoZXJlDQpQU1IyIGlzIGRlcGVuZGluZyBvbiBzaW5rIEFMUE0gc3VwcG9y
dC4gSXMgY29ycmVjdCB2ZXJzaW9uID49IDkgb3INCm1heWJlIHRoaXMgaGVscGVyIHNob3VsZCBi
ZSBqdXN0IGRyb3BwZWQuDQoNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsJcmV0dXJuIHRy
dWU7DQo+ICt9DQo+ICsNCj4gwqB2b2lkIGludGVsX2FscG1faW5pdF9kcGNkKHN0cnVjdCBpbnRl
bF9kcCAqaW50ZWxfZHApDQo+IMKgew0KPiDCoAl1OCBkcGNkOw0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaA0KPiBpbmRleCBmYWU2OGQ1NTc5NjAuLjcyODA4
NjVlZDVmMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9hbHBtLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBt
LmgNCj4gQEAgLTE1LDYgKzE1LDcgQEAgc3RydWN0IGludGVsX2Nvbm5lY3RvcjsNCj4gwqBzdHJ1
Y3QgaW50ZWxfYXRvbWljX3N0YXRlOw0KPiDCoHN0cnVjdCBpbnRlbF9jcnRjOw0KPiDCoA0KPiAr
Ym9vbCBpbnRlbF9hbHBtX3NvdXJjZV9zdXBwb3J0ZWQoc3RydWN0IGludGVsX2Nvbm5lY3RvciAq
Y29ubmVjdG9yKTsNCj4gwqB2b2lkIGludGVsX2FscG1faW5pdF9kcGNkKHN0cnVjdCBpbnRlbF9k
cCAqaW50ZWxfZHApOw0KPiDCoHZvaWQgaW50ZWxfYWxwbV9pbml0KHN0cnVjdCBpbnRlbF9kcCAq
aW50ZWxfZHApOw0KPiDCoGJvb2wgaW50ZWxfYWxwbV9jb21wdXRlX3BhcmFtcyhzdHJ1Y3QgaW50
ZWxfZHAgKmludGVsX2RwLA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kcC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cC5jDQo+IGluZGV4IDc3ZDUxNmYwYmQwNy4uMDQyYzZlOGI4ZTYwIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+IEBAIC02MzQzLDYgKzYzNDMsOSBAQCBp
bnRlbF9kcF9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3INCj4gKl9jb25uZWN0b3IsDQo+IMKg
CWlmIChyZXQgPT0gMSkNCj4gwqAJCWNvbm5lY3Rvci0+YmFzZS5lcG9jaF9jb3VudGVyKys7DQo+
IMKgDQo+ICsJaWYgKGludGVsX2FscG1fc291cmNlX3N1cHBvcnRlZChjb25uZWN0b3IpKQ0KPiAr
CQlpbnRlbF9hbHBtX2luaXRfZHBjZChpbnRlbF9kcCk7DQoNClNlZSBteSBjb21tZW50IGFib3Zl
LiBTaW5rIERQQ0QgY2FwYWJpbGl0eSBjb3VsZCBiZSByZWFkDQp1bmNvbmRpdGlvbmFsbHkuIElm
IHlvdSB3YW50IHRvIGtlZXAgdGhpcyBhcHByb2FjaCB0aGVuIHlvdSBuZWVkIHRvIGZpeA0KaW50
ZWxfYWxwbV9zb3VyY2Vfc3VwcG9ydGVkLiBPdGhlcndpc2UgUFNSMiBicmVha3Mgb24gZGlzcGxh
eSB2ZXJzaW9uIDwNCjIwLg0KDQo+ICsNCj4gwqAJaWYgKCFpbnRlbF9kcF9pc19lZHAoaW50ZWxf
ZHApKQ0KPiDCoAkJaW50ZWxfcHNyX2luaXRfZHBjZChpbnRlbF9kcCwgY29ubmVjdG9yKTsNCj4g
wqANCj4gQEAgLTY5ODYsOCArNjk4OSw2IEBAIHN0YXRpYyBib29sIGludGVsX2VkcF9pbml0X2Nv
bm5lY3RvcihzdHJ1Y3QNCj4gaW50ZWxfZHAgKmludGVsX2RwLA0KPiDCoAkgKi8NCj4gwqAJaW50
ZWxfaHBkX2VuYWJsZV9kZXRlY3Rpb24oZW5jb2Rlcik7DQo+IMKgDQo+IC0JaW50ZWxfYWxwbV9p
bml0KGludGVsX2RwKTsNCj4gLQ0KPiDCoAkvKiBDYWNoZSBEUENEIGFuZCBFRElEIGZvciBlZHAu
ICovDQo+IMKgCWhhc19kcGNkID0gaW50ZWxfZWRwX2luaXRfZHBjZChpbnRlbF9kcCwgY29ubmVj
dG9yKTsNCj4gwqANCj4gQEAgLTcyMDIsNiArNzIwMyw5IEBAIGludGVsX2RwX2luaXRfY29ubmVj
dG9yKHN0cnVjdA0KPiBpbnRlbF9kaWdpdGFsX3BvcnQgKmRpZ19wb3J0LA0KPiDCoA0KPiDCoAlp
bnRlbF9wc3JfaW5pdChpbnRlbF9kcCk7DQo+IMKgDQo+ICsJaWYgKGludGVsX2FscG1fc291cmNl
X3N1cHBvcnRlZChjb25uZWN0b3IpKQ0KPiArCQlpbnRlbF9hbHBtX2luaXQoaW50ZWxfZHApOw0K
DQpTYW1lIHByb2JsZW0gaGVyZS4gQW5vdGhlciB3YXkgY291bGQgYmUgdG8gaGlkZSBkZXRhaWxz
IGludG8NCmludGVsX2FscG1faW5pdCBhbmQgY2FsbCBpbnRlbF9hbHBtX2luaXQgdW5jb25kaXRp
b25hbGx5Lg0KDQpCUiwNCkpvdW5pIEjDtmdhbmRlcg0KDQo+ICsNCj4gwqAJcmV0dXJuIHRydWU7
DQo+IMKgDQo+IMKgZmFpbDoNCg0K
