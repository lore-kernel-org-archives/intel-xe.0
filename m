Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7474EB64D9
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 08:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB3110E416;
	Wed, 14 Jun 2023 08:08:48 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B794F10E416
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 08:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686730126; x=1718266126;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MIeZg8lzF2qBl9m9pJuHyqcFAEr+Geta1NSfMHr/tlI=;
 b=YqI7GgFlYTiEiS834Ra2qCFOAHyMRhpIZpEtfMdtD3Wc9PWzojPyaxV/
 /O2YZQGTVxNwwsF1YiXhZC+VwrHWH4eaJdH23iWNB3ViOwSf2xYDe9lxk
 q9FwYHP/mJ0xZMWeA0VSKL2SyKKQ82KSyV3aleBHCDT7ZDOVnVxFbIIz1
 oiIbXLkpCv9du9MbsBuLMA0DYt++WmcjyL0dFkPf37qb0impDl+ohRiKY
 wxU7aL+r2gIY6tmRiHkpEnnVbcFhx4Lt0xKl9GaPD7Y8rBrlQN8bSqryH
 W8WbrSMZcb42XH5j7Rn/ViQP6ZAT8N1DS8hQnMvTs2w2UxdKTR52A0pSH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="424437919"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="424437919"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 01:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="744990605"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="744990605"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 14 Jun 2023 01:08:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 01:08:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 01:08:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 01:08:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 01:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9SlkXRnaKBrNsSA9hZUas4gvk/sd8dcgsQ6rN4WZ+YIc5WaPQSeNlQsVJGq/R3CT6U+IWOoEQAgEUcnkdqZI2AZxcXLljYfwF7n+10Cd7yXJ8Or0ellzVxHCeWwWsSD1Qe/n2D5V+u/qxg9e3v/8PysX/GEpjxtWvSycRDvVJ9BjKcXacCYKpWndwm/ifM7gvs3MB/mnoor6F3Bm681ehh7oijrlJq+U+xsOKGO0ncVEJ3/dXOqTt8bYOYG19JpNHpp0ckWyNJ5HQmw6Qec0Fz7Ejao85gKMjAfz/sl4J8dsSRfaxdaIk4Yv43+fQLeTdMSUiReuc1n0JBRr2RtPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRRLHu7JwoHUvjt9EfyA3oxt1O7eF9XzmWb6tKcb1Qk=;
 b=jpLr/6aS3fAdn760t+G3QJj87RoOyR5jr7OmIeHFe2Ml3jOHrgrD9f8iKvTcxpTMiSL/aO+0d6dCnVf6sQ6pMO070Ye3+UJAMuowzO/sqwr2CB8gBehQ6g3WrTIYMYu2Dl1Q07fBaIJJwdSDHlkEn1nBTrZVmn26tE2ZWRPKJ8jmZr5+l/bP9yn47QcCGlyQehW6YJFWL5zWeu3e+Yn+VD6bY7uJKjEGlIQMAGEYIawMXCrrTjUYV6H5jp0WZvsRY1zkeh//xiaFZGL+bA8mlz3sG6QJpl294kOyHJc0eGOooyMpkFmcTRibx51VnvP1AUY12dFisffMMa588anYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 08:08:37 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 08:08:37 +0000
