Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1839D78796
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 16:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A42210E3E2;
	Fri, 19 Dec 2025 16:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUcIJwZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9291710E3E2
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766160262; x=1797696262;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TFuyX8Wtc/FGn+Ak1lVlJqZt0SvZBdv00FZjKB4QXpU=;
 b=kUcIJwZ7jP8xO7AKZ9+vxdeBBdWGlvLiv1oWa7dDFIRsV/qWT1vhkOGB
 8KzVxINhhHKGzYu39Kud1sU42iCGo3jCI/v9hxMrbhHnwEVrxyZ5V8W1q
 4HJKY5Dn47Hg2lMk7JpYf0OgnOChRqA1HvKDZ+erIKD3FzGSoc3Rtv5f+
 SEzzeVVSe5eiZ5lCaiHjbSXgmEdOqYq5XbXr5pC3Fq/hJb3m6o2RJvqqy
 SbdmicdzWnxq7i60UsLkj7D3y3P93qnLw34/WC0m0TqWW8nK+2b3JjcSD
 WsYtdZu4cUySdcKTNkFlATkLaSlyPcF80fZ1tX/MWG/L0H72Zbx091y9q A==;
X-CSE-ConnectionGUID: OHjXmIkkTXaM1HmnHwqijg==
X-CSE-MsgGUID: WztlXicRTr6yCxJOZdySwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="90780891"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="90780891"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:04:21 -0800
X-CSE-ConnectionGUID: we21Q/DfSdiGMHsV9FixOw==
X-CSE-MsgGUID: QXU4zUBMT3O2O+1eW/c+kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198956727"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:04:20 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:04:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 08:04:20 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:04:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTYfZPm1FQuVXILV02xWs7EMR0N1jcpsNFd5hRycMnIV4cRo1zM3Gp1A69eSNEyax+1hXCdFsMixLVnR1DCMiMH8EvldHCoaS4s4EW12U0epk5C4nRB+o9123zj8Py3R1KMNNXhYj//+Rzs8K2X5NA4zxEhCB4X+qcWXXCl+NRxVurMyPzw5T61+kzL5rWzgo8mc89MedHOmxfJGFWONClgtqTiOkxREEOHi29iSpIE7hjj8ltD9lJxZMGnzq4a014hNpQMfc5BDraB6G1IYEu1mTix5Y82A5GQJpk4WlX1rtlR61LKPfAgium/236Cc8reutwtXfp9q5NWKEaXiCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93cKMZKW8Otc4vlDVZsxb7Tq2F4jJzTgJVdNgW4RwU4=;
 b=yR4ZPwI7vsEZ4wjqUCh3OulmHl3gCy4P4vicxV9L9rABcBFwPo7f7Rr5+nZtvtiT5QWsGfH18cnrE5mDxSYSXSV2IbZ69Iml1rK9pWnd+REDbxfuRkmTFRwYz5YmMuryjAerP8Kb01MwQDtBcXRxdzAcpLO7waVstfBGOteWbL8XGndUL4MxypbIGuWKgqDpBFcC5sGmMe/ErUTAZDTxvdL6D9nnGdOU8YSmKq6Zg0/A1Jkgh99n4mueazlbHEBaunylVt3ZLb/2VpTge0HtwgaewzGAlS4XIOlWkZh/gPHu0QQKV5f75LNnHft7hXYhOrMGdK45p1RtsfYdNxnyhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 16:04:09 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:04:09 +0000
