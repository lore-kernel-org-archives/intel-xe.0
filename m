Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622CDC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 20:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2006310E66B;
	Wed, 20 Mar 2024 20:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kl7gQBEo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A43A10E997
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 20:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710968298; x=1742504298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZK+/DFf2/g5wTAhmq5OQwaPlL31Q6bRP4Ih977rKcho=;
 b=kl7gQBEoiXJaK+UQtMUxgtNvs/g8b0DLCzZqrs7g8YGnr8foELpt5qYa
 gXKDtqwXL6mjvBaBWJK9q989NTpPg+vg0UQJwn2C9QKTM8Q5RShYZhTNa
 nyk+ZUPUJBSAnhagNUhaLAw3ofx+iQCbHbXsL63HCA2ZGk++Wt7eF/uzj
 tvVGKHS3AyBGRkemHK/gAnk13Aaq/cZZ0WyknwZcYQ/d8iVGVWx5zUuGZ
 cZKxhy7G5beLrkBWTrxCPVwJb2MP97ng5GqBrJz2yZ89s6preM3RctUoD
 h5So6hBvwj89F8FGg8G0baoUcM0sX4iRRN8m8SFEv4+pwQatTryRETGrm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="31358342"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="31358342"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:58:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14348783"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 13:58:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 13:58:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 13:58:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 13:58:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHhhfhuOZgZLVLowr2VZgCm7KXL8LhxC52k0b2nnW5taWm8GCxV2n5AB/CzJ2gyC1f2iaAvyfQeXNzcqvr1Qo7nk7E6jqHW7KwmHI5jvnKlAUYp27fBN+9MgMdGM7mo6UhNJCjCr+jpd24hVqNyCglPCcoTlWUczubDdYZ30VLWk5B+C9lsUHqccxpMe6WxeUE9FOPbjdxo+Nu9ozR/AM2u6bWvHa3SWuIGJ9mtPdGuJhhLZgx6IgLeutaXmfyQbwWPUZFe7Ws/xxyrpSaP18QsCaORpkLAVlpGTDJctS/ZYCDqmnqp55REuWgvjbugvrnlXaJXJIGzLXWdtxwb/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuiFMfmL5ED44i0fwZSbd8SXhotovzVAa+TIbbEdndE=;
 b=NBrM7s/trqgSgPnRpZKNtuKbp/x/X8XHAjGNZ6eCmC8MzW9X8ikuk0sJ90W44nKt2S9XAXT4Baqd3QSoga5UDCNXoBUdbToSOg/NBscqP6y6XhcNRcn0PadXR73AXslGTH4hcqy4lfKGdECqoiCO2aFPftcjdMnh52fsdjwFYgZAkr0+VSONcUyriBSe8w+1PbJXkFdqsZ5+STRtDLyuHl8kZhT9gxBaWKtTD1e8Nc3xaSlL3zHkeci5dDekRRAUHnKfQ6npQ2RiLnDC3m3GfBLr4ZxTXqYoxdmRgcuyCiIwLRx8gysX/XjZMwCHqKYsepArTGS7Xi71hAc6nZUsiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6860.namprd11.prod.outlook.com (2603:10b6:510:200::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 20:58:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 20:58:14 +0000
Date: Wed, 20 Mar 2024 16:58:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Use USEC_PER_MSEC rather than the hard coding
Message-ID: <ZftN44UvrDaqqivr@intel.com>
References: <20240320083325.3258720-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240320083325.3258720-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR07CA0047.namprd07.prod.outlook.com
 (2603:10b6:a03:60::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 177671aa-116f-449a-40f1-08dc492075ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: covfAm8H4u+RwDRjh/Vm6g1XQXwPbS0H3tsrVfKNfZEkV2Xjv/ZyDHecofvM5GVm7mFo8d0wtrCJYCwp8lo0R7HmvBHwt4pr32vBEGWtO/s/oDrn6C8d8GSop+/F3l1kQ7kUhg3czo/wlUcMajpBLK+3FQoId85OuGPKO8OucOdQxtTbygFPRUQ9KJuTayQiSYt6zh8pbDQix9oGAo9gMekAR1NwCf8368IbCwOJFQbfpiA3rL20Sl4OLwyXIIZuaQDngBTaqfbv4IGSQ2GO86ztn71v7soxhDd1Rc+J/pTmmtXK3mP+8iJ9+TngL188ptaA5RYPymtKJc26hmU692Z4eOeYLk5sPMIW50Mre/oNNjPq/+b+JiZRPtHNUEcH65RtFXrw46hZv9l9zJG25EV4SQmU5ztivAgC1/b8vbv7B/4HaSXjWINvyUXrXLQWe6yxnlrCkpon7kSX8JJivtucW08nTi9TTtb1hwAdk3cVlzo4pUoihMrmM6Z4lZWE4Peo5Ovb69y9xRfGBrPZNBT0X05Qy/Q6aTRQPCZX2hGkuNFBOVyZp9QyHs/caSi7P829yDy8x6wsVl+DYJ1w7GZUro8gh5UqiU8h45RKII2a3daRzPnYH4HdzAGw/VmUMneu51DS7JDS8PCv9/y9VKbNEsWahPpcRfp1JBcWM1c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p+Dbg0t83RYJl3RZ1ePfjhmA7md6Y+nAnlBkz8LJP0msET+ZHTjc4mCmJSGr?=
 =?us-ascii?Q?sFyksB5XIQWNhjqBR8+Wyq9ncnVVh/jUBQkXKFPSoYKZIidvzdoGYsfzju4I?=
 =?us-ascii?Q?v4iiokt8VbuCPrhQNUr2c1ZXH5O6Ou86EU+D1xzNaEdaHMkDOu0vQao99Vpc?=
 =?us-ascii?Q?R3qyhstyUYT1S0DFIzwL1ZihDnDSmJ77p0Uxys/bM4dbgyymf2ibb8l2EOfS?=
 =?us-ascii?Q?LEdvNQpO6HcwL4TB63vPcVJ87fuMWYWFDVTrIK7WydsLhaaB6ea4k3sTkr1g?=
 =?us-ascii?Q?gAIBjQqd3kkRM9G3umiRbrj4ukOzvHC7X4dy8DiSYOxKxean8sHKVA6NeufE?=
 =?us-ascii?Q?cHhyGtf9ITK1PWr6ep7DspHE6O8lFBnpROCXGiyMmlSFNBSeGQ8TNvC7NdgM?=
 =?us-ascii?Q?tbrV/rTAC6eSXDZZUH9xTDC1c1LVepWxs5uk1bx1g3NL7DHyRP9ZoMLtfZj0?=
 =?us-ascii?Q?4YmKmMxryKvP/7MHGfke4gNby1KJlqlGfM5e1loZhXSinb2l36kPwiyCQ0pb?=
 =?us-ascii?Q?sGRk4sk6xM7KRGiM2/8zAIvFY9dM7wVhl8pxQVlbfIRMR95g5/xs5NwjHItw?=
 =?us-ascii?Q?OvRVLiHpz+3PsZqjnMkaWEIIlRhFJSOATR7h8EQT0pOKBlvGV7+H3n0CvDwS?=
 =?us-ascii?Q?spRVnMCGBtMMtk4zQucflfFgETnTkCdEEweItbiYzghwZb5kzNrk4lg6DKl6?=
 =?us-ascii?Q?Eym7m4Lj3ONIOdqtXihzy5NtNQzRyXq4h/CyFfUjsNWfGHewWz3wztlnVoMy?=
 =?us-ascii?Q?K/IG7jxiarTo/Xk6alWz7q8QI+eeiXaFnZ4FKLE1eG7+2u5g4QOeD77jhHpW?=
 =?us-ascii?Q?znBAW0DlKwOqr3MBqYr/A7o+IKOVKPA/book+S+PkZ+hrqe7RsfnSkSLHGHm?=
 =?us-ascii?Q?qwFI6qMnU3A0I2MmHZP8C8lA9MsRX8pzJQsuby521fAyLNJdz8CcRJFHCjNg?=
 =?us-ascii?Q?NG9zAl6Q9/iduInhoPN7w6tELUsTs960yjFpwRCdNGIM+sT06GpXDQNlFypR?=
 =?us-ascii?Q?teYheQN4Wm7NWt8ETjPP1sIGpWJDWUT+jo+EpbpVsdZl9yjbDwxoUH4lrswR?=
 =?us-ascii?Q?WQx7G/5t4wRRIdrUJuaz9KNxWZ8a7xjugcqebW+aEgawUBJTaN72JbhsU0Ym?=
 =?us-ascii?Q?NbcSDX3uzt/Gf/0NVsaqv/vzEYdEbY2rR1hN7IVBgoNRKT5nUAKxQC8P35BH?=
 =?us-ascii?Q?HgSUbtd0U9+ujOA8UtEDnDxaD2uKa3tHNaPY3uAEQ5UFFBYzgMnf+oOA/PM+?=
 =?us-ascii?Q?D22cF20hFt9cEYsQXcPxhpgkRDwCUCq6yYTsUZ6XdIX3kK7slgfFXS72xfSk?=
 =?us-ascii?Q?NrDDlv0a58r72Ld2NFpCFlOSHzdwV11rUdhSnwigqyavvFMjylrB9Q0LWL/P?=
 =?us-ascii?Q?ZOqaWP+pDoGh2y8032o/yF/1lY6Dkz92PhfTHWZIy/eY/7BKNlxBNg3G4pmk?=
 =?us-ascii?Q?PdbS/Ss7MTxvaCLVTCAKhxpH9LB6My4TehQ9p0SfwoVm8riclEkWbY+9ByAN?=
 =?us-ascii?Q?4XsnCx9uKNyK6SqgAcKWVi/jQApJPbhgHS99a0LRUeUdeS/Z5T9xvdiwTpD1?=
 =?us-ascii?Q?mQWJ4kqCasWEGsX4DeSr2cpOq78b9ZPgkfX2Fg+a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 177671aa-116f-449a-40f1-08dc492075ea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 20:58:14.7876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izVEAap90zJ1EkRo8fapLmMA84A0ssd8m8+nbhWP1nkzlXWp0degyBT0AQMpINDDuM77oVySvAwLCLax8jlDWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6860
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

On Wed, Mar 20, 2024 at 02:03:25PM +0530, Himal Prasad Ghimiray wrote:
> Use USEC_PER_MSEC rather than the hard coded value of 1000.
> 
> Static analyzer Reported "casting either timeout_ms or
> 1000U to type u64" to avoid overflow-before-widen.
> Using USEC_PER_MSEC seems better and will help with static analyzer
> report cleanup.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index b324dc2a5deb..627e094c7cbe 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -74,7 +74,7 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>  	xe_mmio_write32(gt, PCODE_MAILBOX, PCODE_READY | mbox);
>  
>  	err = xe_mmio_wait32(gt, PCODE_MAILBOX, PCODE_READY, 0,
> -			     timeout_ms * 1000, NULL, atomic);
> +			     timeout_ms * USEC_PER_MSEC, NULL, atomic);
>  	if (err)
>  		return err;
>  
> -- 
> 2.25.1
> 
