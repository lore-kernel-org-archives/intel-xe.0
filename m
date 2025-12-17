Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3680ED66BA6
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 21:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E181110E35A;
	Wed, 17 Dec 2025 21:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WiKBjOqg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAA910E35A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 21:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766006225; x=1797542225;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Uf8xVJK00vjz/IIlX7rHVecbjbPlHnNZf0yynSfqNHM=;
 b=WiKBjOqgyqLhM0LKN0TPaCjHvbx6Cmb/WrbCQp8QSpALg4lk5XglO9In
 JjcwPHeazJOB5f1qn/RTkrOwkvest2DMu8N0jB+bjgn/3fJ+RYy1xoIx2
 szCHHW395TCDElRvolwXGgZQs3pBmjrLDhnIWrfTjSTqQbSd0cM6BGvcv
 4RlsBjLaELsEa8l3JS23pJ13OqZbMEboW8XKqtL3f4PnXcdwZK6K02mSG
 dQKqTOOknSOfpMV+cT0V5wKq7Fyhjr2RKbIjocWbl/Wz2fjpoIT1IKpYy
 PVB2CzzzOWBO5tcFZ7ISk/5B+Vh38wIYaGN1amAWuXW7jMc/Oun3XPFf2 g==;
X-CSE-ConnectionGUID: /kPmnAc0TzyM6AwKgBXoWA==
X-CSE-MsgGUID: EWfG/izWR2iavP5OeYAWdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67150281"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="67150281"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 13:17:03 -0800
X-CSE-ConnectionGUID: OOONx4xSTLuv5Eif3jB73g==
X-CSE-MsgGUID: EVtItY3uQXK8oQOkm0lb3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="197669408"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 13:17:02 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 13:17:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 13:17:02 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 13:17:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNMd/wXu2uJigEMUeDKZRjbOTybRg3drFaDdmk52GNWKb22zpiIFMN+BijirpmuV9uHQ0DVK1whXCsoB6czkClyIdXJGtwiNr0C0EbV3imIVAuZDqLnYj7vd7U7xCtkz49zatoxq/0Caz4q1KvC8StUhQyotqMlzO7YY7mgaZWnD0B7HzlJFLzjgFH6z0vOjrvaFQCvBjERyC9ipKEqXkOv8dTyMUsXex+Kit7Lzko0CHldO39fHTSVD3NhLO5AyGLTy9flGtmVH10gKfdWbPmMGPpe15pX7szK774Gb1sHyegI5CfmVq4oPOQcCEs4AfbmATIXQMS35zROD6V4vUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkyV6DsLzm5THRLR+bFn8cz9LnmZC7aEipYBKnaNLAU=;
 b=o2+dby4tR8FiOhKCeYQWrNt1NmBj1wKeUVlrNgYNOxtRUibzZkeCiD0y4IXPewTJKyuTFf446ebhJQ3ZBvYldRzpcM5i+N1yGyotmAiY0b16yfQj3qGxfE14nj5BmvpbwJkA0UoEqQkvzO7nuAJIXGorHjhxE/Czr77DMVGA6AAKWBli3Ps9oycCPLPHEdEpsamFTALPXiFbumCdENzah6A2gxNnvm6CbEwlU2dI0Ci/w18hm9FYGIAXrDiOb8LRdGwuTMZmPL62cQqWM9aM12AZGKUWCIMPMoDEe4RIIGsvjvCZh5bU2AKUYkZWjARMyecdHAHX9RAvaakZixs0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7382.namprd11.prod.outlook.com (2603:10b6:8:131::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 21:16:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 21:16:59 +0000
Date: Wed, 17 Dec 2025 13:16:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tapani =?iso-8859-1?Q?P=E4lli?= <tapani.palli@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
Message-ID: <aUMdyUhzER9tby2A@lstrano-desk.jf.intel.com>
References: <20251217061728.35768-1-tapani.palli@intel.com>
 <773d97c4-defc-422c-a3a9-c7769f367493@intel.com>
 <e14dc32f-3c4a-453e-b0fe-09da137e172c@intel.com>
 <dfaff8d8-9158-411c-8feb-b2dfddf85e29@intel.com>
 <7c5458b3-8f14-4495-9e0f-f2feb99f411e@intel.com>
 <f1ae6465-3276-48a5-8dc4-e3caf2b9e2b8@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1ae6465-3276-48a5-8dc4-e3caf2b9e2b8@intel.com>
X-ClientProxiedBy: BY5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b84ea6-f56e-4486-0df4-08de3db19dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WvWgVHdHCyurYmPj+KRSFzawX95WAY18LKvkvU2Lzl/XTqJl7IdiSwZraX?=
 =?iso-8859-1?Q?DmDWf5ZrKCysimKsiy4y1i3rptP2zEkjLVu97hCM4VJ99NPl7O/mM234nb?=
 =?iso-8859-1?Q?7GiHK6/AHFEtupEOHkOhhnNW0V+Ll3i/qcs6s98FkZqqc2REKBVZ55V1oA?=
 =?iso-8859-1?Q?keyoIDXlcAAI1uXpCigVK3yKu1QIK2HqSZRFeps+WVQ7l9b6VWGwQQ3uGR?=
 =?iso-8859-1?Q?1iggU1za32PNw0PKrz5QQqTcayjmdNqxOneC6RfoRWX+yeXdZ77WjU4v1Z?=
 =?iso-8859-1?Q?c3HpZWBShabusHei+5qUq4mjb0H7WbRBlYoiJZzlBxJCAbmqLGf5J4JYLc?=
 =?iso-8859-1?Q?fnzknmFelSKt2QlHKl+UB1d6fFTobMLwsAz+uNR48TgaejGXWt2FB1S4aD?=
 =?iso-8859-1?Q?12F6PP2/hzuE2AmVGqnet816uJMNfaBUWXysbzdxTwv71/X3VfuX+R8yX8?=
 =?iso-8859-1?Q?KSDv2jrNTdXjS4fMVnmJ8MSK8fswboD7sTVRcOz9BsrCkaJhugnjA0Qn4X?=
 =?iso-8859-1?Q?EF271xTJkOtZf+Ww5V0YJ4mkjnG8NJ6xE22dqIDZg3lHHZaJ3p2T8xRttJ?=
 =?iso-8859-1?Q?hZholV/DBczKQgrA4Dh0WmFZlC9DX6AZw3v1OpIYgd8J8Y/MssvuUIA3oA?=
 =?iso-8859-1?Q?tglHGDKuNGEGgr9VrR9cBafhTqRcgHvubZyrFTBzdd5Pf25LTTnaUGsDnE?=
 =?iso-8859-1?Q?bHnOMzBdq0YqgOoUC3c0X4RYX2JPJyIhr/mnJCPfvq8G6/Hpk03bFkjqPi?=
 =?iso-8859-1?Q?jVSCqOqJesON+vmBpM67lW8x9Sa7rxUXgqQxup4RQ08oE1TQNDxn1Bmzi2?=
 =?iso-8859-1?Q?SoucNxkMRKHi27uhi4qRCFqUP7/ww0RwWQxGRBk46jfRCjIERnZex/Z2My?=
 =?iso-8859-1?Q?wguXqyCZoFf71kljeofO0MaLcwZKi0mmMm5OYNTjWNALhWlPfZXq5wuRzg?=
 =?iso-8859-1?Q?OnjBhy9Y/jETF60fyuQKnvQXPY96Sb1RcPjLGf2JYGKfyG5yZuN/3EtAZ4?=
 =?iso-8859-1?Q?qjZZ3PXpWUC49JtTVHrdq4kLQcwn/w4FtsAPN3AhuAM2PNOM7TUur/cTMd?=
 =?iso-8859-1?Q?n/pxCjaDrxr68cUUVaYE1w7DE67vJzPxTZkhfzf0g4myE1/mYH4wjM/RHa?=
 =?iso-8859-1?Q?z772UsHNJrN1B0mdPPeXH2WLBQy0aFwOF2wNgiwDje16rCKyAUJ7gGS7rQ?=
 =?iso-8859-1?Q?pLXcI5iT83whHVYK6Lmndf7J3uwveTTRgpXlF+Fs5rQ4Fbcn38h55Ws875?=
 =?iso-8859-1?Q?fnsjFLJscQ/k+QGyCg6obDksGXgAVTO9WXHOscnw9vNB5At/z4MN1r5pDc?=
 =?iso-8859-1?Q?M+W7YdxrashXGexoNJSn8AvtsuCPxSi+m83As/t4IAmm5q/wkU6pJLSz/B?=
 =?iso-8859-1?Q?4oBvF3zN+ENta3J0ucME5ltX8QrpGNgnDhg2ZMSzo/AEcqqYzva6WCwLGx?=
 =?iso-8859-1?Q?Wy/gumZQz2S1+PbrA6Wyttd1lD5TbeANnHrovDUvgXRCEA84PsN1yqHYYu?=
 =?iso-8859-1?Q?p/UezcRHdv4pLfWbGu/iB6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?B4PUGbx/vclCYYOMep9H44FyU9psvo6XvbqUFM52H7oqERy8XXlCYDR9Sw?=
 =?iso-8859-1?Q?xszsaYkGc0r1BkQ7vTTsphVpKA2v+cI293WinrsJ5LjmCXsiLLQ7iQwzl/?=
 =?iso-8859-1?Q?2pyVa0EiPm8MCiYOusCiJeRFQCsLJppALmket3xM8BdrpkbgKI2fpYEpip?=
 =?iso-8859-1?Q?+UXTuAgKxtuj7Cu+iJDA4uqzIYkBtVskYP24x1pc51f+M3k3wuFhatWI3x?=
 =?iso-8859-1?Q?uam9z4I6WQPrXuLF40cg7i2fL5AvlgDh4pKy+CpBlhCfMJdOW9oeCZK2yu?=
 =?iso-8859-1?Q?1wkBZ2WaBHCEU7bgzXrfkcPVuOtQcz72XGHfbhyDrL15BKSJl3YnEGLm+G?=
 =?iso-8859-1?Q?9xeIdRgtZZDJlbFCWWvg0W2OYt1XIHv7jtQcS0uZJQqbC/MLvX9jrk7BpQ?=
 =?iso-8859-1?Q?7vk/VDcUDMRzuGEXDqrhVpJXsizngz1MvurNLXEbyKa1QAf4z76EMUy0QF?=
 =?iso-8859-1?Q?clT7AiyppgeCRIbIwG3j8rMJQl5T3TqnxTGhZKCddI34pyVsBC0mOkReyX?=
 =?iso-8859-1?Q?OeNYyQZFAbWbvqmR8hYV15udUEXuUi9bLocURcElUr4tA7GYPpd7zzPYBi?=
 =?iso-8859-1?Q?lj/Q40eYkFH9XWPx7rlkgpON9+Y0WWkTWc9pO83UrdiM9tdJxSSnLxvYpF?=
 =?iso-8859-1?Q?UVW56TXB/1FcyCY3IcRg8+qsTCjFwc4oA7wgi+x+yp3p7ZXSuLFEzjxJw6?=
 =?iso-8859-1?Q?qAPbNAtxTdGUGor2x5E9zyTCfQQ92mxkyClA80BrHHZcv82v6TQSBcBuE0?=
 =?iso-8859-1?Q?Rv14a4rKuFUPIAeCA8JxgS0DfjDXChrS8A9nvv2eKG5/fOEEoL3Uok/IXj?=
 =?iso-8859-1?Q?Wk2M1vv4xnhFXNdRV5MLgPJ+Z1bhPd9T2M7UvH1d3ug0L0HfvUOJpChORI?=
 =?iso-8859-1?Q?WR/UYND49pKauKfza829IxfhaSxVch+3BNf1C1IiczZ81DMUv3vgIgxSTf?=
 =?iso-8859-1?Q?mxd2bWjJBMFv4sp3xoU2GKBPX1pS66ikRgdm3AUHnC//Aiy/SgGruux0s2?=
 =?iso-8859-1?Q?weyPfKP6kUwUBvSDSSgccQAFPgV5ZOA90Eoo5cKiMIBJRZSj0raPm72Bit?=
 =?iso-8859-1?Q?Nd0TQkv9/w5CnNHxUy2SX46dC49K5SBM0spi4CoJB2BwMQ/RhetuPEnEB4?=
 =?iso-8859-1?Q?xI7om30otth53mWiysE6ijbgkwzrDO2XgdC+UIQCnbSTw25dw2XL+tVuX6?=
 =?iso-8859-1?Q?iQuw+XkN6ASQLzj4GXVsIny1Y4bXAeZJtMi4ggI7A+21eeQ85zI24S70Vy?=
 =?iso-8859-1?Q?dzd8izTOqTcvcUF2ugU45sCQPHQ3U9WHEyLpp0fOArPC7KVS86QFHEZua/?=
 =?iso-8859-1?Q?OKQv/CVigj9+iQCPmkBKbjND3Nzd0it9IJysqD+uxfgVJiKghMmbGqvE1X?=
 =?iso-8859-1?Q?jMNzCOcfclSFY6qvqhRm1VN6RAuGOAP1cWHM2un/LtIcc7IYqpaadHgyek?=
 =?iso-8859-1?Q?ydEBtQI7K2kuB54P+NFsAZNS3dBwTOPYyr7omC5l7WLzSxi96JxzwAQ9Bh?=
 =?iso-8859-1?Q?cK6H9qMD088PqLGKcnPT8izRonE0PGtGNb+gsEcWWKCYvAeN2LzqhW8+kt?=
 =?iso-8859-1?Q?Xf3IaizukdqNKZTTu0pEa1O6S9ZycBpfubZSRKxTN0aPU8bDqEbw9aEVkN?=
 =?iso-8859-1?Q?LLxs6zcnccOMNlX412qAvuG2Evp42QC2J/KngjLeawro5OJnjAjj5Ycw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b84ea6-f56e-4486-0df4-08de3db19dae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 21:16:59.8367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMDOhVsOxI3pwbHS/sCcJ86zkiKNa8z41Bhs6EnsMvlo6NKLfnrsMueHmz1bHZ7gc47omg+vQj5LsKtkeXjOEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7382
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

On Wed, Dec 17, 2025 at 02:22:13PM +0200, Tapani Pälli wrote:
> 
> On 12/17/25 13:51, Matthew Auld wrote:
> > On 17/12/2025 10:51, Tapani Pälli wrote:
> > > 
> > > On 12/17/25 12:31, Matthew Auld wrote:
> > > > On 17/12/2025 10:27, Matthew Auld wrote:
> > > > > On 17/12/2025 06:17, Tapani Pälli wrote:
> > > > > > Helper function xe_sync_needs_wait expects sync->fence when accessing
> > > > > > flags, patch makes sure we call only when sync->fence exists.
> > > > > > 
> > > > > > Fixes NULL pointer dereference seen with Vulkan workloads:
> > > > > > 
> > > > > > [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
> > > > > > 
> > > > > > Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when
> > > > > > swicthing to dma- fence mode")
> > > > > > Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
> > > > > > ---
> > > > > >   drivers/gpu/drm/xe/xe_exec.c | 3 ++-
> > > > > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > > > > > b/drivers/gpu/drm/xe/ xe_exec.c
> > > > > > index 730a5c9c2637..ea368f02cb9f 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > > > @@ -184,7 +184,8 @@ int xe_exec_ioctl(struct drm_device
> > > > > > *dev, void *data, struct drm_file *file)
> > > > > >           if (xe_sync_is_ufence(&syncs[num_syncs]))
> > > > > >               num_ufence++;
> > > > > > -        if (!num_in_sync && xe_sync_needs_wait(&syncs[num_syncs]))
> > > > > > +        if (!num_in_sync && syncs[num_syncs].fence &&
> > > > > > +            xe_sync_needs_wait(&syncs[num_syncs]))
> > > > > 
> > > > > In xe_sync_entry_parse() it looks like it will always
> > > > > populate the fence for the !signal case, otherwise throwing
> > > > > an error if that is not possible. And xe_sync_needs_wait()
> > > > > will only touch the fence if it's the signal case? So it
> > > > > seems like this should not be possible?
> > > > 
> > > > Sorry meant to type:
> > > > 
> > > > s/touch the fence if it's the signal/touch the fence if it's the
> > > > !signal/
> > > > 
> > > I'm not sure of the complete flow but it is quite easy to reproduce.
> > 
> > Oh, I think I see it now.
> > 
> > I assume the below also fixes it? There is also the case in
> > xe_sync_entry_wait() which has the same bug, I think, so would also need
> > to handle that.
> > 
> > @@ -178,6 +179,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct
> > xe_file *xef,
> > 
> > sync_in.timeline_value);
> >                         if (err)
> >                                 return err;
> > +
> > +                       if (!sync->fence)
> > +                               sync->fence = dma_fence_get_stub();
> > 
> I will try this one.
> 
> 
> > So it looks like dma_fence_chain_find_seqno() can return NULL if the

Yes, I reasoned this after a bit of digging too.

> > seqno has already signalled. Also means we are missing some IGT coverage
> > for this.

Indeed. I don't think any IGTs use syncobj timelines which is a pretty
big gap as this is basically all VK uses. IIRC this isn't first time
we'd made a change which broke syncobj timelines only for VK to
catch. I can open a Jira for a syncobj timelines IGT to be written.

Matt

> > 
> > Can you resend your patch but perhaps we move the check into
> > needs_wait() and then add a similar check in xe_sync_entry_wait() also?
> > Or perhaps might be cleaner to have xe_sync_entry_wait() first check
> > needs_wait(), which will now also check for a NULL fence?
> > 
> Yes, that sounds fine to me, I'll add null check to needs_wait().
> 
> 
> > > 
> > > Here is the stacktrace snippet:
> > > 
> > > [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
> > > [  118.410940] Code: 90 90 90 0f 1f 44 00 00 55 48 89 f1 48 89 e5 48
> > > 83 ec 08 48 83 7e 08 00 0f 84 79 be 1c 00 31 c0 f6 41 4c 01 75 11 48
> > > 8b 41 08 <48> 8b 40 30 48 d1 e8 83 e0 01 83 f0 01 c9 31 d2 31 c9 31
> > > f6 31 ff
> > > [  118.410949] RSP: 0018:ffffccec8ea7bb18 EFLAGS: 00010246
> > > [  118.410957] RAX: 0000000000000000 RBX: 00007ff23812f460 RCX:
> > > ffff8c1790db4800
> > > [  118.410964] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
> > > 0000000000000000
> > > [  118.410968] RBP: ffffccec8ea7bb20 R08: 0000000000000000 R09:
> > > 0000000000000000
> > > [  118.410973] R10: 0000000000000000 R11: 0000000000000000 R12:
> > > ffff8c1790db4800
> > > [  118.410978] R13: 0000000000000000 R14: ffff8c178b67e000 R15:
> > > 0000000000000000
> > > [  118.410984] FS:  0000000101aff6c0(0000) GS:ffff8c27350d1000(0000)
> > > knlGS:000000007fe20000
> > > [  118.410992] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [  118.410998] CR2: 0000000000000030 CR3: 00000001037ef005 CR4:
> > > 0000000000772ef0
> > > [  118.411004] PKRU: 55555554
> > > [  118.411008] Call Trace:
> > > [  118.411013]  <TASK>
> > > [  118.411022]  xe_exec_ioctl+0x375/0xea0 [xe]
> > > [  118.411377]  ? __x64_sys_ioctl+0xbd/0x100
> > > [  118.411392]  ? do_syscall_64+0xa7/0x580
> > > [  118.411403]  ? dma_fence_free+0x1a/0x30
> > > [  118.411419]  ? __pfx_xe_exec_fn+0x10/0x10 [xe]
> > > [  118.411752]  ? drm_syncobj_array_free+0x56/0x80 [drm]
> > > [  118.411915]  ? drm_syncobj_query_ioctl+0x20f/0x460 [drm]
> > > [  118.412035]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
> > > [  118.412372]  drm_ioctl_kernel+0xae/0x110 [drm]
> > > [  118.412524]  drm_ioctl+0x2ee/0x5d0 [drm]
> > > [  118.412649]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
> > > [  118.412989]  ? __pm_runtime_resume+0x5f/0x90
> > > [  118.413002]  xe_drm_ioctl+0x61/0xb0 [xe]
> > > [  118.413329]  __x64_sys_ioctl+0xa3/0x100
> > > [  118.413338]  x64_sys_call+0x1060/0x2360
> > > [  118.413347]  do_syscall_64+0x74/0x580
> > > [  118.413355]  ? x64_sys_call+0x1060/0x2360
> > > [  118.413360]  ? do_syscall_64+0xa7/0x580
> > > [  118.413368]  ? __do_sys_getpid+0x1d/0x30
> > > [  118.413377]  ? x64_sys_call+0xf9d/0x2360
> > > [  118.413383]  ? do_syscall_64+0xa7/0x580
> > > [  118.413389]  ? x64_sys_call+0x1060/0x2360
> > > [  118.413395]  ? do_syscall_64+0xa7/0x580
> > > [  118.413401]  ? sysvec_apic_timer_interrupt+0x54/0xd0
> > > [  118.413410]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > [  118.413418] RIP: 0033:0x7ff29c93287d
> > > 
> > > 
> > > 
> > > > > 
> > > > > >               num_in_sync++;
> > > > > >       }
> > > > > 
> > > > 
> > 
