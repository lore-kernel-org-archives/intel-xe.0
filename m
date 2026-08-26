Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36577C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 10:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B083C10EC98;
	Wed, 26 Aug 2026 10:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMenHwYG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8259610EC98
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 10:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787739781; x=1819275781;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H5H1Nt9mF93KOZOYAH9Tbo1puxFxLwR+ANBYF4voL9I=;
 b=SMenHwYGjWrrKxT6jvxIjUy4+hw07Yqs7K2+RpiylY0heH9+pWoMnN5Q
 GAhamzf9QoF5BrTK+rw1ncHKyFiCmxHPQDbwHEShizkVwkY3Y8j7JmHrw
 QxE1DdQVWeoT4Q1lIOYmngQMvat2WSDSpxviouJACBqQ89IeAe2TJjfJ/
 hCejVUE1fIZnDw/HjhrAgbiBbkmzBsXhWEFA10Hv05xJGT4D6vjCQWsrb
 VaaGL7eMFY4YpPJUW+AF4sBfeavzcKkuTBdukfgtmyM2/U2zbIl88bbdd
 w+HYkdLeMWlyGNfbQcggJs7CsHmXYcRd4A9kjCzWeT5ahJiTlx+9PG7lm Q==;
X-CSE-ConnectionGUID: b/NMDkELR4y9uaTbGJS7qg==
X-CSE-MsgGUID: LXIGj6iFRYODogjeowvt3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="99564047"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="99564047"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 03:23:01 -0700
X-CSE-ConnectionGUID: O1mdbnloTZWlZ5Opf+A1Vg==
X-CSE-MsgGUID: gvbhtDPSSEGo4fq6vooS2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="267561202"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 03:23:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 03:23:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 03:23:00 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 03:22:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LukvB9c0JJ4XBRYi4nFJdr0s+2E9W1kxTeMT7lJ/dgol4Wa0OJFzxNjvyYoezZiGeRBN+3C95kat6RBnpTaNlnTWRTtivZ8oewDhWwyP8F8dTtZnnPetL+rF/e2hjlfFTkJoi4GtDqMHBjSYKm6xUnhby2qqUq4HxsM3pxM5kT71Nk49kuf1/B0T2GfGKBKPfAhTRUMZtAOa/tXsY9DMSPAnF6+1ioaB3De9WDlmPzZvzKyy/t3er6wO3QCOvbOHHfB6FAV5GIsqQToDayMNeC8HUpOa+J4OBcnvV/oeRBEgCNVb4dnPUfYzdvaK6c9jjLal4L6t/pJdvuzwlsS3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUWyMhHSOyhgV9RhSYMeGupbH2PdkLCWK5fo1nCYYmM=;
 b=IPkp+dSVgCdLCBY/PXN/9ezit87nrQNHd93aKKYU/XkI7LpesQrP3X30TuZv7lh+/227eUESXZVfo0AXSVv1gVQbi31xoTVUpI1svetvnKz6KghxnUKZlpvpQRBXRMqnP9ICLOharhZtZhClpfLLVF/3GHFidCoBNSSfbu+zvnRWfjSpJVdzMdfTkj/3RDSn/OMqA9dakOqvRTyPEEsuYD98ebjCbeiXkqbSx/wbhWlL9KBObB1TzYY+nstCXaFws2ZqfejVe/BJkXX75nSA+CAceLxF6zYEKIo40wSzM9OTBueCqwmaesS8cohN0Omzsp/pbDa9l94nbMyYS37NHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH0PR11MB9701.namprd11.prod.outlook.com (2603:10b6:510:396::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 10:22:56 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 10:22:56 +0000
Message-ID: <ca6d9176-df1f-4a4c-904e-80a1955056f8@intel.com>
Date: Wed, 26 Aug 2026 15:52:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] drm/xe/reg_whitelist: Report whitelist overflow
 using structured xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-7-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260819191442.1957986-7-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH0PR11MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: 041e6b5d-b515-4119-29f4-08df035bfe7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ra11BduwwjOJobzeYURx4ktBeB/Y8jOs88+nGmA5jAS5wTg3F1Eb0IrHV9nuHaCQ6ecCtSdYe8zCKCsIh/1UvEA+7SFT06yAUAfXz2HyCEAwIn3LDE1kSoUvwRXIIecuXQVbu7oAnlvcIJB5LLG+pf7a0caqq0MBh4K1P6FIVNzhDvYRxgUX1cQksQwe3KsZ8InIaq0CvavGOtELNxBECEMvvTfVg+Xmr5EiMSOS3Kf5+5igj2Vme9TS61IZfMm5/1NwbN8JN8RgEqQ8b3wZk859YynDYuecSxgBxnb6Uyz4tzpss8sVtd+KiX4kNmNNYNB91n2Tku0wy5y9TrnAGHRvgioO15Wfz27bMQ/iC7yeAYdWUo7zTgZnRMW6pcfN5tf91AkuTIrDDXgzANdmVuiucR699ZV/42h783D/ZwVj9+NlJXa42Zy/0erLUbSWSCptHL7lxe45KXyj029J5F/AV9l+mZjh7atdS6h2Hxwa8UQhPQ+eA9vkcN0NjdKIw0DqoZw0RXNQcjoDIzF4MXwwl3WKfydLfBwKm1lcaUvOjodz2BegSEdKtZovhpRBHmb8H7JQ8icjhQ3xl/rp8mau5L20IpLoy+vZYUNu10yFDjYLZX1ESKv29YyWWEeqVQ2e13aDHl2khs3MTUEQvCpAn7bOteTwcnqQg89cjJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVM3UnFKVGgwTGV4ZW9PUUMrempaQ1poSTR5dnlHaTZWZ0RrQmh3d2JUQ1BU?=
 =?utf-8?B?RUs2cW91OVZzRDZEd2w1amJmUTMwY25Gek0vQ3diSFRWUUtTVlE5aml3bFMz?=
 =?utf-8?B?VmN4eHdBS1J5UDBLNFFWOTFCc2tHWFl0K2poTFk0OUdneTRVYW9tVVQ5R09h?=
 =?utf-8?B?MWZnUmhEaGVRTE5TWGlINTE4QnF5RmY1Zk1mbXQ5aDNvMGI0NkdXTE5tRXk2?=
 =?utf-8?B?Z2RtT2pGTTMyd0ViYmFaQ3owS2JhbmFjNzRuekl5NDd6c2szanpBd3REZ2Nn?=
 =?utf-8?B?d1pXbHcrMzN6bUl0NVlxRUFaSVFpZFM4K0NSTXJPK0I3MXExUEt3NTJtNTNU?=
 =?utf-8?B?MldRdURPdTdSMlJmT1lTYk5QM3V4UkdGc2Qvckt2MHZscVoyOTZ4d2Y0NFlo?=
 =?utf-8?B?QVJHSzNoaTE1blRvQ1oxQ2xOWmdZRGNNWjdsZVVRTmRSaGptLzNtM3l5SjRI?=
 =?utf-8?B?K3ZXRnN5TlhuWDk3OGE5WDJKUkx3M3VCN2kwZXBSVjRwY3psZFErM1J2TGdF?=
 =?utf-8?B?aThWaVNQeTllTTV4ZERjWFNURG5Palc5Uk4yY2FRMEltbFpvckJOUzBZUFBk?=
 =?utf-8?B?dDFYSFFod20vc1JuVEMycmFVbHptQkVsbDBoNVdXUlFhQWRkSkx2VnhucGJu?=
 =?utf-8?B?ZVF5UnI2SXNrckVyQ2VnSFRsakl2cWtUOHNBa0p0U3NENDFwdWhUeXlBcXp0?=
 =?utf-8?B?eDFOb3VCQWJKTUxZVVV3RnMwODlNZmcwMTdLTEY0ZXdOMU1pTDVFWEZTRnl0?=
 =?utf-8?B?Qk9RQ3BoMG9KbU5rS3FITzg2OFZjakJ1d3dhRkdMSzlhcjFOd1FEVXVSNGlZ?=
 =?utf-8?B?MVArS0FLaGFIZks1VHlxbVlaZkdvYjZGV1p2VE83TTdyZTVXT21HV3ptaDM3?=
 =?utf-8?B?UDdmQk1JOXdvdDc4YnFvdUQrRUZ6cnBLMkVsaGxjVU5uYWo2WjA4ZnJ6VUs4?=
 =?utf-8?B?eHV4ZTlhbEE5WDFNNmlkUnBha2lxdU9hOENhSkRSVUdQMi8xejdRcTNJTlFZ?=
 =?utf-8?B?ZmpTZGNVSFBWSU5FMEFMd3pJTnJwT1YvY2NrVXlJWlBMREJlanpPZGtmNS80?=
 =?utf-8?B?YXFtbTY4ek54YnkzS3JvdmVRUUU0RUNYNllsNlFNanJsWW1pdXphbW15VXFR?=
 =?utf-8?B?dDVSQXlLY3kzSVJGQWhMekM0a3N5L3FWMytFV0VQaU1KazdKVHZ0MWt6WkZ6?=
 =?utf-8?B?QkZiaHMvcjNZMEJ5WDlxTGtwWTZvNTB6dG0wUFM2WWw1NStDTXE2WDJZZHR2?=
 =?utf-8?B?L2kyOWtIVDBWSkg3Y0hWRVJzRSt0TWxkbGRuemk1ZDYvVnVyRFBWbFVjOFFt?=
 =?utf-8?B?RnpMQ2JCRDVySVpreWlCSWFkWEY5endpTFd2VVpLMHVPZ0RQNndYVUxtU0hi?=
 =?utf-8?B?N0tTd2ZkZ2VveEhYUEQ1NjBiU2pWSTNkbzIxNE1RbUwzUC8rZ3pKQnZKdHNt?=
 =?utf-8?B?WkJXOUEwWnhkcWRFNG1jYWZnb1prTnFnajFEQ0Uydllqa0pNaXRQSkl3R3A0?=
 =?utf-8?B?UTJ2WGw2OEVEOVdkdWFwZHl0NkVTcEs5YUcvMEdvVGh1cDhNWmRkakZtam1w?=
 =?utf-8?B?anVvKzlSS2pnbTZZTEJ1U0x4a1VSQXFmQnJRZWVneVlYRmlCZVl5Zi9wek0x?=
 =?utf-8?B?TmM5SFpVK3UrUWlXRlVPam00Snc5U05jVWRFRzkxZnRaWTlRWTc5YlcwQTBM?=
 =?utf-8?B?dU5OV2xpR29TVUJGcGczR2RpcFMvWHFqVEFRaUhTVDB2RlhlWUcvK3BSVW5T?=
 =?utf-8?B?OHVZNzd5Kyt1UzF6Mm5ERTdqUlpVZkVXdW5ZRWYxZWxLbXEzZDZlOVpBZjhK?=
 =?utf-8?B?V3R0QlI3V00rRVJQUEtmVlUraHEwcktUb1pDQkRuR21mSVliNFczSFBrdU1C?=
 =?utf-8?B?dzE1U3dIdGpTNnpFOVRLclRiUkI3TlJyWTJvY29EQWNrYkZpeTkxemgyY0pN?=
 =?utf-8?B?UGlOcnlHd28vUGNIaTJPVGp0NUdPR2laMENpczZPWEhNRXVuOStlM0RoMytY?=
 =?utf-8?B?UzFLT1ZnMWJrcndHOGtBN3pUL0E4K015K29GMXQraWcwdmYwcVZFUGl3ZStX?=
 =?utf-8?B?bTZMc0JTWmkxS2NybS9GOExYTkRKOHhvSER4QWpyNFFMQUErcCtKZzRVcXRl?=
 =?utf-8?B?WXdCd1AzVThyL0NWeEEyWFI5NE4xcEwyK3g3RStkSUZpdVB4alBuaGhBZkxv?=
 =?utf-8?B?WTcreVRTMXM1d09rUTZmaFlLNlVESGpyT3grQ1pFNmVrYmlRY1JvZm04b0JH?=
 =?utf-8?B?eEVscFF6RmhKN0t0alZTL2tKVlZBcVdmaWt3TGVsM1pIcllCQkFxWUpzMDA2?=
 =?utf-8?B?M3k3QUhodkR4UzlwcjBVMFBNSFQ5NG51TDdYNVp4d2lGUlp0UGJpYVU3SXJD?=
 =?utf-8?Q?SHJFJ3egVUQ5SMA8=3D?=
