Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C187C02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 10:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1908510E56B;
	Thu, 16 Jan 2025 10:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1d6AQWN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD5110E144;
 Thu, 16 Jan 2025 10:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737024525; x=1768560525;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YL9Y/ezEnhVGzO3om8+PB8uEhSwNAkWxDejM80lP2gY=;
 b=D1d6AQWN6nDG6WGkEEFx5QLVSQEfrH7Cg8vPQuyu3gNRfflb71hFED+R
 bfY8QEd78bVfCTJCW/SYaTUgUwMf2oyfXmdxnT+GSrfBo6oWVxJJdOsgx
 M98eOkdQhHBnmFASHC9nWoOk0obeaaOLWlgu/zDEWwAA3TK9M8gTBm54C
 du0hjN3vcnVp4JYSsli5RD5pIwrxy0UUtNZZz50uaJWHS/aoKWCieR4tf
 h/Tzll33X1NJ9EIMh4YQUfvXgmoORgAptKp2Ed92IacEmpnOGobh2eFsX
 0GHhykEGL+gfQB+TtysifTAcNx3GDWpqmGFHN7J+KEGUWp28tMeNCAzEM g==;
X-CSE-ConnectionGUID: QJW0lMDLRSON74OM6vlh7Q==
X-CSE-MsgGUID: mXIBWDQZR3iGzMXx3TgkSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37320200"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="37320200"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 02:48:45 -0800
X-CSE-ConnectionGUID: XTefn7fARZmKiU3EPWb4Sw==
X-CSE-MsgGUID: Ep1iIX99Tiqe8AN8oJWtYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="105500421"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 02:48:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 02:48:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 02:48:39 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 02:48:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTJj3lgTCtkdH5fQ4HC4w/3VYDKOVYuRxbLv84Iqy9R8w5NSq9FdRXqKLnJI5HOl6rXgXX+hTPUJ3MHBaGC2NNxi5suCkJts6L5UgdZE3zb50QMSwOchj6SgJGm8cO9+SQx9F1NkLjyhYoYPWodtLT9XSoLSPtcEZnYrJ5i7RqL4uumpzRF7ihj/3CUWJMr6B/mI8Ifs3h3MwLle9ZTm+1GQtDssbREHy/68H1imCVkoWvI++hXvC56asCT/LtjDAsVfx+CnbwGsnqRaX3X98yxk70XPudnjCYFcC8dNBUfyyv66RmJfF6PVBohojMhWY42I/BRqpDqTjRW5piqMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YL9Y/ezEnhVGzO3om8+PB8uEhSwNAkWxDejM80lP2gY=;
 b=ThrKOso/5TlMzbMMCSHTM86xiS7pZYgQXnhw+FHwhINHCzxlFPG66RpsZizli2pnAvPcQ4qR5X9gb9dCmHjM/wGE9x/YSfFvgl5G/lwRmy2v0mBeYKn4/fTyfawWu/cHHotMiitYQjTeuZROXZ6cACKKFjE70LgrcwCtLsN1EJAmDj/9f2eJuYVHxcnYMhqCb7YngtawcLvipBbIUqXr9oOGJjtdW6TVQHD8WHQaXWjqq7rjfX+XKXOFdXWjhN/gxviPFdoU51K+bP6cJjz8gWgN3vcsgwXp/lkPj/eqbF3flCcsR0xKl3tqhaegv7ZWF04SpS50XSNS1VGBBKmNHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 10:48:36 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 10:48:36 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGRybS94ZTogRml4IHNv?=
 =?utf-8?Q?rt_order_of_.o_lists_in_Makefile?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmb3IgZHJtL3hlOiBGaXggc29ydCBv?=
 =?utf-8?Q?rder_of_.o_lists_in_Makefile?=
Thread-Index: AQHbZ2mDwe0FgsvNwkueP8V/Tx02T7MZOc9g
Date: Thu, 16 Jan 2025 10:48:36 +0000
Message-ID: <CH0PR11MB54917C916B3FB5F4E5CC9C49EF1A2@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250115140812.20799-1-gustavo.sousa@intel.com>
 <173695374387.3983181.14187231526385162871@b555e5b46a47>
 <173695805941.3159.1159064316268223503@intel.com>
