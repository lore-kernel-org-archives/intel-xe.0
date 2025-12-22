Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2AAE674B5
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 15:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613A710E4F5;
	Mon, 22 Dec 2025 15:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvxpL+FN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2218F10E4F5
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Dec 2025 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766416216; x=1797952216;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vcvIiJQhW1lplqpJ85tjLzQU1tYwDpp4ZdtR692DGZI=;
 b=GvxpL+FNWgr/euDS8Ewlar2w2qBGhxbKZmHQevJNmM3cbseXiOcXANFH
 GIoYGjrPBcgmgAb+/q0UKmpGprLUmXaPbbLTSGlNUkyfO1JHFJXQIxcvR
 KRktAKFItBm2mICptHCxfkHrnNuaEjDPTTP6oRMpLc+Z6IJZu1VgR7yy9
 VDaTZcWeI/zf40TWdKsw7A6NZ+GC0VLBagyZNcsL7wTtzoTYbdIXwUyaQ
 4QDYguICODLonta9qBBUudXuXLEwQqOslzhnIJho+7bNgPe+W9SzZ/4eZ
 UHDD+hMAZCgpbm4qMJqUsuWUwgObIIM4BvzYB6N9EcEpNbrpkwzw31n2e A==;
X-CSE-ConnectionGUID: n6pX2d07TgWsebBz35mIbA==
X-CSE-MsgGUID: vkXBqHYPSoCYHgoUlz/fjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68314275"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="68314275"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 07:10:15 -0800
X-CSE-ConnectionGUID: YpOcuLLtSn+BEtgdgOmcyg==
X-CSE-MsgGUID: rtzH3ahkRXWfLxYykH81/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="199578814"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 07:10:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 07:10:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 07:10:14 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 07:10:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1NymDUkFUFyeFqAKAKoeIzVf8rJXnIZcg5SIkJmePPs9oVzMFzqWImQFYCdL1UAER9Ce5UZ7oSq+A81kJ1AkKd8znyYo8aBaU5DJcAQy4QFQsa71LPUtPGy9vB/PK9hy3ExuVPyxC9BuxPA/VELK9VRN6u1/6QHDzZLWnMRUmPNQDb9gq9HP7MPUVsi4RipXI2uvSGY/3KKdLda+yuiS0VqPthRCFwzsFCx1T2tvrip3SqWpb1rC8c45Q/fL8xCqHljjUJJnQZT7GuXy7rW8/kwaZwwdkhjPhctN+3oTxegOrOeHS9J7TnibBF+6Yam98ascTRldXlnE8BSSvKTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBPlSNULgbZ1NKtXbdGNcyqStWNHtSHG3iO4hmcjUOs=;
 b=cCxBW7WFeZx3vYI2CSI02K+zp+YV4G2KU5rKHLntr4naxISO2S0R1xJRfqouzcS51mSi/xjIH/4EwxKOf92dOAo9rG63BNjz55uL4yRs3jZf4yhkpMdYVwwbr9m7E6LgMtSRIqQSGRqx5J8/d774SAQNq0raD5aCe4HUJ2UTLbdiuY9t+PFc2kdbAz+bu32vYQ6HxgBdaWXiv0pIziOp6MuyuF5/Z4QVMc91X0GTpspmkarHO8Git9lXsFlf2zVjGpZ34G++uBwmpH6y5zqPRyWz4x5e36GAIY6KxY+x9f19lnJIsL12rEifMGNuioP60rjujHSWtJSSH/8zOvSe2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 15:10:12 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 15:10:12 +0000
Date: Mon, 22 Dec 2025 10:10:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH] drm/xe: select CONFIGFS_FS dependency
Message-ID: <aUlfUKVo5Kfv8sZy@intel.com>
References: <20251219080513.848072-2-riana.tauro@intel.com>
 <aUV3dk3wUpf7U6tP@intel.com>
 <20251219163238.GN4164497@mdroper-desk1.amr.corp.intel.com>
 <43529e9d-3bd4-44d5-a603-8394a7a0f049@intel.com>
 <18e569c3-188f-43eb-931d-3aa7f449aac6@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <18e569c3-188f-43eb-931d-3aa7f449aac6@intel.com>
