Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC00AC83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 19:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A061310E191;
	Mon, 28 Jul 2025 19:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAi+nLu1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9B510E191
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 19:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753732714; x=1785268714;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1I3r8eksFZpLDzogaljrPoSuhic744lArya05LUifyg=;
 b=cAi+nLu1VcRv5oVNwhJEXs5pcs16mE20gZjBtoGYKAFtYSorZBYhSsa0
 6NNyj6lZT8EEJ2OwdPBIo0szjW3oyZ4YAfCrg/NA0tub7p5Rp09zEZ+Kp
 WgeyG+u6ikumKr2ovae0agdaRGjC5mrHMhlm+t/w2gIftLDmeKaWOOgPY
 m1FKZPLEDGRvM9S4JuoVahxZRMwiFygIAKlV9LDrwpWCQ/GMHvBOpKqWW
 F+vlPjRs/iFf0pcFyq44comOazeaUmd5Gqr4CkyWR37MD27WgqBI0s6PY
 b2HBhZQK14lzPgxerePKdJtPakgX585EunG5oi5MzUEM5uk7oP1wRZHFM A==;
X-CSE-ConnectionGUID: YLDaoQYWRNycG5TXHNLpqQ==
X-CSE-MsgGUID: CUyFaytTT5yjUSW++NjoUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59638995"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59638995"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:58:34 -0700
X-CSE-ConnectionGUID: JhNa6UP+QsaDQHxnNx7g+g==
X-CSE-MsgGUID: wKHsDjI/Sze66gxWRIc9ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162077415"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:58:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:58:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 12:58:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:58:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqt6d2Xu6U0S6iMOwtSG9yTdAEJvkklgkv4sKgRA/v+afFceOxPzd1f/HkFY28oRYxTMFhw3nbyy8xHdwiXz/7qDNwlhJcleWEnpIFokuv+Am7zqZMlJEFtaVxPhhZm2Bm0sj7DC4Fa+oie2ZKeor05vHp8kRPQXUeCXyzZtKWbqmBSQJwYh6UtRTEcVrFdCrpAgqt/M4aagml7WKJ137N+oYYSTEU788URG0LQEK+juefqxT0U0a2TrhzbJuDax5iIvC/lncQ9X1knX8y3AUrGau8+A3LGHWZ4Lio7g8QjM2bDYgxWvUDZ6seUkJOnx0yri54cZq/wmivdHUIxlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvIugac/TwpaR0rud+GtIW6W4oETd6Nn2dcHoNLY2W0=;
 b=dPKJ9BUnV6UArP9bZm4KN2xv3bF3z6ap+X3GV/4iuC+zWOONk97HAacRnhp1Eq0HOwEDunbT/95DlGalsNivD52gnCsShF4vvV2+NoixiZwpJiKTtgkIbDQmVH5rUUBp254Jywy652hc9buD5oyxU4FvakHppzGr6LBor4okKBLPxs2+Yswc/DMb2qoHiPz9cDXiRg9AvDv/ftOcBZ7ezRD9iiT03PG2t8ltXHGmds8mRQ039Hp81tHDpQKdWoENcgQhejO8sqUhTFTUXICCZGpEjnrNUlqjdoZrJoKgqYkIt6DzBhGqp5uxKQY4gl/RmSPwVVp8YejfZ4I63kd/WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8207.namprd11.prod.outlook.com (2603:10b6:8:164::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 19:57:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 19:57:49 +0000
Date: Mon, 28 Jul 2025 15:57:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 06/11] drm/xe/configfs: Rename configfs_find_group()
 helper
