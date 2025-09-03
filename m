Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1DACA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 22:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4705910E213;
	Wed,  3 Sep 2025 22:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUUeG4su";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3461C10E213
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 22:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756939386; x=1788475386;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VhM7FnhjD6BTDM225YXSb3093k2SbCoagl2XQyNHtAI=;
 b=AUUeG4su5ihqh5nh8jLR1TVGVrf1JkWrm+NVTnvGEp00k155sCTVQWI9
 FYAnEJQj3QesnRqgREWFC8c/8lmLAc/LwoBTxS0lAREwb2Ihh+vuUUv1U
 6zM7VgsjPyNSOtKNyT2+eSubSAPQGG62UKDiiI9FL/pZBs6WsBc2oSmi5
 s24ymLqGoru9MAuBjH2dfltFk+5a9reQvx09UuX+mK20kDu7MoyywWV2k
 I3NvmvvgQ0BVYNNDyE9PmqI9blpT811zDlZAXWYtSZVM3U4sLdxWwApFI
 XqSVuPSg8l/QHNLYKtCQhpLRqnB+y993KltE1kPZ1NSsXVIpPVUAGxOj0 A==;
X-CSE-ConnectionGUID: U+aaxuZ7R3C4MGzLWNyfow==
X-CSE-MsgGUID: hMZeGAqhTe+F6ZlbFsAWBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69880658"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="69880658"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:43:06 -0700
X-CSE-ConnectionGUID: PJ8WL5iUTR+C4NfCBiwF5Q==
X-CSE-MsgGUID: NoHdPjdXTeC9ikLsKiphMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="202660619"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:43:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:43:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 15:43:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:43:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXNTCHI/ho4wpXfcmdt3X7RsA1GbACUONV38YHGEC5GTZQRcVFTHxtRXlmdAX10EQxmH+HHUKjKk+N/80zbjdHycD6mLOJf9XtW8LgJy3T3VPU+X0+lNkHk04Lz+fEl7FNY6HQwjWkfq5FT1a9ofIjXcIH/D5XP3RNNqtR2GjIrOuh2kQiFzyOGP3wRYJzc2wgNvfI3HGezlTCgj9fHvW922snMuD6rnaJJMBeBCj4+f+VoxtQXIQYpt3/8uWWCOBOwRHDK/HE8PxvmWN6tkss3XCn29/z7ttyPXaaFLH8znhz8JK4zqYkNC2dyz4aV5VLTuVBiV+MVTwgO5Lgx/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhBMUnfMiFUoiRGrEK2LW2ggvV17k3jHW1EM/xHtzZg=;
 b=wUwa3bAHNJuDNA/qWgMnHHGN94gHmV1I+YuRHc+7rKt3V3DN1aqDCPbS3StEnPcPAZFgQWJwro8pG4MK2ltECVY4EBDICr8Gc1DdNQgYj0okN7bHsqM9O01tCQg9rIArBRiOovd80RICt0bVmTsIkCYWN+g+3XPmkeTdvImpj4+SJcYeRdhK5RPg+zE8ndFdnY+SEp9ZpSSCrK5tYoW+IHOwmZPZZJHLaZDbuxre0FeJQeu4ggG1CPltinzjteU4zucEYm+fufEKsn0Un8Sto/VDls7UzTV6vQxScLMy6TlyCVQwmwe0g8Hp4w15AlYfCX4W+nLHZtfLO9fYxdz1xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 22:43:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 22:43:02 +0000
Date: Wed, 3 Sep 2025 17:42:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Umesh
 Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v2 2/6] drm/xe/configfs: Allow to select by class only
