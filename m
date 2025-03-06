Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13789C19F32
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 01:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB14410E04E;
	Thu,  6 Mar 2025 01:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCRVxwwc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669DA10E04E
 for <Intel-Xe@lists.freedesktop.org>; Thu,  6 Mar 2025 01:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741223772; x=1772759772;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CN32GzH4a/EQHbX06D0fH7oelZ21qPwCO+cr5hVglNM=;
 b=oCRVxwwcUQRmS0jrkMkmcGAjYK1DpGmdZOLXRomHvbLRKT+LNHUxk0dx
 uB3wxVYIlskR8u2NBzVp+fqVLECesYqMSGVGKApXrRatzrbn/KOMBKEG1
 xPn9kE3gi9xkU28raDFqzjuVuJOUUnMThMRVcyepsW7U+SF1KSkWJksdE
 njTk7PQHOfucRpqAPR1HBJf1riU/5HfkvnjB4ZUVsECZxtLvQKiDMwgky
 SyLUy2wa2Ywzv3mnhZiUEdGNVs9NNaGz2B+EvGK0Ue5q+9WN6RahZax+1
 FGHXpFbzhxami3G5sbNbWMhmHcwrjAiiKAeb4NJGsyCYBeft5IBRe8chf w==;
X-CSE-ConnectionGUID: cvhrkaDRSbmxLip6emQByw==
X-CSE-MsgGUID: pY37KXLfRZmaJ2uVByoJYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42104718"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="42104718"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:16:04 -0800
X-CSE-ConnectionGUID: DT9DcExJQsGjRADYPVCI4w==
X-CSE-MsgGUID: qlJRl5weTPSuXWJrg2VV0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156072253"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:16:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 17:16:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 17:16:03 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 17:16:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wbgz7ZCa1sTV1nUhnZ/hIsP5Sa1g+Ez/GQ2VCUtHmRkv1gNokGB2ODCxvX4YUFlZw94/HMzF/g2Xt5Q+12k7t4Xsa808RWJbtAWuWquoLyBi8Y0HSGM9S7g79BqvEdyR4tqhrn7jXq+j2Dfe5h6LjGJIgRrk7AMtZ3pmtkw2UQ/DPHKYNMV97XzIncEfZ/MQYhe2omXKO/NOlYVXu1JfNQjKrhst8xTX3m8+8o5BsQMabvMU/0NGhfrHR4dlpIF/fs4fcLeyEspMnUUmCS5egpa9GEPUqRNDjbVunrH/Z5vpZPxY9+E7glTuytLFtdf8K1ORrmjhwvs9cNDeEcLOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVt/CROPgWeecrBxX+Ip1J7ExP2yihJNAaLy0oOi/yk=;
 b=ty8AZoXU0oEG+82nWkIF3LiazVoPakGGMkeC0xucO3kJA+cgy0acuJGTsp+KDZygAbbHTVCUi1IItDYLq+F9jRWrVuOzMjYuniA6rSEtk9ybE1aD6k3jF5pewc2DjaY1OlUT8L9/fVhh5CWmW2iR/obCr9/U5t3t3vX0PBR2nwuhBWKw4FFHI+ncB50+7X/PrEYBKnkVrzEjFPLi47P+fLckarGxQjAtelOlKXf67YM98Xb80cdDVu4IhOUEumb7DbbXbUE6+orMto5l4OTk1dNmX4i98pvlQxs9qRq7z78Rx/de8m0PAiVJjypX1ari2PH6zBZooRXX8apT6ZjaRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM3PR11MB8714.namprd11.prod.outlook.com (2603:10b6:0:b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.17; Thu, 6 Mar 2025 01:16:00 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 01:16:00 +0000
Message-ID: <eaf6cf82-6d5b-4e2b-9a61-bc61d447c5ae@intel.com>
Date: Wed, 5 Mar 2025 17:15:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Track FAST_REQ H2Gs to report where errors
 came from
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250221031444.3820965-1-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250221031444.3820965-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:a03:505::10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM3PR11MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 8136968c-0329-46a7-898d-08dd5c4c74a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3I4QUZtTGFwYTQ5QTQxdW5MVytnUU9MZVRrYmxmdFlnaEYrOUY2d0QxQUo3?=
 =?utf-8?B?eks2dS9jK0lSYjRpekRsUDQyWjZpa0doT1JEMHF1WWEvTnk0bDhsRU9xczk1?=
 =?utf-8?B?NmpQSzlLNXA3SGlLY0cySlFjdCtnTE4zUEcvU3lCMkJxazFoR3E1NUh4eHBJ?=
 =?utf-8?B?S253SkxuVUNsaHVYbjJtaWZCWXR0YVVDQjdDc0l3dnpTVGM1c2tvSmc1NFAx?=
 =?utf-8?B?NENkOTYybWliZElGd1JUNGVPU3NpUGlwaDJHb0RyREJtYXNjRzJyRDFNQUxy?=
 =?utf-8?B?N2o3QkIxcEpmcUdTRmEyZEFyQVB6TnIrSWRiMUFoR1d3K214YjlGQmFjRlJz?=
 =?utf-8?B?YSt1Q3hPaEZBbEx0Z0VPU3lEcS9kRTkvL2EyRG5xYzAxN1o0MDZzd3FwaUJ3?=
 =?utf-8?B?ZnVTWEs2WGR1eGlGYlRJL3hkZEVDUU9mUHEzTUxQTWVRUzlheGx3UDFWaWRo?=
 =?utf-8?B?UmhaKzA3V2RBN3lFZXpXQzcxcVlIWS9DV3JSdjJNYThUaDhHQnlFWitKZGgr?=
 =?utf-8?B?VVhYRHRDYWVEc3Z0ZkdZNy9tSUNZekdBaXRZU3N6SEdjKytvS1ZEOUxIOVBp?=
 =?utf-8?B?anNmaFA0ZHlsVVZGWHJZQ25EbWI4b2pTamtWeXc4Yk5weEtLanZabDZsRDVk?=
 =?utf-8?B?M3F5RnA0S1dBeFVpcVpQS2lLNU9Lc0RXSFVLcGpnOFZqYkFHd1Z2SWRBbit2?=
 =?utf-8?B?V3JTTlBEWUVIS2hiVmNaOTdhL1RKbGEwdnpZb3F6TTRNci9yRDFGYUI2VnZs?=
 =?utf-8?B?aUNLOVpVNEpYQjl4TUVPZWFreTJBQ1lQd2s4SlZQK1R3bzFoblJyQk9aUmd2?=
 =?utf-8?B?YnZ3NDQ0SmhTTlRlUkVubjFKQlJSd1BHYy90azdCdjhsMUJ0cENYQmNNcWcv?=
 =?utf-8?B?TGlYd2RwYkdNMFZRQjcxL09iS1NoUHl5YjdWcUNZN012dXZjbHdXbW9GQ003?=
 =?utf-8?B?emVIQ3hOclpieTkxZHRLbWwway9YM1RoUUJPTlduZG4rUWUrZHdlTVcvWXpj?=
 =?utf-8?B?eEJzRjZiU0cyRDFvSDNxVVpDeGwwM1RlcUJnaFhuN0M3NmZGUUhBUmVvcytS?=
 =?utf-8?B?RFpUMFRkaHFWZjQ4SS9EVXBlUlRRUlVBS2pybEUrTjBxbGgyQW5hU0kzMzJu?=
 =?utf-8?B?aXNZeXJwWHVWUzNkY0VvaEJQTlE1aXM3enl3MlY1QXpCUG5FQkExYk1OeGJV?=
 =?utf-8?B?cXlINXNqaW1maHZGNEFmNm1Oc0FpUTFadC84Vk1xM09WWjFtY3VkWjlaTFpM?=
 =?utf-8?B?bEQyNlZNRzBFVEdxczdlSTFJZnVRNjMrM01MMzBVcmNxQTN5bjY0NmwwSEUw?=
 =?utf-8?B?U3VCeHlVNUNyalo0WTFDN3ZKRTN3bmx4ZE5VYy9WWTFSU1lob095eVNsa3dw?=
 =?utf-8?B?SGpEeGUwQUZCOFZNKzVmN1FPdmpsQjViei91eHJlNmpVK2hDNit2Nms1WkhX?=
 =?utf-8?B?N2pYWGM4aWdPSlFXMTNrSWNxbHZvbm5ZYktUY01iV2ZNclU2WE83ZVdDZjI1?=
 =?utf-8?B?SWlNNWJlQzV2UGhVaUdnOUxwS25ySWNKQ2VZOSt3UU5lbUVROHBibWYzSkxh?=
 =?utf-8?B?VEUyczNSWU9hNDY2T0dSMzdVWW43eWEzaE9CWkhFTlNodzdOamttSlFBNWRk?=
 =?utf-8?B?ZFFrR0oyYXpnTlVuNlZqb3h2WElkZnVZWDRZRFViT0ROUnFwV1lpUWN3MmZC?=
 =?utf-8?B?dTJjLzFPdWhDRmJsNzN0TDlPMDByUTl4YVRhTHVhR0VkbTdCQVpXZGJ0T3Ru?=
 =?utf-8?B?c043cVQzMDc4YkFMOStmSXNMb0xJQkFwd05lSndJKzk1QzBaUEFaRm5RcGdz?=
 =?utf-8?B?YTJyRnFFb3h4UGFmc2JRVkU1cGNyNUVLMHphUU9wQXNNK1k5MGRBZHRkQjFH?=
 =?utf-8?Q?5sCn2FR3c4vcC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTlNUHR0dDF1WE5zOU5OL3dpOW0xRTRiS253THZzU2lUYVF0TDFGMUhDVEJJ?=
 =?utf-8?B?d3VLcE9sb0UzQmxsWG5KYWhGMitnZDRSWmJvNnRvT3U2ckpJMG9uYWxLL0dB?=
 =?utf-8?B?STQ5MktiSGF3a0NIdzhYMXFxMTFJQ0liOXpRa2NvTnFHTGFIb2hMQjJKb2pV?=
 =?utf-8?B?MkdxdzZOSk02YXArQnZiT3hIZU9qWHcrV1RPV2tnV0RWUmIraU1mOXJTWkkv?=
 =?utf-8?B?UklPSVV6MU8vRTFMNVg5ZmNGVkRJWjNOS1BLbmtOcE5XZnY0MHJqUzV0WUE5?=
 =?utf-8?B?elBjY0RLdnVqT1hnMVhoVmY4UFRHRmpFejVTZmd3SE9MQkZXQ3ludTRYd29E?=
 =?utf-8?B?YklKMkJVUXM5czFuQ2c1QkUvREVydlVUUUZKL05lTlc4MlQ4Qk5GQWJ2S05R?=
 =?utf-8?B?L2hVU2l4WG85OEhzaGNEQjk4a05tWDNjMWx5SlI5VUIyaFBVT1Z0VVVXQnh3?=
 =?utf-8?B?M1NLSE5aTWg3YlNVZGxzSFd6QlNrbm56bmx2d2p1SkM4YjdaNVAwd0FiS3hG?=
 =?utf-8?B?V1ZMNkZGdmRjUndEZ3JZcWNEVSt2UFlaZitKaTJiSjhMMWdWamRjQnRTd2hN?=
 =?utf-8?B?MXdTay8zcWloUCtwS244L3FXWkZWaXhwVGFneUM4MWZuYXRVOThDT1V6NUU0?=
 =?utf-8?B?TTFoN2MxdVRJTkJTMjE3aEdVcjRKY1V6RDc4bWo2L1NpNFpIKzc4M2lZSUVN?=
 =?utf-8?B?cGFiZ2tlZ0xLSkVsTDVidnJ1RGFzODR5SHYvc29NUXdtQ2k4OFZsaks0ZnZN?=
 =?utf-8?B?ZUtLVkRwUEhTWWcwS1ZRVXNDejF0S3BHM1huOWRLQ1ZCQ3BKN3pyd1FyWnoy?=
 =?utf-8?B?QTZGMFhzNVRncUtaN1pqeVllYUl1TVdlNWNycC9EVlRyWEo4VWpXajk3dzJX?=
 =?utf-8?B?WUFwcS82ZGVBRGY4dDdabUwyamlCdUFyV2JYbmlCTjVwRXROaElURzFaZW8y?=
 =?utf-8?B?TlhMM1A4ck1QWWQ0YUp3S0p2NmxSMElETHFLT040VVdad0hnSjl1UnpGSy9H?=
 =?utf-8?B?OUtsOHpRRGp1SVRQWnEwbmE5Z25hWS9hTDJYZ2RoaXNnRjYvekFvQU92ekcy?=
 =?utf-8?B?cGphWkdoNEtLVE1vMjFROFRlS3h5MElsRkFmOGVWRTh4QnEyVXdNV09xVGZq?=
 =?utf-8?B?eHJUTytYNEF5NVlvR04vTXA1dHhmUzd6QzduVU9ZS0Z5aFh4alMrUTlQR3RF?=
 =?utf-8?B?MThCUDJMRjB1SUhjN291c3RGZ1hoQmFhTGNOajRCTmg2NDdYYXdRMG5jd2hv?=
 =?utf-8?B?ZmJybWxkUjJRT01wNDNqQUlXeWhpM0Q3NE5WTkhqYVNweVFxRTVaU3VaY3V1?=
 =?utf-8?B?dEQ5anl2U2NGdlZaZXhNVTdtUWVLWHgvSGdtSitSSkpHT3hPYVNqN28yK0g3?=
 =?utf-8?B?S2x2d0tZY0lnWFlFa2FTVmRmaCt2OEFhaGltbE5pNVJhRVRrd3hVVkp1ck9G?=
 =?utf-8?B?U2plbUJFTDJtRExxR3I0Q01aeWRhYVBFZzFnWVROK1kxY0FQK2xuWUJhZnJK?=
 =?utf-8?B?MExReENrNytQMVBrT2NDbWgxb2ZUWXkwSy9VYjBNSE8yT21reDlXM0tYOG9h?=
 =?utf-8?B?ZXBuS0cxcDNnQmY1akNERGtMT2k3UFl6TGpDbGxKb1RSa1BRTk5kSDRyT0gr?=
 =?utf-8?B?dlpsNEdMRUduNk9VS0hzb0N2U2pHK0U0RnZwZjdYTkhXRm9Fd0VxYkphNjVw?=
 =?utf-8?B?RGMxS2ZaV1lxdGs5azM4VDErSElCMkUydFdPelhJdVFRenEwVEh2UWZuOVhG?=
 =?utf-8?B?VVNDNS9kMEYvOVRIV3ZYZDVPWXVZU0FGZmsySENqdEgxNG5HYW1GMlhEa0Fj?=
 =?utf-8?B?M2VLT2w5QXNkVDNMYm5UZGl0TlZFbjh2b3hCV0RHNWJLZCtyWlNGSkJ1RG95?=
 =?utf-8?B?dHdTbDZCOURLVkNCcWRKaHV4VWxKVDZhTFhENGozbStiYm5JYURWVFlWZGln?=
 =?utf-8?B?ZmMvYUNEWWNQNU53bWttcDdob0FWelR5Zk9QY0RtVVJBK0dRcWRackpGNm9i?=
 =?utf-8?B?NnFWcDFSZ0sxYTdDWlh0TnpBMWNiYXZodktzUzdsdXFWcDVkZm9NUjR6YmtK?=
 =?utf-8?B?R0NMREwyUDBLU2F5ckV2Ykg2QjhxcTgyL3VIVVRYcE1mdXIrSVpHeWlCeGVh?=
 =?utf-8?B?YWhVUE5PS05FdUtpY00yWXpHMVRPL284enlXelBEUy8xLzBsZDN0WjVVeGFn?=
 =?utf-8?Q?xvc6VgYjzDS7JpND3DbDMcs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8136968c-0329-46a7-898d-08dd5c4c74a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 01:16:00.2060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zV4yQ4ychWD5dJPhNI91rGveSKOPbiOFWpsXJmumPj1QWN6pyQm4kjInJBYF0JkxCKNxVafTE95Tsf7ouwgJ2TbMXCu8sbr2qvbQf/HuWx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8714
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



On 2/20/2025 7:14 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Most H2G messages are FAST_REQ which means no synchronous response is
> expected. The messages are sent as fire-and-forget with no tracking.
> However, errors can still be returned when something goes unexpectedly
> wrong. That leads to confusion due to not being able to match up the
> error response to the originating H2G.
>
> So add support for tracking the FAST_REQ H2Gs and matching up an error
> response to its originator. This is only enabled in XE_DEBUG builds
> given that such errors should never happen in a working system and
> there is an overhead for the tracking.
>
> Further, if XE_DEBUG_GUC is enabled then even more memory and time is
> used to record the call stack of each H2G and report that with an
> error. That makes it much easier to work out where a specific H2G came
> from if there are multiple code paths that can send it.
>
> Note, rather than create an extra Kconfig define for just this
> feature, the XE_LARGE_GUC_BUFFER option has been re-used and renamed
> to XE_DEBUG_GUC and is now just a general purpose 'verbose GuC debug'
> option.
>
> Lastly, add a define to document FAST_REQ error 0x30C as being the
> error most recently hit. Not sure why it was previously missing.
>
> Original-i915-code: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/Kconfig.debug        |  10 ++-
>   drivers/gpu/drm/xe/abi/guc_errors_abi.h |   1 +
>   drivers/gpu/drm/xe/xe_guc_ct.c          | 106 +++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_guc_ct_types.h    |  15 ++++
>   drivers/gpu/drm/xe/xe_guc_log.h         |   2 +-
>   5 files changed, 111 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index 0d749ed44878..ef2c456c3f2a 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -86,12 +86,16 @@ config DRM_XE_KUNIT_TEST
>   
>   	  If in doubt, say "N".
>   
> -config DRM_XE_LARGE_GUC_BUFFER
> -        bool "Enable larger guc log buffer"
> +config DRM_XE_DEBUG_GUC

Do we need a maintainer ack for this rename?

> +        bool "Enable extra GuC related debug options"
> +        depends on DRM_XE_DEBUG
>           default n
> +        select STACKDEPOT
>           help
>             Choose this option when debugging guc issues.
> -          Buffer should be large enough for complex issues.
> +          The GuC log buffer is increased to the maximum allowed, which should
> +          be large enough for complex issues. It also enables recording of the
> +          stack when tracking FAST_REQ messages.
>   
>             Recommended for driver developers only.
>   
> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> index 2c627a21648f..c25ea52a6e61 100644
> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> @@ -40,6 +40,7 @@ enum xe_guc_response_status {
>   	XE_GUC_RESPONSE_CTB_NOT_REGISTERED                  = 0x304,
>   	XE_GUC_RESPONSE_CTB_IN_USE                          = 0x305,
>   	XE_GUC_RESPONSE_CTB_INVALID_DESC                    = 0x306,
> +	XE_GUC_RESPONSE_STATUS_HW_TIMEOUT                   = 0x30C,
>   	XE_GUC_RESPONSE_CTB_SOURCE_INVALID_DESCRIPTOR       = 0x30D,
>   	XE_GUC_RESPONSE_CTB_DESTINATION_INVALID_DESCRIPTOR  = 0x30E,
>   	XE_GUC_RESPONSE_INVALID_CONFIG_STATE                = 0x30F,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 72ad576fc18e..2d59934b87dc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -624,6 +624,43 @@ static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>   	spin_unlock_irq(&ct->fast_lock);
>   }
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
> +{
> +	unsigned int slot = fence % ARRAY_SIZE(ct->fast_req);
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> +	unsigned long entries[SZ_32];
> +	unsigned int n;
> +
> +	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
> +
> +	/* May be called under spinlock, so avoid sleeping */
> +	ct->fast_req[slot].stack = stack_depot_save(entries, n, GFP_NOWAIT);

 From the name it looks like this "save" should be matched by a 
"delete", but I can't find any docs explicitly stating how this should 
be used and other examples (both in i915 and outside) seem to also be 
missing the delete, so I'm assuming this is the correct way to use this.

> +#endif
> +	ct->fast_req[slot].fence = fence;
> +	ct->fast_req[slot].action = action;
> +}
> +#endif
> +
> +/*
> + * The CT protocol accepts a 16 bits fence. This field is fully owned by the
> + * driver, the GuC will just copy it to the reply message. Since we need to
> + * be able to distinguish between replies to REQUEST and FAST_REQUEST messages,
> + * we use one bit of the seqno as an indicator for that and a rolling counter
> + * for the remaining 15 bits.
> + */
> +#define CT_SEQNO_MASK GENMASK(14, 0)
> +#define CT_SEQNO_UNTRACKED BIT(15)
> +static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
> +{
> +	u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
> +
> +	if (!is_g2h_fence)
> +		seqno |= CT_SEQNO_UNTRACKED;
> +
> +	return seqno;
> +}
> +
>   #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>   
>   static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> @@ -715,6 +752,12 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
>   	xe_device_wmb(xe);
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +	if (ct_fence_value & CT_SEQNO_UNTRACKED)
> +		fast_req_track(ct, ct_fence_value,
> +			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
> +#endif
> +
>   	/* Update local copies */
>   	h2g->info.tail = (tail + full_len) % h2g->info.size;
>   	h2g_reserve_space(ct, full_len);
> @@ -732,25 +775,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	return -EPIPE;
>   }
>   
> -/*
> - * The CT protocol accepts a 16 bits fence. This field is fully owned by the
> - * driver, the GuC will just copy it to the reply message. Since we need to
> - * be able to distinguish between replies to REQUEST and FAST_REQUEST messages,
> - * we use one bit of the seqno as an indicator for that and a rolling counter
> - * for the remaining 15 bits.
> - */
> -#define CT_SEQNO_MASK GENMASK(14, 0)
> -#define CT_SEQNO_UNTRACKED BIT(15)
> -static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
> -{
> -	u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
> -
> -	if (!is_g2h_fence)
> -		seqno |= CT_SEQNO_UNTRACKED;
> -
> -	return seqno;
> -}
> -
>   static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   				u32 len, u32 g2h_len, u32 num_g2h,
>   				struct g2h_fence *g2h_fence)
> @@ -1141,6 +1165,47 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>   	return 0;
>   }
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
> +{
> +	unsigned int n;
> +	bool found = false;
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> +	char *buf;
> +#endif
> +
> +	lockdep_assert_held(&ct->lock);
> +
> +	for (n = 0; n < ARRAY_SIZE(ct->fast_req); n++) {
> +		if (ct->fast_req[n].fence != fence)
> +			continue;
> +		found = true;
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> +		buf = kmalloc(SZ_4K, GFP_NOWAIT);
> +		if (buf && stack_depot_snprint(ct->fast_req[n].stack, buf, SZ_4K, 0))
> +			xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action %#04x sent at\n%s",
> +				  fence, ct->fast_req[n].action, buf);
> +		else
> +			xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action %#04x [failed to retrieve stack]\n",
> +				  fence, ct->fast_req[n].action);
> +		kfree(buf);
> +#else
> +		xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action %#04x\n",
> +			  fence, ct->fast_req[n].action);
> +#endif
> +		break;
> +	}
> +
> +	if (!found)
> +		xe_gt_warn(ct_to_gt(ct), "FAST_REQ G2H fence 0x%x not found!\n", fence);

