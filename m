Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22084C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 08:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC28310E450;
	Thu,  8 Jun 2023 08:18:36 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6073610E450
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686212315; x=1717748315;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6QW7EkQqt+0v3icEHM6fyrNhigvafklpZkvW+X2QlSE=;
 b=ILd/GDK9YuL22DWA1FEkALaiOxXnDnU4g93HG4VsKUTohjposbfPjluZ
 q26DcGMseGEzoduq4XQpulINs9LO0ZtOEP5uhv6a+WPQDqUmIKSi8vcCL
 EJK2P6G/7CizNjtbT7TkbelvkPA5aSJBlMXdTl0YnFmONR0YobiFnZhsN
 acvK5IcxUCn/7XhbdGOyi2bItuqCnLoj+B2CPFTvOe/dxMDhiTasOAA+w
 E6N6xmCiVjZj5Rs4+nZbVtodVlIF4HdYur9B7mzR+uq/VSRZGj/CAioND
 s7zpg6W5Fyulmj5EHMSxhaBnLHuBP8podlIJOKNTzzA53TJoOemIeQeze A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="423096889"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="423096889"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 01:18:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="956625780"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="956625780"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2023 01:18:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 01:18:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 01:18:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 01:18:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 01:18:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHqzfa4Ch+8pXrYePnb5g0g/ZRLd6w7B/LV8TQTopWh/P/qCCac5QF/G/hAk5Ic7FfDBIHwce3q5tXZXuK43tOFh09CWsOdvomIX7oossSrVm7WlOnWHbcdDDz7Lgbf6obncXNnjA3cKj8H4AOX5Y6eKTUmv9XrPcRpa/8z0Evy0LqKSZJuKBx2ub206W5syJZVOxUhloDtsKKoWUomKu257e+0Jlv0ycMq14yAREUjrpbFLNlF3rwEIlE5rDsKDA9SUGm9h0z1hH+c5gfEBVjaIT6fb/Xiav7Z99SSx7LaIy/Xhl8d+5ZAIaIQ5v/+9zDUaXqo/5nftGNBhlkj4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VrvkVTwdPieXkGkolIVEMlfnk+rjPmD9Bgt0UQnuY8=;
 b=mwNQMBgsSJ3ch+KPHcfQN+67ZiNTgTY+5oBlTWlX2jn7VsYAHr7DtIS6Hao423HRBPMzyqAfJxuWwQUshom8wC+ZU669rp6iFImbYibMpReCP3pIscYwWKkA6effPmOgFzLCWt2lmRb3MfYKmA0MUf+RI7+LUitQqTfJ72f48cE5+qnhBNajZlwKWg2ylSS6lPRYdp3UjPMdClUeHnIns+///3wzsVzvU4A7gVBuRqB9YlKQV1YfnXHcwakrhsERF8Y/7NwMfDgFyyj7uA7os9CWJp3v98kl40q2j0KPB3HZfDDH9mfG5tIG8XhHOxo2oUiq9+ehH6mV7aKBPeSDvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CH0PR11MB8190.namprd11.prod.outlook.com (2603:10b6:610:188::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 08:18:26 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 08:18:25 +0000
