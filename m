Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA7DC49EA1
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 04:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890EE10E85A;
	Fri,  9 Aug 2024 04:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1Nbpqog";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0640110E85A
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 04:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723178242; x=1754714242;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ltvKDi6m0Ji0nirrS7TpzBa7fX1xPwYALhW2xKvlcYE=;
 b=X1NbpqogfDn1Z6yffTlm2oZG4hY1iexbdobXHbn24XhBBJ7t1po7Qxx2
 8iIMmi/7p52bS6luC9bCDBJmi4JZLONGV1pOn0ev/g7IETpmSI7qGl+C4
 G/BpxR1kAzKksQ4gVCAxK/g3kOZYaAHmkzI+sTiBgVi+RiRJnF4fEKmQp
 9rmMSRXQXaibmwVD46BlSPeK0stQLCoDnzHTX8d3pC2HsQupXTOF8fC/5
 YNZM4HGLOeVZierTeD7qicnq8Z8BEq4nsWf8ivPo1UvEsZhWcn9mDOcf6
 128iJxoY+oh/BBSzGQfMwLwA+AaUOVltYeLt30F+7f0G0zReob0UKgfhe Q==;
X-CSE-ConnectionGUID: bjJ6jXIZRZWACbyV1FHTaA==
X-CSE-MsgGUID: HfnpkfmyTVWAa1OHh7siOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21220355"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="21220355"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 21:37:21 -0700
X-CSE-ConnectionGUID: mXdLCBC8R6WgjJehwxPOtw==
X-CSE-MsgGUID: PAQynctPRXy7oskatkOcdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="57418704"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 21:37:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 21:37:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 21:37:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 21:37:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U30nhyah4atKMv1FCu67twa+ZgkuFNkmJ4b+LqPXs/49ySsoO23P2ofPsSNfh97a9hizUVqJ7kxahE+tGMX0XAt+VzfYpNYn3WsYfg/e/xXyKcNaRVMFFVizbHw73NMQBeXa1DMydZ10efch16AZL7pTjSER7BTzXRWUU6DJJXp6MlKdteW9WilHQPW3oNO1Mz1hCSnvJWzkpUNLOStxtn4cWIjJupJuUhbBOfjoeAMHEKJbZv2cvRE72CXJ9qqVI1wdX1ViMvlI41Niwd5asVj693uP4K2qpSN2l4aa6CLPckm0Ahjsz8+tB1K4QwUVuFyp+gXrvs9dUzunFPSEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFsOmW+b3yCXIepnVmh7Gu9o17Gpa3AOD8x81XOXJog=;
 b=E4IeJWvUVRx39WRT/Og0mnQqAcyqqVWwFI/n/y8DLFxTSTJ3V5lX95+8RsuL4p/pdM7OTozFIyO10PwjNQSRIvRUewQARYAnS+vdTbHwQnKAL58JHJgqKaU4ptk6l+IW3XKnyZXU8yeHsxZ5itV5aNGMI7ZBmXJCgfpNG8Rs6L/on4QUwMNCSzQvCnSdsTY19bnj6jDR9FGO1UVzXOcvfvlLW+ushPvhw8QZwXqZtwEVk+piJvhGHp/m7OvxLAFo4DsmSsmFzBVmQDm/3065qN3eLIG+NlVcDVSWNhGk1i8+z0WKZ4vIJput6yHbyLAKMUsyL8ZGukFVy9cwuXx0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4881.namprd11.prod.outlook.com (2603:10b6:303:91::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 9 Aug
 2024 04:37:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Fri, 9 Aug 2024
 04:37:17 +0000
Date: Fri, 9 Aug 2024 04:35:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
Message-ID: <ZrWcqcqu/rVyIBZH@DUT025-TGLU.fm.intel.com>
References: <20240808091917.5761-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240808091917.5761-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eef44a2-4c83-4c09-9825-08dcb82cf2ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ilfw/9Vf3RVzwzASyuHdhGPb2DoJgSOmMZ3b+i1PkWGWqtguy+KPwu4jGP?=
 =?iso-8859-1?Q?yURmIikbxp9DObrfu7pw0fRGfWprslH4X9mB2TnM5OMjkI3n4aKPJ/dxqY?=
 =?iso-8859-1?Q?KR7QkXDvie7d8Lc3UCS+B500hpUfRedsOsZBXzGKxMKBYtG/BDktQ92f0N?=
 =?iso-8859-1?Q?WcPC6UDt6PSyflYTf13IEder+nNA+zj4+3MaVRe6ef7cRttM5Fc4ziPaQf?=
 =?iso-8859-1?Q?pdfLXNRyAOp7N4hEvASJiDni3fYaE/BkVGFymYjRt7zVqBsaCZ2UDIOv1I?=
 =?iso-8859-1?Q?/nhTMeV5IVaIDR9N7nvWiAL1zK7Sr3S3xq5gkazyL1lYAAWkr8D5nxdVIa?=
 =?iso-8859-1?Q?yWuJrImR/pRsd/rXICjoSBrIc1hUEIXapAAnBwCbZM6cD9d6CetD77U9yz?=
 =?iso-8859-1?Q?L9re72rcm9evvGSqupbFCLqXT7kYWxACAmvLYRocXSacXVQhbGZCRNmoO2?=
 =?iso-8859-1?Q?Obd45PtR+ndHLMiKn23fPvd0cjoK2PF3FYjwn9hNo6zMMPBVP+CI6OC4Um?=
 =?iso-8859-1?Q?cBjgg5q8Fsa3IQtt9yxJ1e3To3LoFpoFR2qppYpLBqjtOtZ/q4cjxVrH2P?=
 =?iso-8859-1?Q?Gxo6BUBE2RnmCuVPKrNDhlTAlzHHiRu+c9G14zKdebaw/W1sU1ArceoU26?=
 =?iso-8859-1?Q?22nH9CIax2YSA+gBJzNJWtUCFrKi3Wehvml693hV0iBIJBx2qszuRX9KGV?=
 =?iso-8859-1?Q?pr9+n+vZ0m+Lhqc7z6poTrvp46/u33R6H6UrYwSaigmeVHWIgE5JBmc1mc?=
 =?iso-8859-1?Q?cF8K1/K8rKNT69UDXScURZsdDdvt0blyYhKsvg39L9YTUvPZr16S698odJ?=
 =?iso-8859-1?Q?zHK6KPz1JUHVH+eFwhdcdkcndX8MbZOs5WRV3+W52h6DdOnsSQ2ehtgjHN?=
 =?iso-8859-1?Q?emQtuI6WTuhl8GLVquR6eTuqkzoC2ox+ZDm21/Bz4LTvGksyTA2SgRkjTK?=
 =?iso-8859-1?Q?rt0MpN/X4+xntfdfUG9vNsMTJsHuTh0TN1n33uEbAtMYVw1sCWR9DERfFh?=
 =?iso-8859-1?Q?NS0HbEQ+tr/rlKR6/SUXgAUqPUULKIelNTIj3RVp6eLE26oGze4sdoGncS?=
 =?iso-8859-1?Q?2vnq/Vcgpt84E5VAp0fhyu2UArCnPvlNgoFIUl11W2JZ4tjQtXQXW98+BL?=
 =?iso-8859-1?Q?rGR+zosUqbCQhXZBV/Dl+A37VBG3lxs9TDxdY8NF5wgf/OLYuobtcldnte?=
 =?iso-8859-1?Q?36f6EK0HqQybAP3xcoo+KoLQ9mTisiECUrbaL3grSVRjRF8J2nsu97PIMf?=
 =?iso-8859-1?Q?DMJDflIcFIDeOi17W4Koc5UWLcZ62vN9AdcDH8Jk26IpCIi2pYIuKqqNHw?=
 =?iso-8859-1?Q?jXOA94gDq5b+Cq/ArjvGoNpSfIT8+8ccMqjV0W1Ip5S3/AY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+uhHpZKUFtNUBkEUe85orMIxUdRu5q26D2MMCTVX/BfdkqWQwKbz52wB6Q?=
 =?iso-8859-1?Q?XQLl6GaVb3DYXMNEa/p++03oDYwzEFVDCBpCDJzplDym/xCtOZUIXSXOKq?=
 =?iso-8859-1?Q?VW/vBIuQM4HeQB6o7K7noA2Y2nBFWwT5BW90aCgTg5aXvwRBOOWaBd8bfI?=
 =?iso-8859-1?Q?FF/nUm09dU5wt8TzzQZDcp/Oc2oDEqrWad6mfNB+0sydEhse/BVzOhTtQj?=
 =?iso-8859-1?Q?LXrTVFG4TTYUxlG5ArseoPI7p1nLA+EVjXLLLf12kbb5vmLbeeOAVIP8E3?=
 =?iso-8859-1?Q?EQD7mUnms0iTVZ4JDdVn490L4kzPg5BDQIPXVRs+yPtoYdAMCG/suAuMqL?=
 =?iso-8859-1?Q?2JkwlIOlQXWLpHi0jjmYguqMT/DP2Fpx7OJs5Hv/Q9CK4Sf14ItRx0D6Rl?=
 =?iso-8859-1?Q?0QaIqtF2JxTYSAg4370Ap05NQwf3Oc4ofDRc25mVrj1W5MBDsk216U0FEB?=
 =?iso-8859-1?Q?1vz0TaFvt1QEi3pVA+Mz9UihFS5PsshaF1oaq/I9snl4LhiioRqCvO2cKY?=
 =?iso-8859-1?Q?WYgjF2RuB26zbbQ6dIRThjASrEs+0gxWT38LypN9THxAq2Nz6XE6txnHjS?=
 =?iso-8859-1?Q?Hh7O6epR777j+vSFFhAiyXr8V/dy6L+6uFQMo+TMg50qcPMVndO68FDi3H?=
 =?iso-8859-1?Q?k2tWRZJeQmODiomOTPXM84uJICuWu3zeMURT/3oOfAJ/AFOFCBrH/M2LjV?=
 =?iso-8859-1?Q?iBKT3r9oIV9Awh8mIV0Pv0BmEC9A0wb6OrXLxivPKLozNNa5aPYX03qk/a?=
 =?iso-8859-1?Q?pRd5zaBmPv0FFSsuJw1FiGMGed2j9GS7eTOzZ+HuaN/jOz7CYEGyug7sDM?=
 =?iso-8859-1?Q?grEKD6+TCuFdsAxKs/2NEJ//ZCTAXvL905FAsvlE51t0xro3OehQsbNVMi?=
 =?iso-8859-1?Q?3mDC+c7wm4T5dMQHy/5/75S/GrDCRP8okFWXclF/DrVV9QhY7+qDWjvStY?=
 =?iso-8859-1?Q?e9hAOxhKdgxqN6iRkQdzg1oGENCbjvGR+SC+yKV/KK4jB75MjTGtrdYUAR?=
 =?iso-8859-1?Q?q+bbGM8inchGVu+VtUogsJuhFkKEZsaJ8XZJPLGNxpX/1wLvfXTnJ44f4I?=
 =?iso-8859-1?Q?mGHvO754Rl1wS0+9YwdrzbbBMGTonIsDLAaxMo7/V7FQSZZWOcIFbA47fZ?=
 =?iso-8859-1?Q?9ofBPWmGKyKY1s+c76VWvmhJzRMc4g/n4ro+1vD9KtioXFE0Dik6MRaLXI?=
 =?iso-8859-1?Q?jGdgh6WWg+NPVNB1ryn8qMnuaxraD7B4uZiMavUAwbws3hrAX774oN1LbK?=
 =?iso-8859-1?Q?lAy/0WZt03upnLL5k/dn3cNGNiqjIRDAhr2AHHC5W1MemSL3WJbjWbCFBq?=
 =?iso-8859-1?Q?aYrtvH/RiugmIcv/19gmxYZIl4pwSvA9bD2lTNUhkZTb/7oqBoxRDIXU63?=
 =?iso-8859-1?Q?IfUcz/xbNjk5Jof07bMdKvMFYJwGDMGiOVETFXPplfaSk5wLVbUPBuc5sV?=
 =?iso-8859-1?Q?HNUcDjOULGKShq2QYzCkYdbSxSe2810TMOzeXoXex1AYPTjMMtZEOQRMXC?=
 =?iso-8859-1?Q?Auayvf4DiYA2TayBM/6vWJGPWJ+sRii/xvdADSCNeFhhH5i3XFV8/2E/1J?=
 =?iso-8859-1?Q?F4u4rTpqTWU4aIVYzxUzxXf5BBxEXjdOP4+NiK/1aMQy+F8/yZ3fp/4l9C?=
 =?iso-8859-1?Q?c9ARwcrHUiUafqwSF1kMlorOWc35RmLz12Outq70hNKSkHSNZnG0/Dmw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eef44a2-4c83-4c09-9825-08dcb82cf2ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:37:17.5088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGqzIxVMfJteEEcw8nJo+YlvxfRqASAgIUsYkyim3YwPwBL8sNbMFcGGETUGII/sbaY+IVxQWiq5BHmv3vI39A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4881
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

On Thu, Aug 08, 2024 at 11:19:14AM +0200, Nirmoy Das wrote:
> Add skeleton APIs for recording and printing various stats over
> debugfs. This currently only added counter types stats which is backed
> by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be disabled
> on production system.
> 
> v3: s/CONFIG_DRM_XE_STATS/CONFIG_DEBUG_FS(Lucas)
> v2: add missing docs
>     Add boundary checks for stats id and other improvements (Michal)
>     Fix build when CONFIG_DRM_XE_STATS is disabled(Matt)
> 

This will need to be rebased on Lucas's series [1].

[1] https://patchwork.freedesktop.org/series/137053/

> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |  2 ++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  2 ++
>  drivers/gpu/drm/xe/xe_gt_stats.c   | 48 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_stats.h   | 32 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  9 ++++++
>  5 files changed, 93 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1ff9602a52f6..390e5652cd89 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -287,6 +287,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>  		i915-display/intel_pipe_crc.o
>  endif
>  
> +xe-$(CONFIG_DEBUG_FS) += xe_gt_stats.o
> +
>  obj-$(CONFIG_DRM_XE) += xe.o
>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 5e7fd937917a..5125d76ccfac 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -17,6 +17,7 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_sriov_pf_debugfs.h"
>  #include "xe_gt_sriov_vf_debugfs.h"
> +#include "xe_gt_stats.h"
>  #include "xe_gt_topology.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
> @@ -286,6 +287,7 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
>  	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
>  	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
> +	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> new file mode 100644
> index 000000000000..74ed9342af91
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/atomic.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "xe_gt.h"
> +#include "xe_gt_stats.h"
> +
> +/**
> + * xe_gt_stats_incr - Increments the specified stats counter
> + * @gt: graphics tile
> + * @id: xe_gt_stats_id type id that needs to be incremented
> + * @incr: value to be incremented with
> + *
> + * Increments the specified stats counter.
> + */
> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr)
> +{
> +	if (id >= __XE_GT_STATS_NUM_IDS)
> +		return;
> +
> +	atomic_add(incr, &gt->stats.counters[id]);
> +}
> +
> +static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> +};
> +
> +/**
> + * xe_gt_stats_print_info - Print the GT stats
> + * @gt: graphics tile
> + * @p: drm_printer where it will be printed out.
> + *
> + * This prints out all the available GT stats.
> + */
> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	enum xe_gt_stats_id id;
> +
> +	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
> +		drm_printf(p, "%s: %d\n", stat_description[id],
> +			   atomic_read(&gt->stats.counters[id]));
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> new file mode 100644
> index 000000000000..b97363e99ba7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_STATS_H_
> +#define _XE_GT_STATS_H_
> +
> +struct xe_gt;
> +struct drm_printer;
> +
> +enum xe_gt_stats_id {
> +	/* must be the last entry */
> +	__XE_GT_STATS_NUM_IDS,
> +};
> +
> +#ifdef CONFIG_DEBUG_FS
> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr);

I think Lucas wants this to be s/enum xe_gt_stats_id id/const enum xe_gt_stats_id id/

> +#else
> +static inline int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	return 0;
> +}

You don't need this as the only caller will compile out without
CONFIG_DEBUG_FS after Lucas's series.

With the nits fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +
> +static inline void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id,
> +				    int incr)
> +{
> +}
> +
> +#endif
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 631928258d71..8e46c0969bc7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -10,6 +10,7 @@
>  #include "xe_gt_idle_types.h"
>  #include "xe_gt_sriov_pf_types.h"
>  #include "xe_gt_sriov_vf_types.h"
> +#include "xe_gt_stats.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_hw_fence_types.h"
>  #include "xe_oa.h"
> @@ -133,6 +134,14 @@ struct xe_gt {
>  		u8 has_indirect_ring_state:1;
>  	} info;
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	/** @stats: GT stats */
> +	struct {
> +		/** @stats.counters: counters for various GT stats */
> +		atomic_t counters[__XE_GT_STATS_NUM_IDS];
> +	} stats;
> +#endif
> +
>  	/**
>  	 * @mmio: mmio info for GT.  All GTs within a tile share the same
>  	 * register space, but have their own copy of GSI registers at a
> -- 
> 2.42.0
> 
