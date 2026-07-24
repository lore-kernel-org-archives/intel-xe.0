Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE272C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 15:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B2A10F415;
	Fri, 24 Jul 2026 15:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qgshf/ZZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF0210F415
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784906766; x=1816442766;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GaOr4hkfOawkE+6AdqgEDq5BKkqgnMDI+QgM0PWsHAw=;
 b=Qgshf/ZZ2W2HXAgaOyP4vPjQYW/q9ihtD7cBvCZYF4hii8wDIRxNBc+R
 9tLEWAroNBqup8fMlLva4YF1EpPiAemtvc3dNwjkyEL1jk4w4W8HkbIGR
 si10Sl8SYUXHjUMPmeMcWjF+36n+AavFyfq5e+1vCL3KTghKhmmulTcpf
 r27XLKxslnVzcv7AGX6l/ll4V9TqrOzlMDraUwSC/33jycFzJtq52ecGr
 6hNSF1aJyQB2sjUrLBGwD0CAr3/vasrZZYz/hSE4+Ze8yt7jNOzUIs7EQ
 JHodYj0gY+c2yXW9+Idnr+kLnWOqkAYJUBWsv6rN3VAMbQSDhsLgvIz3Y w==;
X-CSE-ConnectionGUID: 8Btm0JDuT8G4/jFCBif+Vg==
X-CSE-MsgGUID: PyU52dGARUu0DAx+6TyEbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102984599"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="102984599"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 08:26:06 -0700
X-CSE-ConnectionGUID: 5DcCyq+xTpeB3aMkf649PA==
X-CSE-MsgGUID: 9bIleHbrR3y+PuEBxM5+HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="283236595"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 08:26:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 08:26:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 08:26:05 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 08:26:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHH46F+szNGCqIwoXF9yMoWt5CyrwNUPHjFVm7+hFhOBkOohQsFalgtXLhDUpw5wf1MrIAlp6v2cW3shW7NiVBk6l71TTOE9EYBcRyojLKLi+pb23JlNY8osXtxFQwanna7LQfTo45Tm9e2dIVepDVXTPM7LU8X31ylr8gZR49i9QbU7FlJojU78BiKaHw8uHPwk3hOtoXZ27HxMswXcQ3k25hGP077uNP3psxRpLBbwDxPt4QUQCAPv+n47DLPus5PKf2ea5NCdew4UJAzfoK1bP8K6/Eui9LNgD4CHqBFwiBnbogLx3ymAqHkY55s/AiKWqObi6pbt1tzavfwXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toCyhNTMe2Bg8qYi3JCnrYPF9HZjfaLUBYa4yD8CsSc=;
 b=XVYrOnAxzdUQlgDIhzZ1bkhr86AVS9UrKpVUf72Aw3R4oQJhQqExH33nLm1igf/MsGLi9yOLWawl/eX7SVQXvJXaqerU+wWunxKPSV1ndhHrKdkwQQWx3pfYr8OhbHoqNudPwjmFv+UaDFLjV6ieVTcmJ181SU2O+K65MSy7iLmrqh4CGCgmW1hdlT6mUkOaK/1YBKIEHA9EUrANzyer6GK/UV7GYVZj8XJ8RnNDKjWbbckS5yFqdmLdPbCtLhKX231w2PmOe/n+HaT2BDahPXOIF5j8v/vQ+woSX3T/ccesscdJDsdBwE6ZSI7LiIR2lOIApXyH9lOK+R396plyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB7277.namprd11.prod.outlook.com (2603:10b6:8:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 15:26:02 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 15:26:02 +0000
Message-ID: <3a9999f5-6239-41ea-a629-10483e885678@intel.com>
Date: Fri, 24 Jul 2026 17:25:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/xe/vf: split submission config query helpers
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
 <20260724114939.1560743-8-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260724114939.1560743-8-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0519.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c1afe0-6629-44fe-0c51-08dee997deb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZCRfWoO+Ghop+CDFSGWba0LevZoMi0K8cBHzX+1MVPPrbWYQjncLbFw1QkhO3QFxG2y9BtgfXzYnQdmoueXuRlVSLdGpq4fj4MKGJfHtvX7iV+mkvaiqop7fTA80SG+5K+8CGJMim7WIO16eb7Xg+QtAKcqYzGRNrPTmXW9AH0eIOlFVtAXcQlQgV19/Ior+Vg1QYy88RM5CM+J5nAhwhH/ahrWI99K/KZlOZxajx9nQrAOFV8bV/gbFsWhAk6szxuxv4zXMvyPrwmC6Di+FkwI+8+n7ZHDvVMq6stTYJjbPzVJWH8B4oXDUDVJJ543H3nnzuXb7WnRoCIROtgwA+gjOn8vSpAojs59LRdYXgDukoSxAoMOwCqRI2Q9Sd1zBW9Ay3ge3AKcRiQuRETQQ0MgelvoTExlLwuvxSEj9JpdUxyi3H6Lg21GnK/VBMGdibsr/dDTOzuzuwu9DX2Ais4am84DMzzk1xPybqe6O9PGnb6PE7BYFpjR0+B5jWPu/p+0DWa+bremHYUt6IZ2bTl/x62opOqlD9f5qoLYl9EmJCkiT6W1VaNg3y++z6nMyz2bctEaAwTKXLhWMEIMienJi13STMQY77lRV6rqUBLjMhU4f/Oln1BvyJpmnFoBb8uB1JSS2Cb1YIshW75gni8zt87Jv4AWA5Cv29xRwzoc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0pWUnNvVUJPSEFuV0JQSlk0cVlWbmNDN015SmtNbHk2VUVGN2FPTnhDQ28w?=
 =?utf-8?B?K0xydWJhcXZXeVIwSjA0RzI4b1BmLzg4WEZreUYxd2pCSDBBOFkvSWVOZkNk?=
 =?utf-8?B?TGt4TWRCVElqd290NUJnNlJFWi9jbGs3NHp4R2Z1RHRwZ0lEamdvdUlMU0JM?=
 =?utf-8?B?Q1g1QnA0R2lJVFZHWUcwM0JnVXRBWDA1TlBiQjNNTGpGaCtEeXNPTm5NOXlx?=
 =?utf-8?B?eVBzS3U4ZUN5OEQ5cDZhaGNuM1E0b01DSkt6Y2t4L0R6RVZmZlArWU9CWXdD?=
 =?utf-8?B?R1c4VE04YWtyL0JKSmJzQTArNlV5OExUREpvMjBzLzJSdGFDRTJROHhDeFpz?=
 =?utf-8?B?V2JOSU9RakhqVHJtZm9GWmFCVzk1a2FzZ1p4UnN3SXNjcENNT2wxRFZyU1Mv?=
 =?utf-8?B?bnI1K0F0b0RybjdxdWd2TS9CZ1BMelM2Y21yTGtRR1ZJL1JCQnA4THQ3bDlL?=
 =?utf-8?B?VUZxSFMrQk9paHdCVit5Y3J6ZzN2RmpoY1l4dUhRWEU5YmpkS3FpMjFDbm9i?=
 =?utf-8?B?VHhOcGZna3FjNmZqUFI0aGVnTndicGw5Wk44Ullwc0VqMzdwY2VrMFJjc3dR?=
 =?utf-8?B?S1p6QWkySnM4UHJOR3FCOXJ2S1gxUktQU0JWc2JDWnRvTndyc2hJSHJXeERq?=
 =?utf-8?B?SFoxcUtTR1FoM3dHbllMVVRVcVphd0FWa21OOWtEcTl1WnRta1ZEU0RSQXZT?=
 =?utf-8?B?blhBYXpoUE9NbVozc0ZJRjlON2FpMTBndWpRa0MrOFA0aXZ0OEJNMWRjUTh1?=
 =?utf-8?B?TXZVQk9MSGhMMVltcjdON2RVQThLei83TTU2c21NbUFKT3FzQjNxVDBGeUtN?=
 =?utf-8?B?NFdjU255TnZNbmNPVHR1bG9LbWFQR21QQVJNRlZKbWdvY1BXTVlpMnJOVDlx?=
 =?utf-8?B?NE9pc2QwRkZYc0p3c1ZYTERoSW1sRjJJMFYzTnZORlZaUVZCa0RQbExNM3pa?=
 =?utf-8?B?ZnljNERRbTc1MHZBcVNPSzRBZS9ob0RwSytFOEtQM1VwdDJNZzIyRVZOQXkz?=
 =?utf-8?B?bXlYZVY5M1FiNVBKYUxwSnIraEduS2NhSGtVY2IzanM2cis2UWRVb1NyZmFz?=
 =?utf-8?B?MStZYkljSWdDOG9SNFQ5YmxBMGJoVnAzd0M1TFcwZElpU3JXaklJWG8zQlhu?=
 =?utf-8?B?SXFOQTc2QmNRR3JobXpMZUJTOXk5TkNLZHpEdVRybzBrZFVxY3lDSVAzYlA5?=
 =?utf-8?B?V1RnR2VZUGx6dFJ5eTJxaE5zN0JxOUI3bjFLRzBBUVZZOUVWdXBja1pwc0VN?=
 =?utf-8?B?VDZlV1UxVHloZzlsd2l5WTZubEJTRnY0T0kzNmNzQ2hNQnZ6d1FjN1hGdmN4?=
 =?utf-8?B?aERvam9NMiswRGljSXJRa3BzSVRCSktwTWZUQjdMQWw2dTgxTDRLdGY4VCtN?=
 =?utf-8?B?RXhhQit5dUdmZEI4bnhkVnl3bEtMUkpGYlR1T1BGaThYOHJvQ0JsNEVRT0pE?=
 =?utf-8?B?TUxzRlRUb044SFBKVkw0a1JMK1liZTN2Y2d2VnBaaENubUI0bXowVTBQRFJh?=
 =?utf-8?B?cURSbHpWSFNodURxR2U0d1c1VzV5bFVBMjhkaFMvWXU2b3hFR0trZnNYbm5E?=
 =?utf-8?B?MWZMbUhoWGJOZUhYVGRCVVV4Ry80T2tpZGtaZFpGQWROTE0xbzIyREkvejN2?=
 =?utf-8?B?Q1dmRmZkc1YyeWpwaldmWDEzRWpiT2R4RVRQTmgxQVRyTWZ6bHJUcXRHSitr?=
 =?utf-8?B?SGJ3ZWYwQXMwTTNqNkV2NEZnbFVIRWdDRVIvUDVNY2h6cGNFZGluVUtxT0tq?=
 =?utf-8?B?UHEwVGpLZUhZbDduWkZ1cy9DSU1JdVdjYlczVGZmZ3VaZXlYOFc2YWRZZ2hi?=
 =?utf-8?B?a2g5c3ZUT3l3akFyZnpMcXo4N1VMYW5wbjB0bEhjeWpPaVNVZkVGRkF5TmFk?=
 =?utf-8?B?UFdYeEVZVndrR1hyZEdLWGxyOVMvOWdTRWNHc1lUbXJ3UFgzL1BrdnY4S2Nx?=
 =?utf-8?B?QlowcXRUNkxPM3VVS0I1cWhYNzQwWlVDV2V2ZklTN3VsaTRwNkRqdjFLblZ6?=
 =?utf-8?B?T04rVmp4OTJTNW5pTG50TXRzQUJRMmlkU0RKVHdTOU4raVJ6YUZmNDRzR1or?=
 =?utf-8?B?c3pxVWRqYWdPeUxkZXVFczdTdWUxRUlXWkM0WkxlVzZKWW5IRm9Obkl5MU9J?=
 =?utf-8?B?NDRpQ1VEeERlYlhQVE5xNkNHVk9sa1pHSWNPbjl4OW1Gd0JWZUlNUkFISFVT?=
 =?utf-8?B?NHpScXptQXUvM2p3bm1INUdEU0l5bmNjdnNuQ243RDJjSUtvMUtXMDFsWXhQ?=
 =?utf-8?B?Ti80ZmNQOU5UZTU3WUZWU09rY0k4dUd2TjkxYnZPeS9uUFNEYjBQS2E0dGFr?=
 =?utf-8?B?cUpJYm9RVjFyb1psSjFITmI2RVlscmpmY2Z5YzJmWlpsU25VVnY4UnJPRnNF?=
 =?utf-8?Q?3tzFTdNwKEAZ3wU8=3D?=
X-Exchange-RoutingPolicyChecked: KbjgPx+Ju5kf7ObCCjoIDNrftNWuL75yqLHv18lk4i3nJ4b1koO6UvK3ACryjNz1NMVisSEHd8AICnGxSBhceEy0duksVN1/zB9oq7Lp0qQWTFy2Whnj+mdiD6CqbWfzcFVjaTR30FfjC9xFZIRBysJ5qU3HbTRSMC9zb6AsrnMfhNStlZd/waAnSU/4JuhusR7JYHzQGVqr6EcYtehufx+ToJMdbhDEhBgxbWSKauJZcjKGWjmKsyBKq3IjrAMzK30tc4qSlK9SXAbbTlnyJRQgzusn6yc7CM4/xrKFM62ZjY4g178MJm665ewPaUIyhOYT035bpnmChCYoru7plA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c1afe0-6629-44fe-0c51-08dee997deb6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 15:26:01.9990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gw/oIbkIea9IRUN7hduFR8ic/QYhYFWcZaXDZ7nrZ7l6SBYXZPTv+SpIOt5rQb9HDcalmvF82ze8cYqi1PmkDYNilDYJ9Mk/r6iio/HL8kQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7277
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



On 7/24/2026 1:49 PM, Satyanarayana K V P wrote:
> Split vf_get_submission_cfg() into per-resource helpers for CTXs and DBs
> which keeps query/check paths independent and easier to test/read.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V2 -> V3:
> - Added coverage for more error scenarios.
> 
> V1 - V2:
> - New commit.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 60 +++++++++++++++++++++++------
>  1 file changed, 49 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 2ef260575c7c..07f749bad271 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -17,6 +17,7 @@
>  #include "abi/guc_klvs_abi.h"
>  #include "abi/guc_relay_actions_abi.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_guc_regs.h"
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> @@ -572,11 +573,11 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>  	return size ? 0 : -ENODATA;
>  }
>  
> -static int vf_get_submission_cfg(struct xe_gt *gt)
> +static int vf_get_ctx_submission_cfg(struct xe_gt *gt)

