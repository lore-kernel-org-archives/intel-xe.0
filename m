Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A935AC4167D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 13:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381AB10E08E;
	Thu, 14 Dec 2023 13:41:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EDF10E08E
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 13:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702561271; x=1734097271;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sW5VjET+wqyP8xGo+wl3tzV5Teziuu02sFJb4PVFGgw=;
 b=O9o7yCKkvVv95F+H6w0aGZSqlo23/e/OJYBezrvYx3gUa89D33lT49dC
 lDE8vRjHGXvkw+NU4WwhA2rtYCdZR6x4SquxUqJ1oVNHcND8id/E5NJ9k
 hLRAfJB2N+CIn8f3CES5ikCEGgerie+h/Vff9pW7Sna8bgXbb8SQPf7R+
 IOo6yn7AlXj22CjLC2WRgNu3pAMdhY8cP0+Z4rk9sHkN6SsscSB+QfQoV
 OuE2OTWnDOihJd7XI6JvNCr5XoUVfoFSj1ZnYralYGvKd/9OgU5tll0uQ
 KwieS8N40cS6Rb+AYJW56edVsth/W1Sk+5LcXuxn+B0+Lrc652A2+YYLB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="481314287"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="481314287"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 05:40:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="777900321"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="777900321"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 05:40:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 05:40:58 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 05:40:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 05:40:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 05:40:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxeT/xMxmFuZ5Qa2/wnzFNNDXImFWeMDzTPzloshFZcm2TqzJhdvY+KM+aVppuFkqlWrXww15CVm81/OtoMIwC2D3UtLlLaQ5a6eO6ezAZgqA+pB0zq0zeVW/MTIEwFwFqnRp4F5Q46BHs04OeMXkV2jr+jN2ZOzdoHgRywPIaojgHjgLmgGwlRMgVi7IKkR0ocd4+lz+YpnhEvpsn9BHm63dcxtk/yfYDP3el8Ak//CYa7S/tiFFbJlsZRva2lkdPnjb9Z63rkrNkFNHZOn0MMQMnsuhcu8qAI/sA+kAkKys8TU9qDMas5XYd/p2UnVdMZrFJ2r73ZpTx5I9aXjgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVhYuvzENfctNQswFVXt0hh0btUAGxnr6Ca0IrE9jAw=;
 b=NmvilxsTPvyGWp8UwEAatorVv2jF5hId2NxeZh3pL8MW7iVurK4ShrfatNf4bIUKQ+V0eo+Hoy8o2MddittFWpLnG3lXJZV8lT8a0qFVtVINEkms4md9yCLIz1n90QqZ5e40kci6N6XBPZJszwO+wP1aD1lFBu/vSq49A7LhZqzPZRDSlvUZWwUFoqyM1IY3aS41sLdDwEGYekB7Kh9wOiAOiqLicQw1+M+pKnIYnGrwuIrTRv0+/Bhqvy5CMmGJaxohxsOZF7GAemnZ3didIoCR4xdI5JAK2p820x9JgcoiepqBJ5eqXWSlsbDqWUEnDdsyivy4gQUuM8oxop2hhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 13:40:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 13:40:55 +0000
