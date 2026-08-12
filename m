Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75680C5B567
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 03:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27ECC10EE17;
	Wed, 12 Aug 2026 03:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATJQ+Wsj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6D910EE17
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 03:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786505124; x=1818041124;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pSrbecHGzSLXaQwjakxuP6mKiebcq6RreEru4AcKCHk=;
 b=ATJQ+WsjQDY5xg89Gfsq26ueLDBLNzC9MjQ3c3tbctM0N84DkYmDKj+2
 3fhkwFN1PNCi16zWikDLaETbMlKcyxK/6t9S40Ux1WQC22qC7ySUEKEr2
 Y/8AtRCLBfH0FvG+XE1FSPaqGo2V2FhlMmZaT44bfPQehUzX+HAXuBRpe
 TTmK0OGNcIxpjneCBzOgO05XA4J7fKz9X+xo+V4Kgx4SDy0wvK4/FY336
 YOk4ka45+a/wnkYJ/diHu+ECJBMdfEbiqB4srJizheumYk9Fw+0wj8Mnf
 aevbegrjoin9UNz5nftNlw46LlFDLii9QwLruMWznOp7BBnAQL5WbLalK w==;
X-CSE-ConnectionGUID: TlSS4ggnTtKtcNMoUojguA==
X-CSE-MsgGUID: /x5OsmAKQaOmPts/V9urfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="112594183"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="112594183"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 20:25:23 -0700
X-CSE-ConnectionGUID: fF92SFqESE6hwrpBlWMQkA==
X-CSE-MsgGUID: u3ZRiBHDTf+ppPVDY1NGrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="262196623"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 20:25:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 20:25:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 20:25:23 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.60)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 20:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfIZR7e1cJcGxqGUxnNsNIf1qswOtJlvEo4S+V+bDrz6QRWzEL7k9BI3gRgWKl/0MJFhwbY2anqqwLy6gbKpvr955ejpM/L+HLerrgEdqZ0UufGYD8mKZ02l1OBngl9+/mJeWjSl65eovw0LqPeAQEsIIN4bYi0R6i9eXKRTDvtqEXZU051KQl8RtWKl0LdwCOA7CaHl0v68RStZ1uliGgDCrbCuSFG8zXURwp20U8RIg3UjRhEzBznwJTBqdHXfoMAFpsKjj2TAHZYlWJNRHG6LfXLuVyV3Ho+kNdzCXT8XqRjNSoSXPY8WJFd25oW4b+9h/K5KDlDurtYAqUAaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kk+6upthKKo8l38b+Dik/+vhaIyJMK15g85WVbtugN0=;
 b=Bd6DUJmCmT4BTJtbZ9yGQ2ScD9f0Py2eNoFUarfkrC+ZTViWCoJjpnMmbOLh4PUfVAUBJ+TzDEbYR0Tfdyn7wrvbRCUJxcr4Cs2Ha7f2ljHUQo1fhbR7NZ7SdRrasiTI5sbQQkU+sXnUgalqFDWYehHsJuWw0GeddBcOwPBGq5y0msHv1mnnNhHCTVn5nHX7xkOthAhY0jdQ9G9eHDgYnqC4BiK14/jpGSIvmNDLYydVmhE1knFuGhWNDVHSH6lMNF2YQc+U75jxv255axStmR9sP7LZjYPkzQ44vu7mr4jB16OMdGks7rej64k94dRBEPMrxYQTwXMq8NW35zs3IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS7PR11MB6103.namprd11.prod.outlook.com
 (2603:10b6:8:84::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 03:25:15 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0270.017; Wed, 12 Aug 2026
 03:25:15 +0000
Message-ID: <5cc8001c-d791-41ac-b002-9773ad841066@intel.com>
Date: Wed, 12 Aug 2026 08:55:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V15 07/14] drm/xe/vram: Extract buddy alloc and free
 helpers
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
 <20260811124016.3614699-23-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260811124016.3614699-23-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS7PR11MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: 1768c07d-a841-403a-1999-08def821533b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mNHoIC0Qn5CHFLzEPCuOfljcl/2R/RHG5+MzKn7rTfOweTb6hm3RnXwyWc9rCy4YqzMvR6kVsTAUEJOvnxfsvmFD86YxOzgyOAnvVnQdfsWnk1dzsx009lJmQ3iG+9VNpcttL1DiUJ3sT34WblNhBfG8+2JPQNOa4YXZdlio+NYZs4w+RC9GxwxMo/TwJLcpCaiZt4j9c41QHuBUd71KtKV4tVlC4yxX4uR7JrQ0XuVPCDqBKK3/3oRqY5otfdF9DIws8EhaimA4PbIeZL3tSpcqtaRQFblBoFoiryFYUNQ3ezeg0vilXgZGMvzMlKKGUYO1wIn4oWuM8TqgrVWbEhKMGDg/EySGkpse5+v8PHCgbqYzN/++HOSt6nCmewdNZQs6c2JZIgl0ifjwp4FsGUIVy/m/PV/l0JT5banWs9O89HUOIWOeNmWX4JQz5TKsIE8nPPL2KC9t707HQOpHjmVRQkbKd+xfHy6kBGHTRWwG7ek1xe/SbM0NklJVevlBTnziLNwNYlCadbMVrX/+d5Kq8kWedXWQ0u3dUQyurM9EeVZcZFOavIi5l9aYQtBnMDcNCb19mnMmRfZUmDw9NZG+Q6+0A87FZgULJR2jc+O85EUKYqvdAvcjIx6EU1M9CVQOm6atjIPfsGyRwrrE5Vsge39QHQbwkMXUOjTD/YA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVpQWk9GeFlTTHBuSnVzNWJtekR6ejQ3MnlTSkZqMkd2OFAvL1NUa2VVeVY5?=
 =?utf-8?B?eVVNQ0dWK0I1Z0gxWkIvcmF4Q0lUbllQcVJKczNsWExQSmZKZXFlTEFlT3NP?=
 =?utf-8?B?QnF1UEVleWJ1YW1NQmpOT2IyTm5vR25NdXF4TTBQMjBUUFdqYzZWdFEwN1J3?=
 =?utf-8?B?T0wxOEs1eiswTGlvR3o3V0oyTG56WnlrOEg1YnVLSTIvQTVMZi82YjZTeWFv?=
 =?utf-8?B?M0RPM2sxb0FmTjVHRUtRanZSSFltcHhvK3NSSW1wa0NRMTdKVitnMTZPRXlY?=
 =?utf-8?B?MXJaUmRoN0NaZnRQOVpWQnZhcmhHRHJiQ1NlVi9IZVpMYWJXd3JtNldaQ01T?=
 =?utf-8?B?eXJHM1Npek93K0dXQ0V6UnFPR09MTGdFSUZRcWIvVUNzVFdOd3BKYVg5WERi?=
 =?utf-8?B?OGJ4M3JVa25EMVZMcjR2RVBKd3RsQ3VmeXdia3NET0xBQ3ZoanJ3RWFTTDJ4?=
 =?utf-8?B?aVJreGhERHN6UHFUbVlzcWM2ZnlrRHozVXVXRHdWYTQ4VS8xWUZKQnVxSDE4?=
 =?utf-8?B?S3ArNWZmZ3lXd0d0T0JxNFVkRXhDZjh2VEdGOG9KV1dIMll5VTNoZzZHcE10?=
 =?utf-8?B?RVBmMVk5Q1ZOUnVrTmJGZExCcXNqdHpVbVJmbXg1aXMxQk5SQXhId3dHTXEr?=
 =?utf-8?B?akJMRDRDRlJWanpMQ3p1VC9XK0dzcDBvdDdHYXVPU3BmQXpUMHFJTzRYOVBU?=
 =?utf-8?B?UFgvWjJrdVBJaG9uamFEL2Q1RUdRR1hUQk5GbXlvSnc3Rm5aQlhob1NtaCs0?=
 =?utf-8?B?U1BWTTRucWlWVU1rd3QxSkg5a2VRalI5bS9Ob0x0USsxVHpKbHRCTkY0eThN?=
 =?utf-8?B?MVNuMStEcjdzb3JLc3U0WlkwVUVIQWIwbjVuYmcyK0piWnZaeFVLNkZmK1Rz?=
 =?utf-8?B?d3djWlBKNk8rUUZ4THBPU0hiaERRUUxESjRNL0ZLQiszWU9haFdqUVJ3VURZ?=
 =?utf-8?B?ckVsQWxUOHM2ZS9rNWxHZTIramVoWk9kRW5YMGVkN3VJVFZaRjcxMkFDMEV1?=
 =?utf-8?B?Q3hwclRIL1NRMHk1UFZtb1g4RDhLRWtKWWhYajBhZElQNE9GZjBEcENWWnAy?=
 =?utf-8?B?Lzd4Tjg2dE5ZY3M4YlR4Lzl6WlRtYVRhZkhhazFVQU00SmlrY0ZpcDNrMER0?=
 =?utf-8?B?eGdFVGVzVUgzUTBCVWYyN00vR2ZXSDEyeFAyYlNiRC8rT2JkamJxUkdFV05C?=
 =?utf-8?B?bStlZFZ1TjQwRGVKakZIdjYvTGlaQU9NMFBRTVR6ZU1UNDNGYitNUDArRGRZ?=
 =?utf-8?B?SmhiditTcjBHM0FmakU4Umx3ZHA1WFFRNTZxcnZYSXUzNWkxd0FGYmRLaG9z?=
 =?utf-8?B?MXZIdFIzaW5RZElVbytSSS9ZSk5DNzN1TlNmNXNrTEpaNFM1Q0JVc0hpbEo4?=
 =?utf-8?B?Y1MzWHJiU0MzMHdoWGh5SlBzYk85K2lsbEFjMGJSZk1TVDkwS01DR1hrVDFK?=
 =?utf-8?B?NzIzS1VOYXBTRi8yRTNNOHd3a3hpQ016dXZya1RtdVhXNVdvNzRhWHE3UkRi?=
 =?utf-8?B?ZlVvWWdNQ3loWldWUFVQK2p0ZFdwakx1bGlMVElNL0l2cnk1ZndqN3lEZ1Vn?=
 =?utf-8?B?WHNFS0VrVms2QTZnd3Z0a3k2akRkUHMyZHFjdjdoQ2s4NWlTZEkvR2NjQmM4?=
 =?utf-8?B?UTh6bm40ZGI5eTdCd1QweXpJd3ZMb0xtOHBkMU1vM1RDeUtzSTZPenFlRHM1?=
 =?utf-8?B?RTh6YzdIeC9SNnYwYW9Ob3RHeFY1VjJUT25BYnQ2ZW55bFlYTjY3ZzNkOWJY?=
 =?utf-8?B?c0phZlhlMkdyOTFHTTZWcElVdmFTODhPRmpqNXlkQVArbm9tYVBrbDFOSXlB?=
 =?utf-8?B?Y0M4Q3MwenY0Rm90cm1UU0VqY3JjaFphZmx5VEZFaS9yUEh1MUxLR2Qxa3hW?=
 =?utf-8?B?bVNuSHQ4UzJUNjB0N3RZbHovWDhOYWVQUlZmZTdhSVFNbEJLZElORGVGQUJR?=
 =?utf-8?B?MEszalRPOER4U2dSaUtkU2xsY1VvWFc0YTZHWjBpUnhwWWF1Tk02eklQcFl5?=
 =?utf-8?B?dHNFYnV1ZnFqU2dkREthd0lpZFUxemtGV0ZSN3dKaFhzejUyRWYwRHhON3Iw?=
 =?utf-8?B?K0dWeWp2dVUzSFEwNGlNYk5DYjVHeXByS01jWStVSWRqaGo1YUNkWDVQaFhR?=
 =?utf-8?B?NEZ4czB5NlJPR3BZSGtxWnp1Zk5WaDdja2F5bHRtTFpnWDZOSXdJMitETFlE?=
 =?utf-8?B?UTJTTEt4U0FnNEVldmhjUjlrbzBMVzFOZ1ZSSWk3TnBPckt0VUxETjllYlBP?=
 =?utf-8?B?dVBMejZ6bmxaODE3UlpJREFFQThYa1Q3aGFQcDB2Q1Y4RDFTSzBCeEZwQnpY?=
 =?utf-8?B?cmUzQ0diZG5icm5xczR2MzlPL3hvNmhFRFpHd3p1aEdJM3hFZHFQbVVKb0x4?=
 =?utf-8?Q?8E5rNVdNUAr4pFyM=3D?=
