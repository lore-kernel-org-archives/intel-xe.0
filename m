Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCF4CA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 14:44:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32CA10EBE5;
	Fri, 29 Aug 2025 14:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfRy0hyA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECC010EBE5
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756478652; x=1788014652;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HkArNS6QWdef/UuamBnrTCvKQUPcdg4ZZ+5RWo1HpSY=;
 b=LfRy0hyAmcuKNrx12cNpGj46lrfhOsRaCgMfNY5oxIzAs5Oj6R62ezZ9
 xXolWJEJie+W3SSp0l0NwWu9yWIXoRsMnxdNWPqHzMS7Dvu7X3rKYdGEV
 0iD9rdfaesxJQmJleIaRsjZ2GZqeARh24O+0G/ijAWEviu2sHT7upU/lR
 I05N/NCvGQCeK2DPYWoLkPbUC6MCTo2JwQ0QDIfOrhQc/9tXS1KLal93p
 B+Uq4QqeNlEQJ77xVtffaQTXs2dVgYtFp/hc1knz40o3ouaVRJNN84gge
 KLkvzUKxb2BMcnJBCnNPF4UotDDpQrPbqq83FtO6DQI4avuENB2UqTblC Q==;
X-CSE-ConnectionGUID: 0JHOajQsQhivvOFuPSAiHw==
X-CSE-MsgGUID: J11xdlzKTey73oJxUSLb7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58694404"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58694404"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:44:11 -0700
X-CSE-ConnectionGUID: 77Dxbf+dTKueV8CN6nuKjg==
X-CSE-MsgGUID: cXWWsnVpSfa65qnIt670fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169922609"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:44:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:44:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 07:44:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.80)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:44:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNI7GwTxk8hnrDrbUBTyp71JvdZzsui9w+Sp1ha8/FLdchdCWBa7grhfm6TdI63NOEw08pkcFLc7JYhXtWnedtZ2BUIeD01dE10hAWDnVXkK5Z3iDMUdVSc0xzIJEkTKFe7FCL7QpUGLntwNdmc6lgpz38VtmZgtLOXn/FrqjhpwLLt8uDkrVVvka0tTQ/KXEBcW4tbLivdBRCPfyQ+PCSabzBoGZlEXZ0w3BEZu97w9szgPH22BtQqw2FqBAWiaXHkqbXEZjd/VUHjLofkcZxI2DRz4axKhyIFEf3mslMOXMD8LcEimsyBXSHgGfBmnVGpFxxmAIohhe8vaXznSuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ub47VtSPCurtZofu/LgdezpHxCEqIdRb6fBISoMznvg=;
 b=DfLK/vkQJyEoQYn/+VnOm23HwskG95XLeWEqsFDukeEpIUK5OksnSvN68WpAc/oQGJi57sEY3SuVk3dNy0TLeM0iJcDMgtZcypQmT6fALDeyUxDuhb0w8O+ah5cetJmsoy8MKFpHCsE/HGmrptOJNvMcHe7+9nSv4FG0CZbqosuICN8n06H7axxhxsa5sJ2uG6QitR6trgVcnvWcDWXPC/I7Yj0c5LuwoNFPW/f1J0tvC0LoCAwscWdLU7jnKOeuEsWGtzjafAnNTPRDIE+zyNCRw1IxFLd7diYmk25L7lHw3kwh673XyqtqPk2u+vQQs6zqbliV+tBCSebre0N1Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 PH7PR11MB8549.namprd11.prod.outlook.com (2603:10b6:510:308::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.21; Fri, 29 Aug 2025 14:43:58 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f%4]) with mapi id 15.20.9073.014; Fri, 29 Aug 2025
 14:43:58 +0000
Date: Fri, 29 Aug 2025 09:43:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, "Vinay
 Belgaumkar" <vinay.belgaumkar@intel.com>, John Harrison
 <John.C.Harrison@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/device: Use poll_timeout_us() to wait for lmem
Message-ID: <3hibfa3wissn6vaepqy4m67hvst2aevg2g6dnmxcmasle4eofr@tu4gt5axvs3p>
References: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
 <20250828-xe-iopoll-v1-1-9832ccd1c8b1@intel.com>
 <0249c60d-5232-4531-93d9-2a20e5eda7a4@lankhorst.se>
 <fn2cfyx5yhi6aloybfd5lhjfksgj6ywbigjl3ikvl5bwjgh52l@ae6xb34s6i6q>
 <36736f87-009b-4b0d-80f1-4034bac7fe48@lankhorst.se>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36736f87-009b-4b0d-80f1-4034bac7fe48@lankhorst.se>