X-Exchange-RoutingPolicyChecked: VcZ0gF4zRvh91vU13yzxtH0ECEaqTG9+kS04ojGErDtn2buyW5aEJmUxOF2X1AIS56pXSXY8yjUbkzG/N3AVraWwTd9ZKyR2VUiU1DlICsrHeuIGOrelnzbbsKvwGphI7mi6zRkE7xpQUoeQhqsD9ooJXTWfjpfIrYCNG1pSTOBJO1vCP18UWZfBJBJmdeA280gmiYr89YhY+cuDUwu2oiM11oH0CNfB6J5qUdGTMARsC3t5Yo3LM/0tg+YuM+IOf0Qg2JwitThL46KNMeMngIDBljysFhdEYCITTkiGeaTkMzCou5JWwalRNNjaEIYvKYLmOJc6FbeAtRTWubpOVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 041e6b5d-b515-4119-29f4-08df035bfe7a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 10:22:55.9973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EADTC2A9IcrJNnD5F0TNJxcxEG6rQ7sZiZG4aHdP/kR74cInbcEC1PkTKR9bY+1nK0AEfka36lxvebtRvqNxSoSWG3eT9gktwpkuN5y6tIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9701
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


On 20-08-2026 12:44 am, Dnyaneshwar Bhadane wrote:
> Replace xe_gt_err() with xe_log_err() using the REGS component tag
> when the maximum register whitelist slots are exhausted.
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index cab1b578ca0e..d58c31b30199 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -14,6 +14,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_types.h"
>   #include "xe_gt_printk.h"
> +#include "xe_log.h"
>   #include "xe_platform_types.h"
>   #include "xe_reg_sr.h"
>   #include "xe_rtp.h"
> @@ -186,9 +187,9 @@ static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe, struct xe_reg_sr *in
>   		};
>   
>   		if (slot == RING_MAX_NONPRIV_SLOTS) {
> -			xe_gt_err(hwe->gt,
> -				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> +			xe_log_err(hwe->gt, REGS, EPERM,

nit: xe_log takes negative error number. Errno should be -EOVERFLOW right?

Thanks,

-/Mallesh

> +				   "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> +				   hwe->name, RING_MAX_NONPRIV_SLOTS);
>   			break;
>   		}
>   