X-ClientProxiedBy: BY5PR17CA0024.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::37) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d7b3ff-823e-4465-8a6c-08de416c3411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k3Uotoqkz00llXqBmtxhAcxfRYS1d/mzHaNeklPvUx3GyER2hnGRJu9epYSX?=
 =?us-ascii?Q?CbVvB14DqHFnIHFBCg8UfXf//cnKpY5bADa8nmdZTfJgOZozrJmccijm58vu?=
 =?us-ascii?Q?T391IcFkeken29rf2Ulc4q784Ri/c8aBrRgtla2Fbch5E9yMbi6IqCBVIwcD?=
 =?us-ascii?Q?y1E4xjGYeL03GINXBJHIfQJEXpdCZmclPU/KIDtl/DOex4dePvT0wJ3z4W6h?=
 =?us-ascii?Q?1LFaVBXezzpzc/e1LU4FU6UbRCBW1dxn1KcRCK+XVwjM1LNvEePk8N+kVqEV?=
 =?us-ascii?Q?0doKi9xtl9FdTcnZLg1RMylB+WJA2qGiqewG92Di/21ApE2xUwBl2M313d9A?=
 =?us-ascii?Q?V7Onxr6xUP6q1xSjteEYzueaEyHnn3f4QqomemtxzbiKNR5Wk7iXWa0SwIwb?=
 =?us-ascii?Q?7ZXtSglqb06N9AjdtjQCv9ce16qn06Hm/lCoSpBZ0QBxhceXq8wauQSt33h2?=
 =?us-ascii?Q?rVKD1zfuhzidMo04vIFEmoZR+HWGI55p+io1mWU9m+UcOc58dW1+6r3WS3aN?=
 =?us-ascii?Q?FwiRbBlSrwdRhMp79VaZompJyjuROV+gmcOdITiSADcRwdZsrtRso0BOtjId?=
 =?us-ascii?Q?9hC26yeWtnuebRQxIPOI/6vZK8ODkHP76uO0Ujc3CEBkSsdEH/489pAeWZYH?=
 =?us-ascii?Q?6E3WMOOv+KbwlkpBoJWFckSz9Lpz8EeAPs0FScIN26yte9DdDAVuia+Wxy9X?=
 =?us-ascii?Q?W40zrZJWzXIgfEF5iB5uXOO5gAm2xLUoi7Eahi42YQZcsbxEaAxAtblhdGHY?=
 =?us-ascii?Q?2CtQHgUWrao7luqhnELFyo2VmVRkcbLYLrq1sf/r8H9+fm4RxiB46vu1CH1d?=
 =?us-ascii?Q?1BOEZm85jMCylwEc/gKu+ifhqZO+mEkr5IgmBm3Z+GPVJFgyDrvQjCPpnPG1?=
 =?us-ascii?Q?7qF0L3DnAGg1G+ZA6m4mx6PDkct0Lo/916udNQomuA8BmyhZ21aU2hy4Kwin?=
 =?us-ascii?Q?FsgljHPLq+Cdw5/u8RYNdrzxSMV4ca7xayfD1g7Ad3gPfjlFGaF4l097EysV?=
 =?us-ascii?Q?1TcdUKGat8b7Vgun5K5jzN2614Eq//Uv/LkrlywVc600NsZZ5qXH3M4UMM2s?=
 =?us-ascii?Q?iiPnZ8U1XOVbQQ8C8iZwSbi1k/ZH8lW5i/pMv88kaU4JmoBa5npULap3pu+D?=
 =?us-ascii?Q?2JdthPFCCADInqVhbZpKKvafVkZu25R9IdXDh/gORWDNswnaM2BJKLoICmPA?=
 =?us-ascii?Q?Ym4aV8aYYp1XJsWT5WFfFOhrXQUbTcGMbDHtclZPdqMRtFcFGsGscCUeT6Kr?=
 =?us-ascii?Q?L7lArdQ9RPc9X9f4+omOqaTUGmnePjJN4cMVzCQL5tw8Lmdg4nQmVihKSjvS?=
 =?us-ascii?Q?lDOAlN7N8agNU0cs/IBU9ACyts6lEVAefTElpMg7bPA9MDD8xF1mhj45cUl1?=
 =?us-ascii?Q?zC/Fd4MrXLJmrlh0TpGFf4uO2XaDXpMJfhkM9yWoNJHzXX231ay+Zx9yEtjX?=
 =?us-ascii?Q?blemoXpEgbIMLjBgVMYe9rcW8Oo9Nmn9tmWcNT8D1tf0+jRS2eayxA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MuinVIrG9LYETYyMctLK6Z4DeexiYCfYINiBPsMRkD6Z1WSjHk8ufhF7m+xX?=
 =?us-ascii?Q?+7uAXVcmHXnnfTTn4z2XNJ6nPOlzDis89NQRf4Yc9r6v3tkjKDt5HazdoAoX?=
 =?us-ascii?Q?7K90yTTCGkrA52m4C/P4IhJAEFqEb1+AWADdD7dutailsWwvOzIBkBeVKjoS?=
 =?us-ascii?Q?chNK33D6HXtj0lK5cVvcfWaZW5u8PP/04i4iF5VLiHKk/2DqCu14CcB1Hvig?=
 =?us-ascii?Q?Q8c84WRYrmGZzw7UD+YaTsEYhEMD6hdyYZhWVyjhlWoQxmvnwQD/2KU0xh12?=
 =?us-ascii?Q?n67KsA7QzFqDZdYTOl3oU+Be4X5llmXxiBP8fUe0BsiIV9+GrSTdaVPnKOpj?=
 =?us-ascii?Q?Z/rbaGcqJiGSYZ+O4isa2aMf/jw6GugCsOgHSiLXzPIi/Je/+Cqx/XJdUzZ2?=
 =?us-ascii?Q?fgtbQKg4Cycl8lsUfMOQm4i9RWuxOfSdxpOIBdOzdLmDFXdBYSFeLFuTabad?=
 =?us-ascii?Q?gfRyT/f5EtREDCsM1biBlB8rXleg0S/oL7goRfHzALCiVPo62dZIzUWxQHl1?=
 =?us-ascii?Q?QrqaZznf4enxKWPqkT+uNQGofMI7WBaSsp3KjK1JCSwXp3+OMOmHTTFqRsAB?=
 =?us-ascii?Q?pmtvWazxWjDIrSaJUu3ki7n9WZy13YeFTXSbvaIJvBqNj3X3plASEVxQoAS/?=
 =?us-ascii?Q?d+DxGF6Pn2WLgVfvzkTuMMcxmlnlurL99vWvFjpZKFQgm6D97TvWtcFlDR1h?=
 =?us-ascii?Q?Vg0yJ0jdgqQHXLLZreQsLU2WafjTfxHGasSU7AEeIURS3KybtJ1ABjvtpqW0?=
 =?us-ascii?Q?OK7U86RVda/q/rjM6y3VyjEcuSEJ2XSWzKyfQHMnS8+Bh6al6PvF4TAZcKLl?=
 =?us-ascii?Q?s3r6FQfxQZvActpwavrRsWrO2HqApex2eTmPVfYPNSOVik9KiqTFncPVKXxm?=
 =?us-ascii?Q?AWFnbs3Hcq7v3q+J63Yg06fy1hS3cbMQ8foz3ZklEU8VCdA4bM9Jt0EpdRmv?=
 =?us-ascii?Q?5wtLn0bHsRTkg0tTEELYm/25CLVrDtkUOVPjIEWKXs2elOv3Ntys772JcUkO?=
 =?us-ascii?Q?g+aP2PAqdq8hHJYl1u3MXxljXe9hhogh3VxKKObqnKSFp6FyJ2bXMoSA8sWn?=
 =?us-ascii?Q?JKRYomo6xZ3wHWDwjkEH5ygQ9ZYRxibsWDZgqx768B5BLoRkLVGJTxPBatLX?=
 =?us-ascii?Q?zb7dPzWi8BfMvzAQYEfw8iHLkSs9r0ecPWdXhKC2juu/MU62WRLgcdpMr2Ju?=
 =?us-ascii?Q?z82pw+EUQ6aolK5bSxFmUlI7Kecq+FSQAtxTdUqOJIVvEMjIcrZhr0d67AOx?=
 =?us-ascii?Q?WQFQ6fKL1FyDzvaJMuRLSUwXdJ9NT8HLk28ooGqvvlofA21rWC3O6cnskqHv?=
 =?us-ascii?Q?7vu3JdypaZdSczNJ8KkyqoLSL9ppAxFNydbKv4EXbjEKl/niWKb7JFJWsv7b?=
 =?us-ascii?Q?eGUc2FAZQk6Lpt334jnNgvFRmT8sm9LxV6ZIrfvR905bLVYBT81GoYZJEMVv?=
 =?us-ascii?Q?Oo7BN4Oo2o7NE2HN5sgwgYFBfUeD5bkkSHpNAbgMrJnvzyBlMa/5fAEBtLLu?=
 =?us-ascii?Q?sXwPfBiZFx/xEayGzQdf7mb0JeaEAl2fCKrfDw0vdHQj+OSkiH20Mvz2pUYC?=
 =?us-ascii?Q?MP7tGobncVO1tq5bs9KDw2aDSX7XUFWArEpsZsmXWFVicivyP93BmiQdbhVX?=
 =?us-ascii?Q?b3Oevqvh2vx7grCrQvnKoMvmSvm9azNxmdciatSmvPEBo1tVzRmy7EjEpYtf?=
 =?us-ascii?Q?+Qm494JAbvw4C779F7eI+niG/RScyHC9m9isMOyyJUj+z64IqzA5hYbd99Ln?=
 =?us-ascii?Q?oZpLnEA7lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d7b3ff-823e-4465-8a6c-08de416c3411
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 15:10:12.1315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KocKhJdSoDlfZqnHR+UYqHE8O3NgbrTY8kVGU/Le0fzEcUPr4H1FbySWl4du3Ek1gbcEjHHjy4kNuyvvTFhS5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5115
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

