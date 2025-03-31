Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93304C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 17:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B4B10E475;
	Mon, 31 Mar 2025 17:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jq5X/5M/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2560B10E475
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 17:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743443096; x=1774979096;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PnIlVdEwcdA7FZn8jwDZBH1nY/BQzdea5wyFXVO/Hcw=;
 b=Jq5X/5M/Lun3UnICIAVGN4RC/dWHXBEilYVt3Qk+XfpQKmvlAso+2XJ+
 EWvhZM0EmTfqRHtNsZwBNyI/gyUN5uZ411TFxnS7Mjn7d1bD35aCjK2IO
 8aaJUtFLlfTwhu82065ePVBD8Zh3vUcT5YHSaaaos4ffLFTKb2/PpC4IJ
 Jv1uq9HIH3N08ZjsKu8gN+s8OwwB/pk78y5m4lY7pTYF5+N9pBqo6Bx7+
 BHY8p/LKWOXWmg/VO57TleTfFnPv/RZWtL6NzhZsZukyFUK4Fs2vN0Hdv
 p6SENQIugJwKNCCf2HqnprHEbaKRyRaShYMriIpaUuz4sttvaNYBrabD/ Q==;
X-CSE-ConnectionGUID: 1mSWT8nDQmCR3CsSE2T62g==
X-CSE-MsgGUID: 0bOOxHg+TdqT5WzLXa2KOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44627086"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="44627086"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 10:44:55 -0700
X-CSE-ConnectionGUID: Pjr4D4FtRJyuQmpOmV+ocQ==
X-CSE-MsgGUID: PYyvPEdhQx+BPfRrwG5Krw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="126379950"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 10:44:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 10:44:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 10:44:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 10:44:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nd93K0E/EslSmAvGZqZXffbf79XMRyx+VfEmmfZGayS/qukpEau+neJ6ffHfoEGfm/hv9F3v8Up7g0oxtwcOQGM/zm6BwyXj4EsmkaTh3UDwsNtk3KL9no38nZqGC+YZ+Ir1pRUTwnt+opnRRCi5Gez936pR8SEiHTB06WE6bSqVnxFvHvDemDsj3p+7ZWyNIrZ3fn6EZ0RMThYrbA/JdwfSr98ySUg2OZOC/HJ+Nx76WSujvIxTO7VsEWZxz8w+Nz0hbcQlVoRcmQghLZlza3bJ0ESBdxGWnWwl4Az8IXYvMvoavNBJIgX1Buk/lvddRYhLffODDTUd+Wkp9kxOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhDjjsbQrNLpyG1PfqAtHF3mYrJgMW/SDwUJRGgs5Hg=;
 b=etOxAiEkxbyH+R1HSKR6U1uP77sscT3svmtnxouid2EjdXXEiVSXbKxUPCi18ogXR155xhZ7NwaqduKBgTdmIISXtYnaH7l+eMcTCbXhrYw0jfOuOqEdtV4Yqy1+2/2isV49QJ3KX1YOHzEjzdxcyCMkwH9/qg1BTwYvA8WFa0JDCGbsQj2Tq+v4Vhgd2D9wr5/jzMFKmMn/fcvTVPyMdNe46oohEF8UdYwoC/3YwpvREb92y6MFucBRfrhGOwZGFBpNQGz1hYKdNaYqYV4QZyqRaRTielarHYwJksX3sE95hlNe2UK33j/lJrp3vQgZJgHsKBrxZ1F40j+gJVvWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL1PR11MB6004.namprd11.prod.outlook.com (2603:10b6:208:390::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 17:44:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 17:44:10 +0000
Date: Mon, 31 Mar 2025 13:44:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v5] drm/xe/pmu: Add GT frequency events
Message-ID: <Z-rUZp_SQSFKAQBZ@intel.com>
References: <20250328225330.1990303-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250328225330.1990303-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL1PR11MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f05d49-edbc-4d93-03f0-08dd707ba483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WK3wIRbMPE4KNRtRULyT3yEoh4kz6ez3gNHoCfkMfz/Wc1LMj4Tw9h2neUQN?=
 =?us-ascii?Q?S2IpbCwYrwsu22EyXI57gFdGjMWBdBj3oryTB7NoOF5Y0PkOF3PteuUfTDG2?=
 =?us-ascii?Q?v88xdTveUYSw0cCN0mcOW1Zlqu65ycFoyRJfyPyyVdSLpRE3Rwxy2dGNu0w8?=
 =?us-ascii?Q?jsoofcEQChkfnL7s/c9s37ga+jgqPBbzzupi33NsYSaDK1Q+Kzv+EcpLTUol?=
 =?us-ascii?Q?FgWQKYHJps696MgWF8ypAEr7zuUWTtw9Ld0rdWCUjHyOJn4ysY5KEcHxzmLP?=
 =?us-ascii?Q?I2Jvjq/Yq3lv/hNeak1SO335LqfARJUNL+DRkuC/FjS/AL71OGt0FOBt98c6?=
 =?us-ascii?Q?/h7uznOQVc2ig15H40YD5eT1mOGQC2u0VGg/thojQaI8QjzfLUh57JaeRkot?=
 =?us-ascii?Q?cvuC5ybLOoSxgR5Lt7Z91pMbAl7mrDaS0rRn7hlB9kgFXzck5iZ0ymhHY6dN?=
 =?us-ascii?Q?vfbtUOLB3ho9L1KaV7VrESWukR4dAFgT0F97cqmg9CglweaJXm7V+lNowra2?=
 =?us-ascii?Q?+r74mDrcZE4nadmNc3V/JAvOUp+1ZfsrMAF5JI7gq8jH0TMq9C8juMj0eqxC?=
 =?us-ascii?Q?iSivznnVajBXtAVuE9V6+2FB61i6Y9wnbzLB36YI4zaH66Pco3dpyyNBONTA?=
 =?us-ascii?Q?gI09HduYzCss82Dy2gG3GLJpBxr2NL+WiLkQLlGCD/OA0vZGJHCItcLxMS9R?=
 =?us-ascii?Q?+Urbhn3qZep6mhFEJbnpkOL578GvZYeGA+P8noyUL5f3h3WVovty/LjctF2M?=
 =?us-ascii?Q?/07YmH5oZy3yubc3+t4gn2Bqn8DsNY4998tIIAq9o3d57/vgMxz6ricv1eQv?=
 =?us-ascii?Q?bKwbaQr7q4u2io9adCHsXsDaOut+6lkt03RW1tGvVtE1dANMQwWR0bL4zIoV?=
 =?us-ascii?Q?v54Dx6if9NcWAlOdETLBN+urHL07L9QUyRn/sv+QfXdkoIvCpdCLF1CEWZ5O?=
 =?us-ascii?Q?yRXbnHi0GAr877a00iU8rTdle2F08DxHYn/+SOTkzOmY4aImpJOefphMJnbw?=
 =?us-ascii?Q?F/SVACG5xkIbu5P13f0txemFQ1G/jUa7sUJw/daMfNtDzv5YRdpNJSww7oj8?=
 =?us-ascii?Q?ogRRz7+Oog0sh6yn/WZNT8zUQ+YZbq8k8zSCfM1rACeFgMdgFQSk1rdjKOSw?=
 =?us-ascii?Q?ag4cQcYwjWkg9TLfcw9+0Dd3KfLMyn2i4vlAA75+kKAUBvGMXF80NMLyUmy0?=
 =?us-ascii?Q?dep/JjA65iHAzXgGT1no3wLGlnV1/i9PVZVhfcPL+xP1whwXcoUu7hb3NK+q?=
 =?us-ascii?Q?VjKd3IB2jFnMttACP0IbLF6cO9PSbM7X8WBz2CNcfl8NXnI+4rwJ5gIK7qBL?=
 =?us-ascii?Q?ACV0YXhWUpob75yu3Ry8ySnY0BQJUpODgtvqcpreC8nMt3Enfwb3zaWn6Pw+?=
 =?us-ascii?Q?EhIMMvrJwh5D3OMRcd6Dn7xolA9P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vqo2KVZnr7VEHBG+U/1h+THg3TVt8DBwmtGkmFwNATsdV7XG66dTUQAfn2H9?=
 =?us-ascii?Q?iyz/kWdxQFQ78JFyLEXlla0ONg0fLrUwBhphxbazAz4eHcHAxh30CCwQ9zVL?=
 =?us-ascii?Q?7aVn+TjmRR6sU3zzEjbs6GzJW4+TDjBy1vDZpeZsnYkoW+VG1cw9NLprLWB1?=
 =?us-ascii?Q?i/VrCPHYpKMJ5b2il8N0Zetgj+rNFbzNJEg9lKxRAI4e+WnIz/EzSenVISiN?=
 =?us-ascii?Q?Gxq0uR84eRBaoeQt9DMUE1AfaTO2spvDXYA9NetzQLx8k8Q56++0b3kNTvLd?=
 =?us-ascii?Q?PXqdvOSfQaHn+cpguyy6SaQxnUG60umVcMrVR4gXff1Jv0NZOWyilw7K/h+o?=
 =?us-ascii?Q?SYJbNiNLZrJxkf7DT83DkTpfhGEOkn2J1+vNdTSogHcoeNJFa++ZanPdfQi3?=
 =?us-ascii?Q?y2zrSNPWKwRBy2n7SnGO2UWiOdFeQwxP0hDTa7CXsgCj8pdHgfspuQIXjNbU?=
 =?us-ascii?Q?+2ClZtUuT7WGa3+5AZj+GvCTa+SW6gYUIXe9bm+/0irm0wECKMzJ3kq43L4g?=
 =?us-ascii?Q?rMFvBmRMYi6wGXzXRUproJlMfnTGccNc4lKc3Xcul3iZouwF5gjIWcLg/fwA?=
 =?us-ascii?Q?HQjdm4JxgJHhSSGCYx3/IklWWz6kR21LZCpMcTlzTrgVj7s5ZJ+hQHjtz4C/?=
 =?us-ascii?Q?b2ps/78SU0z2LCHDk3LwfGd5FGDEV0ULaLnd111Td+5ilYMgJUAB3zUw9+2H?=
 =?us-ascii?Q?Ur/db9p3L98ZsTcFMGNmL6rKf0DVM3dcosadZTFcPwlacN24uTCl8g9COXQG?=
 =?us-ascii?Q?Kjk3AcIn+P765JdL/TQ9EPGCX0nOjpP9ZZOjSFk8vo0oHbufm/Nwr5YpLwqh?=
 =?us-ascii?Q?exja/PAq1DeCHCb0PIgNA01tO0dyJ3VlByzJn5cBLtDFop5709sg0Q3nemnY?=
 =?us-ascii?Q?sD2lWK3ISMWgduy7ZSYvfNitUvky5DxHRjCLiJ6CriGgd8Mua+rMeDp2B5SK?=
 =?us-ascii?Q?HPJs73LTcsMCyK74gfxPsY4RljmFZp0n/UvzPrWFvp++7U4urtIwseB9U2ly?=
 =?us-ascii?Q?uYFdYlxXYQLP8Nv+2Vm0tlNzUiil/7xirBJDz93INA3gg57zz1dgO6oQkiaZ?=
 =?us-ascii?Q?ZQguxfYy6QN4H9j/M86Jdcs+3CESTumBdL3btCvy6yDt4A8cB5z6zdnv0Ufq?=
 =?us-ascii?Q?kcrXxaBv0gr1RX/qA4wbQNnQLku1MRVc1KNh7k69xayAuZ1T/cVB1MYu4fnl?=
 =?us-ascii?Q?tbH089K3REsNU3NTfqm52u48z5GIbhIva+FLmL5/+SWQgpxzJfSuloj0r6K3?=
 =?us-ascii?Q?ioD5Q11cVCDyQcH0Sna0Ay6Nq3vHXUmvs6/4AYXMBAXgs5uHmTiHNT5e33XS?=
 =?us-ascii?Q?xaA32PQe3/oPryMA9oyr4Vaa/tX01tvnZPDJf7ZeHVaYGEAPK9jQMoDUEkcZ?=
 =?us-ascii?Q?dK/d8ogzEWqjhsD4jHT/4oWqTHeXlylkdO1T3s1Dx8+/FOWadw7RoGrX/6km?=
 =?us-ascii?Q?S/y2QYgJgFEW+onY7M1qAG3BPbaySsfr6h8VazsB2KqCnq/aQlvvetTkcW3x?=
 =?us-ascii?Q?QVvE4v9CHJcz2rJ41yACe5vLEvjxNHuQyklr0lj6Nc+YV/yHrKJZuP2WgIoc?=
 =?us-ascii?Q?Oj1t4J9cQT9kaKnONyutHVrRfRp8Kg+GZ7WFBiHSL6QrReF/9GtI9o+SHBjM?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f05d49-edbc-4d93-03f0-08dd707ba483
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 17:44:10.2501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hHShxywNhZyt1jAIExssaDSNnr48cKIJTYy49nJ8HbDlMEaFFqA/6QTrNPKT5MXg0EFEo5DmbAfvskDdJP7Gfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6004
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

