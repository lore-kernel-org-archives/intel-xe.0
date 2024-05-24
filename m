Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6601C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 21:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F322889208;
	Fri, 24 May 2024 21:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSYug/F/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D616210E0CE
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 21:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716585456; x=1748121456;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=orBDXxMpWOZ1IE9FeBXizIoiAr2PxDKOh8MZVSDSB/0=;
 b=DSYug/F/yaJ2s6gSfZQtZdS92vvHRRWv9I0JYmkkPbNsYjQzBMxrGzlu
 E2BFm+cmSdOi0P6O1mGXMmEpxb1JXLZmbvV1j9k7+lKKRiEcrLDQ/JnJC
 oWO4v1D5YOsXaCKnyD8D4JffcQer3SFlJTRIZ91VxHyJltYbc76iWCMCq
 gLi0f8MlnT4d4uA1Cs8TEgMVZ82gKqwhEU7yY3mP4p6KUfHxMoXPACGVN
 JDAG65mP9hdUMp9zApbTZgkWnGvfu8CQoc5cn8VU9/uB435iAMcEv/McM
 aYED0g+QypXOTOAq7AckaQa/nA7zUmRZEBQd/J3bMQKn8slPDSfyDtUD9 w==;
X-CSE-ConnectionGUID: tp2uUCLOSDST3jWRtoX7rQ==
X-CSE-MsgGUID: lzdkrIDwR4+IKHtxpI/wig==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24386998"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="24386998"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 14:17:36 -0700
X-CSE-ConnectionGUID: cFxjWPJ6RcK3Xliw8Iu4IA==
X-CSE-MsgGUID: f7mzKrsZSzGa7vBAwkDTPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="34151176"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 14:17:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 14:17:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 14:17:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 14:17:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWgew5bGRnyCs7U9/Kv42Z9aKbd/fmI7qd2EMjii8lFt3+F2BDEIiFi1sYXQ1wzwUhNxgjTVtvScfc5Vdf0gFGaXVeVuSO2E8V0eWO/ar6KzKVcYcaR7crpwphoQTCmXjtha+nDXbLnmb2VfnxZOsDH2BXTJXjKlGT62tV6SDG/K1r4xJFeHQmKgXHIX+9Kx5xI3AAxlvrlCdAImyDnjyHVsZHNttVCn0GcTxAKxl9RUwtCBjIyrp70pSg9oidZSEoHncxB0B1H3xTxTrUFAkmDXCoGpE2rN3AXAJXakm/wVX1z4NRrtln9qWUl8oZ4QWj/IfE1yRf2SM4zDKf/Uvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK1SU0m29tC1xiR+ejGXouYxFV3qddEB4mIMJICa3zc=;
 b=UJYOOgIg3Y0telxjEYtEtzrOKfMe+Sc4MwsxjbDdXEVLk0AzWRW88mFFlrtRtdvHFizW9xS5ZVr06N1lRgE+/jSwky+HcHTKZoXCrKLGqUOQjPrwiVz47c2wR+5vZ2ZQ9VEB+QDuOIP6aisUA17KO/vEK/igLtQ/x6EBVhUMDvjyf+ZKIWSU9cMmN2evw9FY9X0jTzBmsrodXRVNhW8Zq04tWGnWe8rXIG1AA539KDbnihOvArTmmdYAJEMPlUhNGT2Uh28W7v4oYizMfAD3Z73ehrWYD/UZbT40vt+2e7Y4VZRjZiFhJm32VulQXTcWDIehC9anxfCHtwjRi1AfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 21:17:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Fri, 24 May 2024
 21:17:32 +0000
Date: Fri, 24 May 2024 17:17:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jani.saarinen@intel.com>,
 <matthew.auld@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Do not access xe file when updating exec
 queue run_ticks
