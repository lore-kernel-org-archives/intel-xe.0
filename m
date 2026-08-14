Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2C4C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 10:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C17710E0F4;
	Fri, 14 Aug 2026 10:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hACnr2b/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F303810E0F4
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 10:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786704075; x=1818240075;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zyt5bgoKV9YXRfci/2d2weCqMZtRdeBePc2Zoft6icI=;
 b=hACnr2b/QKQTUJ1iksFRN9MKFro4l0RVGkTHuVYxfUoy1eEwXLha49zk
 ES7kWmNfjf4CM70LVZ+RzGZxSYEE/d+xorm3w/twKoxUs4wkPH/+k1O3C
 0NQDghmTolSEt2tlsEHZDtKqtXov3gV233J3Iq/dcBOz1qk5YL6tNTljI
 IQv7jQ9eWTVuYk4XVSJfK8S4SRxok0rW2k4zm8SwFxYY3KXDivX1ZSPzW
 kemiN5zNsF/RnPZpCxlSxFe1AJN6jlw5TUbyQqAr3wdLC/iunT9c9aihZ
 gtmTriFYEUqR6lZ0V8sLXVly+J3NkwjNitKTpe5l8NU++stxzg9kN/Drg g==;
X-CSE-ConnectionGUID: u9NXeM/PQ6qnQ5NVsiUFyQ==
X-CSE-MsgGUID: ZqE23IgJRJGpX97WALHggg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="91093353"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="91093353"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:41:15 -0700
X-CSE-ConnectionGUID: pQGhJiZSQjWFWSmzY+9cCA==
X-CSE-MsgGUID: nGdiYfOETd+T2viHUxGGng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="260924317"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:41:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:41:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 03:41:14 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:41:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NE9q5NBmGTJUkSLqGn0rnc3erRJ7Scq//6WN30OydyGfsIu0lNSxmTUAifxNVWgwDn6BKv67go1/YShCANNR2uB5GioN9jmNEvhSxCpzIi1DqZCT0S+VXzPOCipCRridbNhFMTftEDffb0iUHA3CYzoUx/5QdLmIkyxsR4G00njCSIoAL2o2QJawquqEDHXS3a5Z90BsdlOGEp6ljZxpicsJxAUB40lRJfaIBOrYS2ZWCm/JHbveiKD/N5GKq0yo/2rsJG5XxowKDkeVbZbbOHM8UMvt7ebbgfyy7Rd3J4qTtpZccWu9To0vzM0p0Gx2bdaUP4AgX4U35eGV6SlKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ9enCGljchPQZXK5xBa3AjsRASz66k2ycL01o6drJE=;
 b=heo6lkRjiSxLqRAnDBII74z12O0hnUIwX59XO9+WEnmwTfEr+CnvmtRNiymZif8UyE0S4mKnC2G2XsGFpOtuHQspuiOCigr2tlh5sAnVJ806wR3u01cwLe8x76DDl0aVyRhQRL1ylarjtYRe4BgxkDVANV6FUWDwN0GRQE63NeTgBZRfYup6Bph/voRr7FdwGS3R0ZUjGM80Q0O/Gc3fgKJI4wdhH/REreJEqD6fKS9p7d4w32zhh/vjshyCqlhm6DTdpxPvIE+Ta5nb+sdhIh6t8sWpEw6H+T/a9MxpYV31NSgV0b028aD4XVAuSQtAD/pTzA0tUiNOZukpF7I1rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB7588.namprd11.prod.outlook.com (2603:10b6:510:28b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 10:41:02 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 10:41:02 +0000
Message-ID: <9b18aaad-9844-4e54-804e-b8fe20c8eb43@intel.com>
Date: Fri, 14 Aug 2026 12:40:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/32] drm/xe/survivability: Report 'Boot Mode enabled'
 status using SIGID
