Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248CDC83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB63A10EA7D;
	Fri, 11 Jul 2025 16:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBjbjXRM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFA010EA7D
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 16:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752251482; x=1783787482;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gLa/fbiRY4L1lJ1mJ+ILmuTuqt0vIrgTmTX0W9EGaRI=;
 b=OBjbjXRM99YHX9HMdGX7pqDlMebI+LQWbj943j9Gu/JXcucdzmpQmjVU
 ujyuY9L+3dkizL+NCo6e7J1aq/gI0U4N9ACKIgYVLpANQEBi8eH+UiVkj
 dpBfI+l1EAgaDuOq6+i8mc7uCu0M2eXi6ZDp8BLzENCxZJKtGzhVdZf0G
 M+QRA6Gm48FhTcA7ysGL/Obkb2t5y1iPinr8OtATdCOQGtTzVoHdxEojl
 WDYUIri4I2I3qfTNSd4/WWbn/uKyYwqsJwB5K0l3a9VX0ETlNwRjgjR14
 YXStQYjNhkMX8PL2VHFDrNkKU13rB3EmHCMq3ipy64OYz7EJBrhFqTHbS A==;
X-CSE-ConnectionGUID: P1Qcz4jARFKXaCbL1qXxog==
X-CSE-MsgGUID: z8byuyTbSpOjt5/dvZHlfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54410298"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54410298"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 09:31:21 -0700
X-CSE-ConnectionGUID: 2sshpy83T3eJPoYcviw5Rg==
X-CSE-MsgGUID: jSCU++KESsChgWWehmn+mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="156741544"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 09:31:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 09:31:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 09:31:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.82)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 09:31:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfWJ6Px/nVb3VZ/a+ZqBQp6NP30faYSny7fd7maTE7TjCjzvwoJt1ADI7r4bt+CMpsCQpSDA4uaOOb0YqvZtGKF+vJC+Xbmk/oMF/ts3YLKAjyMVYmeZE1u946XxsJeWGXl/TMe+pZE75D8EOy7DLcA2qjGRpAJKcVKj3VlDVXvGVSVvazT5uStMZTVNhFDMoY0zfgpo62lriteayzHxqlP354v4ssdEf2uyb6Mo8OowIZIFHzUDZLPhejmMzgwMQIaX5jJ1ht++y+5h3QD0kbFAHx7reY01MrsiNja6aYCzvqb+vgviP6yOQrUX8xMRZFucoR3fYScL7MYk028hWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLa/fbiRY4L1lJ1mJ+ILmuTuqt0vIrgTmTX0W9EGaRI=;
 b=nqloOjbTer1w+GTILDF1y0aiFMmeSoCzQbWsUvpxfv4U4ac3Ik+9SJ0PlrvhxnpOLjB33RjgVITJm4Y2U3ynPw8TSCCsW+fIgTvQr+WbXIb39rLs8nps0uSEWylae9KQeSZUjiz05HCypzXvjO4SmFvG+Cf62E9XA9Sc/hcyW/6fxEtpR4K2YoCPbc0kMmynZE34sKIg/pnEyTk+LKiwpB/cPfsUy0QyvV7jbuCCZ7biwf7/lguAqCSOVG9nnEOW5XTSPutnKcq736TRIrtI5Z9AqW57/36ATWdtOkb+8m5hTFfQPNP+qOF/TNvr+KocpBfwAPwjHBM0LAvanDRHog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6665.namprd11.prod.outlook.com (2603:10b6:303:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Fri, 11 Jul
 2025 16:30:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 16:30:30 +0000
Date: Fri, 11 Jul 2025 11:30:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v10 5/8] drm/xe: Allow specifying number of extra dwords
 at the end of wa bb emission
