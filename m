Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20454C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 14:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E259F10E1F6;
	Wed, 29 Nov 2023 14:08:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6950A10E1F6
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701266928; x=1732802928;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U6D3DNolUIL04BE942wlT4DgBKvCk0JRG82nYqUVjCc=;
 b=hiX4XX7twyl+NspE8u1x1knDLENrAmu4k2LfC7EooekwyJV3mFpHp8LW
 rYOQvBM2lWca/Z8leaUO7DvjV8tLSt7W1dy3Hi4eT/5pQTcMTonhPars8
 UT7xwFUq1ZipXhEVYCGRKF9sKZarJdyrqiwYE2QXDE1l7qfeMyPYJrfoR
 dGEUAgHsYb2Ft90ItNjqmqs5b+k3lfkliaQwPSLcI+KwI2C6TQ+UAsKj4
 K+WuUAkjMIQ6C8qbLakGx6piHU2JXkS3+B1KXui2JUur8+Ax5y4aePkOY
 lXc8jtRGQn0NYmuvI1m/Zhdx/lTBFvRy5U5Mqc4v5EtE6OvKpHGkm8JDM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="372532301"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="372532301"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 06:08:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="797924807"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="797924807"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 06:08:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 06:08:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 06:08:45 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 06:08:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1Sauvepb799CKS+ROHauCzgT0lD6ChaqnbL81Gvpow3V7Ar4SNOX3IcT3U3hftgK1QPTPqBxGO/iuF56O1MJT/s91bQCSTQCLOCzxc3OWwCUk/Gjob/1w1IxUawwbWJOqm2CDfF9s/i+bDqE97BERz+vz4UWxb9GsPbqaHPIodhrX1BRpRc3pva2vIF7sWJdmDu25nM7iy5yJ1/0deKW6totiKvGJPlbwJ5izK0WAOOt+At9QakxFj5Il3H19UtK6Bb10tY2BxQuuZXQ6qul8ML2sGvi0a28DSRibXik5SLf4nwh/Hns+5p850vdT4KEfcltoZQKQAEWw0Mxu9Xzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpcRPtPsypNtTmwxCSOrEMzP6tm/p+Yg6ibNjGYljTM=;
 b=Hz1kkD8MZSKKoNG7ahgS1PLrnTf7PHRqa/rnFas/ZukYa3DgsZA0SJlYSdwDoZONeDpyoNLfLTs1Z470s31O5x+piWkXluzrZf7MF4MU0rfZhsw8c7cXm64qXCcnD+eoHsfGmE40XybO6W/0GUeuTQ/1G1xYPk/4tBvquk/KBg7ZAWnPNx208/drpQkD1uhc1rJLE+I62HeqbQkIFH+S6NRMt7I9t0+93ZmrsCfcXttHehcoh3HPpBknYY662IfjmjKdbJtpWlDvT72GRe9kjl3kkh3Zz3g486x4M6G14aAJHCD8Lt4djNQs340SORLgd7x3KWeuHrDMdTqXnzi1lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 14:08:43 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::3514:49a8:468c:a3d4]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::3514:49a8:468c:a3d4%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 14:08:43 +0000