On Sun, Dec 21, 2025 at 04:18:56PM +0530, Riana Tauro wrote:
> 
> 
> On 12/19/2025 10:12 PM, Michal Wajdeczko wrote:
> > 
> > 
> > On 12/19/2025 5:32 PM, Matt Roper wrote:
> > > On Fri, Dec 19, 2025 at 11:04:06AM -0500, Rodrigo Vivi wrote:
> > > > On Fri, Dec 19, 2025 at 01:35:14PM +0530, Riana Tauro wrote:
> > > > > Xe driver uses configfs functions to expose configuration to userspace.
> > > > > If CONFIGFS_FS is built as module (=m) when Xe is built-in (=y),
> > > > > undefined reference errors occur.
> > > > 
> > > > Perhaps we don't need  this middle phrase. Only the first and the last.
> > > > But anyway, we need the patch in. I just pushed it.
> > > > 
> > > > Thanks,
> > > > Rodrigo.
> > > > 
> > > > > Add select CONFIGFS_FS to ensure configfs is built at minimum required
> > > > > level.
> > > 
> > > If we make this change, shouldn't we also remove all of the #ifdef logic
> > > we have to support running without configfs?
> > 
> > but is it a good idea to always back select CONFIGFS ?
> > maybe the actual fix should be like this:
> > 
> > -xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
> > +
> > +ifdef CONFIG_CONFIGFS_FS
> > +       xe-y += xe_configfs.o
> > +endif
> > 
> 
> Hi Matt/Michal
> 
> This was the first approach i tried. But if CONFIG_CONFIGFS_FS is set to m
> we get undefined references for the configfs functions
> 
> drivers/gpu/drm/xe/xe_configfs.o: in function
> `xe_configfs_get_psmi_enabled':
> xe_configfs.c:(.text+0x182c): undefined reference to `config_item_put'
> 
>  drivers/gpu/drm/xe/xe_configfs.o: in function `xe_configfs_init':
> xe_configfs.c:(.init.text+0x24): undefined reference to `config_group_init'
> 
> We should either change the header checks to have IS_BUILTIN
> 
> or select.
> 
> Since there are many other drivers selecting CONFIGFS and this is seen in
> powerpc builds. Sent this as the first patch
> 
> drivers/gpio/Kconfig:1979:      select CONFIGFS_FS
> drivers/acpi/Kconfig:518:       select CONFIGFS_FS

