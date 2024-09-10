Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105B6EDE99A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 16:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B072E10E87A;
	Tue, 10 Sep 2024 16:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaEov82m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716C510E87A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725984117; x=1757520117;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gpmuJsWM0QEfb1L5atqh72fbyyC0vw4hvIrlnZd/PMI=;
 b=ZaEov82m95VPsngJf7U4T1/hKqvPgqBt1lHT9Pgk0N/BH/SqjnHSbCjT
 /uY05hw7OF1KRxSToz3Yx9TIzsbpzIw7ZHpYhRKNqmPbltXCaPMnFRFD/
 Vr9uLgp2pAn8cJ4qoOFLy5cteO5XtUY2Gr17DEz1Ld5YWjVjhgSA9C4Wi
 Se1DovqsMgKrIfs4SEQQp+jqKtLML0y8m59kn+FNsPRX8xmR3hwnc0+i2
 esIRc11SaEWhKLsmnFMayi94DoQisrFG6j7RB5Z7uzNRt4WOirLzVSvOM
 MC3idcRLH94YduWh0ljMSd9LKSPa81aOpqOEnKzaUDkm0Hb0/EyrUG4A3 w==;
X-CSE-ConnectionGUID: MPfO0EgbQyu09j4No6TAhg==
X-CSE-MsgGUID: Y8LGuv1RQ2+ef6fvxkdIxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50155006"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="50155006"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 09:01:53 -0700
X-CSE-ConnectionGUID: 6R8a1Lt2QyG3X8/uk/eKIw==
X-CSE-MsgGUID: YBCcPallRVGAHbhA4Ze0jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="66903781"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 09:01:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 09:01:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 09:01:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 09:01:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 09:01:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfCLeWgZSEnRnJNHg8IuWMD8OR8SPLmJUpXcXQWgJ9VdAvPyZ2QeoBsjPN5Eca5LgrFBOIytZpK557G9Q8h3tuZldSCcBTdh9NDl4VIfoq/URTpZ72OXLP2NIgs0svLJX/7Za9Xf4jlAygqBrZhK+IolQ+3M53PnivqrJydLuofSfc1vBrFOKFixxNyTOCqRc58FYfRBAkls8xYFbMl6wWFSePkGt43TRgGOPPe4zlDQsN49yqSrj30xr5bSlUwdpYQuTnrIRBTPmnikVg6yFmQeUMLKISyYuHvDx+LkUZeNN//iglweVY0vCTIyg4tY6Bn3DtYacO/6XOv6AXvlyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QG8AQmc6ntoJ3pWkKNh95oyzxnvDti6xLPTvLzjm8y0=;
 b=rtIpGr/ZGum2TzOlpyUW4ubW0HnFhGicXZF56KJCVKXh0CF0eJ0FwXwjWo4nlvGuhJMAFmVIcIXC5TuEhZ8/fAxE1PusholvVy4MLLWjcY4c02YSuH7E3uOrcR8aQINvrIOrnvVinl4Z1RmFun9VFlEvyq51SqmgmwHjVaEg8sf0NmNHFj0MqMur/mF56VKff2fVxD9Q9zCX5nTBUNFra+ApwjTMm2CWCP7HvzpXZuMUB7eGOkBPZDKUvWqDfSFcCr+HoHjKSarK2HsA8OAnIoJjqVpFNUkusN2aGPQm2T4na3bhcy10RCcvm8l8zM8KocMuknz5cR2oNVm5CbBZmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB8417.namprd11.prod.outlook.com (2603:10b6:208:48d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 16:01:49 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 16:01:49 +0000
Date: Tue, 10 Sep 2024 15:59:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 4/4] drm/xe/bo: add some annotations in bo_put()
Message-ID: <ZuBs5DazbyngXiwt@DUT025-TGLU.fm.intel.com>
References: <20240910131145.136984-5-matthew.auld@intel.com>
 <20240910131145.136984-8-matthew.auld@intel.com>
 <ZuBQ1CGPrZkx5/Eh@DUT025-TGLU.fm.intel.com>
 <62149100-98df-46ea-87d3-9aefb060b655@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62149100-98df-46ea-87d3-9aefb060b655@intel.com>
