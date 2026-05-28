Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88096CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 17:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C70710F33A;
	Thu, 28 May 2026 17:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/5Pwzh5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5330C10F33A
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 17:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779988007; x=1811524007;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4Famn5pEjGMrEejcilkApSeXyZ+KIEIiHlB0QZc3jYY=;
 b=A/5Pwzh5HZ+jIncQ515p2q3GoIgoY369q+YF/ihVm+cab6npvKsKN9Cd
 CgagVGPA541WKlWA+ZExV6wtlegmE9h7i3YuW1MkeT9urtkLqOFzYrwI5
 t6prCrSaGOCKiywGNXRTIsikxNINpBg3VINeqLzJIE3TtARxpwFyTNGyh
 OS3o7ff8DZYtzIJ+DAyO5tfaqCRMHxT4D1jnOG4rCijIOxQmSjb6PwfNW
 A065HUl9VxhjysJ68yWycpqtT6ol5HdmTyaDZij9XpZdzHqSJE1GUTNOG
 Q/vz1ReeTJHCnOlAZkGEmUYBmcSc2nOA10sYfviN/lq7e+GoPYZMyAOmJ w==;
X-CSE-ConnectionGUID: zDIo/bGlTu+saGZ5aqUv7g==
X-CSE-MsgGUID: 96wBqudCRZirCJKvT3XpAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="92221054"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="92221054"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:06:47 -0700
X-CSE-ConnectionGUID: wtrHBIvuTsGpImGii0/cOA==
X-CSE-MsgGUID: jaRQUcMSS3qew6GFUW7VKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="241571213"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:06:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 10:06:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 10:06:46 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 10:06:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdRKkJ4Is8LWfu957CQfSyqnZfQcXgPs4Ok/uu22IykawX5kmqPafAmaleaX8Do9SEockpKNifl5WceNew1NkSxA2OUAfPk87GrkfMS1rJGOAS9MCCtieMKPp+fIS/jG3BtMbbpUsF0o4sIDyT6C5zUOSLuETYotIJRGAzTml10a7ym5yczwbtWvz+7F5xjAaTHmDS/IxMoXEHWpjzbcuxb2XgTFqt21m03Wyn5C5wu7LHxP4dlijxJFGiwx4LRzhBbZ2tWs3Y8abZPhS8jSDianQ80Nzl7EAznLRnneKdLPzthy8UKdOXFutLt6UZJvXm5eO2BeL2EIiMkoVpHA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5npB0ZzkKzqFOzn9VwSGe6CirTT5iyJvhs9/bHbHCWY=;
 b=qizwkmXXYcakxmtjqmUJhnA0DePIFuTan5uhQPyY1kUDl2Zj0fmoFgl2uJw6+TQB3dkP1jB4F+uiO3mdow7Vn2oTLgA8VRTxO1t7JwT0xgX23uGCgc33JMtzgCjt7gREys0Pn3zz6xpyqXLcYVvmd8RCisqxy+ACcSgyjy/R6UZzgUEXr5vJNV4PUNGj3PCodt8pvrc/e0rhtJtO6P8SQWqytSnoLAvG9nFHl3Bcm/Bl/N4eCvjWSpG+f8nwlr4ipyXmAhuPK2EeuTfUU7EvQpXcah3La2Y7QwXF99l2mX5VWelObirWwSzDQcgRog6szOGxwJ54lwczkbHopHU2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DM3PPF74831EF4B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Thu, 28 May
 2026 17:06:42 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:06:42 +0000
Date: Thu, 28 May 2026 13:06:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v3 4/5] drm/xe: Rename EXEC_MODE_LR to EXEC_MODE_FAULT in
 hw engine group
