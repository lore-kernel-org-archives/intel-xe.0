Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C6EC4332F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 00:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C152710E235;
	Wed, 15 Nov 2023 00:54:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0643F10E235
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 00:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700009640; x=1731545640;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fFkV8hUZ0jdRvEFDhvGrhH85RuwkTJ2KuQnon2ECQ4s=;
 b=bylOQzjjSYOaoLhe/6WzS/fYuhZoZqZMXxpVSo8tRWVVZJttNXQless7
 moE/ZwSeVnDvtOCspeiY/PAnqwnEcdfu06kR5NcbvmnTrnBL8uO8uEWNF
 Qe7+0iP48bcbJVRaXx+lz5Hu6JnYAKBNZDxTxjs+EjIyMTkLk2clIlWUY
 xS2TQLptjEcZne27FHj/3SvDuX07qZcN+0oOhMxMYl3EsquKKe/kN/0tO
 UmxlR+xT3lgvUT17QZzCjY3IkONyMpoDFQV5WR9ex3VLRK3WL6tNYyf1a
 /WRS6Zh/GlHvgeal0ckscYGfM4ifgIX/fgEfWMcxHVtCbCTcofoo46Pae Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="393638681"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="393638681"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 16:53:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="888414725"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="888414725"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 16:53:58 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 16:53:58 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 16:53:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 16:53:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 16:53:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkpgd03pce41LijrWqFdTGjD9mepHzjcI6zslBTQEvqFSGU5oGo3d1/A8UPI5sRos8BzTJwwqRzpN5gvPx8Jsk26EmdMgWiGQyOye4XWU/gybA0Y3qVHbXKM1WSBs0j74/ngPKU7VbYUSWNUFaqZRLyaNLGseLL5Hx3B+qWjcNC7PixJCF4fMtdw9zIcxgiYBhdVL+MBQ3lDciHPGpZapKIWTJzgm3JM+nrsxuRYkQBwzfUw5hQf1Al22Suryb3yfqtAtzV+6wSIq79hDeQRlixco98/ABUy+K7lOXBrfnMEz5SzbDfXfWEOsxCMEQFw862OxzGERxs/FgbRiDC8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+5Dp4kf6jCGgDCoeYjiVMYif9CGggjnGoNRxjpc/EI=;
 b=EHRazMgXqowVY9VQHgxHx58l7bYE+HZ6Ntetg7csuTf8TxUeuWl3J5JZeKoatShDFxfMm64d6grTPN9k/s9afzXZMrHqeNVJ2Dez9zzz7uyCnPJBFXLCLVuldbndzJ11BYoAGH6Bze48ok1BarJHAKkIQNus24NSLIkmt4LHR7dpt7MP8ntFVYs5ECE2tYWn7PIIJRUPnwCZSDZvjYZASPOEVsTEIlsbG+kHHVd3z+5gtLhUW8/uyI0kn325R5n3faLS63d2LZ/wkmbGqrOvAGAmrUljMktH0drDUkEI86hgiErQHN2aP+C9f6IIX5qH2TcLBJnm08ohoCOGTVJDhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB8268.namprd11.prod.outlook.com (2603:10b6:303:1ef::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Wed, 15 Nov 2023 00:53:53 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9%5]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 00:53:53 +0000
