Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6272CC48BF6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 21:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0466210E626;
	Thu, 29 Feb 2024 21:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1zhRoV8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD50410E626
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 21:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709241785; x=1740777785;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JwalCDXzuhxq7wbVeXkVwiROMPOhEqPCMDRc1jDgc3k=;
 b=A1zhRoV8cz+ftBpvItmTbp4Pi+/8FdYpH2rBEZzApNgslGab9jacMfnU
 Y9j94FxdsSCtsfGSCBV6wqn+vIfXg1s92p5w4dvE9EsANRbhs71X+VPK/
 bGFYhRd2J/O+ve2pQqG4jRRWWySQTqZm6wFQALlo8WydS0z08kkPnNEV7
 o2pNbFUD8IG50+CEfEMyL8XJDo15h9zvuVae+FYwfuTxygbWa+mbMuNMF
 T5PFoitjuautDlvOq2UjwlXxW89X4rsbeN3+SCZRaYnIZROYl2PDWDVd8
 a+JVItRT2rRxHj28NQMCESJWSMMKa/WithNuRalIQZYHRNr2Ls/lz6Era Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="29177000"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="29177000"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 13:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12648860"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 13:21:10 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 13:21:09 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 13:21:09 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 13:21:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPIifXAzt2bHU/JuoGjv4XYO1Fg7mmsM1KLWsIKQdO71uNFiaGKmjt8V4vydMjqpsqPZ/PL2KPEH7ZeIOMzAd1DgjjuAzV3misOpu2IF+5uiqs3rUpL3iYk0DvrfMLvnVPbETG3I46kfYbMc74DWUxqtZPMFvgWp9JaOF+0MA5T5H595fKvBdkEfQ5vf2NFMcr2Ylx7Rd+w2X8Nabxpq7PvI/pqBNZBL3Kx+Z0JUSAmWEVR8MxHm1tBWraUVPsPlOvJx7ZE0gbJejMcbnPt5ZBr9y+FlAbvt1kXa4G12xMOCcMYaaDXDZVBI7bo79YRACbgu/oFjcD1+5xyRj2O47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBdnSxL7ZPO/DWq6SycvuZ05lHqvNrn7u0u+zxvW7cs=;
 b=HCeslCx+jyXbb9MmbRJnciWsnjOcaI8DT6msTJ7gy9jnVN9s4IkCxs5DLOxmPTPUGHFH63AaVCMkWlDjY32w9XAmroXnzGjG0y3xtePp+THaPTeKFXJbQRPctpwi+grApjDgINmDP/YNg3LJMWcnjNxPZ8lMRMF25Y60DpNqsWq8MV1SuCuH6vGzjhYGBl7apudXbCl3Oo8z91BORjfXkPm5tX5Zp+5GqoMVeZayUqQDbn7I4rzu/BQutl52rfxMlzU/lO1bqd6hsCfPFIyPL0pW6pkHMrEwmOtoHf47hoKN5qcfQSheJD0K50R77hhskKRrY2jKmPCDusXYB7a87A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6463.namprd11.prod.outlook.com (2603:10b6:930:31::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.15; Thu, 29 Feb
 2024 21:21:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%5]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 21:21:07 +0000
Date: Thu, 29 Feb 2024 13:21:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ruthuvikas Ravikumar
 <ruthuvikas.ravikumar@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/mocs: Be explicit when logging number of
 entries