Message-ID: <04997e62-2ff5-3283-fff6-08c873c9a9ff@intel.com>
Date: Thu, 8 Jun 2023 13:48:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230608074544.2186318-1-tejas.upadhyay@intel.com>
 <20230608074544.2186318-4-tejas.upadhyay@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230608074544.2186318-4-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::10) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CH0PR11MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: e78db9a7-cc57-401f-ff52-08db67f8ee0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L24NpY/WtLUCc71sbAOEZDX9yEr6wia85D4l+vvSgt98BgYpbo6tD+SRaW7GQc5QZKnE/x1Klm85+LvnRgLbrywReMetqsj+Gu12QovcU8p59g+5AWL5L9tcveLo4NdAvYlJJKw21f0qJwC7a8oXwrmzUVF91OzAY8nPjIwRANjbvt0Cow1FXT7SBBaEutWgZyngaulYoYMvQEm4QwkaGQWNfIgpzTkWpC3bxeduJknF3UAA0ZFdX9QLhcjMbHoZw3dL5p5ivYgcmRI3VAZxix6J52qjJGN6eQVhitppVpKC/Ko1CRhpGN+yHH2roYJAFptb1WJAIkJvNUaFQp6WeOfjIQvNBUbfBs19oFU3AKES0LD1/jQhiP6n2tD8DpRuh6XKgkRr0k6j9tjQyAVYngxfB0Nzlca9lfN7koR6Pw/82NehLx+GgFxtDzpqDBw4dR1sNZPKcxE+esS8hsDsKF7K3gddzAWb8f4/hmF6Kq0fVnGbpHqJigm1+Az7g8OM8R4hk01/GiusQOCX+De14NbauqVD2cfuSJEOL0yOC4h/eov8qJ0iDESLvsZVi8P+SBvtguUxljgZ6aF8ABJ3sWvZxN2x96wFwiTItg1YJPllQd6+w9OhaQOOq6SwldkduxbT6EoHOCsFBql9GwgP6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199021)(2616005)(53546011)(6512007)(6506007)(26005)(38100700002)(31686004)(41300700001)(6486002)(6666004)(186003)(66476007)(478600001)(66556008)(316002)(82960400001)(66946007)(8676002)(5660300002)(86362001)(31696002)(8936002)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTVpOHc1Z2JmL3NMbmRDUTM5cW9iaVdPelVVQ0dod2wrRzlEK1ExU3FOT042?=
 =?utf-8?B?UmNGM1dVVWx2bExoWTBPdU1GdGlHQU9vT2ZzKzFXVVNOS1AydUNnQXBBZ0Nq?=
 =?utf-8?B?amZVbFhadXp1dkhNVnQzNkpXZ0hZTExQdmh3SHpjbzF0dllYYlZPWm4yb1NQ?=
 =?utf-8?B?K0dUcXdjQzVzTjBlQzNNemp4N2xaTkFpeEMxRUJoUnVmTDYvRGtzTFlPZVU1?=
 =?utf-8?B?OFFpR3NOWFR1RTJ2T0dITEdFRHdCdDhvMldldGF6c3BvdThPWWZpTDdwMTZI?=
 =?utf-8?B?QzQ1QloyRDI5bHFzb2tZSEw0ZGJjaHdlM1Z5V2ZLSUxtaEE4eDFqK1NBRW1j?=
 =?utf-8?B?TTR2QXlSL2FRbEFaNkVtRUNNdm1pNzlxSHN2L0FnYTQ0TWtQT3BlYWYwWktS?=
 =?utf-8?B?MnVJUnJoVW85aFcvTWVQelpxNVZFa0RkclF3elNSR2NRVDhUV0Nmck42bWFn?=
 =?utf-8?B?a0E5WUtCWFg1cjBlTXEzb2UzZFJvbk8wNUk1TTlpcCsrbGZnT1JDQWFCNk4y?=
 =?utf-8?B?TnNZdUhweHdDRS9wRjBhMFUwTUwzTFk3VzBKMGFiZDd4RUdvSHZBcmk3SGJm?=
 =?utf-8?B?YVZuZC9zWFh0a0szVXM4ZEFSd3pXbDk3d1JGdTNOV29uRlNMMVNkeFZWNTY3?=
 =?utf-8?B?V2VlZmpnWmxxQTFSOUFySXI5K2dNZmZvWVBCWlNSSE16OU5vWjZoQjdsclZX?=
 =?utf-8?B?MEFtSExQZUhNc3dGVjAzaTMzdm9UcEJibGxod04xQXZhUm5vVFlvQWRhbDJx?=
 =?utf-8?B?d0VuTzZlcWJ3S0d6TkEyU0tuR3E3aHJBSTFmQlZncUtuZlhTUExOZGdCS2lh?=
 =?utf-8?B?VWFiZUVpRCtySnJPaWN6WEdaMWF4OTdpMWhkbTlLUjM3SUdhUmdJZ0RkSHFk?=
 =?utf-8?B?T3lIN1lDUml0a08yQ3dmSWx3a2FhVHBXTVBkdktveHllWXZTdmt3eHRZTEpv?=
 =?utf-8?B?d2M1VlB2QVppRVBoZHA3Q1JDQmphUW5obG5FeXNhTFdjTGowUHE2d2ZIQWFI?=
 =?utf-8?B?ZGRiWDBjVDdpRDFDdlp1dkdVbzRaUU1XZEJGK0xvRUpwbWI4ZWJnbUZkSk5E?=
 =?utf-8?B?aWU1T09wL3l6cjkxT3p0MU5DSTE5MDdBOEtjR2NkSmdVY1duZkxkemZFTXdO?=
 =?utf-8?B?WkdsSVFTdzVDNlhaWUF5bjJ2ZG9DK04zSC8vSG42N2NKRno3Qkw4YTNqbVdU?=
 =?utf-8?B?ckZVRS9IdEZwdmlkWWlTWTRLbkhJaXdZa1ZNc1U3S1k2MG5HQ1dmWVF1MDJC?=
 =?utf-8?B?MUZzUWZBekc3SjJONlBsa0t5eThpVXkxTkVDeDVIeWVjMkJyQ1dRdEpUd2x1?=
 =?utf-8?B?WFlMdFZIV0lCVmMrTlRwVVpMMjMxNFBrM3MyRWdXZ0lIdGFkTndDL0JrVDBK?=
 =?utf-8?B?ejNnUWhJd1FYQ2NleWM2WnV2RGNyZjN5eEZBY0pOY3dGMlNMWklYdUdObHdV?=
 =?utf-8?B?dXllU0RiSzdndEE3VmdqWUZZNVdObnVLRG1DZGJZeVg0Q0xQMXBkeWw5UHhl?=
 =?utf-8?B?dkNoaGdyQkxBclFHelczamphRElIRVVwZmhLcGtDVmNxb1YzWFNtL0NUT2dr?=
 =?utf-8?B?eHg1emI2dkxGOGptRXRsZ1FjZ2pobXhzbDNLd0Q1M0J4TXVqNmpKNzFPNHE1?=
 =?utf-8?B?MmRjMHNGWkxTLytOZlpNbk5ONlBVUmtjUTBjN2FQeHV2TGZtR1ZoOWdXYnlE?=
 =?utf-8?B?eUhlaEFQQXcwR3NLZmc3bXlwaUNLVC80VklsNE15NGJsU0gxQUpYMFZiOHpC?=
 =?utf-8?B?c0c1eTFCNWt4TGpUR1FwVnNJMlliTDM1bC9YUEFVb3VMdW1zc2xlMmxQZTY4?=
 =?utf-8?B?ZjZjUEJ0dVEvQTN6azErOGlrYVZoV01SNmdUTmFNTUR3Ri84YUY3L1JSOXkv?=
 =?utf-8?B?am1hTityenpnQjlnc01tbTZRc2NpRTZKdlpncVV1MnVHL3V2RnhQOTg0eUtH?=
 =?utf-8?B?NnVRSlhRYzNMclU5Ykc2Vm1pMk5xOGFiQWYvSXN0dG1SZjNjYVBONEZqaWNM?=
 =?utf-8?B?alhBSldYTmZmZ2hBUHNqK1kxZkVHRC8yc2c3dlRLZ0FRdVh2WjVLK2tKM3RN?=
 =?utf-8?B?eXEzdy9rQUNKY0I0ZGVoY0lmVlUzaVVoVldROVhZdTNWWXNxaE5wUWpjS1Rh?=
 =?utf-8?B?NlJWMnA4M3VSbU1iWkFNV3dieXovQWZhcGNMUVZKanFYR2V0elJnUEVhdGJX?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e78db9a7-cc57-401f-ff52-08db67f8ee0d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 08:18:24.9606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 231WmuCQZesXu7OutH8IX5DpHL1594xUotVnm2DVLijcSgzMmIXL2u9qJ0gWhOUXv9KispYRD6J06c2sK5feda8BY09FphcJn2oDsYKWfS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8190
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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



