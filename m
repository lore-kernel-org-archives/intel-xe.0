Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C88CAC58D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 11:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA5010E0E8;
	Thu, 11 Sep 2025 11:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atCwmaAk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC9710E0E8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 11:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757589970; x=1789125970;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=FKmuHIr6ar+f2a+bGh+ZAPZ4/4rdWa6MCfgRgI73UQM=;
 b=atCwmaAkL3OzDa0fGRk059OXlHhMuq0sB4omCq3wHIALOA+zMH02SQ+1
 O0ZXU/3gNIxfKLYYHi6j3SeEVOW+tZ9ZwFp+boxN8dns54PJFtBtKsH/L
 IbpPcl+/pYGQAu2klNTXznQmjzuFitA2cKuelsvtOEF5cL2D/vsfWNGv1
 XO5lhJj3cup3fm2nsx/W+Z/G55F0VPSdaGSDJBd6RgQUmKU20pwgkmYN+
 dPMUSNSmsl+iN1kMWmMTj5zEfEiuUwsJqS90gA6HD9JbEHVwryQjfo1Ji
 O8CwSgEQfdjQ1/FhXx3EZpV93GX6R9tKctjnYtl5Wh2wC+J6p0gqHNTf9 g==;
X-CSE-ConnectionGUID: olxSzES0SiKXy6TLxrxBIw==
X-CSE-MsgGUID: 3kxy3aXZQQ2JEzg6Q7/uQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63746752"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208,217";a="63746752"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:26:08 -0700
X-CSE-ConnectionGUID: HUwub1lSRcWx8z0DfJW15w==
X-CSE-MsgGUID: Krtr8ll2RoWWntOjS0iAwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
 d="scan'208,217";a="204429302"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:26:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 04:26:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 04:26:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 04:26:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBjmo21oeRzbBkDpAxIhSlqCr3/elE5XpuMd/2s9OU83EsFCWrDED6ijTpbiHxt9Sxa4i4bcg57swtaAzcLP+1lCO0RcM3/bj1f+Wbv4SZ+f39EpzhMPvYHxYb/5i1S5XzVq+71I1sLFweFSUBDGyr4VjANypRR2DBxUhd6zl3I1W1EkiV+HzmdzonScVT6mBMGHF292iF3RPgqxFz9sFttlMatR4Ww3QEHkxKRXOWE59jaDodr9UriAlSqY9R01FYWTt+G9k9JhaQvUobTary/KdesrI3uM4Qz7N8gGAU9ImesYmU4taQKgJ1voq0tOOluGAOyXYlwd1eJjZAQczw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2W7x9+TgBk9foBdZ7BqP+jOxGK05sbSOPgnP8gYFao=;
 b=FWb6H3cEFBo5VL6VZiwFRXVMLF7pqZ29x4X0anGOFg47luQKS2ziVux+/KX0lAETNAi14KpOz+GPruz3Bi3uGyNGZRKwGFc/KjcgEVHIO7tFdTb1RFeBUdQJwWVHBsIKpBCfhNJOXCJjhCj+CKkDX72DrCaTofH/oA6xzCYJkJiDo+hMMg3zOtOAg8SQq6PFd/KpTszKwM32xW/2cjdZMwoOIIb5PXczqT1c/f6d1782AkvjnPfO8qjj8aS0QSwYy+7idzYQID+sb5jZWe+hu0lxjV0LkHy5Np97E6/5xQhkaLzAO4QC+V1xkaskcuTZWB4lHD7qjgarPD6txLQF4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA3PR11MB8988.namprd11.prod.outlook.com (2603:10b6:208:57d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:26:04 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:26:04 +0000
Content-Type: multipart/alternative;
 boundary="------------cCaMjGQvKSt9tZ503KVcCMxD"
Message-ID: <58ad2260-9df5-40aa-9cb2-7cf200b32ae9@intel.com>
Date: Thu, 11 Sep 2025 16:55:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v3] drm/xe: Fix driver reference in FLR comment
Content-Language: en-GB
To: Varun Gupta <varun.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>
References: <20250911111712.811524-1-varun.gupta@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250911111712.811524-1-varun.gupta@intel.com>
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA3PR11MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 96119006-5dc2-42a8-e941-08ddf125fe97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2FGUXBpeWpIWDVaU0FWc1dPT1IyQmYxREhXRzVIaU9td2JEVGNxWHhER09a?=
 =?utf-8?B?TWk2SklXV3k3ekdrN0ZvZURScDR0K3hVaWlybmx1dGRETVJLNlNVTkg2QnVS?=
 =?utf-8?B?N3RXdXEvYm1ldVZEWnY0VTM1NXI5NWxUSnJYNzgxQ2RLTzVvL2pZQjd5TTFy?=
 =?utf-8?B?KzA2dExaOEovNjF1SU10clFyZkJyWmhkVTU5NENVRXFLMWUwZW10dXVzS2Ew?=
 =?utf-8?B?dlp6aDNIZC8xMk5vT3AxbjJtdTlXQ2FkMHlUaWZWNzcxK0RycjQ3UWU4OUFT?=
 =?utf-8?B?aHo3Q0QzZVNxSGFNTVRuM2NCVjIyazF3bHZVT0Y2OEszVW9nT2pQY0tVTThk?=
 =?utf-8?B?S2hIeTgzbmJ6VE9TKzF3TnlIREh2S3VjWW9tcU81R25BU2NNZGNnQnFKYzNa?=
 =?utf-8?B?SnpOU3Y5YUZhSjE0bGNGTk1BU21MT3RDeVM5a0YzSHJOSUxoK2tkUGlBSkVP?=
 =?utf-8?B?Q1JSWEkyUXRzK0U4QWRRMlQ1SzN4QmttLy91MloyNTZIVXFiR0V0Zm5aMTJh?=
 =?utf-8?B?ZFo3UVVQeE5KRmJSbWZGV290Z08wRDVGd2RNUHhGNk4ySnJCd0JkWm83QXBU?=
 =?utf-8?B?YUUwbUVsSnNwbEFkNjZEdzZwTkZZaDNuWTZHV3BkSjMrdHB5cWV4bWRpSGZG?=
 =?utf-8?B?RGorUmRRdmIvUFR1U1lVMkw3UmhZNVFpT1A3azB4S2w1YktpOGwxYVY5MU5J?=
 =?utf-8?B?ajl0SXVZSU1RTERhbHNjQzBUU1RiM2tBUlpPaldlR0lNQVpqazhPUlF3R1Fq?=
 =?utf-8?B?aU9WOHFEc0FlMDVyZ2NVbnNXamJieTdrYlNPNVRtY1lYeTAwc1Rpa1MzK3hO?=
 =?utf-8?B?RncwMXFEaHZLWThXMGV6VDh3aFgzUGVwMmR4eGpPNitXV3AzaDBET1hWS2h3?=
 =?utf-8?B?WVBUaWFpbDAwYjM3aW8vVWJ0a1FlOFpHcXFldjhUZDlPZlVSMWlVSFc2SFlq?=
 =?utf-8?B?OWJhby9TM2R3RlB4bUpzeWFzVVZqQm9yeXdjMWNoTUd6Y0VjQjNOOEJzN3hZ?=
 =?utf-8?B?eE1BOEg4eC95cWtGdlFmV1hQMVNEaHpCUjBxTlRuMDd1SHQ5cW9Ob0poS3lr?=
 =?utf-8?B?UXlXWHdDdmZ5eEpSK0dmUmRvQXB6Y1JCNW5VOWVQa0g3Q3RHR3V5elVuSWda?=
 =?utf-8?B?TGFmbDZiVFZVRVQzMldVdENxWDErdElKcmZZR0xNdEJpY0JrSWYrTXAyeTJp?=
 =?utf-8?B?TlEwMEpOZWFnV3k0Z2NqQktlU3d0U09DR1NRN3NuUTZGZjlMMXRTRjZFQWY2?=
 =?utf-8?B?cytqNWxGS05HUXpKUEllRWJWVWwwNGpoMk9Dc20xcHRtVWtmZHAwMk1oVnNR?=
 =?utf-8?B?OVZCQ1VDMVRtSVJhTU1wcDdnZHVqb0RjTVdUTXVLOHZHOG0wbjV0OEJORTVw?=
 =?utf-8?B?K0NOcDRTZTk3Vzg0RTF3ZmVhSXJ1WE42TSs4U3Arb3NwMXNENDVzR3JxeTVi?=
 =?utf-8?B?Zmt5SDhtRmtKaTJDazBZQVllYzByeERxVkxDbnNCaEd6UEFUMEhUcWk1RWl1?=
 =?utf-8?B?YzJEVXBBQ3ZlbUwrL1FjZnlLa2hLSHRpMmUvc0FwWmNYRFMyaUxnRStFU3NU?=
 =?utf-8?B?WSswVDB3N0UvWlhsSWNMelA1N292akszWHRiMjdaWUFNR2Q5M1MyRmM2R0dk?=
 =?utf-8?B?cFJMQnVKQmx3STlrbURxZUxZalk3c2R1TlFGbk1DOHMzdjdrUGVoUXZMcHBp?=
 =?utf-8?B?Z1FKOUlhdmRrSVJMQ1N1dXZuR25uQU9iTlBtNU1yQ1JhYXZldGNTWjNtdmJF?=
 =?utf-8?B?ZFdRUFVINzI0NzkyY3hKZE9pamFPTDB3RzdnbW1JcWdVMVF1T1p6WUNUem9x?=
 =?utf-8?B?V3cxMWJGZ1N4OHVZSGQrSC8zd2FIYU5kUVYxN0JmUFZqZ1hYWStJRngwbE9u?=
 =?utf-8?B?V012UUtMNThVVHh2MXAwdnZnRnZMK1o5anA5aHU4anFFcjBDRDBaNjdMd28y?=
 =?utf-8?Q?kGZSyLxYijQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXFRelM0bkJuZGgvejZXbnFnR0trYkZ0WXFSeXpMTzhVWHhiWHBSRC9ON1ZG?=
 =?utf-8?B?NEVueVNWb3F3V29vcCtFTFVEcjhzMEc3bm55Ylp0RUFsVWFkMFVWNDFKUWlh?=
 =?utf-8?B?NHA3a3FGZ254WkhQdVYvTForRDIwL0JHWjFGTHBGVnpLS3lPQ1JWWVhGaThj?=
 =?utf-8?B?SFRFMkRrdUNha3dLbW5XRG94aVJGYzQvQ0svczBFVHRVaktxdUtFQmZ1bzZN?=
 =?utf-8?B?SVdUbFZ1ZzA1SFlxQytuS1RFbE0rcHNxcm5KWmdGZTRqdUxKZlRTMFhaUkI4?=
 =?utf-8?B?VWtsNFZDMFZ6ZWc0VFRLVXI4UmFVa3J3bzJ4VXh5TWNCTzNmL2E1WGxrbTRp?=
 =?utf-8?B?Y2RlLy81NFAyT2NsckpBTmFFdEY3b1ZaelkyUGFMbG1FSFhMSjFkWWJyMDVh?=
 =?utf-8?B?YVR0SlZXb3NZTTM0aEU0eGQ4VXUrN01HY2VNWWRoZG5McG8yUm5iOTlXWVhy?=
 =?utf-8?B?N1hRbE9ZZEQ5bzBaZWxWckVLVlN3WWEybUp4c2lNcEdrM1VhZ1QxVmgvT0lp?=
 =?utf-8?B?Z002bDNFeWoxYWN3bEJlRzVCZFNCdjg1ejlqSVBKZ05uK1NMN0VGTERBalN6?=
 =?utf-8?B?ZktFSTJzU0syclB0Y1dGYTlMTGpVaTE0ZGlNUHU0Y0YvOGZENFY4b1RvOHdn?=
 =?utf-8?B?N0s1Q01Vdk1zZFpMZVorZHRkZThMMVhQajlyYnV5VWljY2lQa01tRXIxZWp0?=
 =?utf-8?B?eUF1OWdubndqQUdZYXFDaUIza0dxVk9rL2dQSlMyQVJWYzlCU3A1M1JkUERJ?=
 =?utf-8?B?NGo2VVVONHNSUUVtblVuTnRFa3A4MVphU2VRVlBpTkllU3lIUnV3cURxUm9S?=
 =?utf-8?B?bU9yM1NzOUdDQ2VwekpyMjhzeGJzNVYwdkx3blU4UWNKeHlhcXZoY1FSRXlL?=
 =?utf-8?B?OWJRakVMeFhEekkxVDU2RVV6S0trWlRjSXFuMUlZSlJZRmRvaXpxaWRVdmhN?=
 =?utf-8?B?TUdpTG83bkpQYjM1MWhqY2lyNWRzTU0vVVMzQ09KZlNyd0dqdC9UZTFpVmM4?=
 =?utf-8?B?dFB3NDFHRGIvU3VIbWI3NVp1b3d3TUY2RWJ0N3N3d3NyUE04QmZ3bmxZRWZC?=
 =?utf-8?B?bXE0dUNYbjczQ3Z4WVlna0l0TUZRdm12U3BuamlDaEFmQncvNG5VYW1MNEww?=
 =?utf-8?B?dGU3MHo0NHIyT2JmTUQ5c01uOGJJYzZKZksxL3ExUDExK0NTZllxei9nYjhP?=
 =?utf-8?B?YTNXVjVpeXlNaWNtdjZNenpzM3U5ZGFkeWhuaWkwVXduRC9kV2MwZ2NrNS9w?=
 =?utf-8?B?bklpTmdXR1dLWXlaMThjU1VEK3YrRDYwTVVhbjJzdm4rRU44T2dIZS9qcVh1?=
 =?utf-8?B?WEdod2lQQTZyekNxeTM0a0w0MEc4ZFNxMFNJY3VzeTJxam9xOHllTXNkTGxv?=
 =?utf-8?B?ZkVwMllHUW1GMzFtaXpZYzdFNEl4SURwTFQwYW93THV5NnVYb3loRWRya1I2?=
 =?utf-8?B?cjJ3a2NRbHF5bHNSZjBuQUFjSzRXRzI4MU5MYTY4RFRLVWtaNEs1SVFWSi9L?=
 =?utf-8?B?WkpBdEtpZ1VtMzY2R0IvUjZzcXNVN1RHcmlXNlpvUEluQmtKV1drUXRBV1Rt?=
 =?utf-8?B?NHdiZDh4T0N6U1pGTDdieDZxeTVFOUowVGdBdlNQRWR6QXVGV3JGcHJpc2xT?=
 =?utf-8?B?eE9jK2FRdlNOQk56K3hlSG9jUENMOFBhdXU2ZVY0amxaRVZmczVsVG5qbkFG?=
 =?utf-8?B?dEJGTVQrUGQ3czdvNmZlNXhnbFdhY3pTT0FMcWZ5SVJreU90cE1kYXBBcmdJ?=
 =?utf-8?B?MjdsL0JKY2FYM0dYc2NrT3MzZUc1cHA5a1g1TUZYMm52djJWQWZQazZDdkdY?=
 =?utf-8?B?ZllYYmNETll4Q2VvTDREK2NPYmgwYzRIcmNZZERma2V0NytKakY2TkhTTTNT?=
 =?utf-8?B?SFR4cnBNY0hYbmplZEltQjlHbFR3eTNuNW9QYnhCZU1lOHk0QTRXYjcxaklK?=
 =?utf-8?B?cXcwN1F5SldxVVo4NXViVUo2bjBteWpmM1lKaC95Z3pxQ2sxUTQxcjVWSXJP?=
 =?utf-8?B?M1ZlMFBaK1Z2cWdLVncydnZ3bVJiODB6VE5FTytGaWc1aktQNStHTmcxSWJo?=
 =?utf-8?B?RUdCZlJUMWtJSTBkTUFQZU9JL0dqbDA3OVhsYUVlTXg0cnZCRytGUWVKbG1t?=
 =?utf-8?B?WjhCdGdQbTliR0F1OHZhUmNZVUlRS2ZJMFJiN3JlYjBIN0Z6MUJxYTFTYW9B?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96119006-5dc2-42a8-e941-08ddf125fe97
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:26:04.8004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYzb4707ozGjbdPwDEJi4qFyNaaVmINyLTyBJPP4dtjUfR9j4Tf1dfFzR28QKpAO86su39bAT/fum+K0i5bSuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8988
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

