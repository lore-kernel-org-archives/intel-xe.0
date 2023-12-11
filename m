Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E365C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 15:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A5410E119;
	Mon, 11 Dec 2023 15:27:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3874410E119
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702308437; x=1733844437;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oGKpNeFZk2V6MnlG8TabVkHIuHbaKrsVOGEXnzp7LfQ=;
 b=YwykbT/ektLHkmtyJ3cNWs8z1ZqfpPZTn3n3ZRAAWIkUHHGmoNTNMlZo
 UDa6ssL91NBuwtK9ocVmXvCYNvJBix8QJLiXD8xT/T1CEnO9n1CmmtAGk
 OcnVeCmyMG5hrcfxkwP59SmsIa+3Glss2hLs/kHQGy7Q2cBb6c69jDlPK
 zYUsxy/a01eMj7HGGpWbR4+nAE7kVn8+lanhGWzrJM/OGJF13vNgnQ/RR
 4bIT9sJiub76a15fcl6mQEpTDHRomLM8zULg+LthmM8PeSTRnkQlPSQ4s
 8LK2pmU7W6C4R9mwYNJOaRd0IC+khMbEVgXD2N8W+2Ohv61zWbOcn7FAq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="398514716"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="398514716"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 07:27:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1020278307"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="1020278307"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 07:27:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 07:27:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 07:27:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 07:27:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMpeX4IIKHLsFpE9ve8cu0X4coVFFsa0rCaQxMjmNgDxhHSIZlxNr0FyqgyGuae1MBiH6iXVmqknSLLB0FfaczM+z6UsZilWJykBVeBv65aYN9vlTM3MWjPfKYoPcyzKawSdUKOefirBgVI1E2CkHgcPTuXsRA7RTQq+A51G4xtr3A9/ksBEL73itEJfkjE1NdcRwryhKq7L00u/VNIdBNsTzb7Ky/ll/gKiTVXyf3S0NGJbE6dCi3KwB30LO+1WtY6zlTvcr3iRGvfyLtKozUEJ52SQDRB2IstTonx3lQUJL4zLfq+R39HJvTjGYRf1KE2+zl36cuNt2/gESqeGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9A8i3/Od1X3aQHZ0EimO86mA45CoE76wXYHnlFQo0U=;
 b=GSUTGdrtNcnSC8u2XYKIZ4gbO6efjpvsrbW8EYh4TDxyH79LlX52S7v7OUCzn8JcJZUPwX8I4rxS/8nz/Dw9xIY+O1GXiEz/RWCzDrID7jEYWnooGuq1kyLToM/Fbdc87UcaYOAmXv8vfBVRebbgxQGP/yfp+h6mc5atKdaVZRDR+BKu7HNSXCipX0WQaoJvdClqwNZPJorz2MkUxUO/ciHvRX/woAXumM1tO1SjIvfkksS1OQ/cTNuzF+wCZGFW01/lg0I2bB8fY210J0pSnBt/0FaVrQq6SG7mutPh7yRjv4tfnmScan0L6DA1iTarBtOkJDKkA0Hu38GsQhiGBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 15:27:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 15:27:13 +0000