Message-ID: <ahh2Hvx0xBydhBJ4@intel.com>
References: <20260525133051.91636-1-thomas.hellstrom@linux.intel.com>
 <20260525133051.91636-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525133051.91636-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::32) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DM3PPF74831EF4B:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fef970c-481c-4f99-7030-08debcdb7d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799006|4143699003|5023799004|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: jF2ci0fF5gK82JzgnQVg0eJF970bH1RgwLnnisGNOWyF+Z0Ns8jQcP29W/V2j0Ma2mOUmf6attdxE9q5LhnXpBzn+G5phBQl+vqGTssEhhb4SNdX/awr2iiUKjk1y0Uri6l7Ku8MXm7vKqu6nRhAuNm9+7iPmEEQmgk16fuydGzrsIYRGX3oAA8RlaF6sS9bFXERltiSpGf5b36GfV3C/c1ujFValiPHyoI7PRJR1rWUHspmSeXZx/zNsWTkSTY7CZkbEgIOzVz+MKInCvWUaQakwj8zNg2GuYC3f6ab/scEbvfZOn+yPALsxD/toLuW4XsEQ8JMBflJK3lhdCQRfFBlGvHWwmS3LlDmFOfDvb6PLAndFgCRHUSoMYM/SGjjkqDJi/7H9jUwLbkQ27pPYaOcPpHRd8CtQfA1ezVQja1mzZ983oT51NfSIMAF/aTe/VzqoNGGsC+gf9hbsrKGbJ70exlSC29Ufa6m6wJTgarRxDTe/6ucs3FveYh5c+v50V1Eb16uXfcmHfvZU3+ee+rigxFsl174+9wwNULMLNykvz1DrBpZtCjlm+KW+sCDbkkeD68+zIPTvtGRfZap4YzAGY8dXHpGQfh9oEscEUEwdAKG/xNv4anLnQJPU5y0shMRwL0LZExsIdq8m3oKELXaBKRyHFs8JRKOXSIgZcj2Tru5w9XN+3yVXJCIcn8C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(4143699003)(5023799004)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UwN+LocKogYGh89etmGCkSaFY+GbjeTGWfCL2V2O4WGGFxqXexZ4vM4tam?=
 =?iso-8859-1?Q?WP2oP/T8VyCjBntoze/dEa71LQ8tTQfsOqezGhYOI/rmknPJf19jpJ5CVK?=
 =?iso-8859-1?Q?riMZaGCp8VeQCkIBJC5yvyveWqspF0fcVqLww3erk8jahTFItlUIu6phvM?=
 =?iso-8859-1?Q?zCCdnKtfw7tZNXDWBY7m+cneCvUXj9XQwzrnoHZ/37/jt9B+1JW6W6Hvq2?=
 =?iso-8859-1?Q?491yKRgwZnfJVPCZ2joN62eS3kVj66+AHpH21HBDB6G6QmKg/Fqwp72tf5?=
 =?iso-8859-1?Q?hlC9Lkbc0zH+YoZKZgMmQifz2JtZ/FmDqNO0SixAkZ5qFMLi5vTUEf5NX6?=
 =?iso-8859-1?Q?1gk7Z6UNpt5de7GNzOA1vAGTtota74MmBNK9PejOgr5AZaGBI+HQ3oBIMA?=
 =?iso-8859-1?Q?0sD9XXz5kT+TpS/vKemA36FilWVRRg3yn8CjaVGHnGz2IfaxM1rcvSlLL0?=
 =?iso-8859-1?Q?zpU2X1WsZsBL0ADZb4Uis8SqNs27ACezw/Iakkp/lLcGZYnK3EWwxFp/gJ?=
 =?iso-8859-1?Q?EPduDwkM5j4QHvueKJ6o99/FqPZRRsenPJhLVpAA3JK7SPLgVILdc5RzSq?=
 =?iso-8859-1?Q?wi6K9cxeTbZHRYLWFtaaQ3TVKEr1cDzelcrQxl+1ed1D69skYtuNkUhX/Y?=
 =?iso-8859-1?Q?xyqcNcNuzxd1aJE2E4mclKytbVt+P5oyG84MFz2Pfs6sjFm/jJW4HF/XAq?=
 =?iso-8859-1?Q?rduH1LCE/OzYDKu1BLGmg8CxutFDg++OZMLy0GHOGmiGORCIpZNbVELgGu?=
 =?iso-8859-1?Q?V+nalYZ2H1FfK/1X4NfhxJDh2ZQ8CPNp6pivlM/o0j3F1mGDWGGB0VKDSz?=
 =?iso-8859-1?Q?UTmcqSot66kjlIvLxsneJ6P1rmYxFbctOIWYXEIMQEr5UH13nXhxzb+r62?=
 =?iso-8859-1?Q?HMQ8kDJ6qlxHZdvJ17C5UPQTw5qOna9QFpItCv9E0nrI5CpF0PWvmmmwaH?=
 =?iso-8859-1?Q?eOdBk0fSr80u9+fsInejqEhlLlbfJ0y3AC136lF0xygKXf56FcjNm/QR1t?=
 =?iso-8859-1?Q?JjEH2E2o5RnImIOSni1VcJDopMzDOHagdCjFb8j0sZ1gyTa/mECEHBiWq7?=
 =?iso-8859-1?Q?K+E0Eg1Bpad/Ki19jWph6FuXZh0gXPqCqp05MaR3EfGkniKAv0lzCWH1p7?=
 =?iso-8859-1?Q?qTbB/bFbTeSvNmqoNk700HbxJxrlFNGEuVYWsmWp3NX16V4V1f40i14Jza?=
 =?iso-8859-1?Q?KZCNOpf7xN/rYPWQZW5MhG1VCATtxsiNEYA5vQhGkfJGtjkqd0UqgqZXZ3?=
 =?iso-8859-1?Q?IKL0Wm9UFrCOCSjf0m04KRddMRnXYVWLWAbjoCK9r16FMNaSbkD+7av7MP?=
 =?iso-8859-1?Q?BCHuI5nDMLYY07fMHIuZuxdlGY6GEReA1qSRkdpHSRICRUfFSI5wYMZl+o?=
 =?iso-8859-1?Q?0dFks6nsvkjLaOzQ6iXbLqB+jKMcmhQ3/x1CY4mnNsS5ks1Lwj+j4y0x/T?=
 =?iso-8859-1?Q?NKg23bXw6YBm6Yr9+AZ6XMbIG97QeL7txmbuCki6wgOUDldNHKuc1ti65O?=
 =?iso-8859-1?Q?Pyn76nHb4xWHDiH82sh1eIGkmxV0JC5ELGeuKqGMuaeyIIaLU+dwwbgIBk?=
 =?iso-8859-1?Q?ydr4llhE3J7BTITSODEZ+kZY1RKwBAuou4k11hnSXn6Ps9El6zRsRu/Tzx?=
 =?iso-8859-1?Q?JimGqfu9CMBg2lAdl5mTWplkhPxSRDlO1Ks/g66vAasBcmn5KyMMTBQ5ei?=
 =?iso-8859-1?Q?6ThxBJjwmV5GvGSjYJllXAJXfSYj4ToGYUoYxdsYVpM9ZqQLuwh/CYHCxL?=
 =?iso-8859-1?Q?/8UBApgwpipEec1h2JpaYN40ayuJ66d81YejX7+R7GLfea5o3V99RvJygV?=
 =?iso-8859-1?Q?h7rcFjIjlg=3D=3D?=
