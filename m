Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517A0C61DBC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 16:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4C610E206;
	Tue, 25 Aug 2026 16:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkDniI3b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A99710E206
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 16:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787674481; x=1819210481;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=En502Iq6Frg8phCSbd62JRYZeyPOGAOjBvsHi0Y5Ktk=;
 b=RkDniI3bphhQbobk+IaFYRVUapnSrFgHNUlrb99qemrTGZ42qNDW3ib3
 oxDA1L62Dskh0yKRMHSxn8HPmfEsnNG5/j4brEgdPvETMSKY44voqn8A3
 TzXQr4R9U2/VjKwXk3z2MDBjemnRyY69Pm2lEBQ3+nyTU4+nyupvr6vxt
 ZRHaDZa/nrOKm956LhSv6VtEnZwUsPyp3BUhIellEUtonbxNzoRPRvgao
 nO5ViYFHxtbSgyZlBl5LTNnZmicxrmFycEeFHEA6eGUEbmiamnT8DS0iB
 DafUoESC9HO7OUseztvVgXEwqt65ogZp526D85iZy+o1R13cIp+HR49WS g==;
X-CSE-ConnectionGUID: YAmko970TyWYMYs8j3aY/Q==
X-CSE-MsgGUID: eRcpc0O5Qeqk9Wegt1jI5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88023070"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88023070"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 09:14:36 -0700
X-CSE-ConnectionGUID: DC2JYYBTQ/KqZBx6LFs3nQ==
X-CSE-MsgGUID: NmFSF3y2S6yssrLnSQMxQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="292169575"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 09:14:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 09:14:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 09:14:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 09:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIbGnVZg9cYCrRj08JnI/2wn5MX4NzlDCt2/YWkfjjlScvg3EjbTyvEEDJfmn0K2v8myhQnFqf+26Pc+BgWNuFmb5qiVPiPa2MoofW9jXjxpsDTGVOpTweoI0UCL7Cztrb3wdxbF1zgooZfyhxjU1rV6Ula/3eZEKkzUo/PQP0h6e7yA7oYBJ5Z0oByHl+WNiPZP0c3Nc4qAOJ6ZkNB5G7XXIlncsr9NNAEEzj9afRu1Drcfv5I0Sok0TxSICfAHk9BfjrCh4+VCh5BAubkf4VUZeIVpkQrxqFGZEWKteCuRpo2Rzk5qJk8mmlDI3OR1mJ9H/QhyIaHP6BlEX6P4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnhQq+hGo9plN28fRv9mdwJUaq3vpC+hxnlRWc5G8IY=;
 b=ABxsbA3joy4NKDt4+ubnBcm5uVP7f5NQfGanp/DQfhiqK2FnBAzshAzpfoIO4nI/EDa1mbkHAyKTLafnyuKo/rb7ns45RnvValOwsGEjBiCHGxw4YBzdW/174QkzGeWJFsUvYLCJ7u8pMHA1wCHOBKhkEx/9q6KCqb1eUbjO5FXkUnIEImLRmaMHoYZBDLby+m50HsOUPt/r0LJUlGYtcMkVqW7JFETbWekfqbvz2JGen0m1q0EbPuMZUBlhXfTFNYMxIo9fh4Ed+bw9DqcMZDGe/tPESeGbdZy8lq7WSVXw2tanVkvQ/63ScZLIqQTZsIUBuFstW22XWSgkvFXFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DM3PPFC3F0DB79B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 16:14:28 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 16:14:28 +0000
Message-ID: <c8d9d358-2ccc-4ec4-9beb-053bc9dc8478@intel.com>
Date: Tue, 25 Aug 2026 21:44:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] drm/xe/hwmon: initialize fan-control backend and
 table cache
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-3-karthik.poosa@intel.com>
 <b44b489c-78df-4273-968b-49d3f80bd4e3@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <b44b489c-78df-4273-968b-49d3f80bd4e3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::15) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DM3PPFC3F0DB79B:EE_