Date: Tue, 14 Nov 2023 16:53:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20231115005351.GE1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114004604.4439-1-niranjana.vishwanathapura@intel.com>
 <20231114004604.4439-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114004604.4439-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR01CA0010.prod.exchangelabs.com (2603:10b6:a02:80::23)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 19762480-267d-4ed7-dda5-08dbe57556c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xCJ5SqyBWL4Le1b45NeiIWb/dOZeR08ogXM9+eNMEjslggDLz1FE5AfMtdzq4NmiBX6NbqDs/OgIktFc71jMe3K2SSfopDKhAc/eJMlyFFg9klw+wlrD+j0j4eZqOiX4iUWpUqkj7mah5WkvF1wynqMDKYyJSdlor93YyyLmPdJD6y9GwVwWJSTgGnfPnDLLqr8JdNK74eWj49Ri36FfRf0hJ7cisaRzJz0CwB/9WmEUWdGkYoJfbX1MmYG708O1l1VC5t20kUbG/qzVq+IDCrzpt+ze5Sx7X6jymiz0tWSOLqcUXCyZCMlUgOsC7bH9gWejGlswKX7KwJc5J8sSbdCQY+o+twTnvkzoFx0b8ARDopfdjYbIAzBXfEmKDzpopKQUN6Y6Lm7FzzYowj2naRsSOiSwbrm5xkL0dkOiO+729Gbi0X19Q3R017JDhtcFAyE02+Fo1XGpTD+qUI9eScGqNP9gSoOIXWP+KGIw6/5nb2K/T3OulE/RgkAv1sIbaiXRcBTgv3HSyTeiW0qMXhIHJ+S0P0Mbxktks2H36GofEtouwHg7kZylHlKlEWpW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66556008)(66476007)(6636002)(6512007)(316002)(83380400001)(38100700002)(66946007)(82960400001)(6862004)(8676002)(8936002)(4326008)(6486002)(478600001)(6506007)(5660300002)(86362001)(30864003)(1076003)(2906002)(26005)(33656002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kKOIjjQFnQJKZ2oWEiqzuqzPyS4xOHeopeyKLdZUWX+LdZERwm3984YEad?=
 =?iso-8859-1?Q?kHD6Oso8Ug/KdP9Bks1Kafur8+xamW9Udopsx6aMUUcuz43F+ImUt5OLed?=
 =?iso-8859-1?Q?gJjKOaBloqnrcBHSFcycog5Ga1ZoZ67yALxmrcLg66onQvzSqJnjdAa71h?=
 =?iso-8859-1?Q?09/aexJiLqK/OHa/+R3vQNdyF7Zqm2JglEowOfyKpfieSavnQVo9GzJG/U?=
 =?iso-8859-1?Q?e1wG3t6lE2h6p3rd9uRTkRZM+bsRj9wDITbXya9My6TS4rD9O6+qYapCOQ?=
 =?iso-8859-1?Q?lnUe/Ch0a4OON5onJvLhVdiUB9g41y9lgFcUMegkPCAPFmcyAu7DRmubr+?=
 =?iso-8859-1?Q?iiBrU3KAVO/sBqLJ4V9PLZQ8++rcDbPQ5TCbZsd1cgei0rrFyH6hAnvvwv?=
 =?iso-8859-1?Q?yOiJ2slSDP3PslGZv977+KBtQNO7fx8rDoNfNCBLz45cGPY5H1Ap6/7c/8?=
 =?iso-8859-1?Q?RDdQzaqqjcHKn6dNrPZBaL4iICxtCGdQOdQowjZWv4iPwFSkhQT/wU/Y/I?=
 =?iso-8859-1?Q?ctWETxHLoQ0AbIDvlEfp1XnmlmGxY3+VHDn4Sw1KplYZaImdmnlepMCX9Z?=
 =?iso-8859-1?Q?G0rsSf63cf0S/Kltcdr2VoiIvzdoP6KeK3NATWvr7ZTp3KKfCOo7zl8IZy?=
 =?iso-8859-1?Q?CYjwGyp+MQl5KTEGtzrVHk8Z6wMhQGhXavM8i52OCvQc2OgYE/vUldhWef?=
 =?iso-8859-1?Q?dsI1AOpB35BfK3cUobNo1Dz75bMdfYw/vxM8k5rh/9bAHbv+gYA3utu3Ce?=
 =?iso-8859-1?Q?7kg8+HVZiemsmw3719ZmH5/JplVlxVow/e5uL3BMZcpX00foF3VRIHozwt?=
 =?iso-8859-1?Q?Oo8kgJyz2bbjoJ0vfgCthzdK6rIM7hr78guzN4Y3Zip7F+QAxMqqMjkf6o?=
 =?iso-8859-1?Q?urzliySRB5A32FhZPzItNbM5nXHg32gK36ZVC7uV0CqvrdeoTxyzKiHylM?=
 =?iso-8859-1?Q?MZ3NI9rRLBcj/c67hbkOL5TFUga/3eqlB7ibuC+iZlQ3g0N5f5g0lOsYY+?=
 =?iso-8859-1?Q?ehv0Wlj+S75TYn486ZOb4L5KcCjQlp9VeFzVHlCbjYY9ayLS9LsU5G1rGe?=
 =?iso-8859-1?Q?VEp9nJxPczy3SDuUtz7xNdhU2WFeGGWyeEvEuror2xY9kXLIX6i6NryMfw?=
 =?iso-8859-1?Q?f9u1X1dB7lyZZt52/HXClNTZvCpMFjGPrKMsC+/Q56DYYppr/mVCu2JNSW?=
 =?iso-8859-1?Q?ADhlzoAjhk8bD1wlpi6rLEzCOoBEsolz66eFAq03QCftIgqCMpCCVf7BDN?=
 =?iso-8859-1?Q?6VVHW9WAqlsCBfZy/JeDjpd0i0rY902sYm9BH5Ud717Bk3DPgnAExdwXYp?=
 =?iso-8859-1?Q?ZDlA3V3jSZ5CbAPO7YFilj+cqPQ1tyqbXYZ/75wUnvgNokT3QdrK9Vx/Uo?=
 =?iso-8859-1?Q?5P0337pobrjxhhWEjjZB6JtEysC4XfNJm9JraDeB3tcu3FKl6LerhbJHEc?=
 =?iso-8859-1?Q?Q4VkwrVg9Pn8LAUqJydNbZAVbeVsc4rW2WeWGg9sTRt6FrtEXxpggsbLFW?=
 =?iso-8859-1?Q?J6QH+xmcMwZ1L2jaeLj6U2HHnrAiz8QHVtpLi2JpBWguqnb87AT/++uGsD?=
 =?iso-8859-1?Q?MknrBKWOtOwhDzKGC+HkKMTVzsYVMShvcemac66Y0VASA0U7ywI60dYc6D?=
 =?iso-8859-1?Q?nuds2Sxc4HkymlY6QEQWL8kBaTs/lnrZO46S4PndfWCBByI8NEcoNs1Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19762480-267d-4ed7-dda5-08dbe57556c9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 00:53:53.5304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2m3yTjbMmWi1C64Xo/FTutx5/13b2uMrnfht8ki01wi48RD909RArMAhJ2PLOIC2RsCxwIJU75tAM+44ncawUQOe2DQCmm+zsKA+cx8s/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8268
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v3 1/2] drm/xe: Enable Fixed CCS mode setting
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

