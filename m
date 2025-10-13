Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A322CCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 21:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5EA10E153;
	Mon, 13 Oct 2025 21:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CswI9ytQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38B210E153
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 21:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760390012; x=1791926012;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zz8oTgrXyHNh6dXBvBZHati+RgYNC5/KR33orJ5lmo8=;
 b=CswI9ytQbujU6felOcUp9yye+t7/XE0Agk6+qw7ITvE5Xhe4bv7YZi5j
 eIG9yEw5uvaSA8687K+8A5tX47/cgHZuDAGCyWwcINPriy9Y4Ny6jMbb+
 UwloOgTzmYHbb8QZ5ysSj2lsWXbL3LdvmQrybtz3HF6V5bSbi3bX0S44C
 Kv2ZPdkGWW8D4ySEtGlT0ZPIlaVg+AemluoFPOCoMjiesVpLuqg/i6LX0
 kBUIsCi/LUkbQebNXTI20n0tf762N4t4C/as4K+qUoW39eEHhrRGIhJZ4
 7tIXpTTwofN1HPBxukHbxJJ0e5qXjCc1FcnQDGrqIw+heZLxS2Clsb6d4 Q==;
X-CSE-ConnectionGUID: ukxOuDibSz+tM2Q+qPAVfQ==
X-CSE-MsgGUID: WH9A5PDRQYqxULMNh0LXeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62434274"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="62434274"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 14:13:32 -0700
X-CSE-ConnectionGUID: gb3DxUKASWOSJwyhGVcwBA==
X-CSE-MsgGUID: JMLOR39KRAS2+RzRL98O/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="186110039"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 14:13:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 14:13:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 14:13:30 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 14:13:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I11M8cioKrTcmqw/u2wUk6x3Gru5u0afqQfI8dH08dEAx9qhARrDjR+zl87CMwyskrvzvyZeGvOgWHyRJz+bLKhLmKamwmp5Bp5a8Y6cBdJ+yJllwy9FGUt0tvjErS77DyY+W2Z+FihmIWsgEErz7dbwojeMMg/fLIF1UwtkoN/RCC+OBkX9TfLXNXJt6R1OyyABdmD/MaufbjZqRTkximxVJkhBhVg8UADxFe+C54wG6NpyyAZrThJZHl2nSGouOg9ebheDRUGtftJBJvvbDOA71SWHWGI8zTJ6UnLqx0uBei2u7vLMUaDQzB3UK50jn3D9UQiMXmqyo+cV5XlexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpBZ2M1PZjhudgJu0F4erWfiAn/T2uXWuw5Dt/RmiEg=;
 b=dl1bFvjSD1xEroCkE/lEUHoENTs28YkmCyB4XIxUAkOlSCeMT//Mc/Vx+tE4ueLQf2EPVKn4PGDdrqaHyMgkVqfsEsZW5Ax3X07YOmz0kiEjivm5RMtkDWO0TXnIo3MZW9Chz7SYXuB4H46oNpzJevY5YL4MjbD5hmQSbtn1Nr04Zq8Y0+SfQQ0i63+QE/+XzwT2lmFgCm2h3JpBx6SvXJdBZ88KhFnC6GQCj3VKBYnnjBr6nmv9KKfaCVLrKMfKdTOdvpBiDlTMJXs2S6hQLRRyqZM+dVNI5+NwP4KRbToqOI5difixyFbbCS6I6CjCeeSIaH1yOhdsnPAILESELA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL3PR11MB6531.namprd11.prod.outlook.com (2603:10b6:208:38e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 21:13:25 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 21:13:25 +0000
