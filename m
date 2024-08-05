Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07A2C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 20:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932EE10E2B1;
	Mon,  5 Aug 2024 20:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+E4N6Wt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA7110E2B1
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 20:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722889859; x=1754425859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3KqPgUFCetOvez8PSxLsOO10WuZ2FnblZFOhG3BK9wE=;
 b=b+E4N6WtErTlkXXiNLczD3SeRmV3znzpgWyxHZVrs3hpaXARdPSgJ89w
 hjONVRIxX6RF7WLsMXM6Ekjddr+hABMNqq9XYarSIAqZMFrVaj6tE5+si
 wtuKeEYw5lwokExRSbonG9OTTzKNlZOXY97g/xK0VgDZL7zSqBhqxid2+
 OMDhw89oLliB8bLJUP0BiZDRpKRVWd2PVQYyxjnZPelEArVEgdFKIcc30
 6iBQYWlzcwo6BnSZz/DtBKK77kQ/TJOUETp/hHlyScvw1COIwwnbIJsnM
 lJdfsorwNLSe6s7/Igv9bXMKXEVreG55RX1nghOxJqC15aROCs8Qq4TYY A==;
X-CSE-ConnectionGUID: V06BY5LNSqq8Ujg9pwMyng==
X-CSE-MsgGUID: Dlh8bZJBQayyDTTyY9SN9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="46280356"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="46280356"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 13:30:56 -0700
X-CSE-ConnectionGUID: f3PVIzk3QGSdF2zrJdwHHQ==
X-CSE-MsgGUID: L6vgT9UUSNmpdJaN5dCzyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="56373111"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 13:30:56 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:30:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 13:30:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 13:30:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msTP9IZO4H/XjJYcjeIrsgn2QthDurjyuBnnKzQw1cLQebbHsep0RCm/QOXNr2f0nszMd+o9PckcD3hBIL0lVdsuNlSpKEoXjs8rOORq468syoroq4e0JTLrAv+5xAr8FeKWyhjT2PAO5h9v+wqpHtQcMh4ivJPKGT5d+gUHKPyawGahLLXZQC6g8aLycfg09Beg99gDkn58mrjgnhybbLOhxfbvmqneuay4mxgjC7zfhLsx4fElp6sFh9N9l3UyZpW+m53O9RI1kC7CGY1GCIjzjM/LD8PRgeN4tqJmLPQ6w7hio4eExnPZn9j7REPlWgtjevS7qIn/7Sr7o8nftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnHZM1AYSmCT47zzbCny9qgTe4oO5r4ovmympVHI/rk=;
 b=iVZNEp6htfd9I9gHVgIH21hVE5kiJyWF8ub8u/L00xeZRiizKm/eOmKxIQE6zM//RjZvbDlYehkcqhINdfkpjgkMPK1FCu8B9A5xqmM6emf4AIDNjS99/kha6und7HVRY8RCYGFivhO1LHnsxC/1bhDMHjvQ9k6pL+ySc6KFJi6nKels4cW/QB21TlwiSLem5NiD4hQm6cQQddTz8SXo6rIGRE6Dkyk3C5rPfmJ7e9mJ9tq9BSIOQIKaHFvcNyyOYZXvgpv3aPEDK5gQqOTL1h462dEHmYIx8G8IXos08iJgnLuFKi9krUCEGQg/lkQ1OiAYNeP+3R1ZkKbeBpPwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7044.namprd11.prod.outlook.com (2603:10b6:806:29b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Mon, 5 Aug
 2024 20:30:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 20:30:50 +0000
Date: Mon, 5 Aug 2024 20:29:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 08/13] drm/xe/hw_engine_group: Ensure safe transition
 between execution modes
