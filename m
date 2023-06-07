Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07EBC7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 04:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8F110E41F;
	Wed,  7 Jun 2023 04:38:07 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F1E10E41F
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 04:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686112686; x=1717648686;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pyyGsQMAs8SMhvIZWflMfe0dJP+1FfxAHA/xAtccddk=;
 b=SZo/7u/DAZ3SC/jyjviZuuUb0SnCfSp97Tzz7SGR2tX8xlrtytg6OTP4
 Hk0SC0I5/CZofExKWLh3w6nr2f27ZYZzO7M+DJ4iTnIdM4KfA4H1M++JL
 1xsASwpAwoH4DeUX1gTMDCP9KmgM+VfSXdOIOfiJPcnfXSyXuxAUjBsws
 ko3gaTPX4TNyzgVcTWDzQl4/UM4Rsmi8Ot56eaGly0BGpWVi6i0LMYkuc
 7XB9oj6N8fS0lsTJqQGqL2O+OeFzb9aK3Tfa3DlU+9RJ2LBN4cuqzah3l
 dWApeR6EueQxLd/NlohZMKmVPbeSjhtMkXe4B/hEXICgj5xe+CopS001L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337239044"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="337239044"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 21:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="883595463"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="883595463"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 06 Jun 2023 21:37:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 21:37:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 21:37:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 21:37:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiA1f9NVlT+Ggin6RS1Js7ABiR1SCSJsx0AE5OZ51SuGpQNPhL+713KfEi1BOCHRPI+hjN9ElJNITpCoE3/G7MIlZrxGGLM2fuzoAZKGwOFYNzHgZoibbxziYxaEA5oxJIPQuhxhlvr9e8AJqFVbbwVap9IJiBkbW92REaEUUbLNGSJ6J5gD0WrB34tPjxzUZ+Pr/COSYO5YG65Q7WcvvEDhGnBhWmpBpoAQrKJdrarn0oZgqyz2/1pfnNYrmCoDFUGutB+nSORs1clMDN1zmJPPPnSizUZYvJZaGD0xcINrTopbD6dqHUdydSbk8dYu6U/Qvnq6XpbB9NqN725e/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geejgAaO0j3gWgkZg2+CcOO1hRY2NJbQbVOh5/WKzB0=;
 b=CksXkNBX41XJZai0aYN1j/Nl84rKRC0UMIYa5XZRCzx0xd8BtRMJYLygi7Z8vJd0/9vEdCk/4/sCp0NQJdesl6wrcCpLC7y5MlBYNmXQ/s/5mj6rJ2mmiWBEwAcgrIagFfcWvyiLLqFDmAkkDmgduJjzysdYdHF+7GKgQoNX4F9h/+hd0xJRVNYmi/ZuY+kFW0TWxFOtoBy1Um9BOpZADdquCc1MVaOHuVzZVVZApnlF+A/+3f97jAU0KazPvL8F7m5ySIzqbTph/S4PSx5Anbxp6ujTqMi7X5DfFn92AJwkM/j99PeqIVdthst8anhGfL85i45d+3ksmEy6Y0GqhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 04:37:42 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 04:37:42 +0000
