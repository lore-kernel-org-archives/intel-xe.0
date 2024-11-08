Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D99D64099
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BF710E027;
	Fri,  8 Nov 2024 23:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kTq16qxv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5935D10E027
 for <Intel-Xe@lists.freedesktop.org>; Fri,  8 Nov 2024 23:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731108795; x=1762644795;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6JTj3cFJb7oZGmsSSP3yAj98gdX/dzbxCwIJLhq7z18=;
 b=kTq16qxvF4UumLTdgTOjHln5jBygfQdTtGCO6fLoUWJntCb9T9v2p91Z
 OvLQU19dDj4iALJWdYDCM8M05/rsYpjF/eN7LCHflouL60p3Q+Xoc8ApR
 hVLG7ScwRLKh4FUxlbxXaDCUC+WWvlGV+pO8RSaAxTStJXGcdmRGc+70V
 KDrOS6zsCm75s/iNSp/ULzH5dHnZn93UUTUhBP+rFuOxDKuBXgcuSU0tN
 RhMaGyn2ktU9RGePODXMAqG0Cs8Ey4ojDKF+qiei7t7B8Oosc5NQmoiN3
 8K10jDDIr5awucC1Elw0MuL+OHPHP01RRlenGthPOWtVgNjBY+3zbMhBD Q==;
X-CSE-ConnectionGUID: FO3ufYEnTd2GV8Cacbrbfg==
X-CSE-MsgGUID: 1dHGa3i6T3GHjmGdC99udQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53569423"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53569423"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:33:15 -0800
X-CSE-ConnectionGUID: cJF5N2eiQ0KmXpi7+rvu4Q==
X-CSE-MsgGUID: 1F4r5RrjTSCKCm+5oyd8cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85782449"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 15:33:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 15:33:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 15:33:14 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 15:33:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dv3su6cVP/3Ze+3ajtjD38x48Wx4NQf+DfAdlUsXpjKQWo7rtd1hfCs8APxWLq2EqM/O0V5msWhUzGjzOjA9QFctmMaL1b7ZTCZ6bWX6GQlk8JFCKuG08FFrhg0wLg62hzK2YNvj5QSAS0NLaN3bDfzhY6sX0AISx+lyRGrjSsESIvtwzKR5CWOWQNqpsZ5npnk0G6jOyWfbVFSH83U1zQzc+zabe7+2sZQ3eB1MCc/OQ2hpOWUnYCVqxLoqLZPn6aS65CXX0f7u0T4bFB4hyxLkg2fBLN2S+IE0iKmg26TrR346ZkeeuyRHdfdwJI/rU490ufqJY7F2hVgYSzlcmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AU4VAl7VmR3O1RmzJtK7xzCWDL8sF9U7ku5VzPNlokY=;
 b=A3fWt3kcU1G+IbcwARn2FHPYWP4+ZcNVKHgZun13OkTTMX3uXv40onVT5biXCNDcJnNq2zz3265dWRQBQetfT1kelS0wUTawu6doIXzLppb93N/pUYoPMV6ARGlqCTH4ke9XhGFjEboAlzRIGG/bQSCQD57LeZ3P8HW5H9hSksiStpdtedVykO0f7IogwYrOPtUzDIWwUN9peeLGVWDAWTjN6tusRqRjyP8kbGT/oaVaZeq4SmNMxfbD/YiuQbHH7G4b4chFGr30scesPi34cjUF0qR+5jZzWJGhb/XsKo4btBwBSFIr1P2O4ouaQBuLSDawExgyRXJbIdYrMZOu7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 23:33:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 23:33:12 +0000
