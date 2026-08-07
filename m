Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6F2C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 18:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68CD10E44A;
	Fri,  7 Aug 2026 18:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5tIqS5i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CF510E44A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 18:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786128586; x=1817664586;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f6ohamz4F4ss9ZGuvGMOleW/zLhDhHBLGrVegVYkXD8=;
 b=Y5tIqS5iXFWT+aLAk9YOm0MpF9Gyfi6kOtG+4opnKvUut6cFsZcjQofb
 8jGvQMw0nRhjl5s4sxdw9+mjELaitt+ioR1OTJaudVV9PeeZ9E9wjWDvu
 lgwA8iNuHte+280pFINCVS8kOJ9OsKCOdSsfKq5zEbZmy3tMp1h8buhk6
 dQU3rGl44104tyjcHxE88+PCsrD0IHm1wkXdSsuBDeWinsSmpBdLZk6kC
 zeFhnfWHXGs9tQt87k7sMn/DplO23SP8AjOzImjO+aZHlRVCSExhvh8D7
 kcoKBReiQEFKQo1Ld33DPw2gRRk3G5I3KvNG7dNy9Ml2Cv9fvbJLrH2Cl g==;
X-CSE-ConnectionGUID: FfPwNFZFQSW3x6X8z6Hotg==
X-CSE-MsgGUID: EtQtvjBbSuGbDKj6XdOZTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86820892"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86820892"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 11:49:46 -0700
X-CSE-ConnectionGUID: 8p+mvLlVRUuIU98lsOPysg==
X-CSE-MsgGUID: I/FZhoZyQsCNs7Atls5SMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="262517180"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 11:49:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 11:49:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 11:49:45 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 11:49:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whPbkhnqhybDpdihaECl3RGWEEXKRabdl7OCO1w2XRjNUI3ba55v1wOVRJKjLGZUa9GY76dlqO5uSVzxL2FJvgu2ptDxoV0u8ffWbHOU2iPCLLywuoo++xWsFiQ6dPgJ4SrI4yF0XHsaeanGaUhKkdxpxMsYQFhA0vR5zl9io0sPtQVl8a/KeuZaHDNgNvqcetmu6aKCPX2DnN5dTWOWbCK0QH0AailMl1htRz3uJYldvG1EkFpEE2SZNyH/63bE1lwF9J1d18vS1xPT4lajuD0fsjcNRXLr00IwD4e9rSeEJconB4NcoSZQD/GQBpDUF/J/uUbmyD46qCBpkuyLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46HXxveIpJ2rXeRU5Z2aX0Pz7YJJMdRVKNTqZAPyq+g=;
 b=S3BA9TfxrTAiCqQx2tK839XJ8626oGGxrGWRAxMq/+CWCq0ABj3cobuLboJ4JGrZQaAZZZiD0LVH1lz+z7TuU5V5Pu456GC4KfhLUfZbwx9agykXcn6YGbRgh+NAXXGxmGe2MiVxxqbcpfm9STZjjNMhvtSH+OOAGOfIZGd7OytUacTj5T3mhey7bZGtnbOgFj8NZshqFDtl0qFEewmaIAskP+3vEMT8z6gu9oYZE5grwSpEZpQHz6nolcoueRoPhZi6WFRwU1XSU6PmWNEo8bCSKeYL4nAw5jBJ2gC5/wWB4/EkGcwZVU0bfz8L4QV6hGPGjdIGzXpJicWEmt3PLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by PH7PR11MB8059.namprd11.prod.outlook.com (2603:10b6:510:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 18:49:40 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 18:49:38 +0000
Date: Fri, 7 Aug 2026 14:49:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
CC: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nerlige
 Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ruhl, Michael J"
 <michael.j.ruhl@intel.com>, "Luse, Paul E" <paul.e.luse@intel.com>, "V,
 Mohamed Mansoor" <mohamed.mansoor.v@intel.com>, "Nasim, Kam"
 <kam.nasim@intel.com>
Subject: Re: [PATCH v3 4/4] drm/xe/sysctrl: Add RAS error injection debugfs
 interface
Message-ID: <anYovbHoP7LbRIuw@intel.com>
References: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
 <20260807145621.2938848-10-anoop.c.vijay@intel.com>
 <BN9PR11MB5242AF76995E0453ABF7878A95D12@BN9PR11MB5242.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5242AF76995E0453ABF7878A95D12@BN9PR11MB5242.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0092.namprd05.prod.outlook.com
 (2603:10b6:a03:334::7) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|PH7PR11MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 331d074c-1d08-40f6-5770-08def4b4a1de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|3023799007|11063799006|6133799003|4143699003|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: IM4eW/KxMxIy2tc+YvI2Ok1VxYOmrVzPE34GvUkIHHR7Lm4l9FR2+E8sAWkXqxk2EDG2s/dJWap9IPfx+7lHuGCxuIsrKWVLo2Btzju1s7Mw0KCEOvpxzVrp9Q8mWz/Bl5AFE5RDn2CIBFbrFEV3RhLJ1RSxOIo8c8Q5lSpaXRDXGcU8+TCZ5C5BBrXAUdZNKcYCQHT4U6cElkSpgox2rfYm1LMtXWYT4HXzJHzHe4EcyoVTXo94gR5TkK69S4lGKFfT4f6Zp0vrw7yFhmQV/3qc0cO8QJDIHMwjdtUujodKS8+BOuMo36c3Z6m226k3LtYOljhjTvRgCxuRQ0f9lyu3A2zSHJQGSX/dMsvxoFmPFE7vd384BXPPx2s6E0/xgNZwpfxY/r6IUbpmkjFNO0Wp4eZoJE+QhSqV08cZ/81JHw/1sJBu7yHAlE8eOfSY8A1nyXDaPbQml/QMsiX4ZTI+M1sMZQ7mziP8fDgxoqz8rKIw0HgObBw93qVIiM4iNW9s6sNqBLU7Mlvjk1sp1uPlyuewiC9Gjglk/FZ56Yy/wiH6vCcELQyLgY8hshpyaToee4tolO2LBIm8tJU7cEsP79LzXILnGbki7G5VjviSJtO9G7TFmN2L6boeJrd2zyaTyTSSN9ki7OkFN4b6/hOTjOPTX/XzVzNKl9x3uF0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(3023799007)(11063799006)(6133799003)(4143699003)(10067099003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y5JSnMovDGDJNpxxAXda7LvM15+R+d/X73JfgNSAGIEYPwV2Gk9eISseL1sZ?=
 =?us-ascii?Q?BIjw5eULFZ2bGMFjNZohLBa1V/26bcUSQhsGmjwPRKAy6zB65JUOwrjJFdAJ?=
 =?us-ascii?Q?/CTujpa+s5USxqcbAcJxuJjKgI+Ap+X7LYhRnN4DCjCh8EXaEqW+zSO/Ycpv?=
 =?us-ascii?Q?FQy72Ennk+Vy8Q8XvIL0MhqYY8AnELV6O819yFrYohwtxkmu09X/zRbq4Ws8?=
 =?us-ascii?Q?r4LBs2BAudkp8XMZu1qzE+n8jCwLHTJbsWKRb1Z515jeO1WePO6Ecd1wIM/R?=
 =?us-ascii?Q?7gc2gNbNmSRR+uuPg7/lLQt18HyAVkhXgHSFiNE3hBqNg2f3wvIlD5EkGc6d?=
 =?us-ascii?Q?OQtG88CAay0uHHtsUZ5QyGBNuZ4Nif5sPrI3Y+TmosAnh3awKrgCNI5aamdk?=
 =?us-ascii?Q?OpHmOmUGGnWLU310mtNzPE02BoDUa2OjYHW0nXKOY5ISvrhdOCOlR/RYkr9T?=
 =?us-ascii?Q?83HVpo7TBG1TSt11zR6xmAAqBUY/fpBdDsayyA5eMGnrjhAJB/fjqOOOYyFm?=
 =?us-ascii?Q?ZXGjcAFMtWtGJJ0vu0PTH7NDICcufFE2/qe3q+tx+Y0bgY54GmFafVr9YIDn?=
 =?us-ascii?Q?2M54YzGIQkCd2HOyRKCy/NNijW6FlK6lscSvRDHmTActvXRBIa9DInMeRmDV?=
 =?us-ascii?Q?NzGusWKFTyvM5bSoGF3gVEp9bmpAdyttnTRk11elzCHVzdfBhNeMxoEFvsao?=
 =?us-ascii?Q?6euua929i+busbohsciPhhxIGG6tOlKet/KOcnt64UM6FTxY+l6C2muv2tm1?=
 =?us-ascii?Q?RDEAfpxG8LHq1pamCIMIP83xs9RkwASChB1tP9Wtm+hyAz29/XqPEp7nnvxT?=
 =?us-ascii?Q?cyy6FqRpRXPiC6WUQBl0hcllZ6smB+XRAsMGWEICjpWw2vVxsa2OSAzQPtuD?=
 =?us-ascii?Q?9WuzUMkrwHI+zahzsIwvBKZPZFlPXtSHkot8e6jnzkKnsHN6jgS6yfuLT653?=
 =?us-ascii?Q?kOmOkvhOCTFrMwro9VINmNqx6/Ac2VsnOmPpfjxIm+zDab9/UpvNcGKyTKch?=
 =?us-ascii?Q?ojHqaIHl+W+7cLIecs72xR9bwnYIimSkNyai9V91qTDiFHJbwhUQ23Q6W5Bo?=
 =?us-ascii?Q?sjmGr3K9o2dCcSHuPHwVeadYHBAelPHk2rotarDwYrpx+jCbKdMTsMlyg52W?=
 =?us-ascii?Q?PCvxXzAOOKbl02lOwLa7N7yFakudAZFtynv8Ir5c6vQRQltasyIE5NO2OhRh?=
 =?us-ascii?Q?0pihuB114eRiq6M8op2h3Czwsca3yjwl9k/js3/t6WGYpbe7AEcFUUOy/hLl?=
 =?us-ascii?Q?/cAKHvD06XDyy71+NfnNmcQ1CeHOe/fTSs8RCNQgI7Hvv1l1CfywR9Y7u1xh?=
 =?us-ascii?Q?7Up0jWdCjr5uhCsa5YFlaHF+zHWnvsgMgQk6vdZvhnh9ZWGxsrk4VZ7Y2WAe?=
 =?us-ascii?Q?U62JLgvDwll4o3H5zm1ayVaGri2iiQJYDbBlMYzpBptxx0s/U/MeXPZHFQpL?=
 =?us-ascii?Q?oqt0CKwcSDecV6NACt03Dtvloep94KczLqRhwMgYo0du7lFAreFpnmoAlgp4?=
 =?us-ascii?Q?g4uBEsAWNnhuTO9fxO4VmqjAdrDUn9PI1XVWMcKpkaux6HVZzzpMvy64Fall?=
 =?us-ascii?Q?44deRrV3yz2qBEDWEHIKG4q5lG2T3FD/9ZUVW4JF1e+y3TaDmQ/yrC+zFU0S?=
 =?us-ascii?Q?CB/OLVlguDNSTUq9JLlk1UoNhSak8Rq0LE3EjYZ0c44OmqILglYO+k+LarBW?=
 =?us-ascii?Q?Jhg+98Tb6E7xvygQcGyxU1PYAbs1UaPewlYgUgtte+XZ6A35csOMURPWr6te?=
 =?us-ascii?Q?fIbe8pOOeQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: NMvXJSqIhPggLqeKODLF55tPaJMQpOKshjv9xZp8BTnGFF/4GXHWnUqm8bYlf7NSZOIQAOfvgBYWtCouVxJTNWDCfTdzNxnnc933C19FyaID/XDmhUrr/fD2GkxexIYa4uIm1tvYc144sG+eKy5AqaPz2Oh0BjYkUpLmPTpjZrucsDpJQwtCDUAyEW1xdOfWLh3cziVzonvsMo5tYzKYEbxfBRqPT+q7XEsgZbmtMDKgkRyb6Ngm6UjnFF8ukHeYEam5y4Yw9h9+jiuXuGCOBKNIvitvFC29SLn1QiQWQHJyiIIDGyoJZsXFyU/CC2TlqFNX0L0qH3G1KdyjuYIiIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 331d074c-1d08-40f6-5770-08def4b4a1de
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 18:49:38.2775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNyHoNGIC40w68J/RPi3ECREgfsNzxJNt6E0LLgL0DYOgq5VGsc+P8SaOYEG7AcaiTNw24iActe0m1GVqw9DeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8059
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

On Fri, Aug 07, 2026 at 11:15:59AM -0400, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Vijay, Anoop C <anoop.c.vijay@intel.com>
> > Sent: Friday, August 7, 2026 8:26 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Nilawar,
> > Badal <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> > Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Tauro, Riana
> > <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> > Roper, Matthew D <matthew.d.roper@intel.com>; Ruhl, Michael J
> > <michael.j.ruhl@intel.com>; Luse, Paul E <paul.e.luse@intel.com>; V,
> > Mohamed Mansoor <mohamed.mansoor.v@intel.com>; Nasim, Kam
> > <kam.nasim@intel.com>; Vijay, Anoop C <anoop.c.vijay@intel.com>
> > Subject: [PATCH v3 4/4] drm/xe/sysctrl: Add RAS error injection debugfs
> > interface
> > 
> > From: Anoop Vijay <anoop.c.vijay@intel.com>
> > 
> > Add debugfs interface for exercising System Controller's RAS error injection
> > command, used to validate RAS error detection and recovery paths.
> > 
> > Command details:
> > - Group ID: 0x02 (diag group)
> > - Command ID: 0x7E (XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT)
> > - Usage: echo "<ras_block_id> <ras_sub_block_id> <err_type> [params]" \
> >              > /sys/kernel/debug/dri/0/sc/ras_error_inject
> >          cat /sys/kernel/debug/dri/0/sc/ras_error_inject
> > 
> > This command requires the diag application to have completed firmware
> > boot and initialization (late-bind loaded); writes are rejected with -ENODEV
> > until xe_sysctrl_is_diag_fw_ready() reports the diag firmware as ready.
> > 
> > Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 123 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  31 +++++
> >  drivers/gpu/drm/xe/xe_sysctrl_types.h         |   3 +
> >  3 files changed, 157 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> > b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> > index 2144d9d43fba..7b8846d739cb 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/seq_file.h>
> >  #include <linux/slab.h>
> >  #include <linux/string.h>
> > +#include <linux/string_choices.h>
> >  #include <linux/uaccess.h>
> > 
> >  #include "xe_device.h"
> > @@ -122,6 +123,124 @@ static const struct file_operations
> > xe_sysctrl_loopback_fops = {
> >  	.release = single_release,
> >  };
> > 
> > +static ssize_t xe_sysctrl_ras_error_inject_write(struct file *file, const char
> > __user *ubuf,
> > +						 size_t len, loff_t *offp)
> > +{
> > +	char *kbuf __free(kfree) = NULL;
> > +	struct seq_file *m = file->private_data;
> > +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> > +	struct xe_device *xe = sc_to_xe(entry->sc);
> > +	struct xe_sysctrl_diag_ras_err_inj_req req = {};
> > +	struct xe_sysctrl_mailbox_command cmd = {};
> > +	u8 resp_hdr_only[sizeof(u32)];
> > +	unsigned int nfields = 0;
> > +	char *token, *tmp;
> > +	unsigned long val;
> > +	size_t out_len = 0;
> > +
> > +	if (!xe_sysctrl_is_diag_fw_ready(xe)) {
> > +		xe_err(xe, "sysctrl: diag firmware not ready, cannot inject RAS
> > error\n");
> Wild thought, 
> How it would be register the debugfs only if  diag firmware is loaded ?
> That way nobody will be having access to these debugfs ? 

I agree with this. It is better not even register the file if the
firmware is not loaded. So it doesn't even appear in the filesystem.

> 
> Thanks,
> Anshuman.
> 
> > +		return -ENODEV;
> > +	}
> > +
> > +	if (len == 0 || len >= PAGE_SIZE)
> > +		return -EINVAL;
> > +
> > +	kbuf = kmalloc(len + 1, GFP_KERNEL);
> > +	if (!kbuf)
> > +		return -ENOMEM;
> > +
> > +	if (copy_from_user(kbuf, ubuf, len))
> > +		return -EFAULT;
> > +	kbuf[len] = '\0';
> > +
> > +	tmp = kbuf;
> > +	while ((token = strsep(&tmp, " \t\n")) != NULL) {
> > +		if (*token == '\0')
> > +			continue;
> > +
> > +		if (kstrtoul(token, 0, &val))
> > +			goto inval;
> > +
> > +		switch (nfields) {
> > +		case 0:
> > +			if (val > U16_MAX)
> > +				goto inval;
> > +			req.ras_block_id = val;
> > +			break;
> > +		case 1:
> > +			if (val > U16_MAX)
> > +				goto inval;
> > +			req.ras_sub_block_id = val;
> > +			break;
> > +		case 2:
> > +			if (val > U16_MAX)
> > +				goto inval;
> > +			req.err_type = val;
> > +			break;
> > +		case 3:
> > +			if (val > U32_MAX)
> > +				goto inval;
> > +			req.params = val;
> > +			break;
> > +		default:
> > +			xe_err(xe, "sysctrl: too many ras_error_inject
> > arguments\n");
> > +			return -EINVAL;
> > +		}
> > +		nfields++;
> > +	}
> > +
> > +	if (nfields < 3) {
> > +		xe_err(xe,
> > +		       "sysctrl: usage: <ras_block_id> <ras_sub_block_id>
> > <err_type> [params]\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
> > +				  &req, sizeof(req), resp_hdr_only,
> > +				  sizeof(resp_hdr_only));
> > +
> > +	guard(xe_pm_runtime)(xe);
> > +	entry->status = xe_sysctrl_send_command(entry->sc, &cmd,
> > &out_len);
> > +
> > +	return entry->status ? entry->status : len;
> > +
> > +inval:
> > +	xe_err(xe, "sysctrl: invalid ras_error_inject token '%s'\n", token);
> > +	return -EINVAL;
> > +}
> > +
> > +static int xe_sysctrl_ras_error_inject_show(struct seq_file *m, void
> > +*data) {
> > +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> > +	struct xe_device *xe = sc_to_xe(entry->sc);
> > +
> > +	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n", entry-
> > >group, entry->command);
> > +	seq_printf(m, "Diag firmware ready: %s\n",
> > +		   str_yes_no(xe_sysctrl_is_diag_fw_ready(xe)));
> > +	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ?
> > +"FAILED" : "SUCCESS");
> > +
> > +	seq_puts(m, "\nUsage:\n");
> > +	seq_puts(m, "  echo \"<ras_block_id> <ras_sub_block_id>
> > <err_type> [params]\" > ras_error_inject\n");
> > +	seq_puts(m, "  cat ras_error_inject\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_sysctrl_ras_error_inject_open(struct inode *inode, struct
> > +file *file) {
> > +	return single_open(file, xe_sysctrl_ras_error_inject_show,
> > +inode->i_private); }
> > +
> > +static const struct file_operations xe_sysctrl_ras_error_inject_fops = {
> > +	.owner = THIS_MODULE,
> > +	.open = xe_sysctrl_ras_error_inject_open,
> > +	.read = seq_read,
> > +	.write = xe_sysctrl_ras_error_inject_write,
> > +	.llseek = seq_lseek,
> > +	.release = single_release,
> > +};
> > +
> >  static void xe_sysctrl_register_entry(struct dentry *root, struct
> > xe_sysctrl_debugfs_entry *entry,
> >  				      struct xe_sysctrl *sc, const char *name,
> >  				      u8 group, u8 command,
> > @@ -154,4 +273,8 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl
> > *sc, struct dentry *parent)
> >  	xe_sysctrl_register_entry(root, &sc->debugfs.loopback, sc,
> > "loopback",
> >  				  XE_SYSCTRL_GROUP_CORE,
> > XE_SYSCTRL_CMD_LOOPBACK,
> >  				  &xe_sysctrl_loopback_fops);
> > +
> > +	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc,
> > "ras_error_inject",
> > +				  XE_SYSCTRL_GROUP_DIAG,
> > XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
> > +				  &xe_sysctrl_ras_error_inject_fops);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > index ed80fe63e1c4..43ae0049b316 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > @@ -14,10 +14,12 @@
> >   * enum xe_sysctrl_group - System Controller command groups
> >   *
> >   * @XE_SYSCTRL_GROUP_GFSP: GFSP group
> > + * @XE_SYSCTRL_GROUP_DIAG: Diag group
> >   * @XE_SYSCTRL_GROUP_CORE: Core group
> >   */
> >  enum xe_sysctrl_group {
> >  	XE_SYSCTRL_GROUP_GFSP			= 0x01,
> > +	XE_SYSCTRL_GROUP_DIAG			= 0x02,
> >  	XE_SYSCTRL_GROUP_CORE			= 0xFF,
> >  };
> > 
> > @@ -51,6 +53,35 @@ enum xe_sysctrl_core_cmd {
> >  	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
> >  };
> > 
> > +/**
> > + * enum xe_sysctrl_diag_cmd - Commands supported by Diag group
> > + *
> > + * @XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT: RAS error injection  */
> > enum
> > +xe_sysctrl_diag_cmd {
> > +	XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT		= 0x7E,
> > +};
> > +
> > +/**
> > + * struct xe_sysctrl_diag_ras_err_inj_req - DIAG_RAS_ERR_INJECT request
> > +payload
> > + *
> > + * Request payload for XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT. The
> > mailbox
> > +layer
> > + * prepends the application message header before sending.
> > + *
> > + * @ras_block_id: RAS block (subsystem) to inject the error into
> > + * @ras_sub_block_id: RAS sub-block (IP) within @ras_block_id
> > + * @err_type: Type of test error to inject
> > + * @reserved: Must be zero
> > + * @params: Optional injection parameters (default 0)  */ struct
> > +xe_sysctrl_diag_ras_err_inj_req {
> > +	u16 ras_block_id;
> > +	u16 ras_sub_block_id;
> > +	u16 err_type;
> > +	u16 reserved;
> > +	u32 params;
> > +} __packed;
> > +
> >  /**
> >   * struct xe_sysctrl_app_status_req - Get application status request
> >   *
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > index 53d82e61383a..3a97a10d1b7d 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > @@ -68,6 +68,9 @@ struct xe_sysctrl {
> > 
> >  		/** @debugfs.loopback: Loopback test entry */
> >  		struct xe_sysctrl_debugfs_entry loopback;
> > +
> > +		/** @debugfs.ras_error_inject: RAS error injection test entry
> > */
> > +		struct xe_sysctrl_debugfs_entry ras_error_inject;
> >  	} debugfs;
> >  };
> > 
> > --
> > 2.43.0
> 
