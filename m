Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B490DE728C4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 15:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5A510E13E;
	Fri, 29 Sep 2023 15:57:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A30010E13E
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 15:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696003050; x=1727539050;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YYlot2eZP+nWLV990xiWtdFY7+mSah8cMpcf9zTNBAM=;
 b=Rxqyrq0aV62kzOTKrSPYb1mzepHESk8om44i0qlhAZ8Z+jz9rdg+lJcV
 dfww5fcFef9KohrAHgikmC0rqjErX1zbLHgRP1tHwggw18cOBR1sijlz/
 AJ6T7T8SNTYQkCFuXsmuSNA6C69ZTmYLetPbyZblNXYqtE/3X1Qsjl27x
 BS09lv4BWZOWClJF1sg6CTdVKrkjJKKoYyPuGxC5SbExSd2luirR+4s34
 DiZicsVkluh2ugipuUxdw74M8p+rSeFv3BqL9Z6wJmaXXCUNV3c46rAzT
 oVp5D50IEOFC5YzjJNpGYy0RHQBC/1ITu1O1BA+VZJti+gWK0cl/q7gMz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="381210236"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="381210236"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 08:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="996976266"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="996976266"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 08:57:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 08:57:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 08:57:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 08:57:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxo5YKGb9/mu4VzR9tPT3Fh1sBD/++T3unfn83v+cBsm28mfPMk9xp/iLsrci8c2QTXAJDu+eIJVt8h3Ugk89rmO/6VygDRLVZ80vnV/Ig9sjVrXu/37bCATAovh70lmx1aNBwb03VjipwaQ8n6FMrAT4HiDKyNUELynt0dKQQAVJ2CWDzoPmrCwpogqNmef5I875EZm7TStQl2HlBOzfoJhh5RNRcZmo65Mg4B+Eu+3/PbuuT9aKW7ARjOwH1OC4LsczDBgayFVtdSXmNFBQyO/vaCA32Y1W5B+gu6vI0Ig2bIOk8Pb3H8mvNgdDSRINo1mZO9KFWOx2h+Fbuzqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j147O8QKuF26IMyqJmE8RzUBNRwpqNZw6uTexGGlNS4=;
 b=BT2vfY/Y+zyQ9CNw15JrGTlxmDjBYeARZFRdyrr9FreHn3fQS8GzZ+kSEo0ymHlIn4O2RR238cZ1iELNzKFmOYaJ8eiM5JCgxcPfz0wK9Fhy6e7asX0EsKigZVgdRiJpLv3xPISvY/fi2049tK6moxjVosWdTtYrFPpv1v3ksecnOotUa4M3/r/2zXmjw/1iCgak5bM68/LKFXkU9OfiQbo3jL/1uRFd1t1HazoK5ZqqO/PuknjNzS1Luh+c6fHBeeCgMNIkeK8D+hkYYSSak61DeBW08Y0KnpG+mA2AmU+E2BrNSufztj88eCky/GJguaxkItwSoXIDupj2xSE34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.19; Fri, 29 Sep 2023 15:57:21 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 15:57:21 +0000
