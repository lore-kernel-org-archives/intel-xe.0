Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71846C47422
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 23:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275DC10E1D3;
	Thu, 18 Jan 2024 23:11:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B8810E1D3
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 23:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705619514; x=1737155514;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=53BF3rEErXXrb92Y0M6n9MRxfb0C7U758v+SO5Y0dpI=;
 b=fqdyDnQh10FX5e8tAAO1aYwqrPZlhstoGqDH1I1FgbRBTHit4y2Z9dBM
 DX/E1GwT9CTt5I1slRQ+vM2oybaZn9eKKIlgm1otNOyDnqUK430LWZZ2p
 WuYpYSwzSShzlK0Xm6w8iIjvJXjv30ai+W4Ko/q5+FFVmQERdlJSEB3Gg
 x9mIRGcJZq3s3wN8zsznzkBnPR00LTuso0GUelevEFI0l0PdlSWMU7tio
 gGL2l98FjCfgqWvoV3YrEYVxrupKgnD4t+TSp/7CPR9Ylm1auNiatkqre
 5gVOjVV4dKLXEV8ht1ben7ljKUewwA/llodP4lo9obeUm2gQJlIwGbulY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7311424"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7311424"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 15:11:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="501704"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 15:11:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 15:11:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 15:11:51 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 15:11:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cA9QCSsNuYdWOQ5gk+JJDfepAaU5PgvZMflDYoOK2rLF4w/FOmNgdheYVsYJB9jbr3gs4DydM5o/IhHMti19U7Kmdf/S2NcwwAWx6LaNCrABv4Vu9qniTnrQC+MNjop9gBsWjjqc1Tlzgvmc0piY4eK3Oii4zZfS2ApaoRJVf8Msknl8Y/o5tFvzI3KGq4gDEww1wjvb8bdS3X/31QWR8OeuYxhbdmCgJv+I0y1kzG3ohIQe24095NKcqiQDzY8bBIEqVLP09puzFJIVhk23kqkGOSbvt29wDbGOe5PeEZ54u7wHv/8ls6KHYbvH5yeY1FYv1wyk8+H55TQnEr1n6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8NyURkcxK5qh5RPdnWKpPGUrv9ApbDORv0z0CarzMs=;
 b=LXjb52GxbA6x/h86OF6B1aRBZH0KtWSFEd5INb52qohUObUuFOY6H/ctZSL61QJzmUEhxDyuGvQOV5AGRqfI8nWI7mHYhsmBSQBEYte36OtPMO5GVYSoqbiqCdKvz9rpbrrDIj34vYpYOUuOjkbBE+U+CFIvK7wHBvmJO+qv8Dz0k7V9wuGnBNbtlXegmUhjGnFwgbi29WWZLVTh4LQtL00Fih/1qC/U9OyLa5jKnkU2ZCeFTMOBhJQ4J2B+XL8mYQnkUq/Zz/ES+tSe6gBqkjcyZCcMUqsFervvH54F8QKacywPJEh2S8Eaxex4cA5sXGqjekbAC1TqM9ad9kICaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB4796.namprd11.prod.outlook.com (2603:10b6:806:117::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 23:11:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 23:11:44 +0000
Date: Thu, 18 Jan 2024 15:11:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [PATCH v4 1/1] drm/xe: correct the calculation of remaining size
Message-ID: <20240118231141.GV45138@mdroper-desk1.amr.corp.intel.com>
References: <20240118222051.790432-1-fei.yang@intel.com>
 <20240118222051.790432-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240118222051.790432-2-fei.yang@intel.com>
X-ClientProxiedBy: BYAPR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB4796:EE_
X-MS-Office365-Filtering-Correlation-Id: 967ce8be-c83e-4071-3bb2-08dc187ad63e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VJl9WTenqOpX8oxzZxMyAeIvsUTSjnGwD1Ou/HcNUYWcXXwnlBC560XGli/sb55Ns/OK8CPoqOUgspfgaQ1HhouQzTqIxpqrGqI8aTYS8eMfWFshwCeAQzz4d6E0CMfm3RA0+dQpziWaEzszMHtkIrMSPar+INnz0HKkfUsGtoS3JBQ8g8H/4fLn6J5Z2KDsPp4vgp08J36S4wCfz4ilsrAccrj8VZapY1WWOlg2z7WYFElUYNHGPt3QdIIreS7wVqTR/ifAaAH9HDV5NNkOisthWoF4g2WrRfL8lTLbqkREgxS9q+BnzAOU7xeUCCfb1wyggwsOSJdbKMOp5pAmtipiGaEXRGpfrH0OdYZShGAY4jgluBRR1hwt9TpNDwmRywjUG0EtQ/P3JSnoz6bKtbNf1GmTyJtRVYs4iW8pIfQAYfUWjivwwDLvS8Ni6DLNDWTtRKi6aPRi+shX9ZfXnvPmRNvUz4ojoBYBUnoYQV8DF0qGoPZuPi21sqmmI9u+7JNh8j6fny9gV2yzh76Lpiv2dxNJIGQTfJJTPvFc0jzBg70ZYrnVNEHWlzqqLUaM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6506007)(38100700002)(86362001)(33656002)(41300700001)(2906002)(82960400001)(66556008)(6636002)(66476007)(66946007)(316002)(478600001)(6512007)(6666004)(6486002)(8936002)(4326008)(8676002)(5660300002)(83380400001)(1076003)(26005)(34206002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bo4zbcxM5An6iU4o/03hPiDsE/whb95JoqdYXkzj7GVALYX+qoJNSMJSbZgr?=
 =?us-ascii?Q?mp5Vfpm0XLycHS3SBFda4WDc4rYqH9Z//AoPfj8hYj5Mr8xgZ52EqU45yFjM?=
 =?us-ascii?Q?f8roZbgSC/LCW4W4I8Zj2MYXc+Gpe4lg1RxRa7x1bkKYk4CkTdbGQjlfmScS?=
 =?us-ascii?Q?f+TuvZGDDRVMGd//tviSTiDnzyoU8QnnDtJBjtlox7wADw2k7dY2xUHMme5h?=
 =?us-ascii?Q?4h4rp1rAowOU5axdm7bgski0qpMD0Bt5OP99Qd8Fr0SCjEoqdKkN0Ca3SuWV?=
 =?us-ascii?Q?ga9+/WobSUyvr/o1FI9uZz/9ovkhmUWOErZbKsaVBmpXxSIUnpYPwsOEzFQ0?=
 =?us-ascii?Q?DBZqjF3fRiOOAXzPIYf51Bcp3zUWyexRukVZqLtN3iPfK2A0w/hOEbopIg6W?=
 =?us-ascii?Q?GUrVQm9olH4pr4jKH62Tf9oKcgmsG5khoQFmCf9f8y87GXPyZGb5O6jxZeLH?=
 =?us-ascii?Q?xeZDq4SiM63lsFNFvhFxZATp/W13njiEXuyoV4QzFN5z3GnBVIPe4ZqQYpid?=
 =?us-ascii?Q?F66R409L2JjNgYByTuX2c4roKb2j/iTaipn2RgYWzEjlBY9gY1LX3Ryga+BD?=
 =?us-ascii?Q?BExos6+GJxE+ZlUlK8fbY1vAj4gO+zDZ1Dc//4Z7d+Ak/jOdRcCqSkwT5mEJ?=
 =?us-ascii?Q?FkLInmnewfZeCNFmcD5OGZM2edmxy3flvNUmr3PAYFl06+HQlHxdJlP5bQHn?=
 =?us-ascii?Q?XLXblURuhct00PskMs8E2lP0uNUcwiiXgLjLQx7HuQSSujV6pqwwVV3N8zRe?=
 =?us-ascii?Q?eOgdDaUOj06o5TUNJ3vzm/VkRrp5WntKtTr5CT4o++oWEhD3Hh/iVK5bHN0q?=
 =?us-ascii?Q?0xCB8+RiKEu5kQaI+m8POTi7fmRhP2EDhb+gpuD9zDAX267RjNQ2u+rAPspB?=
 =?us-ascii?Q?ry15i728T1+hcDIM1CNJ+tifEeHio1B10TiMtcpIoU6Qy1mB5dcrtGvvStPp?=
 =?us-ascii?Q?skXnwIeM4ikbi8FU874NlMbFi/Y+Y6YmX6tYIuxWb31yBD4g5Lcc9S9XrmuP?=
 =?us-ascii?Q?2APJI9vAqvCjwDOK1bgwnXNVAJ6ARVpNXKBlppwvozMwr1N8d7vrYgICvZ8v?=
 =?us-ascii?Q?qrMgLOhG9T3o5YkUaNZhBb9OBiaObN8KChhOQZqr2mcMOWKuT1kP84FcNhJF?=
 =?us-ascii?Q?8qw05F+amTv7sf1+pN6Cw62Mi4YiGAxw5K8Zc4tfCSIZzz/UaOx05OtjaJG+?=
 =?us-ascii?Q?gx6GHxdCUwFX0lIEEsqfWKqXk3tt/qvxPR6C0HtPe6X5po46O2s5EOx7/yEy?=
 =?us-ascii?Q?IJfHcflVqCdcL4U/ghGo+LJ23fS0XdrjlZOVGE1C364eBOzxpcJCgDh4oQs4?=
 =?us-ascii?Q?eWl7zztX2nuZIM1SCs+91r4eFnv3l66jE+IU9jgcboc5IY5wKHrw/1+lw9Nr?=
 =?us-ascii?Q?r9a1WCrVbqaIGk+akavhRqyZkwSuLj17+4NTgeqSdbY9RCfRPulzdQbP9tPz?=
 =?us-ascii?Q?yzlPcLoGSFj02HFZKqhuFf3tbVhhEJViu9+ao+KQpdXajma+feHxxXtEocLB?=
 =?us-ascii?Q?HIL066D9+MW1XslQlCik6Lhm7aeBpE/4dVqDC5fiozE8XjvQsOixHe/JM3FS?=
 =?us-ascii?Q?wXkaRhBp/g3qXnqd0ApPhT7u93+qgZ9K8pr18OfB3YAU/NSu9PIkU0xifh5I?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 967ce8be-c83e-4071-3bb2-08dc187ad63e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 23:11:44.0237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vroYcAtU/JwSoa4iFttOGSIe1r/M4+VRBKZrZZMTUVAaO5CybrLkET2GjqerfGvlzMBnCmOidiG6IKfewAoChTx13ej4k0ug+yNlBQKeRus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4796
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 02:20:51PM -0800, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> In function write_pgtable, the calculation of chunk in the do-while
> loop is wrong, we should always compare against remaining size instead
> of the total size update->qwords.
> Also correct the assert. While one MI_STORE_DATA_IMM can take no more
> than 0x1fe qwords, the size of the pgtable can be 512 entries.

I just saw this v4 after I merged v3 to drm-xe-next.  But the assertion
change is logically different from the loop bound change, so it should
probably be a separate patch anyway (and with a Fixes: marker too).

Also, it would be best to avoid using a magic number if possible
(especially one written in the manner that makes it look like a field
value).  It looks like we use XE_PDES in other places where we need to
represent the number of entries inside a page table bo?


Matt

> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 44725f978f3e..04e9f723d316 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1107,7 +1107,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  	 * This shouldn't be possible in practice.. might change when 16K
>  	 * pages are used. Hence the assert.
>  	 */
> -	xe_tile_assert(tile, update->qwords <= MAX_PTE_PER_SDI);
> +	xe_tile_assert(tile, update->qwords <= 0x1ff);
>  	if (!ppgtt_ofs)
>  		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
>  						xe_bo_addr(update->pt_bo, 0,
> @@ -1116,7 +1116,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  	do {
>  		u64 addr = ppgtt_ofs + ofs * 8;
>  
> -		chunk = min(update->qwords, MAX_PTE_PER_SDI);
> +		chunk = min(size, MAX_PTE_PER_SDI);
>  
>  		/* Ensure populatefn can do memset64 by aligning bb->cs */
>  		if (!(bb->len & 1))
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
