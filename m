Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36726C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 12:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81EE10E5E3;
	Fri,  3 Jul 2026 12:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSbg8xGE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC7910E5E3
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 12:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783083540; x=1814619540;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=j0cOPIsQ2hUhIYAVI8CmRwky49XUfd6ysmTJZcTsFek=;
 b=bSbg8xGEKhWUQVWJ2/oZeeV9u/idlIj20qZOXGSdPxt8O4WN6hW3Bj+J
 SClzUi2YG2Huw2fU3C6MPsqjqKMYF+7BpAdQ4GpJE8r5FsJ4EAj3E4nnC
 p6AM536I+9zpwEVpit7VqsKOeedYy9ucP7irCjm8JxaY1oEVOllaQgCPZ
 66C0jG3aFf8Z5DJNa5CtEEF7AzzcyDKoN/IIiZ7ruJQu68Gf99kjzVoCv
 2FqT34qc81KzmnAhCl8O3SH/JuvNdW05uEOb02LSsoOqA+FhszCe2eHzV
 hH+39WnCssDFPW/nT8oJJ35Xhqg8ykqnZ40LQ23avX3/kn54X3tzsr/vk A==;
X-CSE-ConnectionGUID: Jf9UZp2BSfiy+ri+woKN7w==
X-CSE-MsgGUID: DfDBMww+Tve9+KCh3lMrFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95214029"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="95214029"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:58:59 -0700
X-CSE-ConnectionGUID: 9j4N65LzQqa2aYdJpZ2BgA==
X-CSE-MsgGUID: eagoJzbyTcKZr8rSuAnr7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="291253771"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:58:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 05:58:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 05:58:59 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 05:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6AVjKpaNfHOKrFg7he9kKB5eXkacLxohIlchht/V/W30wJLjqh/VZpw0fdghTWbNFYlUNvYVfNVrY3Yx2X27y4eS68K+0otpEqblisV6oZSRmOVj1opN0VGdJ0I6n94EQv08cSi8f52uxDgrXIZiBNX/TgXOmUp6Bt2hQF2aePEg+gA+7oylgQGpRgkyGN6jlEMrfoemBO1Bemo5Qvi7EdB85TnZGfP7czrM2dOjoUOrbbwWP6jI9mSuD3T6Y+KB8doUCp4Dyjqsr6i4/unK+iP6ikwu0ix/XAEH+aHCxkwRfOZZp2xI+dR84ZsNYvn5KRnao9tyjUppn+OjrJ7lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnTGdkDfm+15ZxlEIFx66e7OxfbUSHth06DVeNEn2kM=;
 b=xufx64sRt4g9zz/BI/jkjKmxnT7XYDqbR+otBI6hvy8sWrUsd/tx1XvYhqp3STtiQZ8BwrwSSMDmzip/2GJjMFeg0lv6EfnjWqfWvfsYBRI/Tk6f/OBT4NFccs83yE54FJzxbHlXgbkXSatuggm7tGPB2bA/Rn0b1zCB8VdeqZRMt7XmqXSbpXiwgi41myeNkwzd1PAiaBWFapBSPRtvG0RmgfxIcWXxeporrDw2WEO7LlffS+t7ixTn9WmGwKoa3AoFPcm4Gl8UdzOxE5m0MnpC7dA6znzHIBbxmFzqoJefORoMB/Fi1T2bNWG65RGCoyN/5yUMsrHmrLO4mR5D9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by PH7PR11MB6329.namprd11.prod.outlook.com (2603:10b6:510:1ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 12:58:51 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 12:58:51 +0000
Date: Fri, 3 Jul 2026 14:58:48 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/13] drm/xe/guc: Add basic KLV encoding helpers
Message-ID: <akexqARS71ZJ4_nm@nostramo>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630132633.32804-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|PH7PR11MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cbcdad3-3c38-4487-68f1-08ded902d485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /dbreqb5tkJkx+HmJcV+tN/w2538Qkpr2ai2VGyCXKJL5cvDoyw8Ms1c5E1ECZpWD/uzHobiqdHGBVnZk6NeJFnUCMlkVzkCeJ+0/PVGt45TDdKYvwT0Dj5bRqMX4u8soDORIBGFl+QPTAMCxivAr3iR4zTMc9cGJAXMVoTbb3J5PJKjROBNRCEdPi1NfhyaFLGuKdQH7Kul0l7oFZ2Y4d0h6FWcwh5/8Ji1WJ9KC4/lFafLw+ufHlReivSwvw5Yqg0ZtQOoYzu604vnCbgPzyLlFVHZF2/yiTbd6k7bSwBujK+W4o/O9Gl0Pgo3+KJtEkRqKsYuDi7jEfYIMsxdgAEtyg5hbJGbnb0V1so+xvLZ8X6rlqGVRtlPwcg0v1eyjM8Q62ruYC8LbsThE3XoCqFH4RfXExq9L2WhKVJf1UZNlxJQvLOqf8v6sf+g7yvSIvfIW7vrHc723Sb08q/lG9JwN9zVYKzLp+43j+IPJADNhnkMO9vdYoEaYvjovgM7t3SKXWRrDtuVRLohDpMdMnp9s0VjpEys//+7sBsQZyQAo/01QGy9t3b83kam1I/5y/km8ONJrnwdvesgpJIECwTgFVMuBrASHa03pySwwXUCxl3Vp987jM6rM9u7mbMMufFsNJWJY2owSXb0ynrXUQjWP0Rg56MTozl77QK8iXM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmNEZVZ3aTJJNGh3bmdUZS9sS1Q2d2IyT3BEMmRKeDVZb2RuT2RKYnVLR3ZZ?=
 =?utf-8?B?RzhCWVVNOE1UaUY1Y1JqeEFXMXRPU1cwaDBDblBNaDE4cGttdGg3d1VBY2hY?=
 =?utf-8?B?b3Y1bjRua1MyWDYrNWNwNndhQXhEL01VOW9PLzBrazAzdisyanBJRS9Cc0xu?=
 =?utf-8?B?U1BJdDBXMHpoVzg3NHVlMEhZYk83cWZXOUtGNDhxZFBaM1IxZytpcmdlYTY5?=
 =?utf-8?B?cjdJUGQ5enY0M1FzZXhCYjdWK2pNQk5zTUpIOEY4NWxGZG4wWmFMTWlIeEsy?=
 =?utf-8?B?YzRiamZYTk5GUk50RnZBYjVnN1FKL0d0TzQzSEp3Vmw1cmNkYUxzS05QWmRk?=
 =?utf-8?B?Q0loL2tjTDFFYXZvUnIyZzB6b1luRDZHZXRTWDN0K1VFUmMwOHgwUFB2bmVv?=
 =?utf-8?B?Tkx2WDRJTDduaGV0MEpBMmtLNGdxQ1NBMnJMcGVDYjl4bWhEVm1GUWd2c3pj?=
 =?utf-8?B?WjU2VkM0MllLM0dHNk40T0xjQmRSa013Q2swdnhXMjZQTVhKb1VqZDg3UXli?=
 =?utf-8?B?eWZMWGo0N29kYUtPVC9wTHFEbk1tck9kcU82UzY2cDhaL1ZIbkYwT0JtSEhW?=
 =?utf-8?B?ZnVzNVV5K1NHaEdxQ2tuU3BJUmZIUkRqZG9RcmVCSmZJa2sxNTg5SjdpZEJo?=
 =?utf-8?B?ZFlMQlZobVVHNGNtQnpMeVQwbDZqNVpNYkJzRDd1d0l6YUlPZ3JGQllDODFJ?=
 =?utf-8?B?SlNmOUIzS2hhM2VhZElQZ2lVS0hDVGoyclpZd1JRYlQwZ0I4cVF1ODRIaitM?=
 =?utf-8?B?YktxTTJrdnFFb1RpQmtsbnFsdEswKzh4UlhwVVk3d21rUmV5dGFWclJIU2t5?=
 =?utf-8?B?dXo4d1hIRDJXc3M1cS9GNG4yTW56dHBOSFAzMHFtcmRSMFJWOU45MW51YXJC?=
 =?utf-8?B?aXhRVUdhTGhoTHBTZDkvWmNTRGV0eHBMYlR0bkV2QTFwaUdxWVNHazNCcWcy?=
 =?utf-8?B?OGJlR1pDRjErenErME1lZm11UkZxOUl2L090QzhJOU9QVzhVUlVEeDVpL1lT?=
 =?utf-8?B?RkJxWVEwZC92c1NTOHdIT01NV2JVVzNHMEs4Y3krSkY3aXZNYjlyb1lXZFo0?=
 =?utf-8?B?RUh6SDIvVHNSZUNkbWNuc1dHV1UxbFRPY1hpQ1M5MnE2eFYyaTNYNm5nM2hw?=
 =?utf-8?B?bXh2YmRzTHBoclpiVSt5Z3o1T256OWRpbnBvWTgxQW9RVWVJNjRhWlFwcVF0?=
 =?utf-8?B?Q0s0WC9hOXVocDVOU21za1VLVUJLd01mbGVrYm8xTzNLcWhhZ3A3OEhjdjRO?=
 =?utf-8?B?Vk5xaXl6VGFlUXN4c0xmcmkrK1hYcXlLM08wQ3lVaXA5MkhXOE4vMlpWc0Qy?=
 =?utf-8?B?aHRJNm9qcEhWeS9NQmZOSmZMTGtMSnlJNWlRNkZRQ3NqTXBwQVAydzdHcTdL?=
 =?utf-8?B?U0ZPVlZRaFdTSUlKNlJLZkpDbmwySDhmSXFpMXZYeS9JL2FmUDlDVmg4RWcw?=
 =?utf-8?B?S1o0c2hCSmZFUGxhT0pPNm42ODAvb3RxZ2M3SW9KVzc4aVNJSFlJYUFSZWx0?=
 =?utf-8?B?WEZ4TzYvd1Q3MFZnVFF3Q0tabjFKNmludGVhSmhRQnpHRTBnNUZlRUd6Qjkv?=
 =?utf-8?B?bzZ6UXlUOGZRalE5dHdmSEZGaUdGSmxQOVAvSlRXNTRmSm9nU3NMajNCUFBX?=
 =?utf-8?B?OUQ2UytKdUxJQnpvbUh2YVlNRmZOUmtuSmVuMEllekNoL3gxSjJ6RDBrVklJ?=
 =?utf-8?B?WUo3QURFcm5GWlgzT241VHVnVkc4aGp6ZWVpUGlTVEJnTTVFak1vSlIrNVZl?=
 =?utf-8?B?RmpJZmdYWGRrTHo4RGZzTmFSU2doODluaG5ydDUvVzVReUlnZzQ4QlZISmU4?=
 =?utf-8?B?NUdIeDdDWCs3R3NpWG5wLzYxREpBMjVGVEt0VW5oVkVjb282SnQ2ZjcreVhJ?=
 =?utf-8?B?MEY1RXVUSXQ4ZHQ4bzJQTnF1dlFJeVVxTVpsMGdxQ25HRUFkaWp4cmt0NXJp?=
 =?utf-8?B?SitTL2g1Q1hXN2tuMkNKRkRUS0dIY3VoVzBYZm95TnJoa08yK25TL0VsU0F3?=
 =?utf-8?B?dFVRQ3dFakVXWVMzcDZUSWlaY1ZJek5rTnBmajFSakxyZjJNRVJjWGVYcnVz?=
 =?utf-8?B?enZyVS9QUTd0S1dUcHIwSGdCaHpLT1lKWlVORUlOaHpmN2JIS00rMFNZM0d4?=
 =?utf-8?B?QjYzcVFJUU12UXVFQy9HK00rK2FqTkxnVkhyNG9LQlJFdTdpREhybjFrc3Fx?=
 =?utf-8?B?Y1FwV0toR3hua1BadmpSSTBDamkyQUFSNlVDVHRhRS9qb3ZBSTNnY0xKNHA2?=
 =?utf-8?B?N25VVEwyYlNBdG8xSXRmTFJEc2dKWU53RU8vY28yQVFaQm5DZDlFbzBDalNk?=
 =?utf-8?B?eEV6cU9kd2VKSWN3ZjcwNnFIa1Z1dDR2VTBtbkhWaURHKzIxTG5iaGVNazF5?=
 =?utf-8?Q?1Df9jvip+F2rw6ZQ=3D?=
