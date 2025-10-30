Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0C0CCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 18:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C2D10E2B9;
	Thu, 30 Oct 2025 18:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7qTFRiL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879DD10E2B9
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 18:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761848334; x=1793384334;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LeAvbf3OBh4SWbwzQvUzIQEgeeIi9P+PVh2V5nOluo4=;
 b=P7qTFRiLdfFgxt267/kD6OJVneY1zomW3mQ46m+NGu4/hpLujp5u/K2b
 WaWqrguogYv1u3E6wcdRgNHQfWbn+kecW68M43OQk5Z8uWGakd65VO0y6
 b6V2ooWm3ysuQVR6wOCC/jNl2CY5n9wxxx/4T3i0Vj1dChT07poXELPE2
 bT5/lk77672KAdW682Of7Urobhaj9mCYU79X83/4wwDwkF8bsD9PXUp/b
 o1gm470lhI3HpEU+ofuyfmF5ECfvKDpbKJnTzKWXWg98WaeXwPTsg3m+/
 v4u82WBgkigaVMssXiZxdkTs5APqZ2ZUFdDipGAoOphLW0fcsW01HBGEe A==;
X-CSE-ConnectionGUID: il5MqSiNT+yVCT8rY3FCAw==
X-CSE-MsgGUID: Epvyl5e2T1Oeub07A/rh4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64099425"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64099425"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 11:18:54 -0700
X-CSE-ConnectionGUID: gl4n7TG7Q4qmduh7pZkpuQ==
X-CSE-MsgGUID: Q8XKaps9Rniunkp9FDU5gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="190369689"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 11:18:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 11:18:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 11:18:53 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 11:18:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeQ1tNbKBe2+31N+ivu+i5//uzp6hC73WEi+Uh+YEOqVF2Ryd1WI5vV++fX/uV0vhInpG7z5U8iwMWRlyWND7stANA6VpscjE2sCHSOgUrXnKRaCpYjZrlDGsPkoyeG0jyQPIGCR0Lp013pPzyJlaHtUdCYnnTUAR8fZknRQdxH7R2UtdhdJU14Bb2+TslDAAfY9cBfTc+IQ7wFkxgCusiCnh22xni5mtVsixjMokaoTLe3TIQUY/wRtzvLFiQhdnhQH0Je4dOFNTHl8D7WlaXFmgo4kTPliRZBE/i36MxRTaVgcoVF5/9hYK8QNv4GlF/ZdeVFqbAlQe4uZzEEmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQme31fBKbEogy436LB9AdO+J43LaKHrsUi4DOkxEDA=;
 b=ExXuVIZLwjjg9/pRA5fLkyuVd5iUYv5KRJ3tiNoF2YNxL5MGjTXqjKjBVyAecvHleYA1oTgHteDCJCGy6dZWA9gWLqINL1gYIgbOpZenx79fExNWj+mvDFOuYEqBpEmXw44lMwzWfqK3gT/jCCqSNu4hxXvP4AKbD4KTVZwykFGnIYM9nJmd6LeNGt3RlhpQo846ISblbofl2m67MKf5iV4jzDC+jLFGfo3JxnkUUMFfa6Aqtowjg2OXuBMcqJsjb7tZKQ5Xgrs4leI7ttKSEB/xFNANDzvX8rxdVUMoDmG13h7jtOxIP2HJhK56bmpKm/p1g5IpGBJIBIN2tG9Mvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 18:18:51 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 18:18:50 +0000
