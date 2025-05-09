Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8B1C3ABC3
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 15:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFAC10EAB6;
	Fri,  9 May 2025 15:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bsAKs0Wn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3861F10EAB6
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 15:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746806226; x=1778342226;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MWCfYJhwFiqfTIiTLYe3hoeVDgzojMpCppnyfbbfnlU=;
 b=bsAKs0WnTxCtfB7rko+vK1/CEHvA/vd/GhmCL7XHWjtxan2mIS4mwpRa
 HjJzloMnvraxGCkudZmxg3ZFD+Tf1IlGfwh50BOKLc0Qa4oHhAF+i0pQB
 x7L+26BwlhWaHrjFIbM1nUdEGj8PbWZtv+FKMrKq4tchUE++decZGagFS
 rfKOg4KTTXEb64hz98hmPD94zq3EtsrAgEPA9PT5wPi6zlwRBz2ZL3AIW
 QnlY6Z1BbQJyHNseHnqK87zVYR8Lk5cKrBSTveQR+XPI3gPo0xhnXmewt
 g5TkukZp0NYebuomcxZNchey7G3U3Q4748Aa8Rey7HVKZv72pqv7AXCyx Q==;
X-CSE-ConnectionGUID: tbeNUn0tSr+o8SeiTmPcdg==
X-CSE-MsgGUID: Vujbmv0FQHmpHlBvc25mlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="74021928"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="74021928"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 08:57:06 -0700
X-CSE-ConnectionGUID: 5CStB3gqQBu2bxJg8GqzDg==
X-CSE-MsgGUID: eHC7bKcVSpezRQPcffx3lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="167588709"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 08:57:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 08:57:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 08:57:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 08:57:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYOYjdbKXdlEsv+NFR7IF46skk6Jb3dYEY7mcE8IdaDw5mmClWoQAzmeT2bJOgPhkWvAbj8Nb9nLJhNHrKQNnuDX2XqzwOnGSdcIDXQIKqGdg7lyeMPNYrsYlKisZYA632q2ySCidLFfp5TRtSsTn4pnGA2PIoYcUoTp5D/OYp/52OKLMOB8hE0EA7b5/sWQdL4thVSCHHsIm64m2LUO1i19mseiYznZ69J31Eq28ppkS9+WVgpkCtBtmDL6V7k8hPbpDdbu2Y2IIoBI7Sgmv7TET6qyRU4ZmsueiZRg6r3pUUHnIbEmHfUMEHCAJSKB8HM1dTIp2zgn7n8A9mDuaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lA5NuS8ILo2A0RKC7rcaC7yVOaaVJKcq0IBzlYKK5z8=;
 b=oAVSRzAX4qUC2ID/p4lEf85Pj8ktLMGrC0Vds5uo194x/JUhu47KGrUe8sX4DH8eHButZSu+pfkrc5FRZEEUkzMfzo4LC6uptzmRQaI7324pDtq0Gz2QWCM0j//L4wKoMEAbJJVzjRIwKYxzXsd7ujBMch+gH0FqOyOPLCV2ezZId4THqpmthQLABLZdK0z3ZxsV6xUZnhUPgKQ24vObZdFvmDKpF+ERyw95I5vKM4G7SDruJpOyT2LGkKsVBhPJa1siTYCMsxGaHN31GTQq2T83+OMM4rWHIcZOPQ7IeXIxHe9kxRQKneaaYKXiUSN782saPsZMQExqIwJ7HfgTwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB5069.namprd11.prod.outlook.com (2603:10b6:a03:2ad::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 9 May
 2025 15:56:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%3]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 15:56:59 +0000
Date: Fri, 9 May 2025 11:56:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v1] drm/xe/pm: Wait for lmem ready in resume
Message-ID: <aB4lx1BMVH_c2JUe@intel.com>
References: <20250410110057.2497056-1-karthik.poosa@intel.com>
 <jg7x5qtyoo6grpdxlrlulao6dzfbabt5gp5pqtkmzftrpr5c3x@qwv6ori524k3>
 <dfd48f5d-3238-469f-837e-8df09176a81a@intel.com>
 <lcn5wm254jscwodpvpwzkmqioe7jyke5yn7hcm6vjfpnyn23hj@42zcznbfhsui>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lcn5wm254jscwodpvpwzkmqioe7jyke5yn7hcm6vjfpnyn23hj@42zcznbfhsui>