--------------cCaMjGQvKSt9tZ503KVcCMxD
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11-09-2025 16:47, Varun Gupta wrote:
> Rectify the reference of i915 to Xe in a comment.
>
> v2: Cosmetic changes. (Karthik)
> v3: Rephrased the commit message. (Karthik)
>
> Signed-off-by: Varun Gupta<varun.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c7bba535b145..a4d12ee7d575 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -532,7 +532,7 @@ static bool xe_driver_flr_disabled(struct xe_device *xe)
>    * re-init and saving/restoring (or re-populating) the wiped memory. Since we
>    * perform the FLR as the very last action before releasing access to the HW
>    * during the driver release flow, we don't attempt recovery at all, because
> - * if/when a new instance of i915 is bound to the device it will do a full
> + * if/when a new instance of Xe is bound to the device it will do a full
>    * re-init anyway.
>    */
>   static void __xe_driver_flr(struct xe_device *xe)

LGTM.

Reviewed-by: Karthik Poosa<karthik.poosa@intel.com>

--------------cCaMjGQvKSt9tZ503KVcCMxD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11-09-2025 16:47, Varun Gupta wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250911111712.811524-1-varun.gupta@intel.com">
      <pre wrap="" class="moz-quote-pre">Rectify the reference of i915 to Xe in a comment.

