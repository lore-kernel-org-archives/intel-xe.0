Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4FFC61DC7
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 11:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C239310EFA5;
	Thu, 27 Aug 2026 11:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mW80N9rO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CE210EFA5
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 11:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787829694; x=1819365694;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FvsB3BfR6njZ0FOTX7drBrDhWA4g0bvmEVqMRCE1NUw=;
 b=mW80N9rO00RbfUwHzTVJyXTcpUqHRuLQLkt0Tp2+CaAelRFKnmIPAgFZ
 w0vnN+aYkcHDzq4rIaj4loau7U963bMR1PRtVdm3MwQRlK2Ed0qT5pYW+
 lDcrEMibE5PtOey4mwPz8wYIqU7LxdptduRMM7lHNa6iixClAEqsVJSpm
 YIfEf9WnLoa8IU0Ej8gQ+3jfesMhb/uyDmsUQoZFF8lWHcW7ws76gU/ui
 yNfVmIOl9ytNKHIK1LTVtsfkr5Iy5qQ0FJUKRxjdJZYNShXPPSPIEDeP6
 dcEYEwChYArlPouAI5peBu+CnJLS5eXBWohYGlJ/sZBsdb9Yn9iXUYlig Q==;
X-CSE-ConnectionGUID: DkLbjm77Rp2aXkSA2zG9Wg==
X-CSE-MsgGUID: 4kpfsluyRNyetcVSW2yOBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98924311"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98924311"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 04:21:33 -0700
X-CSE-ConnectionGUID: QC0/PSSoRx+D8AsMbFCtqg==
X-CSE-MsgGUID: YVk1+8HCTUS2nAQrdRVmqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="291357978"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 04:21:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 04:21:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 04:21:33 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 04:21:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkQq5VWptQ4YGzvD4lNCXjbghQg2I2epjJ8Oe2dooh1oU/xAdxzqUXVQ+p1ykr2VhDAcfPOdnWH0o7f8fuY4iwRhFc/qHS46/CldmzlogAPudCQnKtIbmLkyWSLSKBdKaYJ8GnKtRPQ05jv1V2+oH40pFGCiGeRpGK7pSDvxoOGZncrTs0fMb9hGl2EdUyIINv2iL5vyDYglgMp5ECR0vCLPtOlzNFdUx4sTeh2vJe60EiCorABATjm8H2bbYRmtqrESuQU35JeFuoS//iHFSWu+JBRHBK+eFRXO666QMLxTlYP7pJBUQfBE7G69BESwuf9THhGAhwaCGZeUBRKHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHmBRl4/r77sKT4N+P4cCTVtR4FSVQ4bdlYzJBXPrFY=;
 b=Jvqx1Qd1fLB8q/as58rMqgenqlkrw+/dqgh8eZtxSUmpggNhKOwUh744uy56OpoNsChYFiWK3RIJpkHkH2N+lxg1wXGUHquBFLJ/E3VIoFqNJTj9KExBrRNNN0SLXmdj6UMkudvha9KeU9CzNCsR2wOf5eAoxU5sd18Q0uiezLLSuj3NY8wRjDSuI7vwhC6vLXyIPbDYtB/Rr4JlWLLYq1XPoN44BxPRaOssHiuP5VuK1W3Q0y/6AP+kuCXffmpsB/9t6OWXsbAJHnp6+3lhjU2ZfN2HxcAgIb+QspMZWqEaL8rcWy4wFU9leTDOKZbqKXSlntud3ftCpOWIgEfbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB7161.namprd11.prod.outlook.com (2603:10b6:303:212::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 11:21:31 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 11:21:30 +0000
Message-ID: <1525b02b-1902-4fdf-aaa4-1562e7c66af2@intel.com>
Date: Thu, 27 Aug 2026 13:21:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/uc: Report DMA failure using SIGID
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Alan Previn Teres Alexis
 <alan.previn.teres.alexis@intel.com>, Julia Filipchuk
 <julia.filipchuk@intel.com>
References: <20260827002801.837731-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260827002801.837731-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0013.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f74927-a8eb-4eb8-89bb-08df042d5811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Tj0/jjhY4XTcctaoRcyKYsTlKaDGuu1fwrsm80hUaexEBM+nhGC8j02Pmzjm36HGJIQtY/JSfpNuKMiRadJaatItbKtWLQCLoRfPJMaRC9Lq0WPqXCNCzE8472G9bW+1FLOmMkkL6P+H4jj/nfgUucJU27BXThYxa/eu1ZckPyrR1YdnEb6KurAgkn6iyfB7z+/Ktz4cybjSRAefPuiZpomfqCGgtQtdxEteK3omTCjQ3U+CHD22F5EuKaQY+XH6GixpP+vN8QbFcgaly2MFcUVxkWYV0D2a62vg6OZb0B20iBoNk8rvEMsmyZE4eW7k0c+kwSe7lXK4AKDerwRWUXQZJDl4jLzewcEIiyJGxP6gYp6lWlj60FIteVi3N19HakrcaSDqHliex3FMfyGhv3HbxY0URAXr0EUlHTcLx4K1fD/ngTUxn0srmCt6GF2WE1wIwbGrqRNL7r0LcyiROlHZAy/wukEH/DOvxGya4cpV4/gFW2lqXpN/jUignMgXmj5GFfP3TFx2gaPNkc69PthaROjE/ItDZnIQ2NvoPU/PBYFN5tbyuvbl1mbyyoG672xXA61jBpXEnt4+e5J+Xo87LZpyHsC+XBsdi/SHkTnTlAxD3qTrGe/b2Uf9NHWaF9cYb8U/1H3DJmz2tgF7Ah1KdtuOvH5JGP2BFItASTw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c04vUUtUdkdDOFo4ZlBWanFVUFJCOGtKc0VKYVBUVDNPdEswS2FNTEhsOTdq?=
 =?utf-8?B?Wm1VMHpwOXBFcFBPNVhLUzBaNTJ3VUdhaG1kQUhMME82d2JMd25lSk9LM3lK?=
 =?utf-8?B?M0RGNlk3MUFiRWlBcThBbHNRTm9UVzJ3eDVEWThzQlZzS2h5aDN4ZVhIMXpR?=
 =?utf-8?B?UHJJak5OWExnNFVTSWdyazdiNVQ2MTlNeWNDL0d0ZTZBMFRndnZma3Q0RUtF?=
 =?utf-8?B?bGRPL2QrRmNjWndtM2FXZVVCZEdibFZBb0FhRDI4WmZBZllNRks1a3dMZTRB?=
 =?utf-8?B?ZkF6NmVsR0g4cWEwVVNnOXZaWEZaZ2JNQklUT2ovYm55WDl1OEtiaU43dVV4?=
 =?utf-8?B?dWxMTFBYQzNsM215M1NYNTE4aWUvSnNzK3F0dDAvWEhVRnNoSHFBMGlqWUEv?=
 =?utf-8?B?NmlqQ1FVK0U3N1ZpdVVYQjBIbXJSZW1ONUkzMEVVOXJWdHR0dldQWitJbEVQ?=
 =?utf-8?B?MnE5ZFRlNCtuUFU2SXJHMWpIWFBXdi9HWG1nbjB4QU5LanJYL2xUb2NmdElz?=
 =?utf-8?B?R2doQjJzUVlaYkVKSXc5RHpZYUNXN3h0OGt1ZmI0YVpGUk9XOCtWMitPRE5P?=
 =?utf-8?B?UnFja2VDa0paNm1ROWFmbVNORlppNzRDVVpWMGdyUFBzZzJQQlJHb2dOY3I4?=
 =?utf-8?B?VFNkbitSaE9Td2R4ek9EbW5Hb3RadUoxNEVDUElDYzFZMy9Xejc0MTlCNS8x?=
 =?utf-8?B?dWJwSmtYNThIRUZOUDhtUE5uT1lGUVZsejlDTDU1d2lWRTM1OHRmSnNSUXdY?=
 =?utf-8?B?L0JKTUtFdkJVYXFqenUyMUxTRWxEeHRUQ2dWSEdpRmNhTjZnZThTRld3cHlw?=
 =?utf-8?B?TDdIaUlGVVgwdms1Y3Fzd1ZPSmVySFRReTdJVkVpWGtmZE0vYXhlcUJSc3Ba?=
 =?utf-8?B?Q09FWjYzdURFM1RVNmZVK0tiajlRZjRzaFBxMDBKLzhtS2U3dFh4aENRUXJK?=
 =?utf-8?B?L0Z3VmdrcWVBd2w0dTU1NFhKTTUwdzMxa2R3V01nQm1rQnZZMWxoU0lzZXdl?=
 =?utf-8?B?Y2w1d1RaNWFpeUpPL25ML3drUDZjTUZDNjJOSXZFd2ZyaWtjUHU3OHViaW52?=
 =?utf-8?B?Y096c01SMnZScE00dHVyTnpOSUNUalBWa3FkRmxkbmxpdERndkJMMWZOWWVI?=
 =?utf-8?B?UGN1YmxieDB6THFIbFRpeXdoZDFUOHFHRmpkM29BZ3M0SC9lWldRUVJTMUVH?=
 =?utf-8?B?NUNTV0J5OGtWTUFFTTR3elh0RHFlQVc3TlRpdCtzVGRaNlZHVVFYbzFTM2Yx?=
 =?utf-8?B?NWdDVFlZenFMVEwrUEFGWHluWGVLbTR3bDVqUUpVRm5rdjJaWFl2OGNjSEJ6?=
 =?utf-8?B?WVZOMUJjSVAvSXFrVlEvbHhNazBNWWh3dFozMEduTDZoS0RDdGduTDlJSDVX?=
 =?utf-8?B?T3NPL3lDVGwwMjFVWnEzQjFPMlJyNFBoSnJySXM1bFhOblk5aTh2UHM5MzB3?=
 =?utf-8?B?TFNmSVkxOE42bk41alYvV0hEK2lMbXVkR0NUdnFBYWVkaXNJcHNKUFJLYjVJ?=
 =?utf-8?B?KzdTd2hWbVUydHRRSkUrMWZvMjIxa1FEbjJvbTgwdlozNk5qNUN4QkliVlhS?=
 =?utf-8?B?Zll2ZkpEa2grc3ZsUnl6UHNkNWJ3bnh2d2d1NDc5bGo3WDJvRlpaZ3REOUZO?=
 =?utf-8?B?eHNIL3g1ZU5FbDQ0M1JEQzJUbnVrV21oLzFVZU16cXpjV3VvRFc2MDBvOGpK?=
 =?utf-8?B?dlhVaEFwTkpoVzJNUXo0Tk1iTlFZOFR0OHhueXRyVmhIVFJTNm9OQXdiV1dH?=
 =?utf-8?B?bUtPOW85akVIYXFZa2Juc1dtZFdUYVpBdzY1RzNGQ1pqb0VnZHF2d1VkVW5l?=
 =?utf-8?B?Njd6LzdXdEJrQTZMZ0h2Um41cXFnbHgzTVl4dk1DamRub1pKc1NoQU5kRGps?=
 =?utf-8?B?aS96RkdsZU1pMjRLRmJnOXhXRjluM0hzWThLOVBFaDZhZE8vblJkd3ZIQytB?=
 =?utf-8?B?WWtodVE5NERWWDVRSEJtRzJOZWVFL255Sk9lTVRzWFMyWGplakNORG0rc3pi?=
 =?utf-8?B?VWV4NUZrTmhjbEtiTDI2RUF6bWJwbStEeTVSaDRSa1E5eVFuZVY4cHo4UjBt?=
 =?utf-8?B?N3ZKbUZTWEFxUzQwNGlEZmVQak00SkRTa0tDS0VLWGlteXQ0dE9wL3ZvRDU3?=
 =?utf-8?B?VFRqQ3FFZmU1b0dGQUlST3lQY3QrcGpPcUhRZmpnVlVucjk0ZWh0TDZhRkVx?=
 =?utf-8?B?OUhUdUpGZzRac2NUQUJUdFcxYkhQNmJPdzh4NzNEcVBMREpNNy9oR2lpRkxn?=
 =?utf-8?B?L0czY2F0OFZ6aGdrcWhpZnlJQWdWcEdCMWh6Y2R2K2Q1U2xyMHl3TERzUU5O?=
 =?utf-8?B?OHpjcEZ5TkM4OVIvRnoxM0dDQWpsSGQ5dUVTTHZWT0lSaHRTQ2JJWnBZY0s2?=
 =?utf-8?Q?jfJ1hRwTfSEEwyTQ=3D?=
X-Exchange-RoutingPolicyChecked: jHQa1Jly1/UPp209TWQlSO4PQXabM8UqAM4YgCoVjhKljR6Gr77fGtu+eWutlQPDj8i+2bhzQ1rb0LilSjwkUzVYuT3Acm41f0SB9xxu1XEcIQfaJFqiuT7zfer9CsXfXNLkEnFUUybfMkqKcA2eAE6ObWEkXmcCd6ausC2Vz031nxwglrEeG/LbDqQVVZHz9Aukr0fHUK2xTFAP5ASu/kkz7SnG+oHX3+J1cub4mmeH/rI+7XOJQxV9sdJ8TKY14/4MjluhOUjKen46KLog8PQQP5QD6+OAEstuG4TrAduDm8lyHrxVrLgJg3cObDy8icvvIYYxiCAPnTXdCUR7yA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f74927-a8eb-4eb8-89bb-08df042d5811
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 11:21:30.8347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkYRTjzSaClkWH69wMsLSD2DsqT823CZy/ZgA8PNRjUv01k7dBtL6FDYSldLXxtl7cvKNWFzNRll/eDcDx8SMxDeNkXjLuE+0uyuHf69Mus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7161
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



On 8/27/2026 2:27 AM, Daniele Ceraolo Spurio wrote:
> Convert the uC DMA failure error to use the xe_log_err() helper.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index e29878b255ba..02ed4f0eaf40 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -18,6 +18,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_types.h"
>  #include "xe_guc.h"
> +#include "xe_log.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> @@ -914,6 +915,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
>  int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
>  {
>  	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> +	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>  	int err;

btw, as this function is for GuC & HuC only, maybe we should add:

	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC ||
			 uc_fw->type == XE_UC_FW_TYPE_HUC);

>  
>  	/* make sure the status was cleared the last time we reset the uc */
> @@ -931,9 +933,11 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
>  	return 0;
>  
>  fail:
> -	drm_err(&xe->drm, "Failed to load %s firmware %s (%d)\n",
> -		xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> -		err);
> +	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
> +		xe_log_err(gt, GUC, err, "Failed to load firmware %s\n", uc_fw->path);
> +	else if (uc_fw->type == XE_UC_FW_TYPE_HUC)
> +		xe_log_err(gt, HUC, err, "Failed to load firmware %s\n", uc_fw->path);

so we could either replace above "else if" with "else"
or add at final "else" some 'not-possible' assert ?

> +
>  	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOAD_FAIL);
>  	return err;
>  }

with asserts added,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