Message-ID: <62b5195f-8246-f5ec-1fcd-c046c6f7d822@intel.com>
Date: Wed, 7 Jun 2023 10:07:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230606082142.7846-1-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230606082142.7846-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d4a225-610b-40fc-6118-08db6710ee40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NziIZpWV6jbVSl5qAllC8s22CgRSsB88rBrHv20b3FWDHgg/EWEibWTxQ6+N4p4zKkTt5o8+ZYRHTsUtJuoHB6RVGi/MFKFJraziMkob2jB6mXtmLiM/fviomAfEfhraxUIqLZu70hnNljuhYYDb1vQRVSyGAeXGC9F6mD0Qh7Pop/gIfSgQ9vETv3F8qSbMkYO9ydgi/ykhDboKSqjiyBdSxct8doBU67w7dLpRrOG+h4J4AgZV43CaKK9pdv/rGzuW0iHbTE2CcsWpeB83fZ8OrWLFAOLb/ME6X9q9x6DgzGqgkEf3w/tDatBARXYIPwJtS3bCcqjSHlhiyOcCGGx7b5VkucHoIlC8+uxDrQUtIrKE0qBYujglwD0e05x1MUsyYmeNzBUHDLmMgOpG/mdDla71BGuuMkvw5vnhi9J28o2zXjthXxR7EGoksqonEFecf4tPREgjXTeWznok343Q8YA0eAKqdgnKl4wOXAK1m8S1Ls+uRCKkVAsF+cl7bGuO4YjNawnYpO6B8uabBmXHEVT1xrL8s8M7Gdbyyw68ZToJVar224EDxmfH+7Ro/A7/FlQiqCh/VoI6WBjxusGW/8RX0jm3TnxmKVzo3SnR+aWpvloGNO5rVWYziz3a0nh/xwyxMceo+8GwFFpc+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(478600001)(5660300002)(8936002)(36756003)(2906002)(86362001)(8676002)(31696002)(66946007)(66556008)(316002)(66476007)(82960400001)(38100700002)(31686004)(83380400001)(41300700001)(26005)(6512007)(6506007)(2616005)(186003)(6486002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGpJMFNGMjFvdXBVc0p3Q3dSV1RUY2pEOGZDUXIvQlJkSmh6a0F3Y1M1Ylp6?=
 =?utf-8?B?QWlzbFJkcFFpc0VhMGJYQkJScG05MmZvYVEwZzlsbVFBeks3azdjMXpxcS8w?=
 =?utf-8?B?VSttUFhpdzNERFAyQnllYTlsZThlUEt3SUVLVVFBNlczNWdYSkcrRHZpZFVY?=
 =?utf-8?B?UHhybFRYcmg2R1hIb095VURrVjVrN3NQeU55K1U2VGJFM2duTFFDcVVnS3E4?=
 =?utf-8?B?RyswSWVXc21HakJPZnRvSVplNWpjSkNXL2JPdVdZazAzYVdUbmZ4ZlZ6WVF5?=
 =?utf-8?B?d2pCUW9YV0dtc0lDLyt5SysxR1dyMXlxVlRuT3FsdjZFL1FqUHN5cmwrWkZh?=
 =?utf-8?B?NkVPRWgrUmVaZ1NhVTIyamkvbCtOYk9mZmpBcnRUdDZoVEkyL2p4b0ZpZEdF?=
 =?utf-8?B?YTlsWUJPQk1XMWFHMkxMTkIzTHhOb1g4aVBMbEs1Q1NGMEI3UXh3am5FSU5w?=
 =?utf-8?B?Qk1YSUo3a3M4QXVBSUs1UklrRWZmbHlKWEFiRStHTk1pb01Jb2lxTXNSWm5O?=
 =?utf-8?B?OEQyalc0VHRiWG9icHA5amtMZXBZWkw5QlF0WFE1aGdBSndsakdpc1lETnls?=
 =?utf-8?B?c3RhWUhwMkRWN1lNMDdRaDlFS0xTb1pQeGtpYmhLNUVEbEV6UFJNRXdDVWsr?=
 =?utf-8?B?WEZqR2JYMXdGU1IrcXZid3ZTU21IUHFjcHU0OE1rSThtZjRFcUZpNHVYeGZ5?=
 =?utf-8?B?eVZrcjlDbDkrZjBKOCtoNTVTMWpVeTdVZ0RKekFRUzFRUlBDNGZpQm9TUnpa?=
 =?utf-8?B?UEJmNXJ1SFB3STBEYldVaU15ZytjTGhSZGY4V3V1azcvRHdERURyQWVTTXh3?=
 =?utf-8?B?OVJjZXRTNWJPTzFBdEJ4eWdGM3AwQTFOSHhsbVJ6aFpzR0ZiQlYrQktDY1BL?=
 =?utf-8?B?Tys5VDJqMHNvOHBkTmk0TGFSZEd0UzdtekNOT1dtaEdnK2l3SHBoUS8yTWFq?=
 =?utf-8?B?VzVHSHZRVGNLNWRydHdEL3ZaUUh3cDBDa0lxY3Q0VlJISmZsYWhYRW80WSt1?=
 =?utf-8?B?VGhlMTNHWTBJREk3ckZEcVBldENuR1oxTWtxNEpZZmpjK1Ayd001bG5iemlF?=
 =?utf-8?B?QlYvTUhFQUdXUnoraEs5cUY0YUdvK2lyRzhQSHgrK3ErNW5Nck5XL0YrT29y?=
 =?utf-8?B?YTgrZ3Z2VDBmY2wwNzkrVnFKd3BYdUREMlNLK0NHUWxhMnk0Z1pXYy8rUU5u?=
 =?utf-8?B?V1V1T2NmbW9oeVQra3JjVmZBazRpY1dmYnFLRjlyWE0vcVpjVUZBYjZOOVJ4?=
 =?utf-8?B?c0kxakVobEhWOTNaMzlJN2xvL29kdURXaXV6TUM0cFVPUXp3M1F4czlFOXJw?=
 =?utf-8?B?WmxiUmxLeFJZWDcvR3VXVTFSV2pIdEliWVpvbW1wQnkvb1hyZUxqdm1aNlcz?=
 =?utf-8?B?QVlQdE5xMGpxVVFKZk1pb3VrZCtYL0R2ZC9VeWNmNEhyamI4Q0M2d3lOSEdx?=
 =?utf-8?B?NzZEQitHZVBCTElJSm1WUHVLbUdWSHlVc245Z2hYSFUwQXZ3UFhyZjFkMS9r?=
 =?utf-8?B?R00weUtXUkw4MzlzaVlSbWFvN09pZmwxOVlvcGpLK2dQSElyV1pYdS9SdlM4?=
 =?utf-8?B?VnZKOU8xcVJIRG5FNzhJVjU5c2ZzSlNDenVPY3cwR3F3YWc1OWJBekxyRk14?=
 =?utf-8?B?LytzWFVENnYwSTRwL01DRyt4cFBwOHFMb1JTZm14dlNLejRYbVlHYU84Tlhj?=
 =?utf-8?B?WUJvTGhZaXpNZ0gyUVJZc3F6aDllMWU3M1UvWTFPdStZZzNhdzFLZytvajJ3?=
 =?utf-8?B?NXZyZEY0K01lS1NHNlh1QXU0VXUzUFNncWV4TCsvTzJLV2liSzJkaGZ0OTk1?=
 =?utf-8?B?VnF4SWhWZ1U2cjd6VW9rSGVIVGR3Vm5yOVR2VUNqUnhBRHVGZmpiVnprcmdV?=
 =?utf-8?B?NG1pUXB4dDFQaUc5OXI3RXVBUlM4b1NUSUc3WWlhRTAyaXJ5MmFyd0ppQXlC?=
 =?utf-8?B?Y1NFb293UFhsdE1SYU5hM1UrNjZxbFdPdVlCbUF2K21ZU2dLM0JoSEMvQjMx?=
 =?utf-8?B?cmxYUVlWRDUwcnB2anRFMTRMYkRCcTg2QXBHLzJ2VTFXN0hGd204NGFNeFFP?=
 =?utf-8?B?RXJicW5JVXZvOFFpV0NvNXNzRVlqVHppV2dWTG1ta1ZVSDN2T29IWVFtU3A3?=
 =?utf-8?Q?2FRtNgTzE1586VAXzx3lMNYqJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d4a225-610b-40fc-6118-08db6710ee40
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 04:37:42.0662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qcdej+X7G4cBlBYeTDvvkgv9ClZWofTzMfIpn/2r7s/fx1nesMo36pJzONCPauxSZoeQQ+7gbIs/bAqJVADdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] [RFC]drm/xe: Sysfs entries to query fused
 min, max frequency of lmem
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

