Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62747C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 20:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3052610E254;
	Tue, 25 Jun 2024 20:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKZpTJMf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAFB10E254
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 20:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719348561; x=1750884561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kYtenn2p0Uc6gd09LSF0QhH78gng2SLla1LGYwt6TQQ=;
 b=UKZpTJMf+0Agt4L23iS7Mq4mTPcU+Xa3OmMyxtJ5zQ+5iLDej442+yMQ
 L+rwH/5/X2OBk4TbCVUN/0BYJS0jHOYs2RQUD8Z5/cQMePAl7+ooCUVm7
 iZhSvJ6Pos07NrovZkOpVCLQgGJtQ0MdmVgoa86XJYq0XMMgoXjuYvvaV
 2RM1VdKqtG1xTinmY21WPWm28Bo0pCRPyjAXARcaG4nZOchTjMzzJ4vGr
 OJg7xKfQphgvNy6nZ+KnB8/zt4h0JxLdKiloSvEvC2OQsPpcNj7/ig0+s
 xBkva+vTYbxX+B35nTEku55GNmbaPtA60Yy+MFba8/bQ+JHotuaZGYC6W g==;
X-CSE-ConnectionGUID: CTomwdg+TEK62R08+y88tw==
X-CSE-MsgGUID: qJRqcKUTTMiChXjy6EusdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33847754"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="33847754"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:49:20 -0700
X-CSE-ConnectionGUID: xVyeWSTuQ1mtzmoSiOXPJw==
X-CSE-MsgGUID: au689ETtSHejStdpaJwZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48691527"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 13:49:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 13:49:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 13:49:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 13:49:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lys1fGz3noVoCqT8qdCA+m5qgb3AAYQ0h6gnz6/D2vtvf7Yj7lWzNZPrWN3HaeqalZpB70YdSkIDcdOmy5GUkfsh2G+ibhEZgIKwplXxoVXn3DwGqfkYCzVPpw6rFkDCCRrHdb6jGuceQobxeZg9a3R45nk+6VeuOpUsaEKFWDVYrEF0QcedTK2Ym+aEyNKMvHMomKlZhCwntPnT7C7p01cgjD11vYmJmvkKuZoJfv4TrIeIJc0nhCNZFw5MLCBmENK8FjAzKra9Hr4Wns/vrMM83k4IwzFjCQgzXrfNu3lS/TF4BeunEKt5qnCDQm5nj1NYFvvSdrRL+dXxjIgzRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYtenn2p0Uc6gd09LSF0QhH78gng2SLla1LGYwt6TQQ=;
 b=EZxLDobczI5ZT+cnCfwnuFP2z8eZyGRzQhbG1tOHADVkY+qshWgvT5I9H4O/iucEBKMcOMJ4Hhu7TxSWGlcW9T9Ckfm04HRjJDeKzGG/KcxS8wIJGB7OuAO1f9RYAtjilco+DBLHpftuE5ecZsRRxqUfikTOISySO3djKCZt3y9TgSkVnEB1h1Jq+AGy2GURZ4vvRNcj5b2IFjGWczPH8SEiqSIM8ZiJRcQ8ZMveKkW8InfGkcdpN+WqBObCYoRGgTiBFgFYxjYoHT5IoAzDSgIhPjM+eXSh0zUje9imXxEmNgrJFiv540wahxbjSrwNpmgylPyFkYjVK78pjmbkNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CO1PR11MB5122.namprd11.prod.outlook.com (2603:10b6:303:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Tue, 25 Jun
 2024 20:49:07 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 20:49:07 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/oa: Allow preemption to be disabled on the
 stream exec queue
Thread-Topic: [PATCH 3/3] drm/xe/oa: Allow preemption to be disabled on the
 stream exec queue
Thread-Index: AQHaxzx0FSKwuQ6sSkqxuAuhSrEDR7HY88EA
Date: Tue, 25 Jun 2024 20:49:07 +0000
Message-ID: <e8ab87c5a4b5d25f11bf9fab3c5a3ad31293ec73.camel@intel.com>
References: <20240625201518.766925-1-ashutosh.dixit@intel.com>
 <20240625201518.766925-4-ashutosh.dixit@intel.com>
In-Reply-To: <20240625201518.766925-4-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CO1PR11MB5122:EE_
x-ms-office365-filtering-correlation-id: 55a39fb4-05cc-454d-0512-08dc955841b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230038|366014|376012|1800799022|38070700016;
x-microsoft-antispam-message-info: =?utf-8?B?U3B6Q2h3SVFOOEhSOEl0KzBSL3RyRHFXdVJmeTh3RGpXdEl0NVI0ZWF1L1JM?=
 =?utf-8?B?eWg3NzUvd2VwMU9QSDZrRm0xZFgyRDUzdlh1WkNqT0xPZkJCRy9VdW5uQ01V?=
 =?utf-8?B?cnhZZEtDT3QzRTdRN3JjM2t0K0RXM09YQTF5Uyt2S0FWRTRTbFdUZXAvVFRz?=
 =?utf-8?B?cmRxZDZHUzd3VVp0Q3Z3L2M3cnpzRVQ3V1pKMDZ6OG9ta1J4UWR4ZFlPS0Vh?=
 =?utf-8?B?Rkt1TGZJd3J1YURCWTRVU3g2Y29HS0h3RFUwSXUrVTZrZ0hGaVdaQ0J2bFRo?=
 =?utf-8?B?dWwzSGtVdDNvdDVVNGM0WjhJKzd3dDZ3MVVMZ0JJVWdYK0lIV2ZjZy9FTzgw?=
 =?utf-8?B?a0dJbmUwNmFQb2FvU1ozME5WV3l3TEI2Yk1JbFQ1dldjOUV2TDVwQWk0N082?=
 =?utf-8?B?UU53MmtjVUhLSDZWMnRESHF5SU03OUtHajdaYnU2NEJPRTVZQ2I4elduTHQ0?=
 =?utf-8?B?YlZQeHZSdEdBYU9pUVFsV2tzd2k0ZnJDb0hkMUl3V0d0TE9hampTODJHcjM4?=
 =?utf-8?B?QWd4cithNjEreERFWm1sWDRRWmhhUXp4QjVFaVJ3TGw0Sktickl4bWtsZUxi?=
 =?utf-8?B?Y3NkV2NhVDVFU0dmUHQvd3JhVkdlc24wMWlHRzZBYitCN1NHdE45Nk1iOHZa?=
 =?utf-8?B?N3R2NWxhS3dFbUliai84MmROWEZpMnp2cnUzMmhrYmVNNThxZFMyY3REd2Nh?=
 =?utf-8?B?c3ZWaEFhcnZoNmQzZ0prb1VManN2T3FmZlhKSklzcTdqbEp2akNFQzZzajVJ?=
 =?utf-8?B?UkFNbXJNWU1TRkR6WlpCeWhkazJDTzlSZ2JleEVRcVlsK1NRR1V3NU9zYjNV?=
 =?utf-8?B?SS9zNlNLRnpqaFdkTGVWcTl1a3dROGlVTlU2VzBFSzJuQ3ZwUStBNnI4blND?=
 =?utf-8?B?RHNaZEM1MnBUaGxnVzFkdC82QkpXS0NmUGN6ODdiVUlZTit1SlM1aUszYXVV?=
 =?utf-8?B?UlBjcG1ybnRTWHVBcWtSVWNhVTBiSVhsY3VQbUg4MlZzZnJQeEhuNEdTOUti?=
 =?utf-8?B?cDVUWFdNT0NQa3gxb2xQblZWNXdyQUlQc1N0alRuMUMrM0xyVzV3K0tPV2lF?=
 =?utf-8?B?TjlvK3NSbUlBVFNxWUExcDdXK1ExRUF0emxPb0dpekNsV2orZ2pSY1VDdXV5?=
 =?utf-8?B?UnVTdkIwTmNBUDF2ei8xOXRmU0ovZStYMHdTM0pKcVk4V0dCZ3RraFF2QUg3?=
 =?utf-8?B?amhCbDJqbmpiSGYvbTFzd2VVR3pvYWdEYjNzVlJLM0pjS0dLdCtUOEpWSm9D?=
 =?utf-8?B?TjgxbHVWdkRPZWJkODNoWFhPa1ovU1hpTkpEK04rYU5tNk1Ia1c1bEc2K2Nh?=
 =?utf-8?B?OUlCVVRJaW9kQ0ZIT0hVdm95STh0UUh0QW1MQ1ExMFQ1M1huRkcyZE1mcWNK?=
 =?utf-8?B?cFVUUUgvT1lHa3R4WUVMVFYxUjNGRHNrU3FUSWtsVWVUTUVFUTlkUnRNaE5D?=
 =?utf-8?B?S3hHaUVCRkpyTStaWTVCaWw3TUszMitZbWU2bXg3bm5paFlnV2kxM2c1V1pL?=
 =?utf-8?B?NzhUL2VvdCtzcHZEaHdoNVFpa2w4S3c3dU1PdUVjbG5xVDVmVG1SdXNqbXcw?=
 =?utf-8?B?dmkwcUJzelVRREppQzBJMWlXQzlHM01mcU93Wmk1QkZBREV0QnNsVE9wbnY0?=
 =?utf-8?B?WXdOQmZ5eUNaNWJYaTBkK2orRVJsMU9La2dpNmZJY0VVZGlPb0RpN28yUDRy?=
 =?utf-8?B?aEtBKzA1T1V5RHdmaW8vRnNLYSs1STg4a3R5dlZpeU5FaDBESTRsOVhTOXdy?=
 =?utf-8?B?cTJscnJEUVA1RDNIaUx2MXprc1N1NEtnVEp2cVJBN1hTLzdORWpXdlhYNTgx?=
 =?utf-8?Q?RlrowImOalWHHToj4tQa1nQ8/bkL69s6vPjwQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022)(38070700016); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vnp3NWN1RDQzRWhmTFBGOHllUVB5UzEwRUJ3aTNZeXJtNElxMVJDTzVSUkRv?=
 =?utf-8?B?MmtKQm90QlgwSEtZT1JJQlBCbEtxWi9DMUc1a2VkQUZJblpvekNGb29HbEJu?=
 =?utf-8?B?TFdhblNyeVhDZm5IMHRZdVhTcE15c0VJUkpzUWtBNFlYczcwUjlOZ0FTdFAr?=
 =?utf-8?B?WlJZSHF6dG9DSzZqanVzanUwTDNIK003anBLLysxMndaYlV5dDFKQlhrRWZY?=
 =?utf-8?B?Y1Q4MlA5UE9xaWVIY29ock5nWnBHY1NLYnBTQjVxenVSaEp2Rml5a2pDU2g1?=
 =?utf-8?B?UGxlVmpJeEtRaG5iSWhtMHNSS2lYZmhpV1ZUd1F3bnBZMGN0NHJ5ODdiNGZW?=
 =?utf-8?B?RjVnbE5IOHAyMHZvR2hOSjdpUHJtNDJWRGFrWjcrS29aWWg0SDJMYnd4UzJF?=
 =?utf-8?B?NDIzeThZc0k3OEp6TVZ3Q3RqR2lnWTQ2MmliZk9JaWxTbmVwYjBXVVU2N0lX?=
 =?utf-8?B?K0FKaHFmZ0dvTDVnNkhLZVF2dXJSR1JMQUZ4K29lVmFJRU1aWkE5ZHBKb0Fn?=
 =?utf-8?B?d2JYdVI0N2RZbXZyUmJXQnJHaDdBSVA2VVhSdkt1ZkRPVUFvcTRFQjJ1WGE4?=
 =?utf-8?B?Nk5FbDNlR3VzOTBaTFMrNjVjaGR1YTFPTVE3YzNkaWhuYnc2OTRSWitWMUhB?=
 =?utf-8?B?ZDRqUGZVais1NEdQdEFhOUpzWFlsT3ZhMjg1ZDBHdEhKZ20rbnN4K3NLYUlr?=
 =?utf-8?B?MjVUOXhsallLWVgydDVYdnRGY0ZnS2FnU1pOYXRoTHE4cGhoa3B1a2pIMGk3?=
 =?utf-8?B?alF0R0NrTXBUakYzSWkyRERubXJ3M2h5cXBOMzlsTGJ6KzhpVjArRzhZT3ZI?=
 =?utf-8?B?emV3dnZpLzNHYWNoZkRlWHIreW1DZVNoTDIyYUlxUEEwMDhFWk9vMVhSei81?=
 =?utf-8?B?dldqZnVTOWZQUnVwTmthMnJuSS8xYnlwUjFFSm56aHk2bi9NMFRiYzdnZmpI?=
 =?utf-8?B?NkFNUkZGeVRVQ00xTmxXM2lzd2JoSnRMbTYrQ1hKL0xTNW1JTnhWMjZqNkNX?=
 =?utf-8?B?MkxxM0swejg1ZW85VXF1Mm5sWVdUOXc4bWNCWFV4ajI0YWlTQnR0MDJBSzlk?=
 =?utf-8?B?VDBiWnYvMjA3c3paR0NmMy9WT0lHTTBuaXpRRnJOTEE4WkFYekYwbzBCMFdZ?=
 =?utf-8?B?eEVBV3NiWXl4TXFXYjAvMmY5UEQ5ZnA5b3V4dnArNW9kU2p0dDNVSGVySWFi?=
 =?utf-8?B?SklGS3dUV01XZE1lYzcrN1JxemVDeTYwd1ZxQ1lRckQ2MEpxYWwycHRHT3Zl?=
 =?utf-8?B?Z2h3Zk5tOXZIN2pLaG1UTzdJSk04Tm14UTA3RURXWDZPanAvZ0tMbk1JZXoz?=
 =?utf-8?B?VDN2ZldiRlE0UWtHK1VIU1duWTBkY3RndW1OaW9kMGZFY0JCdWVsOFMwbHhl?=
 =?utf-8?B?UnhpMWlPc1JxaUtYei9ITXhqY0QxMk5BTUJBVVRYWmlmSGVEL2JUeWJhcjQ3?=
 =?utf-8?B?aFd2VG9yNGxjSzNkanVRQlF1c1laWTIyZDdFMlg5LzhFUlNkam9haGx6eUVh?=
 =?utf-8?B?S2hnU1krTFAvYlFzSHRkV1lwaDZiY2FRamgrYVRvYllNME0yUFhNTnc5RFph?=
 =?utf-8?B?dE5tZDhWQ1kweE9ZL2NtTEVLNkxpL2tLN0hiRDl0M3lwRzhnYlRDUkdVT0xS?=
 =?utf-8?B?S3c2UVpnVlNLdzBFQUVBWGFWdHIzS1RrT2lkWEtOL0VEc1FpMFJuMHF5T3Qw?=
 =?utf-8?B?UEQvK0tnbDNaemZRL3o0eTR1eGNNQWZ4QXJPY2paS0pRbHk3WXl2QzZVNDBR?=
 =?utf-8?B?YkpaSW9hOWl6ZDRjSElkd2NOOWQ5dVRCQmdBQ0xZVTg4dWd5bWVjTDBCWXJn?=
 =?utf-8?B?cTFUYXNrNFltelJuNStXaWIrbUtqbmUvYmpVQXIzSkY4Qi9KREsycGNjeEhO?=
 =?utf-8?B?bS9NeXhHQmZwaUIxajdGeEdsM0FPNEdFZ0FiVURvNXVTTWlqT1RnVlBzNkE2?=
 =?utf-8?B?SFl2ZXFrTkwzUUpjUHplTGs5ejZ6REY3NlRhdGJnNXVyOXVWTExTcG54bk51?=
 =?utf-8?B?aGFVNTE4NGhCNzd0cnFINElQcHZTN29JNGRNZGFjTlBSMmhiNkl3NXg1R3kr?=
 =?utf-8?B?bzJjRDdrcWlKZDZTSGFzRzVzd0YxVjcrcGo0NHVRd1UvOGlINkE3SjRwbW1v?=
 =?utf-8?Q?vOaLSqCbCDACADsoQ905B84rq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F148B5E8B5DDA14B8E7057441CCBA17D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a39fb4-05cc-454d-0512-08dc955841b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 20:49:07.1488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDl6D6f5LIygiAD3h4/J3vlA1i8tyeq8oV63w/ODdLgP6piQ6qQcB1DrtlPPXsSjsDeCvr+HbO3JWyMpZgEYkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5122
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

