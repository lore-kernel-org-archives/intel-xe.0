Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5D7E9D41F
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 17:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED7310E708;
	Wed,  4 Feb 2026 17:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esrE7BO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D942A10E708
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 17:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770226567; x=1801762567;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P/b2eSkOR55usowkkEW+kgFQVCBoc85LqyLSKmSPALQ=;
 b=esrE7BO533aEH3I2QgYRGMRY12PsrZKfYc2chiDoXMONOL0prmPnclDN
 tuoZsHY/uXfq7eLo4Ts7gELqa5Sf3PnS4cb7MCFUC4gDCk0syd3pv81KP
 2dF4zVjY+5tbkt9heTJgn5n07hkwMJttlIjSlJzzEiWu7HP1vrHK9+//c
 RINccvYykvZ9XROLzUVRnwEK+c/wxK4zt8lQeVok2Lc9mzyVBkN6xKoeh
 /7IlEk92L86y9NU3SF3sy4IAkg/7hN9oUnUbH4sr07481E0yR3b2vLyTH
 cwwZkw4oEWFUUOLIDQOXWO1dTQjLzPkZimjQ87REx3gdWmAr6Shk0yhce w==;
X-CSE-ConnectionGUID: wmt6K6KMS8q4fnbo4nlczw==
X-CSE-MsgGUID: pCdiR354R9qJxuDW20Su/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74023164"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="74023164"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 09:35:58 -0800
X-CSE-ConnectionGUID: DJMc3eS5Say5+xlIODae1g==
X-CSE-MsgGUID: rInO/ENYQ16Asmya7eF0rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210237200"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 09:35:57 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 09:35:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 09:35:57 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 09:35:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMT2DTyhWDnxgFwh8Hks3+5YX4Os6wPkH1MYpMqHOHkXKvAehUf1Ey8WF5AImNRS7YAU/VjSZWAqfSEhkFKxht+x+UJLLTy6U/wPa+FRDO72vEQaYPRgpiJLW3kp33u3LkJt2euBiVzX9BanlphvCXzw8SpHk6QQBok7hIlTKbhkHVYxEJOvwY1YMjCfy6gStln6GVChU3BHPkmic4+/IPK1frxs9nPomFthgbK3khCwAH9f9m3oDgHDAQuBzxqzGw5jZw84Jxb3HAjYi8TSoagyOsv/coqcf4kiB+VMFJtv9AcMJZBIdr4qMm9rXfDRUtXqrs2QDQsBcYqg4tTOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+/zI4zFiKaSf5fIWuF40MbbcCgTWSZHAgCsqURC3d8=;
 b=te9j+khW5zVAJva1WSKwSaOlpdLs/BzrN5pVg32gt/vqPuylFfmWc6i03DxOGRZMVoWLBFAHaTLGVCLIg8+uygtg76hbyAyYe9G+Dghu8ZV56crJasRyLmtEue2pEWHkE/LQCupYVuwO4Kves3lUtgkovaIDiDaA3OqcvdfM0ZGd4OUovRgnmi8Jls7COefTL/R1cKb2/sIUOwqtRRe5dHgqbngTogJKSszmxPLw10xpzTfoJkKU1fDfGoaZUhS2xfej4vV/vnj04n4z39KmURaULZYh8SgGeUD4h2GrT45O+v4g0BLsgdUONgTkmWoPVBL9MdhPNYhi4hshqI6etQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7603.namprd11.prod.outlook.com (2603:10b6:806:32b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 17:35:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 17:35:49 +0000
Date: Wed, 4 Feb 2026 09:35:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/reg_sr: Fix leak on xa_store failure
Message-ID: <20260204173546.GI2174980@mdroper-desk1.amr.corp.intel.com>
References: <20260203173639.1399354-2-shuicheng.lin@intel.com>
 <aYNv5BDjgbOPqOJD@bvivekan-mob1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aYNv5BDjgbOPqOJD@bvivekan-mob1>
X-ClientProxiedBy: SJ0PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:a03:338::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b23bb4-c1af-4b65-8b45-08de6413d5de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zC1Kp4KUbQ/fLswErkhGFaV2+S4xesV/b3Dq8H2PyBj3LhjU9sdRtjpvW1xZ?=
 =?us-ascii?Q?xijiD1jsw5SbCzqFcA943O//41Dnj+Q2I8foSYGSQoBPmuqBcaYsI1NU2yEj?=
 =?us-ascii?Q?348k7eKYplEWHVx0QK7FBLaZ+HamnaRAyjJZoF8nY8GaL4L4xrOjrAgfJe9g?=
 =?us-ascii?Q?kM5WOAPCA+96j0fNSnklA/sXhnJDE9eo37YqjMMDe3BmTJEKf0MyCM8L94HA?=
 =?us-ascii?Q?CflA0s1zh5jISGTyDaQag/c0QccYIiAI2NeCRiBZV2L5mrz6qtELaVCKQDuL?=
 =?us-ascii?Q?0t1/AS4yAqgBYS79EgrxRzs4uhebNslpHOTqfgyc4RMDZMbYhOKOauqiQWea?=
 =?us-ascii?Q?EtWlI366/JPaDZ9CtHzm5CuNN9DT48q4YPtXczRENAV0E2zbk3qePMSccU8x?=
 =?us-ascii?Q?/t5wfiIp8WRLgURgwAn1/w7fKkoBQKDeH4e8IUMxT84J7Z/n8NRXaUR0oI4+?=
 =?us-ascii?Q?9S2e3WmJstxBBb4ssYlQDI5g86+CYkQD/cGDHG7ZrSqjnHlwpTfeuMjuUnaG?=
 =?us-ascii?Q?ckXgWAb8cgsWBldByDgHPuA1Q9PF5F8EBcDsgYZT+nchC1+V6+MQC12HuhBy?=
 =?us-ascii?Q?wZ1R+0FEa009PJDztB9O+yjFir+Z+OdHmbPWAqTrs1pdtmehxuLyBwFhxJ4T?=
 =?us-ascii?Q?qsMuDXEMdeCBB1ZRhpmYk3lE4RraqSWhOEpbI92oQXHB0r1OKaQiE6rBNBSn?=
 =?us-ascii?Q?SQz63BA0S2YzFBJCM9B9waEZ5SFplwoIbrHPpCq7KVNVcygCsGZ4H724oaJd?=
 =?us-ascii?Q?Ut90/W4K27kTwomNp8mgMzl/gg7PRdAbxcSklRIOM4fmBeYS4d/VjqaumRqC?=
 =?us-ascii?Q?N80zkNkgzqYr73UzniG/sBpydBaarfyW8Iazo53f5ecZ4XqoUIrk69Ke4V5T?=
 =?us-ascii?Q?w4JH2yK88IAEa3CHnhvfeapyTmqDjYONNXSwME57+ay5freuUowYqDKbtTf3?=
 =?us-ascii?Q?aS+XkIN42xsU4n7sQ/RUbcs8DBdAJUip7ceS3rS3AUbwNhrpUJMt3Z0R2rFG?=
 =?us-ascii?Q?zBWf/wi15IvqaRupoMUU0Ru0I6/MCqxR9LtSUfVXZce3xYSpgyfVNsxzAZQJ?=
 =?us-ascii?Q?wpWV3rtbf4hGi2fIdOQu2DqDaC4cF/yUWUfO1AzTBUsfo7XtP0uGvUqcmnI2?=
 =?us-ascii?Q?yHtaWdnbCzwKkgCm+jERVfCvLSBloVqbWu1mvefhXDAd+uo2pbftELeNKpQb?=
 =?us-ascii?Q?jdTxHf5n4EUK27R7LJ9ocvtb3Py5IngbU4tqbEXxV1U1G3VqRu13i1Uy2tSJ?=
 =?us-ascii?Q?e4mDlFGIC21qKi0kAl2TGlypyicOslgxvkSFYoZDv2S46rXxLJyDC+WLuzo2?=
 =?us-ascii?Q?XSCukDmssFiu8xaegZrG6ax11vKgjUx9ZpojLfcwDi2jn5dPPRiYYVCp86lA?=
 =?us-ascii?Q?VunmdC0vun6JCYu7E/foxis6zWkDjwqoQRa822EHWFNm33Z6vuz6aX1tiIzj?=
 =?us-ascii?Q?utIOl+i4vvQtDjWacdtTdM99/AcQqOsdYUS1FJu4Y8CLyw0wA8+ya8OvHUD7?=
 =?us-ascii?Q?arsczCgQ7ZFqgOcwHTrHJ2/tFjrLlthFznVY5DEhmRqziENnLT9w5dBkFRrX?=
 =?us-ascii?Q?V3OMZOq3no4vjAl6sdQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MXA2jmONYYAizScrzb7LBJl73G4hQOmURmtpSl263gYspVKl8XmUBk32Bdt6?=
 =?us-ascii?Q?xzas7sYtzCiqBomuB4ker+EffJjLjC1B3S0OAQFs28uSuSZNHsIqwGwBd88b?=
 =?us-ascii?Q?nmpHLPMRhMstVyNigSzr5gpG0SEfNlVBSqdg6iIqO17Cg81JANM0vjUeN138?=
 =?us-ascii?Q?LDnEQY4JNt8uGs8XUBO+4beJsJAv1g8tH4mUbc7GxNs1xz2szP6hO/xFFVtR?=
 =?us-ascii?Q?d7zrPBTmdKv514n0FzCU17+x807NjUVUvQ4E9DbMAZFCa8H4UKUWRMINsisp?=
 =?us-ascii?Q?MoZKbDrc7tI6MVw4se3Tj7QPAQuM8C57tGHldFj72mFtfmpqk+NtSL9AUJfk?=
 =?us-ascii?Q?DFev9pFLbVSP32jfAhgwf9iMZbMFEwPDhFjNRuF+MgKTSRXS/Dcwp39rjYey?=
 =?us-ascii?Q?9x+m+XKD6usW/EEJOZ3+k/UQ75RmZRiCErHfs7nYVv5IU5A/DR5wx0NhrKEl?=
 =?us-ascii?Q?BFOELtdjSH5+X5ZQ1hLmxUJ6zmbrayEN5ZqMAWygqPJiWRn/vvgeP57vSmpe?=
 =?us-ascii?Q?cBfqkiAK+13WzWVT4acPVNxQC/iVCzM03CnmqNg8uDC1y1Tnk/xL46STU1b+?=
 =?us-ascii?Q?Tsaj4Zt0V3v3Lj7FtBnpRUSmK8CrNrU3BTgECKQdn9ZkU8N+POxgp3jKOULf?=
 =?us-ascii?Q?2Ce/d+rXw2nQVgv+/drCJ3saMWVifLFzM1GsAmJBUTTgjnsDwOiuiTWGrQhO?=
 =?us-ascii?Q?P6SChs1+51AUQ/Rz8f71dJOWsiqRZjQsK/XQAvCnidHZIQghG+vm+g/x0e0D?=
 =?us-ascii?Q?EGo0lf6zssxIzfyOwA7Ovmfd+filrQq3ysnvbbBmMlqhsFNHzB4MyucoZgY6?=
 =?us-ascii?Q?AP2lADEcjMwWtrxB/oeqgDdCHhtef5JE72r+6Nwx1Dkv+fejVhCjbxbWiL20?=
 =?us-ascii?Q?7ciEXz/f27rytBz2tHj9IDDroJ0c4HQ1/I0UM2/rHIMD89w4h+uJaXO5O9KG?=
 =?us-ascii?Q?du7YKgv4Qsn5aEiqpBknIIpzMp37FecIaZxaPRTuq1eD3d8dOVSS3/kGRwsD?=
 =?us-ascii?Q?Gs6CIzzDel2LFA5flQ9HSYZmZkKge2W19UVVC7r6qBoWamaqvT5W86unP9fu?=
 =?us-ascii?Q?yQgpEbU3j6msz8LjNSwp1Ye3IKuiN6OAvmYj8MarrWDWPMDF/HQuuOgVYPyT?=
 =?us-ascii?Q?55UFTuNftpoy2ykQ+DR8weoabNvBzGxs3g3S64L4z5RDSN1lwW09mxgpF3gV?=
 =?us-ascii?Q?HPb8m/pChff1XZHt0qFayjtdXQIr6tu524BnsW9Xts+1r0fPDgGhH9JwLHT+?=
 =?us-ascii?Q?W0alxVwMicQGG3buQdXWro+6H+DgxU8LPBctyMwufge8TA902on/f9T6Oswg?=
 =?us-ascii?Q?E9Adrvno7At/HQ3fGhXqdr5fWME+Cr+vkxqeEvqUurI0Pz48NealHGFhVHW1?=
 =?us-ascii?Q?ZFNTCgrly6Sc94OzB9cPneYEbDjPPaff9sm2JgCccLYWfBZhCtKMP2ymuABC?=
 =?us-ascii?Q?T2KunuORDgXseBvAI1N7aJgk11HNN5uTkW3ctxEHEYmRJ24Nl2RMZbnuWdFE?=
 =?us-ascii?Q?aZcTHuZUFQxCS56SJY2A/jhXgGHDZ+EqmUsEyHLllJDrArt1DiE3wuaAWCjp?=
 =?us-ascii?Q?5Y4sEitBYdD7OvSq1ONMamjGURfm9Mq3V8HtclYvGzrmglatbi/yBl3losbW?=
 =?us-ascii?Q?qamHn+MQmQ7cvgx9Vx7XClkzWXY2oVbqouQ/hKZKzo1buVcQFHesuoE/4a+B?=
 =?us-ascii?Q?fW1Vwr3RevkIuZZB80Hcb1AJ3JSAgJroEde6/fkpdGU5waWu7G46FVZYMhot?=
 =?us-ascii?Q?y0qUmvuJaVlDqt+BHNlom/8wPelv0Cg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b23bb4-c1af-4b65-8b45-08de6413d5de
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 17:35:48.9859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAH/2GWmW/17sJn6WYxz9JsTSqePJTazysP3yX/LXNCD/28CJAh060K7/SKBvhCTtydgWLvVJfQ7NvCfcsRgtVKihx8KYkRpIGSplm43zEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7603
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

On Wed, Feb 04, 2026 at 09:42:20PM +0530, Vivekanandan, Balasubramani wrote:
> On 03.02.2026 17:36, Shuicheng Lin wrote:
> > Free the newly allocated entry when xa_store() fails to avoid a memory
> > leak on the error path.
> > 
> > Fixes: e5283bd4dfec ("drm/xe/reg_sr: Remove register pool")
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_reg_sr.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> > index d3e13ea33123..ce3dab8a0f47 100644
> > --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> > +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> > @@ -74,6 +74,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
> >  {
> >  	unsigned long idx = e->reg.addr;
> >  	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
> > +	bool allocated = false;
> >  	int ret;
> >  
> >  	if (pentry) {
> > @@ -94,6 +95,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
> >  		ret = -ENOMEM;
> >  		goto fail;
> >  	}
> > +	allocated = true;
> >  
> >  	*pentry = *e;
> >  	ret = xa_err(xa_store(&sr->xa, idx, pentry, GFP_KERNEL));
> > @@ -103,6 +105,8 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
> >  	return 0;
> >  
> 
> I would suggest create a new label above *fail:* which does kfree and
> jump to it whenever pentry has to freed.
> 
> fail_free:
> 	kfree(pentry);

I agree that using a separate label for the free is the more common
idiom in our driver so we should probably do that for consistency.

Another option would be DEFINE_FREE + no_free_ptr for automatic
scope-based cleanup, although I'm not sure it's worth it do do for just
this one function; we may want to explore that later as a broader
cleanup of large sections of the driver, similar to what we did with
force_wake and runtime_pm a while back.


Matt

> 
> 
> Regards,
> Bala
> 
> >  fail:
> > +	if (allocated)
> > +		kfree(pentry);
> >  	xe_gt_err(gt,
> >  		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> >  		  idx, e->clr_bits, e->set_bits,
> > -- 
> > 2.50.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
