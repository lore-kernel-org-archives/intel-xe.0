Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A35E71096
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 16:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2552210E122;
	Thu, 21 Sep 2023 16:29:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FAB10E051
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 16:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695313762; x=1726849762;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yFrNNXAqRxEfCM8nsQEquVTAw6VTMWaJLnqPqroHV44=;
 b=HRpih2nvBbQNZlrXpfsTMJHPBeiIVIGv4Y2RehsKQBWfTfZfdbd5VfMe
 E5wf2WbOA4IArUzM0VXuGG/tfSh37iOcvdkgBRLTkN+qeS0WnjlqshatF
 bHIMHzPDNtj7BpYa4qlAAn7KS1Ev7RHRfZwWiKTRcGE8zh/GgpVa35joR
 dtRXMF6E36UfjGJhXPITZ2kkcvpd3OCQ1tpTu9BZ4CWhvvLzWIoXPsmbU
 UKDNqFMumToyoEd+NYTWvSxKf2RKWxqJ7kyJM7WjOTlj9RcRU02yuPuCn
 Uv+gjWQRks6OOHiiyPaoyOCXcqD7ut95/9bXoBcPRZF87fbzqFzqQV1yH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="359954665"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="359954665"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 09:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="890428499"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="890428499"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 09:27:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 09:28:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 09:28:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 09:28:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 09:28:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxLK5bZhhWxiTVS6p2Ur5wwVnAtf/c6pG6d2x6OF8YfVWpyISJmze6LoWAlvRPXeHjIdZ9Ht9xlnx2IvGkOcFNuaE23PRHozRVq5QG76JZpRpGz5ptPNFX2+5E/wF0y2GtsF4dfQadXOQb4ndVD7fttU772zGqbTuVaP3wke3TI+oZDsIK1fsKQpllEhW7vlkC6y6KDiIxeU7Q0SCfYYFVBnCDLi4aA49JcPGimRYxPQeS/Yofsrip11GQukeBo7Jw5saCwotSFsUBGB3gGkyQT5JWqBVNn6CFUrX39IX7FUNAWOu/+HgDP4BXowEGygGvxzEqu+rjl/OE0X/8bDMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oylVQWKRR3dRJV/61P1Icmg5aRWsW5D9ZzIBWv/eCBI=;
 b=PWc0CmI/9C09+UTGBk7X+WfumUSnKi4m2Gez9qS8vNzWhhTXS6DwDg3KU4b/CiC2a+gen1fehfpeEUFf0sf+H0Rv4h+TUVRXzykt+x2dgN6qbxTcC3kUK6X8uQCAjhltEAMYZ86iAi1z5fToiMY5B69Da0Q5fbpwtZm0j+fiPQTiZU0W9DZm22u2o4rClOzZ2Vesj55oEsDcEJrhrO6MqacRy2zgmF7vB1qiNSsnh8OzdPdZt03YosJyogGkQwc7IIcYMHu9SsF8UsmWvON8QeP4Sig2crrhqdSrYGTta1P7LdupUvVa+l4t8/nr20dnSHgvIJ+4bAR3J/hNEbbAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8666.namprd11.prod.outlook.com (2603:10b6:8:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 16:28:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Thu, 21 Sep 2023
 16:28:20 +0000
Date: Thu, 21 Sep 2023 12:28:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Message-ID: <ZQxvIFn0M7GhOaQO@intel.com>
References: <20230921111434.3051325-1-jouni.hogander@intel.com>
 <20230921111434.3051325-4-jouni.hogander@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230921111434.3051325-4-jouni.hogander@intel.com>
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8666:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b62f1c-f653-4e3b-81a4-08dbbabfc46c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 400Ppe+srvaZqh0sIthvcn6Fy7YejkSMf2UmtSEt8gNdMZ2JdHVaV1EoZ4aeFa6lVaoK4Z1I2SpT3yY5Wt511HtLB/5+hf4JPYw4VuSuTT4F41rkrgZLKGPtAoxtEsJ8j69zCaa9x5P0ZPF8fVganoZhq0/ie9pX8jh3aPedDDxAwwn0j8P+JSZTSmnjAc/ZQYLhBo2xwyN4Ck9L6V5+enXniZ9cDfcUVNgAhhhIora8t5atvDe8a8PfghH+noKUf7QooAdpukNhpwyAitm3mQpt2QAuGc2hN7vDaVdouo+0i3QwBNIuzsqx28rdzW/TVZJwL2gQo5s5Ku3Z0VebdJS+DFWKc/CHsNgt0DInFz471bH7qoKx2qDiPv1P7cDcKEITlVrjJfOXlbJXqWj/+kvLvkPgPAJRM7pOIhcF46Fj5N8iCkSU6mENreP20bKwN7z5DNP1HQDV+T7Tj9Ge60c+SLb130rjX0Lvgftq1g8T9X1EyYaux9IrEGwhXovA7MIU+IIMJEfV0ncFGIwFIGy08V/Cj35qDtdRlDMDwMRRfr+2w/tjItml9+FTIpgB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(136003)(376002)(366004)(186009)(451199024)(1800799009)(478600001)(86362001)(41300700001)(5660300002)(82960400001)(2906002)(44832011)(6862004)(8676002)(38100700002)(4326008)(8936002)(66476007)(66556008)(6636002)(66946007)(37006003)(316002)(83380400001)(66574015)(36756003)(2616005)(26005)(6506007)(6486002)(6666004)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qUKCECSZ+2cNlq4tGj8ZQm0aox0bq70q0+RlvbStdfTqhx90f5I+Y0tSD2?=
 =?iso-8859-1?Q?lm+5GufK+tHWpqYoRQC1HxJXZ6Dvct3eXzDTkoTQhPrghLwgEst7uJaZ9o?=
 =?iso-8859-1?Q?JfWTiS6i+qBAEYc6Ik0YD31JG+7kiJMZwHlSI9EY1eqO8Q+91XUNHWp3De?=
 =?iso-8859-1?Q?LBsZWR4hbo4OxdrjPJ75V8KtK8qhtF5hgrZg1IK0maMzIn48K1EIJmU5pS?=
 =?iso-8859-1?Q?w5kXt7QCb9LuZ02mgUcQNgr0PqPbVYrnHoCM2PwBJzMCJoJD7FhKPR2/DX?=
 =?iso-8859-1?Q?NmxBA96M46L1oZMLcRMmMk9tW4jOlpd9tik6mZUA3uVsGtk09pEf3WetBt?=
 =?iso-8859-1?Q?ZZWqQjhUoIaYhXRriEOLYa77qYQQk7gOqlroV0sB7JLAUKw/jBh74nJWSW?=
 =?iso-8859-1?Q?S2Qef4b4ZX32wEb/PomUNXCjU8lAopEvam2SrU3Oc1clVZHnjKS7TpmLSN?=
 =?iso-8859-1?Q?kr5k6v+ERcdV/7O932yq9ztJNXJRm3/gX2O7qoGB4ZfJaDpCZlqwJXe+R5?=
 =?iso-8859-1?Q?wl1iMcG5wG+e5Gb3hUHZfT2G8hXUFaZn7o84aG7cbnfmvtm9z62RBVnniH?=
 =?iso-8859-1?Q?HWZ6HRMhneDCV3VfDlXIE0M2D59/wm97lhUGw2RFtKqu26tEIHYguYaLYp?=
 =?iso-8859-1?Q?cOjABrMj0i4H1B0h37JTVL9ibUTzRW+5k5hDyLZOvVL8R91Yc2Jqx62aU4?=
 =?iso-8859-1?Q?JAtXCRFpsbr8XcJWKaTKJNDVQrtR9ZvdiLt11ytguRjJTX82XPUl1OOLpR?=
 =?iso-8859-1?Q?QTDm3bE2wkIlE/hZy7hjB9QL04SndFb6z/83Q/fW4FJJragrz9CfzttE7t?=
 =?iso-8859-1?Q?icRg0kDWaKyRUMpPSo3XM6PflB7VVBE4T4FwZBJvq2GroLPiC62EcBFZId?=
 =?iso-8859-1?Q?9eOr65JkdnEn00qqkK/Uhmbupcn0/Ow1kSOq3AoO+WVO7uDW1InWNrS774?=
 =?iso-8859-1?Q?ZOEATWpnECiwJQVPdefLjJBuSRJS2tZX6zWzILX/XyoYKYx8/GDtv91AlQ?=
 =?iso-8859-1?Q?66Xlphe2piPM0e2rT7YFtVcyO5DdEMMWq0Pq7PqOd6aH3v7yPEr50iDgW1?=
 =?iso-8859-1?Q?Txi0QD5gyrKLlCgmVkdyBR3xSRbWxTDHO0VFL/Rc9vDRttGxeZk5BpGRut?=
 =?iso-8859-1?Q?gW86LGO7+LiY0yVW23B7hmsmiEN2Y6P6b0m1xaNLvu5PlJMuWYtywB7ofq?=
 =?iso-8859-1?Q?pIs11dilb3FYZapTdwttpCFHQnsmGRJGNyfiCyXCcRzfRVacNMrzc6jNgq?=
 =?iso-8859-1?Q?rcymvFB7ptbaE0OAUlYA4JfqVBA6iZeldQXPStdbNVwI3q3xRXqIzSEyXy?=
 =?iso-8859-1?Q?uIywZ042MsICjBq5cYvfWVkjau3AAl5sU6UTExP6KFmLMhe1nJh5ZqQ/00?=
 =?iso-8859-1?Q?A/JteIjATJKNmes904jLMBpEkyCQUsUUt2ShbFEqE/Z43v3b3RqvV6N+Nw?=
 =?iso-8859-1?Q?/A0gztdqXh9Wy2O+VuIDJRMWcNAW19pa91hGV7voy6+5FHKySFmuiWrPnS?=
 =?iso-8859-1?Q?HP4CRoAEy+6qL/amj6i9K54+FzYUhZ/wsbR69PB+aoKj+dFrrIh7uJcirk?=
 =?iso-8859-1?Q?Pgmu2Mwg5sXsAVgjmWlRqCbq/QbnstvVH2ArtsmflJ3n4YNbTAk+9ZIqbP?=
 =?iso-8859-1?Q?JrL5IjYVG45+wo4QuW0WwGl/eTQhtHnhOmCsXfsMm4y0Jffw46S9S1mQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b62f1c-f653-4e3b-81a4-08dbbabfc46c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 16:28:20.2922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xW6BzMTykZX4k/6OQ2DPCmVA8Pas58jXJ+Rs5BEezK4dxilWOKvAFTAD77Z+ez8fRF2GRlkgxMRvak27/VBaHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8666
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/4] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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

On Thu, Sep 21, 2023 at 02:14:33PM +0300, Jouni Högander wrote:
> Introducing xe_runtime_pm doesn't really belong into drm driver
> introduction patch. Let's remove it from here and add back in display
> implementation patch where it's needed.
> 
> v2: Remove xe_runtime_pm completely from DRM driver patch
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>

I'm trusting that you have tested the compilation after the fixup
and that it works, so:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a82f28c6a3a0..c0d5ca62df7b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -401,9 +401,6 @@ struct xe_device {
>  	 */
>  	u32 edram_size_mb;
>  
> -	/* To shut up runtime pm macros.. */
> -	struct xe_runtime_pm {} runtime_pm;
> -
>  	/* For pcode */
>  	struct mutex sb_lock;
>  
> -- 
> 2.34.1
> 
