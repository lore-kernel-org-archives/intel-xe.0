Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAFCC25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 18:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC0010E5BF;
	Tue,  4 Jun 2024 18:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ei9NUNdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260A610E5BF
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 18:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717525886; x=1749061886;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wKMy29nP2RPtwDq2WTNLxB7FPwtWF0jd6h7raPjGha0=;
 b=Ei9NUNdU4n9DwMZ4qyV/Vt6pHEy4N9g/G11MeE8HDSMuNG7F8N7eMEhd
 KbmSodz/P5Z8BQ4mebHJNjL4mKEoLeDZLrA6bfSmmazs6oyPc8CzV12YZ
 9M3ulQTLfAPBWBNrmIukhgvPyyUmlqX1fRdigP64RnjZjXegOdYBimwXg
 lOxGGQhSeaOyjZYFEZGJcg9gvZnAyosFWDL7Pu6dJqeQfrhXtHhuXVh/D
 Sd3JP44+A3/P0JfyNM2ixkKs8DLZs265f2byli+Tqvx296iveBn8AUcow
 KG562nb5oJzgmIqdM4ej3wdmVEgDnXoNjJ+1eKBHtyNg2Pitd5MI2cEBV g==;
X-CSE-ConnectionGUID: zo1ubvegTkaeyjD2Q3Czwg==
X-CSE-MsgGUID: eakicZWXRrapRRcljlAB6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="31590656"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="31590656"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 11:31:25 -0700
X-CSE-ConnectionGUID: 1exzkmpxTtCzvpGdt/J+fw==
X-CSE-MsgGUID: 6BsUtbXBS3O33UtFAqBgNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="68143521"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 11:31:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 11:31:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 11:31:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 11:31:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8El+CuMcYFrej2Id+GI7LVN983vjTp/TE2hDmeTzmvFEyRfOz3/AYYFGy3Yge8Yk4r5SUf1y61DGm/ZIlWgBbzpuq4uUcJAy9WaJ4PNWG1MCTu8g7lbg+IaAEBkA2TryYV5weRv+FSUd/2ggkFrN+jRnDF32wUubW0s3ly3BnpAGc/0IShkVcVw/53fdbxiXbHR8dmsqE8AeVadRuhY1Mg/Xa+olgiCWHzeO57wdMVp7RfguAjhG1pD0OLcoE7h1yeqIRVNX4B4uiL5vW+VTWXicifoVSqXZrN6ppJPcN0N1X/DFEAFd/AYUCJMSx9IyCHp2P0UdC/EjiKhiQh8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUPNV8lxOMwgLEb44RuKeRZdYNo5Qze9CVehSrxi2+A=;
 b=fiQbg+ZvL9G13rfJV6hQAQCD1skujvvHJV/rPiuKPG68dtI59rPD+xGO53nanv4ylLcu7k9qEneGhTfcEnZRMKtsPsCFAoaqKXUQ8WUrrhdVE6siRzfx+JABf9+7fingkBP6mTjryRoIZQIcP7afj31wkDe9L6hFnsR5vVW+FBXvrtxyJJ5HdYdQQyquHSjn7+7tnjOeG5uYSMX7gveQADpz2zxJgT6KUAOOYa4c0X2NifHnQFlwOLj4pC0wVsQ6ZT993Vb6kIbzBMqIgCCVL37Odl9s10HNoxvpYkOJ2W+nylnuW7E61el8TKe6phaYR4P9QWHk0uQ8LEfydq8wBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8331.namprd11.prod.outlook.com (2603:10b6:930:bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Tue, 4 Jun
 2024 18:31:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Tue, 4 Jun 2024
 18:31:07 +0000
Date: Tue, 4 Jun 2024 14:31:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Always check force_wake_get return code
Message-ID: <Zl9dZ6uMk5eVQPpd@intel.com>
References: <20240603113005.710746-1-tejas.upadhyay@intel.com>
 <92e54e93-dbb8-4dd8-8257-58dd8c87ff7c@intel.com>
 <jk5k3x7kcxyu2zg6vcefmata7seyfg5zocr3jlk2c4d3v45ixw@pesc5prqes3t>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <jk5k3x7kcxyu2zg6vcefmata7seyfg5zocr3jlk2c4d3v45ixw@pesc5prqes3t>
X-ClientProxiedBy: BY5PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 378e3b44-c39e-48d6-87df-08dc84c47fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ag0SmL1i4IZMI7weD9v69xR9J3cIugnbZDFUblGRtM576pK/8DJzchShzCyc?=
 =?us-ascii?Q?lFaV5iSsxAM/ih6DzGfh3Ro2HM6jcDL39dBTLvM0At+Op41QV0r0la9PsVFv?=
 =?us-ascii?Q?NgXvRvvWk4kvb+evy0X3L8Bhf+0ML4LHJvjD7vw6jJ9UQK+FVZXpMabpvoDs?=
 =?us-ascii?Q?wTrgBNaZrAwfPTbveOerZQbsgIW+BLTCtK2Mv1uC1ZDvoGQD9BPEmHfKSlOO?=
 =?us-ascii?Q?pHNx3jb56pG43qzIuOpVI3yuIAPGYy257DUA42b83BXrfo3YPOHRMS1o18HO?=
 =?us-ascii?Q?ZxMFebJJH2cZh3QnEAnW/AP6tDuC17AF6YGqWbOgBif2pc2Ed1GfOlYpD0sU?=
 =?us-ascii?Q?gBnfxxFXtvmaEwgQfseHZduW79vSyYB9XvJAeUIjO48IZvhqmYOaNVBNwsUQ?=
 =?us-ascii?Q?mK8Qhyk3broi9XKmkCpdEFWlEiMHCBQ/DJ4TVYU1ZVMVwRvY6UocF9ymgSLy?=
 =?us-ascii?Q?k5/GiqY4uX6NeG/xGl1IJosOlCa0QReDKPS7OncRBZAfOY5UtvoBvasQZ153?=
 =?us-ascii?Q?r/SrpXuBvyW3mrpKXi+zlWEstGr7cNWPFUV2m7l08VgFiClxjvRFjbs4Auqa?=
 =?us-ascii?Q?fd33guaaYLW2NfGs8oU8AE2Btk5gn1sn2NZKBxsbUxn2ZNlKNhQQXf/RoNfg?=
 =?us-ascii?Q?WVHVYXcR/ScjMgkzHG6vSGk67X19UxePqMyRf0YcLqlW++ucsuPVDScverNr?=
 =?us-ascii?Q?t4Td1nJ9WDagTSGq/r8hXcuLyO6kRjYF4rQPhDyyj3oYBTaYqDpMCzQnv/de?=
 =?us-ascii?Q?22cDOZGftuvsFUNLzm19Maks2SI8A6Oag8p5SpXAy5IP55Ji1T2xZs4cH934?=
 =?us-ascii?Q?veyRX+hXXyt0q8rQrgsTYs5QVibDtqDzY9nQGtMUS0SOJ/E67WMMDfRXvStS?=
 =?us-ascii?Q?IBJPULO0NqjZ9/l13SS830TE9nbuEv16MUpieXgSe2z3iB7b0gY2xLr+ifdT?=
 =?us-ascii?Q?UyGGzJiafpIRzva52kcDDvw2Tv6iDPtZLJEke98cKUyTByYYcdsqAUJJ1vMU?=
 =?us-ascii?Q?N/MFgXOs1/xdH9Qh8NLSFQk+IST/hMS2UgiwBGzWy4xN4zsFrpsjKxR5MzwW?=
 =?us-ascii?Q?o4s4KO9v3rCSlQJgrtk8LA+OMnOoTM9uuQEcNTwTW+T5OdXV0cRcaR6or1Sw?=
 =?us-ascii?Q?EZu2b0nVQ2VDwSCKQdwq5dqHxPl9p9nEHIg6wNvKLwTHKqrRPZ2EY+Ce4CXS?=
 =?us-ascii?Q?UEc9vzKZILAePykGW3XL4mSHLyBHB4umyizaW/xdgRhsmAFlv7V6bFKZsA7I?=
 =?us-ascii?Q?4RrZ+NBt+7rRhBHiDYRjIO89T+bXGwDpObYGZfq0KJZ5V6Tz5PULGB6leSEO?=
 =?us-ascii?Q?QP0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EgH3QwWKuKc4f4xvr+mKI1yl8m8YZDBDZ41A2GaQY2cBN7ym9wrrblWF26IW?=
 =?us-ascii?Q?GopMadOVUzkPvztoDn8AS1wg1yiGv4nN1qUIPPMcYbOjsK3XtQGYkHLkvqW2?=
 =?us-ascii?Q?6Ec21TlDYPS4RVappYrgH48fegWrCi5DFYKGju4mc43D8z9IStox5Bk/9pHK?=
 =?us-ascii?Q?JiiAAZ059w2cxCUYcWoZjaKoLm7lsxZlU6KyjqjoID1NIkM3S5PQmG+nCSjr?=
 =?us-ascii?Q?/iGFB1pu7xmykU3cGp/JhE0OTu2M+jYHNYVC5L5d1Rb96wTNpP6AoBqbbLUJ?=
 =?us-ascii?Q?X7dwjZ+mglUnigpGO1uSdBzLiSWMp8IlXb1Su0DsSlOnyaRVXZxuBxEUBpf0?=
 =?us-ascii?Q?w/Z825ZVC9mcgBApxRC7D/JNYTsUSfVA9PfMJ/VxfeMtxt0mzb3RiU8C3Moe?=
 =?us-ascii?Q?QpEuoVlF0Lm8eecaDcRAsoNo/BjTNe8PnUPe8KQmUHc0a5ZCwbaL6GiDTBI+?=
 =?us-ascii?Q?T3bGtGBXivGlCRiT/geTCCVJH2w5DLAilYJJtuN22RBytT9ndPUakgmuzzJz?=
 =?us-ascii?Q?SUyVDVxeJkDI1Pu0e+Qnt4uATUncz7zrIY+XTUBpa0pp2Lt+fs4Cl+rqLZT/?=
 =?us-ascii?Q?5rlaNWShRpGFJxpTQ18jkGHDvFVCJgjwtBYSYceZriSJS2oE60/zVtQk4HGp?=
 =?us-ascii?Q?jwoMiT3OyuzaLsWDYy2CZJJpOnT6AM8N6R6pNN5bmisBcemVdutGD1vIUZUn?=
 =?us-ascii?Q?tX9Qhyv2/uY0f3blJMKQF6b4G2hC2KIq7wVkSrRaHtn5Q5Ca+JnbjXS7mTSk?=
 =?us-ascii?Q?8jKKRkKyNKKmwVStYDJ3o7LyMz1YG0mlbY5PuYQwPjXPRLNZZLUC7smrYYEe?=
 =?us-ascii?Q?jY3pXk/J6SGYsotnsvAg5dI2Yj2TizGfsYhVOB9qLbR/MGSiiGH1QFgcvFRf?=
 =?us-ascii?Q?hq8I2oSnV8Hd+ZhSglf9VbdNiBNTAv1L8XvSQcab26gb5UPZr+LmcrepZogD?=
 =?us-ascii?Q?8roPuYE6FqkvjNq7nPNp2cssDV7NaVvN+TJ3QK/UPjgCNMY8pvZoBVppxe6T?=
 =?us-ascii?Q?5TxdHOPH+nm2K8IYt72bOQ7r7i4DTRe+HHX8faEn+qlYLPd0H3WyOp36ceLY?=
 =?us-ascii?Q?Sa4P5HBjIKrxykCkRkphejI2jz8XMWcbSstT8rj0+VSHJct/hct8tVkjf0Kl?=
 =?us-ascii?Q?dhncdie7PcTjkFd6UtSR2hvvYj6SoAJNlCRRu5COG4WWBW0B79IrHN8WN2fA?=
 =?us-ascii?Q?xJwyeODliwgWdYwJCVQqL4/pLVwI10EaV5Hdd3d9Gyhn5/PWE5pBwedXiRAy?=
 =?us-ascii?Q?hnTNhfnFLYlLYBSA6VYVwmI2ojyjGxe7GatSlK8U+V8M4ashl7BtPnHjg769?=
 =?us-ascii?Q?II3c9XaBOJnZFJYkIL+8shnYs1BaJIjKmdrTbBGAK+GwyaKjMo5K+xJ9R95q?=
 =?us-ascii?Q?a5SHWLQ105mCcDaIYO1jYPpwz24PangCp1LW0mpjbDiYGdqmwcqHOMJ5MXpL?=
 =?us-ascii?Q?nrM/mAR9QMunVcu0WxNFrLYoNgUEsAul1cpsp8JPoo3y2QTvoGDRxR2VzY0I?=
 =?us-ascii?Q?A4sg04udeX8+6UR2kMAcwRz3YGgXfVxVjdP0uHSxNRPER2YjJ+iqa1vmE4qb?=
 =?us-ascii?Q?0URjlEKGeIi7SUpNss45a349K7dO3uQ2o2ktJ94i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 378e3b44-c39e-48d6-87df-08dc84c47fbe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:31:07.3690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZml6c5Eml0eoJZUuqiGRh1GmRmQlHSvWvhiVL7iz13eNpm6lOOXOLpy2Jt2JPgB9zOWh+MiIktKTaN80PzZMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8331
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

On Mon, Jun 03, 2024 at 02:39:41PM -0500, Lucas De Marchi wrote:
> On Mon, Jun 03, 2024 at 11:56:46AM GMT, Daniele Ceraolo Spurio wrote:
> > The commit title seems a bit too generic, given that you're only fixing
> > a single occurrence. maybe switch to something like "check
> > force_wake_get return code in show_run_ticks" ?
> > 
> > On 6/3/2024 4:30 AM, Tejas Upadhyay wrote:
> > > A force_wake_get failure means that the HW might not be awake for the
> > > access we're doing; this can lead to an immediate error or it can be a
> > > more subtle problem.
> > > 
> > > In this case, user has asked information and in case of forcewake
> > > failure, it might lead to wrong information, so return in case of
> > > error.
> > > 
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_drm_client.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> > > index 4a19b771e3a0..e050fc6d8dd7 100644
> > > --- a/drivers/gpu/drm/xe/xe_drm_client.c
> > > +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> > > @@ -264,7 +264,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
> > >  		if (!hwe)
> > >  			continue;
> > > -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > > +		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
> > > +			return;
> > 
> > Since we're not returning any error code, there doesn't seem to be a
> > direct way to know that a forcewake error happened; we can probably
> > infer it by the lack of messages being printed, but there is another
> > (unlikely) exit point that causes no prints to occur. Should we print an
> > error to dmesg, just to be safe?
> 
> see [PATCH v2] drm/xe/client: Check return value of xe_force_wake_get

and https://lore.kernel.org/intel-xe/20240604110225.29495-1-nirmoy.das@intel.com/

> 
> Lucas De Marchi
> 
> > 
> > Daniele
> > 
> > >  		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
> > >  		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > >  		break;
> > 