Date: Fri, 19 Dec 2025 11:04:06 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: select CONFIGFS_FS dependency
Message-ID: <aUV3dk3wUpf7U6tP@intel.com>
References: <20251219080513.848072-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251219080513.848072-2-riana.tauro@intel.com>
X-ClientProxiedBy: BY5PR17CA0063.namprd17.prod.outlook.com
 (2603:10b6:a03:167::40) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4d101f-2335-4d08-28e2-08de3f183e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YqSKLi2kKj5Q/STl4CZ9+DvkHLCR4J33fX32jCaNLxm3kVSCu2vIcp3qn2cU?=
 =?us-ascii?Q?LjccAONd/n73GVRjUKnZwj5OH8smm3MQx6VHspp9QnqqQw0tUhUotLgjiAtw?=
 =?us-ascii?Q?4GmxVuElMyzlvGD3zPDzjyWSyuAgeszlg+1Ho33ywWN66m2vECokFGQ0gels?=
 =?us-ascii?Q?7QgA43FmHnG74JeZx3/nn11pSyjm3XYeXuxzJROq5FNmVHGHIcLF+Km2YfgF?=
 =?us-ascii?Q?9WozpEZjHTXQQpcdLJ+7w5Jok7nzBDFIbKgWrD2Dw4AhCuWRaDHRWGqml1WM?=
 =?us-ascii?Q?s073QnXxiuGuQHl/UX521lv/C/CbMpPh//P7LuIMmqIz2YWRMOAKLYdVew6o?=
 =?us-ascii?Q?olpyBumG47fm7f3HZGFSGfeW+0QoKVB9jzKQnwlHyBH2I0L26mrclcQu+F6h?=
 =?us-ascii?Q?1qYas7xi0R4JkPh7/lp68BEANzNpYDx/pDkS4g9kttVtVnUmrab9LlCsaj0z?=
 =?us-ascii?Q?ofI3DZ93Pke2ts5cvQbOPqw4+NuXGbNeraI06uFaulAb71WtsBs30KJ2wpU0?=
 =?us-ascii?Q?lvexjVq20paHSKBVGGkEvqhJTXJ0lYCDag64jeDl7yaH4Ao1iVUi2RYIxF72?=
 =?us-ascii?Q?f8C4bjNPCg0oWLDckUFXvGAazImU+sTnqbzGSVHVBM7V/Q1IvyWSxLsY4Xgq?=
 =?us-ascii?Q?Pq/EUDFQDxDlazCu78EPvaflIIYYPAlaYmN1Ev/Pvd/gQM+Cb4d5AteJfiIl?=
 =?us-ascii?Q?1nPhEnBPwDKM+OIgZyONAZmcQ2HaaZezQB6ncLT6mM7eqeBaAQ++CWxSoFi4?=
 =?us-ascii?Q?goUkPN5OxAnAtu2xPq/wfJKyEMo28ZTbLWuue/+uttJZP9oFJgX+f9yXEGBG?=
 =?us-ascii?Q?s0agrkvLpJPLlgNCF7zmW3FrMWib1G/LT4nZUeJVuiG1qnvNQUXzy7vpPy6k?=
 =?us-ascii?Q?Qr0CL8m5O5ILhoSANDXHb1mVs9YZcX6Z4UZq9GTFNVGK4A+f87pmUxYxW0QR?=
 =?us-ascii?Q?ZVG97VB7LuHskaut+bsJ9qWqIDUsMfHVWIs2Ale+gQQ7Lx63eC3AjfL6+wWk?=
 =?us-ascii?Q?g89fUA6UsP5pxg57mgvctOPo28JZmJMJUGJQxEa21ktZWP1WRLp8FkEyjL1v?=
 =?us-ascii?Q?3nMhNAKXE2IS5DzNQNVn/zPVRenKj8LvyNtdBh4aOK9CJ0Hv9rqP2ZqWTaZ9?=
 =?us-ascii?Q?FfmRjsp1QwZaHUqeRQBNTfjKxjb6oeGp3Kh9N8dEm8VGxb7i9DO4VR+yOG5i?=
 =?us-ascii?Q?qR24QDAYABeNBO/HhXzsrYE3L42jtmNNO8zo/WfIZXTXK7kQVCA+75sJpIDp?=
 =?us-ascii?Q?ec2/fjgFHvH1GeAsscSH8kfonfcvqg6YxvoArlg4d4N4JHphkHCWpUWq5Dr+?=
 =?us-ascii?Q?pCvb8VgYTgnEuquYA7BhDsW7Zhgmj0GmF3TlKQ2CTMd1tPButeJ2h3biYtJ/?=
 =?us-ascii?Q?FicnJn+w1bfFvDlMlcOd4iJ06gEKGMfyouqz+iBVL6DhCHMhfLrT6Q5ybiTX?=
 =?us-ascii?Q?q4xM1pNzW2UPKjoq2l2cAj3NN7OatXZKMzeMuHzKzxKy5eh5pDmkqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FmbiIpW4N218awRdMEZur6iBdyD7Kzpd3615rf+u0I3XEX5HoVOu0Rue7SRv?=
 =?us-ascii?Q?MSoEteTZFdSdUpK8x7dyu595/SgKYPkJTQ3uTvsqgDC7hBoRQukxd7BTOXhg?=
 =?us-ascii?Q?r5LRSFO2x1kshd8IUu1sK67KzrmrB0JF1hptJtT6+NQPezj77jxKo3NSyNqI?=
 =?us-ascii?Q?YfqJZUK1HKxjrwOdH1+gwKA8rNT2eqVXHGATILlWq1cs85Jnge00OOm4lzA7?=
 =?us-ascii?Q?fw0N0Scew5mTWn0z5alErj2NxYRJDRURmW8C+RK0inkT1evyRm0gn5RDGCq8?=
 =?us-ascii?Q?owrkYU3xLaRz9MHR/5F+SnCbzXJh1MfAFU1e3ZbofjKDjbSuehfIlUH9l29B?=
 =?us-ascii?Q?DZFKHgJev3ljBhznfimah7JB3mCOGhMNR46jyJuq+mlhbWhGdiwLfISu5Tg4?=
 =?us-ascii?Q?mko7duzLLZ0d+uBLCQOkBlSrpo+xjAs3CmAd0pOR2JIncDDoFeo6wiM75nqa?=
 =?us-ascii?Q?o4L7zCwUNkcSAW1BXH7KBDrLY95MZueM45nJYHBgaComYBbi16RJl+s5bwae?=
 =?us-ascii?Q?ZabWY7lqX6SAAFrphxrsPeus9NL3G4QY8CQ2jwtvGU87BeNIeaEdb0rvTsyI?=
 =?us-ascii?Q?4glV6NMIFfbHUt2IpFernFM09Rqx+nNh4LG1hyXAMYOybEiFtCkdVC/3sJRv?=
 =?us-ascii?Q?aniY6aLkqj2uw//JSq69dYpTsYmvLstlaMuVG+HBmaIkzg8vCZeyg4rmEQ5u?=
 =?us-ascii?Q?yUHlyN1o1SUC+B9oyyylQLVyV7m3DUASIUp0EDHKGgGKZkHFpxumGQVQ/z3Z?=
 =?us-ascii?Q?1qGmU+WrhG2jv5w2Eb/OnDb39N0FogUrzBFastv7H+RcZrIEJ88l5Ni12jqz?=
 =?us-ascii?Q?saSFSprZOmUtPJaBrOnLzFNu+1NyvtDq/RgcFztiD9fd0toYaP59rF6a2KFO?=
 =?us-ascii?Q?6IE7FOC+W2odYcfCGZv0mHqg2SvQz4h3V78h6W/xHYnYPuZpMHAG/AVt9Lh/?=
 =?us-ascii?Q?r7W2F3VQeq5hRxoejssvde/rkPgiEx0WHrqxT1mG+7NDJ2blCDLvgWcX5fwF?=
 =?us-ascii?Q?35xHMzJIL8HnSH8LdwVV40j0BKIRZTPG9g9ae7dL+dKHxTFnU3cG8KlrovBV?=
 =?us-ascii?Q?WlRoQHGm91ojEWozdfOIbvDzNEwzg8rgBdoLDwCF/xXMlzjRPO8ZCqZIluoh?=
 =?us-ascii?Q?LXSb09H9yO1wfSfh/iDTX4boLT2kB6U2VGt7YzObM36rPVeMptiv+HtmPln3?=
 =?us-ascii?Q?j4hL7wCuQNLteuR17gdlemEpmVyh6vAOCqW2pvKXLHnAhtqm1UcfVo9pbcu2?=
 =?us-ascii?Q?s/haYNZRYkBT+JJmW2PuRqnEZdka4/s8jJR6tK/6PAO0LPqHS2sLEfEGxWan?=
 =?us-ascii?Q?usW28cnAYw1KQ4D7LZT5Ce8QHn7WSEY2FTWrX5An68afZ9t4rgFH9tqyl1x5?=
 =?us-ascii?Q?j/vbAHcunf7QEhlLV5nlGy34+bIS57or8FK1F3ZOivuIqjNetwzWdMeQ2CSc?=
 =?us-ascii?Q?fcQQYo1yLGmDNFiqy+3oXr1uH3IOOl2ODyXmH3dHazgP7XF1ILDnfKwCOwkq?=
 =?us-ascii?Q?BJBDRCqfMy64NGbTKrOT06HizHlxXBKXQBN95IkE7fmwuM7YFFVbpcbt6wgf?=
 =?us-ascii?Q?1z8Gx6d2it/HX7DeV84o40E9dWXSpEz2d+cBFOlg3h58y647Lg86FX7dxmBx?=
 =?us-ascii?Q?9ccdgb+o0deviOVDt7JbwS7sLa2uOWbBTCugz14zxL0rrvaHDR01hWKJGxo3?=
 =?us-ascii?Q?MobA8chGC2WisSkOV4D9FIQy2UXD21Lg+sM1QJaXBPAlbcqLxUaXMo7fBo8X?=
 =?us-ascii?Q?tjm7d7aSvQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4d101f-2335-4d08-28e2-08de3f183e6f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:04:09.4410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQWdgF0j6NyJbjMEb6TdH/D+62Z0kdjilNFiCocmi47F3djOIRsJJ1EjXOwOX3/bBl9SFbHroK9M59oBNPNJhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7343
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

On Fri, Dec 19, 2025 at 01:35:14PM +0530, Riana Tauro wrote:
> Xe driver uses configfs functions to expose configuration to userspace.
> If CONFIGFS_FS is built as module (=m) when Xe is built-in (=y),
> undefined reference errors occur.

Perhaps we don't need  this middle phrase. Only the first and the last.
But anyway, we need the patch in. I just pushed it.

Thanks,
Rodrigo.

> Add select CONFIGFS_FS to ensure configfs is built at minimum required
> level.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512190827.IeXYj4qg-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202512181854.hPyTAXc5-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 4b288eb3f5b0..1094c5fc5bdf 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -46,6 +46,7 @@ config DRM_XE
>  	select WANT_DEV_COREDUMP
>  	select AUXILIARY_BUS
>  	select REGMAP if I2C
> +	select CONFIGFS_FS
>  	help
>  	  Driver for Intel Xe2 series GPUs and later. Experimental support
>  	  for Xe series is also available.
> -- 
> 2.47.1
> 
