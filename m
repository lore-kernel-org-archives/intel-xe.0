Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2788BEEE266
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 21:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A1B10E963;
	Thu, 12 Sep 2024 21:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBxIbZv2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFC910E963
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 21:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726177232; x=1757713232;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+ByUztauMSpZci6SRxii14+6xJHsYGgFG/KFAdYw+Nk=;
 b=DBxIbZv2UXF+WQP1b8ZsyXFTUx2Ynx4xLXXOI/Q0cLWOfTraZ5r6seYV
 eOiaLy0OCWx0S9f/5qRWcRwoCqSMGmkTN2jlpXNm3Rqil2ztdqWcqJ3ma
 pcbe7j2ds+fA/YjYA2P4yIP7/RntlOgP64Ep2cpvfHunZohH9ffCzc1vB
 3I5rfLO6WrxK0PSg1aqkOOE/OWNXCjLifyFRRf78msH4K4+na9ancENnp
 Pxofi9BntWTDXy5gpIM1lgrIhr0r10mUGmyhRFjkUHcS1qkHmSUhNZ5E2
 BLNCz7rznyYE6UIbYDj/8yZvVMcalaKQ1PlAekXBA9DU3AVfXEL0R3uaE Q==;
X-CSE-ConnectionGUID: i+dqWeVkQoi7knEpIyr/vg==
X-CSE-MsgGUID: xwGqbwQBTwaWKnFWows4wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36409269"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="36409269"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 14:40:32 -0700
X-CSE-ConnectionGUID: Z13JFTjOT7SzUSuhvGie8w==
X-CSE-MsgGUID: gLBXpr6gQNCowDxGJDm5Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="67777231"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 14:40:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 14:40:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 14:40:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 14:40:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 14:40:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1x1pTWN2/zji2doj9Kpr37fudxFZz5K3G5AOAo0RuGLCbC9xNt4nbw2F8yuPbEGRQZxf2l3nbUbCJL1h0LTi4giUR9G0BFk2b5Xyk8XeMUDe/gB2NcGuWdzT7xS5KhjOQnsRRwz2xIh/eGJ4XTZoP2xMcuVHQ7dgpbay4aXS02cTCG3HeqkeB6LD6Ex+h3nDXzW2XVvrCnAalp80NdJgXaAMsHB2wGYdBmviVbn5JIJGPXYCf2BArksoFSyFJZVN6d1MFyA8U3ejrhmLww21BriWg2H+X398pDWY9UxyBXqQoqAh02lxMC4Bp4z/p/KNB0RMgeO1Od9W4iZiqgyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D12JlOHI0ik2krTsh1g5yBlH/z6A/DsVdao9UNyR2g=;
 b=Hz+a+UAmdyt7fO9CifPU0zTx7pLsyuAtzXXhpa4Idhok9/Sr6HsLbcNhYElnGUor7fTd/p0INa2PXNKPJh58OObdXwuN7D/YBOuZI6OVMtZZWMUz4yrRoOvy2x0uflSJjDUxXxyFoEpz/9wFXH/J6QGDeCfyLjUgrrkt4uMHlMbFvQuWcANv5YiYnDfC6FYKqZkIF2GZYv5gWAmloBlM1npsBjSo33ZEVPFJ0SDi5baSs78wIAnDneI3Us0epdLHay0Lbn0DyQQyi9vGCtg2pVb5nQaiFv5huNB7Isc3614a1Ig9r0s9lyE9dPX47xGlqSraEiBo0uGfRxccKPEMNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7499.namprd11.prod.outlook.com (2603:10b6:510:278::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 21:40:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 21:40:26 +0000
Date: Thu, 12 Sep 2024 16:40:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Restore pci state upon resume
Message-ID: <a2zmirx4ymwjxrnh6ytkia7fq7izrz4cha4rqtzt7t5247ln5x@crcltza2zs3h>
References: <20240912190530.435976-1-rodrigo.vivi@intel.com>
 <5o4xl2avzkdnbecni3vg7fmtiw5lfr2ohuz3o6vdfqzjmkdmia@pd7naq6fa42l>
 <ZuNbKM6-oiJUIR4Y@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZuNbKM6-oiJUIR4Y@intel.com>
X-ClientProxiedBy: BYAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b9e1bb-78c3-4cd2-9329-08dcd3738395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jcMkMdft9uQ0WnVFWM4O6CuzVnDlgQ6stmJ80/BiZkdz//mSCByJHMw1QjdZ?=
 =?us-ascii?Q?Ju4xvd49l9W/6IuZUq+D4XrkG6Ru7kYGcwD67fEbKnwsjbaCxUEllfoY3SF8?=
 =?us-ascii?Q?Gmxf/EtJ3Rz1/AfAntKNnBpymTIN1RqRsDL6wXcsj8HhbS9v2Z5QtDSgvlwP?=
 =?us-ascii?Q?CIg4jZ+lwsbWRVU5mD2qXnwFTpa23koeLQfvjNizvAIj/B3GdXRDjSBOtjK0?=
 =?us-ascii?Q?Yht1GJ8Jsc2/uiZWvsI25Be+obndFzLfG/KJVZxkB/wHXk9w40xvaDygG0uB?=
 =?us-ascii?Q?KJWfpT7GRt/WDuGuflmrNn6zlg/pogUAGg2fYMnlmLSN/HPwMc8tNFi8G6i7?=
 =?us-ascii?Q?HmpQsOdQPsIkm8MXIvieodeXK1WF8dGhWz+FF68VXaHc8svqhhYJWlf+PNJk?=
 =?us-ascii?Q?5TpNtIMWb5/+WjVygfvE+yJphzF52UDoFRuA/ROnlUDljyK3NxlDfp43D0H2?=
 =?us-ascii?Q?yDOitxYeHCcjDZTTWl6dMMpK7f2Oxsin61mxpe4sCcYQSuFjtnnmCgj745ZR?=
 =?us-ascii?Q?BnWaLnZwg1OdE30/oNTl7f+eROW+KzLth4RLPR8uBwzkw3VRmByahYwOxhY3?=
 =?us-ascii?Q?RKaVK9g+IEFDqbA6+340VW5Mzvq/PYD2OkJoN0Yb5Nrp2Rsdmyn2rO6Up+an?=
 =?us-ascii?Q?VEcvMsYE032gzz+u7YxzfiTGug8qvV3M/DLJ9VjpypSo5hPh5+Du967AciJW?=
 =?us-ascii?Q?z/SOWFOac2/b468+2hg+bZ/5GqkrM1gQ3fts0q9JNwVXjYIZxCZ8itbyberc?=
 =?us-ascii?Q?LJsK3I+slE0QeFJfpCPg/9Z6fgitNNEqVCaYFPGgM/PgAlkjy9IiONCsg4d3?=
 =?us-ascii?Q?dMxBzXxJeTHPOrqTPODCgY6+yXFpJKOg7OQ3zPvkwmq9dVepBG6SbJ3A7LiK?=
 =?us-ascii?Q?4+T1ZYmMpJo7BePwS3eBmi53JV3ucDv+PhMSVnJ5zP0YkUHxeGJo/0ZWm4xT?=
 =?us-ascii?Q?4aeNMLol5zbfydxAuMV33skSLDfakRo+DXtOFEl0kTQG/iAgjvEKV78lWEAH?=
 =?us-ascii?Q?Tt7KW66f57TVmwlD6k4hfFvl1A+0oCprJc6c7bWZ8NlT1A0vY1c0RYoQxw0g?=
 =?us-ascii?Q?BVW6SUDuVFCqJWqcenppodZKREBBbZTSsEd2f4REOT1Qx3maOf7wFMbcrr4L?=
 =?us-ascii?Q?3aScrfrT84qvPVhJLenj9ELtyyI9B/wFnAEAhyIqWBhkZFMPGjxtdJUUAoL3?=
 =?us-ascii?Q?aqp6ESdFFCQecu3xT3vRQqEOTxyBSeA/YEMGeGVQGFqCXI4rjX5/7dcWyZTo?=
 =?us-ascii?Q?qB6IZbCuQlkg7Fm0vDR0djpkOWTTS03EXRt4mHaZM0T88sOzu1kExZ3+wy8z?=
 =?us-ascii?Q?rwXoyWcF3Dwe2aHsYBlueo4y0lYBVyWu2G0p4k06mw55tQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZhqgK7QH1Wfae3HBu+zb3uPSIL1Z4DDupf5PvVjdQxGM6TzIDONnTmSwCupo?=
 =?us-ascii?Q?P4Rk9Wc96T2pXp4j2HnsbJmp8P7EHpSBwpsTQ05JSAD4W3XsGZijtMAp1cTl?=
 =?us-ascii?Q?Hp+H9mgEvdnWP+0vRk99LJgjsD5s4P3qXWgKZZbE2JWK/Ouce4KfgkGrfGKx?=
 =?us-ascii?Q?KC6VRksAbz/3Yl/HNvnI0e8ORGx49q3q5ArRUX1Jbu2ZW2SRBbgGqYl5knUY?=
 =?us-ascii?Q?YXqYz39x5z0gOLeNJ/VZSreVY06qde98e5Khcg9mM6mcKMj5jSOhBGasAfyf?=
 =?us-ascii?Q?clQDZvMFhSovAp3J0Ner8a+6XFQz6qgJUA7QGp0DtiHRptoya7e5r5KqeQXF?=
 =?us-ascii?Q?79tbshh9WgNlJ79s083UERQafnDCp7wqYyVb3M0VXmCPOzTfOEM6TtgJKIFf?=
 =?us-ascii?Q?0hLtJgbN13UzxhrkNL0O63101/G3XmGCCtSPvFLYxSQ+D+ApxfUfPIiu3bVW?=
 =?us-ascii?Q?R4vx2DGSgEMej4FJay3LoFLdGbJHco4jE/H+GaaTGFsQdPZWwZZq7QJbxl6A?=
 =?us-ascii?Q?pLR01Hi7twdJ3e+iq0BTsY0wD87tLjvsp9aEuU1c/GZCa4yy+0wqTjqcARrl?=
 =?us-ascii?Q?ps68Mh2QbDcAHCGddaSEOSzR++2GSlHWxVf3UEUdxnHMilYEsZbsGuGtGURb?=
 =?us-ascii?Q?g13BqGTaTORsT0S7SdpAQiTAHr9fdiVWOpGgKVAh7jPHSEnKEt0z/Go8APCP?=
 =?us-ascii?Q?H+/VlEl++r6EPkVCFY/UF086DbJlDYrQruiL1Qtb1KMzOjKuYwZIaxQRgXkp?=
 =?us-ascii?Q?gc8ManOwjcFM6YcpZ5N3K1MHN0hbky9G6HZKmddRUQFuk/n3Ujp2CQpFpqYi?=
 =?us-ascii?Q?RehsN1kZE1X5AYV7lf9vv+kYLVRb3psS1qzevSfA0hpQL+e0HSXtzOl+qtYv?=
 =?us-ascii?Q?+HwdSn484pn9CR2PW64r3t3XzP2dnitCwqmTQdbFffWMmfRvA+rm0qgHtGDO?=
 =?us-ascii?Q?gFWXaQ8tyiun+f3vBPvT8AT3/bYTjQLFTh6VVf3JRxkpBqnzHptuDW5Kp+gG?=
 =?us-ascii?Q?sI/N/ZQlGcRmPsBroLspzz+g8VDxI359CJIepI4L/KFBUfKo9FVX790NIm9M?=
 =?us-ascii?Q?j158PW/TdeBS1ycB5/tnzOFIVRPdEX4yGD3HsKE2CHeL/OHgBf8hRXqlvv7q?=
 =?us-ascii?Q?gaTgmcpqPiCgTAV4ytGibJHh+v96iZ407ZNmo9OyQmdInPvFKavE8Uu/O2j5?=
 =?us-ascii?Q?G+BZuk7aYM6OxoDBJxM+GcJFJd+5xXmf0SQmxGdzbq/HK02RZSi9QaoqkK/x?=
 =?us-ascii?Q?225erhbc08qU/0MPdtkiZYBfbdO9IPBHVUHySUz0S1aU4NcCntxbJ8/nZUi1?=
 =?us-ascii?Q?xDsZZopkzAt2toXJKNcX0/dvQN0SfV8OyxHg2j0ezyH9DsbcGpfFYdrufXuV?=
 =?us-ascii?Q?kUATk+iodrhR1Fb9HTN3AYFMBO1KXnXX7c5dYZtuV1bVJ0NlRvc7epsprk0w?=
 =?us-ascii?Q?pqNMApFXAObVXyITzMKRo/ZpTiYZIklSwZVhi5tCxaSY6fIeLKWWUxdGSEIe?=
 =?us-ascii?Q?wng39zYwE/IzQIFTKZIU9V2/kVPy/s681f+6+MET3ZeEiWKwF09MsmFRw9bx?=
 =?us-ascii?Q?wBgJJAP2fhdWSHCYah5pgjQmW2LMc9kn2CxcLddjUn+ADP4vpGIXKbihEmNP?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b9e1bb-78c3-4cd2-9329-08dcd3738395
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 21:40:26.3505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxya9nrljv5mh7Hj6b4VnRk9aTq5IMTq+06Ice7MwzDK7dnf9u6o14Qen3u0C1lXmX8sHp7E62wfSB4Y1sh3UD21GjnHbv43czB97MtoaJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7499
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

On Thu, Sep 12, 2024 at 05:20:40PM GMT, Rodrigo Vivi wrote:
>On Thu, Sep 12, 2024 at 03:11:12PM -0500, Lucas De Marchi wrote:
>> On Thu, Sep 12, 2024 at 03:05:30PM GMT, Rodrigo Vivi wrote:
>> > The pci state was saved, but not restored. Restore
>> > right after the power state transition request like
>> > every other driver.
>> >
>> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>
>> oh, no
>>
>> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_pci.c | 2 ++
>> > 1 file changed, 2 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> > index 5ba4ec229494..6d29ef4b396f 100644
>> > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > @@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
>> > 	if (err)
>> > 		return err;
>> >
>> > +	pci_restore_state(pdev);
>> > +
>>
>> something bad happened... I was sure this line was here before. Indeed.
>> git log -L:xe_pci_resume:drivers/gpu/drm/xe/xe_pci.c to the rescue
>>
>> See commit f6761c68c0ac ("drm/xe/display: Improve s2idle handling.")
>
>hmmm...
>Perhaps
>
>Fixes: f6761c68c0ac ("drm/xe/display: Improve s2idle handling.")
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
>then?!

yes, reading that patch I don't understand why it got removed.

Lucas De Marchi

>
>The restoration shouldn't have anything to do with that case.
>and it pairs with pci_save_state(pdev) is still there...
>
>It is not in i915, but I have an i915 patch to add the restore
>there as well.
>
>Also, I might as well in a follow up bring back the
>pci_set_power_state(pdev, PCI_D3hot) to Xe.
>This is probably the right way, aligns with all other drivers
>and i915. So that shouldn't be the cause of the power drainage
>on suspend anyway, or i915 would be also draining it.
>
>>
>> Lucas De Marchi
>>
>> > 	err = pci_enable_device(pdev);
>> > 	if (err)
>> > 		return err;
>> > --
>> > 2.46.0
>> >
