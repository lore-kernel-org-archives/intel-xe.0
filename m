Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C843EEEE25C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 21:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8480710E063;
	Thu, 12 Sep 2024 21:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbtSk18a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AC610E063
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 21:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726176053; x=1757712053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A97XXbqllgvIw0P5vR5GFeYJnp5mFFWbJTEepwV1hfE=;
 b=HbtSk18aV5l418N+AxPj2DsPJVp88wkY4ZQBbJQn2o0LnS5y7hLiyoVY
 T9e9B8rAQ+8bjYimBk9n9p6RXmI8a21HprS3SLtFYMEAxwPj25Mc6U2v+
 jCWz6aTt2dbuAle4Oh5TKkF+GvYrWRfyH2F39xAPQ7iNOYpfnb1mFTNtM
 D7gG2BQ2RD8BDFtUzgerdm+YndFmoHRkBhRnZG8nyOR6Tnus8x6AzVplw
 1U82pXPcJrWQaeichtrapvuWXEMnGWwx5pPJhGCcvyuFX66Ha/p2rKCkg
 anHWvj1eEAhDObZ4FcgUT8ggYUro+UMYbMkk0sxWMjYQIhk1ydpHjjEcW Q==;
X-CSE-ConnectionGUID: hxfL94TpSxuLP41vDSGyWQ==
X-CSE-MsgGUID: oghAwWqmSiWag1K9RVny5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25253058"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="25253058"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 14:20:53 -0700
X-CSE-ConnectionGUID: mXq8OgWWSdKZDAjCN/5iXw==
X-CSE-MsgGUID: /uyjWFJiSL+ThpM4+eny3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="67814754"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 14:20:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 14:20:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 14:20:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 14:20:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXca3hvLYZepV4TG/0SYFhK3bnIfvlzh0uwsltpQmQeuHb34+hN0ACeawxdwYhlktYZTt9KKF6VQsxi3zqWRmKgcqH7w/ZWI4ffz0O2mfXlfZ0fP5vJmXiecuJQ2mduMaJXE3oFiWZGgdmCtqEI56nigg14Lh5FOlpJjfWAodEaqLUN485WqXL9azioXXyCor84EDauCcV2+C9RGyE+7UZsFGePHl0zvW3/phWTVIGdOYbgjUh+cj5NRxZvSrkW6UZM3KKA5m26sCimCwRbJ1xbScu7LJA/k6N7Pe8SqVKs/UTRX+nCFykj47D3oVrNzNo9zkDaCdiuHHI01bhIyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMAh+gA2jAaZnK0ltOcb56PlT00Bsg04yeumYClvGjM=;
 b=bmdKwFxpYwY3gD9uW/J2wVReRosyAsC6lTEsCCHo3C2AgxB1bnX/BEWcqFIKszccpOvJpRLEUsUJLdRAfiolvqMkv9BjcHtVhrqmzGirhi990NKGYYkSefuNCh3a67YiG+kdgdwwqlcDE9FTT2RD9pYbHFS3niK3oqXn5tNDgvbwKXcUq5XRRSVdL+QqrZs8hq0/eACIgsolx4s+F4kBFnRYWATzBPP0f3l6YOD1Xg6ciBo9yQ3kn3l5EbOWCViio9+mBqaXrRA0+b7FxBWQKzC8TWLvFNzF2lyegYGOjwP5mQGV9wq8s8dd9UqkZ2Rqu5MwBbwSb9m2P3jW7wfyCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB7712.namprd11.prod.outlook.com (2603:10b6:510:290::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Thu, 12 Sep
 2024 21:20:43 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 21:20:43 +0000
Date: Thu, 12 Sep 2024 17:20:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Restore pci state upon resume
Message-ID: <ZuNbKM6-oiJUIR4Y@intel.com>
References: <20240912190530.435976-1-rodrigo.vivi@intel.com>
 <5o4xl2avzkdnbecni3vg7fmtiw5lfr2ohuz3o6vdfqzjmkdmia@pd7naq6fa42l>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5o4xl2avzkdnbecni3vg7fmtiw5lfr2ohuz3o6vdfqzjmkdmia@pd7naq6fa42l>
X-ClientProxiedBy: MW4P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::10) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e42fa7-6235-4979-3a46-08dcd370c226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YvQVUacE6DNg08ukaO25KrUMdb2sKXUfWbmdKldbpvPYXjiJPLpcV4Mz47VR?=
 =?us-ascii?Q?mC6M8qdu/RxPomXpkl0l2I03kFmrKAc1K9sLVuX0KPFVSiLj5E+kcUkDlz5D?=
 =?us-ascii?Q?Tmy1IWLywHHcmJqeHCED4XMRa/7PmMVnP40Y9ROIVTLBqoIwWRp49bCHVYL+?=
 =?us-ascii?Q?MiQRPlaBEbj1OJCXnyv/YU7tkEvJSsOQET7JdseA1Agvbl4L4I9PgzvOEfvA?=
 =?us-ascii?Q?O0zLNBS+KxnGSgITS6iZZ1w1tb8bt9E2JoU9gIO4AmoIidZ5IASp+E+23tQd?=
 =?us-ascii?Q?bi2t83vev7oCiv2Uwx2F0uZpGOp5/TFWilUp7q/D7b1xWN2QFvhO0r+2BfeT?=
 =?us-ascii?Q?TpxVGO5Gj5azIwDrZs3Th6Pc1Gb+n2VhXYLYZhDGxK6D+AHXly8MGfMz58Dz?=
 =?us-ascii?Q?pbLrNrTKOmcvSqKvadJG7a4ACmJk0npP5y3ZXqlUqwlPpNpyikcwR+BZE1SO?=
 =?us-ascii?Q?La4/Ay8vFhx6/2rFqOzZkaejxx4sEzWJFeTvAnj8v+Aj80rwMcMLRcVlTLcB?=
 =?us-ascii?Q?NkmZsQuY+RAJDgBaCNsxpjWZTr7aYKFufkGxa15BwmfU9gHDQ8S/mFM+F9CX?=
 =?us-ascii?Q?oHnJdWoMjXetrsW9fRSsXNXf5ZPsXMTGElyoN6cLbrwyO/oSY1wVukv9KpMY?=
 =?us-ascii?Q?vLKywM2Qib8VRhVf4y9E0A1iEL4pM8sRzHTRwOweJCllSAF+J8Q9nINIdo+l?=
 =?us-ascii?Q?32nWLlMRkesvFM9mjFVPxStucr4cELvw9Q895DIPRdMlgH3RXRdV7/KGF7Hh?=
 =?us-ascii?Q?CQFtrFgo7JIO7I/J5dnodbDaxum5trLrqumSnar8TL94h04EabtwRBeiwaJo?=
 =?us-ascii?Q?oFVM81CqQskdZUqTps447MV7J0Z8s26D5cK1jVdyycxTINoD83btgHIX7iYH?=
 =?us-ascii?Q?AOebBDcKD1fP4NJp39yCXzwE+hXs9ZGeauQMtVk3p70pFnbhJWTpPU6MrHkX?=
 =?us-ascii?Q?ZbI1cXQjk4TovgLhcfBuToLEt0WYVgY0WL8NPlFaxQKT3ITNEgFGxAkw0p/v?=
 =?us-ascii?Q?rVEEMwsPiqWM8It4Z2eWVQgPgcFSnEDn0pSoQ9bgSEekmHWJUqWZvedmP+pp?=
 =?us-ascii?Q?o3o37kZi5CB1Wwl3mKVFsBnGxgQR+Ls4R46IpY+OjlO49kkw9TVMoXv6S0hO?=
 =?us-ascii?Q?dH8TQH95OeME35c5Jy+4LH7UzjGHnySM3Lk8kQIFdRK3/d+46gqqFB0bCRMb?=
 =?us-ascii?Q?lZ0TnoXqKGEX+tHnq50fsdtMzaoGnuPQH1afC1D89X2CQWK33nTcvhXQUma/?=
 =?us-ascii?Q?oUNP+Iq0443rM5jfaAftcj1S4BLYgLMS4D2NlX8JejjIYNCUP8pdEyASgDbD?=
 =?us-ascii?Q?xpxROXymlk2doAH9OwLKCuYybw3BEvxfPKeiLflDi0cIfg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f45Tl8OxF1Nj/Whtdx1JWKEk2u7MgmLtewxr19n3NWrdD/oBc12Z7tAjjY3t?=
 =?us-ascii?Q?7br6mZ4jHmsW0zY1N7Kvjj1igylPLQRr7HPL78Pncb8JgqZcAPe8jES4lCUJ?=
 =?us-ascii?Q?XUGDLKXgbnIT1r4NIf/dwpX/ziVx05eMOb8gRV5yNzUnTbeaWtE3C6dWoBcD?=
 =?us-ascii?Q?c+Mm0NWl7ZYkZSvXYRtPOY52dvx4UGdoPmgRElXEP7oLpldICg4HIxmOhHKD?=
 =?us-ascii?Q?7v7WXaomBwKuh3TgZoKApuswW0aFeCWgrx6nqmM0uSJOtp81h+64mcCCXcUi?=
 =?us-ascii?Q?tOys8xZazuVXNKJNPk7YqMvkoXLW5SQ9vb0nXIrgF1LbFPjjwmwFEwD3zEPU?=
 =?us-ascii?Q?s9Eoj+Ysxx2CUoiknzwnYwQSA8x1LTwo02c9WIu65XSMlbzorlsrsrkSrLiR?=
 =?us-ascii?Q?TH6BGNm+Di7Zmrm+/fJo+Zjyc5Lywv5EXwvHwYtQ+Ooax0Szvijz8j9VlP/v?=
 =?us-ascii?Q?OeAuxnYDghTfInV6yz8LcN/VpDmEXI4cTgrKzUXvbQ8yvnZTh2VD/axWSz21?=
 =?us-ascii?Q?F6CUkcGcPxLw4wa02gM1LOiPxr1T19u5UnJOK5NiEKaYk5BDoBQxALm+zh6B?=
 =?us-ascii?Q?w9AM/CNGglvpqnldIkruc0hB7FjOE3Zc/mL0gZkWz0RKToMOhkMgURLNhl4B?=
 =?us-ascii?Q?Ay+nqJf/xRu0+/x8VSRyqj0XvwSw/JTqhj9vQjgJ5h/jebTWRCSJ6p/2I/n5?=
 =?us-ascii?Q?iZE+7z1YrWnRzVdTggvBliQaIOJQy8xCr1jh29mbdA/QjvxV1HUHdtkAPXFV?=
 =?us-ascii?Q?H/FsqkGSy7+iks3zVYq6jXGX1/XS/pKWp2wYGOYeM6EjoE1n4BQNKSIX+ROS?=
 =?us-ascii?Q?r2Nec/xgRzPVnpbq7M1eIn7Xgbs7hkBLFiOptZkEfxR6qB9Y6ft62VyC7Z5t?=
 =?us-ascii?Q?J+8JdNG57n+t9qhSFhYLRmx8QPbZBIWa175U72zRPhaaeGt6iwLSStVZOgMY?=
 =?us-ascii?Q?QJ0oNJTwTQ+a2mabYdlEmlUcuEKHXsyUbQnVNedrSox3EVCFCqhHCUdbCLWM?=
 =?us-ascii?Q?LxqVCvTI3QpP+oQTI1x90fxoOuBDbbA8yLn0jhqlYHOnVqUjvq/qYQlSmwOP?=
 =?us-ascii?Q?5yExz1cSkB0lmeufkOGloJzjb4m8JrHVZ/QG6uUgcIypEeRnPdS9fVl0Xc5Z?=
 =?us-ascii?Q?CJBBfPBk8psNM4/jpX1ghuKFo0WC5JaWE4Fsy86ZrSo4lHo3oIJnFG/EjpM9?=
 =?us-ascii?Q?l+lhLkj7Of1U3No6PVEmwtjYz3WBpRD8d0tZ5Kro7d7/Mojt3Tl6eyoWxr6h?=
 =?us-ascii?Q?Q8VY1NcHPNWw92RMqod+lQclb0GQsVuBhoaI9odAOKDPyz8ej/0NZUAvgpqI?=
 =?us-ascii?Q?SEA6Co7vvSJuB8Y3vIKaFalZyaOgA+s91awH4ARLH3hRH+pj6jP9OSgPqZaG?=
 =?us-ascii?Q?3Qg/Wb2AHtrdwVpP9DVEv3BoAG3KITxXNeYDTqmcafQ1ZlWtoA7ksC7pr8KJ?=
 =?us-ascii?Q?lAd9ToXQDscjk+vq2RNG/QhJGKVG7b2TONydlr5yQJAa1eLd8QS2Vq37SNXl?=
 =?us-ascii?Q?sTTyLoZKEkLSv5he+FoNkWdfYSemuXIVo+tuu/2XT+hFP9zvit6zhrgS5Un5?=
 =?us-ascii?Q?/YuW6nhOiiLILOVEu+Foxf/zEbs4Tb/ZVWoYbS0/ObMm7rpHRmSVd+1liNoO?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e42fa7-6235-4979-3a46-08dcd370c226
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 21:20:43.1058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Hva1l0buiBKSrVOqVUxiCdP7p0kJTJ2pVV3eNHDHSmC9hCYBd0OdE7weCNvLeG2epF39hj9Eg31zk39IerRkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7712
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