X-ClientProxiedBy: MW4PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:303:dc::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b427b85-5a7f-40bd-f979-08dd8f1221c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ClnnbixEAp+8w6RC5QvRgoSUyeuwuf6uw/W8KzyRU7Xf7InDBPawPxgHBZ?=
 =?iso-8859-1?Q?aLUQq+9qbkcvjmunpiJ9zexUJfDdfZYl3x1pMKTrD3b6+syOyNJUABzd3O?=
 =?iso-8859-1?Q?ubn8FGwQB19babXeaL9M5YNG2iPRpjHJ94pvekAGO/wcLBGBDmSK31XlyL?=
 =?iso-8859-1?Q?7ftTa2MbbRY4LW4FtqkUXhqlKHyK//0nbrMu7XdOvzCDJn7UiD0sNrlMkZ?=
 =?iso-8859-1?Q?pIODyD9oq+dA/r4exwPATQdjQTJDqyWGJMOP6o95+y3FDpXKbPirc3p/yn?=
 =?iso-8859-1?Q?eKh5A6fBVLk2XELfsKO9AmMv6Gzns59mAzRRBOTTB38s93CM4EG/l2VRis?=
 =?iso-8859-1?Q?PDzmcvFvTXvH8c61HZf0Ptr3/Aa3cko0INlTvGv0+y0EZalvxn8j5hDY24?=
 =?iso-8859-1?Q?0A9kGditQGMOjUTglhlLwK9ygVsb04CO433SIbxSI7YXZesT0Ez8igQRLq?=
 =?iso-8859-1?Q?RHe0NqUFQd5cfmS8Uvhxma989g9xm6vDKgSuEO1QGzJ0cQXnHOuO8AKo0z?=
 =?iso-8859-1?Q?xmF0oDgKvw5uutdnJN9atG4moekOsfkmlT0jfCxleaWrJ0fW9Ia2uz27d/?=
 =?iso-8859-1?Q?JUlEtDRTETpp4SCrCKgXVFB89O/UoTMzs7cPN49NzgD8Ro+XCjyMqqtmqp?=
 =?iso-8859-1?Q?F9DSbk+/DRr9EO72Gy8pIMarp6nk2p6IUvrN/Qv51M/itNdIt4Fm3sCzzE?=
 =?iso-8859-1?Q?dR3/zbg6mwXmK/IYmmYjQ4Nc3Ltgh3lm88h5OYSeDeHsQKzZsq4aJArsph?=
 =?iso-8859-1?Q?8ZZKqK1e/qPHqwBKYSgTXGHOabTMdyVWz7ouhMzSarmlBmelmGCwmGWZde?=
 =?iso-8859-1?Q?x42GA+17VPvC+IwGHzmYAd7i5Eitn9V5uR/rnglmiNcsxjUSffoEciIw5U?=
 =?iso-8859-1?Q?z89jIk/qp93xMCypZQKBTaAI0dvzOhtZHmG9cXKOs7614Lk7GLY3bwY16U?=
 =?iso-8859-1?Q?5VfvRhaXPMoSc0wjnvFRa+XCs5vvtLvbWn/hFnCBEoFn4eByuEEYPTGHkI?=
 =?iso-8859-1?Q?IYuln8OCWX3TiP7iyruUiNhGL9urryM7v4QKiJv9sHgX6Zq53QwdU3zqRG?=
 =?iso-8859-1?Q?cvf+bKqzHhvkSL29Dm0W46Lpd6HwziQjnql5FfEO74G+V7zqjcAmEdmWf6?=
 =?iso-8859-1?Q?1AWjZYhKkeTiwo8Q2wWvLpCnskfQ6y2Uhsyzp1QMVSXHgJzGGyNDqbOQBD?=
 =?iso-8859-1?Q?SSAqInHudyBp2JpiLfFrHNA4KIS+BIOG+Jku71u0GbOPZ+NsTuBXHOqkwx?=
 =?iso-8859-1?Q?8zkhxAmOPLWcZjNtyJ7E9dEyknQ4+4hpNdwRLSERi9BR/nGUe+24am2ydZ?=
 =?iso-8859-1?Q?1riGLv6M94zgC8N0SVCGfRY8ozcT7mjbxKLKLto9EQA3sukF+Cjz6zL1s8?=
 =?iso-8859-1?Q?QhfA9V2I09+6PtmJGNjqjh7DTRjUod+/gvCeKFMszkdZaWTPLdbjemN06S?=
 =?iso-8859-1?Q?biCZszTYr6rk/187ViZdFsLxn1YTiYS8lDjS01Jz+TYy6LMfKe7juA/Ac1?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?B3AN5vKB+onneC81EYrDgjnUQ6UrKySKAh2ZfF11fkWflmlZS+7ed6CDdy?=
 =?iso-8859-1?Q?saIvUXHHXyv9pdnpVQuuLed8cLpO0fa2GYc1xYWZv9SPC/CEtLlL3YnO10?=
 =?iso-8859-1?Q?d9d1NqjOmHKTcmxvMnrv/MpmsHRswVxvK/FxsFEOi2USHlIT4jRJDquLDK?=
 =?iso-8859-1?Q?JTFYjS8c01V/dWcwIljJNyFqZo9zUrnenNHkSlHErQP8eLdf7WSvLbmK66?=
 =?iso-8859-1?Q?uMaTj+Jcf+STQCA2uLlwziVPU2zlknaY5Kk9iE95Ci91L0JdsC3MK4+Mdd?=
 =?iso-8859-1?Q?tydP9EjMEVqKEm7Vw7logmHgqIySzZD7wRK2QuYRUAQutLmCyE1AE0c0op?=
 =?iso-8859-1?Q?jcEWpP4H0fdKRdeDksbb0vUyrPaQf6szDOY3R1v0QulOGYSdhbpsApteQG?=
 =?iso-8859-1?Q?9LGS9wGPKEiMWYC1lQRHwsmbeqauDD66xoSLpvmT6Vd3wh94dBkBBqgE1+?=
 =?iso-8859-1?Q?haDJos9kqSr1U6IKyE6553D2U8ZLXMk8WnfFKcnK/oqUJTVcbT4B7WbuWV?=
 =?iso-8859-1?Q?qvT6A1eaOnDqSGxMRpD+8/ii9wQNsa+zUoUrwIL7Nuw2x7DJc6MK0jX4vy?=
 =?iso-8859-1?Q?5v7LZj5tp36eOXJeZHcfnMyR5WA/Kh+P42SsTeMOkcr8GHT3IulYlINF55?=
 =?iso-8859-1?Q?YmmFMcn7E050MlSWEupYPZspYMq+q1L/t0GiR/W/2ssqWsBgIIOXLd23Zv?=
 =?iso-8859-1?Q?bnvsYntyFe1R8cKq4sVP9KEmMC0KUskZbjFWvvBe5i6/glVPUqvSsSqdP7?=
 =?iso-8859-1?Q?LISSsTs5QjZPTcRUzig+BF1fseNf2rPlXjX9HtGlOJhwZntjlW3vvORdW0?=
 =?iso-8859-1?Q?V0dxHGChrToNXvu6q5vp2f23cvnBgxCjLyl4gNdYA7ghdIIG8gVMdBALGI?=
 =?iso-8859-1?Q?nkMHvcKWIVk4pAJF4dASw3cbJLrCnc7R/b/R1SCjEHWMN6d5HnNWVnJPjx?=
 =?iso-8859-1?Q?lZXyaahTgt6O5ZUvD+hyzDnET/GMb5gjy+wRF+wSAC9HG3ylh8lb4d1KhJ?=
 =?iso-8859-1?Q?WPou/sTa79PI1Dx8KIMkZRa+jpct4wP0a3yiPG017VT5gWKe6fnRimQTf3?=
 =?iso-8859-1?Q?DDBe+/5pY9PlJYoQveYEOxiArJcLESWkQ+nmExMHc2FySOIUg0iCZFMvN3?=
 =?iso-8859-1?Q?ym5MLoMUh19mlchExThXZ+AIkBS46D9ZshQnN2klv0h0o/d0c5AxFjOcST?=
 =?iso-8859-1?Q?k5Fc3PMds8iAVp54PVa3Ti2625uU3Bmq6w6TV7gmkYDjDDJTE4bWeWnFTV?=
 =?iso-8859-1?Q?grf+4ww350evk/5FZApraLTWWg5AGPtjaR6sdhULzPp6sY90uYrGE/ZyAT?=
 =?iso-8859-1?Q?z9qIJsVdq9+6IqVSdpAwn0u0EyBtBQxkQPZYcjTwLLNDpRZYW9TFksr9Im?=
 =?iso-8859-1?Q?QgsCuAlett7kcVmtYliNHvFNGi6RspCklAujv74RHaD41NOhFCI8ZsPjOT?=
 =?iso-8859-1?Q?snVpKtdM/RPRjes4uNPX6VHKFVORFbNQ69LZh7qUMn02V6nPF1D5ok80ua?=
 =?iso-8859-1?Q?vkyi7yStnuI11r/3WMgv4a2SDRlUy/qn29lYRX0zBAClty8FXJGp5wSgMR?=
 =?iso-8859-1?Q?v+mEV5+1ow4s8LrDPfopRWj1C7DPN/7kmJxOJ2y4+YlAvilsVTxr8eEWaU?=
 =?iso-8859-1?Q?IcM6fgejSWhX/8SRdO7r8M58efJ66WtmU9tX3SeUKBV6OZQGrlDeBDhA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b427b85-5a7f-40bd-f979-08dd8f1221c8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:56:59.7729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+4F7lgbMifkGeu1dSHRvhfcmCDAIOvixW55i8Y1I2ibcHcqVrilSyprKcGKaR43FMUVESRu5TvOQ++XGhcOLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5069
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

