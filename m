Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA32C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 23:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AC210E109;
	Wed,  6 Dec 2023 23:10:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E25910E109
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 23:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701904205; x=1733440205;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jo6dn1YTuYgveTu1fxxY1ve4Uebln3u6eNjXv/s8DX4=;
 b=H4fCXJMv1UYNDpqrFMlO3ll35ZGaIDwr1FPtdoVnoNHZ/TOtWoIac3G0
 wjMPnB9FWjwTSUEhIfbq3WDWaAUJ0E8VNzs3TazbB0yoULPNeHkjkf6Xa
 mnaK0i4+QVMgQrlX8kBErcEc0QvKALazck2XLxb3taDYrfWcu4n3E4eOz
 OZOrcsV+zeebywyrK0Nfc3ixbQozuARmk+9ossGbHOnVBK7TKF14/2BEH
 Lb4n0s3NClzSu6D/w4lWQ4NbXEMZPWbznbPvYS3kaZN4S6p9Z5t+9thAg
 IksiU87hrMO3KIoyvU03pJLFcso9rgYYVT0n4/Wct+qUP1qFjoeF6RC6e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1218458"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1218458"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 15:10:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12885290"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 15:10:04 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 15:10:03 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 15:10:03 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 15:10:03 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 15:10:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVyBpUfo2ErLDqesBZMZwPmi/wKvACzHuYBPZkA4MZDrGyQEnBfuXEGWtTDmAA6pOmucbQPdP4RXZxoITIsngtqAr/peTDeb8o8p6RLuQIckZSNUIzq+x6qTHSxIQLVmzYss6IwCdgcPxb98cAzNimyWrobCnxgESmJx6vCjOz4U2iLfzo1IBP5I0TSvlJAunS0h9245zqIek9UTwp1U64U5M/TZ9qfSIaSbW881wy4MEzlIYoowUy2rpBMPaAXxs3rKwcdoAf9EU2UkMSgsixcMp90u48fW26Kgt+44kNSzQila6wwnPOIk/Dy8+Dl314rI++5JriTSPCzezR7XZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyTVvI0Z58fw+906Rrgq0R8vAD6AP1f05+MLkmXnCz4=;
 b=Q9hNoGFs/32D4DN8SzReUTWZ1IBFA4bALdZdDq7NGQ3wcepq34hsq5KHxDZkIHCZHpMFvmnnpictgSwC1vOpl4NjoGjeCaboXzQEW7dvl2f8jpHkap9qjJ6ZyqYYwxll39YwnCcpgNqp8rrhoaLdQg1ZsZKXE+GJAa1iA/JGMjtnRrq91+Hg17jDa16uv3vxPmXHGl28JPPZg4SMjMFZ745UrsXHWB3Mn0DxOU4fBmKJea0ri7KBt2zbG+FXRirMI4YgoNXaao/P6RGXU3dIGUzRraB+nV+bP74sTKq7pPcR7jh59T7B8oL4asHiKL61Yca2OQ471atj6Fb1DVwu2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4893.namprd11.prod.outlook.com (2603:10b6:a03:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 23:09:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 23:09:55 +0000
Date: Wed, 6 Dec 2023 15:09:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231206230953.GX5757@mdroper-desk1.amr.corp.intel.com>
References: <20231206205034.1105637-4-matthew.d.roper@intel.com>
 <20231206205034.1105637-5-matthew.d.roper@intel.com>
 <klfcmsla75h3sxdhd6vjxsrnaej2qycu3bjizntytjyxflae7t@d7dsiab2o3e5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <klfcmsla75h3sxdhd6vjxsrnaej2qycu3bjizntytjyxflae7t@d7dsiab2o3e5>
X-ClientProxiedBy: BY5PR20CA0007.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4893:EE_
X-MS-Office365-Filtering-Correlation-Id: 369ce957-3691-4f51-5181-08dbf6b075ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +K9FrM08HdL91DmvpI4xvp3fUSqnqd9sosG3vGEzmzfk1Nldn0gLJECsFxVhDKtT6BEouceT4h82ULYbAQ0/6y37FBfiZ2RUyw8oCVmw53VpeGJRjNwVyWHK3JpWNZObb65kyY8ToBCsguBURVkMWAW5JLwBgOC05qYRH16wDpPSZPfu8+g7zW7dzNu8j0wQkpKJQFJ1SoxzToAAOsE4IDQoQIn1fd0MgTe7LBfDhGseu5euHhJja6vsqKsU9GwTGzAkIVpKGMIXth0KnsBWGl3arfj0KS7x+tSzm/Ep62J1VLznSKjRNe4cyDLalo0F+9CsE2OLIYsNwHOA3ImixIwlmJon8xWrZiceBRtOu/Dr8IXKpk3wEQdOFqRDbquVEMDM68gd/AX2658dGPQy57a4dpLvr0OeR0w0ZD8hbmMGI/Ed8ckUqOPAZBu8ZZkcEIfrCC2cXlI26oivuwkCBXo7Q0B8EpOTUaJo2o5U0pXXxbI54noZ0x5eRtw73JqhqrU4jr75pdCcIraknqFPMW0ycSPFKPHgH6Hq1XViWT/RsNzoKOvjrY/2NhftRXoE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(83380400001)(2906002)(5660300002)(86362001)(6506007)(26005)(1076003)(33656002)(6512007)(6862004)(4326008)(8936002)(8676002)(66556008)(38100700002)(66476007)(478600001)(316002)(66946007)(6486002)(6636002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?66VDG8d4hFk2mY1NUu5y/M83ka7nI+fBycNXxn6cgVFPR/3NVMSVmKDhyCY2?=
 =?us-ascii?Q?pzljfhKxtanRmrjEz9SJ9BT502G4bn8asz7eruP+EGEOY5/wL9WknYWTqSV7?=
 =?us-ascii?Q?lN/IWNJGiwuG+R8qxQr5O45tXPvBnWOtEpSyUxSqBRqzUHbtRZmSm7rxPGE0?=
 =?us-ascii?Q?qsu1560ReyepMW425fap3QHSC6mVB/Qqd7dmr17TpuezXRfCkYTx/QS4xxaj?=
 =?us-ascii?Q?aBraO8qW7puK59wbjxB1VoUtf88sMDa/1RF5V59yujU6B5zJbXlddaRt+Ttw?=
 =?us-ascii?Q?R4Qi3CfYUvkobTVd6M4Q0Pe081igqs0+vdKUz1xnVsJ2P1WS4p32usLK6EQO?=
 =?us-ascii?Q?wmr936hrPIg7B5WZbGNclE/8RMpgYJjWVqmzDDqrgiZshT0KQSpbVwhSwQsz?=
 =?us-ascii?Q?EoZL8uYNVvq13VUW5m+4hgTKfHQH2hXAuU8O9/qguKAQyxvIIwNiwHHO8dnv?=
 =?us-ascii?Q?zvSbv7PofmdmslE0b0sngtcxVeT6OirGTO0xrmW/fByj88OwdJ9UFBIkVAIG?=
 =?us-ascii?Q?me9BG2VnJ2QffPz09FYymOtIC30JO/uFBuEUm8REOU7hmq9lEcEGxB4ZfRJL?=
 =?us-ascii?Q?dvI419MLBM+owXM1SzCQ090k69CA5+5u0XptqeDDSSEkrx2vA1Dlsfvby6RN?=
 =?us-ascii?Q?aI2zUB430aoXF8H4ZJj+0IQImTnToz4nXPOfHbydBmk9bzPf1aMshGDpSnWf?=
 =?us-ascii?Q?zHSslPyqzRgpFF0CPUCglg/T9AsDbaaDMlfEDVxXzD1W+9RcbpCGOpiWRX9Z?=
 =?us-ascii?Q?+n3Q9/YerMM0msvtrJG8DdppI85wJYO90ISAWLIUArmOFzdWmgMgvZ2CzPqV?=
 =?us-ascii?Q?Z1kqGCRawK5Nta2YTtEnfQE4HABdn/OS3KL1XLNJEzlyZz4F1o4mjS9d9mjK?=
 =?us-ascii?Q?l3w9VyTFKowTN3+oDwY2RfkdMV/jCAxCTIKc4rw/gHJetDEEwMtDYePDxzBz?=
 =?us-ascii?Q?IaYFzuiQhhq3km+y0nU+k3KzKfc7Hje5zqdv1pR0q4jTV4+K1ALILDYW4YEt?=
 =?us-ascii?Q?5Go4jj2IzqWvODjZYGkKFfqX5B3BeYb7aVYqNSocOCqrlSR5cTVx2s9vskcO?=
 =?us-ascii?Q?PGIK1q1BBZrhP8eloomXN5pGC/UuRK2yx/Dwj81KvJ6ut2jpBTHxd1fkBf/J?=
 =?us-ascii?Q?n9UkbJXGg6MYIku8jmWOlMtQyK5J9Cq5iFdDJURYX6KbBrDhGHQILIXoksH5?=
 =?us-ascii?Q?Ei34IYFtt91DT/mza+54N/+2n/xm8MwVXmxEphYWSCD0pO8KC/96E85Bcth7?=
 =?us-ascii?Q?/jQLhJCKYtyzmx0Smg9t0WMdG4mQHtoLt55MkF8PuVwSkNgCcRyjbN85MAXj?=
 =?us-ascii?Q?f6U9M3hNhl79iJsKfoX8tsbCGA6HfnqexQduTISPbBgqxjHxP5otpUOTWiFs?=
 =?us-ascii?Q?dmdJdBdB17UPIpQY12oG49AVoQ0SzeoNNFkkmHAe7eCHk32lfuA9tuojMp1k?=
 =?us-ascii?Q?A8K8HgbvGD/hJQaHes2k0InkLuYnt7sdZWki1eg6z4AjO4xfh9kUg9YvMZ2h?=
 =?us-ascii?Q?piqiJ9dHnUJQHj7mObCjTaGXuqgnUCTZ5ed4/eykK1UehnRB5Q+8al3XwYW5?=
 =?us-ascii?Q?isDoTxFBUIqdfTx1/MbGb7lqB4NivgPVsjUHpNVFh0EXT64DD6tfT/88AoAT?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 369ce957-3691-4f51-5181-08dbf6b075ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 23:09:55.7381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HgJd3R6+Ty2H6fSxLMifgpxTIrmRZvpNU1kl5/vjiENOPYdrpqmJy+0ljxlYDNK8oW0Qy0Jp6ZxV2Hq2hLNOk+o9+RNXwXOjmXcjgUyYkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4893
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Stash GMD_ID value in xe_gt
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

On Wed, Dec 06, 2023 at 04:55:10PM -0600, Lucas De Marchi wrote:
> On Wed, Dec 06, 2023 at 12:50:36PM -0800, Matt Roper wrote:
> > Although we've stored the major and minor versions for graphics/media in
> > xe_device, it will be simpler to implement the uapi version query if we
> > also stash the raw register value in the GT itself.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_gt.c       | 6 ++++++
> > drivers/gpu/drm/xe/xe_gt_types.h | 2 ++
> > 2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 154d6c7072b9..c6f7885ffdc0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -381,6 +381,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> > 	/* Initialize CCS mode sysfs after early initialization of HW engines */
> > 	xe_gt_ccs_mode_sysfs_init(gt);
> > 
> > +	/*
> > +	 * Stash hardware-reported version.  Since this register does not exist
> > +	 * on pre-MTL platforms, reading it there will (correctly) return 0.
> > +	 */
> > +	gt->info.gmdid = xe_mmio_read32(gt, GMD_ID);
> 
> I was coincidentally reading the PICA_DEVICE_ID for a debug (that we
> currently don't read) and stumbled upon this.
> 
> I'm wondering what's the correct place to read and save the GMDIDs. We
> already read it on xe_pci.c:handle_gmdid(). Why don't we simply stash it
> there? With the current design, it doesn't seem we allow 2 GTs with
> different graphics / media version since it still on the xe side
> initialization.
> 
> So, why don't we just stash it on xe rather than GT?

I mainly did it this way because it makes the actual uapi change a bit
simpler to actually keep this in the GT itself.  Plus it's a bit more
future-proof in case we ever do start allowing multiple GTs of the same
type with different versions, or if we ever add new types of GTs beyond
just primary/media.


Matt

> 
> Lucas De Marchi
> 
> > +
> > 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > 	XE_WARN_ON(err);
> > 	xe_device_mem_access_put(gt_to_xe(gt));
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 4e48c4643163..4e7a4494a554 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -117,6 +117,8 @@ struct xe_gt {
> > 		 * hwconfig blob.
> > 		 */
> > 		u64 __engine_mask;
> > +		/** @gmdid: raw GMD_ID value from hardware */
> > +		u32 gmdid;
> > 	} info;
> > 
> > 	/**
> > -- 
> > 2.43.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
