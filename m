Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C038C5B560
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 20:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176DA10E83E;
	Fri, 20 Feb 2026 20:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E13fV1Rr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E26E10E83E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 20:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771620502; x=1803156502;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ox6sUzsLKzkR4PyxuT6c7QOiI1FNAa7YdSCqFng1c/w=;
 b=E13fV1RrM68M6MvreZHQmxg9UbHK41lLsed68Ke0eRE0ZMLR5YeXaJsm
 95LvJthCzwZridhjNnIRUYXx63Mn8b+v3qluDEItyTW8IMX/WY3qG8B2d
 yVRgswSkrFZXZ7+iLPQYXL9ozHYeZwrI2FGL5K5InzcDRWw0KLU4hlc2l
 jE8aRx5yOExI2wE+utmATxtR/HGVRtukTFQ4t8naMi/6tblCt4dpz8OZG
 NaXaXS/BgniJbto4+45pXkTMNJIed1MgHTEqrtbHdbAVG5o61WcNMAH5D
 QION5b7bHrQILSeXlF5+LWoldSX93vljjzxnHWylSsEigpphkvEP40S4e Q==;
X-CSE-ConnectionGUID: W8FtPd7vRea+8quULsDdXg==
X-CSE-MsgGUID: XHOH2XmYQ6icHRm/jrJM1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="60292031"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="60292031"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:48:22 -0800
X-CSE-ConnectionGUID: jgKTVn/RT1yUbORHBhzq+A==
X-CSE-MsgGUID: PjcxxzTzR42rGrsm4WeZOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="213477213"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:48:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 12:48:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 12:48:21 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 12:48:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGJ9RnFG2QJZG2fuEVIqWYNjPL+bGpD1rT++lJPPVE099Z2AhQhs543RCZq4Ig42ESm/rfC2+q8qncv7JiZ12PLwmF4TlYA7gJFf6sI9RR3fL5SSJZL0O4P3s5f97LgFg3CDetfB8/mTcL7ky1UFYnXz0hYE0rqPQkKjciRD6h2tkqVMzPZNMmvNQ0JB338X4uA+6ouRvGFPd4TPQYXiGU/618CLSDU68FyydQVbW8H07+2JFOyVolAcRkjwL5ltWb6Vx2zoIxVqnHHurPBLbOSsMS5MTBIQwrNFram90HVfdsn3MhhV4DimXYQzgTEeVaHk3cZhC7+B3kFpbg4uXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBY79Z9NPrNEeNtCSlnkpqcFthOH8UvOvqCSjPoCMYk=;
 b=FQB4D8vozP22VJgCiviDPhXJdG0L1SZT7K6JYxaP7csAGWaQB7W7WjouSJ9ZY0M+z3K3eOU+NYmknahmEuXYYDFR7AyFOxN/RD+EyXS/kPnt9uWKwCN5scUR4ORgjpRkijr+kBySQMdqHKtEMaQxvHo/UTD9oD/wYv03HTDx0IAj1uP4PptSt5gBg6xVQbQnz1ItyIXxN8LKxdfMog130RUoL3hSW+E1Cv8vthBfu8WXZMmjaatiLNYab71H9NThNFTWKO/zTeeAGxwJ6p/8soX4KAu+eOlo064lZxQna0YaTOLNOy4Gyg8jp5f4gWVuxOOgvOUN6JLG9sdAwGzR4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 20:48:19 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 20:48:19 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/xe/sync: Fix user fence leak on alloc failure
Thread-Topic: [PATCH 2/2] drm/xe/sync: Fix user fence leak on alloc failure
Thread-Index: AQHcofkGHf548XqYe0aCrz+yU6rNCbWKr68AgAFf3vA=
Date: Fri, 20 Feb 2026 20:48:19 +0000
Message-ID: <DM4PR11MB5456EA92D09D0983AA0A03E2EA68A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260219233516.2938172-4-shuicheng.lin@intel.com>
 <20260219233516.2938172-6-shuicheng.lin@intel.com>
 <aZeglApCiHaIeYHn@lstrano-desk.jf.intel.com>
