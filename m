Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460C5C8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 12:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AA610E18E;
	Tue,  8 Jul 2025 12:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9LYM8fV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7090A10E18E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 12:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751978859; x=1783514859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6Wf5aWy0ft8ZEiQVCwDP7t5yVj6uqT051jkptEbCsyk=;
 b=V9LYM8fVQOBW37lUmfKb6qplbxmm7+NWgyfZuxMwYA/nsSBlCncqcDGh
 gsM9mBowBnlOK1jcNcVsmkeCXZ8z1KTErVHfDQAiKh2jCgivsOEDs9lGc
 NtUFmZzcDomERn/7RZKTgcBZ0zkNQjIHbadcIoGJe01o0tCy5+9X0Rt0S
 QKhK2zcmD8blRSJs6sKHck85h8kh/LWzVfg/P7iVXlcfrS2wZ7jrFWsDg
 UCUmLjFBNEWhzqEHLE+BZp5Tml9x55vLAg37IFVh+caVdkHS70gLK104F
 tsEoirH2Q8ABZgd9wgdI0kbbonHFVwzZE0lbsdZEGRJW/xqpa+xkRSdvF Q==;
X-CSE-ConnectionGUID: OuCJpwaqSTibk6NVlbet3Q==
X-CSE-MsgGUID: +NF/5zvNSGSCOc5iJfshqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54310926"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="54310926"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 05:47:39 -0700
X-CSE-ConnectionGUID: 0mKYju8ARiWzoMwN9ehgFg==
X-CSE-MsgGUID: DW7XOSUqRm2HetyPvRd4jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="155617215"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 05:47:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 05:47:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 05:47:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.82) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 05:47:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSy8dk+jraUGpvHWUzNq5M21SR2XHVCoiKi1YIGj2UQ7DBlbgKecsJL+6EqTwzK3ViNKltDqJbsKv3vxKR4xLu48etA5URgyxwqmNcANn2lFFzYg54UxKSCPFc2swEzB2a713E4NaiN5e5h7Y5jfeFIk+/Rxyy2NHZka40E/M9ErDcda+STet4qKKmxtUygrnDY1oyyLf0utIWva09Q+UEvOQHEOSnfpmDXthN0HDvZpEnaMf1sgWoqWh7yxXAsqO4bkDKd+ETrqwD+V2UQ4mORJ4uy939gkFX4P1TlAOA/3EK4CvVvWqHtLRakTVELu17FHi4cOWe4NqXT8mZR4WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrs1sDrAQQZkUUbU6vlCjqJbj+UUFsLBTBpuqZPx83k=;
 b=wLiUFyMOiyWtscXu1MsQlCN/JnAMt9oTirmpUVzEp4Yh3IO76imwFK0688BQZgBCccm8M+odyaKSFJWmv5dyTfoQ9iDfZDJUCbWrVsjIr0Iq2ShHeawizm7DMeNHLayrBmqyBfAJAhFcFiq3oP6AN4rZLGQphhn4G/vdXy7/jF4YnwAbj9488Ry64V2O1194OlSK+nqxA9H7SwFtI0aETw4G3jjEe/OxCJ6WRKqI9dVRBOOHiKC9XfbZ21VQxN+re0CCD+ZwiGZQVmhqLD2z14RJsr7tePXSrD4vXrbPgWxilZ0ZjOXJ6yxIullXwTVWYOHc2B+shVLwPoO6wuoc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6970.namprd11.prod.outlook.com (2603:10b6:806:2aa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 8 Jul
 2025 12:47:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 12:47:08 +0000
Date: Tue, 8 Jul 2025 07:46:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 5/7] drm/xe/lrc: Remove leftover TODO
Message-ID: <wdunpn5q67z5umyawciqmvahjoolzqwneqwqotwflvn6t34tfs@ojv63hjxpqcs>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-5-6aa22f174041@intel.com>
 <aGyn0RFgRICZAeM8@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aGyn0RFgRICZAeM8@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: bec46cf7-3693-4a02-a700-08ddbe1d8c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XOzbTRGeVCxe27fMa9rDT5KQaUCK594Ct7k3xDsVvPB1MHKbeXKJQ2EtMF5C?=
 =?us-ascii?Q?Pt+9bTqN6Z+jCLeHxrQHSwLOBiSFFMfTOwcpLF7I6esf84pwCfG4QjJKZ66M?=
 =?us-ascii?Q?PlII4Rtex2P1anwzhNFaKQmiCvP71wWwBqdg+7BBRPrTz/Ablz+RZsPCJC+F?=
 =?us-ascii?Q?IOsGgGyqGatp6GlErwLawrImyk7OYp/e5LJgouv4vE7/IikMgkZoHFnQ80OF?=
 =?us-ascii?Q?qUWBpWdYFOFRYRZfktgOV64VFvTdYGXmmVy8fl3OqQFh0fnsU3aILwo7ELLd?=
 =?us-ascii?Q?UA2IllDbOF+FpJJpAd24iAa55mVrPcf2F9wnP93FnzDKQ8JEsgLd01+C8Zsp?=
 =?us-ascii?Q?DzMObDkm05+vdwdTvlQp4dIHX9OZA+IIKerjru2hO2N8wyMx9tb11+AiuRNR?=
 =?us-ascii?Q?ZGW4olysPBXglngKMq0zBTeiDpU/ppADh7bEbWhIyBc+U6w54dzRlin3wQRL?=
 =?us-ascii?Q?UUxEaq4i4zh7FhC7Na5HcpJO1cUYyRKW9iylMKQx+6cAlTAIXFRvjqGL9/dn?=
 =?us-ascii?Q?L6GWdaWVrQP8mka4q3P9WOcPthKgZONjkVMxrELTL8Es9UURNvVw3CK0bCrs?=
 =?us-ascii?Q?PnwRJ0He8/481d/oYeSXCmuVxFrwt1joDbGF/vEtaS+hId5LHplNsWk4JuXI?=
 =?us-ascii?Q?8Zdsx1R3Xps9kakkMjcDSQU9Mu/5uop4g2RHgMCcI01aPYRZZPqN1mB2ZH8s?=
 =?us-ascii?Q?NF5YIM049rmadXCu3/33Fm6PsLgbHLJc4TVCVbUi42Ei+eBRfe4SxvIvWuMC?=
 =?us-ascii?Q?A6FqQ+6Z7RbilYOW+67PIEXR2eE2LisxhAzyfrkiYqagc+6FdxEc6cf6zix4?=
 =?us-ascii?Q?ax8jTZkbuG0K6Gm4NDJ5i673qY3kZJ8Drh8IvVGP+gxDyaVilu/0iS2Xz+aE?=
 =?us-ascii?Q?r4k1aHTqlAWMcKAJj4ccMpN7zzCZGlCWLgAOByL/WmQQEtI81Nae8IDGTWQ8?=
 =?us-ascii?Q?CxZgBeNQGlgWhQXMgt55T4D451Sh03tpwPfPSds3a5cVjbBlHAilEcPwYh/U?=
 =?us-ascii?Q?aODTwUzyd9wTAaljmpjNazCVUJ3YxO/s2FmioNCSvCpZqxYxFmtAZB+K0Hfg?=
 =?us-ascii?Q?mT/FKW0Kw3Rtdc1tJUsLBGuLDrp9vii4ABeVNTkGElyjSyr+m+prSa09TdOx?=
 =?us-ascii?Q?lOJyElyiFmDsg7rQYk8hV59r1c9DR3SLYVum9dePiQ5COUJmXcg7A2gZkS8y?=
 =?us-ascii?Q?QZLdoZUEXQB78C8vN73SCkUMy8NL+VQmA86xiiNYJeQ/DTc+h9kMklXtZ2QG?=
 =?us-ascii?Q?eLJsAzfudy8sarJO9mAYmCMsUjuM7L37JdinYdbW4Ffj2mj6yLgCpEcqGj4t?=
 =?us-ascii?Q?dBoAQ+xofvm3/r4EL6aMS6DxsbxyrvrH87hGNuFU8kw1wCgtuUyq+otJkFw2?=
 =?us-ascii?Q?8bz6tZ+FZiciqjpN225corTQQY4YV2u8de6iFJ4FKSkALgjBcSSwHX/lxZ8S?=
 =?us-ascii?Q?X5zMccZ8Svg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+JloLtZLu6WMkg0iKxlTLfwfwRatW4sNFuHma2NEmC49gDO2xUtGnX8EyDwh?=
 =?us-ascii?Q?yBoA5LtkNSFliFNrFhnrIfD8+xGvKL6ym5Q47ZPExYEuQotxfR+fODzJrPpI?=
 =?us-ascii?Q?VRG1n+EOe9Q4qHZPd1gWqhs/TciGH9fe3GOJERGEZ0MY85mPfNgJ43n4g39C?=
 =?us-ascii?Q?BNB+gouSJjERbPUkCWnCen7MNjcK3/hg+mpPfqGfyWl1NHRw8Px7i1XI9O2Y?=
 =?us-ascii?Q?Fw6Eq7u9g1yTfQLFa/97pml1RZzIzySxFZDNav0HstWSt9dnLk685bS5biRD?=
 =?us-ascii?Q?oC0examQxXYD3O4gtXsk7eQRNprKRrRid/N141zBiUmwUuuVPaorAscUpHa7?=
 =?us-ascii?Q?3lWe3oc2jBW8YOc6ccFY3q8d+BxeuR1imva0B/cLlFxnb9AHX9um3idi1N7k?=
 =?us-ascii?Q?HY/cIUaOgUWvmK5FB6JRdsxTDUb5KHkI41IOooaQnYcEnCmVy5aKqy0LkkQX?=
 =?us-ascii?Q?p9cvZpUEln/BV2IG6DJGiEocNR1Mf7+F4m/r+HKskp0N4SmmKjfxFAQwot4W?=
 =?us-ascii?Q?z8BIxjpQYhRs9MSIeiHQ4K5dynMu0MBMMkZZvh+WCB7gKWYzKL/d7cUA2Xfa?=
 =?us-ascii?Q?xVl0YdozuY1dfrFUzu/tFIoYfxhWr1XbbcFia/992utchkMsWFlIgeqNpuCb?=
 =?us-ascii?Q?+PWyWB9wXjtD4u1Kw04wFTT5bB3gsCFj4R8ILR7EYi7X6bWAoeO8A242oM5M?=
 =?us-ascii?Q?Lj6ftrM4sSAGrto9nHZJIGiWGLTfcPzrtXxeRy6VIBupdalwbFOTZwXCZPk3?=
 =?us-ascii?Q?uaa458F+APFE9W/N23An9VESDk4/slk8ansjCZpVtKt/1qwufVKViv1dLHIZ?=
 =?us-ascii?Q?mmKStncUJJ/TsjfzajQ47NlIzz1TUsItsDwxG7bPRZj568ZnYl1r9QTfPrJv?=
 =?us-ascii?Q?uPTFd5Ja7JCR3VkifWciM2K/2vT2gKnui66oh70L1W48rDJV61QvYrLbbdQ9?=
 =?us-ascii?Q?PHq5OpfLXxVZsgF8XWEkp4aSG+8q2PUzRscflvzVumewlVc00YZSJ76AlcD7?=
 =?us-ascii?Q?enQCuZMuBJCDxXg7Z/aJJnKJe3/jz4y3xRZf/N3CmCCn/09tB0J5Fdbr4Hp6?=
 =?us-ascii?Q?Y+J94kUihyejN3hFYaQu+grOwv5lY6ThMPfPB5XGsA/lF1LYj9yqkRwK5LdI?=
 =?us-ascii?Q?+YB7Jvfu7xpdMZFCWsd2emlApaika9+e2VMwRhunFD9/1eZdMGgl2YF+saMC?=
 =?us-ascii?Q?0Jf7FieRIpOtEY5+Ux6JI1C7W08xyrTD4Nm/dhaAqd5Sr2Za+ukGQPIoS7Pi?=
 =?us-ascii?Q?PRIpfXOBkGZxtPFT4A0ahrAImGV4jyoxpgAtmH24y/3gKVEVHddMYIFL4F4M?=
 =?us-ascii?Q?WILCfWADjqcqbjPs+2zq/ugqy1d10doH4z7XYu7G2FlEj+xK5nL/N1182/2E?=
 =?us-ascii?Q?Ps7tadYuHd+GLAykm6gF7z2Im36suBuxMT4yFsBlWCcoi7KhbUoroyEtv/CZ?=
 =?us-ascii?Q?l4Jb5J1VcT5pd99TRZpykEjQAraho+khvtkl/ehz85EruFp5trdTj7EeXIfg?=
 =?us-ascii?Q?RBa2W4xmLcki4iu2tgFILmmUpjrBzuVHuNn4jJdSb/FgGdHbhnmRaKLjWpaQ?=
 =?us-ascii?Q?MN48kOMC850f4LMANQXkYe1OHKHLvbPnNl2Gytpnop1TDLGtSbVCrH9pahfO?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bec46cf7-3693-4a02-a700-08ddbe1d8c5c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 12:47:07.6563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGTvf5vDEPuleLYs/034HDjq/HiCWXxLZfS+8F0Ky6mD1ImXXKUqSycdayBsM7JsVXzpbseHljZCRtv3I6rrbJEZpqR0ufB5r6iUh1Ke99I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6970
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

