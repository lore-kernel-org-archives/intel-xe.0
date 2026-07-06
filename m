Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A271CC43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 20:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6294110EAC3;
	Mon,  6 Jul 2026 20:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bET642wn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4476B10EAC3
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 20:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783370022; x=1814906022;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xKgTakBH9FLKtP+XOKk5g4WzEtyqsEAHoasfwAyfbPg=;
 b=bET642wnQP/lPZqZ5pCFGXHb3bIfVIHH8Gz4Wki993wjvtuoCIqDNmig
 lOEHKa8Nvbuqk/+Xnwtx4ypgTiSiz9frpn78U4dNnX5LPSAJq6mTv+FCa
 XIw0qO5+x/kD8aLGkuaeuKrxDOATzEpZjFMVFOrXrMVs4GmfPG62AVYM8
 OXHhM6hCCKS690ftM7W4gBfjt0nr6csJq2HHB+kvagtOHe9TOZ0gYxQBq
 H8lTZHwDNMAR/J9Lma8wvx9JfXZQtFxXOLysUhRWEWWT7MJTV8PNPMtUl
 Tj+/d4SKmecegeFWBk4A6WaYpyPfO8w50jyy/qU4a+665Nhwi07zpbbiN g==;
X-CSE-ConnectionGUID: nZs5sDOlRo+ZSX94dP7ExQ==
X-CSE-MsgGUID: 6nWYLEKjT/O/czGGqztjpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="95527160"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="95527160"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 13:33:42 -0700
X-CSE-ConnectionGUID: n6d8XDURSJ2h8VNY/G5WVg==
X-CSE-MsgGUID: EG/QsxSvTvmF0O4DzDt73Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="257386045"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 13:33:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 13:33:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 13:33:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 13:33:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6sLoSiWy9zhYP0t6VaYVpmKm6g/B0zjFY/jY4DJC42A7BRh1Vx8ykycWYJXbimqv/OHSscIElR1vCtKo1TqaNQSQcs7stT8OiVL8Wjo7N7TP7R4+j5C/eNBzXZtip4hD8mtpmBtrNv1128jDHpmqVkbdLo60t8KZydVdavyIGASAneY1GckgyS/+6arKklwDSeL9w/FJBh8q0Elxl0EPjvkrRRi9GkPiL+EowTvGUKYyRCeaeqlMYL4SrwLvglbky0E5+/ypgaa6dn/8q447A0YA02gyg/XeXWC9f9Y1WJxbl3TcEerYAVzXg6n+ajoBI/5fs52CRisGU0XK4C+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFeCiV82eviTO11LHAZYL6WlseteVqRiVRBrpygEMbs=;
 b=yQhWys4LnsixqFFNNOTyAbY4wWmb6pBvEDOeEqvpukhk33xlnTcFsxQ/HXSeG62jwB1Rcbr7ik6ppENSss/wJ8w7Rn+/EXqVP8l0zYfjtuAslfft+8LwvboIhzF0LhNAZziLvGmra1h7Sb9u713Q5jAEEEGoxeE/29nzu1snVxHWzV81ZWNcT5VOJGZxwde5Zyk6MwNUgrxDQDL17yPt16uIGVkdL+EHaTBGhQ6KxGZxNLz8zBVzb5IbtLSR2NmAujweyXr8/W9oUaJf6oUkteK8KG2FEgJ+tNNrGtvpsZSmTclljsk+PbWWqvPNw8YSKC3Qo/M23lQuIc6WbxpHeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 by PH7PR11MB8122.namprd11.prod.outlook.com (2603:10b6:510:235::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 20:33:34 +0000
Received: from SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f]) by SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 20:33:34 +0000
Message-ID: <ec8c3b7a-cc56-4432-9341-bcf46cbeb1c9@intel.com>
Date: Mon, 6 Jul 2026 13:33:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/1] drm/xe/guc: Handle GuC local uncorrectable error
 notifications
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260701235330.3005426-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260701235330.3005426-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To SA2PR11MB4985.namprd11.prod.outlook.com
 (2603:10b6:806:111::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4985:EE_|PH7PR11MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 80837afb-b9a4-4800-ef4f-08dedb9dd9f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|56012099006|6133799003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: BaX6Lu4P+TWhgOWr+wNs/hYS8xpOK0jd86TMk8DJdaOJi49ndwew7yZ5pftRFvJBEQai/wZM5/D4BWqmW5tLgQEBqn7FgHFIu7PHb93ZY3bnPRTG5+LkRKZxQXhvUS5XDWZnP427tsAPz3T+384mO5/qnoR0jQHr8wlj1AT4O2UpcV7gj04V52QuSJJYPRGewmcU9Js/q1YZzKGeR2md7qdVmipBLkHm+EhSUiAlKJ0qGk+Z9j6tdqHYlhx25t5Tr4S1rpR0jWY8ysSJezc8aXS9ZiwRQhnpS9NkAf0xBP/xT+zHPAH8ytF+lDFzPEJwrMTXyAwj2aekiML/BqOwLn/LcxjE3aPz3UieqlrQjMCbBsmqe2+IQ0DCKPBMvMIqZsdv5vLFbpCAxAKsXESPmF7aVCxgfSEDUCFMxCAnDEphQKb+re2MxstCQHB3dJPA909qcZuYVGHGtdvF4gdWZa4Ldle8KTi0mp7lS2/OERwkNSoig+cUMFSpGcxEhHax2dHw/3B1asAwqnz0cIUWHa0Y2GDry2xnTjASnt0eI3OSjxIONFBQbCJHkBn47Jd7HryKCP+aW/OeaXJ/3VxYeatj72lCrTtlaVv2QD+8TBEN6ybY9T2ngR3XblQn5YzKb8edD38J+bIL8W9wb+bPKjtYvCbBZ+T7OSTR5dPk23I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4985.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk80emhEZXlETU9ZWFFVQnlMVnJZeE1FajRibnBacm82bUc3Q01LRmpodkJl?=
 =?utf-8?B?NE5paEdMMEtNQ3ZlaEk2T0xzWENkS2N0bFROWXRlaENOVitTdVBuNEM2aExa?=
 =?utf-8?B?UVczaVI1YWFuRWYvdDVFUmtXQXkvVWxwU0NDM1psWjBYU21XYnhKQk1taFFS?=
 =?utf-8?B?dFBjUTE5R2tQcG9oQ3JnVGpPZ3FhMDhXYktLUXFVNlgyL0JBcXNsVmdwR2lG?=
 =?utf-8?B?SDRnNmlOQkZVOVVDSkpuTXFLaXhBalJBdmpJR3NlWCtBM0Vyb0hvVmg3NllI?=
 =?utf-8?B?cm9jNzlWaVMyeldKNDdMTGEwZ1J0SXgxcExYbDNFL01VbFF5Sk5DelNkMkRk?=
 =?utf-8?B?Y0lEWlFIdzhac0ZFVVRYLzR5SlhxMUVzc2M2NDZHc1ZrT0VLNm12d0RmenE4?=
 =?utf-8?B?TEt5MHVaZ3RMWXZEenFHQ0U5YjhZZUQ5WW1kYlN3ZUt3TmRLY3ZucFk0aUJx?=
 =?utf-8?B?UmVtbXR2ckJoNDJpNGU4OUxkMGVxQnhsTWY4czlsSzJDalV3N2JQWmpLaHU2?=
 =?utf-8?B?ZExVSktDZWt4MmxHS2k5R3RUVVJ6MkhPM3REVTZYMFVFanlyR3FRcWZ2d1Jo?=
 =?utf-8?B?eExwRzZybDRGTFUvanY1NFN6ZEdEVTdUZW1PUnp5dU00NXVmOUV4d2tJcWtE?=
 =?utf-8?B?VmF0enRHM3lFOFlQdFdXckptVVBpV2xmdCsvUmRnLzhxL1Rua1dxamhCRDlm?=
 =?utf-8?B?YTNtRjltRTAweDkwZnYvZCtWMUErTE5oS2MxdDRGVGdDcDJ2N1BhK0NuclFU?=
 =?utf-8?B?aC9sNXd3dFRwRkFkTS9ScUlDNVc2b0EyMXVpdDhiY1UwYnIwYy92TTFjNUFt?=
 =?utf-8?B?bGIzVWdKOThXU2RPZW96UXA4WThETHM0QS9FMmhjY2prTXZpeTdBVklzSStZ?=
 =?utf-8?B?Vys2Y1N0aUtHL2M3cU1qWjdDZVZLdXE3VmtpLy9UVG5NcnBwMmhKUHZuWG5Z?=
 =?utf-8?B?eGhmem53SStJSXc2bVFud2RUUDJSeTI0VWxIZHZoa0FFTGN3MjVYTVVhVGh4?=
 =?utf-8?B?NDNaMk9QcTkxclBHUXc2eWttYjVqZjdiQmwxVkgvS1lZVFE3K0JqWGZMejNs?=
 =?utf-8?B?N2RZNEFYZDhWM1BIVEcyNG9JMG1WR0JWQmlkdFRKL3RMQ25KWXUwbWpIRHZH?=
 =?utf-8?B?aXdHN0I3V2tNSDdzekw3aEUybzBFTjhwKzk2cUFxM0tWbGhETkZVT3AwU3dZ?=
 =?utf-8?B?UEhlL3JxckkvVWRxY1c5N3ZJMExBVXBTNkJpR25mNlRMV2JWOFI4b3dyLzYx?=
 =?utf-8?B?Yks4YnNwN01yS2FCUGJxaklqTDRFaHZQVVJyZElrdHFCT3N2YU83UmZLSlVY?=
 =?utf-8?B?NXZnMlRwTDd0eCtvQkJJN28rbmkvejVTaTNIcU1jMTV0bnpDcWZMMjlUWGJN?=
 =?utf-8?B?cDNETW5Wam1KdmZYc0x5V3RlTTNrbE1kUG8yWW9IUTM2cjIzQTEyU0E2T2Rs?=
 =?utf-8?B?N1RFbFNrTHpFZmQxTTZla3dVd29zQ2loRWxvT2UzdVhvblc0VksyR2l0NGtM?=
 =?utf-8?B?bndrQVBIeGJVcFB4ZmN4blk3WnNqOCtMZkg3bEduSGJPYXhIMmY3UGNLN1Q3?=
 =?utf-8?B?QnJZdDd1b1VVa0MzZGIvekxyOWsxa2xNWUpVdk52ODVtRzFCNTVzQzFCZEhX?=
 =?utf-8?B?NWFwQTNhYzV6ZUpYaFBNMElaZUNWYU5kR0Y3cnYrbGV3UTM3U1F6Vm9YMnd5?=
 =?utf-8?B?bGt0N25TbGExeDJwYWFXWDVXRThlNWxsbFU3cUNtZGM3bUNhVUlFdDd1dVJ4?=
 =?utf-8?B?RkE0cWhURXJ2RU1peGtoNnc5YklzQktXQThacGRpSUtSN2RMa3NrVzJTVDlF?=
 =?utf-8?B?bXNCaWN4Z2ZEVFZKMzIrR2p2Mk83Wm5CR1Nqa0tEekwxbVRMdCtmMzFnTjNY?=
 =?utf-8?B?TGQ5UHpUTlBtdFMycHNTcWtXYzMxcnkrRFdZaHJmVk5pUGQ3bWhUQ2pVS1BM?=
 =?utf-8?B?eDZydkQrQkUyci91YS9HSmFOcklBZ1FXeW4rR0U5MW1FY1dOMkhvcVoyYlZ0?=
 =?utf-8?B?TXhDbHJlTCtBbXloYUh2TFJwUXVWUk56dU1OcWRkWGsrR1pxbmM5WW1jM0N2?=
 =?utf-8?B?dW0wNGlmZjBsYWNSb3NTa1ZGMFc2U21rWUcxejE1N0c4TDVvZ0sxcWswQjlz?=
 =?utf-8?B?NnRvRzJEb2JKVE9LSGRoSkNNdUlna0wycHNxdGNrUU9NUWRVYndNdUlOcEpx?=
 =?utf-8?B?YS9yN2xtSHJwYi9PbWIwSmE3VkF1U243SktoemJjZjVNeVJMM0QyMmJMVFV0?=
 =?utf-8?B?UzlRVjJXeHVndllwdit1TDExQ3crc1JiYmRCaUFERGovVlJlUG9kV0tVVDRL?=
 =?utf-8?B?Z3Rsb3J3azBlVTgvMkJ5WjJVdzZRUGVtd3VwTGJyQjlLZlpLQzhkRFloMkd3?=
 =?utf-8?Q?4aeimqBZ3jvBo7oI=3D?=
X-Exchange-RoutingPolicyChecked: fdNN7i213mm8Fiuz94X8b2My2KK1XQxnAVerCGRu5555Rt/mRA59G/u9080CVfCeF3vshdIqbmZ85wvWZYD5IMenDbBjV6t1ksT5DUwG2Kv48uDTiNM0AWO6WCTHl4kST2LpjoD9sZToDYBVjukmDG2xf/uVAoIFbnsEc9wJKvqXEisV+wHFWp1PIcfIC3gl+pzG0d3RZeMSnDZFR98oITtBuWmQN+HsjpNTEg0Dzg6LfRn/7kr74zlQw5UYNsUq/VxPE339JCXOECZICKUXdhSf3WMhi4HRRMMK2DWp2n1/qDIcA7z1XPAO8Gho+EqEoozG9EjB3SUjxHZbUoApmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 80837afb-b9a4-4800-ef4f-08dedb9dd9f2
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 20:33:34.7561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mPfgW/SplqY32194ypKKpaT8qWmGQ/jwuCV9I0ZDyLCxhzLnahXB4PqbRTENUFb7p+UpFXwsRgXdXIlz1fXqkc3Y0TmZ+ekQnhje986t3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8122
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



On 7/1/2026 4:53 PM, Zhanjun Dong wrote:
> Add support for the GuC uncorrectable local error G2H notification and
> opt in to the feature when the submission ABI exposes it.
>
> When the notification targets a known exec queue, treat it like an
> engine reset request and route it through the existing timeout cleanup
> path. This keeps the queue teardown, pending job cancellation and error
> capture in one place instead of open-coding a parallel recovery flow.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>
> ---
> Changes to previous version:
> v5: Switch to opt-in by has_uncorrectable_error_reporting in gt structure
>      Add has_uncorrectable_error_reporting to xe_graphics_desc, xe_media_desc
>      and xe_gt structure
> v4: Optimized GT and silicon version check.
>      Remove wedged mode==2 handling, which is handled by other feature
> v3: Remove not used flag bit and timeout worker check (Daniele)
>      Remove wedged mode==2 check, which will be handled in separate patch(Daniele)
> v2: Opt in for Xe3p only, excluding media GTs on NovaLake-P which don't support the feature
>      Remove timeout bypass, which is outside the scope of this patch and can be added separately
> ---
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  8 ++++++
>   drivers/gpu/drm/xe/xe_gt_types.h         |  5 ++++
>   drivers/gpu/drm/xe/xe_guc.c              | 10 +++++++
>   drivers/gpu/drm/xe/xe_guc_ct.c           |  3 +++
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 33 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.h       |  1 +
>   drivers/gpu/drm/xe/xe_pci.c              | 15 ++++++++++-
>   drivers/gpu/drm/xe/xe_pci_types.h        |  2 ++
>   drivers/gpu/drm/xe/xe_trace.h            |  5 ++++
>   10 files changed, 82 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 83a6e7794982..f5c9b37038d4 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -152,6 +152,7 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>   	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>   	XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY = 0x6004,
> +	XE_GUC_ACTION_NOTIFY_UNCORRECTABLE_LOCAL_ERROR = 0x6005,
>   	XE_GUC_ACTION_TLB_INVALIDATION = 0x7000,
>   	XE_GUC_ACTION_TLB_INVALIDATION_DONE = 0x7001,
>   	XE_GUC_ACTION_TLB_INVALIDATION_ALL = 0x7002,
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 644f5a4226d7..5c428f02a642 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -154,6 +154,11 @@ enum  {
>    *      (instead of waiting the full timeslice duration). The bit is instead set
>    *      to one if a single context is queued on the engine, to avoid it being
>    *      switched out if there isn't another context that can run in its place.
> + *
> + * _`GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION` : 0x4004
> + *      This flag will enable notification from GuC to KMD via G2H message
> + *      GUC_ACTION_GUC2HOST_NOTIFY_UNCORRECTABLE_LOCAL_ERROR upon receiving the
> + *      same interrupt from the CS.
>    */
>   
>   #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
> @@ -162,6 +167,9 @@ enum  {
>   #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY 0x4003
>   #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_LEN 0u
>   
> +#define GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_KEY 0x4004
> +#define GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_LEN 0u
> +
>   /**
>    * DOC: GuC Scheduling Policies KLVs
>    *
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index e5588c88800a..0d234160ee3a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -144,6 +144,11 @@ struct xe_gt {
>   		u8 id;
>   		/** @info.has_indirect_ring_state: GT has indirect ring state support */
>   		u8 has_indirect_ring_state:1;
> +		/**
> +		 * @info.has_uncorrectable_error_reporting: GT has uncorrectable
> +		 * error reporting support
> +		 */
> +		u8 has_uncorrectable_error_reporting:1;
>   		/**
>   		 * @info.has_xe2_blt_instructions: GT supports Xe2-style MEM_SET
>   		 * and MEM_COPY blitter functionality.  Note that despite the
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4023700ff2a9..543f3992bccd 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -12,6 +12,7 @@
>   
>   #include "abi/guc_actions_abi.h"
>   #include "abi/guc_errors_abi.h"
> +#include "abi/guc_klvs_abi.h"
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_gtt_defs.h"
>   #include "regs/xe_guc_regs.h"
> @@ -641,6 +642,15 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc)
>   	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
>   		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
>   
> +	/*
> +	 * The uncorrectable local error notification opt-in was added in
> +	 * GuC v70.38.0, which maps to compatibility version v1.18.0.
> +	 */
> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 18, 0) &&
> +	    guc_to_gt(guc)->info.has_uncorrectable_error_reporting)
> +		klvs[count++] =
> +			PREP_GUC_KLV_TAG(OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION);
> +
>   	if (supports_dynamic_ics(guc))
>   		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 21e0dad9a481..fe6a55fe7fb5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1661,6 +1661,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		ret = xe_guc_exec_queue_memory_cat_error_handler(guc, payload,
>   								 adj_len);
>   		break;
> +	case XE_GUC_ACTION_NOTIFY_UNCORRECTABLE_LOCAL_ERROR:
> +		ret = xe_guc_uncorrectable_error_handler(guc, payload, adj_len);
> +		break;
>   	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
>   		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
>   		break;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b29cc08e6291..29ccabc4b7a4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -9,6 +9,7 @@
>   #include <linux/bitmap.h>
>   #include <linux/circ_buf.h>
>   #include <linux/dma-fence-array.h>
> +#include <linux/workqueue.h>
>   
>   #include <drm/drm_managed.h>
>   
> @@ -2997,6 +2998,38 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>   	return 0;
>   }
>   
> +int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_exec_queue *q;
> +	u32 guc_id;
> +
> +	if (unlikely(!len || len > 2))

