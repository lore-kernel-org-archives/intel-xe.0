Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118EDC27C79
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 18:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43D610ED94;
	Wed, 19 Jun 2024 18:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMoqXTnP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE2510ED94
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 18:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718823231; x=1750359231;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5i65yiMQ99M/oajCDrLDhlIOM2oV4q0KOXn+eNBKc6U=;
 b=GMoqXTnPkdVDlszEU1c5cKzOPaFjlHeboYXpJDfHmNZ5ighMzfvp8gLL
 sG/BQB2eu8UdMypYHEvOgcikckRCBRjr2hj/ero6xvb4quDVqEechVAly
 X52vKrUVaayK2YhuZZH+OGBhfRxlarcAmj558CvTzRF9bH5WrIc/gNwXd
 CZaYW4XaMhZRHbb+4gsH1vhvG/rEhJbl6ziXKBROtIPgJoBCHqWNaKCAH
 JDYBxIapYSeGPVzywzCvk/xu0eXCSLbaLhZmixMawVklXt1SlPXGkE/rg
 C+NV9LZ/FmHpShtecH8ibW1UowJnlKJcQJTNc1gquoIUz0/xilfQBSHEm g==;
X-CSE-ConnectionGUID: akExEuROTTONusG+BuOSQQ==
X-CSE-MsgGUID: nu+Rp/dEQ3uXufaNmAEBCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="12152157"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="12152157"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 11:53:50 -0700
X-CSE-ConnectionGUID: 9wAShXxlQE6IlSyEmFRzZw==
X-CSE-MsgGUID: iamDE5KkTWmBOjEJQan8+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="46527675"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 11:53:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 11:53:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 11:53:49 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 11:53:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bP3zDEopMsQpQLChg/MmxgcEHzUllgpEHrfOIpaM8aItc1Y5XGbMovMPZ5SAnFaHYRn57/O8mkotHbjm85pE52dziQxoqNCWUHBPIHE+coCSaMzjiEuvYoNDUUCZPeor/Wi263fqW0SKBXJ4esgKxnJhgFLr7CkAp0xxDtgxp8ux5jaIZ41CMJotYZojIjX51EUI5ecbwxxN5X+h6Bi5bS5Kqoe5LrQu2vVcwKmWPS0+WoxzUoEJ88CIZNGQTb//HP6Pnf+qPN7RWiZgGxBImg9cZ4/tqha3nHK/ojaTF6Hyoh/eWEjHeD+Xd/a1wG//9t9cwo7YbNwu6DtR/8W0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgAARCLuQvgA45VjAcsyiFmphm1HfjRKGN+IhsrHuFM=;
 b=biYabjdAR7R9YjrPmtqMv5INP/qCArmD+FHpWu2TrQ3Fqb6/X2KW9/Y4IO4KH+tRywr4Z6DhlZeFOUxEuP2R+hb5NJKqB0AGiDm0FhdibjGom4yqSaSWGNELvDTocRaFQcrpgc0CYMuxwH6rIzeXxkv1bJpDzzshhDyT3ZtjoKDYrp+wBhSE4D+4y1zoFVqKzk6yPvblJs2wPYpCelbsllQP+CS5qKkNNdRrYvF/HCAb+zrfgEz48Q+njp4X3LGZUNoWvFMuwJhXT/BJTclCw10hSu0TBeNb6lQybjRPBzrvNKk/i8hM9qyCCdoh4LTOUURC9UrN99ZeftwRAxxTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV2PR11MB5976.namprd11.prod.outlook.com (2603:10b6:408:17c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 18:53:46 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 18:53:46 +0000
Date: Wed, 19 Jun 2024 14:53:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/2] drm/xe/lnl: Apply Wa_22019338487
Message-ID: <ZnMpNOooDy4OsMki@intel.com>
References: <20240619012617.3756043-1-vinay.belgaumkar@intel.com>
 <20240619012617.3756043-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240619012617.3756043-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:a03:54::20) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV2PR11MB5976:EE_
