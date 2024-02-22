Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FCCC5478C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 21:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A130510EA8C;
	Thu, 22 Feb 2024 21:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2JpFNPO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CFB10EA8A
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 21:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708636605; x=1740172605;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DR8kTY7jttyMEgyoz/lO5+vOpvi1Q3NzSym9k5UZLxo=;
 b=K2JpFNPOjMuWUNgLSAYUI5CKs+32WYZfaKJtSryA8hU9tlTV0e8G3lwI
 DLZWPiknYDPNG6I0UhTznuy7GiKQstPVRMRX4iwJOWrVYku3TKE57vwjZ
 eLVFfkphfHcm3diUAgaMaYoyl0ePC6jq/U2DJt2BXgufLy4f8+Wm8lVti
 KtkSJdby8q8VWuFotVPRrLVa4TT/KuQYtrj0hwiighBsi4uedXmC2bjaf
 6NmjRWjr0+MsMiL3cbMs0h92aUBij/agpFzgeo7pcFmrBEy43ronkTZ1Y
 W1hQ/IDvAcDKhhqJ4JlVRTi6vD/LYSvKfCdW5ixXJ23GQI1co5cy4cfAs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3024494"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3024494"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 13:16:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="36656221"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 13:16:44 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 13:16:44 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 13:16:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 13:16:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/C9l0VeglnJPlY9xrzXtISdBCZEYIvXq52YaWj4+y0gyP5ioyMocblFlvo44T8RuiYuEkYi5NMhv0y3qrnseesF1Pt74aW+EuCH3iFkIUyg1/xtqdY4y2l+DhEhefNg+bK9QFTFgTtahgRHdtZSDh2+BU45Rh/YE6gKbm+z/xNHSvAFPIL+aBy4rMyCVmo+V/zE/tDAFOIKNIT3OC4ZiJ0DTLUQxYcwf4Yr047Yvh7iY3BZTMcT5zP6lzQZcTcwzzHYQcs8ylRlA99iL0rg7bqk6Lb1IK05EUKpU2u6znoJ/umEsaLt41+yw8TCmM87a4JeVFxGkXP1U0BrFktGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fArkzAYkpmXAW31UaQXXfwfxyUEFKBewP6GRqV6cOKk=;
 b=LnAtxPp3rkG4WMx0fFsxdMr77KxfhvGJi0JrJIn+wZwtnv4enFP7cOnnjywof2v1Jz4Ondqe0IBbB2QwH94vBI+b87rkPCYnfcZntx51EdIi+6kydmD8fCQk7NtluOs5Us5wndVfVcw4Qxbr280csxTJ4CLSbGuuCZyJEybZEj62rhCpvUtG785tBKHZ5AmRW4DEYvRJiyd3vn8KQolOBnJtale+KGLXJTtgsASu/clDmTgbvnlwPN03fcbKWij1k2eRvw7oHDcYA35d+x0CKvgq5xd9rQht3hhCvd+w4EUEPfZCzYAi8wGlA5uc53Pc5qwfD5Ki3bjWWRb6kXHFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Thu, 22 Feb
 2024 21:16:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092%3]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 21:16:42 +0000