Hi Sujaritha,

In the title lets use vram instead of lmem.On 06-06-2023 13:51, 
Sujaritha Sundaresan wrote:
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_regs.h |  7 +++++
>   drivers/gpu/drm/xe/xe_guc_pc.c    | 44 +++++++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 8be616a1bd51..bd7b26296402 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -101,4 +101,11 @@
>   #define DSMBASE					XE_REG(0x1080C0)
>   #define   BDSM_MASK				REG_GENMASK64(63, 20)
>   
> +#define   XEHP_PCODE_FREQUENCY_CONFIG           0x6e
> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0      0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN      0x1
> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> +#define     PCODE_MBOX_DOMAIN_HBM               0x2
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 67faa9ee0006..1b349ce74c3d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -453,6 +453,48 @@ static ssize_t freq_rpn_show(struct device *dev,
>   }
>   static DEVICE_ATTR_RO(freq_rpn);
>   
> +static ssize_t freq_mem_rp0_show(struct device *dev,
> +				 struct device_attribute *attr, char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
> +			    PCODE_MBOX_FC_SC_READ_FUSED_P0,
> +			    PCODE_MBOX_DOMAIN_HBM, &val);
Pass the args as per prototype where ever xe_pcode_read is used in this 
patch.
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(freq_mem_rp0);
> +
> +static ssize_t freq_mem_rpn_show(struct device *dev,
> +				 struct device_attribute *attr, char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
> +			    PCODE_MBOX_FC_SC_READ_FUSED_PN,
> +			    PCODE_MBOX_DOMAIN_HBM, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(freq_mem_rpn);
> +
>   static ssize_t freq_min_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
> @@ -631,6 +673,8 @@ static const struct attribute *pc_attrs[] = {
>   	&dev_attr_freq_rp0.attr,
>   	&dev_attr_freq_rpe.attr,
>   	&dev_attr_freq_rpn.attr,
> +	&dev_attr_freq_mem_rp0.attr,
> +	&dev_attr_freq_mem_rpn.attr,
Expose these attributes only for (DGFX && !DG2). May be create new attr 
array pc_dgfx_attr[] or pc_mem_attrs[] and expose under it.
Regards,
Badal
>   	&dev_attr_freq_min.attr,
>   	&dev_attr_freq_max.attr,
>   	&dev_attr_rc_status.attr,