Date: Mon, 11 Dec 2023 08:26:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Remove DRM_XE_UFENCE_WAIT_MASK_*
Message-ID: <ZXbHpA3RCx/lYCb+@DUT025-TGLU.fm.intel.com>
References: <20231209074558.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231209074558.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: d41c78a3-bb25-4625-0543-08dbfa5da67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: imLCni5yfuJLqIPJ0IMKqlGZmVXNfnMwJXpakW+UxFas2eo6Ndk96mql67H5MLRiG5/wWVpgw4Ut/4hpu1rzJesxDkGhQHPcA6qN42dHwmiVFY6BWH03k7e4pxcTkvb995gTx6m5M9KUN4/k/qlxMh1k2fxEy5EFYan8t1xyjY0viHjpt7yG6g7rY8suqgpod+rjwzYItf3xEB57ZUsdqMIrZ9oAJxDZ63kDLuWUkJ5oeZZj6QZfm/GN/xFQ0b3O8FPGOcRgx1G2rHOjJFeL6nqJJIcsZ+U/6Wm8MSkVqiOWoFiXFH/gH/hRAtyFrWhF38uUXKUh2lqsqOBSHF7b3OVB4PgvjZqS6UMw3pdPpFly04V7zDlwv7YMqvIHc9XCbusa0LUXVbh/g/XKPHdNcxvJwlmrNGqXTNouFWkSs1gojiNQVS6UzyCBZRJTjyiw/a8AbRiyw9ZVuwMB1p2Xf8qQ3VCJ8TnfMlsoqQvc8vZzx8j5oOQOlDKmV56KhNoUIPS0Y3brv5RZtaO9WPbriQ7halVY2oXyanaBW/xt0xyYzd//GcA1GYG0KH9KbnXe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(107886003)(6506007)(478600001)(6512007)(83380400001)(6486002)(44832011)(2906002)(41300700001)(5660300002)(66946007)(316002)(8936002)(4326008)(8676002)(6862004)(6636002)(66476007)(66556008)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9RcaMZRBH5nQh33PY/agBiO6CyM+CCVlJ78grQKQtAupqKuRWFX54yw0czEk?=
 =?us-ascii?Q?/I3ZLtAnZEpWRJlL5S/Ep/LxGL7VJq+/vTuTkE5S4VbNY/ntkEr5/bo2ED0f?=
 =?us-ascii?Q?Iu66NR+DGzWd2WGjGWDs+7MeZemlGLmrlPu+fTvfmIvqkv/waSEdu9VjTBs6?=
 =?us-ascii?Q?4vuF/f5MgD41xzgNUZPLwiMII51sqwDSVtci5t1arREims0UsIBv8Y6h1uyW?=
 =?us-ascii?Q?CYSDfflra8T9nabChrhJvv0cn3DYnNiUl7P2g0ZwzIVCFLI11Je5UG3WSIBM?=
 =?us-ascii?Q?OhnUS4I838nSxRg5RVSygsFfAkqXRvcZf/KsM+7foHMl6wHHopG2ZYc02lDK?=
 =?us-ascii?Q?T01x0ZYQMSlgCWedBwrb7MfNf1QyMGpyxJkWFseh9ni5bu7OKgdBFJJNOVoz?=
 =?us-ascii?Q?SQAR2WJqYE1MuXTJ3nZuDRn7efncBn6YmX56eILBu+ADqWMiYmY3J9MtXtR0?=
 =?us-ascii?Q?lWdCE8fkXPsoPNL7zASJf2+V6ps9+rwST20NE9KWlBMLGDNMKgL9P5CLYnBz?=
 =?us-ascii?Q?I3COxhOXpOkv7K6qNu4BS9iuvSAKuNXWJsgbGuSEunZt6AllTCS6aSQp0Keh?=
 =?us-ascii?Q?d88hu/ej5Ujqo9ZLtJSevZh9IgI1KPDXGEG2ECpS9+4qfQGLYebQCaBbDgbH?=
 =?us-ascii?Q?5Cc31LgjyjfvKIaM7StK4KyTlr8g8mrMJZfbuBDTZ+lHXt4S5QZ2CT2tZkRx?=
 =?us-ascii?Q?PGbdn/04OK4ivdxFhJMK8S+fFrEviv7Ekln4kLurgKTy9DzvZPVyBv0BqJDj?=
 =?us-ascii?Q?HbEhYhBXu11zq0YKT2aNOyEpBafZZ00N9NRlebYBoKxKxnRCwkd5Yl9D13ub?=
 =?us-ascii?Q?vv1M9rHwpGBkc14sRMqsixqZS3ccgOvWX+32EIB7XDM5sJwunGSWDl6Gp80+?=
 =?us-ascii?Q?mGaX6+QRUYYuZXJ9INvXx9lZEsokk4vhZq3azkc2ljayAytiDahyabAtxbbG?=
 =?us-ascii?Q?5XYsxPuQ8MxpY5j3aOrZL9nfKUjHgMQ3H9m6e4PwbPzIr1XwBRdDz70LxKVB?=
 =?us-ascii?Q?bCoZ3WE/Y3NEKBie/P4VPEvlqHzftuAerD38M2i+WLS3JnjACwwIhCltkRh2?=
 =?us-ascii?Q?x6aIfapV4DMD5Fqfp3ji3zoBH8CIgJa4TD9l4fCAf64iGQSrzDargyEI9kQS?=
 =?us-ascii?Q?sZ/2oX87PtT7LLxuV67Omb55Yhh5Aqc421jljoFOFEDKTC7dsRYaodEM8qjS?=
 =?us-ascii?Q?FXQdglBkgdTvIqqf1ZfbzBgAK1Be45sowE12zYYodIGWAKNnTQ3eMWpj0KUD?=
 =?us-ascii?Q?m6taXOoIM4wdGCBNywAJveumNuB9H9iqENMFu612cTHnuqTV99lAwCqg1u5l?=
 =?us-ascii?Q?M9JTOaxKuItE0t1IBNpwIHIv18Pl++XeKPAidQf8DoVVO9uLyTLJ+lFD6LJH?=
 =?us-ascii?Q?qmcqqhobD6wZcGZ14wgsnpcxoTy8X4ydxhCSsYt/6hnymO0Q1amO8bZVH/sq?=
 =?us-ascii?Q?0j+0ECL5JWFRsQmZ2HUwmBvQHBI7AKlSSEZDqnO1S9ll7sHm2R+5QJlDWhvz?=
 =?us-ascii?Q?Hh7GTgBmRgNDs9KiY6roLzAWohrMbYRKSEvC2cuYNNq1dBTaxTV8vEtDqmrd?=
 =?us-ascii?Q?ucymdbRNc1M7yDrknmo1/FIEV9IoBzjm2fcqWSVEbqc2Bwgx7dM1qqLJN01D?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d41c78a3-bb25-4625-0543-08dbfa5da67f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 15:27:13.6752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkBJBqCy80c/yA7yPvpINgIxIyHLgd7ehEac/1XlcYLke4WIfx6j5ORUCFVQmnbjdf0irs70Ja0K75mu6JR6qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6343
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Dec 09, 2023 at 07:45:58AM +0000, Francois Dugast wrote:
> Those are just possible values for the comparison mask but they are not
> specific magic values. Let's keep them as examples in the documentation
> but remove them from the uAPI.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 0895e4d2a981..a0e8bf4cadc8 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1042,11 +1042,13 @@ struct drm_xe_wait_user_fence {
>  	/** @value: compare value */
>  	__u64 value;
>  
> -#define DRM_XE_UFENCE_WAIT_MASK_U8	0xffu
> -#define DRM_XE_UFENCE_WAIT_MASK_U16	0xffffu
> -#define DRM_XE_UFENCE_WAIT_MASK_U32	0xffffffffu
> -#define DRM_XE_UFENCE_WAIT_MASK_U64	0xffffffffffffffffu
> -	/** @mask: comparison mask */
> +	/**
> +	 * @mask: comparison mask, values can be for example:
> +	 *  - 0xffu for u8
> +	 *  - 0xffffu for u16
> +	 *  - 0xffffffffu for u32
> +	 *  - 0xffffffffffffffffu for u64
> +	 */
>  	__u64 mask;
>  
>  	/**
> -- 
> 2.34.1
> 