Message-ID: <nq3sux3ejo73dggyrnjteimexsy54zq5zhbstf5i42e4mhqdpb@ym5ovbhxouwx>
References: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
 <20250827-wa-bb-cmds-v2-2-3cdf4d63c72a@intel.com>
 <aLaIDfa45wMxk8zX@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aLaIDfa45wMxk8zX@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR05CA0206.namprd05.prod.outlook.com
 (2603:10b6:a03:330::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BY1PR11MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: 28270d82-9a92-468a-5389-08ddeb3b3d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I3U2LKVYgfYwpa5DHb63KhEnYS/MMTxCGqTBhxADEPfuJ0FpiDfpq8ccV6Ci?=
 =?us-ascii?Q?HUvTi54KQrM3uiBdaVVGz/7qn1hCiw1As1ucCoiiE5f0KZpvvjavH6HAUOTb?=
 =?us-ascii?Q?Gv7cPoeY7Zc5PtShLJMP3K+PPaNZO7QUhpOpsBNWEwdaGujGkZxDjRKRrBD+?=
 =?us-ascii?Q?ZMlTVYvMFIUaEU7VW69hp0vmB2fggyF/X2qq9yV80zTtiu3iNbes6aKg0XPJ?=
 =?us-ascii?Q?cjStiFGLvCOaqwJsg+zWuj5vT1N3kWQJcTlnC7rqg39Txsw3loXKSUTryogG?=
 =?us-ascii?Q?MYz0bWsOF1Xc3+ZSL/ZUG5jaU8iI1MK7eAl4jAmcVkUNCykFPN5v/rIRE5Pk?=
 =?us-ascii?Q?V7mYuf5bVt9bbolVe8gaGOIrEIJAVCipGExpN6mi7UU76YDzpBtstaB7prNp?=
 =?us-ascii?Q?7NKZuaLUI7tK4lpQGzBtEccPbAy+C2ydnnMXUbJ+Mm/LDW8qTxeXEtHStUBg?=
 =?us-ascii?Q?f79+jnVA4GzbwZEx4EfRVtUnjjdjh6aFosr9BkU+fyWsQPDct4fWQdEkdht7?=
 =?us-ascii?Q?U92FiFnVYU4mFm0DMDE1boeTmeo/UWXhAyprIWYiPkWBuWz2avFHBDRyOqIw?=
 =?us-ascii?Q?TRhRabneDtxY1mAg5cLqXyquj+xvbgUAhXvnTrqwOTCZWZyrCFUVKZoPYA2u?=
 =?us-ascii?Q?hVzpqohcMjzptdrpzLBQLZL3E7YFX//7NyKdoqinTBq+pOKA9FOWyOQ99vvK?=
 =?us-ascii?Q?iXaebah5H/RlBu6a8ts4HwZ2bbvQrYqDWddMdpDceY3ozzWiLLoHoWAqw8Ts?=
 =?us-ascii?Q?PLqoilDW6mfTa3gckY3BH09NJQ7Uq+gd1AXUrjjVo4/WNJ3K3/cy9H7bnOIl?=
 =?us-ascii?Q?3x4M03UsabbF2/mhwYKKdMdx2fA0UnchG8PjZuUgpzFI+sBIhg4e8UjbyTQG?=
 =?us-ascii?Q?FpyzkNxENUTjToNlbfOwaVuAzDC0WJKjm83BVSi9U16Nf2jjy9MHDWSQUPi7?=
 =?us-ascii?Q?SfVzo7WHXwGME/x7LRTNZGjR1J7HuoNG20wmQMVmQfekEdwrs6DsWT7NONOT?=
 =?us-ascii?Q?62c9rxWWPv7fae+5ly7KOZqO6aoyABzDFeJb0LRgUz+95ECS6XiYZuuF99Rt?=
 =?us-ascii?Q?Gl+TFSHZOP/N9NmhpcP5v1OjbT9uHavTWmNdNVuIJv2L9FDlV91iIaR7BZcf?=
 =?us-ascii?Q?5/kFZUo57klOHYvQceGYbtD/q3A0KDLouG8YqzNDGmodCt5EHJXDsodoXyPq?=
 =?us-ascii?Q?W4mcZpx86nQx7oBeEm2WLuL9EIlmeeiET3U6BKAMG1bqBT+WqMixKTA2RqCh?=
 =?us-ascii?Q?nMiKdPVIiOAyxO3hFxAklxjebsVPdak8VPPbd96jgQd5WBaOGjrVNkdFrk7z?=
 =?us-ascii?Q?GW365P6sCKUmC23m+b9fUFcRXxVsrFslYQMTZGj/cMSBDHnoYdU9KO2lz7eF?=
 =?us-ascii?Q?Ugrz6mZ36y2INIZI4/7pgaXPOhLWMkXV8LmTTy6mQ9ujWbF814r3K8xoAC0J?=
 =?us-ascii?Q?EZiGe30ktVI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SkCMcZt1G8GAR2wTIhGbe83uL9jTBHEWWwEXuq0jgiCODnCpvgPWOWLy629z?=
 =?us-ascii?Q?hhFLmapI6RS8XZZHXR52ao282UKFDsZhlqtka3Too5kH+KYYYtJAf+dwfvBK?=
 =?us-ascii?Q?6gp5QvC38M9uwC3F1evQLKz1OljgWmqKO0SiryMf8dzzvV7GdKrTv1bqWCoO?=
 =?us-ascii?Q?Z2IzntJQmArYi5WuYsBb2wZZNfLw8+VSpZi1dViQ+JfSGbAmzbBbOPBoAgfE?=
 =?us-ascii?Q?Ib/ThDbAWzJ37yZdAopY0l7IK/HKepkMuHfrrdt5ULcKY53L2k4GpDI37de9?=
 =?us-ascii?Q?khqT+sjztxtmb/6d9Zm2YTw61+bh0K0P1PzrVzZDBajS+DPkR8gKXmtbo7U6?=
 =?us-ascii?Q?8xHOU0FKT8JvVUdbgIlynAOrcMzVz3uvqmVhgtFnpIf9Zm324NfPdQY/iiDb?=
 =?us-ascii?Q?z2jDiTcwriEO1eit0ew3KIU8UJPx43whRALKadTjucglHn9OlptjfP9rUeR8?=
 =?us-ascii?Q?DAnmleNAzYVS2XwbYw8MCFrKmoC5RBZtu9m+n1/KSdqRQCL6pJFBXPDCeXGQ?=
 =?us-ascii?Q?xOOD4WFSr1IZAHxYWf4YyfO/WKobxMRGuadTSHNL/fzmHFavDnuP9jXKxt+y?=
 =?us-ascii?Q?O7+z+hySGhOFmgYh6gbNl+W+Zhq5am9rIjI1mty2AWsGc8kSHMBlVpVtkyBA?=
 =?us-ascii?Q?PcN6BZEyRLpiIzU/OkNiwDekd5Y3y0Cm/T81hGn/a32NhoGH+ETIig9/RslF?=
 =?us-ascii?Q?8cr9Opmott6i83iMdKQtxpCGiOEJs0xO/wvu9JFWA9yWyddhgxK6Iv9IEGus?=
 =?us-ascii?Q?Pj+C2sH9+PtSWk5CVe1L/3t9UCI3vWMO2K9hpBLe32GAf+ol8UMnwElZ456O?=
 =?us-ascii?Q?+5X8nzXG6gJcd/1DCJeShouHqga1nhPc6lzmuZ7mr9Pbi4/+6PIpdMBpHTvv?=
 =?us-ascii?Q?sSMZlZMNCEMGFrnYZLhbi/XFwnEV2jMwtwjVyOpNOSG9wi0fs+fAZB6EU5Pu?=
 =?us-ascii?Q?1/pi60cKC7ylh5P8Gt33hrTD2D71CvDSqqwm22zkxC9miGHaAt27ZWpG85H8?=
 =?us-ascii?Q?vB3dMDWOnmzZ+L0fl+jVOSTUZCkMiT6cKn6kA6oO3t5fGAQDVfWDakL2qenP?=
 =?us-ascii?Q?+RLg17TZaCpgb3iSDFMxvEib0nNN6SKUPdiRcCuxryV9qarcBIgd9juT4rPc?=
 =?us-ascii?Q?7hpW7Rvq4NrKEWTnyggPyaMZs+wpsAa9S3OV1GD2e204Kid2M/doxd7SBqTR?=
 =?us-ascii?Q?eap+4XqhTvuGSUJ2eH9q4cju0/nYmUFVGY8wX4CkU1iReTD42tWUkG7NUymL?=
 =?us-ascii?Q?sgrQFbmgJqnM+ZLukJOEVNAmBThzJgLDSH1JJsh80Iq3a7yHMfFVxJkOGov4?=
 =?us-ascii?Q?QO5le7FPHajla4QvBlJcP0ZJAMtn7vBdVpxi+Dk2/AydbRV9q1eCaMxXIluN?=
 =?us-ascii?Q?TEuvy6iH61sdfN9fBcicbPDScthFhVqYhtFK53A2Uny9Gsb10i+f55bJ1Bbo?=
 =?us-ascii?Q?rtR0/Rim/1RUo4/e+ev/lQWANZk9bejB+B7u3OOld3wnyQ407FYZM7NwK2D7?=
 =?us-ascii?Q?BQ/FKjdL/D5bvW9d3U8SxUt/xBrQcwEShmm4Wxyzf14ZR2jt8Jws8t3nIbN4?=
 =?us-ascii?Q?NfJunGaXJTJ1sFysR2Eja5GyXOpbCtXUxufeq8n2yBZP9wK1zbydQif+SuQ3?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28270d82-9a92-468a-5389-08ddeb3b3d47
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 22:43:02.2501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+CgicWz3hAWB3iD5b5QawWgjx1e1sG8bWfhtBqaNnZoRdkPwwBpkw3upmYPzOZAxgOXUcISo3YEkrU5o/hvhJGSoCGJEYqWdeRa5Y73lpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
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

On Tue, Sep 02, 2025 at 08:00:45AM +0200, Raag Jadav wrote:
>On Wed, Aug 27, 2025 at 03:35:27PM -0700, Lucas De Marchi wrote:
>> For a future configfs attribute, it's desirable to select by engine mask
>> only as the instance doesn't make sense.
>>
>> If the caller is only interested in class, allow lookup_engine_mask() to
>> return the matched index if mask is NULL. This allows parse_engine() to
>> still return an item if the caller wants to allow parsing a class-only
>> string like "rcs", "bcs", "ccs", etc.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 53 ++++++++++++++++++++++++++++------------
>>  1 file changed, 37 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 6cccab5456811..a1d230007cc05 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -150,6 +150,7 @@ static void set_device_defaults(struct xe_config_device *config)
>>  struct engine_info {
>>  	const char *cls;
>>  	u64 mask;
>> +	enum xe_engine_class engine_class;
>>  };
>>
>>  /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
>> @@ -157,12 +158,12 @@ struct engine_info {
>>  #define MAX_ENGINE_INSTANCE_CHARS 2
>>
>>  static const struct engine_info engine_info[] = {
>> -	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
>> -	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
>> -	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
>> -	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
>> -	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
>> -	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
>> +	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, XE_ENGINE_CLASS_RENDER },
>> +	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK, XE_ENGINE_CLASS_COPY },
>> +	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, XE_ENGINE_CLASS_VIDEO_DECODE },
>> +	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, XE_ENGINE_CLASS_VIDEO_ENHANCE },
>> +	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK, XE_ENGINE_CLASS_COMPUTE },
>> +	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, XE_ENGINE_CLASS_OTHER },
>
>Should this have ".engine_class =" for consistency?
>
>>  static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
>> @@ -251,7 +252,19 @@ static ssize_t engines_allowed_show(struct config_item *item, char *page)
>>  	return p - page;
>>  }
>>
>> -static bool lookup_engine_mask(const char *pattern, u64 *mask)
>> +/*
>> + * Lookup engine index from engine_info. If @mask is not NULL, reduce the mask
>> + * according to the instance in @pattern.
>> + *
>> + * Examples of inputs:
>> + *
>> + * - lookup_engine_mask("rcs0", &mask): return "rcs" index from @engine_info and
>> + *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
>> + * - lookup_engine_mask("rcs*", &mask): return "rcs" index from @engine_info and
>> + *   mask == XE_HW_ENGINE_RCS_MASK
>> + * - lookup_engine_mask("rcs", NULL): return "rcs" index from @engine_info
>> + */
>> +static int lookup_engine_mask(const char *pattern, u64 *mask)
>
>Should this now be lookup_engine_index()?

