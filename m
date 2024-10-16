Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFCAD20696
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 03:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD6B10E0A1;
	Wed, 16 Oct 2024 03:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXiAPgiA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB4710E0A1
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 03:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729050277; x=1760586277;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OKUik8CQreLgr+dUcRQRF9T5G6ecLloTwDs7Dqh1iYg=;
 b=IXiAPgiAO1cZmVatKAilSoBeq2ASTVoMSegn8WhG1jcU1s3OMTaKERPm
 77G1zd6fFreltjf1Ud7bn0nsvrcdSXGjFbaiF9JHA5JWTxp03X3ozcAfT
 vaLUwT7orn4Zge1Q0OYFEBL4pr3SAFhY1Y+FNWXnsnADX49gMADNUX0Do
 sCq4pZJrbesw4H6gffSBhx73KVm9oHZ/7WcCwLdlx4OAf6bkFX/x24MqP
 YFn/be3NXs+xDxOrOQWayVKPGHEXagSlOseWva0r1B37bOcrT3K/4STEw
 DBNh5yCclM/USq8fRmEhxIUkVa0wMhXwUb4N/4lhgzTZvqcChd+OAK4hP Q==;
X-CSE-ConnectionGUID: e4VoSk2NRvW52+HWfUzzDQ==
X-CSE-MsgGUID: GvPu2DWoSSWevM+/353Stw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27918882"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="27918882"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:44:36 -0700
X-CSE-ConnectionGUID: ux6/fy5OS5u0bpWkroicAA==
X-CSE-MsgGUID: GfWFj4AJQRCqJW7cOV8AEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="115534260"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 20:44:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 20:44:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 20:44:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 20:44:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 20:44:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQr9Zy4x+Q5JIKURNRpdxpUP8uiX6fWnDiWnGz6oWYzVE5dBYRkzbmGqKDQ22hFLtrHxNAbeiHZ28KXpFQEp0eD4ta3Vq1zMP2oOf9QMGymPCXfKYxvmtrViwJIUwI2s4UJmf/Rp3bOnvrc7Mzd3xJ9I3EWxPrDUgwUBMRw4fmeihNTzu4+lAinZSek2BGtw7Ewi1SL5m1DXiNy59cSi3iMMQzk01wbac7zI7vlHnpZFFkwfPMoMm81Q3nmi51TqmjRKX8MZS1zkC380LuoDb7WOXzKrvOzoUlZAjufl4ZXjeXw2G/z+NvtodL3arIwaN6uqpnUqAFI+UpYO3tEz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+lSUg88meGLzKki2SLsxiC7x9fSf5tvXkULgdzhMUw=;
 b=m/l47XCkqHid2RaQJnaQhfagJ0LTLf5R9qBkOBJZ3E9LdiyVGGSIkB74SETAnj3Ne6dJzKgJALHcBy5elrgnh9d81DWfU5RGji5uA1FOX9GCV6Q5dJjsYTcHP7D2o9Sr47te4Og5xTUPh4ZuHcq+KBckWJ7/Jtfn8htNyPO7it8XkBwhSkaeoDSwOx5YttMVkCV9++92nm3sm+Bch6vQ3onUCl5F79I2SE6qUE+UsDBnDdamMSjng0RmbU2wJpJEvHRLnqJQ2lYykk3eiRJ4jUzhOr3TnL+VOyiGf9SmdHdpkHvWueeU9+EWh+8wNk9opK3wj1oOfaMqnHyc+HErBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by MN0PR11MB6253.namprd11.prod.outlook.com (2603:10b6:208:3c6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 03:44:32 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%5]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 03:44:32 +0000
Date: Tue, 15 Oct 2024 20:44:30 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <james.ausmus@intel.com>,
 <felix.j.degrood@intel.com>, <jose.souza@intel.com>,
 <matias.a.cabral@intel.com>, <joshua.santosh.ranjan@intel.com>,
 <shubham.kumar@intel.com>
Subject: Re: [PATCH v4 1/5] drm/xe/topology: Add a function to find the index
 of the last DSS in a mask
