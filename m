Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75779C71130
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 18:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2579910E50C;
	Mon,  7 Jul 2025 18:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQr/f3HE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E1B10E516
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 18:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751912916; x=1783448916;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iu1jPBFlY2OlMK3y6jAKg0WiI3Jn1gfpQSnPXc21eaA=;
 b=fQr/f3HEVx/SOu2fbLSMQwiX1zg2Va0AIse+6B8Wh169IR8F8F25g2Cs
 UU6GBPNxy8qYkgt70pQdsfhYQJ/HNZIaubiFJKvnLYWXYWGOyW34wH4cw
 jLY3cd+YkYE5IjltuEyBnTd7b8Nhx1HKJopivx1ngj2rmoKVaz/tsHXJL
 MkDiDPuXw1TlhakU5rXjtWc8xTad0n+q7mHH7g3+6wYr2htr3cUE2JKMz
 BvGAdIiKfZun9PrsuWaSPH8+oEd/OQ/xqnzNHw8Uz4wPuvd3lVUHqHieT
 WXhoAcys2iUGCnOWvh+7lOwm+ZrzgpAnhalhCkLeWGTjXJzW3kLfsji97 g==;
X-CSE-ConnectionGUID: IOrxIwZ3QR+WFFejMHMfbg==
X-CSE-MsgGUID: pHZFABWTSzOYhFruI4lv9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76690019"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="76690019"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 11:28:36 -0700
X-CSE-ConnectionGUID: LIHKI1HDT+aFTbS+Tldl2g==
X-CSE-MsgGUID: zRzY43rIQZ+FT5XlD2K8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="159618448"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 11:28:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 11:28:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 11:28:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 11:28:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcfR0d19TU2GKHKEJ9fWcY1y5NMzc8Vj1B9JY+aPN28ORViDXGK0RA0Q7uQcxbwU805tPDz4C5P9RVFllEX2t2W5cGGZQHMCVY5XHH/5oN4bcVz79SiH0U9nQ24/WZ1gxkD57jcCQbOzptFEmO/Ah9l9ILpCQi1MADF7n9e4e/iCMjquPItD+ExhAwpFuvLBr6/Zp7FWDX+bS80xiDp0bmrBM06B1Pq+AEw3kNC4JCnB/p9cJDkURUtBeeqwVBXYji0vS6ZavqRF+JGAjZm9FrTrvQEW67rW/ipKG1dSLT+NnXDHOsAa7HM++cPaIMKOAbXXElq/wswO++HofpeUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFG0koh/ZJWPydEd5cfOr8matafz68EP5fBNLa+eSsU=;
 b=ecmhwKAWgK9xmfnSMl4Xzd7xeYmTW6DI7o7Voln7IXlphXO6NOJvcz5lIJVQ3m2V7VlM8JSdUIpOqOyhmxqHKTrDqOC4HSPGdZR0qVEX0+SrL7x+9JhihM7xqxEa2NjI2cH/oB+RLxu+G6WuOcuwzA6D587A7WnVY6hkesRZ2PlTrwrZxzvz3/1k+TvRPHh3aR7RzmmsiljL++FDqgmPOJq9VLvDgeckYFlNfUwOJ4Mdm7N3fuT4hui1F5z+2y9Wlinr9plVU06uWSx3+eiMQ172ZZiv2u3MzdtlcPwZTRy/inI2+9oKXIOCSgpyfqMxSrs5ui/UzMdxc7k/QjjYsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Mon, 7 Jul
 2025 18:28:06 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 18:28:06 +0000