X-Exchange-RoutingPolicyChecked: BIM/Q+Y8JSW1rgWpGuyi6d8EVXYUkBGQGGrG9XNzLW9BL9w8MmYzRNLREr9wwggLr1xJA1lgsF/8TYTc3ieH81vxb5rXSv9LzTGny93X8L3lTRqcfFw5eNM18HHBY6hF9oqChRBHY5/fm5gNW5CSWLSh2wVrinuW0IaOmos8/wNgc8WBKPJUFzsUy26IlE84X9EZJGQj9Q32iitXslXlHx70qaJtNstaMHfguMLjr6h6rppR3hmvMyD37HTmXf76rFY4J0YnpWra8CT4UCc24syHJ4lZVbvqUN9BcrMjwWsUpeiGzaXU4RX4VWHZWo994OEdENzUm3DwBBEiIErPGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbcdad3-3c38-4487-68f1-08ded902d485
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 12:58:51.3773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVYcl6rjeuLsAE0YVKbmis7vCqphlwV0+Bab8aPWUkX9jC2kPUp08NORavx0ZxCqalZ14uB72VtE3Nm0sNiSXJN8J1Psr21mDloA8U4Owbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6329
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

On Tue, Jun 30, 2026 at 03:26:22PM +0200, Michal Wajdeczko wrote:
> We plan to encode more data as KLVs. Add helpers for that.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 56 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  3 ++
>  2 files changed, 59 insertions(+)
