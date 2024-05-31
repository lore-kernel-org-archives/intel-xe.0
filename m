Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FB8C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 19:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8544010E06B;
	Fri, 31 May 2024 19:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUrLdpCj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C4310E06B
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 19:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717185203; x=1748721203;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=BceXrQjHVNDlPSl+PCfhBxSegK0Et2DjmZIgs/ER1I8=;
 b=UUrLdpCjr0gA4eoSvA/blZAQbWxaY93O937vTHmkeYyXlsLvLu5y0dY9
 nu5AQWkq52l1yA5U1tcYCfH8KPn/qEBfm3cdXohbNX4gn9NY+vH8bCKtD
 C811Tsikafb0lYnVKMYkSDUkNCp3ZBhKxit2UXSVy15pqziuv2OfIuFja
 r5YVbTVaES1Q+PnfZl4wHPolAqvxDx7Vn/xdxs7YncdE/h7OpDBDREegQ
 gARMWZcUEjNql/XV5Io9/nqyUSoDv9KR/89Cl+XFmxYYwPZLU7XehkC/V
 gDyvtTKlxYQFqpxjxdmOlo9JcBKvyeueeFlGJsKgVXFysjFZpncHRClGt g==;
X-CSE-ConnectionGUID: I8xQsUnpQx2xbykjh8MsPw==
X-CSE-MsgGUID: jysHZA3VSDCoqnby4BawcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17573641"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="17573641"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 12:53:22 -0700
X-CSE-ConnectionGUID: MN/3qCVrQ/ihUeVDZXnGZA==
X-CSE-MsgGUID: tr3x6OD3QayJmWhETXKZzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="41183938"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 12:53:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 12:53:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 12:53:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 12:53:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLsiH/bvClQW2pjGvR/AdeHUieY9tncjHST7G3mvRyrFOLR4yooI0Jouu1+2eU1iBL84bdu6UBRMICcnN4X4S3JQEuWGlSiUgF399J5fx38F3YDYM1LFNzDtL9N66NkmMNN1v4jy32bIErfNocQ1DAC0VG2+/wO89hvsieDgBBs0nTgkjX/eKaGCy7SnKcjXdGK2DUQCbZonW066DfI0gCHfX9LaeMkKQ9Zm8fkq+yhCsGFf7Eu8chbnbpu85/hUt2aoiJtZI7xg9NQZ9dWsUIGvFZClWSsWaIwgAMl3nUqz9BMRUXbLwThw4reyPIl9OR4gBsgxl/YebxV9BM47gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Han4k7oDVheKap3YB1gjOzPn+VjnpTX9zASvWT6mbRI=;
 b=Xv+0ekgwA7i9Plcx4d3z1ADdN4poY5coid6utz0DDpVw6amo0zbZGpu/hT7AbEYAQAWAo8x4UVxbhOaRwFw732ALner3x2gVDC9q1Z1XCvFs0O3QJDRsX4M+4qmkBbMTGUvJvO2uDWs6xTZNN3FEsZmnLIj79UgDpXkOJUPaqZGmC3tabA5soobnMOwtoSVYzvTqSxrwS99Rv/i2nK86/zOJuw6yG3fAjBjbq2BmDpu7+7MaJseSdx6e2KHENGFi3m3XS+MT6EsEVIBf+RzRxQRh/c1m9tHEqiw9JuWtCu0f3Ltw1vkkNfvbAlZk6tbD2LnvsZZhNslhKV2+KRsdYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6347.namprd11.prod.outlook.com (2603:10b6:208:388::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 19:53:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 19:53:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Fri, 31 May 2024 15:53:15 -0400
Message-ID: <20240531195315.217230-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fbd6ad0-10a8-4765-d78c-08dc81ab51df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ck5Dbi9DejdMUHc0N3plTStNejdvbHZESE50cWRmSTBvcEVmNFpWZ2pQc3Ex?=
 =?utf-8?B?YzR6OUwvNWhlUDZYRklpUXFic0xCd2dxcDhNc1JLTm9FcTFMTDVFTm1RUDJV?=
 =?utf-8?B?LzV0VUtkbXdCR0hZakdvZ2orK2I1VEVzWVdmY3o2a3NyQ2t5d2dFUlRlV0Fx?=
 =?utf-8?B?ZktiRVN1Yk8weXpGbHBsNCtRVVhlWHRFdW5MSUNRTjFKVUZiaG9ndGtjeDhz?=
 =?utf-8?B?THF1VTlZVC9Wb2REalc5V01uSnJndndHRTMwOXBWcTMyM25qMTlmaTNkTkpI?=
 =?utf-8?B?VXRkUS9YbGgrOTdzazJ1em8wSlhMbzgxZWZWQ0hOaWlhcjQvcDl6VFlqZkpT?=
 =?utf-8?B?TXNyNi9DSXhIRzFGVWpEOU9IWlZTTVBnckd3N0IzaEMwUjcrTzRLUE53VjY5?=
 =?utf-8?B?aHBqb1NiV053elErSHhoZGxsVDBBOWJyRWhISTF6TDJCc3Z2YVFFcVcrS2g3?=
 =?utf-8?B?cWRhcUN0RlVkcm5Dbnp4NVNiOExsTGl2Q0xjRlptT1paK016elBBRjFnTytJ?=
 =?utf-8?B?UWtHN2dNQWJUOTI4WTFtNmxNMkJFYUxHZTNiWHptS3hhQXNab2cwaHY5eXNz?=
 =?utf-8?B?OU9HSDI3Y3NxQmZDYWkxVTUzbG1mU1FqK1FRU2RXUml3TjBtZDdOeDJCSnR2?=
 =?utf-8?B?T2xYOWt2Y3JUc0FPblRLZWdBUEhqb21sNFRnQURxTGswd0ZkQkl6Y0tsdzhy?=
 =?utf-8?B?UXRiNkZBdFNuRitGQjkwSXJtR2ZoWFJ6NTRzbVZjQ0lOVFROR2N2aTVKeGVa?=
 =?utf-8?B?a3YxbysrcjMrMjB4MHIxeHlJWmpaNkdqa0U4dFRwcllweU00bzY4OXRuWFFH?=
 =?utf-8?B?YWdlOVJSdWdiSXB6REVPRENIdDUwOHBFbEdqM0h2TkUyUjcyd0Y0VGIzYitJ?=
 =?utf-8?B?WU5ZMnBhbEU4d3BzY0QvZDVoSy9EOTEvZzl2Wk5KbHY0bndjZHBEWjRMdmdm?=
 =?utf-8?B?YzlDcVlzeFM2RC9uQVdKT2pBNW56Vm12TkFnbS9rOWZiWVgzM3RWVldWcWxy?=
 =?utf-8?B?TDBNcmZqNEdhTzhvT3YvYnRqNzJnaDc3MmhIenZNU3B3QjUya2RmRE1kNlpT?=
 =?utf-8?B?MU9aeGttdE15UXNuZGF5dUx6WjZ4R2lIRjBTN1N6ekNNRHpOUHA0ek1QMTNN?=
 =?utf-8?B?K2t3a0ppRHV0RjlEL1hFaU84WmMvakZ2RTcxN0l6aFhLVng3NzdPODhacnhq?=
 =?utf-8?B?cjNaYnF4Ni9SV0h3OVJHTjZqY1JrZW5SSi92WFhrQzdOcVRWOFk4OTBsdTRi?=
 =?utf-8?B?V3RlMHBac01wZVJmS1IwUHBFZ3NHU3VFdEl6Ym9uSEFCT0Z1bUNlUUlUQ09q?=
 =?utf-8?B?VWgrYVZrV05SWkxBenNzcjh4NXpPTWZ6M3RES2haNU5PUW0vM25KVkF1RVdu?=
 =?utf-8?B?YmxYUm5WRERMajNvWFIrQXJYQkI4alh0dlB6RXBNYVoxUmFJVU1hRlFDTWFG?=
 =?utf-8?B?cVd2MWNvVjNndWwrSU83OXhDN2J6SGh6M3ltNHB1VUw4bTVCQ2RGWmlkckJl?=
 =?utf-8?B?VllKaVc2YlhlOGNLZUF5ZzRyamJrdWh1UG1ibXFWN0gzOXFzdTRVZ2kwbEQy?=
 =?utf-8?B?K0dXMUFmdDBPSWVrWVhIeVdMa05GZjZtSURtd3p4dkJVL3hUd3FnVGl0SEhE?=
 =?utf-8?B?THg1QUFwOVIySkhTK1FnZG9KTjB4TnZzZlhUeWxvayswK0RwRmltYW9oMlh3?=
 =?utf-8?B?UWZpcHZMdGpTS0phY2hOVEZaK0xaOW9pSkdPVTBnSEc1NnpBYUNPSlhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUJZaVVBanF0REIxdzVhcE5ETC91bkE5WllhbCtOeGdqTDJuUTB6dXRRK3lM?=
 =?utf-8?B?M3haY0VLZ1VJMElJT3JVTjJld09kVGVuOUkzSWdoVjB6REtZSFpzTkNnRlBE?=
 =?utf-8?B?SzU1VVB4TWtMT251RzRzbndhcEhKR2dXSlUxVnlZaWpjMTVKeGMvMDhVVkQ3?=
 =?utf-8?B?T3lxQUwzdlhyckpTNWlzMnF4Q2VxTElKMWZSZW5GQ3h6Ym9VN0NjNjZTN3ZL?=
 =?utf-8?B?dlhvQzV2S1BiU3BVOEVLRnJidzJZR1pHRjFXVzBTR0l4VWZGN29xT1podWZ4?=
 =?utf-8?B?V3dSSWdUaTA0U3c4dUV1Mzd3UGUwZ3NUL29rZ3FxbWd0QzJGcHlqN2pGWFdr?=
 =?utf-8?B?Q3JpMGtON2NXb3ZTTndyaFg1UjFOQTIxOTBFbE9ISUdqOVoyVXV4MTdaeFZy?=
 =?utf-8?B?NXRIUW93V0U0Y1hXUklFcTZoS29IaldwT29mcFpGTXo1cmh4VGNkMGhyajVJ?=
 =?utf-8?B?RjM5SmlIMDA4dHdEMk1HVzBRb2I5bHlVZ05UbFhHaTdkcGhSSGFLTDNiLy9V?=
 =?utf-8?B?Q0srZEhPWithTG5UdnhkQkQ4d1B4a2xDRzVFclZTU1RWKytOcVFIRk16eUZI?=
 =?utf-8?B?ZDFYb1hYRXNrY1BOd25VcVBYSzJhQUpBS2hWNTA4WXFBOGV4TjU3eDJ4UkZC?=
 =?utf-8?B?TUUvMlRCZVpwcmw3L2V5all0UFFFZlZpMnJVZGV2UnMvenlUMU53STlKNTNs?=
 =?utf-8?B?TjdlbTgwRllqbU4yc2xNTnd1aUxybW1icU5NVE4xQ1I4ZytmMWtIWDJWN2NU?=
 =?utf-8?B?bEpaR0krTTFURFNack1SNUxHMjBKbnYrMkJMdThtWjV2REtMMVFPNnZIUW13?=
 =?utf-8?B?QmxuWXBzQnV0Nk5nMWY2V21hb1lDdDFKeTA0UU1uUUNvWGh1MEJockJXRHpO?=
 =?utf-8?B?OUNGM2ZONktoVXdUVEV0QmpoL2VnQldjajBaN25LRXNZZW93MnlrRTR4Unh4?=
 =?utf-8?B?RlJmMDlaMFp2QlBzbTZFTFlQL3hKSkc0MmdLSUcwN2VaMUR6QWl0eTRJNEhQ?=
 =?utf-8?B?TG80U2czeC9BT3QvdWlxaFl1cTJweW9uTW5COER3ckNyNnhkVndFaHU1YVJW?=
 =?utf-8?B?enlVZFlEdHdSbWExVENFb005MnRxMzBWb0pYQ0VXMFZHRXBPWG5RMVdLZTZ2?=
 =?utf-8?B?eDBZQXFiSHRMWnRuTVd2UWYya3lJUlo2ZnpxbjQzM0NSdjJXYlI2bHlWWm9n?=
 =?utf-8?B?ZkVCM0wvV2RSYko2MlgrOXNzaDI2UHJ6N2h5dnZOcW51dUFaTVRpRU9qNkZp?=
 =?utf-8?B?LzRvdXJOb2xjeFJJWU1HSjNzVVNub0VRRDhRY1pLa0FNUUJJY1pQeGZiZ0hK?=
 =?utf-8?B?WEQyR0FqaHd3TGZNM28xQnZOc1R2RzBkN3RKZVE1NUxnYXJMVDQvWmhwbWp0?=
 =?utf-8?B?NndweEY5Q2FTUjVqTTNkTnY1MUtOTStWSEpTdTZGQzMzU0gxZ0NUL3NHdDU5?=
 =?utf-8?B?Wmc0cTlWVW1lU3NEUlNqTU15RTRVY3ZsNEkzNG5SbUllVHFOTVJpK2JMalVm?=
 =?utf-8?B?bFFGV2VsVDZKUVJoZU8rNThBclZwNEYzQmFYTnhmR01uQTNWb3ZVN0xNT05P?=
 =?utf-8?B?bEtMaVF6MXh1T2JYTzdVMkJuMmExMExhaUgrTEtiRk1Lb3pHaW4wdVMzQXVz?=
 =?utf-8?B?QWd4aFFNQ3FKZGQrRHhDR2dtT3dNdEozbzdUZkxBRThsNWxVME4wQk1pSy92?=
 =?utf-8?B?MldIWVNxamVsZTVsTWJQN3V5ci84VlBaU1BOMGVQYUw1enhvY3d4dDdob0lS?=
 =?utf-8?B?a29Zc3pkY1NqWFlXaDRJWVhSQ0NhMURnWHZBQk5zdWxybE4rMSs5ZDdjSjM1?=
 =?utf-8?B?VXJOSnhXanVobTRiSHhYNG5Nd2NMTWtTaXdsM2JwSmJyMEt3OFZVMXlNOHBF?=
 =?utf-8?B?Z3VzWDNxcTJiOUJmM2VNZWRGak5JVmZsaEJCUEFDMEhzU0QrNW1wc2F6ejhj?=
 =?utf-8?B?RE00bHJmWS9lN0hJUHdNVmpSNzc2ZnJKR21YNTZzM2FFbjZObmNUL3c4UUdP?=
 =?utf-8?B?MFpCNWk3WE1xQlN6UGR5RCtSZTRhTFNvUStmZ3ArSGZyQm9JL3Z4NHNIZFln?=
 =?utf-8?B?eDlkU2hPNlhBNDkyY3dBZ09iOG5YYS9iK1llVGN1WDBpT1B3YjFSOWZEdmVB?=
 =?utf-8?Q?5Nt4bD5MyOZrg4VvvUlk5MmIH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbd6ad0-10a8-4765-d78c-08dc81ab51df
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 19:53:19.4614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLHJ9YMMRa/o4ryPFrlS8XycaIlJBcc79Q4SbfoG6E2tz8I2Lscd8HfXrPGvI6/3ZEXZ6ZD+9iJesZhitKgxFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6347
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

v2: - use xe wq instead of system wq (Matt and CI)
    - Avoid GFP_KERNEL to be future proof since this removal can
    be called from outside our drivers and we don't want to block
    if atomic is needed. (Matt)

Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 56 ++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index b01a670fecb8..da8a65bdb9a3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -443,16 +443,14 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
-			 bool invalidate)
+static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			     bool invalidate)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	bool bound;
 	int idx;
 
 	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
 
 	mutex_lock(&ggtt->lock);
 	if (bound)