Date: Thu, 22 Feb 2024 13:16:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/dg2: Fix number of mocs entries
Message-ID: <20240222211639.GO718896@mdroper-desk1.amr.corp.intel.com>
References: <20240222204203.3007498-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240222204203.3007498-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: b75ac376-8800-4c37-0d62-08dc33eb90c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ItaHUIYBPKgdFoTywu35Jq1ZYBWVrsuU9Bgt1IuvSHiqVMJV8DC8O3z4RP+GFc+MroI1z1IuT8o+BZDsiGhRl5IMnl2MVED5DZhANZxQnic22hdopfKmUpP/rMcaMY0DPlvPPc3pSmjQGEmGph/T0q8xGq+2+oX1mkmfn1ipku2R1+fUU11SxPw3evN4OHA+yzq7FjIk1mH11C4JwEx1CkMFK6jhBM3tlfrq9WRFToTY1jQl8fQ3NK/ICCIt6kVaqV6JNOF3ivq7ScFiIV6pkOvdTjEP9itzpTpRsfh5FxIVCTeu1ArrCo8SVAoKgneRMGxev4BV/c5s7tsZB3gZK6Lb8dY8I3JxXIC77lQtBIbl5LPpi4s7myC6K3St1NVm15mwbf4ebbOpuKVIiOXCWKHTkFHSnXQDb/j2GNzFS53v7nCdvqsy5lzzlEUs8DTcolo/JS02kXEfV4aVhTd6mZyZsxhBlfdZ810jPZujjbEsyVKVPRi8iyOnvzN9rrnYh9WBiXT3UjgkX6C75iNkOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B/IDEdVBk7EfLwu/I/v0BWRV28nDrzBOA244N/k9w48DEaTJ/d0g5Sn1Eb+u?=
 =?us-ascii?Q?FhvaybJZVQphHnArUsntcSZA9gp2ubTordstBdmt/Lhb0wKyZbXSojRF0qIy?=
 =?us-ascii?Q?eX2jym8uSwdUYbGB4SCFEzfbuosxXntRUCN7K1yCtVCoVkDVJBHTKLqy0beU?=
 =?us-ascii?Q?ntrqu88ZweFvO1OJJO4TlpLa69O2Z6TpbBL3+dqF42klg6R4/XdwkyKmThAc?=
 =?us-ascii?Q?+oJbCQ2q5cTpEGENY0yLmHOz7s4wzv7oIdjjDQF9yrx0Ji8U+1uDrnHunyMG?=
 =?us-ascii?Q?2Kp76i60jwaj6gi6fSbYtPYBc9sMgSU3MIAKxDE+c32qWm3JtmjnyadMzk5/?=
 =?us-ascii?Q?SlGewcqOTIoZVKobwfYRBLnD6BSrKfctqw8nLDfpELBvpJd3fkc+SDqr0puR?=
 =?us-ascii?Q?09qtGENlVqPVxQ+2JMrHoVLW6/b6kUebQdoU+p0XZu7tl6DLgXfrfPpTrgYN?=
 =?us-ascii?Q?BS5JiDNuu1I8SHJtchwlUvFO7f3/d9uAILz+TG+REEGWYuf6gbsJvTcp1ODI?=
 =?us-ascii?Q?cE6nmVVUo6QOrrhBesvOofktXyYiota9A6G547S6+Q0MJfzP7e7ByWzY73wA?=
 =?us-ascii?Q?YqpU3C4r/MbYgkAzMCswkeYDrn/dfQBqJwDgyvvimZAoqbf5Sl7ooUjkUWPI?=
 =?us-ascii?Q?tYvDHng+Kl/zrR7HRxCWNMmZ3oxal5MsxLMlG+/fwRWsuIiBEJ7gR7KpWZNj?=
 =?us-ascii?Q?H1Zijie15HOJHBJ9APsuiPv2N4Sf+DTyeeFhrEba8eSKoiBl3U5tyMnzHReo?=
 =?us-ascii?Q?b2nJ9pN7GdmsYTekqxUOgxSLYMkpUZli97sHAL7rJXfYaqF65aEqp9X9wRPP?=
 =?us-ascii?Q?e4vn/VPavUy9IgA+P3LnzxrRAcPkESGRi1BTcvohXrpg8BZqUzZYLVDcVlo8?=
 =?us-ascii?Q?y7+jgr9fsrolnqkI9LRKJJbp0oNHaRpImKvd1TbdWseEJXzD9xKYbm4HLL+i?=
 =?us-ascii?Q?hojJmQ5t6QvYeFykkCDqwnqfLEt4o9P4+rDUBGR10ghsp/A7kMgPgAXjzYt2?=
 =?us-ascii?Q?RIoVI+vXWlQEVP+CgtZfH+eS+kv4ayG0v/iJmFWbqqqxYW34IpDQ7DFLrUvf?=
 =?us-ascii?Q?x6aOuE+1vPWo2xQ9L/zxj3qCLG3ZGc1geo5DOrCXjYddMs254ZnebdTTazhY?=
 =?us-ascii?Q?27xfATi/2tWNYNxUGAG54uIsAwvvZp0i8RRqQwCczREAjX5R0fmMR6TmAXLv?=
 =?us-ascii?Q?YQzkjqK2D/rpp2XiVqi1RedSyOh1HquqOxllVrA2KXcQ4IVYYJDM6k1eB+Zc?=
 =?us-ascii?Q?7uMgE4I7np0gpPtXXo2rq9ZRrhtnVQZBmAF4GQg5BVtK2V2HWD1GLYfsjMad?=
 =?us-ascii?Q?uzl8a9HpIz7JVEPtNwTsBaWQ7sr30rzG5sUSTZyyVP9WcfGuHSMpeLFmjk86?=
 =?us-ascii?Q?WL7B7Vj+vLj59LWBjSVgRBzBfMoX5z6If7mNbn7c0iVNJue6UjwfUShb1GSg?=
 =?us-ascii?Q?Wq8nC3hCa/ZktrnS8GuqfAfaBSYcuT3DZ//m5vH+M4r8e+q4IUXXUsNx4pgo?=
 =?us-ascii?Q?gQJSGi/xaVJylZnKxlDz2JIVwn44gpN3U+60UIjvC1BuzwfaFmKN38PNLKYZ?=
 =?us-ascii?Q?o8YchNIK4vYO1iHXkkgJZVonJ4mcR3ZTgV1Lrl32zB1cTaGEuvuXYofFk6+8?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b75ac376-8800-4c37-0d62-08dc33eb90c8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 21:16:42.0215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyOpxoikEfEDcyjfp4WjzUoT6uI6W7m+1wSQx2C4vDZksdk49tEBRtQvKJouz+0xFVoah/BsZVWfx+6QYFzWBj/YZ3+ZtqoIC7sxCcOsw1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
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

