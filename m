Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825A5C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 11:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFF210E4B6;
	Wed,  7 Jun 2023 11:32:20 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B54E10E4B6
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 11:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686137537; x=1717673537;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8t+21qbDRQluXp32f+pPsocm6ARJkFsPxgxZS8+DG3k=;
 b=VFpGOT/1DYqp9Ao7R0JUMsao/dHU3NdRnL/xPd8pOZb//rgV2Vk8GRJC
 PKoLuRHDtxJTMJ9zl6iwvuRDX5G2GJX42vNS2BvRONNXrjnyXXjqrd9CT
 BsfzKWiXJzOg/1zM8AGg870ouLnzogd52hjCMK5+1/JRBXPbNtWsBzZNA
 DSGrX6FpUcm7/kcFyZTJA0Z8MIlCbDHzczsLOyFOmX0kjw2rxZ9AW22si
 9fPyNYfcbREfFLL5Lf6Er61IQvzIP+1tyShzOjmVkECJ+KIiJy8M1SkxT
 eDKZuZQUbu3s5ZPL9vga0fkrBgnxdH0we8njRB1GNnqEALcObNFKOOi5i w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337320865"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="337320865"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 04:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="739197726"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="739197726"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 07 Jun 2023 04:32:14 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 04:32:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 04:32:13 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 04:32:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiz5UgutXOoL9TkUT6lWoazEX5bpe+Oe9he+0NgkqLDfAZK7H+sKBTWHL4JDN/vTefvZwu9OOXHrpMT1u21n+6vZn06OOL1lN6bkwGOpioxtFPaVTMuXAbyaLSjgIRLJ3DhJNgjF0OILOmApuUce9f9WTRDrJE3ra+Ay4EiAzBbfeW3YvMUO0pi60t4AUT6yjjMytwh9DzAIo22bhg3FDyotiwfVBPgZkXTwe6aVQ/xkpvgN3Ppl0YQHUqOAyXvo8m76ZdOSPeAx46UqhYQXA0Htgr2nRXH3FVCm+DcwYNWPSWMonrv194ALyMiEQ2D2YU8gf+8qDVLQtVWtGImRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FW6ADSmhkUd//jslearxkFCAaAhV3RbIyDWodnnSLA=;
 b=CvAvLerJ7U1KaBJvFktQooIkY7WQPbJGHaO3a06NahHntz6SqKrJlDr+1i2O3P0jDPfwkCzTqkNpsT3gbciko0lMYTPAzRVa+mToXpwbR8xpPP69E4KS3OXrcqsTQ0IOLtpd+Gd4lJgmsiIMbrAn5tHfA8jgOvt696YRADhMBy+/IovsXo2aMBuOY6ckC/+zkOs39luvKlRrGMXTmc0z9k2omfNbgn4b2/he7x0YoJzvnGEyZ8bBPGTZHDUJiogGxTCX01YsqlkwNAben3nJi+1b1vCPV08G3RqDt84mz65WjrdxwrP+FWX5z8Mnr9ns3ObVUsHUuJf7lpTGE4TS4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SA1PR11MB6821.namprd11.prod.outlook.com (2603:10b6:806:29d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 11:32:11 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 11:32:11 +0000
Message-ID: <2dc2523f-335a-edb1-2dde-43dcef435c9c@intel.com>
Date: Wed, 7 Jun 2023 17:02:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Content-Language: en-US
To: <janga.rahul.kumar@intel.com>, <intel-xe@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>
References: <20230607110600.956524-1-janga.rahul.kumar@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230607110600.956524-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::14) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SA1PR11MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: 424237db-2aea-4413-af61-08db674ad549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zb7SaKNJOm+tuIe0AVDS3P2rpvEvvsz0xBYBOxyDSjOH55pS6LfNgIOY1UgDKLNYtzcz9I3k7RgL5gABWrG/Qm89d5Qk/NJ+rfB1K5PzFhKF7jpe/IxaN0z8jWQQqSGEaaT3WlQq9pUy+LOlchhmadt8UQfEgIoLv6TIxUjPzidbuvAgUrXK30y+WL3fzjqli2/QtQekMmvrwJqzbjDOGc0F0ylf/v+tzlVtZNmkAST5kwHu4tBxgDGBMbgmRvZKzYmZylFJwqSoP4zzaXBwt7RCkRlGSn79C2bLcI3pNwb8BRYyNTOICsNbFFERFPBXPrzer2wm1Hvdo9XcF7uumbFCO8gHidBu5TdEs4W/1tYl1cmKocBuMXRDisOYD6/+9BCYj+SQKLSA9SAeacTKQ6jePPV2fAYoP5I5MtzRGmmyaBiWP4C3e15lv+gdeYWmdfObW1+B8K2xOF+i4pvuDJhCVB3warigJhaw5xi7pwoT2DCu7tDv76b7FvFjyq1nehuLXURNZVtb5Id1CmjneHcmmVmUz3f7jNEoLPh2oqW24hu0jTW+/CxwBL9mlXhliPvChVyMGH/b82KM5O8hccNkevV6BLKqjy0SX0dECYr3ZmOObsw1JAvSRpmSnKjrHb3FLDNsAIWkcuzlWam1Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199021)(6512007)(6506007)(26005)(53546011)(36756003)(83380400001)(31696002)(86362001)(82960400001)(38100700002)(186003)(2616005)(8676002)(6636002)(41300700001)(478600001)(66946007)(66476007)(2906002)(316002)(8936002)(31686004)(5660300002)(6486002)(66556008)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGlWK1FDMTdmeTkxTzVpOHhqbjlqTHdFeGJRTEVPQ1ZDc0VyaFNyMXAybWRr?=
 =?utf-8?B?U05yM1Q5RW1KY3FVKzNrY0p4YlhXWWQwdC9vNVZZOGRvZzZwcXVwMVV0T3lT?=
 =?utf-8?B?ejdDaWpJU2ZuamlibStJMEcvQ3JpMVk2bGw3Z0IvbW1CWXdBNWhXZ2pXU1Nu?=
 =?utf-8?B?RmJTUDJ3Wm44NEl0aFpPMDByVlNQQi9EdWNDVHJoRzdDbDB4QjdxdzQxMG9M?=
 =?utf-8?B?T1BvUEdRdmNxenJOM05PY3hZV2VCT0F4U3NqV2lxejd5Mm1RZ0d0RU9ReWN6?=
 =?utf-8?B?OFA4QkpFMGUxVFBzdDZCdVpMcFhkYitONE1PY1JrWEdhbUZvZVdPaGthQUZF?=
 =?utf-8?B?M0VodWxJcnBtV25mQ1RXaW95TnJxR1lsYTdGNmZkb0pDei9WclRDQTFYRkNo?=
 =?utf-8?B?QnVORC9McGRPakF4R3U5V00yUHRsanhoeDFZQ0FoSk9WVzRKemwzTENQMjVF?=
 =?utf-8?B?NndXSWNUczVHc2x0L0JiaGNFVFNqZ0g1ZmlRa0R1djBBSXNGSFpZMS9VNGJE?=
 =?utf-8?B?WWJHYmw3TTNFZE9rVXJlMVpnV0RyblpSVGd3b1RYTGpmZXFTeHYvVmNLU1FO?=
 =?utf-8?B?ZWtYVnVyTkNXcCsvNHFBR3pjTEIyZXZwMFd3aHNHN0VSVk1wM1ZnanFCVkl2?=
 =?utf-8?B?NDlYcFNFR0hrL3JUZjRveDdPT2tRbjFHNXF5YXVTZWxVVGZySkdTL0drUnR1?=
 =?utf-8?B?cVAzVG81RkFZbWVHWFZHdmNJbGtKQStQZUFyYnl2VkkyWm9sS3hMZFBmNml1?=
 =?utf-8?B?U1BJR1I0aEo0UFcrQTJVeHNoZXJ3ZzFhWkhNb2p4eFZsOTg4dkNVUnJUV012?=
 =?utf-8?B?bS9MY2s5OGFmODBJSVFLYk9KTG5Bb3hyekt0V2JMam5wNkZoSU5SUVNuVFhs?=
 =?utf-8?B?cnRVWVpLYThkamV1Q3pRcnJ0ZXk2bGUxQWJxMDFSd05KZncvSE1kMzBsSWRl?=
 =?utf-8?B?NkFXNkI5MmJod25kcTZjNVA5VmhkRFM1UDNHZVBTbnFiTURXYjNBcCsxSkJV?=
 =?utf-8?B?T1g0elpHWWZsMitwZkc4a2prR1VyTHlIeitBZVNZQVhoVUpzRS96UzZLbTZF?=
 =?utf-8?B?SVpSblZ5NG8xalk4d2E4aFZ0MlpEcVNnK200M1d1TGMwWVp1VmdTWXllMTZ3?=
 =?utf-8?B?dDR5dXNwQktGcG1hVE95VG51bG1jY2QrTHM3UnVKMHF1bGx6QlFsL1hKWUFU?=
 =?utf-8?B?S2V1MzlmQjBHaXZpTmhHWVhDYjRaeUZRT29CRUR4bWtsbGxhRSswb3FpVTkr?=
 =?utf-8?B?NWFoN3U0ZGdNc1lZRFBkbTVENHl2SFRqYndWRkcvOUlUenJtWXdTTkgxME9X?=
 =?utf-8?B?T0pIOXM0YlpERkNXbXBoWlhsVDJ0MlpLSW9wVElyc2ZZK3hXRFdoclhXekt3?=
 =?utf-8?B?TzZScVBCdkFTbFZIczJrbnIxRy81Wk5CZEJWTXRuY2Y5NFJDTXQyeWxUczJV?=
 =?utf-8?B?dUtxOG9hV25KMmxwanVSbFB0MmxFTmNON3hBaG4vMWlmelNLc3V0WGwvdzlE?=
 =?utf-8?B?ckJtMGFhYXNsaHBpMGdsblZ4TElCY1ZnWW5USnc2elM4T0lvVEdsd3pxRzRU?=
 =?utf-8?B?STNnOVNoZnJhamIyQ09oUlpqSVNVY3NVT1k4eDh6S2YwRVJyK0lrV0tWZFVC?=
 =?utf-8?B?K1UvTmhPcDZwZ2ZnalYwQ0RENXJjT1BOemdoa1dad2tXblBFQkRsRDd2cjlz?=
 =?utf-8?B?cmVhUzdPV2JFNGxVaFJRekxIWXZtenBEekphTXd0WGRiMmovZ2oxQjZKb3R5?=
 =?utf-8?B?Q0thR05iQVlSRTIxY3FSZDdtNWZmbVVIdzhJbkplaVlWbFd4RC9tUVk1aU0w?=
 =?utf-8?B?cDBvMldyRWRteE1lVFIwYTFQRHNzUEE1SnIwYWdyK0xLaWdlZ3FEWnpnN2hB?=
 =?utf-8?B?bWIrZGY3bHd4OWoxUlQyNGpkZTc3QTdpR3RPc2Z5ajNSVDJTYkVSZXZSdXlF?=
 =?utf-8?B?OE9VOGpYMzMvY2xBUGFuSXZoMzBkR3cvU3g4cHZyS3Ywa2psc1Q5VkQyc2Yv?=
 =?utf-8?B?cll6UW1oWFZrN1lnd3gyblBhRHpyM25ONHEyVFdUVTB1Tm5FTnZQRUtJeXdT?=
 =?utf-8?B?YU9BN0NTRUdPOUxKWVB3UTJjbVlPdzNXN1IyUzYwQVo2WjRHTWk1clpaSmRS?=
 =?utf-8?B?NFpGOEFVZm9mOFArajF1MVhGUExEaGhDZnY2SU94bDVGVXYxYmhYRiszSWo2?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 424237db-2aea-4413-af61-08db674ad549
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 11:32:10.9888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1oduFQ8/wMS7cDozrh/Bus0oT+QHJcNcIJ8mOc1RfO9G0MYMWa5c4KLuyc5r25LHTXvHJwvcDPF3ZazKk0Qy+jcy/pFN/8u0FEijm+eu+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6821
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/Xe: Use EOPNOTSUPP instead of ENOTSUPP
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



