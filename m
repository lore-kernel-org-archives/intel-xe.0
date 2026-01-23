Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35347D778B3
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 21:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E875B10EBDE;
	Fri, 23 Jan 2026 21:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4Nx2E/E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A357710EBDE
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 21:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769204073; x=1800740073;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9fAbl3xMM6oU1LXcAydQVRtYw6C36tdq84wqnNGj63w=;
 b=S4Nx2E/ENHLm6YZf4KSct8m2vMjhrVTiNULPrn03L9KmZTL0DAdOuVUZ
 35SaWZrheBrZNR7+EDz26vWQNseTtHm87Ueuq9n1QvU4m9VDWHOmz+m/s
 oOVh3ko282dONkSOkjSypETZdxqxDcg12rk6vX2J7EhFbdFJgxfjB3Rt6
 hCEpopG7/E4oJFsOYFze3hvZewnx1azGP0r7SQKXg2VMJvEh+t9yXea2t
 7/XF8uxRXL0FHXSl5gQalV73hN6gDA64ykRH02/Kje3/NZNrY675lcA7h
 dnE4vy7m+5Cl//wcpzUTz2YgKUwUZxybXhuclj5wioqNDddecls+5EABo A==;
X-CSE-ConnectionGUID: JNJ6GIJOSGuWS8Txa969Uw==
X-CSE-MsgGUID: IdE0cg/pRpWRPHQumkO+Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70182705"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70182705"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:34:32 -0800
X-CSE-ConnectionGUID: LzxqknWTRWOSpAY9v1ibbQ==
X-CSE-MsgGUID: ZW0UJHBmQK6SQuBxKKZXmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211985384"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:34:32 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 13:34:31 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 13:34:31 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 13:34:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NS7jNoLBu/IyHsRARFwhXc1viafKAnkihZwZAZvlCv8eVFDKWL3PB4XsDC1eouxU3uwMw8u8EU9QfeogAX/G67wLRtttcYUn4c52dcXKd4sjKsMoq/Nq2/v8HyyuJkqkxgJwraGIp5EN5wlIDTN70iA2rothwj9VAeBP+X7PMl6dGqUQWhcOUkv8v1krjwJqH0M/56A1olSbllFYfsgKjcBeOx1midZgNGH2atGhl6VlMoVsnuBKvpPNIKL7IOeDiRYRbpOgqgp/TBK5nWnQCiEUcZHn5K8A8Pkgk/QQgmeBip2+QNTpMcdeqlrosMSkYikrvSdqzQNZHPgklWK/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzVsoTrGGySbwtoJWU/YEZ0wfQcGKVKUX2DRdllVOh4=;
 b=WygitnfJnX5mH2ftN3/EFm6oOvLX7/F+ZNEdrq2/MExJLsKOUQofmjlrIht6zD7/rDNRKb+n4nkBE3Nh+93W4Xua40J3aYNBSJ+YEXZGxPSwkiQ8L/kBLmrfhgBszCCjZYJyombny5yKFPK3r2cTLboLemYmmrw8abRzKYlPxt3/+1lVKfyv6mBigxy+MMB4422IhZZh8LDVqW7M0H6ts8jTnqZzgeAVqlr7IjeFhWtsNnTwbOVgH0/wlwP9S3MySSZMFOUDd8fSGeAnjf/jRTpMKts7DV0Oc6m7ndaVneQHIOsljUs6vTAQm6izGnGgLTnCv0VfZdbRUBfBa1wblg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 21:34:26 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%3]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 21:34:26 +0000
Date: Fri, 23 Jan 2026 13:34:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Xin Wang <x.wang@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/gt: Use CLASS() for forcewake in
 xe_gt_enable_comp_1wcoh