X-MS-Office365-Filtering-Correlation-Id: e8100992-41fd-4f3e-96ea-08dc90912628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cI1E5JokI/LQqW6w/Bi50n+t+meKEDuzhFHd/fPR/RWcIZv/nk6HZIJYMzaJ?=
 =?us-ascii?Q?zwhr440ux7VlvmKeVX+kVVJUo2lGhgSQxSa1RR9V5BbKv0n6egWpumJgWalC?=
 =?us-ascii?Q?VW86uZu0gILIat5Lr9xBnx0KFyXdo98yOtRc+6cQf/N/55AOIRVU9Atrc4HH?=
 =?us-ascii?Q?l3Tjv19XkWLk7ULx8KlPltKOuIA7xUxHseq9WkhOkF3TLZp3izllgpKjG2GU?=
 =?us-ascii?Q?bBE9f8V/vf/aksBOeU1Omca1hg9NPxIK0Eq3YAaSZnjAheCKGJEL4+hy6JRi?=
 =?us-ascii?Q?SdqyjI3zniFTSH9A0Q0PPln4GzXVRwwli+e49kBo8rfskjL58Pn33C3J7pyY?=
 =?us-ascii?Q?kZ77t0/jSMhcGczczoy+D+e1HxjTbmmFAbmBW4ZrVqAqk3+MBP+j/b+ChQRd?=
 =?us-ascii?Q?kxqWCdIFIFXxi5LoTyKx2vnLQGBhCOsahftrueGEBx6+1rdpWPZBVcILqsQv?=
 =?us-ascii?Q?tOn/lkLv9yfJf40KeVRSw8zsg1TbBc6YYkR4uIomXW+DrW4YR30qmnrLb1pj?=
 =?us-ascii?Q?6YTCj1JuNVIrM05OkJaDoxx0qtbZ8f7dZr42+yi+Gsk3HNQkzoZu1sefqzob?=
 =?us-ascii?Q?Iul+mphq8AamgJlXK/a/sZLakF02h2s6EW78ywx0ohwEoShPrRLZYaryEBGT?=
 =?us-ascii?Q?O72c6r7d3L8hV9JFI0pu+yDkt5tg1xO2Dwqe968k9LVTaF5ScaYx1xBngR+L?=
 =?us-ascii?Q?XS5ux6XrjSDbZYN5jeyWR1EFf2TLHzVeWG/yzXEY5FGhrf4YzX+DhXVP8bK0?=
 =?us-ascii?Q?Jf9i03J8Pg15TEmWv+aqRMG4VUwu2kiX57Fs2a3HO6yBi9ODo34QhhSrVQkv?=
 =?us-ascii?Q?JNZUhuVKO2x9gg5t5HEdEecudxkoLFTo2Cx+0FiJnmfjUEQXvkKjdolScLRC?=
 =?us-ascii?Q?mCGV9XBfLgolPw8iVW14YdCpMuc8bXvUi3RmEX3C8wCVBg1IghbfO4tV/J1a?=
 =?us-ascii?Q?ELzUf2b1ryWTbXOLsi5c7VKZ/VOOvd1UVxJmmw6W/Jc+91oCaJt1dotgOR3T?=
 =?us-ascii?Q?udJL12dgCDe23DV14aF339RTde/frov8quexhk2Qej+bU5627zD4goQYNDhK?=
 =?us-ascii?Q?IKuuom/IxTjlyJOenU8xQxwjAGcI7426JaFndCpUOX0KTLS8drIYXyw7+RkR?=
 =?us-ascii?Q?GpNa9m3akFNEgDBHcuSKh8sx9tAsBFIW/jBus3Df5FFEO1U6xradpf7qjvrz?=
 =?us-ascii?Q?PDpXCyoZ7YTMVfqbQoNMDl7oibWWy2zlmFn2wh5j3tBB/Q/+EeQquVQ8gXMk?=
 =?us-ascii?Q?knkBXwLsq53OVMbsxxZxuhfdus9AQlVKNBxwWwJygs1irdOmpjXImZ/KXwNP?=
 =?us-ascii?Q?Djgw5DNGxqVVGsJr1hg55+6D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mPZzJJNbHAzllmrv4pbiAXP/FHFu9J5IAqD8GJsGgDf1MgykMsoLIcVSGGIc?=
 =?us-ascii?Q?Erpnq5RUgoipX+uA0UveJZQz8EchcHTbKYkpJ4Qduu5ReO/ctWbuUEpF+qvF?=
 =?us-ascii?Q?EpCu2TTYKFKDK8So3NeIyeYKIwQvmhpHjlzwhWFdJAsM/3ypX66XEC5RYN6y?=
 =?us-ascii?Q?1CpLs8a75VATU+whRQjvT2i0EJS5aYM+LCrAuOAozZLsp3ocw5devveZmG+l?=
 =?us-ascii?Q?QMRCHdxMx1bQMk43nSQUQG0DyzTOPvbquNmOhBIzVB+E5saltUnPYieYaX0D?=
 =?us-ascii?Q?3hs8inl857l+siggSbru+fRT21aqsgpcmBc+3lI4NTPqMuqBkEmD+0aguHZS?=
 =?us-ascii?Q?M2OhUKWo60wkKuSAdeo1MWBMzvzbJv274W5c5mazmZwf0rXC06omlE9htLaZ?=
 =?us-ascii?Q?QyTs3AuFkYX77rKIhSgxsq7oLTcKBhFD7Ifc8hJhSmGoXDBH/hhA3N77Z/PG?=
 =?us-ascii?Q?oTR6VxwCyH6C7eS6Vbr6aW2hW4ZACjxtl5wuv5J8YOssQNwCByTM9nCW6xPE?=
 =?us-ascii?Q?/uu4LEvif360eX5OSMMQSLkT8ESGRineKktp10/jj5N6wbPb3OQ1AzXiYNKO?=
 =?us-ascii?Q?RgSKz35Uykci1/nLCAMs6loYZD/mxsSCtw+gFFmF34DUqusvRF4l5u6knx7R?=
 =?us-ascii?Q?+ixy8BQEuMIMoF/GZZDh5Wwza7vxI6kQHwrOI9fjOdZM89pvZQnlf82JkUOF?=
 =?us-ascii?Q?hrwNYuypzSjSRWNf2MXHqPU8g1xpVnpUPo4u9iQRDPUCBTKLpkTczhmUHgGd?=
 =?us-ascii?Q?Y7t7v4hCxStCvy4Mp1i6QM1+kVK9UuIknmIvZgjwpMvM5RUln3C+F4p3XhWe?=
 =?us-ascii?Q?QxcTVnQe6FNcWW5liB+hi2YsbC2nx0O1W4mtPw48W6DarUMCvJ9+mNJ/GNwx?=
 =?us-ascii?Q?CDebu9131Rn6ig5JQEy8H1vvp4FyrZX1hIMWv37PVDlpoi3qDW+WnMbBLENX?=
 =?us-ascii?Q?6G5JHwcr0tgCBNMBNrxP4PowrxfwtMiVwB3JWhbGI0j2YarNPdYi/Id+mnng?=
 =?us-ascii?Q?oNQFvpa/2ZHV5xXpjWp93Zq52HnfnLMWVHER+ueCpG3zwNDcP4PJWXZbVo3i?=
 =?us-ascii?Q?clsh1uEmqCGTP9dkE6H8vbAiwiG7bn/v6DAgTdC1qfpdNd1C1qWX34NyqPeF?=
 =?us-ascii?Q?aV7zcBCQDFXGb1asXOcOWhNyX2QNOdWJMl+xzHhsUOcxJcRIG0P2dmfuBrns?=
 =?us-ascii?Q?F3Oz2CeSP7TXkkOAk2bUqyt7xUb9GEJAELInJ8rVpMagSREuAv69Zly9a3/c?=
 =?us-ascii?Q?4EyM+qDUvgfpW4Y9Ej9LZG72GjvEg47eWxTUsuL5eSnHF2G6+Xa9p/oNnf7+?=
 =?us-ascii?Q?CQd2GHptHmgALV/WVQL5gpRYO8rEHgtTMP1WqSgtwsAXMdaqKGM++cdOmU88?=
 =?us-ascii?Q?4di0uH2GQbfyU8tMvJXyFOWdcAEYElqGt0fFLC0MCY7pHbB/7S10tALF8SSq?=
 =?us-ascii?Q?3U7xrxzROzNJv60X0rKJBleAK7UqkRBUo58rdulRyYSnO1DAX0JS+e5/7SMV?=
 =?us-ascii?Q?RtiDqmDbsBF1qI1Smh8LeURmI+h+tYyUG06oQ+4BVdecCLuhq62ak/XmQGg2?=
 =?us-ascii?Q?2fASVkhjaHbhUINvIhQ3sqitGvmZCS7P7M9GMboys/Kv4XYeT2wzdI+HCJdM?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8100992-41fd-4f3e-96ea-08dc90912628
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 18:53:46.6653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrdpCvsd5wdl1zP8pCZOIp/fFcSqXWZ2L/7GSL1E3hEGsul5ztNJ5ZOjndiKp24TUXgDYgIh2V9dMRqtdM+Bqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5976
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

