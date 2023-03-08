Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F34CC64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1F810E08D;
	Wed,  8 Mar 2023 22:44:03 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C31410E08D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678315441; x=1709851441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r/X/eaR61i3n3Wb2DDkxQMVfk4gopfT2L+UvpL9zY6Q=;
 b=f7MabUMqes5N4GG1owRXYM96D5LHKw6FsntYatxMwvfPm1g6rgTM96oa
 a/QimeRg4/BSwrlMcR4dOnnDz59U4MUUDxglFWfrd+mQQsDi/90AkGi6A
 FnSqTagBOyzyIMKYiPr6ZreDMyqxizUK+C7DQfiD88Lbm6X6mUQ/ZW9WX
 XXkrAMKuqAFEUnpFEeKO0sfpPFuM0fXzxnbCFqfL6IALQF1KFZk/yaoye
 2k/0MshoK78n75tixzgMIokUm1PFdMWz2vQKX8wYNM5RInd9Mw7IC3KPf
 zuS0DS4hAX5rRmC99Qu2bm6LEB6tEDhmReAgZNdhOPaluKsOPr2BH1dmI g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="315952818"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="315952818"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:44:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="1006514056"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="1006514056"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2023 14:44:00 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:44:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:43:59 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:43:59 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:43:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4nFiDpgK548hXLxU9/XSW4s8viAiJYw8eZ8kB+bq22e4/29WkF9xTlzqznvXDSd5Cl9uDJJcrlKVO76G6zbG7Qmf7DHWNGBMTQPzeS7ubqUnvBTaYW3ij2RieAG7Q3C+uu70EjN0sjbJuLNm7Ux+xeb01p/JSVAfzeL2jZgaIz+Vud/7tD0E2RfHSlz8+WINHNzZdgqqM4OTZ56JXLPYpjPSSKW+3tgp+G8wnn9smxXaG4UmJl4cc7S4hzuEjiKgrrj7pASVw1blsAd8ytj13aLrG2l97qEVOMlghmkSBKT724hKsh2pXcQiMqWs6KsHy8v+cC1/sIJBgzfqwUcvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6UwRaAbbriHPl77IWbl0XIt0m5wU2+vbnYf1JiCn+s=;
 b=Pf+xwDTHYyiO0r8yjhMLkYAkoJ1FyJ1mB6KfE0AMCTp3yjX+vJAeQKyh8iaFZ5d5snAoCh/1i6kQE/DqeA06N60k/Tg6L6fV6YgHB3I/R9l8RQozLh3yQxjLq1Jg8XEOJfCZuA5N7iIFfZp0W+jGMgpxOYl82bJdNO7CGaYIWAJco/KpdwzLhcq2oC7igO9wvbJJZRpqptcoLn2MaS6YESHqazhpC7UboMNlJScIYNDcDzmrNTn9PnWzWuEX8M32UOvipWY0pPMSKniN0kIx7zUKtN46Il1EuMGKEIzTL+57rc6cRE1+J/8rGBERTGNnbyqGodwTJkePmuOxQ633oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4724.namprd11.prod.outlook.com (2603:10b6:5:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 22:43:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:43:58 +0000
Date: Wed, 8 Mar 2023 14:43:55 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230308224355.dbdzaw6m5cw5lyir@ldmartin-desk2.lan>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-12-lucas.demarchi@intel.com>
 <20230308223745.GF1543793@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230308223745.GF1543793@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4724:EE_
X-MS-Office365-Filtering-Correlation-Id: c2419906-02ee-484e-706d-08db20269a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xLkAaRyjHIDMhHj2ShWvrT3RhN7PNudMvDgqKWDLq5DhZz4ubUO1b5ORMX0jmYyxNfrPyOj4zMYInPtVo+Lvm6vmDfYAMiGI4pbbRKqp8PlUufeCZ2CN8JOfQAK6fg4cbzBCPPjSZWyB6T26rRuOcsb9LANgXFhkYYjeJOOFsF7bQoty8eBSdodBHi5uYv9qiZR83SAXA4+SwC0CAnCLzE/i89wO7DyCl5JWKG0224Lk+3AqXgXcIZBGedPwpx9/dxZMxuWHhIT929yDdWPy/eDZWElGSt9RdCUtfET7GCD7vRhU0aN1ek/hSZXxcbEXCxNHcu+5mo2gbYdJ5AEQD0y0SMJpmBT5YTiGRLn6irBjmXOriYmrULze3fOXjlGuvndr4iOS9f+bLYs03Ddia7UnMhWdTqhz5bEU2mKh0zwL4oEqnfgylzROyYm1pPuErhmmBvPWRYKum/olSbjoeDPXa/0VyzXOW+sJMz3nI6XRAhrTiAlVj3v+YH+HbaDnSeEhFuWpzDPs9gbJ25+nysuHBwha7L+PZxlVuRV8JO0z/Z8ATpRzG4QXjBn4cxLzEc8OPSJCBekfojIuZlAdHgoPuOvSxfdkt6MwBosgCH/8pAK4SRZ0vo0afvNF1o2jrMahtItbS7AzHLKtfMRzqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199018)(478600001)(83380400001)(6666004)(9686003)(6512007)(26005)(86362001)(186003)(2906002)(6506007)(36756003)(1076003)(6486002)(38100700002)(41300700001)(66476007)(66946007)(66556008)(8676002)(4326008)(82960400001)(316002)(8936002)(5660300002)(6862004)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3nAdK6tVWdsJt7EJZzF4Z85CP1bKwtTCuq1zxe91ovt3x+OY2Rxof9qzLNUX?=
 =?us-ascii?Q?/LDEmYJhH5nZxDMiIJXk0lOKXGYe6uwU3O9BDmPi99QTjjIBiE6aATOnn+Cs?=
 =?us-ascii?Q?jpm3/E5ZEsYcbMeZpKI0dNbB4BwbuFblgeSfH5Db7BTlMsI/gE0C10Y8JAYV?=
 =?us-ascii?Q?1ZUsdCbclaWzKhaVEydCjQvSfRiLOhjZhRIJ/mWVqjVU7bMEyDXFJnkqEjY/?=
 =?us-ascii?Q?W7QTe/HcK0a7ypXKbHGwhT+UD7iMBTKUdnTvqzXjJyI7rKqkt4tMNZI/0fdo?=
 =?us-ascii?Q?IPQfSQYpkBaJQyd6WlNdB1qnT36jW5OIYu2Wrrfzv9pjcbidNIUQw9Ef9FSH?=
 =?us-ascii?Q?5f7nACyVkd2yer3jn/SiAqOEQrmn1iUaBmo5cGh0pUgI9vxL3o5gECGSUfGA?=
 =?us-ascii?Q?4tkRJ2dwIIRgOqXD0X7jJzLpaeQEM7hP0QnY6Ki/prsqEYRP3MejbMF2D+KK?=
 =?us-ascii?Q?lHG7huCJdSpOuLFWuGKkLAWq3dOD63ezONxtfv/w/Y0QbmkK62V9QPt8hHjW?=
 =?us-ascii?Q?3swbn1NayR8AwfB6b+6+nAwk1gbWu2bQcyMcrbMC55dNuj3ZBV7PGA6dTCDs?=
 =?us-ascii?Q?+b/f2D7QGiISWUdFbB+PiYqQv90J61MQsqRltY4rDQk6wQbZ97+ztWaDNQpC?=
 =?us-ascii?Q?NVNjlSsq8UVmP7L5F+xHNSRfbFf5PF3p2JTo2qinhS0VhhmUQ0TEnqKawkZ6?=
 =?us-ascii?Q?f1w9Q62uru4BrgBnH04RC8MUTKm2Ru2zUrFP6fWujP/fMwe6/QZkuoDthaI8?=
 =?us-ascii?Q?zqiiJ1EkySOHZPRV/251ppe2Rec5V5JxEnQYR48tRrxIimCd9y4DoZefnZVt?=
 =?us-ascii?Q?zv4bteiYeAnfqjqMnbxpQuMJk5743h25ppuf6LsOgaSONnAgrz4csG2AUJvX?=
 =?us-ascii?Q?/DzryG2Igl/Lqty4PLCdWz5OKvybO/vANqtzB1+x3aVT4E+Rynr2j4/5DygL?=
 =?us-ascii?Q?hcVoTXuFjyzhVnUDNP2r5JNkrwA3KdBb8Mb9nKXuBXxu02K4VHqeYV7WsCdP?=
 =?us-ascii?Q?ZmZawxdwjsdMp80texd1LLNZ3vSxMlVI9MaHyahGYx5EZupYj2XKXBohFDGH?=
 =?us-ascii?Q?wgDbX7vTrOytruu5vaw7XqMU/EIpKcMakvLqJmO72wxqfT+DbHaQVAe+Jhex?=
 =?us-ascii?Q?JfnfFqGeOhKwIGTf0jy/O8iH07beEOWSm96HEzrJ0/7HYgLqx9+ZDG4vZ6RP?=
 =?us-ascii?Q?03Ll8uq/csXtDTUdPg73QuwnU5SsywLJiHDf/Pnhl4LfbythXUiqTd5KO+dW?=
 =?us-ascii?Q?QTMbZ1nBiXNhoVj7G+7ku5CGNOPr4OQl/4huvJLVGAZ+dweo1dXA68V0bWTy?=
 =?us-ascii?Q?ICe3jFQKkFWIcgLu36AwsZecdvcX2iskrvNhHssCwZvZyqOpILgxmZ0KCfXC?=
 =?us-ascii?Q?svK3WGV+2/HCBd/HkqB3lFFiWjLHD0/aW4k2gru0tobnkfDmul+Xf4OTTJay?=
 =?us-ascii?Q?4un1oiqvvrNJSpi5Ajr9g9vVNhVAmklcXyzsgMKkUF0C2ItpvuI50XNt+Vkh?=
 =?us-ascii?Q?QTjQYmbzEpuUcjN/t8H9EnEeHjMonvB9AIbQVLB8nGPUr+bT8ypkrGSSwmRB?=
 =?us-ascii?Q?St6GNBvL6jpYvxSmvgzkUpKfpu716cuXQDBdB3YBs36o93999M29Ya9+jakm?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2419906-02ee-484e-706d-08db20269a7c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:43:57.8718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4Qbbm8N2yFROoV+kn0icHfThB1Md5Vpy6E8AvIzcag/bDVmWRf1aYJ25KZ87uNdE4OvFfeLtN8CS+XSbmvCAAN/c7Owzed3QG2pAvDDwjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4724
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/19] drm/xe/reg_sr: Tweak verbosity for
 register printing
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 08, 2023 at 02:37:45PM -0800, Matt Roper wrote:
>On Tue, Mar 07, 2023 at 01:24:38AM -0800, Lucas De Marchi wrote:
>> If there is no register to save-restore or whitelist, just return. This
>> drops some noise from the log, particurlarly for platforms with several
>> engines like PVC:
>>
>> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs0 save-restore MMIOs
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs0 registers
>> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs1 save-restore MMIOs
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs1 registers
>> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs2 save-restore MMIOs
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs2 registers
>> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs5 save-restore MMIOs
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs5 registers
>> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs6 save-restore MMIOs
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs6 registers
>> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs7 save-restore MMIOs
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs7 registers
>> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs8 save-restore MMIOs
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs8 registers
>> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying ccs0 save-restore MMIOs
>> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0x20e4] = 0x00008000
>> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xb01c] = 0x00000001
>> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe48c] = 0x00000800
>> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe7c8] = 0x40000000
>> 	...
>>
>> On the other hand, contrary to the save-restore, it was not printing the
>> registers being whitelisted, so add them now. On a PVC system it should
>> show something like:
>>
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs7 registers
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=0) REG[0x4400] = 0x40000003
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=1) REG[0x4500] = 0x40000003
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=2) REG[0x3ec3a8] = 0x10000000
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs8 registers
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=0) REG[0x4400] = 0x40000003
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=1) REG[0x4500] = 0x40000003
>> 	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=2) REG[0x3ee3a8] = 0x10000000
>> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying ccs0 save-restore MMIOs
>> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0x20e4] = 0x00008000
>> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xb01c] = 0x00000001
>> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe48c] = 0x00000800
>> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe7c8] = 0x40000000
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_reg_sr.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>> index 855d86a6c43a..8ae803393ff0 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -169,6 +169,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>>  	unsigned long reg;
>>  	int err;
>>
>> +	if (xa_empty(&sr->xa))
>> +		return;
>> +
>>  	drm_dbg(&xe->drm, "Applying %s save-restore MMIOs\n", sr->name);
>>
>>  	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>> @@ -196,6 +199,9 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>>  	unsigned int slot = 0;
>>  	int err;
>>
>> +	if (xa_empty(&sr->xa))
>> +		return;
>> +
>>  	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
>>
>>  	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>> @@ -203,6 +209,8 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>>  		goto err_force_wake;
>>
>>  	xa_for_each(&sr->xa, reg, entry) {
>> +		drm_dbg(&xe->drm, "(slot=%d) REG[0x%lx] = 0x%08x", slot, reg,
>> +			entry->set_bits);
>
>Printing the flags in hex form seems kind of hard to work with.  Should
>we actually interpret them so that we print a more readable message with
>ranges(when appropriate), read vs read-write listing, and allow vs deny?

ok. And then I can reuse the same logic for printing the debugfs.

I will respin this one.

thanks
Lucas De Marchi

>
>
>Matt
>
>>  		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot).reg,
>>  				reg | entry->set_bits);
>>  		slot++;
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