Date: Wed, 29 Nov 2023 15:08:36 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZWdF5KXfDAxEU8Oe@fdugast-desk.home>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-11-francois.dugast@intel.com>
 <e5871895301ff0053323d5f83eb46275bf4ac45e.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e5871895301ff0053323d5f83eb46275bf4ac45e.camel@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::17) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM4PR11MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: c652ad18-6e85-47f1-27ab-08dbf0e4b23f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZOjw7+RW12+XRRP0c32qBDdqKe04G0ZBGbd7C07U1015KrhR5Jj2puMQMr0mbS/rv1wQsgBxWsjqt2wnts9a2hjevkkEijMd5oXfGKQ+/HlRCa21g27JLUd+R9W1u2ERYDLN0CMcCmSh0V+tPcv7Mje7SCF2IjQlqYcTkRkW5nZ3N4Td0rVtxCAgSrUqwzIrXF5cNQ7w0GoteN7u+m6bWyq0JJhAKEZ+uQp1/wHA5lP6PELNXE+POQ6HmL5eqPEFgUy49oACicxJL9T4HXBVgD/qswZf+awdJC6pySgeAMCU0Y7qQn8yISAtWjWojKcM+KzVuHq+ypaePtVtq1ZQnf2TFHsug/Hhqm5dHAmY4q9JRxw5slP68/C8saY0WLyHmH3S7G/DwUdkRNCdW0S3qvPgJWBgqgxBZ+NUR8o45uqi/dUbeBARMfZOJePNa1UivQ+vAiscWtYrqoiGzqezo83xZhIEjR25Jh5fWgndqT7RZH6CCfn49w5Xe3/IEAi0UOKmlfI90DMOxmVWwjh34DiPqIReoBjdlI8tO6OJH4QBH83gOPPprYDm7QijTOit
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6506007)(26005)(107886003)(6862004)(9686003)(5660300002)(4326008)(82960400001)(8936002)(44832011)(478600001)(6486002)(86362001)(66946007)(316002)(66556008)(66476007)(6636002)(54906003)(8676002)(38100700002)(83380400001)(6512007)(6666004)(36916002)(2906002)(4001150100001)(36756003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZmHe06PkSvVPBWugArSiznR5YLH4GF9tlFsI/HIzbNJ01cKWnq67Lq88Kq5C?=
 =?us-ascii?Q?n5pvRoR7GVDslxAf8b66O2DiGckKAfVTpTlSkSveS70FDXGzG+WsXziuJ9WZ?=
 =?us-ascii?Q?UM9qGIST/1RSgSTg525Og9zJhTWantC1UP1aWywTMb5Ng08/8KqUukh81lAQ?=
 =?us-ascii?Q?Z/RAQJuhlnVuHqasHHr3Zn5AYIFmd8Ga60masnlBvGrfzAUAHlnmuNgwk1Mm?=
 =?us-ascii?Q?qCcXhwpdlRDo56UCb199veawn2hONCNyY1V3BQROK8niHF4BbsmgqXf3SnN6?=
 =?us-ascii?Q?3PB+zk2f4PszzJY2X1XvMQcDJSI67smmyl0A2OKa/+AaqHR4KbT3iZWT/099?=
 =?us-ascii?Q?FjfA4dEVFz7MA9BNxpy70vwSL/Df2x3AtzwLaK8mQujC+saj/JjU2XSizx8O?=
 =?us-ascii?Q?pAgrfx+ZCFHFt0xFpQBvenslTrfltM5nqnPmIlJ0l7QrAdUEVNob06qAC+4M?=
 =?us-ascii?Q?6lzy+kqZAJht0AJMU1JucoZewlLDkaGIvrRj/hW6hQAkw8Q3c+Qm6Vr3QG3n?=
 =?us-ascii?Q?OYq5Nebsoa8P5nXb50uDzqckKA8tqaYA5QuzGAIlFkuvw0yNzF6ndO/a/RJ9?=
 =?us-ascii?Q?n6oxnyh86a5vVawMDEsxNXIgBJbguiawJMlbctN1KrdeJgNyHWKYvduQAECl?=
 =?us-ascii?Q?rH5suimKz0G/E3vLXktzTuvm9Qc+Jst6Iv7nMw3934Tgbv+LC+Do8acpo6o5?=
 =?us-ascii?Q?PiJ9BqHsFZ64SYNJR9G3D+Ih4/hmgX90jgMrZW+ISrK5wmadQAjZbc7Txnz7?=
 =?us-ascii?Q?KGy6vDbOAL1BKouSb0tWhkrJfFqHzlk+yhbcyP0FS9hfLyrbFMNzH2niak7B?=
 =?us-ascii?Q?9qgRgzesqdf8JICtI67lYIO8egeQGBqFLAs3PqxDwD4QLoE6Eim+eV89e3+r?=
 =?us-ascii?Q?JDLKa9uM4YYFXBxKbK++MZITTrybtmja1IOxyrh7BcOHyaUMh1EvK4OeqfEp?=
 =?us-ascii?Q?83iv6b2zC6AcCKJHP7Zp+rK8dDV/at57uUg6+W9YWWnuP+CKHTNu5JmQbwYw?=
 =?us-ascii?Q?0NITqsEMAkNPDOgj0ToC+estDsiaql0LAHX+CcOrib0FPf/EcwGt5xQYGe/G?=
 =?us-ascii?Q?bBnEYQeL9hI1U6Zmkz8rg93Tzi4G2ESBS8WWupKTyyN36bCaHSjXzc6XTnZO?=
 =?us-ascii?Q?qYN8JBSG/I/AkxWN8pDopbG/jh6Qdadm1JBpCMKpUkUuRCPXTzoEqG2U8CBr?=
 =?us-ascii?Q?EGV45f8Mx0wytx5TPnphB1lXxphVcMROKyWINCtUnrqWoWrQ/UQsFzG9G2+5?=
 =?us-ascii?Q?yuoBBB5opHvuHRUs6NxUdrpa3bG/3967GgCK6U+FBKLcvCYxSIJ1/+x2yodl?=
 =?us-ascii?Q?OBQIoUdx87PXSm/ldf/adQKr934+8Mpza4ZMAwUGN9g8YPblVa6ROXPZBvwG?=
 =?us-ascii?Q?9A0WNCZZEO7mNJD2A9yMg7I+GaciMLQVccd+E22Dw/Yldy8jRSxM/Peb39M0?=
 =?us-ascii?Q?cw3U89NPm9BArzEjyCVq4Y24WIV0XXDxm/7CpBn+pjkvyTLyOkxRYGaO718J?=
 =?us-ascii?Q?/MR56iKxxvcnIzljNGtAM9U7g4z8Wli3qx/qIV8x8J7Qqg/ef0HKojT3hnn3?=
 =?us-ascii?Q?a0UhQQ7YRatBGXBI3922Tv0+sptCbWhtliXLsN79XdNwrKH/VMc/cpPSK4V+?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c652ad18-6e85-47f1-27ab-08dbf0e4b23f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 14:08:43.7872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqbVx5eoskbFZg2isU1cTNALqQNweuE1jkS5zNUack4rYOoQu6+1tPBuEu5DZBNfQs9In4DLiDJKYKbsQq4m/tDNruXYIZsPSac+LEXyzPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6527
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/14] drm/xe/uapi: Crystal Reference
 Clock updates
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 24, 2023 at 07:38:04PM +0100, Souza, Jose wrote:
> On Wed, 2023-11-22 at 14:38 +0000, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > First of all, let's remove the duplication.
> > But also, let's rename it to remove the word 'frequency'
> > out of it. In general, the first thing people think of frequency
> > is the frequency in which the GTs are operating to execute the
> > GPU instructions.
> > 
> > While this frequency here is a crystal reference clock frequency
> > which is the base of everything else, and in this case of this
> > uAPI it is used to calculate a better and precise timestamp.
> > 
> > v2: (Suggested by Jose) Remove the engine_cs and keep the GT info one
> > since it might be useful for other SRIOV cases where the engine_cs
> > will be zeroed. So, grabbing from the GT_LIST should be cleaner.
> > 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > Cc: Jose Souza <jose.souza@intel.com>
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_clock.c |  4 ++--
> >  drivers/gpu/drm/xe/xe_gt_types.h |  4 ++--
> >  drivers/gpu/drm/xe/xe_query.c    |  8 +-------
> >  include/uapi/drm/xe_drm.h        | 11 ++++-------
> >  4 files changed, 9 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> > index 25a18eaad9c4..937054e31d72 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> > @@ -75,11 +75,11 @@ int xe_gt_clock_init(struct xe_gt *gt)
> >  		freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
> >  	}
> >  
> > -	gt->info.clock_freq = freq;
> > +	gt->info.reference_clock = freq;
> >  	return 0;
> >  }
> >  
> >  u64 xe_gt_clock_cycles_to_ns(const struct xe_gt *gt, u64 count)
> >  {
> > -	return DIV_ROUND_CLOSEST_ULL(count * NSEC_PER_SEC, gt->info.clock_freq);
> > +	return DIV_ROUND_CLOSEST_ULL(count * NSEC_PER_SEC, gt->info.reference_clock);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index d3f2793684e2..56b0f22ee78d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -107,8 +107,8 @@ struct xe_gt {
> >  		enum xe_gt_type type;
> >  		/** @id: Unique ID of this GT within the PCI Device */
> >  		u8 id;
> > -		/** @clock_freq: clock frequency */
> > -		u32 clock_freq;
> > +		/** @reference_clock: clock frequency */
> > +		u32 reference_clock;
> >  		/** @engine_mask: mask of engines present on GT */
> >  		u64 engine_mask;
> >  		/**
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 8bf0fe6b09e0..77cab66d337f 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -147,8 +147,6 @@ query_engine_cycles(struct xe_device *xe,
> >  	if (!hwe)
> >  		return -EINVAL;
> >  
> > -	resp.engine_frequency = gt->info.clock_freq;
> > -
> >  	xe_device_mem_access_get(xe);
> >  	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >  
> > @@ -164,10 +162,6 @@ query_engine_cycles(struct xe_device *xe,
> >  	xe_device_mem_access_put(xe);
> >  	resp.width = 36;
> >  
> > -	/* Only write to the output fields of user query */
> 
> the comment is relevant to to other put_user() calls.

Indeed, it will be back in the next revision.

Francois

> 
> > -	if (put_user(resp.engine_frequency, &query_ptr->engine_frequency))
> > -		return -EFAULT;
> > -
> >  	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
> >  		return -EFAULT;
> >  
> > @@ -383,7 +377,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> >  		else
> >  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
> >  		gt_list->gt_list[id].gt_id = gt->info.id;
> > -		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
> > +		gt_list->gt_list[id].reference_clock = gt->info.reference_clock;
> >  		if (!IS_DGFX(xe))
> >  			gt_list->gt_list[id].near_mem_regions = 0x1;
> >  		else
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 85b0affc9f89..a94c751450d5 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -280,8 +280,8 @@ struct drm_xe_mem_region {
> >   * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
> >   * .data points to this allocated structure.
> >   *
> > - * The query returns the engine cycles and the frequency that can
> > - * be used to calculate the engine timestamp. In addition the
> > + * The query returns the engine cycles, which along with GT's @reference_clock,
> > + * can be used to calculate the engine timestamp. In addition the
> >   * query returns a set of cpu timestamps that indicate when the command
> >   * streamer cycle count was captured.
> >   */
> > @@ -309,9 +309,6 @@ struct drm_xe_query_engine_cycles {
> >  	 */
> >  	__u64 engine_cycles;
> >  
> > -	/** @engine_frequency: Frequency of the engine cycles in Hz. */
> > -	__u64 engine_frequency;
> > -
> >  	/**
> >  	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
> >  	 * reading the engine_cycles register using the reference clockid set by the
> > @@ -382,8 +379,8 @@ struct drm_xe_gt {
> >  	__u16 type;
> >  	/** @gt_id: Unique ID of this GT within the PCI Device */
> >  	__u16 gt_id;
> > -	/** @clock_freq: A clock frequency for timestamp */
> > -	__u32 clock_freq;
> > +	/** @reference_clock: A clock frequency for timestamp */
> > +	__u32 reference_clock;
> >  	/**
> >  	 * @near_mem_regions: Bit mask of instances from
> >  	 * drm_xe_query_mem_regions that are nearest to the current engines
> 
