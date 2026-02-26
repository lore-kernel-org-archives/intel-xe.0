Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2890AFD9E1E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 23:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F3C10E008;
	Thu, 26 Feb 2026 23:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVRskA/M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB5710E008
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 23:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772149062; x=1803685062;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/dBB5PlC8kcidGYwNT0MBZSAY5wrTXxumPkaJO5mSOU=;
 b=GVRskA/MrSqKPX+hUNLD4u6Ew1zKXr0g4VR/dIyq5OVzArFWeBDY843V
 C2cLdITbkXjvTnuuX2JlT1oeKS57R1gi+1gvS0elfQCxleWpplriCOJoU
 6TCOnm7+lhqtV5KGFYmaZP5ev8Ie68xlLqusuRsWtmLjkQod6MCWtN7vi
 wLuR56qT3OySKu3ZEW91jH6XeIb2gCZJMryF8aI0EwboFdwcKyoUEQjXO
 XcqKEQEeW4LM6h614Nmk5RpvImuqh5+UmXpi5F2He5cKwfFsgHanaNMTQ
 MRLbGWvoAdS/c08pXOmf+ed7p5EOiyThenTSc2t7YT2Oqym41UGu4Yt5d A==;
X-CSE-ConnectionGUID: b3WCs/pGT6q49f8Qhv2sTA==
X-CSE-MsgGUID: fhE6QCcEQKuuweYE9rNo0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73293701"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73293701"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:37:34 -0800
X-CSE-ConnectionGUID: llAyVO7jTUiwnfjQPHhayQ==
X-CSE-MsgGUID: uUQNFiGWSKibssPXU4DNuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="244203213"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:37:33 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 15:37:33 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 15:37:33 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 15:37:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvvzTTb3VXPqzbEyTx7cJaGcAVxz2cO3JP1OCiUDEJd75SJvIwYkuYuIxbVufhjR5hnXn95HPjHItC2rSoJ5Kwr4EWKYo6olxDc0qOibjz8JbgGop5MHigBhWC3k9rhtlgFliP7KQk0RQEOa++q1IcWw9jHoA1C02Uvyxi5IbOy8yvVPsKSCP/uNsd7xrrU0+GTFywHdh/czcrPeGJUzwQserDPHMZUVh+WMem4JmbgyeAEMNYC93lU9CjtveffOTDaDr1bHzI6B2xLQVFggSIEER46fqsyst/TsbC0KDofMjgU57hw2JE15nSqedOjPDIEPSHir4mnn3JDSCELDlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dBB5PlC8kcidGYwNT0MBZSAY5wrTXxumPkaJO5mSOU=;
 b=EFrntCfn6Q6S4sw5t3Iks7MwYDUaTyOpS4bvIVT/USw3d/VhgbwRh0TVen360blpJFcAE0MMCIks2Pwxi0ZBOh8FeA4MaoYyotoLVLZskRi+eBYBdtKMoQc6xOOKcG1Kcmt3uRqhhk+CmXZ2kUrMKZX5bYZOqNCl7mVIVFBY0g3w8rzzbImm2jCfSgJ2tP4pO92+xmYAFbICZnfD4zLmV4i8vCQ/UKZmwMjyNgwB7xGZS0bYmkUWYtfcAB7UjwMeVsr8giTDivpjT/qb6t6j6TlYMMuOBrpFwRrpPyvG4apRLTvDUBlEIc84HQr5FYWFffJ8L5EI+NKdjkVmLsGqVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 by PH0PR11MB5128.namprd11.prod.outlook.com (2603:10b6:510:39::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 23:37:18 +0000
Received: from PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::c60b:e0df:51cf:cea4]) by PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::c60b:e0df:51cf:cea4%6]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 23:37:17 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar
 G, Naresh" <naresh.kumar.g@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Hellstrom, Thomas"
 <thomas.hellstrom@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