X-MS-Office365-Filtering-Correlation-Id: f7fee108-f0ea-42a8-c3c3-08df02c3f038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|3023799007|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ksk/HPg5UxgZEj+15CbTtLAHn2AuuGme/PPfDnvZVocfB1pVKKC3+qbTId06/VhnVhe0GhUWcCv/npbL3SujiQxoxO01KATTlUx5k1pYLYsb9wDVvZwH0/DaetTfYLRClS0iu4+rTqO0pf8xsWDz8AoBh8bKPd8TxwKJpJ18yJgcnuJSNBnCgf/JUy/Z4BsrBXgzXbwzQwFJg3PM97fcKl+05JH7gtgw7kw12sTXZ/hHwhAlThT2uz1B0qiyxYJDBBheRuWGnPiYfUirGc6MXLonQXK37rWruPwPTsv3nVpa4exvJBKP33blKF7Ma9kjp5/fj+I5vPW5KHhotb9BuIi9R9uaWMgVYuhg9wzhIwzKVyqn7hx2As7NQJ7NQVM/LAukyOty1jA8+HYdtGoY6LjdKX/4+coZ43corLuimOM/9YE+st/wYb6njKGO4ImekEtZm8LNsgesy2rmizmgD0QAE+fMR9xrBr3CsRmeAWYALkggln3CCrA/xZjCi1/0AX88zI0mGYMArKsrqstS4Cn8zdvQivN/BS3j2p86l+gWZ4tYewZch8mKw5NrET/n9rozQccQK6PCXXfn01j1gRN+riKi1MsBvBsaKd7ryoaJyIYSIpCQHK06XQFcg6IxDs1JYDU7EzI4PSMlz4GcH5EvPhSq9CKivqaRMBVtIyQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aURHQytOVFp5OXhMVmNaTW9HMVZvYmZlVGVpdEpwc0l4TUF0WUV3a2xOb2FS?=
 =?utf-8?B?UVFNZ3lRdm1mb2JRZkU5VVRLQjhKLzJFaGJDV3JBNDRzNS9DRHYxclN0ZTg1?=
 =?utf-8?B?aXB4TUpYOGJjM25tMWh0NzBsVHEvc0dGZllsMTJUbDdWYUROeC94dXFZeXRL?=
 =?utf-8?B?WFZoTnRtamhiQ3RxdmxDSENSUTZWZUFHS0Z1T0dnaG1XQUp1M0wxdEh1MHZK?=
 =?utf-8?B?YVQwbFBSbFZkczQ5Mkl3MW9Dd1UwcEZvakY5S2VCemF0Rjg1TDA4aVdIMCtX?=
 =?utf-8?B?bzhYODAyQjI4SVhxZVVWdVVVRDFHcXMzNGpqNE1NQ0NMY29wWGZ4Tzc3ejdx?=
 =?utf-8?B?ZkZhSVcycGJ4SXFVeURpNnRTMXFqMG1CbzJxT0FoMHowVXJ3RGlJZDgzWE16?=
 =?utf-8?B?VHRQNVJWemw0Qm4wMjZSL0hyZ0dHcitkUjV3eG5pbk1YVk83UFY0T0tQSy8w?=
 =?utf-8?B?OUxYK1FvM09UTjhZOGEreHQ0R2Y1NklDWHhGZ2xCdi96SkxnU3ZYTEJ4bFo4?=
 =?utf-8?B?RkxMU3ZxMXlHOEE2L0lSZnJ1SFNXMy9CVE9oS1BlMGhyRk01R2lvR3ZPK0cz?=
 =?utf-8?B?UWE2R2M2YmcvNE5hLzJERW5VSmU5akxodFM1am9NR3hwcnk5dzY1Zjl0L0tD?=
 =?utf-8?B?amhab2d2NGJaSm4xWEg4azYrU083Tm5kLzByZXBkYnorR0NUWWErQnhMZGNq?=
 =?utf-8?B?M0IrSnFDMkJKTGhlcWdmam9uNitSSzdOYkZMV285ckRlN2JPcnMwQWJxdUdu?=
 =?utf-8?B?d2NZVGF6czU1TGVkN3kxMjZ2UDhnN3E2K3dOOUliZ2dJSnVZZWJVbHU3RlVh?=
 =?utf-8?B?ZTV6cjJKRXpWT0FidlI4MU1tOS90cGRuYk11eFF6eHpGN2VNSUZuVXFnOHZ2?=
 =?utf-8?B?bHZPVjI2NVp0YjVaQTJlMWtJMEZIVmloUUZyTDhzYmxpMTNkYVFrc1c0bHB6?=
 =?utf-8?B?ejdXQ25CeUFzMmZOdHdOTjF1SXV2SVdFS3V0elBicExGei9qdWJ3VXhFTFFz?=
 =?utf-8?B?Z3Q5VTl2UW1qbkMxTkl1WWJ1WDB3azdFQ2VReVV1NWpOeXc4QTgrQmJPRkxo?=
 =?utf-8?B?eTBDNGpabmpLU2FSWWU4dTRvdmNXM29GVk9YbjE2bUsrUy92dnBrYjF6bzRF?=
 =?utf-8?B?bjZJQjNEaWVzc0VxcnhnNlpZbkNSQzlJeG52UERBSW5GMkk5eXEvR2dFMTlZ?=
 =?utf-8?B?SWJLUVBBclZMY2NtRXNMck0rRzVNU28zbHoxeExqZUFSWkFHU3dNaVVkTDFS?=
 =?utf-8?B?Szh4ZXlOTW53MEdiMFV5cFA2RWhnMWxaQy9Sb2pwUHV2RmZlbHJlQWtra0RK?=
 =?utf-8?B?U0RGaXBneEUvQTNyVDdBWGFlSFdLa0R3RFNOdDRHQ05mRzREdktzQm5YM0hU?=
 =?utf-8?B?QTZsYkN4ZFFVQVNYT3poKzlPRHdUSkhwenp6Ry9tSlc3YmxQZHJsZkdLRGdH?=
 =?utf-8?B?NXRLSVN2KzRlMEVkV0UwZGV4Mk8wTE9PNll0VGdjN2xjV2JrbjMyYW1FWmJm?=
 =?utf-8?B?RFI1VDNVampzSzgxMHJZayszNGJkN1V6SnNTdjNacHN2a3Q2ZGZONDVsNFNp?=
 =?utf-8?B?Zk5wYXRqc0JsbzdISkp4MkRaUzFPQTBYdHBrVFBCcEdnUFRBSFA0bm9xZFJB?=
 =?utf-8?B?MGJRUU1JbzlBbVFwWGRCL3diWmpBb1hlUm9EeEVuZm5RRjFKQlRDS0s3UG5J?=
 =?utf-8?B?cStuVEVXRnpUcHRyTXZ2a3JjWjcvUVp6bnI4eXdhYTh1bU5qUHA0cU9nVEZn?=
 =?utf-8?B?MGxBc2pGYlZUSmxUU2R1VU1DY0lLTVhyVEVGYkcyenZjWTdtOWF2ZGVPUnlS?=
 =?utf-8?B?ZWtJYm9KZlZJOHJTY2hNWU9MV3RYVVJjTlRId0dONDhaS0ZidWNpRlRGWno0?=
 =?utf-8?B?SHFCMVNWaVphUWY3bzhXS2pqcCszbFNneTkwYzhtMlpYU1dzTGZsZFJsb0ZQ?=
 =?utf-8?B?TS9hUW9pM1ZqbTQ4bE5MTHd4ZmhDM1JqZzBxMUZ0cjlXOFMvSUtCRHhoSzEx?=
 =?utf-8?B?UkFYTTk5NWxpUU4vVlFIYW1jN0RlKzlydWpMYmpOMmltZWZWRTNCN3FmRnJE?=
 =?utf-8?B?UXIyNDQ1SFU5MGFDYjZ6YmxzTDF4NDF4ZmRrbk50d2hRZW80WUhGRDFiZkRu?=
 =?utf-8?B?dXdIdGtpR2h5enZ3eFBJd3AxMno2TkVhSXZLSjBlRXRKN3hHQ0xFUXNHaGRQ?=
 =?utf-8?B?TXJTeHNqWGFYWmxXZzV0UGg0S254dHl6NmJvdXlpV21ySTVIRmQ5M29qSlk1?=
 =?utf-8?B?YXhGN3VzY09FVVBtU09SODRXRDlWcEZWWXZUbitLTEsxT3pyb09ubEtuWEQy?=
 =?utf-8?B?MVEyL3ZCRFlHK01MMkx0VURlMFM3U25oeUFzZ1dza1p1MkhRR2xiQT09?=