engine_index may be confusing since this is not about the index/instance
of the engine, it's just the index in the engine_info array.

Maybe lookup_engine_info() and return a pointer would be clearer.

I didn't want to separate the engine class vs instance parsing, but it
could be clearer that way. I will take another look.

thanks
Lucas De Marchi

>
>>  	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
>>  		u8 instance;
>> @@ -261,30 +274,34 @@ static bool lookup_engine_mask(const char *pattern, u64 *mask)
>>  			continue;
>>
>>  		pattern += strlen(engine_info[i].cls);
>> +		if (!mask && !*pattern)
>> +			return i;
>>
>>  		if (!strcmp(pattern, "*")) {
>>  			*mask = engine_info[i].mask;
>> -			return true;
>> +			return i;
>>  		}
>>
>>  		if (kstrtou8(pattern, 10, &instance))
>> -			return false;
>> +			return -ENOENT;
>>
>>  		bit = __ffs64(engine_info[i].mask) + instance;
>>  		if (bit >= fls64(engine_info[i].mask))
>> -			return false;
>> +			return -ENOENT;
>>
>>  		*mask = BIT_ULL(bit);
>> -		return true;
>> +		return i;
>>  	}
>>
>> -	return false;
>> +	return -ENOENT;
>>  }
>>
>> -static int parse_engine(const char *s, const char *end_chars, u64 *mask)
>> +static int parse_engine(const char *s, const char *end_chars, u64 *mask,
>> +			const struct engine_info **info)
>
>Considering we're parsing a single entry, do we really need a double pointer?
>
>Raag
>
>>  {
>>  	char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
>>  	size_t len;
>> +	int idx;
>>
>>  	len = strcspn(s, end_chars);
>>  	if (len >= sizeof(buf))
>> @@ -293,8 +310,12 @@ static int parse_engine(const char *s, const char *end_chars, u64 *mask)
>>  	memcpy(buf, s, len);
>>  	buf[len] = '\0';
>>
>> -	if (!lookup_engine_mask(buf, mask))
>> -		return -ENOENT;
>> +	idx = lookup_engine_mask(buf, mask);
>> +	if (idx < 0)
>> +		return idx;
>> +
>> +	if (info)
>> +		*info = &engine_info[idx];
>>
>>  	return len;
>>  }
>> @@ -307,7 +328,7 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
>>  	u64 mask, val = 0;
>>
>>  	for (p = 0; p < len; p += patternlen + 1) {
>> -		patternlen = parse_engine(page + p, ",\n", &mask);
>> +		patternlen = parse_engine(page + p, ",\n", &mask, NULL);
>>  		if (patternlen < 0)
>>  			return -EINVAL;
>>
>>
>> --
>> 2.50.1
>>
