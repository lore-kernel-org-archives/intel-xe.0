Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56694CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 21:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F078410EA3F;
	Wed, 27 May 2026 21:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zd82Wduj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3FE10EA3F
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 21:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779918568; x=1811454568;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VC8kpRXRVDeD/7oKe4jnlUYf3q1x/5vBVhIie8hkev4=;
 b=Zd82WdujJP+qfG4vZsA054TgVHw2P28xqWRLTByFH0tBFgO7UKs/BQHg
 O2OrO3axDw5XS+hLb/4XV/8Cy6W72anvaXRkikZl1R/WohbDPwwrWURLo
 KJed8geJJvqRTWOg+ONk7dhxRBECdQkYq1t3l4a+k/k5esEw51qraqAib
 VMsJ4Of8oWATKy0kaIMrP/Ya1UsLWMLu1kp0GwoQU92lGTes49MsWaElt
 ylCRAgyPOlB2onJ70WPnp7emd7E+ZUM/1TPswKv+2ZURdxpprBo3rkGA8
 89htzPreg4jHnyPJnJGiS9EE95hQ+ZMd4r0dJuyQH77fPnOwulxt4b0E/ Q==;
X-CSE-ConnectionGUID: EVTpWnbtTTq7WEsDiRzpgQ==
X-CSE-MsgGUID: 2Via+Ad8Q+SvSO4lmRNYzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80664715"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80664715"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:49:27 -0700
X-CSE-ConnectionGUID: POpo6W6CTU+Ckg3gE0vVPg==
X-CSE-MsgGUID: s4rHzYXaSxW/tXz6c7yI/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="265967909"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:49:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:49:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 14:49:25 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:49:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeLTphHFaWSmUjZS27+QxllnGAGuufOrrjsRuLT5P+NLjPGPYkaGsqp9YC82mCZvkX/9ESxhTVjWPvomHL/8ZpT9tHyVj+w/DOZ5uyaMAky/X5eVyzPPuUE/L9+GpTi9pvOTJkXw2BLjm9FvJq3rq4nsVLD2I0D7QC46bVHO00chM/qE7Az+1ifi00BdU2thXVR2ypQhRDs+QnkMtUE7mxyvUE7LomcKh1gGU/nwXyU0dU2CWzlJbnuSKzlz0fdD4vF7SXeSlE5jwq1xaDwEPrHkgSXxTkRCZvYdMqu14muNO2032JGLZucSeS9c109vupQemCTuvYOYloR8BX7ioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMIJv0K0Pnqc7bJdBHDpxaanH+nAlqVEV5t3mdsjbds=;
 b=VKBUnlmV7WmZsQHUt8RHNpQilxAm6qUeYvlFlCTUvtzAW62aAI4o1aKSCbIcyMv1ZdPN4V3nc1qEhyo2miHXcCJT0saVypgCODi7QYYmA/hLDvNnsWMYWIEYpSdejMHaL2IhJBZ5bDrrKKV4qhkCgzxo2B6GKa8YmxNkeIHgJZ+7U5zUX6eapToDRxk46IgeTMEO6XHEHpY4iVxz7gTHubz5jVasDJzg2XNQAyzYgLmE3UuRSnDsLzycWIxGBoNcRY7AxadRxFNA1brsIA/XDN3yOTOtLe2eKpYjc5CeKVAz19zLdUZ0earY7Q/AwzOB6BCMqGPkpYfffZS6+tPd3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ2PR11MB7476.namprd11.prod.outlook.com (2603:10b6:a03:4c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 21:49:15 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 21:49:14 +0000
Date: Wed, 27 May 2026 14:49:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/9] drm/xe/rtp: (De-)whitelist OA registers for all
 hwe's for a gt