In-Reply-To: <173695805941.3159.1159064316268223503@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|DS0PR11MB7483:EE_
x-ms-office365-filtering-correlation-id: e4bfc3ee-24b8-4fc3-aef3-08dd361b546e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Yno0Qis2VDJtN0IrSUVFVm9ncStMOVZ1c3NEVm81V2xHTVJ3QWFFa1pnVStY?=
 =?utf-8?B?SXBQZjZWWDFORUVCL0xPUXJkc3c2S3J1a2FwdmpZT05FOXpwNVI2TUd5VFJQ?=
 =?utf-8?B?azJhR2orelpuUUlhWEFWUkpWRnhwY3lDd09GNldqV05oNVNCMWJlWE4xNzJx?=
 =?utf-8?B?c296QWloNjJ4WStWVy8yMnBFd1huVDRSMWtXS05YWFRHRkVraUtGWTBZS0hy?=
 =?utf-8?B?M0wwNCtMUkxEQzE5dkNWcXlQRkVQME9IV0dRTkNZbjRRVWkrOFExUXpFRDMr?=
 =?utf-8?B?UnQrSVJYczRCRUF2SXd0VjJVZENrWFBMYk5EN0NMd0ExNDVBbk16Z0RzR1pt?=
 =?utf-8?B?STVTc3d4cVkyVUlBUXQ3WVJlbW03UFhFaEcxL05FRUljRFltQXVPdWkwT1JL?=
 =?utf-8?B?bkdQVFpnM1lENGFPZmV1Y2Z0djZxc2dKZlBuN2c2MCtGUVg4Y3BacThRNmFq?=
 =?utf-8?B?RmNpZVZldnhIekxuMjFwMXNldzFNZktHNjRZdkdTTlVTeENLa01vSncwWUcz?=
 =?utf-8?B?VzVJNi9meUszUkVESDRYU3J6bVE0UE11SWF4N0tGR1YzaXBjb1liNEdKZU1Q?=
 =?utf-8?B?czE4SEFtb1Z5RXovTWQ1RTF4dHJuQzJSZHlmc2xlS0lHbDVobWxOcm9STmpE?=
 =?utf-8?B?YWpSNmFlSk9JaCtmblgvOEpQaCsxelc2T1hpSFFMN1p3SzEzSlVncmtGV054?=
 =?utf-8?B?QmFIdzdsZ1JZSU1nZDFFRXhSVzBTaE5TcW92angveVBXblJCN2ZJL3JDRFFS?=
 =?utf-8?B?Tnd3SlhsYXNmcFlHdFQwTDFqMkdZRDlxbUxaL3lXY0pNRmpqbXd4Vkl5djdk?=
 =?utf-8?B?Z3EwVGlJVm5UQ2I1VmRIREQvNUxUWU5sNHVrU0xFZ1MzakxmbW5CaldReTB5?=
 =?utf-8?B?eUNJUmJ6NjBENE42dWU0Y2ZaUXlFR2VUTndPYWhNMExMRVNvaG9hbGcwSUE3?=
 =?utf-8?B?aHNUZzFjajJ0K1ZjV3hwVG5kNHB6VGlvZXFqUWROWXdUWExWemUvZFRzRDNX?=
 =?utf-8?B?enE4RXk2ODBUUzRFempPbmxEQVJndGo1bHZJNmFvZUdqMGJSQjh0SUk2UjhM?=
 =?utf-8?B?MGJPU0UxVGRYbHB1MnJ2UytHTU40Y3JRb01hT3QzaXFvNm1kMDM0YXBTZVlU?=
 =?utf-8?B?MEU3TitvM2d4b05OaVd6VjEyejJnTDVNR05KWXhwODFVazVqTXJCR2NpUk1h?=
 =?utf-8?B?bmx4ZVZobk00NTg0ekZCbU1HWDNBcWhla1piZ1FUS01iOXlTLzRGRFUvZEg5?=
 =?utf-8?B?UG5rbkxzaGhVenljSFZndnVrdWs4aUxLZFZqeXRVSWk1cjQxQzlCRDhRNXdE?=
 =?utf-8?B?cnJFT0VQWk43S3hMUU5hTmowNlRTNk8xZXVuSmdsalBxc3VvSHNrYzRXT0dM?=
 =?utf-8?B?MzM1ak9haWR1VCtVc2xRblR1akMzWE0va1VMK0Rla2JZVHhZcHIrS0YvbzdS?=
 =?utf-8?B?bU0zR29jZTZYSmNaT3NqVWJGRmJIcUQ2bXhub1F2Rzl3TkZ6eWNqRFAzaCtp?=
 =?utf-8?B?MnEvdFFIK09lQ0ZyZ3ZnQXlMYUhuaGhpdGFVdWxkTWdhMlVmcGVSbXIrZEwy?=
 =?utf-8?B?K3h0RzRNLzZiZ3oyYmRqWVdLaHdDZXgwVTdycVhPejdDMmxhQmZhcWhBM1d4?=
 =?utf-8?B?eVhYbklra3NFdzFHcWhWSEhhZUM4a20zNHVLb2h2N1RRNU02ZU45TmU3TnBZ?=
 =?utf-8?B?V2lscjR5am9rT0M1cVdLVm1FdVdCRXVHUjNETEFMOVdCSXNEM2JvRm5TTGdM?=
 =?utf-8?B?ZVV6TGpxMWNWR0taaTBaQ0Vob0lqTkhVZkpDNzlyVWhuMzNBY0Jya0FoNUtj?=
 =?utf-8?B?N0Y2V0piN2RtMGlLR05UVHMvRll4Q3FGcFVad0wrQmJmQUFRaWRGM25ZZjBn?=
 =?utf-8?B?dWhQWDJGTitGc2l2SUJYN0xHd20vcjByOFhIMTdKZ1RFMGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SERrdC9OMUVqdzl4aEVEY2tyYkNvQ05Rd0lpZU0vdmhDemE1UGNqanJ6SUE1?=
 =?utf-8?B?QlVBMnhFK1hpNnFiNm9IVG43NDFPbFhHaTN4UjV1Y2dld2ZSdG9mazY1ZzR2?=
 =?utf-8?B?eFN0MFVHQThaQTJ6ZUNZOWV2VW9Dc2ppeU9tSm9pNVFNQVFVUFE5R0xyYkd3?=
 =?utf-8?B?K2NjU1djczFOY294L2tELy9LU3ZUU2FMTlFDbS9BS0M1TUg5OFV0TE1nZ3hH?=
 =?utf-8?B?alhmazllQlMza3VwaGpVSVQ5d1gxZkcxVEtYamNXZHdFdXNrUXQ3cUUzVENV?=
 =?utf-8?B?a0hHUkJBQkIvcjJsOE8xUWloOHgrNjVlMk5na1RzdjVNeXdkYkV2K0lsOHNm?=
 =?utf-8?B?MHNXNERuTHFPRmhuS2JpSVBUeC83U2V5eGRJK1RPNEt4RExzN3FJN1Fpc0tS?=
 =?utf-8?B?ZVA4SzhkcDBsRWhYck5WUUpyYllpMlI0WDE5cGUwUGh3TUd5MHpqT1dKRER1?=
 =?utf-8?B?YURjZGZ3K2ZXaHpvNmZkYVVWSVEzR1l1WVl2eWZpQmJOemp0MlRGL3czdjlo?=
 =?utf-8?B?M1dVMXNjWXdqOHBvTUVSdzZzc1d3T0lpaUhvaGpwWUdmcGdKbEVucitvNjd3?=
 =?utf-8?B?eExLV3Z4YnpXcEpOSzFmaGJhczRhY2g0amRjSktFaXhjcXc0dlRRTDhLTG5L?=
 =?utf-8?B?cWVGOTE1NnJEQVV2YWxYeDNsNmVwLzUzU3U0b1A2RTJ0YkFoU3hXOVI2aFgv?=
 =?utf-8?B?VVg1a3NvSWx6R25hUlZ0R082TWR0YmJHVFRpQW5jWjZyMVExaWxWb0xkcnVt?=
 =?utf-8?B?V1hGKzdDZlZObC9LVnBBVWpwTzI1YU43OURHb3pxL1prTlZrNDZ0N05KNWpR?=
 =?utf-8?B?NlNrMlhEc1JvL2RwUjNkbk5xVElMcFZPZHB5bEtLZ1QrbFYrY3g3b1FDVHNl?=
 =?utf-8?B?cTF2UGl0djlEUVJCdEF3NFZ1ZzVsL2hKY3dwY2dJY1h3SzZRV01oa213RWZP?=
 =?utf-8?B?VEFkYlZFcm5JVUdPdXJ4cDVSMzJTak91SXp4bXZndlNHTzZCRWROcjZZR2h2?=
 =?utf-8?B?SmJIR3BYa2Z2eU9HTXR1NEtDNlRYcXpEZG5xT1VKNlUzMGd6aGJQWG8rSVBP?=
 =?utf-8?B?bllIcExCQjVGdmdwVTE3RzRYRTBnenRrOFBheGVHYjdCc1NpMGVDYzRjMG1y?=
 =?utf-8?B?VEdsWXNZdEdxOVdIZFdLSmFwV3pDSWVDZXRiaW5CdVpOYXNDSEViMThSMTRE?=
 =?utf-8?B?cnFabitSdWZFam0xbTNYV1ZRL0NwSk9zWXFiNTg3SkJmN1BGdVZ1TVZ3UWpp?=
 =?utf-8?B?Sy9VNmorejlSV2FNbXNJLzlVbjNHQWVDemVxNVhydytrY25QVWE1bkxuTjhS?=
 =?utf-8?B?TjFVbllxZUNJallLejNIbTcvdm0vL05TbUpndFIyQ25UaHNXUjZUUGpqdFlM?=
 =?utf-8?B?MXhpYWw5WGNnWEYxU1E0QXYvQk1WeDJGeW8wcEdSTGdBblhVRUtEbXFjQldB?=
 =?utf-8?B?ci9ocWhzek9oeUM1RGs1RGw2WkZwSytqeTRQVmk1VjZhQ3BvUFYvSGxjS2lQ?=
 =?utf-8?B?UFgzWCtWNG5UZFNjMmhaQzBqVTd0SGVQRVIyVUJNbDRIcXQ5czIyZjJGWmxP?=
 =?utf-8?B?bXkxb0NlaW5jWnphOTJyMnBiRzdsWmZKWEVQQ2hMU3dsQTdxaHFHc3RjdGlo?=
 =?utf-8?B?cnJmN2lJM0RlMzRGSVhPV1lhR0VpNFNTRHJsQWJFazJyd1EyYWpLSHVKVUp5?=
 =?utf-8?B?Nm41NXczaHBiOWVMaDRGR0draktVRU9yNXdoSXdtTjFuNjVhMXpSNG8rZ0lr?=
 =?utf-8?B?VmZJQTMxVlhRcStHTVVVSjJ6QzlFb3QxNUltbTd2QnFOeXRtOEFmMDhjalJC?=
 =?utf-8?B?YnZiRFNKTDNFMFRtYy9sOEorRzFXK2RSeUZkckdaYzlQMmM0Z0VKNVJqdjY5?=
 =?utf-8?B?dDdiRVYrZFhTRG95RWZSQnRRWElxUnlCZm5qNHBmM3IyYS9vWkltVVhudWRS?=
 =?utf-8?B?K29McGY5UGkzTmhvMjNhZTBvYm5uUFg3OU83cVZEYXd0RTdQekp3YUhhU2hn?=
 =?utf-8?B?QmdhYVFUeEsxb1pTOWprZ3Q5TnZhU2lLbTNFSWV0dm5qMUVpZzRobVNFSnd1?=
 =?utf-8?B?NlBmcTVaNG93NHNyN0VrMFp1cHQ1T25lMlFLOXJ0Y2VVWDRCQjlEbnNLQi9y?=
 =?utf-8?Q?TAr6c+7NqaPZxTzoj92aJYfyw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4bfc3ee-24b8-4fc3-aef3-08dd361b546e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 10:48:36.4921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8IPkkLqloucn6IrVaVP40v8EFCUFqUme3rQh3Xl0vZfKHjDN7sSaDdiThAYPxkDPFGMeih+gwuK5bHyV93XAAxp5+zsK52m1VrjHfy8IOaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQzNTU3LyAt