Date: Thu, 30 Oct 2025 14:18:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v2] drm/xe/pm: Enable WAKE# support
Message-ID: <aQOsB-jRCbGPnjAn@intel.com>
References: <20251030112751.110634-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251030112751.110634-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8665:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c90089-156b-4420-3610-08de17e0c692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hCrnMHYtZ9/mcAe6EoToW/4hKU2MXdBr1OeUVnndz8etExsAmCC9e79fcvgc?=
 =?us-ascii?Q?RpFXe0SEViTGTC+cMCtG5ZD/vMy1LxYlLZFF0JcPVOTm4vkV7C74e1eessSj?=
 =?us-ascii?Q?z7ABgvZSkolM8qjsFsQHItbrlgZ7GnYSNcfMWsdE/h0aFbQlnxVjHptd1oa1?=
 =?us-ascii?Q?sx1xDyccE58Br9FqsS0/vfnNrMammeOCuGFEZ0219n69K+rHTuY116j7dXL+?=
 =?us-ascii?Q?qlwf1O1io3Aupp8xVxE3pJPFMlLt7fr5oq3vwvXqhjTnoj6FX3cctwzLk7j6?=
 =?us-ascii?Q?lcwr4D3r+/ceohhKbTnKIz01t7obGtt/RaWmUTkcPCLt+2Dj7PmcWKhIHdUX?=
 =?us-ascii?Q?AkQUo477TqY3mUdEGSdwbPgToKQxFvOzrnfB0JITzASG30QpIBAD2Nx9Wy1u?=
 =?us-ascii?Q?GEKSlTX5ny2OKNcozWPHWNW1ASSuUSzVLT1V/4Q9HgGEZ6tpBGu0fPozgqyl?=
 =?us-ascii?Q?w5z7lSjqT8PfA0WNBJPF7SdBLr8TCjQ1YTUH5krX8MaDZigWf64EOu5xn5cG?=
 =?us-ascii?Q?Gp5lifH5TczUdUlqLBje22V4C9SV8fwy6khzTH6RgdeMWIXC4OcJDBGBGHPo?=
 =?us-ascii?Q?UVQymqRUmi1ZZ4CbbxzRFv9PRpEce1AoEgM9QyCTDX0Z24O98xwNzFkmnY6U?=
 =?us-ascii?Q?YnoOf92jultPdbXSz549ImyQ50sYsT5F8wUPddisGHgUwrDD2yRQIRUn12Ag?=
 =?us-ascii?Q?haIrDdvmLKDErvkOpwfliXvlYg1fpQ2KqYp0SDki4RiQk/StsEsYmW1kIY09?=
 =?us-ascii?Q?ZneW9zxz74ovjWsBBRhKp2NKdx5XlBEvRSlR2feuGj4pkUnG8rJMIUItfmAr?=
 =?us-ascii?Q?bzEa3bj0I726fvWoWQvlJC8ahLznscmwj6L8QFp/1MIuDw6rZLX9ve39ymdU?=
 =?us-ascii?Q?0uuY2k4DseZZ/TF2aXwpxbi/inA+pWzqSZ9sEyWwfL3hhzRt4b3wV0ThUGyj?=
 =?us-ascii?Q?2MYv+mwMyLgJfxruSzV0KUIT/MwK958kDHsI0HV+vhla2nylTzxZtvqWrvku?=
 =?us-ascii?Q?W0X6+q0nZwEOpJUOVdjl5EZLEL78m0XOK1KHrNqTfQHYxyWuctx0qx6qR9aW?=
 =?us-ascii?Q?QvwFP0WG50LPjt4OUW17BXgFeL0fpab1CEEq0a/PNsj16GL7pWAkd5bZsC/2?=
 =?us-ascii?Q?RYGa0pzCHfN43uW3omvkEsFI+jSSG9ph+aRPGYKi/okdVibd5owTwiW1+sQm?=
 =?us-ascii?Q?Ek4p8GsyWkV18lkzl6jImzIuVjuVNl5F/T9kJx7TmaELDQd8kdZxgyKDf0ku?=
 =?us-ascii?Q?AZGpZat2Iri75gYFg19tGRufP9lsCvE7shu2PUZTtbLHUbkVFdUSw/cS3Ja3?=
 =?us-ascii?Q?cCmSQl+MS/sFNp2KnIw2eyvIZnWRgr9PfkaWyickFKvzSsONp6I7ZMhlgibA?=
 =?us-ascii?Q?zSoou80ogPmtX2j/GlqCmvAMo91iD56FSweITTm0LjQOHwB1BfdYBDG1/rg7?=
 =?us-ascii?Q?RFzNxPt0uARYWFGarrQaIOOEArkXpZtt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sFdsaJWPqb1MkrrBJUOCGDtblW0F59nK2a1oU0Jo2dP3govQO4SBFGsbAPFN?=
 =?us-ascii?Q?EUrgYbu2nzvKJWLcdFX0SSOcCODkbhF4bs9lRxujjZwgrqekY9pTy40LaKvM?=
 =?us-ascii?Q?lLJAfLfV+Xe5eFT4ZXQG3V8IgGd+N28MGCbJwA39rIpc+8LUA7UTVCe2V4a4?=
 =?us-ascii?Q?Ygf1ipY3L9ca6xH+TeYZoXs1+UmDDLZfWSAGDQ/F1x3+OIO8FnAUa1lCyS64?=
 =?us-ascii?Q?0FZd77RPKfQS357VqmgLEmU4j/dLQXCICcL7VDfV3H7gHcXFv6jwnUlZWwtO?=
 =?us-ascii?Q?zrzJItb7dHd4yQDKgZkTYGpBhGGg2kFq4aW9Zzp5pZyd8WXia3EC1qQhKQk3?=
 =?us-ascii?Q?Sx+tyHIQhzaA5GD4P6kxIVVWeZpdXMfkfZ8PGxuVedSjItxkXRswaZfl7baD?=
 =?us-ascii?Q?po7hmR2wjIIyvZUeEzcQF2hPvkwSFJvh9Ua99VHVag3ITlbKM2WjiqScwu9r?=
 =?us-ascii?Q?6Rcvx96UsNdDo/kkId74rWsPTXxMUNb4olSU0otFh4FcHxyu7MXzGdmCMSx8?=
 =?us-ascii?Q?SLxI8E7fDkcevbQMChorXl5NkJyujQyDMpZFU55ornEKS+9DclXNmATxMIGA?=
 =?us-ascii?Q?/xBGl9/rxTGID8f1uuphvCNDtOmZpPHZrqySoqQv2DJZUwhF1sspF0K2NOtg?=
 =?us-ascii?Q?BALvXLanENexValdfwh1obRTRRar9YOKWumGMD/InqiyURMlVFYaplZt2eZE?=
 =?us-ascii?Q?Vr2gvvy8Ckz5ugawfKjo8+BhS7zwAgwNM3LoecuaIy/ilSKABAcqOzjVcmym?=
 =?us-ascii?Q?BtD3QQnlYq75Y/CE3jYBYdQQGnayJPBfllYvORAj/3USSZ1FQ6hGc/chgYFn?=
 =?us-ascii?Q?oFSbGnhllt6GnOhCjFGTi5Dl3Qgn5KdvvYdQwgc69P5Uj5imYDeabV1+8Go3?=
 =?us-ascii?Q?c/Z06cEzu4dVk1L/R+XyT5SMif5aILQRqS1/3/eN/dx36TxzYZXaPfvFLAfI?=
 =?us-ascii?Q?4l0Y7LBqZyMKeFuOtTtTIuYTFBeiiWd0jNihipdxVl9ENhs/N59qjdoovDEk?=
 =?us-ascii?Q?LaSfL9wYf2i6yGEmAuhTFuGw8L2MpsNJOrdHSfYZv+s0p7DXsvjQxX6qByfC?=
 =?us-ascii?Q?WbnLxxMpsOyUMQyXjsuroZK2bBCbbf/a+qoc/yIKsUYcD+0uPLDHZ9iNPCj0?=
 =?us-ascii?Q?nL10TzUGsbeha7fCwP/JhxhY1jcu27BQOlr+JtQ3AJ3jTN+IiyyW6fXVBK61?=
 =?us-ascii?Q?Yr/KWHykErj35fRZY0TKdr82RIa6qRF6ln6G0Ez+RM2kqijHLwo69y/541R6?=
 =?us-ascii?Q?OKt+WRyp0hsP2mANrNn9iO1IuwhNLSrzI6l8lMbkY6/G9gXxUt9b0rJaTJFt?=
 =?us-ascii?Q?TlB/4x/ovaaKPvo/yTllrzlKF9pDqGfc4T2+5B/1ADLOYvBfv4jSArPn36fh?=
 =?us-ascii?Q?gN0zOxPqnbXkFKszjGrf80uyrAzItkr/6fKkBDzZY0UIm0DWCHPufFkjBHjo?=
 =?us-ascii?Q?O8WNK4aHYdnVvFkF9JbvkMQ3WmNw45B+0K08bQ4UKk13o7SzZ5HQamEI6TRs?=
 =?us-ascii?Q?JKEcEi5gCd+W1FSXviexHzeXQqS8Ekv9O25aVH7wX3RozO4EeA71HEX4+9mh?=
 =?us-ascii?Q?derAzhyaVOpyjrC0H2+xuuwjNiaKbzhnhNUaJigKlvg6X3ZEP5vZxBK7qzTJ?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c90089-156b-4420-3610-08de17e0c692
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 18:18:50.8079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uHmxLm8+lAeWiS49yPM8/cYIM3FVghESKJA4REpQRKEjKWSEQWxpAeuqtXuOwPHHajcDVUjeLQLo8BudvlRdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8665
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