Message-ID: <Zw82ni3Y7eQhdvUn@intel.com>
References: <cover.1728884074.git.harish.chegondi@intel.com>
 <a8835bd49e78c13d277e8faec70f4c311c32adf0.1728884074.git.harish.chegondi@intel.com>
 <85ldyq2x5y.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85ldyq2x5y.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0286.namprd04.prod.outlook.com
 (2603:10b6:303:89::21) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|MN0PR11MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 06a94b77-c5af-43af-2bff-08dced94d89d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TldyVGhxamlXSVZZVWl1alJIeGJlWVEzeXc1UmdEZzdkSWNhalZiTGRiV1py?=
 =?utf-8?B?RjZRd3N6bUg4VWxvTzhTM040cmZlY1NNclFhcUdYK0hrTU5qR1VZalc2blBQ?=
 =?utf-8?B?eGRBT1BabEhtUmtlaFN4VDVMMzRTSnpjRzRmejFyRkZoL1FuTzJDeGhTT0lR?=
 =?utf-8?B?amd0SHdOUytmc1RURzJ3RU03VTBiL0QyOHVBRWJjTnltaEVjMkpQTGpTdDNT?=
 =?utf-8?B?eEVDU2FoeTdCYjlENEFXWlJJc3Rwb0orMWZBOU9yOW1naDl0bDYwQ0FFaTk3?=
 =?utf-8?B?SjF1bjQ3OGhQc3NybG4ydUZiSUxDeWVnVTV5WlFxa3lSa3I3aTVuYlE1eEFl?=
 =?utf-8?B?WXZwbC93TmxVS1pkN25SYitINTZ4eEF3TVljN0Q5bzBycExzc3N4d0ZZdVlQ?=
 =?utf-8?B?N2RrV3RQcWlrb2lnOEwyZStPRm5jaFJOOHFtSHh6R0RTdWxIblU3d1RxTXZK?=
 =?utf-8?B?K1Nxa0YrRTR0QVhmUEh1OE5KbEF6d3JjMzl0bUhOZWlKMUdSL2YyWlFCWWhk?=
 =?utf-8?B?a2JvaTR6TURrblVla2p0R0wwNlpZRDYxTCtXaU8rSTc2TzRoZUk5eUtqMDk0?=
 =?utf-8?B?S3o4NlFlOEMwUWVpOGJQbmZUWlZtK0d3N0tYMUp1cE13aTdOSm5vdExLNzBh?=
 =?utf-8?B?VkxrT0lEN1hLQjhWcnNPbTJWVndzWlpVUUNNVnZSUUVNUDcxem8ydWYvL1pY?=
 =?utf-8?B?Y0RERW9UMTd1Ukl1MmFTeXlBRXBWY294ZE4xdFNNUnlTc2lYZ1YwNGczMzdu?=
 =?utf-8?B?ZElKWGxZaDR5clc2U0U0S1lEWTZBeVVKaG4zQ0xVcGJaaG5WcUtnMVRkOTBr?=
 =?utf-8?B?aUppT1VyTFkzYlhTYmdGeTYrcjhWTVhSaC8rdGNLaWVUOVF2UEJzZWhQUU80?=
 =?utf-8?B?VUo1cktvMnVGbWd5dWNQcFU1cERhaHZKQkROMnJvZWJ6SDhMbDRGaG90eUxr?=
 =?utf-8?B?OEVuVldjMlB5bzd2SE1tKzV2WmJZdUNpVDRxYXlXSWpIV29aVVM3WEt1U2JD?=
 =?utf-8?B?Tlk5WEV5TDgvOG51Ukt1Z3FsM2k0a2s1S2EvRXVMSU1lTFNQM2FOM0FzU3Av?=
 =?utf-8?B?Uk5hUWVSaVNudmVxa0R0MUxMOUJvWmxYZDJZYkpxWVRPWStlSncrQU1Wek5I?=
 =?utf-8?B?cnBTeCt2UVlERllEREVLQ3l5MEVpbjAwWVllWURiTzYzOHJmVlJKRXl2VnIz?=
 =?utf-8?B?L2V1cWE5R0RGU2o0RDFTWGs2bXpseEtKUVVNdFEyVDdJYW14QUVLbEFvYmo2?=
 =?utf-8?B?VWlCUmJOS1RjUWovVlZLSThPemFCek9TUWZ6MThubWdrZnZ1UFJYWHgyU1lH?=
 =?utf-8?B?N3U0d1hQR0dMK0xScko2Q2lGN2l1c0JtTWpLUmNTaXdhbWdkczZQWGd5MStD?=
 =?utf-8?B?SWdkUDNUbUxQK2ZhK1JlaldBZTcrMG1vdmw2NmswK2l5Vm1VV1lGQWh1VnFZ?=
 =?utf-8?B?ZHpOVXBGMDd5UU9zM1hNQ2gwbGl2UWlQMzhPdC91T0Q5amExek1qa3pPQzcy?=
 =?utf-8?B?VFpwUmVQcHJxeXR3QTBnbkw4dFo5RUVWN2FTZzZ1ZEdpSEZuUEliY0NnWk9J?=
 =?utf-8?B?VEJzOU82L3JabFlGVllrUzAvR05qOEVodTEvYUI0RlM4RUdPV09lT0NRblZu?=
 =?utf-8?B?UUsxMTFDVXBaZXJ5QTVBWEpGZjgwYTViSENzV0NUL2lOR0xDa0NYd1BPYkp4?=
 =?utf-8?B?dFNxQktneUQwVG5LT2lMZ2Zuck02YkVVQUtPWGtxbGtOVksvR2sxQkh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bStNYnRMMjdzaTgyWEsvSDEvSXdFZFhhWVBaVS9qZldTN1A5dEJjRUtxaHU5?=
 =?utf-8?B?UnB0YzNnSEh3MGFTVHBINEFZd2xPNk1KdnJqSmJZQ245MWdtTTZiMmpYSm45?=
 =?utf-8?B?dXJNLytiamtCTzBsQUQwT0lXOXhJWHNrRWt2ZnhXVWhDSEJRMUpoZXhlZ3Ex?=
 =?utf-8?B?KzA0S1YyK2hqZytoVEpaTnNVZ1BBSDljZDgyZWhyNXpISm1xNUxWRW1GTnJ2?=
 =?utf-8?B?Q09XeHBUS1k0S3A1S0ZlaVVJRjYyUmplWTZKeDVOTnlJQU5mcEYyUVg5a01v?=
 =?utf-8?B?cEpVcm93VnI2anlLY1hETDRGV09uTDRpZGkwa0xQaTN5Z2tCZ0todkdsbmhE?=
 =?utf-8?B?VGUvWTRXUGFwVk9hRTB2YkJsVFNqaitDTDR1dENVUDNqRWgzQzEzaStOMVpY?=
 =?utf-8?B?dUNHRkRxb3pCTTB4WUxaS2tDWWV5OW01SHhXMVpudUE1RGVSeXc4NVZmUXcr?=
 =?utf-8?B?ZHFFZm5JSk1xWmlRSDZKOWtoK2tVeWlzbE9TSG50TXl3ejNXSTZJbWpDb0tt?=
 =?utf-8?B?RjFUU01VOUdhTlVheWdBUWVHak5HRFlNNXdlY3hNUnFVTzVVOFV1cFRPRTFY?=
 =?utf-8?B?TnBid0hVdCtlS3lVbDRxSlVzNEM2aHhPWlRUOStRRWM2SmNiZXVFQmR4ckM3?=
 =?utf-8?B?N1YyRWFuVkdScEFIWGFSZUxpNEo2dGN5cmNQQ3Y2OXRzM1l5emt6YXI3cWh1?=
 =?utf-8?B?Mk1aa1lmRUJOZWVBZkllVXJGWE9pYVhvcUZYYjltcDllQmYzVkhWb1hDeHpt?=
 =?utf-8?B?NjN2OEw1Y2VQTkR4QUZaelREcldGenV3M0xxZGxXZzc1OVlKWitpYXhTdkNh?=
 =?utf-8?B?NWlNbFQ5YVVWaUwwM0tzTkJVVmR3Y1ZHOG1GemY0SGZYUW5kWENBdkVjd21v?=
 =?utf-8?B?c3BGQUVvR3IyWEJNaks4L0dGQ2FibUp3NHJ2Q0lOZ2UxZkcxVXNaL3BiT1Fu?=
 =?utf-8?B?NjhaWjQ2SG9KQ1NWKzJSUzJRbFdnNEpxY2FKT1BUSldXQ2ovYnFtTjNqTmVP?=
 =?utf-8?B?eWxhWHk5dUk4WEw2aitBK1orZVpYMTNMN29lT2FKK2dvelFic1JWMjAzdU9k?=
 =?utf-8?B?a284Tlh6QmI2S2NxVmJMUEtpR3c2OHlxcGJmd2hrYzVDeWg0NTE4czRrUTNn?=
 =?utf-8?B?N3BJTU15S2VVdm9xbWNhcnhyS0VueTdIVlZYZlk4UEh3ZCtYYk5KeGM1UGdU?=
 =?utf-8?B?TlN5aEx4K3RzT0NVNzVmeUJ4Y0UvdlBvOFhFalNkRnYwMHllTFA1OVlhWVVz?=
 =?utf-8?B?ekFkSExtRHVVbzNZbnRlWXIrbEZnSitQSmZ1QUR1NlRvOXpJNC9iUjFDckx3?=
 =?utf-8?B?ZGdWRjhnWStvYjF3WUo4bEJGbEhvTE1KTXZ0T2FQUHJLcjJ6MmpKOHZQUFVU?=
 =?utf-8?B?MHVrWXFCL3h6SE12allPbFppTjlzNjJlMTc5OWkzaHMxRlZwYU55R0VkRVBz?=
 =?utf-8?B?bFRSS2RVaENIbU5mTEt6SC9JVW1iQjZIaHNtTzFEbFdQUG9TTU5UeW1kazVu?=
 =?utf-8?B?RlNvZktnQ0wxajZSUjVqUXBsanpJNjExKzZHdDFrSVczMmFaSFFxTENJUmR1?=
 =?utf-8?B?QVhzVFpLbENQaXhHcU9VQnBob3lQUXl5c1ZwWmNpWU9ETE4ydUtvVXc2dGU0?=
 =?utf-8?B?cXpHTEhELzZuaExES1NlQ2c4bGtVY0NvcllZZmNIVlFJR2x4S3Z5a2gzK2lw?=
 =?utf-8?B?VXBtdjlwT3p5WUQ0ZzlSajdxR01IZXlkZ3JYRmMzY1dJQ2t3NEJlL2hnZEV6?=
 =?utf-8?B?bnZYU29MT1UwNCtza2p1V3AzRS9TT3hyTlJqb2VoM2VWNG1iMGFEaVgvdHNN?=
 =?utf-8?B?MFFIWEdFNE1KbGJEWkkxQitHdThmUGdNbXZ4SjJjT05BVjBIblIvNGx1Yy9h?=
 =?utf-8?B?dGUvbXVJTHFCUGlKM2kydDlPTUF2d1dOMHpicDN1UW04aE5Ed3RqbnEzWnUy?=
 =?utf-8?B?N2dMQVR2VkNhbTRrN0NmN1QxdnZSTTJMSkxFNnVzV24xTHdWVzNlTTF4K0xm?=
 =?utf-8?B?WHlrMWN5ajA0ZjhjYlFqT1ZGVjV3U3B0S3ducEQ1cVpEcHI2UG9Hc2d1cURN?=
 =?utf-8?B?WFBxNmpYNDEzd2pFV1Nzc3RkMWdjNDNXSjBxNnpaYmRrN2Vwa2swZE05WHNE?=
 =?utf-8?B?NGc2TWRBb1dGcDhJWGJQUWpzSXJrWCtNb1VGOXloZTVYdzdEd1U2Y3B1cGZx?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a94b77-c5af-43af-2bff-08dced94d89d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 03:44:32.5895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udLvBNr2Ben8l7QbQCWAH/9bjWACEP+ZY9T+xPei4fb5ZGYJP5+0bPiTA7OTy1A7sy0++NeEH15aEjfzFhlpN20aobRDDsYL6dEnlh2kn74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6253
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