v2: Cosmetic changes. (Karthik)
v3: Rephrased the commit message. (Karthik)

Signed-off-by: Varun Gupta <a class="moz-txt-link-rfc2396E" href="mailto:varun.gupta@intel.com">&lt;varun.gupta@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7bba535b145..a4d12ee7d575 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -532,7 +532,7 @@ static bool xe_driver_flr_disabled(struct xe_device *xe)
  * re-init and saving/restoring (or re-populating) the wiped memory. Since we
  * perform the FLR as the very last action before releasing access to the HW
  * during the driver release flow, we don't attempt recovery at all, because
- * if/when a new instance of i915 is bound to the device it will do a full
+ * if/when a new instance of Xe is bound to the device it will do a full
  * re-init anyway.
  */
 static void __xe_driver_flr(struct xe_device *xe)</pre>
    </blockquote>
    <p><span style="font-size:11.0pt;font-family:&quot;Aptos&quot;,sans-serif;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Aptos;mso-fareast-theme-font:
minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-IN;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA">LGTM.</span></p>
    <p><span style="font-size:11.0pt;font-family:&quot;Aptos&quot;,sans-serif;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Aptos;mso-fareast-theme-font:
minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-IN;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA">Reviewed-by: Karthik Poosa&lt;<a href="mailto:karthik.poosa@intel.com" class="moz-txt-link-freetext">karthik.poosa@intel.com</a>&gt;</span></p>
  </body>
</html>

--------------cCaMjGQvKSt9tZ503KVcCMxD--