Message-ID: <ahdm2NdnwBwdYnjU@soc-5CG1426VCC.clients.intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
 <20260518234716.1540123-8-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260518234716.1540123-8-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0259.namprd04.prod.outlook.com
 (2603:10b6:303:88::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ2PR11MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: d0bf7fc2-d161-40b4-378f-08debc39cb70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: WC18U/+w+MbULpU7Y/xkR8oI038CMkYCs0MiltvhsLA/TXQBuwzKULFIUzJF+MqR8MgwRIqQINMf3yZtAt9qMKKPnJhktpOiNRUTFTQD7nfdZtfoYZ+vv3IDdJzId/d7wM9BmMbjayQaN8f8s68J9YX/WL6kls6CQqQ3vCLVFoWHQyrKtYm/RnnVwT3t4iFOiSUJTGD3uECcozV6Z/KRYEf2y7oVVcLAwNc0V8G9bspmTxmDuECEGu7OZGTs3OtWcu1FIG3U7nMfqdFgPNudUKKhvIkuXZ71vthw+bYmHt7t9caXIsGj5StOtowpG/ckfJQ65hKd9QuMUGcI7ogMbZxkkVMVe95TR4GFUj8YXcKyFCH+5g3uvb1vxEplA4jED7hP/MNEo0aXatWaN/1Ibe3Y8OHyN9fu5JqKDKcSkbpu5ZHHfjdmiH9ciwmBWlkTJob0wL0JTChApSS2lYmyw4i0Xh3s+OQ7u743mgwebO6rixVwCWyxkV+GVIQ5MEw6DT+RNGKNCr4rS1hB+8RnXDjT12/8jLQmAQox7/+CuqrqzehgrruiVZpt521lBf4x0S95UBQ8xt/5bFxw/TpuUahA4HFhf88bxniNBchGEbPgJcUuKjHabrJv2REyDip2PcXxSEG/VvswqJyollMkHXvQH6Cz8jzPiYRxe3m0TOGZJWQvI0LkLVNbwxew+vPk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TloxQU5BZ0t4bVk4Z1JUZWQxQjUrSm5qdFl2cWduREdWUlZBRGJSVGNqcWJ5?=
 =?utf-8?B?YzF4ZjZjbDdxdk5TYUVDOE56aWpFTUJIdnRWT29TY21LZzR4YlB0Z1loNERB?=
 =?utf-8?B?dzMvWjFVWnJsR21LVVRGcVVxMmhtZjQyU3ZpUHlUQWRjdGJ5YWpwQXB5TDhj?=
 =?utf-8?B?Nk1GSU5jYlBWM1N4SmpOODR1a1hhK3VBdjFNSHVNSGxYKzlzQ0FiT1FhMmY4?=
 =?utf-8?B?aVJxbHpVYW1TWXluTEFXVWt3ZlQ4dnhERC9RVjA2UFdGWmdqUkllRmV2bkdo?=
 =?utf-8?B?K0JWV2pPSnRmZTF5T3loeWpsVXBwcHZRMjRmZmtIZ3ZDSWRqTFdPR2xlYTJM?=
 =?utf-8?B?a2lBdktSTmNnV29vUVBTTkNtV0lnNkVRbFM4dURIbnJxcTFyYWhya0JQcHoz?=
 =?utf-8?B?cjZrYUJuN2dQTWtnbzkwZTA1THN0M1J1WVNjS1N6dUlNRldjQ0xGekNGUjRj?=
 =?utf-8?B?c3NOYnhmQUJ4SzYrMEFuWitTVncydC9lb2N3RjlxOHdyaWYyQkNLT09EQ2g3?=
 =?utf-8?B?ZmE5dkV6SjVSNm1DRFJIcVhCWWNoZGNvTHJ0K2NiTmNVcThMYzZ1LzRqT3A2?=
 =?utf-8?B?eDVEbnl5NXJmOSsrc0RiWFo5NkhlS2lob01vSGdZaExWSWVMYkhnR0pBQzJK?=
 =?utf-8?B?TzUzYndLQktHZTVoZkplTVpEbUVLUFFmL3NiaThFZWQyeDVhUFdSTklDVUM5?=
 =?utf-8?B?NVM3NTg1SzAzZjJBSUJja01yZDFBdDFOVjNqL1YvdHBZeXExTWVoNU9VR1p3?=
 =?utf-8?B?UXVxL1BSWGRReWVJWHhCUHNrbG5Obyt6empNRkNzbEN0aTZzdVY3eXZibklK?=
 =?utf-8?B?aGVJTXRtNWRUQjF4RFJORUt4U1pjOXo0c0xBNnVKMi9xbmVyUWREbTVwQlRh?=
 =?utf-8?B?bHhqNyszcytxMG0wQ0thcXN1QnRZRURFeUtJR3pLWGpETzluWlpwWjQ4a3NX?=
 =?utf-8?B?YnZVLzlpWHIvQmt5OGlLcGk1RnZNUXF0MjlhRWt2dGY4K1pId1AreVk1MnAy?=
 =?utf-8?B?TFp5bW1PL3FxU0h0VVVTNTBOZnVLaEpNVVYyR2Foenh6OWtIdUk0UzFwSWxX?=
 =?utf-8?B?VHZiMFQ2alVxdFJPcHl6SEx3QVlJRjV3azhXdUJESkZvQTkrV2xGcXFubS9r?=
 =?utf-8?B?S2E0NGR5NzZFN21FalIraTA4VE81L1NjaGR4bUlpSWVRS2hpaDZRUUl2MlA5?=
 =?utf-8?B?cTdGQk1IRkJKRjRlNzB2MEZWRE5mNklHTWkxc3piRmJzSWcycEpPejQ0d2JV?=
 =?utf-8?B?TGdsUWlueCtWU2FDMW1rcjlBRXhDY1R2em5VMVZaLzZ1TElRd2xYNldJTzBC?=
 =?utf-8?B?bzdtWHB4SFQ2NWNkYTBGNjdwa2RNK0JlbklCODUzb0xSRGlwUldxaHdacTl3?=
 =?utf-8?B?b0NKb3Z0U0Q5WmRrdU12MDNhRVMrMnRaYzBXcU5jNHM5MTROVUphN2U5RWo1?=
 =?utf-8?B?UE44ZXhzUFdKb1JSdTFkQmZaZWh6TTBxMTF0YmFWd25FL0p2aGxUMDQ0UDIx?=
 =?utf-8?B?d2dQZHZhK0VBTHB2M3BROElZU25aOG13WU53M3dnT1RCN0xKL3pRVmViVUo0?=
 =?utf-8?B?ZTNhZUJYREMwL2l1d1RqSGpidUpGc21pRHZLVkpKYkk1UzNxb3hnUDZFVzhC?=
 =?utf-8?B?Nnl4N3BKTVhtLzkvK3F3MmlMUm5XelJrMHNyejhUQ29nYTBOaE1ZU05KRkRF?=
 =?utf-8?B?TjI2KytSOHBzNmtlcVdHRzBQd3hVSlozLzVKSE9ZR0ZuL05GYmhBQitsQ0d1?=
 =?utf-8?B?RHN2SHlmTmRXTE15bzdEQTZoVm91QjFWWk9CV2Y0M1p3MTFGdEFhek5tZmZK?=
 =?utf-8?B?Mm1WMzVMMUFwYnJsQnZkVUJkSFB5S0k5VUdLeEFGck05b3l1VHJIVU1UNjY4?=
 =?utf-8?B?UU5Ud1dveW9tR2xqNlBaVGlRTlRzOUx5Vno1K25QdVBNYS9PaHZrRFIrNFhX?=
 =?utf-8?B?M2QyYThHdS9TUWwveU1IZkZLZVZvSFBQNEZsMzQvVmRqU0hzTGNUem05L1Fp?=
 =?utf-8?B?blhaNDRtZVExdll1SWFQSjVHdE14WXN0T1VCRUwySUk5UzZPaGpPTG9qN1Nx?=
 =?utf-8?B?amw4d3NyR1lrTThZMlExVXRwc0hjb2I3bVVCUlJ4a2I0OXN2RTBqcDRBY3hF?=
 =?utf-8?B?MmowN0RpY2I0Y3I1VlZ5SWE1YTZVajlNT2F0aHVaeUF1b2pXNXhHd2x0VDhI?=
 =?utf-8?B?blRoTHJqbmhZNk56KytQbERWTmdGUGVhOE5BZ001L3ZlT1ExMmZMK09HQnFY?=
 =?utf-8?B?VlcxZEdyc1ZnM09CT3J3djdIT2pQb3JWSUtyVm9NTG90bkZzU1FqckNUVmxz?=
 =?utf-8?B?d3FXWXE5QVcrUlhjeUY4UURyUXFMNFZXekJkWWIrcGh1NjhXNzMrSlFpT05h?=
 =?utf-8?Q?QgW0JSfcckG5/TPN7qTivJ3Xs/4XhG0m8JaXU?=
X-Exchange-RoutingPolicyChecked: NQ/98sapHqzriRnqeuaviW8dQa7Bfz3hapTR07ux/uCtOVd7qw0zoYBd7fJG3i1+6nWu5hHc8Gmc3pIAYBHCXZ5uZ1ssiAISU8/bWtuw77Wp23dQQJiHgxdWliYxq1s2zPmY4/hUaN3H9L5yfnauebcLEhTYg+x3RajA+Z4XUq1L5wWnKbvcihDfmK+NXK5gEBBJkCgAa7jRiQhTYyJXhVkKnOgRNkj4j3YJPeCz4e1OkJanS+6UHWAPQFfZAbhEwDJNzBZ4Yv3NxVEtqO/+Da2rYybVrPScqCyDpGZ8BfwAEpnAiCDt6CpBEz0vB+k/zJxHD1iLcvVGN1WH0hJqkw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bf7fc2-d161-40b4-378f-08debc39cb70
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 21:49:14.7759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dqj4fGihzrZFPf284u0yAmCekx29zvCMrzFMEit9N5AmA+6vzNffRuCv2FSARughE6vwYZ8CP1K3muWwKhyu4glEhwayZ/znP99DI4KVzFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7476
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

On Mon, May 18, 2026 at 04:47:14PM -0700, Ashutosh Dixit wrote:
>Whitelist or de-whitelist OA registers for all hwe's on the gt on which the
>OA stream is opened. This simplifies the case where an oa unit has 0
>attached hwe's (but which monitors OA events on the associated GT).
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 32 ++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_reg_whitelist.h |  4 ++++
> 2 files changed, 35 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 0d2cf3d964a51..50b34c5008df7 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -229,7 +229,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
> 	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->reg_sr, nonpriv_slots);
> }
>
>-__maybe_unused static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool whitelist)
>+static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool whitelist)
> {
> 	struct xe_reg_sr_entry *entry;
> 	unsigned long reg;
>@@ -244,6 +244,36 @@ __maybe_unused static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool wh
> 	xe_reg_sr_apply_mmio(&hwe->oa_sr, hwe->gt);
> }
>
>+/**
>+ * xe_reg_whitelist_oa_regs - whitelist oa registers for gt
>+ * @gt: gt to whitelist oa registers for
>+ *
>+ * Whitelist OA registers by resetting RING_FORCE_TO_NONPRIV_DENY
>+ */
>+void xe_reg_whitelist_oa_regs(struct xe_gt *gt)
>+{
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+
>+	for_each_hw_engine(hwe, gt, id)
>+		__whitelist_oa_regs(hwe, true);

I think we should only apply the whitelist to the hwe that will use this 
specific OA unit. That will help do away with the ref counting in patch 
9 here.

Thanks,
Umesh
>+}
>+
>+/**
>+ * xe_reg_dewhitelist_oa_regs - dewhitelist oa registers for gt
>+ * @gt: gt to dewhitelist oa registers for
>+ *
>+ * Dewhitelist OA registers by setting RING_FORCE_TO_NONPRIV_DENY
>+ */
>+void xe_reg_dewhitelist_oa_regs(struct xe_gt *gt)
>+{
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+
>+	for_each_hw_engine(hwe, gt, id)
>+		__whitelist_oa_regs(hwe, false);
>+}
>+
> /**
>  * xe_reg_whitelist_print_entry - print one whitelist entry
>  * @p: DRM printer
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.h b/drivers/gpu/drm/xe/xe_reg_whitelist.h
>index 3b64b42fe96e9..e1eb1b7d5480b 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.h
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.h
>@@ -9,12 +9,16 @@
> #include <linux/types.h>
>
> struct drm_printer;
>+struct xe_gt;
> struct xe_hw_engine;
> struct xe_reg_sr;
> struct xe_reg_sr_entry;
>
> void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>
>+void xe_reg_whitelist_oa_regs(struct xe_gt *gt);
>+void xe_reg_dewhitelist_oa_regs(struct xe_gt *gt);
>+
> void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
> 				  u32 reg, struct xe_reg_sr_entry *entry);
>
>-- 
>2.54.0
>