To: "Tauro, Riana" <riana.tauro@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-23-michal.wajdeczko@intel.com>
 <f4c58382-6edf-4d8d-bba8-e7fc0c18b4de@intel.com>
 <8eac682d-bb57-46b6-8974-e7593ba9a620@intel.com>
 <5e6afb20-43d0-4ec5-81e4-c4568e1145d6@intel.com>
 <a0fe9b9e-95bd-438a-b96f-e9ad1005a8f4@intel.com>
 <fa82aca7-1cc8-460e-b7b0-3d11c1729f7d@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <fa82aca7-1cc8-460e-b7b0-3d11c1729f7d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B73.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::60d) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1eecda-fe8e-4eb8-523a-08def9f08953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|6133799003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: jOT6kVzFuYKvWjQP3nBMcFgUAP6yTn8XZo9HWqwV16d3VKpC4RMqav7JvERsVS7XwcybdcvD1BFAWYdvzUg6fPOfohPZGWWpjEuhbnyScPCEDprBPbJd6qDsyWEBVv+EGS9WMS0M1yrdW29l8MUYaIamOZrZDWgLFRrsvrzM5IiU/iV8oqhOh263TVGXIopXYMmfeCzNhfWG/uPEFUSK80ojxYxEy9Q9ZjFDdLKGYDymv6XQwgRVwL1UbXpU7lfbIB9z+Hdjpv5wGQT+S80LO95I4f+uEScHCXmEpG2pzPlQXqMR4ReaxPMaoSIMlY9EYgiuIUxBMGxdiDkkECYpxfyJRK3wtrxrQgE+nRuO32dDQz9qKgR7Q1MiFJkrNBY85SGypg86i449G8M+DgviUpm0/z3+pdnQZAQ7VCPdN29WqyPVSK/0/ya/3jQof+7rebQmRkIM2ZWYbnG9I3RX0QMM/I0pK3mEqig6HrSzWH1C10/gbtONVs7Qup11GfQ7AMeqpcEhZGZbXImPAtntp/IqW64Zo9HRReOpuO9Iv02B7XGCHteqvsMPBTIDFX49iF8wtCSiRRkUVqikcuWGXETlTAdVkOq/SabKZf6OLgr0wj9W2dcpnn0gp4hlRj5c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjdqR0dpTjZTSFJ1N3Qyc1FZVnNuejVhRytUSnBLaEVyODBVUHR4SmQ4c0hq?=
 =?utf-8?B?dmRUNUNtQ2lIckU0Z01YdmZiTTdOTGFNRWRsSXFReEdPd0FJcTJxTXNmQVBv?=
 =?utf-8?B?SjZ1NlF5cWlpa2x6VEpYSTU5dnBYUmF5bUpDREs4dXBNck9aWU5LT2l3TmdD?=
 =?utf-8?B?dGJmM0E5TUdIVk1BRTI0Uk5oTDYxdGk2b3hXTmQxd2xBRmM4N1JreXhMUFlS?=
 =?utf-8?B?Q0RXTk8rc21ya3lNME13S09tMHR0SDRCUmxmWmNOVFlrSjRjOG1JWVNkaTFO?=
 =?utf-8?B?eklDNThEMldBVXNKMkVoQ1UvSUtkUmNHVVg0MDVZYTE4U3FGM0FGWS9STFVr?=
 =?utf-8?B?d1o1UW9YTUxXUHFwakhwN1BUU2RRRnJ3bDY2alJ4ZmxHYUoyZUI1ZFlRL2c3?=
 =?utf-8?B?d3J1dWxHQTluOGNVeGJQSkRlTzNsajhPb0VDQlNtZEtJQmZiVlA5QThWUUpx?=
 =?utf-8?B?bEk3bTdKQlRjcXRTVFdMR1krL0k4OHpzeFUvL282UEI4ZWlCUWpYclo1c2ZJ?=
 =?utf-8?B?S0FFcDRldDU1b21GRVk4bG5DNXcyWjlEaVZpeEdBWDkzZDE5aWJ4NGxER0Ux?=
 =?utf-8?B?SWF4dlV3aXNPSHJJN01JbDV6RTJGdlBMZGtVK3ZZbk9aYjJBeEhQbHRodFNF?=
 =?utf-8?B?b0hHeSt1UVZXam5VK3dRUkpmTWQweTA2VmlLSStHdTZVQXJ5ZExsQ2cxWXZE?=
 =?utf-8?B?blJvVUVaQURaVTUwcHhPUjMzTlZaU3I0Q3RjTHIzQjR4ajNJaDhNZ0dCc1lv?=
 =?utf-8?B?VkZTTjFrZ3NrUnN2Z1dvYmlnNGtOUGhuZkR3Y2FqTjUvTmRVSkNFYldYTG1t?=
 =?utf-8?B?Q2Q2aVlkZy9TMThHWWFOUnhURWJvOW1pWTVmSGVSK0F1Nzd5dzBNaVhRSXIy?=
 =?utf-8?B?anAvd0JNemwvaWV0VHhmWVdmOWYvRERFczhwdVU3dy84YzdtWkdtSUZtWjds?=
 =?utf-8?B?UDJzQTI4WlJVL3d3bFgwK3YzSXRBSEtIcWtsejlJdDgrYmhmbjBDdE5IRmRp?=
 =?utf-8?B?UlhGLzVoMDhnZXBNK2RhL0x1Mk5DQUdENEhMR0EvNHh6eDdGWXB0U0N3S05m?=
 =?utf-8?B?N0p1c3pUenpwRHcyV0dpSWFGeTFTQnFUTFhleUtVRE9RTVY4UUsvQVpuTCtl?=
 =?utf-8?B?dDJTdzhrSTljRWRqb1RNV0gzTTdINDJ5clcxMDVKUVUvNFdMOUlEdmdJVXBR?=
 =?utf-8?B?UkNBbFY5YUZiTTJPR3dublFPOHk0U21ZTS9pd01Ra3ZUVGpyOGpmK3ZmbWVN?=
 =?utf-8?B?UHB1UU9JbCsybEVwNzhDcHVUd2p3NHhBQmJ5aFB5WU95b1Z4L2t6a2JpSFZH?=
 =?utf-8?B?SmlxR0M3TWxScW1ELzBJbmZwem1ibWgyVEpqUUcrMnAvcGQ0STVvdnNNRHJ5?=
 =?utf-8?B?eFdjV2l2cmZyYkZvbVZjMkRlS1JwWUlFelFBeDhhMERoYkUxbURPQVBDdHdI?=
 =?utf-8?B?SDdsT2hwVHU4Y3Z6UFBqYVhsUVV2Y1hQazlXendlQVR1ZU1tWmtXOXR0b3lk?=
 =?utf-8?B?Uk9TSnl5TkR4aE5hTHY2QitnMmRSNjlna3RJaFNVbWtlNklESjdWMEJ4dUo5?=
 =?utf-8?B?Mi9pRUQzMzlwN2Zscy9ESE5yMGxvWVIzYjBtR1BmYmZKWGh4UFJsN2tUbldC?=
 =?utf-8?B?YnFZQ2wxVGkrSnZOZUViRXNicFdsUnQzNVVEaHQxa005N0pLL09QVEFEbTVl?=
 =?utf-8?B?aHpIVVY5ZzU2N3M2SDVlVVI4c2RNbUV5OTd5V2NPTEl1cDlaTjQ2KzltTHQw?=
 =?utf-8?B?TlFMRC80OE12Z3czYjNiSFgyb0Y2SFpSWDh4VXRVV1JPZ2lhcVFQY2srYVp5?=
 =?utf-8?B?cGVmSXRZZCtCN3RMWGVaQ0JVNU5XZTZ6TlJua2pKQW44aTlDVDZZT3lKU0s4?=
 =?utf-8?B?aTBwN014Y215Tmp5V0R6SzdvbEs2eHRNK3ZESXdtajF6WGwzM3J3b2loZnN1?=
 =?utf-8?B?bFl6ODBmSkdVaUJVUTVzV0orTzZKQ3g2NDV6MVBFcVc2d2t1KzNZY2t0OEc4?=
 =?utf-8?B?aEEvd01FbnFuOGd6N0wxc2xQY09ZZmNOZnlaUjRwU2NBbjJDZlo2UlRscFJW?=
 =?utf-8?B?NTJFR05HZVBSaVNwZnMxVXVGNFlOQXo5UVl6ayt1K2QzRGRWKzQveXBBU1hB?=
 =?utf-8?B?K2ZFTFk5TFlMU2JXV3kvWG9rT2VEcEVNYjBKVTBTRkRHYzZwSDNCUnNBSXJL?=
 =?utf-8?B?YmdYTlVNY09rU2VLY0VSbTF2UFlRay82S1gzQTR2aWZLd0tOemZWeGZWemZt?=
 =?utf-8?B?RVRNWERidGlTKzh1NFUrL2luaUdPQTVsSEc3NURjcEpIVy9vM0VRSVU2UkR3?=
 =?utf-8?B?QnpjQk9QZGUwYW1RK1ZMUXFsZDY4dzlhaFpqTmwzcndPQjRVTWZGdTNoTUZs?=
 =?utf-8?Q?0+XWYhjN3rNUCWeY=3D?=