X-Exchange-RoutingPolicyChecked: YpRvORBpoz28+NwT+0eZgcnvPI5ieqWzpd1DntWAniwUVYplYg+5xNyXisDhyLr2n9hYv1USg6TvGTn/gnw2i0KbyW3KleGG8EnvpZLC3szGFvK5EJqAW5QSpNiBpaGunNmpDUqB2odmFHm6So+nY1lvQHpqvtJZpchOqSFRQdb4HhdOB3ezApFlW6/PDAOLopwkVfvHpXXdB2d74imR8KtWd4XREzlrlTv67bEDRZnb8ZuJT3pgJg8vMXM/RZuWtlBTQggIHQU8sXGoQP7XiEoE3iU18wxn5WXLdh62n4Mb5LK9Y6BrQbU+zEBEBtqCMzr+SLuzIeDtBm6ASXL1uQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fee108-f0ea-42a8-c3c3-08df02c3f038
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 16:14:28.3377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUIunA2RI9HSFc+TpDAU3cwaVK/SCMB9QvymIYmpnBHqe2uN0J2S/v4HU1wVplR3EWV3N/bhPYQ8XrfQR0MXlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC3F0DB79B
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


On 11-08-2026 18:41, Nilawar, Badal wrote:
>
> On 17-07-2026 09:47, Karthik Poosa wrote:
>> Initialize Xe hwmon fan-control support by detecting fan count,
>> reading stock fan control points and min PWM.
>>
>> v2:
>>   - Avoid user table initialization during probe. (Badal)
>>   - Move unused code to appropriate patches.
>>   - Use xe helpers for dmesg logs.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Assisted-by: Codex:gpt-5-4
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c     | 159 +++++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
>>   2 files changed, 149 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index de3f2aeffc3f..0a416e3e7b8c 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -20,6 +20,7 @@
>>   #include "xe_pcode_api.h"
>>   #include "xe_sriov.h"
>>   #include "xe_pm.h"
>> +#include "xe_printk.h"
>>   #include "xe_vsec.h"
>>   #include "regs/xe_pmt.h"
>>   @@ -122,14 +123,50 @@ struct xe_hwmon_energy_info {
>>       long accum_energy;
>>   };
>>   +enum fan_table_type {
>> +    /** @STOCK_FAN_TABLE: firmware-provided fan table */
>> +    STOCK_FAN_TABLE,
>> +    /** @USER_FAN_TABLE: user fan table written through sysfs */
>> +    USER_FAN_TABLE,
>> +    /** @FAN_TABLE_MAX: number of fan table slots tracked per fan */
>> +    FAN_TABLE_MAX,
>> +};
>> +
>> +/* Maximum number of fan control points supported by each fan */
>> +#define MAX_FAN_CONTROL_POINTS    (10)
>> +
>> +/* Fan control point index: bit31 selects fan table type; bits30:0 
>> control point index */
>> +#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 
>> 31) | \
>> +                        ((POINT_NUM) & REG_GENMASK(30, 0)))
>> +
>> +/* PCODE operations timeout for fan control commands */
>> +#define XE_PCODE_FAN_CONTROL_TIMEOUT_MS    (10)
>> +
>>   /**
>> - * struct xe_hwmon_fan_info - to cache previous fan reading
>> + * struct xe_hwmon_fan_info - cached fan telemetry and control state
>> + *
>> + * Each fan keeps the latest tachometer sampling state along with 
>> two fan
>> + * tables: the stock table discovered from firmware and the user 
>> table managed
>> + * by hwmon sysfs writes.
>>    */
>>   struct xe_hwmon_fan_info {
>>       /** @reg_val_prev: previous fan reg val */
>>       u32 reg_val_prev;
>>       /** @time_prev: previous timestamp */
>>       u64 time_prev;
>> +    /** @fan_table: fan control tables */
>> +    struct fan_table {
>> +        /** @fan_control_point_count: number of supported fan 
>> control points */
>> +        u8 fan_control_point_count;
>> +        struct fan_control_point {
>> +            /** @temp: temperature in degree celsius */
>> +            u8 temp;
>> +            /** @speed: fan speed in percentage */
>> +            u8 speed;
>> +        } fcp[MAX_FAN_CONTROL_POINTS];
>> +    } fan_table[FAN_TABLE_MAX];
>> +    /** @min_pwm: minimum fan PWM */
>> +    u32 min_pwm;
>>   };
>>     /**
>> @@ -168,6 +205,8 @@ struct xe_hwmon {
>>       int scl_shift_time;
>>       /** @ei: Energy info for energyN_input */
>>       struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>> +    /** @num_fans: number of fans available */
>> +    u8 num_fans;
>>       /** @fi: Fan info for fanN_input */
>>       struct xe_hwmon_fan_info fi[FAN_MAX];
>>       /** @boot_power_limit_read: is boot power limits read */
>> @@ -856,17 +895,100 @@ static int xe_hwmon_pcode_write_i1(const 
>> struct xe_hwmon *hwmon, u32 uval)
>>                     (uval & POWER_SETUP_I1_DATA_MASK));
>>   }
>>   -static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon 
>> *hwmon, u32 subcmd, u32 *uval)
>> +static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon 
>> *hwmon, u32 subcmd, u8 fan_num,
>> +                       u32 *uval)
>>   {
>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    return xe_pcode_read_timeout(root_tile, 
>> PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
>> +                     uval, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +}
>> +
>> +static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 
>> *num_fans)
>> +{
>> +    u32 fan_mask = 0;
>> +    int ret;
>>         /* Platforms that don't return correct value */
>> -    if (hwmon->xe->info.platform == XE_DG2 && subcmd == 
>> FSC_READ_NUM_FANS) {
>> -        *uval = 2;
>> +    if (hwmon->xe->info.platform == XE_DG2) {
>> +        *num_fans = 2;
>>           return 0;
>>       }
>>   -    return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, 
>> subcmd, 0), uval, NULL);
>> +    ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 
>> 0, &fan_mask);
>> +    if (ret) {
>> +        xe_warn(hwmon->xe, "failed to read number of fans, 
>> ret=%d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    *num_fans = min_t(u32, hweight32(fan_mask), FAN_MAX);
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>> +{
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    int point;
>> +    int fan;
>> +    int ret;
>> +
>> +    for (fan = 0; fan < hwmon->num_fans; fan++) {
>> +        u32 stock_fcp_count = 0;
>> +
>> +        struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +
>> +        ret = xe_hwmon_pcode_read_fan_control(hwmon,
>> + FSC_READ_STOCK_FAN_CONTROL_POINTS,
>> +                              fan, &stock_fcp_count);
>
> Is stock fan table going to change after late bind? If yes, then I 
> will suggest to maintain one more table.
> Or Update the current one once late binding is done.
>
> Thanks,
> Badal

Yes, late binding overwrites the default stock table, and the updated 
table remains active until the device loses power.

I think updating the existing cached table after late binding completes 
is the better approach, rather than maintaining separate pre-/post-LB 
tables.

>
>> +        if (ret) {
>> +            xe_err(hwmon->xe,
>> +                   "failed to read fan %d stock control point count, 
>> ret=%d\n",
>> +                   fan, ret);
>> +            return ret;
>> +        }
>> + fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count =
>> +                min_t(u8, stock_fcp_count, MAX_FAN_CONTROL_POINTS);
>> +
>> +        xe_dbg(hwmon->xe, "fan %d stock points %u\n", fan,
>> + fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count);
>> +
>> +        /* Dump the stock fan control points for debugging purposes. */
>> +        for (point = 0; point < 
>> fi->fan_table[STOCK_FAN_TABLE].fan_control_point_count;
>> +             point++) {
>> +            u32 fcp = 0;
>> +
>> +            fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
>> +            ret = xe_pcode_read_timeout(root_tile,
>> +                            PCODE_MBOX(FAN_SPEED_CONTROL,
>> +                                   FSC_READ_FAN_TABLE, fan),
>> +                            &fcp, NULL, 
>> XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +            if (ret) {
>> +                xe_err(hwmon->xe, "failed to read fan %d stock point 
>> %d, ret=%d\n",
>> +                       fan, point, ret);
>> +                continue;
>> +            }
>> +
>> +            /* Cache the stock fan control points in local structure 
>> for later use. */
>> +            fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
>> + REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
>> +            fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
>> + REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
>> +            xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, 
>> speed %u %%\n",
>> +                   fan, point, 
>> fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
>> + fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
>> +        }
>> +
>> +        /* Read minimum fan PWM */
>> +        ret = xe_hwmon_pcode_read_fan_control(hwmon, 
>> FSC_READ_FAN_MIN_PWM, fan,
>> +                              &fi->min_pwm);
>> +        if (ret) {
>> +            xe_err(hwmon->xe, "failed to read fan %d min PWM, 
>> ret=%d\n", fan, ret);
>> +            continue;
>> +        }
>> +
>> +        xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
>> +    }
>> +    return 0;
>>   }
>>     static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, 
>> int channel,
>> @@ -1279,17 +1401,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, 
>> u32 attr, int channel, long *val)
>>   static umode_t
>>   xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   {
>> -    u32 uval = 0;
>> -
>>       if (!hwmon->xe->info.has_fan_control)
>>           return 0;
>>         switch (attr) {
>>       case hwmon_fan_input:
>> -        if (xe_hwmon_pcode_read_fan_control(hwmon, 
>> FSC_READ_NUM_FANS, &uval))
>> -            return 0;
>> -
>> -        return channel < uval ? 0444 : 0;
>> +        return channel < hwmon->num_fans ? 0444 : 0;
>>       default:
>>           return 0;
>>       }
>> @@ -1476,6 +1593,7 @@ xe_hwmon_get_preregistration_info(struct 
>> xe_hwmon *hwmon)
>>       u64 val_sku_unit = 0;
>>       int channel;
>>       struct xe_reg pkg_power_sku_unit;
>> +    u32 num_fans = 0;
>>         if (hwmon->xe->info.has_mbx_power_limits) {
>>           /* Check if GPU firmware support mailbox power limits 
>> commands. */
>> @@ -1531,10 +1649,21 @@ xe_hwmon_get_preregistration_info(struct 
>> xe_hwmon *hwmon)
>>           if (xe_hwmon_is_visible(hwmon, hwmon_energy, 
>> hwmon_energy_input, channel))
>>               xe_hwmon_energy_get(hwmon, channel, &energy);
>>   -    /* Initialize 'struct xe_hwmon_fan_info' with initial fan 
>> register reading. */
>> -    for (channel = 0; channel < FAN_MAX; channel++)
>> -        if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, 
>> channel))
>> -            xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>> +    if (hwmon->xe->info.has_fan_control) {
>> +        xe_hwmon_get_num_fans(hwmon, &num_fans);
>> +
>> +        xe_info(hwmon->xe, "Number of fans detected: %u\n", num_fans);
>> +        hwmon->num_fans = num_fans;
>> +
>> +        /* Initialize 'struct xe_hwmon_fan_info' with initial fan 
>> register reading. */
>> +        for (channel = 0; channel < hwmon->num_fans; channel++)
>> +            if (xe_hwmon_is_visible(hwmon, hwmon_fan, 
>> hwmon_fan_input, channel))
>> +                xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>> +
>> +        /* Fan control tables initialization */
>> +        if (xe_hwmon_read_fan_control_info(hwmon))
>> +            xe_warn(hwmon->xe, "Fan control tables are not 
>> available\n");
>> +    }
>>         if (hwmon->xe->info.has_mbx_thermal_info && 
>> xe_hwmon_pcode_read_thermal_info(hwmon))
>>           drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by 
>> card firmware\n");
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 94575c476e3d..669010f1e2d0 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -85,6 +85,11 @@
>>     #define   FAN_SPEED_CONTROL            0x7D
>>   #define     FSC_READ_NUM_FANS            0x4
>> +#define     FSC_READ_STOCK_FAN_CONTROL_POINTS    0x5
>> +#define     FSC_READ_FAN_TABLE            0x7
>> +#define     FAN_CONTROL_POINT_TEMP_MASK        REG_GENMASK(7, 0)
>> +#define     FAN_CONTROL_POINT_SPEED_MASK    REG_GENMASK(15, 8)
>> +#define     FSC_READ_FAN_MIN_PWM        0x8
>>     #define PCODE_SCRATCH(x)        XE_REG(0x138320 + ((x) * 4))
>>   /* PCODE_SCRATCH0 */