Date: Mon, 13 Oct 2025 17:13:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 1/5] drm/xe: Guard against NULL GT in xe_sriov_vf.c
Message-ID: <aO1rcAl90ikT7nbu@intel.com>
References: <20250926200917.164618-7-jonathan.cavitt@intel.com>
 <20250926200917.164618-8-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250926200917.164618-8-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BYAPR05CA0099.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::40) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL3PR11MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ee439b-076d-4103-8d44-08de0a9d5913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J+Qp/Ito9zA+xzhGpmAt8JrtIEPwEMXtu/y2VmN1cWaxN1JrOtDsxBcZYi77?=
 =?us-ascii?Q?W6e3ZDIf8lQdZJfsUzJjQfMM1zYIqwtn7hw3/ds6SLx1+1zqgzjp5H5IBfAo?=
 =?us-ascii?Q?doCX5yG5PbhYvcRapN84PvNM3Jj95K5tI73RzzNCC7nFCKCMDHQQ6ccmPpp3?=
 =?us-ascii?Q?SJalY3Pz6Z3BkgvAEpYflStsAqRYF14g3L5+7LClmy1BlZj2TDAU4VJthV5+?=
 =?us-ascii?Q?10mdxKSm7A7rA5p8p7UeWQtECdjiBQJh5XWa4Duq7DGTpOF9WRAX4ciqZSAc?=
 =?us-ascii?Q?W5fQOxAsrc4E2drSgs5gNZP8a3D1F/vJFdlXPQ5WMxsGgQqEn0662qAA+uEh?=
 =?us-ascii?Q?J67jSQTbPf6qkp61N9nKTBpuPF42LeYpp6jqDnMGrFMtwqpHrk3rqL7InmNw?=
 =?us-ascii?Q?ZUfW/wt//cctq7nAOFJ3+kCFnH3oCCIBJyDZwz/Zw+BJbUBCeFGXj7VL1wMB?=
 =?us-ascii?Q?U9MJ4YQZJ4nvJ3as27VcQLv0YS4RuNdZX85D9ZuPXEP1RcN3nexnvHKj9D60?=
 =?us-ascii?Q?vg5Z69QgGY9uiTo+MNLRhKyOd3RXV2OSKf5DljgzurhoNmGNPc7ZOCZxG8+J?=
 =?us-ascii?Q?NqTR4M6cH+BbZhIJjbNVqD3Pad/Z5cbSxIbTrhyhHTYRKx5D+SDzrtuSG+LA?=
 =?us-ascii?Q?oeaBPp7xmuIaaOJyiveMChbtMb7wr/o44aF4Nvq4073pcZDETMKKpLWX2OcX?=
 =?us-ascii?Q?KxxKOP3J+0W8n3gSeQvohrM93t6t71IHGVEbE4pmmSMLsd0Uuduzpfljp60O?=
 =?us-ascii?Q?Ep50XXZfq/pBtLgwpgEoCV+YEoQiYIvck9HLj29z1f0tAy7aYPoNO8cB2z9o?=
 =?us-ascii?Q?OTSTnJSGMR2OXx2owCAlWCdzrlOHNwJsquQKevZlZrAVMAnXKVk+CrdSKw6v?=
 =?us-ascii?Q?D3iL9Hd6Oat6zM3rkqgqPJJWL8mDoygCeAlHIM6JyZyBO/DKuBnPrR7aEvR1?=
 =?us-ascii?Q?6CZCIur+YKOZNfLbifgIJzdeNM1ut0eNGPJcsQ5Vr/7xTt4D09TZRfqPlFKX?=
 =?us-ascii?Q?bji6oHo/lv4IUG4C6WrvTDdFV2ypDMEqpWGygQD9meMfBHn6ldOyRPQdXD9/?=
 =?us-ascii?Q?pohUGHegzi8p/jf0hMzwog8hkX4MCs18nr90iex6bQ+3Q+8klBlU1a3JzacT?=
 =?us-ascii?Q?iUawB87tMGarxkw2aa5fujTBMVZwH20FkDGoywC6haG0KA8m9MavjEhyvPcy?=
 =?us-ascii?Q?Y7OYIkyTvfJNKs01AwpXDwjCmxoWSWgEyvb4Fome6gIx39WYyJgJWR7pgNKa?=
 =?us-ascii?Q?+yyvNOJ3NoRPBsDN/eyFRxD/xh0z/fXg+JdLjH2AQmnKD4xzS3D+ms1RKzSG?=
 =?us-ascii?Q?rWOqypDvsgKHadw7u3M4WBRARmFmgmwU8lUShzXmLnomGvKQrek7MZ4aYeq7?=
 =?us-ascii?Q?sSNNHsKpWbYTP4I9YYai3bAE+BhwxVBVQC7SkLTyGW8sCunBZ9rVCymj9g4N?=
 =?us-ascii?Q?5S4PGFTWmqtDFJ3TSxuXpU2LUrrHAuUk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mRQ+zf4qHvtovfFRodDkxFwOxcit8Dc3QBC3eo2BQ1F/FyXK4D/1iX2u0OhC?=
 =?us-ascii?Q?zAmmB8UdwTEwZpOKJWf1IivQtsULB5wlmNcLcRG+5vwtYCLwVUAmB2wAMezN?=
 =?us-ascii?Q?M+D7+doJbAk3cZaj1Cpy2tjEQJCX2UHiq0lsRZ1BJZsKiVdBZWK/vxkbATdi?=
 =?us-ascii?Q?YJd5oHrWFutebjBXba1/tfUFnE+UaYv+fo9pcu4OEXrd+j41JSiG9/PJFp7W?=
 =?us-ascii?Q?Py/EcCleTYFEYAc2TtNUHRawbGhZnrwlS0r4AlNp2QvbFOl/+8NXLCOTB6Nn?=
 =?us-ascii?Q?IgVG3716FwWPfz+iMlm4/GJWg9i+ph2RWSwvn4b9+i90uCBi873eWwJewTzL?=
 =?us-ascii?Q?C2GxeXz6sC5cwdhHYdvyVLBJ1hC9loSk5i4IPoagWSZNGveja+tP7I76mMEe?=
 =?us-ascii?Q?vt+1ez+a8Zueyw3nANS3U6XsjKz56bJF/5FK26/fNa1/P8TY63KNipBS9J8t?=
 =?us-ascii?Q?e19x23WzwMdKHN9zTvqvotuz/zRIxDZtZrFdNpesnTjM5VMBUthKO/ikGVL6?=
 =?us-ascii?Q?MLFxOEwAzqw9krpw+oGwJdQ50fRTNhT1lZNzaCfhZGtwxJhq2OHNJDLYvJKn?=
 =?us-ascii?Q?+oAYwh3CH6JYhWGwknybAHNDsWy3mQebk31zVJl0sUYwMApoOTIFflqWLNZ1?=
 =?us-ascii?Q?owPSrZ5O3luGvrTmHr5a9TZdByYVDYyyaoKxcyLMlVg0zunyNZZ/PjLb/V2n?=
 =?us-ascii?Q?Zv+gGxvFAxLSgiBUsc4j+Mth9jaaxhvaacbap/EtUvB/bnbg/W2bKJtFbEBY?=
 =?us-ascii?Q?yJkt/BeOoE86TmLNhiFCqysigQBzfXWhWoD1R9p52thHKwLoi0gBwUmHNoMm?=
 =?us-ascii?Q?zGcbuSnFrZ0H5xTXRjvlYAA+twjJbTsD/NfHzYqJhKWAY9IrcodMq5C31UGY?=
 =?us-ascii?Q?nsp+FKqjxvWL7Z2htxZPp/6naoyAi2xBO73RZ4bksmq7gQfNALnIEfbJo6Yw?=
 =?us-ascii?Q?8AWHfLVq5EMLriL8K5LViHQiGXKGT0Oq4qCof7rpNc4OBf38GafR3EKsBtZR?=
 =?us-ascii?Q?zl2Ep1+DzxR32b6BPYwKZdFGPVuXe0EwtTFv4yCKpqNQmo8THpM+aRM5PCXb?=
 =?us-ascii?Q?PxgNTqjlDU1MuzDkl+mW125KHVGUjBHbEnQ04fwNR7NEflOgw2OcMr0JXz5c?=
 =?us-ascii?Q?59FXa21sfNSbvh1yWfdTz+I+TFo7XKsReZlVVaRrvJC42c/Noq6tvU+SIBtn?=
 =?us-ascii?Q?ha5dUNHGPcFFPdD07kgJ2Hi48D1FO2phb89Pgg5lG6BPJR5Il1zNrPcW4xkm?=
 =?us-ascii?Q?6uaZUyuFMiUviRy2nF4jTeqDgDTABFItxoTzjKYZ2W+jgVwz0gopblJcRs0v?=
 =?us-ascii?Q?oli/yRHnhDvw+tTINQATQrnqc9fr0RBDJErgDzmtyASRUL+vRcwQrdCyjRL2?=
 =?us-ascii?Q?DoCy3w6xI92KxzOHzDZgpzLQOlIDwNr7b4rWbQnfcNBcbPjJ+oLoxwQr0008?=
 =?us-ascii?Q?PnWSudEsIx3Gg5qJOkq/peqVtj8Oomjr8ZkqgsP5GyaL0iVnfe0laP5dIGcU?=
 =?us-ascii?Q?LhJLX3KUqbxiN9lYvsRhyQxHvZZdORb4q7UmqgnSiwQwGb8i3yNB0w+ZPJgk?=
 =?us-ascii?Q?poze+mO4LIrEPWysJpmJY2OXrxTFdDwZ0UTpRNaab9+otAtTJ6FSaFDfHjtn?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ee439b-076d-4103-8d44-08de0a9d5913
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 21:13:25.6864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w62VWrF5eVClAa5oH865pQexFLBt+yVWjviqNPNG4Osfq0zS7xFoVddT/71hnJ8TMkswPys+kvMN2uMKaGxe9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6531
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

