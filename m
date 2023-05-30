Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36636C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 06:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D67510E346;
	Tue, 30 May 2023 06:36:52 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA9410E346
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 06:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685428611; x=1716964611;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5616T3SwHfb2hN/0LtH9u74QyoAy2WlAEFrj3YBCrTA=;
 b=ICgPRCTLV/Nbhs6WsGs8yfZgnuBvdq8agkhb9YCGudSDlqmoWMdI7FTc
 M4xdUuMAGOYIvRVbOJ/We6zwj2YGQ9Y9TnqXpNXIxukjgyVQ47Rsd8hES
 8kz0ETX1+7sr8PJSCxWaDz6uYtLucMojD7uQ6uJVM2Kx75OtlRu3p37iN
 Fyk0eCPrqe0+mE3eYbRxd7ThqlHMkXiUSz3wB7oTEht78MBzz2ja7K7Ov
 WeiFEtjWksFP054/uZRnJc6ZBKy892dBqzeZI6PBbk0M0WfX1tXHeRH5c
 RR4FClpf4pVe86EktNUOPjAliVgscmOd6ESaxuKfr6T4jPNf7D9OFYC9j w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335177734"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="335177734"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 23:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="830613502"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="830613502"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 29 May 2023 23:36:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 23:36:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 23:36:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 23:36:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 23:36:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLCcVmcHcVoWk0v3IjkJCqq1Rict4JJsLGnn4JCHMsrVQLw5OMAWraTZ21r0lt2GvXg8xSb5tZDmZuPE+yao78PZval0KdOh+7VfI32E5Rv070q168n2+f6xgD+gedHm2QyG2I+9FXfK/4ioSPOkwR+BPnwDwuF63kEBAILolmjFZKBeaCi48Z+f5Ntlk27ANjGJFAm0PDdo9KwNMBZtEohLKMAmFakVkbgkWRlej+te7QAXS0VpVM8sS3PMiLe2xdWe6HwBKPPqvVCYwfeUAH/aSxXjY1yDOXECHJ0xLgXysudEyuuaTJAOzxCob1Sb8O15YfMegPffo8eJUCDNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBgb6ZzmrDUgRB9KagSs1ZK9HzJ2dwvQJyqafFhqsx8=;
 b=Yiw9XdTK1N4eBujftj0RnsJdqdXOElooD6/HpxUOdTSXI3SbwKBjYbMLNn8+UzrZHVFPWvwkmz4CyQJZWtD8IrIsfsvQRmtfHFtZKLtc/1w/uBZm+P2zC/qFzdfWTCtLeJZILbek49fUoxaAEYmnYEUEe2MzWhc7j8Vs+njTgRkRhtFvQYx0NFF5Y89BNkdmSrF2kmAUsev+ebwZXM0MMuqoXF70eCaVGuaN3ieW61Rq3hX0npAyEcjGxShHnSY1g50Ha1vF5fkTCODsN8cK9QgunR3QKFjASMXQcG/FlXlnk48CMyKPwJ5nAKflrSeiDQb2YJzbTVaj3oMRjU5zYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5480.namprd11.prod.outlook.com (2603:10b6:208:314::6)
 by DM4PR11MB6503.namprd11.prod.outlook.com (2603:10b6:8:8c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.22; Tue, 30 May 2023 06:36:46 +0000
Received: from BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::7313:20af:ba84:eb1b]) by BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::7313:20af:ba84:eb1b%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 06:36:46 +0000
Message-ID: <7a5e9234-033e-3090-894b-115fb83de201@intel.com>
Date: Tue, 30 May 2023 12:06:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-21-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230519231827.3572452-21-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::10) To BL1PR11MB5480.namprd11.prod.outlook.com
 (2603:10b6:208:314::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5480:EE_|DM4PR11MB6503:EE_
X-MS-Office365-Filtering-Correlation-Id: a45944b7-70b5-40a2-db21-08db60d83d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fZngKpksYpx35kfYfZJusJau8dl8Cv/RpE7XRIWDox1VHq6s4u0acwyGVxAniG+UTXQfDAVOH8cIgxwvg1Bi48JrndPPMbxaogmtZdITMqWmvHE75zEurMl8cZ9XzT/s3B47KX+kMx2rxVO1E8E0/vKheGEhJpZyxkUdSsC9Bci5KmsjVKKDjAzJFLqqwjyWlH+FTKsEGXkO/jjPx7l8cKlVhxNjJmYLU1pM4M0PbOR0EjSYqfoNhVJfOochlakqGXewSMLaOW0YTddV3TLDBLYb1KdwtaSvlNlqdCNShKMr3AtzFWNl1N5GqQlIA5Si/QbAu7IbViSY2R2KsTINn6+izFOoBAH+r7cFOUDlTBAsASR6NbgEYy7xnPrr7Uh7zqXpa8PlNm75wvWGbwsjAiF2ZW9fQ95qMIQw0Bg2s39TQ3kc6j+yDntpSYnG5Biq08RVpVVUpbLRHGxbq7sa3iplJH7kYpFsES0IXih5NVQ6uIxf6okeyDD1eb6DVhFB0Hl6rcYrdPC8uYuhVhduZ2IiCPAwJoiX4G1aJ3LVuwR7RAJlgSZ+XwwIze0Cvd+MSaKu6wKknRDTH3sgGXLYNZFtt2yXbQ2VDVn1zv+tPWJGetqPckUU1tv00jplk/4Sn+f4JenW6WVdbpWArXN8IA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5480.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(346002)(136003)(366004)(451199021)(31686004)(82960400001)(478600001)(38100700002)(2616005)(66476007)(83380400001)(66556008)(66946007)(66899021)(31696002)(86362001)(6666004)(2906002)(30864003)(316002)(186003)(26005)(6486002)(6512007)(6506007)(53546011)(36756003)(41300700001)(5660300002)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW8va3NYODFjbGFXMGNnMGxQeG00VmVpWHhBT3FzM0NlcGRKUkd2ellsdUNU?=
 =?utf-8?B?ekEvQ2xpMmEyckJhN0ZlaGJFOFpEdEgxbGN4TzRzTnpsVnJoWUpleWV3bG56?=
 =?utf-8?B?N1kxY01LR1lCcm40bXVoQ1hkOUhhZDRJL3lmVmM4ZWQ4UXdxbjlhUXhiYmZq?=
 =?utf-8?B?ZE9jK3BrNG5ydVlzOGtESGRVbWN5K2RkYjZOT0t2b3FOcnc4RDNpRTl4SW5j?=
 =?utf-8?B?alJLTzZBL2R6emZ5YU5tREhjSmh3V1VpL2VuVXVZejF4a2RyRmRuWnNlWFlB?=
 =?utf-8?B?dDNmQmx3UVJKVnFQeFZVY1NIU29WRXF1TzJ4SENETk9mU0xXUkFRUDNIQWJp?=
 =?utf-8?B?dy9scHMzLzhHMWZ5OUUyZXR6bCtSZEhCTWIwMnZRbWlta0swaDNkYXBIR2NZ?=
 =?utf-8?B?bEZEQ25lWFgxWTRUY2lhMmZiUGQ4N082aUNqZ1JhY25RWFcxSzMwYjRzNEZw?=
 =?utf-8?B?L2tsdTlxNjM1UElUQkR5a3VHZFFFL0pKajRDOWxZeU00S2JmTTAvUFdOTXNR?=
 =?utf-8?B?WWR6aDhyUDM5ejZTTk13WkdCRVlpMldEcXpZRkFtaVNKWUIvTmJRa2lCSzFl?=
 =?utf-8?B?RnMvQkRDTTVMazhscVFuUXZTeTVSd1JRWk82UUVZNXBZV1dtdXNaWFNjdm1q?=
 =?utf-8?B?dVBxWllvdW5VZzBPbWRiS05hazNOcHA0SFlsdG9CcVYzNWFTclJscmN5M0pJ?=
 =?utf-8?B?a3RDaGFNaWEvc1MwenZNY3FkTzYvZHZXWm5KNW01cWVxN3V3VUh0eHVSNldF?=
 =?utf-8?B?MEhwc0dhTXVSYVdBeHhxSjNUbWFQQlJPTEZtNk1TeGxKMGMzVDVsWk5zMWlZ?=
 =?utf-8?B?T0R0MTF2bndUSjdZSE5vcE9DaVhWTlM1VUo4b0xXMlZtcHErKzZ4RHZsZ01x?=
 =?utf-8?B?NC9pNzJ3YWNkQVluL0xxOFVKelpwamRNOXdLR0JlSmk1OG94QVhZVWN5clI3?=
 =?utf-8?B?UkxNaFhNalFheUhUTHhiQlM5U2xGVzliNHNUblJhRkFMTFhEcmJPTVRzOEYx?=
 =?utf-8?B?WVliaGpSbWoxL0RrdW1kZUxQUDdDYUhKNEVjNEdWajhiUkllMkRGKzlQNWNG?=
 =?utf-8?B?YkVvdFVYOFJNZVgxVk4zd2RGUUMyMHVKbkd3QjVheGZQbXlOUHlvVG9NeEUz?=
 =?utf-8?B?UHZOOVlNUmg3TnhkMnc1YmkxMldsU1dqSU5mQ1ZESFYrK1RxRXFzRUw4aXp3?=
 =?utf-8?B?dWIrZ0djL2lBNGUvSzVFT0NGcUdvdXB4Q0hKZlRrUmt3WFBZaUlobUdYK2JZ?=
 =?utf-8?B?R2Fpem5ISjhvNVdXNmJMUll2TndjSUo3dDFCQ25OVCtKOXJaMmIvckgxMndO?=
 =?utf-8?B?eHRMSFJSbXlUdlJDWHI0L1VYM1JIVGRGZkxuUlFoYlJPVzVPcTF0WTFucEZT?=
 =?utf-8?B?N1VBYjdnbDVGNmdxK1FyK2JCb0xzY2ZTbVJDTmdNNmFJMFRTUlBiRXhld04r?=
 =?utf-8?B?a3ZzVDF4c2NhMGlqTVZWRkx1akFsM2NxaTlyY2dDc2RZcEVhSFFCWHdBWDFO?=
 =?utf-8?B?S1hPOHRWZ1JnZ1o1RmpManptWjBwMzM1OHg0QWd1YmZKTlVQMTFlWWpneVNt?=
 =?utf-8?B?SkQ0TzFVUTR4c3RLbDd4WGlSTDMrQXRyL05QQWNjQlp4S1N2NDM2bjh5dnN2?=
 =?utf-8?B?aGcxcjEwOW1hOFNZcnpuVW1Gb1c5OFY1RmZRTmlBVmJPRS9CWXp2UDlreHNu?=
 =?utf-8?B?WGNUajhBYlV6b25mb0pjUzdBaGthdGdPdkwvcURuT29CSnZFSDg4WDVqODM0?=
 =?utf-8?B?Yk5MVDNLcVZqdjZLemRjQ3dBeWtrREdEaHhJYzRHL0h0elhqTWFNOGhvcjd3?=
 =?utf-8?B?WXBseXdCa3RsOWs0dXVZSjFqamxJVE5nM21US2ZTUytLUEJ6QnJGREwzbER5?=
 =?utf-8?B?Nk5ObUtVeU5yNmhhQ0JUUEw5dk9LV3NvUkpmTTBJWUI4TVh2aDF1VjdYMWxJ?=
 =?utf-8?B?VXcvdkZ1L1FMK3pVS0FMYWc5dUFyRU8vcHZKbTJSMHlMTldXQlVHNzYrbnZx?=
 =?utf-8?B?VkpHZjgxR3VrR0tVMjl6YllCNkw0Q2RRNjhZNnZLUGsxZ0NldHBnODlhUmhR?=
 =?utf-8?B?REVqNmJQSlY1cDFVM3pkLzdwZkN0bmZXSHRoR0dzUTBrN3ZsMGJOeDRoaVdO?=
 =?utf-8?B?VUFjRkE1anZxZDZrd3JkUXhCZ25GeWRqa25BeFZ5bE04RmFicm1xTUtRbzVm?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a45944b7-70b5-40a2-db21-08db60d83d5c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 06:36:46.5876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mckwaG6XbTm+PJhVLLYOG2ciMBtjkzzdqiBjJPLEdHYVKPfvYJyirj6kcQ7MN4VrYHxZdNCBTLp0w1XAIxnGYB+rOEI8lipFBLIzoEjFux4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6503
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 20/30] drm/xe: Interrupts are delivered
 per-tile, not per-GT
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



