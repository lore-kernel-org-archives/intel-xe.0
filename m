Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB97CD37AC
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 09:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016FE10E1F3;
	Sun, 17 May 2026 09:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YwHccUqk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEF310E1F3
 for <intel-xe@lists.freedesktop.org>; Sun, 17 May 2026 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779009977; x=1810545977;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ley4G6fC+CVKsvaF2z9p2BCdXLx/6AJXK6Vn332Im8c=;
 b=YwHccUqk3b9I/wyx5sVXjuG1F996yW3Bd8cq4Q8z27oevx5wVO0QTVAq
 AqRnNhKitQpShT4zKiNmucBBLNmvffSaiGJ1sG0be0tYmALu3PryfJcCq
 H5gaiLMj9vOvJnCvc6u9zbyWShegmrho+q6qfYJUCr5+EGnK7CI2VyNSt
 Kv7sle45ywCbdjP9Pe6brq18q0I5dQ+NN0d4LqPRY06KMb9oO9TcPUl01
 awkl1WCJ1kjaWK59YwB+4kbB2sqEupFW3Kp5hyM940x30h17Dx7+/FvnG
 oL0CWsLyO9CJ3ufnCuYJTXZcy8y3wecpTFffV9nsPDSyznKVytsZxqQRP g==;
X-CSE-ConnectionGUID: wD55zkuLRXW53ZqaOPRmOQ==
X-CSE-MsgGUID: OR8CeVPkSnK32K+vZ9t8pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="91284588"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="91284588"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:26:17 -0700
X-CSE-ConnectionGUID: ldqIeDHqRV+xaK/2oi+cyw==
X-CSE-MsgGUID: lUe6RmYPTtecUdb5mcKXtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="269481841"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:26:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:26:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 02:26:16 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:26:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZH+c5OoGW2emsCzoafNE9Ts0Efd0wMEtrBwRf/mM2aD62hBSM8ayxM76lPheqShOMIxI9c8Nu4VBC59LBjyos1i8PX8nCDGJgYhqGrXwI6K96AcinEJEA45bsWMTkzFN4Z4LB7gIrDzFRWplFRejpBVZH9rMZwB/v1XAX7fgRnG+LPIcMNJ+IbMnSAxI3ZYdCh7E0muiOpHX0rjs6W4/nwt7Tke9NGoq5UMWtycSdWunzjdAhxnJpe1Endkt/eLt8rZe7H/c+Pa1VejHKq5WWc/4eN19rTXM0YuS2ANAZIWNB6m9+X0gGN4IkJwmdalFUwhfkr4CCCoyVOmijddK0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNulLaOO7mGq06W4JgjHkIhFV/C9CC7nY+iEARs+i+E=;
 b=IBQi9Y17XZwE95gqp2J5gPqP4twGMaz8If4+td+rCsSmT9eZYX9KLscnUnq/43hnwKShOjqz8Nijuiwj5EnFIVpvhtLXfHCBspwirNr+LntZAUaXwgcXSZrZa3UXrPniIDJagNWwgsulJvmjH3S5Yxw7p4SX1KKcXc0mw8TAqevax1/E6lAoSa4yLram3IF9ojB7WiDD8Uhln2yOfgXBVLOTmEE0vz1uYn/FhFHhrrONh71IHf/c3oc5KJTgQ/EvfgU45pptNi/uvCnr/aaFi/yPpx0iBdwhqIjUrfyuXPx2nEp9jX8HyuSr9/JGI/cJf+YnRxTmUIHk1t5W3j0k+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by DS0PR11MB6472.namprd11.prod.outlook.com (2603:10b6:8:c0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.12; Sun, 17 May 2026 09:26:09 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%3]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 09:26:08 +0000