On 08-06-2023 13:15, Tejas Upadhyay wrote:
> Add sysfs entry to read per tile physical memory
> including stolen memory.
> 
> V3:
>   - Exclude DG1, replace sysfs_create_file/files - Aravind
> V2:
>   - Use DEVICE_ATTR_RO - Aravind
>   - Dont put kobj on sysfs_file_create fail - Himal
>   - Skip addr_range sysfs create for non dgfx - Himal
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
>  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 17 +++++++++++++++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index db61da4d6212..b8a07826c65f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -107,6 +107,12 @@ struct xe_tile {
>  
>  	/** @mem: memory management info for tile */
>  	struct {
> +		/**
> +		 * @actual_physical_mem: Track actual LMEM size
> +		 * including stolen mem for tile
> +		 */
> +		resource_size_t actual_physical_mem;
> +
>  		/**
>  		 * @vram: VRAM info for tile.
>  		 *
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index f7a7f996b37f..6febd11d7dd9 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -277,6 +277,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  		if (err)
>  			return err;
>  
> +		tile->mem.actual_physical_mem = tile_size;
>  		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
>  		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 5c9ebe40e3c3..b79b756e5e49 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -22,6 +22,18 @@ static struct kobj_type xe_tile_sysfs_kobj_type = {
>  	.sysfs_ops = &kobj_sysfs_ops,
>  };
>  
> +static ssize_t
> +addr_range_show(struct device *kdev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
> +
> +	return sysfs_emit(buf, "%pa\n", &tile->mem.actual_physical_mem);
> +}
> +
> +static DEVICE_ATTR_RO(addr_range);
> +
> +static const struct attribute *addr_range_attr = &dev_attr_addr_range.attr;
> +
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_tile *tile = arg;
> @@ -52,6 +64,11 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>  
>  	tile->sysfs = &kt->base;
>  
> +	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
> +	    sysfs_create_file(tile->sysfs, addr_range_attr))
> +		drm_warn(&xe->drm,
> +			 "Sysfs creation to read addr_range per tile failed\n");
> +
>  	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>  	if (err) {
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
