Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82417E94603
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 20:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3823010E441;
	Mon,  9 Feb 2026 20:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e5l/+t6W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E6D10E441
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Feb 2026 20:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770668597; x=1802204597;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qYd4P57+KQTnYvCzL1X4eaY5yRRUvSICJTfh4RjGHnQ=;
 b=e5l/+t6W0lqEA0I9rp0sI00M0EL/5YrCf9vWL1MoEv/UcgZOHnmKFp9j
 epqKs0MkP4nk/0JIiLHmIC3F0rECZcyEK0AI/PC8OLZOtCYQPwnEBwtQ1
 yu21ZSETbULvgJ98fF7lkVJeJdPZg+z2hAFlRRUsBzK+u5Zby/vh8ve9F
 pRq9Qhmoqrwzzqa9dr1VdzMgy9EtWKBkpOEnunONHZm1ufve3iY9b5Wbr
 L0JMDbdmWNUUMPF4qTsziQVT9Jc/4FzZ9YDChCR7GyR+9cyNh1bF8onxS
 qHH9bv38fNIj4Dn4Wc9wkdD/OIsm4Odpcv6uR7JB/kp9HzojsixVrGJZ5 w==;
X-CSE-ConnectionGUID: QmnGOGfJT7mpYPzp8aAJ5g==
X-CSE-MsgGUID: Cjh2ZTb3SvmYo3qOSgrvzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71829673"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71829673"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 12:23:16 -0800
X-CSE-ConnectionGUID: A04loPcyS3ubyk88m5UeUw==
X-CSE-MsgGUID: 1RQWvCs8Qf2HTE1ZaJxtHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="216671641"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 12:23:16 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 12:23:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 12:23:15 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 12:23:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvqxNIUSfzbVyCv9VrhtztM4xuZurgrL3jDmpSW2BI57KzOC7Ck8eaECx2wdhpd0mhOvj8zAPJTVCxyjmnhfBOQ1CnPSCsG6SeDZAdyf4wC8nnzpyiETDbaZn9gwi4EQbC72jFqK3vm0iv29eZyj5cC5AkyV9VKkrMWXQVJjRV9SCedEOYHmqd+j0UtfQZq0BbGl5FzM/Ln0Z7m/F+Wwrpb6cLYEFA1zPfERHRUM0JZj5DRMMKazEQmB6l6yQ0IiFKo0hhxWy0nj40hy1YyRDOTZNhcTGr+EmyNPclFh4gKQ12yyYXnKFkSKZv46Cs+9wPHWoaiQ5mhFooBB5V6PDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLQ+j1ogUSEiBtKw0Vjc1mELDEYLXvudtxFvnKmBbIE=;
 b=NgDmL7d+ifgsjly7+0/ClBVyUvrUje9fSGIUqEPBiG/MAiYaA1IN3rdD0afGcZzei3tloAtirc2RNnrgnemYrwraKdzfTN/vcYEc9cWxSsatlYnOrwnCSLarqC3uUvwuqWTzCRyctYTOoGa/bewNlVx4mVMgmp3OfFlAGgsL6sQCcSLUYACAYbSS7TJdAKWcevYdkmaksgwDMXp6kQgpVwBRZpF8zbADZBV2EpbRIK3FuX6w7j2lXdUp+JsVN2XDFzy5qQNOsj5JBOUtWss2287ngQ8KP2xcctMWkGsYifDofzz3WpsaR4hkC0uzay/T8zCcwA0pT8XWynbK/r2OpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB8001.namprd11.prod.outlook.com (2603:10b6:806:2f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 20:23:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 20:23:12 +0000
Date: Mon, 9 Feb 2026 12:23:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nitin Gote <nitin.r.gote@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe2_hpg: Apply Wa_14024997852
Message-ID: <20260209202310.GF458797@mdroper-desk1.amr.corp.intel.com>
References: <20260205050818.2180756-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260205050818.2180756-1-arvind.yadav@intel.com>
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9d026f-bd77-4514-bbb0-08de68190c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0FN540Zw08s26favAZo4tkmev+Mwv2upCE3Xkdp8wLzYgs1EvprIOTSc+2hT?=
 =?us-ascii?Q?GSPwi26GyfYy19MNIbaZoWQ1FrRnAAT3nD4YCjdQrmgKgS/CHtXOMb+38XBJ?=
 =?us-ascii?Q?PmhSIdktRsh52JIyy6Zn9k1KnnUZuW5QQUhVKpIIUVj/BiTzOCYf22W7djcF?=
 =?us-ascii?Q?oK/jeG54wWekNLd3izkzHpqgIe6AOWevuKKhXZwHWFZTlEzcnz8B6OuBxNmU?=
 =?us-ascii?Q?zd4x57XUmHV2b+7mFgSelXpBi3ckSw500SLoN7qI/5AZdE5oT+jHa1EV+B8y?=
 =?us-ascii?Q?w3jbaECB87753RwIorLDqYBzmiq0h2XJ2VODY9wYyvlKiA3HntYwzUZ00/9h?=
 =?us-ascii?Q?CsAtKzM423KeNSrh42rVIEEwDhRoYTIJIEuYcZRFgvaE39BQu0Au4coqQIaA?=
 =?us-ascii?Q?jOeuIvzjO+1PlbuAGngSSNn2jjei0em8stBo46x7BF+/qx8gCDDuEM15BShb?=
 =?us-ascii?Q?s3dGNF2mqhOr1xOW3Epk5JLQGdAyLr9Zdmk0C165w6UZlk/eyIt6iMd9XQmi?=
 =?us-ascii?Q?mJ9dCzFimZfG60I3zWUuLcG8tnZzHusA93sdtfe8qDSYSOA3Ufbg+F5nyUmh?=
 =?us-ascii?Q?ztD0ElhjwB2aTzbOwTWPU7PklkQAjAfzyad1mAzkYCULSkOSLZsMSZmyjLwb?=
 =?us-ascii?Q?LJgaPYI7oBAYJOyM3I3fBqb2hMGyUhP+nBFauZlv9Q4l1FACtqti902mAnj0?=
 =?us-ascii?Q?Q2wul0hflThv2zN1Dy0xQly+/LA63pSasHaTGtYmjdDFQnYi6ppM9xxPBcKW?=
 =?us-ascii?Q?Fcww94w1zebb7ewaWqqFMGTdKoCCL63VAiSuB+h46q82SuEFAUW8zT5t67Ud?=
 =?us-ascii?Q?kw7yOtD1AlS2JN5WylzdcJmITRHTVjBi5Iqvcbow8YvyFug6w0tjUYdxr/Vo?=
 =?us-ascii?Q?zrFtSrJsXzSZAnt7Yy7DQfAmj6OUuecxmI/5YnUHX998xOwqi0kYd6iR+DGo?=
 =?us-ascii?Q?JUjMS7QCOLpww4L2qsNuNDA1FUCsNxdMJTxcqrOcEL+uL5wn/U/FwV9ZpseC?=
 =?us-ascii?Q?AWVaNBum5D4x5EPIN7PUtwvrQKfmRJseT+BgIrv0Ny9MssZs1+XFB1XZMAw7?=
 =?us-ascii?Q?H9aGpl3tDN4o+zBnE9jPW2FBmirwBFgJzxZ+VKsJDoHSf2fmBbHWBajWHK65?=
 =?us-ascii?Q?POdtY22hnlpqdMBX00IV8Bt0Jt/wLDP+guzZ6cYmLvK2yJtNWIt2iJerRoT7?=
 =?us-ascii?Q?QDZVMg+8p8dAJjwFs/Z8edVFMeWZ4WI4NO2PUPyya/nwAIEV5zUe7IIiAxhY?=
 =?us-ascii?Q?Wz5SVHXFJJOf3QI3zTk7KzswTlj7KhByCRyTIGbxZTggj8sDq+OvHdaSQOcB?=
 =?us-ascii?Q?61D7FS9sPr2YV1wrUjypH90ecLbCnVnUaiJsPWSRb2MwU2cHQrVS0hcQEi3E?=
 =?us-ascii?Q?2t/zo8rCqiBaqAfQPo3JmwNtA8MtX24HFewy5PUIpKob5+t0a/EamlMMeock?=
 =?us-ascii?Q?XTvpYmVyeBvB+pK5X6cvW9Q/nHsFGjQrldvbed0sZTygrttg4AZU7vQdUoGJ?=
 =?us-ascii?Q?fwHQNKMe39aSzosgGgaJIhKJHHY2Ca6S9sPL5IxG7+wGyYp6tomKxWtETzsM?=
 =?us-ascii?Q?hXnkkWulU9ZWtmwc9BA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v70sCqLSrk/m+h65VMuFrX5+O+Tpn9wCES2Fz/6Rr6g9p8qnvYXYOx58CbhS?=
 =?us-ascii?Q?IEH9XkD+sM8ItkSGs1RW52m5LdS+vN6ET11OjfBR/nMedHueRUOc6blZx6z6?=
 =?us-ascii?Q?lB0Tiu2cN1S03aORzvYWabonECmvrVPw7KDlBTXdDKv+Lei3gaEsdf35vF1g?=
 =?us-ascii?Q?nm6jYw9oNIo9jGjsAGTMZyk61m80HUOjm3cb4OpfuFv5lOv2x1kF/8Qgvpfx?=
 =?us-ascii?Q?iBTKMuF2XtWbVmvs0pMBGH17qYC1sPzNi5VzC3L6BxzWND1h4YBLU4plSKGB?=
 =?us-ascii?Q?J8NE63GGvnepzWEArr64V7tm2VrEFKrP4D9p+bZznXPepgcJhOn1hLJ+ki6V?=
 =?us-ascii?Q?jn1nL7TmAgh0tZdJB1JvlyaSEY5uyE/LY6K3aXcLy0MJmvexwfFvInfi6Wl6?=
 =?us-ascii?Q?XKgJ1kpCv+/xZj/H+TrtTef7il93D4wVKxqnyIKixGisRet9qLL3RBsP4SyG?=
 =?us-ascii?Q?09JOWv4D+h6WJbfayI4/iu/nO2tIfxO3yVzuEuZqg/DEZp0ZeaccjpILoaul?=
 =?us-ascii?Q?bUnlGVkm9QD0xXAxr7DQ3cVfhEeDz2TiPF+ntoh0ElrxAw/TzdXKKPiGYAsL?=
 =?us-ascii?Q?C4QjXqLx6+KLGtRnrIG7gPgfmt9/V6KFqW91b4ty+Km8htx93MjPwZV69cea?=
 =?us-ascii?Q?LNCLWcwyG8KU6ijrMzc9mtPixtN6rx7ZVxzW0SA5PvmwAta1xzJ+iKHcJBN8?=
 =?us-ascii?Q?hO8T1RYs0QEuQx8RDCkMigWmYF6l3VayrTkyHd4JL3nZt/QVOZeQjunAwL2n?=
 =?us-ascii?Q?thTvYd54J9YsphEhY/7NRMUXEXYJjcFGY4z4KJxONA8cmSsBl0Be3j8ua4A2?=
 =?us-ascii?Q?t4d7IhoUDx3x53pSFbQYvivwJ8bxuV7uWp4HpN0tjFzRPIsKYAtFh5tHsT8v?=
 =?us-ascii?Q?M1U51t/QtvK9YN4ihIwNomQg1V3begq5gVBEGTYVVh4ssv31MdFHdaNLoKL4?=
 =?us-ascii?Q?70LYYQZ6D9SboZrC4njKw/grGjCfuSpfjKP3SJKSeQ4eyv4bpLEQdQgNljn6?=
 =?us-ascii?Q?DOyNHCnDas+V9C6z06ByiVKHonFEL9d/3rTjb6Q/a5PZTTree8hUyig1NQa2?=
 =?us-ascii?Q?AHzx6Ez0n007pC2UwH9EMhPX1o+C2I0PiXknFFOWuAygV6h3XhurHjQe63PB?=
 =?us-ascii?Q?QpPGHzsI67Tq4qUPIM4zJfbII4k1oHZRidMiXLkII3eLsklEIaVA+HI2G2c0?=
 =?us-ascii?Q?p66HCmshlFpiPMZ/1J7laAkSJGzy+/X2z8EfNVnOXzC+JZJRzpd3e7F99HuE?=
 =?us-ascii?Q?Go+KMraFRqPxEn7xIVeV8YngLnEutpkiHakAQyWNsuwDsF24Py8n8KODQ4mG?=
 =?us-ascii?Q?uop0jFT94oi0q/NIaB3hQ4GaDaNO9ICVHiGSpdcYwI8qEweea1kbLWvJBpeY?=
 =?us-ascii?Q?MPM/LRBpa/kRwXx2Qea9huV1rLoQyJ7wqRGHyPcBRuvR/OYFhLZEHGYRZwpU?=
 =?us-ascii?Q?tGLV8Ogo0nnabjRorcQON3sWKqWkGaMfyTipSlxMAwNlWXFrTsNqFVzFcIVS?=
 =?us-ascii?Q?bkSdT6KWfKS+yWxiqYFsWPDDV3e7zqFifRyIJTRlDH2gCPwxbEQlH34ZjkUk?=
 =?us-ascii?Q?W66a7jiNuG9/o73U7yET5ISaK94Ltzmg5dhaGiblV23GIrrKgBua89eFQeHv?=
 =?us-ascii?Q?JMnDw8J02+HSoaorgmTTT0m5ZqbFfIOggE2Cz7DkuOtgGIIZ5EkQ0wqUNQkv?=
 =?us-ascii?Q?Mjye7Mxdu2th8uuO8szpReEhVkpTTgqi7G445M8jCEeK5u2jZkMRvkEOLIVe?=
 =?us-ascii?Q?4Nb1vkGvfNrRamzNtHrT4fnyQlEBWKs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9d026f-bd77-4514-bbb0-08de68190c43
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 20:23:12.4417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Y3y8fBCde9A8mxChrduOpd36sOBhnT9Yt4e2w14PAY3KkeNPtNg/HxjjvTL/gNEwl8HdTE/e3eRsWzmhunMp6ui8q1A/3VkX6ytiUta+ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8001
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

On Thu, Feb 05, 2026 at 10:38:18AM +0530, Arvind Yadav wrote:
> Applied Wa_14024997852 to Graphics version 20.02
> 
> Cc: Nitin Gote <nitin.r.gote@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 1e8d61ac581b..2f838c99596f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -874,6 +874,17 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
>  	},
>  
> +	{ XE_RTP_NAME("14024997852"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2002), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_MODE,
> +			     DIS_MESH_PARTIAL_AUTOSTRIP |
> +			     DIS_MESH_AUTOSTRIP),
> +			 SET(VFLSKPD,
> +			     DIS_PARTIAL_AUTOSTRIP |
> +			     DIS_AUTOSTRIP))

This workaround asks that these settings be programmed only in specific
cases (primitive ID enabled || cut index enabled).  That's referring to
3D state that's controlled by the UMD and may change on a batch-by-batch
basis.  So we shouldn't be doing this programming directly in the
kernel, otherwise it will be in effect even at times we don't want it to
be.  Instead we just need to whitelist these registers to allow the UMD
to make the necessary changes on the fly.

We already whitelist these for the Xe3 platforms; the necessary change
is to also extend that whitelisting back to some of the Xe2 IPs.


Matt

> +	},
> +
>  	/* Xe3_LPG */
>  	{ XE_RTP_NAME("14021490052"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