T24gVHVlLCAyMDI0LTA2LTI1IGF0IDEzOjE1IC0wNzAwLCBBc2h1dG9zaCBEaXhpdCB3cm90ZToN
Cj4gTWVzYSBWS19LSFJfcGVyZm9ybWFuY2VfcXVlcnkgdXNlIGNhc2UgcmVxdWlyZXMgcHJlZW1w
dGlvbiB0byBiZSBkaXNhYmxlZA0KPiBmb3IgdGhlIHN0cmVhbSBleGVjIHF1ZXVlLiBJbXBsZW1l
bnQgdGhpcyBmdW5jdGlvbmFsaXR5IGhlcmUgYmFzZWQgb24gdGhlDQo+IG5ldyBzZXRfbm9fcHJl
ZW1wdCBhbmQgY2xlYXJfbm9fcHJlZW1wdCBleGVjIHF1ZXVlIG9wcy4NCg0KSXMgdGhpcyBwbGFu
bmVkIHRvIGxhbmQgaW4gdGhlIHNhbWUgS2VybmVsIHZlcnNpb24gYXMgdGhlIG90aGVyIE9BIHBh
dGNoZXM/DQpJZiBub3Qgd291bGQgYmUgbmljZSB0byBoYXZlIHNvbWUgZmxhZyBpbmRpY2F0aW5n
IHRoYXQgdGhpcyBmZWF0dXJlIGlzIHN1cHBvcnRlZCBpbiBydW5uaW5nIGtlcm5lbCwgbGlrZSB3
ZSBoYXZlIGluIGk5MTUuDQoNCnVBUEkgbG9va3MgZ29vZCB0byBtZSwgd2lsbCBpbXBsZW1lbnQg
b24gTWVzYSB0b21vcnJvdy4NCg0KdGhhbmsgeW91DQoNCkFja2VkLWJ5OiBKb3PDqSBSb2JlcnRv
IGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
QXNodXRvc2ggRGl4aXQgPGFzaHV0b3NoLmRpeGl0QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfb2EuYyAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfb2FfdHlwZXMuaCB8ICAzICsrKw0K
PiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgICAgfCAgNiArKysrKysNCj4gIDMgZmls
ZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X29hLmMNCj4gaW5kZXggYTY4NjU5ZmQ1Mzg2Li42NDUzYzM2YzQ1MzkgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9vYS5jDQo+IEBAIC04MCw2ICs4MCw3IEBAIHN0cnVjdCB4ZV9vYV9vcGVuX3BhcmFtIHsNCj4g
IAlpbnQgZW5naW5lX2luc3RhbmNlOw0KPiAgCXN0cnVjdCB4ZV9leGVjX3F1ZXVlICpleGVjX3E7
DQo+ICAJc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlOw0KPiArCWJvb2wgbm9fcHJlZW1wdDsNCj4g
IH07DQo+ICANCj4gIHN0cnVjdCB4ZV9vYV9jb25maWdfYm8gew0KPiBAQCAtMTAxOCw2ICsxMDE5
LDEzIEBAIHN0YXRpYyBpbnQgeGVfb2FfZW5hYmxlX2xvY2tlZChzdHJ1Y3QgeGVfb2Ffc3RyZWFt
ICpzdHJlYW0pDQo+ICAJaWYgKHN0cmVhbS0+ZW5hYmxlZCkNCj4gIAkJcmV0dXJuIDA7DQo+ICAN
Cj4gKwlpZiAoc3RyZWFtLT5ub19wcmVlbXB0KSB7DQo+ICsJCWludCByZXQgPSBzdHJlYW0tPmV4
ZWNfcS0+b3BzLT5zZXRfbm9fcHJlZW1wdChzdHJlYW0tPmV4ZWNfcSk7DQo+ICsNCj4gKwkJaWYg
KHJldCkNCj4gKwkJCXJldHVybiByZXQ7DQo+ICsJfQ0KPiArDQo+ICAJeGVfb2Ffc3RyZWFtX2Vu
YWJsZShzdHJlYW0pOw0KPiAgDQo+ICAJc3RyZWFtLT5lbmFibGVkID0gdHJ1ZTsNCj4gQEAgLTEw
MjYsMTMgKzEwMzQsMTggQEAgc3RhdGljIGludCB4ZV9vYV9lbmFibGVfbG9ja2VkKHN0cnVjdCB4
ZV9vYV9zdHJlYW0gKnN0cmVhbSkNCj4gIA0KPiAgc3RhdGljIGludCB4ZV9vYV9kaXNhYmxlX2xv
Y2tlZChzdHJ1Y3QgeGVfb2Ffc3RyZWFtICpzdHJlYW0pDQo+ICB7DQo+ICsJaW50IHJldCA9IDA7
DQo+ICsNCj4gIAlpZiAoIXN0cmVhbS0+ZW5hYmxlZCkNCj4gIAkJcmV0dXJuIDA7DQo+ICANCj4g
IAl4ZV9vYV9zdHJlYW1fZGlzYWJsZShzdHJlYW0pOw0KPiAgDQo+ICsJaWYgKHN0cmVhbS0+bm9f
cHJlZW1wdCkNCj4gKwkJcmV0ID0gc3RyZWFtLT5leGVjX3EtPm9wcy0+Y2xlYXJfbm9fcHJlZW1w
dChzdHJlYW0tPmV4ZWNfcSk7DQo+ICsNCj4gIAlzdHJlYW0tPmVuYWJsZWQgPSBmYWxzZTsNCj4g
LQlyZXR1cm4gMDsNCj4gKwlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgbG9uZyB4
ZV9vYV9jb25maWdfbG9ja2VkKHN0cnVjdCB4ZV9vYV9zdHJlYW0gKnN0cmVhbSwgdTY0IGFyZykN
Cj4gQEAgLTEzMDcsNiArMTMyMCw3IEBAIHN0YXRpYyBpbnQgeGVfb2Ffc3RyZWFtX2luaXQoc3Ry
dWN0IHhlX29hX3N0cmVhbSAqc3RyZWFtLA0KPiAgCXN0cmVhbS0+c2FtcGxlID0gcGFyYW0tPnNh
bXBsZTsNCj4gIAlzdHJlYW0tPnBlcmlvZGljID0gcGFyYW0tPnBlcmlvZF9leHBvbmVudCA+IDA7
DQo+ICAJc3RyZWFtLT5wZXJpb2RfZXhwb25lbnQgPSBwYXJhbS0+cGVyaW9kX2V4cG9uZW50Ow0K
PiArCXN0cmVhbS0+bm9fcHJlZW1wdCA9IHBhcmFtLT5ub19wcmVlbXB0Ow0KPiAgDQo+ICAJLyoN
Cj4gIAkgKiBGb3IgWGUyKywgd2hlbiBvdmVycnVuIG1vZGUgaXMgZW5hYmxlZCwgdGhlcmUgYXJl
IG5vIHBhcnRpYWwgcmVwb3J0cyBhdCB0aGUgZW5kDQo+IEBAIC0xNjUxLDYgKzE2NjUsMTMgQEAg
c3RhdGljIGludCB4ZV9vYV9zZXRfcHJvcF9lbmdpbmVfaW5zdGFuY2Uoc3RydWN0IHhlX29hICpv
YSwgdTY0IHZhbHVlLA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgaW50IHhl
X29hX3NldF9ub19wcmVlbXB0KHN0cnVjdCB4ZV9vYSAqb2EsIHU2NCB2YWx1ZSwNCj4gKwkJCQlz
dHJ1Y3QgeGVfb2Ffb3Blbl9wYXJhbSAqcGFyYW0pDQo+ICt7DQo+ICsJcGFyYW0tPm5vX3ByZWVt
cHQgPSB2YWx1ZTsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAgdHlwZWRlZiBpbnQgKCp4
ZV9vYV9zZXRfcHJvcGVydHlfZm4pKHN0cnVjdCB4ZV9vYSAqb2EsIHU2NCB2YWx1ZSwNCj4gIAkJ
CQkgICAgIHN0cnVjdCB4ZV9vYV9vcGVuX3BhcmFtICpwYXJhbSk7DQo+ICBzdGF0aWMgY29uc3Qg
eGVfb2Ffc2V0X3Byb3BlcnR5X2ZuIHhlX29hX3NldF9wcm9wZXJ0eV9mdW5jc1tdID0gew0KPiBA
QCAtMTY2Miw2ICsxNjgzLDcgQEAgc3RhdGljIGNvbnN0IHhlX29hX3NldF9wcm9wZXJ0eV9mbiB4
ZV9vYV9zZXRfcHJvcGVydHlfZnVuY3NbXSA9IHsNCj4gIAlbRFJNX1hFX09BX1BST1BFUlRZX09B
X0RJU0FCTEVEXSA9IHhlX29hX3NldF9wcm9wX2Rpc2FibGVkLA0KPiAgCVtEUk1fWEVfT0FfUFJP
UEVSVFlfRVhFQ19RVUVVRV9JRF0gPSB4ZV9vYV9zZXRfcHJvcF9leGVjX3F1ZXVlX2lkLA0KPiAg
CVtEUk1fWEVfT0FfUFJPUEVSVFlfT0FfRU5HSU5FX0lOU1RBTkNFXSA9IHhlX29hX3NldF9wcm9w
X2VuZ2luZV9pbnN0YW5jZSwNCj4gKwlbRFJNX1hFX09BX1BST1BFUlRZX05PX1BSRUVNUFRdID0g
eGVfb2Ffc2V0X25vX3ByZWVtcHQsDQo+ICB9Ow0KPiAgDQo+ICBzdGF0aWMgaW50IHhlX29hX3Vz
ZXJfZXh0X3NldF9wcm9wZXJ0eShzdHJ1Y3QgeGVfb2EgKm9hLCB1NjQgZXh0ZW5zaW9uLA0KPiBA
QCAtMTc2Niw2ICsxNzg4LDE1IEBAIGludCB4ZV9vYV9zdHJlYW1fb3Blbl9pb2N0bChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB1NjQgZGF0YSwgc3RydWN0IGRybV9maWxlICpmDQo+ICAJaWYgKHBh
cmFtLmV4ZWNfcSAmJiAhcGFyYW0uc2FtcGxlKQ0KPiAgCQlwcml2aWxlZ2VkX29wID0gZmFsc2U7
DQo+ICANCj4gKwlpZiAocGFyYW0ubm9fcHJlZW1wdCkgew0KPiArCQlpZiAoIXBhcmFtLmV4ZWNf
cSkgew0KPiArCQkJZHJtX2RiZygmb2EtPnhlLT5kcm0sICJQcmVlbXB0aW9uIGRpc2FibGUgd2l0
aG91dCBleGVjX3EhXG4iKTsNCj4gKwkJCXJldCA9IC1FSU5WQUw7DQo+ICsJCQlnb3RvIGVycl9l
eGVjX3E7DQo+ICsJCX0NCj4gKwkJcHJpdmlsZWdlZF9vcCA9IHRydWU7DQo+ICsJfQ0KPiArDQo+
ICAJaWYgKHByaXZpbGVnZWRfb3AgJiYgeGVfcGVyZl9zdHJlYW1fcGFyYW5vaWQgJiYgIXBlcmZt
b25fY2FwYWJsZSgpKSB7DQo+ICAJCWRybV9kYmcoJm9hLT54ZS0+ZHJtLCAiSW5zdWZmaWNpZW50
IHByaXZpbGVnZXMgdG8gb3BlbiB4ZSBwZXJmIHN0cmVhbVxuIik7DQo+ICAJCXJldCA9IC1FQUND
RVM7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfb2FfdHlwZXMuaCBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9vYV90eXBlcy5oDQo+IGluZGV4IDcwNmQ0NTU3N2RhZS4uNTQw
YzNlYzUzYTZkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfb2FfdHlwZXMu
aA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfb2FfdHlwZXMuaA0KPiBAQCAtMjM1LDUg
KzIzNSw4IEBAIHN0cnVjdCB4ZV9vYV9zdHJlYW0gew0KPiAgDQo+ICAJLyoqIEBvYV9zdGF0dXM6
IHRlbXBvcmFyeSBzdG9yYWdlIGZvciBvYV9zdGF0dXMgcmVnaXN0ZXIgdmFsdWUgKi8NCj4gIAl1
MzIgb2Ffc3RhdHVzOw0KPiArDQo+ICsJLyoqIEBub19wcmVlbXB0OiBXaGV0aGVyIHByZWVtcHRp
b24gYW5kIHRpbWVzbGljaW5nIGlzIGRpc2FibGVkIGZvciBzdHJlYW0gZXhlY19xICovDQo+ICsJ
dTMyIG5vX3ByZWVtcHQ7DQo+ICB9Ow0KPiAgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBpbmRleCBi
NDEwNTUzZmFhOWIuLjEyZWFhODUzMmI1YyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91YXBpL2Ry
bS94ZV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IEBAIC0xNjEx
LDYgKzE2MTEsMTIgQEAgZW51bSBkcm1feGVfb2FfcHJvcGVydHlfaWQgew0KPiAgCSAqIHBhc3Mg
YWxvbmcgd2l0aCBARFJNX1hFX09BX1BST1BFUlRZX0VYRUNfUVVFVUVfSUQgb3Igd2lsbCBkZWZh
dWx0IHRvIDAuDQo+ICAJICovDQo+ICAJRFJNX1hFX09BX1BST1BFUlRZX09BX0VOR0lORV9JTlNU
QU5DRSwNCj4gKw0KPiArCS8qKg0KPiArCSAqIEBEUk1fWEVfT0FfUFJPUEVSVFlfTk9fUFJFRU1Q
VDogQWxsb3cgcHJlZW1wdGlvbiBhbmQgdGltZXNsaWNpbmcNCj4gKwkgKiB0byBiZSBkaXNhYmxl
ZCBmb3IgdGhlIHN0cmVhbSBleGVjIHF1ZXVlLg0KPiArCSAqLw0KPiArCURSTV9YRV9PQV9QUk9Q
RVJUWV9OT19QUkVFTVBULA0KPiAgfTsNCj4gIA0KPiAgLyoqDQoNCg==