X-ClientProxiedBy: BY3PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:217::22) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|PH7PR11MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: 87fe9440-760d-4b1e-06e7-08dde70a7c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?dCfKRqi9LF8Vw2mpE8lVkyAOvySpBNhcj+Ic5FcBOGxZcplSxvQbzPWbfI?=
 =?iso-8859-1?Q?s5EOOXVtX/eYdt7Ftf4O36UDF29qpfc388B2QO1tW0HKalHMvzCUZE/cwu?=
 =?iso-8859-1?Q?8XO+PRMbOXHLFb6SmQXImmIX0UpIiKQpkaWLUDrqYydg6zw+NtmAHa80yZ?=
 =?iso-8859-1?Q?rUZf7QXLYOosTdCgnHiVp9gpRmzg/fEeArtmzoHvsiHUIej1539/2VySGj?=
 =?iso-8859-1?Q?uWMS8jsV2G3MoJU+uS+RNye0R7WAJFUaSc59GkkOzTI258ykok/EL4ZnyI?=
 =?iso-8859-1?Q?qUwNk6ZXwYyq2eIjL5BigP6NpxcHgh6LNy/grf3Gl6OyiQuCAlN6BK2pLp?=
 =?iso-8859-1?Q?Dm+kTG9PQNQpLiPugXV4NshArT+hoZlkSMV99d/o7Vg2zFjSABrN51nXAM?=
 =?iso-8859-1?Q?JfKsBlf6ot/XFCKAqL2mTdPUm8YmnIzHhTomi63yQ6Tw5hI0C/oB497oSu?=
 =?iso-8859-1?Q?V3AupsESx3or7H8rriXVpcaqqOTG9MQ7VcObnARuWfNsIUlBrCXX5cTy0t?=
 =?iso-8859-1?Q?t0BAMT5Msx42ZW2+13yJ8/Hwf26LNYSaUI993F/itUJzo0Ly8u34lIojgN?=
 =?iso-8859-1?Q?SMn6FeMQ5dDTUpDyyNzzhF28mDJp32rD2fxcOjEGyQS4KJjOyF6BSp5FXM?=
 =?iso-8859-1?Q?GTa1sjq84EIOxSSEhyU9ppWgjgTQjYQrhd0iP2+VfuiaskzMCH35RhduHm?=
 =?iso-8859-1?Q?Tt0xAi4aOFp2lO0IKY5fYEhls/dj9xwynT1K0olh1ifYsQWaVCnsQ52bQG?=
 =?iso-8859-1?Q?00QGwRC0NhWNTP7bOq2sak7JseMwk3hmdadypHazipz/d8kscNDGJOcQuq?=
 =?iso-8859-1?Q?Dx2wpXalo4Ym73FL1UOtB2iMLDxwzWgK48jObXPlTuBUGNldO8Ca9t9z2y?=
 =?iso-8859-1?Q?Zo7qVxK/RWWnsod58qqXFLNOSHe4Q42MTdna3cTOFgHOvtnSmmRkZehwLc?=
 =?iso-8859-1?Q?afdCcEz/9MoXQbrGLFOqF7KwVvjdnuI81iFvlRK5cmwteOFetKHJK3nmvh?=
 =?iso-8859-1?Q?LeT19p8sH9H1ko/e3I27FXAc5aJH6NQB6fFex064LHbPgEkN1a3ZXZO4hG?=
 =?iso-8859-1?Q?XZJzJXPnMWKpD6cnJIDnJXkzW8gPJqaOPg7J7GcWReyNe7Ilahr+HsfauP?=
 =?iso-8859-1?Q?J1+Q5VSFHLTpwTMMXScQHipGZ5tXPf8E3vRJT4l8rRd0U3g75Z77rwuBn2?=
 =?iso-8859-1?Q?MeVKczmO3vNVfUDvs/C3MIVDijmch/MeJ84CzIvOglctGGM4eqaCyeJYB+?=
 =?iso-8859-1?Q?Ib4TUOsAqGBIXrYJb6K0J2NX8XJn5vUDVH1creQwiUsCJ/d+KxG2lXk9AV?=
 =?iso-8859-1?Q?kEGlAO9kZcpoPm37mmgdH6hKDy0NMf3gRPXcHtgzoLucowJvoMOBGBohvQ?=
 =?iso-8859-1?Q?EgVZXxNEHxB76R2XewOxpeDnjvHaNVVDUcWdQM9M9dP+3Aehb8W1pciX4I?=
 =?iso-8859-1?Q?g9wDh3+xxBXdTSUKPgrsynvxeJArz8XrQP8hEr22dpek+F3Ml4MoDSQCMx?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9i/0rfdxK1FhBUNOT4HTlIYSdxndf+zti9KHa6zTFJLKJPeKk/8huAeMo9?=
 =?iso-8859-1?Q?Rm8Gl2mRPVe88L9UVnrI9rsFOXlDvH5zoKCVHC/0MWy/5afpw5k+BhOKD7?=
 =?iso-8859-1?Q?vwAGTuiR/bH9F5mGhRUpcTZCAhLRlrt6jzOX3Td1vehn9bqY0HNUHy7UL4?=
 =?iso-8859-1?Q?GpVDgC2pe23kNF+uV9BMo7rgi7X6gBoPtQFj6HSgI/NUJB+21lqJU8+w5U?=
 =?iso-8859-1?Q?8mF89j6ZNb6ziPc1KtMd4klkrYzFKypLwUgvqFd3zsQvv5FC5ZEfjEvPPg?=
 =?iso-8859-1?Q?Aft8zkf32qfOx8LflHvyvEakuF8B/vKtr+NcSpjmGTfuQHZIethyyFmVRY?=
 =?iso-8859-1?Q?K8/e6GNkMCH9KMCw/p8Td/2szWiCB5bkPv8DsxmoyYmT5iu2lRQSbVOh+A?=
 =?iso-8859-1?Q?UQk+UehKJS/lg8jbwzSBWlRcfj688vPMSRC/LjxJP3yicudOuCKK9ADnUz?=
 =?iso-8859-1?Q?TQ4EybU2XmZGP3COrg/fC7h6hOnx/bHsZyF0VNLZiOGRAN+WQpExO8FHoW?=
 =?iso-8859-1?Q?MV2VD1HWgPZ/bYCvraydiaBXVzBFczTZYBh0B1iXu+goXtcwyZ5IC6JxqW?=
 =?iso-8859-1?Q?2qsF0Ypz5eWoEW9ps6JJh3M1230p7y4iJ9i7l7+gaVLpotcNt6Lkz47DC4?=
 =?iso-8859-1?Q?9iBSyTa4BwKu+8awVOn6oAOMbbwXfnQ5lhg9eMxRp8j/s0tDKf0r8SmEzh?=
 =?iso-8859-1?Q?9VrGVB7dSqjfIvRD8UBQzHTKxCMzsFM8/XHk2ZB38oI1D76ErbyDUcOZwS?=
 =?iso-8859-1?Q?F0B2MLU7PVJNSClROfUEMY/deQPwz4Ci8/VzlN7Ubx9BojayhWiapnZ/ew?=
 =?iso-8859-1?Q?/eFOu5HnmVp8KbYFAQGJn6fN3rZ2JfAtC6xmOAjIsbwOxJjseq2xC4pBkH?=
 =?iso-8859-1?Q?1Z70LAUjLU7PBuzT7veW1F01am4weCUDymRnEfZAQqhsFVmsTGKRgrb7v+?=
 =?iso-8859-1?Q?RZ+h0laXk0RrrqDRWdr6XHudz5OL27hYFTiHQn0nBhSX148wtCQ3H8kujL?=
 =?iso-8859-1?Q?HP91boZiP5hrJKiyR6y45ClB1fEebk25afkH9sxTr5wy4xTj6kOApJS13f?=
 =?iso-8859-1?Q?eW1o6bDUV31M+FdAxUUg+lJGJDwlSWih5f8dMHMBXkP7eLdH3yQYJxFauG?=
 =?iso-8859-1?Q?xMCE9Y3Vc5EEVjZnvTMWmtnMNiUv+jjVj/c1j2DhKujeYnohye2xOsP/XT?=
 =?iso-8859-1?Q?SfbYM/SKXL98XIzmA/mBtX7tjycfsw5Of7JpKM2fEwn4TMdpDBFx56ReGb?=
 =?iso-8859-1?Q?UYEiGb0d5wlVrfTsD27LHctEOabLVePGn9zD7uD/f43TeeocHTcaj0pd2S?=
 =?iso-8859-1?Q?5ZI2zkvmZN4nLGQXqjr4Xra7SCA/gpqQSCcJvOxJso6OnRcQKc5vIIwAQ3?=
 =?iso-8859-1?Q?WWU9ao9pRkv36uQ2arMwJ2Pa4QY7y05AuZ5stceomSbeHa3lRP/K4EGqQO?=
 =?iso-8859-1?Q?40RpXE1G6SDP6wv6cKfYY2ykh8cy9QQ8zOI3RDwi9begJRxmZfYy2ESqpI?=
 =?iso-8859-1?Q?9B0rQub40OHHMM9njiWR0foxXelVMjsWCi/gBJ5CvMcSk/3s6A4UQKPYex?=
 =?iso-8859-1?Q?tajNGj68XzdVXaTN8jcfMBFRvOwMemYArpfKLG6n8vqOF1jdEUzFjVPWKz?=
 =?iso-8859-1?Q?sgH0EyY3AoJKFZo0LlQrl7hAlhI0TdFV3GEda+H/ypbRd0ZYL+Ep1d7Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fe9440-760d-4b1e-06e7-08dde70a7c45
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 14:43:57.9802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rco6bvHJs0xsum2G0eehnvEKXpGC7BWGPU712PR8z7dd3zTpPO8xKjJJIAi2NxyTwzukeRI69n8P1ZbklxP8Ijudr0h5G134Meb9JilxFzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8549
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