X-ClientProxiedBy: SJ0PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: f888741f-f755-4538-d50d-08dcd1b1e130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wB1z2DXLjXlMg/u9d0YDciK0aJlSAIxWPQjt+RtmLuwF+KXY3+vLviL1il?=
 =?iso-8859-1?Q?m7yaXvolGLTCmTgXpwSrIP/zPNQSc6cnStL1PW6JQv11xjWz4QSY5wWNTu?=
 =?iso-8859-1?Q?MWJeunTxKX6JNfZ2lL/os/WheCPqq6ETrAdAZtJQt/xMKuCqVWN5p9mTym?=
 =?iso-8859-1?Q?ikmxZNGlxfBwWXMuXAT6ntAs1u5oX5ILL+SMbu5FZpa6JDfu3ipC2LqDv0?=
 =?iso-8859-1?Q?gF51UnkMPqLfaX1mvVG0BDszpZ5fim920GFmagvg6A5FehhU/oLQSfhiVk?=
 =?iso-8859-1?Q?xRavcw9Zbt/uf6oKEdDM/T0JNghMxlNhcTayJfjRsL1E+rIMYxFLsH/jAv?=
 =?iso-8859-1?Q?02ELhgfSLS1gZI4sh3bN2voOc0GHJHPsRKkZmcw7DiFJe1k2WyV1pFYdBt?=
 =?iso-8859-1?Q?ucR7l0zkVkqC8K2IzZ1A+CGgUtJufWunB9oS+4+fCQ6UhBDafXXQDVHDDg?=
 =?iso-8859-1?Q?VyxP8642KlYBVCrA9Ymw3U5zVNFQNjaGDJ06dCn3SQTPkBOVXF+kOyqw1X?=
 =?iso-8859-1?Q?BzXk8LkCyiEbgBPjX1qeux3TpKmuFwIe5wXjrBr1bAjGgn3JbZ2tUR6vW9?=
 =?iso-8859-1?Q?znjpUw0BEuUC4IbjwFc5mx/tBleCdhCFUHqfc8sh8PJ6/UWFDJWLRQ3aTX?=
 =?iso-8859-1?Q?OkbwhrZzGQS4go8x4nl8NHE6cOqAPfqE+MHbBiWMgxCYxoaXknUpYOCjnP?=
 =?iso-8859-1?Q?EgGAcqgltU3ihg90a1GhUzp5KT4JqMQZvG3nDB5JMgsQQhVlbxBx76f5LN?=
 =?iso-8859-1?Q?hp0ZIX96E8gcJ6f8cLXvUlaUmQEcuJiLPS3Z5rdfzlfwdjtAuUdeqBN9YV?=
 =?iso-8859-1?Q?XSgwGMhtfUTfc9aVbTW4NbbhxuGGS4AULVnhaknsr7MRhxfFOV3LdqEhWu?=
 =?iso-8859-1?Q?1KlBV6AhBqA2+Kf33KVD24FCwvAqgb0Sl7B04ns47y8JaCCvzh9W2rTFUi?=
 =?iso-8859-1?Q?PHAJ0uXRWWuuU5Pf+pBalVypvAqpbFrOsQ97k1KFATqd1OZS6VQLrvMvdf?=
 =?iso-8859-1?Q?CaGEAR3oWDEJ80yzLnozFXkpFlppph5Glu0hXKC5llwopVlBu94E0oLocm?=
 =?iso-8859-1?Q?dHDlFGXc8T9bN3FkOlJpE56qa2BiSxTXsW7xDSAGy1KGM8Vb5p2TmDtlt7?=
 =?iso-8859-1?Q?69zYaEnENsb6g8aaRtHaWVfj72A9mJ2L+LvuUgsLK2HdSpUb1Mdx/XeXPu?=
 =?iso-8859-1?Q?YvOXqBynPHZxbl1bM14EHZ27CfpNvIqHj9RPSW6oLZHwuDD5drfouC2Fbu?=
 =?iso-8859-1?Q?+8O4tHBHIMchCvZPtTxg8XUJehXfkiU3wew0Tkar63ZKtUyWMeKBliRBJ5?=
 =?iso-8859-1?Q?GqHeScQ/oF0m9PjVAmTKouJrD6Tb7IEd564ivvp7gFVTncTg+nY+JfEq9r?=
 =?iso-8859-1?Q?1lMthmg7+11DrLTxQ4fF+1CAyZhHHvZg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dpmond1kHwTyLoi87tbs0Bu1mPhkMTX86nhVqgb2SGUi9dlLXA+jAXlJ4m?=
 =?iso-8859-1?Q?Ccmg73d/9G8dNmhiHj4SbtUIiKLqlWwdGhodgVcG5Xz47pTvfvRdXJS4sH?=
 =?iso-8859-1?Q?nL+F7GcjJjZ6AcVLhWn487WSDUaZ0EV99Nw2t2RAGb5GPiYioeldi1FbID?=
 =?iso-8859-1?Q?tMkVjLetNn7HCtm+P3kIQ7GMmnaaVP2ih7lhzv7vPqeBvRaV6FbLLzNDdk?=
 =?iso-8859-1?Q?asaBpeZ31JazVoSrBWNw2WSKQPo3BkLhaAbVzdh6fp7xk5jF94PZhcljvB?=
 =?iso-8859-1?Q?inpWiQd0HMuOe3zwfmoSgppWkflJUHpT+nLwDLJkf2Eu8+Wdh550pK7v0i?=
 =?iso-8859-1?Q?xMH/6AnlJIdFsCUaB1qcMMgA66zPoRugyDDCdENGMVk2rI0RbksLGGR+Zb?=
 =?iso-8859-1?Q?9qMHWAu+JbG9kE0FRm5vlSqbkKnMmcQ3GLY3pMe6KUXAITLosZkdQxdXBa?=
 =?iso-8859-1?Q?P07Ui4XsQpfqoBrkn4hb3Aa9huVq+CfIWzgM4BK3tRC5iJ7m+7RHJidQIB?=
 =?iso-8859-1?Q?aN1xX+kq3RN2ggSCd5mNMLb48bWmLK+rG71rWbzHFWTVM9U9vQUG29jgJJ?=
 =?iso-8859-1?Q?Xee3zCeLVK14Jfpw7uzRiP0P2XE/sxYF0AOY39GeYgidHLuaDls7eJQn6j?=
 =?iso-8859-1?Q?1CxNaaifMmSnkpq02uwulzgxB1s99iuREFMecjNI15XHg5A0pyp9Ps/0F2?=
 =?iso-8859-1?Q?3ACc6w0HIjEV7M6VuFwkfXrjThFzpTnjzJ6m/ZiwdRaRoQVF7dTp8lOfWd?=
 =?iso-8859-1?Q?DFz8+n9BKGjXh1nKL9xNA2CV+I9n6cHqej/i6ulHVorsw29G5BH7LKivsp?=
 =?iso-8859-1?Q?XKQ5dK03zcdIPa77/+hRBq0He3GB0oes4ZeDFLqkj6ocaiG5LNv98uGyZK?=
 =?iso-8859-1?Q?GQtFwSO98cl9AkS9aIMcyJzXAmsP/9CurTq6fj7aBlmYukpOEuIkJTBJ9W?=
 =?iso-8859-1?Q?PtgFBl6Zvj6Bo9kOpJrve2zA5FlT3zPzLoZfiWP3rMNRZTYuNjV10OCMTj?=
 =?iso-8859-1?Q?5XsIie6rK1V8Zz3r30Jnl5PTOAdXciNr0XFEXtkL814YUWeXLYgPQbKdKO?=
 =?iso-8859-1?Q?RaVfm+BI5+bbVWg4JH7PsCsFEMq8g7UT2PnYwT7faX2B7h/g3ocgRBONTN?=
 =?iso-8859-1?Q?w+epS8pM9JHvgbHljd3qgHj+9yLX4n/FBhfUBMbez0T/pclh85sf4JosYX?=
 =?iso-8859-1?Q?JO/ExOW4TxlF/15k+zRLhlLu6UDE4W5tiU1sHeJprU5MNghvzPERspORH5?=
 =?iso-8859-1?Q?bEA0NC5Jsi18VTt7z6Rw+XR+SsHKHrPpY1e4Wj/bG4f0XJ/BZzox/iaD5t?=
 =?iso-8859-1?Q?IGrRoDdNYINPrlnF5H+1Mf+MAmN0RKllR2B9oThpp4N8Q5pmPrHszTTZn/?=
 =?iso-8859-1?Q?+DgR3lpzOYsO4eWRJ1m16P9yupBBrrd0IazAWOJBfqrAYldhGmMBHKirS+?=
 =?iso-8859-1?Q?Xn5WRmXXLy4AO+Kkyxh7AOVvyu7YFF05DCBCgDV6/phoyFHgiak27xX8tF?=
 =?iso-8859-1?Q?bz/YYM+6V44ljR7eyCD/Du4VrE4jrHKnemZFeZiIy33drpubOsf7NaCzhm?=
 =?iso-8859-1?Q?1bjR9M/xmVM8Mk+1R6WDZAxKPDLkAAd7Or8K7s/Hnv5PXIBMfvwyvFoCry?=
 =?iso-8859-1?Q?24OGv96lKFvkrd6rhEL1Anr1wCVgLXyO9OrCkyoqzikx8AVF1OJ6Me9Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f888741f-f755-4538-d50d-08dcd1b1e130
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 16:01:49.8332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCctGgl8Z8J0AvsyNTh8S3X+dsqflHdzHUMFbD8PhqKIfjcB2xsO+JoqVU4bHsNq7IFyMpGgO7EbVP6+86verg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8417
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