Message-ID: <f604b6ea-7197-35f3-a91d-29dc1c56ac59@intel.com>
Date: Wed, 14 Jun 2023 13:38:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
 <20230606125057.838618-5-badal.nilawar@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230606125057.838618-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::19) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY8PR11MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 7136824d-5144-4154-29ac-08db6cae8e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n7KaDLeQ15c0yajcKXz2h1EaTkTkR/xNWKi3CHA93AF7vOx4jHVrV5JyErzwZtRZ6cs/lrsxTF0V4FqUvdXV54LcPOn5Mr7OyACbZJMTQdxe60fklpcyirD26EwQtUVjWWEHDsBfjTD1HgWlqAsIm59tiWHFcBX+8bNcQqF8RtrxwGCOD57dAMWanpHelccbKyea52vbowM6U7svUrw+aMbKFqY4Li1V6ZeBXGZ7nL+qQeKWqCweTNzuJ32DwGor/mq9qvhwHNbuCTH7kVcbLAu1HAcD9SpstA7QDfu3TAWZTDLsQFPOw9SIYR0i4Hihf/NC/2eHfVIu6oiu1/222H8/0e3W0/U0Z+vDifrZUJ/P5uwI5EFd5ncZRq6kS2fWSTpJaxNOoMZEfrFGmRhmCzgYQFovWYT9b1GVx56rqQ4/gqOdszmvgIuidtdmThr/DwVKwCqFJNgGiKTn+ZiRcWJuudbFp/5lOFMCKHdSXS+hlYbSiwxig4gRYUj2QuoeJQC24VvHfjbIwFNWm9knId9GobBO+pUnDJdnhaoUmjrMAw6/9WB77pb4DT0Q8PKD7dH0DQa+B0zih6TGRS1zATrSRm5CtH3QpnE2FnwdE89F8C7Jr1okHK1g6M2HQ4VQW8/CO/S883S1BXsSCwIOUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199021)(5660300002)(66946007)(31686004)(66556008)(4326008)(316002)(8676002)(8936002)(44832011)(41300700001)(186003)(2906002)(478600001)(66476007)(6666004)(107886003)(6486002)(6512007)(26005)(53546011)(36756003)(83380400001)(6506007)(86362001)(82960400001)(2616005)(38100700002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVZuSnpYcmhWZlhhTUFBOW14Y1pQS3Evd0ZjZWxHc3QrRkR0RklVUFVEUG5Y?=
 =?utf-8?B?b1BRWTE0RVdaaWxOM1MvUTh3aDRtOUNvazVTaU1HdlFJTE9hbnUwR0ZLTzc5?=
 =?utf-8?B?cGs2QVZqMWZlckxIYUpSNS8vQXZjbUEyVWltMUZPU3QxNHAzTUFIVG84WEw5?=
 =?utf-8?B?WWpOZ2xlSGEwZllrWmJaUHI1YWRKa0FxTkdKMG5nMXdGS3p4bGhDK0puSFdC?=
 =?utf-8?B?dmg5WWlrZDNxSVRIcVJBSFlGS3lHS3hZSyt2Rk5HbkNqeExReUlaUWxhQ1Ez?=
 =?utf-8?B?eHppNWpXT3gzaEFMTVp6MzRqdEx6NFhMSnNNaSs2QUFVTGRKd2VpL3JGcDR4?=
 =?utf-8?B?UjFkZTg5UWFwaHBOTWNwMm1UcjBEc1pwb1BMOExLc2lPS3ZOelpGQzZCVXRh?=
 =?utf-8?B?aWg2a0lIdEt0blIxNVhGMzk2anJWMjhUaldyNlVRRXFFR3ZvdXdLWFUyd1k4?=
 =?utf-8?B?cWE4Z1JEOTlFVlQrcTF2d29pZjVBVUNZNTdpck1sclpoWFJqTksrM3Rvd1lQ?=
 =?utf-8?B?NzVyNlpNT2tIQUxyWEEzbmtQRzNoZ1p1SjR3blh0cDJpUTQzWU4zeHpOVEFP?=
 =?utf-8?B?dllBNDNaeERwd3ludktRWWhmaGN4L3d4d0xNZ1IrOEhZdTlwVnJkZUo5em5T?=
 =?utf-8?B?a0M3a0ZEVm9kL25TeVMwa0R4UW80ZmZvWjJXc2cvVlk5ZE1kaGF5YTNuV25r?=
 =?utf-8?B?eU11cG8xc0xwTTJXTkExU2MvUE54d0l0MC9iL3kvaVVvTnc2Y3hxclJlZi90?=
 =?utf-8?B?U2l2WThvMndFT0NVTVMrNWw1SVVzcnQ0QUpTVmxpeURFRWhVQ2hSZmRVMnZ3?=
 =?utf-8?B?bmZWNk15WmVNRUxMajdKMjVIMTdSc1l5TDdsTTNxZjI0QnJGQWV2NDJWWVBI?=
 =?utf-8?B?TU5wOU5xalZRRWJkMllyd2xEU1oxTFBKSnhxMG1Tb3h5aHFJVlhaRGhPV0ha?=
 =?utf-8?B?R3ZuMTgvYzlUbzIzS1RyaHMrTWlMRjJ6NHhqNy85ZEgwL2NNTFJrY1N0dUYr?=
 =?utf-8?B?OXowQk9yck9KOFlIZ1dBWjBxOG40VERiTWVmMDF5M0VxTFpOSmJQbFJQN0RL?=
 =?utf-8?B?cmc1M1pWOStEcCt5M2hkS0VmVDBBY3lpaTlTZ0Z3Z3l1KzRZMXQ5UWtxSDFX?=
 =?utf-8?B?cjVJU3lFZ2ZZZDBEY2VZU2E3Uzh4SW51UFpVME5SbVMwMS9sdENEMlY2QUpu?=
 =?utf-8?B?ckhhNlUydmFVbkhGazdzODl0U2RpOEZUNEQ2UWZsd3lCWmpRSG1ZZnI0WFlj?=
 =?utf-8?B?VHpJR2IwMnloemgvV1dkMXU2NC82OTg1NkVnQ0llLzRwVHNjY0w5MDNOdEdK?=
 =?utf-8?B?U1V6ZFExdWU2UWRwbWZ0ODM2dnlURUc4NFNzMUV6cEU3NXFFSVYrMEN3ZWNH?=
 =?utf-8?B?c3hvYTlHajY1STV2Q3Y0Y0VTZEI3aGd4RHdEOW5xWDNUb1ZTSXNESnZIOG9j?=
 =?utf-8?B?dStCYlkwSGNaZG1aM204TFVtakZaWC9Mckhsckk0bEZnMGVuM0QzWDdyei81?=
 =?utf-8?B?S3djcENTVUlHN2VWdTZoMTNuWDBEdS9uNEsrOHF6Q3hHeDlTcWpwNXFsV3NM?=
 =?utf-8?B?U01xdmZmSnpPYVBCUlEvY09MRHg1QVRVQS9RYkptVUdCd2VFZjFGM21kbkcr?=
 =?utf-8?B?Ymc0QXllQkVFWkF4NVNqZWtpUzNKMVFIa1BYZ0JuRHFQR3FEakswbkVWT1Fq?=
 =?utf-8?B?Z2NtejBKUkx0M2FLTXgxdWpOY3RENk1IcEtTWklmMUpBUWszYmx6WTdHTklH?=
 =?utf-8?B?SmhkamJObnVueTJoanI4bXFKUkNOSGk4bW1GMkpJT0x3NzkydFRBRE83b3VR?=
 =?utf-8?B?RVJYMzhidE9VUGxOeWwzbXBEV0w5QkYrdTJPRU44L011MDJXTkZLMWhWYTZp?=
 =?utf-8?B?Sm40T0pRRlBtaWFKMW5LaGI5Z1h6eERZMGNsdG9nWmpYM25SUGZtVlF6Y1Ix?=
 =?utf-8?B?Z0ZuRVAyeXJSZHdHK1VNRjIrcXdrRUZmRnBzMDFIQjZQR1p3QWdSS2dEckNZ?=
 =?utf-8?B?K0FyK09ZNW4wTEdHbm9KeXp2L2xjV254b01sZDlEcWI4dnJubVNkRG85aTlT?=
 =?utf-8?B?WjRxRjhjZGdzUHFMNFFCYUcxaE9hL25NcURLOGo3ODRlaTJINXRnTlM2U25B?=
 =?utf-8?Q?MrvudX7TQxO99qhZlJWtO1Dm7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7136824d-5144-4154-29ac-08db6cae8e58
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 08:08:37.4656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guSdrsAHWBn37JrCsHaf2teacq9HxXOoUu0nILBBX2hYiJB7blIrcRtJVOfSwN+k37RThpOFNJDOLfuse4JRZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 4/6] drm/xe/hwmon: Expose input voltage
 attribute
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


