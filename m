Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81345C3DA7F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 08:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9D110E2C4;
	Fri, 26 Jul 2024 08:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYapvl9E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB4010E2C4
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 08:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721982290; x=1753518290;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F7H2YwCoJ/TIHx7rYKk3y7k0j+LKG23nPwHSCtX5YkM=;
 b=dYapvl9EzbHMgfHAlyq08vAoeI/7PHhDXRVK6hCvFQC57WiEx4apSy4H
 92NLWp29CssTWL51/fB1w+HC4HuOnh670UUk0A/ptC6r1QGA4QdNqGj2i
 IL7TXz8e62wsSmscQg4icz+/toZnYGw701sjV/TAP7WxcgCTDnope8W4I
 8wF7u0XvHz0qfC39bVttk8E7dYxGtuYajmzX99yxmfina1zWn4AtRoiut
 qzuxC+RpZxKiuYXaqMgPXHDQUz/Ks094dPKfft2GkJsYfS6uwQxwx4J3r
 Te/JLNpzUvtqwi+S3evOtfQznohWMZsj35KqpW6rjsWTf5GM14ktTtZW2 A==;
X-CSE-ConnectionGUID: jI6DDOjLQQK78cTigRK7Bw==
X-CSE-MsgGUID: EAmuquhrSk+2BpgOvKBxJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="12728166"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="12728166"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 01:24:49 -0700
X-CSE-ConnectionGUID: whjFywwqR9GxvgYx4RxobA==
X-CSE-MsgGUID: X1DvlG97QC+aY5bkYh8jJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57986710"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 01:24:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 01:24:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 01:24:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 01:24:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 01:24:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJ5LweMqe5v0UU+1nGR+Be54kb3cB5VGbVdrvEnw5jLnWagScQpvF9eEepWKo3N/iyHyffEPB5eDA7P8Mc07GOcdYIvua2MUeaObbbJWPrVWexGsTey5FXZoBbmA5u0Wpp5eRFaX3eSh3cruIKCDBGiHZHn7/bh/HDa7a50FVfY2n0iyI6PVwZuPgz5sxcBDkuLWlYQRPy3VvEkMqvL4oDmJtTjtCRL1P3UoJxC/iqxgEV7eNTsx8Z2Pm+gbz9AU6q6X2slaPz0Pb7/8f/RILzAW8Wu23QK9eWUzM1+fpHcYS/250t3BeaB7UzwQJFMENIK8CAbicctneCuCyhdxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0b6oNZUK4wiXOYjDkd6gUUg/QAYwgb3FSE7ZgfIgZ8=;
 b=Tda1uF1Rn2PbtXoEvNdUpWC/jZHUADpKY3kxMA9pT0wAwQGF5C7pU6UcZpLIt1bqQC05fgvgOZkyYyet/m1vPqFAvs4/1Dme3xR16eno6w34gog7r0/Cls/NSLxmPmW8o8AbIhyN0CGnoZrKqG6npHmTMmF3nS8QxeUvQjtGGqIabV/ZFK9xkhNikLJZDfDzS0+/RW+IXjRHIAXPXxiLSUv0zcLAR5bJHLxYtHzcZOt3jbcBLMLuOV00aopQerj8jRJpIYXtR4qbUqdn07U6UzsCBK9vBSdOoBlqe548q+vNW5NCLA2VBZy1h1rVJTk/X5Y8IWiCv68IEFPivGhVYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Fri, 26 Jul
 2024 08:24:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 08:24:45 +0000
