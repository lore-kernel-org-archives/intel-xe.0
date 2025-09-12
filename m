Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B39CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 13:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD72E10EC45;
	Fri, 12 Sep 2025 13:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OA3O8pQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F1A10EC45
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757684117; x=1789220117;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7r1pcvM9lTLFxMZ8YkenC9X4wfVLu6eu57wtp5IRKtA=;
 b=OA3O8pQ4DfKJNjG/ISd4k+fzHqWweKe8m+Kpkyew3i2uOEItY8cvkR1N
 N4IicpUaztNczzo/Ws5oMNx2BpWn8/jdaGeSEDPo/C7pNz6HOiAok42bp
 AMRzd+XlqAPgfAX3LM+/eRofwgSAD6L2HYP+YzS30UmxCkjSyS+geUPW/
 S4bvQ0CtOjPq+K14Dti/2IWz8OQQvIIRky9tDV03dHyUJV4zVHVJ6YZ5a
 WJdZ2e3nI+9LubITUIvalxtjUDhciiHZRTUjU1Z6z1V9PzUqhncQLYVRA
 G04kE0sKIkkmNdp+3brlOMkC1phjSzX2ziVS3+KbCtC0eq4c9NcLxr6GW w==;
X-CSE-ConnectionGUID: aAoHIf/uRuGoXhloIY6URA==
X-CSE-MsgGUID: K5VAqljlQmStt5WkB84zgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="71402453"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="71402453"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 06:35:17 -0700
X-CSE-ConnectionGUID: 1W84ynjqS2aPf0fT1Mlkhg==
X-CSE-MsgGUID: uTULkuy/TdyVeTGtKWclcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173512238"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 06:35:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 06:34:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 06:34:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.49)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 06:34:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTx37UU98FoBM5ojJbdm/r9unOmDenrYTrW3mbuyWifSAQTpBTiP9FNrzDI8XQhwrOern6w8daAQWkfsfvEcS/0+3IR9gRuL74IGNcrF4evEVjPw5oy5JM4dTWyZ3Z66xwUmUnXC55blT0LnsV7F3NtXzds/cHJPQ7SJEyFTxpT8IQ1vJVcOSjnv6jP9r1kMvn/9enOrXgmpJiT4CIN/5gEPhGLeLotquojn4L4qB0ssD+3CZwOrCjeqn0fhEdiN08Snd3GfsfWhyAPSCxpvaAo2yrgcP4eptV97jYPtZvEQAnKAvO2CDbr9ln0KL773iwOeunjNCvTrdW38/KCmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7r1pcvM9lTLFxMZ8YkenC9X4wfVLu6eu57wtp5IRKtA=;
 b=RICBGKqjPJ3ufS1szIfTmqVLB6Y4IhryF0tLOjBcncEpu1wDSE59L1Qa680c1QwsTZqD/ODRCoUvqUDAV5H0M/O0fNh4wGJDy+pStimNaf3jhh9x+nHCXrIjrpZ7EJnTy+fr4B3Ky7VkxGRX5Trgms4xuzOwWydozUeUaND//3EdwXNE7YBMlIutjD2I/LDwPVjv3ECRTFyr+osEcDuK6kxGSirfcM01Eopydu/Y38jdwNxo6aeWjiE/j4BPha6073vwPWhvQOJaPDLHbF9QR/fKolxJRseLaVxHsRUHkLJDbKnT/Sam/jG5UjGYSZLq6pvuVakRPde8Q8JxKs7Yhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 13:34:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.017; Fri, 12 Sep 2025
 13:34:36 +0000