On Mon, Oct 14, 2024 at 02:26:49PM -0700, Dixit, Ashutosh wrote:
> On Sun, 13 Oct 2024 23:00:32 -0700, Harish Chegondi wrote:
> >
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_topology.c | 9 +++++++++
> >  drivers/gpu/drm/xe/xe_gt_topology.h | 3 +++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > index df2042db7ee6..1e7476f71906 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > @@ -278,6 +278,15 @@ xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
> >	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
> >  }
> >
> > +/*
> > + * Used to obtain the index of the last DSS.
> > + */
> > +unsigned int
> > +xe_dss_mask_last_dss(const xe_dss_mask_t mask)
> > +{
> > +	return find_last_bit(mask, XE_MAX_DSS_FUSE_BITS);
> 
> Does this need to be exposed from xe_gt_topology.c/.h, can't this just be
> local to eu stall?

The reason I exposed this is - there is another function
xe_dss_mask_group_ffs() to find the index of the first DSS in xe_gt_topology.c/.h
This new function is to find the last DSS which is some what related to
xe_dss_mask_group_ffs() and can be useful if exposed.
So, I exposed it instead of keeping it local to EU stall code.

Thanks
Harish.

> 
> > +}
> > +
> >  bool xe_dss_mask_empty(const xe_dss_mask_t mask)
> >  {
> >	return bitmap_empty(mask, XE_MAX_DSS_FUSE_BITS);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> > index 746b325bbf6e..7ee022784397 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> > @@ -28,6 +28,9 @@ void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
> >  unsigned int
> >  xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
> >
> > +unsigned int
> > +xe_dss_mask_last_dss(const xe_dss_mask_t mask);
> > +
> >  bool xe_dss_mask_empty(const xe_dss_mask_t mask);
> >
> >  bool
> > --
> > 2.45.1
> >
