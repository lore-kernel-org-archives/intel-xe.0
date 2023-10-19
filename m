Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8FACDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 17:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2ADF10E532;
	Thu, 19 Oct 2023 17:04:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C9E10E52C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697735075; x=1729271075;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=azHts6ci/DkamdLC/iibgk5e5NzxmGAa0LxheLzbrVw=;
 b=hZd8ap3Pew0kq9vZn/su7Og1L6+s1HNCmDOYJV3X0cnf1IDqoetHU6Ch
 9yz6dU6t1kACMgLS/sf7qMkXG8r3mpQRCDwopPb3ONoUYT0ztpQVlwu2Y
 q85j6e5Z4ediWUJzv+ksCq5nUjWN0WtVm/0PT7Z1xzoNqlA8uXHV5NSrU
 +Bph7SFZo4sraSta6KJhdImXCIrBXhQ9Kn2hS558iLdld23Kn53P9uQ3b
 NdKyh5mA1MJw4lZrFZx7yrVi0aEdG+JHQFDgAE2GYAB/ObdnwfC0WtHye
 7FsASkycVSUF7yS17s/MJy5Q7bTyHszUangfstZuSGaWBySoJA5lhzayQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="366549095"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="366549095"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="786475088"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="786475088"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 10:04:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 10:04:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 10:04:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 10:04:22 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 10:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYdBjDPK0iLxyXAQzkgQtDIs89UprVcpbIUNqlDh324uWYL/AFYC6ZfBXTwcCyiHa8H8PU4fiy3buxA03p3x4NyNB36DJypVglXtaL4Rxl96dF+LCN7JMYYmcH+R3CrScQXAHOWqfRsW4BD7S3aYqD4MnLb1gdf6FgwQzFzrlMOrFNvSwJo/mBYxTXxbYANise0j3+cVRly0VrdeVARku/JSIlm9Zrz71tNGfB5ZGzTZXhks6vZQc3D1SEKF4UCenC9zYT8rwTa12xnMEr+34DTJ84OD4cYiNN7AyLo/SPIWSRQd4HpDJ8PHtJaa2Hgziuz29ZjW010fAUn5mJhpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmwnBBSaUCrFaeY0K2S/6IsZuUkLmZWn7xiYNx/JaWA=;
 b=erzAT/ArXmba1RpxQeZBa1x9VI3+msXAp/oluAgaofkgdKVOM62sr8ge184FK2a/RtYepP25kKTI7ltCqnrEewoSyvkj4Dd6yfSzdUmPFkHNRrfw7m+miBGQdJaag0a86Sw8s7aR7L7M6FKvW28C9PXmYP2sGYUT04aBOPWEVGEyf64Iy4fMjZytFeSMAPHn3TL0X8XBu32gXwIlKtvimn4rCQM/ejuEw6tK0AMlvHQCyxGRL/+499hiCffn+TyOknGwWDeOw208bTv7stUBQ/nmAOxEPNYpyy2O4lxjYF34VusZgQtBzdmlMHkWb18wYqZppAu7B+SZHolrBMyv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25; Thu, 19 Oct
 2023 17:04:19 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6%6]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 17:04:19 +0000
