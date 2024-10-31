Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CD5E68958
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 04:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F8710E04A;
	Thu, 31 Oct 2024 04:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bwh/2v7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638B410E04A
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 04:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730348633; x=1761884633;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r2Bz0fyaBw8EXqsMLzvHeOtR3zKHfhuOvaV5cQx1OgE=;
 b=Bwh/2v7ff3zF5TSoH61m/AoIAeaqkUyakglQcwRykwfoItmhuRuL9hqE
 Khkv9Hi9ZgCf1Y0EtpD33ybJNTULvAwSI0zjDBrEG9HB2cnrZKHnCJufP
 qI0FHkw/pS3LPHl9ukRVJ8YCV+HbKfMHWRHXZjRxxfxmPRopJEtVt5YG+
 yr77YoVJV2cxxLQSk8yeDhrVevecypYPLSgF7qW5lQ0LOvhoItTvrgVUa
 zrztCt1cphboq3JACV0GKc5h+kdyaS79WG6Ob0zDxjtx93gxOFpBpFc2b
 5lERNytPZVF87sDJdH799V0QzBjYvYRILETgBbKA4VuvnPnkG2BXN2n0j g==;
X-CSE-ConnectionGUID: jDb37xDSTK22F617Hhl7xw==
X-CSE-MsgGUID: 8WXeYZPoRP2lI4ZbHBXO6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41172066"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41172066"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 21:23:52 -0700
X-CSE-ConnectionGUID: pyzhGM4FTPafkucym2Fv6Q==
X-CSE-MsgGUID: Dhm5GCIVQN6vVhDIRIhubw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="87300063"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 21:23:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 21:23:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 21:23:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 21:23:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0yCEsj2NqGhii5ylc5MlA4PL2WTgStcEjMFD01J3LGFDDG/+3X+zkCpi5yyaEpRM6LnRqFfJv3lOqmvhog+Ayvl8zo78ia1hCde21O9rp3j79AsULyHJ9KXoCSO9QjP4aWKpbY4jZjp09lzWX9Lgjp4sewJU0TEeGLX0dVWKQGs67xhK77UZbA7qbhk4dnMK+yXaVGYBZrdQ0RBFBUD+lSAyM11ikit6zZdLVTJQMha6ywZ7Er8wxeDbchtHNARAdIQmP2grBX3EU9EchG952brQjh0Jg20QqATweetqBNFDDaISVCDkVMWVaymBSOBIP8zn91wbf1TMXx+ydiowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2Bz0fyaBw8EXqsMLzvHeOtR3zKHfhuOvaV5cQx1OgE=;
 b=XOxaKSUhrM9EXU8WsItIVPhfHfr5imJnFnUGp3SeCfE5XxST45ibADUthcls9+FRneavNLwPPhTQiaJISezw0i00b90HCF1VjK3I5gvqMC+vWcIcB6Wcyj8mq10FQtTkcJQQG375UFuApLC2cJfPOiTU9mKdcfXHqC+d1Zi5s8qfBGJV6hjkHFVwUONgJSd3Yy1ThyJHycLuwqw77w7b2mSzW5Wl9xdgKFkTAGztuXggFILuX9XXUKbdv21vIYGTnHcZ1hZRa1Ltk2Nr53mcPBDV2gxoVRLeYpMvSxasOrDq2OzMy0GrNXxr0sX1pe9z16ghTNGVdo6v8hjp/XPiUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6530.namprd11.prod.outlook.com (2603:10b6:208:38d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 04:23:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 04:23:47 +0000
Date: Wed, 30 Oct 2024 23:23:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <umesh.nerlige.ramappa@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Add XE_BO_FLAG_PINNED_WONTNEED
Message-ID: <7dcm67332fipskakin6uhqd3yjt6eykpnlz34c322omhdatk5n@2cflr6hqujod>
References: <20241029003224.2257439-1-matthew.brost@intel.com>
 <20241029003224.2257439-2-matthew.brost@intel.com>
 <ZyDjiuhhGqSPLEl_@intel.com>
 <ZyD3T8pU8Q8H4k8k@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZyD3T8pU8Q8H4k8k@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:303:b9::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6530:EE_
X-MS-Office365-Filtering-Correlation-Id: e85a4cf3-c659-48a2-2a66-08dcf963d039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BeJeYoTjrZNNpebymA9s0x4cP+UdD2pRjzevWz2fqMd5Gnb76237G+FyYBn+?=
 =?us-ascii?Q?mZHlVz7z+pQR6bk7bOrhS83iXAMNFqMgk9Z7ytYDl3nCOn4cF4FO89Umxl2a?=
 =?us-ascii?Q?l1dwT5KRn9B01rrSvj8XaR9eyQDnYtCX9Z/Fm+G1KpQWBuVLeidzcvReTNXR?=
 =?us-ascii?Q?re9lYo5cyb84hjvyAg56teRhqpS7rT4TW9qhbuh4PSNgwzOgttlV2h93R7aX?=
 =?us-ascii?Q?E19tGJQLNZFhzOot4CMWdMRoZT0baHWDrSyval2ssE7QyywjULUr8vgBkC3z?=
 =?us-ascii?Q?aQ1dsURfMbfivCe6I+CIHJdFzNsJzym87PBJ0dk81AumLGVBi6KIBbiIfihj?=
 =?us-ascii?Q?aOuajmmSve4iBMIbE++UkzQFliYHIyWbTYm4jWdIcCPI4RLcDuEcKqpV2U/w?=
 =?us-ascii?Q?Smp2eLM33wuvguc7OUaQwL/0Qn3p3VZ7zLBQrrRRVJXVSEYauatJXTwtAPNQ?=
 =?us-ascii?Q?uHCh/c6IfnzIhtt0ym5sFxgGAh3mgLaMzYFZ/oU2GNzeXLxXgw7keBD43fVz?=
 =?us-ascii?Q?aBewcxw75/I3Mv1ltbC0uN1kahmSfHWJXjHZ4OHdvUtSX9dKGmppO92XDg5H?=
 =?us-ascii?Q?yh63UTsXUdn/zvyjj7WU2JlzZhrWHQNOi0VH4kkENfJ1LBa6BGaw9Da5bKTG?=
 =?us-ascii?Q?JoPQD6jeMndZDim6/yr7hGDDBS/hLfWT7PnNI4NrKJ2+VyY1Nld1xZOvsNHd?=
 =?us-ascii?Q?bKZvlHWMAGNz6Qe6g4CDjEuXWY3Wr+aSMAVu9zvK3MpUEIfWONoIq9JAovDN?=
 =?us-ascii?Q?LxuCAUNTn15SxD4JnTtoH4uUCdtxdHFSA1pU2r+6WKAvBi7hvjarNo7nPma6?=
 =?us-ascii?Q?Efp8UFyTZ66y8P+48hs2JhxGpmIYXiTaWE5Rxg9GinbkQZNdEdc4deayOZRO?=
 =?us-ascii?Q?a24ZIZwwogyPRggYxCuiqVfH1vhUJNecQPzOnOvLbAOIHUZJC+sVrRfBhe3H?=
 =?us-ascii?Q?oGCu1SQXjQAIJZe7UN3PxGAmr2UycM9EqL1nJWztgLrj2rQ+zTvRygN66jNX?=
 =?us-ascii?Q?n8kcx/XV1HgqgPi0raMmKFsSjMoPDJlRihcw0Kw/IfmoQ9vRf+gi7DqIekh7?=
 =?us-ascii?Q?SxIi13np4W41JSB9Z1uYsVMeCW7GR/DoinrZ+j2HcxBwrpiJp+ccOt5GPUQ7?=
 =?us-ascii?Q?SI9FPpiplASmBl4ATBWf1CwRGKg0S/PzMJwMT8rlWHlA6HLJAeYjR6XdgAWm?=
 =?us-ascii?Q?i6nq1mNzt9Tbr9sfipiG9VFHtZNMeXD5QGvo3bLrFccsfP0Y+Y1Asndy1Ycc?=
 =?us-ascii?Q?sk5W/92zyH91S+N92MXraKLym/xKL1jWyoSeMSFkfbcPSrxQCbH8oBlRFTGj?=
 =?us-ascii?Q?wWny0CYJmhnezClH9QPjBxeM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wg8eOIDNNQnVpJ2gJJTwv8dFzn5zUaAinxcOKMdeoAGz4TDKBi/pmsJwNyEg?=
 =?us-ascii?Q?5PI8Uu2yNMwtfMPqH7h/MH6XjMjm21zBlg4l61Dwypk9BIHEwHDmvYhwjTu0?=
 =?us-ascii?Q?wRpFUjHhYYrA3FQh124ZnJsJ0y+FMS8cSh+jI4eRg3v8J+GyZ1OSjH1xYpfo?=
 =?us-ascii?Q?dUnIzjOuHJkATaM23QNffXypGn3WoV5WIMfpOC4SAjBobyG4u5iN7L2SfNx6?=
 =?us-ascii?Q?dB1OJd6P+Bx5+SbdU9IZMl4FA4OPmrYHzpcgmcKu+qYBh9hlfJ/3Mei2sJhu?=
 =?us-ascii?Q?QKpxngrmJhmmeDlCu4UXzilbO+6A0aFCQm0WrVZ/iJnNvqPuPpTAASg+jIUE?=
 =?us-ascii?Q?NxT4uern1Bki63QMXjsgOq8xRkC3iK8rQJe/T4160jOgicj5Zv3FijQN3l75?=
 =?us-ascii?Q?pov2z2AAPd+GhqgCpmzjtrNWcLAW9O42ghxCKE6gPQ41Scjqt5YWSp0lxnpN?=
 =?us-ascii?Q?JBZ+OPsxkSmQZeiqFSwnVJc9ML49Oh/bYDQXCkXdtQWCT8Z5eEQts/cZksz5?=
 =?us-ascii?Q?0KMrkGTEDGO4hSOhW4AgrjD5sJqu/bJvWWvNxko8cJ84jGmsEcEmw2sWissc?=
 =?us-ascii?Q?LbTv51rdqRrqD5xF5E1hpg1JJxOUJ/E6KFGIBwC3d3Tn/bUKsk2L3jAmZGD/?=
 =?us-ascii?Q?EmeLLk3kebbW+vs47zuPF1c+mEblCH/cEcqEmSFiil+ekF8HE99h99Zydu66?=
 =?us-ascii?Q?xR4CASo5jjeOFP5vxBuRRvrUwkn35MEdQEOqsBGmqtlinrLQ8A0rBCqFq+8E?=
 =?us-ascii?Q?2wryQBUSkiLlVty02Vh1fRbHvpBQkczlAc2xkZhWm04qYGsuvf/57Wl1wzic?=
 =?us-ascii?Q?5JopVXxTdLNbEdaG2Vjg2pNQzp3m95IccTYnYJ3m6ZJtG3p/cEVZ4FXF21n4?=
 =?us-ascii?Q?gdoST4XmI4KOYZiu1bvdEX2j0FAZQTqoD+xI7BHE80Lv9UUXiBCvDotTBPAT?=
 =?us-ascii?Q?4D8bfJkAshVq6OXtpmBh6CSyERioi6K4U87jGAFwMfXEFZzxCtFTP5CKOix3?=
 =?us-ascii?Q?a4E8pig8NYcNPsOe8EA3tOQJo7/tYr0QttmCEojXTwNxt4uEUf+YiaaEwe6u?=
 =?us-ascii?Q?dbLyDEclHuh7KZVxQ05yxZtNxMvo5THcvUlWSQhR4JMXS0qkNd98oJXcnpXu?=
 =?us-ascii?Q?QYr+BV/c1J6vRSXHMA+2/exdibDcp9ZycuiBE3At1v8InN5200LH1e0kzWuT?=
 =?us-ascii?Q?wZa5Z8xSkFXcL6KGKNnhvHpL5OgXEQEKbe+/UobPaShrhk3kzGGOm5dSUn9s?=
 =?us-ascii?Q?K49UjjkvYMJ0TfDVSUmLpLz5sVrDsliHIFam/s6OEZu6ZcWqyhiHAdbWRxEY?=
 =?us-ascii?Q?0uZ1ENbiAhFDQP6y40sugCM0lu7qkS9O7BXNrDDAtG+KyFSMzLSugcpUHBSs?=
 =?us-ascii?Q?1OfA2i7vLK2/jyyCZenkfLu7NpWEdpja6hrdI+wgQ+17mtDuy93VZ+e2s8ac?=
 =?us-ascii?Q?5gwYNlQ8opzjnSHR6JLfE23tE/26g1nvh8vmw3+C53/SPvoJxew/cEN73kLX?=
 =?us-ascii?Q?lTwaohU7NKG4YXSxXO/gsM5k3nCuW0bRWy1V8UrrEAVg1kmXNLy4qSHnbNn3?=
 =?us-ascii?Q?m/pbpQEnt+iYzSXA64dQBB9+lIsCxNsHfx3kV/YiUOAeQaBj9vXb1EW4mxVN?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e85a4cf3-c659-48a2-2a66-08dcf963d039
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 04:23:47.3149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5GhU/YZ7+Kyn9E37TydbSM3bU21xw8j65EGJ33h7WP3xS4qvPpQfanzLOA6iXQPrQzhQMtqsqgWLyOqUe5T1Y7J2I114eTZd96nP792plk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6530
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

On Tue, Oct 29, 2024 at 02:55:11PM +0000, Matthew Brost wrote:
>On Tue, Oct 29, 2024 at 09:30:50AM -0400, Rodrigo Vivi wrote:
>> On Mon, Oct 28, 2024 at 05:32:22PM -0700, Matthew Brost wrote:
>> > Not all BOs need to restored on resume / d3cold exit, add
>> > XE_BO_FLAG_PINNED_WONTNEED which skips restoring of BOs rather just
>> > allocates VRAM for the BO. This should slighly speedup resume / d3cold
>> > exit flows.
>> >
>> > Marking GuC ADS, GuC CT, GuC log, GuC PC, and SA as WONTNEED.
>>
>> What about s/WONTNEED/NORESTORE ?

since you are renaming, can you quantify "This should slighly speedup
resume"?

I think you can just trace xe_bo_evict_pinned and xe_bo_restore_pinned
and see how much it improves...

Lucas De Marchi
