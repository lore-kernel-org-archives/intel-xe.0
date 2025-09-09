Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB9BCA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6D810E275;
	Tue,  9 Sep 2025 17:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsoQGx8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9710A10E275
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757438218; x=1788974218;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=yUjMPp4mQLvXebBuNrrxOwhT0d9LgC28UdPk/e6uCME=;
 b=gsoQGx8QjjuoAtXiA3EENavZgdAZoyuYC/t7R+fd1qLSqehuP6FWP0tq
 07mDgvQr/u4XkFP0m4JIi4U7s930uC9L9hiVCIxAbIcdx7H0T7NYUBIec
 IUBERJ/0fOnVtD1c5QZmeSYppJEA0FWj7Tqkq/obEcX5ruEtvGhCxlump
 pZanPV+9B7MdUpGB+T0nWcl4dxoGWSOGD4tLgH2FUGT3bCNEYQffMTglr
 JlgOgw48YoDOYMCYCna3BXm2RKDKfCyQG4egLUczkiUIpe9y4/Lr0+A1+
 JNyFcBuCye1QzRr7J24rUvBj2ESvRej+aYQ7g8aUG0q2geblg8nZDC/Yp A==;
X-CSE-ConnectionGUID: 6DCqR9LKRNWV3bpbYs0R9Q==
X-CSE-MsgGUID: l97kkUSITjKc5No6q8HBjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63367186"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="63367186"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 10:16:57 -0700
X-CSE-ConnectionGUID: sFE5eYzGSoqj5LWZcN/eEg==
X-CSE-MsgGUID: vILm+CCIQSyQu+418atC5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="173537169"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 10:16:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 10:16:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 10:16:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 10:16:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaPF9ssu5GJqrj9QQ1Ro/ITEg2E6aRfhKtXGtalYvFJ6Mq8j+9Gu48aDxQSCyEyhuoIoT9ZhpSP8Gi2OAarZApyXSDEGwWQ/1numj99sldIo+WHFSZaOaqJ6QZrxyeuyjhaGguwq10Q7wfsiR6xO/IW/09tVLJHH6pKcUItRkiaN5CB1pJ7BTvT49ytTXVsWIE7tW0Vp/yE0kJWSNn5hbIoPlB56Jn0lFQvHetENI/cYka42+gwJTKX6k2WDvGFjus5NNE3aQwKZmo7HgX27ZaJiLvOoqsYhD/S3dTaMArZ85wwndMCGGVI2q3vjSV3nGw97m+PyxUrLCc78DySadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3KQ8KNvgcDKnI4bnZ2O4Jv2JLkVLXZfkG3Ie55n60o=;
 b=STtLpuTKbtW7Y+Hr8TVtxHRpSLUA273qjh2WbEdsydrANxRdVP1hjMT92m7oCtszCzzdsNLLs5TjmhjCrMaMhvBJRgfrO41U1c7pM0iSIQgXT0vcxCOi0zByunTQ/XKdXbE+7aAxCTBRQi4NHoKEyhSU0CB3sQB40BbP1IVGDf+BvXqtnN/dU/593kQoFsXrjqKRI6BiqncgSjnUv/PC+xcYX54j6TrC/DBC/dyrOAjERmoUNn9mFbFwgXmFubhzFbfxgHcuru/aOUd8gPgAn45pfBvnbOzfWsO7f0VxRFb9aVT3DWlb5wvFG2y40P/g75H1WSM3HZ32ywNNQso+tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7387.namprd11.prod.outlook.com (2603:10b6:208:421::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 17:16:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 17:16:52 +0000
Date: Tue, 9 Sep 2025 10:16:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?=
 =?utf-8?Q?re_for_series_starting_with_=5B1=2F2=5D_drm=2Fxe?= =?utf-8?Q?=3A?=
 Never report L3 bank mask for media GT going forward
Message-ID: <20250909171650.GD150955@mdroper-desk1.amr.corp.intel.com>
References: <20250905215614.796247-3-matthew.d.roper@intel.com>
 <175736813360.314639.14422402826183220540@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175736813360.314639.14422402826183220540@1538d3639d33>
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bda316-9d38-4e99-f46c-08ddefc4ab7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IGuNeYzIJ2Xh48KvrITfLxGoVfFsJyAcI/lU//jCyDeXzhsV2AZt33kxFjUn?=
 =?us-ascii?Q?CaK/eVq7oAGc5YPzyTlLi68iMxx4demCVGQna8Zpg+eSuOVtEIzayeNHkFKW?=
 =?us-ascii?Q?5U4CFVgDmPMS74+A3Xkvn4lJzgKh7xY5CuQGJqQFcckddHdyZqnkljwwZF0u?=
 =?us-ascii?Q?8g+4TDtRCbLr4lwlW3xusoejhSjtZBDX/UZFKWHUpsnciV0P+PIi36Fqs6f8?=
 =?us-ascii?Q?GcwcxgS4Dszy4fyHKPDQ4/bPYjoSHPlokqdRnU/LJlRY4SN8BjmScGV76tVX?=
 =?us-ascii?Q?qLwJ48cbECvIqd7q/IQpUDEy0QDzn5uIt/P53AB0QAiE6lj/2fQ92RVKCOW1?=
 =?us-ascii?Q?clngpMzsJw51Z4kuFjSb7CUO7tw4VmiKs+B5eZUB6bBWxv4sPViHALs1NLmW?=
 =?us-ascii?Q?8V7U+DddqdgTBxFep9/ug8XyUzIvla2+BsLH1RZIPuRqZb4Woak1cHyrcJ9+?=
 =?us-ascii?Q?Tf+kqzOUM1tzQfQZrFMzYpQCcMMnYpT6hRdmN5XBMXf7lQjEFeb+6XxGvguD?=
 =?us-ascii?Q?hfQdAZJEHzgxoYzIdzq51kvVKNWNakWQoW0GHC/7CC6Skb4ZzHS6VaW79NM4?=
 =?us-ascii?Q?ki4ExMps9bnTLE0Ts1taCBsbbOe00kiNlU8IWDE6QxwXI3zaDeBdseDRI/ea?=
 =?us-ascii?Q?FZExvLUdUhL2MXtn2ROKqmURUTdKhNnQAzb/2oGHD0gCNp70tSSSC0IXepDt?=
 =?us-ascii?Q?ipCjVkMfQtlC72q/mQqrv9usKpt6Hdo/vScweh6c87JVa2ALq84Q/kI0D5n7?=
 =?us-ascii?Q?ts7BzONH45BDGLp9iErkuwRp7BOAOEx+/g7M8KhrHe73mG8alyyn5syCvoWu?=
 =?us-ascii?Q?kFgZ3hP/eJeoOYuxS8kSiffLe0YrYavI1Zvw19kcI/xup5f5NmzQiHqZF9Cy?=
 =?us-ascii?Q?v+qI0y+2KYXpXCHbmwh9NNQ7PVqNqhN/nj7gGMgU5JOgbQfQEWmsHBbLvWEC?=
 =?us-ascii?Q?RQjTXavhrl2xiqoT/uWYM+M58Jno0VjDxCXJ6gT/adahcMN/KuVN4MPs6fEr?=
 =?us-ascii?Q?7HMuhdZk8vJRA+D2BSHbNl7WOf7CbxcjpPUHGWsSxeHJQSonKpf1hqpRXfhl?=
 =?us-ascii?Q?tIExeSd+CDcE1OgEwhmnXcpN+IPeswANxeA3mgAE3mQDMrXsaIE8RyypSzox?=
 =?us-ascii?Q?OXTGUFmDiII0OO+lPrrSjRMDM2YyWFoFyGvddMuj7VrYPDkIeWngCKShcBP8?=
 =?us-ascii?Q?29AkcvscgnGaK1a9I2TA34ryvGK2Sw5JBtOn/iM9QAoO5CFmlOO0wRpgCd4L?=
 =?us-ascii?Q?kReB11iDDayvinopmuXSrWd6635vUB9SpUz+gOgpGZStUiIxroRyXmFFehJG?=
 =?us-ascii?Q?czyHQ1zuU6q21m9A/hNNi62QySNjeHRgEt8T1vKBT4hoHdnn/IPO9/0vHEyp?=
 =?us-ascii?Q?4uNSPHc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JUPIRfQ39eFu59KhmRW1q89KlZE0DN2Id3muT34owOFu3K9f4CSmF2g6RKSk?=
 =?us-ascii?Q?a1m++kCOayEZIDHGQGYzOqRmGAGw32BGEkj41sjstMJgE4keR8hBXLu9XuRl?=
 =?us-ascii?Q?WfOvs+Eq7islR6s2beg1w+LCrJBUxD5tmlGdsH03pABcZvSILFN//KWGwSL3?=
 =?us-ascii?Q?8OZSOLp/xGKD/HGLFp0QjmPI50dnY8vduL3TlWbF7Umg4Z55FnaDO9yH4Ct9?=
 =?us-ascii?Q?96oZibhJN4fOIh0lNfljVen0Eww51GoPE+RO8ibMgC3tnKKIbmcMDjCQre54?=
 =?us-ascii?Q?v20sxQYDfNUGH1aPS3eWlI6oMKDHME/JduYxi5VzrFG3BphOfenlQDQdIJZj?=
 =?us-ascii?Q?ukSevR+txZx4E5t7oCaT2xnCAkixpWMYV4IAfzR/+mxIJCYLTGFP7Tt7KTSz?=
 =?us-ascii?Q?PfN7E/4xHM/skkrCWUxSomDeIy7vqwqPCM95w3ibKa0iha5xbMwZtgNlAr1K?=
 =?us-ascii?Q?FzIp8tRDk9SNkpga1PyozXWZmduXpAOfFfrh2ozgAQhPcl+Pf0k4Lp34r41X?=
 =?us-ascii?Q?6bNalXjQdNUz3eJstdo0Vw56Q0uurMtK+PoycszA918HqH8Q4Y1FhAZ0iDL8?=
 =?us-ascii?Q?xrIhYEPPyDp/ifp5td75bl5tmPiY6t6NwRRz/YcbxJ5IcXbAwKAkTGFG3gQq?=
 =?us-ascii?Q?SS/n/d2HUwq1htBGxl7XXa0cJBGmka4f8Yy94QKT/ShFwLRP6jqPEjLdm/hM?=
 =?us-ascii?Q?6Tawqaf4POaHr1WieK0djiwdlvoz5nPel79SUmqN8kD+ys4W41CdS/1Kqpez?=
 =?us-ascii?Q?Tha2uT4+JXnHHdYO/flgn6XRE1Nb508wkXFvp1k71VV6/Bn8AvLeheiSPpdm?=
 =?us-ascii?Q?g07PY30HQtgXMrEWdoIZshbYfFnXmswi6qBPxQggxKfLrBcV8g51BEMKVp4l?=
 =?us-ascii?Q?YZF8EdevcHrRWL17I/fr+RTVQe3s6wj8sgHjT2Db0p2SGBNtVKKOQB3dcx+G?=
 =?us-ascii?Q?ffUGE3I+xil1XWzaXDE0nrI9zARSDtaqYY53AaicyjF42iImAe0nCHR/eW7+?=
 =?us-ascii?Q?wfnX9QHWn1OTQAwqFLxJGQFjTEWOhT/+bYVUjOX0eavUnz6CBZMjtAXXTPyN?=
 =?us-ascii?Q?y1zQbMnSq2GQHl0my8Bhi/Inp1nsQmMrPC8aeJBu+yQoW+wKdkEF0q88yGJF?=
 =?us-ascii?Q?UosmR3r/iCigKIgqFy7NgDe25/u1K5fSDyAXNjVruzXvxFDlm0MDaWTt4Obc?=
 =?us-ascii?Q?kmSK8u+SyFZQY0QYvNDQRq3l9C48p9Oh4KUpqPcXtfZTcaqaI56k9u3eJOYJ?=
 =?us-ascii?Q?oaZxk6YEKsjdEPupL7VY05ud+lXx79Mkc3sQe3ChBMWbIaVCsB8xYQBzCF3R?=
 =?us-ascii?Q?Dw0fjdDmrLyDMapgpKKumwdGmgIHC85yylMMs1WuhyCQKoTgKA7/nENDAoZj?=
 =?us-ascii?Q?yDtWLStT85pVqX9gbhO4af9Nz4v8VUfY1Aii2jxoSFzqt3Klk293p7JNwfOO?=
 =?us-ascii?Q?+ioiCw7GSjZsmbHzf3NdqcRkYWS2H0SGUSl9FVa5rbbeSdM+yNUVTrbu9w6I?=
 =?us-ascii?Q?DQClIEQ6H3qVe72VvBmweaYzlNhB4MavCjueLsfh6cVJvsF1slQW+NfEWQWM?=
 =?us-ascii?Q?sHShydFF/4rjQ4ChQ/ynuSAcUzgjBvZLgrgYtRkWsJAHP6JRRuvhZm6xcliF?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bda316-9d38-4e99-f46c-08ddefc4ab7b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 17:16:52.8508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1de5TI3B+a1GtlMrgLx0EbPPM3WmM2mVLRamvzQvYnrozcFpLqT0/qlL63O63gsU9DsegkNYmC95l0WLmLr1dj4cRBBc5+TzqQWKB9vABw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7387
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

On Mon, Sep 08, 2025 at 09:48:53PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] drm/xe: Never report L3 bank mask for media GT going forward
> URL   : https://patchwork.freedesktop.org/series/154117/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b_FULL -> xe-pw-154117v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-154117v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-154117v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-154117v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_threads@threads-cm-fd-rebind:
>     - shard-bmg:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@xe_exec_threads@threads-cm-fd-rebind.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5625

