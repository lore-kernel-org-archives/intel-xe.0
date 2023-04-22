Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD87C7618E
	for <intel-xe@archiver.kernel.org>; Sat, 22 Apr 2023 15:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D0610E0F6;
	Sat, 22 Apr 2023 15:03:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E5110E0F6
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Apr 2023 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682175793; x=1713711793;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6wHomQzdgq0dSO+qsFKOyoFhD38n5WZsP9bcKR6WRhg=;
 b=AB0LLtOnOraYpMOR8GWRh2XRnUg7MsncrceSth6tA5n/un8qlTibl/iy
 qEprUYcjiC6vxl7gb5jeTgr7SepU3oYhXUaPb3XAvgVcoZKQ93ueHz3dv
 wm9aRpXnV93btfDNpekEI6spwm0yt+b6aNqcJtPHHfChbcShETuznTDkT
 WToW6Jwergle9I6tL1BrK3kCPx8X8huYx4h4tXGVAx8TykfPU8Lb+P1K8
 wXnMfDpAAcUy1+dvODC3E/lblHHzFTcBBxrlSzhYOQiNNQ53XneOXGFDi
 GqC7o9STksjoro1NFlt9O5riaigpufmPOXHGe6blqXGeNzEOMGaYYXf9C w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="346184031"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; d="scan'208";a="346184031"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 08:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="1022185942"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; d="scan'208";a="1022185942"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 22 Apr 2023 08:03:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 08:03:10 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 08:03:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 22 Apr 2023 08:03:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 22 Apr 2023 08:03:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiajgE7R3HnfGKKLNNT+XmcO708jHhSY8DK3DOSjVmjQqOXxskchrxl1ekOPtgbW8voTOghnbqG6I201P+11nXxYFocBMKVJT8wEiJY180hVxWvn3/q4j92y+eV3FcCH/Bmp9gU2P2cHdM4SEadeWFgUc/2GOJFdvVTm8toiHigiReY1uOB7uTZ2zuJK5QuNuLdSf7uMJLlq9adbIV6ZGDM9wFdm1L2mYwMBkoWi/Gf7BNKsY3I6NGO7o2xvurVczSBHX3OyQGKBV9SVKYi0CDV3GGnoyWPN/UW1CJpMHSiKgQlyckh+8tN2UFYdYKMJ+KEOnBEtD/5r9DThhcmV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGCHUYfuQK6F5tEvc/XcK3qpIBoEzXOF7Acy1b5234Q=;
 b=WuvWs/ky1PZdPHs7NIw2kFJoJR8xrnYR7majzkDQ0cnaHshOK+Dg4cufGDgJYHuXt3BLw7XA0W+ZObOpzjUnRXKVYGNHHkcLikvg84Cnd+W/ZNTjORhzWQFA9d+e1kgiAKpb6oLYTz8F9cWt7WD/wgiJdRrZKcwUlSisD/e5Gy4oHRBdNNSMAnT6x2i9hdtvQ0s66nK+zwOGJbui/qO9y5rWhNeBAmlcwbMboSEY0vLSSnCK9j8Ss1HBT48T9wjFD9ufuEzXHNpbVPH8RCWcMMCqW0UGprVCoaOtKTULj3pvObcof0Y43EgYTGmqda4TLqkIOuRYO9iRCKuwa5K0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB4781.namprd11.prod.outlook.com (2603:10b6:a03:2d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Sat, 22 Apr
 2023 15:03:08 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::e15f:6c7a:7fd1:d63a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::e15f:6c7a:7fd1:d63a%7]) with mapi id 15.20.6319.022; Sat, 22 Apr 2023
 15:03:08 +0000
Date: Sat, 22 Apr 2023 08:03:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <3fyp2x5xxpeni3vvfzste5usm74u2oymtryvaxjvavs2b6u7xt@dwzqadbaqy4r>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-9-lucas.demarchi@intel.com>
 <20230422000950.GR4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230422000950.GR4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0193.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB4781:EE_