In-Reply-To: <aZeglApCiHaIeYHn@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB7605:EE_
x-ms-office365-filtering-correlation-id: 0fd9be89-63ae-477a-9176-08de70c160f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?797wSNihdFmh6aoiZrKCnIJmEOeb9bXBcN/IrB9spwGUfxJlbdn0encMH7sw?=
 =?us-ascii?Q?N7aRYxmazZuH/uEIaoAFE6wN9ibFVxjzLhPXIY1Coa1G4uLbH091Tl3azRmv?=
 =?us-ascii?Q?XYuTiavcvlhEffMm1GBOkSdgRbnuSaWNVKskcgue1Lua6jF+0zJ1WoouYhy+?=
 =?us-ascii?Q?9A/EJAVUwVhMj7JJjEY6qVLxRueyoh9WwbN+0/Toyjs7KafPWEyDAeLkFBm8?=
 =?us-ascii?Q?1gF+yF5pNaicPQm5oY54aHQj6aWq3nuGLw1Y1adY5HCXj594METjKogu9eSy?=
 =?us-ascii?Q?SWyByM445j4bhWkqMBZ1e+lMWxXx9DNuP8yMjAnOSu6KeMxGZe7YE0BQyYaA?=
 =?us-ascii?Q?jR9aJcSn0r0w2ic5JovlMbA+BXW799HDaf90SUZ2C82uQeuqD8D05i1Bj3oW?=
 =?us-ascii?Q?FS49x9XiCOtDo07qFvEJMIhh2f9IixucHDBHhwXMidBoINSKnh6BrnrkcQAS?=
 =?us-ascii?Q?f5WVIZ/Ic5FuiEqigOi/AhhLuoEzMjejL5HA1q17S4WsItd5QrcSXjDObf2O?=
 =?us-ascii?Q?vMpFjI+GnzRUTPKXlcuZO3aL3COlUFcKXIHWStuNGc7uZHss1Sinl+WUL+xb?=
 =?us-ascii?Q?WeBP2tmsW11zMFjv0hTCnKgI1B4fJOFGSMXvVIKafaL9OiNLM5BTxAESh1E7?=
 =?us-ascii?Q?JLoa/d3W3eYjhNLFkywdaj92nsXHezAa8jI9VhIyYKWEM6UUbplkn8pnNIuQ?=
 =?us-ascii?Q?Rfqe4dkgy7Nh/uJzOWwAyYcT/B5NAK/BaFiJrQz72uwKoQy01chcWBdhLFZe?=
 =?us-ascii?Q?1oi1eQV0/qFlyLg7iH0tLJFp5nyqf/T9RfzLq/pExM4/sDEFvWwV93dD5BCI?=
 =?us-ascii?Q?6apTGjuWFYtEaD+ENuyZXW1tniJRETrp8fALta7wumjNG9n07E/h+izosFVY?=
 =?us-ascii?Q?mzD/mDTFdkWc8ZCFjI4Um+awsNDFwhnvXrmmkOTbEUVVdV0wenk+qWXjg+Lp?=
 =?us-ascii?Q?TWXIAykMVOscYtNlamgQCqYUcE4Lj7XONYN1N2p1uXhvdf7Frp93mbbPWXtI?=
 =?us-ascii?Q?+ImfzzIGDsyo5Ir7G5JRx3O03ZqDeDYy7aCN0GPrQzthsDtdU/q2LHmFwvTN?=
 =?us-ascii?Q?AuzyeMzJMhdXY2I2TX4P6XphJ8doh+uRjYzZsFOnbDJCy1TJCKgd4/q8GQAs?=
 =?us-ascii?Q?2OtdE+dzCYKJgWWf01Wdi8Wm956g6Y99pdmAFNzx9XfvbBMNhcfvi7RvUexQ?=
 =?us-ascii?Q?Mhzuy6mJTZ5X78hUvR8WpS/8EgvFjsnHWpoj/14jaT+vWYI/08qEVxnaV1KC?=
 =?us-ascii?Q?iTejbrq/Q7UpxyfJGu3+MB7ITeue6zAEdlWw1lEHI2+ALTWQeyWjEMWu1/lP?=
 =?us-ascii?Q?b8uXNd4LuPrjM4czH884+YOf0Ir6gLpSFzyKz58xFiV+h91/e8Zvo/bvtzeH?=
 =?us-ascii?Q?HCXWsvK83Rm0w+TZ2+0itXxd/p4cINqcwvL+Qv61W1ozeIgUZwCpIrGZRdCY?=
 =?us-ascii?Q?tHQVR7coYOLMXV/THAxS7mJVbXF/tVSjV/zgd+mcuK1THZCmp4LChOCcvZcw?=
 =?us-ascii?Q?syVV01lZpN8KVOROfkwFf9yUqeAoZveC+w7uDGH3UbN1lsrHIBjjh8ovjikr?=
 =?us-ascii?Q?Bo8wfpjsZO6cTx4YCP5S6niAVWdtzOjyPl91tCHB9ZhRmCvt85khXiiniyuq?=
 =?us-ascii?Q?sCIm6icjCad8okGvwBAGqR4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EgfF/bgM9KBzNQ9cpBzOv4a2Emj5wbCkGvkRxrEVNdVrsIMDGmMsi4Q9E7nD?=
 =?us-ascii?Q?YIusRhnUyNzO3B7cZ/SH/I9PrIJuqV9vB58+3ueXV/WEQaTTlnW1TDQlfj4M?=
 =?us-ascii?Q?LkWPHv3QmJXb1G7FUqT3GTMegI5GaVFCyN3FowYZA3jR1X+nKSbwkzSyZBYg?=
 =?us-ascii?Q?icnHD8oDjmESE1bRz/fEFQOp7EFob4oQUq9D1ITe4eYWN1uHh07wOT+5aJ6i?=
 =?us-ascii?Q?BHdu6KnFaJsL+3boZ5NYLJRwxKiVBPfg2oYJFsvnOZlVSYHIhnDbgBbwct9Z?=
 =?us-ascii?Q?1L3yfGR/XUMFQv7Gq0kmd9/JlyeiGg6lPDNstNB2/v/zgQ5vGNVN4Sls2z98?=
 =?us-ascii?Q?spOZswJCLqnAzO6KcuxDZoR1X8Ymvsqd1g11KhSh0z6wNgEf9RV5ZZ98PZOs?=
 =?us-ascii?Q?MB2OSqi3KWAAm5E9jR0NigZMwyNoGzhle2ZULmMshzY52IPJBPvqOw9jkEl5?=
 =?us-ascii?Q?4hzScJzfBXZNZAvBPaRolyFCGBPLvlZ/UY+BqDseur3RJXGVzaZJGECZj/+d?=
 =?us-ascii?Q?s9Z+0W/snaIOksHhrlzKxy/YwvvtnvkI5MSfrjn4/8kfXaMb4qm6khaRrKTh?=
 =?us-ascii?Q?WTtFbc+qc5Jd+LJuagpDJoVzsIfWDyiMW4g2fBAUHQ7QA8Ujd9t0u33YlVjw?=
 =?us-ascii?Q?Vd+RJnn+PFZyWnsXqyQTLBbQRSWRu77TxRY1nvwrdE5MV2vxdXToAN/kCtGg?=
 =?us-ascii?Q?jbGC1F1hx+Ul84ZwYBFF4HCOG/qZzLdrajhAj0RtJzd9/XnnANCDJw0tqXhB?=
 =?us-ascii?Q?9FoFdbJe4A/lv+osDU7azWWm0iedS6krGbxXlLQBm6Z2FQAoBgAfz/i4fIoW?=
 =?us-ascii?Q?lPGU+9gsHAKRB+xnq8p2E6+fiCsj2AfB+8HcnVbL2TTlllKZ/rifJLD1z3CI?=
 =?us-ascii?Q?4w0U02uRIXhO0FJQgKy/47uHI/B4UovxI700Y15S0nJfbZgyu5aKa19CuNGj?=
 =?us-ascii?Q?tUo8TJk7UHk7lQ6b2InI8M+KWn9aifitOmTyvmeiBa1n1rryP0hWHD9ExJ6K?=
 =?us-ascii?Q?odVe6DYyRdQhwuWyh5Hw9oNRCFjt7sr7lx6FJVAWjXs1AAwP4vz0pfgW4Li0?=
 =?us-ascii?Q?GsxNwk+Q+nXNMNer9uCBEvRGE1u+cjlOV8/3NeqnU6Sa1POL0/WvDr4Gup4M?=
 =?us-ascii?Q?u9Evg7yPDNnaXXtGBDoF3MRP3K+FhVrmdmCaW/5S/LB3ageE56VtTer1VWwo?=
 =?us-ascii?Q?fg5NmHl8L1mlZqmJlLck/8glQo39jzReJ6FCQLG88pZ7tyRhYXUNY60tcTTK?=
 =?us-ascii?Q?r4xrvkzDcq5bWDJnfLLexwBhPVKK6z4Y91uY5h2+ZXRHCK40c2yo1BI9JfMK?=
 =?us-ascii?Q?rUvx2Ia7DCjuMLavuDEq7ctEbXKr0FqNC5uSoN10qyFaBibIi1bp3GxinmiI?=
 =?us-ascii?Q?aLQrz254W25G9KkktrpU99FTsF+u4M/KZe/EErsUr8wGH8GFUBJCf0eRfgRT?=
 =?us-ascii?Q?/jtOCmVMxmTBclhNpewSc5nfvJYeOLvGynEYrR4XXASdTPuwEE9/zi/dbJJ4?=
 =?us-ascii?Q?DOKUSsiknAe8dEKGURmvw3D21+oV/sFnbrR8qydqQnhHrOs1dJjTbdpd/Xk1?=
 =?us-ascii?Q?RleelqVBYTi4W1PInbWlKYw5ey0s3pvDoE7gGRSGzkM34DRX+OyqXkU3hpZx?=
 =?us-ascii?Q?Vr6syzPnOhCS6EPgiDyePjo14/fOeK2qggkpzWVG/GBLxPYm7cm3Tt8VN8Ay?=
 =?us-ascii?Q?yMuPdvYu0blso9L8rPkGCAst6/dABx0KtE3xBx6XVldmCNuheS5FVUqsA2r0?=
 =?us-ascii?Q?NtV4lEWXV1vtRZRMjdIRXtzWj/1hVZRu5IRDGhBjbGXI3y9s+Tyj9wyCrqs0?=
