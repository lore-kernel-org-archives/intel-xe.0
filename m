Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBB1EEA860
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 17:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9330B10E23E;
	Fri, 13 Feb 2026 17:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSvoMKva";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C35E10E23E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 17:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771003642; x=1802539642;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pXUiHkGOyyzUuScd0JgTywF5+h2fd1BJB0mHGvJ7tR4=;
 b=LSvoMKvaYXc+GWYGaxwDnp5O08MnpBnd3XuKA+4ymAg1ZN+ipm3BRVNL
 i6w/zVDBLGquwpS6OydfL3jjht0vufclfJp6b3VebIxlx5JxxaXLSnLUR
 TyiSxQPGwqewDIocmY1KQBncnpRPsNb8x7HyYRFiRQ8wFE1SQYhkYD7Y4
 1uXB/02t1P3o+sOOmnw9Ws7CSEuabhGHS/MBkYUCxpcHfwW8FEmr/qg0G
 dwBtHv4UVjnUi1gM5iQoyIQez38TVaVplYgkTfNi6+WZy1Pvl6HYExms0
 AIYp7GnDtvjU7+RN5eAXQ/xUPLFpMOkYHNGmUoR/4IT5FIF5QYEKN8RVZ w==;
X-CSE-ConnectionGUID: rKfw9nLoR+a3D/RTQ7qxVA==
X-CSE-MsgGUID: cnNfPC5wRpafh5FLuWuyiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72287431"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72287431"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 09:27:22 -0800
X-CSE-ConnectionGUID: QS3gwUy2Ri2KkP6zLR57Qw==
X-CSE-MsgGUID: QJlPImarSBijME/8GNbq7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211878114"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 09:27:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 09:27:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 09:27:21 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 09:27:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0/bv1rq03R356woSyf2e8NAMiZRkDOJPxw4gf6fVTZpnvCnJmDC/BCawKBEm134zvv4o2YSSxPqN9XXMhiD3zxm/s4vasKLDTOCS4agW3Gtyd7AB59yHBG5Fim+czaEEfNVqo1gL7eAnhU/mXIKdJwRKUCj7vqw93LIp15TGlxQOl9PwGVBHSgbYpI1l6p4cQTPLIBDpt/VVCfPOFYGbpIamxUeOWLgT8pvlt8iHYNezw1e0Q/q97L/AbDUacGvl40LM24OwOFBPapdE7hUzrzET2JBRTewvyWWop48Okp/EIfO+x9cK7uul/+dnce0a+BMXhgmVPVz91Tc9Aankw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VSdeGqqbrXBI8VEMWruxVJSnkGUQizYwWKj9P5t7JA=;
 b=vYsB+e4B9HefVR9u11dwunuz3xyCDWodR9n0+KHXRw44fpE+O7Tt0U4M2YeEpKNZtwCSh85OTUvIXA4iprAhOeMtnpcBRFrPe/eX0+m/QqHHCk34ATUUH9MABfDw9rgiWQxVE8AaQiTKTZlXR3vX250uqWRExqC1D80Zi5TQIHJYBlthLFvTdMTqvhUlU5jWj/EPmTdJOy5oyKR+lHL1rZuLrGDWgUOgYBw4Y35JBtOXhvTapw+bPy5sdyxtISPC1W0GUV+NrtLjjnyQq89lBMhc4jUfdu17XfO7PZtHcO4IZpZw5rmwGA8HeZYMiwGvdF5uqHekDh6KPG16mGLJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4703.namprd11.prod.outlook.com (2603:10b6:806:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 17:27:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 17:27:19 +0000
Date: Fri, 13 Feb 2026 09:27:16 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Arvind Yadav <arvind.yadav@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= success for
 drm/xe/xe2: Apply Wa_14024997852 (rev2)
Message-ID: <20260213172716.GP4694@mdroper-desk1.amr.corp.intel.com>
References: <20260212065920.1815979-1-arvind.yadav@intel.com>
 <177097992346.252230.10990799641421406248@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177097992346.252230.10990799641421406248@a3b018990fe9>
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4703:EE_
X-MS-Office365-Filtering-Correlation-Id: e5193eb0-503a-4fd4-6bde-08de6b252391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5tqsZjJXjniSFzTB5Q02kJX2PlRnXtmMaQ6elVm1/lc/4jw89D3HK/EU+BvC?=
 =?us-ascii?Q?GpME4JpdB2jmm8SXavYLuOD3uSoOas9xhciFgwAnlKTs0YqYUBVwmqOVf7PW?=
 =?us-ascii?Q?TTOeHV0i1VJOFiGnN6ke2M+fArZgFvmvZmgsC7NX0Cr2g67OdPOnPdYcfskZ?=
 =?us-ascii?Q?QR5mIVRDObCO1vfOCr6YDpXOXyZI3iZVjiwZzqanyrMlnjqexNFc88qjkyaZ?=
 =?us-ascii?Q?IS5tl0HvDB+rsklkFQBg96dhZimCKQnPC5Y2OpwySvYagMyLU+QXSrEt5tc5?=
 =?us-ascii?Q?AolOXpOeo4SlGK8S2yIG8jrI2wDjo9REz9G/SMg6D3kWSnZxqFm9MgMzNIlt?=
 =?us-ascii?Q?eBWDNLjehV5tUUPwrJ6gB4nFQTN5CK7cFRvaJQW7WqIGBJixg7+u1cDUNV43?=
 =?us-ascii?Q?XYZujog/I6E2ib4efNgO7l1C72TE/cF4p5cxbAancw7/SJOXBNTzWHYZt+HC?=
 =?us-ascii?Q?Xb2H2MXlz5ljnB1KrZA1Ilbhuqxjh6JgxPIKjU0qju84Srlaz8JISe+7lcHU?=
 =?us-ascii?Q?KwodYHbB2qad5b8oyrmMiC9Vaf3tKVfRpMkx8zkBlDR9jklX7DULOcc0/Bq/?=
 =?us-ascii?Q?jddQo8Kx1WxSBA2qyy8SE7wK4tdSMs+XpQ8qC2eiiz82/YD1cT8ewOBmvF/u?=
 =?us-ascii?Q?fi+z+pOCOLwA99bT3G0xQPdka2VEgJ/ICuGDjkB6hkNTFKMeTPt9YlP1HOsq?=
 =?us-ascii?Q?CCIA00d1cJlKbdyFaORGCAl8YYV5PU5ZuF4QvxRTeUm+ERQ78HwTKaW/Avpu?=
 =?us-ascii?Q?ePvLM3HF++vnExa2/nWHeZ6ufAamIMUX1ap0Swc8GrQI2Asa8LSPbKG7FAAY?=
 =?us-ascii?Q?rNBWb5WR5RGMhxa2N35fYTSkV0P4M6dDbogptc35tcYqdTSk8OqdLKZWfi6P?=
 =?us-ascii?Q?eSZAzQYAlqDzR21o/XQP5iJLhLlQ/jdndgsa1zFwpCaetdA0kp8dNNIc4c9E?=
 =?us-ascii?Q?raX3pS4YBHsiMd46GG6ynw21V84aeLKPqK0T/qPLRh4rSKOMCHW7cFgsx6oi?=
 =?us-ascii?Q?MOlXLQqvLAyxLxZK3j15J5UI4+ou/mFaf3AUMPtmPiH9afMLEL4cmatyebMI?=
 =?us-ascii?Q?snDxFXjVaGczziHVwtUxAm3hNUyRDC/G3TG5Jzu5TkS1FvCQjQyiV3rD9vgp?=
 =?us-ascii?Q?XyLdrZWqHyz14Nx+AP04XVPhLb0Jv2eWhI5PtVFAy2HrNeGvgaC/GAi6e+cF?=
 =?us-ascii?Q?UDRwLEvW9dNKDs6vvyHD3zX0UVeZ99NPKVJfDKzVACR50a/Wvkruergkl7AR?=
 =?us-ascii?Q?vgcPGQk+IWMDrv16YMnZtQKGN4DVM2vFmqvG7zDqJUZ9e8BQfxR8SQdEhOZE?=
 =?us-ascii?Q?mOYjrAWn1KWynwPrXw+yT3CQmF5/5CmQ58vT8ezFYHnVaS5bF+js/X0qswBc?=
 =?us-ascii?Q?efixdBJ9ydorwAV9EDvHLIbUrl4KlzEILJXHyCqGp8FtisueGvlec1FJFtvN?=
 =?us-ascii?Q?BUhPVTpCUsq0NQkpPj+RuYFqtuvTbKhUs3tpprvmUFCDefa6s1Xjo5b0ichv?=
 =?us-ascii?Q?HyrYQavMgexVJeMESwY3JjEr+SItC2BNWGKk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bx+ciduxakR2M79EniqJkufZY7lCUQhPSRD5PdaMCJ3MjXKmTvPGdFXeYjd+?=
 =?us-ascii?Q?+7N3IFtHjvFmYrGQySIcb/Yr+ToDT78+Lq1vfjEHy3+PYmnaef2x5Z/DbbXO?=
 =?us-ascii?Q?y6G7EZAffHadabkO19EmFmLioZ4I4hI8gUPXmNnWtQ4aIv4W1cwT0nugWeS8?=
 =?us-ascii?Q?QojVO+nE4CIDGQym6jd6X6nevOJA5KB/paoHPS/TQgBydjnxYnDph+/4UK4h?=
 =?us-ascii?Q?rrQO809OmVVnSLoBAX8KZGxe+VeINRnCDiat9bZMlqBKRST6/YjEwAWkJHTA?=
 =?us-ascii?Q?m2pxYbWEcf+us3525qkI5WojRy3fQhK8BvYmazD/MDRyR0ess7BJ/InRSK4E?=
 =?us-ascii?Q?31w6P9v+aYXPiYZUnx9vbhw+R2/kVoyWE4z9vsTlnam2WgsHQ1Kgk8bX8ioW?=
 =?us-ascii?Q?xsMb3vF9KqviDbTgZFMJFuwIbB7VqW56o1kj+zeeiI233jqlhpussu7ewu23?=
 =?us-ascii?Q?55GviCqH8X0zSonXyiLwlYlztYNntZE/LhoYl+J829qBhzsEDMCHdTsPp4vP?=
 =?us-ascii?Q?xCy8sLE5vhkODuEg58ltPEHUMCaSIXPQ8HD0bO8aIwP6ycLmYXRYmD/LM/rv?=
 =?us-ascii?Q?+CZRncbjVRCq5J3gFPIQXcxXNLEK++LLGCwp2UeE8J1GOjtptpUkYZaXSmxM?=
 =?us-ascii?Q?7KWy1XwQLTppgKUmIKMpezptUIzYsYikpTz9Z38E3ksOI8deT5eTkpyUBxVR?=
 =?us-ascii?Q?OASuGaJDoO60b6wpxqvVKIiEGmc9ds6UxEyeniWIhukn10s6IHmbIykTuWW4?=
 =?us-ascii?Q?eKxsdCgJZJiusw4rbJI31XBad8E9SxFwvI695Kdhp1B01Brb5Z59TGlbBucc?=
 =?us-ascii?Q?e1UUuO1u2dm/cZgaLEsucLCxzmZ9IN4b6ymGeYXBRMc9CyyzgePXcBLVQWUh?=
 =?us-ascii?Q?0zDoORYX3dUHm92eGl/BARAbSavuAsiBaAOwx/b69fLPlMR73rEZHK7LvOS6?=
 =?us-ascii?Q?X1YlShQxLjnePWLB9/YBewoAI7kUBCt3MqSsVRRaQjXq/J5NPh7rMDGTM081?=
 =?us-ascii?Q?yW+dMGbn8E3X8sZ5ywEuYgjWxocqLilEbct/MXzygbEYoKRayyYyLNaXQqrm?=
 =?us-ascii?Q?jWHi3mIJd5f4/KBJmMHqViDyIpUHey7TZKrXA+xhhy1ZA+ZzxdJfpMR+Hye5?=
 =?us-ascii?Q?fQd+IPrM2TXhp5VkGaDcffn/HSil5rNoG2wMolQPxZMJd86FdcRWQuHQuMTZ?=
 =?us-ascii?Q?EoAFOPdv7mVSUVtdmS/MZ+AgQI8ty3tDOv0ag5qidwseafpx03rwGmfZaRMr?=
 =?us-ascii?Q?+F8Pg8uAURH6ci3Y0/YV2sayRgZov9e68wBstLyS3AFMPpGw46SxgqwwF2uj?=
 =?us-ascii?Q?VOT4MNFUgL2pkpaWpqXr8KZT5lhoUiZXmcCHf1e81k03V8AzE4YdhmWBnk67?=
 =?us-ascii?Q?wY0jv1EbFRz6jAms/lDvJ/dQ67AQaFt8wI6E2g/FnOInpbH28+1VcstlxH5/?=
 =?us-ascii?Q?CGW8j2acWti2YkLG4oL+xfto/wMdCNtbpoeXJx+9zF327aJdSMc9yHBr5WWF?=
 =?us-ascii?Q?0qyBiUYdYlQ9XVamUvRl1eBF/mW1VcbKViepfd5+vZ3/rpDdyC+fWX3jTfIj?=
 =?us-ascii?Q?S151I0X0z/HY7FuM7t2qKTbYF5Hwjj35MZ49JEdlBseUzDtYHmmtVojNCsuT?=
 =?us-ascii?Q?SJxoAuE/PnPg7oqAbB/tWa+W1F0BK4tfsZaXBJ49ONG3B0nDvHJXEF1N02q8?=
 =?us-ascii?Q?EwJWKWMrVil8ww6zefLoi1qV/9r2mbusImGS7Hlbv2WdIr3lhIq2wBmW3LrF?=
 =?us-ascii?Q?0rhio1N7fXMOcjQJNg4PHFk0v60HxP0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5193eb0-503a-4fd4-6bde-08de6b252391
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 17:27:19.0236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZMl1NrrddDfECGWf5cuW0slF8fW/ZwMxbUkch5Sr/XpcElFGXTkd8F7blTSe1i+gIrwMg8GQbdfB/CMU9KGuBiwQp6EzDjWEqZQ76qytjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4703
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

On Fri, Feb 13, 2026 at 10:52:03AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2: Apply Wa_14024997852 (rev2)
> URL   : https://patchwork.freedesktop.org/series/161400/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68_FULL -> xe-pw-161400v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Applied to drm-xe-next.  Thanks for the patch.


Matt

>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161400v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#7059])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +4 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#3432]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-dp-1:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-dp-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +6 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2325]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#6969]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#6969] / [Intel XE#7006])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-1:
>     - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#3304]) +1 other test fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html
> 
>   * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#1178] / [Intel XE#3304])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-10/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2321])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2244])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1138])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2374])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
>     - shard-bmg:          [PASS][19] -> [INCOMPLETE][20] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7178]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#4141]) +3 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2311]) +11 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2313]) +11 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#1503])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#4090])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7130]) +8 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7111] / [Intel XE#7130]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7111] / [Intel XE#7130] / [Intel XE#7131])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7131])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7111] / [Intel XE#7131])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#5020])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6886]) +4 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#870])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1406] / [Intel XE#2387])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_psr@fbc-pr-basic.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2330]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#3414] / [Intel XE#3904])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_sharpness_filter@filter-scaler-downscale:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6503])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_sharpness_filter@filter-scaler-downscale.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2168])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#2142]) +1 other test fail
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_eudebug@discovery-empty:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4837]) +5 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@xe_eudebug@discovery-empty.html
> 
>   * igt@xe_eudebug_online@pagefault-read:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#4837] / [Intel XE#6665])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@xe_eudebug_online@pagefault-read.html
> 
>   * igt@xe_evict@evict-small-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7140])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@xe_evict@evict-small-multi-queue.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2322]) +2 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7136]) +6 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#6874]) +12 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>     - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#5625])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7138]) +4 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
> 
>   * igt@xe_multigpu_svm@mgpu-latency-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#6964]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@xe_multigpu_svm@mgpu-latency-prefetch.html
> 
>   * igt@xe_pat@pat-index-xelp:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2245])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@xe_pat@pat-index-xelp.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#4733]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#944])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>     - shard-bmg:          [DMESG-WARN][58] ([Intel XE#5354]) -> [PASS][59]
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [FAIL][60] ([Intel XE#4633]) -> [PASS][61]
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [FAIL][62] ([Intel XE#5299]) -> [PASS][63] +1 other test pass
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][64] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][65] +1 other test pass
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_pm_rpm@universal-planes-dpms:
>     - shard-bmg:          [INCOMPLETE][66] ([Intel XE#6891]) -> [PASS][67]
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@kms_pm_rpm@universal-planes-dpms.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html
> 
>   * igt@kms_pm_rpm@universal-planes-dpms@plane-134:
>     - shard-bmg:          [INCOMPLETE][68] -> [PASS][69]
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@kms_pm_rpm@universal-planes-dpms@plane-134.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms@plane-134.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][70] ([Intel XE#6321]) -> [PASS][71]
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_pm@s3-basic:
>     - shard-bmg:          [DMESG-WARN][72] ([Intel XE#3428]) -> [PASS][73]
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@xe_pm@s3-basic.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-9/igt@xe_pm@s3-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][74] ([Intel XE#3544]) -> [SKIP][75] ([Intel XE#3374] / [Intel XE#3544])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:
>     - shard-lnl:          [SKIP][76] ([Intel XE#7131]) -> [SKIP][77] ([Intel XE#7131] / [Intel XE#7250]) +13 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-lnl-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
>     - shard-lnl:          [SKIP][78] ([Intel XE#7130] / [Intel XE#7131]) -> [SKIP][79] ([Intel XE#7130] / [Intel XE#7131] / [Intel XE#7250]) +13 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5:
>     - shard-lnl:          [SKIP][80] ([Intel XE#7130]) -> [SKIP][81] ([Intel XE#7130] / [Intel XE#7250]) +25 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/shard-lnl-4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
>   [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6891]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6891
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
>   [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
>   [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68 -> xe-pw-161400v2
> 
>   IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68: b4bfe7d753afaf6ea4950111a309a4e2ef5aef68
>   xe-pw-161400v2: 161400v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161400v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