Date: Thu, 14 Dec 2023 08:40:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: Re: [v4] drm/xe: Add vram frequency sysfs attributes
Message-ID: <ZXsF5POCTNwVoO7K@intel.com>
References: <20231214111159.149984-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231214111159.149984-1-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: SJ0P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: afc9d5fe-ce9b-4b35-026e-08dbfcaa4c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZ+CMyY1dXoz0dtHkSWClaR0627YKg6tMdq77D2dbFv8IqyZvcNYAolXId9npoLzNG9VTGtXmkIdh2UB+LQz+pzRWwVLkWJUaIZ0zmyTzRdrgovv1Mt/aRo5utTIJLck+fCb6ljPjVvwj8VTWTLAuoFT7Dwp3nAdidutzb81MICzQZXTjuQXEyEodQgOPOZcB8YHWXkhhbY47e9A/TpcMspGIradwvhxOxGpcStjCTLvbwbudeZE0YFOb/rwCW4IhyOLWLqQQ5h6SeDIEij4mh0GMn9AdDDYDED9JFwZ4Wa1EI9a8ztxUAmgQb1RvXK7XYAeJd3zcap6zYYM9jqpfH+Llhp7K/mgzpkkFZVg3xGuDRGp16HsZvirT3epKS1I4SIpBxzuZ5m0yVbUTRYN0Ih8BMBPYosFDuJpXfHk/D+F+rBQmi+EsuIEkwFfY32g1BxFPA51J/5cMvvdOOAkRuf1PLtmnIibQbWcAFFl93DVC5/OjnN4EUC9ymmfz2OCi1mt7GLhYnbvJz6p9kWSU1lUn5yszLMtrS4miHiYSmArHrDI5Eo6yZRTnw6aVXve/7mVfUz924vw5mfcv1p2uh+gzI4u9DQ2c1dveh4yhnU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(39860400002)(136003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(26005)(2616005)(6506007)(6666004)(6512007)(83380400001)(44832011)(2906002)(5660300002)(41300700001)(6862004)(4326008)(6486002)(37006003)(66556008)(8676002)(8936002)(478600001)(66946007)(316002)(6636002)(66476007)(82960400001)(86362001)(36756003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SksEBCGnsnj74qEt1cJg1AT1s1zc4SN6416NuQgWtX6Fl3NK9ilFpNp92TTU?=
 =?us-ascii?Q?/Y/hiw2yntx3KYB8ZEDQz2Nq6rcCVGZ1R6MVq/0Q64kGldJvP8Z+MXnfYc70?=
 =?us-ascii?Q?ts2PMPBBUFcaTct1/rkJP0ROvT7oI4PILmjvSMVYXsmJ9HmPqBnCVvu8tYzg?=
 =?us-ascii?Q?gjaU8y3mK83uIpFVbnfbcNmoWthAUzOdSKpQ7I3uzBj/q90NpPZf/U8EYyGB?=
 =?us-ascii?Q?ltYZrpe4PxkTvsbYXKt3OQe2SeALiJHgj+ghyXM9ECsuHXo6KeCosG5tUqk5?=
 =?us-ascii?Q?2LZpkcyCNr2n/SMhsnfXytneMzpeShfGE1B74Q048oWmR0IUOF5bjRreA5vU?=
 =?us-ascii?Q?dirH0xRVIuCK0QRnTtoqMbufHUcZP1JEJg64UXnNapKRibdrjdIdtcVx1RT2?=
 =?us-ascii?Q?TVUr39KycTN1HQSMgfGhwpkPwnm4eO8pZr7cJABMXGIw12ZBMgguern/DPV2?=
 =?us-ascii?Q?Eyj42t0I6ukCpsc0CbH5WxQZ+TG7VS252jkH3XE1Wp73No6xRGKJDr5zrgL6?=
 =?us-ascii?Q?l8rTf1HR+llBLbBlmkB0Q4PZwy7vgkbDY6stfsk3QIhwE/eJIUSqeVPzdP9e?=
 =?us-ascii?Q?PdBqWVqpPTreU8caR9NcsLktLXSjn5UhJTtOHl47ZDI8eMRouoYLXJyN/qGl?=
 =?us-ascii?Q?ItofaXN2geKpot32FUoC4C/3m9GcD5iP5MPjU2WmY4dmNlftjSeU/+AHKcGo?=
 =?us-ascii?Q?8PAa88ppzjKS2wSC+eAHZ9jLjmy+TyRO2iLMVbCd6os/YLns9Gv+jxm9fO4B?=
 =?us-ascii?Q?E3NqjZfPSxomnNMewryjNdWhTrr14RIch8Etkr4VRstuK7fyEocTxUa16m59?=
 =?us-ascii?Q?vqUtjM2IAkX6GdXXX8esyBfhJQini8Gq7DB8SuOel4rZ+9ZaXDxs0gZ0uuSP?=
 =?us-ascii?Q?0R26bda5WVc5xHt1htXGff/+9iTqddSkmnXzVMQ+Ls8Kk92OKeke/V2d3UHR?=
 =?us-ascii?Q?P7qp6pROrrAIv9gSIyt7xeLiwVLJ2LzwwH4ZanTpwt9rWQhtpMFETsxDsq/o?=
 =?us-ascii?Q?tHyFEbT4qTO0HaUddTllGZWvioe1ZIfdDvACD0s1lmeT+6gPwGmePxEtewme?=
 =?us-ascii?Q?nerMRHh42TJV9fIhknxjwrXmH8DgUbloqqj9rA9tPw0CWifCL2oMFi3Ty4Ql?=
 =?us-ascii?Q?zvnjbhG1pPsaGUaYFeS7g2irw/CvIjj4ir8lnf9u8Ettxoj2kehmfrU6sLkE?=
 =?us-ascii?Q?6kUlse6m+VXCxydZk0APrc3OgUmLz7FNvAEGE6CKcvjNm5CY0cKRt4p66MpO?=
 =?us-ascii?Q?VweYNabrVKI1bbDPTbuIGANHagjdOmS0ceFa7SHV8eQfMRbIwFJ6nS+0vuZh?=
 =?us-ascii?Q?Y9zK6uwa+6ASx7dyjczpims756LTSpzGSJguyd4oDfLylkLSBEfvFiUUbTRu?=
 =?us-ascii?Q?olevPo+BOTzkgf8JAHvixI/wM7uAW1oxwWe0DmolT2yD6gPmMbr1qcJtzZuK?=
 =?us-ascii?Q?QBD1udwZSQ5JN/Teo/VPc92RlcWjMncV+rVWk98fpcRAqW6A7kPVy5GegZWi?=
 =?us-ascii?Q?RPFlCXDxGYQMKsqxFqywQHrMyyvFeFIG0s4riQ/4jEZCM4JYr+x7AknZWVMi?=
 =?us-ascii?Q?bwWwvj6Pw6PUU0/b2MgejMTTSpoXpb2STMrKX0+STfHpZCog2rzByk+VXCT4?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afc9d5fe-ce9b-4b35-026e-08dbfcaa4c20
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 13:40:55.7660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sk34DAIt0eMLO4m4COMQOUBMQL0hQbFBYxWPjFuY1wI1fFqWdxCW9OAFj+q+lgB5N9uoGXliGY5SNZWOpZJanQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 04:41:59PM +0530, Sujaritha Sundaresan wrote:
> Add vram frequency sysfs attributes under the below hierarchy;
> 
> /device/tile#/freq0
> 		|-rp0_freq
> 		|-rpn_freq

hmm...
you have a good point of not leaving an empty memory dir on platforms
where we don't have the freq interfaces.
But then we should only create the mem dir when we are going to create
the freq.

In the way this patch is proposing it looks like the frequency is about
the tile. like a tile basedie frequency or something like that.

So, we do need the memory or vram dir to make it really clear that
the freq is about the memory.

> 
> v2: Drop "vram" from attribute names (Rodrigo)
> 
> v3: Add documentation for new sysfs (Riana)
>     Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
> 
> v4: Create sysfs under tile#/freq0 after removal of
>     physical_memsize attrbute
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 80 ++++++++++++++++++++++++++++++
>  2 files changed, 88 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 5935cfe30204..26ceb8c0c010 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -42,6 +42,14 @@
>  #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
>  #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>  
> + #define   PCODE_FREQUENCY_CONFIG		0x6e
> +/* PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> +/* PCODE_FREQUENCY_CONFIG param2 */
> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
> +
>  struct pcode_err_decode {
>  	int errno;
>  	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 0f8d3e7fce46..45518442ed15 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -7,9 +7,23 @@
>  #include <linux/sysfs.h>
>  #include <drm/drm_managed.h>
>  
> +#include "xe_gt_types.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>  #include "xe_tile.h"
>  #include "xe_tile_sysfs.h"
>  
> +#define GT_FREQUENCY_MULTIPLIER	50

hmmm... it is kind of strange to define a frequency multiplier in
the tile_sysfs component.

This is probably an indication that we need a specific component for
this memory freq?

perhaps xe_vram_freq?

> +
> +/**
> + * DOC: Xe Tile sysfs
> + *
> + * Provides sysfs entries for memory related frequency in tile
> + *
> + * device/tile#/freq0/rp0_freq - The Render Performance 0 level, which is the maximum one.
> + * device/tile#/freq0/rpn_freq - The Render Performance N level, which is the minimal one.
> + */
> +
>  static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>  {
>  	kfree(kobj);
> @@ -20,10 +34,68 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
>  	.sysfs_ops = &kobj_sysfs_ops,
>  };
>  
> +static ssize_t rp0_freq_show(struct device *kdev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(rp0_freq);
> +
> +static ssize_t rpn_freq_show(struct device *kdev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(rpn_freq);
> +
> +static struct attribute *freq_attrs[] = {
> +	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpn_freq.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group freq_group_attrs = {
> +	.name = "freq0",
> +	.attrs = freq_attrs,
> +};
> +
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_tile *tile = arg;
>  
> +	sysfs_remove_group(tile->sysfs, &freq_group_attrs);

if you didn't create the group you shouldn't remove it, so same
conditions for create should apply here.

>  	kobject_put(tile->sysfs);
>  }
>  
> @@ -50,6 +122,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>  
>  	tile->sysfs = &kt->base;
>  
> +	if (xe->info.platform == XE_PVC) {
> +		err = sysfs_create_group(tile->sysfs, &freq_group_attrs);
> +		if (err) {
> +			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
> +			return;
> +		}
> +	}
> +
>  	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>  	if (err)
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> -- 
> 2.25.1
> 
