Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AB1C98302
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B2310E059;
	Fri, 16 Jan 2026 22:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+DIpxfk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF24410E059
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768604383; x=1800140383;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yHmLY0BZjwgXZrQdvxETgBAWPzmZ7V8ujdMfcbA2VEM=;
 b=H+DIpxfk+MEnnNE1caQwQnEAW2wB3AyBJH1b470/3F0m1lB7G1aLr6y2
 uO2joDmpJnM95rI07eHQse6lhpYLtxSsNaTciziKqtIZD8lJVt91eofeA
 ufJ83AFwkHm0ghg7JHneeYb0Vgu/x+VDel8hzlUAcNRBwiLcj/o08XHko
 RBnsxb44cFXcvs6ANafXhAoin7bp+8P8mLv+lRPLAkVwyHwZYF4NjtK8T
 ntTeKTKUH+Ta8+y7PtKGBtyifmqJp4G864q5Dghf2qz0eRq8C0oLeDCa9
 RovVqcMl3xSBoBS5y3COcIa5U604feglCq5OhFik/WgcLNmNwoG4aotLS w==;
X-CSE-ConnectionGUID: INwbljvBRVK2Qcujt0STpg==
X-CSE-MsgGUID: 6IMvBjRuTTaIyOSePSSzJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69655687"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69655687"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:59:43 -0800
X-CSE-ConnectionGUID: 3neZM1/GSseqnNhC39uzFg==
X-CSE-MsgGUID: OFu9HqjjSIaUPRbfYZ1lCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204513024"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:59:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 14:59:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 14:59:41 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 14:59:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FI7ag5Bq8LqOcjgeRz3uLjxWrUKU0YxGwXkeNvDvA2d9wr9F9OG0kRo11YU6wA1XFlZ18dknEb1xylDtF2Wo7fw4AbYuRA8V4yUf78VeCSYGcfLjAUIy5dHUgYGzsacj6Gb1qotmSUpnwOLERlvkiylTF0gpi4fhxvRFwvZRiihV5n5U/d7e0nP0xdymuI+Nkt1Q6zkS5dMtRL93HdGjS48gGIubpAk1tYpek9cszNas2owOB3RTxiQlheMH25JfbRrCikDLK+fqCW3Aopt9UVw/oCFaH3/rc8arpLejr5LA72aS6jWRMDYWytAlEBfTkPvbsZ56Dm5bfBmhSGv88g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJ+ntYuRFqaRyeqC41+OTvG23BX3KTgVrSOGtZ2tG6o=;
 b=TKoN72xQ5s7XacpDZJkg5pY0xCZy9HzLDjv2eEzSKWi7tkfZ0ehhqi/PqCwdCldpR/CARvQh33+GpRjc78554tlsB4l8dx6EosaWIogECV1b8AthCbVzWXnbWPzRkcq2OUiKBiMNAuKygNiawxCJ5h6Mh/giVAh5gvkZRaeRw3GpaYPPiJSyqYg3RKafUyWvnY+PWob9bJZhgSNVvngoYh7Z70onX6UU6l0YDcO4eAVmk5FqkESP+yTAjSMyR3zZP2mm5PI4gD6M9Ki6Gew1abDfBLWf0QCP/sW2tEl2NIyn11Z39eLwcFDliFC9gggoErfVWxM7S2KD9Y+vyzMHAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB5013.namprd11.prod.outlook.com (2603:10b6:510:30::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 22:59:39 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 22:59:39 +0000
Message-ID: <2f919dd4-e219-4230-a734-d67a280eec13@intel.com>
Date: Fri, 16 Jan 2026 23:59:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] drm/xe/kunit: Add xe_kunit_is_live_test()
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-4-d420b9c1a327@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-4-d420b9c1a327@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0029.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::42) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB5013:EE_
X-MS-Office365-Filtering-Correlation-Id: b830ef69-2c3a-485e-7474-08de5552ed4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qmt3MkhXNWUrN1U5RE1USHl3ZFZQeGI0N050eEVNTStzdEE0ZGo0aFRsM05s?=
 =?utf-8?B?UFdRNi9vRklKeURTZHFyOHMrZnMySjdiVTExUjNXbjRWbmw0ZUVBd3hKWFNZ?=
 =?utf-8?B?MlRRQWRvZGgzSFFxaFo4ZVlGZjRjZmpnQ0twWXN6V3pvKzJSUVVnVmhqcDhT?=
 =?utf-8?B?aVE4dmdFb2EvMUJVajR2cWR3V0RMMUJDckJ4alFveWxwaldkWkdOSkc5Y1lO?=
 =?utf-8?B?bmFqaElhQVQ0QzU4MmNlTEtLd1JEa3pOc0x5dkFUTFdoS1BWYUNHSzYwN0g3?=
 =?utf-8?B?eThGNzZ3WktkQW1KaWo5dm1iY0tkcVlGKy9QazVBOGp4S0Z4V3N4TnRidWlj?=
 =?utf-8?B?UXk0YnVVL2hDTHZSTElncW00MThNd3B3L2tpQmhpdmxya1Vad0J2dlk0Wm9O?=
 =?utf-8?B?dkFxOUM5eEtOWXBmdDJzbTRJekVQbzV4VmlQVGltZ2Z3WXBtWEtsdTZZTlJU?=
 =?utf-8?B?cEg4UEtrY0IwZXVMQWpCa0RMc2lNNUY0NW9PTnlsaWZIRy8xVUdKL1dEZWJJ?=
 =?utf-8?B?NnhyMUFZSjRvTGRHZHNjNmF5RFV5bi9TbG1SK2lBQkIvQjBEMCtKeGx6TUJJ?=
 =?utf-8?B?M2FRYzZVUUxqRjNWZ3BmZ3dFdXJvb3dLNmNtQTA1MnhUWnYySzBGZGM0bTdo?=
 =?utf-8?B?NGxsTDhHRmRINk5WKys0a3BrdmFnakFhSVVPUmVCRjgxdEo3OHJxMmFBSXRJ?=
 =?utf-8?B?blFxY1crNWR6TFVCdmxCdGNsdFFOc1R5bjkwMGlHdFJxd3lZRXlOWHZhaUtO?=
 =?utf-8?B?eS9RbWFzd25YRDFqMlhVeVQ4NzE4czd6K1hwQThzT3VWaG5ubG5CTTZkVE9D?=
 =?utf-8?B?ZDVia0hzWXJvYXEzME1jbWdZMS9mQmNucUkvekpqNEdvYlVaSFpLRXN5bTQr?=
 =?utf-8?B?MExRS1NnaHlSelVWK3JkeDUyZ0l3M2tqei9vRUw2Tng2RVV4Z3Uzb2VTL2F4?=
 =?utf-8?B?TktwNnVuU0dXMDV5Q0NUSlhWdkF2N3g0dFFicjBPeUFwY3VvZU1QSk5TUkJy?=
 =?utf-8?B?blNBcE5iZDY4QU9DNUZSWld0NmlHK2dSVXlWNDQ2ajhoTnJEZU5XZVpTak0w?=
 =?utf-8?B?VGFDSDNNQktCVVZ4SmhsMUJEZWtKSmpPeHdSQWs5ak9YZnJXRVplRkFBTkta?=
 =?utf-8?B?OG5yWENIUDdMditxdUFsNEZnd0NFZW10d0JKNnd1aVZvUkFNYldyc3dqU21J?=
 =?utf-8?B?U01nYzdmWGJYWjdFUG83M1NwQ3hOeFloNDI1bWYxRWZqcTRiSHlNS2kzYkxp?=
 =?utf-8?B?SGhQUHJnOVBCOWFsRE0wemhGeVl6STFhWW51WkFiTEhJM1R4bFZQSVNCdGth?=
 =?utf-8?B?VEN5YkxJajE4bDgyTzlWMDdrUHlueG1qVCt6VmZ3L0RZZG5KbmdZSzJHOXlr?=
 =?utf-8?B?V0RxSnFla3VLV3hzc29xcUp0SURWdXl6Z1Vqb1l0aHg3Tk1PakRLcm5DVTlX?=
 =?utf-8?B?aEYvMStwTmQ5NWpoNjZzbWlUT2Z3QUxlTGFabWh5RjlDcVI0ZXZ5YklteHZo?=
 =?utf-8?B?UUY2ZmVjWXpvcXRoRnEyUHJXeXN3NzhTRlovQ3FkeHpHUWk4Y1BuMTc4THlT?=
 =?utf-8?B?elNGNlZvQmJLOFBPM1lncFdlenpEQjcxWVJaZVJHQkg3d2l0aFNxcEY4b3Rk?=
 =?utf-8?B?UnJzZ1crUk1CMGp4TWVNaW90U09ZeXdPaG9uWGdoUTc5V0x3VS9wbGROVHRN?=
 =?utf-8?B?QzVFdmI0SVAreWRBeTBOOFZkZXZETVFEVW9BTUZDVERoSFI0OXR2dklDUmtl?=
 =?utf-8?B?UDZzcTY0ZU0wZFhiOFZGZ2wyVHRDNEkxazkvN3VjbjN5K3VRZDB1UExqMzVr?=
 =?utf-8?B?K1BJV0pPb3lxQjM5MU9nTEhNcU8yVEh6K09POUJOZ2puNVVEUEs0SURrS3dT?=
 =?utf-8?B?dGIzcEJjeGxFeGw4ZWdGVDRlZ0ZSN2JNRDZ6d0cvN1lISWYybWpEUFJneVhu?=
 =?utf-8?B?akQwWGRyZVlSNUhxVEpIOU9td2o0Q2tJckpQMUpFWDhmaWtUWldXL1NqNWlD?=
 =?utf-8?B?SkdMYzFiZm81cmF3OHBCTW9kb0EyQk9xOUszNkM0Zkp6dW85dTc4b2EwazlR?=
 =?utf-8?B?Uk9GaytuaitIWXJTd3ZjdmtQLzlRdDZ5MWR3bUpJVVFjd3hCRGxuekdINnVi?=
 =?utf-8?Q?5eIc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1RHcitrZkhSRk5EL2ZMVTR0b2ZxVlZXclArejQrMVhXM01HblFzSWtQM0Rh?=
 =?utf-8?B?TGtNQllST3ZzT0o2NGV0VDZEM0dsRzAxRzgyd2o3R3VEWEhiY2Q5b0FJZ2Rv?=
 =?utf-8?B?bUdNbDhwY21iZnhpRnRnWit6b04vdnM3NkFxTE90UXhSWllicUdiZGF1SjNq?=
 =?utf-8?B?L25lUjVtdEpDL1MreEZqc0xoZGNhS2VyVmNyTm5UNjd1NEZGY3NkbG1mQTBv?=
 =?utf-8?B?d28rMzc0eWdwV1BSVE1yc0g0RDZJTi9WdFB0WjZsN2FDREczWTNFS1FwMlF0?=
 =?utf-8?B?VEplNE9tUGs2MkdXOW1PODZNQ3J2N0ZSUzBYWlJBUG1SSzdmRmU4UnhWSjVu?=
 =?utf-8?B?SGdzVmdqK0c0c1FNWHM2akh3Z0tRamtxMWh6NkMvOEg1RlErTldxR0hXRTBH?=
 =?utf-8?B?L05ka3NQREo3NmxQb1dkSy9XejViM21IdW1lVnlGT0JnMXNxR28yY040cWVn?=
 =?utf-8?B?enVUdUVJMll3VlVJdHJDeUxMdU5MNEEyeE13Y2RKTXRVdldZNkZJZ3R3Y2pi?=
 =?utf-8?B?eTRFOTd2N1JEZm5haEd6Qmx0cGpwZmJJNXdNWEVja0lhU3ZBNEFmMlJUSVd0?=
 =?utf-8?B?TzArREJVNjdnMEU5Tk8vQmhCcWdLRTNFTlo1bkRJM2JIMW5FSVdUd2EzNWZh?=
 =?utf-8?B?UDFpZTUrd21jL3pIenFCZk5WQnVnRHBQcC8rcWFvSjRtNUVzaGdKQThycWZk?=
 =?utf-8?B?YTU3UzVReThoZk5vUEpBR1JTWGF0M20rQ2Rtei9OR1k3Smh4aGZWUlZ5bWlM?=
 =?utf-8?B?ZFprZE9zRXlDejBoQ09kYkMrQnAvbk1Td25sYlk5aWVYa0lwMElYdjV3UTll?=
 =?utf-8?B?WUJ0U1FTMEN2UlorZXNPMnhCampDek1pKzNiSVVBODNqVFFDbnRRLy8vWE55?=
 =?utf-8?B?MVdUL3l0dXNYSElKdGhjOVd0WThjRDVtY2hZVFg3OVBJY2ZsVFg0MUUvbGln?=
 =?utf-8?B?NUlHWUZDekVCbkRhcUduRUwxY0VaYnhQeDBRUEkrekgvaEFCRGE1WERJZm8z?=
 =?utf-8?B?dDB1SUVEQmxwZUk2bW9WSXZHUWkvNS81eDM1RGZ6d1FUSTB2MUJTanRMaEl0?=
 =?utf-8?B?SW8vRlNQMGYrUWpLS2pLWW5jb2s3WTNRUzl0TmpvTjNNRnBTdjFkNWxhWlox?=
 =?utf-8?B?ejF5RmxiaHdNVjdIN1RLSDZEOTNhN2V3cnBKWlFXRVVzNXlhQjRObnJDYXRi?=
 =?utf-8?B?K3hjVm1COHZUUzdnZVlNVzhiYjhKVThWOGg1UVIxcVdTQ3ljR2dWTmdyM2Ex?=
 =?utf-8?B?TmY3WnZObTBrVGxJTWVCaVM1TVdqdGxwaHR0dWNseU5ScEpUZHE2YlMwY3FZ?=
 =?utf-8?B?M2FGcEpVdkwrK0EyUHJ3Z2lUK2xManhIUlRhSUlqaDIvZUJvV1M0KzV3OHJK?=
 =?utf-8?B?WC9rMzhVNkFpd1BNVXdSQ3hiUG9VNFhjN053SGh6N1FsVWlmRUNNeGRNRnFw?=
 =?utf-8?B?Y1NMZCt5QzVpVHJkeXU0Y3E2YkdKOWhUQW9ieTBtZUFQblFQci9Ga0RkNzZD?=
 =?utf-8?B?dkphQWw4WDlzNVZ1T2I5MjNLa0JqbC9WMnR0WHNHUHB1LzdvNnpXVlNQcnds?=
 =?utf-8?B?STYyWnpMNE5uQVN5b2dZc3pMN2gwdElnZzFtUWFwZ25yRjRDOWZSQTFpeUNR?=
 =?utf-8?B?OVpXSEtjZ3RuejA4NTNramxUdG43ZjROdzN6RlVHdmcyTlEzUmpORHkvRWw4?=
 =?utf-8?B?MllXTHFXVGh3VVVkSjN4dEdkb2Z5MkViVGh1L0RnQ3FEallRRWxRRzFQMHZX?=
 =?utf-8?B?cGpTVGppMlFDWGNVeDgzWG1nRG1ZUVRYU1hLdy8rVld5TUNHOEZmdHpIcnBk?=
 =?utf-8?B?dTRYejVUcFhOQTlneHRGbWprYXhBNHZzQkczOS85eTB5c2lMREg4SWpwdTY3?=
 =?utf-8?B?akVQR2k5QkVCSEdFL05mdXArd1RPQ0tTOHRXUGZRdkJPVEdrZkgwQ3BLZzB2?=
 =?utf-8?B?bS9NbWdmUDNjTGRSNU41aGlPZll5aUxicW9kUTJKd3lJY0o2YW03SWV3WWJt?=
 =?utf-8?B?VzRrOGRZcEU3RmhBTTBJU0JUb0wySlpFYWFsUDBGK2t3ZUdXYUJ0SGJzZ3h3?=
 =?utf-8?B?Ny9MSkU5K0QrRy9nZ1k3azNSdzdmS1V1YnQwbEkxNVU2M2NjM2FuRHFydnBh?=
 =?utf-8?B?UWJHQjFXMEJ3cDZyN2RnL01LOWZQL2FjMFhqSmRpUGQ4bk12bTVRemlWWFN1?=
 =?utf-8?B?RUxHYlh2QnJjbE41WWJGcndKZjB3dFdwcmkxYkx5SlFpZ2lTMzZNSkZISUpu?=
 =?utf-8?B?Z2x3bmMrYVFLSzkrSHRmU2NiVEZLNnZLUzRqME5XTElQRHJzYVVFWGduN2FE?=
 =?utf-8?B?bENHeENaZnBnM1BqYVhLRDcxSXZLUmVMS3FWdDUrYWhZalo5UUlraVJua0cz?=
 =?utf-8?Q?uPHHnNVGX8mHlo1g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b830ef69-2c3a-485e-7474-08de5552ed4b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 22:59:39.2498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0IG230XpzeiqGPLbFlLRAvgBxwOKA2RBPRLGq4jXu9GxJtHaeBn6/tXbXx380CmnBAzi5AiLdZSIwSwEDcH47xmmij5XAKWOdSBhQkQ378=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5013
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