Patch #1 applied to drm-xe-next.  I'll wait and clarify further with the
hardware people on the conflicting documentation about the L3 bank
registers before deciding whether to merge or drop the second patch.


Matt

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b_FULL and xe-pw-154117v1_FULL:
> 
> ### New IGT tests (4) ###
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-d-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.24] s
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.37] s
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-d-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.85] s
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-d-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.57] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-154117v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#316]) +1 other test skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][4] ([Intel XE#1124])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][5] ([Intel XE#4543])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +3 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [PASS][7] -> [DMESG-FAIL][8] ([Intel XE#4543]) +1 other test dmesg-fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124]) +11 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#367])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#367]) +3 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +7 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#787]) +230 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#3442])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#787]) +8 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#2907]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
>     - shard-bmg:          [PASS][18] -> [FAIL][19] ([Intel XE#5376])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
>     - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#5941])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +44 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2724])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#4416]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#306])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2325])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2252]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#373])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#373]) +9 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#307])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2341])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#1178]) +5 other tests fail
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#308]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#308])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2320])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2321])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2291]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#309])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#323])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#4494] / [i915#3804])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#4294])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4331])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2244])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#4422])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#702])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2316]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-5/igt@kms_flip@2x-plain-flip.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@blocking-wf_vblank@a-dp2:
>     - shard-bmg:          [PASS][50] -> [FAIL][51] ([Intel XE#3098]) +1 other test fail
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-2/igt@kms_flip@blocking-wf_vblank@a-dp2.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_flip@blocking-wf_vblank@a-dp2.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [PASS][52] -> [INCOMPLETE][53] ([Intel XE#2049] / [Intel XE#2597])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [PASS][54] -> [DMESG-WARN][55] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][56] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-dp2:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][57] ([Intel XE#2049] / [Intel XE#2597])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp2.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#5416])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:
>     - shard-bmg:          NOTRUN -> [FAIL][59] ([Intel XE#5408])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html
> 
>   * igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
>     - shard-adlp:         [PASS][60] -> [DMESG-WARN][61] ([Intel XE#4543]) +2 other tests dmesg-warn
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-adlp-9/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2293]) +2 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#455]) +18 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#651]) +33 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#5390]) +3 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#651]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2311]) +10 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#656]) +6 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2313]) +10 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#653]) +34 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2352])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#653]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#1503])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-4/igt@kms_hdr@static-swap.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-6/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#346])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_joiner@invalid-modeset-big-joiner.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#346])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4329])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][79] ([Intel XE#616]) +2 other tests fail
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#5021])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1122])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1129])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         [PASS][83] -> [FAIL][84] ([Intel XE#718])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#2007])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_pm_dc@deep-pkgc.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#908])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#1489]) +8 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1406] / [Intel XE#1489])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1122] / [Intel XE#1406] / [Intel XE#5580])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_psr2_su@page_flip-p010.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1122] / [Intel XE#1406])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@psr-sprite-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@kms_psr@psr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +1 other test skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr2-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +9 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@kms_psr@psr2-basic.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1406] / [Intel XE#2234])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#3414])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#3414] / [Intel XE#3904])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#455]) +1 other test skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1123]) +1 other test skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2504])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_eu_stall@non-blocking-re-enable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#5626]) +2 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@xe_eu_stall@non-blocking-re-enable.html
> 
>   * igt@xe_eudebug@basic-close:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#4837]) +17 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@xe_eudebug@basic-close.html
> 
>   * igt@xe_eudebug@discovery-race-vmbind:
>     - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#4837]) +4 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@xe_eudebug@discovery-race-vmbind.html
> 
>   * igt@xe_eudebug_online@pagefault-read:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@xe_eudebug_online@pagefault-read.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2322]) +2 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>     - shard-dg2-set2:     [PASS][106] -> [SKIP][107] ([Intel XE#1392]) +4 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1392] / [Intel XE#5575]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-invalid-fault:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#288]) +23 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#288] / [Intel XE#5561]) +4 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2360])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][112] ([Intel XE#3876])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#4943]) +6 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#4915]) +272 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
> 
>   * igt@xe_exec_system_allocator@twice-large-new-race:
>     - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#4915]) +39 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@xe_exec_system_allocator@twice-large-new-race.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2229])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#378])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@xe_module_load@force-load.html
> 
>   * igt@xe_oa@closed-fd-and-unmapped-access:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#3573]) +6 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html
> 
>   * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][119] ([Intel XE#1173]) +1 other test fail
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#4650]) +2 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#4733]) +3 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
> 
>   * igt@xe_pxp@pxp-stale-queue-post-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#4733] / [Intel XE#5594])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@xe_pxp@pxp-stale-queue-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#944]) +3 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@xe_query@multigpu-query-topology.html
> 
>   * igt@xe_spin_batch@spin-mem-copy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#4821])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@xe_spin_batch@spin-mem-copy.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#4130])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][126] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][127] +5 other tests pass
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-adlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][128] ([Intel XE#4543]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][130] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][131] +1 other test pass
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][132] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][134] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [FAIL][136] ([Intel XE#4633]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>     - shard-bmg:          [SKIP][138] ([Intel XE#2316]) -> [PASS][139] +1 other test pass
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][140] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][141]
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][142] ([Intel XE#301]) -> [PASS][143]
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip@plain-flip-interruptible@c-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][144] ([Intel XE#4543]) -> [PASS][145]
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-adlp-9/igt@kms_flip@plain-flip-interruptible@c-hdmi-a1.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@kms_flip@plain-flip-interruptible@c-hdmi-a1.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-bmg:          [SKIP][146] ([Intel XE#1503]) -> [PASS][147]
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-bmg:          [SKIP][148] ([Intel XE#4596]) -> [PASS][149]
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-bmg:          [SKIP][150] ([Intel XE#1435]) -> [PASS][151]
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-dg2-set2:     [INCOMPLETE][152] ([Intel XE#4842]) -> [PASS][153] +1 other test pass
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-defer-bind:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#1392]) -> [PASS][155] +6 other tests pass
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-435/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
>     - shard-dg2-set2:     [DMESG-WARN][156] -> [PASS][157]
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
>     - shard-dg2-set2:     [DMESG-WARN][158] ([Intel XE#5893]) -> [PASS][159]
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
>     - shard-dg2-set2:     [ABORT][160] ([Intel XE#4847] / [Intel XE#5732]) -> [PASS][161]
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [ABORT][162] ([Intel XE#4847]) -> [PASS][163]
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          [FAIL][164] ([Intel XE#1188]) -> [SKIP][165] ([Intel XE#2341])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-4/igt@kms_content_protection@uevent.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-6/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][166] ([Intel XE#2312]) -> [SKIP][167] ([Intel XE#2311]) +6 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][168] ([Intel XE#5390]) -> [SKIP][169] ([Intel XE#2312]) +5 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][170] ([Intel XE#2312]) -> [SKIP][171] ([Intel XE#5390]) +3 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][172] ([Intel XE#2311]) -> [SKIP][173] ([Intel XE#2312]) +7 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>     - shard-bmg:          [SKIP][174] ([Intel XE#2312]) -> [SKIP][175] ([Intel XE#2313]) +8 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][176] ([Intel XE#2313]) -> [SKIP][177] ([Intel XE#2312]) +9 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#362]) -> [SKIP][179] ([Intel XE#1500])
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-bmg:          [ABORT][180] ([Intel XE#5466] / [Intel XE#5530]) -> [ABORT][181] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
>   [Intel XE#4847]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4847
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
>   [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
>   [Intel XE#5416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
>   [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5732]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5732
>   [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
>   [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
>   [Intel XE#5941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5941
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b -> xe-pw-154117v1
> 
>   IGT_8524: 8524
>   xe-3700-78cc74214b6f200319b53d36c4c0ce6974af8d5b: 78cc74214b6f200319b53d36c4c0ce6974af8d5b
>   xe-pw-154117v1: 154117v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154117v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