Message-ID: <20240229212105.GP5347@mdroper-desk1.amr.corp.intel.com>
References: <20240228061048.3661978-1-lucas.demarchi@intel.com>
 <20240228061048.3661978-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240228061048.3661978-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ2PR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:a03:505::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 4727fb8d-1c69-4ee6-7d14-08dc396c57ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 20feLjAhImBC/k1ZIDuDQ5WKTpqHcJovaz/YML/SW55SzGxpixOZmqXQwS+rX1ivIqzElRQDmMB2dqJYypZwOmEVflE6WttdZpu/6zcpLnUHJyAZosocluGQdMc9tgc9/qWgOPAmhsjCTIeZz1h1KSYUNxl7OQ6OhP2QCaTOcuxpWaqV98PhQsEvMSEbxH4I+i4EgjLi7tpHj0ELX4UgD6i6G9zviyiO1kW9XpggztgeLWk7FRv1w3aEpFCIlUnUmjwEurI/lR6rXGCsqbIlZg9l7kgIXX0neQmCqVmwEN0ims5wvRAVMLWbo5gk68JSV9gr52JvZzLE7gj4IvjpmOcuwW7e9SMLhtrGtMlBawJ1flx/zke/b5CivP+NzIJl087sJ6h7ao4XYqYbcYobmGXkK938D1Ce6qp9hE5U7s9NjgrBJmbTfX4MVXxwKAEtghNqfoAWalA/bW4Yti6ucthAdUwVt9P2FyXVon8IFUjPuKjTapjrmqNH6Ad91UU0KIktOpCaJPOSCduNml8PaLN3EpGDhQ2vzh5YleqNuWtksSpygOxdrMlXUaXBWkVnkeJdxXwIhyAmdK7Y9cndQ41+5XOhKvktny6B1WFIqOK6dN6T/DsdEdLL7EmqpCiBA5F/mMzF5LrXYx5sswNX4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xx1QTmiqvXXfHYYrbobTAm/q60SZ6uIb/lmlzSDcIkVQAUCG6aMe27P+JlIZ?=
 =?us-ascii?Q?fc13HdTpEmj4NxyX+OI63nR+Jr4SfFSrYwa2DK4d4XP6iOIwl9j9elWHz6Fd?=
 =?us-ascii?Q?uzMIWnLsBcWBGXxjGke2eoCFKKV+SEC+3F5baYwpcNbgRlaORbZXsY0iAgpq?=
 =?us-ascii?Q?bESrTQNBQsTrpUWcvGlROYO24pfp+U37OqxziOwcN9w0VYxK3B2xT78AozjM?=
 =?us-ascii?Q?wKN/kivilEIvT9AG2WseAO6t4w8A0ryLw+/ho+QDtwN8UkVxSZtxMXZ6nJQC?=
 =?us-ascii?Q?cSVN5NqAnPUpSm7yNaRpUJOhyP9XJnpgHRy5ApEnjUtfrFUy4X96srFBMmqN?=
 =?us-ascii?Q?epAiZcs1FFe/+M4JGL0Jd5brW3rKl5NwA8gDR3LzMmd0OVHql3QYIyPnEhZN?=
 =?us-ascii?Q?rmqR9P6bKa1MuNw+9i3PBZhJcK8F6XVC02u+bdFwMniWDZFc7hE3mqUFtVt+?=
 =?us-ascii?Q?vjWWDjyNJFSH/qQ39OJ2bw5EsS3z61RHI6IF2QeHaXNk0N9Arcu7TH3EAxBM?=
 =?us-ascii?Q?0/MuY70jkdlD/squBSMa9eE/PLz8ly6MAiZQJIF47B3sb2IcdARGK8T5IiKr?=
 =?us-ascii?Q?eeoUQewzGDhptDJ7o9kKrm/arMKc/MizyxlmiD5niJDc8bUXDLeCtZMk1Uzy?=
 =?us-ascii?Q?bkVv73lMDfsYW9u3JHYBN+IL3XitOMKgYRvahwGriU/vRDrW+fesRYN1eOEo?=
 =?us-ascii?Q?pS/N1+aXXEqdtw+rFfHM2/1VF6jnm292Xw/HoKStFkSplfhnx6WqFQWYF0I7?=
 =?us-ascii?Q?8ke9ZfWmpRcBeQAhpKGt1wGa5HDMR8VEbL+lWRmG4tEtf1wKUwwN4f0uJiQz?=
 =?us-ascii?Q?KvEXPxay/hQQlGOzSerN+WZKoDOHBlDs+F9B2Ezsd+G2ljpSzejtL2DQ1K2H?=
 =?us-ascii?Q?g91NxA6aWG3nARFqHN7VnuU7XStXhOSdO295JQNudBxyn559h7CqufkBy+JZ?=
 =?us-ascii?Q?26UoSdNek7UD+9Zi7jsyU83KpX+bGHrflVUVm04qn+DnX+k1ud0KOCZryvyH?=
 =?us-ascii?Q?fXyUVdlRyX0htQ5Q4vRMGnXR5LNdfvuw91rFdV0Fi/YZoK+zk3zsJsQ/3ICE?=
 =?us-ascii?Q?tGJsZN5P33adIU1e4k0GWhw2zIvJ7AaEtoqO+2TXWUlvm6gxignjpguTMYro?=
 =?us-ascii?Q?O2acbIuoaW1HJEK4xdlVHwMUImDQCaDkQfRZn80rOAe3LuZR24umUyiza3OQ?=
 =?us-ascii?Q?JJ2cpnuIlo949Pi4FZB7i/x/3oq2M4ixkV9dTpimv7sCSroS8NbGRen+uRjY?=
 =?us-ascii?Q?CdAFlMAy/TbsnmgxEGIZoDkhZEgQWSbjfM/bh+82xU9rgmbJkARn2Zx/C7qz?=
 =?us-ascii?Q?tK7OjPnhxiwqukT5VSyArMWtHGGF9w2c8m8534RNHkn5l06eYVW6ruTGAAhk?=
 =?us-ascii?Q?XdgEmtsiKP5S7ZYRuuHl2Npj49begAv4dPxkaxeIaQtwKCBgmaxge8QB+6ST?=
 =?us-ascii?Q?atygWopMTACIioP9KaqFz+Qy4Wrz9wsrZF1i3YAxukdRujKnoMAS610xz3IH?=
 =?us-ascii?Q?3q+4BRbLmF9DLyCCNAOlIhgqrex34u6nv9vFqGog1IATBFCsg0FpLay5WAS6?=
 =?us-ascii?Q?r53jEF4LxeVycWhWeSeKXECO3ptZ+o/otEpPOtItbukKdi+lfx1ZsxdEm52W?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4727fb8d-1c69-4ee6-7d14-08dc396c57ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 21:21:07.2937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9ig2JWr06aVxUVzkDILmN+bNs1m6Z+H40edmg+N7PBPmKFb+xb25Pv+igX1zy+eivertdOCntbekusOpQVS/12aLjCiw9uxI6tPWoMeEBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6463
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

