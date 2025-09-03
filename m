Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A28CA0FF2
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 17:50:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B4310E09A;
	Wed,  3 Sep 2025 17:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWFjHndE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CA910E09A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 17:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756921819; x=1788457819;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CpMTjvwQVB3jOlYhRccN3H5QH8+R3rnuAyhiVE0qUvg=;
 b=HWFjHndEUPGuZ+K0FYbigyXlCUDJ3BViAmeaBE9M9Dnmlf4snF1SXv+c
 NiOnsJS9hZ2khi+rxygS/H+LAX4whjMGRUAgFU2CCyzSFVU910ZWBjOt2
 8+bOBEAlUWjIgr5NnKzPrdab5LS5yq/lqkBf0pXyG9kTzrQ2Mv83CQWCO
 Fi84OCn/bIWtBFmfiguUWs82oXEPL3Ge96hpIsEWnrYRHPoiXk0SRPvkm
 90/E6fQVC6GeYpkC2H+YD6Mz6+DhUZorMXHH0gpvrtVJnGR49B32V4gZm
 vyjvjo3/iqPyCFtRw5RiQOUH9wB28xL09dUTCrqJUoiRppgNeKYNvzSZf g==;
X-CSE-ConnectionGUID: jJwDFqf8SP2I9GJvNMCJEw==
X-CSE-MsgGUID: Wo92bNITSMqdTbdmQEEqoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59197427"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59197427"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 10:50:08 -0700
X-CSE-ConnectionGUID: +J69ZRE0R8CUKIISjdi+yA==
X-CSE-MsgGUID: WmRDLEh1QnCYK/QLa5Swuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="176932403"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 10:50:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 10:50:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 10:50:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.75) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 10:50:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrMpak78eY0EcHbLC621WIKsxF4UB16xHbv5YCH7i49FM5uxvD8vvNJj54VSjuc8cijZA3Yb8IiL9/RJEyblbzJ4ybKIHJ2oyXYe16bbbPFJtjiz+8FMNVqt8Qx1cVj1lH24BhO5sp8yryzq/QLj4qu7hTDI/rHDE2pz58JW617hRJ8B3x+dcY9L6IpazaMlL2GsnZV+6X3KWrN2hN3qld7MTYDf9Oy60CvkjuOus8Kn4hY2uhEvpH7MsuzfhcA8b+dMsxF4Av1v3txFFuN8ue4lzb8Gh5i9lMFWQl0WPlYd58jXmCl07o1xEbUVlqXQo5403hGm1sZuIHkznfBp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6ovTMNrsbGvY3qo99InXuXp6U02YJDCnxjeKwOPSio=;
 b=SOtbnye9TUgeN+4+98gl6bwmfd1dhExJaCZgIRFBTAH5jbkOTb/NFvN3j0i2sZl3vtDdxTWHfxan86R+UyLE5NKZaMkYwSYP4VZTfQgYk2+9+NQBEhG1bMdKcD06UJ8FEssIjqPSEXe2zQ1Wjnx85jQ5svVgn9RVEd3FYmrUj/TAcl4CjuhRw3iyL4DewhnjLJV3WZbUCdV126jCY0mOHwPRQh1MpUUJoYhgupt/zGvz1wgkKruq1W9OA9HH+gPj33n8hlgHG7G4unLsuvSLJehg0tSnCYuC32rI+tf0rPz6WycMlCr9rrtCajCcehovH84DNUoBmZ1iIn65CkGtMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7194.namprd11.prod.outlook.com (2603:10b6:930:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 17:50:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 17:50:04 +0000
Date: Wed, 3 Sep 2025 12:50:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/configfs: Don't touch survivability_mode on
 fini
Message-ID: <3iqgbkqltxvairumtb6msmgi7xtrx4iqeq42qt3jql3r54drfd@oldwqas3rct6>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
 <20250902131744.5076-2-michal.wajdeczko@intel.com>
 <qeq32k6xksjwzg7saglvxlodqxkr75mofjnmfv2bx2dzanciol@2c7ouidjtxly>
 <12059b2e-e91b-4db6-9602-ac2b09b460b9@intel.com>
 <2f87bc32-f43b-4880-aae4-bce73778d9a4@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f87bc32-f43b-4880-aae4-bce73778d9a4@intel.com>
X-ClientProxiedBy: BY3PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8f9de9-11f6-42e5-8d6d-08ddeb12502f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mC3EUu03wrnuJmbDGj/8pWYHHYMVC8J5o9cqBPCSni+j19kDC5swrRddTV?=
 =?iso-8859-1?Q?sZGQfi9TaA+xT0w43zl38gtCOfVPNBAwu4zUzgpsUI1xtTi19LrDMKTcC7?=
 =?iso-8859-1?Q?EWb16zecj53YebxykBJV3yDxuoJTrECg70s1fWsRwQqxQa3Hmxt/TiyxY6?=
 =?iso-8859-1?Q?BxuD19XftRdJD7hQXTDzLivzBehzv2PalO8wDxcnSTZg3c+JV6lJduP+vD?=
 =?iso-8859-1?Q?jhVN9O4BYnCIXDKIFRe89VGa6ddeKTjUsQJpLDPdwR/YKAN+THOghh/Q2U?=
 =?iso-8859-1?Q?DC2veC1rYnM0IufMuddheSA4zTMgfCMobfuoWnM1ZyUL4D+BwgKJtyXZZk?=
 =?iso-8859-1?Q?kdzoqH+giyfLod4GiHjw+QvZdjAg0KBdB6V4GsuIui7N6gKOel6thK18G1?=
 =?iso-8859-1?Q?MDLk/5foWyS53OwmLolN/H6ixTG1J9MseZ59uFR3wG0f+3Jpk7NMZb7gNb?=
 =?iso-8859-1?Q?amNoNtgLwntARY7McQgRqnGRyZ9SonXz5lU+xUr9e+kLe0qE9x+5UytRze?=
 =?iso-8859-1?Q?H74wO9nlyMIRC5T/jJg1O2ED/ETRJNPjWv4jSlwBiG9Dip9EZzYIGqzBXt?=
 =?iso-8859-1?Q?2w5Xj0P5nT2bUgdoG/g59hORFsDa5pxbAR5uMoJG4Q9/iEkt1Wgq3eoSnb?=
 =?iso-8859-1?Q?QyB3jER1e29N+vF7vITHysCBo6uKrJBAAbFSH3y6F41F7EIeZW+R9Ai3mf?=
 =?iso-8859-1?Q?VicD+r8zGzgIH6YI3xO1VoB4jwxe2BOQGM8hJMf3WqGqNsytrJM1CHzHaH?=
 =?iso-8859-1?Q?U+y24uE/DTPDHRUqiqJaOA9Cb3dxs+FlTx2Ml7dYLVmiJntZjBsak7y+T5?=
 =?iso-8859-1?Q?ZzYKtFHFL8mqPrsaehfSlK7EuJW4/6iT6IjGQpWklBqdv2rljW+AFMi5sQ?=
 =?iso-8859-1?Q?e7c+KHJe6zLRPpop7GQd+LFX8wYumUl+ORuCdSSgEIW/C1ItlO8CufXsQP?=
 =?iso-8859-1?Q?nHW0HIxQbj6FRc/XN9sauxFF/h4FtIQFeA2UddAB+MYEkiST1jcHNaeieO?=
 =?iso-8859-1?Q?v0Vd88tzAznssqQkHGLfoF1kbmDWZ8DUnJ/fOUPZhegpQSZTLyLQKgV6oq?=
 =?iso-8859-1?Q?kAOREBglIrsN+WA1kgkOIqnZHzKS14z6RFLg0F5z+NKF3dwdLaP6I5XHnL?=
 =?iso-8859-1?Q?tZx7V57PC3vH+JMoh9uEosu5dlXGiEO5oHgli1/K8hdRxxZPOiMr7tYq2I?=
 =?iso-8859-1?Q?KwPPP8bGrIvj5MpPswBEjap+JMaNhWhr2iDdhHi8tQjhjI9azw75PNXlRt?=
 =?iso-8859-1?Q?XcMt1s+6LrFLEG8/rENtq3gOj5uAPbMGQMVSy5Nrj3FOW9/D9Cj3h2OUAU?=
 =?iso-8859-1?Q?1zZlhl6OGvOidQi3D12aZ/R4x/0a2BOEdU4LjjlQSn4HsROFIn+RMu9Anq?=
 =?iso-8859-1?Q?oh7eQNK15+///gU0FfJRWaOqrg3rd8g6RlKr1pTI8fdbY9IfmbgJQD0mKB?=
 =?iso-8859-1?Q?SyCtiSxH+CMM5TpidH7wh+SwHQfOEl64AcT17j/Cjgrpk0MA1l56cf7e+t?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PwNl5t980biUnql0xm5RyikLiooeav4erSiMRUwWsdrZVOloQOMHY36+B4?=
 =?iso-8859-1?Q?Z0LXg8mwRQt72oYOUHLVs2hFlj1GEbC53ohMCVOIlyWVZFJGibC3QQCCxA?=
 =?iso-8859-1?Q?ysoXEeWCuI9eMvGpkRF26vnjtWdqavqLYypUoFXoa2EUg5zHgf1hbuWk2M?=
 =?iso-8859-1?Q?JWN77UjMJzi0QqnsLxm9aZVm9bGykjv1G8Sqn/rEwSSQBYVJZHPpTr8XwC?=
 =?iso-8859-1?Q?stchj/2pxPLuztnfjdqvAwLUwgaZ9Xv8jBn6UphCPUUmRv/RB40LqYqIP0?=
 =?iso-8859-1?Q?jpOB731mY8lv1Z4bND+6iPdMQbsJ4vyJaHojsiFjetnM2tTwLrfyuC4Fcu?=
 =?iso-8859-1?Q?h+l0HsKsCnlLQbC/QsCfoA5SlyBBYhA7q1S0RtxXn/XfUI4TTl7Ed6V2lK?=
 =?iso-8859-1?Q?B2onjBFfasLiBNnYPad8XoQ8mcH5K1qXGIBXo/QJxaJ5PVbSLetGoVC3Vy?=
 =?iso-8859-1?Q?MZS0a22jviG5O1uPGchMzB0tb3EF+wnXY4U2fywlRbUmCx2m6Kw0BbW4p5?=
 =?iso-8859-1?Q?zEdbUg+OTJ2+JSZFPGFEJwjjJRTHFVc7CoBDrJb5FSk5AKECNFi09C9rBl?=
 =?iso-8859-1?Q?b+6pk9hmw+OCEFqtJj6wyeIllcVbb2YpTLFw1BljUIQIv2s11BSpg2o/E4?=
 =?iso-8859-1?Q?g+2lyLY0lytdBeGZzC6ZYnoSDQkxg3B0516kwaSeQpkkQzdhk4r1keH9sy?=
 =?iso-8859-1?Q?kC2kJVHNwx7WHmIPiPLpiI7AFYPXhCWcU1aQZBxe4YBZEUQRrJkAUrtPFH?=
 =?iso-8859-1?Q?PmVNcSQw3vszkkGBMB2IKuGwOykD3SB1iOCvh5pY1SKUeFWAWYx5rvXbgg?=
 =?iso-8859-1?Q?23qyWOkOKQZRILc4ruRCPLC2T4KQ8J3wj5Dpq1Aw81kEGkdWAXks7dWc1E?=
 =?iso-8859-1?Q?6tE9nSStalAG+zu/D6Hz7bVAj4AC3c3mJ1vpCRijQQ+6JQpYZlEYX3DHaE?=
 =?iso-8859-1?Q?X29msSSMVXmMzL+kI6LZtOeEKzoUNKOkkZP8PLRv0UG4DuYP2mKXgrHNJR?=
 =?iso-8859-1?Q?6FFK5EjTDuJ1UlvfkHrGe7krWrZ7WamZwEKKcQSi6dWTFkc7vfnZdKu8wl?=
 =?iso-8859-1?Q?tHwwRHk1txQjIZgEJSZOsjRAx5lVMJn6fqLLnEDd7mfX1EaN6iM5/eOgq8?=
 =?iso-8859-1?Q?UH1ENTTf0YVw8emTFXd0LJmkj0y2VMklXBMkAs088wkw3Si0BCk8kg2ck+?=
 =?iso-8859-1?Q?GqbrbBAPHk57s5Oti7w1fFkF49NCFoj0WSNMvyeQ5udP1ROohZUA0tS9gF?=
 =?iso-8859-1?Q?3M3PgVf1dSNIwc+wnbnQQx7DmYrQnsXxSO3k/K2fBE9hKJWU+j8nnkzGtg?=
 =?iso-8859-1?Q?Eg09XuIwOdCWdt5s0OCWbmnqbyJFKFzgFIeqtrNkKBeZnHvWazv2lAVVNh?=
 =?iso-8859-1?Q?7vmOnU/np//uVf1/RTMAFN5cdV2l8Ro6VKF9hfXHSbzFpAMmAtDk2p2oxU?=
 =?iso-8859-1?Q?ngs1YqiMPNWzvQgJAUVDHFHbGfazg5g4sqGkrwbta+eI3WXKyXpKTAO2Kn?=
 =?iso-8859-1?Q?+z2IlEu3zKNBdpL/sRomywHFV8EVDbzdYtfoNWWZDnG4Y7p7jHp9o97Ifx?=
 =?iso-8859-1?Q?79oSjS4ceMbVzFo6FytBL4VZDSAoY7JICSM2p1uKD+bNd7xlFA2lZITMGB?=
 =?iso-8859-1?Q?hLcD4pk/Gh17Xt6TgwObJC7WaKuCZzI9j0Dg+zxKESDvZU8lMCHjKUPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8f9de9-11f6-42e5-8d6d-08ddeb12502f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 17:50:04.6079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SoXuB7zcccsDzQ+6q5uD2uZFwL86gBD+wVS75998x7JiNLPebZqkYzJ7hUV2eoeVeNEWsSbMVWu9lii8KnydJOe780rsa++mSUE5EYT4Ny0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7194
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

On Wed, Sep 03, 2025 at 07:49:39AM +0200, Michal Wajdeczko wrote:
>
>
>On 9/3/2025 7:39 AM, Riana Tauro wrote:
>>
>>
>> On 9/2/2025 11:34 PM, Lucas De Marchi wrote:
>>> On Tue, Sep 02, 2025 at 03:17:42PM +0200, Michal Wajdeczko wrote:
>>>> This is a user controlled configfs attribute, we should not
>>>> modify that outside the configfs attr.store() implementation.
>>>
>>> agreed... this was the first user of configfs and I don't think it was
>>> the right to do it. However for such a change we should propagate it to
>>> stable too. Riana, any possible issue in userspace? With this change
>>> userspace should do a rmdir() before proceeding so it drops the
>>> configuration.
>>
>> Survivability mode is enabled in early probe and is used for firmware flashing by admin. If this is not cleared while exiting the mode the driver keeps entering survivability mode on every unbind/bind till admin clears the mode in configfs.
>
>hmm, but shouldn't driver enter survivability_mode *only* when there were some issues?

entering survivability_mode via configfs was a user-initiated action. We
shouldn't clear it on unbind.

>
>>
>> rmdir is general and can affect other entries. For survivability mode,
>> it's better to retain this clear.
>
>but it doesn't have to be rmdir
>
>mode could be cleared in similar way like it was enabled:
>
># echo 0 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>
>and since this user controlled config entry, I would let the user decide when to turn it off

correct. It's even worse if there are other configs needed for that
platform, because then the user will play whac-a-mole if he has to
unbind to set additional stuff example:

echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
bind 0000:03:00.0
# ... oops, forgot to set some additional things
unbind 0000:03:00.0
echo foobar > /sys/kernel/config/xe/0000:03:00.0/something_else
bind 0000:03:00.0
# ... oops, now it's not in survivability_mode anymore

Doing it the other way is very simple:
1) if all settings should be lost:  rmdir
2) if just survivability_mode should be lost, echo 0

Lucas De Marchi

>
>>
>> Thanks
>> Riana
>>>
>>> Lucas De Marchi
>>>
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_survivability_mode.c | 1 -
>>>> 1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/ drm/xe/xe_survivability_mode.c
>>>> index 53c5af4b810c..79426ea46861 100644
>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> @@ -180,7 +180,6 @@ static void xe_survivability_mode_fini(void *arg)
>>>>     struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>     struct device *dev = &pdev->dev;
>>>>
>>>> -    xe_configfs_clear_survivability_mode(pdev);
>>>>     sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>>>> }
>>>>
>>>> -- 
>>>> 2.47.1
>>>>
>>
>