Message-ID: <22f4a35c-9426-4e08-ac1f-2e2fbeb224bb@intel.com>
Date: Mon, 7 Jul 2025 14:28:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
References: <20250703213845.2259302-1-zhanjun.dong@intel.com>
 <CH0PR11MB54443606D202241399E6692EE54FA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <CH0PR11MB54443606D202241399E6692EE54FA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:303:86::24) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|LV3PR11MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: add66b6c-7349-441d-277f-08ddbd840409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SElTQlBSY0JBaE5FMHFzdGJteDNsUFAyWTIzeHRjMWJyemJxVVd6R1BTS2Fm?=
 =?utf-8?B?dEpNVEF5ak5QeFBxSklqTDhQblJieVB0RDdEeHNFcStlUGc0TEpzaUJzeVg5?=
 =?utf-8?B?T05pODhHL1pyVmVIWHczR25ZejhZTG95cFM5ZWs1VElwUTFUL0ExNE11TEU1?=
 =?utf-8?B?MTIzZ05obXNDT1c2VldRQTJaSWZkSTI2UkI3YlNBNk1zMXdKMVdWMnhPS21r?=
 =?utf-8?B?eFRyTGZLMmZ5MEc3N0MzMVA3d3o2cDM1WEVSWkVVREYrWkYwdWNXREtPS29r?=
 =?utf-8?B?Wmgra3NmcFhLRzZVTWFCT0JCQy9LWUZrNWhLak1HZDB0VFJiaHVqQm1yUi9L?=
 =?utf-8?B?ckZlbjZWWVBTWitYcHk4cHpxVWh2SVpURkI5TytQZUxKZHZZVlYrOE5vNmtF?=
 =?utf-8?B?eWlRNkNlQ0lLTUxHRVFHaEMwVTBIbGxWWWlTOUtTOG94S2hKeFFWNkxsRXpM?=
 =?utf-8?B?QzVuRjQvdThucjJMejRZOTFRWnZibmc5VVJvNXFBRkRtYW1MeGxJL3FSOUFO?=
 =?utf-8?B?R2N2RExmQUVsVDVGMjU2ODZuekFrbkFBcnduL1NWNnpocGhkVTlya2x0QmV6?=
 =?utf-8?B?OHk3RGVlQTBobTZlMGE3a0txemdpak0xaU5XdVljc25LYnhrbDhua3pHTlVO?=
 =?utf-8?B?NnJJWWlRd3M2YVJxOUQ1dUQwdm5PZUVXbFlha0wvdmFNeitZOXlNNU83ekJL?=
 =?utf-8?B?WGNUWDQ1MHh1R1krRkNUaTd2WmtpMlQySTJCcVI0UU5BRUlsdTArbHJHOUkx?=
 =?utf-8?B?dXFWb3NHYjM4czJOTG92cHN1SjcwWHNXbG1JSlZxS2xjOTRBR1BrYWRQSHNE?=
 =?utf-8?B?NVF3aFAxZDFjR005Rjl5L1JSNVdxc0llbEh6QlZrQUlDSmU2Y2twdndrRTcz?=
 =?utf-8?B?aFBMK1AvNWhaUFNCampsOXpoMkpRNk1wUTdLb2o5VUtkc0pvYXhtU2U2QTJk?=
 =?utf-8?B?Zm5aY0N1am8xVGIyNkw3Qjh1M0lSemVMUHdoMXlmWWdrdEdBWGsreXAxWWYy?=
 =?utf-8?B?a1NGdW5DRXk5dmdPc1YzKy9wL1kvQ1dPalVLOWVWaEhkaXBXdWtRdExyT2JU?=
 =?utf-8?B?OEN0cDUzUWM4M0NheXJWVDdVME44NGtaanRFdndPcXZCOUFCZ1VRN2xUaVE4?=
 =?utf-8?B?OXVCZjUxdUxVNGRCK2Z6NW56czNZUVNtL1RSMnhmM0MybDE4ckdiWWRSVlhQ?=
 =?utf-8?B?TGdSdU1HOVBtZ2FtOW51WDdGVmZUUkxIU1hvMTI5WjdQVi9wYm9XRDEvTnlP?=
 =?utf-8?B?V1NKQTRhZ1o4K0EvWjlXQ09kQitOUHJaSE5nM3lPOXA2TktvQVNLeTlaZm54?=
 =?utf-8?B?YjY1SG5vWHVSZXpzSDJKalUxZGdtSHJseTFjZTMwNTE2N1ZDUElQWTc5ald5?=
 =?utf-8?B?a0pETUY2dEx3Yy9NelcxYVNDSTI5bTJpeUUxWjV6aEJHc1J4Zk9ha2lYN202?=
 =?utf-8?B?VkRUbnNYUjVGbHJ6dEdDdDN1N1NUcm1PNnI0dkZDc00xREt1Y3ZpTnByUGJB?=
 =?utf-8?B?a2tuQ0hHV21jbDVaTHl3QjJsRjMxUUdNSXVEQU9iUlp3Qjh5L0J3cE1JSTFa?=
 =?utf-8?B?ZWNJYWRJR2c4OEVhSTg5emVHYUg3V29PTyswcWNsZVRsNDJaWnpBRkc2TXBG?=
 =?utf-8?B?cTZTcUM0THdBSVRHKzA0VHpWcUo1R2Q1RitRTjhzWVBSQ2I1ZGowOHpWWERK?=
 =?utf-8?B?MnpVWjUvUmJnUUd4WnJJTUJ1VDNEbDFJMitMOHM3czdIYkt4SUdzdjVJSW9Q?=
 =?utf-8?B?b3VBbFJNcWJ5QjQrLzlFOFB0YnN2eTdqczJWbDJsU095MHphQWNXYkIzNlds?=
 =?utf-8?Q?p+sX/MQIAJxArXmXTwiZQ+FxSv2sxm5fERqCY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDhWNnl3ZjJOV3FpTG10b2FxeDJaUWg2QytVK1N4V052YnZmVzVrVU5HSlNu?=
 =?utf-8?B?Ry9BSUZFcmh4TCtEeGxLWTFMaE9GQzQ3bDVpN256UEtDQVFESWJhbkNrTmhS?=
 =?utf-8?B?RjMrVGtOUmZHSUp1NUhWRzl2bG04VGVob1RlN1FKMGlpQ3k1QldlZ01CbTgv?=
 =?utf-8?B?ODlsU3A2M2JEZkM5RllQakRkTzN1a0xod0x4QnJuN21PNUc3TXVROUM1SUJT?=
 =?utf-8?B?eDh5OUIzWkg2b3czSCtYOVZITXoyeStxdkJXUnNkMEZKMUdBUWF3VTRSa3BD?=
 =?utf-8?B?MlE1dHhjMWJGd0I2dlFoM05LZm4zaWU3aXhIYVdzMmlyR2w1ZmVQZXE3WHds?=
 =?utf-8?B?emIvTWdsSlpGa2RXUjNFNXBpZjRvQ1hVQTFGUWJ6WHFacjEwYkJGcHpUa1l0?=
 =?utf-8?B?QnZ5YTBCNm1abkdIdk02RjJIckJCL0tXTGp0ZHB6T2tOTm5UZXhXTzlreXBI?=
 =?utf-8?B?VjdZQ3FyNHRJdUlVYWRvbkIzbzZqUTdrK1VoZ1JURUdzejJaK0RKQm9jR0Qz?=
 =?utf-8?B?RnJwWWJrT1loQW8zTitGeHFrNGVlSVpUbDJBSGVpWFNQZWFHU2pIdWxydjFB?=
 =?utf-8?B?cUsvcnVaRE4rS1JSNHF2Q3ZOUUtnTDRpL2pRc3dtNzlOdHVhMGdJSTh3OCtx?=
 =?utf-8?B?cW1pVE5YNnZsblQ3WnF3OGxtN09WblJVWHZXbnJ5Sll5cVA2b05iL24xREFF?=
 =?utf-8?B?eTBhNnpwK3ZJYWFERDZLMUtlcld3OUdzbm1lNDNEam5GVGZDbk9iOWlBNm5q?=
 =?utf-8?B?YTlNWDZNL01UaDhaWDkwZy9vOW5kWHo2MnlHRnJuVVlLOXBNR21hVzVtWmNu?=
 =?utf-8?B?dDBEYklJOTgwS3grOUI4V08wczAyMjNYaFpHVEJaL2d4K084TXg5cUZVWHBK?=
 =?utf-8?B?SDdFWUJ6NWRDNUdKSGYvYU9EdlJ1ajczYWQxWUFIdkZ6aE12b2U1Y1Z1Tmsx?=
 =?utf-8?B?Y1B0VVBzRzhtY1Q3ZWh2MTdxOFErek5HYUNVZzJMZ2RYcUxSQmJhMS8wUmp6?=
 =?utf-8?B?UUNDd0gwREM3K1dzRUNrL1RML0hPS2lQSHBiYUJ4alZ4RmsrcnljcGpzR0Na?=
 =?utf-8?B?TjZqL1dyTTdwUk9xMnk4SlJpSFFMNUlRRlZ6NFhBWHgxTEdaNG9iWmdub1hi?=
 =?utf-8?B?cXQ5aHgrQkh6VFR3c1RXd3JRNjFsM3dab09mejY3M3hlamZ6RDhNK2RESXdx?=
 =?utf-8?B?SU1hZFFaTmNqRlRWWG5zUjd3cTdDS1BuVHl6b0M2bGxuQ2kzTVBUNmFiVXRR?=
 =?utf-8?B?eTlKZWlMTXVqMS9aOWFOTlVlOWpzeXpic2JjdXpTaTl3SzdBZ3gxeldUV0N1?=
 =?utf-8?B?UTFjRHVoN3o4S0NFVTBpSTJ2UDU5WEF1cjMyQzQ5cmZWclo3bEJHL3hqTzZr?=
 =?utf-8?B?OXZkYVNMNERMcFdNZURqNU5ZNXVBRTZwWVR1cU5Pa0ZqLzBnMzdQMklEaUNy?=
 =?utf-8?B?Z2RBUkVYWitlbTN1K2RvTmM3TW04d0JBUS9TbHlYN0xaRmdId1JmaWtEZDZE?=
 =?utf-8?B?SmtjLzNodTI5dUVNWnZkREVraGtDc2V1Zm13QlRqY0E5dVMwcklKc0I4L0Vr?=
 =?utf-8?B?Ymd0bkVJOGJBZU1zR3d6ODJ4MmQxbUREUFFXSUFaeTdJeGE2dGo2K3NKWVNn?=
 =?utf-8?B?L0cwV1VxRmk5OExWVWFOWFQxSkpRc1RQYXpnai8ybDdEdnZIbnR5ZGNZWmZJ?=
 =?utf-8?B?N3cyM0ZJaXhGSTdOMklGbnB6Tk9icjJGZHd3YXlVL0tOdFh2SzZsSmZ4VzdQ?=
 =?utf-8?B?VGltQWpVRkJDWUU2UTAwTjY4ZXo1KytNdXlIN09wMXhpdkQyRlRPZFpFR0J6?=
 =?utf-8?B?dU9oOXZVdDNZM3VpOXRtZkV4RXR3bGZLRlpYWDdrTnV3ZWwvZjBZU0dwNEFr?=
 =?utf-8?B?OGNGMS9NUkcrcFEySlhOSW12K1NhVDhxck5DTTB1KzNTY00vOW9LVFNaT0Ur?=
 =?utf-8?B?T3R0RURjVUcySXdPYzg2M2NrY05MM3Yvc0EwTXlnNGxZNWxCQTRXOFFvM0dy?=
 =?utf-8?B?T3FXOEVsZEx2aE9hd2lzZEFXUzVRRlFuT0cwODZ3cGdEUmNlYkNOTlBabStE?=
 =?utf-8?B?Nk1jZEdKRGRZVG5hUmtneFNmNjhwWGYrS2RSM3prR2V2WHVZWmdTYUYvUTJP?=
 =?utf-8?B?aUtZMHdKRWluSHJOVFE0SFJBZ1l4UStLVzd4NytSQlEwZTgyNElEOFV2OEla?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: add66b6c-7349-441d-277f-08ddbd840409
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 18:28:05.9434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NVMetl5xFJNME+siLDa8qmljcKi34M08L7R+8zPTWSSPu0Lzztm/LmUFi12+5TJ6PrruSYhyvaYRVOKTOFNCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
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