X-Exchange-RoutingPolicyChecked: GLdOnsfg/NihuHcOY2+gzTjY7/JlNjQ8vo7MVW2O/f6uMhbt3wSgFoiG5R9s3R4ckfJJ0iozrbgSjDDiZUZJ9FgsXLOIxLUufW/zXReVW5ejPH87cC+C6aXu5MMHrRO26WZ+EMhhG+ztx6NugMrAClvC+ernvl5/rxFhm2hiFW6ehop+gJN4Q3W/+snJViCmLWuNHujEj7p6kNMK23iiRC4YtdOyiK1LnOTYM73dOaq8idwKWa/4N4wvZQIs3E+LIuOXfPQNELgztXah+VPW9oQclHV1FWliY5LrY2/S0oUkPNJ2CmIGm2ZPdBBZ2R4mdIs6IH73z+IpyJxqaaih4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fef970c-481c-4f99-7030-08debcdb7d47
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:06:42.5750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pc0yoPSnIjF0S5EAvYSqhAH9IAfZz9r0pjxur4O7+iAX/g0KirxSsxJ6VNreu9K089ntxXpl2NGL4suctk4UXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF74831EF4B
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

On Mon, May 25, 2026 at 03:30:50PM +0200, Thomas Hellström wrote:
> The execution mode tracked by xe_hw_engine_group_execution_mode
> describes whether the hw engine group is currently executing jobs
> in fault mode (long-running, fault-capable) or in DMA fence mode.
> The EXEC_MODE_LR label was misleading since not all LR queues use
> fault mode; rename it to EXEC_MODE_FAULT for clarity.
> 
> No functional change.
> 
> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 10 +++++-----
>  drivers/gpu/drm/xe/xe_hw_engine_group_types.h |  4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index e05dabfcd43c..15ad0fee906c 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -342,7 +342,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		spin_unlock(&xe->ttm.lru_lock);
>  	}
>  
> -	if (mode == EXEC_MODE_LR)
> +	if (mode == EXEC_MODE_FAULT)
>  		xe_hw_engine_group_resume_faulting_lr_jobs(group);
>  
>  err_repin:
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 791be6edd0a4..fba0ed039bad 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -22,12 +22,12 @@ hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
>  	int err;
>  	enum xe_hw_engine_group_execution_mode previous_mode;
>  
> -	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR, &previous_mode,
> +	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_FAULT, &previous_mode,
>  					  NULL, 0);
>  	if (err)
>  		return;
>  
> -	if (previous_mode == EXEC_MODE_LR)
> +	if (previous_mode == EXEC_MODE_FAULT)
>  		goto put;
>  
>  	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> @@ -292,13 +292,13 @@ static int switch_mode(struct xe_hw_engine_group *group, bool has_deps)
>  	lockdep_assert_held_write(&group->mode_sem);
>  
>  	switch (group->cur_mode) {
> -	case EXEC_MODE_LR:
> +	case EXEC_MODE_FAULT:
>  		new_mode = EXEC_MODE_DMA_FENCE;
>  		err = xe_hw_engine_group_suspend_faulting_lr_jobs(group,
>  								  has_deps);

should we also rename this function?


anyway, for this patch:
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  		break;
>  	case EXEC_MODE_DMA_FENCE:
> -		new_mode = EXEC_MODE_LR;
> +		new_mode = EXEC_MODE_FAULT;
>  		err = xe_hw_engine_group_wait_for_dma_fence_jobs(group);
>  		break;
>  	}
> @@ -395,7 +395,7 @@ enum xe_hw_engine_group_execution_mode
>  xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q)
>  {
>  	if (xe_vm_in_fault_mode(q->vm))
> -		return EXEC_MODE_LR;
> +		return EXEC_MODE_FAULT;
>  	else
>  		return EXEC_MODE_DMA_FENCE;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> index 92b6e0712c03..b4c41de6ba5f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> @@ -14,11 +14,11 @@
>   * enum xe_hw_engine_group_execution_mode - possible execution modes of a hw
>   * engine group
>   *
> - * @EXEC_MODE_LR: execution in long-running mode
> + * @EXEC_MODE_FAULT: execution in fault mode (long-running, fault-capable)
>   * @EXEC_MODE_DMA_FENCE: execution in dma fence mode
>   */
>  enum xe_hw_engine_group_execution_mode {
> -	EXEC_MODE_LR,
> +	EXEC_MODE_FAULT,
>  	EXEC_MODE_DMA_FENCE,
>  };
>  
> -- 
> 2.54.0
> 