On Mon, Nov 13, 2023 at 04:46:03PM -0800, Niranjana Vishwanathapura wrote:
> Disable dynamic HW load balancing of compute resource assignment
> to engines and instead enabled fixed mode of mapping compute
> resources to engines.

Since the code below is only doing this for PVC and not for other
platforms like DG2/ATS-M, we should clarify that in the commit message.
And also, this setting is mandatory on PVC due to Wa_16016805146 so we
probably want to state that as well so that nobody gets confused down
the road and thinks this was an optional / arbitrary decision.

> 
> By default enable only one CCS engine with all compute slices
> assigned to it. This seems to be the desired configuration for
> common workloads.
> 
> Allow user to configure this CCS mode setting through a 'ccs_mode'
> sysfs entry.

I'm wondering if we should break out the sysfs stuff to a separate
commit.  Do the UMDs already have their support ready that's necessary
for us to land this new uapi in the KMD?

> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 ++++++
>  drivers/gpu/drm/xe/xe_gt.c           | 10 ++++
>  drivers/gpu/drm/xe/xe_gt.h           |  2 +
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 73 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 22 +++++++++
>  drivers/gpu/drm/xe/xe_gt_sysfs.c     | 53 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++
>  drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c    | 20 ++++++++
>  10 files changed, 212 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a1a8847e2ba3..dab5c9a8ad44 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -58,6 +58,7 @@ xe-y += xe_bb.o \
>  	xe_force_wake.o \
>  	xe_ggtt.o \
>  	xe_gt.o \
> +	xe_gt_ccs_mode.o \
>  	xe_gt_clock.o \
>  	xe_gt_debugfs.o \
>  	xe_gt_idle_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cc27fe8fc363..576b72000ae9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -395,8 +395,22 @@
>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>  
>  #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
> +#define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
>  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>  
> +/*
> + * Total of 4 cslices, where each cslice is in the form:
> + *   [0-3]     CCS ID
> + *   [4-6]     RSVD
> + *   [7]       Disabled
> + */
> +#define CCS_MODE				XE_REG(0x14804)
> +#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
> +#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
> +#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
> +#define   CCS_MODE_CSLICE(cslice, ccs) \
> +	(ccs << (cslice * CCS_MODE_CSLICE_WIDTH))
> +
>  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>  #define   FORCEWAKE_KERNEL			BIT(0)
>  #define   FORCEWAKE_USER			BIT(1)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6c885dde5d59..1f9b678fc530 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -21,6 +21,7 @@
>  #include "xe_execlist.h"
>  #include "xe_force_wake.h"
>  #include "xe_ggtt.h"
> +#include "xe_gt_ccs_mode.h"
>  #include "xe_gt_clock.h"
>  #include "xe_gt_idle_sysfs.h"
>  #include "xe_gt_mcr.h"
> @@ -451,6 +452,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	/* Configure default CCS mode of 1 engine with all resources */
> +	if (xe_gt_ccs_mode_enabled(gt)) {
> +		gt->ccs.num_engines = 1;
> +		xe_gt_apply_ccs_mode(gt);
> +	}
> +
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	XE_WARN_ON(err);
>  	xe_device_mem_access_put(gt_to_xe(gt));
> @@ -553,6 +560,9 @@ static int do_gt_restart(struct xe_gt *gt)
>  		xe_reg_sr_apply_whitelist(hwe);
>  	}
>  
> +	/* Get CCS mode in sync between sw/hw */
> +	xe_gt_apply_ccs_mode(gt);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index caded203a8a0..1c2a1d35a2c1 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -17,6 +17,8 @@
>  		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>  			  xe_hw_engine_is_valid((hwe__)))
>  
> +#define CCS_MASK(gt) ((gt->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
> +
>  #ifdef CONFIG_FAULT_INJECTION
>  extern struct fault_attr gt_reset_failure;
>  static inline bool xe_fault_inject_gt_reset(void)
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> new file mode 100644
> index 000000000000..fcbdc13df46e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_assert.h"
> +#include "xe_gt.h"
> +#include "xe_gt_ccs_mode.h"
> +#include "xe_mmio.h"
> +
> +static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
> +{
> +	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_hw_engine *hwe;
> +	int num_slices = hweight32(CCS_MASK(gt));
> +	int width, cslice;
> +	enum xe_hw_engine_id id;
> +	u32 config = 0;
> +
> +	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
> +
> +	xe_assert(xe, num_engines && num_engines <= num_slices);
> +	xe_assert(xe, !(num_slices % num_engines));
> +
> +	/*
> +	 * Loop over all available slices and assign each a user engine.
> +	 *
> +	 * With 1 engine (ccs0):
> +	 *   slice 0, 1, 2, 3: ccs0
> +	 *
> +	 * With 2 engines (ccs0, ccs1):
> +	 *   slice 0, 2: ccs0
> +	 *   slice 1, 3: ccs1
> +	 *
> +	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
> +	 *   slice 0: ccs0
> +	 *   slice 1: ccs1
> +	 *   slice 2: ccs2
> +	 *   slice 3: ccs3
> +	 */
> +	for (width = num_slices / num_engines, cslice = 0; width--;) {
> +		for_each_hw_engine(hwe, gt, id) {
> +			if (hwe->class != XE_ENGINE_CLASS_COMPUTE)
> +				continue;
> +
> +			if (hwe->logical_instance >= num_engines)
> +				break;
> +
> +			config |= BIT(hwe->instance) << XE_HW_ENGINE_CCS0;
> +
> +			/* If a slice is fused off, leave disabled */
> +			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
> +				cslice++;
> +
> +			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
> +			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
> +			cslice++;
> +		}
> +	}

Maybe it's just me, but the above seems somewhat hard to follow (even
though I think it's correct).  I think an alternate implementation could
be done with bitmap operations (untested):

    unsigned long cslice_mask = CCS_MASK(gt);
    unsigned long logical_usable = GENMASK(num_engines - 1, 0);
    unsigned long physical_usable = 0;

    xe_assert(num_engines && num_engines <= hweight32(cslice_mask));

    bitmap_onto(&physical_usable, &logical_usable, &cslice_mask, 4);
    for_each_set_bit(cslice, &cslice_mask, 4) {
            int ccs = bitmap_bitremap(cslice, &cslice_mask, &physical_usable, 4)

            mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
            mode |= CCS_MODE_CSLICE(cslice, ccs);
    }

I'm not sure whether that winds up being more or less readable in the
end.

> +
> +	xe_mmio_write32(gt, CCS_MODE, mode);
> +
> +	xe_gt_info(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
> +		   mode, config, num_engines, num_slices);
> +}
> +
> +void xe_gt_apply_ccs_mode(struct xe_gt *gt)
> +{
> +	if (gt->ccs.num_engines)
> +		__xe_gt_apply_ccs_mode(gt, gt->ccs.num_engines);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> new file mode 100644
> index 000000000000..2f3352173e7b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_CCS_MODE_H_
> +#define _XE_GT_CCS_MODE_H_
> +
> +#include "xe_device_types.h"
> +#include "xe_gt.h"
> +#include "xe_gt_types.h"
> +#include "xe_platform_types.h"
> +
> +void xe_gt_apply_ccs_mode(struct xe_gt *gt);
> +
> +static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
> +{
> +	return GRAPHICS_VERx100(gt_to_xe(gt)) == 1260 && CCS_MASK(gt);
> +}
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index c69d2e8a0fe1..e53221c2894f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -10,7 +10,11 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_gt.h"
> +#include "xe_gt_ccs_mode.h"
> +#include "xe_gt_printk.h"
> +#include "xe_mmio.h"
>  
>  static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>  {
> @@ -29,6 +33,50 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
>  	kobject_put(gt->sysfs);
>  }
>  
> +static ssize_t
> +ccs_mode_show(struct device *kdev,
> +	      struct device_attribute *attr, char *buf)
> +{
> +	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
> +
> +	return sysfs_emit(buf, "Enabled compute engines %d; Number of compute slices %d\n",
> +			  gt->ccs.num_engines, hweight32(CCS_MASK(gt)));
> +}
> +
> +static ssize_t
> +ccs_mode_store(struct device *kdev, struct device_attribute *attr,
> +	       const char *buff, size_t count)
> +{
> +	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
> +	u32 num_engines, num_slices;
> +	int ret;
> +
> +	ret = kstrtou32(buff, 0, &num_engines);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Ensure number of engines specified is valid and there is an
> +	 * exact multiple of engines for slices.
> +	 */
> +	num_slices = hweight32(CCS_MASK(gt));
> +	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
> +		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
> +			  num_engines, num_slices);
> +		return -EINVAL;
> +	}
> +
> +	if (gt->ccs.num_engines != num_engines) {
> +		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
> +		gt->ccs.num_engines = num_engines;
> +		xe_gt_reset_async(gt);
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(ccs_mode);
> +
>  void xe_gt_sysfs_init(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -52,6 +100,11 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>  
>  	gt->sysfs = &kg->base;
>  
> +	if (GRAPHICS_VERx100(xe) == 1260 &&
> +	    sysfs_create_file(gt->sysfs, &dev_attr_ccs_mode.attr))
> +		drm_warn(&xe->drm,
> +			 "Sysfs creation for ccs_mode setting failed\n");
> +
>  	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>  	if (err) {
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d3f2793684e2..ab1740005600 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -185,6 +185,20 @@ struct xe_gt {
>  		spinlock_t lock;
>  	} tlb_invalidation;
>  
> +	/**
> +	 * @ccs: Fixed mapping between CCS engines and compute slices.
> +	 * Through the per-tile 'ccs_mode' sysfs interface, the user can specify a
> +	 * fixed number of compute hardware engines to which the available compute
> +	 * slices are to be allocated. By default all compute slices are allocated
> +	 * to the first available compute engine instance. This user configuration
> +	 * change triggers a tile reset and it is expected that user will ensure
> +	 * the tile is idle while doing so.
> +	 */
> +	struct {
> +		/** @num_engines: Number of CCS engines enabled */
> +		u32 num_engines;
> +	} ccs;

Just because the term "ccs" at the GT is a bit overloaded, I wonder if
we should pick some name that makes it clear that this is referring to
CCS engines and not to CCS compression.  E.g., maybe make the structure
"ccs_engines" and the field "num_active" or something like that?


Matt

> +
>  	/** @usm: unified shared memory state */
>  	struct {
>  		/**
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 88789826e781..b6be7a7ad76a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -12,6 +12,7 @@
>  #include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
> +#include "xe_gt_ccs_mode.h"
>  #include "xe_guc.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
> @@ -454,6 +455,8 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  		{ .reg = RING_HWS_PGA(hwe->mmio_base),			},
>  		{ .reg = RING_IMR(hwe->mmio_base),			},
>  		{ .reg = RCU_MODE, .skip = hwe != hwe_rcs_reset_domain	},
> +		{ .reg = CCS_MODE,
> +		  .skip = hwe != hwe_rcs_reset_domain || !xe_gt_ccs_mode_enabled(hwe->gt) },
>  	};
>  	u32 i;
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index e831e63c5e48..4f41699f95ec 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -16,6 +16,7 @@
>  #include "xe_execlist.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> +#include "xe_gt_ccs_mode.h"
>  #include "xe_gt_topology.h"
>  #include "xe_hw_fence.h"
>  #include "xe_irq.h"
> @@ -283,6 +284,13 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  	hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
>  }
>  
> +static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
> +						 const struct xe_hw_engine *hwe)
> +{
> +	return xe_gt_ccs_mode_enabled(gt) &&
> +	       xe_rtp_match_first_render_or_compute(gt, hwe);
> +}
> +
>  void
>  xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  {
> @@ -307,6 +315,12 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  				 blit_cctl_val,
>  				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  		},
> +		/* Use Fixed slice CCS mode */
> +		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
> +		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
> +		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
> +					   RCU_MODE_FIXED_SLICE_CCS_MODE))
> +		},
>  		{}
>  	};
>  
> @@ -841,6 +855,12 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
>  	if (hwe->class == XE_ENGINE_CLASS_OTHER)
>  		return true;
>  
> +	/* Check for engines disabled by ccs_mode setting */
> +	if (xe_gt_ccs_mode_enabled(gt) &&
> +	    hwe->class == XE_ENGINE_CLASS_COMPUTE &&
> +	    hwe->logical_instance >= gt->ccs.num_engines)
> +		return true;
> +
>  	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