X-MS-Office365-Filtering-Correlation-Id: a39f4ff4-5fe3-4385-0589-08db4342ae82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VfBZPlNxlGYg9D7ye4xBpOdVNFVA+XDKKV7BUM3E1HZz9gDSkmf9cX9pSIUnekTmLLpaykn7Z9MjKix6BnAkALAesBPqExbawT3L29m1bgV5Aq81ID6Tnxaa783qMZT5xCMKFOM4Z5Zx241gZlDA93TyPQGUH7zHg6t9bAO6zDsBSAFKsWHwou5Zp0xc0JPihaY6L2oU2G2z3QgChEmwFEjqq4Ne7xg6Rf9QVHzwXdmnLUTk6kgESgZGHlvCmNStrxIJiQFkhwZMWy0P4mtRGGWgnH6DLnp2QU5seEaXjzPrEeHe7QjDnP6MfDNDYXeg9w9kWcA6ytmGrCqdxJQwkkDuLfTXJ+Yz8qnOvdL7ScXRAYZ/AvqdiFVn8yeH9R680MfXFh6Oz+012M1cLO+n8HQql8AlSWeael2QWOLQUL0B+1KONQsHvKtJL7MZMN6hgJ/D7KB4LGGLBFJ3zQpTWFJ2mBcw+JIcMt09/bNE+Eg7YT6ns/7lQxSr8w6BSagbl3jkGbjQu1J2EF9wbAKQvSvH/0jKJmWZY/aGLJDDuMPZvAImWMwJNTQauD/U7V6a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(54906003)(316002)(66556008)(66476007)(66946007)(6636002)(4326008)(186003)(6506007)(6512007)(83380400001)(38100700002)(26005)(9686003)(41300700001)(8676002)(6666004)(6862004)(33716001)(8936002)(5660300002)(6486002)(478600001)(2906002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ixX6ngzfyRb+3QshPXKjcQ5s5vjCw33v5tVDSTHkhBBkiwb/MXnee4pbDKcW?=
 =?us-ascii?Q?AjogtMpaVFTZtyIMPy1vaVtdHB9W6qkfMD6nWuV2YfQdJZteFEc6xOJ6fhNf?=
 =?us-ascii?Q?N/mhUYCyrhG1SwdPtjubYzmybOIQNG80bn1UfJyn6QOtv/HQlQ9wCOZ2EbLg?=
 =?us-ascii?Q?JqRUjhbxDtfubglbCKa3TKQWCyMsUk/rC5k73Tk5AYR5jSnUmmcdXOSBgHt4?=
 =?us-ascii?Q?ffQxiOlArH7FLVMS3PfRZDsLqbSCL1Vkt9EdOfn0bi//ECmNxJqqgY/l7NEu?=
 =?us-ascii?Q?2EK+qRPtgGxK3pbxR77faFBNAYegHS2YCYIAGj41+i6TNG/aXyYecBe2I2WS?=
 =?us-ascii?Q?Dm2R7rL0+ORRJJPl7tUyj5XsGzUCDGGlRGTqXlWgEjtZ6umJ1jPv1+l9ZZIO?=
 =?us-ascii?Q?0/77ySAmhM0To4tCyZtziduHSKD4E1t7lHxasRIR0bXWQ7eAPmvVFF87s+kK?=
 =?us-ascii?Q?2z0+A9grI4g8RPxVVWQzAVHcj7nVM343NcJ8IOG8Govd5S3zJTwCPvAvLIgD?=
 =?us-ascii?Q?7Me08u+n2WH9k+/46tcrxoxgZmQGLpPpghVIjiswOY2kkQL/34rD29ppYnlN?=
 =?us-ascii?Q?EVy3nqXmfhUdVov8/Ec2C2i+TTG3O31ezq0ohL+3x8dX9zMsYMi6qlIAo29c?=
 =?us-ascii?Q?24rRtv81uNJSspxCdBEvgvpOVnThUCoXWf+fikdC197dlP+kc8qEVBekN0uX?=
 =?us-ascii?Q?SjDo1qFK6xHY4QVHRo5wn3JJAfb3zaFxC6qKnNkqcPlTrVImdTarDGToRzCW?=
 =?us-ascii?Q?iV3MvZo1eg+YrZToD4vZEJdnKb5N1afEKHb52zb4xFbimcfr1Me104nQ5pP0?=
 =?us-ascii?Q?FMqMoqQxko6qe/HT70IWTCqTO39trAsaixXWbyxwOuRY1q/2mU1cleLU+tfN?=
 =?us-ascii?Q?P9wXoXSTiUc33rJ73UlXi/QEUDP+wc5zn/p9raUMm/AN99DdzvZZ35FpXwBk?=
 =?us-ascii?Q?6uj4SpcyFCcD+1DpE/dvgNivBJb+ZGpFVwn5KCvpi9wZQI0QbFDhgekIHO2/?=
 =?us-ascii?Q?4Idq8D/1hp8dp7yehL25JcdH6IfGXUa46lIEUj7eGNfFRCUGqGIkoDhjcBBo?=
 =?us-ascii?Q?D8KctfMAK2GmgzBQbzv1gHmcPyoPuXzhcvC42M0XnQDAoXjTgt4n1KVE7L/Q?=
 =?us-ascii?Q?Rj0zfKGywSBUWGMYFpBZaMQZaekHfr0HWdSH1ZoTl7RQocj2H6gdaUhxZ16A?=
 =?us-ascii?Q?CJNZvgRRwpnYTUvhvBQKRw2wAEwiybqA1tvqaHs7LKEuZMkZYPHmXpau/XRd?=
 =?us-ascii?Q?X7XWnsA4hBZL4HlVNeb91V/me6PKKpTxCbpolS8LTOAurQYafnS3HcAevDyG?=
 =?us-ascii?Q?Yf5pBJOALShPglFb90OG9ZEBvWqu+Oyo14YFKxtFI98CMVDH1gFgnH3V+7GE?=
 =?us-ascii?Q?9YR5bGcBBKPBqQaebSRFRaNn6gs7rHClvbjjL5dJZ6t0AseDMhwItBCcP98h?=
 =?us-ascii?Q?ADwy4NQMJsnE95j73o4k/kvwqm7F0DaAhhR34Y+6KfuG2JnWOvmEfsKLJVTS?=
 =?us-ascii?Q?kbJSJOIJGCwVo12ep0u+xVbVVcXjHkRqeDocm18J9nUJOVCnQegtA/Hy6JH9?=
 =?us-ascii?Q?XtoL6T/F8schDjfEbxqjGJiFPDHFWCUUOAhb3UvsFFwlIIlmpo1ODLE9ayXO?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a39f4ff4-5fe3-4385-0589-08db4342ae82
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2023 15:03:07.9998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uApVNpFAbUuFLrvjYgXbZ1H7othpfh46B1xdzrK1ptbvbLytcw92GqT+GqgkBwRGUipzxHlHC23sXkc4TnSDpR/mnBJ0Z1JsyHq84xCwjpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4781
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/17] drm/xe/guc: Convert GuC registers
 to REG_FIELD/REG_BIT
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 05:09:50PM -0700, Matt Roper wrote:
>On Fri, Apr 21, 2023 at 03:32:49PM -0700, Lucas De Marchi wrote:
>> Cleanup GuC register declarations by converting them to use REG_FIELD,
>> REG_BIT and REG_GENMASK. While converting, also reorder the bitfields
>> so they follow the convention of declaring the higher bits first.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 168 +++++++++++++-------------
>>  drivers/gpu/drm/xe/xe_ggtt.c          |   6 +-
>>  drivers/gpu/drm/xe/xe_guc.c           |   8 +-
>>  drivers/gpu/drm/xe/xe_guc_ads.c       |   3 +-
>>  4 files changed, 89 insertions(+), 96 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index 011868ff38aa..facb1f0a55b6 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -14,23 +14,18 @@
>>  /* Definitions of GuC H/W registers, bits, etc */
>>
>>  #define GUC_STATUS			_MMIO(0xc000)
>> -#define   GS_RESET_SHIFT		0
>> -#define   GS_MIA_IN_RESET		  (0x01 << GS_RESET_SHIFT)
>> -#define   GS_BOOTROM_SHIFT		1
>> -#define   GS_BOOTROM_MASK		  (0x7F << GS_BOOTROM_SHIFT)
>> -#define   GS_BOOTROM_RSA_FAILED		  (0x50 << GS_BOOTROM_SHIFT)
>> -#define   GS_BOOTROM_JUMP_PASSED	  (0x76 << GS_BOOTROM_SHIFT)
>> -#define   GS_UKERNEL_SHIFT		8
>> -#define   GS_UKERNEL_MASK		  (0xFF << GS_UKERNEL_SHIFT)
>> -#define   GS_MIA_SHIFT			16
>> -#define   GS_MIA_MASK			  (0x07 << GS_MIA_SHIFT)
>> -#define   GS_MIA_CORE_STATE		  (0x01 << GS_MIA_SHIFT)
>> -#define   GS_MIA_HALT_REQUESTED		  (0x02 << GS_MIA_SHIFT)
>> -#define   GS_MIA_ISR_ENTRY		  (0x04 << GS_MIA_SHIFT)
>> -#define   GS_AUTH_STATUS_SHIFT		30
>> -#define   GS_AUTH_STATUS_MASK		  (0x03 << GS_AUTH_STATUS_SHIFT)
>> -#define   GS_AUTH_STATUS_BAD		  (0x01 << GS_AUTH_STATUS_SHIFT)
>> -#define   GS_AUTH_STATUS_GOOD		  (0x02 << GS_AUTH_STATUS_SHIFT)
>> +#define   GS_AUTH_STATUS_MASK		REG_GENMASK(31, 30)
>> +#define   GS_AUTH_STATUS_BAD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x1)
>> +#define   GS_AUTH_STATUS_GOOD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x2)
>> +#define   GS_MIA_MASK			REG_GENMASK(18, 16)
>> +#define   GS_MIA_CORE_STATE		REG_FIELD_PREP(GS_MIA_MASK, 0x1)
>> +#define   GS_MIA_HALT_REQUESTED		REG_FIELD_PREP(GS_MIA_MASK, 0x2)
>> +#define   GS_MIA_ISR_ENTRY		REG_FIELD_PREP(GS_MIA_MASK, 0x4)
>> +#define   GS_UKERNEL_MASK		REG_GENMASK(15, 8)
>> +#define   GS_BOOTROM_MASK		REG_GENMASK(7, 1)
>> +#define   GS_BOOTROM_RSA_FAILED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x50)
>> +#define   GS_BOOTROM_JUMP_PASSED	REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>> +#define   GS_MIA_IN_RESET		REG_BIT(0)
>>
>>  #define SOFT_SCRATCH(n)			_MMIO(0xc180 + (n) * 4)
>>  #define SOFT_SCRATCH_COUNT		16
>> @@ -42,90 +37,89 @@
>>  #define DMA_ADDR_0_HIGH			_MMIO(0xc304)
>>  #define DMA_ADDR_1_LOW			_MMIO(0xc308)
>>  #define DMA_ADDR_1_HIGH			_MMIO(0xc30c)
>> -#define   DMA_ADDRESS_SPACE_WOPCM	  (7 << 16)
>> -#define   DMA_ADDRESS_SPACE_GTT		  (8 << 16)
>> +#define   DMA_ADDR_SPACE_MASK		REG_GENMASK(20, 16)
>> +#define   DMA_ADDRESS_SPACE_WOPCM	REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 7)
>> +#define   DMA_ADDRESS_SPACE_GTT		REG_FIEDL_PREP(DMA_ADDR_SPACE_MASK, 8)
>
>s/FIEDL/FIELD/.  Seems like his field isn't actually used anywhere
>(which is why we avoided a build failure).  Should we just drop it?

