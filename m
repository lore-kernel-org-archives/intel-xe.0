Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71889D6AB01
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 20:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258E510E02E;
	Thu,  2 Apr 2026 20:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SyEar8Yi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C51910E011
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 20:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775161240; x=1806697240;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lHU61FzrUJizbxEaSlD2bJbMiEzKH19C5u7beVJo950=;
 b=SyEar8YiF4AFdHyX7iLatPAh+8ffofXg3AXitjyeFBnLAgRFaWHtBT7P
 7LV7RnPa2jOiaO7tg5JW7TVdgEfNcqUxaUFtbbSi/33StinFnHnEVuNHn
 0osr7r739MuEZq6HpJvcOEkHUiO5kdURvRZnh89090VxtGkr6nrnM+4v8
 gM5FBIq7atchtOYvxiv4HIZwujwGfglUoQKofQO6KRObyfk4sU/0/pyR4
 LGwFFG4FEKuHiLL8AlKGgWrAEY2mr52MN2TECjkg+ex0dKdxHgSzE14Fp
 Vq20ve5PB5G6+GgXJtCE0z/j3471OyV5069YCdqM1F0ypZIvOWd1saEt3 A==;
X-CSE-ConnectionGUID: d2rV6xbjSieitdXXm7aD0Q==
X-CSE-MsgGUID: /2j1TehdRMeCMNyqtx3CpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86531713"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="86531713"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 13:20:39 -0700
X-CSE-ConnectionGUID: vPCUC0hES3uPXHmaqDBrzw==
X-CSE-MsgGUID: 1r2DQknnTmy8ogG2+qVPQA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 13:20:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 13:20:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 13:20:38 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 13:20:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jb878NNTH98zz1jh/Mu6cogaSy3fk0WNePCMzldGx9+NDMxwUxeXqVAU84+q+/o4+TDsJPy5qFZ66qOSLq+2YLstpS6WEvQWKW4t/ZUHAVfGTKYqJcRPQkIwWrnV/Vjz7g8rKRg/HlQyxfK42mRmBegb13G1l/cgWpE1XJwOgslHoOJp1bgsxwMEq+tcGqQoX2h6FFcLMV6T9lDiHb5PUsQ9DBoFUyFUZodSwpVSb14Io1A+BWAVYp1xKS/sSnb4M3kGCAGeud22cp2aaf9+G40ohHJBS7QJzwBjJ+011O8LBMPzzcRUUY5uv1r1Duw2u3YrKaTftEO1JlVvqzomUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2x2Ke2EA+45i4eXaqYZxuT/8iL5fN0e8GSrH475s054=;
 b=P/BIqmC6RFJT3dQ4vExFUcjsc1NgcVxOg1LH64noHF1WuSPDnBIuMIPo5ghzmcURjbCbrPFY8PLXO386q6RiaErMGsk1XkQ6PJpeaHMJvrRRVNGniPiaq5DAITXUneDsLJy1gK/g+GCOmsphQq/43pxkE9wt06HpamN6QPGdqLAL8NNg/FzqYN4lUHFcU9nHi2eN31c7OV3VtozeW5UWHmp3lijppoIyCrA1pA7IafROjPHMUisc8+S4LtPGdsJZfBYr6jCWJepqArf0m0DHgtK1nMP9aEGtR3fDsP5wxT6xTiGt4m5JjzrJOolb6UVESX7xlUAFPCXCkBWNiIEIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB7560.namprd11.prod.outlook.com (2603:10b6:8:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 20:20:29 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 20:20:29 +0000
Date: Thu, 2 Apr 2026 13:20:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH V6 3/7] drm/xe: Handle physical memory address error
Message-ID: <ac7PikDrbonyVuqw@gsse-cloud1.jf.intel.com>
References: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
 <20260327114829.2678240-12-tejas.upadhyay@intel.com>
 <ac3Ac4n//gB3raXc@gsse-cloud1.jf.intel.com>
 <SJ1PR11MB62045BE3CC2D605CEEB271CD8151A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ1PR11MB62045BE3CC2D605CEEB271CD8151A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0260.namprd04.prod.outlook.com
 (2603:10b6:303:88::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 271f9267-f271-4088-5c61-08de90f54888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Iuce69Zvn5sFcH4jHm5utUaRsIUkCRHkOTu6wxyiGXlZf/91avQWfCw9X8GUrOlXZDntFTHRCgFdw24KEYqJR94RiI2YGhPRPWHKKvoOolqHJaGsgXwmyX/GpiafuEOSF+Csst2C8yf9+SPz8wfh9jrS2VoisOPzO0u+sOfmyg+Tv4l+PwF7XxK72JPsGEGzh+XWMoHydSwam502wIXui4vwSQJcG8ae9kXnJbkdvuO/dujkxKjQzUjzw1YvxQkPQ9BJXELzVBt1C979EOAj5m5YBB2ENiWhGlPtAwOh/RInIPlh/UJ3iw+4vLsOhkqfzYx7WnSHrLBuGq29iYGJoly+o0gj35LleqR2JzbBDl5w4U6CZ9CvryhzZfUAnRiQTbwfc+1j4HGQYZkefOyD0WH2Psn8vsXmW2pqnyH6OtIqlAVjRX2CP71ZZA9sMeMcXGw6Jb0K4hnysXZvttZ2JoVFs/RSLWKjxQAT+2R5SOAYradJt3DJVJDj01VArqGdBXFhCyWZtAMKOdGoo1PPx1p+4G4U4YZeWafDnRczjM1CuoaWkJsww928/RhqL773SsZvE3eMCEuakBxa/GRLSs1kHqEU6L9ifXN5yTIBDY71J9uGL9CR76DGZv2BBQUdLJe9bcXNUCVKXi6T95VjX9ThBGZF4dS51sfCOqHOyWcbKausJ18Ud/AbTF2Sr8Lw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N01HZit0TW51U1pXYjJhNG43dnI4MGQ0THNtOW04dXJ2TXUvSXpueGZzZitz?=
 =?utf-8?B?MkVRQWJEanNWVHVjeEVabTVJMTRIZ0FBL1NjQVBsUzFZMFdBVG0vVmh0RDRM?=
 =?utf-8?B?aEdFdTVQcmdDN3lVejFvYWpnRERTWG5LRjhhWklJbU9PK0dFRnp0NGd5RUxa?=
 =?utf-8?B?VU9kRWt4ZHdjVmNMdFgrcCtTMVBGMmlIejd0bHhYUHRtc2xtaTI3VG96UHZp?=
 =?utf-8?B?b3pON0xsTWhlOFlmWmU1bHJhaHNkeEdqa0E4RlpnUFFYaFBDYk1jTXU4Q0F5?=
 =?utf-8?B?UWR1SXU1Qm1MMzZHdUhwTENaUGZEWnpQcEUwc092blpsdWp3ampPK3FsZVB6?=
 =?utf-8?B?aU9tZ0N5K2w4MmpCUldqWGI3VlZaVElsc2tkbTVldGNyekpUcGp1SUJ1QzhK?=
 =?utf-8?B?OHhPTWVZQWQvR3RaQVE3WGZ3WUU0RlZjTFBCMmRJeEI2blZlYlFaRlBlaTg4?=
 =?utf-8?B?Y045c0Q3cFJiaDlwVG5IeFB5dU9HSjVEakhGSG9XMlEzU2ZDYnJrOEkwakQw?=
 =?utf-8?B?RzBNYjZkSHFMS1VqUWYrNEo3SUYzei9jWXhsbUdhOEc5UWxKaytZMlNGSHF6?=
 =?utf-8?B?UjhvQlB5TDVtK2hvd2dnMVF1Tk1pRlg3ZUlEYldFQ0dMY3FyN2txQllZWk5p?=
 =?utf-8?B?ZTM0SVdPZE9xU3daMlRIemF0UG92N0JHS21zTlRzVEU4bTRQUEY1YmNDQnU5?=
 =?utf-8?B?TWpuRERtTEFRQ1pLNFRnUUFMQ2Q1UEo3Q3F2UE1Qd2ZOMlY5azNSOHNMb0lU?=
 =?utf-8?B?amFXYzdJNEpyOUZ6RVBrcklSOU82NnJiL2ozSFQvbVlBVlZVNlNvZ0VZUGVC?=
 =?utf-8?B?ZmEya3VqaXpZanp2Vk5VeEVLcm9iekpIQmZpa3FhL0gvem15b1V2U3cyV2pk?=
 =?utf-8?B?NnozdTc3U2s1MUZOVGtocWFBaFFTdnJkV0l1MTNnMjhlbTRTWXYzdTZTWGdj?=
 =?utf-8?B?Y21oMVZIYmwvK1hlTzI3U3oyNG9JU2hMNEVFVU13RkNwU2MzZCs3WTBJeXVN?=
 =?utf-8?B?dWx0cTc1NElsYjFCQkVBNmk0cWFlOUI0akovRUFmekRBRzk2ZDlkZU55cmQy?=
 =?utf-8?B?VmJKcmQzcm41NGIrZXp0Z0VQK3ZCVFJ1WmpGaHV3d1VUUVpscDhZcHlxUnZz?=
 =?utf-8?B?ZDVzaGx6aUR0Ym8rOXhqRmtqb3RURVQ3RFhFRy9XVmVkWlRBZFJjdVVZYTJy?=
 =?utf-8?B?ZVhhcS8xMm9pWUdSRmpWNmZrUFBzY1lHWWtiZ1NKTzhRMTZjaGs2Qkgvd2xX?=
 =?utf-8?B?aVlPNUdkSnBYbHFjNUNoK0Zlbit5QXJQOXUvQjIzVlhnajk2UklIcC85Ynk5?=
 =?utf-8?B?alZTZUROVFREdFFUZzcyTnlIS1BqS0U2TGdjMVdkd04veW4rTUpvUmx6OHhP?=
 =?utf-8?B?MEVOUXpzRUZtVU44TnVTa0dtSkF0eEhER3QyT29lbThQc0RERFRxQitmbEFX?=
 =?utf-8?B?b08vejQ0cEp3V3JkN2h0eWt1TFJMZGVmcFJlR0x6TnQ2eU9kQWdUb2pVRjls?=
 =?utf-8?B?R0Nwc3Z6R05YRDA4ek5qSVM1UmtsMWNmV0R6V2pIRVdLSDFhV253S3hUWk55?=
 =?utf-8?B?Mm9tZDVJYjVnL01lWVRIQnJZMWx1ZEI4RklKNmJXc3RsTTZMVmJaV2NOaXRI?=
 =?utf-8?B?N2JpMGZTTmJhbWY5ME9nNmpwTjRkU2thWTJ4MERuMFQzdnY1Mi80Y1pyWk1U?=
 =?utf-8?B?dk00eC9VQmRJUzFEYWlyd0pmUUQzb2FRMFpMd0FhNkUzSW1kSmRSL01sRUVa?=
 =?utf-8?B?bGFtZGkydWk1NUFVTHg2S1VWaU11dHlueFFybUtsSGlRTHFkdFRUdWlTYW93?=
 =?utf-8?B?SWF4dHk4NXNQUFE5WFROcmhjeHpNejhtS2s1cFp1RnBnclBBbUJyZVlOYXFL?=
 =?utf-8?B?SGZ2cUtsUEZ4enNGR1FKOVVKY3hvbVZnK1ZZY1ZieGRaSzFEU1A1STZpcWRq?=
 =?utf-8?B?MGpQTFVRSERnNzNEZ053M0F0WlFzSk1QVzFDRGpOQU01MURaL2J6L3haQy9E?=
 =?utf-8?B?UUVCMHRUMmtUT2lxSGpPRUIxdTR3c2plaVRtN1Q3ZTNubnc0NFE0QzdxaGJ3?=
 =?utf-8?B?MkMwSG43WHZ5V2djM2pOZzZ1N1FncmdjOS9tMzZjNmRhZHVzeDIwUVA4YjhK?=
 =?utf-8?B?N0o2RFVtbHNNQ1V6aTd0aURMZlM0UG1KdXlpY0dVWjdZU2RWU3E2bjBYR2k2?=
 =?utf-8?B?N2tydXBHcUZIemJRWGRRYllSNXE1Wm4yUEhIMlBXMkM4TkNRN3ZjdlRJZ04y?=
 =?utf-8?B?dXBMQm1LQmVyYXBYZ0lWZEpRL2ZTSjI1YzNpa0UxMVpaMlpRLzhGZGVaRDZY?=
 =?utf-8?B?dlR1bGVSaHdGcnpEWStTTFNtd0dQQklMMktQd1BxT20xdnNLS2wrR1hEdGFp?=
 =?utf-8?Q?XOCSjCBhuveDGyUg=3D?=
X-Exchange-RoutingPolicyChecked: tDYWfLuBs3kBi2rBhDRYMihBRvXo62Dw/3+8JeAZrJA8cdztZKxXImUvwYIdOXZyidS8Y0aOmQgdURFQqd1mZ11j+wfa16jOBWA0sedyv3Oe7oj1DLVgi5lFkXvJBjxcWQik9BO49qJlRskW7nPcdAplAWO+yTRloFIGsGNVsoPRJ5LCyGddrd5vYs6A80aLAhv/Eh11FoWx4/R0eAnzzX+utI9w+AKNJijmNCLpI5TsJQcn2zIwyJnfzQdOvcRlkZh9RcXaHlnTywjxh0EarSqeX7wWTRYa94FWcoBmOk8jSD/PqJZ04QUggPi9H8h/93OIBfhUkwJ542Zcb21eiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 271f9267-f271-4088-5c61-08de90f54888
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 20:20:29.3296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3ahrnMnL9n+X3P28opNHow52KgfB5Si7dxgICjn7/2dN9NTh5DMBAEsT+bmDSLZV0aogQOSsmtrXeNf/665eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7560
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

On Thu, Apr 02, 2026 at 04:30:47AM -0600, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: 02 April 2026 06:34
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Auld, Matthew
> > <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com; Ghimiray,
> > Himal Prasad <himal.prasad.ghimiray@intel.com>
> > Subject: Re: [RFC PATCH V6 3/7] drm/xe: Handle physical memory address
> > error
> > 
> > On Fri, Mar 27, 2026 at 05:18:16PM +0530, Tejas Upadhyay wrote:
> > > This functionality represents a significant step in making the xe
> > > driver gracefully handle hardware memory degradation.
> > > By integrating with the DRM Buddy allocator, the driver can
> > > permanently "carve out" faulty memory so it isn't reused by subsequent
> > > allocations.
> > >
> > > Buddy Block Reservation:
> > > ----------------------
> > > When a memory address is reported as faulty, the driver instructs the
> > > DRM Buddy allocator to reserve a block of the specific page size
> > > (typically 4KB). This marks the memory as "dirty/used"
> > > indefinitely.
> > >
> > > Two-Stage Tracking:
> > > -----------------
> > > Offlined Pages:
> > > Pages that have been successfully isolated and removed from the
> > > available memory pool.
> > >
> > > Queued Pages:
> > > Addresses that have been flagged as faulty but are currently in use by
> > > a process. These are tracked until the associated buffer object (BO)
> > > is released or migrated, at which point they move to the "offlined"
> > > state.
> > >
> > > Sysfs Reporting:
> > > --------------
> > > The patch exposes these metrics through a standard interface, allowing
> > > administrators to monitor VRAM health:
> > > /sys/bus/pci/devices/<device_id>/vram_bad_bad_pages
> > >
> > > V5:
> > > - Categorise and handle BOs accordingly
> > > - Fix crash found with new debugfs tests
> > > V4:
> > > - Set block->private NULL post bo purge
> > > - Filter out gsm address early on
> > > - Rebase
> > > V3:
> > > -rename api, remove tile dependency and add status of reservation
> > > V2:
> > > - Fix mm->avail counter issue
> > > - Remove unused code and handle clean up in case of error
> > >
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 336
> > +++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   1 +
> > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  26 ++
> > >  3 files changed, 363 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > index c627dbf94552..0fec7b332501 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > @@ -13,7 +13,10 @@
> > >
> > >  #include "xe_bo.h"
> > >  #include "xe_device.h"
> > > +#include "xe_exec_queue.h"
> > > +#include "xe_lrc.h"
> > >  #include "xe_res_cursor.h"
> > > +#include "xe_ttm_stolen_mgr.h"
> > >  #include "xe_ttm_vram_mgr.h"
> > >  #include "xe_vram_types.h"
> > >
> > > @@ -277,6 +280,26 @@ static const struct ttm_resource_manager_func
> > xe_ttm_vram_mgr_func = {
> > >  	.debug	= xe_ttm_vram_mgr_debug
> > >  };
> > >
> > > +static void xe_ttm_vram_free_bad_pages(struct drm_device *dev, struct
> > > +xe_ttm_vram_mgr *mgr) {
> > > +	struct xe_ttm_vram_offline_resource *pos, *n;
> > > +
> > > +	mutex_lock(&mgr->lock);
> > > +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link)
> > {
> > > +		--mgr->n_offlined_pages;
> > > +		gpu_buddy_free_list(&mgr->mm, &pos->blocks, 0);
> > > +		mgr->visible_avail += pos->used_visible_size;
> > > +		list_del(&pos->offlined_link);
> > > +		kfree(pos);
> > > +	}
> > > +	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link)
> > {
> > > +		list_del(&pos->queued_link);
> > > +		mgr->n_queued_pages--;
> > > +		kfree(pos);
> > > +	}
> > > +	mutex_unlock(&mgr->lock);
> > > +}
> > > +
> > >  static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
> > > {
> > >  	struct xe_device *xe = to_xe_device(dev); @@ -288,6 +311,8 @@
> > static
> > > void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
> > >  	if (ttm_resource_manager_evict_all(&xe->ttm, man))
> > >  		return;
> > >
> > > +	xe_ttm_vram_free_bad_pages(dev, mgr);
> > > +
> > >  	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
> > >
> > >  	gpu_buddy_fini(&mgr->mm);
> > > @@ -316,6 +341,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe,
> > struct xe_ttm_vram_mgr *mgr,
> > >  	man->func = &xe_ttm_vram_mgr_func;
> > >  	mgr->mem_type = mem_type;
> > >  	mutex_init(&mgr->lock);
> > > +	INIT_LIST_HEAD(&mgr->offlined_pages);
> > > +	INIT_LIST_HEAD(&mgr->queued_pages);
> > >  	mgr->default_page_size = default_page_size;
> > >  	mgr->visible_size = io_size;
> > >  	mgr->visible_avail = io_size;
> > > @@ -471,3 +498,312 @@ u64 xe_ttm_vram_get_avail(struct
> > > ttm_resource_manager *man)
> > >
> > >  	return avail;
> > >  }
> > > +
> > > +static bool is_ttm_vram_migrate_lrc(struct xe_device *xe, struct
> > > +xe_bo *pbo)
> > 
> > As discussed in prior reply [1] - I think this can be dropped.
> > 
> > [1]
> > https://patchwork.freedesktop.org/patch/714756/?series=161473&rev=6#c
> > omment_1318048
> > 
> > > +{
> > > +	if (pbo->ttm.type == ttm_bo_type_kernel &&
> > > +	    pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
> > > +	    (pbo->flags & (XE_BO_FLAG_GGTT |
> > XE_BO_FLAG_GGTT_INVALIDATE)) &&
> > > +	    !(pbo->flags & XE_BO_FLAG_PAGETABLE)) {
> > > +		unsigned long idx;
> > > +		struct xe_exec_queue *q;
> > > +		struct drm_device *dev = &xe->drm;
> > > +		struct drm_file *file;
> > > +		struct xe_lrc *lrc;
> > > +
> > > +		/* TODO : Need to extend to multitile in future if needed */
> > > +		mutex_lock(&dev->filelist_mutex);
> > > +		list_for_each_entry(file, &dev->filelist, lhead) {
> > > +			struct xe_file *xef = file->driver_priv;
> > > +
> > > +			mutex_lock(&xef->exec_queue.lock);
> > > +			xa_for_each(&xef->exec_queue.xa, idx, q) {
> > > +				xe_exec_queue_get(q);
> > > +				mutex_unlock(&xef->exec_queue.lock);
> > > +
> > > +				for (int i = 0; i < q->width; i++) {
> > > +					lrc = xe_exec_queue_get_lrc(q, i);
> > > +					if (lrc->bo == pbo) {
> > > +						xe_lrc_put(lrc);
> > > +						mutex_lock(&xef-
> > >exec_queue.lock);
> > > +						xe_exec_queue_put(q);
> > > +						mutex_unlock(&xef-
> > >exec_queue.lock);
> > > +						mutex_unlock(&dev-
> > >filelist_mutex);
> > > +						return false;
> > > +					}
> > > +					xe_lrc_put(lrc);
> > > +				}
> > > +				mutex_lock(&xef->exec_queue.lock);
> > > +				xe_exec_queue_put(q);
> > > +				mutex_unlock(&xef->exec_queue.lock);
> > > +			}
> > > +		}
> > > +		mutex_unlock(&dev->filelist_mutex);
> > > +		return true;
> > > +	}
> > > +	return false;
> > > +}
> > > +
> > > +static void xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo
> > > +*pbo) {
> > > +	struct ttm_placement place = {};
> > > +	struct ttm_operation_ctx ctx = {
> > > +		.interruptible = false,
> > > +		.gfp_retry_mayfail = false,
> > > +	};
> > > +	bool locked;
> > > +	int ret = 0;
> > > +
> > > +	/*  Ban VM if BO is PPGTT */
> > > +	if (pbo->ttm.type == ttm_bo_type_kernel &&
> > > +	    pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
> > > +	    pbo->flags & XE_BO_FLAG_PAGETABLE) {
> > 
> > I think XE_BO_FLAG_PAGETABLE and XE_BO_FLAG_FORCE_USER_VRAM are
> > sufficient here.
> > 
> > Also, if XE_BO_FLAG_PAGETABLE is set but XE_BO_FLAG_FORCE_USER_VRAM
> > is clear, that means this is a kernel VM and we probably have to wedge the
> > device, right?
> 
> I am looking at all other review comments , meanwhile as quick response, @Aravind Iddamsetty was suggesting to do SBR reset for critical BOs in place of wedge.
> 

That very well could be correct — it would have to be some kind of
global event if a critical BO encounters an error and the driver needs
to recover. Part of recover process has to be replace the critical BO
with a new BO too, right?

A few more comments below.

> Tejas
> > 
> > > +		down_write(&pbo->vm->lock);
> > > +		xe_vm_kill(pbo->vm, true);
> > > +		up_write(&pbo->vm->lock);
> > > +	}
> > > +
> > > +	/*  Ban exec queue if BO is lrc */
> > > +	if (pbo->ttm.type == ttm_bo_type_kernel &&
> > > +	    pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
> > > +	    (pbo->flags & (XE_BO_FLAG_GGTT |
> > XE_BO_FLAG_GGTT_INVALIDATE)) &&
> > > +	    !(pbo->flags & XE_BO_FLAG_PAGETABLE)) {
> > 
> > 
> > This is a huge if statement just to determine whether this is an LRC. At a
> > minimum, we’d need to normalize this, and it looks very fragile—if we change
> > flags elsewhere in the driver, this if statement could easily break.
> > 
> > Also, I can’t say I’m a fan of searching just to kill an individual queue.
> > 
> > It’s a bit unfortunate that LRCs are created without a VM (I forget the exact
> > reasoning, but I seem to recall it was related to multi-q?)
> > 
> > I think what we really want to do is:
> > 
> > - If we find a PT or LRC BO, kill the VM.

If the PT encounters an error, we likely also want to immediately
invalidate the VM’s page table structure to avoid a device page-table
walk reading a corrupted PT. xe_vm_close() does this in the code below:

1828                 if (bound) {
1829                         for_each_tile(tile, xe, id)
1830                                 if (vm->pt_root[id])
1831                                         xe_pt_clear(xe, vm->pt_root[id]);
1832
1833                         for_each_gt(gt, xe, id)
1834                                 xe_tlb_inval_vm(&gt->tlb_inval, vm);
1835                 }

Maybe this could be extracted into a helper and called here, likely
after xe_vm_kill(). There is also a weird corner case where the PT that
encounters the error is vm->pt_root[id], which is particularly bad,
because in that case we can’t call xe_pt_clear(). That operation
involves a CPU write, and if I remember correctly, things go really
badly then.

> > - Update ‘kill VM’ to kill all exec queues. I honestly forget why we
> >   only kill preempt/rebind queues—it’s likely some nonsensical reasoning
> >   that we never cleaned up. We already have xe_vm_add_exec_queue(), which
> >   is short-circuited on xe->info.has_ctx_tlb_inval, but we can just
> >   remove that.
> > - Normalize this with an LRC BO flag and store the user_vm in the BO for
> >   LRCs.
> > - Critical kernel BOs normalized with BO flag -> wedge the device
> > 
> > The difference between killing a queue and killing a VM doesn’t really matter
> > from a user-space point of view, since typically a single-queue hang leads to
> > the entire process crashing or restarting—at least for Mesa 3D. We should
> > confirm with compute whether this is also what we’re targeting for CRI, but I
> > suspect the answer is the same. Even if it isn’t, I’m not convinced per-queue
> > killing is worthwhile. And if we decide it is, the filelist / exec_queue.xa search is
> > pretty much a non-starter for me—for example, we’d need to make this much
> > simpler and avoid taking a bunch of locks here, which looks pretty scary.
> > 
> > > +		struct drm_device *dev = &xe->drm;
> > > +		struct xe_exec_queue *q;
> > > +		struct drm_file *file;
> > > +		struct xe_lrc *lrc;
> > > +		unsigned long idx;
> > > +
> > > +		/* TODO : Need to extend to multitile in future if needed */
> > > +		mutex_lock(&dev->filelist_mutex);
> > > +		list_for_each_entry(file, &dev->filelist, lhead) {
> > > +			struct xe_file *xef = file->driver_priv;
> > > +
> > > +			mutex_lock(&xef->exec_queue.lock);
> > > +			xa_for_each(&xef->exec_queue.xa, idx, q) {
> > > +				xe_exec_queue_get(q);
> > > +				mutex_unlock(&xef->exec_queue.lock);
> > > +
> > > +				for (int i = 0; i < q->width; i++) {
> > > +					lrc = xe_exec_queue_get_lrc(q, i);
> > > +					if (lrc->bo == pbo) {
> > > +						xe_lrc_put(lrc);
> > > +						xe_exec_queue_kill(q);
> > > +					} else {
> > > +						xe_lrc_put(lrc);
> > > +					}
> > > +				}
> > > +
> > > +				mutex_lock(&xef->exec_queue.lock);
> > > +				xe_exec_queue_put(q);
> > > +				mutex_unlock(&xef->exec_queue.lock);
> > > +			}
> > > +		}
> > > +		mutex_unlock(&dev->filelist_mutex);
> > > +	}
> > > +
> > > +	spin_lock(&pbo->ttm.bdev->lru_lock);
> > > +	locked = dma_resv_trylock(pbo->ttm.base.resv);
> > > +	spin_unlock(&pbo->ttm.bdev->lru_lock);
> > > +	WARN_ON(!locked);
> > 
> > Is there any reason why we can’t just take a sleeping dma_resv_lock here (e.g.
> > xe_bo_lock)? Also, I think the trick with the LRU lock only works once the BO’s
> > dma_resv has been individualized (kref == 0), which is clearly not the case
> > here.
> > 
> > > +	ret = ttm_bo_validate(&pbo->ttm, &place, &ctx);

I thought I had typed this out, but with the purging-BO series now
merged, we have a helper for purging: xe_ttm_bo_purge(). I don’t think
it works exactly for this case, but with small updates, I believe it
could be made to work. It also does things like remove the page tables
for the BO, which I think is desired.

Matt

> > > +	drm_WARN_ON(&xe->drm, ret);
> > > +	xe_bo_put(pbo);
> > > +	if (locked)
> > > +		dma_resv_unlock(pbo->ttm.base.resv);
> > > +}
> > > +
> > > +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe,
> > unsigned long addr,
> > > +					    struct xe_ttm_vram_mgr
> > *vram_mgr, struct gpu_buddy *mm) {
> > > +	struct xe_ttm_vram_offline_resource *nentry;
> > > +	struct ttm_buffer_object *tbo = NULL;
> > > +	struct gpu_buddy_block *block;
> > > +	struct gpu_buddy_block *b, *m;
> > > +	enum reserve_status {
> > > +		pending = 0,
> > > +		fail
> > > +	};
> > > +	u64 size = SZ_4K;
> > > +	int ret = 0;
> > > +
> > > +	mutex_lock(&vram_mgr->lock);
> > 
> > You’re going to have to fix the locking here. For example, the lock is released
> > inside nested if statements below, which makes this function very difficult to
> > follow. Personally, I can’t really focus on anything else until this is cleaned up.
> > I’m not saying we don’t already have bad locking patterns in Xe—I’m sure we
> > do—but let’s avoid introducing new code with those patterns.
> > 
> > For example, it should look more like this:
> > 
> > mutex_lock(&vram_mgr->lock);
> > /* Do the minimal work that requires the lock */ mutex_unlock(&vram_mgr-
> > >lock);
> > 
> > /* Do other work where &vram_mgr->lock needs to be dropped */
> > 
> > mutex_lock(&vram_mgr->lock);
> > /* Do more work that requires the lock */ mutex_unlock(&vram_mgr->lock);
> > 
> > Also strongly prefer guards or scoped_guards too.
> > 
> > > +	block = gpu_buddy_addr_to_block(mm, addr);
> > > +	if (PTR_ERR(block) == -ENXIO) {
> > > +		mutex_unlock(&vram_mgr->lock);
> > > +		return -ENXIO;
> > > +	}
> > > +
> > > +	nentry = kzalloc_obj(*nentry);
> > > +	if (!nentry)
> > > +		return -ENOMEM;
> > > +	INIT_LIST_HEAD(&nentry->blocks);
> > > +	nentry->status = pending;
> > > +
> > > +	if (block) {
> > > +		struct xe_ttm_vram_offline_resource *pos, *n;
> > > +		struct xe_bo *pbo;
> > > +
> > > +		WARN_ON(!block->private);
> > > +		tbo = block->private;
> > > +		pbo = ttm_to_xe_bo(tbo);
> > > +
> > > +		xe_bo_get(pbo);
> > 
> > This probably needs a kref get if it’s non‑zero. If this is a zombie BO, it should
> > already be getting destroyed. Also, we’re going to need to look into gutting the
> > TTM pipeline as well, where TTM resources are transferred to different BOs—
> > but there’s enough to clean up here first before we get to that.
> > 
> > I'm going to stop here as there is quite a bit to cleanup / simplify before I can
> > dig in more.
> > 
> > Matt
> > 
> > > +		/* Critical kernel BO? */
> > > +		if (pbo->ttm.type == ttm_bo_type_kernel &&
> > > +		    (!(pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM) ||
> > > +		     is_ttm_vram_migrate_lrc(xe, pbo))) {
> > > +			mutex_unlock(&vram_mgr->lock);
> > > +			kfree(nentry);
> > > +			xe_ttm_vram_free_bad_pages(&xe->drm, vram_mgr);
> > > +			xe_bo_put(pbo);
> > > +			drm_err(&xe->drm,
> > > +				"%s: corrupt addr: 0x%lx in critical kernel bo,
> > request reset\n",
> > > +				__func__, addr);
> > > +			/* Hint System controller driver for reset with -EIO  */
> > > +			return -EIO;
> > > +		}
> > > +		nentry->id = ++vram_mgr->n_queued_pages;
> > > +		list_add(&nentry->queued_link, &vram_mgr-
> > >queued_pages);
> > > +		mutex_unlock(&vram_mgr->lock);
> > > +
> > > +		/* Purge BO containing address */
> > > +		 xe_ttm_vram_purge_page(xe, pbo);
> > > +
> > > +		/* Reserve page at address addr*/
> > > +		mutex_lock(&vram_mgr->lock);
> > > +		ret = gpu_buddy_alloc_blocks(mm, addr, addr + size,
> > > +					     size, size, &nentry->blocks,
> > > +
> > GPU_BUDDY_RANGE_ALLOCATION);
> > > +
> > > +		if (ret) {
> > > +			drm_warn(&xe->drm, "Could not reserve page at
> > addr:0x%lx, ret:%d\n",
> > > +				 addr, ret);
> > > +			nentry->status = fail;
> > > +			mutex_unlock(&vram_mgr->lock);
> > > +			return ret;
> > > +		}
> > > +
> > > +		list_for_each_entry_safe(b, m, &nentry->blocks, link)
> > > +			b->private = NULL;
> > > +
> > > +		if ((addr + size) <= vram_mgr->visible_size) {
> > > +			nentry->used_visible_size = size;
> > > +		} else {
> > > +			list_for_each_entry(b, &nentry->blocks, link) {
> > > +				u64 start = gpu_buddy_block_offset(b);
> > > +
> > > +				if (start < vram_mgr->visible_size) {
> > > +					u64 end = start +
> > gpu_buddy_block_size(mm, b);
> > > +
> > > +					nentry->used_visible_size +=
> > > +						min(end, vram_mgr-
> > >visible_size) - start;
> > > +				}
> > > +			}
> > > +		}
> > > +		vram_mgr->visible_avail -= nentry->used_visible_size;
> > > +		list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages,
> > queued_link) {
> > > +			if (pos->id == nentry->id) {
> > > +				--vram_mgr->n_queued_pages;
> > > +				list_del(&pos->queued_link);
> > > +				break;
> > > +			}
> > > +		}
> > > +		list_add(&nentry->offlined_link, &vram_mgr-
> > >offlined_pages);
> > > +		/* TODO: FW Integration: Send command to FW for offlining
> > page */
> > > +		++vram_mgr->n_offlined_pages;
> > > +		mutex_unlock(&vram_mgr->lock);
> > > +		return ret;
> > > +
> > > +	} else {
> > > +		ret = gpu_buddy_alloc_blocks(mm, addr, addr + size,
> > > +					     size, size, &nentry->blocks,
> > > +
> > GPU_BUDDY_RANGE_ALLOCATION);
> > > +		if (ret) {
> > > +			drm_warn(&xe->drm, "Could not reserve page at
> > addr:0x%lx, ret:%d\n",
> > > +				 addr, ret);
> > > +			nentry->status = fail;
> > > +			mutex_unlock(&vram_mgr->lock);
> > > +			return ret;
> > > +		}
> > > +
> > > +		list_for_each_entry_safe(b, m, &nentry->blocks, link)
> > > +			b->private = NULL;
> > > +
> > > +		if ((addr + size) <= vram_mgr->visible_size) {
> > > +			nentry->used_visible_size = size;
> > > +		} else {
> > > +			struct gpu_buddy_block *block;
> > > +
> > > +			list_for_each_entry(block, &nentry->blocks, link) {
> > > +				u64 start = gpu_buddy_block_offset(block);
> > > +
> > > +				if (start < vram_mgr->visible_size) {
> > > +					u64 end = start +
> > gpu_buddy_block_size(mm, block);
> > > +
> > > +					nentry->used_visible_size +=
> > > +						min(end, vram_mgr-
> > >visible_size) - start;
> > > +				}
> > > +			}
> > > +		}
> > > +		vram_mgr->visible_avail -= nentry->used_visible_size;
> > > +		nentry->id = ++vram_mgr->n_offlined_pages;
> > > +		list_add(&nentry->offlined_link, &vram_mgr-
> > >offlined_pages);
> > > +		/* TODO: FW Integration: Send command to FW for offlining
> > page */
> > > +		mutex_unlock(&vram_mgr->lock);
> > > +	}
> > > +	/* Success */
> > > +	return ret;
> > > +}
> > > +
> > > +static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct
> > xe_device *xe,
> > > +							 resource_size_t addr)
> > > +{
> > > +	unsigned long stolen_base = xe_ttm_stolen_gpu_offset(xe);
> > > +	struct xe_vram_region *vr;
> > > +	struct xe_tile *tile;
> > > +	int id;
> > > +
> > > +	/* Addr from stolen memory? */
> > > +	if (addr + SZ_4K >= stolen_base)
> > > +		return NULL;
> > > +
> > > +	for_each_tile(tile, xe, id) {
> > > +		vr = tile->mem.vram;
> > > +		if ((addr <= vr->dpa_base + vr->actual_physical_size) &&
> > > +		    (addr + SZ_4K >= vr->dpa_base))
> > > +			return vr;
> > > +	}
> > > +	return NULL;
> > > +}
> > > +
> > > +/**
> > > + * xe_ttm_vram_handle_addr_fault - Handle vram physical address error
> > > +flaged
> > > + * @xe: pointer to parent device
> > > + * @addr: physical faulty address
> > > + *
> > > + * Handle the physcial faulty address error on specific tile.
> > > + *
> > > + * Returns 0 for success, negative error code otherwise.
> > > + */
> > > +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long
> > > +addr) {
> > > +	struct xe_ttm_vram_mgr *vram_mgr;
> > > +	struct xe_vram_region *vr;
> > > +	struct gpu_buddy *mm;
> > > +	int ret;
> > > +
> > > +	vr = xe_ttm_vram_addr_to_region(xe, addr);
> > > +	if (!vr) {
> > > +		drm_err(&xe->drm, "%s:%d addr:%lx error requesting SBR\n",
> > > +			__func__, __LINE__, addr);
> > > +		/* Hint System controller driver for reset with -EIO  */
> > > +		return -EIO;
> > > +	}
> > > +	vram_mgr = &vr->ttm;
> > > +	mm = &vram_mgr->mm;
> > > +	/* Reserve page at address */
> > > +	ret = xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > index 87b7fae5edba..8ef06d9d44f7 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > @@ -31,6 +31,7 @@ u64 xe_ttm_vram_get_cpu_visible_size(struct
> > > ttm_resource_manager *man);  void xe_ttm_vram_get_used(struct
> > ttm_resource_manager *man,
> > >  			  u64 *used, u64 *used_visible);
> > >
> > > +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long
> > > +addr);
> > >  static inline struct xe_ttm_vram_mgr_resource *
> > > to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)  { diff --git
> > > a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> > > index 9106da056b49..94eaf9d875f1 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> > > @@ -19,6 +19,14 @@ struct xe_ttm_vram_mgr {
> > >  	struct ttm_resource_manager manager;
> > >  	/** @mm: DRM buddy allocator which manages the VRAM */
> > >  	struct gpu_buddy mm;
> > > +	/** @offlined_pages: List of offlined pages */
> > > +	struct list_head offlined_pages;
> > > +	/** @n_offlined_pages: Number of offlined pages */
> > > +	u16 n_offlined_pages;
> > > +	/** @queued_pages: List of queued pages */
> > > +	struct list_head queued_pages;
> > > +	/** @n_queued_pages: Number of queued pages */
> > > +	u16 n_queued_pages;
> > >  	/** @visible_size: Proped size of the CPU visible portion */
> > >  	u64 visible_size;
> > >  	/** @visible_avail: CPU visible portion still unallocated */ @@
> > > -45,4 +53,22 @@ struct xe_ttm_vram_mgr_resource {
> > >  	unsigned long flags;
> > >  };
> > >
> > > +/**
> > > + * struct xe_ttm_vram_offline_resource - Xe TTM VRAM offline
> > > +resource  */ struct xe_ttm_vram_offline_resource {
> > > +	/** @offlined_link: Link to offlined pages */
> > > +	struct list_head offlined_link;
> > > +	/** @queued_link: Link to queued pages */
> > > +	struct list_head queued_link;
> > > +	/** @blocks: list of DRM buddy blocks */
> > > +	struct list_head blocks;
> > > +	/** @used_visible_size: How many CPU visible bytes this resource is
> > using */
> > > +	u64 used_visible_size;
> > > +	/** @id: The id of an offline resource */
> > > +	u16 id;
> > > +	/** @status: reservation status of resource */
> > > +	bool status;
> > > +};
> > > +
> > >  #endif
> > > --
> > > 2.52.0
> > >
