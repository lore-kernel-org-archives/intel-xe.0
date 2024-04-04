Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C534ECD1288
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 00:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AC911302D;
	Thu,  4 Apr 2024 00:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMcnikHO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAD411302D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 00:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712189207; x=1743725207;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ABnTH0Y/ZxgaCH5wmVK3OIHblHNTBel/MRcvaY5MqP8=;
 b=UMcnikHOUX8ojEzn3WZgPoV7jZEhv6j4OyfQTuAcTSmKcI8DnpIlqqhD
 yr4mSUUmFOqwIurNwFb0ZGiSmdK/W5nJuI1i9Ra+n/6A86eiXNk9H9Pp6
 8q+EqBrmDtYiaxONQaiSHUKc9VMcY+TFmbCa5JYJipC0Ojz3VhwyZRRKp
 uSiiUvSixC93jnCCAlCWlvYJ9PDprpxHMWf9/91sJ62FsLY7Ccv7ddvi2
 8PeeMod5jPiNqb4DyS1KZHvQHdqFdK6xFwDr1z+lZukMMS7x/6IjwJ042
 6d4gykK+46Wi25AcppETGBmRSInGqZdf8I70c6D0U6DL9n+0qUzjYJ0/D w==;
X-CSE-ConnectionGUID: uNnP6x/wStWuZeLzEJAlAA==
X-CSE-MsgGUID: lJW/s3SXQb2PdgU8pTAQaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11282914"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="11282914"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 17:06:46 -0700
X-CSE-ConnectionGUID: Ba5MLR6VSim0r+VXOfHFEg==
X-CSE-MsgGUID: 4jhu0WYgTsCcfeTzxvV04g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="41773090"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 17:06:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 17:06:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 17:06:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 17:06:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 17:06:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwjLzcyjsgZ9kUIECaHqgUzV/v4ohtLz+b0OCm0KHT4SoreL6anwWJBDj1M99lN+3NnoupOZJ41vMEi9VqCqpfqH3GGa5lMd5r1ppFA/db4vTJVu6rTJxVfMFCt6Of1AqFxGfE6SqlE4UE3OEaClTMDci63NN21uGjg9W4zdrrliDXjJlzTdxqP6Hp8IZYR23VR2ONDKBgjZbGwFSFA6Mg+P5agZ4isUk3jCfI3Cyzv2r50hahnU3YvbVQHNPkjFMkeOKZA4yYD6A4cXORYYnF4++QL/NzEIi/szZneGvLDBFg3QephrOuYG62rIr+t8dZR7YPsM4CL699r6MZQcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KboyUh3Ri4qzP40oGGMpr+JynTZgisVRR1cfhQ8G0qU=;
 b=og94LL28TR52LtIEsnjSsp1VjVbxUss7NrNO7yPMZ8wNgSxeyz+lVbpbAgidm+E6N5VK22XKog/sxALEAKANCrZjVNqea6B6klGK6xslBFut5qvZU9tnBY0sQ2deD+7rV1MASjorYXiRSWKAXlubRRSbZ5aIuaeJSHsWdN1Q/uLsXpnXGfO6dToUvcQcTFbi8xtHHejfiNly9jh/qDuTYFZCxDQqkZWVBGLCelPpFtHzoXTf40DkMR87lK7IzFHglqH2iPZJZE9hYmzUKwaDlNc+DGYIKvnH8FXtbO+GfCk8s5W1soi6edge1CrqSacqRVsQxAsllqLB6K6ao2OMdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 00:06:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 00:06:40 +0000
