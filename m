Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF42EDE9A0
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 16:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A1310E126;
	Tue, 10 Sep 2024 16:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLfalwff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A45E10E126
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725984993; x=1757520993;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0zQM3uqD8R5kBwxws/7Iyo+4H5dbd6kDm0m8eTOzvnY=;
 b=LLfalwffmfeIlGlDCH0aaO/i65s91KHWtxj3xfFmTcdYGwXKnfn2Bz/b
 RaKHZUeG/bpg1WzhZDsVKUCmMMG1QQYFRg5xKauQEdshZOCNLZJLoamP/
 Z4Y08HaIo7V1cDwFtnPnCeCvhLZbdkOs0FXrzdtk1rDAR7lNXO1osu4UP
 ZEyMxTKJz1+VhkmsFpQnl9SZ27FUIpACq8gV8O2+QjKBLQIDh4FGzgjjg
 3Hvf8KOCgisBu/uNY/Ld1GWvqDDsJqaeMw5iSrobtaGBOoYW7PdCj1RQn
 PUWTTk5dD6mPjxFCIZPCNPuLDPZJfw3yCmFKYr+dDV06XoI4tmLJUPdmz g==;
X-CSE-ConnectionGUID: A/0Lq0mFQfOqeE6oTNbGAw==
X-CSE-MsgGUID: ZCt1aXOSR4iiKiAty4TPCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35412412"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="35412412"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 09:16:32 -0700
X-CSE-ConnectionGUID: 5XxE7GPyShGkCsR+vRz9PA==
X-CSE-MsgGUID: OYwPMIi8SVKZ4IT3dYsEkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="97907468"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 09:16:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 09:16:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 09:16:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 09:16:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 09:16:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Et8LGL2IPPV4Ry99g0/4xbHrWXU6rWmnsu8rbMpgYQrNBAWVbmcw2Og2nde1FjeK53HS92w04XS4r3MRyXanOIH+WDLU6Mazc2Il52IxbfHUkE00mzaD3RrCbKHmh4hJKXHBXHHeGCy4vHXBeMLxU/3kKZPmpMIUwVETn2qkWQMHp0q5J/HBVRIOFHwGk1xS2Q5xuxEixtF7xS/1h35osIej6UQT775ln1Iy6fqck3IOA+zZnoNVfJSKHljRBYHwYBPnLETBrHNJYBBDyQy4vlHAuDHliUsT+3ADh6niv1+NdT9jyN354kOkGYeQktOdebUPQahMXQacjs4VZAE5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzAhMiG1d3ZML+ef0w30VItzCzr5BEmwr7MPPnBMers=;
 b=bsO+ZLgM/SAQn7SwANeLeYsmLzLNtIhpDS+FJw2/YG/8BZGDdQ5oNvLDJW15v3riGPAdnTIA0ajNV20JLIYtD7QF9GgH10C27l1xPcURoavmR8RP1sc+T/kik6qGHS+URsrRqe1ePcEcmsM6/DDiWmdYIziDJNpUNKN57a7hkueA/TiEtKkIp8WScuDbv1YhwmUxH5BqZMagB/EOZ/wRpUkUCEojGowjmvSkZBAbRGj4dLrax4f0VL9S8eWhTurR18khJCqL63xCHI8h5bfGDd7CnaNjlzpqpcVHmUcWtMSI15tGKJTQ++s1nQibgpk/MKciNWVPI1r/tClULQO46g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB6221.namprd11.prod.outlook.com (2603:10b6:8:9a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 16:16:27 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 16:16:27 +0000
Date: Tue, 10 Sep 2024 16:14:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH] drm/xe/oa: Insert wmb/sfence before enabling OA
Message-ID: <ZuBwU0mxzS2e9P5s@DUT025-TGLU.fm.intel.com>
References: <20240910025907.2667875-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240910025907.2667875-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3f5cd7-79ba-449c-6345-08dcd1b3ec6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CuP6mHMHRSVNU+6vqa4WdKwcsZO3SIcU0QwZ0W/oTs8YV4lUtzf0QwklK/rT?=
 =?us-ascii?Q?DXshBcB1NNmvT/SsO6YRvJdVOYXP6fF9xMUXz0vkSBoCJXHTh7K6fGPhS5ME?=
 =?us-ascii?Q?7b4CGbbj1weI8GDXvbu/zZUUUIEYRie0mB9YZw9roj/tpZ8MmoKnlPm4CoCi?=
 =?us-ascii?Q?mNhKccIH98/Qr41IXH7pWZAD6ZO16qXTxt8pBdMXGhzrD96rmS63Yp/f2XPO?=
 =?us-ascii?Q?1/oZn0nwCa4AHuz9BnFFBtRlnueFrGv+WaxdOKmCTYkZqEGTI8XFzPMPHg/f?=
 =?us-ascii?Q?eRRCm0QWK3W4SibPUXwav7k7G0gzQBTLVjWKsqviODUF0U33N4P1SLRA9ij5?=
 =?us-ascii?Q?AdyLy3ptiOAlfHDVXPDXoYWkkzgbbo2qWqHLWyc1IEOXpVeTJVT91ElEdAAL?=
 =?us-ascii?Q?4+xzge4XmFpSdoC8Sk5VkPQlP2NYf1uoWcOiX9FqYCLQTKPjunsmSF8EAdTK?=
 =?us-ascii?Q?Frahr1ScdwlFzqjY9KZnhpQtsVcssWFuXl8AAmjeA04tybC46Wl3nSEvW4w5?=
 =?us-ascii?Q?34AfwMLu9b+n7HWRo7d3mfjeL/LUvkSMsS9w2qi2DY8959jcyN/e2pwzg1r9?=
 =?us-ascii?Q?vxRzR/nPQJ/ImDcM1s5T78QUpfh2NPnNBZ0a0YIxgFJoVN7rDBAPQN0w85XH?=
 =?us-ascii?Q?qmv3iubm0YODeiZkyqi6NRJoP5O4jP6j5UhW7CnRuKqIIV+dKMPq5B1qlq11?=
 =?us-ascii?Q?99gUekxcMmhPvN2nSqLcZCSRXDH7X3B1xiGOkiYmpOF25LCcTpBTdkMC3mC3?=
 =?us-ascii?Q?OgZzwJ5xHO8TCfueoJHBO6J7EWQ7wV9fb/00grQr8+tKkQOFIGQ1S5JasZKg?=
 =?us-ascii?Q?pkRfCGxOk1lktAXpWePR2oOTUMMsWkpWM6coFoFet8fIiJweqWOcQKr653AN?=
 =?us-ascii?Q?ptZhnHcTcR047614OBxCVIGv5C6L7aD947hAcrpDxNsHQ0fWqx6vaSVtI4h6?=
 =?us-ascii?Q?OBv3aasUeqUBlMHQS5NxAnMWGZVGfN+zkACNUesyTzR+RGDSFW3+/2Y5/5t3?=
 =?us-ascii?Q?3qUGgOxjOb8X2L8RnyvQYUW/lmZ6Ga1mWjJBBYzif2v29soKvgzPk6vGeFc1?=
 =?us-ascii?Q?3XBv7cdIm5QF3QOIm8oynwESaU3cFDw5XRl+62DU2dc6cDavRIpTaHT9LnQH?=
 =?us-ascii?Q?K6XuQwN2Z1B4GEFC97vCz2vYd3M2B1B8/eAWOGjXNRsYzcDKPvcdLZ0fmg50?=
 =?us-ascii?Q?fuFAm62ER7IXMdOcn/iJanR5KLV0bkY68MFCL4gJiZtVDDo8qIrCZQMNyjiL?=
 =?us-ascii?Q?mmjbxK3HAH+IMZs7GaNjMTOIaO8EKZaIOGAPhTGrbxjxh3wBO5xOrLZZCwta?=
 =?us-ascii?Q?lfF1ATs6jKuM10b8Y1Nf46BNze5haie3yF3Zi0JnTwL/ww=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+YnfuseT/8CP2HtKnlOJkvHxfJFm/r+xQM1N6MDGinJWOj5FcrevAixGNwOI?=
 =?us-ascii?Q?TcvIJ8XMj5duCdcUjJlvpMvjoVKXwuB/tp0TghS1RM6z2gioGls64fnz3S2V?=
 =?us-ascii?Q?cIEQv11aiXv2TvOcy4Wch395OofkY6Io1bakvPj47PQqChVonMi54sugDqp2?=
 =?us-ascii?Q?6egUuQ9UDs6XBxND+N+2KisIfR1qtLp/YDE4qmLNxtTbdYxnjdogOYWw5ri5?=
 =?us-ascii?Q?iZU6ajVa6ouaQRH6K1+0H1CIBESItOiZq5IB3SyAxv3vyDVPFGOkc+PZIVmT?=
 =?us-ascii?Q?PEDkNWs0VOj0JHO6i9y5o7AJA92c+1sGii1jph/c808id5WrGqDrXqXc4cHv?=
 =?us-ascii?Q?3Jx5HINCNqytAgcifGLAeP7vyL3YNqT4NLvbYd9cT8v1LX+Ia6DeBHlOY8jT?=
 =?us-ascii?Q?jjrWlQB00Q9hShEsLE4xav1HMxUmQkg7yoepUdrh8yHL02ppSFw/9IO5nl2h?=
 =?us-ascii?Q?UvF/br23KAgv0f5LgM03ngCn1Qfofpur+7IyV5J43i1OCzPay4x1enOYGsfl?=
 =?us-ascii?Q?oTeKlKMKlBF56436a66gut/S9oLvo9AvE+MdCCzlTktGUFPZR3l0/v8TFlpu?=
 =?us-ascii?Q?+5hNgnUf48bz+l6cQLDrkCzCdMaLV2p/ObPAJB+tPe0u9hi12yricz2Ac9Jh?=
 =?us-ascii?Q?0dBnNNW9L8DgF/PHzmjSSnQy92ygC4qrvkoma9uGFa3Ew7NXQbdJM7Cy5dRK?=
 =?us-ascii?Q?fpYhQmB132cq6A1zC+KkChKYhAlD76gGhLBHw710mN50u0mUVTbUMeB4dTjH?=
 =?us-ascii?Q?MIEzQDy1MMYF/4CzGMv3zADYw/dlHpkppMXt07HEGcJa7bJSQ2Qfdqvr64x9?=
 =?us-ascii?Q?uDwtnuldOdzeKT1t4wZJ5JaKJyi3VIj9keJqVtfAQTQrH/Ourdf64oIrEUxg?=
 =?us-ascii?Q?praI3890jTkCXp/pQn4Eo+SLsNUrcLelvB7eax4bBVKPEB8xTs7uUr29k4vy?=
 =?us-ascii?Q?O3pAmnrU/dABk36C1i7qiQ25OeQJKI+vprx/y8qOdWv6TvUmxro8JHJH0VL5?=
 =?us-ascii?Q?ffUSsJ2zSAHecXXtjnWTZer1AseGeoJ9+3+685ZqM8sg6TToagkHoIa/2Pin?=
 =?us-ascii?Q?UM/wXrfDDzD0yTor/zmT0FYA73tMrWW8pQATIF4pDdkmXuylNa0i6WxPE6xo?=
 =?us-ascii?Q?N9FQ9t2YNGFtJohLCgWLMm7BopzPk1NysKnHDnpA0OAgFOo1VYeT3fy9GDUR?=
 =?us-ascii?Q?VhQXDNNzhIJQgCoKTVCqWWHf2SuALp1CQuD+dnLTM8Xdz7wv+gwCSktKa+wl?=
 =?us-ascii?Q?T3G6ONOPXzqvkQ7AuDQfcV4WQwM5Lf7wSfa+g2WZlPxu8wH8lDTFJ39KBr30?=
 =?us-ascii?Q?n5bLoSqkk7pV85Snn8n1aUAA4qNRHrwy/eIDXDbEnv6/eNGJeHOeK9zBPJvU?=
 =?us-ascii?Q?qCIePryiI4x111Ik2bqFdW6Aocg8CgszeDvnObwPFfvQmFqp8wxuebgCNBJz?=
 =?us-ascii?Q?4XbvxxgKKFN5JZRnhWDa2fV9iqw9eM9PBqiBo/1jaliO3rkOCfbcx2sd5vmn?=
 =?us-ascii?Q?xohB6DLFc2RQTh9vhNFv5I0gKARh1T20priw8miDh4dNrOQGH9LjILXjKama?=
 =?us-ascii?Q?/2BlGNLIe1/Gm5ymBZTObiH4YfXULWwwRK2UhdiE/B++j5/SltIwbE2K0/RM?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3f5cd7-79ba-449c-6345-08dcd1b3ec6a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 16:16:27.6745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAK7Di1noL4aKNfMOGrZGFA6ZQMEm1UdJTFHvSUFCSzKlYPTXlhEgJyotEXuqGKRowuILB30sufpbhlVgrDdyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6221
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