Message-ID: <ZlED6bSXEiLnBRTs@intel.com>
References: <20240524210949.1345804-1-umesh.nerlige.ramappa@intel.com>
 <20240524210949.1345804-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240524210949.1345804-2-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: f8138b01-a305-4e0f-4413-08dc7c36ed06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LqmvSbvRk26vXST1VeGZ18ApX3DpXWON5iDmQ7SMkaULE0dn4pmSsM9fzmRN?=
 =?us-ascii?Q?uKAOaJR5PKu3jMWK1WzlckUV2xA3epYJcD1BhOpK22rgxg4lwelmLaE4YR6A?=
 =?us-ascii?Q?HsCXIiFlD4y6n/ZGoLS0p0g/JrBl4zodGaCjGoVCnff9dm5NqeSBnpKOeEoY?=
 =?us-ascii?Q?T4GFthcbfzJ6CIjv12n/ru6Wh1AoBHL/i2KhOT8hpTB+OWgqsSLbyrQc+TPk?=
 =?us-ascii?Q?t+5kbzuAIlapHE+uiy1rilKL2rERv0eFcvK2e/BPYVSwHjuYVmTQBtZSZc5m?=
 =?us-ascii?Q?2L/oKZhRJndsWcJdgcM9t8Lhchzrr8ablx3JZlT6DUgsBsWfJibxDSsie9uI?=
 =?us-ascii?Q?Lk0t1T4s3Zf/PhWKuTz9BJ4zc+hkB651zXsFThntLg/As4svZLLvyTQv4cA5?=
 =?us-ascii?Q?Fz9U/PixZiogOR0vTwFk/3t9xNjFqug1iV2OV6OHWI35an3hIfzJ88l+OZmV?=
 =?us-ascii?Q?aYgXxmagNo/LKFoivvNQx+7zEPoAF8yrFMFblLKLvDQ0PxlM/O6pU9auQ8Y5?=
 =?us-ascii?Q?+A+ByEdZqfP+Cnsa+IyXll7I+3vEu1dyJq2eZwo8i42ggQQQnIJcpPxbeuTY?=
 =?us-ascii?Q?6bkqSj09rwVeYJrMcMMZa3isYI3DoeI8DpnDG0xaM5n6SGXNA2UVNdErE2lI?=
 =?us-ascii?Q?8+Y0BS+8HGrTzG9fRDL+8mSEnZCEq8m12Ynn0BVm6RjDofg5nst459swjPgM?=
 =?us-ascii?Q?lYa7QqaTd9lTp11OhXOaOR7slPk59By8CIy9QUAatSfWNggmjqqfcn1W+y93?=
 =?us-ascii?Q?jonqhX0TdZqjLD0Pj9VO+P2QVOngdayTEW6ENzsZN84z+KwOxrAjQkKdRrKW?=
 =?us-ascii?Q?tUbP5n0GjmvGnzAaTKfKLWnTU8vW+aZ0KgUzyBXmSpJmwticv+hl/ugdlmgl?=
 =?us-ascii?Q?+cG35uaNCePWQW9VzpzYtxhDSToQJQkWm6SiiYse8YAPMH1P5iXHtldx5ZBn?=
 =?us-ascii?Q?kOZWmipAlhogzSZNPQrGk9LecKQavoR24V+S8t2kjKPNWIWKJdr2UqjJc2qk?=
 =?us-ascii?Q?riBGz2yN/gfI2RLLIpCOpCxUBx0GTMSyKBqk0VSCxQQ0SbV/pjYroPESSm9K?=
 =?us-ascii?Q?6M4Vw/Q9HmglTQ8xs2yPmIUB6gKB24GUTxrUeq3yVbFVZ2s4TF4k1nZFnuFr?=
 =?us-ascii?Q?yZpv1/tb/KlkY8oHxKyEi0s5AVdFvoYYej9JTjgwJixVj27z3Nj8mJfMbvj7?=
 =?us-ascii?Q?MgDjkfamqe3y+S7mJjE3lqkYVjpoybEI/F3uf9CIVqGRSJQh2Qy4rZP94rQ?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T2Ab8Z0M0Qfry+HSuWlKn4MI1h4hP1xKUr8KZ2jQMNse2dlaOI0azmO7lJ8j?=
 =?us-ascii?Q?OaQIFr1cb8sw9Jq9p+t/SepcGX3BENKh47kXkZDCvSdutx+wDilhju39yIBx?=
 =?us-ascii?Q?iygmsIko+Y+lHAiHg8DI8P3WQRfto+SzfNMaT6hCTe5RAk93SsTv/csQDiBs?=
 =?us-ascii?Q?NCMJ9u/lwwKMAChVdJbU1Zdpv0UYexwpRVzTkvSjoxgnbHOvDEgXurUDBE6L?=
 =?us-ascii?Q?wVr43QWkZUjP1Mf2k78kjtYn5P1EP4DkeRmsmT1mfFV94BMNhuM4Ul3UoTiD?=
 =?us-ascii?Q?ODDoMKC97VH+cA5+MEwwTLr2nGjjTNo3KKzWHGeFtV7TXjotyDNmfiA8raTx?=
 =?us-ascii?Q?ihzYJqBfUxt/nLep/ybDJ3KEpiPGY8vdUCbDb08qwoa4Nh144xYkua69N+63?=
 =?us-ascii?Q?1F1oAglqnCQxRNkeUxX69UGE6sWufIjeqKuvdoag8HLPsnNyGC2TRgIrRTyI?=
 =?us-ascii?Q?+nhSZofj+tcGXNt5UeLPKzFz47YuC2ZgMW9dNOKE3TLyTwrEi+feNzcHsJpR?=
 =?us-ascii?Q?s2ht1Eqt/Da1sR2xq54LWSwivICLZgE5mNQJt3rQjYH2UWrGHT9uvhfS/9/V?=
 =?us-ascii?Q?Xu/EbbGRikWPX+1zFzChmIzeYXr3ybfIfi0+oYUUvOMG+wu8iMH3dtTfO6cN?=
 =?us-ascii?Q?d0K7Gmbuggc7Qly+WC8FqBB465FqLHDGaidElCwKQ57a0iWvkErBezEYA+oi?=
 =?us-ascii?Q?BytGp8W6CXnN2ZgdCwXoJ5SNxAm8xgCspYVOYD0w6COUZx8+aCFWr8fMtuoh?=
 =?us-ascii?Q?xPOe8jYH/Go/IC331h5RR7SMyYf58h0Q/tmm1wDpJKzgx5cLgPVlhpXJH1Qb?=
 =?us-ascii?Q?S92okW7VaAbtsmd6JRwvzJqqyZfM3Ur0jMQ3w8bWzfkQS3jCdq1TzyGLgvU0?=
 =?us-ascii?Q?2dLX9YfwS8OU/zKs4/eNv4hHHxi84xiU7ihdq5TbjVK2qZCZiGcSKZItbQFx?=
 =?us-ascii?Q?rr+hGri++veF7atP4g25aTwN83NywwRMFW1gDssjM6yTGkMVNja2rCwIeloy?=
 =?us-ascii?Q?H4+M+G36tXNK5rbLoTz3bBVyMowxV8YJxBsE+eF3oOXMWRR3GbxaNUGKpzUc?=
 =?us-ascii?Q?RKqz9nXyeRD45axbXRliGR4AWVB7Z9/PUmco4r53GRa+Ip7FbFEeOx2IVO3Y?=
 =?us-ascii?Q?vnGPGjBF2X/AxH5fAEro7mStznDW/kwhp0jnTeRpiaOXE+kHCar3zg03Hk5u?=
 =?us-ascii?Q?DwpfCzzmKBN5m0eROBMh6+9tqzjagcZCMr+MQkA4iYhJqTl715ywJ1WOsSui?=
 =?us-ascii?Q?Daksx89p0RzyyF6FJFOHrJSVj01lgd0i2NC2WVXNT7QDfT0I2JLLglezSTue?=
 =?us-ascii?Q?tPtwTV4Sd4+R3KVvKGaz7Con30Jk+mmmlKvWRL3TL0yA6DGnKqWMKMY3QPO0?=
 =?us-ascii?Q?3Ztqq27e4aU8EiOPA7L41WF/OPq0Umm6bQSSaU0gd8oL+y5giZ7OKfTv4FXE?=
 =?us-ascii?Q?1xxBO9mENWeFCQsHxH8QBHH0f0fCm6sKTNHua8WSzTIF/AWe965wJz5o139G?=
 =?us-ascii?Q?hO536KkGMvgPgkKAumLl4XhjTMqP9MQi2Pld+mCTJCyB4uwyoG3OssemSx7f?=
 =?us-ascii?Q?HXxAFdUS7DS9e9qxBCTe21qnepK74wxQs3mJ987g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8138b01-a305-4e0f-4413-08dc7c36ed06
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 21:17:32.8362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtzVxKgdhi9bE3ttsOwBJIFFV4kaEd9GoAhV7CPU1jR7aVmE5TexYU6M+tdcxt67qPkYJMSMJX+j2W4yspM5Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8182
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