On 2025-07-07 9:56 a.m., Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Dong, Zhanjun <zhanjun.dong@intel.com>
> Sent: Thursday, July 3, 2025 2:39 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Dong, Zhanjun <zhanjun.dong@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Summers, Stuart <stuart.summers@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Subject: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware initialization error.
>>
>> Disable GuC communication on Xe micro controller hardware initialization
>> error.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
>>
>> ---
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>
>> Change list:
>> v8: Fix kernel-doc style
>>      Add error handling in vf_guc_min_load_for_hwconfig
>> v7: Add kernel-doc for xe_guc_disable_communication
>>      Unset submission_state.enabled as well
>> v6: Skip disable ct on xe_guc_enable_communication error
>> v5: Set wedge is excessive action, revert back to disable ct
>> v4: Fix typo and add new line
>> v3: v2 CI re-run
>> v2: Remove unnecessary jump to err-out
>>      Drop disable ct, switch to set wedge
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 20 ++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_guc.h |  1 +
>>   drivers/gpu/drm/xe/xe_uc.c  | 19 ++++++++++++++-----
>>   3 files changed, 33 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 8573957facae..6643a2cb898b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1219,13 +1219,17 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
>>   
>>   	ret = xe_gt_sriov_vf_connect(gt);
>>   	if (ret)
>> -		return ret;
>> +		goto err_out;
>>   
>>   	ret = xe_gt_sriov_vf_query_runtime(gt);
>>   	if (ret)
>> -		return ret;
>> +		goto err_out;
>>   
>>   	return 0;
>> +
>> +err_out:
>> +	xe_guc_disable_communication(guc);
>> +	return ret;
>>   }
>>   
>>   /**
>> @@ -1337,6 +1341,18 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>>   	return 0;
>>   }
>>   
>> +/**
>> + * xe_guc_disable_communication() - Disable GuC communication
>> + * @guc: The GuC object
>> + *
>> + * This function will disable the GuC communication.
>> + */
>> +void xe_guc_disable_communication(struct xe_guc *guc)
>> +{
>> +	guc->submission_state.enabled = false;
>> +	xe_guc_ct_disable(&guc->ct);
> 
> Didn't this used to just be a wrapper for xe_guc_ct_disable?
Yes, a wrapper and pair with xe_guc_enable_communication>
> ... Well, I suppose needing to set the submission state enabled to false
> would also be a rather important step, so it's probably good that was added.
> 
> Everything else is LGTM, so
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt

Thanks Jonathan for review.

Regards,
Zhanjun Dong>
>> +}
>> +
>>   int xe_guc_suspend(struct xe_guc *guc)
>>   {
>>   	struct xe_gt *gt = guc_to_gt(guc);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index 22cf019a11bf..20823b821f7d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -34,6 +34,7 @@ int xe_guc_reset(struct xe_guc *guc);
>>   int xe_guc_upload(struct xe_guc *guc);
>>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>   int xe_guc_enable_communication(struct xe_guc *guc);
>> +void xe_guc_disable_communication(struct xe_guc *guc);
>>   int xe_guc_opt_in_features_enable(struct xe_guc *guc);
>>   int xe_guc_suspend(struct xe_guc *guc);
>>   void xe_guc_notify(struct xe_guc *guc);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 6431ba3a2c53..1012fe84b379 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_gt_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_guc_pc.h"
>>   #include "xe_guc_engine_activity.h"
>>   #include "xe_huc.h"
>> @@ -158,7 +159,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>>   
>>   	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
>>   	if (err)
>> -		return err;
>> +		goto err_out;
>>   
>>   	uc->guc.submission_state.enabled = true;
>>   
>> @@ -168,9 +169,13 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>>   
>>   	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>   	if (err)
>> -		return err;
>> +		goto err_out;
>>   
>>   	return 0;
>> +
>> +err_out:
>> +	xe_guc_disable_communication(&uc->guc);
>> +	return err;
>>   }
>>   
>>   /*
>> @@ -202,15 +207,15 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>   
>>   	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>   	if (ret)
>> -		return ret;
>> +		goto err_out;
>>   
>>   	ret = xe_guc_post_load_init(&uc->guc);
>>   	if (ret)
>> -		return ret;
>> +		goto err_out;
>>   
>>   	ret = xe_guc_pc_start(&uc->guc.pc);
>>   	if (ret)
>> -		return ret;
>> +		goto err_out;
>>   
>>   	xe_guc_engine_activity_enable_stats(&uc->guc);
>>   
>> @@ -222,6 +227,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>   	xe_gsc_load_start(&uc->gsc);
>>   
>>   	return 0;
>> +
>> +err_out:
>> +	xe_guc_disable_communication(&uc->guc);
>> +	return ret;
>>   }
>>   
>>   int xe_uc_reset_prepare(struct xe_uc *uc)
>> -- 
>> 2.34.1
>>
>>