On Thu, May 08, 2025 at 10:47:59AM -0500, Lucas De Marchi wrote:
> On Thu, May 08, 2025 at 11:28:29AM +0530, Poosa, Karthik wrote:
> > 
> > On 22-04-2025 21:30, Lucas De Marchi wrote:
> > > On Thu, Apr 10, 2025 at 04:30:57PM +0530, Karthik Poosa wrote:
> > > > Add wait for LMEM ready during system and runtime resume.
> > > > This wait is there in probe and is missing during resume.
> > > > 
> > > > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_device.c | 2 +-
> > > > drivers/gpu/drm/xe/xe_device.h | 1 +
> > > > drivers/gpu/drm/xe/xe_pm.c     | 8 ++++++++
> > > > 3 files changed, 10 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > b/drivers/gpu/drm/xe/xe_device.c
> > > > index 75e753e0a682..4c0d9eb51d1f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -630,7 +630,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
> > > >     return !!val;
> > > > }
> > > > 
> > > > -static int wait_for_lmem_ready(struct xe_device *xe)
> > > > +int wait_for_lmem_ready(struct xe_device *xe)
> > > > {
> > > >     unsigned long timeout, start;
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.h
> > > > b/drivers/gpu/drm/xe/xe_device.h
> > > > index 0bc3bc8e6803..60bc92f9ab22 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > @@ -47,6 +47,7 @@ int xe_device_probe_early(struct xe_device *xe);
> > > > int xe_device_probe(struct xe_device *xe);
> > > > void xe_device_remove(struct xe_device *xe);
> > > > void xe_device_shutdown(struct xe_device *xe);
> > > > +int wait_for_lmem_ready(struct xe_device *xe);
> > > 
> > > if you are exporting the function, please follow the naming:
> > > xe_device_*.
> > > 
> > > However, I'm not sure this is really needed, particularly on pm runtime
> > > resume. At the very least it needs better explanation in the commit
> > > message. Do we have any known failures this is supposedly to fix?
> > > 
> > > Lucas De Marchi
> > > 
> > While there are no current issues without this check, it's a prudent
> > measure to prevent any future problems.
> 
> no, not without proper justification. I see no reason to wait for it in
> pm runtime resume. We shouldn't sprinkle sleeps in the driver to be
> prudent.

We need this on D3Cold -> D0. If power went off, during the wake-up, memory
links needs to be retrained and this is an indication that everything went
well on memory bring up and that we are able to access it from the driver.

That said, I believe the code should be changed here to only have this if
d3cold was allowed to start with, and not in every runtime resume.

> 
> Lucas De Marchi
> 
> > > > 
> > > > void xe_device_wmb(struct xe_device *xe);
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > index 4e112fbacada..2e59670660c1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -182,6 +182,10 @@ int xe_pm_resume(struct xe_device *xe)
> > > >     if (err)
> > > >         return err;
> > > > 
> > > > +    err = wait_for_lmem_ready(xe);
> > > > +    if (err)
> > > > +        goto err;
> > > > +
> > > >     xe_display_pm_resume_early(xe);
> > > > 
> > > >     /*
> > > > @@ -478,6 +482,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > >         if (err)
> > > >             goto out;
> > > > 
> > > > +        err = wait_for_lmem_ready(xe);
> > > > +        if (err)
> > > > +            goto out;
> > > > +
> > > >         xe_display_pm_resume_early(xe);
> > > > 
> > > >         /*
> > > > -- 
> > > > 2.25.1
> > > > 
