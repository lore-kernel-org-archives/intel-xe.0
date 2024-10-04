Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BE4CF8857
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 20:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7967910E9C5;
	Fri,  4 Oct 2024 20:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCrjSWMB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFAF10E9C5
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 20:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728073773; x=1759609773;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/bFovXqBOuKsb5r5hO+/pBE6KkxhyBf0FoO8ZTPO1Yc=;
 b=DCrjSWMBMJN6qHq4V5WoPbuQnk0BXFLr3tsP0gf9C+3j7nDcNyyaR3Q9
 iiBRe4EKbyez0qAeupMCICIFC7WmGcJHNAPMj7JmxUMT0kYjnQPVZELqc
 XD8OBtg4ZjrcceE7WQujr7aozxjaTvW0TDVHttexcbiSeQMefZ6ef2uOQ
 ptiprynJ4bJnaZbc2vKxWF3dACr7J8kNoJwsh4Te2oLN5gkEPhDlPqJuK
 jRkyzBAYdKuyJijkF/Shdf+V12OI6fjji2QxUI+fMi9Xz2cQi7L1QaMwg
 BBT0VDaovKAXF86OA5yo4orrYrn1C5FHhcZ3ZrTB6GbfhNfgwlV686sQz g==;
X-CSE-ConnectionGUID: ei8mu5cWQZ6p/MaafSvf8g==
X-CSE-MsgGUID: IlCcaxoXStOZBA0C+O0CEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31013481"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="31013481"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 13:29:32 -0700
X-CSE-ConnectionGUID: 8tmXOLeGR7ytgRuZtoxWSQ==
X-CSE-MsgGUID: yC2qswVdT0ukyw2xAWTBCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="75149071"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 13:29:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 13:29:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 13:29:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 13:29:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+WqViofQhYV6UT7G/rR6qnGX940bw6jZeqM/u6KFPB26h0CA768nAu2yXxgUxkpy1QqlIUHrRaXyF0QWFHS1KZJNwKdtRU6JZGqQBg/ZkTd3pk/1oOqyur0eQfiJTGC8Ya0AiG2ohCwpK6YeH2wDKxJFo3yFE/pOIf9GbgILWAiAEjDVrc7/VjGSuv+ZIQ0b534JclX/afaX9sMFgxIAlE+tzb3+boKjwrAees0lDciE7ZMekKs5qJzQPjAsX3J78vMlMYVd2y6oPN7zTQXU/LQetIaIhUqWvCpYpEsINdre+F79SuPhgBJdPzw6eULHjgs+Ew5wgMZHunRAs+DDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4a6KM3Z4QFFKxRfglNCBUGpJd86fxw1+7J6s+FB91M=;
 b=q0IN9jchSN3ZEH4GxgRyB2Hkc8LuI4DgprfPYj5N665r1KwuAIuSWEVpUC4hIsyxPVO0ggXO5Oyf33JkUNPPq20FCn+wVms1OFcV1z60IibW+fCVyCvEk6OEJEI5/um65oqmVGfX+YCZ02gLdTUxLkQ6ywsbQOxatyu0uKEkKcDVmMa6lg/PIHqbnRTZrzgRFcGW8t3uya2Nb/ImNXWmBLHvSA3DJTU7D5/x9vGUtROv2QlxW0c2mj+oPuvbU6aSvkMjJqyAKDtGbQTWL2PZ7ZW0HXc2SfCCHT6dwoXr9L5CNgG4O4xiTcJsSmtoB6uOA+PwyPLXC7dvcGFXE3sA1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 20:29:28 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 20:29:28 +0000
