Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB38CCF2C4
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 20:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6361A1129C8;
	Fri, 16 Oct 2026 20:43:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038A51129CC
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 20:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792183389; x=1823719389;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DliU+AtT+yja6la5qCnvYtqOjlC6RpWA2aH0t5DEE4M=;
 b=nEWbFf0uwy6J9KF6UFJlDdJA9eeR8/xbjrZFy0Bd9rXTK+jHBnWfO5Cv
 EFHAkRkLsnHr4hb1aVGcgDLnvnJKidDyKmjZtxZ7V+c4EMxpXLql7321R
 Iu8h6WZM8/EMap5ToKxWbutvfciKoM9afD75J2I0tL6fLSETEEyA4UKRs
 k6GA9Ke9AbBqWJ44bxo/wLc7j5/SYqVmgQ5ofe3Ky5GM2T2+xlXqoRUdl
 xgCqSxdOM3PeWbZ41E6Np2SjxfO17DUBFbp+oJWgDiEgU3RroFZ8m2bA7
 tNpK8Ackq00A+OuBvpxycNmYjihOLaNIMWTrm+Mswxwz5Fr0sy/g0q7fR w==;
X-CSE-ConnectionGUID: 57xGc8fzSqC2wHTCOJgvJw==
X-CSE-MsgGUID: T0WuaZ3bSOGiDsNoJZTfzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="985889"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="985889"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:43:08 -0700
X-CSE-ConnectionGUID: KOxfxPoATcuZORqcy/6mrw==
X-CSE-MsgGUID: 92pcnUcoTkeACi86+7VSlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="3869661"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:43:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:43:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 13:43:08 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.62)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 13:43:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UziFGXVczGOUhC0OR5EHaYBpP6gVLkoS67nTf0IV6M4Ke8CvUajtwIeC8VTerRFJsjwDcdQ1I/A+2scF9Tuo4QvVp7fKY3TUP+evWFQ/4T7XEqeL1QF+m2TDdoSTdQrz5LuxD1VF1NGTF7+UDs5HXedCymWvP2ZM8Pr8XXCuCu21+HjlBjVBDP5mIj962ZCW7KGbyCJ5lh9cYHaDfYXSDzb2Xnl726J1En6L34+rtwlXYw/+bkFmRRkUuSk9Ieh1BQhBcX4pq/bldqXCKVRdoBO6YQ8E0Pw0u/xXF7nFU9kdLr3oHaRXzNwgdD6K593+xXqpS20lQhF4o/9g475/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrmBTUKVZtZMGF/hDxFvEL2H6rssEeBgOggmtLUZXqk=;
 b=UDpj/mlCbH730kw03Ke2Blh5VWt9rV7SMm2lk6I4xYU+g5s1d84f4O5mLJPVAPwKs0YKqA7yGVQGvn3443bXv2DNPiz9IaHG92J3ADT1yNHIUP21YTaEPxl3G76o5KUk8jrGJM8gtKK1FMLs68QVIPSoDMZbEDu3Sr4WeefVK/0VqGU74x0IMCl++rSWPppS2yfkraSKGoE9bN4+v9cZ8s+CeBiCGSUAgYlIVPqxpyz054t4MqsWiVCm1XhJ08PDtqXsy4vHnLFiUpDMIGLFyJS5CLF9bw1wUsRxgz3+r4BJyQBgdtZ+0jZmOAeMwfmDeIknZz5vxPpoGUCx9s8LaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA1PR11MB8374.namprd11.prod.outlook.com (2603:10b6:806:385::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Fri, 16 Oct
 2026 20:43:05 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:43:05 +0000
Message-ID: <588f6e03-3b5f-428e-bdf9-459f74efe244@intel.com>
Date: Fri, 16 Oct 2026 13:43:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Memset g2g buffer on resume
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20261015165451.154495-5-vinay.belgaumkar@intel.com>
 <20261015165451.154495-8-vinay.belgaumkar@intel.com>
 <atJxs5BOjChYDEaX@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <atJxs5BOjChYDEaX@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0174.namprd05.prod.outlook.com
 (2603:10b6:a03:339::29) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA1PR11MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 78eef613-a9b6-4b04-70de-08df2bc6140f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|10067099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: AR+tgHZVTKb9zX8138ooOZtROVajAmkuvvL8gZw+19Q3ykQ9NZRKK5aVLZbCHWsjoAmD4w5qXobf2neg+PZl+5K44Gm+lpoRT/m8HyMoNEEsRx2sIvrzsuTONRtmBaqICxTQf1t7NN5zqdLjetS3jwL+ytmbNKwClSI6wDxr/3aYg54Hex3U0UDalndF5E3JrPBshbfl8llKY08t1jyehH8PCbssw57xxel3Ftk+Q8Th5uZatQdtVX6NN/Zi+G4GCpwQfLpQoO6qGusIL4BMqyVektE7Cc2bN2SaNAM1z9xMSVusmayc8Z7YtN6jyH4Ck8Ifono890NEK7CLKFPN50G/a4yeFYEFQlhiKNf3Qsnw8r4ZOR1XBpRD8kKLYUioHy2Mzdwdh320RzCRjB791eGqjbVNJLB5FRbaJinFGnx1n5/xsG3Z5Yaz4BpupoRlLNqhgmFz1JCYZTwxwGpcnQakYWdMtJrrpTpIFqzJ0h+9bXKHKsrgr7rxIJQr66ZQO9oAKMuzFewC8gtqWObMT0W8HdHMqDZK0KwXNSjvppMzeldMGMrA0wpoUdLtZjLruIEdOYcnsDZu3qAR8ghkH+2n0/ba9ZpYaLz1tTyveohTVHFawQueBT+eh4XPWDpI71dwtND3NpL3bdUJQZbxrETkHB0lTfKt9fNjpGmtc1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(10067099003)(4143699003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTBIa0dLNXcyWC85THBCVUo1Y29Ob3JxZVZ6VWpVU1Z0L2UzR1Z1R1pSZVhE?=
 =?utf-8?B?OXFsSzJwUnlSOXl5NzUrNkRGWHEyM2RKTFc4TzZ5WDhnc1RleWpPUEdSaTZx?=
 =?utf-8?B?MlRHVG9MYkZnNkQydUlSQkJ0Yy85LytlUG12Nzl4aEU2NitZZitDYmM4Z1BQ?=
 =?utf-8?B?RStkNCtVMS82N1JORE5hZ2luWEtPSytjd0VKVkNBZm1lWkZvbVBuVnZ3VGZP?=
 =?utf-8?B?cVlQcGZ6b3RpTDdXVU8vNkdlUmNOYi9iVkkrYXd3MmkwaGxJV0JyanNCMTVK?=
 =?utf-8?B?UXpqTGFTRytGSDNYdVlRODNteFhJZHdaWThqbjZBaGhENGw3dUV5THY1dzRp?=
 =?utf-8?B?c3ZzdmhEOTNHYWVoMjFnREZYeVk3N21NaG1Vc0Y3aFRvZFl6M09MNURhYXUx?=
 =?utf-8?B?VU54K0NYRE5vZFFuc05yOFdNcmhja1FZVVowZ2x5OEVsY1o3VnkxTjBNckVi?=
 =?utf-8?B?elFvK0FaU1ZOdkxSaER0eWxaS25iQnl6WFB1NjZFL283V3B6VlBTSkJNVFhO?=
 =?utf-8?B?Nnlkb0t1MnpMdmRCd21nczRYdkdXR2VBcWlOYThVeUZmMEhnQW1GY1RWWGM3?=
 =?utf-8?B?bDVTZm5JQmk4ck9NRXFKQ0g2MTFXT1BlZVBSaXNoRXRNRjZhMXZTOURicnZD?=
 =?utf-8?B?eDBYNEN3Q21VZDdoUnd4cmNGNGhWUFZ3MlMzK1FHTDc1MytmMTVwZHAxeCtR?=
 =?utf-8?B?bUpPclRSa3IrWWQza1lsQ09ESXM4dHJENnhZaXBKaDdKdFczczl2a0NxSVFR?=
 =?utf-8?B?d2JQaTNPSEU0NEp1eDdlYk9ieVNXWFZSV0lkcU1BS2hCRmJodGpVK3dneU9h?=
 =?utf-8?B?NXFUbXBVRVQ1ZFhJSnVSai8vZG5BelpTQzhkZXZtTVFrdG8rMmw4ZUxBUWg0?=
 =?utf-8?B?aUxZemRxZE9TTUsyc1V1cmVOeXB1Wlk1VkdvRDRiQzR6TGFibkdrNHQxSDk1?=
 =?utf-8?B?N05vUDJoL3ZIU0wzYVE3TzF4NGJzTDNyVXJaRkFrL2Z2K3VTbm9DNXlMQ25M?=
 =?utf-8?B?bDZnZ3RVSWFEblBkYWM4bTRrR0hEaEdGakF3U253b0RCeE5JTjYrWmdveHJZ?=
 =?utf-8?B?Qk9GQkpzejU2cVNGM0pwLy91U1BsK2RHaTlON3VlV0hGaWRnaTEvZWlkeEd2?=
 =?utf-8?B?RFY1Y0lVR004NDUxRENBdnZWWTczUy9LUnB4K3FEQzlDVzcwMHE3VHFIbE9q?=
 =?utf-8?B?Ym9tVGtpVk9tZERsdXJTNlllLytXVlVDVVc3TXM2TnVBRXFWU2F0dnZpeks1?=
 =?utf-8?B?dm5UT3lkNmphMFh0cXlNWVY0L2F0c05YT2NMS1RmNmVFYnlVSi9zY2MzdE0z?=
 =?utf-8?B?bXd5eUNPM0dZNEFQL2lzSmR0b2ZGK0w1WDVJRmZwaGNKMUlkcUtUVG9GSlJi?=
 =?utf-8?B?dTYwK2pSa1dDQ3NwZWlOSlAyL2h6ZU0rZlVwdUJIeFQrN3FqbHJzVmRVUTdz?=
 =?utf-8?B?Z0RBRTB6bTFTVXdoays5bkNGWVozOVo2dU82ZXJVanpjTXNHMEluK2RyUnFh?=
 =?utf-8?B?bGNtM3IybHdYWWZuVm9PYUM2YWZSNG5ZY1czcTcyaHgwbnhGTXpETHh5R3Jo?=
 =?utf-8?B?RlN0Y1dRZUsrK1h2M2MzTnZBS1R6Z3ZEKzQ4eGVYUk9EcUhFN2ZmMXMyNGVY?=
 =?utf-8?B?dGRTWCtGMjhvRm94ZlliVC92NHE0VFJQMDBrdXNWcnlScnFONEZWZVAxaHRl?=
 =?utf-8?B?WndLRlhtdFVlai9EcVR0OCtVU3NTVm9LU3ZEYUlOaWZjM0IraGp0QU11L2xT?=
 =?utf-8?B?ZzN0NEVzSEtEbHZYbGloTHRCSDRYTnQ3RThoUWRhNDBLa1l4QzYzUmpPdjZl?=
 =?utf-8?B?OU1yTlFuTy9uRHhhOWtLeENqQ1duK3FUMEovTWdmbFl1NUlBNUx1Ujc5aWNC?=
 =?utf-8?B?ZHloREwwVjQ4U3J6M0hkak1UYzUvS1l1TjJKQjF6RWJIVVpuc09vVGlaYlZT?=
 =?utf-8?B?WTl4bEVrakU3RmhpOVRiSUh3MVFGa3hpRS9iNjUzTzgySGNBVGczVDdTSFJi?=
 =?utf-8?B?YlZHaE9CemVSUTZRWnJUWWlwQ09MY3plNkcwajJJcWoyTjc3bFZKK21zQjRp?=
 =?utf-8?B?c0RqZ0hLU3A5anc1N1FwOXdqcUNTU2dvZ25ZbUFKWWt3cDRqci9NY3hHS3FK?=
 =?utf-8?B?QWJsbjhiVERtZ2sxekEzSVZsS2tKWWVCcjUzWjlPZWp5dFQyL1RlSGNIREhi?=
 =?utf-8?B?NklDdDlPSkg1Z21oOFhrTzZ4N1RFQmFtNFpFTkhIY0QzREk1MzdGbTNZem5S?=
 =?utf-8?B?aUtaamZxTVRITktGZGdGTVg0amNQSmZWZC91eGYrbDBaWFR4UVdTdC9SNEZ1?=
 =?utf-8?B?RTZPQUxWQXB6NUFYNmV2M3ZES1h3eERNQkVaRnhnclkxNG9xbjZxOTZxSmRh?=
 =?utf-8?Q?/bTDgdlzx98B3ARA=3D?=
X-Exchange-RoutingPolicyChecked: YXIPLcn/wyMLfB+ufnGpcw4bYDTiZLGOvVMvJTgnKcDJiMT2CgnXrQ5n+fUagQhLMV61Rv6evrHQvCv+i+d8WwyFTlYcjf6f/UN6y3pzTb44Zha37lWVFfmIKDJc/K1H3oPOYvnxWJs1LZOVuUJZIcep8qYi9XE4LbyCQgsqB3oZKfb6OB6xiT7Ap2Yk1RepGDII0JoqG2aB8/yWrAp3+P9zyu7DOiKvR6Kq+4IO6EgsvgrTuyOx6tBrrgTruGsm0+/6ZTttZt9YWUQUBDElGK5jmgZeb8BBm4nqq7y0HGl5C+lLagAI3MfgxCFkm69lhMtJ8zSD/EUfCDTsREGSpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78eef613-a9b6-4b04-70de-08df2bc6140f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:43:05.2679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFD/Nich2nZt0DI8q61Ga+pDl9vRoE7u6GSUwooJelqQNE8XcXT73V6Vw0hYUQUWsPKxPIxYSg/vzNDwMuQm7TDJBS0Ncq5GeU18XFfSb3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
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


On 10/16/2026 11:49 AM, Matthew Brost wrote:
> On Thu, Oct 15, 2026 at 09:54:55AM -0700, Vinay Belgaumkar wrote:
>> KMD creates this buffer for use by GuC, it is also responsible for zeroing
>> it during resume. The buffer is marked as XE_BO_FLAG_PINNED_NORESTORE,
>> so we cannot trust its contents after a suspend cycle. This commit adds
>> xe_gt_resume_early() function for handling this and the C6 disable
>> during resume.
>>
> Fixes?
There is currently no user for the g2g buffer, so I didn't add any fixes 
tag.
>
> Also I have question here: Does this mean after d3cold memory does not
> init to zero? This was an open question I had which merging
> clear-of-free as I didn't know upon d3cold exit if buddy blocks in
> cleared list would still be cleared? Any insight here would be helpful
> as I think Tejas is picking up the clear-on-free work and this would be
> good input to give him.

I don't think we can assume memory will be cleared as part of D3cold 
resume. Power is cut/restored to VRAM during suspend/resume, but there 
is no guarantee of bits getting cleared, I believe.

Thanks,

Vinay.

>
> Matt
>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c | 18 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt.h |  1 +
>>   drivers/gpu/drm/xe/xe_pm.c |  4 ++--
>>   3 files changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 775c826b68b4..02f5d48b1a65 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -1069,6 +1069,24 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>>   	return ret;
>>   }
>>   
>> +/**
>> + * xe_gt_resume_early() - Early init for GT resume
>> + * @gt: the GT object
>> + *
>> + * Handles GT related init before GT restart after a suspend cycle.
>> + */
>> +void xe_gt_resume_early(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_guc *guc = &gt->uc.guc;
>> +
>> +	xe_gt_idle_disable_c6(gt);
>> +
>> +	/* clear the g2g buffer which is marked as NORESTORE during alloc */
>> +	if (guc->g2g.bo && guc->g2g.owned)
>> +		xe_map_memset(xe, &guc->g2g.bo->vmap, 0, 0, xe_bo_size(guc->g2g.bo));
>> +}
>> +
>>   int xe_gt_resume(struct xe_gt *gt)
>>   {
>>   	int err;
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 92d934d50244..9b69f36ebc7a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -58,6 +58,7 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
>>   void xe_gt_suspend_prepare(struct xe_gt *gt);
>>   int xe_gt_suspend(struct xe_gt *gt);
>>   void xe_gt_shutdown(struct xe_gt *gt);
>> +void xe_gt_resume_early(struct xe_gt *gt);
>>   int xe_gt_resume(struct xe_gt *gt);
>>   void xe_gt_reset_async(struct xe_gt *gt);
>>   int xe_gt_runtime_resume(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 1f5097875bcd..89d64aa6577d 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -249,7 +249,7 @@ int xe_pm_resume(struct xe_device *xe)
>>   		return err;
>>   
>>   	for_each_gt(gt, xe, id)
>> -		xe_gt_idle_disable_c6(gt);
>> +		xe_gt_resume_early(gt);
>>   
>>   	xe_display_pm_resume_early(xe);
>>   
>> @@ -703,7 +703,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   			goto out;
>>   
>>   		for_each_gt(gt, xe, id)
>> -			xe_gt_idle_disable_c6(gt);
>> +			xe_gt_resume_early(gt);
>>   
>>   		xe_display_pm_resume_early(xe);
>>   
>> -- 
>> 2.53.0
>>