On Tue, Feb 27, 2024 at 10:10:45PM -0800, Lucas De Marchi wrote:
> Make sure to log if number of entries are l3cc or mocs so it doesn't
> depend on the context. Also the warn-once in __init_mocs_table()
> is more a sanity check that should be done as the first thing in that
> function, so move it up.

You didn't actually move the warn in the patch below.

With either the move included, or the commit message updated,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 001e4301c639d..bdb755b963238 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -470,7 +470,7 @@ static void __init_mocs_table(struct xe_gt *gt,
>  	unsigned int i;
>  	u32 mocs;
>  
> -	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> +	mocs_dbg(&gt_to_xe(gt)->drm, "mocs entries: %d\n", info->n_entries);
>  	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
>  		      "Unused entries index should have been defined\n");
>  	for (i = 0; i < info->n_entries; i++) {
> @@ -510,7 +510,8 @@ static void init_l3cc_table(struct xe_gt *gt,
>  	unsigned int i;
>  	u32 l3cc;
>  
> -	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> +	mocs_dbg(&gt_to_xe(gt)->drm, "l3cc entries: %d\n", info->n_entries);
> +
>  	for (i = 0; i < (info->n_entries + 1) / 2; i++) {
>  		l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
>  				    get_entry_l3cc(info, 2 * i + 1));
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
