Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E56C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 22:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518C010E74C;
	Wed, 14 May 2025 22:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCNDuBZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C1D10E74C
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 22:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747260974; x=1778796974;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e0r9oSXtJPL5NAiTpMoB1VgiytLl6tL94d9F3Hq4PGA=;
 b=FCNDuBZsc/TlUSNV7FhV+uvzQTnTNyqohxRDU8x+L5hjyZVHEaohL3IV
 ZgNDRHg0fxTHboircx4qackImZgtkvH9zIVVKCj1QS+1NrvoaK36ZMK8q
 9wMadZ9eqzEMvQOMGa/zipb178o7u+jlsNjtGN744KtmACzTgXExN4JsN
 WAlkDAjHr8ze2ScsahUW8rUvFEfQ9XaPcBAjGdl/XH9V698VD+0nihMyl
 Jlx1wdjkrfHS6wiB2YsXy7yF5mdnGUJ4JKF881IYyKFKnENdE59nH2/+j
 ptlJJ+cZfCuAW4kJeOgZKCSGoKlaQd32VrrNtiL72q+p3rb1vgDv8eFcR A==;
X-CSE-ConnectionGUID: rlSwNXGhTDO5SvxVqGjDdg==
X-CSE-MsgGUID: ZL7xNvdfQtadS6lcvO5hYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49163732"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49163732"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:16:14 -0700
X-CSE-ConnectionGUID: YqbEksk+QW6ONvRYiVxtfQ==
X-CSE-MsgGUID: 3o9bbP5iRuSckAsedB5HVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="169110341"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:16:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:16:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 15:16:13 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 15:16:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USn2eStWihXYvEk+rnlWeCZl/MntQlaQsJwN09HS6Q3X8RP7R19xOgPMAMGecU4L0F/SnWYRWQUTmSGLXGJb/HJBQrRZ2gxv7PPbEd1aSwFpzEQUYnXfEdD5lnHEK5/xhGvKqCT0dF4erCGVvLQZ4VYdj3mpY9LB/UDY+5wrqLHqY8MlaXDkqkAR73i6dsxzTdAOXIvXMy0ntLFET30luG6wBC+rt3tImfS08OBXDR7JIKIt/Ur+nrSSGhlSr+LRgZDgNjBIFIcSuCIW4bHjV4rty5AlytYfBMHoFN+ENkkaajFOEmKkzKAwU5Z3jQLqBhTNeeYU9WiyoyUF+AFUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/dNJqrOj1MdZ536/JSWcai9HX0dYI/9hinXVT4AJZo=;
 b=E9GuvawMQ9o/Ehky0TaYa3IRqlqMcKFEkZtUomxmOXfyLvgtOE2qF4Q+08rVxUJyAeVqva/4OiBb46H4pjRhRvjwN4LuYpg+TLI18CZDJNgZ1q/Eww170mGv5yRQm79vpTu+Gg3DCQ3vCjFaiJia4e/BxLLB0tEWrbvee1Ja4x1rW7X88mNWPSFLWzP5mhk4gzodCw9gCVWfXjHgdgfmjRL17lGMCnKVFI/1hwAREiKCB5yK7pSnOTILeow8XMR8UGSADtysYYzUYcyJJLJTx8/3fjZOz0Xb/70o/WX9R6GB1tNtkSt1tOOPxwJLlzEeUfFKeNeXMsMzGDnsz6ozrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6708.namprd11.prod.outlook.com (2603:10b6:510:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 22:15:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 22:15:52 +0000
Date: Wed, 14 May 2025 15:17:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 29/32] drm/xe/svm: Consult madvise preferred location
 in prefetch