Only len=1 is valid for this G2H

> +		return -EPROTO;
> +
> +	guc_id = msg[0];
> +
> +	if (guc_id == GUC_ID_UNKNOWN) {
> +		xe_gt_err(gt, "GuC: Uncorrectable local error! guc_id=%d\n", guc_id);

printing the guc id here is not really useful since the ID is unknown. 
Maybe just say "uncorrectable local error with unknown GuC id" ?

With those addressed

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +		return 0;
> +	}
> +
> +	q = g2h_exec_queue_lookup(guc, guc_id);
> +	if (unlikely(!q))
> +		return -EPROTO;
> +
> +	xe_gt_err(gt,
> +		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> +		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> +
> +	trace_xe_guc_uncorrectable_error(q);
> +
> +	/* Treat the same as engine reset */
> +	xe_guc_exec_queue_reset_trigger_cleanup(q);
> +
> +	return 0;
> +}
> +
>   int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index b3839a90c142..ccade320dc69 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -34,6 +34,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>   int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len);
>   int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>   					       u32 len);
> +int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len);
>   int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>   int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>   int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 78fc2e4dcfc6..54355c90860a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -119,6 +119,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
>   static const struct xe_graphics_desc graphics_xe3p_lpg = {
>   	XE2_GFX_FEATURES,
>   	.has_indirect_ring_state = 1,
> +	.has_uncorrectable_error_reporting = 1,
>   	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) | BIT(XE_ENGINE_CLASS_COMPUTE),
>   	.num_geometry_xecore_fuse_regs = 3,
>   	.num_compute_xecore_fuse_regs = 3,
> @@ -128,6 +129,7 @@ static const struct xe_graphics_desc graphics_xe3p_xpc = {
>   	XE2_GFX_FEATURES,
>   	.has_access_counter = 0,
>   	.has_indirect_ring_state = 1,
> +	.has_uncorrectable_error_reporting = 1,
>   	.hw_engine_mask =
>   		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
>   		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
> @@ -150,6 +152,14 @@ static const struct xe_media_desc media_xelpmp = {
>   		BIT(XE_HW_ENGINE_GSCCS0)
>   };
>   
> +static const struct xe_media_desc media_xe3p_hpm = {
> +	.has_uncorrectable_error_reporting = 1,
> +	.hw_engine_mask =
> +		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> +		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> +		BIT(XE_HW_ENGINE_GSCCS0)
> +};
> +
>   /* Pre-GMDID Graphics IPs */
>   static const struct xe_ip graphics_ip_xelp = { 1200, "Xe_LP", &graphics_xelp };
>   static const struct xe_ip graphics_ip_xelpp = { 1210, "Xe_LP+", &graphics_xelp };
> @@ -185,7 +195,7 @@ static const struct xe_ip media_ips[] = {
>   	{ 3000, "Xe3_LPM", &media_xelpmp },
>   	{ 3002, "Xe3_LPM", &media_xelpmp },
>   	{ 3500, "Xe3p_LPM", &media_xelpmp },
> -	{ 3503, "Xe3p_HPM", &media_xelpmp },
> +	{ 3503, "Xe3p_HPM", &media_xe3p_hpm },
>   };
>   
>   #define MULTI_LRC_MASK \
> @@ -860,6 +870,8 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
>   	gt->info.type = XE_GT_TYPE_MAIN;
>   	gt->info.id = tile->id * xe->info.max_gt_per_tile;
>   	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
> +	gt->info.has_uncorrectable_error_reporting =
> +		graphics_desc->has_uncorrectable_error_reporting;
>   	gt->info.multi_queue_engine_class_mask = graphics_desc->multi_queue_engine_class_mask;
>   	gt->info.engine_mask = graphics_desc->hw_engine_mask;
>   	gt->info.num_geometry_xecore_fuse_regs = graphics_desc->num_geometry_xecore_fuse_regs;
> @@ -905,6 +917,7 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>   	gt->info.type = XE_GT_TYPE_MEDIA;
>   	gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
>   	gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
> +	gt->info.has_uncorrectable_error_reporting = media_desc->has_uncorrectable_error_reporting;
>   	gt->info.engine_mask = media_desc->hw_engine_mask;
>   
>   	return gt;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 5b85e2c24b7b..a3a0782aa9c9 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -78,12 +78,14 @@ struct xe_graphics_desc {
>   	u8 has_ctx_tlb_inval:1;
>   	u8 has_usm:1;
>   	u8 has_64bit_timestamp:1;
> +	u8 has_uncorrectable_error_reporting:1;
>   };
>   
>   struct xe_media_desc {
>   	u64 hw_engine_mask;	/* hardware engines provided by media IP */
>   
>   	u8 has_indirect_ring_state:1;
> +	u8 has_uncorrectable_error_reporting:1;
>   };
>   
>   struct xe_ip {
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 750fa32c13b2..2fe8f89a1e34 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -213,6 +213,11 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_memory_cat_error,
>   	     TP_ARGS(q)
>   );
>   
> +DEFINE_EVENT(xe_exec_queue, xe_guc_uncorrectable_error,
> +	     TP_PROTO(struct xe_exec_queue *q),
> +	     TP_ARGS(q)
> +);
> +
>   DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cgp_context_error,
>   	     TP_PROTO(struct xe_exec_queue *q),
>   	     TP_ARGS(q)

