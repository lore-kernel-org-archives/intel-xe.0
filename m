Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D11D6B6AB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 16:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D49810E06E;
	Wed, 30 Oct 2024 16:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DHjfBIJR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D052D10E06E
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Oct 2024 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730306076; x=1761842076;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gsOUxQ3giHLoXjase3ajRqwjBRSdhCsEra5lNZez9fw=;
 b=DHjfBIJRDa+23kXrJ+mV3n26HJQZX6MByCJNUiF09gis3bpXk4kljyUX
 43923X5GT5GQHTAHZgdfykAsUNzdg0x8sQEmwmsnNaKYjom05PFTxDuNK
 hEvvSn2Vh0EsIMI4fJRhl5RjoP/dMIo2PrNKCMKBbO6ogAr8naj9rf2sv
 Zk5hvK6C6TA0l/41uhscW1nygHtg+TPKbFuvL1iJ4MIiW3s1r0cH8vreo
 /FSL0gukBGZEetr84LacwGRTEPn35exSUfM81+Yj2vXmoUmac0ZgcQNLN
 DgwC4gP9pYS4EwzDKJuGJAE6RHWNVe/+ubb9a1f0wz4mKIXxFO+msNHdO w==;
X-CSE-ConnectionGUID: LFONsIeYTea9St7CDA95qg==
X-CSE-MsgGUID: VI6r/jLVSeSfUXDQEMidJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="33814274"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="33814274"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 09:34:35 -0700
X-CSE-ConnectionGUID: I987uSMnT1WfhJngUM7f8Q==
X-CSE-MsgGUID: CCOiQoheQTu4/F0Lh7kikw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="81918952"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 09:34:34 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 09:34:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 09:34:34 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 09:34:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vgx7963yDxgEiCa67ApMLlkhWj56LpPMBYgJZU75f7OtggpiHivrs2EGspyod/QFQnTCxM4co5aMgqagu8hLk+5OiXMg7FOrHaX0Oh9rfUVpQe/DDwwuGhcF5U4FTg88SL+5X4vQKA/nbVPqEg8eBlWpT1C8CdMjCPo8JeB2QV26SfTfIiVhBaM0W2Y5dEJXAsp01LU1b0l1Oggi6wuQrPD3lllzqJUR70y+4M+yZcojD8BZLSRGPOQm8NpZ7OLJM4HJ6mXwboyCkOisruK+uV35+uyKSvKMNsyrS5wdu2xweFSa1V2xAkhopWrI5hNISABw78K2XDkHv8lpU1gREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAXAJnpSb9L2YuYCR5IYPsj2z7V8NsC8gwC2OYhNUIA=;
 b=ouP4NJflOdPe7dmyqilcJfaEQwYEcWETpS1KjT4OunVRa+bP836HyxVCZ2neDHuSk2tIIWyeHv9exTrN+cg/iOBBDC389FQ7MaDI4r1BzWXl95p55h5QnLyOIQ4v3EdCS5L2hqHQTvAhvUTZPhtvdJtygtgApxZSImcQClFQrI+bruGZBY8iQVH5uZvQ/tbYFmDb+HsY1C/dSLVWcDIhrwiCEbnZ8YLEvS221i7RnI900TJgL3f8pG3EBB/BT6GMOx5OxlbRQ8xz1GBKS3zQi+9MLbRiI+5A4K86MhQUpYgBJKF9s33jvUDVcf+uQ0vJN8ewuy4QiuTkWb9gwceNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by SA1PR11MB5924.namprd11.prod.outlook.com (2603:10b6:806:23b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Wed, 30 Oct
 2024 16:34:18 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8093.025; Wed, 30 Oct 2024
 16:34:18 +0000
Message-ID: <6061f4bb-35ab-4012-a1fa-a53f586d6fd3@intel.com>
Date: Wed, 30 Oct 2024 22:04:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe3lpg: Add Wa_16024792527
To: <apoorva.singh@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241029143740.1296020-1-apoorva.singh@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241029143740.1296020-1-apoorva.singh@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::25) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|SA1PR11MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: fdce2bc1-89d4-409f-c316-08dcf900b332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzIyRk45NVBuaWkyZEZZVmMyTjIzVTAxamhKZW02dXBHYmtLdVlsUHQ3YmxY?=
 =?utf-8?B?eml1bGx0SUlOY1UxN05CSzNsRXp1ZVJyOVpZcE1ranZLalhacWFOMXoxYjZK?=
 =?utf-8?B?OFhYc0tTM1YwRmpCQ20welBBemN4ZUw1aXJ5djBNM1dGK0p2RjZyNUxIWjg5?=
 =?utf-8?B?c1Y4b1FaMVJrY1R4N1dERHp4V0R4VUszVDNZalN2MGJxTitlU1JjR3N4aG1w?=
 =?utf-8?B?OERtaUdjenMwUzZrZWFvUWtFQThQTnN4Ny9GUXE1NkJacThXcDRJQTg5NXRx?=
 =?utf-8?B?TlZ2Ui9kZTFHU1dYRjJSZ0ZUOWtxdzEyWVM0Q0FtSVRwVzJuQ1JjZFNrbm1L?=
 =?utf-8?B?MTBWdnJSRFZsUURmOFU1SW1xcWV3cHVyaHVQeEhTWU9IT2xuUXpFTVJCSFhZ?=
 =?utf-8?B?bStaeUNiWWw1c01Oa254OWcwUXF0bnlBWlBGckpPWjJsZi9EaUxrY1dadXE1?=
 =?utf-8?B?Q0s4djBCanJCR0JKZVZOQXhQdStYU0RxV1c4OFlwd1Q3QzU3cnZQODk1dklq?=
 =?utf-8?B?VmY5WXMwWDBsWTE3R2QwTDAyN1ZBQkhFb21BbTBRUHBNM1Y5RDNSOGQxK0VF?=
 =?utf-8?B?dnBQQkJkU0F0L3hrTEJQZzgwMjBGeElvekFTZE9DM0VQUGtPR1FmS3hNMHRF?=
 =?utf-8?B?ZExyclJ3aVplSnZYK3Y1Z3NsR01mNFJ2Vm1jRkdXQlE4dDR2eXZ4UDRtZ0pY?=
 =?utf-8?B?Q2dNQis3ZVVLUFY3elRONlI1Z295Vm45WFFYWGRuTUduRURhc29FaEpQL2Zt?=
 =?utf-8?B?RTB4T0dqbkNQMitlZmc1WXZ2VFFNRHdVRFhoWWdlKzVBTFo0ZmRyU3VNanhz?=
 =?utf-8?B?eWVrZWo4SEZoakt6RlVyZm40TTM2MGhxYWhEeFRsOWpXb2V4aWkwUHJHNlMz?=
 =?utf-8?B?NWc5VXljVzVzbUNNUDZGbkxyZXBKVUtYYlYvdzFsSkh4QWtyUDd3RnoweWJ3?=
 =?utf-8?B?TGRVSDFSQndMTEFFSGJybXhlZWZYYVRNNVlQWlQrYXJsZXAzZjBRTlU3R0dw?=
 =?utf-8?B?NXhYaUtoUTdlR2ZjMTR1eEtzWmpHa2NIQ0hlMlVtUTMrZHhNVG1vOHBJN0FK?=
 =?utf-8?B?QTZDUC9iNnJhaGdWWEFOSjZFL3RzaDM2b0N5OURISGdISTU4RmZJZmNvZm5H?=
 =?utf-8?B?aXhNakVVUUV4cXp6ZTZiRUxzaTdBTDdvVnFiajRJeDg2dHdzN2tYR2V1MnFS?=
 =?utf-8?B?bWdEK3I1ZEF5U1B1RUsrZWpWSnlvOHJqNXRFMkZvOUU2NGkxaG4rb1BYYUJp?=
 =?utf-8?B?ZUVwMG12U0lHNmhtV2ExWmN0aTh3MWw2N21vQ0RYSHVYM2pmenVSeVo2Tmxk?=
 =?utf-8?B?cTRlaVZKVU93d3ZseHJJRTg4dmdmd3hnc1IzOUhXdFl3ajBxQ2dOcHRLaS9z?=
 =?utf-8?B?aE9wZHNaOG53V0ZsSzkwZUkwblZ4V0RwUXRhR0Jsb2ZadzF5NEdldU1GcUt3?=
 =?utf-8?B?ZHUveW4vR2lPZHAwK3VhUEQ4SnhkVVBuZFpnMHkyUkc5SUp6YUlHSjNnQVBj?=
 =?utf-8?B?THBLWkgvenhCdjhwRXdicFpHOXhBZ2NoQXI5QUE5YldrMURaazRvZzk5Y3Fv?=
 =?utf-8?B?cHhOL2tsWWlLbjkzaEVSem9WT1dyOVBIbnBvNUJqUVZrOFlxb3ByWk9xU1lr?=
 =?utf-8?B?QkFzeGZUT1Y2RnVLV3pJVktpcUtLRk5Xdk5jMUVxNmM0dEE2a3VtRlI4R1Bs?=
 =?utf-8?B?cm9jMkdIOGtRNzZEVzNnV1FyK0M2YWx6TS9oY2FrZTF4Q1hEVkNRdkp4ZmhB?=
 =?utf-8?Q?ivdhUzsZUQq4k+gij8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2llUFR6WWtDcDh1ckw4WFRqNEdWeHQzd1pMUXZGdG5xT2x1bmlUOVRIUDhv?=
 =?utf-8?B?RmRuNUVEQjl6Vnc5aUE4cTRsRmo1K1U3eDJhY1JhNmxMWHNxS1BSM2VaUkQ3?=
 =?utf-8?B?NlJ6NU03QTNCTGxZckgyYWJDM2hOQkRZT0Q0Z3FOWnVHY2JmL0l2c1h6V05S?=
 =?utf-8?B?dTl3R0JQaUJCLzZIbkZEVHhzamI3M2tORUVER0JnZHo1WHhHRHp6Q2JCa2N3?=
 =?utf-8?B?ZzA4SmZ2NXZhb0ZaRDl1UGZtKzJMa0JDZXVTWTdmcjZ2b1FHM24xSDA1ZUdk?=
 =?utf-8?B?SC9mR2gwOUE5VzE5MXdiTW1VZ3J0WmVPTGlRSndMS1EzUVB5NzgrMHJKaXpu?=
 =?utf-8?B?eGJKK1YrK1g5TENLZUlhejIzNHhTaDBWeml2NS9FVjVFSDNBU200eGV4YUZw?=
 =?utf-8?B?L3dHTzEvcWlGQTEvZXZ4UXBFd3ZPaFUvZll2cThxTlJ0TUl1ZzJMZjh4b3NJ?=
 =?utf-8?B?RVR5OCtWdHVYWjhpWHdvbzVWNWdiTkR6SzhFTnovWFpTNm5lRkFUbzlKbTFp?=
 =?utf-8?B?aVNqQXl1SXozRUo1d0tmVjdlTzhucjlmWktQWkhJN29EZ0ZNK2VPaVBrVUtn?=
 =?utf-8?B?WjZ3Y0RUSnlJT0pXZUh4YzNNVk4wYWdQcWFtdW9qYlJMSGZ3eUMyY3RaNUtq?=
 =?utf-8?B?WG1VYk92NVRTUVJObXk1SU9RUUJKYjZRQktUTHRNcjZFdDNNVjI0akJOWlZ1?=
 =?utf-8?B?c0l3c2lLME5lMXJWQnNYT2NreGRlZEtacTVmYjF6MmY3RkxCWFJ2a3Bwc2ZY?=
 =?utf-8?B?S1hnWVk5T3pBNldyTEIxckpJU0Z2WUJKOHF1QXZ3R3JUcjIwUHZXdHFEUnFF?=
 =?utf-8?B?SEZycWRsUW5tMkxKMWJDUEtCMjlZQW0vSk9LQUYyUDJlUks1Uy9SZDcwc3do?=
 =?utf-8?B?Q3IrMlBveDh5Uy85VVRYWEp6Z1VCR3ZUREl4ZWJPREk1SXlxUENwRVN0M01x?=
 =?utf-8?B?bjdJT2hRb1JpaDFmazA1WVBvK1Q1SVcyWWJudEdKTm1sOG1xUHozamVDSGZJ?=
 =?utf-8?B?SDFHdmlZOENnLzBlUzRGQVhKT3laQVhVekNQdHRzaG1ZWENBaGtrQTREL1Ni?=
 =?utf-8?B?REYvd2lHUTZKNjdBdXZzY2xrMzh0TFF1cHluek9uSXNkYVpkd1A3NXhDd3VD?=
 =?utf-8?B?dGxDMWNDVDBsbmY3QzU1SkpIaCsySGVMOVhUbGplcGQ0ZmdVRmJoWHFXcTZk?=
 =?utf-8?B?YlFlMHNBN2NZNUNIOGNJR1Y2SlJGdVgwS2JQN2FxOG1CcFpzaEd0ZUdqSE9U?=
 =?utf-8?B?YkNnVkZWV0I2Y1V4ZUJmNHpjaENldC9QZVlQMmVFcjNkY1B2WmpoSnZSRHpt?=
 =?utf-8?B?ZW9zVHhidlZ4YzJyb1VMeUdnK3hjSElYVTRXeWcrejk1V1NuRisrM3dMYzBi?=
 =?utf-8?B?aXNSREhNOGJ6Rk03cWdXSFpiMEs0V2E0VXFDdlY0K3M3OE84SHNvaDNhRW9Z?=
 =?utf-8?B?RklkM29kZm1kS0YzVGRVY29ZamkyYzhRRDZZQm5FV0o3QWdsaTlGTXdoQ1lM?=
 =?utf-8?B?L0lFSnMvRFlwdVphQWpTdlhtZEQ1SjNMTVM4YW9DWVdwYzc0KzVwbGx2cURR?=
 =?utf-8?B?cGtYNU9ZMHpKcm5Gby9OREpxeTRaSys5MFMxdnluNDBUazVnbDl1UlhhYjRm?=
 =?utf-8?B?QXlJUHYxbU9RWW51SGtrTk96YjExcklqcnFiRC9VSnFWdzF3bmVyQ1cvQXFM?=
 =?utf-8?B?UU1BOHFJQ3RtZ0ZyTGlBTHNodEhSTHVjU3ZVc21IcjAwbVovMnByZ3RHWHln?=
 =?utf-8?B?TWFzeUdEV2pHVk8xVElHRm4rcnFWU2N5RGQzcGFvU05SZkRHMVRUbXB1bElS?=
 =?utf-8?B?UEhITWRyczVESjdlMUt2eFZLZ1Fsb0ZCU1hCZjNlNkxSc3FGWnAxZlA3d1Vk?=
 =?utf-8?B?MFNzemh6QUdYNWJOaVl1V0xGY0VYSDZBSEhKTTdDL0drQ1BtRmxIVExVMGhO?=
 =?utf-8?B?TWhPK2JaYlNWbGt2M2dyYzJsVzh0QVBReUlyR1pHQTdWaDJ6OWx3aUN4dzBw?=
 =?utf-8?B?RVEwYXdGblF6L0xSVEtjZm1KSGJBREc0SldTbExNditJYmc4b0p4TTFxUUJ5?=
 =?utf-8?B?VTVITUZPWkdPM0g5ZTNlbWVzMmhhaW9rWEc3bmpXY21UN05id2ROS0pwOWFP?=
 =?utf-8?B?T3NsUGtoQ2RKSDVJL1VaUEVTbE8vYXVnRHNEL3ZJWVE5YzI5QVpTY0lLdU9C?=
 =?utf-8?Q?CfElYgoPP1fTtlAA4NVDYq0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdce2bc1-89d4-409f-c316-08dcf900b332
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 16:34:18.4076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEYIdA865xa0R0Tydy6gLTbTnWqGBDiZAt/87thyDIr6uJ63iGY++y550Zg/XYTS5I636ZWD/VH5Oj2DMJ24WqHIcV5ifVJUX6VA/LzYpF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5924
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


On 29-10-2024 20:07, apoorva.singh@intel.com wrote:
> From: Apoorva Singh <apoorva.singh@intel.com>
>
> Force Sampler Tile64 Overfetch via MMIO
>
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
>   drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
>   2 files changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 42dc55cb23f4..7ed6addd795a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -445,6 +445,8 @@
>   
>   #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>   #define   ENABLE_SMALLPL			REG_BIT(15)
> +#define   SMP_WAIT_FETCH_MERGING_COUNTER	REG_GENMASK(11, 10)

Lets add _MASK suffix here for uniformity.

> +#define   SMP_FORCE_128B_OVERFETCH		REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER, 1)
>   #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>   #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
>   #define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 02cf647f86d8..18dc5cdf7c43 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -607,6 +607,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   		       FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>   	},
> +	{ XE_RTP_NAME("16024792527"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, SMP_FORCE_128B_OVERFETCH))

We should be using FIELD_SET instead of SET here I believe.

Thank You
Sai Teja

> +	},
>   
>   	{}
>   };