Message-ID: <aCUWb3PAE88CAVUr@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-30-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-30-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:303:b9::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: c14189e8-8326-4c6f-77e1-08dd9334e375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5eKPipp99hnXj7iZne8uiVKd3LTeYcq5tK4Q35OBGTDvMuEaLpfdqc/GXaL3?=
 =?us-ascii?Q?Bk7fOsfEsp2e0PvT4Z+xieOLHAcoTpsC2RN5JPF13ilefBRoYAWE3uVI8fvn?=
 =?us-ascii?Q?dZQVlMTFiYC+W2V6stclfobs2rclmdhKcNvRQ/mtKfsRg4iJHamtpy8QHgS8?=
 =?us-ascii?Q?w9fgieEqGq5LnYDe3HxAdz0h/0yp6ph2RyjdiGFLmp8BQ674qbnKXulnpdvq?=
 =?us-ascii?Q?vexUjA55mtx5sYO2rxQNBfL7ek4qwjOxzy5OKbY4gf/4B6GSYZ5x/o2HtwI3?=
 =?us-ascii?Q?qz5XVZ7pxhtFxvQTrXxRQS2DIq0FGxszjEiLjRTMP1+IMGZWYLR4Q6xkFB29?=
 =?us-ascii?Q?FYms3A7jsBWqVJvfdWtlYV6qLHdhyVe6HnCUpb0/qKoYahpwGzVA0Db/oSFo?=
 =?us-ascii?Q?J8dt9TC2rvkpq0zx6JuOJnK4K80h8g/1pxacYYx3ZVejz7An7j1T8Vqnh54a?=
 =?us-ascii?Q?XQ47cbu5HTXBRJ22yeAzOQkLB6V5RFXo2RZmgaFKOeXEYn/L5Xkclea6Cc/L?=
 =?us-ascii?Q?f/ULpcPgIDWKIsnAI6yc0LvkQBIQY0dAfDmzPVuLrTwt1N6AP37pQH/CW5FO?=
 =?us-ascii?Q?aF5Arsl6uhVWzJ1oARZuQjrCPW8wRCI1B3n9ouXvEcoGZDNnNcFKanOL84nF?=
 =?us-ascii?Q?p7rPl7vnvR9yB1Upw2/zPtYQYibeYOY+reg6Wnyv1GXUkutqZUH7e/kOWsH1?=
 =?us-ascii?Q?T496nBscP8uq75IabCe1kPpKwqcDp8sryxIQq/FPGzeq3YyxH2ec1cA0NcNv?=
 =?us-ascii?Q?1mp9sma4XW+Q3b7utoKxzh2c98bLyOMbdz5hTJoSITdbaLLk3q3Nqshduz19?=
 =?us-ascii?Q?O1Dv6klUIvMnTrSIC6FXZ47XugG+15+OZ43hWsSx59KCrukYzl999Y/LKB5L?=
 =?us-ascii?Q?7AS3etbvyT6sNw+v0KpPZygauTJzFWvsVoaOfP4F+mlrxTOb67qwZ8N2fIgF?=
 =?us-ascii?Q?Hr5EFaFwNZ2PqkyiDl5H8VckaLm3cBpIvo4Igkva4r3DG9iqxVotdG+c4IOc?=
 =?us-ascii?Q?0t1YrgnZN6l4sNre+y9zSUm/lqYC00PYVmtWfJjxD4RsnRKisxToD6edIZev?=
 =?us-ascii?Q?dThgJCldezbJR30tnlr14jO1OvnJ7IMKb8QFV7UGy7wRW29xsrRqDGqoBFaQ?=
 =?us-ascii?Q?NPhY+/rNNXaekYEc1GxepUzp/LCsvdCC0pSBy/p62D8g2sfjSK32fXDRq082?=
 =?us-ascii?Q?DekUMms35o2nJZcglQScaXiyhMcJyp7KpsxAzSp8iDWBoHExhQASk1Qz3U2d?=
 =?us-ascii?Q?xAysCPpRWOHKA4yB1ymN6yg4UgrejNy4VoO6lfa74QqNuRZNlGXK6TvePnJv?=
 =?us-ascii?Q?8qvpk9D9lh3Z1/0sPUkTekP8rMmtfLMZNUDXNNVeNzmIexlqyFzSjZkqeFOh?=
 =?us-ascii?Q?3CQ5SJOpV0mAUDP2LKuoAAdw1xNUODAtWz/K8kedpfKGD8PtOjlEZbUCa6mh?=
 =?us-ascii?Q?ufIYD19GWh8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2uk+U+r8A4vLDJLj87ZyIw/Hq6uW0NdHWDZhKlchabgq7oQoEsj1LblLvRRv?=
 =?us-ascii?Q?Cmsgq04LdLts2ZJxRqbI0esu5y2osyk/Nk36RIy1NgVmBIYGaLW6q6uDndBQ?=
 =?us-ascii?Q?bA1A/eHPLL/95WU6ZfRNwdMnWXN+WOIwhcnDRd78OVNLys5b0pdmBOt5+a0g?=
 =?us-ascii?Q?B1B5o9/6NV+0Ti6JuGoSveRZnJmrUlWk6SgS6KcorSTFk2+X1HhIOux4t3Lm?=
 =?us-ascii?Q?n/Z2qdkKg83tZu5WMxmY69H0q5SPPWElEyVANHvROP5BTmSjgTuGvd2hHNVG?=
 =?us-ascii?Q?XyhOI70X04e3DTBexX9SAAiANiyy0HlnMqtuR1QkBwkq3ipFW5a1V5DTHXsl?=
 =?us-ascii?Q?pyhI2fW8jxBggtXxfrG6ds/+KuROdgZ7Mu7BAGjuNq/QDx258bQT3LIwjeeq?=
 =?us-ascii?Q?XpdDct6c+LjhtBWOxjxfvisi0Vzro3Oho9PxM09BMD17alKo2xvg2nKR8AeG?=
 =?us-ascii?Q?yBDrhplsLTmqf5y2TTkp+iAGmJCgbOyeNCxkFwARZRSiHdPiW/RyuJvb7BEx?=
 =?us-ascii?Q?EIYK4BgLB5xTzmtzS6Fk7EKIeUg3HtURg5tCJ09yxtwBIuXrh8F6LGayUn14?=
 =?us-ascii?Q?d3b8zmo/GPMn0rCBVAw+JOCDxW31oNc6IUyqkfYEgNW2O6JwadVVfroKHs+x?=
 =?us-ascii?Q?/SMhA8eHcJ/X9WA6r9TdvsFgQb7UdVcA96JS4dkvODN6zkzweqcsLlhxT0Dm?=
 =?us-ascii?Q?BBpijDfUSifhL1iB1XpCu4MGBO0ayUJ81g3e5LRGhcLr9WUfGq4ocqHdip1K?=
 =?us-ascii?Q?c3friJTrzqDqXUBF2N5IgpbcindJYRnPAcjZEFJ4maC348Cbz0TcyWzmnjRX?=
 =?us-ascii?Q?CKxFPrV43xx6wjr1/pozSICikscGf9vjGxslEsPYnFSsUY+WTGbAQvVjgYzR?=
 =?us-ascii?Q?OWH6/iX1pAaqN9CXzLUCuzxexOaDYMXe3dFYyz7M5s+Kl6KQY3E68MixGScG?=
 =?us-ascii?Q?l4yzA1P/quaBoaKu+HIdCFhmUHScsr094W/Knv1NYkJZKVEXyheMNpJ2EmIA?=
 =?us-ascii?Q?f8najeFMzwSaIEX+73692Rft0XyJwV5fl9jb2BJ0p+Mt5soA9bJdo1yfPSbq?=
 =?us-ascii?Q?FU2BL6+DiWSlk/0bq7jSLT74s7LsDvkNbwtHrrTRzJxMi5QyfnHBjJ5Gkn6q?=
 =?us-ascii?Q?C8GsYnfzMRPz9wFeZhylQl4KhdNDWnNl10xmzM92K4/4EgQvx7hwoFWZnwdJ?=
 =?us-ascii?Q?kIGvyW5OMP3wvfLTHHa12B/UIrwx1IOtA6aSCtlxTI45SbEGA+8uctoFlL13?=
 =?us-ascii?Q?YjWkzyVOybX6TiPa70REyXUhZY27OPwA5C/lhebk/Jj0FjoCmQdDGlZ3YIgk?=
 =?us-ascii?Q?0oPr+Mqhr37hBiYjh8tg/Z3ULDXZOc29yg3GJQeWRVWha68mUtxnQs6QpHqE?=
 =?us-ascii?Q?QtzmaUX+3EHWNj5UUQ7Rj2wpgWdu/YIXrTUdiqoUvD1eMqWOZj5P27kxVB84?=
 =?us-ascii?Q?M749TBsQGjnkwDTn+cnOW6lg4fuyocEzp7kbv0Qsc6DlqNvD1qaBn3g04Be9?=
 =?us-ascii?Q?79i5g5f8Q70J3X+13oO7j2ZOP07SoAFwZTFTVEIkpKK7z/XOFZDOIKV4OFGc?=
 =?us-ascii?Q?SucXWoKwFjYMPCw5Mv60Mn+TfniDYn+UbRbwK3JtnM01UTDIIBoz8z2qLXa8?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c14189e8-8326-4c6f-77e1-08dd9334e375
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 22:15:52.2577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ous2X+lz1EYo8bfqT8hda+w46r5BCRZm6kkHJvkaQLP91Bl+J/r1Rb9T3jDT966aMltvbzVK52mDZ1+rcOIZZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6708
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