X-Exchange-RoutingPolicyChecked: sQYiqTMhTlgT13smH6+wt/oCNVtMua9l7xcaLCm47A8OFA48vBqFjKCFL9zTRUnOMUiRQep/uOPF2Nw1CuJmI9KEPSPZme1o7dHIILUcU/5NiN+FvwZ7aG+eR8DlxlluIFDWy6FUa57xJYQ6TkU+N9qoSdJWHrs5aJM8qK5DIMaPWbYo3NhSIF2pGUJ1ZsvUE01phpsGx/y7Fu6idbJLsy3PS43ZMEPN9a1mdbPZRi2/vHYo3Ax2lt+5kke3bYp1q/P3vyeRPdhUpbmCE1/7K7osd5aHZMALWNdpRmFC5276nrMbHKE36G+Hk5VL/8xngRAHkBNDbTAUha6d0RIxIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1eecda-fe8e-4eb8-523a-08def9f08953
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 10:41:02.5593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fxy1sLZKbrn+Sy3t6TgSuy+tb2n0mjyzeKlGrvDXHvWNFA8SwoGFVtW4tgebGgKuTr9KL+m5+K2gW3zU6C/dGhnocV89kI/s4YWDeneedkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7588
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



On 8/14/2026 12:20 PM, Tauro, Riana wrote:
> 
> On 14-08-2026 15:36, Michal Wajdeczko wrote:
>>
>> On 8/14/2026 8:31 AM, Tauro, Riana wrote:
>>> On 13-08-2026 16:31, Michal Wajdeczko wrote:
>>>> On 8/13/2026 12:52 PM, Mallesh, Koujalagi wrote:
>>>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>>>> Report 'Boot Mode' status or failure using various xe_log() helpers.
>>>>>>
>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/xe_survivability_mode.c | 21 +++++++++++++--------
>>>>>>     1 file changed, 13 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>> index 2d8c532157fd..ebd288986c11 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>> @@ -304,14 +304,13 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>>>>>       static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>>>>     {
>>>>>> -    struct device *dev = &pdev->dev;
>>>>>>         struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>>>         struct xe_survivability *survivability = &xe->survivability;
>>>>>> -    int ret = 0;
>>>>>> +    int ret;
>>>>>>           ret = create_survivability_sysfs(pdev);
>>>>>>         if (ret)
>>>>>> -        return ret;
>>>>>> +        goto failed;
>>>>>>           /* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
>>>>>>         survivability->mode = true;
>>>>>> @@ -323,19 +322,25 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>>>>         if (survivability->fdo_mode) {
>>>>>>             ret = xe_nvm_init(xe);
>>>>>>             if (ret)
>>>>>> -            goto err;
>>>>>> +            goto failed;
>>>>>>         }
>>>>>>           ret = xe_i2c_probe(xe);
>>>>>>         if (ret)
>>>>>> -        goto err;
>>>>>> +        goto failed;
>>>>>>     -    dev_err(dev, "In Survivability Mode\n");
>>>>>> +    if (check_boot_failure(xe))
>>>>>> +        xe_log_comp_fatal(pdev, SURVIVABILITY,
>>>>>> +                  &survivability->boot_status,
>>>>>> +                  sizeof(survivability->boot_status),
>>>>>> +                  "Boot Mode enabled!\n");
>>> Do we need this check? This function is only called if it is a boot failure.
>> are you sure?
>>
>> in xe_device_probe_early() there is:
>>
>>     err = xe_pcode_probe_early(xe);
>>     if (err || xe_survivability_mode_is_requested(xe)) {
>>         err = xe_survivability_mode_boot_enable(xe);
>>
>> and xe_survivability_mode_is_requested() may return true based
>> on the xe_configfs_get_survivability_mode() settings
> 
> 
> Configfs also is provided for users to enable boot survivability mode.
> So one log should be sufficient.

there will be still one log entry but it will be with different
severity based on the configfs vs bootstatus origin

> 
> If we do need to add a blob instead of error no we should go ahead with all
> the scratch registers as they contain the error details instead of just boot status.
> Can't we just add 0 for now and come up with something that we can decode in future.?

including boot_status value here was requested by Mallesh in [1]

and logging all boot status registers is already done in [2] but
only if boot mode was not triggered by configfs

[1] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1372191
[2] https://patchwork.freedesktop.org/patch/746002/?series=171022&rev=4


> 
> 
>>
>>> We can have a error log with the type here. We don't need if else.
>> based on [1] all survivability mode SIGID are FATAL
>> and based on 21] it was an arch choice to go with info level for all
>>
>> but IMO if the boot mode was selected via configfs it doesn't
>> make sense to call it FATAL, but if there was real problem detected
>> we should make it FATAL (like we do with failed PROBE)
>>
>> [1] https://patchwork.freedesktop.org/patch/732271/?series=168333&rev=1
>> [2] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1373731
>>
>>> How about something like this? and remove else
>>>
>>>
>>> <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=<N> FATAL (01000000) SURVIVABILITY: mode=Boot
> 
> I am still trying to understand this series. Apologies if it is wrong, i tried to generate log using AI.
> 
>>                                                        ^^^^^^^^
>> boot_status is u8 so it will be at most (01)
>>
>> and I don't think we should be so cryptic in the user facing error messages
>>
>>>>> In case of fatal, will make sense to return "0" OR we can add return as -ENXIO right? any thoughts?
>>> Mallesh, you cannot change return codes here. This defeats the purpose of survivability mode
>>>
>>>> you're a reviewer here ;)
>>>>
>>>> but seriously, enable_boot_survivability_mode() is called from
>>>> xe_survivability_mode_boot_enable() which says:
>>>>
>>>>    * Return: 0 if boot survivability mode is enabled or not requested, negative error
>>>>    * code otherwise.
>>>>
>>>> so returning 0 as success code in enabling boot mode is the correct one
>>>> returning -ENXIO will be no different than failing to enter boot mode
>>>>
>>>> @Riana, this is your code, can you please confirm that
>>>>
>>>>> After handling fatal case
>>>>>
>>>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>
>>>>>> +    else
>>>>>> +        xe_log_info(pdev, SURVIVABILITY, "Boot Mode enabled!\n");
>>>>>>           return 0;
>>>>>>     -err:
>>>>>> -    dev_err(dev, "Failed to enable Survivability Mode\n");
>>>>>> +failed:
>>>>>> +    xe_log_err_fatal(pdev, SURVIVABILITY, ret, "Failed to enable Boot Mode!\n");
>>> Can we retain the previous dmesg?
>> there will be already "SURVIVABILITY: " prefix included,
>> so IMO instead of generic:
>>
>>    [drm] *ERROR* SIGID=103 (-EXXX) SURVIVABILITY: Failed to enable Survivability Mode
>>
>> it's better to have more clearer message:
>>
>>    [drm] *ERROR* SIGID=103 (-EXXX) SURVIVABILITY: Failed to enable Boot Mode!
> 
> Boot Mode and Runtime mode doesn't sound right. 

both "Boot Mode" and "Runtime mode" were existing names in the code ;)

> But i don't have any better suggestions here due
> to repetition.Since its message and can be changed . Will replace it if i can come up with something better in
> the future.

I take it as an ack-by then

> 
> Thanks
> Riana
> 
> 
>>
>>> Thanks
>>> Riana
>>>
>>>>>>         survivability->mode = false;
>>>>>>         return ret;
>>>>>>     }