Date: Wed, 3 Apr 2024 17:06:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 08/11] drm/xe/xe2hpg: Limit chunk size to 4MiB for vram
Message-ID: <20240404000638.GU6571@mdroper-desk1.amr.corp.intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-9-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240402124724.1238122-9-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR07CA0082.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6067:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kbcql4q43xMNlNbXMmeJT24VHfPKTFk6pskvIBpee5rCxTaZmZlXTJ0Tuaz52MPdFBsz7yw/pEvEOpO9bV0lLV2teLrIgbfMZ87vo/Em0AbEjl4ATEcm+IvGcI3XnsQVqKhYVJB1B080yeI1T9fwzdtR/W5tDC5WSucv22kZb3Ll+SAlQw4lHRb6AwMYPMaqU6O17VDD0h2XCg6bVFkano6grkcySWaXT1YqnQR7lXbiKPYlrv1nJCbIxtX4xRZKRKUxWvj7TkgQvKMTyzt2FuNrdEA9BbZTOzN6o0MLw4DBRxZbGy7Vg+D/ZsHghaPYLqEM0xoOset0J4Fx485Z5FWV+rD84r3TAaDc0v7bJWXFcJKjbtoLf8ISCZJ68NMkLhv7CUVm8PB97qWKQxd0edyhro/FGuEHOOh8G9c5f++fyJ6Atfxl14536IU6rxXYxWW2mogWFRwhj2ZaAUP1YMqkOxgXhbckxfjRoLwj2U/DeAO1b0JYRkJsuJY+trcpwgjypH0MmpSbNVb2y7oQdH/7X9AX/RNCKqFtCIADemSHwwEtKGwiyjtJbdok3x+eER7CaVPiPSBPz9NV+HgTRhmhMrcDP0y3acSD9v1ghkMfmeGFktS9CV+4WlwRx4qmzfm1S6hetMY68qsIGzZoIz11ZIoxr+kKQUy5CboY/q0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x8Ytd6xeCvxbwjTCV+pOpXxig6W5AqAxO5ndYq/2fPJxyBRRnTnjXF5FmRwH?=
 =?us-ascii?Q?l++2a45du+rr90QRZV0o719SM/+K5RqSG8p1SYvJyI9QyGLUYV2r2iBYSUZ3?=
 =?us-ascii?Q?tsAadbr9e6WvOKuxDfds4cR61Nbowu03iKVAMRmutxNh4Cu3FU0nAD9kcmIQ?=
 =?us-ascii?Q?itxc4aYD3uRXOHxlhIPSp3T+50v9QOmg7fZKXRc2h28UJbUBHkhjWw5DO8EB?=
 =?us-ascii?Q?g4rXqslcuPb3M+/PcOxlwsoi03dc3UYS/H/Cs+xCD+fESJoIBGWcvouIMCak?=
 =?us-ascii?Q?Voh5L3MUt3oB3LunuY2G5j57n8LTSz+218s685JAZGXJusPh7gpDh+KDRTUT?=
 =?us-ascii?Q?rFviXVjZg0AR3FCrKRzvBlcOOBJPwV4SV/o+45nBIfhWFL/Xw5rkrw1MjVWL?=
 =?us-ascii?Q?P6KmxVjDN74W3lDJ0gImMwR53gXpJN8iBNzOCFDNwJl4iqivZi/O2qjnjdWa?=
 =?us-ascii?Q?2Z3ZtM74kK0Xb0GUBzR1MWSPGnnlIaT2lr7trjCWXAbgoNy0nWo3GLMH/TzG?=
 =?us-ascii?Q?W+t9LrjX800AXXcjC5TRHfwUhzb/aKXTJKI+T1MQCQhICn+TQ6w2ETpwJh18?=
 =?us-ascii?Q?AkhsI31U4OVPl6yB9CAf32XhDs7TDJtEEhAqN1fBTWG707msmuzi2tyPb9UZ?=
 =?us-ascii?Q?Dkwg0hQL4emW7zWCpqA+/J3D1nRqqmmtvULmjheGmmF72EcIRb5xNd5+q+sP?=
 =?us-ascii?Q?r1DR2N6X+y1Q95LIthjQQ+YEHgyNNi7NUbzQlyUTiaL8M+BW985gM21jh8ge?=
 =?us-ascii?Q?ejLfpKXKq98+WgeuK3Y+5Arq0bFG86iBuQVYDuxnArjoGp6yDyMP42EeD3Yz?=
 =?us-ascii?Q?Z1W4GrqbPHolu/jkruTka2ZDhpFtZ+shkZvn7gdwu8SpSFamsQzQYG/g2jA3?=
 =?us-ascii?Q?Am1PYolH16b6f6d8JUvTNx1aJ+67n8BBIPFcOYv1S898KAZxMh2Kzw5euqpt?=
 =?us-ascii?Q?VyzBkLCm7iSj4vmJmXyAAsdT+RnDQAdegJU7SzlYGEr3BkX0d4jhIVv/iKOb?=
 =?us-ascii?Q?wTDUAHvixxpR+BOVnO+dhzGawK5y92enWUvhtwQnsFHozhqRTW6kTRCEKQox?=
 =?us-ascii?Q?Z8DHwC0cr3kaN3QoidoUVWeeUBuhSezV9tHMrm9QiVxvFaSyAd0yazyzjAgr?=
 =?us-ascii?Q?DWpT/bIsRAS2iCrz+cP86NogwQyCmrhDQUjtVsPXtcQbkr0Jyr4bpZ/07r2l?=
 =?us-ascii?Q?0DqJlx8mZ5BW1xnycFv3chBPY26ufgF7rkEoHHGLTFFfFsv/mYimSmEDU+I6?=
 =?us-ascii?Q?ItIu3SDe4gGF0zKlaeSgWyDX/tjhgbFsH7nh9tlaxPUgtJg0OIFvuFdtA++V?=
 =?us-ascii?Q?NQGv+QbP5Z7oOpqQJ/FCZLyNRQ5doTXu4XhwE3WmlZifELjYLVulG+s/mjCp?=
 =?us-ascii?Q?BiJ/d14aPMsKOUL7SaFFm9nwHqwdQcM1fDEBMl1F5bEv67SwXjb1riXyAD4T?=
 =?us-ascii?Q?ETohNNf9+WgLgcjFLbdhmerU8fFlFYUaTkeAIm3Lvv8av/eYGsLHJUgIZuqb?=
 =?us-ascii?Q?pFJSj+lMi8T2H6R9Dc7r0y9dOhHCXDSOUVOaxNgK0vzX2YZIyykdnGQXqG9i?=
 =?us-ascii?Q?vw/4o81CLy8BlEhkXLpigCs2zl2pXlRz3XFwu+SclcHsTIlv1kpThNY3Y+7K?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2693278c-9f7b-4670-e4f1-08dc543b1a5f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 00:06:40.3412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIVi2ybGgpRp5LDKXRZqAbeB7ckyReKxlOQiUiGHCUS2zV9u86nkjTZlwvk2XD9hH06/gQ5GJr/qbLwhvRXzhp9NXhl4S/1jZyHjaAcznCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6067
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

