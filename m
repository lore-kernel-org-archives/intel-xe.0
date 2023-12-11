Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36225C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 23:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEEF10E527;
	Mon, 11 Dec 2023 23:08:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C2210E527
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 23:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702336105; x=1733872105;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=geiMHCjS6bCde/OAxDH3vZuNaHBFgWaj2G3tnImlJjo=;
 b=bgIGTpcEYHIrvQuw/9VkCO9IUKQlH8TgiwRZhBBraRzGDvMsOC+cKcom
 26Ym/y/ePQsoBAdGtpzRxUKSNKbyutM0eKuau3Ng3RmsAQMEm+BVQFjz9
 NQPs4ljPnrf1pHBEvSvzzVyXtGAradHo4J4RHfmG/kFYWw9qupT8nCnUe
 4IKnEwDjr8a06D/FGHjnuxSUyaO6MHNjZoI91t/UOY1H931ymX0Ke7LL1
 SjY3PVEtyjfGDZl/AXIdvPb0dpCStcH2yxUoux7WEaAr32NGYf+8tzoxs
 8WS62XmVCuosYhp9xaaAXys2a/Ts2V6sJEqz8H61JjC+frRmIl1bVfxir Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="374229427"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="374229427"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 15:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="14698595"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 15:08:24 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 15:08:24 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 15:08:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 15:08:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 15:08:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQnCy6dIOsGHKnLgaistYFXCr8zRgMF2yi91OfiMMxwACTQLh7wdkpeCvLtPOspySuMxITl2tsOhaFKEl2pO47WiJ6iAKE4gUr/uFSFt5SRmedQJrw5EhG9kYCrQrxjliR/0INnCWVbmoapS7RQYDSeXp1rQwJ5tTQyZeKZljJ9GHQz8kslQWoJfykH95H1lTU1UU7xob9is+fyPq9oSokIhsG+HONaC16CqAsYiFvVECn0ufRDM7P2cTaKJ/LTcwrqf6cAW4iB7z623Zw5OcP+u+98+jcv2LX9KKJnFlWXDwKVMhjzIIykoRH5MkziekVk6biurPVBPWTsNb5PSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0OexpcDNc+xhaciYzxSgzC0Il8EkejkljHOXOYPG9M=;
 b=ZKBlcR4otzW3HilThkVn6CA4wGPo6xw/87V+UnZMokFsvwS0OezcK4drMnA2+dEtWTZadpOv1Uvh2DV5+p8ufHYN/kSOh2fzWTe3WqzY5lnFzSsw/+jykVCpFO2xxMSD+BBXrgota1M7l7fBdrmeqy3IF7bR0Adx2QmY5Q0StiYWCp8wj/VKc+zl3yMdTBRmcBfTD3ZXsEULQud9BZe92a+AVHkyq5VLi3Avp0CmCKkjKwv6tgCFv0ys9Xk7J7nTR5MAQw9IuJhjC+7+14P0vIS4rJym7KMc7LV68TgsMwyCovt7gyjuQI5i6dmZTdTS12mVD0+nT28XZIKIf5HWqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB4892.namprd11.prod.outlook.com (2603:10b6:806:f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Mon, 11 Dec
 2023 23:08:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Mon, 11 Dec 2023
 23:08:19 +0000
Date: Mon, 11 Dec 2023 15:08:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [v3 0/2] Add memory sysfs directory and attributes
Message-ID: <20231211230817.GA1891539@mdroper-desk1.amr.corp.intel.com>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
 <20231211224112.GA1327160@mdroper-desk1.amr.corp.intel.com>
 <ZXeTxQzkD6U2T-Gq@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZXeTxQzkD6U2T-Gq@intel.com>
X-ClientProxiedBy: SJ0PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB4892:EE_
X-MS-Office365-Filtering-Correlation-Id: 747f74f7-ab77-4053-895f-08dbfa9e10aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zu5hZRp9+1VakH7dJmxV8iI5F5qDb/8qrSi/QrVLI6MGmEQxSLqQwPdBp04jV/br0lVK33PQ02on74C2Z4gJ4cYfnVmiRceI8NH0Hoq6SRG+7BnzgA5Rdz2c1EELgmY5Z82adZi9NHQmuGLEhSFoGW0ldajiN6tUlVFJ4MCcBkx4KcQQvCl3PdYdGSabYvrrOo0GLX50jcnmDJSd7LDvKqwtlZT3Cqk/dzttUy99b7uRXi2Lrxzr+sbCdSRhakS1ggkbvmr3ixmp3cQH7NZfhn245OBA+jp6+o93YjskFzh+Sei1Fqe9BNTHGOXUvkoSkxttqsoPVbCCYKy3CV35r3Y17F4kptFwjPInXA6yfbfhjpsSpRyi1zo+fKY7rg77+Naf5wAFzuwbn5xCXviyKCk1EZZ/s81+/MBK64jhjVGj0fpa4wbrwEKXv6dYgXpXMZrzqloC+bYYAOQPJL7Wq0nX9fMMrfXM3nWerW44Mui8VMuwLZMU+XbgXUT7w53n+WljvUVyF0alkya3rnDUjRj7Fgudh0jBfwFIs5mWp4SHA5Xg5u3Bpvh7w679zIqF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39860400002)(346002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(86362001)(316002)(82960400001)(6636002)(33656002)(66556008)(66476007)(41300700001)(26005)(83380400001)(1076003)(6486002)(6512007)(6506007)(2906002)(478600001)(66946007)(8936002)(4326008)(6862004)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iPbfyoj294OayYjFO43IaAvSmaamwvB6KAN5nClOu3ciP0FHFmYQLHwvflsj?=
 =?us-ascii?Q?qOZGTcDBZST6XUA0jgQSuqGemzWvPzmn+lMwytARP2D2XVjcEztchN+ZD9+Q?=
 =?us-ascii?Q?h3DS1CBSZbOUnPj27gpEZjTrnzlzU0cmfW+KBOMso9Lusb5xLTb6KVpRp6SA?=
 =?us-ascii?Q?Y0FP0D69R34dxJKqkJstPNuRPGJREdz/NBIr+5B8VwxN0nwTw/W+bor4NOM5?=
 =?us-ascii?Q?M4qc5Rk3Nl1mBseV0RkG5UIl5QgLbK2ba21wVA5RyS9eu8em+T8aLr1zlLgj?=
 =?us-ascii?Q?FcP2LykQtN3MRCVtsEA6JVzJghnOgeQZAMgi2owtUZsh1yawj9hvdTUihh1r?=
 =?us-ascii?Q?0s2LWxnx74BnLhhiebelui90wZajnIimheXr2SDwRarKXje43HMA+66BSdso?=
 =?us-ascii?Q?r+Ee1CzZExxo/j6qR2zWGVVYucYq+w7qPizdnV1iFB4Ic0bkEaaOvpOkiVAv?=
 =?us-ascii?Q?wcHK/H3CVRNO2aWDRaEjUMYe8sBk3FPXm9ZQg/DQ5uLOUualHTCZ12NlFrBz?=
 =?us-ascii?Q?TPCina+sWNZNv/MJZhXTkICky5wtQnjCCP2GWjab7YpJv9No6ASQGwyFbO64?=
 =?us-ascii?Q?/r5id33Sav4wwPQ4Sz6wkW4XpfVjlFQqhB59nzoe/xkzRMm+sLB58GImqEjS?=
 =?us-ascii?Q?5lc3sJ7sOS6KCEOjJukSZBy2RKKsnHpyrj3hvBZKLOlbKlF3tVhx4hioTLnb?=
 =?us-ascii?Q?/xxpcFeP4gXJbckE3entOnLW1tiFClSXOaUUYLT7wGeIXQ3SEqKblE1qQu5E?=
 =?us-ascii?Q?373KvtQ4IGjxt03dzEv2Wj3UMD5mL0MuNCqZrC5bFLCCpVasS6k4u19eYzLY?=
 =?us-ascii?Q?tc2n6X7kt1JFQGjj414Diq8be4qqUUtasww+YmGOILFXzpyHAredwR/4VH/J?=
 =?us-ascii?Q?8LQHHQmutjjExrFFpcjL9TYg9eTv856lblaO5wJvpuW1A9bM3pnm5iHi5xbk?=
 =?us-ascii?Q?sOh499jIrnGaIU32UgqfCUFJTieXdeWjq/yUWqUTtFndCe8CVJAmszuhgZ9p?=
 =?us-ascii?Q?vP7acLgXDrOzjhOAEtckuICSlgB4fQRllwfGPHZo2Fw/RZb9vcfvhVBMMWvH?=
 =?us-ascii?Q?l51SJes0zhei5PJ/XqBAXKdqLQwH0hNSARZkaCRpPhvOiCQphIl8a0nXvvDK?=
 =?us-ascii?Q?AbqcNeQK6RVHLoaMzXCoJDBUHOnI9Q5foSVyDvzRM3cssWe7Tn5x1lyhxUKr?=
 =?us-ascii?Q?zHyBFy2SydxQVeSXRhWHQ31awWxKSQ3v8sZM3i6gMIBdLZpVoedTV00Dig/Q?=
 =?us-ascii?Q?HfbXiWbdgMbr5fvBTHzClJOYYuGVxVo1gfrBd/kYmj+pNYc7GGilLNMmnIwe?=
 =?us-ascii?Q?dyeU7W4leOs0DQ+8WqyKszzsmPyZ5i6FbzSkflC/tOPBs37x3FDgSefNeXM0?=
 =?us-ascii?Q?RpxkdBL/ugSXaFJjUpLe4qUd6YWJk0WoueJg9P5KBbnm3gYtgLro/PIuQBL5?=
 =?us-ascii?Q?3CYt1KZrv9UYmUfoi0FgJUjNh6e3+m9h426+c+lAZzr9/xEiQWvb9TRuvb/p?=
 =?us-ascii?Q?h4JHRLwgx20m81ks7p0ntWkm81DnNHfwhfxc8BSa+vHID0SIQAv+I1UHzjOK?=
 =?us-ascii?Q?i9HjYCpCV7HbzdLLHfUd5gB8RK4GB3LM5s8wK/ccmEWW8Rz7vSxvAmvM8kaL?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 747f74f7-ab77-4053-895f-08dbfa9e10aa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 23:08:19.5778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9Opv7aJHwakB1JrTAiQuu/9x2+rE0MDo5IaQW1Npf/D/xgbimIy4WQzctEbmEyC0EP9u2wSCTTliU6lHmcS2OKjqghFndarJE9Z+8rr/1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4892
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 05:57:09PM -0500, Rodrigo Vivi wrote:
> On Mon, Dec 11, 2023 at 02:41:12PM -0800, Matt Roper wrote:
> > On Thu, Dec 07, 2023 at 08:47:37PM +0530, Sujaritha Sundaresan wrote:
> > > Create another layer of sub directories to clean up memory/vram
> > > related sysfs path. Additionally, introduce the vram frequency sysfs 
> > > under a the new path.
> > 
> > What's the userspace consumer of this uAPI?  How will this wind up
> > getting used in a real-world software stack?  Isn't stuff like the
> > memory size already returned via the query interface?
> 
> Please notice that this is more for frequency management, nothing related
> to the UMD information that we expose in the ioctl queries.

Are you sure?  The first patch here is moving a
'physical_vram_size_bytes' entry.  I believe we can get each tile's VRAM
size from the memory regions reported by the query ioctl as well, which
makes me wonder why this is also in sysfs and who's using it.  It was
already in sysfs before and is just moving location now, but if it's not
needed we could probably just remove it?

The frequency stuff shows up in the second patch, and "this is meant for
the end user to tweak directly" is fine, but that should probably be
stated explicitly.


Matt

> 
> Like every other sysfs interface, it doesn't actually matter what wrapper
> ends up using it. In general they are for system administrators to tune
> the hardware, so we just need to ensure that it makes sense, it is clean
> and something we will be able to maintain long term without breaking
> compatibility.
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Sujaritha Sundaresan (2):
> > >   drm/xe: Add a new memory directory under tile
> > >   drm/xe: Add vram frequency sysfs attributes
> > > 
> > >  drivers/gpu/drm/xe/xe_pcode_api.h  |   8 +++
> > >  drivers/gpu/drm/xe/xe_tile_sysfs.c | 101 +++++++++++++++++++++++++++--
> > >  2 files changed, 104 insertions(+), 5 deletions(-)
> > > 
> > > -- 
> > > 2.25.1
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