Date: Fri, 29 Sep 2023 08:57:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230929155718.GF233750@mdroper-desk1.amr.corp.intel.com>
References: <20230929044351.3145468-1-lucas.demarchi@intel.com>
 <20230929044351.3145468-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929044351.3145468-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c933b7d-514a-43de-d4b4-08dbc104c3c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: shsGRWCWJCL9kCeqQjurdwHPNzjoyoXya0idRbQLj99LYKJnGT0vXKW2KaXCg/Kqovb2EawljaEBARv7aZ6Ohk7PizOtPVG3LzSfRheqRKhkcEsGzaSHzOuImhVv20gJVWZycSLSCa0dL7dd3cEALJjDkkBhs0q+3QE0g446C5CcSY8HoY8sGvBO5AhjFj8rpAViWKf/SzOrnNTAyHD6S8b/dbxPCLYY5Z6hRvqQu88B7M2Ja0UJq23iYQD04oHUqJlAl+xF2NiNtDNPTzk3OaHt03XrVtSbL2NX77hzxXTN7+20KYbJHiO6S8hjnkymcHS1HXbEaPRzRkIxcL8ouWbA6LUojF+7gQwkvZUiDtPpJkt1z/g1kF3mp92hBus3yZtVh5bpHySX/AwYVGB2GMgjFqoeGc6wkGQN2l7SOsInt/3aX1Y8JO3Vm7fD6r/eAmyxYSkEs0n6m7IquGJwPlztDCIHB35NiTL2a2ZgPEvDtKS48OYq7544f/omF+fiamVMXSfwU0t/VzwyfTpTRscCg5AM+RJbvc93H1lZ+Fqx2h/qMR8VPwB05RGGrHne
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(366004)(396003)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6486002)(6506007)(6512007)(6666004)(478600001)(8676002)(107886003)(83380400001)(26005)(2906002)(5660300002)(66946007)(6636002)(66556008)(6862004)(316002)(8936002)(66476007)(41300700001)(4326008)(1076003)(33656002)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oGxG7OwBK6VNW+nvzmOlNWcRL0+hTT4IzES6mqlOoenh2o1pDOQB0R2GtG/8?=
 =?us-ascii?Q?VkpbCFWCM/GFf8twNVEGejwVogCLmeGEgbt1g54QiyRRvgwZfuBwjU1CJUUc?=
 =?us-ascii?Q?kmMsFtEx5XlAmLjTDb5rD20mz89QPC7n3oeIWOcCb49iHYzf2iw1m4dDy0g2?=
 =?us-ascii?Q?FkmXfkU51Fle/5tHkv1nBcSrljtrOn5eQqaKQkUYr3xbDcFTtrfY/U4Z7dlU?=
 =?us-ascii?Q?gKZAHQUg7bAzcuQ/43tF9P3M5gfkV2FO+s82bzVUOWFX/JF2FveA9wMjwceJ?=
 =?us-ascii?Q?IlX7/wFO5YCMfyk4PYbjnFb6hCMHIBpHVC50FUR95MlvqEo2IXxImp5agrvx?=
 =?us-ascii?Q?xkMwAR7tr3DxdPLPos8T2PIigOmeFrRiYRqfYpnU1Fu13pvVD0KwXJzVPoE+?=
 =?us-ascii?Q?gsiG1PRkMSAy4418KOuVWXkRlS4aPPlqf12ozjkUAVCzQjvzxZMHM8vbOAOk?=
 =?us-ascii?Q?/GcouPxOPz7gF8xVHOZk1qM/SYhq/ol7pBQ3QTVEZqVK0H7Mry2XM6ihDBCr?=
 =?us-ascii?Q?QTRkN2yGCH7m8asOHroVdI0fVetUTz+HLpBcPy2q50YpFEoXzLFVVaIxGwvE?=
 =?us-ascii?Q?Xgo7KxJJxzXOAw2Jp9ilpMPrs8ia/urrejPr5nBRPrYTtGnWUYolpK6kS9pa?=
 =?us-ascii?Q?zkJBcVOfZjjNUTLZz9RkWMqIPcmfAy1N439kEHu8PwDtTN4C/R3B+snKGBS9?=
 =?us-ascii?Q?uVt+MOG4cvn7w8DtRqRn/Bq9jOZ9aq4CHbcNXeiyidjM0SeUEpLygG0OHg4c?=
 =?us-ascii?Q?w/3K3OvIxV+5jMlcJWGuvdyY8QGW8Bb2aJvlw8KBduyaDMy6Xe0q9eOs+xzv?=
 =?us-ascii?Q?/+7mi9yVF3ZDmzXsis+fkTCMwaw/IdWjIBTHVglxw3wrenFeXBunXFRNMVHQ?=
 =?us-ascii?Q?l7Ebiq5ZkRLpyyPOelAvAAaaHLadBobv4We7KzUVYQMTnu8dfFSer2DRXNbu?=
 =?us-ascii?Q?iA7unewqAfPDeJ33wAymkXwnXBf5ECnVfZf/y0GSKW9gty2bDVVKbwL4IkGx?=
 =?us-ascii?Q?GJuO6T4zGrWX7HZRFjZRGFj+mgQikzfMuwlAOFxMFPTpRBOvgeiMg4V7cUMk?=
 =?us-ascii?Q?tKyXwO0F88krJxaPBo76phMvPtqLVeiDTrFH00jrpc73nhTnbBHMQyiZTyPH?=
 =?us-ascii?Q?mErj5anXJJrhzt5X13lmKQ8iNlC7sGsYpU/BEw9ie7S/9lRJwietfKmfZPNL?=
 =?us-ascii?Q?/yhYZ79QJdH2DJ4Oq2wUYlXV4Jltnc5KKuwo+KRpClLIJZ/PYHTgxHL2rRN+?=
 =?us-ascii?Q?3e5sj/yXGuU407a+14R4LIynfVLZHi2aiCctcoPn+c+RCtHVoLNK1IdTD55i?=
 =?us-ascii?Q?+ncuiyVWJikO91r2hCfiZtG9SWbUURL/Rz2nXHCqV6jGuDdnvdSJzlmqMIIz?=
 =?us-ascii?Q?/Nfxk9rwhZMEG5oZP0ec1PNWL3g5MGURhz7VqCfIJjjUMNlDy8U2Q9ZvGb31?=
 =?us-ascii?Q?3B2/e+ZDjUoPTHD9PKGEQ9C8/QAvaPqvB7woLEGs/iLNU4fyt6FEAT9unI5o?=
 =?us-ascii?Q?dY5izFoWk3O/decFXXkE6rqBUgkz+mMmUyMTo3+gV9vRL4ZO/1WyYDnh7r/U?=
 =?us-ascii?Q?WIftO0+N6pThFGznRaCj67Pt0z2R5rBOtMF/8EirsxOP6ouoZRtpXJ6dPYBH?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c933b7d-514a-43de-d4b4-08dbc104c3c6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 15:57:21.3696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlqXF9qG3eSYijhQmo3ygIsJj6/mtugxzI94uxsi+Wcyi1eQ7AlSHzsvvJQrpM+liIjak5jDkt2njBAYUhMAIKUWyPIW+ef5i+UUGErzdNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Adjust mocs field mask
 definitions
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