On Mon, Apr 07, 2025 at 03:47:16PM +0530, Himal Prasad Ghimiray wrote:
> When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, prefetch svm
> ranges to preferred location provided by madvise.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0f9c45ce82b4..e5246c633e62 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2924,9 +2924,12 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
>  		if (!xe_vma_is_cpu_addr_mirror(vma))
>  			return 0;
>  
> -		region = op->prefetch_range.region;
> +		region = (op->prefetch_range.region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) ?
> +			  vma->attr.preferred_loc.devmem_fd : op->prefetch_range.region;

Again incongruence between devmem_fd and region.

>  
> -		/* TODO: Threading the migration */
> +		/* TODO: Threading the migration
> +		 * TODO: Multigpu support migration
> +		 */
>  		for (i = 0; i < op->prefetch_range.ranges_count; i++) {
>  			svm_range = xa_load(&op->prefetch_range.range, i);
>  			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
> @@ -3001,7 +3004,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		else
>  			region = op->prefetch.region;
>  
> -		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
> +		xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
> +			  region <= ARRAY_SIZE(region_to_mem_type));
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
> @@ -3426,8 +3430,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, prefetch_region &&
>  				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
> -				       xe->info.mem_region_mask)) ||
> +		    XE_IOCTL_DBG(xe, (is_cpu_addr_mirror &&
> +				      prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) &&

Why do you check is_cpu_addr_mirror here? Isn't
DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC valid for all VMAs?

Matt

> +				      !(BIT(prefetch_region) & xe->info.mem_region_mask)) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
>  			err = -EINVAL;
> -- 
> 2.34.1
> 
