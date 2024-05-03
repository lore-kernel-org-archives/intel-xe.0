Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E216C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 16:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406E41128CB;
	Fri,  3 May 2024 16:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHGx071u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C791128BE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714752698; x=1746288698;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q3YnwXZ7okgDnFnC2lT1OSD8u+dr9/bZq5wMHae8tuI=;
 b=UHGx071uQHU3pot499ZhQgGykpdTsT6lKUpP6WoOJ2UHE8qERZwmlF65
 oMeKfm2EMTUY7rKNzFhJb/4khEXb7Iy2EsFmgdLzP1NI7IABzvMadvc/J
 M433TztILeAsO3j05DDaOZUSBhyjt4oWB1OKOR0KKc1lvwJmkWybMicdh
 GxiaxMecc6n5nY8XnUg1Jvcb6vNqzOorCfd97jTsNR5H9EZmDeDO50qWY
 Ou3NCEAXwTaVIl/8zOwtaRbt5W61MukpfJjcqFyHiZ3NqhYHTqfyeLY2Q
 S3sbeT8l8NeIrRlL7K3I9Tv+mgAJEZDWTHCWYgg81dBx11qYxiXQ0iV6x g==;
X-CSE-ConnectionGUID: MAHk+U29TO2aVYAD4QZezA==
X-CSE-MsgGUID: 93QtW+KaSmq5mQJlX4dCaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10693409"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10693409"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 09:11:37 -0700
X-CSE-ConnectionGUID: N6L8Fd2aSzS3i2jYN83WlQ==
X-CSE-MsgGUID: tZzqb4X+RFu/Qk3cDJvhEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="58397358"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 09:11:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 09:11:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 09:11:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 09:11:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AY8rjFNgtxSmhu/JbYPctgwjyqcnIrFJx4akVtUxel3D3bGPWcpdmqWNQXMB6w9D9+3r6G6z66U2zBBd2gfazNolO7yPrCM8Yg4nSbpbQI5O4BD7rr0ccnLrKb5MJrmPhTredckaQ9JoQ1dtdms6x5t9ywyGgeervKuRa1xHPi+wbWW8LkiFTwCBSo6lXBIcEGOBYLiY+698XL5S/+dTu73sq5TxBDJ4+5JmIpIJJzerpZjQsetpljyyavay3Ok3Ki7rsfmYE2bgRXW7UVsqyc2u2NKAi6AdRHG3YT/+SH+Mrr9Jp4ZXIY2UBJyR5THNYHzGfW3gt26Qdki+hvRFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3YnwXZ7okgDnFnC2lT1OSD8u+dr9/bZq5wMHae8tuI=;
 b=OH/WUMqsLUUL/VYgDzMVnUtxriYTSjNlBh/whTdDAlm4UJeyEmv/7Kwv00rSi0leIDFISO+enbIwe7uWU5qaxumNoYNLiYGG8qtPlJpmCRRQegxAYQnmnG7mfbzZp6WTo/zFocThCVscQV4fLdRVNMnpH77k4zCTaqooAaMT9OVnpvEtbFXqIxmaGUZLzvy+j5ZXKOEpmg2fPkTT1RD43DSC5/2CBggAGOa3pgchAWbJXLtzTYuYaV9ap0pXxlNzV2CaHVOJckd8tFet1MM1+2Hcu41YqyGKB5oWOzqYsPS0bcgwaVk6Jm90spVHwsF7t0eGiSdKYfQE8hFAOQOEmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.34; Fri, 3 May
 2024 16:11:32 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.021; Fri, 3 May 2024
 16:11:32 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Mrozek, Michal" <michal.mrozek@intel.com>
Subject: RE: [PATCH v6 5/5] drm/xe: Refactor default device atomic settings
Thread-Topic: [PATCH v6 5/5] drm/xe: Refactor default device atomic settings
Thread-Index: AQHamx0r/PJ+fkeWPk6os7FjzfsMILGFoiBggAANzICAAAI8gA==
Date: Fri, 3 May 2024 16:11:32 +0000
Message-ID: <SA1PR11MB699133227DCB28AFB23C72D9921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240430162529.21588-1-nirmoy.das@intel.com>
 <20240430162529.21588-6-nirmoy.das@intel.com>
 <SA1PR11MB6991BF7C2848F2FEE0D0F0CE921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <fb91cdda-f59e-4aa8-a9d4-bee6d8f30154@intel.com>