Date: Fri, 12 Sep 2025 08:34:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
Subject: Re: [v5] drm/xe/hwmon: Remove type casting
Message-ID: <otmdb4s3in6cyjq4micgr3iihgbla54bm654as43rsl6zlp5oo@lk26vwvfm3hi>
References: <20250912113458.2815172-1-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250912113458.2815172-1-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: BYAPR08CA0004.namprd08.prod.outlook.com
 (2603:10b6:a03:100::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb8b704-fb8d-4278-50cf-08ddf2011dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bC6KbLy5pS0H65gI1X4+zX2p/yNk/HT88gQ2Hui2Btp1igCmiZAHu8oTAgna?=
 =?us-ascii?Q?q1etfdGXUM2KuiYh7EoA13pnEP+67kCc1tvAkpd8nN44aOiZCAPmlH3LskSK?=
 =?us-ascii?Q?vQzISsoIbmkDeU/SjGEIM0YyJ9Pp93t3iBs/+jXXX9JaKLq8aD54QsCCt16r?=
 =?us-ascii?Q?7yBoRcN5Wg0o6bola8JgzAsP2H0qridnkqZZMcYmCtqdP4jojzpZuJjag5Da?=
 =?us-ascii?Q?8zxkyZM0lydDuk24Q0SqdWpyfh/Sus4HKwDb8wDgAiwJLxScUs0gE0FNbf3G?=
 =?us-ascii?Q?Ux2qCVtwgXWU2el7SsTSwsW7akIUA+5KhZgr5qqhcscUfIODLGRqZh01IaJ2?=
 =?us-ascii?Q?DXWS4bmlopXWlSlh9f/x8kUxeIWVi+AWbeKOY2viPXNz2JheAogyCsQk+DQ0?=
 =?us-ascii?Q?fTP2leLvO3k5178zeLlnO/viiU/NZZztMTKjfztyBGGHjjndHosqYoeovEP2?=
 =?us-ascii?Q?gyCqXdxNzdT1y6MhxBYaUD4ulM1Pz+o/VeXs8oMfR385L3zUbtmT+dbVIeX6?=
 =?us-ascii?Q?izVs95Ye80E2sra6x44dRNtNybQ5rGWs8IxTYd+R8tnw81sukMKbMWYfYDCG?=
 =?us-ascii?Q?glydM/X6FaQ+k3frZQgapStpwZ6nF7OiDdecTdRwfFPQk53azzV/lufXiLJ3?=
 =?us-ascii?Q?bWR3pw0KuO783cWw3gKyrULDE/d7R8IO2nQ/cNOqctQu9FMMTWeKSDAk5vx0?=
 =?us-ascii?Q?axrCm7l1kYDf1Obe6msHVFqPZC5Oee9KbJWhnLJN6TQXiIP3ButWxImIzRtp?=
 =?us-ascii?Q?IFWAzWs8jt29UP+kzrXyDM9GccDXP5vxgPH0qphxqGLClujKiUda4bvZaMNF?=
 =?us-ascii?Q?yb4QSXo6a0QygdRi2bVqzdCkiF612yMRXuyROmqUC3t8s9KRLeHYXEf3CNFS?=
 =?us-ascii?Q?jyhI0MZg5mKnjAuDj8HP5ePbKPF+miH5nCG2Vz0C8N+IvIOzaoeYiljtM+Cz?=
 =?us-ascii?Q?Q+lV8AR7n44+eSV3WY1gobB5CZRLlKx6/HfibLd3ZMGNkEFeMXTZ58LQuHvE?=
 =?us-ascii?Q?vYXM+lbE8xnIMqS0iuoE/8mk2XXh3WboXBMPJ+B/BD/u/V/QOl+/HUnNzq72?=
 =?us-ascii?Q?bx16+URUwc59Rh27dvoPDMZXdCny8nytoPMwFXwmGQN0+yKraY0OAbpspcOw?=
 =?us-ascii?Q?R1opk4Yi1EQ5qZU8JrFxU00NL/JWSZm7HznTaya89C/t4pRio7JxlhTXLONt?=
 =?us-ascii?Q?q0wOXX7W7YZUxF7m+7gKyYg6AV+AwSc8Pi6S3viRQAcdcCtYYriDNJ/C078s?=
 =?us-ascii?Q?DKGrUaVSnqcPfAFBIHZFxBkX/ZhjwTx668Hcyf5MIss+yEw+X0Roi7wtFY/m?=
 =?us-ascii?Q?ZF/jg7jH6PuIyYU9hDxZOHQdLx0vL12oNuBeJmNhf61PmI5551h/aJKNaoBE?=
 =?us-ascii?Q?y4GCStOHo7xIH/jacXHbcR04dQR1oivKZQavxNGpS1VlLLGqlNYsHyShjAht?=
 =?us-ascii?Q?Th++3Fp/pV0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DwkMjlA3ywmC1V3wdvX+hlb57XD1o4G9Lap4h/E4BWglGdlwOOxIVKDk+YKz?=
 =?us-ascii?Q?+tfKuEooO/swAyjgc2zP1iW3KoHXWA8z++m1JfDUCdanqoXIuqpBJWXpD5M/?=
 =?us-ascii?Q?+vmJ3HI7mIzkVl3XBILY0LC5IHGWno+9yycBnO9360lO85GEcVmUhIjlc9XG?=
 =?us-ascii?Q?clEF60jKRAt7IM2O41gQoO+caHKmOw2VvO8B3tFGyA/hhcFm8mPZdCRs0iee?=
 =?us-ascii?Q?QQkp6tvsku/EEPuVVXzRbsKlTfEba33cQN4zNCji2lBGadCxwsjIyGATld1E?=
 =?us-ascii?Q?V5ihWfeExsCybX9jZj1VC+/m4k/8noUsVzflDA+ITil+EmnQvA+6mSZDXElb?=
 =?us-ascii?Q?Ll/CqBDpmnJrP+DuCm7ycsz9lt+uk1RMYg7jm/SMRVtoAh65a0Q3kM2HD7hS?=
 =?us-ascii?Q?kTUJ1R8CyCypt7Bm4bv4xj9NyGbUHnvMYGlW9yWJpuqb5dCiY91+8BvucKQO?=
 =?us-ascii?Q?BWRhtvCW7+20T6mfGFOG7QMcvm0TSEHds3+o+98ShyIdR+GHxG2VEoUf+vL2?=
 =?us-ascii?Q?29VPxDBSSdM3vChrDnjfdqDVewIRMmn3Hk7qXvaCXq3paRAaiCDHDixL4Oly?=
 =?us-ascii?Q?/+qw+N2y4Yc5ZLWyx/f8xr2tQInzMXvmfQPKcnxrnixh/8sZ+aH5rgip8B68?=
 =?us-ascii?Q?iaRsKscbYgn2LNDtBNmApVkZe8wBHP5bF/91YYZunWR2tj5Bd0igKczzx6PS?=
 =?us-ascii?Q?pD4AmoH53rfP/RdHWLCg0aCcri6n+yA/pdPg+vivSUmfxczE0nE2NwwCEcCB?=
 =?us-ascii?Q?wf4m3X+2fA6TvDxeKTEAg0Ipu2ya0qBB5K39IYsPQCHvAfGt63KiygZde9f5?=
 =?us-ascii?Q?rg4LAs4oDgYA+t3BG7gaWfeRqcyI95a2PoUvDD46/A13IsYZ392d18sX+IM6?=
 =?us-ascii?Q?SOjK+e2dNI3a4N5BnDipC74BTp6bKGZA6UWwaXCRkkAp/rcyPNkhq73pzAcn?=
 =?us-ascii?Q?4ACKcpjcmFkPJMcSphIUJaNJFh3aFnFsL8xrHwINBM+RvL3YOPpYu84bp9b2?=
 =?us-ascii?Q?fusoKWmYAHKtfuXK1EWcTBDPRH9QWrM1UlfkEG4b+1OcipsNtTySlzUT1NpY?=
 =?us-ascii?Q?5iTk8YrV2Ps1lOn18+VbXh91+OD4SQGAkmFGbM8oOSXsG8QeJ2ORqu1kLigY?=
 =?us-ascii?Q?NGtXwqxV/w4csdkWxLZ2SFwFJfh5c8TSvVHWIZhBHK0VpsVT1UyjOwWyTxGY?=
 =?us-ascii?Q?aISTFVsgJ/brz0lP75fisOQKyt4h1kbDcNayUQ9/S73pEah8dNXCsdVf/NKu?=
 =?us-ascii?Q?a6pw76k1zh+aChjl6g4LlCETjv1IhXweJqh7y2A9kp01+R/8zMfIYlfAr4vb?=
 =?us-ascii?Q?TlM+m05d095QE3PU1oO7Q9iJ/fnSFwAUzy25W3c+hNgln8r9uWz4aXoGVNTL?=
 =?us-ascii?Q?oeO+CMnVgRSVBZDcuB+DwtZLwJ9qQybUVMCDDju0AtuAkVmoBQI68tv0zLiA?=
 =?us-ascii?Q?ZuXSKeBdOdfGlvsLkEpLonEkhL5RlNb/E5uAi9+saq/o8w+NOCBrZCnm4729?=
 =?us-ascii?Q?5kMEtSwv61vOSRcPVD+Y51csK5NDdwdJ4WQYIoOSOaagbvK/UEdDyaARStiE?=
 =?us-ascii?Q?+y7f1yXxIULvHNnGJI9YIQWUtD0/IUn1+jAOXiKERNFe34KTNBZ/pGl8x7ME?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb8b704-fb8d-4278-50cf-08ddf2011dc8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 13:34:36.6585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/BKK4iNwgTuQJRnC+hWRkX0Q1LOQL2+YNMw+/HETCqcd94I4tW2VceXhSH4T44UvikoCanuEYz2KlQjb8EFB1NlkYXG/Twfyf8OFXklOBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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

On Fri, Sep 12, 2025 at 05:04:58PM +0530, mallesh.koujalagi@intel.com wrote:
>From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
>Refactor: eliminate type casts by using proper u32
>declarations.
>
>v2:
>- Address review comments. (Karthik)
>
>v3:
>- Use the proper u32 type and drop cast. (Lucas De Marchi)
>- Modify variable when actually using u64 value.
>- Change r value to reg_value with u32 type.
>
>v4:
>- Remove newline between trailer and Signed-off-by. (Lucas De Marchi)
>- Change reg_val to val for more user-friendly logging.
>- Use mul_u32_u32 function since both values are u32.
>
>v5:
>- mul_u32_u32 function with shift. (Lucas De Marchi)
>
>Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
>Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