On Fri, May 24, 2024 at 02:09:49PM -0700, Umesh Nerlige Ramappa wrote:
> The current code is running into a use after free case where xe file is
> closed before the exec queue run_ticks can be updated. This is occurring
> in the xe_file_close path. To fix that, do not access xe file when
> updating the exec queue run_ticks. Instead store the exec queue run_ticks
> locally in the exec queue object and accumulate it when the user dumps
> the drm client stats. We know that the xe file is valid when user is
> dumping the run_ticks for the drm client, so this effectively
> removes the dependency on xe file object in
> xe_exec_queue_update_run_ticks().
> 
> v2:
> - Fix the accumulation of q->run_ticks delta into xe file run_ticks
> - s/runtime/run_ticks/ (Rodrigo)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1908
> Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c       | 5 ++++-
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 5 +----
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 4 ++++
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 5679e9b15d06..39621cc10198 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -251,8 +251,11 @@ static void show_runtime(struct drm_printer *p, struct drm_file *file)
>  
>  	/* Accumulate all the exec queues from this client */
>  	mutex_lock(&xef->exec_queue.lock);
> -	xa_for_each(&xef->exec_queue.xa, i, q)
> +	xa_for_each(&xef->exec_queue.xa, i, q) {
>  		xe_exec_queue_update_run_ticks(q);
> +		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
> +		q->old_run_ticks = q->run_ticks;
> +	}
>  	mutex_unlock(&xef->exec_queue.lock);
>  
>  	/* Get the total GPU cycles */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 841d3ea71e0d..4e9cee088f25 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -765,7 +765,6 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>   */
>  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  {
> -	struct xe_file *xef;
>  	struct xe_lrc *lrc;
>  	u32 old_ts, new_ts;
>  
> @@ -777,8 +776,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	if (!q->vm || !q->vm->xef)
>  		return;
>  
> -	xef = q->vm->xef;
> -
>  	/*
>  	 * Only sample the first LRC. For parallel submission, all of them are
>  	 * scheduled together and we compensate that below by multiplying by
> @@ -789,7 +786,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	 */
>  	lrc = &q->lrc[0];
>  	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> -	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
> +	q->run_ticks += (new_ts - old_ts) * q->width;
>  }
>  
>  void xe_exec_queue_kill(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index ee78d497d838..6551e45933a3 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -151,6 +151,10 @@ struct xe_exec_queue {
>  	 * Protected by @vm's resv. Unused if @vm == NULL.
>  	 */
>  	u64 tlb_flush_seqno;
> +	/** @old_run_ticks: prior hw engine class run time in ticks for this exec queue */
> +	u64 old_run_ticks;
> +	/** @run_ticks: hw engine class run time in ticks for this exec queue */
> +	u64 run_ticks;
>  	/** @lrc: logical ring context for this exec queue */
>  	struct xe_lrc lrc[];
>  };
> -- 
> 2.34.1
> 