Message-ID: <d1db0afd-0979-40c1-918e-955a7d658c0c@intel.com>
Date: Thu, 19 Oct 2023 10:04:17 -0700
User-Agent: Mozilla Thunderbird
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231019132534.1374903-1-himal.prasad.ghimiray@intel.com>
 <20231019132534.1374903-7-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231019132534.1374903-7-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CO1PR11MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: 78284f19-d6b3-4205-1c57-08dbd0c56f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: In28Tj8flDaGpuKU2M5zF4JAVprgk0rFx4NU9D1WAqDQVy2bHSuplvGY/A76G8OeIxV/cU+cFaLow4BvYJuByRGz5olV8QVbPyqatmi0VmHebgRDcQRAJ7W0DOyaF5h1YuH/4VzLABl3as+FegYvSPK/KzbPpD3vmc0iMxUVV0qY2uMseuzUvqJ/35QcbWNe+atrfM91NLyq8WX5EpqVZIbFfO1YjMg0XWtCTVXlOBbhAnPS9kyApaQCEEU9YvIMRHBXjfmAJkp1QhlAEzY9OjhtaV2tJ4/FaidDElyYwThevZoI+M/HmqGZb7YYDjFkY2BTJnm+tNm2irmKXhcF0PqSwGH9Kr0bc6JXT7JPnVXIZWxNojOM9GYOYYmV6hzwKdDPWbgr+3BF2vNb18qhephAzWDyabpmJ9crqAuAT8GdPbqEmQ272oAPI5MgXnHe+/AuRntxy/83DO8+4sPqK4Q3NEh/l7F3OYlt7QV06NN1eoLLVZzI7pQsxzmLmnbScqTgKKr0CIAed5vMLXkJ7hDk/qafLfiOOw0R6oxcCLGjrk3wh2xatslSEZQNK5YS2JqFKmoHpYNm0DRm8s9Q1fDegxchP5zNkO0t7AWlfsMBpSRYQNYMpmHXuZMk+3x595RUxt2xtcTiXHvlBCRxeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(396003)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(86362001)(66476007)(66946007)(66556008)(316002)(478600001)(8676002)(6486002)(8936002)(36756003)(5660300002)(41300700001)(4326008)(31696002)(2906002)(6506007)(38100700002)(2616005)(53546011)(83380400001)(26005)(6512007)(82960400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTFKd0JqOTQ2Q3JrTTJ1TkovZ0VaaDFIdE9zMVM1bmx6VHZsS1I1b0FrK2pz?=
 =?utf-8?B?VmtUcFptNFJndUFyTlNFejhLSWZ0bjFrN3VSQ2JtWEJidGtxdmc3KytEN0FN?=
 =?utf-8?B?dzdFTStFdHEyTktkd0JlK2taUUFJQU5KeVVjUlU4TkFDTHlTZ1lCQzVwR2ZJ?=
 =?utf-8?B?N29YUkEwT2t6QWZLQk1MOU1Ybjh5dmQzcXdsWGd0QmFCWFQ1RnVOK203aVY4?=
 =?utf-8?B?aENKeHJIbGN5WjFVRlFRNkJWNEg5T2xxd2xXbWZOc3dEU0RKaFBPWUlldEFB?=
 =?utf-8?B?NjZ5SzloRjkwdDNxTU95WmZEVnBRU3JnMXp2VVhGa2VNTG02MjQvQ2VSNi9v?=
 =?utf-8?B?ZVpMK1gxdTNJSzgvQzk0U081M2xuSmNqREEySFZ3MmxsVUx1QnE3VDdhV3RK?=
 =?utf-8?B?SERRWXVjY3dHZGEzbHFWTVdEdFN4cmJrOStzeWdHRUxrUk56OFhMWks2VEEr?=
 =?utf-8?B?WW1CUzZpdm81V00yeS8xT0UrUTBKOGNYcE0vUCs4UkZjUVk5UEtlM3JSckQx?=
 =?utf-8?B?SktuUnN5T2k5b1cwNllIRllla3ZrUmIwWVJWSEFhdUR0UFVQMmorNE8wZGtk?=
 =?utf-8?B?ZUZUZlp3NnpER3BaYm9XRU9KcHNRenRsTzE1RDFFOTR3U2RuM2YvUE0rbTY2?=
 =?utf-8?B?TnA3N0pmQVhmSndpaG9rNGR6aTB2dCtFbHdmZmdyRWQzL01GQXdGVFBDeGVF?=
 =?utf-8?B?UHhEbHNFajc0TlhZeHYrTk5kckFQYzdYcmx6dHVsdDhaTUprSk9WZWlBMDF0?=
 =?utf-8?B?aCtOT2dmRWlHQUs1YUo4aGt1eUg1b1pQdHg1Qzc1N1FGaElWNEc4U0Q0dS9P?=
 =?utf-8?B?MnIwN0FyK3Bic2VSVnZCN2RuZEpNem1DUmZZcDBxcDNscStSTmRaOGoybG5a?=
 =?utf-8?B?Z3pYRzdUd2g4R2hFODd5V0NFN1lWcElrSWZDZERCdjRpa2ZkZXB6TlVHQUxH?=
 =?utf-8?B?ckxiQ0pXS2VkN1p5S2htclZ0UElMZlpMaTUvOG1UZkphTmVOOXRNc1JIWEJr?=
 =?utf-8?B?ZkFGV0FDaG1yRmdrQmhuWlhMbTdycTVIRUN1SitxV0hrWFhybGRlNTMxTTdM?=
 =?utf-8?B?UUJvdHdlQUd2bjhyUUNwSEJHSzRobTdENnRyOU1xNHl0VlBjbEE4cnBvTUFD?=
 =?utf-8?B?UjA3cXY1TEFpbXUwZUF5RnFDc0RrYWJWb2xsT0tFRUFnUnN4YWlGT2VsNUww?=
 =?utf-8?B?YjQ5WXFoNVZtRkJ2R0dqYlA3bndwdTFSQ1I1d2RzK1pkRml6eENIalV6TCtT?=
 =?utf-8?B?MTVyK1ZFRmlUYkRwMnU5ZEd2L3hoQjNvYlZjWGN0Y0RsVkUvV2dGOVQrT0FV?=
 =?utf-8?B?WE9ibXU4YnhLTDkyY0tPTE9zeDRERElwWVc4ZzR2SFBMQ21DdkgzSGtReWRC?=
 =?utf-8?B?azQ0aWRoMTEwM04ySDNVTEJlUEpheVRpK3ZlcnJLQ3R2VkQ1WlQzQWM4Nk9M?=
 =?utf-8?B?ODE0QnNQdkNCQjRGUGFFVklUOG9pQ1BzTjlKYmVZeFJ2VTluanp6RGFhOXpt?=
 =?utf-8?B?ck4xZnErWUtRY2FSS3FCaGIvMVo3RjJOamE1azNRdzBick0yY3MwZmhiWGt5?=
 =?utf-8?B?TnkzR3ArWWo0a0c1NGFGbS8yVVd5dUkzK2pRMERzSVZCZlNIZEJtSXhuUzJN?=
 =?utf-8?B?RVovdjlNVVo4c2liaW5mMnBLZzdUcnpLR3NzZE1HU0hNY3doNHp1YnB6a0li?=
 =?utf-8?B?dmJoc3l4bmkxWGtydVJFb1J0OVJSUlJzR1FkM0pNcmNaVTNXR2lzOHZsNTh6?=
 =?utf-8?B?anJCSEhhMktJSi96SU1mSE9MdkV3R1lGTFQ3MUhLUGdrbUpzd2VuNjNmSzZJ?=
 =?utf-8?B?cldTY2h1NUhuQ0F0UmRndkhIaXZtVmIwc0JFcXNGQjdWSVU0YkhDdU5rYm92?=
 =?utf-8?B?ZlI2QjcvaXAvVm5Kc2ZhZDE2VG5xQ0QzbFg1MlU4Vk1ocWV0SERqVjVKUytF?=
 =?utf-8?B?enF6V0VjYm12L2dCT2ZSOEk5YTFQT0F4L1ovTWZUb1ZPNEFxUzBuQ1o5Q3V5?=
 =?utf-8?B?MVZmcWtpYlNiOU1TNnVXcUxVeTR2eStoVDBJcGhMZEpMYWVtZnBiZHNRc2Ni?=
 =?utf-8?B?cmhEVHdxUG9DOXg3WTc1d0J6OW1WRjdPY1RxaFF1dkd3V3IvVGNSTG85K2VZ?=
 =?utf-8?Q?OHHaLpMrMkh4lTo08bYURk4me?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78284f19-d6b3-4205-1c57-08dbd0c56f17
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 17:04:19.5356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aithMpN8i5a7eQZBzOSzA09xv9kG5npxXuYv51xLyiXRC/IE1Oj06At5m9tSQKZ60nazod62NakYZU4zbY4acg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 06/11] drm/xe: Notify userspace about GSC
 HW errors.
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