X-Exchange-RoutingPolicyChecked: RmhjubmQ9rwE/+yCi6KHL9eqZ5oB8RSNffdYf+1vjr4A1CKQ5SvYW27MVLqbbKipkOkp6fC0LDKJsu1leb4/vyznc/hPbXXfhzEIW7RAr7JwMN+mOSxVWVm6w7oc92g6dQf4nrxpv8t3gnKBdfWVoEAe0HvK6dfNd853SJe/AlUCO6qCy+2Tc3AXWnOxY7/T7hBDE6ZcdxGlQt4ZLpwVF0r08hanC5ZZK3FdGxLG3oX/KkjdtENTJdh4qu/3ispf4J2zAjq54yolNKDZRh2mJ4NXFVJ+9DLcU9ZSJ6hKcnBjyPkod8JdXSwXVFDWgze/JYBNgAaR369hv6nlwV1asA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1768c07d-a841-403a-1999-08def821533b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 03:25:15.1673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJPsxfxchQyQFBW8gB5Zorhk7LPz7zRFst9GZRfAvZ23B9I+dVi/vRpLj6DDDUVF62aoOyRnCGnNBq17Q4sGIiKC29NKkLXblawrVbqNieo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6103
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



On 11-08-2026 18:10, Tejas Upadhyay wrote:
> Factor out xe_ttm_vram_buddy_alloc() and xe_ttm_vram_buddy_free()
> from xe_ttm_vram_mgr_new() and xe_ttm_vram_mgr_del(). These helpers
> consolidate block allocation with visible-size tracking and
> block->private tagging, making them reusable by the upcoming VRAM
> page offline reservation path.
> 
> No functional change.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 82 +++++++++++++++++-----------
>   1 file changed, 51 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 5ab5dfdb183c..49eeec90a470 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -46,6 +46,40 @@ static inline bool xe_is_vram_mgr_blocks_contiguous(struct gpu_buddy *mm,
>   	return true;
>   }
>   
> +static int xe_ttm_vram_buddy_alloc(struct xe_ttm_vram_mgr *mgr, u64 start,
> +				   u64 end, u64 size, u64 min_page_size,
> +				   struct list_head *blocks, unsigned long flags,
> +				   void *priv, u64 *used_visible)
> +{
> +	struct gpu_buddy *mm = &mgr->mm;
> +	struct gpu_buddy_block *block;
> +	int err;
> +
> +	err = gpu_buddy_alloc_blocks(mm, start, end, size, min_page_size, blocks, flags);
> +	if (err)
> +		return err;
> +
> +	list_for_each_entry(block, blocks, link)
> +		block->private = priv;
> +
> +	if (end <= mgr->visible_size) {
> +		*used_visible = size;
> +	} else {
> +		list_for_each_entry(block, blocks, link) {
> +			u64 blk_start = gpu_buddy_block_offset(block);
> +
> +			if (blk_start < mgr->visible_size) {
> +				u64 blk_end = blk_start + gpu_buddy_block_size(mm, block);
> +
> +				*used_visible += min(blk_end, mgr->visible_size) - blk_start;
> +			}
> +		}
> +	}
> +
> +	mgr->visible_avail -= *used_visible;
> +	return 0;
> +}
> +
>   static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   			       struct ttm_buffer_object *tbo,
>   			       const struct ttm_place *place,
> @@ -54,7 +88,6 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>   	struct xe_ttm_vram_mgr_resource *vres;
>   	struct gpu_buddy *mm = &mgr->mm;
> -	struct gpu_buddy_block *block;
>   	u64 size, min_page_size;
>   	unsigned long lpfn;
>   	int err;
> @@ -115,32 +148,12 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   		goto error_unlock;
>   	}
>   
> -	err = gpu_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> -				     (u64)lpfn << PAGE_SHIFT, size,
> -				     min_page_size, &vres->blocks, vres->flags);
> +	err = xe_ttm_vram_buddy_alloc(mgr, (u64)place->fpfn << PAGE_SHIFT,
> +				      (u64)lpfn << PAGE_SHIFT, size,
> +				      min_page_size, &vres->blocks, vres->flags,
> +				      tbo, &vres->used_visible_size);
>   	if (err)
>   		goto error_unlock;
> -
> -	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
> -		vres->used_visible_size = size;
> -	} else {
> -		struct gpu_buddy_block *block;
> -
> -		list_for_each_entry(block, &vres->blocks, link) {
> -			u64 start = gpu_buddy_block_offset(block);
> -
> -			if (start < mgr->visible_size) {
> -				u64 end = start + gpu_buddy_block_size(mm, block);
> -
> -				vres->used_visible_size +=
> -					min(end, mgr->visible_size) - start;
> -			}
> -		}
> -	}
> -
> -	mgr->visible_avail -= vres->used_visible_size;
> -	list_for_each_entry(block, &vres->blocks, link)
> -		block->private = tbo;
>   	mutex_unlock(&mgr->lock);
>   
>   	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
> @@ -172,20 +185,27 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	return err;
>   }
>   
> +static void xe_ttm_vram_buddy_free(struct xe_ttm_vram_mgr *mgr,
> +				   struct list_head *blocks,
> +				   u64 used_visible)
> +{
> +	struct gpu_buddy_block *block;
> +
> +	list_for_each_entry(block, blocks, link)
> +		block->private = NULL;
> +	gpu_buddy_free_list(&mgr->mm, blocks, 0);
> +	mgr->visible_avail += used_visible;
> +}
> +
>   static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>   				struct ttm_resource *res)
>   {
>   	struct xe_ttm_vram_mgr_resource *vres =
>   		to_xe_ttm_vram_mgr_resource(res);
>   	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
> -	struct gpu_buddy *mm = &mgr->mm;
> -	struct gpu_buddy_block *block;
>   
>   	mutex_lock(&mgr->lock);
> -	list_for_each_entry(block, &vres->blocks, link)
> -		block->private = NULL;
> -	gpu_buddy_free_list(mm, &vres->blocks, 0);
> -	mgr->visible_avail += vres->used_visible_size;
> +	xe_ttm_vram_buddy_free(mgr, &vres->blocks, vres->used_visible_size);
>   	mutex_unlock(&mgr->lock);
>   
>   	ttm_resource_fini(man, res);

