Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043D0CC6B2F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 16:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD5B10E14D;
	Wed, 14 Oct 2026 16:30:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E9010E1A2
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791995401; x=1823531401;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1zWLLRT4mRQanca19ZK+FvXzvUpULpuSpG2P94u74ZQ=;
 b=ZBH3y9rk8I7/+yeE4L0992yRiwyi2XCJCIO5qx8zOKK4gEZ4xw9g6emC
 dAiAjvAYY6EIh/tqpHkDjA6Rbb17RWcr3rTeV8NSQAxBzUgplfFb4PjlE
 bYmw77E3WBiWpWVMkwYq8Wz+D/maFwlT6TyqHi50Q8P8Ek5WxANtWFkSY
 Gqvm7XqmKfxwfHfJBoVwZuneOGnp6nJxSPUXy6ZhrmuNX3rlPgOuBoBzX
 clyz86QbhBYB/SAfT76gD0DrkguJKKFISgP/fh6QbTqEmCJwPymuAabel
 BE8zrGH7cNp4AmTf6UOwtODpSjGU0bUaTiysmTNF+zO4seMSNT4H+3jDF w==;
X-CSE-ConnectionGUID: dL47wPuoQCiCbPYt4+zWmA==
X-CSE-MsgGUID: FoEU4tPeS2Oc2XByQSUkZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="648547"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="648547"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 09:30:01 -0700
X-CSE-ConnectionGUID: v88rBdKkShyN72b2iaEyiQ==
X-CSE-MsgGUID: DU+unDl5T2CIzQgjlIz8gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3311035"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 09:30:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 09:30:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 09:30:00 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 09:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlIaaDKAYHG9ZjJzGklcIG8Z+8odCOrqZIhfqSAOrZl+I6aqe7fthyG5FNGvkqTcrT/PKiT6HE/R9+o3b6dM5lP3JtwSHMFr/HKD8ABZIUWv6dj2kMUvrZosKW1c9BNJw7OW6hFwDMr/iciZRrQZeXNx0BP72ToFMmt6d7pn95PIYe8405Cu8/vc9pOzLOKOAuEYZecpccSU9XXkdWjQRcPqd+PidrDXBqiccdXx0IcKUmG1Sd6VBnC9WbmrgTZhEkOlsOIixFDT445p5INFEx0CaDB40z06PPUrlvrYABeEzJkf1T3cA7zKsT4cbABGVOEFzaapyvI+r6BoFiEzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxCyIkQpv5uPxTvCGmpVB9dHKwKYcRf8Wl+Dm93lW58=;
 b=yA6At1hEu+vVseWav1Ui4XrXE2c5qFMDX5VOYQRpfyGiMv7cocaBtsIn/dZQj/TZjwcUxDPATVsssd3z7bve0H8L2XKWIjctbZmIdPVoQp1DuycyD7RHqMkjrUrNaf70N9EnOy5AF261hFKw8BIUgwqgGd0x7jAZ01HOBfd9yQd1t7asi87EBkwMQrwS6IHyeNbEPQfe/1T/ApcqTxsPjbMAmKfatDLaqUC/NrZNYn6eX1JvW1CfBdUbZ+BL6wUALQRJBhzLhk4hM/uZ+6NwVJeu/dQYtpiUZVtXDvYoiWKNCzl5HhFnk5AFZwdaJk1tstfJiDWdNU+DhvQ8CUNmzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6808.namprd11.prod.outlook.com (2603:10b6:806:24f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 16:29:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 16:29:54 +0000
Date: Wed, 14 Oct 2026 09:29:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re_fo?=
 =?utf-8?Q?r?= drm/xe: Convert IO_BUS errors to structured xe_log API (rev8)
Message-ID: <20261014162951.GB578251@mdroper-desk1>
References: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
 <179186023260.15476.15099848639109863065@221881a7231d>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <179186023260.15476.15099848639109863065@221881a7231d>
X-ClientProxiedBy: SJ0PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: a474200b-159c-4ab9-528b-08df2a10607d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|261009220027099003|56012099006|11063799006|5023799004|4143699003|261009223327099003|261009221227099003|261009221727099003|261009223027099003|22082099003|10067099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: BC6myByfYM0vYElmSFsnWJndHViXPv+kyhSnAPgWQgYjEI+OBC/OP7H3ry6NhonRXrl8HD8rcMwI/2aopV0+XKE0v5AkNXylbSwH1ovnOyztmTVBCwtY3+RlLsowdTS5LFDos64MdragEDApS0mE6Qm+EL4qETlHiJBb52SwesMAqfBJmsE+5NxNosUbvYYKiGN/HiCLLIjaMZpcgZbX5R026HUFLKGr8c5UlSOyGb3yT9e+z5s4AplqYQvyM0xhs5Z1oH2KpjCLO9FhDhmCxT47YVFSZXD7A07D3ZFb1+Z3ELOp03xhBcKGPOdLcPaBWce+lZNqYfEKIrobpBGv7R2vOkNI6vtAeLPE1LPfSqw9FZbe20TTVxDMZ+kdpheD08bh+dc9iNPEiNAcZUr3cbkNtYdNGprdcP8oCsGdBZqObMLcWLJYdRSTNuFx1X3Wh8GqDbpyHOfa7qeOqfCHCsFzscVzcaONdYhDIIJBct6113iOovxDZRiPx8QFQmAh/Fq2VMO1jrbnY9tuQVHlOfVznaClcP5c2pFuvskJo/3frZFcqt4C5WWVNFZKaNKuTh1Osxgh0Z4l3LRl8KABZ7zqnrVYXPDklwasqx7UIeBV7sjzc8ApGYhhl53Q/BEc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(261009220027099003)(56012099006)(11063799006)(5023799004)(4143699003)(261009223327099003)(261009221227099003)(261009221727099003)(261009223027099003)(22082099003)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L0iFBi+520CvWcK2ZAZAawZA7/i0mJrsMEZb8i979S18dge+DmedhKfNx0ol?=
 =?us-ascii?Q?W8B8T5/DNlnWXbXSApWouwFgSWsS/mqJLwBXb4P+NlPC8xek2QKY3PgPSppL?=
 =?us-ascii?Q?xYWSVaqsXR7RLJl2BnrGUk5bxiiCWDjO36kEhWJQExuzDZrYKhhagrojgPfW?=
 =?us-ascii?Q?aFD1JcP1emB2wJmjmGpi8KpVQ5ixSeBs9wmyluCLBuvivlTmlYNUXjJo1Rzv?=
 =?us-ascii?Q?BSpVtzkTBmZ04Fr+SfGnHtVq5aEkAP9WTsNPS38IKrol5azTa3hegfxtoGFs?=
 =?us-ascii?Q?ExF9a5L29PLTTirHPPWWAk8pRd+2yBNYi5ZMKPkrxOEf1mtRKCTV29k9f2Be?=
 =?us-ascii?Q?xIYte4SAENtAB9YztUW9x+s0Jy2mXJZqWsghEX1RO1k2OkzOAzuaKYcSVA2n?=
 =?us-ascii?Q?V9FQNC2F3wJOOBJSKtzVwzbt7h9WxzV3TGjW4m5V1VQHR/RsRywjRcWiTOe/?=
 =?us-ascii?Q?lwyCh+8VcWO5ZUrZYcRweHvnCgwGLMu4TruO2rt/K0AqkNivgxacTSdtkLZa?=
 =?us-ascii?Q?ufHLpF/+1WJjZ4Sy6d2iz1BujpfRpBbHFWSsKFkN9rCFkdE/CEQCA7G5UhWF?=
 =?us-ascii?Q?rUocYTThWzLLHVyjtqTdUCq/H0Gg4bx2uhZor65BCxzHJ9nIZ1UkJoU9f+51?=
 =?us-ascii?Q?gDQel8iDKpkAsAp07VYFQmpvrF6AIgxrAbp4rDIz7cyFJWmsyVs6LunQ0bsQ?=
 =?us-ascii?Q?VKAQY5IDMV1YEjRgndJ9nPb0eqoR9trmO2v2CUuibxK8xA5F9ssAnmGkiDq4?=
 =?us-ascii?Q?0dCtw+rsK89b4zmys/hm+gm9gFBRtPHB4MM18S9KLiLArAiSMVl5yFvOwrPo?=
 =?us-ascii?Q?lR180+QnS6v84mqnoAZdH2j737hyz4yJxkwc/qS97uMPff0wR/Enb71qKre5?=
 =?us-ascii?Q?Llt1ahrhDamBfmk5wOZbvi14v2eB3Rgpxv8AEEfreTuIY/GdZGbYySyP3jIb?=
 =?us-ascii?Q?OGP8oZV0xnDkVyEgfSybz7XuQ45kEPYjQ9PmvcGkmg+ncAbG7XZazdLOWD9D?=
 =?us-ascii?Q?nhGa3r0XO6Cwv5kME2NiybMQanYxMfNTbAEJ6ju6oQfcADLTWVy8AEHCje4C?=
 =?us-ascii?Q?MqbfXimwUmGDDgmnQzisihFxgOrQljax2SZATZHg2s/24PZSc7sqhBFoQVMs?=
 =?us-ascii?Q?2o642udgz/10biCo8a8rTtibTPoZLh2xtePPsEQX4W5a9fqhJux6MMOwerou?=
 =?us-ascii?Q?6mpvSSCqqJf8V2dVDFdv4cHtOTjzLS/RkziWpl9fDQ700AN+lsLOpBKXiMR3?=
 =?us-ascii?Q?0BjoW/r2zLITlDGsiDIh6IdpfsxoMX3V1zyY5Jjyg+uwPQcreJmKOXc5/RMp?=
 =?us-ascii?Q?68qCxghPuVcA5pkTZhUmnQT/s4vUU3oZODiLshWfKPjoeUDoJXK5TNRv+iJr?=
 =?us-ascii?Q?EmUAbOgxfGYhCeS/YU9VgMA+9SmDCjGzRjN1yLJzb57H951QbfKHoqhNFCTC?=
 =?us-ascii?Q?Alncl0E+2uCnewfoSFdorCFrEpDJXaD/YYkgg8IebNcDiBN3nzozJtcK6Pwq?=
 =?us-ascii?Q?hwfywQPFp4a2GIT/Lqex0k1SJeQjXNCmHV33ZD5N0F9EwMe+jinGssrwFV0h?=
 =?us-ascii?Q?jDE7FgzSEW2v+rr1q0tW7cBqISd0TIL9c5Sdo77XALi6OmqSf3MiifbQagkD?=
 =?us-ascii?Q?mR86mm5G6xXwQT217xH9lgQAFhAVLNZ6ZukzIEo2X4G56Y8ylq3LmRHOjgIV?=
 =?us-ascii?Q?Vj4JTv9H7HjwPSzAo/sRtjZRMahxIWEreJnluhrrmP8P7IPONHKZsCDTjRX9?=
 =?us-ascii?Q?UNgHeMaIOXyqskLadG2mm3D4AdSAAI8=3D?=
X-Exchange-RoutingPolicyChecked: DjzRxhNMb7xROnF5STmI0ZUI+Jc4rdP+bmLQzqMudFaZN068+L8yXY/vPAGn/PXy38oMZ113ZOdJ0ib4zq5hC4BLs+Zdx1XKuLayfAKf1O1uspyZgOG+nWVV8PKAI91K7dhQcvkIWT3sWLHuOWHK6kR6kTTkgbtGwLmbSyZnrEidY/xPZAiROiELd7G8ufxur95ErMWdtYA6TUjU9+ijetgPdmA22pGJjMJ+7vLF9vyheSWD0nwVydNIhI/MeoRT8dNMqDudgtsWq+zR6Szi511KY/A2eRsvs4TTS4WqmE0xV7dmazwUV8Bx9eVXxvzY+8HJC3zvgQ3i0hxxwZnqOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a474200b-159c-4ab9-528b-08df2a10607d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 16:29:54.0360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MqlNVvyVvW8KMdaTXB3BMBpMHCojsh8c2lSY8bCv2GKj9REQLfc3Sm+vAidOJ6OyL8/aSm/m8Gztfm9PvviTVlDbsk/ks2QVF84emYdens=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6808
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

On Tue, Oct 13, 2026 at 02:57:12AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Convert IO_BUS errors to structured xe_log API (rev8)
> URL   : https://patchwork.freedesktop.org/series/172475/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1_FULL -> xe-pw-172475v8_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-172475v8_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-172475v8_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-172475v8_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_pxp@pxp-stale-queue-post-suspend:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@xe_pxp@pxp-stale-queue-post-suspend.html

System never came back from suspend.  Not related to this series.

Applied to drm-xe-next.  Thanks for the patches and reviews!


Matt


> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1_FULL and xe-pw-172475v8_FULL:
> 
> ### New IGT tests (26) ###
> 
>   * igt@kms_atomic@atomic-plane-damage:
>     - Statuses : 3 pass(s)
>     - Exec time: [1.04, 1.30] s
> 
>   * igt@kms_vblank@accuracy-idle:
>     - Statuses : 3 pass(s)
>     - Exec time: [5.79, 9.54] s
> 
>   * igt@kms_vblank@query-busy:
>     - Statuses : 1 pass(s)
>     - Exec time: [10.16] s
> 
>   * igt@kms_vblank@query-busy-hang:
>     - Statuses : 3 pass(s)
>     - Exec time: [6.16, 10.08] s
> 
>   * igt@kms_vblank@query-forked:
>     - Statuses : 3 pass(s)
>     - Exec time: [5.86, 9.58] s
> 
>   * igt@kms_vblank@query-forked-busy:
>     - Statuses : 3 pass(s)
>     - Exec time: [6.15, 10.28] s
> 
>   * igt@kms_vblank@query-forked-busy-hang:
>     - Statuses : 3 pass(s)
>     - Exec time: [6.18, 10.00] s
> 
>   * igt@kms_vblank@query-forked-hang:
>     - Statuses : 3 pass(s)
>     - Exec time: [5.91, 9.48] s
> 
>   * igt@kms_vblank@query-idle:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.71] s
> 
>   * igt@kms_vblank@query-idle-hang:
>     - Statuses : 2 pass(s)
>     - Exec time: [5.76, 5.77] s
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm:
>     - Statuses : 3 pass(s)
>     - Exec time: [4.73, 5.48] s
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - Statuses : 3 pass(s)
>     - Exec time: [18.31, 41.03] s
> 
>   * igt@kms_vblank@ts-continuation-idle:
>     - Statuses : 3 pass(s)
>     - Exec time: [1.55, 1.80] s
> 
>   * igt@kms_vblank@ts-continuation-idle-hang:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.81] s
> 
>   * igt@kms_vblank@ts-continuation-modeset:
>     - Statuses : 2 pass(s)
>     - Exec time: [4.08, 4.16] s
> 
>   * igt@kms_vblank@ts-continuation-modeset-hang:
>     - Statuses : 3 pass(s)
>     - Exec time: [1.83, 4.13] s
> 
>   * igt@kms_vblank@ts-continuation-modeset-rpm:
>     - Statuses : 3 pass(s)
>     - Exec time: [4.93, 5.05] s
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - Statuses : 3 pass(s)
>     - Exec time: [19.80, 42.37] s
> 
>   * igt@kms_vblank@wait-busy:
>     - Statuses : 2 pass(s)
>     - Exec time: [6.20, 10.38] s
> 
>   * igt@kms_vblank@wait-busy-hang:
>     - Statuses : 3 pass(s)
>     - Exec time: [6.18, 10.01] s
> 
>   * igt@kms_vblank@wait-forked:
>     - Statuses : 3 pass(s)
>     - Exec time: [5.91, 9.80] s
> 
>   * igt@kms_vblank@wait-forked-busy:
>     - Statuses : 2 pass(s)
>     - Exec time: [6.16, 10.29] s
> 
>   * igt@kms_vblank@wait-forked-busy-hang:
>     - Statuses : 2 pass(s)
>     - Exec time: [6.16, 6.18] s
> 
>   * igt@kms_vblank@wait-forked-hang:
>     - Statuses : 1 pass(s)
>     - Exec time: [9.79] s
> 
>   * igt@kms_vblank@wait-idle:
>     - Statuses : 2 pass(s)
>     - Exec time: [5.83] s
> 
>   * igt@kms_vblank@wait-idle-hang:
>     - Statuses : 3 pass(s)
>     - Exec time: [5.78, 9.38] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-172475v8_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:
>     - shard-bmg:          [PASS][3] -> [ABORT][4] ([Intel XE#9399]) +2 other tests abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:
>     - shard-ptl:          NOTRUN -> [ABORT][5] ([Intel XE#9387])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
>     - shard-ptl:          NOTRUN -> [DMESG-WARN][6] ([Intel XE#9407])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5901])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#6925])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1407]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +5 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#5808]) +6 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
>     - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#7679])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#7679])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
>     - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#367])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#367]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#8365])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +5 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2652]) +3 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>     - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#5822]) +8 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#3432])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +4 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2724] / [Intel XE#7449])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_chamelium_audio@dp-audio-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_chamelium_audio@dp-audio-after-suspend.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2325] / [Intel XE#7358])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#306] / [Intel XE#7358])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7358])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#2252]) +3 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#373])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:
>     - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#6969]) +7 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#6969]) +5 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
>     - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#6974])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][35] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#7642])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_content_protection@type1.html
> 
>   * igt@kms_content_protection@uevent-hdcp14:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7642])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_content_protection@uevent-hdcp14.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#5900]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1424])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#5846])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2320]) +3 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>     - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#5962])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#5962] / [Intel XE#7343])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1508])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
>     - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#9534])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
> 
>   * igt@kms_dp_link_training@uhbr-mst-direct-train:
>     - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#9527])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_dp_link_training@uhbr-mst-direct-train.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#8265])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-with-bpc-bigjoiner:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#8265]) +4 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
>     - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#5907])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-ptl:          [PASS][51] -> [ABORT][52] ([Intel XE#9362]) +2 other tests abort
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-5/igt@kms_fbcon_fbt@fbc-suspend.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@vrr:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#8586])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_feature_discovery@vrr.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-bmg:          [PASS][54] -> [FAIL][55] ([Intel XE#5408] / [Intel XE#6266]) +1 other test fail
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1421]) +2 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>     - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#2316]) +3 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [PASS][58] -> [FAIL][59] ([Intel XE#3321]) +1 other test fail
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#301] / [Intel XE#3149])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#301])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7178] / [Intel XE#7349])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#7178]) +6 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#7178] / [Intel XE#7351])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2311]) +31 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7905]) +9 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7061]) +4 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4141]) +5 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#5812]) +38 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
>     - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#6312]) +7 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#7061] / [Intel XE#7356])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#5800] / [Intel XE#6312]) +4 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#6312]) +4 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#7865]) +9 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#7061]) +5 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#7061] / [Intel XE#7356])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#7865]) +11 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2313]) +32 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#7061]) +2 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1503])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#5917] / [Intel XE#6174])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#6900] / [Intel XE#7362])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#6912] / [Intel XE#7375])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#7283]) +1 other test skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:
>     - shard-ptl:          [PASS][92] -> [FAIL][93] ([Intel XE#9340]) +1 other test fail
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-1/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#8303]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
>     - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#7283]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#4596] / [Intel XE#5854])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#5021] / [Intel XE#7377])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#7794])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2505] / [Intel XE#7447])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-ptl:          NOTRUN -> [SKIP][101] ([Intel XE#5849])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#1489]) +4 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>     - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][105] ([Intel XE#5858])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-ptl:          NOTRUN -> [SKIP][106] ([Intel XE#7304])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1406])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_psr@fbc-pr-suspend.html
> 
>   * igt@kms_psr@pr-sprite-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][109] ([Intel XE#1406]) +4 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_psr@pr-sprite-blt.html
> 
>   * igt@kms_psr@pr-sprite-plane-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_psr@pr-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#5813])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#5821])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_sharpness_filter@filter-suspend:
>     - shard-ptl:          [PASS][114] -> [ABORT][115] ([Intel XE#9375]) +1 other test abort
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-2/igt@kms_sharpness_filter@filter-suspend.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_sharpness_filter@filter-suspend.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-plane:
>     - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#6503]) +1 other test skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-ptl:          NOTRUN -> [SKIP][117] ([Intel XE#5848])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
>     - shard-lnl:          [PASS][118] -> [ABORT][119] ([Intel XE#9362]) +2 other tests abort
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#1499] / [Intel XE#9271])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_vrr@flipline.html
> 
>   * igt@kms_vrr@lobf-dc3co:
>     - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#8397])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@kms_vrr@lobf-dc3co.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#5948] / [Intel XE#9277])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1091] / [Intel XE#2849])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-bmg:          [PASS][124] -> [ABORT][125] ([Intel XE#9362] / [Intel XE#9425]) +1 other test abort
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@xe_ccs@suspend-resume.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-ptl:          NOTRUN -> [SKIP][126] ([Intel XE#5764]) +4 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-large-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-3/igt@xe_evict@evict-large-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][128] -> [INCOMPLETE][129] ([Intel XE#6321] / [Intel XE#8355])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-external-multi-queue-cm:
>     - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#8370])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_evict@evict-small-external-multi-queue-cm.html
> 
>   * igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race:
>     - shard-ptl:          NOTRUN -> [SKIP][131] ([Intel XE#7482]) +9 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race.html
> 
>   * igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#7482]) +5 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>     - shard-ptl:          NOTRUN -> [SKIP][134] ([Intel XE#5575] / [Intel XE#7484]) +3 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1392]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-userptr.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#8374]) +2 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
>     - shard-ptl:          NOTRUN -> [SKIP][137] ([Intel XE#8374]) +5 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch:
>     - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#8374]) +3 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#8364]) +6 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:
>     - shard-ptl:          NOTRUN -> [SKIP][140] ([Intel XE#8364]) +15 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate.html
> 
>   * igt@xe_exec_multi_queue@two-queues-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#8364]) +17 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-priority.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-cat-error:
>     - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#8369])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@xe_exec_reset@cm-multi-queue-cat-error.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
>     - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#8369]) +1 other test skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html
> 
>   * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
>     - shard-ptl:          NOTRUN -> [SKIP][144] ([Intel XE#8369])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#8378]) +1 other test skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-fd-userptr:
>     - shard-ptl:          NOTRUN -> [SKIP][146] ([Intel XE#8378]) +1 other test skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#8378]) +1 other test skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind:
>     - shard-bmg:          [PASS][148] -> [ABORT][149] ([Intel XE#9463]) +2 other tests abort
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#2229])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> 
>   * igt@xe_mempage_offline@inject-single-page:
>     - shard-ptl:          NOTRUN -> [SKIP][151] ([Intel XE#9203])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_mempage_offline@inject-single-page.html
> 
>   * igt@xe_mmap@pci-membarrier-bad-object:
>     - shard-ptl:          NOTRUN -> [SKIP][152] ([Intel XE#5100] / [Intel XE#7408])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_mmap@pci-membarrier-bad-object.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-ptl:          NOTRUN -> [SKIP][153] ([Intel XE#5867])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178]) -> ([PASS][179], [PASS][180], [PASS][181], [PASS][182], [SKIP][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204]) ([Intel XE#2457] / [Intel XE#7405])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-6/igt@xe_module_load@load.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-6/igt@xe_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-2/igt@xe_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@xe_module_load@load.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-8/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-1/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-7/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-2/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-3/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-8/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-8/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-9/igt@xe_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-9/igt@xe_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-1/igt@xe_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-3/igt@xe_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-6/igt@xe_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-7/igt@xe_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@xe_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@xe_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@xe_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@xe_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@xe_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@xe_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_module_load@load.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@xe_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-6/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-6/igt@xe_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@xe_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@xe_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@xe_module_load@load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@xe_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@xe_module_load@load.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@xe_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_module_load@load.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_module_load@load.html
> 
>   * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
>     - shard-ptl:          NOTRUN -> [SKIP][205] ([Intel XE#6964]) +1 other test skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html
> 
>   * igt@xe_multigpu_svm@mgpu-pagefault-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#6964]) +1 other test skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
> 
>   * igt@xe_page_reclaim@binds-1g-partial:
>     - shard-bmg:          NOTRUN -> [SKIP][207] ([Intel XE#7793])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@xe_page_reclaim@binds-1g-partial.html
> 
>   * igt@xe_page_reclaim@many-vma-same-bo:
>     - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#7793])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@xe_page_reclaim@many-vma-same-bo.html
> 
>   * igt@xe_pat@xa-app-transient-media-off:
>     - shard-ptl:          NOTRUN -> [SKIP][209] ([Intel XE#7590])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_pat@xa-app-transient-media-off.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-bmg:          NOTRUN -> [SKIP][210] ([Intel XE#2284] / [Intel XE#7370])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-ptl:          NOTRUN -> [SKIP][211] ([Intel XE#5741])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-ptl:          NOTRUN -> [SKIP][212] ([Intel XE#6867])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-ptl:          NOTRUN -> [ABORT][213] ([Intel XE#9362])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm_residency@aspm_link_residency:
>     - shard-ptl:          NOTRUN -> [SKIP][214] ([Intel XE#7271])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_pm_residency@aspm_link_residency.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#944])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-ptl:          NOTRUN -> [SKIP][216] ([Intel XE#6019]) +1 other test skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>     - shard-bmg:          NOTRUN -> [SKIP][217] ([Intel XE#944])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> 
>   * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
>     - shard-ptl:          NOTRUN -> [SKIP][218] ([Intel XE#7892])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:
>     - shard-ptl:          [ABORT][219] ([Intel XE#9394]) -> [PASS][220]
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
>     - shard-bmg:          [SKIP][221] ([Intel XE#367]) -> [PASS][222]
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [DMESG-WARN][223] ([Intel XE#9365] / [Intel XE#9482]) -> [PASS][224]
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:
>     - shard-bmg:          [DMESG-WARN][225] ([Intel XE#9365]) -> [PASS][226]
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-ptl:          [ABORT][227] ([Intel XE#7084]) -> [PASS][228]
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1:
>     - shard-ptl:          [ABORT][229] ([Intel XE#7084] / [Intel XE#9367] / [Intel XE#9375]) -> [PASS][230]
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race:
>     - shard-bmg:          [INCOMPLETE][231] ([Intel XE#8155]) -> [PASS][232] +1 other test pass
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-1/igt@kms_flip@2x-dpms-vs-vblank-race.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-race.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [FAIL][233] ([Intel XE#301]) -> [PASS][234]
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][235] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][236]
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
>     - shard-bmg:          [FAIL][237] ([Intel XE#9313]) -> [PASS][238]
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
> 
>   * igt@kms_setmode@basic-no-cpu-idle@pipe-a-hdmi-a-3:
>     - shard-bmg:          [FAIL][239] ([Intel XE#8618]) -> [PASS][240] +6 other tests pass
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-8/igt@kms_setmode@basic-no-cpu-idle@pipe-a-hdmi-a-3.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@kms_setmode@basic-no-cpu-idle@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-ptl:          [FAIL][241] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][242] +1 other test pass
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt@kms_vrr@flip-basic.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_vrr@flip-basic.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][243] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][244]
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_module_load@load:
>     - shard-ptl:          ([PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [SKIP][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270]) ([Intel XE#9286]) -> ([PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295])
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt@xe_module_load@load.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@xe_module_load@load.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt@xe_module_load@load.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-2/igt@xe_module_load@load.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-6/igt@xe_module_load@load.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-5/igt@xe_module_load@load.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-5/igt@xe_module_load@load.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt@xe_module_load@load.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-2/igt@xe_module_load@load.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-1/igt@xe_module_load@load.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-1/igt@xe_module_load@load.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-2/igt@xe_module_load@load.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-2/igt@xe_module_load@load.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-6/igt@xe_module_load@load.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@xe_module_load@load.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@xe_module_load@load.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-6/igt@xe_module_load@load.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@xe_module_load@load.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@xe_module_load@load.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_module_load@load.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-1/igt@xe_module_load@load.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_module_load@load.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_module_load@load.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_module_load@load.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-5/igt@xe_module_load@load.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@xe_module_load@load.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@xe_module_load@load.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_module_load@load.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@xe_module_load@load.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_module_load@load.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_module_load@load.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@xe_module_load@load.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@xe_module_load@load.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@xe_module_load@load.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@xe_module_load@load.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@xe_module_load@load.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_module_load@load.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_module_load@load.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_module_load@load.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_module_load@load.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_module_load@load.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_module_load@load.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_module_load@load.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_module_load@load.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@xe_module_load@load.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_module_load@load.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_module_load@load.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_module_load@load.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@xe_module_load@load.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_module_load@load.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@non-zero-reason-all:
>     - shard-ptl:          [FAIL][296] ([Intel XE#7334]) -> [PASS][297] +1 other test pass
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_oa@non-zero-reason-all.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_oa@non-zero-reason-all.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-lnl:          [ABORT][298] ([Intel XE#9362]) -> [PASS][299]
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-6/igt@xe_pm@s4-basic-exec.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-3/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-bmg:          [ABORT][300] ([Intel XE#9399]) -> [PASS][301]
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_pm@s4-multiple-execs.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-ptl:          [DMESG-WARN][302] ([Intel XE#7727]) -> [PASS][303]
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_pm@s4-vm-bind-prefetch.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-ptl:          [ABORT][304] ([Intel XE#9362]) -> [PASS][305] +2 other tests pass
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-ptl:          [ABORT][306] ([Intel XE#9394]) -> [ABORT][307] ([Intel XE#9375] / [Intel XE#9387])
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@kms_async_flips@async-flip-suspend-resume.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-lnl:          [SKIP][308] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][309] ([Intel XE#309] / [Intel XE#7343])
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-lnl:          [FAIL][310] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][311] ([Intel XE#301])
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][312] ([Intel XE#301]) -> [FAIL][313] ([Intel XE#301] / [Intel XE#3149])
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][314] ([Intel XE#3544]) -> [SKIP][315] ([Intel XE#3374] / [Intel XE#3544])
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@xe_pat@pat-sw-hw-suspend:
>     - shard-ptl:          [ABORT][316] ([Intel XE#9362]) -> [FAIL][317] ([Intel XE#7695])
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt@xe_pat@pat-sw-hw-suspend.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_pat@pat-sw-hw-suspend.html
> 
>   
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
>   [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
>   [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
>   [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
>   [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
>   [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
>   [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
>   [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
>   [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
>   [Intel XE#5867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867
>   [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
>   [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
>   [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
>   [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
>   [Intel XE#5948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948
>   [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
>   [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
>   [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
>   [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
>   [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
>   [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
>   [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
>   [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
>   [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
>   [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
>   [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
>   [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
>   [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
>   [Intel XE#8618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
>   [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
>   [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
>   [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
>   [Intel XE#9286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9286
>   [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
>   [Intel XE#9340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9340
>   [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
>   [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
>   [Intel XE#9367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9367
>   [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
>   [Intel XE#9387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9387
>   [Intel XE#9394]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9394
>   [Intel XE#9399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399
>   [Intel XE#9407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9407
>   [Intel XE#9425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9425
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
>   [Intel XE#9482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9482
>   [Intel XE#9527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527
>   [Intel XE#9534]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9534
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9139 -> IGT_9140
>   * Linux: xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1 -> xe-pw-172475v8
> 
>   IGT_9139: 3758ada24b618a59d8a5c66e37f0aadc20145d35 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1: 20282d4c78403c9eda071ebdd0c3d6fb287f64a1
>   xe-pw-172475v8: 172475v8
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