On Mon, Sep 09, 2024 at 07:59:07PM -0700, Ashutosh Dixit wrote:
> We are occasionally seeing that OA Buffer register is not programmed (has
> value 0) when OA is enabled. This means OA has been enabled before it has
> been fully configured. Or, the register write enabling OA has overtaken
> previous OA configuration register writes.
> 
> Therefore, insert a wmb/sfence to preserve OA register write ordering
> before enabling OA.
> 
> v2: s/wmb()/xe_device_wmb()/
> 
> Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
> Reported-by: Guy Zadicario <guy.zadicario@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 63286ed8457fa..4fb7aae37a94f 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -440,6 +440,9 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
>  	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
>  		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
>  
> +	/* Flush previous writes to HW before enabling OA */
> +	xe_device_wmb(stream->oa->xe);
> +

So is preventing the xe_mmio_write32 passing the memset in
xe_oa_init_oa_buffer. Indeed a xe_device_wmb is needed.

I will say it a bit goofy that stream->oa_buffer.vaddr is accessed
directly in the OA code rather than using the xe_map layer which made it
a little harder to reach the above conclusion. You might want to fixup
the OA to use the xe_map layer rather than directly accessing pointers
if that is possible.

Anyways, this LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
>  }
>  
> -- 
> 2.41.0
> 