Message-ID: <61bcd0b0-f79c-4abf-8746-0716c24057cd@intel.com>
Date: Sun, 17 May 2026 12:26:05 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/xe/memirq: Drop cached iosys_map for MEMIRQ mask
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
 <20260514150010.7123-9-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260514150010.7123-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0010.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::9)
 To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|DS0PR11MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: cea26836-e1c2-4783-8510-08deb3f653dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4143699003|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: /fyj0vXKKFQqOmvU2niGbUpm5m7uDqLVbpztefIZImcAhU+fqKjSk4E9GY/jLP8Y+247d8CBSHz1zgV2sADzXR5ga2MmOS0wsfIOrqmmK9IO4EmRRr9hqDXK7qO0ZuTqz2rPDxSG6C1OBiGqNK8sUAm6GKOtZ+pWR4ni5jtlgRUIoyMhTAalm0FDywXv2x5fY7g2EcZUTx2rtSa3DskFbnobPeM7pA+IOX7Ku9dTbZu098cZlt1JShv1yZa2FOVmKmZGt/KlXJMKYlSofdsmqEQ48egAtvD9n2X0AGqHxiM0O6E/loPTSfai4owdRNrFuHJal7BdfIjhoE/Acj3UMt8N6VMoc6hqU66mjTNJ8b0xa9ABF/EOQKkWdjAAURWgOp8NdTTTGg/bVOahEu2QV65oMo10HH5lORSdZwE5ZtKWG0rkvs1vhhmD5dI3AkHxBxYMLuBtJI90szD8Ivgy0BIRe5R8GvPVVHNRaw85JUbzoGbXFsvYX75WhWe/KUa6fsVmuedv79p0hgdFJQoR8OyFRtcceDb/ng8+FKMMwzi0IUODP2pzejZ5QImdf2/DFYe9pv6mD2Cvp4rwxLTyHrhL8ww8beJ3SBLkyJPWDRM+y7HrmHeC6BTtvRp283VGlOtml1j8UOa/IZonbNnjxcPSddRyxMG1oM6XIqlDKR6PP7NrJsrPrzVZqGKjW1BQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(11063799003)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEhuTTl3VkllTkVWUXhLRDJFMENtd21ZemtOV1orMERGZ3VYek5mK0hEY3lG?=
 =?utf-8?B?czFEUHVoVXR1cTZiWG5BcGIvY3FXVkpnU3lzZVY3ckJockpyU1lYUXZIYVZo?=
 =?utf-8?B?WVE2dGNlUEhqWW5ub2crcFZsZmpzUDMxUnFzWml4YU81azh6STlQNng0M3Q0?=
 =?utf-8?B?eXFlZzdGUlFWcW9vbnZUK2YremdqS1FVYVpCOXNMYW1ScFpVNWhnRjAxQlh6?=
 =?utf-8?B?Vy82RnRuMGcxRG9ObjF2UWc0a1VndHhnK1dXdXkxdUtEYm1HczhtN3ZiOUJk?=
 =?utf-8?B?c2pRcDdEZWc1eDhQM3hTMjRXQnNtYVFEckJCZEdvNHdoUGpkRVlnQno4UERp?=
 =?utf-8?B?VEJHcWdJVzRwSVZxU2dRL3lKN0FYOVN0TmlXaS90S2NGR3VhRVdBTGlhSzlH?=
 =?utf-8?B?Z0d1aWlnQkpKUTF5RDdITVlSRkJuSW50aW4rSlFpUHVtT2NqWGdWZnR4bDBk?=
 =?utf-8?B?eHlOeFh1RTdOSGQ0WHA1RzRzclM4NEdvRkk3T01jaE9nam5LZW5RZHY4b0NE?=
 =?utf-8?B?clloa0phTlhpTGZ2em94SE1ha0RjREcxcEZiNjJacG9zVUEwbTZLVWNlTVVw?=
 =?utf-8?B?aFNUajJFUGdRVkFDRThVVmlQMnZqOHlneGVILzFXWnRia1lINUpWMDN6bVl6?=
 =?utf-8?B?ZkdaV3JZYURXSXZxTDNVVDZYVWZ1ZlZRN2F6QWY1dCtMUkxJYTN4d0dMUTYz?=
 =?utf-8?B?YStKaDlBUG1YbFROMW5HSC9DZXQ2elBINnNGdjhDZEk5RGVsYWRoc1dYMk9Q?=
 =?utf-8?B?RlZWQmlSUlA3bXNQV0VPbExYaW5KQ1UxV2c0akdsZ25jZ3lLMk4vbitXRHRF?=
 =?utf-8?B?RFY1TnNpNzFpT3dWbzh4aFl3a0ZmSzM2RnF6RFRyTzJEbXRGbmxuREJyelBj?=
 =?utf-8?B?MmVsaEFpbi9UQVl6Q1lwSXREQVN4bW1NTXdSRHAwdDdURUZkY2RUVXg2TFJY?=
 =?utf-8?B?MjRpRFAwdW9SbENtYlZkVHBGeXdpMU9OVjJWOGdWeCtkNUR2VXdUYi8xMHlx?=
 =?utf-8?B?aTEzNnBpRlRtc1RMRXJ2MnA3SkpXYmFnZnlYM3NxTFpSQjVLZnZyTlg4eVhJ?=
 =?utf-8?B?QmRHbHV3UkRVamR5KzQ3UkgrVUFvd2FPVUhoYjJISkZQN2ZGb0lUelJZYkpP?=
 =?utf-8?B?QWUraFAzL2NpNDdNeVk3MU5NbUpzRW81NENKbVIxM1VHTUtHQ1hESVNzWnFQ?=
 =?utf-8?B?QmdadW1hVUNwd1ljTzBzbE5lenozV2ZUTG5LYnVIS2I5U1hlTUVDUFJrOUlF?=
 =?utf-8?B?WnQ2bTZNemFsWXFyS1RuVzBKdzNjM2dUeDBrUzdkRjJ3Yk1zVkNINXIrcm1J?=
 =?utf-8?B?ekRJVGRrbFM2cSsyWDR6SXNTYWx0NHNsa2tkL2Y1QUkreUFob3A1cS9HMXJq?=
 =?utf-8?B?eFlQY25Ma2FEb2pMUzBHY1JtM2pMZmZKMWtmYTJtbjk2OXBtUjk4YXcxMmQv?=
 =?utf-8?B?LzZUSzQxays0WHYxOGJMRTJCSkJDWlJMWXM4ZDN1TzRXRTRIR2UzWU10cVdz?=
 =?utf-8?B?dGJOdlhuUnVZSSt3dktKSVk4R29uWHhnNFhBSlIvdStUVmt5bk1rNjR6RWlp?=
 =?utf-8?B?czYvczFhVUs2M3RIVCs1OUNOQ1RSZFJRUzJ1R0JobzhSZDM0blM5RUE0cEo4?=
 =?utf-8?B?UlFyVzV3WVV1ZStEZkJYYXZpTUlVL3BJVVJVOVkzUHhEMmFIRGEvdm50bTZh?=
 =?utf-8?B?RlEyakRpdnlDN01EN2diSEVaRVZVcVQycjNFMU9uZExueW53SHdGNWdoTC8y?=
 =?utf-8?B?VHU5RGkvSGVzQ01TSTk0SW96QlF6RkRDMmtSRllrNFhzdy9EUVRXZmdyNnp1?=
 =?utf-8?B?SE5RaDlPR2V2QUlZSHFSUTQ0eTlQblQ4N3I0WDV5eXhkY1IwV2prLzNhM2Vu?=
 =?utf-8?B?OUdOMUtvZXdOekdDSERvSWE0N1dxS3pYVUpiZlVIa0pac2ZTVzRhSmNFR3g0?=
 =?utf-8?B?bjFvc2RRWVBJSWlOVWppR2dFbTZVV0VUN1oxYXdaTG81STNrYjhUZDZld0xn?=
 =?utf-8?B?aXNEOVhZUkJHM2xwYkkzZnZFTVdRZ1BoL3JKb2gzV1d2b3FFcGVaM1JJUUUv?=
 =?utf-8?B?dGhLZDB4Q2tMaTVKbkpvUjRBK1R6TTYxOUtLTmdUY05IVmZSYnFuRXRsOFdS?=
 =?utf-8?B?SVVPZG1QNFAvUTVuT2Q2Ny9uZnd1Q2pCcmxFN2lPUDUwWDRuVWhYVkhKb1dh?=
 =?utf-8?B?MGJIclBaM3JyZXorMW4ySmphN3ZDaW1PZXJnYkpMbFp1aEdKWW9LNzJDY3l0?=
 =?utf-8?B?SkxiUmcxZXdiWDV5RDdJZ0lhSlNCd0c0UEtnVnFJNFQ2YkZSQmN0UzdGdDJj?=
 =?utf-8?B?dzZvT2FxY3BCQTRiVURHK0xGdExqcW5tNGx2bi9SYTBmc3llN2VQdz09?=