On Thu, Oct 30, 2025 at 04:57:51PM +0530, Raag Jadav wrote:
> CRI supports signalling the host through WAKE# pin on smbus alerts while
> in D3cold. Enable/disable this feature based on device/host configuration.

Could you please expand this explanation a bit further?
The doc you shared has the bit information, but it doesn't explain
what that has to do with the device_may_wakeup or device_can_wakeup.

I also don't understand the cases in which the can_wakeup will
be set to false and more specifically what does it have to do with the
ability of toggle of WAKE uppon host_i2c_alert.

Perhaps I need more coffee here today, but anyway I believe it should
be documented here for people like me on similar situation (needing more
coffee :))

oh, and more below...


> 
> v2: Make wakeup helper static, drop d3cold argument (Rodrigo)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  4 ++
>  drivers/gpu/drm/xe/xe_pcode_api.h    |  5 +++
>  drivers/gpu/drm/xe/xe_pm.c           | 66 ++++++++++++++++++++++++++++
>  3 files changed, 75 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index dc17f63f9353..1249ca50a65c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -517,6 +517,10 @@ struct xe_device {
>  		 * Default threshold value is 300mb.
>  		 */
>  		u32 vram_threshold;
> +
> +		/** @d3cold.wake: Indicates WAKE# capability of device */
> +		u32 wake;
> +
>  		/** @d3cold.lock: protect vram_threshold */
>  		struct mutex lock;
>  	} d3cold;
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 92bfcba51e19..3f8d43c1b4fe 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -50,6 +50,11 @@
>  #define	READ_PL_FROM_FW				0x1
>  #define	READ_PL_FROM_PCODE			0x0
>  
> +#define   PCODE_D3COLD_WAKE			0x5A
> +#define     READ_MODE				0x0
> +#define     WRITE_MODE				0x1
> +#define       I2C_WAKE_ENABLE			REG_BIT(1)
> +
>  #define   PCODE_LATE_BINDING			0x5C
>  #define     GET_CAPABILITY_STATUS		0x0
>  #define       V1_FAN_SUPPORTED			REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 7b089e6fb63f..04621bbd0b44 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -7,6 +7,8 @@
>  
>  #include <linux/fault-inject.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/string_choices.h>
>  #include <linux/suspend.h>
>  
>  #include <drm/drm_managed.h>
> @@ -22,6 +24,7 @@
>  #include "xe_i2c.h"
>  #include "xe_irq.h"
>  #include "xe_late_bind_fw.h"
> +#include "xe_pcode_api.h"
>  #include "xe_pcode.h"
>  #include "xe_pxp.h"
>  #include "xe_sriov_vf_ccs.h"
> @@ -161,6 +164,29 @@ static void xe_rpm_lockmap_release(const struct xe_device *xe)
>  			 &xe_pm_runtime_d3cold_map);
>  }
>  
> +static void xe_pm_set_wakeup(struct xe_device *xe)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_dev *root_pdev;
> +	bool wakeup;
> +	int ret;
> +
> +	/* Currently WAKE# is supported for I2C only */
> +	if (!REG_FIELD_GET(I2C_WAKE_ENABLE, xe->d3cold.wake))
> +		return;
> +
> +	root_pdev = pcie_find_root_port(pdev);
> +	wakeup = root_pdev && device_may_wakeup(&root_pdev->dev);
> +
> +	ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0),
> +			     wakeup ? xe->d3cold.wake : 0);
> +	if (ret)
> +		return;
> +
> +	drm_dbg(&xe->drm, "WAKE# %s\n", str_enabled_disabled(wakeup));
> +}
> +
>  /**
>   * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
>   * @xe: xe device instance
> @@ -205,6 +231,9 @@ int xe_pm_suspend(struct xe_device *xe)
>  
>  	xe_i2c_pm_suspend(xe);
>  
> +	/* Should be the last call in suspend path */