On Tue, Apr 02, 2024 at 06:17:21PM +0530, Balasubramani Vivekanandan wrote:
> From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> 
> Currently, The maximum chunk size for vram copy is 8 MiB, which means
> flat ccs copy would be able handle 8 MiB/(page_sizes).  Since page size
> for vram is 4k the value will be 2048 pages which won't fit in 10
> bitspace.
> 
> Therefore we need to limit chunk size to 4MiB the way it is for LNL.

I found this explanation a bit hard to follow, you might want to clarify
that it's the XY_CTRL_SURF_COPY_BLT instruction specifically that drives
this limit.  I.e., the change on Xe2 is that the size provided to that
instruction now represents one less than the number of 4K pages of the
main surface for which CCS data needs to be copied.  Since that field is
10-bits, we can only copy CCS data that corresponds to 1024 * 4k.

Although now I'm wondering when we actually wind up needing to copy CCS
data directly on Xe2?  With compression controlled by PAT bits in the
PTE, doesn't the writing of the FlatCCS metadata happen automatically on
all main surface copies (both for compressed and non-compressed
surfaces)?


Matt

> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ee1bb938c493..07a09649787d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -407,7 +407,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  
>  static u64 max_mem_transfer_per_pass(struct xe_device *xe)
>  {
> -	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
> +	if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe))
>  		return MAX_CCS_LIMITED_TRANSFER;
>  
>  	return MAX_PREEMPTDISABLE_TRANSFER;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