On 1/16/2026 11:12 PM, Gustavo Sousa wrote:
> In upcoming changes we will need to differentiate between regular and
> live KUnit tests.  Add the function xe_kunit_is_live_test() for that
> purpose.

since you are adding this function to xe_kunit_helper.h maybe it should be named as

	xe_kunit_helper_is_live_test(test)

to follow other function names in this file?

> 
> Note that this is implemented in a rather hackish way, by leveraging
> KUnit's static stubbing functionality.  A better approach would be to
> store a boolean somewhere in test->priv that would tell if a test is a
> live one, however that's not quite feasible today given the inconsistent
> usage of test->priv (there is not a single uniform type of data assigned
> to it across existing test).

all live tests code should finally have access to the xe_device so alternate option would be to add some flag(s) there

	struct xe_device {
	...
	#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
		struct {
			bool live_testing_in_progress;
		} kunit;
	#endif

but IMO solution with static stub is fine

> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  4 ++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> index bc5156966ce9..369b26b3a32c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> @@ -16,6 +16,18 @@
>  #include "xe_device_types.h"
>  #include "xe_pm.h"
>  
> +/**
> + * xe_kunit_is_live_test - Return true if @test is a live test.
> + * @test: the &kunit test
> + *
> + * Return: True for a live test and false otherwise.
> + */
> +bool xe_kunit_is_live_test(struct kunit *test)
> +{
> +	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_is_live_test, test);
> +	return false;
> +}
> +
>  /**
>   * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit test.
>   * @test: the &kunit where this &xe_device will be used
> @@ -93,6 +105,11 @@ EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_test_init);
>  
>  KUNIT_DEFINE_ACTION_WRAPPER(put_xe_pm_runtime, xe_pm_runtime_put, struct xe_device *);
>  
> +static bool xe_kunit_is_live_test_indeed(struct kunit *test)
> +{
> +	return true;
> +}
> +
>  /**
>   * xe_kunit_helper_xe_device_live_test_init - Prepare a &xe_device for
>   *                                            use in a live KUnit test.
> @@ -116,6 +133,14 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
>  {
>  	struct xe_device *xe = xe_device_const_cast(test->param_value);
>  
> +	/*
> +	 * FIXME: This is a hack and a better solution is to have the "priv"
> +	 * member of tests have a boolean to tell if a test is a live one.
> +	 * Unfortunately that can't be done today because "priv" does not point
> +	 * to a single unified type across existing tests.

note that we use priv to pass xe, and likely if any other live init hook will replace it,
priv will still point to either tile or gt or similar object, from which we should be able to reach xe again

> +	 */
> +	kunit_activate_static_stub(test, xe_kunit_is_live_test, xe_kunit_is_live_test_indeed);
> +
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>  	kunit_info(test, "running on %s device\n", xe->info.platform_name);
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
> index 83665f7b1254..4b846cfb1f40 100644
> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
> @@ -6,10 +6,14 @@
>  #ifndef _XE_KUNIT_HELPERS_H_
>  #define _XE_KUNIT_HELPERS_H_
>  
> +#include <linux/types.h>
> +
>  struct device;
>  struct kunit;
>  struct xe_device;
>  
> +bool xe_kunit_is_live_test(struct kunit *test);
> +
>  struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>  						  struct device *dev);
>  int xe_kunit_helper_xe_device_test_init(struct kunit *test);
> 