Message-ID: <aIfWORHMHp1FkT_8@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250727172009.587-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0112.namprd05.prod.outlook.com
 (2603:10b6:a03:334::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: c87536fa-96e5-4ce0-29a2-08ddce110792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fSogeIaMEnugy8qRLu774WsYWsXJ/iZDBoYx0EMjbOA4p8vsNuLDbzd5VlkY?=
 =?us-ascii?Q?sgWSU1YZqgLeg8KkmY/JqypvlLj4kww8lX/6uTnWYV4r4TlIcIBCKxvIvla9?=
 =?us-ascii?Q?uM+FdEmpwrCZBf3NMFn/4j55h9qIA+EWdHfDIp4wyHWynC12i8no49bKSt+m?=
 =?us-ascii?Q?bL1jV2YX2S59dR6eANx1NKG4JuSRVob5kN1mVTzl1cruvFE66zZ/4QuTLNII?=
 =?us-ascii?Q?kJgt6PFK0eUBrSYfggGmj2gaI0BrECSvnxVkE0qTM1MHmc6q70ZX2cQNt6PD?=
 =?us-ascii?Q?X22mxSQkb62PydPPa15Sa2LeS7pQdyJOazZhsVAGjUkZzLpR4+EGSHY3kH//?=
 =?us-ascii?Q?lzt39t2PbhrC7oG4qC8T0DbZHNRnSL+Ur4okOMhsNmAeDxMKhcSzHlyQg4QE?=
 =?us-ascii?Q?D0n9ucA3x77oZMvMX7XcIAK6zqz8SB/5LEyQ4Ux48Gh99/puOEUnHh5AWr5N?=
 =?us-ascii?Q?y5nqsnxtTySXIcVBuq1coIKwfTLq1cFfNZBveUiwRguMAa5WnnZERDzekTTz?=
 =?us-ascii?Q?GiR/pz5ArPHMiS2l+LNR57m7gnXZ1gvSu4lWEJmQ1tXPdYNADLkwKpsLyDf7?=
 =?us-ascii?Q?6jSsBuhDT7h0NrTd+69JpFaZe5DvTSZ++hE+0mfGy8jdN65BYPG0Da8UOosa?=
 =?us-ascii?Q?lm4vJEE01b1ArCrl1wnbFaUlb6ppv1oa3sNIq/1eJAsx0SxOWrOQluOyaI7v?=
 =?us-ascii?Q?syv+XganMp4KEYRIh7oefUm+etewe5amM4th6Nsdi+p6StzrTbzEiJ/c/ErQ?=
 =?us-ascii?Q?c0B0gEZtnO2jATrx2jJnQTXST0KUsCYaVjdQeXaeTNsz28kXivz49xwMR+XC?=
 =?us-ascii?Q?gtsaqkUg25qznzeTcQWQuUb7cnc0+VZLAfEOMVCYh+PdVepVWQ0WYGNA7Vx3?=
 =?us-ascii?Q?+Mr/6RaEhkEjhrijFex7w61GAw4JINGerj8ja1wfR1ZlzY5V9jQXGVcLLCds?=
 =?us-ascii?Q?PG3u7KwQ9oYrQJQ4WaE8cWkMTurKkXoqzUa5Ct/oPrm3o3nGzCXAaM+c2kmg?=
 =?us-ascii?Q?13i8ZnEqzAthul/IxDnFBbERQp/SrpcE+zb5+UfDVFvZriGqjfPrqq/mQ8tk?=
 =?us-ascii?Q?swFRvSVoodz4JqRZnE/xX+Yu9U/Hdj9hQA31CdKRX3PeQoCWV6y//Owo6Msc?=
 =?us-ascii?Q?UMkyrTot3pZOddzyajlpIOtov/6H0gLaVT2e9PfTOYDsgQfSUYxP0G6czN41?=
 =?us-ascii?Q?ldooIrUZZMSLsJwJiLDb992sNZzpYZuUirspdp+FjUuoxHInEm6fJTidkyUZ?=
 =?us-ascii?Q?oI60lOE9/Pw1TcT5S+tKuQIlaQ878cnQR3xwvH9Rs0wD5OLVFuM5C5v6cpIL?=
 =?us-ascii?Q?nrmJlTt0aKW1vf2t7jYruhO+DI4eMmoPp+fGWe5Ty1/h+tTGxPJ1Z9bWa/fr?=
 =?us-ascii?Q?zlALHH9QefgTZLr6nPvvZUMN+s+YytajmrOkPQzExp3trP67uA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K+pFjHByLwmfrZEfAFsL376kZ+btQPYMv/WV+Aj1DQ6UoC3/HUrejrHbjIk/?=
 =?us-ascii?Q?zUzo5JKDKcSYx5T24yBHG9YQNvkM9TLOpfDtSc25+HUtlE/7jI88Wa+JPcG6?=
 =?us-ascii?Q?5qbOC6mcFeqzilV0taXO/AvXJ7zziA5lE2hxe+/Fyx/ltmatbCcY2o+CPr5U?=
 =?us-ascii?Q?2UoxBg3alvTvKMXo70vV/eqMMXC7YA3ukxGXv7gmUxm71D9FjZeyHxl16yWe?=
 =?us-ascii?Q?ZX/HAbzO3j1zYCuKAHkioBX/h9WbUcpdJJMkSnaXNbSOtZ8wItHs123bpX7G?=
 =?us-ascii?Q?LmCxWNSnfRWhDIxvttrQ/z3+ab3EF4Dldue9rwFvjUX/Zg0okIUDeWAngpfl?=
 =?us-ascii?Q?3qt0dJ7nvLBWmkaJiJVOMX7xfwKgnSphT4FHwaRi8Ka/lDooTYw5oOfV/XQh?=
 =?us-ascii?Q?cZ3oM3rjqSbJLxI7jZHHsjVs7mNO/ovPRszfKzKXA3EXTkLG5YE+qOaXvET5?=
 =?us-ascii?Q?5zwOy6oDIJGaErGfsDV2n9eWvWb4bu0ixhBPQ7FpWXkPHbXIv7vo6MaxCFc7?=
 =?us-ascii?Q?+RWNtkCWKaZ6lxtOnj7KEPrdEw9dNihaRokZOGORu6+oLJh1mfDyLPz4sJ85?=
 =?us-ascii?Q?vxUrDa2e9VaQl0CC8VS/rTdTbFpJ9Dx0mJImbdYRBggCSJDVVL+glQXZzvym?=
 =?us-ascii?Q?912MAFPjG0//B3E5lvY75sBmtw5B1r9nGwjbZ4hnvJxBbOzVz2MuZwk3Hs0k?=
 =?us-ascii?Q?hD4XKk5mi7DE7UEJBEmJ1WMvG2UfJclEDvv/7EAOsxU3KjIuORrnlOcDyJ0n?=
 =?us-ascii?Q?K9y6QXax3YDzorfzOA8N3kGq6x3za9cW/dIRRPKveHZDjgzmtUe5P0th72Ru?=
 =?us-ascii?Q?jyQbXaD+zETOXSXtoIwi7VEsvfzC4xrsYId1UCYLjFcdZ61AcsQ0sjM/Zc8X?=
 =?us-ascii?Q?EDUpsWE6h5Lb1ZW+E+ssJ4vNAMhUE+fvyAUSupV+O9FYDyEBfZIMzrHVOIbj?=
 =?us-ascii?Q?tk2CkKnKAaY03fF3KcacLV1BetIs1z6n07IO9WCEst7pUWI1ah/4FnpobdBq?=
 =?us-ascii?Q?O7BbPAmfMuHDsYzKDbzNQIaLV256fLJFxhJz//SvK0Eud+11AHS+earLq1yF?=
 =?us-ascii?Q?hlyNvKdFxGky0bc7MyOZgFr4lRfM57rDCyAhp4Upj72EgoFGonOwvnH08KNn?=
 =?us-ascii?Q?q1DD8VnEMPP+BUM7Ul4ZzylKYI3wrQfFjd4r/3lzahuMP4Z+KEG2c0mm1nE2?=
 =?us-ascii?Q?XQHWAcBbprHZ4Yv0Uts8xN9X/EFMJxnaDTvyRUGf2rMrRTjcsSYuVqyyVW6Q?=
 =?us-ascii?Q?yvejcAD5FPyYTVELdklhXucheKkQhFwvb9IgtPsbbM3K3oYbfZJlKxHP3aaM?=
 =?us-ascii?Q?n5meiwVeJF8z1B++xpGVkpHR5hiFQOy6sLtVDGSWJR+nAlsh9XOH2L7Q8IOC?=
 =?us-ascii?Q?g8eVjzyM0KmqQrT2WwrV1/DshKZ3PNKGHdCoa8NojICPZP82nr/iQwZf42gQ?=
 =?us-ascii?Q?fyx+1P2w1HLZsFaCXRhRp6+mHInIwdoFEqyz/lACrwK+DYva7bO4G0pPUSwF?=
 =?us-ascii?Q?oLu2AxW92E3O0LQiTdfDMsEw1ryRLl6DTCby8yl4K2/lMS3280U6ZY4nKbPZ?=
 =?us-ascii?Q?+Cu41Efemu/1WA+5kBZkJijO1I7dQRuAJpiFXMFYaZgET+AcPNmwbpGoHDjy?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c87536fa-96e5-4ce0-29a2-08ddce110792
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 19:57:49.6065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/88PB8/oyOGNEKJy5V/3mSmPEFF1ViSm/7EKYrHq/ABlxRDWs5zDO0T4t5USTCpE0yq8VUVpj0l0uA/yFUN4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8207
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

On Sun, Jul 27, 2025 at 07:20:03PM +0200, Michal Wajdeczko wrote:
> This helper name shouldn't suggest that it iss a part of the core
> configfs API family. While around switch to use different helper
> to release a reference.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index edd52b8f0543..f5a780b8bb80 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -305,7 +305,7 @@ static struct configfs_subsystem xe_configfs = {
>  	},
>  };
>  
> -static struct xe_config_group_device *configfs_find_group(struct pci_dev *pdev)
> +static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev *pdev)
>  {
>  	guard(mutex)(&xe_configfs.su_mutex);
>  	struct config_item *item;
> @@ -328,14 +328,14 @@ static struct xe_config_group_device *configfs_find_group(struct pci_dev *pdev)
>   */
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>  {
> -	struct xe_config_group_device *dev = configfs_find_group(pdev);
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>  	bool mode;
>  
>  	if (!dev)
>  		return false;
>  
>  	mode = dev->survivability_mode;
> -	config_item_put(&dev->group.cg_item);
> +	config_group_put(&dev->group);
>  
>  	return mode;
>  }
> @@ -349,7 +349,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>   */
>  void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>  {
> -	struct xe_config_group_device *dev = configfs_find_group(pdev);
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>  
>  	if (!dev)
>  		return;
> @@ -357,7 +357,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>  	scoped_guard(mutex, &xe_configfs.su_mutex)
>  		dev->survivability_mode = 0;
>  
> -	config_item_put(&dev->group.cg_item);
> +	config_group_put(&dev->group);
>  }
>  
>  /**
> @@ -371,14 +371,14 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>   */
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>  {
> -	struct xe_config_group_device *dev = configfs_find_group(pdev);
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>  	u64 engines_allowed;
>  
>  	if (!dev)
>  		return U64_MAX;
>  
>  	engines_allowed = dev->engines_allowed;
> -	config_item_put(&dev->group.cg_item);
> +	config_group_put(&dev->group);
>  
>  	return engines_allowed;
>  }
> -- 
> 2.47.1
> 