I don't believe this kind of comment is needed.
But also please explain why this is needed as the last call in the suspend
path, specially if no unset is done anywhere after the init...

> +	xe_pm_set_wakeup(xe);
> +
>  	drm_dbg(&xe->drm, "Device suspended\n");
>  	xe_pm_block_end_signalling();
>  
> @@ -422,6 +451,38 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
>  	return NOTIFY_DONE;
>  }
>  
> +static void xe_pm_wakeup_init(struct xe_device *xe)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_dev *root_pdev;
> +	u32 val = 0;
> +	int err;
> +
> +	if (xe->info.platform != XE_CRESCENTISLAND)
> +		return;
> +
> +	err = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0), &val, NULL);
> +	if (err || !val) {
> +		drm_dbg(&xe->drm, "WAKE# not supported by device\n");
> +		return;
> +	}
> +
> +	root_pdev = pcie_find_root_port(pdev);
> +	if (!root_pdev || !device_can_wakeup(&root_pdev->dev)) {
> +		drm_dbg(&xe->drm, "WAKE# not supported by host\n");
> +		goto out;
> +	}
> +
> +	if (!xe_i2c_present(xe))
> +		val &= ~I2C_WAKE_ENABLE;
> +
> +	xe->d3cold.wake = val;
> +	drm_dbg(&xe->drm, "WAKE# configuration 0x%08x\n", xe->d3cold.wake);
> +out:
> +	xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0), xe->d3cold.wake);

Why do we need to initialize this with 0? Why don't we need to reset to zero
upon resume?

> +}
> +
>  /**
>   * xe_pm_init - Initialize Xe Power Management
>   * @xe: xe device instance
> @@ -459,6 +520,7 @@ int xe_pm_init(struct xe_device *xe)
>  			goto err_unregister;
>  	}
>  
> +	xe_pm_wakeup_init(xe);
>  	xe_pm_runtime_init(xe);
>  	return 0;
>  
> @@ -602,6 +664,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  
>  	xe_i2c_pm_suspend(xe);
>  
> +	/* Should be the last call in suspend path */
> +	if (xe->d3cold.allowed)
> +		xe_pm_set_wakeup(xe);
> +
>  	xe_rpm_lockmap_release(xe);
>  	xe_pm_write_callback_task(xe, NULL);
>  	return 0;
> -- 
> 2.34.1
> 