In-Reply-To: <fb91cdda-f59e-4aa8-a9d4-bee6d8f30154@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA3PR11MB7625:EE_
x-ms-office365-filtering-correlation-id: 149c5e71-eb56-4d04-07c5-08dc6b8bb2d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?NWY3N0k5akt6YXprTUhrVWw3cDc1M0hmMENXUG51b3hsdHlGSmVNaXB4cG5Q?=
 =?utf-8?B?L25HMXdCOWYyN3VqY3g0bmR0WTBOR3dJZnNLYnBtWGd4QzV3VmJOMGljaHc1?=
 =?utf-8?B?L3NtU1A4aXBSdlRZeC9rRmtoQ25mMnYzRnY0MzlDT3RnTGNkY1V4TWJ0RHJu?=
 =?utf-8?B?REI3WUhzYytzL1I0WGJOSkFDZkVsSUtIVnRROE85WlB4U1UxTDNDTWxLbW1O?=
 =?utf-8?B?a2R2YWpEUlNzaUFtSU8vNjBnQ3hqaHZGQm1qeTZsSzNDZDFiTWg5bVBTT3FF?=
 =?utf-8?B?dUZraXFrMGZhUkJwZ2UrNEkvU0tYY3RlQkQ4Mm1iL2pMWHdsMklPL3EwK3pj?=
 =?utf-8?B?WGlHSm5jQjFuM1VnWUdXT205TXhXcjB1WEwyWmZnQzdBMTU1TVAycllYb0VL?=
 =?utf-8?B?cXI5cGdjUnRnOGJmWTRtejVhTmRqRGx5L1ZuK3MwTVpsTm1rbHp4NTA0dStX?=
 =?utf-8?B?dWpkdHJjUVpVZjhyNmVyOWJTcUxwN05OdkhYSllISmo4OUprdzUxTFhROUMv?=
 =?utf-8?B?MTVRRlNKL3JFTE1pVGlNaElpSWhJVzM4NjRDeHBuS2hNN3NpcEl5OVgzWVRw?=
 =?utf-8?B?THcvT1NqSW94Yk9jYWU3T2JMdlN0NFp4eG9qWE11Ylp0YTIrdm9PQ1g0c3Fi?=
 =?utf-8?B?NWhheWJGNm0xYnV1dUtxMWpBREUyQ3dsTzVmd1ZvZEJHMG5CbHcyVTQ0WUhs?=
 =?utf-8?B?K2JpOFVaOHk5alVNTCtmeU4vTUpFUW5yMk5KMEFLQjhWYXJJemtKYThCRFhO?=
 =?utf-8?B?eEgwaTBjVUlXbXB1TVFHa2Rhc0UrR3NlWFdockpXYXp1ZktjWHBlRkg5R0dZ?=
 =?utf-8?B?WXJvNnhFQkx2RElXRW0rc2hNZzd0SE00ZWNwMXZEcDFQRHNvREVvS2FNMkhJ?=
 =?utf-8?B?TXdjeWhyMWcvZ0s5bU8zYjZJayt2eFpJUkJaNkZHOHZkRmNTZEhVeEJjODhD?=
 =?utf-8?B?a1ltZVFPRlIweSsvdDYyTDhyTEE3bWxEZ1hTbWVEV25zZWY3cEIvYjJFMHJM?=
 =?utf-8?B?OVovSjNpcWdDSGF3bkI0eXcvSTFMa2UvTndPNENqNUNIeGUyazlSaWgydkJE?=
 =?utf-8?B?YlRKQndUVSs2YkRkdUNRenZUVGdpbFJURGllWUJYdVliUlZtMmY4N3N6QmVh?=
 =?utf-8?B?d1RJTjRnMU80cHVYUU1ZdVJ3NGZEdGRMUGZUN3VSYzVTZ2RjWGMrR09RUmw0?=
 =?utf-8?B?OFByRklmQWQ3NlBJalhSQXQvZnFwY1Q2V0drd0owejJFeGJUOFlWYk1XNmwv?=
 =?utf-8?B?RjRCUm5ua0R6YWtGc3RmN00xYjBGWjREb2FvSks2SEVkZlRUZlozWWlzdWlJ?=
 =?utf-8?B?aUV1a3B5ZGhMZGtsUVlPN2pTcXNET0dHbytqbHkwR0cyTWdNUHVYaGtCMzFS?=
 =?utf-8?B?endEUE9pYUM2dklRaXcxeXZ3L3BQTkl2d3VaMFlBQXFldUxxdWViM1hXTWVY?=
 =?utf-8?B?ZkFoOUZGcWNmcGxld3N3QXAraHVKdkplTTVJY0t6ZWNQKzBRNUFtMzJDV1Va?=
 =?utf-8?B?QUxxSkhhUmg4RHQ5YUptSFhwVHA1dVMzcHQva2pkbnVEZ2xqeU80T1BOK2JJ?=
 =?utf-8?B?a2pRbCtkSzhWY0tVb1cyRjZmM011Q3ZYOFA5RmE2YlhjTnZJRGRFSnlCa2R2?=
 =?utf-8?B?REdodDE1ZWZBdEQxL3ZQNTBBNGR0ejl3blpKSGJHMzRJTTlhcjB3V1U2MHUw?=
 =?utf-8?B?SlFtYnFCcnF2cmNXVEcvL0hDdGp0aTNXNWZSSTVoR2d4QURCcjd4SWFRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlRkSXBoSXE0cTBPSzVSMWJBWi9HMDNkRkxpVXNBSFNmUzd4UjV0cFowTGlv?=
 =?utf-8?B?bUhwUGdJdWljeWRtdlltU0NKTCtkdkFPVWt3Rlc3TzJwbFc4ZzdiQ1VMQVJL?=
 =?utf-8?B?T0oyWWM5K3o5bXRYQlZINUJDVENma1M3bUFJeVh5S2hzcFpSUGNKc2ZkT1ZJ?=
 =?utf-8?B?cmRGN2JkOHdwSDB3Y0JxTVZhaHdkWGRMcEU5VGVMNDlOWEthZTFJZ0NQczl0?=
 =?utf-8?B?c1lsVE9MeTB6N2NVcGZlN0taZjJOTk1ZRWtRdUFkT3R0YmV3c2NVTHE4N1h3?=
 =?utf-8?B?aEFYRFVyNkRBMlhkdnhteWFkSTRIVnpiNUVxV2JGU25tQVMyRzRVSzZaYzhI?=
 =?utf-8?B?TnFid2htYUpiUlRrRklBU3NFREtKUE4yVzhQdmFpM1djayt2dHVsUWNxWVE2?=
 =?utf-8?B?TEFJQmJOdDlSeFJmZk1oeE1YT1dOVWh6eDRtM1gyTGo1TFhqQlFZUkRqeHpj?=
 =?utf-8?B?RmZHVDl5dWI5VmtnY00ra3RjS0FVMXh4eGlia0NCakNwblovUHBkc0lUbnZ4?=
 =?utf-8?B?cmtybStTaWVvVnp4bmRrOWZJV2s1aW56dFpxVnNMbTdqMzJqdzlWYmlEOXNo?=
 =?utf-8?B?bWlaTlJubDVtN0xzRWFlNVo4ODl1YUxWczBta2phcVpRR3dIc05zTm8rbm9o?=
 =?utf-8?B?eEFVcVpmblh4VnVqNm9WdGpJMnVvUVhCZERBMXUvTFlrR0VML0Q0SmdOUmlT?=
 =?utf-8?B?UWxKRWRRNUVYKzh1WVRTWnBqd1p5ZDdjbExzS3JCdzdVZW0xQUw5bWY0alF1?=
 =?utf-8?B?YUYybUxMZkQvQUtkTDV0ZExLR0I2YUxhVDY4MWllek5STjJXR3BHRWFpbFhH?=
 =?utf-8?B?dVBmUXgzZmlKWVdVVWRNY2VEeDZOWDlYY3VLMXgvOVhhWUpLOS9xOWg4Y2hn?=
 =?utf-8?B?enh3aFdoUUN5Nk0vK2MwL0REeE16ajYveDE1U3JoMEMybDYxTnR4SUJUNk5X?=
 =?utf-8?B?UzRoeThhdTJXTDYralJZSS95L0VDNm5FV3cwQUk0ZWw3UGFuZ2ZKNDNzWlQw?=
 =?utf-8?B?WnJxNGFlUTJwaFBEUVhBTGJPTE1PZkp0M3Y5bGZBQVU3WUtaSWIzbWFZNFAr?=
 =?utf-8?B?TXl0Z1RTZFp1RjBraTlDcUtFQkJSVWpMV0htYUliOGRia1lVVHhXelp1T0ZQ?=
 =?utf-8?B?UlR6czB3eUo1VnRmc0xFcnAzYllYY0lSREFjaFNtSEJZWktaMW1QQnpIRnlJ?=
 =?utf-8?B?TnZNUkM0U3o5Z2JXT1pOTjNXaDVsQjdyL1FSOU5sdjl6djJFdUQwc0VDazJL?=
 =?utf-8?B?WEJJdUYwaWlSWFBaK3ZaMmJhMlF5VXo0cTd1TmttVVZIZTdVbXBCelREMndj?=
 =?utf-8?B?d3NQQWVIQmo2NTRSZmJBZjcySzNWeGNLWHlDTFp3NnJkMG5vQlBXdUVnWXd4?=
 =?utf-8?B?ckxHcDZUOHpnYVlHQjNXYmc4d2ptSDRKeEdxczZWaEFMbStxM1YwU2J4NVJH?=
 =?utf-8?B?RVdmOFdwVGp2NVI2NFN5YTRMR0RPTmxjR04xNjU2OXMycDNYekhRL2VJWitM?=
 =?utf-8?B?NDl4a2Q2eUl3ZW1FK0IrcXBJVzFRSmcxbHlheW1SMGpzM3g4Z1RnZ2E3WllC?=
 =?utf-8?B?VGlyOE5xeTdlQldGUlhkMG9SVUJadlYzSEFsU2trQmZRNEtIVGNQdjYzbDZm?=
 =?utf-8?B?d01reGt0MXh5YjJVM3VLRzJ4YWpYM1BlcmF5aUM5WTl0T29ZQXlsN3FjMFNw?=
 =?utf-8?B?NlBJdDRmMlpibXV5VDBiMlQvK1RPMlpPUjJTSjNEK01md3lCU1BGam1WYkZu?=
 =?utf-8?B?MzIwK002bWt4L3FGVjlkTjFIMVg0Q3NDN0NubGZtbGU4NU1VamFDTkZ1RXpB?=
 =?utf-8?B?QzUvYm1LY0g0TXRFbUFIZGVPN2t0NlVTT0MzUU1veURMU1BNc25iZjFkQ05i?=
 =?utf-8?B?dXFYZTVEYjI5TmVoRUw5eGRldXB6TmYwMjErL0dqU0UycXpGVDRmSjN5S0hy?=
 =?utf-8?B?T2FVUjR1Q3l5aUZyRTdRVUNjMGk2T1M1RFBSMURqclp0Ti9yNFA1V3FMSEp2?=
 =?utf-8?B?ZTYwMHlGZXp0MXlscEFqQTNIc1R2TFZtVm50dVBHVG5UcEpkQkgwWGlmM1Ex?=
 =?utf-8?B?alZQQ0M1VmgwaExsKzRrNUhZWDVkdkxnMGtyU1ZxdGZIVU92dGl2QVhPdlBh?=
 =?utf-8?Q?1TEk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 149c5e71-eb56-4d04-07c5-08dc6b8bb2d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 16:11:32.4728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OJWpmuL0qw307VGWN/j/QDD2lwSynZJpOpZKJyHl58b32Th26widHA1KCv2yaAIyFHO6n319fB3cwo7RKClC9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7625
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFzLCBOaXJtb3kgPG5p
cm1veS5kYXNAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE1heSAzLCAyMDI0IDEyOjAxIFBN
DQo+IFRvOiBaZW5nLCBPYWsgPG9hay56ZW5nQGludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBDYzogTXJvemVrLCBNaWNoYWwgPG1pY2hhbC5tcm96ZWtAaW50ZWwu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDUvNV0gZHJtL3hlOiBSZWZhY3RvciBkZWZh
dWx0IGRldmljZSBhdG9taWMgc2V0dGluZ3MNCj4gDQo+IEhpIE9haywNCj4gDQo+IE9uIDUvMy8y
MDI0IDU6MzkgUE0sIFplbmcsIE9hayB3cm90ZToNCj4gPiBIaSwgTmlybW95LA0KPiA+DQo+ID4+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEludGVsLXhlIDxpbnRlbC14
ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+ID4+IE5pcm1v
eSBEYXMNCj4gPj4gU2VudDogVHVlc2RheSwgQXByaWwgMzAsIDIwMjQgMTI6MjUgUE0NCj4gPj4g
VG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+PiBDYzogRGFzLCBOaXJtb3kg
PG5pcm1veS5kYXNAaW50ZWwuY29tPjsgTXJvemVrLCBNaWNoYWwNCj4gPj4gPG1pY2hhbC5tcm96
ZWtAaW50ZWwuY29tPg0KPiA+PiBTdWJqZWN0OiBbUEFUQ0ggdjYgNS81XSBkcm0veGU6IFJlZmFj
dG9yIGRlZmF1bHQgZGV2aWNlIGF0b21pYyBzZXR0aW5ncw0KPiA+Pg0KPiA+PiBUaGUgZGVmYXVs
dCBiZWhhdmlvciBvZiBkZXZpY2UgYXRvbWljcyBkZXBlbmRzIG9uIHRoZQ0KPiA+PiBWTSB0eXBl
IGFuZCBidWZmZXIgYWxsb2NhdGlvbiB0eXBlcy4gRGV2aWNlIGF0b21pY3MgYXJlDQo+ID4+IGV4
cGVjdGVkIHRvIGZ1bmN0aW9uIHdpdGggYWxsIHR5cGVzIG9mIGFsbG9jYXRpb25zIGZvcg0KPiA+
PiB0cmFkaXRpb25hbCBhcHBsaWNhdGlvbnMvQVBJcy4gQWRkaXRpb25hbGx5LCBpbiBjb21wdXRl
L1NWTQ0KPiA+PiBBUEkgc2NlbmFyaW9zIHdpdGggZmF1bHQgbW9kZSBvciBMUiBtb2RlIFZNcywg
ZGV2aWNlIGF0b21pY3MNCj4gPj4gbXVzdCB3b3JrIHdpdGggc2luZ2xlLXJlZ2lvbiBhbGxvY2F0
aW9ucy4gSW4gYWxsIG90aGVyIGNhc2VzDQo+ID4+IGRldmljZSBhdG9taWNzIHNob3VsZCBiZSBk
aXNhYmxlZCBieSBkZWZhdWx0IGFsc28gb24gcGxhdGZvcm1zDQo+ID4+IHdoZXJlIHdlIGtub3cg
ZGV2aWNlIGF0b21pY3MgZG9lc24ndCBvbiB3b3JrIG9uIHBhcnRpY3VsYXINCj4gPj4gYWxsb2Nh
dGlvbnMgdHlwZXMuDQo+ID4+DQo+ID4+IHYzOiBmYXVsdCBtb2RlIHJlcXVpcmVzIExSIG1vZGUg
c28gb25seSBjaGVjayBmb3IgTFIgbW9kZQ0KPiA+PiAgICAgIHRvIGRldGVybWluZSBjb21wdXRl
IEFQSShKb3NlKS4NCj4gPj4gICAgICBIYW5kbGUgU01FTStMTUVNIEJPJ3MgbWlncmF0aW9uIHRv
IExNRU0gd2hlcmUgZGV2aWNlDQo+ID4+ICAgICAgYXRvbWljcyBpcyBleHBlY3RlZCB0byB3b3Jr
LiAoQnJpYW4pLg0KPiA+PiB2MjogRml4IHBsYXRmb3JtIGNoZWNrcyB0byBjb3JyZWN0IGF0b21p
Y3MgYmVoYXZpb3VyIG9uIFBWQy4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogTmlybW95IERh
cyA8bmlybW95LmRhc0BpbnRlbC5jb20+DQo+ID4+IEFja2VkLWJ5OiBNaWNoYWwgTXJvemVrIDxt
aWNoYWwubXJvemVrQGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3B0LmMgfCAzNw0KPiA+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgfCAgMiArLQ0KPiA+PiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPj4NCj4g
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3B0LmMNCj4gPj4gaW5kZXggOGQzNzY1ZDMzNTFlLi44Nzk3NWU0NTYyMmEgMTAw
NjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+ID4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+ID4+IEBAIC02MTksOSArNjE5LDQwIEBAIHhlX3B0
X3N0YWdlX2JpbmQoc3RydWN0IHhlX3RpbGUgKnRpbGUsIHN0cnVjdA0KPiB4ZV92bWENCj4gPj4g
KnZtYSwNCj4gPj4gICAJc3RydWN0IHhlX3B0ICpwdCA9IHhlX3ZtYV92bSh2bWEpLT5wdF9yb290
W3RpbGUtPmlkXTsNCj4gPj4gICAJaW50IHJldDsNCj4gPj4NCj4gPj4gLQlpZiAoKHZtYS0+Z3B1
dmEuZmxhZ3MgJiBYRV9WTUFfQVRPTUlDX1BURV9CSVQpICYmDQo+ID4+IC0JICAgIChpc19kZXZt
ZW0gfHwgIUlTX0RHRlgoeGUpKSkNCj4gPj4gLQkJeGVfd2Fsay5kZWZhdWx0X3B0ZSB8PSBYRV9V
U01fUFBHVFRfUFRFX0FFOw0KPiA+IEkgdGhpbmsgYmVsb3cgbG9naWMgY2FuIGJlIG1vdmVkIHRv
IGEgc2VwYXJhdGUgZnVuY3Rpb24/IEkgYW0gYWxzbyBnb29kIGlmDQo+IHlvdSBsZWF2ZSBpdCBh
cyBiZWxvdy4gQnV0IEkgdGhpbmsgYSBzZXBhcmF0ZSBmdW5jdGlvbiBpcyBiZXR0ZXINCj4gSSB3
YXMgdGhpbmtpbmcgYWJvdXQgYnV0IEkgdGhpbmsgd2Ugc2hvdWxkIGRvIHRoYXQsIG9uY2UgaXQg
Z2V0cyBtb3JlDQo+IGNvbXBsaWNhdGVkIHdpdGggbWFkdmlzZS1saWtlIG9wdGlvbnMuDQo+ID4N
Cj4gPg0KPiA+PiArCS8qKg0KPiA+PiArCSAqIERlZmF1bHQgYXRvbWljIGV4cGVjdGF0aW9ucyBm
b3IgZGlmZmVyZW50IGFsbG9jYXRpb24gc2NlbmFyaW9zIGFyZQ0KPiA+PiBhcyBmb2xsb3dzOg0K
PiA+PiArCSAqDQo+ID4+ICsJICogMS4gVHJhZGl0aW9uYWwgQVBJOiBXaGVuIHRoZSBWTSBpcyBu
b3QgaW4gTFIgbW9kZToNCj4gPj4gKwkgKiAgICAtIERldmljZSBhdG9taWNzIGFyZSBleHBlY3Rl
ZCB0byBmdW5jdGlvbiB3aXRoIGFsbCBhbGxvY2F0aW9ucy4NCj4gPj4gKwkgKg0KPiA+PiArCSAq
IDIuIENvbXB1dGUvU1ZNIEFQSTogV2hlbiB0aGUgVk0gaXMgaW4gTFIgbW9kZToNCj4gPj4gKwkg
KiAgICAtIERldmljZSBhdG9taWNzIGFyZSB0aGUgZGVmYXVsdCBiZWhhdmlvciB3aGVuIHRoZSBi
byBpcyBwbGFjZWQNCj4gPj4gaW4gYSBzaW5nbGUgcmVnaW9uLg0KPiA+PiArCSAqICAgIC0gSW4g
YWxsIG90aGVyIGNhc2VzIGRldmljZSBhdG9taWNzIHdpbGwgYmUgZGlzYWJsZWQgd2l0aCBBRT0w
IHVudGlsDQo+ID4+IGFuIGFwcGxpY2F0aW9uDQo+ID4+ICsJICogICAgICByZXF1ZXN0IGRpZmZl
cmVudGx5IHVzaW5nIGEgaW9jdGwgbGlrZSBtYWR2aXNlLg0KPiA+PiArCSAqLw0KPiA+PiArCWlm
ICh2bWEtPmdwdXZhLmZsYWdzICYgWEVfVk1BX0FUT01JQ19QVEVfQklUKSB7DQo+ID4+ICsJCWlm
ICh4ZV92bV9pbl9scl9tb2RlKHhlX3ZtYV92bSh2bWEpKSkgew0KPiA+PiArCQkJaWYgKGJvICYm
IHhlX2JvX2hhc19zaW5nbGVfcGxhY2VtZW50KGJvKSkNCj4gPj4gKwkJCQl4ZV93YWxrLmRlZmF1
bHRfcHRlIHw9DQo+ID4+IFhFX1VTTV9QUEdUVF9QVEVfQUU7DQo+ID4+ICsJCQkvKioNCj4gPj4g
KwkJCSAqIElmIGEgU01FTStMTUVNIGFsbG9jYXRpb24gaXMgYmFja2VkIGJ5IFNNRU0sIGENCj4g
Pj4gZGV2aWNlDQo+ID4+ICsJCQkgKiBhdG9taWNzIHdpbGwgY2F1c2UgYSBncHUgcGFnZSBmYXVs
dCBhbmQgd2hpY2ggdGhlbg0KPiA+PiArCQkJICogZ2V0cyBtaWdyYXRlZCB0byBMTUVNLCBiaW5k
IHN1Y2ggYWxsb2NhdGlvbnMgd2l0aA0KPiA+PiArCQkJICogZGV2aWNlIGF0b21pY3MgZW5hYmxl
ZC4NCj4gPj4gKwkJCSAqLw0KPiA+PiArCQkJZWxzZSBpZiAoaXNfZGV2bWVtDQo+ID4+ICYmICF4
ZV9ib19oYXNfc2luZ2xlX3BsYWNlbWVudChibykpDQo+ID4NCj4gPiBOb3RlIGJvIGNvdWxkIGJl
IE5VTEwgaGVyZS4uLg0KPiANCj4gaXNfZGV2bWVtIGNoZWNrcyBibyB0aGF0IHNvIEkgbGVmdCBp
dCBvdXQuDQo+IA0KPiA+DQo+ID4gU28gdXNlcnB0ciBhbmQgc3lzdGVtIGFsbG9jYXRvciBkb24n
dCBoYXZlIGEgYm8NCj4gPg0KPiA+IFVzZXJwdHIgY2FuJ3QgcnVuIGludG8gdGhpcyBjYXNlIGJl
Y2F1c2UgdXNlcnB0ciBjYW4ndCBiZSBpc19kZXZtZW0NCj4gPg0KPiA+IFN5c3RlbSBhbGxvY2F0
b3IgYWxsb2NhdGVkIG1lbW9yeSBjYW4gaGF2ZSBkZXZtZW0gYmFja2luZyBzdG9yZS4uLiBzbw0K
PiBzZWVtcyB0aGUgbG9naWMgY2FuIGJlOg0KPiA+DQo+ID4gKElzX2Rldm1lbSAmJiAoKGJvICYm
ICFzaW5nbGVfcGxhY2VtZW50KSB8fCAhYm8pDQo+ID4NCj4gPiBCdXQgd2UgZG9uJ3QgaGF2ZSBz
eXN0ZW0gYWxsb2NhdG9yIGZvciBub3csIHNvIHlvdXIgbG9naWMgc2hvdWxkIHdvcmsgZm9yDQo+
IHRoZSBjdXJyZW50IGNvZGUuDQo+IA0KPiBZZXMsIGRlZmF1bHQgZm9yIHVzZXJwdHIgaXMgQUU9
MCBoZW5jZSBJIGxlZnQgaXQgc28gYW5kIHBsYW5uaW5nIHRvDQo+IGNoYW5nZSB0aGF0IHdoZW4g
d2UgaGF2ZSBtYWR2aXNlLWxpa2UgaW9jdGwuDQoNCk5vdCBvbmx5IG1hZHZpc2UNCg0KV2hhdCBp
cyBpbiBteSBtaW5kIGZvciBzeXN0ZW0gYWxsb2NhdG9yIGlzIGhlcmU6IGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC81ODg1MzQvP3Nlcmllcz0xMzIyMjkmcmV2PTENCg0K
DQpBcyB5b3UgY2FuIHNlZSwgdGhlcmUgaXMgYSBjYXNlIHdoZXJlIHhlX3ZtYV9pc19kZXZtZW0g
cmV0dXJucyB0cnVlIHdoaWxlICFiby4NCg0KQW55d2F5LCB0aGUgY29kZSBzZWVtcyBnb29kIGFz
IG9mIG5vdy4NCg0KT2FrDQoNCg0KPiANCj4gDQo+ID4gICBJZiB5b3Ugd3JpdGUgYXMgYWJvdmUs
IHRoZW4gaXQgaXMgZnV0dXJlIHByb29mZWQuIEkgYW0gb2theSB3aXRoIHlvdXINCj4gY3VycmVu
dCB3cml0aW5nIGFsc28gLSBJIGp1c3QgbmVlZCB0byBjaGFuZ2UgaXQgYSBsaXR0bGUgd2hlbiBz
eXN0ZW0gYWxsb2NhdG9yDQo+IGNvbWUgaW50byBwaWN0dXJlLi4uLg0KPiA+DQo+ID4gSSBkbyBm
ZWVsIHRoZSBsb2dpYyBoZXJlIGlzIGdldHRpbmcgY29tcGxpY2F0ZWQsIGhhcmQgZm9yIHVuZGVy
c3RhbmRpbmcgYW5kDQo+IG1haW50ZW5hbmNlLiBMZXQncyBmb2xsb3cgdXAgdGhlIG90aGVyIGVt
YWlsIHRocmVhZCB0byBzZWUgd2hldGhlciB3ZSBjYW4NCj4gc2ltcGx5IGRlZmF1bHQgYWxsIGFs
bG9jYXRpb24gdG8gYmUgTk9fQVRPTUlDLCBhbmQgZGVwZW5kcyBvbiBjb21waWxlciBhbmQNCj4g
VU1EIHRvIHNldCBhdG9taWNzIHVwLg0KPiANCj4gSSB3aWxsIGtlZXAgdHJhY2sgb2YgdGhhdC4N
Cj4gDQo+IA0KPiA+DQo+ID4gQXMgb2Ygbm93LCBQYXRjaCBpczoNCj4gPg0KPiA+IFJldmlld2Vk
LWJ5OiBPYWsgWmVuZyA8b2FrLnplbmdAaW50ZWwuY29tPg0KPiANCj4gDQo+IFRoYW5rcyBhIGxv
dC4NCj4gDQo+IE5pcm1veQ0KPiANCj4gPg0KPiA+PiArCQkJCXhlX3dhbGsuZGVmYXVsdF9wdGUg
fD0NCj4gPj4gWEVfVVNNX1BQR1RUX1BURV9BRTsNCj4gPj4gKwkJfSBlbHNlIHsNCj4gPj4gKwkJ
CXhlX3dhbGsuZGVmYXVsdF9wdGUgfD0gWEVfVVNNX1BQR1RUX1BURV9BRTsNCj4gPj4gKwkJfQ0K
PiA+PiArDQo+ID4+ICsJCS8qKg0KPiA+PiArCQkgKiBVbnNldCBBRSBpZiB0aGUgcGxhdGZvcm0o
UFZDKSBkb2Vzbid0IHN1cHBvcnQgaXQgb24gYW4NCj4gPj4gKwkJICogYWxsb2NhdGlvbg0KPiA+
PiArCQkgKi8NCj4gPj4gKwkJaWYgKCF4ZS0+aW5mby5oYXNfZGV2aWNlX2F0b21pY3Nfb25fc21l
bSAmJiAhaXNfZGV2bWVtKQ0KPiA+PiArCQkJeGVfd2Fsay5kZWZhdWx0X3B0ZSAmPSB+WEVfVVNN
X1BQR1RUX1BURV9BRTsNCj4gPj4gKwl9DQo+ID4+DQo+ID4+ICAgCWlmIChpc19kZXZtZW0pIHsN
Cj4gPj4gICAJCXhlX3dhbGsuZGVmYXVsdF9wdGUgfD0gWEVfUFBHVFRfUFRFX0RNOw0KPiA+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdm0uYw0KPiA+PiBpbmRleCBmMTM1N2UyYTNiMTAuLmQxNzE5MmM4YjdkZSAxMDA2NDQN
Cj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPj4gQEAgLTg4OCw3ICs4ODgsNyBAQCBzdGF0aWMgc3Ry
dWN0IHhlX3ZtYSAqeGVfdm1hX2NyZWF0ZShzdHJ1Y3QNCj4geGVfdm0NCj4gPj4gKnZtLA0KPiA+
PiAgIAlmb3JfZWFjaF90aWxlKHRpbGUsIHZtLT54ZSwgaWQpDQo+ID4+ICAgCQl2bWEtPnRpbGVf
bWFzayB8PSAweDEgPDwgaWQ7DQo+ID4+DQo+ID4+IC0JaWYgKEdSQVBISUNTX1ZFUih2bS0+eGUp
ID49IDIwIHx8IHZtLT54ZS0+aW5mby5wbGF0Zm9ybSA9PQ0KPiA+PiBYRV9QVkMpDQo+ID4+ICsJ
aWYgKHZtLT54ZS0+aW5mby5oYXNfYXRvbWljX2VuYWJsZV9wdGVfYml0KQ0KPiA+PiAgIAkJdm1h
LT5ncHV2YS5mbGFncyB8PSBYRV9WTUFfQVRPTUlDX1BURV9CSVQ7DQo+ID4+DQo+ID4+ICAgCXZt
YS0+cGF0X2luZGV4ID0gcGF0X2luZGV4Ow0KPiA+PiAtLQ0KPiA+PiAyLjQyLjANCg==