Hi Badal

On 6/6/2023 6:20 PM, Badal Nilawar wrote:
> Use Xe HWMON subsystem to display the input voltage.
> 
> Co-developed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  6 ++
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  3 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 70 +++++++++++++++++--
>   3 files changed, 75 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index fcc2aedb2aac..aa064e0c5751 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -44,5 +44,11 @@ Description:	RW. Card reactive critical (I1) power limit in milliamperes.
>   		the operating frequency if the power averaged over a window
>   		exceeds this limit.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
> +Date:		June 2023
> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RO. Current Voltage in millivolt.
> +
>   		Only supported for particular Intel xe graphics platforms.
>   
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 9d888aae907e..fe00c42ff29d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -349,6 +349,9 @@
>   #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>   #define GT_GFX_RC6				XE_REG(0x138108)
>   
> +#define GT_PERF_STATUS				XE_REG(0x1381b4)
> +#define   VOLTAGE_MASK				REG_GENMASK(10, 0)
> +
>   #define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
>   
>   #define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index b07ea53fdbc6..a86d2d8218d5 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -3,8 +3,8 @@
>    * Copyright © 2023 Intel Corporation
>    */
>   
> -#include <linux/hwmon.h>
>   #include <linux/hwmon-sysfs.h>
> +#include <linux/hwmon.h>
>   #include <linux/types.h>
>   
>   #include "regs/xe_mchbar_regs.h"
> @@ -26,6 +26,7 @@ enum hwm_reg_name {
>   	pkg_rapl_limit,
>   	pkg_power_sku,
>   	pkg_power_sku_unit,
> +	gt_perf_status,
>   };
>   
>   enum hwm_reg_operation {
> @@ -36,13 +37,13 @@ enum hwm_reg_operation {
>   
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
> - * - voltage  - millivolts
>    * - power  - microwatts
>    * - curr   - milliamperes
> + * - voltage  - millivolts
>    */
> -#define SF_VOLTAGE	1000
>   #define SF_POWER	1000000
>   #define SF_CURR		1000
> +#define SF_VOLTAGE	1000
>   
>   struct hwm_drvdata {
>   	struct xe_hwmon *hwmon;
> @@ -86,6 +87,11 @@ struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
>   		else
>   			return XE_REG(0);
>   		break;
> +	case gt_perf_status:
> +		if (IS_DG2(gt_to_xe(ddat->gt)))
> +			return GT_PERF_STATUS;
> +		else
> +			return XE_REG(0);
>   	default:
>   		break;
>   	}
> @@ -254,9 +260,9 @@ static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
>   }
>   
>   static const struct hwmon_channel_info *hwm_info[] = {
> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> +	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>   	NULL
>   };
>   
> @@ -279,6 +285,22 @@ static int hwm_pcode_write_i1(struct xe_gt *gt, u32 uval)
>   			      uval);
>   }
>   
> +static int hwm_get_vltg(struct hwm_drvdata *ddat, long *value)
hwm_get_voltage?
> +{
> +	u32 reg_val;
> +
> +	if (IS_DG2(gt_to_xe(ddat->gt))) {
This check is not required here if is_visible  checks if reg  raw is valid
> +		process_hwmon_reg(ddat, gt_perf_status,
> +				  reg_read, &reg_val, 0, 0);
> +		/* HW register value in units of 2.5 millivolt */
> +		*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 25, 10);
Since we are adding a scale factor to this patch. We need to use it here

> +
> +		return 0;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
>   static umode_t
>   hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>   {
> @@ -432,6 +454,39 @@ hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
>   	}
>   }
>   
> +static umode_t
> +hwm_in_is_visible(struct hwm_drvdata *ddat, u32 attr)
> +{
> +	long val;
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		return hwm_get_vltg(ddat, &val) ? 0 : 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		ret = hwm_get_vltg(ddat, val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return ret;
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -445,6 +500,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		break;
>   	case hwmon_curr:
>   		return hwm_curr_is_visible(ddat, attr);
> +	case hwmon_in:
> +		return hwm_in_is_visible(ddat, attr);
>   	default:
>   		ret = 0;
>   	}
> @@ -463,6 +520,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return hwm_power_read(ddat, attr, channel, val);
>   	case hwmon_curr:
>   		return hwm_curr_read(ddat, attr, val);
> +	case hwmon_in:
> +		return hwm_in_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -530,6 +589,9 @@ void xe_hwmon_register(struct xe_device *xe)
>   	mutex_init(&hwmon->hwmon_lock);
>   	ddat = &hwmon->ddat;
>   
> +	/* primary GT to access device level properties */
> +	ddat->gt = xe->tiles[0].primary_gt;
This had to be added in second patch

Thanks
Riana
> +
>   	ddat->hwmon = hwmon;
>   	snprintf(ddat->name, sizeof(ddat->name), "xe");
>   