Not convinced about this error message. the fast_req array is only 32 
entries deep, so it wouldn't be weird for entries to be overwritten in a 
busy system, but the read I get from this message is that something is 
wrong with the fact that we didn't find the fence. Maybe go for 
something like: "FAST_REQ G2H fence 0x%x action unknown". Not a blocker.

> +}
> +#else
> +static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
> +{
> +}
> +#endif

nit: for fast_req_track() you only define the function under 
CONFIG_DRM_XE_DEBUG and then you conditionally call it based on the 
define, while here you define it for both cases and call it 
unconditionally. Not a blocker, it just seems weird to have different 
approaches.

> +
>   static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   {
>   	struct xe_gt *gt =  ct_to_gt(ct);
> @@ -1169,6 +1234,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		else
>   			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>   				  type, fence);
> +
> +		fast_req_report(ct, fence);
> +
>   		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
>   
>   		return -EPROTO;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index 8e1b9d981d61..c6b89b757a76 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -9,6 +9,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/iosys-map.h>
>   #include <linux/spinlock_types.h>
> +#include <linux/stackdepot.h>
>   #include <linux/wait.h>
>   #include <linux/xarray.h>
>   
> @@ -104,6 +105,18 @@ struct xe_dead_ct {
>   	/** snapshot_log: copy of GuC log at point of error */
>   	struct xe_guc_log_snapshot *snapshot_log;
>   };
> +
> +/** struct xe_fast_req_fence - Used to track FAST_REQ messages to match error responses */
> +struct xe_fast_req_fence {
> +	/** @fence: sequence number sent in H2G and return in G2H error */
> +	u16 fence;
> +	/** @action: H2G action code */
> +	u16 action;
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> +	/** @stack: call stack from when the H2G was sent */
> +	depot_stack_handle_t stack;
> +#endif
> +};

nit: should this whole struct be wrapped in CONFIG_DRM_XE_DEBUG? Not 
sure if any code analyzer would be smart enough to mark it as unused if 
CONFIG_DRM_XE_DEBUG is not set.

Apart from the nits this looks good to me:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   #endif
>   
>   /**
> @@ -152,6 +165,8 @@ struct xe_guc_ct {
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>   	/** @dead: information for debugging dead CTs */
>   	struct xe_dead_ct dead;
> +	/** @fast_req: history of FAST_REQ messages for matching with G2H error responses*/
> +	struct xe_fast_req_fence fast_req[SZ_32];
>   #endif
>   };
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 5b896f5fafaf..f1e2b0be90a9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -12,7 +12,7 @@
>   struct drm_printer;
>   struct xe_device;
>   
> -#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>   #define CRASH_BUFFER_SIZE       SZ_1M
>   #define DEBUG_BUFFER_SIZE       SZ_8M
>   #define CAPTURE_BUFFER_SIZE     SZ_2M