Message-ID: <ZrE2NR1nFWfSRlZ8@DUT025-TGLU.fm.intel.com>
References: <20240801125748.355078-1-francois.dugast@intel.com>
 <20240801125748.355078-9-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240801125748.355078-9-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 59191644-105b-4c68-02bf-08dcb58d7ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TChAu8MsbCGeVxI/VimsE+QaEpqkbfrwcR75muR474BxSNeqX/Q/LIdQmj13?=
 =?us-ascii?Q?+fhyc6+CCIZ8RoHZpF3uNfq6ce+cHxOk8jeecLmugMZnbiJG8khC0EcJZo9y?=
 =?us-ascii?Q?YpTbfm8i6zFOqex43MOalfQrc30UHhYsH1AUCJXidSbDHX/+69fMrxQSW5s1?=
 =?us-ascii?Q?99MLgN2q0d2lwJZVJ6+Vm1iXcQSW336RYkf9kAHrUvKVKVs9idjbSctiMuF4?=
 =?us-ascii?Q?ofsIyqorsnIyKBEk12dbGpPkJnJoT0eED/UWOVteE/4MGlfjJa2B8ld1Mnfz?=
 =?us-ascii?Q?sRaIg3wX56i3o7XoAle6cADMi9X9McygNY0hTMwuRsAjl9rTGOLOsty779aG?=
 =?us-ascii?Q?8wqtm5SGX1uYtQhx9kcdcgPAZVg4ZUqpbU8u/GcnLti85DDT5kWW/rVCbbXK?=
 =?us-ascii?Q?uKyUAjBWVGMlwj/q57d8m5QyV3gV8FOrZ8SAe0dQsTzziFUuDWxVU+K7qkUX?=
 =?us-ascii?Q?V0Fqa8svUrfqThbn2+ps64PPjmXtpw2RYOZwO4BiP20fRwmFyLQUOORXY/JM?=
 =?us-ascii?Q?gERHor1s7/MSGkrVZiwECpm00qkCGn4fStpswExaCsSTO3WSyaoPSZIrVtD4?=
 =?us-ascii?Q?ZoNl9OW7cenNqTXwrsft2LBGC3sUzfcr5I/y+8YpaR98cnTXDTsaWsRBLnuM?=
 =?us-ascii?Q?GnDN0xH8lIqeoYyVIlvoKk9Lpvo4OSZPA2jmTF6RMPIscwgWU9h1zTDpb82N?=
 =?us-ascii?Q?KHb0U18025PJnISRZh0i4bvsrnKuFbldGEyzraJPPP9fB8ISpFvt5m+pyzNH?=
 =?us-ascii?Q?Xf0emh3qEYG2PDqChPBUB0c9Q9YpQUIQmprFNSS043QFvYb0E4XSYc3nuwMz?=
 =?us-ascii?Q?d1xTGe8nFObkgIvrlM9mv45cfRxu6Hf/uZqsGYkyGR/tQLwjzGKXl+T+ejgH?=
 =?us-ascii?Q?SepEi2DWV8E62mheU+i7t6/jYCYqNn83jrk/Ky/yMQ/9XQhJ7c0oTKD3Wx0P?=
 =?us-ascii?Q?ShHyovPcjDWe9ZMYqBTiM1inpFJtX2lMTEXqZrLPWk9OWxOEWUVuDwDlHV0k?=
 =?us-ascii?Q?MsYUg83qo5JhfLMIkjxnGpWWXPvWgnveRZhYGBW35y9LezGyhzxdPclDkksT?=
 =?us-ascii?Q?va9Ui1CQdXpyr2mIGICsHTYJRVf+ZSEZ2kuA3ulKuLb76dSiN/cn5UbzeTQD?=
 =?us-ascii?Q?f/nAZh3rpAUxwA5JZyUNrdUFkICGWdwyr1Y+3Hh/j13gxTBfbN7T5242BrvM?=
 =?us-ascii?Q?tnTGOGugRZSFZJGsuFH5p02YtE8ldNKbQDHyGsUngJOKNVAbDiKnhsrijNa3?=
 =?us-ascii?Q?YUJP6a1NPNdQl9AU/F8xZ/F76SELumAozYS72PmSwDfWXPTF88HFbEIXYALp?=
 =?us-ascii?Q?2HgO8EyqZhLY73lVev5xk8yQG6M8Jsgq+oiU9gDCV6aezw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lyjuPw1BRhZT+geCnQugBheETXjYOMa8ycTzexQyWsMEwFIxUwmmLE99aEsb?=
 =?us-ascii?Q?VVK5tI0PcIH1yuLLag5iZuJ9V8QRKQ6gqyPrSSnrATLdbsrW7I+98UIl8xQ9?=
 =?us-ascii?Q?e/d2KVFn7KI21iJr6YmeGG2W5CvSLsbwEAlX/3BLwX/sA5jZvvqtUID17PmZ?=
 =?us-ascii?Q?pqVjTo4MV9RQeWDhosHO9Lggsv8Sc8HFJn4GbdiWoqPHMyIciU/CbH5x82+1?=
 =?us-ascii?Q?jtnMfhbriurZsuXDcDCZ0uZod6U4zR0xMae4IfqVlrRaaGh7ve7OKs8EdU88?=
 =?us-ascii?Q?eUPP67UxYp8cn6ukgONObeEv5778YtWBcWuY9AcSkdiGRP5T2x/iDinhoVAN?=
 =?us-ascii?Q?U+2SfEY/Q77IVpW4z/PMVHnc6S5PtXfcdLkVtO1ezk28yqZiV09f4o3N6jai?=
 =?us-ascii?Q?yM8rfq5oFqB4uXmxwB/Gpq0KLS4lCuoKiAXWTeZHKME8WZyQBQOEXey/e4Xh?=
 =?us-ascii?Q?NmT32IlI24UdF1m7JiBjFPabtMJ6vLCTLT89hxaJwbzNw0mI7z3joFTq5nEB?=
 =?us-ascii?Q?8vrULgJVF7NDZdJEBtXUH+ZMcwwtk2Puu4ZIIRXTDUFJWw8HbeJed9A0f0B3?=
 =?us-ascii?Q?EO16afYJxfoLESsMLFNfSZ+nKaODZfuIRFqu3rbiTZXqOrdt6Q3T4Gf+N59W?=
 =?us-ascii?Q?PfCia9kIFJmsoWBxufGzTzJsqFMPIEr2TWw3E3NnfzWD/uMF/4m7xbmjlo5n?=
 =?us-ascii?Q?2nkWPPaIIeK9XF0VzbG6+dHtozMs3yahniMNtYZOFYYhLGtefKK2LCx1/2zl?=
 =?us-ascii?Q?eHjJumSOF958GEeuGETNdyk05LXApizgAK9zUIVqQffvNy3YDNdt5EQh9XfU?=
 =?us-ascii?Q?BXJ4/x2u485S9WjRinonmAYZ84w6PeJfpkJC/CaG5fUSf/pxlM7Jf3cp/KHl?=
 =?us-ascii?Q?b/d0f3UPwus73afuXc6QFNG4DN7IbPgR9GlnVhXk1NymVuVf7TcPH8tozMLq?=
 =?us-ascii?Q?DOBH9eMUfIUzG+M/69n8Ns6jEjdqDl4Se3P8MtgyG3As82XH+HX1F5NsNzrQ?=
 =?us-ascii?Q?CsplMnVCOPxF294UZyi3tPxPHfqxO4LgWnxOJhDElzPrkh/yLX67uDLyHhvd?=
 =?us-ascii?Q?U/Gj5irFoRnaGrIxEhELpceV4mrKsHPsWE27HkSUk692aqC+ImZ/eFNH7bIX?=
 =?us-ascii?Q?dDlyPq42O/YqessI2wZyTr2l2p7fYRw3lHevOe1aZoKW5cPN38yZLiOl6H2S?=
 =?us-ascii?Q?uodAkTLmJZPGdUaIJ4vAA1aUrwga8yU4RZgSgLSFMv/b8g/8mrGl4H+qWxMa?=
 =?us-ascii?Q?QtF4ymJiB0NpQpD1fGMCs/P8AaUmQgGDQqGhanh/woC/TaJ6q+6ITYpLos4J?=
 =?us-ascii?Q?ISFRUIBmEymOTSpXulaHdpqoFbuvUBSW6YGWcgExgxbbsjM/rCYZEg7c+RhJ?=
 =?us-ascii?Q?v0L/ltZpnKK+Sp6LrDR559so0Ix7Zih3vYjkaZoMUWAonQ64dYOxdxtetXaR?=
 =?us-ascii?Q?u711l7xqiYMXTHeH7P6ANx14dvbWCoZ/kC9bkGO2jXGJ4SYXIpOzqd1JZ1Hl?=
 =?us-ascii?Q?MoZ8AMGDlk2w90+8rU4LT8VzpiwDTZsQ+7AqjjlzsAG0KOj4a10UB074bQ2S?=
 =?us-ascii?Q?/1PkylcL78u8Y6Yb4jy0vJqgG2kU8ezWFemo9NHdNbem63P1/Fxf3jfz8Z2m?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59191644-105b-4c68-02bf-08dcb58d7ed5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 20:30:50.3858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUyFMPLTiWm6drA5gTBMtmpnCLSW+mlKRcUE73aLzTBE+X1mlLGt2QCvln2Lab1AqH7TPDaDzR7MEfdXneeagA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7044
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