Date: Fri, 26 Jul 2024 03:24:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Azhar Shaikh <azhar.shaikh@intel.com>
CC: <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Remove unused variable
Message-ID: <gtdsbzt3pclko6rigyrbrcr7ml4bw6uorg7wxlbw7iu3ek5nxh@hptf5gja6rvc>
References: <20240725214804.31650-1-azhar.shaikh@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240725214804.31650-1-azhar.shaikh@intel.com>
X-ClientProxiedBy: MW4PR04CA0131.namprd04.prod.outlook.com
 (2603:10b6:303:84::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 847eb485-afa0-4f06-8f53-08dcad4c6806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fufei5vKVDduaQQ1MvZg9D0Cs8zXlyPGDJL6K62CrzNBl7YsCGZu79/Uly6d?=
 =?us-ascii?Q?XTtC+n/uu8xxdzmIcDThktNOgpu3G9JDWCuTa6seyskn19dNWmF6hr1utVll?=
 =?us-ascii?Q?ldU9Sz8NO5k9LArEhPl5GLxOTqrMqrRkVxPqNHmy6+8Bi8kHxLLkS/IinA3C?=
 =?us-ascii?Q?2bcYJk+2+Xnnr6tFC/pH7w6CWGNEV0gC/lJxJttpe9eCEX507RoK4qMGQO/m?=
 =?us-ascii?Q?udI36iNiDot0SX6plpZyPskyKy/HU1mrSluT+g21OQCIUkVqdEuRRrZMaFYt?=
 =?us-ascii?Q?a5nS/HrIqhJcO/4MMHMAxKDtc15OBNwNDRrxhFqfuGkbxURiuknX4jhZXAqH?=
 =?us-ascii?Q?usLWRoOm1OxNGamvezuDUTaZ814EQ6yTspmJLSDFQHQWKADe+oW63aNiQTrG?=
 =?us-ascii?Q?HQKBALIhDHzyaUzziQEKOeSnuYf2QopRDNyACwJvTzXWF+erh0mvU0+gjwb8?=
 =?us-ascii?Q?mjKYkv/j6VoCsQsymPYAuC+BDc4tozHKSJnWKrLz21JYu5gLefaaIs8sZzk/?=
 =?us-ascii?Q?9SeaSqZ6lG/ukrEu7Zb1X2147y2o/RGzKJ+vt4kOEuJjzCmDzblMrWOZJPmW?=
 =?us-ascii?Q?IrS/zx4DgrSaIf5LJnv6m49nlza9IWapAlR0nWKGzwvc01UJhscpMkiTTvoZ?=
 =?us-ascii?Q?tderpcq0AmfgqconckxSiCIVBxaVtBgKmtujAi/ZQX5pnqUNaVhlu+kYXQ3y?=
 =?us-ascii?Q?esygRhkI8uTjBBj32ddcHJKVWxKCNkeAJNnO5OMXJUOaPW2bptrIsJyOp569?=
 =?us-ascii?Q?916+AO0fKtzTUqRr8Nevoa+05ev7rtr/Jpwq3aPNOlUVL+cZ2lhRA+ADeY+X?=
 =?us-ascii?Q?rc3czL11WjK2D/J3y/8zP90iSzMOKrfXKhiOfjIc8QzvHf8wU60plEmDQaGD?=
 =?us-ascii?Q?xuW2NmpuScaf1vbBM1x2+SJdDtDrGhHhLr4qubpakZA3vYYMk2uve0vaurF9?=
 =?us-ascii?Q?Xqs69tTsAudycGypqY4MOgoAahNLTXhYEFn3U/UpZTlumdadXAv02CG/01fo?=
 =?us-ascii?Q?XqNWaHBnbL5A569NhQHtOqIL0ZzmMJLkPapTM48tx75CMvTybjEe01biNII4?=
 =?us-ascii?Q?Zsybc2S5XOV/DXt2OMQ9xg01YDHPRbz3Vpg7WeFiXzUSaXbbSibF+FAEEq3G?=
 =?us-ascii?Q?k2SZkwu5i8s7DWIBnmaH6489Yt6i16EZIbxHetAatFKclho1Z37l4zeLswRM?=
 =?us-ascii?Q?0/eVIBZOJAEtpTxz8eLMnToIIzOHYCTYZDRO+LSmElD+DgUspqnfv1zYnXtf?=
 =?us-ascii?Q?8yHu9YxVIGbF4DT0a2wZkJv8q5vPu3QBNpfqSrKTNlydixb7tqjksnOtgq5p?=
 =?us-ascii?Q?VSn9uaVpFJky6v6ygL7Rw85y/zrBcJFTbhWYBHyWhUn7ew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YN9pUS1fdymekRz4omhZNH+saQb6EA2ee8ddGwWhfKVmQk/9F/TVgdVb35MI?=
 =?us-ascii?Q?lnHjUxEOe/MAlaj1hGJ55BY/TZD2PHtY1ltdTxxY96gL1OV+zqzhH+GI8r9Y?=
 =?us-ascii?Q?jnYP+IhqqSOBGBybI2fIq93colBauCBXcZH2h+FBcq68IDBBeE+BCQewrDP0?=
 =?us-ascii?Q?fMh8i8rogQqX6eMMhN9aBVgoZrJb6Wv3LXi9yjOBJ02iNz8qtMGPQScfVsmZ?=
 =?us-ascii?Q?X5ADwThw7fZk5ogcKolAKPDib5UFYwOk/gQJUGVyYpguZKrY8yZoihKAtal4?=
 =?us-ascii?Q?pUE7gjP1ZB8xkU9UkIJUBQxby8pqVxjb0IvpwDL5zOf7ayh5Q0wtZ6hmPW8T?=
 =?us-ascii?Q?Jbv3TAujlRDpUH7cLyvTzfvvc1rW7198YtFuKyVB+dqXfSWlclOkkJ5nIzBg?=
 =?us-ascii?Q?q2asz8vqbjIPcHOYDHm4UcEcsXCRyR4eDm9axeTOxoQdQsUfeSnswOqAbJta?=
 =?us-ascii?Q?/UXgOMGOPQo0YZEaqmA7Nyaay4xr/RUC4a+vQIF++sB2vQzUUXcYMww2Q2t4?=
 =?us-ascii?Q?IZ+IZVUBTB+5xexXmDvMkeRyOQBiLNwUId1n6VHfSqH2qKsYammHI/ABOf7S?=
 =?us-ascii?Q?XDB0wLCB6JLBSudXlCau/gteV2/HLjyzH3NzNzRVbZw7hd5b6LtrY8BY8ijN?=
 =?us-ascii?Q?SdqlOPzf75PTAga4Z6uoQdOp906iGMN85PDPj5pY5tT+O4/UBu3d9BsorSif?=
 =?us-ascii?Q?fIhN1zFRul3ctTex0qiwhi+3rj5KLN1GbWjVLZo74TRf+fViMrazBV/f/zof?=
 =?us-ascii?Q?t9+9YWaTgwSlHAPfbULya6Bl+GRBNqy6lPGvtWUrxbgQ4j3cmWqG6HFys2PL?=
 =?us-ascii?Q?nYFAT9BW/1062qS+TdhLXo8PcUfuBU7C5eqUDNjlE3AbgVV2CEvfO/0l0jFI?=
 =?us-ascii?Q?bXjpOXlZqfRDFt8okXG8joRskSOKZKnLylBM8gCETbhBuu2H/HyefE3ReCVv?=
 =?us-ascii?Q?/70wzEteLYwg2ET1veUcL12T6Wy9ZLGf6lASGYzYz6JjM71CRcpeEzU9cmcg?=
 =?us-ascii?Q?Ip599Aqr5d9eZCpV2ihriKZc3vvzI/4Ky3Cz3EHcVYSWeIf+0tFHddzCanNe?=
 =?us-ascii?Q?m4gMesW3CpNIu2R2LMbUw7oqXiiuyRHMvVUmEFHZ7qye6Nulr1TDYNxd7DG8?=
 =?us-ascii?Q?iRBHrco6Fp/nfM20nCqK1/mcmN6je0Uxr/ZunvE3oyvkdAcWK75emHCUfwQa?=
 =?us-ascii?Q?jyRO11z5vSMa5T+PcYE5L8GOvPjLiO6NoHWxBsTlnmE0H1K2wXZlbwTHL1qz?=
 =?us-ascii?Q?z7aYHPfc+bTMgRghchCNN48oMcftsG92/RDUxJGtaIPb/ePEMiMNRJr9a4q9?=
 =?us-ascii?Q?9aKqbFz9Ht8OhxFt9krIH/I7gsU1uowCxcLGi9s3zGfCbLuPc3bUx7FKevCm?=
 =?us-ascii?Q?Ij2XeriB/9GBGOTLPwg2e8wB4HNpcNfasu/CEnElnFdf0DOmVuC14I9bbqhx?=
 =?us-ascii?Q?xuZkJaGPd+X07XXcTjbxP/iX4CtQiZnHewhhYlU+52tKL8a4Qz9wM7pOGV5d?=
 =?us-ascii?Q?wdD/QI4cqOInumCWF0YDPvVIFRc/z6auZbxTLrd51/Sd6ys3UieNCBu7spLA?=
 =?us-ascii?Q?KR586aPCvtupimDPrVB++9y/Mu3c+sWox19noCFoWSfyEy7h/MShN0utnf3E?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 847eb485-afa0-4f06-8f53-08dcad4c6806
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 08:24:45.6729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wo2C0qTB6qFzplUf1AP7MZ7hfHs33bZVWpT3N3/ocZ2mDg3AD1dsQ9Q5AOYbrRGiTCWjf9PZzOSSEkC0YZ7pK17OFHJjcNIXRdfhN4RZDKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
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

On Thu, Jul 25, 2024 at 02:48:04PM GMT, Azhar Shaikh wrote:
>pde_encode_pat_index() and pte_encode_pat_index() no
>longer use the 'xe' parameter. Remove this parameter
>from these functions and also clean up all other places in
>the file where these functions are called.
>
>Signed-off-by: Azhar Shaikh <azhar.shaikh@intel.com>

for reference, AFAICS this is a cleanup after commit
e814389ff180 ("drm/xe: directly use pat_index for pte_encode").

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_vm.c | 17 ++++++-----------
> 1 file changed, 6 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 12d43c35978c..1b66d27ad7c3 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1191,7 +1191,7 @@ static const struct drm_gpuvm_ops gpuvm_ops = {
> 	.vm_free = xe_vm_free,
> };
>
>-static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
>+static u64 pde_encode_pat_index(u16 pat_index)
> {
> 	u64 pte = 0;
>
>@@ -1204,8 +1204,7 @@ static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
> 	return pte;
> }
>
>-static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index,
>-				u32 pt_level)
>+static u64 pte_encode_pat_index(u16 pat_index, u32 pt_level)
> {
> 	u64 pte = 0;
>
>@@ -1246,12 +1245,11 @@ static u64 pte_encode_ps(u32 pt_level)
> static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
> 			      const u16 pat_index)
> {
>-	struct xe_device *xe = xe_bo_device(bo);
> 	u64 pde;
>
> 	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>-	pde |= pde_encode_pat_index(xe, pat_index);
>+	pde |= pde_encode_pat_index(pat_index);
>
> 	return pde;
> }
>@@ -1259,12 +1257,11 @@ static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
> static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> 			      u16 pat_index, u32 pt_level)
> {
>-	struct xe_device *xe = xe_bo_device(bo);
> 	u64 pte;
>
> 	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>-	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
>+	pte |= pte_encode_pat_index(pat_index, pt_level);
> 	pte |= pte_encode_ps(pt_level);
>
> 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>@@ -1276,14 +1273,12 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
> 			       u16 pat_index, u32 pt_level)
> {
>-	struct xe_device *xe = xe_vma_vm(vma)->xe;
>-
> 	pte |= XE_PAGE_PRESENT;
>
> 	if (likely(!xe_vma_read_only(vma)))
> 		pte |= XE_PAGE_RW;
>
>-	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
>+	pte |= pte_encode_pat_index(pat_index, pt_level);
> 	pte |= pte_encode_ps(pt_level);
>
> 	if (unlikely(xe_vma_is_null(vma)))
>@@ -1303,7 +1298,7 @@ static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
>
> 	pte = addr;
> 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>-	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
>+	pte |= pte_encode_pat_index(pat_index, pt_level);
> 	pte |= pte_encode_ps(pt_level);
>
> 	if (devmem)
>-- 
>2.34.1
>