Message-ID: <6aee5b60-b2f2-4fc5-80f6-ef1e260c794a@intel.com>
Date: Fri, 4 Oct 2024 13:29:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] drm/xe/pxp: Initialize PXP structure and KCR reg
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-2-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240816190024.2176976-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:303:dc::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ0PR11MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1f61de-7428-432c-2e9c-08dce4b33e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVcxelIrb1FwOWl3WDNrdEQ5bzVQV0xXaWZOL1ozc01ubHdRclJOOHBqVG53?=
 =?utf-8?B?WXVoYktIT3Z3NHRQT1VRS0Q4NnVxZ2c3dFB1b3NWSXJUZ0lIVWtFYy84UmRt?=
 =?utf-8?B?Q3hxNmlrbHBmZDBkUXg2YUpIektHV010Nk5lZlBUWFYxOERneVhYeUdqenRT?=
 =?utf-8?B?d2FtdmV0S0plSC9neGtKdGswNkU4NTcvbUROajFsSW5oaGRpdGNiL1pPdCtZ?=
 =?utf-8?B?Vzg0TXd1MFpnM0NhU1lVdnVXcG1ZaU9scG10czVsMG40K2JqYkxWVGhXc0Ix?=
 =?utf-8?B?R0pEUDVLaVVkZ0ozRVAza3phM3FWZDN3bWc4cG5IYUNxR0lieFNhd0ljclU2?=
 =?utf-8?B?blAwWWFqMXlFWHRHNndYSUpKNHM5N3NEUXBQOEZpajgvMkRwSm9tSmZqa3Y4?=
 =?utf-8?B?Yk1pQU9MUmpDb2R0MkZYeUZ1VnFPemRFUFhUeTVqWHloVTY0cjJuL1IvcVFG?=
 =?utf-8?B?WExweHFoaDFXMkYzRmd3WFVrL3ByMVE1ZlU1bWhHUjJRV0NRbFZoQ0pCcDJh?=
 =?utf-8?B?MTBkVkZ0Wmhubmlic3RZNHVEMURyd3NqREIydStNNXJOQ05NTnBZSzJYcXhS?=
 =?utf-8?B?Zit0S3hEUDBhcUNwcERTdDBMMEJDN2FYalVaSEhQZ0dXYi9NcllJZEdRWldH?=
 =?utf-8?B?aVB3M2NhbU5BVVA1N3drZlV3cEZtTEl5eEY4bkVHNjgweU1yL2hxNkpFUWRS?=
 =?utf-8?B?cTkxTTVIYXN4eThyeTV2eEdtRWJEY2JzeG1rcSs2b08ycCthQUROajduM0hs?=
 =?utf-8?B?ZVNTQm9wMnVPS25XTGpnYTBzTkdMTDl3QTRsdTRtVmNlMDFRSEZsZ2ZJc3Nk?=
 =?utf-8?B?bWQrMmJqb0JnREprOTdDeU40Y3J0L1gxRDNhSjg0VXFNejRNdUEveHoyU0M4?=
 =?utf-8?B?YTN4WG5oM0NqSHpuNHptR1R4OW5scERZZTN5K212STU4aE5kQXBoNm91NUdq?=
 =?utf-8?B?NkI5alZtbysxZ1pmSU10SkJJemlQTU1TU2lDb3llLzBvdURyVktpK3BGeDY4?=
 =?utf-8?B?eCtXWUlNYWsvMHZqMUhpOUR3NlRnTEUvN09RR2RYS2JhaTl2YUYvM3R0Zmox?=
 =?utf-8?B?ZlFZcHhQNlduWm96UExiRjBGd25SRDVNc2lPUEhxVGNwVytxVDRnR2JNaEJP?=
 =?utf-8?B?RFBEd2xhQWFLQ1JBSCtHcERVVXBjSXZsQ1F2MzBveTdBR0R4YmR0cHFKZkNj?=
 =?utf-8?B?SGVLZ3pNTFc4TVF2cUc5emtSRDZmZHZXbDdPeGprNGx0dmkvUUJ6U3JSWEV4?=
 =?utf-8?B?bVZ4ZzdCRzRyR05wK0RhcURFSlFkRzRTMFUwQ0tTaFdIV2N4Y2t0cmVDYTlY?=
 =?utf-8?B?dkpnNklDSFlHSXRCaEcxWmp0a3JORG0zZ21LZFdWU2VxMnp5c2RYYkcxZTRR?=
 =?utf-8?B?czR0Y1JRalcyQmU0MmlpajBxZzJlNDhUSXhNOEF4R2paSFFtYnczRXBWM0FT?=
 =?utf-8?B?ZW1zbEtyZmlMck5ZU0pCRVQvWk5qb0lsc0ZZTWFqR1BvT09iVXl3M1ZjdUt2?=
 =?utf-8?B?ZzNKUEJNRHI5Q3o5bFpPTU0xRzRrYWVwSnMrSnZ3eThhRloxU3I4RE9tSHVR?=
 =?utf-8?B?ZWx2dzJSR1hERXpRbUVXbldSdy9OTlRaRVhFMlpFNDN6d0xjdTl2VTluVU1s?=
 =?utf-8?B?Z0VSK1VGa3JvQmM5L3Q3ZnAvZDRoc3hIN3NIRU1IZnUyQjYwd2tkRHdZSWdE?=
 =?utf-8?B?VTM1Q0x3dWZJY2lZcHlCZTBGK3dmaVhoUHZodThDV2RwWDJPaStpN09BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWdGZUV1ZmphWHUwS1djcmowSkZHVU95b2lMOW5wcndTNGxkZGxtamp3d3VM?=
 =?utf-8?B?d1NZM29JSHN6M1Nyek91bTVHSisrMnR4L2xaTVJtV3dpYTBqZzdJcjBLNlFD?=
 =?utf-8?B?S0thMlhPTENRM0Y1bFNwMCtERGtxajVDS0NPdldod1dWazJMV3l2aWJFTFcz?=
 =?utf-8?B?djA2aDRqNE1WWS80THkyV0luYlowK0pxY0VHWCtVZy96MlVwZTZhclFhRWd3?=
 =?utf-8?B?NlI0VjhieDAzUmlvNjNRV21QV0hxRVhLaEpoaW5qTEJDUDJocmcxLzlSaGMr?=
 =?utf-8?B?N0h0ZDJZSjBCNHdSUUo4eUhvcVV1bGNSaGR5dVUzUVZGaWJiQ3BhVTdBV2xp?=
 =?utf-8?B?MTJ1OUg3Y2xxNUpheE1kLzFmVlV2OXJKUWt2b3Q2Q0JJSWJGSzVHd2VZak5X?=
 =?utf-8?B?Nk1hZTlzaE5CblQ5SU5rQjcyTkhndXBZTnVhTUZLM1g4Y1IybXoveEhqZnFx?=
 =?utf-8?B?L1o0NTNYU1c1NDNvNmhJM21IODFmbFVTTVFzMDZYTVhGUXhBeEhaa2R3YSth?=
 =?utf-8?B?SnBkU2RWWFNXRndXS1IyTlkrSmJFZDBVcUJLNzR0NlRIK2FMa1ZNcm1VRGl4?=
 =?utf-8?B?TXZrZkYzVFdYbm5LR01qZDJSM2FjZGs3STdBcnZYN0xBZ3VyTlBKT3N0QjlT?=
 =?utf-8?B?cmVCcm5jQVRCTDJ6SHJBMlV4SVBTTS9OWWVEWStOalpUaWFOT0p6ZmtNY0Fq?=
 =?utf-8?B?MFM5b0kwRjNHcldTSnMxY1BQQ2hDVnBCcTZZbll3bUQ5OE8rTnVRcVFKTTJC?=
 =?utf-8?B?VHFNR2ZybjhrTHZVMWZwREVHT2h6cGs2S2hBTTA1RnhmR2p3bGJKdWsvQ3p1?=
 =?utf-8?B?LzV5NTE5VFBMWW9FQUJjcjNleDhvZ3pTSmV4d0JBNTllN0RwVnFha1AzQmhw?=
 =?utf-8?B?YTlnRHhEeVFQQWpqa0I0OTVmYTFqdnVTa3FBMHZhL3h2TUhvbUxPMmFjR3Bn?=
 =?utf-8?B?enVYRnRPL1BXQVlvUG9iUERMN2wyVDR0dGV0UkZDUFJVRFJtWXFtS0NwL1BB?=
 =?utf-8?B?aDJrUFAvN0VQbS8wM016S0NCb2F4Tk9ia0gvOUhvbUthbWU1TTFNdUlaZWFl?=
 =?utf-8?B?aVdzSVJqSGdZdTVOaUZiSjZXYldVUnBhcW9WNW5MVTFhT0RxRE9tV2JFdHpp?=
 =?utf-8?B?bEZlODN6aGsxa1pkMS82aXU1dEtZT1V6M09XYmlad1k4QXZ3Y1FvMGtzeERK?=
 =?utf-8?B?N3pURXNiYWVvSjF5MWt5VTh5RjIyZzBXUUIrZXFwTzRkTERHTmJWcjZ4OENW?=
 =?utf-8?B?NmgzZ0dVYzl4aWhheVpHK2ptTkM1TnI3VkFRWmg4Mnp0Zk1Kem5hSVdENjlk?=
 =?utf-8?B?Wi9DZnNrRnUvNXR3UGJiUWJJWVJRYVpScWJaS0xVZitwVTZlbkhORGV5dzhi?=
 =?utf-8?B?ZzNQRmZ1L2hMWExyRkhvS1RZQ29Iek9kTlZMTzdUQnAvMmFSWHl1Ui9UbjVq?=
 =?utf-8?B?anJEQm9FeVVydU9XMmRON3dFWXQ1d25xV0d1alhNWVlQcjZ6akNrcS9lQ202?=
 =?utf-8?B?RERWZEhFQ1NlZFlRQ1M2emlVVHBTTElpdlpLeDcvT3dsbkdwYXlJVGw5bFlU?=
 =?utf-8?B?TGVtOFk1ck1leDNubFFZVjdvY3duR0hhMDBScVZIZ0dQUFFSNUF1Ry9wNm9P?=
 =?utf-8?B?Qi9VZ3p6VE50R0NVcXlTamNFM2xlNU5VeDFDMisvRWZrSG8xR21JUHViWEVt?=
 =?utf-8?B?Q25SSkwxUzVkOGhwRFE2aVBPQklUOCtjSkRLRHM2a2wzQW96bWN0N0NUT0lX?=
 =?utf-8?B?VEVIQzJRK1hWR0ZzbGFJWW1vSjV5cm1reUVVM1ZLUStJbitCNG54UXczZWU5?=
 =?utf-8?B?VGJCaFlLRkFXZGc4ODdGb3RtK3B0UFBxaWhZUGhZcDYxNzhyVVprVmdpNGxM?=
 =?utf-8?B?QlVNR1YxM1o4SllnQjF6YUdMRkFiazdrYmZPZTl2S1FKSXFlU3F0Tk9hNTJy?=
 =?utf-8?B?ekhRNFRZYzdiWlFIbEpDUElPZGEzWE10ZjlJRFpYZ0xiN3F0Q21jUHZFNGkx?=
 =?utf-8?B?WUpwTzFVdHVNcndibGRJU0U3LzFiZUpxbHF6UDh4OCtiT2ZsUER1VnI1NDUx?=
 =?utf-8?B?dGp3SWxNaUJRR1pvN2pnOGJ3MkE2MXFhWEY0N3AyVlZsOEJtdS90L2QxUTE2?=
 =?utf-8?B?alZTNk83dHBnSkRVR0Vvd0JWN3laTXA2clk4eCtpSnFSWGx5Y1pqNGNQNzRD?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1f61de-7428-432c-2e9c-08dce4b33e6f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 20:29:27.9094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiOV5+LQ0AY82F+0uLzMagaBc2q0BakFvEFyGnupkOn9J8rOKqSjSL+8Qf0j8rS6TjTejRwJkV1oSv6NteUYCtaOmeTwz7/kd9XveeC9hC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
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