x-ms-exchange-antispam-messagedata-1: F6/4s7SC55aRoQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd9be89-63ae-477a-9176-08de70c160f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 20:48:19.0580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJCWgRgq1TORv+EkGiWRu51vGjqdgaC/aQXRDGkFdF1X0PpD3qepEBpbZ7eoILeYD3NSJACFTsaOQWa8gia6PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7605
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

On Thu, Feb 19, 2026 3:45 PM Matthew Brost wrote:
> On Thu, Feb 19, 2026 at 11:35:19PM +0000, Shuicheng Lin wrote:
> > When dma_fence_chain_alloc() fails, properly release the user fence
> > reference to prevent a memory leak.
> >
> > Fixes: adda4e855ab6 ("drm/xe: Enforce correct user fence signaling
> > order using")
> > Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> Opps, missed this on last patch but also please add the below tag when
> submitting fixes patches:
>=20
> Cc: stable@vger.kernel.org

Got it. Will add Cc for future patch following the rule defined in "stable-=
kernel-rules.rst".
Thanks.

Shuicheng

>=20
> Anyways, I can add this when merging after CI passes...
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sync.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c index f03ab2e27284..52cefbd985ac
> 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -206,8 +206,10 @@ int xe_sync_entry_parse(struct xe_device *xe,
> struct xe_file *xef,
> >  			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
> >  				return PTR_ERR(sync->ufence);
> >  			sync->ufence_chain_fence =3D dma_fence_chain_alloc();
> > -			if (!sync->ufence_chain_fence)
> > -				return -ENOMEM;
> > +			if (!sync->ufence_chain_fence) {
> > +				err =3D -ENOMEM;
> > +				goto free_sync;
> > +			}
> >  			sync->ufence_syncobj =3D ufence_syncobj;
> >  		}
> >
> > --
> > 2.50.1
> >