On Tue, Jun 18, 2024 at 06:26:16PM -0700, Vinay Belgaumkar wrote:
> This WA requires us to limit media GT frequency requests to a certain
> cap value during driver load. Freq limits are restored after load
> completes, so perf will not be affected during normal operations.
> 
> During normal driver operation, this WA requires dummy writes to media
> offset 0x380D8C after every ~63 GGTT writes. This will ensure completion
> of the LMEM writes originating from Gunit.
> 
> During driver unload(before FLR), the WA requires that we set requested
> frequency to the cap value again.
> 
> v3: Do not use WA number in function name. Call WA wrapper from xe_device.
> Rename some variables, check for locks in the correct function (Rodrigo).
> Ensure reset path is also covered for this WA.
> 
> v4: Fix BAT failure
> 
> v5: Add a function pointer for ggtt_ops (Michal W)
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  3 ++
>  drivers/gpu/drm/xe/xe_device.c       |  3 ++
>  drivers/gpu/drm/xe/xe_ggtt.c         | 40 ++++++++++++++--
>  drivers/gpu/drm/xe/xe_ggtt.h         |  1 +
>  drivers/gpu/drm/xe/xe_ggtt_types.h   | 12 +++--
>  drivers/gpu/drm/xe/xe_gsc.c          |  5 ++
>  drivers/gpu/drm/xe/xe_gt.c           | 24 ++++++++++
>  drivers/gpu/drm/xe/xe_gt.h           |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 71 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
>  drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
>  12 files changed, 157 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 20dc9759bb3c..b1e03bfe4a68 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -24,9 +24,12 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>  	$(call cmd,wa_oob)
>  
>  uses_generated_oob := \
> +	$(obj)/xe_ggtt.o \
>  	$(obj)/xe_gsc.o \
> +	$(obj)/xe_gt.o \
>  	$(obj)/xe_guc.o \
>  	$(obj)/xe_guc_ads.o \
> +	$(obj)/xe_guc_pc.o \
>  	$(obj)/xe_migrate.o \
>  	$(obj)/xe_ring_ops.o \
>  	$(obj)/xe_vm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 75d4c8ae9234..2172b7d0e36a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -676,6 +676,9 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_hwmon_register(xe);
>  
> +	for_each_gt(gt, xe, id)
> +		xe_gt_sanitize_freq(gt);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_fini_display:
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ff91fd1b7c8..c345298d4a14 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/intel/i915_drm.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_gtt_defs.h"
> @@ -23,8 +24,10 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_map.h"
> +#include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
>  static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> @@ -69,6 +72,21 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>  	return ggms ? SZ_1M << ggms : 0;
>  }
>  
> +static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
> +{
> +	/*
> +	 * Wa_22019338487: GMD_ID is a RO register, a dummy write forces gunit
> +	 * to wait for completion of prior GTT writes before letting this through.
> +	 * This needs to be done for all GGTT writes originating from the CPU.
> +	 */
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	if ((++ggtt->access_count % 63) == 0) {
> +		xe_mmio_write32(ggtt->tile->media_gt, GMD_ID, 0x0);
> +		ggtt->access_count = 0;
> +	}
> +}
> +
>  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  {
>  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> @@ -77,6 +95,12 @@ void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
>  }
>  
> +void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
> +{
> +	xe_ggtt_set_pte(ggtt, addr, pte);
> +	ggtt_update_access_counter(ggtt);
> +}
> +
>  static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  {
>  	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
> @@ -92,7 +116,7 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  		scratch_pte = 0;
>  
>  	while (start < end) {
> -		xe_ggtt_set_pte(ggtt, start, scratch_pte);
> +		ggtt->pt_ops->set_pte(ggtt, start, scratch_pte);
>  		start += XE_PAGE_SIZE;
>  	}
>  }
> @@ -124,10 +148,17 @@ static void primelockdep(struct xe_ggtt *ggtt)
>  
>  static const struct xe_ggtt_pt_ops xelp_pt_ops = {
>  	.pte_encode_bo = xelp_ggtt_pte_encode_bo,
> +	.set_pte = xe_ggtt_set_pte,
>  };
>  
>  static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
>  	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
> +	.set_pte = xe_ggtt_set_pte,
> +};
> +
> +static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
> +	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
> +	.set_pte = xe_ggtt_set_pte_and_flush,
>  };
>  
>  /*
> @@ -187,7 +218,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		ggtt->size = GUC_GGTT_TOP;
>  
>  	if (GRAPHICS_VERx100(xe) >= 1270)
> -		ggtt->pt_ops = &xelpg_pt_ops;
> +		ggtt->pt_ops = ggtt->tile->media_gt && XE_WA(ggtt->tile->media_gt, 22019338487) ?
> +			       &xelpg_pt_wa_ops : &xelpg_pt_ops;
>  	else
>  		ggtt->pt_ops = &xelp_pt_ops;
>  
> @@ -394,7 +426,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  
>  	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
>  		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
> -		xe_ggtt_set_pte(ggtt, start + offset, pte);
> +		ggtt->pt_ops->set_pte(ggtt, start + offset, pte);
>  	}
>  }
>  
> @@ -502,7 +534,7 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
>  		return;
>  
>  	while (start < end) {
> -		xe_ggtt_set_pte(ggtt, start, pte);
> +		ggtt->pt_ops->set_pte(ggtt, start, pte);
>  		start += XE_PAGE_SIZE;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 4a41a1762358..0e36ed4cd68a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -11,6 +11,7 @@
>  struct drm_printer;
>  
>  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
> +void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>  int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>  void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index d8c584d9a8c3..5d3de08831f3 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -13,10 +13,6 @@
>  struct xe_bo;
>  struct xe_gt;
>  
> -struct xe_ggtt_pt_ops {
> -	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
> -};
> -
>  struct xe_ggtt {
>  	struct xe_tile *tile;
>  
> @@ -34,6 +30,14 @@ struct xe_ggtt {
>  	const struct xe_ggtt_pt_ops *pt_ops;
>  
>  	struct drm_mm mm;
> +
> +	/** @access_count: counts GGTT writes */
> +	unsigned int access_count;
> +};
> +
> +struct xe_ggtt_pt_ops {
> +	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
> +	void (*set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 80a61934decc..f8239a13fa2b 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
> +#include "xe_guc_pc.h"
>  #include "xe_huc.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> @@ -284,6 +285,10 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>  		return ret;
>  
>  	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
> +
> +	/* GSC load is done, restore expected GT frequencies */
> +	xe_gt_sanitize_freq(gt);
> +
>  	xe_gt_dbg(gt, "GSC FW async load completed\n");
>  
>  	/* HuC auth failure is not fatal */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 57d84751e160..759634cff1d8 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -9,6 +9,7 @@
>  
>  #include <drm/drm_managed.h>
>  #include <drm/xe_drm.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "instructions/xe_gfxpipe_commands.h"
>  #include "instructions/xe_mi_commands.h"
> @@ -54,6 +55,7 @@
>  #include "xe_sriov.h"
>  #include "xe_tuning.h"
>  #include "xe_uc.h"
> +#include "xe_uc_fw.h"
>  #include "xe_vm.h"
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
> @@ -678,6 +680,9 @@ static int do_gt_restart(struct xe_gt *gt)
>  	/* Get CCS mode in sync between sw/hw */
>  	xe_gt_apply_ccs_mode(gt);
>  
> +	/* Restore GT freq to expected values */
> +	xe_gt_sanitize_freq(gt);
> +
>  	return 0;
>  }
>  
> @@ -801,6 +806,25 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_sanitize_freq() - Restore saved frequencies if necessary.
> + * @gt: the GT object
> + *
> + * Called after driver init/GSC load completes to restore GT frequencies if we
> + * limited them for any WAs.
> + */
> +int xe_gt_sanitize_freq(struct xe_gt *gt)
> +{
> +	int ret = 0;
> +
> +	if ((!xe_uc_fw_is_available(&gt->uc.gsc.fw) ||
> +	    xe_uc_fw_is_loaded(&gt->uc.gsc.fw)) &&
> +	    XE_WA(gt, 22019338487))
> +		ret = xe_guc_pc_restore_stashed_freq(&gt->uc.guc.pc);
> +
> +	return ret;
> +}
> +
>  int xe_gt_resume(struct xe_gt *gt)
>  {
>  	int err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 9073ac68a777..1123fdfc4ebc 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -56,6 +56,7 @@ int xe_gt_suspend(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
> +int xe_gt_sanitize_freq(struct xe_gt *gt);
>  void xe_gt_remove(struct xe_gt *gt);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 2b45a9cd3ec0..edf4a29a2aa3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -8,6 +8,7 @@
>  #include <linux/delay.h>
>  
>  #include <drm/drm_managed.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "abi/guc_actions_slpc_abi.h"
>  #include "regs/xe_gt_regs.h"
> @@ -25,6 +26,7 @@
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> +#include "xe_wa.h"
>  
>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
>  
> @@ -42,6 +44,8 @@
>  #define GT_FREQUENCY_MULTIPLIER	50
>  #define GT_FREQUENCY_SCALER	3
>  
> +#define LNL_MERT_FREQ_CAP	800
> +
>  /**
>   * DOC: GuC Power Conservation (PC)
>   *
> @@ -695,6 +699,16 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>  		tgl_init_fused_rp_values(pc);
>  }
>  
> +static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	if (XE_WA(gt, 22019338487))
> +		return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
> +	else
> +		return pc->rp0_freq;
> +}
> +
>  /**
>   * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>   * frequency to allow faster GuC load times
> @@ -706,7 +720,7 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  	pc_init_fused_rp_values(pc);
> -	pc_set_cur_freq(pc, pc->rp0_freq);
> +	pc_set_cur_freq(pc, pc_max_freq_cap(pc));
>  }
>  
>  static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
> @@ -762,6 +776,53 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> +static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
> +{
> +	int ret = 0;
> +
> +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
> +		/*
> +		 * Get updated min/max and stash them.
> +		 */
> +		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
> +		if (!ret)
> +			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
> +		 */
> +		mutex_lock(&pc->freq_lock);
> +		ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> +		if (!ret)
> +			ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
> +		mutex_unlock(&pc->freq_lock);
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_pc_restore_stashed_freq - Set min/max back to stashed values
> + * @pc: The GuC PC
> + *
> + * Returns: 0 on success,
> + *          error code on failure
> + */
> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&pc->freq_lock);
> +	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
> +	if (!ret)
> +		ret = pc_set_min_freq(pc, pc->stashed_min_freq);
> +	mutex_unlock(&pc->freq_lock);
> +
> +	return ret;
> +}
> +
>  /**
>   * xe_guc_pc_gucrc_disable - Disable GuC RC
>   * @pc: Xe_GuC_PC instance
> @@ -911,6 +972,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	if (ret)
>  		goto out;
>  
> +	ret = pc_set_mert_freq_cap(pc);
> +	if (ret)
> +		goto out;
> +
>  	if (xe->info.platform == XE_PVC) {
>  		xe_guc_pc_gucrc_disable(pc);
>  		ret = 0;
> @@ -959,6 +1024,10 @@ static void xe_guc_pc_fini_hw(void *arg)
>  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
> +
> +	/* Bind requested freq to mert_freq_cap before unload */
> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
> +
>  	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 8a7b91ce1b3e..55fdb55ab688 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -32,5 +32,6 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>  void xe_guc_pc_init_early(struct xe_guc_pc *pc);
> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
>  
>  #endif /* _XE_GUC_PC_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 2afd0dbc3542..13810be015db 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -25,6 +25,10 @@ struct xe_guc_pc {
>  	u32 user_requested_min;
>  	/** @user_requested_max: Stash the maximum requested freq by user */
>  	u32 user_requested_max;
> +	/** @stashed_min_freq: Stash the current minimum freq */
> +	u32 stashed_min_freq;
> +	/** @stashed_max_freq: Stash the current maximum freq */
> +	u32 stashed_max_freq;
>  	/** @freq_lock: Let's protect the frequencies */
>  	struct mutex freq_lock;
>  	/** @freq_ready: Only handle freq changes, if they are really ready */
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 12fe88796a49..a6b897030fde 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -27,3 +27,4 @@
>  16022287689	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
>  13011645652	GRAPHICS_VERSION(2004)
> +22019338487	MEDIA_VERSION(2000)
> -- 
> 2.38.1
> 
