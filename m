Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93123CEE320
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 15:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAD110E0AA;
	Wed,  9 Oct 2024 15:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g26MvFt4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693FC10E0AA
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728488093; x=1760024093;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3wb8yqysxcuCsWS3b/sEVjHoc81BYYWoev4IhdnwCAo=;
 b=g26MvFt4T0l8o1jgGvdVvOlWkfmxUEtk/TtcFVfLjopvE2XG5lYDAy48
 j9HcZs8TFPZ0qRSwREiqakZrv2tuiyiLamkw/3l+Ozkpl+gDGeZ12WE1v
 +yHzXl4y1Zqqx0Ut4cs68GrydoqyPes1RRyJzSqrr+YCEUd9KCyAe0Qlz
 nlgSRxx+b4gHvnsUjiZA5xDxRSwQmFMekfv4Ipaqq2Ig3oIURD+CC9wgS
 x+wV/pNzqVPDHL+P7PKQPOv3oPRH0+aIG3ch24aZnVzs0tysYdiIcKQvH
 3HT+MHk2kEd64O1O3I8mStSziPYuU+K0LDK5N8BZ8kPRvoalW17So9FiW A==;
X-CSE-ConnectionGUID: lRVcG07WTeuIPfcwKqvZCw==
X-CSE-MsgGUID: iwSkGZIITZ27Hs6R/f7IDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="53202636"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="53202636"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 08:34:52 -0700
X-CSE-ConnectionGUID: j2IyNob1Txe5JjGj6wh6yA==
X-CSE-MsgGUID: 24rLVSkFSJa7Q1Aj6XZzIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="107051968"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 08:34:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 08:34:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 08:34:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 08:34:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 08:34:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lbn2317fR2WYE2wcsmfc//Nns5VZK221fTILOAADAdSwU3u1gYMRCVA03BZCb97CI8b1D46m8AtlTNm/QawGlXnYWmcX9LbHLJKVORNcDYWDs6XKFpHeq/v+NY8WBsdLFtCqfh5gXupCSLRVKYBVhCfWZCayJSG6Ji5wsQ2jzX+4WKmMG04YsJu+9caPDkpGiuli2Ckx94aM7Mn2V5n2PZPz0HUzOUgnSBdXAlYjUEcqNhWCja0hU0/dpG2+P6C1Rwgg1RQY5ORjqtuLFFW/kieApzKkr+alZp13uJkFDOIuXTAD6xUHDomQhRGQuaK+QgGG3hUyQJ36tByWvSen6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wYl1mfVB3Cc+uMh+QFk5lZkBGxqXUaD4ry0U5U459s=;
 b=rXthjmMLuPIgNUk9HfASTeNQpqzDr/HnqAB/71tI/ineZsgcBkv+h92vNH086YFjZIvmAiQm6/hY+irlrnu6zRpuLG5aYoi6w0xMeZg4WRfmSXDcMfbzju5ZYcEpyp1BQxDNH2YzmrKH7pCy4/i2WwiwlwFhqVqpuJKSZqpCMc5mHN5zegD5odRGj0xH9McDmhRcdytIxV3S1TfaABpDpDzSijk9hL+ROSZK0eYOmrMyMaj6VCYYW4+OcHjv4/NeWjic0fr+wWqAzq+pb/brYF9MkMwhtxnpdrUSi/W3iBc+gn8diTprA3wHhwmEjlJWSb/uQnSEgapbmbkiHYwQtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6846.namprd11.prod.outlook.com (2603:10b6:806:2b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Wed, 9 Oct
 2024 15:34:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 15:34:41 +0000
Date: Wed, 9 Oct 2024 10:34:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: xe generated headers (was: Re: [PATCH] drm/xe/ptl: L3bank mask
 is not available on the media GT)
Message-ID: <jyqqbtftdd654f3zjdaspygedv5lusi4tmzpnk3dqlylmmbd6v@mehvg5dd56zu>
References: <20241004212037.1431184-2-matthew.d.roper@intel.com>
 <878quxa3sg.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <878quxa3sg.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:303:b5::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 937def29-6501-4fec-0a33-08dce877e4b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IbnRWhAkWsq3vUKhtVWt6+utliZYCkjs3Mr4iaesw3ZK33Zo5hOerksG2s6p?=
 =?us-ascii?Q?Er6ews0LwZhzrduug3/hU8NJ2UrnofqkPJI0B2OpoEzd8IPbaN56NMP4V5YC?=
 =?us-ascii?Q?kfT7Hr8aCfkbntRYFV0S/W1OgxLl53vrDG8hShnJaAG+YJz8tp1sFmJhbPxq?=
 =?us-ascii?Q?217zGHQ2EhMCFqoDpeRMJ/fSIxUxhzRZHtomjtdvG4PUMcfR6goKa3xe9aWA?=
 =?us-ascii?Q?QYplW5L+XIiA5cStgE93/8QtqsYJjbhnbGqcxnzYCAJGKfA4LL+hO/rpPZYL?=
 =?us-ascii?Q?NxOCyElAyvoGgMMXVCOPRWdBY4uTRlWVs0j/ZFJbGxIdkrRfDXwK/uSqY0qi?=
 =?us-ascii?Q?tS9qpZscIFWMDHhYpz059RfjdBH/X8Tk6ugZmD5MPYjmH1hEibcvpOJwaGX2?=
 =?us-ascii?Q?TV+rHnFLhoRzdOA7zJmpPFUsipNL8Lm97ymC3uS172xxdTZ0dOsUelx5XIaR?=
 =?us-ascii?Q?a4qfafjtCStnddisq0tTtw+LwtISvNUyVAgEIaKJw4fNdBS4wpks9cGWtL05?=
 =?us-ascii?Q?qGwbRpRCEi+bo+kB+xN5bPk8cGntJAVpiaheqSo5Tlu3pFeAzrBa91cTfVDJ?=
 =?us-ascii?Q?bZtcHaNdr4pxdz2qOTRD3WUCuF1IAq1ioFpET+Nhwa/gRqlAJJSyk4gF4qxT?=
 =?us-ascii?Q?LXF2Uahf8t+8Py2kxTVYdtBgy6JzF/+iAR2gXAV5iwtTtU7lrFStQWUKyZaU?=
 =?us-ascii?Q?A4j3h1zZLiPB2fx0XeUUZQ3cVGgCLUOUpUnEN3xAcT7rafZ3g8Lf09mHCjsP?=
 =?us-ascii?Q?3y6cEZ5U2zKE0a9GG5RuZ7GRAZn58H5RL4ghtT7jX64RwWsFJPtHrqbi09df?=
 =?us-ascii?Q?DWF+Z73ZzvK6IFz+Ey/mNihbvBugIpy2kgqZSZhzYNP2yWMMqB7/IpEyuebA?=
 =?us-ascii?Q?9mxBN9PZNTX0zqKw4zHewfkWRyMyNX66MDCiAKZ+BzO64BOIgA/OiZ180P5s?=
 =?us-ascii?Q?Gk+U4+7120pNZTYw8iMugsz07osOlYxjwPLnGpn6cp18DZceBnASzDqNM6qy?=
 =?us-ascii?Q?K/7/p5lnzf9hG8N21qLEh585/4xU5luVWBt50LwJhp+tWaU5YEy4c7WpAbFm?=
 =?us-ascii?Q?/RA2eV1TvHGrpokTbicOD/oN/Dyc8XpuJYMLU/B1X+q3KYqW5+1yUXItk4hP?=
 =?us-ascii?Q?ke3JbW4yMKDaEbtEvH4IJ1eYWGUx35mPG5gCjDN5ntR7jLI3BSWTDL7RMLer?=
 =?us-ascii?Q?BK+zdy+WVxJOj5StGErThChLxVQ3nCO+yrIij0XstTP7VHyNJH76+XImerEj?=
 =?us-ascii?Q?38ITOpCGaNErNYl8nDY7uhLaZASMAMt3KCuny6d2gQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hUBHC/LPGP0WAUMdA8jqgA4iMQVMeuaGdtdInPNDYU6l8iPV+4CVFwAaifPc?=
 =?us-ascii?Q?A2SqQ/c/iBi0y8ltAlmwBU0F3RepLtHTYLewhoDu+CbJQy3F6Zkpf8IwN+Ut?=
 =?us-ascii?Q?4bubHL+YIVq26cnx+B1ivbGmo8v/jjt5+cqPgi6OQ+rj0o79XSGejYtac23o?=
 =?us-ascii?Q?N2eyQd5hnEBNYpaieAKlWnwGFpSD/p6qvvy4oJ5WpStR/eHB6uKQcuCN0ZV5?=
 =?us-ascii?Q?iavHI0GSQZKlDYt/NtuMSdwSE/O+Cf4be8gA44fNFSxlOCDYhbGAhbZ2LEfC?=
 =?us-ascii?Q?Q/3tkVgABeP5d+xPXzrzCHtvJF2zddG3fkyislYTUa8qxq6txMUt5td/SI6g?=
 =?us-ascii?Q?fBNqeZ5d9jNmBsBlG8t4iWxCJuhAoER0rj+C6zx3VzBhjnW3u44bgdup9RBt?=
 =?us-ascii?Q?XAibJjAPq8tOt+dRb7vnuKE2NQnkjXvI9gNI1AKLotYV/mGJa5TQbHXfkfPQ?=
 =?us-ascii?Q?jwgcvQB3t6elj5fXuNuustZ/fJ0IuswhC5/t5g4uidmHAPj/F/sxJwpRwNP4?=
 =?us-ascii?Q?thy3pwGFn1HDFCf2aesRQEF8LZOi3aIhoscbegmAnSk4CQg+/2WME1lEmf66?=
 =?us-ascii?Q?1Nqsnx7B4yTFkHMLgB0GH6AjuzV+AaU4RnCItkfuvn22HHH2OsOHGBSv6i1I?=
 =?us-ascii?Q?tZsUxWGNTf+h3TgRnyfzwwJUh/Zg216wWKFLoIXoSkOBO6TVYTAy1Nu6c7tX?=
 =?us-ascii?Q?tCBpTCt9BWeRAVfhrmKZdF34CaFMioiPiDre3SAY7rRUDCvko8I8aHeWA9Ol?=
 =?us-ascii?Q?wFsokkcjQrDG7Y6bX9C8yP/fsNIf5T3tUjJPG4KkTq+5QiV72bmV3yAGnJc0?=
 =?us-ascii?Q?rbAcbtzbB6QD54dG6oz1gkh/EqYlH/h5iUU6zqQ3M6S51upsKXAx6mRk/J3A?=
 =?us-ascii?Q?Vov88IkftIIZT93Ug8JOOLvh4DRE9sRgr6IDxh+4kMVG9YKzO8aongys5U5M?=
 =?us-ascii?Q?VIguej2WS+vPv0Ff0lkEXr25QjlU6XHKZtUMqk4RjDKPlToCUq+mDHftEwAZ?=
 =?us-ascii?Q?M1Dnvu6KB2PasObZ+ZoRdA8kWbMzZN5NlQHfsdocUX1bmCLNIgqeKWQCslZA?=
 =?us-ascii?Q?+nRgwBVXVgc4824BvXkIL9dMxPdS4qclBT/hhhhRElc7q33Zfs2C+FATL90X?=
 =?us-ascii?Q?A/u8Lw06sPp8FwjoI6QbOwJps6h44USCcFiK2F4t601j3jksad3bb+Q4Xszg?=
 =?us-ascii?Q?+MACvPBFEQAGPCZpQjepBHSGNECaZEYWbxjUrzcHcyfYMTcJFqKcUhqE764N?=
 =?us-ascii?Q?lGaVbQkr6ZGUP3nBseOD1uLfm2gpgjTlwh1cTYgfUFnaKIVc8FV20FLzojnd?=
 =?us-ascii?Q?IPrTF2b/U1BDMasz/xOM/Xowwabsouq7LW00w0KGCX1GLapdijxyggs3zskP?=
 =?us-ascii?Q?LmVB0mGn56Ll6v91VSGINDkMfx43yYiEjf1YiIC7ugUk4Thm3d3tyMQ4tks7?=
 =?us-ascii?Q?QSvjoKhYhylIrfHXg48twP7Tdv8A1pThB43ZATSeyNBpsupo3JZIHPjiAjEP?=
 =?us-ascii?Q?J6k5iZFQKrEXR9X2AonPtZoRqw6dktDzNa58fbyNv9ytvIfhwlWpwNs+Dtn8?=
 =?us-ascii?Q?7hmFD2mrSpojrbfO5yu/jn70AfD+67b2/pg627CUxBx3dRpocRpbD+JpyUHF?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 937def29-6501-4fec-0a33-08dce877e4b5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 15:34:41.7389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrNodBgiITpja25RUQe/ISGsLYe+2nClzY7PN9HNUJj97aHFPvNwaBMRMdBioOf052CRFHnrnK9pWvOYwUETtXcYA+LPcb2JHwoqZRkge2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6846
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

On Wed, Oct 09, 2024 at 02:55:59PM +0300, Jani Nikula wrote:
>On Fri, 04 Oct 2024, Matt Roper <matthew.d.roper@intel.com> wrote:
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index 651ba53623e5..df2042db7ee6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -5,6 +5,7 @@
>>
>>  #include "xe_gt_topology.h"
>>
>> +#include <generated/xe_wa_oob.h>
>
>Hijacking the thread here a bit, sorry.
>
>This use of system include path <> instead of "" for xe generated
>headers keeps bugging me.
>
>There's a global directory for generated headers, and that's what
><generated/...> usually means. See:
>
>	git grep -h "#include <generated/" | sort | uniq
>
>Or look at top level include/generated in the build directory.
>
>Especially putting #include <generated/...> next to #include <linux/...>
>implies we're referring to the system generated headers, but we're not.
>
>I think we should be using #include "generated/xe_wa_oob.h" instead,

I'm ok with this. As long as we have
`subdir-ccflags-y += -I$(obj) -I$(src)` this should still work.

>possibly with a completely different subdirectory name to not have the
>name collision and confusion at all.

I think changing the name because of this is ugly and unnecesary.

>
>Another alternative is to do this in the Makefile:
>
>	subdir-ccflags-y += -I$(obj)/generated -I$(src)
>
>and just use #include "xe_wa_oob.h" directly. (FWIW this is what msm
>does.)

I like to keep the "generated" in the name since it's then clear
that file isn't in the source checkout, but one should look at build
directory instead. And even if someone mixes the build and source dir,
there's no possibility of a clash.

I view this differently than what you are writting above. There is no
"system/global" includes in the kernel. There are only the include paths
passed to the compiler and the only difference between " and <  is that
for the former the compiler will *first* try to find the file relative
to the compilation unit.

As for clashes, if someone adds a include/generated/xe_wa_oob.h  file,
with exact the same name, there's something really odd there. 

in summary:

#include "generated/xe_wa_oob.h"

has my ack.... which is where we may eventually put the regs/ too.

Lucas De Marchi

>
>
>BR,
>Jani.
>
>
>-- 
>Jani Nikula, Intel