On Mon, Jul 07, 2025 at 10:08:33PM -0700, Matthew Brost wrote:
>On Thu, Jul 03, 2025 at 03:41:14PM -0700, Lucas De Marchi wrote:
>> There isn't anything to set for CTX_TIMESTAMP handling in the empty
>> LRC, that is set on every LRC init since it should always start from 0
>> rather than the value saved in the image after first submission.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_lrc.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 75f4678cb090a..2c735b3679f86 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -603,8 +603,6 @@ static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
>>  	if (xe_gt_has_indirect_ring_state(hwe->gt))
>>  		regs[CTX_CONTEXT_CONTROL] |=
>>  			_MASKED_BIT_ENABLE(CTX_CTRL_INDIRECT_RING_STATE_ENABLE);
>> -
>> -	/* TODO: Timestamp */
>
>While we are here, we can also remove this one:
>
>1066         /*
>1067          * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
>1068          * via VM bind calls.
>1069          */
>
>This was from very early in Xe when we thought we'd maybe not pin kernel
>BOs, I don't think we'd ever not pin them. Also the comment actually
>doesn't make sense either, as GGTT mapping have nothing to do with VM
>bind.
>
>Anyways this patch LGTM:
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>

I will add this comment removal and keep the r-b. Thanks.

Lucas De Marchi

>
>>  }
>>
>>  static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
>>
>> --
>> 2.49.0
>>