On Tue, Sep 10, 2024 at 03:52:26PM +0100, Matthew Auld wrote:
> Hi,
> 
> On 10/09/2024 14:59, Matthew Brost wrote:
> > On Tue, Sep 10, 2024 at 02:11:49PM +0100, Matthew Auld wrote:
> > > If the put() triggers bo destroy then there is at least one potential
> > > sleeping lock. Also annotate bos_lock and ggtt lock.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++++++
> > >   drivers/gpu/drm/xe/xe_bo.h |  6 +-----
> > >   2 files changed, 15 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 53948a965404..4176b302c38d 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -2320,6 +2320,20 @@ void xe_bo_put_commit(struct llist_head *deferred)
> > >   		drm_gem_object_free(&bo->ttm.base.refcount);
> > >   }
> > > +void xe_bo_put(struct xe_bo *bo)
> > 
> > These are helpful but thinking we might need a version without asserts
> > that can be used in code paths where we know that we have another ref to
> > the BO. I can already think of a case in the SVM code where this would
> > be needed. In that version maybe we assert the ref count > 1, granted
> > that races but probably the best we can there.
> 
> Yeah, adding another put() variant or similar for that case should be
> totally fine I think.
> 

CI seems to indicate this change is good with the current code base,
will add another variant if / when it is needed.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > 
> > What do you think?
> > 
> > Asserts look good though.
> > 
> > Matt
> > 
> > > +{
> > > +	might_sleep();
> > > +	if (bo) {
> > > +#ifdef CONFIG_PROC_FS
> > > +		if (bo->client)
> > > +			might_lock(&bo->client->bos_lock);
> > > +#endif
> > > +		if (bo->ggtt_node && bo->ggtt_node->ggtt)
> > > +			might_lock(&bo->ggtt_node->ggtt->lock);
> > > +		drm_gem_object_put(&bo->ttm.base);
> > > +	}
> > > +}
> > > +
> > >   /**
> > >    * xe_bo_dumb_create - Create a dumb bo as backing for a fb
> > >    * @file_priv: ...
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > > index dbfb3209615d..6e4be52306df 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > @@ -126,11 +126,7 @@ static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
> > >   	return bo;
> > >   }
> > > -static inline void xe_bo_put(struct xe_bo *bo)
> > > -{
> > > -	if (bo)
> > > -		drm_gem_object_put(&bo->ttm.base);
> > > -}
> > > +void xe_bo_put(struct xe_bo *bo);
> > >   static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
> > >   {
> > > -- 
> > > 2.46.0
> > > 