On Thu, Feb 22, 2024 at 12:42:03PM -0800, Lucas De Marchi wrote:
> While investigating why xe_mocs kunit was failing for DG2, Matt Roper
> noticed that LNCFCMOCS[31] is actually RO for DG2. It would be a spec
> bug to document a register to be programmed that is actually RO. However
> upon further inspection, it seems like we should not be programming the
> other values. Early DG2 SKUs documented that the entire set of
> LNCFCMOCS registers needed to be programmed, but this is not true
> anymore.

Wait...it's not the bspec that required us to program every index, but
rather the Linux-specific need to ensure we don't break ABI in the
future.  Although rare, it's consisdered legal for the hardware team to
add additional documented MOCS index values to the table as long as they
aren't changing/removing any of the pre-existing values.  If we have
(buggy) userspace today that's already using an undocumented MOCS index
and operating properly (due to luck), adding the new "official" settings
based on a future bspec update could regress userspace if those new
settings do something like reduce the coherency.  So to guard against
this, we always need to program every undocumented index to maximum
caching, minimum coherency.  That way, if [buggy] userspace can operate
properly with those settings, it should continue to operate in a
functionally correct manner if the index suddenly becomes more coherent
in a future spec update.

> 
> Do like is done in MTL: the additional registers are there, but we are
> not supposed to program them, not even with the unused_index value.

It looks like this was actually a mistake on MTL that was overlooked;
the bspec documents only 16 entries, but the hardware supports 32, so we
should be explicitly programming all the unused ones as mentioned above
to protect against future table updates.


At this point I think we're far enough along that it's extremely
unlikely these MOCS tables for Xe1 platforms like DG2 and MTL are going
to have any further spec additions, so this MTL mistake wound up not
being a big problem for us.  But replacing XELP_NUM_MOCS_ENTRIES with
XEHP_NUM_MOCS_ENTRIES on DG2 is going to extend that mistake farther and
make it more likely for someone to copy/paste the same logic in future
platforms.

The fact that DG2's entry #63 is RO and can't be reprogrammed by the KMD
also means that it's 100% impossible for a future bspec update to
request different values for it.  So whether or not we try to write the
"unused entry" value into it doesn't really matter (it's easiest to just
keep doing so, especially due to the way two MOCS indices are packed
into the same register), but the test should be updated to not try to
verify that last entry.


Matt

> 
> While at it, fix MTL define to follow the same alignment as others, with
> tabs.
> 
> Bspec: 44988, 55267
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1253
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1233
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 609d997b3e9b0..bb28c26a46d5b 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -71,8 +71,9 @@ struct xe_mocs_info {
>  
>  /* Helper defines */
>  #define XELP_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
> +#define XEHP_NUM_MOCS_ENTRIES	4
>  #define PVC_NUM_MOCS_ENTRIES	3
> -#define MTL_NUM_MOCS_ENTRIES    16
> +#define MTL_NUM_MOCS_ENTRIES	16
>  #define XE2_NUM_MOCS_ENTRIES	16
>  
>  /* (e)LLC caching options */
> @@ -401,7 +402,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>  		info->size = ARRAY_SIZE(dg2_mocs_desc);
>  		info->table = dg2_mocs_desc;
>  		info->uc_index = 1;
> -		info->n_entries = XELP_NUM_MOCS_ENTRIES;
> +		info->n_entries = XEHP_NUM_MOCS_ENTRIES;
>  		info->unused_entries_index = 3;
>  		break;
>  	case XE_DG1:
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