Message-ID: <xemzmdequ4bfhov7vhf2v6vzehns7wi5fbbtokannf7mdt7b7u@zk5rcermbqef>
References: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
 <20250711160153.49833-6-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250711160153.49833-6-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dfe04e6-81a8-4895-b5c1-08ddc0984053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Eef/sY+Ef/Qa2hJXw6893/cc6d0TH77U9NEjGo8LqMamsPT8rfkwB5Gqt7Nn?=
 =?us-ascii?Q?CR2vRPK0Xqns9nVT3wJ2Kp70n3t76SJXN46uo/JAru/7O2GQAzOw1t1Gq23w?=
 =?us-ascii?Q?xzfEm8PRsiNFL50fwUDK6u3aabdGwVgl/m0Ve4TjMC81FTYMzNGnPt1dKbKV?=
 =?us-ascii?Q?ZL4DNrdIkcjLZiLaxRVrsN4CTtYO2CijfhPKbV6/PV916jiUgitFkwJ/gZ4D?=
 =?us-ascii?Q?M3+CCAGA+qsLyZM44/j9Fa2QAVOxNTfXopqZyiA+3w+7FtDN7fg2ZtZT1nSo?=
 =?us-ascii?Q?gzMfOnOUNH1enYzaRtxhdIfWByVEE6Mt9lO4IygpHriJtLg6I1Nr/2+PKGxp?=
 =?us-ascii?Q?WjFcKOOOlEPftXKG/CU0KUY6XUhL9ibIHljYFjoMGZowmRhRvkXRyqVVgLPw?=
 =?us-ascii?Q?xg4Z8XYlzuLsiPYZOLPubRZYrb/xBK4YnMihazkNRTl1J/tA0/dlnmSP3HVh?=
 =?us-ascii?Q?qsjvC2zTV7ptpJNFm0MrGrbBYhoPygB9xJD/u9fVJ7vZcK+JRYQZJYPgnS/e?=
 =?us-ascii?Q?nK48rIang2qaisGrJw/ygdIqQQNktR6v+u9GkhcuarjGMUZFTpAByYhjPKbT?=
 =?us-ascii?Q?nRdA6pyM2zBMB3S8R0vJZG+R2UKyzzT5Pdpcqp2VRdl+6OMGoV1wfFwyf0uO?=
 =?us-ascii?Q?bWYkgKGxXnIohmFMTe6NPw2BZHD9ZEtqzyAxxLaub5CCEihEFgcAZqI4vTlR?=
 =?us-ascii?Q?K5gkKywLkHmq+zFJqP2WaBGxNH91qEZY9fhTlbGn0OSNjWBWqV23pL3ik5Du?=
 =?us-ascii?Q?Nvh0y/YNwsrPXiajVHakXgfzz4StxPoyLP0jCol3CLPW1FQghEy4W+D0PPk/?=
 =?us-ascii?Q?F6E6QQcYkwTcVtzPF2ijYp5HLiKQtcVbnyWL2FKyiG9mYtrVnQRAUUCy/EpC?=
 =?us-ascii?Q?Zwr1Al4IpksTlmSO4O4c6ZFj1Tmex62pwrxxhhg2CX0jnv36hqidhN9NxmYb?=
 =?us-ascii?Q?tRZIJZdpYIuZHOyOmMLhnGqcyz7wka9zFH4Rta2ZC+HhMLA+CK5VYLxyfgt2?=
 =?us-ascii?Q?OVGLvUh6ruDtzyYry3brhhcJzmdLcr7PByMEs4LjxtXdQbEB8aVlmDn2miQ7?=
 =?us-ascii?Q?n7W8gR/1acjs5UmkPxOqKEmvBOKZbANcfTBZdC3WiAN4WdLQfIQWDO78vRhI?=
 =?us-ascii?Q?/iXN5FOTN8ZCB+qFDRGKp67+6lYvn+yFCgMDTDTY29PeUsNRJkwbvcuPqSo5?=
 =?us-ascii?Q?ucmz8YamiD+hBs7LJEf1D2EEhI/2a8LtbzldBFYYVx5FIvRpTj2jAlFRxjWx?=
 =?us-ascii?Q?/0EXgNIOUyMgG5OIoyh8uG56aoEUHNNTCphuCk9WttYKsEdtktJ2n1Q+y10b?=
 =?us-ascii?Q?l77zQsa7dweA+Vchu5huzZ8JJVYtzPxm0Q3c462aGs9cDjdOc3L15L2uXb8o?=
 =?us-ascii?Q?hxn2GEBXZj7J3aHo/gFT0ePgJPRNqqoxqHz62IxA2HLDpozHA7xJ/mYS45xT?=
 =?us-ascii?Q?pw/pv9xsGxA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8rrQSAuUkUqbM8Th+qGTI1ZzKZW9Bmhy+WkIYnvuyF78N2TVe2zqYnWgPR3L?=
 =?us-ascii?Q?5HI5O1/L30MwPDt++dGToiKG2N/67AZ+0ouLdRB8swnDfzAaR1dlCKbR7K5p?=
 =?us-ascii?Q?vID0LjEE13Pj9qtza577ZvpeIKMRaRrOYT1LTPbj/cb880uRhfaHBFbMfQMb?=
 =?us-ascii?Q?7CS6xUQU5HyVGP3LUhkM8Z5ib1XBbMsq/l6+egUvBcMMNPhRN+FnWBluYBUW?=
 =?us-ascii?Q?kAsX+ub1eHxGUWlAB5J1Abjwd9rt3xk6JByOtd76o62rUGc3iZ+CvbcrFGX5?=
 =?us-ascii?Q?/23IYySQRSiRCFYqldQK7DekjuzCheF4PDtxZy+oRhw2SVnR0rxQifh7V5Ue?=
 =?us-ascii?Q?UfWStLXjql8jJSzOB39ydBo+X99pE5jEH/LyqCoSoWi2wn+fZHVRJh94kccH?=
 =?us-ascii?Q?bBMyxDOLOSdgNtIV8R+HO4kk/Ex6c/y6z91T1mQrW7wTkzhBkvzvmegQay8R?=
 =?us-ascii?Q?YlrWPB+7wgsVN/MzWpWx7Lv1tUuQG+aNuENAMboq9SpnVRzKXCgM8Bt7A/TM?=
 =?us-ascii?Q?dBa40lBZNkthhUlWGd3B7QGOr/guvYWJhC6wYKN3MADrfMdplcRLkvzjjf5L?=
 =?us-ascii?Q?5FmgRgCznTFvvnV9OPZD5RVICcDZ2/EVXs3ktW91M83hIcq7swhOm9/TrX5e?=
 =?us-ascii?Q?3DB6RM52UiqAWCyCYT+FRIyfgufroFOoiTOVXpqhQYNZsmYQz9uT2vkkx5OZ?=
 =?us-ascii?Q?FA/TjR6i3sAohmZ/6jXiOZCLpEdwDCXzG62rPI6Z3hrIKMI2KECdboQ6z9k9?=
 =?us-ascii?Q?ENHrsKT4VDixHIfE3RAmLCpCnYCgd4W/rRAwR94XPpY16S1dA/tx8UITqm7d?=
 =?us-ascii?Q?UGLlYRG6W9xP+MAK4jNNEfJtuZ73Jx3R7j4KQqlvwmkG0kStDimfiVPAhxrT?=
 =?us-ascii?Q?tyZXdSniayKzkQUtdfvOoCpW2kf0XYy2tMYBvLuRfrR/jvQWoaGs7/asbGaW?=
 =?us-ascii?Q?Gymv0nq92bqzP9JBwZBp5v9FyMDiq6DcoR1YLpA9O1Yxhl0THRIySY3skWMI?=
 =?us-ascii?Q?48WqRnjzC9L4SbUy2SdGDQuPMpp7QWcNQz7TB4XBSO8eEy33WXp10T34rEqs?=
 =?us-ascii?Q?k3slcqxM34BDFZz98oTkZaZDp400uhwdw+B3WPGvKsrD4ok8f3VXTj7bIazD?=
 =?us-ascii?Q?3PSMvkNJ7XkZE8juYwoJOu/BWS2jarxwTmwWhxjp/51ObI+5x7J/YT5BKI6H?=
 =?us-ascii?Q?DxiwojqvNRrmZDSkVe1tu+JpabKA0mLG1NaTFV9+YBugaV1GJRiSGMbKE3Fm?=
 =?us-ascii?Q?9Rrn5c4NXf7kwEH1i8FSDgW7BnMgJn1gA3uyPiMRSjSKVcP6zGxCss0gHUbH?=
 =?us-ascii?Q?c5hciWm8z5Hqky1r0foZ1Q1SCa9LO01d2UUTa39koxNo/jJ5yBtO397G6Iss?=
 =?us-ascii?Q?wRo04lUeI2KxQ57Zaocy7iiW4ZjFpTPC0wjr3lj8yECb/drxQolK9lw48GlA?=
 =?us-ascii?Q?lCHznhZUQ7Dyi96sqmvp+QF/7D5tPw3Pj3d5LkdlPX5iREh69+LdS1mrmmeo?=
 =?us-ascii?Q?tKBPrNJ7isrol7bi3pOt1aVKQpudLRyCTLxyl87166an+JQpqfjU1QBaAJZa?=
 =?us-ascii?Q?GWISqeEAxeU00tFfHjT4X1wVP7a76SG6iKb+smH0vPM/v2EuVjhxj6nNo1vq?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfe04e6-81a8-4895-b5c1-08ddc0984053
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 16:30:30.4817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdzMJPTKzWfbgQHRaOfum3d1DU4Tevr87S1eCcM/Ht3SK/hv+3xp0I15FhQibRoRDBimhYuo2+KcFLKzCoQb/V7YOyNVnMO2RueU/3yfELg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6665
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

On Fri, Jul 11, 2025 at 05:01:50PM +0100, Tvrtko Ursulin wrote:
>Indirect context setup will need more than one.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