X-Exchange-RoutingPolicyChecked: ToSVx17GtRQgB1Y8FxrLXhEi7v5h5lmkdmUY9OCWw/LtzNdZlKC6a0xfWtjIQkJbuhgzg6UqXB4RouztzfBmaK2x2AUJJwTebLJEh61APUTGj0Z7sXQ5tQmHtsWUGS1aFDdm7T+vuWcFy9eNfti45r6v124hiaeZA347G/aPrsytjjBpGXid/L55pjKATP2v8+N5nYBgmKr26yM+XIU74jFxrJGWtDUR9eVMoqO/nTaBY+YG4NUpjwhTTIFAsELrR7truc20o6ZV9Pc6jKqPA7JPb40INsf+OzJ3Jb2v0XFDuqMu3PS7PyV6mszQGIKEZXi2zd/97AW32C0rORxGXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cea26836-e1c2-4783-8510-08deb3f653dc
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 09:26:08.6489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEgCSV+yHxOT5m7bzP8XQAoEWt3HR/CodKTqQ/u5p8IV811EUmGyQRFv52xGGfgXTT3BiQwmWf+LP2b0wK3mlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
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

On 5/14/2026 6:00 PM, Michal Wajdeczko wrote:
> It is used occasionally and iosys_map_wr() helper takes an offset
> parameter anyway. There is no extra benefit to keep a separate map.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Ilia Levi <ilia.levi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_memirq.c       | 5 ++---
>  drivers/gpu/drm/xe/xe_memirq_types.h | 2 --
>  2 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 7bc7dc106a79..65038571b6d5 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -220,12 +220,10 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>  	memirq->bo = bo;
>  	memirq->source = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OFFSET(0));
>  	memirq->status = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OFFSET(0));
> -	memirq->mask = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_ENABLE_OFFSET);
>  	memirq->num_pages = num_pages;
>  
>  	memirq_assert(memirq, !memirq->source.is_iomem);
>  	memirq_assert(memirq, !memirq->status.is_iomem);
> -	memirq_assert(memirq, !memirq->mask.is_iomem);
>  
>  	memirq_debug(memirq, "pages: count %u size %zu\n", num_pages, bo_size);
>  	memirq_debug(memirq, "page0: source %#x status %#x mask %#x\n",
> @@ -246,7 +244,8 @@ static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
>  	 * We only care about the GT_MI_USER_INTERRUPT from the engines and
>  	 * the GuC does not look at the ENABLE mask at all.
>  	 */
> -	iosys_map_wr(&memirq->mask, 0, u32, enable ? GT_MI_USER_INTERRUPT : 0);
> +	iosys_map_wr(&memirq->bo->vmap, XE_MEMIRQ_ENABLE_OFFSET, u32,
> +		     enable ? GT_MI_USER_INTERRUPT : 0);
>  
>  	memirq->enabled = enable;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
> index eab384342878..4ea3d1976d4f 100644
> --- a/drivers/gpu/drm/xe/xe_memirq_types.h
> +++ b/drivers/gpu/drm/xe/xe_memirq_types.h
> @@ -17,7 +17,6 @@ struct xe_bo;
>   * @num_pages: number of per-instance source/status pages.
>   * @source: iosys pointer to `Interrupt Source Report Page`_.
>   * @status: iosys pointer to `Interrupt Status Report Page`_.
> - * @mask: iosys pointer to Interrupt Enable Mask.
>   * @enabled: internal flag used to control processing of the interrupts.
>   */
>  struct xe_memirq {
> @@ -25,7 +24,6 @@ struct xe_memirq {
>  	unsigned int num_pages;
>  	struct iosys_map source;
>  	struct iosys_map status;
> -	struct iosys_map mask;
>  	bool enabled;
>  };
>  