oops, thanks.

>
>
>>  #define DMA_COPY_SIZE			_MMIO(0xc310)
>>  #define DMA_CTRL			_MMIO(0xc314)
>> -#define   HUC_UKERNEL			  (1<<9)
>> -#define   UOS_MOVE			  (1<<4)
>> -#define   START_DMA			  (1<<0)
>> +#define   HUC_UKERNEL			REG_BIT(9)
>> +#define   UOS_MOVE			REG_BIT(4)
>> +#define   START_DMA			REG_BIT(0)
>>  #define DMA_GUC_WOPCM_OFFSET		_MMIO(0xc340)
>> -#define   GUC_WOPCM_OFFSET_VALID	  (1<<0)
>> -#define   HUC_LOADING_AGENT_VCR		  (0<<1)
>> -#define   HUC_LOADING_AGENT_GUC		  (1<<1)
>>  #define   GUC_WOPCM_OFFSET_SHIFT	14
>
>Can we drop the _SHIFT...

that's what I attempted to do in this commit. However this one I left
here since it's used in non-obvious ways:

	drivers/gpu/drm/xe/xe_wopcm.c:#define GUC_WOPCM_OFFSET_ALIGNMENT        (1UL << GUC_WOPCM_OFFSET_SHIFT)

It seems that it uses the same shift in the register to later align
guc_wopcm_base. I'm not sure if this was really intended or not.

>
>> -#define   GUC_WOPCM_OFFSET_MASK		  (0x3ffff << GUC_WOPCM_OFFSET_SHIFT)
>> -#define GUC_MAX_IDLE_COUNT		_MMIO(0xC3E4)
>> +#define   GUC_WOPCM_OFFSET_MASK		REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
>
>...and hardcode the 14 here?
>
>> +#define   HUC_LOADING_AGENT_MASK	REG_BIT(1)
>> +#define   HUC_LOADING_AGENT_VCR		REG_FIELD_PREP(HUC_LOADING_AGENT_MASK, 0)
>
>HUC_LOADING_AGENT_VCR is never used as far as I can see.  And single-bit
>"masks" with REG_FIELD_PREP are kind of silly; I think we can just
>define HUC_LOADING_AGENT_GUC as REG_BIT(1).

sounds good. I will change that in the next version

>
>
>At some point we should also add another patch that sorts this file by
>offset.  Doesn't need to be part of this series though.

yeah, I sorted some but not alls. I also want to have a lint checker
that prevents it going wrong over time. We could add that as a CI hook
check.

thanks
Lucas De Marchi