On 20-05-2023 04:48, Matt Roper wrote:
> IRQ delivery and handling needs to be handled on a per-tile basis.  Note
> that this is true even for the "GT interrupts" relating to engines and
> GuCs --- the interrupts relating to both GTs get raised through a single
> set of registers in the tile's sgunit range.
> 
> On true multi-tile platforms, interrupts on remote tiles are internally
> forwarded to the root tile; the first thing the top-level interrupt
> handler should do is consult the root tile's instance of
> DG1_MSTR_TILE_INTR to determine which tile(s) had interrupts.  This
> register is also responsible for enabling/disabling top-level reporting
> of any interrupts to the OS.  Although this register technically exists
> on all tiles, it should only be used on the root tile.
> 
> The (mis)use of struct xe_gt as a target for MMIO operations in the
> driver makes the code somewhat confusing since we wind up needing a GT
> pointer to handle programming that's unrelated to the GT.  To mitigate
> this confusion, all of the xe_gt structures used solely as an MMIO
> target in interrupt code are renamed to 'mmio' so that it's clear that
> the structure being passed does not necessarily relate to any specific
> GT (primary or media) that we might be dealing with interrupts for.
> Reworking the driver's MMIO handling to not be dependent on xe_gt is
> planned as a future patch series.
> 
> Note that GT initialization code currently calls xe_gt_irq_postinstall()
> in an attempt to enable the HWE interrupts for the GT being initialized.
> Unfortunately xe_gt_irq_postinstall() doesn't really match its name and
> does a bunch of other stuff unrelated to the GT interrupts (such as
> enabling the top-level device interrupts).  That will be addressed in
> future patches.
> 
> v2:
>  - Clarify commit message with explanation of why DG1_MSTR_TILE_INTR is
>    only used on the root tile, even though it's an sgunit register that
>    is technically present in each tile's MMIO space.  (Aravind)
>  - Also clarify that the xe_gt used as a target for MMIO operations may
>    or may not relate to the GT we're dealing with for interrupts.
>    (Lucas)
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c  |   2 +-
>  drivers/gpu/drm/xe/xe_irq.c | 334 ++++++++++++++++++++----------------
>  drivers/gpu/drm/xe/xe_irq.h |   4 +-
>  3 files changed, 187 insertions(+), 153 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0abd0d912610..290935e46059 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -304,7 +304,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	gt->info.engine_mask = gt->info.__engine_mask;
>  
>  	/* Enables per hw engine IRQs */
> -	xe_gt_irq_postinstall(gt);
> +	xe_gt_irq_postinstall(gt_to_tile(gt));
>  
>  	/* Rerun MCR init as we now have hw engine list */
>  	xe_gt_mcr_init(gt);
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 654c34a5b99a..ad2f73b2a031 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -27,60 +27,66 @@
>  #define IIR(offset)				XE_REG(offset + 0x8)
>  #define IER(offset)				XE_REG(offset + 0xc)
>  
> -static void assert_iir_is_zero(struct xe_gt *gt, struct xe_reg reg)
> +static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
>  {
> -	u32 val = xe_mmio_read32(gt, reg);
> +	u32 val = xe_mmio_read32(mmio, reg);
>  
>  	if (val == 0)
>  		return;
>  
> -	drm_WARN(&gt_to_xe(gt)->drm, 1,
> +	drm_WARN(&gt_to_xe(mmio)->drm, 1,
>  		 "Interrupt register 0x%x is not zero: 0x%08x\n",
>  		 reg.addr, val);
> -	xe_mmio_write32(gt, reg, 0xffffffff);
> -	xe_mmio_read32(gt, reg);
> -	xe_mmio_write32(gt, reg, 0xffffffff);
> -	xe_mmio_read32(gt, reg);
> +	xe_mmio_write32(mmio, reg, 0xffffffff);
> +	xe_mmio_read32(mmio, reg);
> +	xe_mmio_write32(mmio, reg, 0xffffffff);
> +	xe_mmio_read32(mmio, reg);
>  }
>  
>  /*
>   * Unmask and enable the specified interrupts.  Does not check current state,
>   * so any bits not specified here will become masked and disabled.
>   */
> -static void unmask_and_enable(struct xe_gt *gt, u32 irqregs, u32 bits)
> +static void unmask_and_enable(struct xe_tile *tile, u32 irqregs, u32 bits)
>  {
> +	struct xe_gt *mmio = tile->primary_gt;
> +
>  	/*
>  	 * If we're just enabling an interrupt now, it shouldn't already
>  	 * be raised in the IIR.
>  	 */
> -	assert_iir_is_zero(gt, IIR(irqregs));
> +	assert_iir_is_zero(mmio, IIR(irqregs));
>  
> -	xe_mmio_write32(gt, IER(irqregs), bits);
> -	xe_mmio_write32(gt, IMR(irqregs), ~bits);
> +	xe_mmio_write32(mmio, IER(irqregs), bits);
> +	xe_mmio_write32(mmio, IMR(irqregs), ~bits);
>  
>  	/* Posting read */
> -	xe_mmio_read32(gt, IMR(irqregs));
> +	xe_mmio_read32(mmio, IMR(irqregs));
>  }
>  
>  /* Mask and disable all interrupts. */
> -static void mask_and_disable(struct xe_gt *gt, u32 irqregs)
> +static void mask_and_disable(struct xe_tile *tile, u32 irqregs)
>  {
> -	xe_mmio_write32(gt, IMR(irqregs), ~0);
> +	struct xe_gt *mmio = tile->primary_gt;
> +
> +	xe_mmio_write32(mmio, IMR(irqregs), ~0);
>  	/* Posting read */
> -	xe_mmio_read32(gt, IMR(irqregs));
> +	xe_mmio_read32(mmio, IMR(irqregs));
>  
> -	xe_mmio_write32(gt, IER(irqregs), 0);
> +	xe_mmio_write32(mmio, IER(irqregs), 0);
>  
>  	/* IIR can theoretically queue up two events. Be paranoid. */
> -	xe_mmio_write32(gt, IIR(irqregs), ~0);
> -	xe_mmio_read32(gt, IIR(irqregs));
> -	xe_mmio_write32(gt, IIR(irqregs), ~0);
> -	xe_mmio_read32(gt, IIR(irqregs));
> +	xe_mmio_write32(mmio, IIR(irqregs), ~0);
> +	xe_mmio_read32(mmio, IIR(irqregs));
> +	xe_mmio_write32(mmio, IIR(irqregs), ~0);
> +	xe_mmio_read32(mmio, IIR(irqregs));
>  }
>  
> -static u32 xelp_intr_disable(struct xe_gt *gt)
> +static u32 xelp_intr_disable(struct xe_device *xe)
>  {
> -	xe_mmio_write32(gt, GFX_MSTR_IRQ, 0);
> +	struct xe_gt *mmio = xe_root_mmio_gt(xe);
> +
> +	xe_mmio_write32(mmio, GFX_MSTR_IRQ, 0);
>  
>  	/*
>  	 * Now with master disabled, get a sample of level indications
> @@ -88,36 +94,41 @@ static u32 xelp_intr_disable(struct xe_gt *gt)
>  	 * New indications can and will light up during processing,
>  	 * and will generate new interrupt after enabling master.
>  	 */
> -	return xe_mmio_read32(gt, GFX_MSTR_IRQ);
> +	return xe_mmio_read32(mmio, GFX_MSTR_IRQ);
>  }
>  
>  static u32
> -gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
> +gu_misc_irq_ack(struct xe_device *xe, const u32 master_ctl)
>  {
> +	struct xe_gt *mmio = xe_root_mmio_gt(xe);
>  	u32 iir;
>  
>  	if (!(master_ctl & GU_MISC_IRQ))
>  		return 0;
>  
> -	iir = xe_mmio_read32(gt, IIR(GU_MISC_IRQ_OFFSET));
> +	iir = xe_mmio_read32(mmio, IIR(GU_MISC_IRQ_OFFSET));
>  	if (likely(iir))
> -		xe_mmio_write32(gt, IIR(GU_MISC_IRQ_OFFSET), iir);
> +		xe_mmio_write32(mmio, IIR(GU_MISC_IRQ_OFFSET), iir);
>  
>  	return iir;
>  }
>  
> -static inline void xelp_intr_enable(struct xe_gt *gt, bool stall)
> +static inline void xelp_intr_enable(struct xe_device *xe, bool stall)
>  {
> -	xe_mmio_write32(gt, GFX_MSTR_IRQ, MASTER_IRQ);
> +	struct xe_gt *mmio = xe_root_mmio_gt(xe);
> +
> +	xe_mmio_write32(mmio, GFX_MSTR_IRQ, MASTER_IRQ);
>  	if (stall)
> -		xe_mmio_read32(gt, GFX_MSTR_IRQ);
> +		xe_mmio_read32(mmio, GFX_MSTR_IRQ);
>  }
>  
> -static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> +static void gt_irq_postinstall(struct xe_tile *tile)
>  {
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_gt *mmio = tile->primary_gt;
>  	u32 irqs, dmask, smask;
> -	u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
> -	u32 bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
> +	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COMPUTE);
> +	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COPY);
>  
>  	if (xe_device_guc_submission_enabled(xe)) {
>  		irqs = GT_RENDER_USER_INTERRUPT |
> @@ -133,57 +144,57 @@ static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>  	smask = irqs << 16;
>  
>  	/* Enable RCS, BCS, VCS and VECS class interrupts. */
> -	xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE, dmask);
> -	xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE, dmask);
> +	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
> +	xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
>  	if (ccs_mask)
> -		xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, smask);
> +		xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
>  
>  	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
> -	xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK, ~smask);
> -	xe_mmio_write32(gt, BCS_RSVD_INTR_MASK, ~smask);
> +	xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
> +	xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
>  	if (bcs_mask & (BIT(1)|BIT(2)))
> -		xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
> +		xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
>  	if (bcs_mask & (BIT(3)|BIT(4)))
> -		xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
> +		xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
>  	if (bcs_mask & (BIT(5)|BIT(6)))
> -		xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
> +		xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
>  	if (bcs_mask & (BIT(7)|BIT(8)))
> -		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
> -	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK, ~dmask);
> -	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK, ~dmask);
> -	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK, ~dmask);
> +		xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
> +	xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, ~dmask);
> +	xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, ~dmask);
> +	xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, ~dmask);
>  	if (ccs_mask & (BIT(0)|BIT(1)))
> -		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~dmask);
> +		xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
>  	if (ccs_mask & (BIT(2)|BIT(3)))
> -		xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~dmask);
> +		xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~dmask);
>  
>  	/*
>  	 * RPS interrupts will get enabled/disabled on demand when RPS itself
>  	 * is enabled/disabled.
>  	 */
>  	/* TODO: gt->pm_ier, gt->pm_imr */
> -	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE, 0);
> -	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK,  ~0);
> +	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
> +	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
>  
>  	/* Same thing for GuC interrupts */
> -	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE, 0);
> -	xe_mmio_write32(gt, GUC_SG_INTR_MASK,  ~0);
> +	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE, 0);
> +	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,  ~0);
>  }
>  
> -static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> +static void xelp_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
>  {
>  	/* TODO: PCH */
>  
> -	gt_irq_postinstall(xe, gt);
> +	gt_irq_postinstall(tile);
>  
> -	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> +	unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
>  
> -	xelp_intr_enable(gt, true);
> +	xelp_intr_enable(xe, true);
>  }
>  
>  static u32
>  gt_engine_identity(struct xe_device *xe,
> -		   struct xe_gt *gt,
> +		   struct xe_gt *mmio,
>  		   const unsigned int bank,
>  		   const unsigned int bit)
>  {
> @@ -192,7 +203,7 @@ gt_engine_identity(struct xe_device *xe,
>  
>  	lockdep_assert_held(&xe->irq.lock);
>  
> -	xe_mmio_write32(gt, IIR_REG_SELECTOR(bank), BIT(bit));
> +	xe_mmio_write32(mmio, IIR_REG_SELECTOR(bank), BIT(bit));
>  
>  	/*
>  	 * NB: Specs do not specify how long to spin wait,
> @@ -200,7 +211,7 @@ gt_engine_identity(struct xe_device *xe,
>  	 */
>  	timeout_ts = (local_clock() >> 10) + 100;
>  	do {
> -		ident = xe_mmio_read32(gt, INTR_IDENTITY_REG(bank));
> +		ident = xe_mmio_read32(mmio, INTR_IDENTITY_REG(bank));
>  	} while (!(ident & INTR_DATA_VALID) &&
>  		 !time_after32(local_clock() >> 10, timeout_ts));
>  
> @@ -210,7 +221,7 @@ gt_engine_identity(struct xe_device *xe,
>  		return 0;
>  	}
>  
> -	xe_mmio_write32(gt, INTR_IDENTITY_REG(bank), INTR_DATA_VALID);
> +	xe_mmio_write32(mmio, INTR_IDENTITY_REG(bank), INTR_DATA_VALID);
>  
>  	return ident;
>  }
> @@ -232,10 +243,32 @@ gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
>  	}
>  }
>  
> -static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> +static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
> +				    enum xe_engine_class class,
> +				    unsigned int instance)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +
> +	if (MEDIA_VER(xe) < 13)
> +		return tile->primary_gt;
> +
> +	if (class == XE_ENGINE_CLASS_VIDEO_DECODE ||
> +	    class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
> +		return tile->media_gt;
> +
> +	if (class == XE_ENGINE_CLASS_OTHER &&
> +	    instance == OTHER_MEDIA_GUC_INSTANCE)
> +		return tile->media_gt;
> +
> +	return tile->primary_gt;
> +}
> +
> +static void gt_irq_handler(struct xe_tile *tile,
>  			   u32 master_ctl, long unsigned int *intr_dw,
>  			   u32 *identity)
>  {
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_gt *mmio = tile->primary_gt;
>  	unsigned int bank, bit;
>  	u16 instance, intr_vec;
>  	enum xe_engine_class class;
> @@ -247,27 +280,26 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
>  		if (!(master_ctl & GT_DW_IRQ(bank)))
>  			continue;
>  
> -		if (!xe_gt_is_media_type(gt)) {
> -			intr_dw[bank] =
> -				xe_mmio_read32(gt, GT_INTR_DW(bank));
> -			for_each_set_bit(bit, intr_dw + bank, 32)
> -				identity[bit] = gt_engine_identity(xe, gt,
> -								   bank, bit);
> -			xe_mmio_write32(gt, GT_INTR_DW(bank),
> -					intr_dw[bank]);
> -		}
> +		intr_dw[bank] = xe_mmio_read32(mmio, GT_INTR_DW(bank));
> +		for_each_set_bit(bit, intr_dw + bank, 32)
> +			identity[bit] = gt_engine_identity(xe, mmio, bank, bit);
> +		xe_mmio_write32(mmio, GT_INTR_DW(bank), intr_dw[bank]);

as I notice earlier we are doing the above processing only on a non
media GT, with your change we are even processing on media tile, was
there a bug earlier hence you made this change ?

Thanks,
Aravind.
>  
>  		for_each_set_bit(bit, intr_dw + bank, 32) {
> +			struct xe_gt *engine_gt;
> +
>  			class = INTR_ENGINE_CLASS(identity[bit]);
>  			instance = INTR_ENGINE_INSTANCE(identity[bit]);
>  			intr_vec = INTR_ENGINE_INTR(identity[bit]);
>  
> +			engine_gt = pick_engine_gt(tile, class, instance);
> +
>  			if (class == XE_ENGINE_CLASS_OTHER) {
> -				gt_other_irq_handler(gt, instance, intr_vec);
> +				gt_other_irq_handler(engine_gt, instance, intr_vec);
>  				continue;
>  			}
>  
> -			hwe = xe_gt_hw_engine(gt, class, instance, false);
> +			hwe = xe_gt_hw_engine(engine_gt, class, instance, false);
>  			if (!hwe)
>  				continue;
>  
> @@ -285,24 +317,24 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
>  static irqreturn_t xelp_irq_handler(int irq, void *arg)
>  {
>  	struct xe_device *xe = arg;
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
>  	u32 master_ctl, gu_misc_iir;
>  	long unsigned int intr_dw[2];
>  	u32 identity[32];
>  
> -	master_ctl = xelp_intr_disable(gt);
> +	master_ctl = xelp_intr_disable(xe);
>  	if (!master_ctl) {
> -		xelp_intr_enable(gt, false);
> +		xelp_intr_enable(xe, false);
>  		return IRQ_NONE;
>  	}
>  
> -	gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> +	gt_irq_handler(tile, master_ctl, intr_dw, identity);
>  
>  	xe_display_irq_handler(xe, master_ctl);
>  
> -	gu_misc_iir = gu_misc_irq_ack(gt, master_ctl);
> +	gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>  
> -	xelp_intr_enable(gt, false);
> +	xelp_intr_enable(xe, false);
>  
>  	xe_display_irq_enable(xe, gu_misc_iir);
>  
> @@ -311,38 +343,38 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>  
>  static u32 dg1_intr_disable(struct xe_device *xe)
>  {
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct xe_gt *mmio = xe_root_mmio_gt(xe);
>  	u32 val;
>  
>  	/* First disable interrupts */
> -	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, 0);
> +	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, 0);
>  
>  	/* Get the indication levels and ack the master unit */
> -	val = xe_mmio_read32(gt, DG1_MSTR_TILE_INTR);
> +	val = xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
>  	if (unlikely(!val))
>  		return 0;
>  
> -	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, val);
> +	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, val);
>  
>  	return val;
>  }
>  
>  static void dg1_intr_enable(struct xe_device *xe, bool stall)
>  {
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct xe_gt *mmio = xe_root_mmio_gt(xe);
>  
> -	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
> +	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
>  	if (stall)
> -		xe_mmio_read32(gt, DG1_MSTR_TILE_INTR);
> +		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
>  }
>  
> -static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> +static void dg1_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
>  {
> -	gt_irq_postinstall(xe, gt);
> +	gt_irq_postinstall(tile);
>  
> -	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> +	unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
>  
> -	if (gt->info.id == XE_GT0)
> +	if (tile->id == 0)
>  		dg1_intr_enable(xe, true);
>  }
>  
> @@ -354,8 +386,8 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>  static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  {
>  	struct xe_device *xe = arg;
> -	struct xe_gt *gt;
> -	u32 master_tile_ctl, master_ctl = 0, tile0_master_ctl = 0, gu_misc_iir;
> +	struct xe_tile *tile;
> +	u32 master_tile_ctl, master_ctl = 0, gu_misc_iir = 0;
>  	long unsigned int intr_dw[2];
>  	u32 identity[32];
>  	u8 id;
> @@ -368,12 +400,13 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  		return IRQ_NONE;
>  	}
>  
> -	for_each_gt(gt, xe, id) {
> -		if ((master_tile_ctl & DG1_MSTR_TILE(gt_to_tile(gt)->id)) == 0)
> +	for_each_tile(tile, xe, id) {
> +		struct xe_gt *mmio = tile->primary_gt;
> +
> +		if ((master_tile_ctl & DG1_MSTR_TILE(tile->id)) == 0)
>  			continue;
>  
> -		if (!xe_gt_is_media_type(gt))
> -			master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ);
> +		master_ctl = xe_mmio_read32(mmio, GFX_MSTR_IRQ);
>  
>  		/*
>  		 * We might be in irq handler just when PCIe DPC is initiated
> @@ -381,124 +414,125 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  		 * irq as device is inaccessible.
>  		 */
>  		if (master_ctl == REG_GENMASK(31, 0)) {
> -			dev_dbg(gt_to_xe(gt)->drm.dev,
> +			dev_dbg(tile_to_xe(tile)->drm.dev,
>  				"Ignore this IRQ as device might be in DPC containment.\n");
>  			return IRQ_HANDLED;
>  		}
>  
> -		if (!xe_gt_is_media_type(gt))
> -			xe_mmio_write32(gt, GFX_MSTR_IRQ, master_ctl);
> -		gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> +		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
> +
> +		gt_irq_handler(tile, master_ctl, intr_dw, identity);
>  
>  		/*
> -		 * Save primary tile's master interrupt register for display
> -		 * processing below.
> +		 * Display interrupts (including display backlight operations
> +		 * that get reported as Gunit GSE) would only be hooked up to
> +		 * the primary tile.
>  		 */
> -		if (id == 0)
> -			tile0_master_ctl = master_ctl;
> +		if (id == 0) {
> +			xe_display_irq_handler(xe, master_ctl);
> +			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
> +		}
>  	}
>  
> -	xe_display_irq_handler(xe, tile0_master_ctl);
> -
> -	/* Gunit GSE interrupts can trigger display backlight operations */
> -	gu_misc_iir = gu_misc_irq_ack(gt, tile0_master_ctl);
> -
>  	dg1_intr_enable(xe, false);
> -
>  	xe_display_irq_enable(xe, gu_misc_iir);
>  
>  	return IRQ_HANDLED;
>  }
>  
> -static void gt_irq_reset(struct xe_gt *gt)
> +static void gt_irq_reset(struct xe_tile *tile)
>  {
> -	u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
> -	u32 bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
> +	struct xe_gt *mmio = tile->primary_gt;
> +
> +	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
> +						   XE_ENGINE_CLASS_COMPUTE);
> +	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
> +						   XE_ENGINE_CLASS_COPY);
>  
>  	/* Disable RCS, BCS, VCS and VECS class engines. */
> -	xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE,	 0);
> -	xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE,	 0);
> +	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
> +	xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, 0);
>  	if (ccs_mask)
> -		xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, 0);
> +		xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, 0);
>  
>  	/* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
> -	xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK,	~0);
> -	xe_mmio_write32(gt, BCS_RSVD_INTR_MASK,	~0);
> +	xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK,	~0);
> +	xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK,	~0);
>  	if (bcs_mask & (BIT(1)|BIT(2)))
> -		xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~0);
> +		xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~0);
>  	if (bcs_mask & (BIT(3)|BIT(4)))
> -		xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~0);
> +		xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~0);
>  	if (bcs_mask & (BIT(5)|BIT(6)))
> -		xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~0);
> +		xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~0);
>  	if (bcs_mask & (BIT(7)|BIT(8)))
> -		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~0);
> -	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK,	~0);
> -	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK,	~0);
> -	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK,	~0);
> +		xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~0);
> +	xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK,	~0);
> +	xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK,	~0);
> +	xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK,	~0);
>  	if (ccs_mask & (BIT(0)|BIT(1)))
> -		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~0);
> +		xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~0);
>  	if (ccs_mask & (BIT(2)|BIT(3)))
> -		xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~0);
> +		xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~0);
>  
> -	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE, 0);
> -	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK,  ~0);
> -	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE,	 0);
> -	xe_mmio_write32(gt, GUC_SG_INTR_MASK,		~0);
> +	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
> +	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
> +	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE,	 0);
> +	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,		~0);
>  }
>  
> -static void xelp_irq_reset(struct xe_gt *gt)
> +static void xelp_irq_reset(struct xe_tile *tile)
>  {
> -	xelp_intr_disable(gt);
> +	xelp_intr_disable(tile_to_xe(tile));
>  
> -	gt_irq_reset(gt);
> +	gt_irq_reset(tile);
>  
> -	mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
> -	mask_and_disable(gt, PCU_IRQ_OFFSET);
> +	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
> +	mask_and_disable(tile, PCU_IRQ_OFFSET);
>  }
>  
> -static void dg1_irq_reset(struct xe_gt *gt)
> +static void dg1_irq_reset(struct xe_tile *tile)
>  {
> -	if (gt->info.id == 0)
> -		dg1_intr_disable(gt_to_xe(gt));
> +	if (tile->id == 0)
> +		dg1_intr_disable(tile_to_xe(tile));
>  
> -	gt_irq_reset(gt);
> +	gt_irq_reset(tile);
>  
> -	mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
> -	mask_and_disable(gt, PCU_IRQ_OFFSET);
> +	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
> +	mask_and_disable(tile, PCU_IRQ_OFFSET);
>  }
>  
>  static void xe_irq_reset(struct xe_device *xe)
>  {
> -	struct xe_gt *gt;
> +	struct xe_tile *tile;
>  	u8 id;
>  
> -	for_each_gt(gt, xe, id) {
> +	for_each_tile(tile, xe, id) {
>  		if (GRAPHICS_VERx100(xe) >= 1210)
> -			dg1_irq_reset(gt);
> +			dg1_irq_reset(tile);
>  		else
> -			xelp_irq_reset(gt);
> +			xelp_irq_reset(tile);
>  	}
>  
>  	xe_display_irq_reset(xe);
>  }
>  
> -void xe_gt_irq_postinstall(struct xe_gt *gt)
> +void xe_gt_irq_postinstall(struct xe_tile *tile)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_device *xe = tile_to_xe(tile);
>  
>  	if (GRAPHICS_VERx100(xe) >= 1210)
> -		dg1_irq_postinstall(xe, gt);
> +		dg1_irq_postinstall(xe, tile);
>  	else
> -		xelp_irq_postinstall(xe, gt);
> +		xelp_irq_postinstall(xe, tile);
>  }
>  
>  static void xe_irq_postinstall(struct xe_device *xe)
>  {
> -	struct xe_gt *gt;
> +	struct xe_tile *tile;
>  	u8 id;
>  
> -	for_each_gt(gt, xe, id)
> -		xe_gt_irq_postinstall(gt);
> +	for_each_tile(tile, xe, id)
> +		xe_gt_irq_postinstall(tile);
>  
>  	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
>  }
> diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
> index 34ecf22b32d3..69113c21e1cd 100644
> --- a/drivers/gpu/drm/xe/xe_irq.h
> +++ b/drivers/gpu/drm/xe/xe_irq.h
> @@ -7,10 +7,10 @@
>  #define _XE_IRQ_H_
>  
>  struct xe_device;
> -struct xe_gt;
> +struct xe_tile;
>  
>  int xe_irq_install(struct xe_device *xe);
> -void xe_gt_irq_postinstall(struct xe_gt *gt);
> +void xe_gt_irq_postinstall(struct xe_tile *tile);
>  void xe_irq_shutdown(struct xe_device *xe);
>  void xe_irq_suspend(struct xe_device *xe);
>  void xe_irq_resume(struct xe_device *xe);