Date: Fri, 8 Nov 2024 15:33:43 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/guc: Reduce default GuC log verbosity
Message-ID: <Zy6f16+PhbgxZYTb@lstrano-desk.jf.intel.com>
References: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
 <20241108212737.2044007-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108212737.2044007-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:303:8e::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a945aba-b9af-4a0a-fbf8-08dd004db5b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rc1uGKTfiaCkwgIuOSBNyS/Eoum9t2pPJllrSQvixlPEquqUBJwV7ql/XbFo?=
 =?us-ascii?Q?AuHLvhi4XusqLm/x5IUrClA+7DbJArly7R7sFETuaWSKXD9L8bjgtcz1v330?=
 =?us-ascii?Q?F1Xiozt2xv2jp281jVEPYunQPvEI553/vAgZc81wYGh+gkF+ui+hjB478iiG?=
 =?us-ascii?Q?lgYWwbJAlBLeArboJ0ePxWyGgFdi48kWH7Gfvmkd9mnN+5SzOU+AvTrT0MrF?=
 =?us-ascii?Q?cE+9l+vmAcfE3CuvGSKyK8a3twppbwz5AhW3O7wFxtRGGKSJ5yv3ZkIIQG+I?=
 =?us-ascii?Q?8XIHb4OIa2ad0GwYRpkdXmVffM1NuN4wgkYTkm0N7Na8nizAPbFU9oeAQ+CG?=
 =?us-ascii?Q?MOS8zac4xZwTqlhfkcCsO8d83P1EBwEF8cc/6XJqmrUZpL+rV1bDf/J+TQ7G?=
 =?us-ascii?Q?y8dz8Mi4DY5sS9NgJT/qDiAMQsdzxnpAlMGZRceW+9fmBpmBh/KfNt+0FDEu?=
 =?us-ascii?Q?64Foyz0DGbIXsXqpIP52Sp2woz3nKozxlaw2TWDE8yxsTk0VbvneA+nUDZDH?=
 =?us-ascii?Q?ninbOavWOg31b/3GBK/G0dhnsTAnhCaxkw0+uuOxvRhzFDWqky9zsqXJoKZB?=
 =?us-ascii?Q?jDSc9T548okNbGjrhtVEww8FoqtDFJhB2uvVcHKEWg+Q3TlyhDqbOZnM1V6z?=
 =?us-ascii?Q?WPpIdN9kqWBRaRnTmq+3s/aX7Lv6jfN85nlugHiOZg6TYmXpBJA9tdQfxEU9?=
 =?us-ascii?Q?Zc6qFa3bzZJKmgHuugFni6/uG4Zz8OGI1Sr/U5e1LUnMnlyhBrSlu/chJ/mw?=
 =?us-ascii?Q?QpwQJ0yIDCvk5Q5Ke78B4DdOvAeY4ZBdj9WxO5FPNa/+4Flr9JOiMAGE75ZT?=
 =?us-ascii?Q?KPukZpXOIzFKAPextht6VKwgM/PncQb1dr/k+9WQ+htJg4kL7wG28nc/aTC5?=
 =?us-ascii?Q?A9TW00oWOVbxmBk8xfnPSm2MKlCTaI+L1qB4vmrkTx3MMqAe6+h5YBhMDDco?=
 =?us-ascii?Q?PB5GTlMgFC1HYkcaf5ckgARgfDr2R/2V3WFU/tf1qgzK7q9XA/+yQTjopaHE?=
 =?us-ascii?Q?XK0u+TPczsXApe2FFmSX5vDIMplP9VKNZsja8yIHyNjUR7LExGw4fPthUoiz?=
 =?us-ascii?Q?7odJU0SKYoaLbJF3ZXuk9rey8+l6PcqbWUIbP+PGeQfgMO+g5aLmgbTroJn7?=
 =?us-ascii?Q?PYupEmYao79A8Blz02saR6UQ8ic5E4mtmgBM22tQiNA3QiDUSrv+QPDVJ4Mh?=
 =?us-ascii?Q?0ykd7GrpBle3a5nGDiecqKiaboZxQj3vWVrvVbxcEkGPqH9E/GSSKqRoBpOV?=
 =?us-ascii?Q?EqHFRdFNk8NThZbCU6m3E2D5wg13/y1VSSbHwdCXAWfTljJc4dJNYQ2Jd/Hr?=
 =?us-ascii?Q?rvRpE26lm26F9aL4vpFbrUS0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BGAPc7pOgPcNZNY0dRtup6MxMeXr5uPeYiX60nCFJvFJCPvekTeVIlrnfAv0?=
 =?us-ascii?Q?Gs5DgSjiFsSJafQ+jL3DlGiFx3oFI7pdmecXk+p+ZFdxeyhw6aZSLXeEv1dZ?=
 =?us-ascii?Q?1NmLB7L7nSjZwfQTFBYK6N4eXqdWaAbW1wcq946L+FgrD3GOxxotjd3HIWnL?=
 =?us-ascii?Q?zQtoc4js9jJ3l8pDySEjbfSDKVmQs7PVE+js0nR5+LS+A89s9h9t7exdOmIj?=
 =?us-ascii?Q?SzUmTmPBd18nDc5QSZHSJ0OoMsgn5RA1vwzEpT8TapFTIncRsHe3W3echOo8?=
 =?us-ascii?Q?051UJSj5CpHdWzramtoyb8kYXS2IA5YuBQFqq+DaAu2aHNwXl5zdYKEbwq0P?=
 =?us-ascii?Q?QhsGW0ruwOmfssGoca35MGMGWf+ksZYZvVtZLemFZbCyvdB6bRBYZ0QWDmWz?=
 =?us-ascii?Q?ok5XvMxnqQz/hqL/k+wi3dKdsgKpYvV1Mkt5lALdvNDZfn5JAAc4OsGJnwBF?=
 =?us-ascii?Q?L47aXdge/S+6+RIPLotX/h5yd9+tFB0/QiUgIE4uZEr05uTP2F4EGTNvLYus?=
 =?us-ascii?Q?qiE77YyGb5Te4d4Dw39bxj63Bk+e9QIBsUFVTLG0oWemslCcpAXSX8gic93U?=
 =?us-ascii?Q?bfhpo7Bgi4+RVTw+hiNIt3ytG2f65bgEaq/fG435fxyUDzo6qfwnTd523BON?=
 =?us-ascii?Q?+G7SbHLDOQAv2S0R8vm55pGdjIyH+za0vTLhKuTv52uG+UzShuSSoO8NR+DQ?=
 =?us-ascii?Q?nKZMxmq25Ck2VvUih693F/AWAaoGM13JvsmRZS0Ki62OxmAJ8ZhgueLoE/wy?=
 =?us-ascii?Q?a6ct7GyHJHrKk7Z6msR5vNKbFwXsoezkiQcIlQcflhBqRQ0L/5QtZzfb7Eik?=
 =?us-ascii?Q?nlOlXcCPzHy845Wc25k2IYOjtyi/mbc3aYCxgNaDVZ0A/W85mKYkwz6Fqwf6?=
 =?us-ascii?Q?zsCfmb0ehiWjkatjWaKLgsycItixX1OmTb9pd9JpzZ1xihPdOvjfmgZca9fJ?=
 =?us-ascii?Q?NMJ8gJKtjpMW8YWrSZPp/E/nZbCd/hGgJwH2J75HXYYGtI9MyUult9TCtNKg?=
 =?us-ascii?Q?TsVs+l+IHg6Z7HEAhvLwllb4knGS89ViQxIpknDoxNeOeYrAic2pe2chVTWl?=
 =?us-ascii?Q?pyMctokoBGej/xQA2xK79H7wQpfzv0C1KFQkvNEpg4zGcbhhMm5ORJqlJQke?=
 =?us-ascii?Q?MHi3VM+u4TWaQJ9U0EyCesDHzPG52zihX2jHq1il8Qtq7SBaOBqoogOlT3Mq?=
 =?us-ascii?Q?SdcnjHQ/bNwK0dr8l2ww4u9xHSmkYgAFMhlCvxCViPP2cWvirEOnj6OczLTf?=
 =?us-ascii?Q?zAds1Gbz0iqdgk7t7do0PXHMRcmLkGT8gAGqImRZ9CLV82nWmwEQnAzPt4JX?=
 =?us-ascii?Q?sC74pRUDedWwNJe+DTGDHSJH0mp7gjXbrezvKJM14CKkdRGv1Bzk3yY5X4D8?=
 =?us-ascii?Q?ivKn3OkI48pDS2Y+WZ+LRRVHPajQwQZi9/8+xpOdek7NcmLhYELrnZ7LcTBi?=
 =?us-ascii?Q?ioY+xpX0J1L2K/VJ3uiNpHljshwTlOfIM1JhWNRGGRTbZcJLkme5ldG/pl4s?=
 =?us-ascii?Q?SZ+Baq8d+rCmhuuVWkicnT1V+bVKFNk401PaBkpB46t4eyjQ/5zKtGPVmUdU?=
 =?us-ascii?Q?4Ouy9GasNCnrtkGOEZbo+n5Vy1YjMu6iHHwd9HwJWgBy+SJVjT4UYvpja7Ge?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a945aba-b9af-4a0a-fbf8-08dd004db5b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 23:33:11.9191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZN+iMdU3cG92iggEnRBaeAlcHGFCTicDlH6YqIObit/G4+dU35mPASfM6RiikWdsMRYkyhMjfEniBU6iMWAtsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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

On Fri, Nov 08, 2024 at 01:27:36PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Drop the default verbosity from 5 (max) to 3 as the extra verbosity
> generally doesn't provide anything vitally important but does cause
> rapid log overflow.
> 

We still get the H2G, G2H, scheduling information and CSBs at this
level, right? That generally what we care about.

Assuming the above is true:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_module.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 77ce9f9ca7a5..0f2c20e9204a 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -19,7 +19,7 @@
>  
>  struct xe_modparam xe_modparam = {
>  	.probe_display = true,
> -	.guc_log_level = 5,
> +	.guc_log_level = 3,
>  	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>  #ifdef CONFIG_PCI_IOV
>  	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
> -- 
> 2.47.0
> 