Message-ID: <20260123213424.GH458813@mdroper-desk1.amr.corp.intel.com>
References: <20260123180425.3262944-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260123180425.3262944-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: BYAPR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::44) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|LV8PR11MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc530d9-aa95-41a0-6c13-08de5ac72f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6nh1sCcuqmBZI877yHBtf893vXutpfvDm8TpfEE0QZngkO4wHQjg79LJFUHa?=
 =?us-ascii?Q?JAapb5Lnp+M3G8HbMxwSIhMM/5fFStqHv62bW9EXJ26AwFd0q7B1/dw6kpkt?=
 =?us-ascii?Q?FcD8PN1nArxnPgFCN6MsXWjNtybjCVl2sNBKPH8+Y7vzjJm/RvdrqxuXoBOn?=
 =?us-ascii?Q?q91jhNLLv+TyDhZ+qpbI0Kqs8rd7KcuuoAN6/vZxI/xesgpCfQ0Wa9P2MKXj?=
 =?us-ascii?Q?jxDymNZKEGBWSB/PVbu0tOKM4Aj1M3/ykiEKeRmnde4VyjWtwI/jhGplx0jw?=
 =?us-ascii?Q?FnmdqtJg4rbYQiYLtwvp+21UghuATxRpkE5JER6YRPtSC6tn9JQ7sQS+bycu?=
 =?us-ascii?Q?ludC14CHnP0w1ABPKFgJspDtnb7oKOVuYa9+8qKJBLhqSpnyNIP4BsrY6G/o?=
 =?us-ascii?Q?LX8AR3MtykTCAXykm9nBNRZNDU4AEIVXM4b/hcJeopcvP9Q792AUvuWnCClD?=
 =?us-ascii?Q?ZkP04SfX0fW36Px+fHYLFfDlJHSjSLe8/yknEOlT9jE88L8TI3rSd11lNRAO?=
 =?us-ascii?Q?5eaXfv2Nna2ac9ZlOcfxG472xcF4Z9WqMVrRgsd4UcdFnhUVKzE5kYiWRBDT?=
 =?us-ascii?Q?V+4XId4lUgq6wMJgppqOVC3+LTF2EmnfiQomFc2TcDrkSUN/xX9J5oNoynyp?=
 =?us-ascii?Q?sfDXAtrI1FPOp0+MENjHthfkm90Jz4sNyEDJub634LDZ2PAl+raRUJJ5AxXW?=
 =?us-ascii?Q?olu38DQkN+vqGT8z3KViQMlls8mEd7egzucHtOyG83ZT8VtyZ+Ng+XS29hcu?=
 =?us-ascii?Q?oo2TBHCiTxoxFkBcViYerTySxi69GjOdrEuNZ4vG1stRSRjIbLWhVH5RRYB8?=
 =?us-ascii?Q?yRxdkt4n7KeaLBfJ72+pak8+En0wdJhJtNAwlD83mknIUyMBjfl4c6N9vPC8?=
 =?us-ascii?Q?xuW00/0Rcf+ezmXdX5b5Fs/9xOJeELVA9dOOBxv8oHlhBVKTsMHGGuFkU1d4?=
 =?us-ascii?Q?zcxFgz1JD+v2donSlKbk84mgcds983kPSXCIeIH91gqIljmDdkk1HNT2RAqm?=
 =?us-ascii?Q?m0vkQfp5J9uiBy3dS9zAVqi1bVu/o2Y8QzmslmV0Rqxk5an3bwfZwSoLPlJi?=
 =?us-ascii?Q?MzC+UFGQOvV97jTYf2zSarE8lnAZ4H0npCnbHWmlq1hsIx1LeMkYtLHE0+XE?=
 =?us-ascii?Q?5J5/KP+41V6CBBSnqXlPZvNouCTx6z6zssfJ6GWY165LWeR++/BGJh919Dyu?=
 =?us-ascii?Q?nsf3TqElC4kJo2w+i/6bSHKIsrBKe/DbZY07Yp9GVJeCjBR/3xm49R6bs0Tr?=
 =?us-ascii?Q?LyFEipDZfBp+sIFFNop/Zw/1TP3UwmcSXXLOjTiop5e5spJvjSECVjIUxs7q?=
 =?us-ascii?Q?gr3CZLnBNMyQvFUHRLUq9KewP0oY6ctTGU2jkGLJfEO7UXJOUl5vq5eh0bbs?=
 =?us-ascii?Q?dc46SMGchPUFlohyHQsuhrOZOzbUXT2oBwxIUOczByPbF33Q4xU1TyAuDz8n?=
 =?us-ascii?Q?P3D4bg3AKpNtVLSAnJekEBeqMq3vt93uiur5nsy7fOFVALZeeKRR1Fe+Vu1Y?=
 =?us-ascii?Q?9+VhpJYrhslLyWmmbVeGRsxgG/Z5h2JsCJyZxCuoeXOCLwyQGUH7KMymPjcK?=
 =?us-ascii?Q?JR21w3+PqoGy2J1bWdI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qoDw9FTfaWK10Ho3Q3u93Bv4CnzGJbYBdxGGOBnZ84pUHjt3kgom5fEA79aS?=
 =?us-ascii?Q?R5P1XBwrYvyeyRgRcChw6W34kiElIsZcXkmJhkhzovWqRSBNrvCJ//hFsio+?=
 =?us-ascii?Q?wNc8wYPWZAqEpIG/FF/kDnfZRq2+EA9UeDPFT7vdVio4gliC3qrw55RTo9Y6?=
 =?us-ascii?Q?kIUkaFqz8W8KCaIETt9WAk5mj2KWb3hiVrd7IoHL6ym21lIRFdEEho+WI+v4?=
 =?us-ascii?Q?S+bnRkikw8i6fAuNEvgVvLKyospwli/LzmckGLq5l71u1hGcEOpbOYqRInk7?=
 =?us-ascii?Q?JMIoZBvFSbjVIGFPlAXDfzTh9Bp4nuoEABih28pvK5tCjKEUNZ8K1dPr7lAP?=
 =?us-ascii?Q?NSAZSjsTIGJoEdVLuVlSDOKZqexLo0Z5OWT81u2Mj3QpxFzu1I/zTjsFWjA4?=
 =?us-ascii?Q?J3gSY/BRUCn5ckbhPg9V53wv4y6PmLmEbkyaYKiUoIoGVlXNSKYaIXUND2dJ?=
 =?us-ascii?Q?BgekaWRuwMEFH/fJGpWG0QY9zXZeJHEJn1wLv/bfGfcNcqOOeZ/FS1/USWQ5?=
 =?us-ascii?Q?2f8AXI/FtBSjr1fC3K/NBA4WYQactcnQZQwX90rA9e44+e7prQhuCnHw/lBu?=
 =?us-ascii?Q?jU/bzOVbAu3fV6IDb97vLfZ1d1EwpPoQ8gaz5C0QZ+nDLpVQpMQbNAHtwK+K?=
 =?us-ascii?Q?EDWi6SxICFzhlkYDYQ2ILVzDxY75Nl2fk09ITbNlsUDHxQ4NkstB4vdgRWVu?=
 =?us-ascii?Q?emKTrMmB7KjlWw/yEVKFvlzuprxxqHwloeouL3wzKAp8xUPYPyjjToNEYHJI?=
 =?us-ascii?Q?lfODPGpnDJMecgOkVO4LUnPOfkp/vkwS/gbQ4tLIe6HDbXzSwz2apWAtTgFO?=
 =?us-ascii?Q?W/DOx+h24aI8A3wzFmMD/IMB3Y+gRFlLFyQMhp1NHkAcnlcx9CpaSmluQIaI?=
 =?us-ascii?Q?Z/6PmCfUSdl4SdeZnCmzgzJeIQgWuIsyXTG35obAasdTMxiP/HCFXWW79pCB?=
 =?us-ascii?Q?rC4Nf3kUrXOnDderMdSiyHFRmT0PQgGP7V+ITWUB0mql8aaythT2IuiJ0euS?=
 =?us-ascii?Q?dB1tggUsurzkXFZxa0ajI5/2rEoSmDL20PsY9u/1la1PWdAFCbkZUD//mA5X?=
 =?us-ascii?Q?IZhFOlt9HvNRXvTwRGxb5RlTVND/pz9W5nWE0L7dyLfp51CnlKtPp64l3fjU?=
 =?us-ascii?Q?DC2SeNOFOxBD6h43llKp4KZ7wKtoWdA16MW/buwA/Y9bsT/HpH4n9KVvmCpN?=
 =?us-ascii?Q?VUl07qyqs487tCPZRFsiCY8M9UwoH4cVgz8NmK53JDTL5jUPQN0/18fPsF/A?=
 =?us-ascii?Q?lUolsa6/DPiP2BrXOuSHMISAwV9rLAbI9huMH5E22ZtcVvkVoOr16Tpz04o+?=
 =?us-ascii?Q?dXHSRwJbyu2S0tyBPqNl/QOLtbnChWo/QTmygzUbORHgxV8qkumyIYsOmhBr?=
 =?us-ascii?Q?3HtUUvNAIA2YNORVo3g+aqHsZAu5qHqP6vzpRiisJhE/Qhn9PMIGrqV5Tg93?=
 =?us-ascii?Q?+RU6r/Lry2aUi7dpen/ovI/Wq8sg5cTfG3SwkKhsNb+bcbIJV7XUzvcWVSfE?=
 =?us-ascii?Q?utaZAgGZz3SVyz0DY6GFRJBgKxK6/DulB6NrOkpwDaSUaDCfRhifqz72rR5p?=
 =?us-ascii?Q?XMICN2n6qr3JNBeogAxmQgOboqok3pPyd6By+TMs6PdeAiiYwBaaYRACC+ok?=
 =?us-ascii?Q?cjkHc+nmnughKLinOSQi9W8wZ0yiqu4WFYLAkAxZz8hTRRqncBorNabDs9iv?=
 =?us-ascii?Q?344ZKIQB0AwxPSVe3+u8kndBy905WWoOPcMnfGtHKBeaF3SC1/L/M2FaEeyF?=
 =?us-ascii?Q?eS9hyf0RVrvUk9yo8pQDfJYiuGUXrHI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc530d9-aa95-41a0-6c13-08de5ac72f01
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 21:34:26.8018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k82fOvPgaHXAgzJSeRHGb6+LPCkrxCna0HuYfOI8m/JSogI6fXdt8oXVQlpkflsQhI1iWda6EHqad74D3r4YGTvJ+9Moa9YhBxAdFnHviyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8463
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

On Fri, Jan 23, 2026 at 06:04:26PM +0000, Shuicheng Lin wrote:
> Adopt the scoped forcewake management using CLASS(xe_force_wake, ...)
> to simplify the code and ensure proper resource release.
> 
> Cc: Xin Wang <x.wang@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 9d090d0f2438..22132467ff4f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -141,15 +141,14 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>  static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	unsigned int fw_ref;
>  	u32 reg;
>  
>  	if (IS_SRIOV_VF(xe))
>  		return;
>  
>  	if (GRAPHICS_VER(xe) >= 30 && xe->info.has_flat_ccs) {
> -		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -		if (!fw_ref)
> +		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +		if (!fw_ref.domains)
>  			return;
>  
>  		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
> @@ -163,8 +162,6 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
>  			reg |= EN_CMP_1WCOH_GW;
>  			xe_gt_mcr_multicast_write(gt, XE2_GAMWALK_CTRL_3D, reg);
>  		}
> -
> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	}
>  }
>  
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