On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
> As the first step towards adding PXP support, hook in the PXP init
> function, allocate the PXP structure and initialize the KCR register to
> allow PXP HWDRM sessions.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   .../xe/compat-i915-headers/pxp/intel_pxp.h    |   4 +-
>   drivers/gpu/drm/xe/regs/xe_pxp_regs.h         |  17 +++
>   drivers/gpu/drm/xe/xe_device.c                |   6 +
>   drivers/gpu/drm/xe/xe_device_types.h          |   8 +-
>   drivers/gpu/drm/xe/xe_pci.c                   |   2 +
>   drivers/gpu/drm/xe/xe_pxp.c                   | 103 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp.h                   |  15 +++
>   drivers/gpu/drm/xe/xe_pxp_types.h             |  28 +++++
>   9 files changed, 180 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_pxp_regs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp.h
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e11392b5dd3d..9e007e59de83 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -83,6 +83,7 @@ xe-y += xe_bb.o \
>   	xe_preempt_fence.o \
>   	xe_pt.o \
>   	xe_pt_walk.o \
> +	xe_pxp.o \
>   	xe_query.o \
>   	xe_range_fence.o \
>   	xe_reg_sr.o \
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> index c2c30ece8f77..881680727452 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> @@ -10,9 +10,9 @@
>   #include <linux/types.h>
>   
>   struct drm_i915_gem_object;
> -struct intel_pxp;
> +struct xe_pxp;
>   
> -static inline int intel_pxp_key_check(struct intel_pxp *pxp,
> +static inline int intel_pxp_key_check(struct xe_pxp *pxp,
>   				      struct drm_i915_gem_object *obj,
>   				      bool assign)
>   {
> diff --git a/drivers/gpu/drm/xe/regs/xe_pxp_regs.h b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
> new file mode 100644
> index 000000000000..d67cf210d23d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_PXP_REGS_H__
> +#define __XE_PXP_REGS_H__
> +
> +#include "regs/xe_regs.h"
> +
> +/* The following registers are only valid on platforms with a media GT */
> +
> +/* KCR enable/disable control */
> +#define KCR_INIT				XE_REG(0x3860f0)
> +#define   KCR_INIT_ALLOW_DISPLAY_ME_WRITES	REG_BIT(14)
> +
> +#endif /* __XE_PXP_REGS_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 206328387150..807a15c49a81 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -46,6 +46,7 @@
>   #include "xe_pat.h"
>   #include "xe_pcode.h"
>   #include "xe_pm.h"
> +#include "xe_pxp.h"
>   #include "xe_query.h"
>   #include "xe_sriov.h"
>   #include "xe_tile.h"
> @@ -730,6 +731,11 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err_fini_oa;
>   
> +	/* A PXP init failure is not fatal */
> +	err = xe_pxp_init(xe);
> +	if (err && err != -EOPNOTSUPP)
> +		drm_err(&xe->drm, "PXP initialization failed: %pe\n", ERR_PTR(err));
> +
>   	err = drm_dev_register(&xe->drm, 0);
>   	if (err)
>   		goto err_fini_display;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 16a24eadd94b..b00a78be3934 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -35,6 +35,7 @@
>   
>   struct xe_ggtt;
>   struct xe_pat_ops;
> +struct xe_pxp;
>   
>   #define XE_BO_INVALID_OFFSET	LONG_MAX
>   
> @@ -276,6 +277,8 @@ struct xe_device {
>   		u8 has_llc:1;
>   		/** @info.has_mmio_ext: Device has extra MMIO address range */
>   		u8 has_mmio_ext:1;
> +		/** @info.has_pxp: Device has PXP support */
> +		u8 has_pxp:1;
>   		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
>   		u8 has_range_tlb_invalidation:1;
>   		/** @info.has_sriov: Supports SR-IOV */
> @@ -480,6 +483,9 @@ struct xe_device {
>   	/** @oa: oa observation subsystem */
>   	struct xe_oa oa;
>   
> +	/** @pxp: Encapsulate Protected Xe Path support */
> +	struct xe_pxp *pxp;
> +
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> @@ -552,8 +558,6 @@ struct xe_device {
>   		unsigned int czclk_freq;
>   		unsigned int fsb_freq, mem_freq, is_ddr3;
>   	};
> -
> -	void *pxp;
>   #endif
>   };
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3c34b032ebf4..d1453ba20dcd 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -62,6 +62,7 @@ struct xe_device_desc {
>   	u8 has_heci_cscfi:1;
>   	u8 has_llc:1;
>   	u8 has_mmio_ext:1;
> +	u8 has_pxp:1;
>   	u8 has_sriov:1;
>   	u8 skip_guc_pc:1;
>   	u8 skip_mtcfg:1;
> @@ -616,6 +617,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>   	xe->info.has_llc = desc->has_llc;
>   	xe->info.has_mmio_ext = desc->has_mmio_ext;
> +	xe->info.has_pxp = desc->has_pxp;
>   	xe->info.has_sriov = desc->has_sriov;
>   	xe->info.skip_guc_pc = desc->skip_guc_pc;
>   	xe->info.skip_mtcfg = desc->skip_mtcfg;
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> new file mode 100644
> index 000000000000..f974f74be1d5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation.
> + */
> +
> +#include "xe_pxp.h"
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
> +#include "xe_gt_types.h"
> +#include "xe_mmio.h"
> +#include "xe_pxp_types.h"
> +#include "xe_uc_fw.h"
> +#include "regs/xe_pxp_regs.h"
> +
> +/**
> + * DOC: PXP
> + *
> + * PXP (Protected Xe Path) allows execution and flip to display of protected
> + * (i.e. encrypted) objects. This feature is currently only supported in
> + * integrated parts.
> + */
> +
> +static bool pxp_is_supported(const struct xe_device *xe)
> +{
> +	return xe->info.has_pxp && IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
> +}
> +
> +static int kcr_pxp_set_status(const struct xe_pxp *pxp, bool enable)
> +{
> +	u32 val = enable ? _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
> +		  _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES);
> +	int err;
> +
> +	err = xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GT);
> +	if (err)
> +		return err;
> +
> +	xe_mmio_write32(pxp->gt, KCR_INIT, val);
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(pxp->gt), XE_FW_GT));
> +
> +	return 0;
> +}
> +
> +static int kcr_pxp_enable(const struct xe_pxp *pxp)
> +{
> +	return kcr_pxp_set_status(pxp, true);
> +}
> +
> +/**
> + * xe_pxp_init - initialize PXP support
> + * @xe: the xe_device structure
> + *
> + * Initialize the HW state and allocate the objects required for PXP support.
> + * Note that some of the requirement for PXP support (GSC proxy init, HuC auth)
> + * are performed asynchronously as part of the GSC init. PXP can only be used
> + * after both this function and the async worker have completed.
> + *
> + * Returns -EOPNOTSUPP if PXP is not supported, 0 if PXP initialization is
> + * successful, other errno value if there is an error during the init.
> + */
> +int xe_pxp_init(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe->tiles[0].media_gt;
> +	struct xe_pxp *pxp;
> +	int err;
> +
> +	if (!pxp_is_supported(xe))
> +		return -EOPNOTSUPP;
> +
> +	/* we only support PXP on single tile devices with a media GT */
> +	if (xe->info.tile_count > 1 || !gt)
> +		return -EOPNOTSUPP;
> +
> +	/* The GSCCS is required for submissions to the GSC FW */
> +	if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
> +		return -EOPNOTSUPP;
> +
> +	/* PXP requires both GSC and HuC firmwares to be available */
> +	if (!xe_uc_fw_is_loadable(&gt->uc.gsc.fw) ||
> +	    !xe_uc_fw_is_loadable(&gt->uc.huc.fw)) {
> +		drm_info(&xe->drm, "skipping PXP init due to missing FW dependencies");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	pxp = drmm_kzalloc(&xe->drm, sizeof(struct xe_pxp), GFP_KERNEL);
> +	if (!pxp)
> +		return -ENOMEM;
> +
> +	pxp->xe = xe;
> +	pxp->gt = gt;
> +
> +	err = kcr_pxp_enable(pxp);
> +	if (err)
> +		return err;
Won't this leak the pxp object? DRM itself will clean it up eventually 
on module unload but it should really be freed up here explicitly?

> +
> +	xe->pxp = pxp;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> new file mode 100644
> index 000000000000..79c951667f13
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_PXP_H__
> +#define __XE_PXP_H__
> +
> +#include <linux/types.h>
Is this actually needed? The only types in use are the locally defined 
struct and 'int'.

> +
> +struct xe_device;
> +
> +int xe_pxp_init(struct xe_device *xe);
> +
> +#endif /* __XE_PXP_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> new file mode 100644
> index 000000000000..3a141021972a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_PXP_TYPES_H__
> +#define __XE_PXP_TYPES_H__
> +
> +#include <linux/types.h>
As above.

John.

> +
> +struct xe_device;
> +struct xe_gt;
> +
> +/**
> + * struct xe_pxp - pxp state
> + */
> +struct xe_pxp {
> +	/** @xe: Backpoiner to the xe_device struct */
> +	struct xe_device *xe;
> +
> +	/**
> +	 * @gt: pointer to the gt that owns the submission-side of PXP
> +	 * (VDBOX, KCR and GSC)
> +	 */
> +	struct xe_gt *gt;
> +};
> +
> +#endif /* __XE_PXP_TYPES_H__ */