On Fri, Mar 28, 2025 at 03:53:30PM -0700, Vinay Belgaumkar wrote:
> Define PMU events for GT frequency (actual and requested). The
> instantaneous values for these frequencies will be displayed.
> 
> Following PMU events are being added:
>   xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>   xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
> 
> Standard perf commands can be used to monitor GT frequency:
>   $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
> 
>   1.001229762       1483 Mhz  xe_0000_00_02.0/gt-requested-frequency,gt=0/
>   2.006175406       1483 Mhz  xe_0000_00_02.0/gt-requested-frequency,gt=0/
> 
> v2: Use locks while storing/reading samples, keep track of multiple
> clients (Lucas) and other general cleanup.
> v3: Review comments (Lucas) and use event counts instead of mask for
> active events.
> v4: Add freq events to event_param_valid method (Riana)
> v5: Use instantaneous values instead of aggregating (Lucas)
> v6: Obtain fwake at init for freq events as well and use non fwake
> variant method for reading requested freq to avoid lockdep issues (Lucas)
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 15 +++++++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
>  drivers/gpu/drm/xe/xe_pmu.c    | 40 +++++++++++++++++++++++++++++++---
>  3 files changed, 53 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 85215313976c..f70762917aed 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -461,6 +461,21 @@ static u32 get_cur_freq(struct xe_gt *gt)
>  	return decode_freq(freq);
>  }
>  
> +/**
> + * xe_guc_pc_get_cur_freq_fw - With fw held, get requested frequency
> + * @pc: The GuC PC
> + *
> + * Returns: the requested frequency for that GT instance
> + */
> +u32 xe_guc_pc_get_cur_freq_fw(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> +
> +	return get_cur_freq(gt);
> +}
> +
>  /**
>   * xe_guc_pc_get_cur_freq - Get Current requested frequency
>   * @pc: The GuC PC
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 39102b79602f..0a2664d5c811 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -22,6 +22,7 @@ void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
>  
>  u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>  int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
> +u32 xe_guc_pc_get_cur_freq_fw(struct xe_guc_pc *pc);
>  u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc);
>  u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc);
>  u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc);
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index fde4222675fd..835d21429b58 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -10,6 +10,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_gt_idle.h"
>  #include "xe_guc_engine_activity.h"
> +#include "xe_guc_pc.h"
>  #include "xe_hw_engine.h"
>  #include "xe_pm.h"
>  #include "xe_pmu.h"
> @@ -84,6 +85,8 @@ static unsigned int config_to_gt_id(u64 config)
>  #define XE_PMU_EVENT_GT_C6_RESIDENCY		0x01
>  #define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS	0x02
>  #define XE_PMU_EVENT_ENGINE_TOTAL_TICKS		0x03
> +#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x04
> +#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x05
>  
>  static struct xe_gt *event_to_gt(struct perf_event *event)
>  {
> @@ -119,6 +122,14 @@ static bool is_engine_event(u64 config)
>  		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>  }
>  
> +static bool is_gt_frequency_event(struct perf_event *event)
> +{
> +	uint32_t id = config_to_event_id(event->attr.config);
> +
> +	return (id == XE_PMU_EVENT_GT_ACTUAL_FREQUENCY) ||
> +	       (id == XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
> +}
> +
>  static bool event_gt_forcewake(struct perf_event *event)
>  {
>  	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> @@ -126,7 +137,7 @@ static bool event_gt_forcewake(struct perf_event *event)
>  	struct xe_gt *gt;
>  	unsigned int *fw_ref;
>  
> -	if (!is_engine_event(config))
> +	if (!is_engine_event(config) && !is_gt_frequency_event(event))
>  		return true;
>  
>  	gt = xe_device_get_gt(xe, config_to_gt_id(config));
> @@ -173,6 +184,8 @@ static bool event_param_valid(struct perf_event *event)
>  
>  	switch (config_to_event_id(config)) {
>  	case XE_PMU_EVENT_GT_C6_RESIDENCY:
> +	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
> +	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>  		if (engine_class || engine_instance || function_id)
>  			return false;
>  		break;
> @@ -190,6 +203,8 @@ static bool event_param_valid(struct perf_event *event)
>  		}
>  
>  		break;
> +	default:
> +		return false;

why do we now need this here?
Doesn't it deserve a separate patch with explanation?

>  	}
>  
>  	return true;
> @@ -288,6 +303,10 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>  	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>  	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>  		return read_engine_events(gt, event);
> +	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
> +		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
> +	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
> +		return xe_guc_pc_get_cur_freq_fw(&gt->uc.guc.pc);
>  	}
>  
>  	return 0;
> @@ -303,7 +322,13 @@ static void xe_pmu_event_update(struct perf_event *event)
>  		new = __xe_pmu_event_read(event);
>  	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
>  
> -	local64_add(new - prev, &event->count);
> +	/* GT frequency is not a monotonically increasing counter, so record the
> +	 * instantaneous value instead.
> +	 */
> +	if (is_gt_frequency_event(event))
> +		local64_add(new, &event->count);
> +	else
> +		local64_add(new - prev, &event->count);
>  }
>  
>  static void xe_pmu_event_read(struct perf_event *event)
> @@ -443,6 +468,10 @@ static ssize_t event_attr_show(struct device *dev,
>  XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>  XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>  XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
> +XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
> +		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
> +XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
> +		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>  
>  static struct attribute *pmu_empty_event_attrs[] = {
>  	/* Empty - all events are added as groups with .attr_update() */
> @@ -458,6 +487,8 @@ static const struct attribute_group *pmu_events_attr_update[] = {
>  	&pmu_group_gt_c6_residency,
>  	&pmu_group_engine_active_ticks,
>  	&pmu_group_engine_total_ticks,
> +	&pmu_group_gt_actual_frequency,
> +	&pmu_group_gt_requested_frequency,
>  	NULL,
>  };
>  
> @@ -466,8 +497,11 @@ static void set_supported_events(struct xe_pmu *pmu)
>  	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>  	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>  
> -	if (!xe->info.skip_guc_pc)
> +	if (!xe->info.skip_guc_pc) {
>  		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
> +		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
> +		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
> +	}
>  
>  	if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
>  		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
> -- 
> 2.38.1
> 