IFJlLXJlcG9ydGVkLg0KDQpYZS5DSS5CQVQgLSBBZGRyZXNzZWQgZmFpbHVyZXMsIFhlIGNhbm5v
dCBiZSByZS1yZXBvcnRlZC4NClhlLkNJLkZ1bGwgLSBBZGRyZXNzZWQgZmFpbHVyZXMsIFhlIGNh
bm5vdCBiZSByZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2YWxpLg0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1ib3VuY2Vz
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEd1c3Rhdm8gU291c2ENClNlbnQ6
IDE1IEphbnVhcnkgMjAyNSAyMTo1MQ0KVG86IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBpbnRlbC14ZUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgWGUuQ0kuQkFUOiBmYWlsdXJlIGZv
ciBkcm0veGU6IEZpeCBzb3J0IG9yZGVyIG9mIC5vIGxpc3RzIGluIE1ha2VmaWxlDQoNClF1b3Rp
bmcgUGF0Y2h3b3JrICgyMDI1LTAxLTE1IDEyOjA5OjAzLTAzOjAwKQ0KPj09IFNlcmllcyBEZXRh
aWxzID09DQo+DQo+U2VyaWVzOiBkcm0veGU6IEZpeCBzb3J0IG9yZGVyIG9mIC5vIGxpc3RzIGlu
IE1ha2VmaWxlDQo+VVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2Vy
aWVzLzE0MzU1Ny8NCj5TdGF0ZSA6IGZhaWx1cmUNCj4NCj49PSBTdW1tYXJ5ID09DQo+DQo+Q0kg
QnVnIExvZyAtIGNoYW5nZXMgZnJvbSANCj54ZS0yNDkyLTcyNDAwOTM3ZTc2YzAyYWU2MzQ1ZjBk
ZmE1YTU5OGYwYjI4NGFiMDlfQkFUIC0+IA0KPnhlLXB3LTE0MzU1N3YxX0JBVCA9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+DQo+U3VtbWFyeQ0K
Pi0tLS0tLS0NCj4NCj4gICoqRkFJTFVSRSoqDQo+DQo+ICBTZXJpb3VzIHVua25vd24gY2hhbmdl
cyBjb21pbmcgd2l0aCB4ZS1wdy0xNDM1NTd2MV9CQVQgYWJzb2x1dGVseSANCj4gbmVlZCB0byBi
ZSAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICANCj4gIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQg
Y2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcyAgDQo+IGludHJvZHVj
ZWQgaW4geGUtcHctMTQzNTU3djFfQkFULCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gDQo+
IChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbSAgdG8g
ZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBw
b3NpdGl2ZXMgaW4gQ0kuDQo+DQo+ICANCj4NCj5QYXJ0aWNpcGF0aW5nIGhvc3RzICg5IC0+IDgp
DQo+LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+DQo+ICBNaXNzaW5nICAgICgxKTog
YmF0LWFkbHAtdm0gDQo+DQo+UG9zc2libGUgbmV3IGlzc3Vlcw0KPi0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4NCj4gIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVu
IGludHJvZHVjZWQgaW4geGUtcHctMTQzNTU3djFfQkFUOg0KPg0KPiMjIyBJR1QgY2hhbmdlcyAj
IyMNCj4NCj4jIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4NCj4gICogaWd0QHhlX3Zt
QHNoYXJlZC1wZGUyLXBhZ2U6DQo+ICAgIC0gYmF0LWFkbHAtdmY6ICAgICAgICBbUEFTU11bMV0g
LT4gW0RNRVNHLVdBUk5dWzJdDQo+ICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9pbnRlbC14ZS94ZS0yNDkyLTcyNDAwOTM3ZTc2YzAyYWU2MzQ1ZjBkZmE1YTU5OGYwYjI4
NGFiMDkvYmF0LWFkbHAtdmYvaWd0QHhlX3ZtQHNoYXJlZC1wZGUyLXBhZ2UuaHRtbA0KPiAgIFsy
XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE0
MzU1N3YxL2JhdC1hZGxwLXZmL2kNCj4gZ3RAeGVfdm1Ac2hhcmVkLXBkZTItcGFnZS5odG1sDQoN
CkhpLCBDSSB0ZWFtLg0KDQpUaGlzIGlzIHVucmVsYXRlZCB0byBteSBzZXJpZXMsIHdoaWNoIGNv
bnRhaW5zIG9ubHkgbm9uLWZ1bmN0aW9uYWwgY2hhbmdlcy4gQ291bGQgeW91IHJlLXJlcG9ydCBw
bGVhc2U/DQoNCi0tDQpHdXN0YXZvIFNvdXNhDQo=