On Fri, Sep 26, 2025 at 08:09:19PM +0000, Jonathan Cavitt wrote:
> Static analysis reveals the following issue:
> xe_device_get_gt is theoretically able to return NULL in some cases, but
> several use cases don't check the return value before performing a
> dereference, resulting in a NULL pointer dereference.
> 
> Add guards against this in xe_sriov_vf.c:
> - Use xe_root_mmio_gt instead of xe_device_get_gt for the gt id 0 case.
> - Assert the return value of xe_device_get_gt when this is not possible.
> 
> v2: Use xe_assert in vf_post_migration_recovery (Michal)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index cdd9f8e78b2a..2c9cef191826 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -178,7 +178,7 @@ static void vf_migration_init_early(struct xe_device *xe)
>  	if (!IS_DGFX(xe)) {
>  		struct xe_uc_fw_version guc_version;
>  
> -		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
> +		xe_gt_sriov_vf_guc_versions(xe_root_mmio_gt(xe), NULL, &guc_version);
>  		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
>  			return vf_disable_migration(xe,
>  						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> @@ -361,6 +361,8 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
>  		struct xe_gt *gt = xe_device_get_gt(xe, id);
>  
> +		xe_assert(xe, gt);

I really have my doubts if the tool will understand this or you will end up
anyway having to mark that as false positive.

Let's just mark as false positive in the tool and move on.

> +
>  		err = gt_vf_post_migration_fixups(gt);
>  		if (err)
>  			goto fail;
> -- 
> 2.43.0
> 
