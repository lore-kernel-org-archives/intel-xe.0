Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BEDD65C7B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 17:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D9D10E0F1;
	Wed, 17 Dec 2025 17:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/LduXwx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B62E10E0F1
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 17:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765993125; x=1797529125;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EjAghkntSxifFUehtJCku7VL+oUCkjgZ4k2rOmFR4w0=;
 b=L/LduXwxip0NvREq0mPz9EXTlKuKRo8xUeYLiY19RVO+Db6mUOugAghR
 G4Js7dIzHLvhvq6DI9ZOauw2zkYbTRRLwuTSKVk7QiC/Jafz+wmIr8RzP
 /CtXOvOXLsCw+/dQXBQmx+IGYqU1ZK4jt0/+8/agT30YLZtVKVw5ZrBQu
 SoYh6/qqzdRs218g0W9NlUtur1bO76x5L9/AJxSKgaXVip4HjBUSXq23Z
 sV8bQd16bDG72xO1mb9+TNsFUvwzv/MRtj29Hl+fKAAW69sbjvo15/IOc
 t1yPq9jSJBiM93tCbGeyId4r9wGYby4W5appQVM3Tn+Y8EHsipPJ5cKrb A==;
X-CSE-ConnectionGUID: EdJC4RqpRW+7NRQ8ysShvg==
X-CSE-MsgGUID: PjPc5EM7Tc++1ctyx3xR3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79307659"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="79307659"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 09:38:44 -0800
X-CSE-ConnectionGUID: 0N0HVWcTROeTesm9cz7Atg==
X-CSE-MsgGUID: /bWXhDTITye63I1IhEaN6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="202736392"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 09:38:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 09:38:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 09:38:44 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 09:38:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i71qQ1hYK55JJqrWXql22Me5C+piZjR2kgNC/bDqrnXEbVWAmYc9pNfF4dz8jK0Q5WGaj6d+sFj6ziTAa4/AoNloqjry/KQ+mivGRGuva+Hjmj1tq+fm538hauVBU8C/bwtWDet26GdlV3YGgQKN53FjpcS/16xEp5r9B3YeR2E8618OuGravQdrsBFFvGF/SZea5kiFksw+aqSdQ19W87kbVzY5s+FYpKIHzPq53XzJxX+PUFf2WEKjwAgARdiPWKl3h3lo/xjrbci+7Y5cZV4cWjjU8dHLPufUyIZeryLQ1DV0vuhPNRVToEJ1RCLjnoYNxoT0QxgD6TDXtq/thw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnYfn+EEzH4DrHr7WbWM1f9XoFPGWkv8ABiKfUqjpbo=;
 b=JEcpmwv/bUcy7lC6owaDK4Dvk7D7WbC0fGFWuWsUz3YoErKKiiqDBxBKy0W56vWOgb+EAYgk5kziazeqZnVUwQ030+4ePbXrA3wpt+nMDd+/9wHkdYHLdD1WOl5nfwMqwy4ncbjM09kWddekPRRioxstmnWkdk2NdZluSvOaKGfqtcrv6VvqJiKk5vbZURJZNhB3Il5MYRh1KpEkUZwBvlZzOC0tRnCF+Gr1pfhWky1WD5EVYmw22j9AHrErfbMoNlg+R4cKwYtu5pA4Aq66vXxy+uQVMBTt7eaq+KngStAGjTdHvAvnD6fgcyikzyURlbOLKXqMqX8TUYbl2a+hDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH3PPF310D5CFFC.namprd11.prod.outlook.com (2603:10b6:518:1::d14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 17:38:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 17:38:36 +0000
Date: Wed, 17 Dec 2025 09:38:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>, <dev@lankhorst.se>
Subject: Re: [PATCH v1] drm/xe/pm: Handle GT resume failure
Message-ID: <20251217173834.GK4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251217131909.1226331-1-raag.jadav@intel.com>
 <aULnjAabXkM9jVfX@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aULnjAabXkM9jVfX@intel.com>
X-ClientProxiedBy: BY3PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:a03:255::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH3PPF310D5CFFC:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f17ed41-ad4b-4651-fca0-08de3d931ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xi72PDZmFeEYkpgxmc7HxyWLe7ix+VJJTnknYsg7WTJUt6PPQqk1IuWk4N92?=
 =?us-ascii?Q?7o2OnvW/6lb3bdCazFinKOsuJRv3nxjOjSrjnnKN7+Tcc51DlJj42+ctg9gW?=
 =?us-ascii?Q?lFoU3m4jnwd7s2NXDW56xMuBr9l5Q7hNEUnyeew5DJCODesMiMYNaKGqNo3S?=
 =?us-ascii?Q?NuEAKlmg+nHonYSzk6bdwrONgWwPQFg/ODgsfDqQP+NI3eTzuUHsq5aYYvfx?=
 =?us-ascii?Q?Gd0PGj2sVQrI+chjrbFdhNpC4EF92/1Gz5WKgbOAnFIaEOFqExlVAsZDfB/M?=
 =?us-ascii?Q?d8kRWAVvIsgO7ztZlSoK+Lvue45DlH35/9gpINP9egMbZWIaRPez1ICVRDCa?=
 =?us-ascii?Q?X1UhStxG6CB/nE0HmKjVapOMJhbzhR9P8MMW0F7Swsc5POewvowH2TCyoamW?=
 =?us-ascii?Q?uXKWqTcrcFaDz9x6bDBfERd33XtcqJKn2s2aL8cCHPNkyPi5j/TIkeUJjyp9?=
 =?us-ascii?Q?anFg4dQ7gWnaWC8JkemWNWKl1IpUyMu8n77kdGvxM7ickfOV4Gvj+K3cUwb8?=
 =?us-ascii?Q?0cxbUMOfX2peIoLBmvH9BHx8jLmIPOibM8ZBwtI7oQ1OxeKtWZN/CDFIhL8d?=
 =?us-ascii?Q?RNzBvOSPA7YDKO3Y5Y5tnu78ajGDyUhJ06TcZ4OpCzH/3bdRDYvWJSxS0n31?=
 =?us-ascii?Q?NNfDCYxLlbqMVv0Xp1t1Y1IFfM7K6EcU7uQhsxcxbcNgkEDszG4RstMbNrXG?=
 =?us-ascii?Q?ZgEFIR1Ct+tQX8tS1xt3yCm+1iGbkV3YDW9Zg3ylORkNcVKwlXfMPURkbjN7?=
 =?us-ascii?Q?vLvR+zP4b+oEgbDvDsW586hFUFvad8VQvkSC8cxNOouiXIK062TY2bTtuw4c?=
 =?us-ascii?Q?KppBHgyg69ncKk/qoPR5pUmtMRc0nWex+D81T8XkfYeZ1Kx3a1GVn3GejpTE?=
 =?us-ascii?Q?ENNHzjOsSRR9hYpBVa27/4wprfU7i3I2TmYJJS6/pzDA4f/Z84bQUCx1OkBF?=
 =?us-ascii?Q?aYVql+4e5a5ShVvjVeHQOmPhsS2wj5ekX702ilPuBLw/0YoyKW4kghXv19me?=
 =?us-ascii?Q?S7eCBB4j8xbjIP0Ac/RM7ai+8ZxeGg1x29qBbl0JqLbyLkmfdIAYuCatDZHO?=
 =?us-ascii?Q?inFHbQ2QxUD2bvcESRMLnjGVAN3oPifdIOVfcu8QVU5xlDi32lS5Ulx1qTJh?=
 =?us-ascii?Q?x0Kx40oVkAVb//7gXJ8213Jl0DlLrQcs2YGGlBQkN//zWkxcIx0PlHiKjMgl?=
 =?us-ascii?Q?CZRoxAngU7PGNdfET2ET3SFnY0gkcSjRdGJF6m5AxJbRJj0+ccnCC7ul6bCo?=
 =?us-ascii?Q?v7Jc4+MIyPwjNnABH2MLfVyR4v/Pc19Q5zN97Jzod17kjfwULTNnre+8EtTr?=
 =?us-ascii?Q?48eb5/LhXx+fIHVS9x3dt5M5y5SyCCsyvDyqvsSIYEt6ry1fmdfZedPdKS/z?=
 =?us-ascii?Q?1d1POaW6OF/aBD3QOM8+BJKL1hqbx08fXxjVndthGeekZPH9sNDxDbEfCt3r?=
 =?us-ascii?Q?SjB+ZXecPj0JVc02MQYQv1Wjyxu6/Qxj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LueUcfFUkOHf7Une0zUUI1uDyXFuRf1odPQAhGt2RiV3owCz3vIVMAmwPFe/?=
 =?us-ascii?Q?flwOQiBsDVWjGo5HU2eSOBfniZuXt4oxkXOEEKWYB0x853+bdlXVELkmYZ1+?=
 =?us-ascii?Q?gqpu04tgUU9Pen4DttCcz4+Lpe6ADUUVmrbs1PAwnSVyZuA1Sd2qL6C7GQCo?=
 =?us-ascii?Q?JpCjt9eWDHzWOWfjYHNL2pHB+uRsfIlsFZOYV+8+Pxy+w4BLpHg50afX4CjA?=
 =?us-ascii?Q?N/jReBT70KWl6hF7NvF6lIx/SI5tYRRHKj1P7Fns5K6y2eDkCneboqKYugiw?=
 =?us-ascii?Q?K/ujUG4e87Duve3Y3o8y2voGK+/HM860BEUGVbSVtmO9nz0+6bHvqGVIKEXi?=
 =?us-ascii?Q?gEmABKlIEzq+GZjdUtxhUvtIYQaW9tDZ64AywWhHlAuDnCI15eyKq0tAY7kT?=
 =?us-ascii?Q?JRX7sISZsPY1XoK4KaDis9HYdVBgvi1NmuYsm+h6QLV+Q5VF/WsOwWRBce3F?=
 =?us-ascii?Q?mQW/Dm5noSjzoQKiDwplsyjeceBVwwJ7/Ini6G3BfVtuCyvu13HbIs0EPrHI?=
 =?us-ascii?Q?p6Q86ZWNDcMSo9w2kpEDhafKJfIO/hUQ+mtbdwqQx7VsGGRETa1VAM/8mgtz?=
 =?us-ascii?Q?t3+saKUzWsQcNB6KyV1Tn+M9YGpsY2bvj8bnNAC5dRbSis+NO2N6AxE5NXPt?=
 =?us-ascii?Q?Tl1ZSjW4c33aNZxLq+qZk86YEZhcS6nZt9Zt7xRzAwpJoFVDaNdOgY6TuSiD?=
 =?us-ascii?Q?BkhPT8BFOr0XEkDseMIKWCXwlFRgKf6W2UKctbuCQU5211e5Q3F1W97/Jo4Z?=
 =?us-ascii?Q?rQwe5L18Z4EI+sM3emftGHFIMc9Uf2DY1ZeouKyL2RS40XY6kOfSmABqL/ot?=
 =?us-ascii?Q?HFFW4d1l0NvIOxuaP+2t9svij9y/1IZUzVfPVmniIIHHly85zxCph1OOKNSX?=
 =?us-ascii?Q?zXZG1i1Dfp7z9PaDciv4mUSUebyoUbDzDHHQDs+39Po14BPv4EaAtNzkWaoi?=
 =?us-ascii?Q?iWESyGvl5CxoRjUAOTLWzz9fXgXVnvsw2xK0ZTYK+0T+eIt+LaKhQUoFVgT5?=
 =?us-ascii?Q?Ih5uzXPH/8qmEWmTCBEINPx7l8EuNdXnn6SJxOVpcaOwXqfFzKaAh/kmqJAp?=
 =?us-ascii?Q?x4qCyowJ2kK8I8gr+Y0ytO6booGa97dGeqJ9UifD7gPo8nsXLmqbe4xT17IN?=
 =?us-ascii?Q?+BrECROAPMw6/jYr2PDi5Q4G1WtczgOED+7Ek+C1QGg1gcfy0UxRJaxTLHy5?=
 =?us-ascii?Q?0xanAW5srhuLBpWbg1OisxFh7zW7ItHP7+nWCMBl9krQQWHWyQSSqyKsNpln?=
 =?us-ascii?Q?FcAvnNhIRxD3nGIgWKz8UeYX3t4nAu4UyT+Dn4XV3lfTnhmW9kfjiRCjoIRI?=
 =?us-ascii?Q?eo/ctqy4qs62ImGCJsxuMxkaCqP74rFEGsxlBD4rAGgrXemQUqz0h5bClm0i?=
 =?us-ascii?Q?UuMvXuwHl5Jd1tOVfqAyKsz+VroRpxH27oOSyeh/IYVM3fM2YhHRCnqOhoiO?=
 =?us-ascii?Q?3WQ1cr6EsjwIUq9WLROnaY9LMTxBgO9vElcb1BM5/fHMAnEYnnsuZI2S9AMz?=
 =?us-ascii?Q?Q0/q8dYuf1b54LH9SWV+FGdrKy320SviCyCLfhRTONV8FdZ4Cs9obPr6FTlN?=
 =?us-ascii?Q?bPgI+KblvhM2iQUn2a8VzyvUuhvI6zRqJ1mLpDMS/oq3hmBt/gOpa9hiRaX7?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f17ed41-ad4b-4651-fca0-08de3d931ba0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 17:38:36.8498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaisZvCcpBRP57m5DIk/i+1uwUM8cRMp2FsxEnjTH2ll+0+w2/pUTOvEyQwJQ7pt11Kw6DtjXGymWH/xXp54gndKv4RrhCrCkrjpxUJL+eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF310D5CFFC
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

On Wed, Dec 17, 2025 at 12:25:32PM -0500, Rodrigo Vivi wrote:
> On Wed, Dec 17, 2025 at 06:49:09PM +0530, Raag Jadav wrote:
> > We've been historically ignoring GT resume failure. Since the function
> > can return error, handle it properly.
> 
> I probably had a reason for it, but since I didn't document and
> cannot remember it, let's go forward and make the clean flow.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 4390ba69610d..a8b50091d62e 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -260,8 +260,11 @@ int xe_pm_resume(struct xe_device *xe)
> >  
> >  	xe_irq_resume(xe);
> >  
> > -	for_each_gt(gt, xe, id)
> > -		xe_gt_resume(gt);
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe_gt_resume(gt);
> > +		if (err)
> > +			goto err;

When we propagate these errors upward, what's the end result / where
does it eventually get handled?  If the device is still [partially]
usable after an error, wouldn't it be better to not bail out of the loop
immediately, but rather at least try to resume the other GTs, the
display, etc. before returning the error at the end to indicate
something failed?  Then you might still have a partially functioning
device and have a better chance of at least having your screen turn back
on to show the relevant error messages?


Matt

> > +	}
> >  
> >  	xe_display_pm_resume(xe);
> >  
> > @@ -656,8 +659,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >  
> >  	xe_irq_resume(xe);
> >  
> > -	for_each_gt(gt, xe, id)
> > -		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > +		if (err)
> > +			goto out;
> > +	}
> >  
> >  	xe_display_pm_runtime_resume(xe);
> >  
> > -- 
> > 2.43.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