On Thu, Sep 28, 2023 at 09:43:48PM -0700, Lucas De Marchi wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> 
> Instead of using xe_mocs_index_to_value(), simply define the bitmask
> with the shift left applied. This will make it easier to adapt to new
> platforms that simply use the index.
> 
> This also fixes PVC bug in emit_clear_link_copy() where the MOCS was
> getting shifted both by PVC_MS_MOCS_INDEX_MASK definition and by the
> xe_moc_index_to_value function.
> 
> Bspec: 57562, 57566, 57565

None of these Xe2 bspec pages are correct for this patch which only
touches the Xe1 code.  Although there are separate Xe1 equivalent pages
for each instruction, those don't seem terribly useful as a reference
for this patch either since the fields on those pages just match the old
ones from the code.  In my mind the bspec page that would actually be
useful as a reference for the changes being made here is 44509 since
that explains what the hardware expects to receive in the 7-bit "MOCS"
fields of various Xe1 instructions.

Aside from the bspec references here, the rest of the patch looks fine,
so:

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

with that updated.


Matt

> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  4 ++--
>  drivers/gpu/drm/xe/xe_migrate.c           |  6 +++---
>  drivers/gpu/drm/xe/xe_mocs.h              | 12 ------------
>  3 files changed, 5 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index 12120dd37aa2..1ee8d46d92d9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -44,7 +44,7 @@
>  #define   DST_ACCESS_TYPE_SHIFT		20
>  #define   CCS_SIZE_MASK			0x3FF
>  #define   CCS_SIZE_SHIFT		8
> -#define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 25)
> +#define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
>  #define   NUM_CCS_BYTES_PER_BLOCK	256
>  #define   NUM_BYTES_PER_CCS_BYTE	256
>  #define   NUM_CCS_BLKS_PER_XFER		1024
> @@ -52,7 +52,7 @@
>  #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
>  #define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
>  #define   XY_FAST_COLOR_BLT_DW		16
> -#define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 21)
> +#define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 22)
>  #define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
>  
>  #define XY_FAST_COPY_BLT_CMD		(2 << 29 | 0x42 << 22)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index cd2e00008aab..1d1e4076b29d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -519,7 +519,7 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  {
>  	u32 *cs = bb->cs + bb->len;
>  	u32 num_ccs_blks;
> -	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
> +	u32 mocs = gt->mocs.uc_index;
>  
>  	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
>  				    NUM_CCS_BYTES_PER_BLOCK);
> @@ -806,7 +806,7 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
>  				 u32 size, u32 pitch)
>  {
>  	u32 *cs = bb->cs + bb->len;
> -	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
> +	u32 mocs = gt->mocs.uc_index;
>  	u32 len = PVC_MEM_SET_CMD_LEN_DW;
>  
>  	*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX | (len - 2);
> @@ -828,7 +828,7 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 len = XY_FAST_COLOR_BLT_DW;
> -	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
> +	u32 mocs = gt->mocs.uc_index;
>  
>  	if (GRAPHICS_VERx100(xe) < 1250)
>  		len = 11;
> diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
> index d0f1ec4b0336..053754c5a94e 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.h
> +++ b/drivers/gpu/drm/xe/xe_mocs.h
> @@ -14,16 +14,4 @@ struct xe_gt;
>  void xe_mocs_init_early(struct xe_gt *gt);
>  void xe_mocs_init(struct xe_gt *gt);
>  
> -/**
> - * xe_mocs_index_to_value - Translate mocs index to the mocs value exected by
> - * most blitter commands.
> - * @mocs_index: index into the mocs tables
> - *
> - * Return: The corresponding mocs value to be programmed.
> - */
> -static inline u32 xe_mocs_index_to_value(u32 mocs_index)
> -{
> -	return mocs_index << 1;
> -}
> -
>  #endif
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
