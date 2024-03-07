Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E68C48BF6
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 07:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130B510F132;
	Thu,  7 Mar 2024 07:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3jp7bGW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F93B10F128
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 07:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709795313; x=1741331313;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=F7tfXc10E63tXkqu6MzX0rLZdXyIV4qEQawN26vw110=;
 b=b3jp7bGWeeXXixhM3p6V/SLnTSUPPo8/RN663pBcH0QS0vihAc89yL2o
 Tj1UUZsR1iX33AUh2KmWH4PWDAmkOqqPbHrzNXydr1k2Dp1QI4ha5aApz
 pFjhh9TOY9CmUysShgz2CraAQ4mZNemcdywSI05ju21nKYLSlSmpuwTAu
 dQPVn6XZor7jfeG6lS8YkZOJnCOpKN5ypnAQ9IqDIAD3+lvuWDwM1NQ5T
 5CBM+1eETkobmQsWSChokuWKDCGhWNaPoYnVWwUdzR/MhcfOppPDAZshx
 Xj2bJG40D8eI8cIYev2tqkiVMW0FDm9ViBgLVJoKLznMA5AqSENro7cjQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15588983"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; d="scan'208";a="15588983"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 23:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="9923169"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 23:08:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 23:08:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 23:08:31 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 23:08:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6FezyKHYoF1N1GtxI+P3bYlRWxmwN1fq+hIT5+OMLtpt8kz7ajwoKj1tUVOqNd+WUsQLgdiVKaZ412xGQBztAyZYldFZBqT5aScwBzRwAtUr9c2sUMLVJxWcLn/agkbHGzIhMZ9P0cVkcD81Fiqotkda9qfZ4LEPIeNijk/aNsgW2/6Xh0aUoXfeoqXUNUsclweB9dPG532ERwBqF6tLZ/Ori8O55yOgW3l+lGqZipasMuDU7fF8rnlsXUcWdvA8XhUoYcy6Kq9BM4v9pdTpWctuzgKvAU8rwkWmc55G7ugOShlIMFsjbWHpV7qfO8aXeE85iGb0sWoBfuVqRvwGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ArlE5cCBEvDEjTzrKnPtgN9kMNAVSUhZoRsBmA7cFM=;
 b=E17sXeK1v/9hZQ/G6JN/ae5Ma1o9MQEPo9GR+Apk0P9x0FlRPCdZS51nJoKCSYbwJlRlKV0BRNQ2zcneFiesOFnk5ggG/nU/vvkdg+4Sobx5FyCL743MyckIrCVXCBVYy6/q3jXeIpGSQJyt0CX7W+b18cmDh+J3J9Mb++dSiibR+oVorrIk8YcsYS59y7zshYSOfxZ7en83jnB3LJLRySbvR7VD8GnJC9Ukio7rVMa2QZO4BejJDdaJej9LgHLH0fnmIX2JjmUrOPM2NLGqKLS9DomXq/+nZ4AVuADYztF88u4tgkOwTzNe1aM6Fs6h9m1w4QQ72L0LjuKbWY5UVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW4PR11MB6912.namprd11.prod.outlook.com (2603:10b6:303:22a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Thu, 7 Mar
 2024 07:08:29 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7386.005; Thu, 7 Mar 2024
 07:08:29 +0000
Message-ID: <523de9c6-fc21-4a29-b76c-2c33cdca459c@intel.com>
Date: Thu, 7 Mar 2024 12:38:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gsc: Fix kernel doc for
 xe_gsc_create_host_session_id
To: <intel-xe@lists.freedesktop.org>
References: <20240307045533.1867892-2-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240307045533.1867892-2-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::31) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW4PR11MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: ba82f9f9-83fa-4dda-1903-08dc3e756418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F4BylAWlxDI27HrcDIvFxmpaLO/LDzFKi7y33MotfBsC0mLlnf3lKjzJgv3Wrl+KYMxqQXByQBmSl7EEFF2UTS1afdtnU8jXyZYKUwaA4Dh8QctkzOLaGB/34o/NqdsrN2yVaxg5avNTP526ckMJmQtmcJB8wodROKr/uiA7y4NT2d0xkWqlu4gKPh49RLmGcD6FXcgL553fbhHc12YA6+KzuaajjfrLm+zyBjcFdz2GHqOpPGUC+QBvBHZ3m7mTeA3PiIfq9EMvIYzuwe/QR2m+39CNej/Y2N152i1B1Y2UTlEXpPZFq4pBUhyXJKvGiNO6r5M1br6CeqAhNn5XHRZeUYVkEBKLZJjttpLhpl0/p0TVgIQcIujDWazk2WRLBNISGObBmmthxdGIKe7ClL9P6pX+IfTZnCvo944BThW+ysHCt3O3n9wuZHeOaGJA7md1dgpDgdaXYAMtvFWHnCKf3aTEpfsC+VvHGLwcGLzDJpSdMcmiST28L97KT3mz5XZWUXyQbNblsM+rNIzu2pQD5Ee1h6OIDVociKREORX5wHrn6gC/acNp0De0HUFTWTiR0d8PIhX4859u3S0M931LlAjlOYKpX7U/wAPZo3Euc0hAHwmw32mZx+pxiUA9SY20D78UNYYbA+RoQnfBzpKXTzSxiSAdjdI0+rdP0p0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmdNTVlOYlFaM29xTmtKVi9uQk53TER4Q3VpVmxWVjFqQklPTktiQ2NiSkUr?=
 =?utf-8?B?ZHZUOEtJanRueWFneVR4VDhiSTJEL04vcWVEdnl2ZHNGb252cXR1dGtnOGwv?=
 =?utf-8?B?aWNHY1BDMWVTNjlrM1VSSzRZV1dqTmp5ZjlMdElJcmI1ank2LzQ5bUZtTHZN?=
 =?utf-8?B?V3BqN29aZ0swT2F5R0pudStQUWY0Z1dXQ0sySUJrdmdrRVBVWHRURS9McUd4?=
 =?utf-8?B?VTBqMmkyUEVGaHE2YTI4cjIwYWlkVzZsZTlZcVczQnhyeWJFS1M0M2F0bkFN?=
 =?utf-8?B?QWY5QXc0YmtMZWxSRS9NamVqTGRLdVdUbHJOcXZyNHNGNEZKOXdOLzl0Tk9P?=
 =?utf-8?B?dlhOV1ZRbWMySzlFNGRsMXNScWEvdjU3Z2Y4aXJGMUs4b1RlNG9mRWhEaVhj?=
 =?utf-8?B?OUtXQ0oySDhKQUFXd2NYbEE1WTNHM3dna1JVMTlIeWk3Z0ZuV01mOWdjamdq?=
 =?utf-8?B?bVV4VWNOMlhiQWF1c1NndDRFdDR4L20wQ2lyZ3dncm95N3lMVXdwZWszL0FW?=
 =?utf-8?B?cHlBNDFZOVcxWXI3YTJBTmxFNkJUaDZiaExRZ0tmZVF2VldhNTR2MkJ4dnVn?=
 =?utf-8?B?V1B6UWU3QUZQcG80dWJWVUdPTVdsVXZSOHExZWo4eVRGd0d5ZWhoeUtrSm9h?=
 =?utf-8?B?YUpPQWJVL0VaQzRPaTdwVFZOeUF5aER1MkMrTHFLUFExTzdkaWNlWUZIem5Y?=
 =?utf-8?B?RnVxSnBIMEdEeCt5cndJUkRHcTRrZFAxNHA0WFZoYnN0MlpaT0htRlQvTUJi?=
 =?utf-8?B?eEg1a1drNjRmV1oyNXpERFZZTlNuaFpDUGxORDRYUjRXejByOUpVaTVHN0ZS?=
 =?utf-8?B?ajJnZndBY1dERUVSd3V4MmRYajZaM1hRL0paaC9CcThZQTI3YysxbUZDclA1?=
 =?utf-8?B?anlkTWM3NUlHRXgrOFFlY3VPSUtnTGlIaHl2bVNZS3IvaE9wYW9QSTFneW1P?=
 =?utf-8?B?ZjlCUThSVkxGNTZESGp0WTI3TitTQWxaZlQzY2p3WVVJK09NTlFTSjBXdmVG?=
 =?utf-8?B?SGszdDRxTExOakdxNGJYL1laOTN4R1RudkZUVjZoZjNSbnZoamJZZ2hSMjMr?=
 =?utf-8?B?dXJJSE42L2JXNnVJZmR4Y0xubzhxNDQvcTBzaE9JOEpHYTZ1RDhaY2ZOOS9s?=
 =?utf-8?B?SEhKWFZCSVNYdUsydEJneVBLYzJkLzZwZUN1V0xoaDN1ZnZkbHV3aithajha?=
 =?utf-8?B?ekhsL2F1TGhZQlNWdmd6c0J6ODQxdTM1NkFyVzJBVjY1U1lLdi8wWTVxUzdI?=
 =?utf-8?B?S1YrTzJNdEljTTVlNTVrUUFGVS9oc3NvN2dQVTl3WUV1dDdwbVBTK1Jja1c3?=
 =?utf-8?B?K1BEREpnWXdpMGYxVzczYnRqbVFWZmJzcEpVN2xQZy9yM2o1SlhZK0xsZEtS?=
 =?utf-8?B?Skk1bWxTSENHZkZDU1p5Q3Z2QS81YjJSbHM0ZUJlaDlPeThYSUhNSVJDMG9p?=
 =?utf-8?B?dzFrTUZjOWhmYXpkQjBUOWMrcHR2d3AzNjRNNjI3azVuclRBdER1SVY0YzdO?=
 =?utf-8?B?aE0xQTh6OUFXOUhiOHl4R2N1cW5UNzd3aGU1cTRNUE9FMm5UZzlUVXp0aHJ6?=
 =?utf-8?B?Y0VOc1M1aXgzS0hvamhrVUtPWEtuLzVETWREYldUdm1xUTNVOURnb2FaVXo5?=
 =?utf-8?B?MEUzUTdvMjN5SDM2NThRcnVHQ0hyYzBkVjA2TmlacXZLZlRVVXozeWdUV0xC?=
 =?utf-8?B?MXN5djA3ZmRmeW8wYWJMdmsvZ3ZEZWg1emorTzc2Z1lqeEJUTmJCWHhNMUM3?=
 =?utf-8?B?dnQrNlVYdDhNSEQ2U3lvU3JpdFM0Z3gyaGozZmt4TUhkcUpIR252M3pPZERO?=
 =?utf-8?B?TXQyb0xmbWQ1UXZ2dncwN2lOMlg5b2RMVGl1dUFLcHhOWHdOUzUvaDZ3UVZ6?=
 =?utf-8?B?OUExbnl5MndPZVVPS25EMFdZRVpBV00yMTBKd282YmkwcU1wSUJWN3hDZFdP?=
 =?utf-8?B?TUJGUWxMSFF1Q2wvT3VPYWtMalJ2UmR6VVJydDlTZ2dNSHRJRXJIOGdKQjVh?=
 =?utf-8?B?OVhSd2sxNWNLdTRiOUFUWDVWeGNPQWZLS3kwa0RhbnFDSm92Rmdsemd5WG1s?=
 =?utf-8?B?Z25vWCtWT0NvTTc4bGpUc2JmdEF2TjNKM1NXZ0RpTk5PemhOYm84MVl1cjlI?=
 =?utf-8?B?OElzc2ZjUkptUkNadnhLVFlmZ1Q5aWxZaml4cGpiWGg0NEJYREJyYzM1UnRX?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba82f9f9-83fa-4dda-1903-08dc3e756418
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 07:08:29.4095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7bMB9oaIumCXgI1r4IwZqT3HPcbUneRgYNd1YiPP2NtuwWKINxX7AkgnUiHFPtZcjhYh9NZJfFAxpPO5zZ+EvwNsQfVdsTJipHhIPoUZzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6912
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


On 07-03-2024 10:25, Suraj Kandpal wrote:
> Fix documentation for xe_gsc_create_host_session_id which
> was xe_gsc_get_host_session_id.
>
> Fixes: 152f2df954d8 ("drm/xe/hdcp: Enable HDCP for XE")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gsc_submit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c b/drivers/gpu/drm/xe/xe_gsc_submit.c
> index 9a18f5667db3..d34d03248843 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
> @@ -41,7 +41,7 @@ gsc_to_gt(struct xe_gsc *gsc)
>   }
>   
>   /**
> - * xe_gsc_get_host_session_id - Creates a random 64 bit host_session id with
> + * xe_gsc_create_host_session_id - Creates a random 64 bit host_session id with
>    * bits 56-63 masked.

Looks good.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>    *
>    * Returns: random host_session_id which can be used to send messages to gsc cs
