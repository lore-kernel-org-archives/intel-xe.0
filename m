Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE9BD3E194
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 23:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E06F10E9DE;
	Fri, 18 Oct 2024 23:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3LJmJQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00D210E9DE
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 23:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729295794; x=1760831794;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/N6tkMCn5b+LXcTRG7R8s9KG85bKyq3YvkLTOwLczsI=;
 b=M3LJmJQwG1u1SkTUC379Y7suyqPu9z2n7PKKm8K1FvA3b6T7OeLx/SSU
 gJ7v2zpw+7EoCpRBKSecwP3Gofccj7gS+9QObwGEKTgVuxeXp5VDekgG3
 sGa3Abv+H2XMc72D1xgbY9IS7fiQtQBGS52owGF/m+Hnc7irutmrHAmoX
 6TzC6F1JdlQax2b+ZFAN0IqVN/YONbb7YXRkwlnKZ0u3CnHZxCNgyVKXC
 X05/ZbLqbI05HGT19zIsWF4A5DHJq6FTsdNFavrJl+QQCBbMFd2DANowW
 J7UlJse1Ta2EYcgHGoMpz21lqlSqgzDLSAc2X4GOOXWv70NFFX79Tex9v A==;
X-CSE-ConnectionGUID: BEyb6g4dR+i+km/ToMTxzQ==
X-CSE-MsgGUID: U9EzHUvTQduzZ+Y+G54xzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="40205959"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="40205959"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 16:56:34 -0700
X-CSE-ConnectionGUID: 420OBHfdSSS5tq2Fvxf7Kg==
X-CSE-MsgGUID: tuHIDBPIR5yShQOpUUtAfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="82973606"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 16:56:33 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 16:56:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 16:56:33 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 16:56:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 16:56:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 16:56:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSOrIoqHy97fCm4zz231w5Yr1Ii/kf3BUZC/iMJy84J51PPjsDWVbA2+9SCsKZFoYqVvdlzLxgdCTcO6PEyaKl9mjj3vywr/AUsI3Tt276yFM9dMynQHafzlOQMENFkAxelOLLLgILj1n6Ul8OmMho9TjOlegG8W3DAn0CTUwkE10FLdwl9CWT3Dah0rrYTIbd+NiyUd+xGoGO3fh53cgdBlcLI+RGfq8peVkje4wxqb0tc2N/pd4m0crSZlTXaZsRDkOSykfhj3mGx+skgA8n3pz/lzBHFmyrOaDv9nnKmumtzCZDQBHR96hT4d7sT8+p5LYVtjIv2/h6jj2iSM5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBvR4bTPGvzRkCX0vekdALZiieQJYCeHemguLlh2LPE=;
 b=ZNkJXz7dKzXjuK5+JLqFOVwhw2jKJ2PMdJeFjlRVYtzQJwdrCk/tyxzaH9QdRuKTFy0jssWLfnmYC4Tz5CW1Lwm17+ymkm9NvSQ+/Sb92E+wO17+3WpZGoguAvMkrmpFaghHRAR0FSuOiD/nlaiSQjoBYt4Bvu7KS8l45tM0skgfyp0LfJPPtdhm/pVe7LWGP4tBKABpzQ8VeRYuf8swus/SZNQH3mpZdz5vr+RDbie58DcONKSATTFkgrwZIv5mFKC/n3GMGZQ8EhYUYGVO69FBCy4nNPh5x+2+DBd10M7+jAvLgJSp0RRVUx3Q7v+QpenNkqeFj8S86fH91Sm1QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4624.namprd11.prod.outlook.com (2603:10b6:806:98::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 23:56:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 23:56:30 +0000
Date: Fri, 18 Oct 2024 18:56:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Clint Taylor
 <clinton.a.taylor@intel.com>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH topic/xe-for-ci] drm/xe/ptl: Add GuC firmware definition
