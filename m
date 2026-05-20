Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E6ACD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 18:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EAA10E40C;
	Wed, 20 May 2026 18:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dITCKCJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE4E10E40C
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779300440; x=1810836440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4Nsb38X08wObbsA4Z6tYWePtvQYsPkWuLMkwWijTG1E=;
 b=dITCKCJ8uZMSDtovG0C6F6DzPfNqqLjeC0stGTNIDz4QBaIyWLyZzhB5
 +qQzqx47dC1XPfOLSlEp46Z7ccvIPguRecppGE7w+1tv0Fbi6w3NwMfVc
 LT0V7mtEMytnmUWKaPovY7/k1or1XyZ7xJcUbU1nfWVoIBzFwaeTWRMlp
 ZicYQsVSBCC3Kr3NC/e/x3YTLR+SSOGJiF8qLuT7zNk4hoYwmVdlSMmIo
 9/BDp2QZny+yfOb3esWw9FnDt/LCL8vPuRPUm7worMLD8R7WIAxMiF17i
 +/TyOz9ULJ8aPwWn8H+EY9xsFpUXcVh0tXWts3qewtBTTOfZM6mWOGCyo w==;
X-CSE-ConnectionGUID: 8Nd84GgdTTCkqoG0XF5MOA==
X-CSE-MsgGUID: 2zDgrWYLS4SyPRnrKGyZEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="105671167"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="105671167"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 11:07:20 -0700
X-CSE-ConnectionGUID: 0N983NdmSyabNklP0YIpRA==
X-CSE-MsgGUID: biaf/EkbSYy1iRp+oRw7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="244569464"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 11:07:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 11:07:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 11:07:18 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 11:07:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fI0lO44O7IQQGTx7DC+izhSdZZXCX9X4hNa+X4e+7McNCpOwEeg71d4ZsStjivpGn65Vmm9/hxr8rbCz5wutR/CWAI+SOIgnwFyR7FR/fwf0nhqXADGDbIZRm1DhJDTdNrnB65uSrcYO6I3lw0sMYMsC8d0RAHXY06mmnfuDf4cA+Y/RdUZyWDyr+8P0y80EaQLEy2GwiM76nYIMgtKw1Obm1+aaVOVpPbLa8oNVloQQzikOTTb5JpeLmczP/VYFvPZH7pdgg9LuZHVBlPzsRBo4OgBjTf5dhNZqO0F77G4jXwjNIDmCsRhxZPCumRu9CyqWj0QueEnsKNUkrim+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EEiilJ1Qym4eO72ksSYLk75u1oFXuJ/QHsH6H5jI3c=;
 b=NSFULOOZhlSW0nIAjQpBdLPDP9gNrPJR0qDSBKVud4UpxfxQ5ftkCQRkWxeCcEFrHwK8LqM1RtHdg4GpB2UX9vAWIROaQslG0oWEvYFHXEQQBw/jrenyhw5ZIOXW2llxnFFINYQfRpM0w8B1wo1NKWQs4YIz+eIYOlImL2Ceg5MUeBf+/lw99ds8YpGpIcLfXJFPahKhlmbKjWu07s9ykUSvH1AZAvuQg4oY6mL9uYpsJH+G8pmQldXTdvgWEnNyb4PJWAbHc+O0c6d3aCyKPjz0nZOIjlUoCWTzZymqXnYGHkZMXPP9hDRFi7/PRhk9Nlk/q2VXD61NGNa/7vYCJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8095.namprd11.prod.outlook.com (2603:10b6:610:154::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 18:07:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 18:07:16 +0000
Date: Wed, 20 May 2026 11:07:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
Subject: Re: [PATCHv2] drm/xe: Check for dead config space on reading all 1s
Message-ID: <20260520180713.GD3379914@mdroper-desk1.amr.corp.intel.com>
References: <20260512060128.209698-1-arun.r.murthy@intel.com>
 <20260519033104.480503-1-arun.r.murthy@intel.com>
 <20260519202629.GI3397116@mdroper-desk1.amr.corp.intel.com>
 <IA0PR11MB7307AE528ACCF3DC54AA4072BA012@IA0PR11MB7307.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7307AE528ACCF3DC54AA4072BA012@IA0PR11MB7307.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af29af1-382b-47d2-5244-08deb69aa01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|4143699003|11063799006|22082099003|56012099003|18002099003|13003099007|6133799003;
X-Microsoft-Antispam-Message-Info: dSax2bDXVpLtNkgrT+9qsEKmZoqjxLibhIz3qIZi8ZPKUkSb2cijDRd/Xufj6qNvv7NyIy7cRnVBq9A8aFd/fDuD33GwpTo5NG+nmUts24AbTu2TCoepJ/kQYogQg3fcqea8ZOFnoorgare1/oc9RNT61bhARKT8TiEE9QzhEVW3jEFKoDPvVmureSY0EhZIXm/6fZ8uHcuqfl2RWQ70lklVNaulzomo520XlOYXEJBbnvMgN/2/FmUe2dXox/xMbPxVBXNLNfsRRsk4mcsQ1spras6tmvhhvI5C/8eusf7v3e23OVPZRmtVx1DzSicmpD07JmhrCkPCwuhXxJK3ctfE72L1JppJF1JJd6tMcJKiojybkOujHvEIoYU9W0pfpsCcnv6+Ut6dsnBJ9kD+f9zzB7yuYkYfqvhAbknmRhWDLiH516IlKzoUoaB6YQhPS9d2jW+K4IBEZa6ZLSvqTLmkK5b9+DxbB8L1ZhveDIK3wmX4Ci3NETjmhgcIHav1fR5OgJKahFexqM4qKIrOsfhCiB1isXKDQj3LFqqal23WKYYB/FgFegaQkFowcFNJpMjzXhBEm7BsCNpYRktUgKmU9cYE2LpoqcWDxpdKeTFC1zrtR0+HNaHKYsCd19kx8u5CAvLEiGXgqEl61iuydA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(4143699003)(11063799006)(22082099003)(56012099003)(18002099003)(13003099007)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tgaddhyHSuWOOzM1/TdtZYVZLWYczBhBKvj/5ZuAvQ/QFzykGjaD9q6rXBuu?=
 =?us-ascii?Q?S7gFZte7ToLihYJprfX4/+mEtJ+PI6FGGdJlnB8j0q7x/pQQcXj8j564XpI4?=
 =?us-ascii?Q?Z9XL+mRU8QyoVJtrkZuUVQDZXmiEpxpmZICnT4o8USFp71qrwOjABg6xOqe4?=
 =?us-ascii?Q?MMyIlTzbjItcAS1/PtW7x8M59bWRc1P8rEe53RhpsU0nrBiXWxnWgk+XQgg0?=
 =?us-ascii?Q?WDF1i/gE2mK93e5QXeR9gWe9iuOIOwfm3Tl6qV5uGtbAYceZtnsT7jTL9/Tt?=
 =?us-ascii?Q?+dfWBQNYxfuJuTHSJoTnDHcJDBEg/CIexaEb1vtLENjXxYYSVeGRBFEh+dzA?=
 =?us-ascii?Q?4XQXpJmFUPdrQQAMszMmEVk8Jsjn7pnhbUfpdsAzMU+hLnn8ILvQLQtnAHiG?=
 =?us-ascii?Q?k2SueVAtMPJT62iM5XLnPgl2GcKeoSWFmd/G3d8eF7BaZNgOLgjtJr69cold?=
 =?us-ascii?Q?rKS9ZkVuWAF7wvMtCZzWyGptZ23cgXIqb8B9mVn0w2fQvK6pUkqwsa54+Lni?=
 =?us-ascii?Q?GzTwMA7Vnkx3bSS9DQHSKYURzslB6Ab5X55QPPbFlmgVUzBmUSEhAu+GqibT?=
 =?us-ascii?Q?e4edwllJDSnkt3RphBMv2xDUiN6YhhacIiVPxYJJePMKALPJ/ZTu9cAevS1N?=
 =?us-ascii?Q?m5WWpxgJi/R9Zp5mE8rSJQP7Yt05c+nBEBZIS89cVCNq6jGm00oGAgmvlTuu?=
 =?us-ascii?Q?NOBeLiLAyRIQa5628e06oCJRc3hwU9JQU+nG5a6LqnJ/UQH4FJ5IzfriTTgf?=
 =?us-ascii?Q?RjaL8i61zW/2/MIZewiMwBjGUkyLTBJgXGSVmxglvO0QR2NSuoziBgcz/TA/?=
 =?us-ascii?Q?8LIOAtSMq376tVzZfib6H+vkCpdPaEgvKLjEYXHD7y7LavWUvIFrCym2lfsD?=
 =?us-ascii?Q?DzrVFj2Wiuph8Gnat2KEHFVHI9Ew9Q/G07B/zOAtI12kkWz8+c0KHYuE51cG?=
 =?us-ascii?Q?dncTeLYQuzlm0HfL0T6IZeVvgQ4XOTBJjK0HTkbegM3s1QWjL/dYNWlC0lV1?=
 =?us-ascii?Q?8JA+PhnugsYLiuNwKXphLmTOjjSeXqBSXxdJfc9tX3l6cuZWNNMTkMZIm1fG?=
 =?us-ascii?Q?mZfko9yAPkoJhuGHkNUsCUloGKFbW0AVBKtQ9TMxb8VxxJNqfdtJFwXei+aZ?=
 =?us-ascii?Q?7AKgRJXg8AvZ4gAz44tAC3ROdTkD8v/bbs+TWCeSEBdv5ct7dXk7wNClekYk?=
 =?us-ascii?Q?EY7fDre0RUd1j4Vq6vbNAYTi36Pzx4w5cojAhcbUQVKiJQA/t6SkAVMwwcCp?=
 =?us-ascii?Q?Cx/KokqqVs69s3CGzZ6A1HifwrRdKihr64yVZD1RMSsca6ypHSi+6A3RBnw3?=
 =?us-ascii?Q?fwUfa9ej4ZqzLJmN6WeZ4NCrUT32qiUfe1REa+u4w/WJRhz1+9QqQEil2BEa?=
 =?us-ascii?Q?84zYCVy9/x9ZVzBnwb8P6Ky3tawCof0ryB/neWss1qVw1iOrQd6z1JEcwL8x?=
 =?us-ascii?Q?G+8oRO8VCM6B6EwRGCn9gP/kBzTz+P2baq5KsXgEv9mwypvTLejeSgDwKPjy?=
 =?us-ascii?Q?s1mlRaieFIdLBPvq5UoYvdg+nCKHCEYv3er21M2rTuFlA2Ex0pCPO7ntXhbu?=
 =?us-ascii?Q?n6g2Iz8MuBiVn9jYnCpRQJTSFgvxF866iKHtFvNZBClndbpxTdXHMEoGKJ91?=
 =?us-ascii?Q?sOzY5oElACPl8XkTIS7O/XbaYO7cnYnfibWe57xGCuF1b5rppQRGMnTg9zQO?=
 =?us-ascii?Q?TUo2hO9fyj84r9j2o4v22YI4ZvI86nheOyjl2FbKvKb3mc9IOmcasv8Cign8?=
 =?us-ascii?Q?IE212huRMtMgLqqJAEiRyME9+ZleEJA=3D?=
X-Exchange-RoutingPolicyChecked: Uo8LPdINF1Brwcu63m6vYHfFrBD10VnRRcAEH7fljRonsty5ar3mTvoODNanjjiopGEF5uOaxufsVaXz4YwUO5CUYxF51TWxnyF26UHaBXnhLZKfH+In3TxopgK3+hM5jp8HlmIGjBqnj6haszYnv3lrVIUg6Rn2dWqGxWGvWZNOcBX+GKVkPX/ggUwT3MoHmFTPH5rd8EgykLZk7pZmsmMCfl/fqcwPgrq+CBG90mMrKGJSRjDiIWXE6vIBiUakBJcv++BAAzxLvuLSm4MMj2t4gF/CsLbSIRcJghUqljuST7e/n8EC1xkt40EbWED22TjIWF58WC2x/jIYg5EfVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af29af1-382b-47d2-5244-08deb69aa01c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:07:16.3105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtaUqUJmvlcNowzoSrDqYEY5Z88sNFdYbyxdkXg1GVVru5u5pmLO9kVy1uvlPz2p45MSIKwXnqHFK2IHpoB4oEjfcwoW8YSSdsJ3ciN/mi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8095
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

On Tue, May 19, 2026 at 09:42:36PM -0700, Murthy, Arun R wrote:
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Wednesday, May 20, 2026 1:56 AM
> > To: Murthy, Arun R <arun.r.murthy@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Wajdeczko, Michal
> > <michal.wajdeczko@intel.com>
> > Subject: Re: [PATCHv2] drm/xe: Check for dead config space on reading all 1s
> > 
> > On Tue, May 19, 2026 at 09:01:04AM +0530, Arun R Murthy wrote:
> > > After ioremap the BAR mapped address is read once as a sanity check
> > > and if found to be all 1s then return avoiding the driver
> > > initialization of a dead device.
> > >
> > > v2: Move the sanity check to mmio_probe_early() - Michal
> > >
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7941
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_mmio.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > b/drivers/gpu/drm/xe/xe_mmio.c index 78adb303b663..d206e3720eed
> > 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > @@ -90,6 +90,7 @@ int xe_mmio_probe_early(struct xe_device *xe)  {
> > >  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > +	u32 sanity = 0;
> > >
> > >  	/*
> > >  	 * Map the entire BAR.
> > > @@ -103,6 +104,21 @@ int xe_mmio_probe_early(struct xe_device *xe)
> > >  		return -EIO;
> > >  	}
> > >
> > > +	/*
> > > +	 * If the parent PCIe bridge failed to leave D3cold, or the device
> > > +	 * fell off the bus, MMIO reads return all-ones. Detect that here
> > > +	 * before any other subsystem (SR-IOV, GuC, pcode...) consumes a
> > > +	 * bogus 0xFFFFFFFF.
> > > +	 */
> > > +	sanity = readl(xe->mmio.regs);
> > > +	if (sanity == U32_MAX && !pci_device_is_present(pdev)) {
> > 
> > Was the && here intended or was that supposed to be an ||?  I think if the
> > device isn't "present" the read would _always_ be a failure and get terminated
> > with ~0?  For that matter, is this the right place to be checking this?  I guess
> > there can be surprise device removal at absolultely any time, but the most
> > common time this would come back as false would be if the device got removed
> > during a system suspend; the code you're adding here only runs on probe and
> > not on resume flows.  I think it would be pretty rare to see
> > pci_device_is_present() already return false here in the probe path if we just
> > got a successful return from pci_enable_device()?
> > 
> Sorry should have been ||
> The reason for having this check over here in early probe is to detect the dead config space and return early.
> This is the scenario that the user is observing in the issue https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7941

In that bug, it looks like we already detected and reported the failure
to leave D3 ("xe 0000:03:00.0: Unable to change power state from D3cold
to D0, device inaccessible") so it seems like rather than re-checking
again here we should just have been handling that error and bailing out
before we even get to this point?


Matt


> 
> > I don't think any platform has a register at offset 0, so if the device is up
> > properly, the bogus read should come back as 0 (and we can recognize device
> > errors via ~0 reads), but it still might be best to read a known-extant register
> > offset just to guarantee there's no undocumented behavior.  Maybe GMD_ID
> > would be a good candidate since it should be non-zero (and non ~0) on all POR
> > platforms, zero (and tested as such) on the non-POR Xe1 platforms, and is a
> > register that we need to read early in device init anyway (so we could stash the
> > value and save ourselves the read later).
> 
> Reading the PCI_VENDOR_ID should also help in finding dead config space
> 
> Thanks and Regards,
> Arun R Murthy
> --------------------
> > 
> > 
> > Matt
> > 
> > > +		drm_err(&xe->drm,
> > > +			"MMIO reads all 1s and device not present; aborting
> > probe\n");
> > > +		pci_iounmap(pdev, xe->mmio.regs);
> > > +		xe->mmio.regs = NULL;
> > > +		return -ENODEV;
> > > +	}
> > > +
> > >  	/* Setup first tile; other tiles (if present) will be setup later. */
> > >  	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
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