On 07-06-2023 16:36, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> ENOTSUPP is not a standard Unix error.

may be just complete the sentence "should use ENOTSUPP instead."
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine.c          | 2 +-
>  drivers/gpu/drm/xe/xe_mmio.c            | 4 ++--
>  drivers/gpu/drm/xe/xe_sync.c            | 6 +++---
>  drivers/gpu/drm/xe/xe_vm.c              | 8 ++++----
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 2 +-
>  5 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 094ec17d3004..39d824ad7c82 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -609,7 +609,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  
>  	if (XE_IOCTL_ERR(xe, e->vm && xe_vm_in_compute_mode(e->vm) !=
>  			 !!(e->flags & ENGINE_FLAG_COMPUTE_MODE))) {
> -		err = -ENOTSUPP;
> +		err = -EOPNOTSUPP;
>  		goto put_engine;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index c7fbb1cc1f64..9fda28353ebc 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -461,7 +461,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  			fallthrough;
>  		case DRM_XE_MMIO_8BIT: /* TODO */
>  		case DRM_XE_MMIO_16BIT: /* TODO */
> -			ret = -ENOTSUPP;
> +			ret = -EOPNOTSUPP;
>  			goto exit;
>  		}
>  	}
> @@ -479,7 +479,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  			fallthrough;
>  		case DRM_XE_MMIO_8BIT: /* TODO */
>  		case DRM_XE_MMIO_16BIT: /* TODO */
> -			ret = -ENOTSUPP;
> +			ret = -EOPNOTSUPP;
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 99f1ed87196d..b9e3214e4448 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -116,7 +116,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
>  	case DRM_XE_SYNC_SYNCOBJ:
>  		if (XE_IOCTL_ERR(xe, no_dma_fences))
> -			return -ENOTSUPP;
> +			return -EOPNOTSUPP;
>  
>  		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
>  			return -EINVAL;
> @@ -134,7 +134,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  
>  	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
>  		if (XE_IOCTL_ERR(xe, no_dma_fences))
> -			return -ENOTSUPP;
> +			return -EOPNOTSUPP;
>  
>  		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
>  			return -EINVAL;
> @@ -169,7 +169,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  
>  	case DRM_XE_SYNC_USER_FENCE:
>  		if (XE_IOCTL_ERR(xe, !(sync_in.flags & DRM_XE_SYNC_SIGNAL)))
> -			return -ENOTSUPP;
> +			return -EOPNOTSUPP;
>  
>  		if (XE_IOCTL_ERR(xe, sync_in.addr & 0x7))
>  			return -EINVAL;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0a4becdf4675..3208319475c4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1764,10 +1764,10 @@ static int vm_set_error_capture_address(struct xe_device *xe, struct xe_vm *vm,
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>  
>  	if (XE_IOCTL_ERR(xe, vm->async_ops.error_capture.addr))
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>  
>  	vm->async_ops.error_capture.mm = current->mm;
>  	vm->async_ops.error_capture.addr = value;
> @@ -3033,7 +3033,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  
>  	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
>  		if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
> -			err = -ENOTSUPP;
> +			err = -EOPNOTSUPP;
>  		if (XE_IOCTL_ERR(xe, !err && args->num_syncs))
>  			err = EINVAL;
>  		if (XE_IOCTL_ERR(xe, !err && !vm->async_ops.error))
> @@ -3058,7 +3058,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  
>  	if (XE_IOCTL_ERR(xe, !vm->async_ops.error &&
>  			 async != !!(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS))) {
> -		err = -ENOTSUPP;
> +		err = -EOPNOTSUPP;
>  		goto put_engine;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 15c2e5aa08d2..5880e6cf8af9 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -142,7 +142,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  
>  		if (XE_IOCTL_ERR(xe, !vm->async_ops.error_capture.addr)) {
>  			xe_vm_put(vm);
> -			return -ENOTSUPP;
> +			return -EOPNOTSUPP;
>  		}
>  
>  		addr = vm->async_ops.error_capture.addr;

good catch.

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