On 10/19/2023 6:25 AM, Himal Prasad Ghimiray wrote:
> Send uevent incase of nonfatal errors reported by gsc.
> 
> TODO: Since XE_RESET_FAILED_UEVENT and XE_GSC_HW_HEALTH_UEVENT
> both pass DEVICE_STATUS=NEEDS_RESET. Use same Uevent to determine
> the RESET_REQUIRED and pass reasons for reset required as additional
> info.
> 
> v2
> - No need to provide tile info in uevent because error is
> accepted only in tile0. (Aravind)
> 
> v3
> - Use pci node to send uevent.
> - Pass RESET_REASON for uevent.

Can we go a step farther as Aravind was saying and just have one single 
uevent?  Or maybe you have one uevent now, but can still consolidate a 
bit more.
So replace XE_GSC_HW_HEALTH_UEVENT and XE_RESET_FAILED_UEVENT with one 
uevent, defined in uapi header with:

#define XE_RESET_REQUIRED_UEVENT		"RESET_REQUIRED"
#define XE_RESET_REQUIRED_UEVENT_REASON_CSC	"REASON=CSC_HW_ERROR"
#define XE_RESET_REQUIRED_UEVENT_REASON_GT	"REASON=GT_RESET_FAILED"

Would above work?
-Brian


> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>   drivers/gpu/drm/xe/xe_hw_error.c     | 17 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_hw_error.h     |  3 ++-
>   drivers/gpu/drm/xe/xe_irq.c          |  4 ++++
>   include/uapi/drm/xe_drm.h            |  9 +++++++++
>   5 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 3b371e0f6168..bc7b545ce37b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -196,6 +196,9 @@ struct xe_tile {
>   	struct tile_hw_errors {
>   		struct xarray hw_error;
>   	} errors;
> +
> +	/** @gsc_hw_err_work: worker for uevent to report GSC HW errors */
> +	struct work_struct gsc_hw_err_work;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 84533ef6a51e..644e63d4d717 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2023 Intel Corporation
>    */
>   
> +#include <drm/xe_drm.h>
> +
>   #include "xe_hw_error.h"
>   
>   #include "regs/xe_regs.h"
> @@ -378,6 +380,20 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>   		xe_gt_hw_error_log_vector_reg(gt, hw_err);
>   }
>   
> +void xe_gsc_hw_error_work(struct work_struct *work)
> +{
> +	struct xe_tile *tile = container_of(work, typeof(*tile), gsc_hw_err_work);
> +	struct pci_dev *pdev = to_pci_dev(tile_to_xe(tile)->drm.dev);
> +	char *csc_hw_error_event[3];
> +
> +	csc_hw_error_event[0] = XE_GSC_HW_HEALTH_UEVENT "=1";
> +	csc_hw_error_event[1] = "RESET_REASON=CSC_HW_ERROR";
> +	csc_hw_error_event[2] = NULL;
> +
> +	kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE,
> +			   csc_hw_error_event);
> +}
> +
>   static void
>   xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>   {
> @@ -435,6 +451,7 @@ xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>   			drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
>   					    "Tile0 reported GSC %s %s error, bit[%d] is set\n",
>   					    name, hw_err_str, errbit);
> +			schedule_work(&tile->gsc_hw_err_work);
>   		}
>   		if (indx != XE_HW_ERR_TILE_UNSPEC)
>   			xe_update_hw_error_cnt(&tile_to_xe(tile)->drm,
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index 997747b6b603..3c02fbd3b256 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -7,6 +7,7 @@
>   
>   #include <linux/stddef.h>
>   #include <linux/types.h>
> +#include <linux/workqueue.h>
>   
>   #define XE_RAS_REG_SIZE 32
>   
> @@ -106,5 +107,5 @@ struct xe_tile;
>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>   void xe_assign_hw_err_regs(struct xe_device *xe);
>   void xe_process_hw_errors(struct xe_device *xe);
> -
> +void xe_gsc_hw_error_work(struct work_struct *work);
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 8365a4cb0c45..bc0f01a2abc1 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -614,6 +614,10 @@ int xe_irq_install(struct xe_device *xe)
>   	irq_handler_t irq_handler;
>   	int err, irq;
>   
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +
> +	INIT_WORK(&tile->gsc_hw_err_work, xe_gsc_hw_error_work);
> +
>   	irq_handler = xe_irq_handler(xe);
>   	if (!irq_handler) {
>   		drm_err(&xe->drm, "No supported interrupt handler");
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 24bf8f0f52e8..4e5e57bc9f69 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -16,6 +16,15 @@ extern "C" {
>    * subject to backwards-compatibility constraints.
>    */
>   
> +/**
> + * DOC: uevent generated by xe on it's pci node.
> + *
> + * XE_GSC_HW_HEALTH_UEVENT - Event is generated when GSC reports HW
> + * errors. The value supplied with the event is always "NEEDS_RESET"
> + * Additional information supplied is "RESET_REASON=CSC_HW_ERROR".
> + */
> +#define XE_GSC_HW_HEALTH_UEVENT "DEVICE_STATUS"
> +
>   /**
>    * DOC: uevent generated by xe on it's pci node.
>    *