nit: maybe simpler

	vf_get_ctxs_cfg
or	vf_get_contexts_cfg

and later

	vf_get_dbs_cfg
or	vf_get_doorbells_cfg

>  {
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>  	struct xe_guc *guc = &gt->uc.guc;
> -	u32 num_ctxs, num_dbs;
> +	u32 num_ctxs;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> @@ -585,27 +586,64 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> -	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
> -	if (unlikely(err))
> -		return err;
> -
> -	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
> +	if (num_ctxs > GUC_ID_MAX) {
> +		xe_gt_sriov_err(gt, "Out of bound CTXs %u received\n", num_ctxs);
> +		return -EPROTO;

this doesn't fit into "split" goal as described in commit message

maybe add it in separate patch?

> +	} else if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>  		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>  				num_ctxs, config->num_ctxs);
>  		return -EREMCHG;
>  	}
> -	if (config->num_dbs && config->num_dbs != num_dbs) {
> +
> +	xe_gt_sriov_dbg_verbose(gt, "CTXs %u\n", num_ctxs);
> +
> +	config->num_ctxs = num_ctxs;
> +
> +	return config->num_ctxs ? 0 : -ENODATA;
> +}
> +
> +static int vf_get_db_submission_cfg(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_guc *guc = &gt->uc.guc;
> +	u32 num_dbs;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
> +	if (unlikely(err))
> +		return err;
> +
> +	if (num_dbs >= GUC_NUM_DOORBELLS) {
> +		xe_gt_sriov_err(gt, "Out of bound DBs %u received\n", num_dbs);
> +		return -EPROTO;

ditto

> +	} else if (config->num_dbs && config->num_dbs != num_dbs) {
>  		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>  				num_dbs, config->num_dbs);
>  		return -EREMCHG;
>  	}
>  
> -	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
> +	xe_gt_sriov_dbg_verbose(gt, "DBs %u\n", num_dbs);
>  
> -	config->num_ctxs = num_ctxs;
>  	config->num_dbs = num_dbs;
>  
> -	return config->num_ctxs ? 0 : -ENODATA;
> +	return config->num_dbs ? 0 : -ENODATA;
> +}
> +
> +static int vf_get_submission_cfg(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	err = vf_get_ctx_submission_cfg(gt);
> +	if (unlikely(err))
> +		return err;
> +
> +	err = vf_get_db_submission_cfg(gt);
> +	if (unlikely(err))
> +		return err;
> +
> +	return 0;
>  }
>  
>  static void vf_cache_gmdid(struct xe_gt *gt)