On Thu, Aug 01, 2024 at 02:56:49PM +0200, Francois Dugast wrote:
> Provide a way to safely transition execution modes of the hw engine group
> ahead of the actual execution. When necessary, either wait for running
> jobs to complete or preempt them, thus ensuring mutual exclusion between
> execution modes.
> 
> Unlike a mutex, the rw_semaphore used in this context allows multiple
> submissions in the same mode.
> 
> v2: Use lockdep_assert_held_write, add annotations (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 71 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_group.h |  5 ++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index de057c98d5a5..a5754e6de7c9 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -208,3 +208,74 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
>  
>  	return 0;
>  }
> +
> +static int switch_mode(struct xe_hw_engine_group *group,
> +		       enum xe_hw_engine_group_execution_mode new_mode)
> +{
> +	int err = 0;
> +
> +	lockdep_assert_held_write(&group->mode_sem);
> +
> +	if (group->cur_mode == EXEC_MODE_LR && new_mode == EXEC_MODE_DMA_FENCE)

This seems redunant, how about:

switch (group->cur_mode) {
case EXEC_MODE_LR:
	xe_hw_engine_group_suspend_faulting_lr_jobs(group);
	break;
case EXEC_MODE_DMA_FENCE:
	err = xe_hw_engine_group_wait_for_dma_fence_jobs(group);
	break;
}

Matt

> +		xe_hw_engine_group_suspend_faulting_lr_jobs(group);
> +	else if (group->cur_mode == EXEC_MODE_DMA_FENCE && new_mode == EXEC_MODE_LR)
> +		err = xe_hw_engine_group_wait_for_dma_fence_jobs(group);
> +	else
> +		err = -EINVAL;
> +
> +	if (err)
> +		return err;
> +
> +	group->cur_mode = new_mode;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_hw_engine_group_get_mode() - Get the group to execute in the new mode
> + * @group: The hw engine group
> + * @mode: The new execution mode
> + * @previous_mode: Pointer to the previous mode provided for use by caller
> + *
> + * Return: 0 if successful, -EINTR if locking failed.
> + */
> +int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> +				enum xe_hw_engine_group_execution_mode new_mode,
> +				enum xe_hw_engine_group_execution_mode *previous_mode)
> +__acquires(&group->mode_sem)
> +{
> +	int err = down_read_interruptible(&group->mode_sem);
> +
> +	if (err)
> +		return err;
> +
> +	*previous_mode = group->cur_mode;
> +
> +	if (new_mode != group->cur_mode) {
> +		up_read(&group->mode_sem);
> +		err = down_write_killable(&group->mode_sem);
> +		if (err)
> +			return err;
> +
> +		if (new_mode != group->cur_mode) {
> +			err = switch_mode(group, new_mode);
> +			if (err) {
> +				up_write(&group->mode_sem);
> +				return err;
> +			}
> +		}
> +		downgrade_write(&group->mode_sem);
> +	}
> +
> +	return err;
> +}
> +
> +/**
> + * xe_hw_engine_group_put() - Put the group
> + * @group: The hw engine group
> + */
> +void xe_hw_engine_group_put(struct xe_hw_engine_group *group)
> +__releases(&group->mode_sem)
> +{
> +	up_read(&group->mode_sem);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> index 857a83787504..e0deb7c7bb5b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -17,4 +17,9 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt);
>  int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
>  void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
>  
> +int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> +				enum xe_hw_engine_group_execution_mode new_mode,
> +				enum xe_hw_engine_group_execution_mode *previous_mode);
> +void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
> +
>  #endif
> -- 
> 2.43.0
> 