Message-ID: <big6kuoyb2aslqpxap64vvsnpc6ad6pws3254wicwxcc7zpfy6@m3lw6siylydv>
References: <20241011163920.7926-1-matthew.s.atwood@intel.com>
 <ctp36giso2dqutyhnqwsr6im2lwyvgh3jvzel7p7fh6pmw4x27@z3xnizpxofcf>
 <yebatc632t6a3qysnopru43iz7tnzct2h6vrsxywouvq2icb77@cfhrk4kgjl6v>
 <mdiqjtjfw64fh3pysmc5ndpegzepnglusg7xmvsqbbmpyw36hq@uvlmwdtzqef4>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <mdiqjtjfw64fh3pysmc5ndpegzepnglusg7xmvsqbbmpyw36hq@uvlmwdtzqef4>
X-ClientProxiedBy: MW4PR04CA0339.namprd04.prod.outlook.com
 (2603:10b6:303:8a::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4624:EE_
X-MS-Office365-Filtering-Correlation-Id: 367258f0-8fd4-476a-93f3-08dcefd07cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rNY9nXCKOiSt1k7J6ugZpxwzvJmPegJOncYMXun9WvHVv1DcqvQW0vsDeyFX?=
 =?us-ascii?Q?Zu1IDpYGjiXUTCvbAcbRXbknnE7qbxruCT5dxXQpgF/dj3s2eUWP+cUi5F29?=
 =?us-ascii?Q?NcqjGXPixqDri34qp8oVRh86pGZ/hPMoDKCQZGY2Vt5jL/OXnywgMxXNHjJL?=
 =?us-ascii?Q?g020M3F6hwUIOLOZjGp4yfYU7YCUZXvvAZhTHS8Aqg7uB1Otx/pP2gcvrQlC?=
 =?us-ascii?Q?mBjOig1YeGbCMNLgSOnPMJ8fKkffsAPNnGlzfsGd3L+hk9wvJ9/+uRihtloR?=
 =?us-ascii?Q?5iIeEWyGmGu47jpeBDiy8RRSimgBnQPNs3OArQDFZD+rczieKhA4ES9Gepj9?=
 =?us-ascii?Q?bP4QrBIYRRnvYxd7S9X+voKnjGdVx4gO5Y5FjH1vnBEA1IIemsCbsLyvawjM?=
 =?us-ascii?Q?ct4l5sViNO6IL1KAfxWvOMEmcQ6/OzvgXP/eMvA/Df4pKCSa3LWsSs6FwNIQ?=
 =?us-ascii?Q?78uEYRau3vs1AvxdAup7NqAvKg8WBQizwy4bS3IFEqwob+kvz/PBT9R1t38Z?=
 =?us-ascii?Q?/FD+weQMBgmPMQ1xSBW/Twpy+Ia0kf41UyN8uxalLAARaUiuhYIAgESwYDcJ?=
 =?us-ascii?Q?QNTfCGzrcEr++WoH/Fkp4RluMA18U3Ui69Yg42Sr86dtLmVVp99NjSbL3+0T?=
 =?us-ascii?Q?TVMdVpp14R2t6VW/99voThQJbDeHGHjO/lOAEdcaP/YOYFOvYM8vdKII2M8T?=
 =?us-ascii?Q?Og4Pn9sy+h1VkMOrm/VfO5Yo1Y0aIY1kQ4NR5RLrF3rh4AAwJawW711regjV?=
 =?us-ascii?Q?greLnA09QFBG6an/Gi4eXrykynW7Pm2fB+nNbo/8cqMJXhyVZsSYzJP1/wEc?=
 =?us-ascii?Q?9M0vqBPo7xViue5/lI27Wln9GeGuSv4GiH16soN17wk3iBiQ5tbkMPCiaxKF?=
 =?us-ascii?Q?2QSENk1pb3z6UF209fBikc5WqYoze7LYEvGjVUg7BLYnF/5Gh2z6TaFY/UM8?=
 =?us-ascii?Q?mJiKq+FiL6anKj+7r5v1GQMOnbCsq6tN+5pq2hhF99MNzOBKlJuYHo2ddo5p?=
 =?us-ascii?Q?cdge1ZUTMRxJrbLAEdenc8pKhn+AceJYuJ6QQPeyA2U857mh9DV6wWJ+Co7L?=
 =?us-ascii?Q?fKL0dEjOJhvbgBQS+mnciuSAAx98+71LYvDo9+D/djUirYKsIAEY872LGOB2?=
 =?us-ascii?Q?oMSO+mfSqQ/MsZWUFAFbiBzO9IqBxi/qpTtL8DA8RoJWEtJahaF88ziYl2rs?=
 =?us-ascii?Q?/PTnh32Y1NzsbCzTm4jo6zxrbfnC7s0UFpX3BYp8222ljsgMbU0eIkQ+bHft?=
 =?us-ascii?Q?HpsxaoOdcQ/YmS+4QVQnEKsSkZ6bVz4hvrF4FnpeUHMV+ALSRnJgg7bcKBaY?=
 =?us-ascii?Q?JW93mZPYRyTc5QL3xOEGyk0V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y3iFMuDqg4Moxzo52snfdj6Rm5pCcR3z0XSn8CbKH0NdLnMLgEnENRSdDs9G?=
 =?us-ascii?Q?Xd2sthVWZvKAEYSynb9dIGzua1eKhMlQ6kJl0nhTP29MfS0bo+eIZJxjTk7q?=
 =?us-ascii?Q?nrOKgp4J24A6Dz1/sEDGFn54q5HRMLIN1VnEUVsgcnWAM6+A3HDV4/2xDxC8?=
 =?us-ascii?Q?9abZDmMjRLjCwv/bfs/1hagFGfHOJokxkHJXipjiFPQIf3VVFMjFPAP+kxmD?=
 =?us-ascii?Q?g8RDFXWVanYd9mg8oLFinCL74Zig5sVLFeyTxijRdBHJdGOoEEiBx9HI4zbv?=
 =?us-ascii?Q?MmEymzXY8dTms9OmJF0L7f3HhU1YimLbFb2t/RdsI/heqOA17HsPoVBaPNw/?=
 =?us-ascii?Q?l0HsANCZI3nxgwJio4uSGkk51V7QJ4IatwTc6KBBKeE/WaXErsarG1d4Rbq6?=
 =?us-ascii?Q?fPEmjgWgpUj01WS+XT++OjRpE9mWs+Av9rUtTuBARZuEMBdSRLfTuxL8v6dv?=
 =?us-ascii?Q?HAOscuBHdLvPLh5l8sDctpJh4gsK8IIErP9AlfXOvy+dbmQprJ3bpu3qV4gD?=
 =?us-ascii?Q?fKNomvx0RODhPgxCaJY2JNMRBnMSh3FtsmYGfcjCP8GmialREuCZLyEtaIHf?=
 =?us-ascii?Q?SkCWs7BNcYqjGRYc984lgwirox8vjgCqIZBkxE3Ip6UuVZqmuMcg+KLHHQ6m?=
 =?us-ascii?Q?EmTJXxYZUY/MsLoVsKyEnL78FibuQwVIvpFBMahEhW+0vxHAGf5NuXXJtigX?=
 =?us-ascii?Q?Sn/X0sQLZiR8vWQjXl3jNNioP0N+SkNp+BKx9dGCGxiCKpt4vC5g5eP+nbPj?=
 =?us-ascii?Q?ZXZTYk5igiiO7PAujSmWjwQDks4N0k6cpMtBodaghoImxN5SkP5shSy5GxEs?=
 =?us-ascii?Q?9ITStt3xr+EmX91gt2i4zmKhZ7CXWOsfb04xwfK1QoVI4qXpDZWINPMyqXgG?=
 =?us-ascii?Q?RsknPHEcN2boF3W8VeEewqjtfbPyk77ksfqyIA8Z84MxtX6aYJ9YrkPKClnH?=
 =?us-ascii?Q?VOJ/LpnAUyZ9vSKYKgbB1wri6D1CfBgad335Y7VXpTFdlmLgR9r8N2lDsEQV?=
 =?us-ascii?Q?mfL5gHfLZoMshez+gcJWrCNcZvdoj7EYXfeEmbkANfeXOHWIdRny8kgyLB/y?=
 =?us-ascii?Q?JZ93AhrKWxrZX4RAU2aDwnw6BYTzWSmS693d6QRvN82PpVf2B4Yw49klrVgf?=
 =?us-ascii?Q?yVvEbPwFZP5MSVaw9T8T9I0fFusjuOeVcFupSCVzj9ybD6lIJXZUAUkODLRy?=
 =?us-ascii?Q?AE+VsQvGbrRkAcby4T76e7iDegK9UPXPS+YyUlPuE/G1PCP9ejzA2j+hRAto?=
 =?us-ascii?Q?MLacKmIg4Us5TSDvI8ntkwh/uTWudhqtrw2GbCkbdfCQHM7t6cnvffOKH3/l?=
 =?us-ascii?Q?EYP4mJ2G65pgJkEEjzYcBUOlWQ3uwQmU4tYQTt7Htr4iZ6VDUQKj5JSEOdFd?=
 =?us-ascii?Q?P+jV1UktVDvkE75nJRmbYxHJh5s0Ifrnv9V7D3kZeoSqT2k8Ln/Ly2TrptpA?=
 =?us-ascii?Q?lWJm5aCE4pBwksMZUOSlu6wL5eKqo/iKdwi5xQLj6052hm0i6tH1ImaiSPYe?=
 =?us-ascii?Q?KmvRV+buNQfsIIhYNJt3ZyFOqIeJ7QwiAWPw3nFnmkdpE7Y/Gnatg63pR99W?=
 =?us-ascii?Q?tKk0oQDVbk2kXAg679VXp2NQm5yvw0XIC2OkiVXRvfFEUKAnQB4By8I/W+eE?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 367258f0-8fd4-476a-93f3-08dcefd07cac
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 23:56:30.5478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtJ6LVjN8IugMNI/gPSNu9lYTvGODcJveiMpAAroa3Z6A3D42J4TUS0E03t4HC4bwbRyYVsXPnvkFK4YvYpOXwhsg7PB3Y/ZBTuw4qZJBow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4624
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

On Fri, Oct 18, 2024 at 04:14:23PM -0500, Lucas De Marchi wrote:
>On Fri, Oct 11, 2024 at 10:01:41PM -0500, Lucas De Marchi wrote:
>>and actually Cc John.
>>
>>Lucas De Marchi
>>
>>On Fri, Oct 11, 2024 at 09:58:15PM -0500, Lucas De Marchi wrote:
>>>On Fri, Oct 11, 2024 at 09:39:20AM -0700, Matt Atwood wrote:
>>>>From: Clint Taylor <clinton.a.taylor@intel.com>
>>>>
>>>>Define the GuC firmware to load on the platform.
>>>>
>>>>Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
>>>>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>>>
>>>+John
>>>
>>>We can't apply this until the firmware is available at
>>>https://gitlab.com/kernel-firmware/drm-firmware/-/tree/intel-staging?ref_type=heads
>
>so, after some back and forth on the best approach here: let's apply
>this patch as is.
>
>I have a patch that allows adding entries in the table behind a build
>config, that we can set on CI config. That config would hopefully not be
>set by any distros packaging drm-tip, so they wouldn't see any warning
>during initramfs creation. However in practice this isn't of much
>value:  the warning is non-fatal and anyone looking at drm-tip could
>deal with it.  I very much doubt any package is actually following
>https://gitlab.com/kernel-firmware/drm-firmware/ for those staging
>firmware. First of all because we recently moved it from another repo
>and nobody noticed.
>
>On the other hand, adding a config needed by developers means that when
>they forget to set it, we will get  a bug report that PTL is not loading
>due to missing firmware entry in the table.
>
>So... let's try to keep things simple and fallback to a more complex one
>if things don't go as planned.
>
>Applying (soon) to topic/xe-for-ci.


and pushed. This and the HuC one.

thanks
Lucas De Marchi