Riana, could you please give a try on Jani's suggestion?

 depends on CONFIGFS_FS || CONFIGFS_FS=n

> 
> Thanks
> Riana
> 
> > 
> > > 
> > > 
> > > Matt
> > > 
> > > > > 
> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > Closes: https://lore.kernel.org/oe-kbuild-all/202512190827.IeXYj4qg-lkp@intel.com/
> > > > > Closes: https://lore.kernel.org/oe-kbuild-all/202512181854.hPyTAXc5-lkp@intel.com/
> > > > > Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
> > > > > Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
> > > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/xe/Kconfig | 1 +
> > > > >   1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > > > > index 4b288eb3f5b0..1094c5fc5bdf 100644
> > > > > --- a/drivers/gpu/drm/xe/Kconfig
> > > > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > > > @@ -46,6 +46,7 @@ config DRM_XE
> > > > >   	select WANT_DEV_COREDUMP
> > > > >   	select AUXILIARY_BUS
> > > > >   	select REGMAP if I2C
> > > > > +	select CONFIGFS_FS
> > > > >   	help
> > > > >   	  Driver for Intel Xe2 series GPUs and later. Experimental support
> > > > >   	  for Xe series is also available.
> > > > > -- 
> > > > > 2.47.1
> > > > > 
> > > 
> > 
> 