Thread-Topic: [PATCH 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default
 for BMG/CRI
Thread-Index: AQHcn0w4nxZ+7YrYqEGQVgNPzoR/wLWVsxSA
Date: Thu, 26 Feb 2026 23:37:17 +0000
Message-ID: <cee11fc6bf06997d88c0b100c0ec2ecbde512cb7.camel@intel.com>
References: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
 <20260216135107.3148167-4-naresh.kumar.g@intel.com>
In-Reply-To: <20260216135107.3148167-4-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5577:EE_|PH0PR11MB5128:EE_
x-ms-office365-filtering-correlation-id: d3250289-e98c-4346-4b67-08de758ffaa2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: EkyXUftgeQk2TUrHe+/JhsWo+NuV/wTECbCcEal+qSijneUMf2bKJRTj2lCqYUQ8ZtUAkVLOtHVvYST207l/7yAattDEhxMH+1hkjtRquciYfDRXIalqZ/K7NHA/r79kdb+2iOYNG9jVZ8RGGkJo5mQJ/hg6HBGLS1KsP8O7bendr+cC9pXPlnFIBXDXwsMW9k+WPAXsNQSLLUyoJuq/KYi8hm3Gz96quFgfgrN86cJx4jdC601/OsNFbSHPd2w7ro3m4QU1fNXmJfyPIQo5T7Rx1maHeA6aoaa8YpTWdrM6+32zb+CXU0osobpP2AYvgtQMN53IZbdFowbIvdyDns//luqllbT6mUzeX6LTnMCbTpuSUBXK01S2bnZqGRNxFYOw/zbh7tRQdyGcLT9X60hX2jtU5YcAU9WbqphnQUJp2oMdwvnYWOePOk4CfZCPjzhZbjNAVSUnqBzlFBQe3DeYDlTubQJWTJoaB4z4iQBmZHHlk2SsLdr4R29UKoThWwLO+UtFosWggoNKD9cE/fH9GYTTucCnGQTh6qCnjfHp60J7JTO+g0pIFUw5DKV8yMlci+xSm/MrLxvkC/eNOkL7FgsAlscJTV2/1i/pa3rPL08B/m/Z9DRo5TfeMXAhiQflsV7Ov/V6DrLKCt7kIocN0griMlWX385Eyf1K8vPV4cSz3Ph2DQP5qxINWG26zBeAMwAIuYnsMGJ70DJgoJbYjGHkiF6+n+wU2/gfltIlM9m3J0ltpzWsAczmKhYCX+X7emUUDIWukpPzfgXpXXDvfl3ogyCgNJvRLAeaTCg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5577.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEY3QWZGanVaZ2VLSE9DcU1ZOVNVOVZmeGs5TENyeURLT3hFa2lxa1JuSGY0?=
 =?utf-8?B?LytwV05sSGZ6c3lOOEJWeUFZRWpmU2N3QjZTdXNZdTdYTXorUCtvYWZqeFhx?=
 =?utf-8?B?MHJmRzJUdEpOR3IxQWl0WTlHU2FXUXZrYUZObXRWTm02eDVmY3VFWHhXMmRZ?=
 =?utf-8?B?T01UWkovTXgrZURBME43T3R3cGlJUWNDSVFTb1ZhNTZmNklqZHB0clR1VnpY?=
 =?utf-8?B?TXN2eHJwVHg1NmxiVFpsbCs1azZtNnJSY0lSZHlPcWk1RnpnclZoVXdjMDV5?=
 =?utf-8?B?WTNkanczam5jYUhobHdUVnE1QTVmcXNHeFc1dTIrZlU2WVZjeGF2VzgvRG10?=
 =?utf-8?B?YUh2MzluSE4vRUtBSmYyN1l2VFBGbnlQK3Myck9qcllwTXk2MElxNTEzWXNs?=
 =?utf-8?B?VDM1K3FkREUxZ3VwVjc5eGo3RTIvYy9IYlBqUGovNmMxQjZtdUcwWXdVd3Nn?=
 =?utf-8?B?emQ1cUtmUEhxbUdNcFc1T1VxL2FDMkc5UHZhR1VSYm5VZWVIdXNOdXN1RVBh?=
 =?utf-8?B?OU81WHNUVnJ4anhjN28wakl4MjFUZ3RLanFnWGdYeS9KZEJXTE03OHppcEE3?=
 =?utf-8?B?dVlGOUt5UzI3TDZqcnBBK2hCNXprTzh3VSt1bkJ6OGNjWU9zRVlDVFk0UmJv?=
 =?utf-8?B?dml1ZUlEVEdSM1BmaFBXL2dXcVNCOFlPSWxjWFFkMU5jcmUyalp5NGpGb0RI?=
 =?utf-8?B?bVE4VVBaTk1RS2laRGVpYVI3d2pYUFdOZ2Y1Zis4TU10Y2JUdGp6cFBTYjQy?=
 =?utf-8?B?TXR2SXZRbGFibGhxZnh3dytiQlRCWGRxaVUreTFTMDdFQTBnTlJLYzNwK2I0?=
 =?utf-8?B?Z1ViUDdzaTVmYnE5ZkNiMVR4Z2RHbXYyQWoxYnNnSlNhVzc3cjI0YmlkbWZj?=
 =?utf-8?B?TXN2QkJ4aEZTUzNHSzdYTVA1a2R3WTh0RjF0VDk4cStldEtQZWtDYzF1L05Y?=
 =?utf-8?B?dnU2WkhCeERmdS9VRmt1NlVRR2R4cm5pQ0VIMnlFRC9yOWNVZ2ZLWTdtZkM5?=
 =?utf-8?B?dXlJM0F1TW42Vzgxek5qYzQ5VGpsbDZUMkt2SlV5aWpMcUpGL3VONjVXKzN4?=
 =?utf-8?B?UXBPb1ZHejBHRHhycE5HWjQyb3NDSWExYUFEMW5jODhKUCt6Nlkzb3FUQ3E2?=
 =?utf-8?B?YTg1UFJvSTBESEpSQkVJOVBIY0tZNmFLTUdDQXdMaVBobzEvSVJmV29hVnZO?=
 =?utf-8?B?RXNMRFAxenhWZDJPbVlOeU1TTHhpdkZnUlA3VHY0bW9PZnBmNmlGY21mN2V3?=
 =?utf-8?B?b1BVeVFwbXJQSDQvYUk2ODlQVmYzVG9zNG9oWjJsN1J6c3JMM3FyVytkOUpS?=
 =?utf-8?B?UjRhV3FKcjV6ZDFybStXZDhZWmZOMXNLenlJYStOK3loYnVKOHhPZlZ2ejBy?=
 =?utf-8?B?d0ZZY3pYMXNhczE3WHkwZDBRbUloN2UxWWNScGo4NUhDZmt0d2hSSXpzMmdi?=
 =?utf-8?B?eDdSdEkyNG9yNHo1MDZ3b1p4RkNTOGo2ZkdZREE5QjNyUmdhUUxYd1hKa2Vl?=
 =?utf-8?B?L0hQaUFmckRvZ2s2UDJjSEhOMEx4TlRIVklFTzRyKzBheVc2WitpQU5ZbmdD?=
 =?utf-8?B?OGlFTkdZd0gzM3dSanBvRU45VmkzeklsQVBsQ25GWDA5VENpV1h2a0xwZG04?=
 =?utf-8?B?V1JiM3dROUY5cjRuKzlnajlkdkVFV1BOcWJwbEZ6QjAxeDdTQ1ltSElYN3Ix?=
 =?utf-8?B?MEQ0M3R6S0hmVTVzWG1ZaUtCRFlaY2RkN3ZxQ2Vka05vdXRxNzdRak9zZmVY?=
 =?utf-8?B?cUJReEtpYy9MaFhKZ092djJxZHlLcDUxQUdXOU5UM3FQLy9qNmw5UlIweE1F?=
 =?utf-8?B?T2oxeGRpRkpFSXJsOTZjMnduWUNkUzJZVVk0V3NuS1VjWU9JM1ZodkJRZGtz?=
 =?utf-8?B?REVmeTljbjhBNlExRW1QSHJNcnIwT0FGa09Qa0pwTDdEQWhEWUgvZ0ViYXp3?=
 =?utf-8?B?aXpFRFJUdjFoZWZzYUtCM3UxcWljT0FoMnJ6emRWQnF1bUw5ZVZ0T01RazRX?=
 =?utf-8?B?dWl3QlBFNEZvZXJrM05iU3dSNDFvRGdtQjlXbngzZU42c2JmSTV1eU1SVTFB?=
 =?utf-8?B?QmdFMEVNMEkyNWRsT2VWazRoU1IzemE5ZTZkQTBUQ3BLNzMvaVJnWVlmRUlO?=
 =?utf-8?B?bEYxWWZsclZBZkQwanlueElMUDZOK09oNjlUZDhFVnFabURSWk5RWTBGMlJ0?=
 =?utf-8?B?RDFuUEdDcWFNdnJndmowL01lMTAwU2xrRmJPS0FrTGlPK2FURG1tZGRvbGhH?=
 =?utf-8?B?TlYrUzVzRkxsRCtwWEVhTllkVC9jUzNUWENQSndCMEdFc2YvQk1aZmxuRWp5?=
 =?utf-8?B?SEErUzJ5eEtZVTNMS3lyWWo0WEhaeHJKcCswcTBaOGZ5a2dOOVVVT0RpaDhi?=
 =?utf-8?Q?l7E0mpJr8gJKW7aU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A5691FE6D5C744F8A24CEE803D48C63@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5577.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3250289-e98c-4346-4b67-08de758ffaa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 23:37:17.8344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 64/L/0SnjXd3k0AfEwVuysj4WBYRQOij6vMnCILwzEfGJV0EiP7d+336Gllu9Dq0twwMHdXH0PLvDE4b3RSrL5sQx+fPnFPSZpWDeJ4QQBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5128
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

T24gTW9uLCAyMDI2LTAyLTE2IGF0IDE5OjIxICswNTMwLCBOYXJlc2hrdW1hciBHb2xsYWtvdGkg
d3JvdGU6DQo+IMKgV2hpbGUgcHJldmlvdXNseSBhcHBsaWVkIG9ubHkgdG8gdGhlIEJNRyBHMjEo
QmF0dGxlIGltYWdlKSBwbGF0Zm9ybQ0KPiDCoHZpYSB3b3JrYXJvdW5kIFdhXzE0MDIyMDg1ODkw
LHRoaXMgMS4yIEdIeiBtaW5pbXVtIGlzIG5vdyB0aGUNCg0Kbml0OiBzcGFjZSBhZnRlciBjb21t
YQ0KDQo+IGRlZmF1bHQNCj4gwqBmb3IgQk1HIGFuZCBDUkkgcGxhdGZvcm1zLg0KPiANCj4gwqBT
ZXR0aW5nIHRoaXMgZnJlcXVlbmN5IGZsb29yKDEuMkdIeikgZGVmYXVsdCBpcyBjcml0aWNhbCBp
biBtdWx0aQ0KPiBHUFUNCj4gwqBlbnZpcm9ubWVudCBmb3Igc3VwcG9ydGluZyBlZmZlY3RpdmUg
UGVlci10by1QZWVyKFAyUCkgdHJhbnNhY3Rpb25zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmFy
ZXNoa3VtYXIgR29sbGFrb3RpIDxuYXJlc2gua3VtYXIuZ0BpbnRlbC5jb20+DQo+IC0tLQ0KPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYyB8IDkgKysrKysrKystDQo+IMKgMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfcGMuYw0KPiBpbmRleCA1ZTU0OTVhMzlhM2MuLjg4MTA1NGM5Y2Y5MiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfcGMuYw0KPiBAQCAtODYwLDYgKzg2MCw3IEBAIHN0YXRpYyBpbnQg
cGNfYWRqdXN0X2ZyZXFfYm91bmRzKHN0cnVjdCB4ZV9ndWNfcGMNCj4gKnBjKQ0KPiDCoHsNCj4g
wqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV90aWxlICp0aWxlID0gZ3RfdG9fdGlsZShwY190b19n
dChwYykpOw0KPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsNCj4gK8KgwqDCoMKgwqDCoMKgc3Ry
dWN0IHhlX2RldmljZSAqeGUgPSBwY190b194ZShwYyk7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKg
wqBsb2NrZGVwX2Fzc2VydF9oZWxkKCZwYy0+ZnJlcV9sb2NrKTsNCj4gwqANCj4gQEAgLTg4NSw3
ICs4ODYsMTMgQEAgc3RhdGljIGludCBwY19hZGp1c3RfZnJlcV9ib3VuZHMoc3RydWN0DQo+IHhl
X2d1Y19wYyAqcGMpDQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAocGNfZ2V0X21pbl9mcmVxKHBjKSA+
IHBjLT5ycDBfZnJlcSkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBw
Y19zZXRfbWluX2ZyZXEocGMsIHBjLT5ycDBfZnJlcSk7DQo+IMKgDQo+IC3CoMKgwqDCoMKgwqDC
oGlmIChYRV9ERVZJQ0VfV0EodGlsZV90b194ZSh0aWxlKSwgMTQwMjIwODU4OTApKQ0KPiArwqDC
oMKgwqDCoMKgwqAvKg0KPiArwqDCoMKgwqDCoMKgwqAgKiBTZXR0aW5nIEdUIFJQIG1pbiBmcmVx
dWVuY3kgdG8gMS4yR0h6IGJ5IGRlZmF1bHQgZm9yDQo+ICvCoMKgwqDCoMKgwqDCoCAqIGFsbCBC
TUcgYW5kIENSSShGb3IgQk1HIEcyMSBXQSBkbyB0aGUgc2FtZSkuDQoNClNob3VsZCB3ZSBhZGQg
YSBjb21tZW50IGhlcmUgdGhhdCB0aGlzIGlzIHRoZSBhY3RpdmUgZnJlcXVlbmN5LCBzbyBpZg0K
dGhlIGRldmljZSBpcyBpZGxlIHdlIGFyZW4ndCBleHBlY3RpbmcgaGlnaCBwb3dlciBvdXRwdXQg
YWNyb3NzIHRoZQ0KYm9hcmQgd2l0aCB0aGlzPw0KDQo+ICvCoMKgwqDCoMKgwqDCoCAqLw0KPiAr
wqDCoMKgwqDCoMKgwqBpZiAoWEVfREVWSUNFX1dBKHRpbGVfdG9feGUodGlsZSksIDE0MDIyMDg1
ODkwKSB8fA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhF
X0JBVFRMRU1BR0UgfHwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfQ1JFU0NFTlRJU0xBTkQpKQ0KDQpUaG9t
YXMgYWxyZWFkeSBtZW50aW9uZWQgdGhlIGluZGVudGF0aW9uLiBXb3VsZCBiZSBuaWNlIHRvIGdl
dCBhbiBhY2sNCmFsc28gZnJvbSBWaW5heSAoY2MnZCkgb24gdGhpcyBvbmUuDQoNCk90aGVyd2lz
ZToNClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29t
Pg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldCA9IHBjX3NldF9taW5fZnJlcShwYywgbWF4KEJNR19NSU5fRlJFUSwNCj4gcGNfZ2V0X21p
bl9mcmVxKHBjKSkpOw0KPiDCoA0KPiDCoG91dDoNCg0K