@@ -467,10 +465,58 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	if (invalidate)
 		xe_ggtt_invalidate(ggtt);
 
-	xe_pm_runtime_put(xe);
 	drm_dev_exit(idx);
 }
 
+struct remove_node_work {
+	struct work_struct work;
+	struct xe_ggtt *ggtt;
+	struct drm_mm_node *node;
+	bool invalidate;
+};
+
+static void ggtt_remove_node_work_func(struct work_struct *work)
+{
+	struct remove_node_work *remove_node = container_of(work, struct remove_node_work, work);
+	struct xe_device *xe = tile_to_xe(remove_node->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_remove_node(remove_node->ggtt, remove_node->node, remove_node->invalidate);
+	xe_pm_runtime_put(xe);
+
+	kfree(remove_node);
+}
+
+static void ggtt_queue_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+				   bool invalidate)
+{
+	struct remove_node_work *remove_node;
+
+	remove_node = kmalloc(sizeof(*remove_node), GFP_ATOMIC);
+	if (!remove_node)
+		return;
+
+	INIT_WORK(&remove_node->work, ggtt_remove_node_work_func);
+	remove_node->ggtt = ggtt;
+	remove_node->node = node;
+	remove_node->invalidate = invalidate;
+
+	queue_work(xe->unordered_wq, &remove_node->work);
+}
+
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_remove_node(ggtt, node, invalidate);
+		xe_pm_runtime_put(xe);
+	} else {
+		ggtt_queue_remove_node(ggtt, node, invalidate);
+	}
+}
+
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	if (XE_WARN_ON(!bo->ggtt_node.size))
-- 
2.45.1