On Thu, Sep 12, 2024 at 03:11:12PM -0500, Lucas De Marchi wrote:
> On Thu, Sep 12, 2024 at 03:05:30PM GMT, Rodrigo Vivi wrote:
> > The pci state was saved, but not restored. Restore
> > right after the power state transition request like
> > every other driver.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> 
> oh, no
> 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_pci.c | 2 ++
> > 1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 5ba4ec229494..6d29ef4b396f 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
> > 	if (err)
> > 		return err;
> > 
> > +	pci_restore_state(pdev);
> > +
> 
> something bad happened... I was sure this line was here before. Indeed.
> git log -L:xe_pci_resume:drivers/gpu/drm/xe/xe_pci.c to the rescue
> 
> See commit f6761c68c0ac ("drm/xe/display: Improve s2idle handling.")

hmmm...
Perhaps

Fixes: f6761c68c0ac ("drm/xe/display: Improve s2idle handling.")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

then?!

The restoration shouldn't have anything to do with that case.
and it pairs with pci_save_state(pdev) is still there...

It is not in i915, but I have an i915 patch to add the restore
there as well.

Also, I might as well in a follow up bring back the
pci_set_power_state(pdev, PCI_D3hot) to Xe.
This is probably the right way, aligns with all other drivers
and i915. So that shouldn't be the cause of the power drainage
on suspend anyway, or i915 would be also draining it.

> 
> Lucas De Marchi
> 
> > 	err = pci_enable_device(pdev);
> > 	if (err)
> > 		return err;
> > -- 
> > 2.46.0
> > 
