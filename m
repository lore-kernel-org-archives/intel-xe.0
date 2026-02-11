Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C89E9E31B
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 15:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B91C10E087;
	Wed, 11 Feb 2026 15:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McrTOjnc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D089310E087
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770824423; x=1802360423;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9myVFSrbY8vXlMeP/2sexxqFBvN3ZlWq3/VKPosNLvk=;
 b=McrTOjncT9PXYQ1SHMShzOJs3fSPrOLrdYExcyokWoCdl/b345N+Sve2
 otKsFMliXVcqZI9VA7vLuqVmLQWFysGKaBgXWDjXmo4XlkzJq/eByhMc9
 IpvtYw4BeUUMtEKNSfWR58MCpVS4eU0YnV0g1T2NT8voQm1LWoNwrFdeJ
 Fx0v3LDshP+B4RPcO0W2yOSBQCiYebRCTL6R1/5bKwcqB6MYdFE78oeBZ
 U6OAfX9Fmgk7Qyxlo6bScbc+rteLV0YTdccHYyVERRCST7QIyP02LsOEj
 3kYUrjhoYtQmcOgqebc2NGyvSgjOsoWlkgqN7P8ecqwZjz/o7xd81fqE5 g==;
X-CSE-ConnectionGUID: pG6dz/tSQBmelVEID0AuCg==
X-CSE-MsgGUID: kdwl66sZQJ2elaIP8F5dIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71179659"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71179659"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:40:23 -0800
X-CSE-ConnectionGUID: 22HDB30gTea514aqWjyqig==
X-CSE-MsgGUID: yxbtv61BS0mHl00MIIN9QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="216430308"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:40:23 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 07:40:23 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 07:40:23 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 07:40:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lmay/ZLphWTIPVsjXI5joJKRRX1ApdcWyKakQTw9AsVD2jsLhZ1K15VSmA56LKLU9IE9Jvi00hJUsfpbdGuk6naoiOif99qN4V8pOCL3Bc9smeG94X0DyfCugDVXbEAJYVzwig76H4goXS6YcnqdYUDWc+N/rJb7pREjfDItu82SWiRuSD5Vt/HAoeDJSZxy04eM53nwNPvFEhOlQoU5Q1owJyvhdg6hxULl9Fj4g6EBb9tP7WDlCr1FmAnXaXJ14AQRizkAhl8JphdWED7/3EhBicvccAwxN0RVBHlabm6V46UZADQHIjEc4/cNfNEUX6EJzOnH91M3rLBhnAGHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/chpOpab+goEeZYnKPn0kf9DqV+3nDfBJKUEhhvyvU=;
 b=E+sOK1HmxAO6tns1hOVubNckjtAYZbH+aOi3AriNkMB+Tp8FAyxqDtadKdyrpwSAT29qMhKknAO33SIF9yXWzTfXBJLUPLOv08pqPD/+/66nU+ZXzCsbU8yQwAPunEOIDtM0T4FQRbgx6jgcS+N0VhuIDAVH2LTe55b8ruuHZIE2aClMhXQ+063ayMoW2ErPebiRrAuMjp2Qr4p+ha9fHNuxcoTP+h7XdBXua5EtpYRN+kVdziZ2k75PaUC0Z4GU19SoqlYvDn2ttvOywCgXP2BG2Tkj/TB8SMOGf0jC2Et2xs3iUfpoT9Sbp81EgH7kIHmMELytSiVx6X5ffRZ0Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8227.namprd11.prod.outlook.com (2603:10b6:8:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 15:40:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 15:40:15 +0000
Date: Wed, 11 Feb 2026 07:40:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [PATCH v5 9/9] drm/xe/madvise: Enable purgeable buffer object
 IOCTL support
Message-ID: <aYyi3daGcYL0NadU@lstrano-desk.jf.intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-10-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260211152644.1661165-10-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:303:8c::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 73de05d8-e7bb-4f57-ea73-08de6983da0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?a8mP0V2RoxupIWVj27MHjL1Rm8DhVDUpR6iVuZHMn05mfXwlbBDvYOX7JR?=
 =?iso-8859-1?Q?O7Q6N6x0O4Pd6iW2rrWWaNfkCxqtjTnjX6w2A0UVmkSvjafhfi7TmjwlSK?=
 =?iso-8859-1?Q?B3dJrz0mWjvbUJZbVQGpgQs2GpAv7n6ssz7z8O6nqvII5PfoRzDRjbAF3Q?=
 =?iso-8859-1?Q?HoYh5imTVv5YsJchsSsXNFyL2A3/cQ+815kvmAhlUgdOHapAEUkwGP/oX8?=
 =?iso-8859-1?Q?Jx4Jun4Qc9F6YQwl6BimaeDgHg6H83jzk2fM1oANtzM0nLx+gIm6K6Kgc0?=
 =?iso-8859-1?Q?A5HIkN/2jjT8y3otZzub72bKtgzLe27UtCnNUopaELRjzh8ZzwZ1mP4Px1?=
 =?iso-8859-1?Q?KGBg1bkAb5cYbMi9WaQXEkLG0WDf0myGrGpkT5mdfaID5weVQO4ZJdWqm8?=
 =?iso-8859-1?Q?GV0vhnw+3MJV/A0U/UgwLCAoGGHxzN+LUz36qR3esgFvyGTVD+3H5pofWA?=
 =?iso-8859-1?Q?3ha+HazzUQ5pkBL1a1pb5hkKGS1Ra9cbVLz+REF0QpdlWDbFPeFqLwSy/V?=
 =?iso-8859-1?Q?kddWIZgZ8IogSpxRbBfYzd2ZqTrm/a5fW8Vos7FZri+CgOuxXDKp8AnFam?=
 =?iso-8859-1?Q?xAPIQfd+6kUc7MAnC8/3D4HSvA7IPV/2pHTBrzpQyvdboB9A6x4BR1Xyz1?=
 =?iso-8859-1?Q?zMnJR+eYcrQuKa0R5LG9MJvtM9vBfSUEXtow7jBZVEn8ijUZ3mshq04gZc?=
 =?iso-8859-1?Q?zWc04j2ti40pCy++XmyxJtsWQPJvF2tB0SH5Sr6YYKLMC6j9hvdHH7DRQq?=
 =?iso-8859-1?Q?3HDhiRGXL8roVuVz85D760gUDrZqpYk3nWRrIx2FJoVShFkd2x2zt2eIUz?=
 =?iso-8859-1?Q?PcMwaeJwm3UI10VW5lSvmzrkzP4gW2J+bGwvoVqGKlJW7WKqIl4xOu7+FZ?=
 =?iso-8859-1?Q?rHEgABsphLPsSqZXk0OP/UR09GefUAKJWzemHNDjPBDHjNQo4egB6+9oR8?=
 =?iso-8859-1?Q?xoIAQGmbiER9iHqTtZsrL0B1VzsyfqZjvOZSZqXhq5WM3a3/Kzb/OV30+e?=
 =?iso-8859-1?Q?pE6YGyqemGCocBAB/XpsndG7vzLUK9u3FGSUb0XAKSNstxE0tmcq/vWzFK?=
 =?iso-8859-1?Q?yysnPgbmdfn1R68CpsMDpUBaX9VkUWuGc6gYDk3YU4hmOce4aav021Fg2Z?=
 =?iso-8859-1?Q?8YEHmPt153iMshIvncLcD0pKmgvjtuwbPsqiZXupwOCuEoH+4gADe5y19e?=
 =?iso-8859-1?Q?AUd/QZSPmOetNdtTo40+kolVNfabOcQV+u95ovUFy60NFts/35/wpr6+GG?=
 =?iso-8859-1?Q?Z69+G6B9g9j/CUZ3C8nImDhO5BC/yUFj3JUtjskdinTwgH5KmjpOusyM+c?=
 =?iso-8859-1?Q?2eEGZUlip1oGlZz8QepjdPvdEbK4nrnQJia3dz8ai4xukr7JHR//3kDlpv?=
 =?iso-8859-1?Q?1CQTu7Q6sgLF9o7/KHpI5CJL1RS5UTd5VjpetMGOzMWx18XxavvtAkInL0?=
 =?iso-8859-1?Q?5eolD7fdk0fzFTyM4kmUefLRiLyNAFGunIQbArXQjrcdFNDSMjhz1ZuoiE?=
 =?iso-8859-1?Q?MFsA+CeosAr6YpQRtoiYyiHk6b3WQF6ixRSBpHeY1xVDD2uVB77u+A13YJ?=
 =?iso-8859-1?Q?CmMkYSnJKzB5cXlQpaUt3FkkYPcorMFsrPFkn73LHhDxv8IuTcxnoa6waJ?=
 =?iso-8859-1?Q?iOW0nKVjnjd6Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Q0m646aazgwdC4YThQurSHSk5gFxvdRht6gpoiNKI79F4D9SxSopvpXGXv?=
 =?iso-8859-1?Q?qxYox+bVxHdX1crvh2s9GPEn+8kQ4DtMMOrxf3HHDm9eY/vINOE9VDNMi+?=
 =?iso-8859-1?Q?27TjYfqjhrkJqmz7fkFn5NFAk1Q6GnBhUN515C76MsIl/HdFEWY39L9BYD?=
 =?iso-8859-1?Q?9vNgwQIh2rUr5d68RG7lRUZSNn4oCDNEDNxyo4ta1T0wyEIikKFcyX31fF?=
 =?iso-8859-1?Q?gNRBW+5FeDlxQ014o6okuhNVHyJqqbDtt6xtJ2vdxm0PuLNAqJYUIC7b9P?=
 =?iso-8859-1?Q?Gd+Khw03EgJ2xGchKNnMRHD+xwU7TBiQdqpZHoYEg10lQG7oxO4Q5tv5ZQ?=
 =?iso-8859-1?Q?A+BR1MjD2iXMMQIvTZA/or8fOs6qSrnKgsUOiUeJ1N7q63uNhMaU4a28Ne?=
 =?iso-8859-1?Q?euBMBWaoGvPtW9gG065/RzKrxVpAEK5mipK66R81T/XoVenYw1iB8foIpe?=
 =?iso-8859-1?Q?VDbbxH/neKW97u6Z0PgUzJSh8qMYzMakNWcv88DgJTbi2wRCei0mGUyzVI?=
 =?iso-8859-1?Q?9Fhue7MFQXz35qLhvBRfUmwHK035iOJs0m2cz4Pe9x26uodGCaoTb3kRLl?=
 =?iso-8859-1?Q?XRjpLiD9mkSURh03fmF1QhZ1XzaSGmqF7zfIRAIgajhAiCadVqJjkkcoWj?=
 =?iso-8859-1?Q?gOmvh08Ubb8BOicR5L+Tdvo/87xw3dv7YBnbRsQXnyBYHnES9AmZqgNZcG?=
 =?iso-8859-1?Q?WKmNZhMQYJjgJj7GU4yA4SVK1tggOShWeb0to+fnzgNHXbP2IMM4sAnjdk?=
 =?iso-8859-1?Q?o4o6u2TqflCS9PdPPjD1Ki/ZCKxhPUDjDj3eulJzKtniLGazqVP49R/LOX?=
 =?iso-8859-1?Q?QRZGlgS63Dg+/KNmwa9idzpFDNPUJhpNqlpz3c10QM+cHEUTy6gh3Yjb9Y?=
 =?iso-8859-1?Q?lXZ3o72iU9bkv7xVNBxjxQVtXvQFeGEEAc5eXcKUavt/g4QNTS9GBBGvpk?=
 =?iso-8859-1?Q?NX7GNavJ6XljZHDavzoL7H+MQ9JoAf4ZZuW6gljGfgX18tmNwDdd6Ortfx?=
 =?iso-8859-1?Q?VQlKz8E3c7F2Kxpjj4rNpxNMRdi5bXj7nhDL+WTaR4+ODcxuZihLvw7ROg?=
 =?iso-8859-1?Q?B3b/xXrCJHPaoi0okt3XvHeaJsS9RDWmqlJF+VZfTIesqdNeIB82MCXvnH?=
 =?iso-8859-1?Q?GsG2FtwZW7qeg+G04pNNCJzPusHVHjNqlaHrl7A4m5ytqQdYwfIR3ijVCs?=
 =?iso-8859-1?Q?+guSg6M6J8IYOt0D1hTw0S1neFh/tEUh1QqzKSAA9f4xBQ2BtXXsRnRQp+?=
 =?iso-8859-1?Q?JNed3SOXrYwheGeTvFOAw9fv7I7OYwdd9HMN5QQ+5UaFqVBSgSZRcipxhT?=
 =?iso-8859-1?Q?1B4sfN5EzwLN7V/UvmFr+hwPtZzq6c43Qh9/10pVZUD8nDu1RjnSqL44NW?=
 =?iso-8859-1?Q?K4nFjbFCgnl9zlclOySegdhKY6AiW3AyqGyAdU+sY0zzzKxVthbClTDWQ9?=
 =?iso-8859-1?Q?Avw2su1b4ZvGl7FO4yTzfZZfcBHrqbY8m3uIbAT/ImBuxuIMUog7XpBond?=
 =?iso-8859-1?Q?J+X2wbQ8tMzxRhqO22brpDVrLWVJq0oBNEpgWGKtlZTPMhk6UdGpbmKUkO?=
 =?iso-8859-1?Q?3z3jgUnoq7kuZGfrbSWTg3R0pUkVLHalFQMO3cuLWLe064GHVcxegixc2V?=
 =?iso-8859-1?Q?Na+z/yvJhK8A9kdA4ykacZbJlqldPO6nwZtTDwU1beDDhaEyuXiijXgo29?=
 =?iso-8859-1?Q?v+9bR//AaYoVBg2/XRXpTRicK+VOt+sop7Fn1MDJ0iQiAueKCVNiJ3sjMl?=
 =?iso-8859-1?Q?cyhTJEaflwEvpt9VOyURRr/BLrVgEWUuFIs5R3poqGo2KcElOo5Uzs2Doq?=
 =?iso-8859-1?Q?we5zBjLcKeY2BHsQw0Qsl1KB3EqHR3w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73de05d8-e7bb-4f57-ea73-08de6983da0a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 15:40:15.4014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rrRj0zX2E5xZOzDZW7YHprvG5Ai//4+A0JAGxwLMZhUtfDOtbv/eF4LPlCGgZAxW9d/4bz1NWBCtpt788/MZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8227
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

On Wed, Feb 11, 2026 at 08:56:38PM +0530, Arvind Yadav wrote:
> Hook the madvise_purgeable() handler into the madvise IOCTL now that all
> supporting infrastructure is complete:
> 
>  - Core purge implementation (patch 3)
>  - BO state tracking and helpers (patches 1-2)
>  - Per-VMA purgeable state tracking (patch 6)
>  - Shrinker integration for memory reclamation (patch 8)
> 
> This final patch enables userspace to use the DRM_XE_VMA_ATTR_PURGEABLE_STATE
> madvise type to mark buffers as WILLNEED/DONTNEED and receive the retained
> status indicating whether buffers were purged.
> 
> The feature was kept disabled in earlier patches to maintain bisectability
> and ensure all components are in place before exposing to userspace.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 22 +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 235fff2b654e..20b1ac7e61d6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -313,18 +313,11 @@ void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
>   *
>   * Handles DONTNEED/WILLNEED/PURGED states. Tracks if any BO was purged
>   * in details->has_purged_bo for later copy to userspace.
> - *
> - * Note: Marked __maybe_unused until hooked into madvise_funcs[] in the
> - * final patch to maintain bisectability. The NULL placeholder in the
> - * array ensures proper -EINVAL return for userspace until all supporting
> - * infrastructure (shrinker, per-VMA tracking) is complete.
>   */
> -static void __maybe_unused madvise_purgeable(struct xe_device *xe,
> -					     struct xe_vm *vm,
> -					     struct xe_vma **vmas,
> -					     int num_vmas,
> -					     struct drm_xe_madvise *op,
> -					     struct xe_madvise_details *details)
> +static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
> +			      struct xe_vma **vmas, int num_vmas,
> +			      struct drm_xe_madvise *op,
> +			      struct xe_madvise_details *details)
>  {
>  	int i;
>  
> @@ -382,12 +375,7 @@ static const madvise_func madvise_funcs[] = {
>  	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
>  	[DRM_XE_MEM_RANGE_ATTR_ATOMIC] = madvise_atomic,
>  	[DRM_XE_MEM_RANGE_ATTR_PAT] = madvise_pat_index,
> -	/*
> -	 * Purgeable support implemented but not enabled yet to maintain
> -	 * bisectability. Will be set to madvise_purgeable() in final patch
> -	 * when all infrastructure (shrinker, VMA tracking) is complete.
> -	 */
> -	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = NULL,
> +	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = madvise_purgeable,
>  };
>  
>  static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
> -- 
> 2.43.0
> 