On Fri, Aug 29, 2025 at 04:05:51PM +0200, Maarten Lankhorst wrote:
>
>
>Den 2025-08-29 kl. 15:35, skrev Lucas De Marchi:
>> On Fri, Aug 29, 2025 at 01:17:13PM +0200, Maarten Lankhorst wrote:
>>> Hey,
>>>
>>> Den 2025-08-29 kl. 00:04, skrev Lucas De Marchi:
>>>> Now that there's a generic poll_timeout_us(), use it to wait for
>>>> LMEM_INIT in GU_CNTL.
>>>>
>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_device.c | 50 +++++++++++++++++++-----------------------
>>>>  1 file changed, 23 insertions(+), 27 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>> index 9e4773a17ef8d..ffcd3d04ebbf7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -8,6 +8,7 @@
>>>>  #include <linux/aperture.h>
>>>>  #include <linux/delay.h>
>>>>  #include <linux/fault-inject.h>
>>>> +#include <linux/iopoll.h>
>>>>  #include <linux/units.h>
>>>>
>>>>  #include <drm/drm_atomic_helper.h>
>>>> @@ -636,7 +637,9 @@ static bool verify_lmem_ready(struct xe_device *xe)
>>>>
>>>>  static int wait_for_lmem_ready(struct xe_device *xe)
>>>>  {
>>>> -    unsigned long timeout, start;
>>>> +    unsigned long prev_jiffies;
>>>> +    const unsigned long TIMEOUT_SEC = 60;
>>>> +    int ret;
>>>>
>>>>      if (!IS_DGFX(xe))
>>>>          return 0;
>>>> @@ -648,35 +651,28 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>>>>          return 0;
>>>>
>>>>      drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
>>>> +    prev_jiffies = jiffies;
>>>>
>>>> -    start = jiffies;
>>>> -    timeout = start + secs_to_jiffies(60); /* 60 sec! */
>>>> -
>>>> -    do {
>>>> -        if (signal_pending(current))
>>>> -            return -EINTR;
>>>> -
>>>> -        /*
>>>> -         * The boot firmware initializes local memory and
>>>> -         * assesses its health. If memory training fails,
>>>> -         * the punit will have been instructed to keep the GT powered
>>>> -         * down.we won't be able to communicate with it
>>>> -         *
>>>> -         * If the status check is done before punit updates the register,
>>>> -         * it can lead to the system being unusable.
>>>> -         * use a timeout and defer the probe to prevent this.
>>>> -         */
>>>> -        if (time_after(jiffies, timeout)) {
>>>> -            drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
>>>> -            return -EPROBE_DEFER;
>>>> -        }
>>>> -
>>>> -        msleep(20);
>>>> -
>>>> -    } while (!verify_lmem_ready(xe));
>>>> +    /*
>>>> +     * The boot firmware initializes local memory and
>>>> +     * assesses its health. If memory training fails,
>>>> +     * the punit will have been instructed to keep the GT powered
>>>> +     * down.we won't be able to communicate with it
>>>> +     *
>>>> +     * If the status check is done before punit updates the register,
>>>> +     * it can lead to the system being unusable.
>>>> +     * use a timeout and defer the probe to prevent this.
>>>> +     */
>>>> +    ret = poll_timeout_us(ret = verify_lmem_ready(xe), ret,
>>>> +                  20 * USEC_PER_MSEC,
>>>> +                  TIMEOUT_SEC * USEC_PER_SEC, true);
>>>> +    if (ret) {
>>> The 'ret' re-use is a bit confusing here, on a quick read it looks like the if (ret) would also be true when verify_lmem_ready is set.
>>>
>>> Furthermore we're losing the signal pending check, which is useful when aborting module load early, instead of waiting the whole minute. This is saves minutes when debugging memory initialisation timeouts.
>>>
>>> Perhaps
>>> ret = poll_timeout_us({ if (signal_pending(current)) return -EINTR; }, verify_lmem_ready(xe), constants) ?
>>
>> I thought about adding a check inside the function called rather then
>> use this syntax above, but ended up forgetting to add it in
>> verify_lmem_ready().
>>
>> As per return value, since poll_timeout_us() is a wrapper wait around
>> the check for readiness, I don't think it's bad to re-use the control
>> variable to break out of the loop.
>>
>> Looking at other poll_timeout_us() users I prefer to keep the first arg
>> as the op and the second as the condition, rather than inserting a
>> return in the first arg that will actually return from the caller
>> function, not from poll_timeout_us(). That I think is a much more
>> surprising effect than the ret re-use.I think specifically for 1/4, will make sense to just keep the original open coding, as this error cannot be handled like that.

not following... why couldn't we write it something like the below
(pending actually testing it)? No odd syntax or surprising control flow
and it also handles your feedback of re-using ret being bad:


diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9e4773a17ef8d..c22eae5f6117b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -8,6 +8,7 @@
  #include <linux/aperture.h>
  #include <linux/delay.h>
  #include <linux/fault-inject.h>
+#include <linux/iopoll.h>
  #include <linux/units.h>
  
  #include <drm/drm_atomic_helper.h>
@@ -627,16 +628,22 @@ static int xe_set_dma_info(struct xe_device *xe)
  	return err;
  }
  
-static bool verify_lmem_ready(struct xe_device *xe)
+static int lmem_initializing(struct xe_device *xe)
  {
-	u32 val = xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT;
+	if (xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT)
+		return 0;
+
+	if (signal_pending(current))
+		return -EINTR;
  
-	return !!val;
+	return 1;
  }
  
  static int wait_for_lmem_ready(struct xe_device *xe)
  {
-	unsigned long timeout, start;
+	const unsigned long TIMEOUT_SEC = 60;
+	unsigned long prev_jiffies;
+	int initializing;
  
  	if (!IS_DGFX(xe))
  		return 0;
@@ -644,39 +651,35 @@ static int wait_for_lmem_ready(struct xe_device *xe)
  	if (IS_SRIOV_VF(xe))
  		return 0;
  
-	if (verify_lmem_ready(xe))
+	if (!lmem_initializing(xe))
  		return 0;
  
  	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
+	prev_jiffies = jiffies;
  
-	start = jiffies;
-	timeout = start + secs_to_jiffies(60); /* 60 sec! */
-
-	do {
-		if (signal_pending(current))
-			return -EINTR;
-
-		/*
-		 * The boot firmware initializes local memory and
-		 * assesses its health. If memory training fails,
-		 * the punit will have been instructed to keep the GT powered
-		 * down.we won't be able to communicate with it
-		 *
-		 * If the status check is done before punit updates the register,
-		 * it can lead to the system being unusable.
-		 * use a timeout and defer the probe to prevent this.
-		 */
-		if (time_after(jiffies, timeout)) {
-			drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
-			return -EPROBE_DEFER;
-		}
-
-		msleep(20);
-
-	} while (!verify_lmem_ready(xe));
+	/*
+	 * The boot firmware initializes local memory and
+	 * assesses its health. If memory training fails,
+	 * the punit will have been instructed to keep the GT powered
+	 * down.we won't be able to communicate with it
+	 *
+	 * If the status check is done before punit updates the register,
+	 * it can lead to the system being unusable.
+	 * use a timeout and defer the probe to prevent this.
+	 */
+	poll_timeout_us(initializing = lmem_initializing(xe),
+			initializing <= 0,
+			20 * USEC_PER_MSEC, TIMEOUT_SEC * USEC_PER_SEC, true);
+	if (initializing < 0)
+		return initializing;
+
+	if (initializing) {
+		drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
+		return -EPROBE_DEFER;
+	}
  
  	drm_dbg(&xe->drm, "lmem ready after %ums",
-		jiffies_to_msecs(jiffies - start));
+		jiffies_to_msecs(jiffies - prev_jiffies));
  
  	return 0;
  }

>
>Kind regards,
>~Maarten Lankhorst
