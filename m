Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B1AFF8864
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 22:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B52B10E988;
	Mon, 27 Apr 2026 22:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9jrIprW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7327810E988
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 22:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777328193; x=1808864193;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/XmLFQ44JO6rnu/CW3f9Muu248W0F3DvcVuhneGqdE0=;
 b=e9jrIprW48/6LGAH/m2S8mEns/6direJoqJ4bQkMfIeeiujnYksDACvW
 AXs2zqI/N7Etx852BSJIyRoAwBuC81bL3ErW1jcUe6ZFZdrAlooeIw0l/
 b+3BuJ8O6X9YN9kzISsXCiIeHexe7F7N5cxc95jkR1gSh4ovjiOYIYyiy
 zr+OyAyBzYZrRZcGGBiC4YT+QmZDy+f/PRLZG1cVUxgmY9V1JHtBzfrnx
 xDlu4SXVfcgFeu9Wn+YiZCgFzzt3xm7tcH4x9nQoCfjzEksECnp56/wNc
 1V9Z0tDBVBStA0yxnwweKIAuKLUx/0otWXnp6+d4zzgHeTEDu2jQ5K49K A==;
X-CSE-ConnectionGUID: yw2lE/5nTVurpTZ8vCEUrw==
X-CSE-MsgGUID: XYWnzxc3QL6Ve5+Yp0eYOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78291312"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78291312"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:16:32 -0700
X-CSE-ConnectionGUID: qJDdNiC/QDuRYqpwblybYQ==
X-CSE-MsgGUID: jAT3CLRRTxGyx6uP+lcBmQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:16:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 15:16:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 15:16:32 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 15:16:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PD5eDXIdXsYfAk34+h6p5EwbpP/nJ1xbF1mb9Iv40S6IWiOH1hg270Ohg5K4Mv98/Xuk2llNoHfwJhZOujJG2BWyeuWj7qJp0Vvk9fZXReqbDFR+7d43v52VYdlmWv28Uh4UYBBmIqlibfjV3eIGsHP41xs9gZWH/uKZdIiDV5QxFk5pofr4sBcbOq3feithywLr1KCHcJrQii97Y8OZTERrYaQQBRAJ5rTUCnsX3SXhsNxS+pLs8KcEWeiHlsYLk0WAzWNhXvP6AQQViJ/6Sj72wGVBmrTkhjVX3E8bxEdr5k4Y/yMHpPsAcjMgwLuxACOs/Ykg8MwIcBcJ0se2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHhOEZanqhic47XgQXH4jacJgK+ngVoxDtu9ghKI1Ss=;
 b=ZC4Zh2nXtMZhWin1tyVi8aQ3hP9GRuFiZEunAm4DG8hA0pobYgLMWRqhqR/7a09Q2yV3KqUX9Qbm3atUYKafC+iiDlXik5sO7egR4rZbvI4FZVSeDzR48lb6LbmFJT+rgJSFUFiMc8h3AevI5S20yxK+Cqsh57gbgI66820VPhB5x/LJFlc7tjY1oPgIsXRlQ/CKgC7hzYqHag6ctRvV50NlT1pvA4ICiwsmzGrO5LoLcGLnRTDBO7v6mZ1/6p0dsNYky1Wwvd0z3+O7HPmQpBHrTac59/rxYxxSG2kEgxivJgg3Wr9BGNNBMrJZxGANq7QKDtdo66lRmP9dXEq45w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by PH7PR11MB6651.namprd11.prod.outlook.com (2603:10b6:510:1a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 22:16:24 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::79a1:7b0a:45ee:cdee]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::79a1:7b0a:45ee:cdee%5]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 22:16:24 +0000
Date: Mon, 27 Apr 2026 18:16:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
Message-ID: <ae_gM3q5fNgprxfe@intel.com>
References: <20260423173925.699486-1-soham.purkait@intel.com>
 <20260423173925.699486-3-soham.purkait@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260423173925.699486-3-soham.purkait@intel.com>
X-ClientProxiedBy: BYAPR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:40::21) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|PH7PR11MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 20951aa8-61ce-4bad-6624-08dea4aa9e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: nhGAhXf+n/P9sJoa+VoYf2vPW5/ks3Nk8lmdBFKgNFvC4Yo0EJlbQ6UCwE8NxO84+HbqjKXwjoxBpOeDepsZWudtMPAo8okA3Rz+bAYzB3tt/KzbQwaVo2bIsBC3sHZMUEQRhIab4m4svzAVHBgBbEJ2M88uzT1nK2ME3FIcntZPTFKhhEjEMsdwmGsDTh841ebklFY5bfP7KcYkvFfMWDlXEgZGMAX1cLDEdiUiCrkG7KVhYmypObl1jysN1yxRcrt7XANCa7uY2av+93Tu2oLi7/AU5rvyvsnUaIQs1bxvtPL2ey9nZms4DI21S0aSoynqXbTGNxyOmdpTQpaSnVfWD5TtkWBpB9XwlOyjFStuXuhUXbkknu2zzpafPQEBXlwrbYDjyCKz6JelzvuiLA0oNT3qnAn7sgAF7Pq/sqvte3qEEU8ftSoiwFOzEJkuTmPx/3oD2epMlazlHBeJUmsWTS/06CrQdemaymn9xMW5Upaol82oruYg32Mtv0mi7kTB10p1aIBV/YPWjKQn4f/+rd1ATrIblwM1JU4871O3W/TehsH76S1AL0Ipvz/mMfc6MLYi2HxtpooUSU6uhsOP/onIEGpbfQ8uLTtpYEhyBI94Ox7XdqqMB+iJRfpquILeyZZZCMOisPBzAYLYWgO4TUTl1sWr6+6o2Y8CiAnjGJrDk/ROgjncArwpiatNwxvBQZ9coetySgJM//hVQtWtBYgbEwxYkm4idNvL/Fs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gIpATLIjHLkchVAcNrnMaTZNX5POxKU+bYdRVhP90/JZ4hv7beJ807/aYs?=
 =?iso-8859-1?Q?gITUjqae1+6Z27//7aquK1TyTsnRqzL5FBC5omy5uyq1IDhT85Bxn09qff?=
 =?iso-8859-1?Q?M/SVGk7nBS2dSeDazbzL6B+ndA9c8QNBi/JV0DJBygetOTQJU8F5j4D+rW?=
 =?iso-8859-1?Q?c0VQLqxhVkxrmnhRvBI1ocwfImm53QDH2y/9+nu2hTXK8yrPYvPwRVdxIn?=
 =?iso-8859-1?Q?2c0cY3SztZffR79581TLVE7+5FJYTIgj7pbB5CTK+HzgrqTi4H8nfZ5oiO?=
 =?iso-8859-1?Q?4NM+rM/XdHxDYZnRD1mUDLAaISQ8TkINapqRiLVMbPpgt8youA11LwNj1m?=
 =?iso-8859-1?Q?zmy9pZgDuOvNSDASeqgIicVX5JdVZ/NJfoSxqMPLHpCdad9lB3XJWmaAGH?=
 =?iso-8859-1?Q?N/4DqtJbwEj6X7sopieon+qOmKXBxWxTtzMtq0grfzsQWlTGM96u1YuSan?=
 =?iso-8859-1?Q?5ecKE2+mKmjYhSrynVaM8thoCF7hgQxt+btI83dWTumUofSbW82zZYr57p?=
 =?iso-8859-1?Q?yj/uG0EDP+Co68V+NiiQtp3Bwtd1TCSiNbigIwHLrMgnFQpZi7EoAm7P0e?=
 =?iso-8859-1?Q?QP0Y73LbAkmaw8xKnY3OvHjVneZdujhrwNfymus6XkoZ/DAItFAnoLF5kf?=
 =?iso-8859-1?Q?PETqYmfeTwqaCS5eK6vy2IoGKtWVfi2k5q5VpU8hMJ8YDNm4J6/MvgSnBc?=
 =?iso-8859-1?Q?QDdjKzmoGnow4KijtAHGWvJmJTfixxDWpiQK4ah/GOGJA1N0K0l/vCl53f?=
 =?iso-8859-1?Q?OYBO5q5G7LQVaQss8j4km3AglG6Z/BI3fhnBToRCpTb3wJ0nPI/3FNjnFO?=
 =?iso-8859-1?Q?O9Fo77wNo6R5tbp0oD1yq1qaWKzChVH2mTno/hvI5z+ygKKtjlX3G9UCEw?=
 =?iso-8859-1?Q?msrNtriK9IRHSOQ8u+I+TB/fNjw2X+9oS44yb1pZmI22UyQivUHkgUOA1C?=
 =?iso-8859-1?Q?7N2774zcEm2jAsjEsIU9anH5FeCi8O0PfB1ildxQr7Ljpe1TdXOxJU9HCZ?=
 =?iso-8859-1?Q?W13nBnWmaRHKeNWBHgro9CXtDQSawsULLmbgpVoK9Qj0WXFgCBZwcEi82n?=
 =?iso-8859-1?Q?bkzWN0z2g57mvyFrBnfcbs3YWVgmCnkODc0qt90keI8qGtAMcXB6w8gMgX?=
 =?iso-8859-1?Q?ul12Tu8Wm0KckmZNBkDqFss49Y5YExOGjAyZSwInDqGCEnY0o+CEXZfVhR?=
 =?iso-8859-1?Q?kGRTbkYKNftyqiTkgcbsbpzLfLS/3miSwN+epK+iz9ImAG6qJWY7eyBG5x?=
 =?iso-8859-1?Q?n/9quNG5J6XDfXzX4l7KDIZpYppZ/o0SCuD/IL93nVhX/7fTgmKD8lv1Xm?=
 =?iso-8859-1?Q?igjeicCb4/HVKaNuaamJnUg+LbcB/f9/vU0rTihQbqaAaJLM4cL5EzDn0Z?=
 =?iso-8859-1?Q?1fqPbRo9cw4OSS/UxAjje66pt1SLeeRh69O4E0LRYvysJV1LA7sfYVwZsq?=
 =?iso-8859-1?Q?Wol3kgT9EzZZ5cw+Z4cSnim5F1WBDtXSMPQuw990IdRdTdxUvM5JEVDyE3?=
 =?iso-8859-1?Q?f1aNBSvHDyhOEIJfUAWuDiQs4n44dzQWcf5Qugnw5SJOtezKx8LOETxg5f?=
 =?iso-8859-1?Q?SqSydRZ62gIeU39s5GTkUs056CgmchAOUbQFEEBz1hm4S1oWJNExkd4GGb?=
 =?iso-8859-1?Q?z1HT34j8IOxrIley88daqeN3wcss+T9K72jwZCd0UhqQZLxRWCHwTzd3X/?=
 =?iso-8859-1?Q?83U2CEgVPVBoHlK9l2C07vgSJ/V/XVKa5RDRLoxyaydp1lbby/ngXeksr4?=
 =?iso-8859-1?Q?rahJdVZFJKOMl0gRJ1IPJbnC+F+JGjB9V/Nu0RPEeW8XXzjUCU0cE2jcD5?=
 =?iso-8859-1?Q?VgQWnZSpsg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Fvo0Yw8d8DDVeYUz100XjqMxCpwZhGwYbKUswJ7dPIb3ecIPsiF4HHG4hkOmHvxh3HMx9X+QZnXx6/YgTB1EIL28TvtmKDM5Nhfq7sar0SqGTacbPmYws/g3dab1iMF0x4A6j/FcwfL1HwqYhTuv0Am+Coq/+Zd1Z3hZ89STKm+4EX2GsJTKTM2ZQXPC9gtMWZzT8d28yzpG/JrJ9zgJtSaiC/3IPFRWZRwTzcrvKdke7c4vZxhBAMT8QFXKzDgrpQm/f6HgPQPRpfyo1vBCkmCavucaHpjtkCJz98eB0MUbfT03rZOd3knqatlgyqsrF2iv2+urxQVEwpsLzbc0bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 20951aa8-61ce-4bad-6624-08dea4aa9e1b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 22:16:24.0708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oV6tgH09mEXOCxCpyZJYqSkQgYNwHPJYgY+vrFL0rxL6pM4CNy2qAYLlxpTbJcx2SDnzNuInaJ1AWQxt+hPRGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6651
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

On Thu, Apr 23, 2026 at 11:09:25PM +0530, Soham Purkait wrote:
> GPU health indicator exposes a single sysfs interface, gpu_health,
> at the device level, allowing administrators and management tools to
> query the GPU health status. The interface permits both read and write
> operations on PF and native functions, while on VFs it is exposed as
> read-only.
> 
> The sysfs file (gpu_health) is placed at the device level and behaves as
> follows:
> 
> $ cat /sys/.../device/gpu_health
> ok
> 
> $ echo critical > /sys/.../device/gpu_health
> 
> $ cat /sys/.../device/gpu_health
> critical
> 
> V2:
>  - Return error number instead of error message in _show and
>    _store. (Andi)
>  - Remove redundant VF check in _store callback. (Andi)
>  - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>  - Return only the current health state for sysfs read. (Andi, Rodrigo)
>  - Add documentation for sysfs interface. (Andi, Rodrigo)
> 
I need help with the review of the details of this patch and the
sysctl interactions. But the approach overall and the new sys like
we had agreed is fine by me:

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-ras     |  33 +++
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_device.c                |   3 +
>  drivers/gpu/drm/xe/xe_ras.c                   | 202 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h                   |  13 ++
>  5 files changed, 252 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>  create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>  create mode 100644 drivers/gpu/drm/xe/xe_ras.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> new file mode 100644
> index 000000000000..085cb79a6e00
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> @@ -0,0 +1,33 @@
> +What:		/sys/bus/pci/drivers/.../gpu_health
> +Date:		April 2026
> +KernelVersion:	7.0
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the current GPU health state and, for Physical
> +		Functions (PFs), allows GPU health state to be updated.
> +
> +		This sysfs file is only accessible to administrative users and is
> +		present only on Intel Xe platforms that support the GPU health
> +		indicator interface for RAS.
> +
> +		For Physical Functions (PFs), the file is read-write, while for
> +		Virtual Functions (VFs), it is read-only and does not support GPU
> +		health state updates.
> +
> +		Read return a single line containing one of the valid values for
> +		the current device health state. Only for PFs, writing one of the
> +		valid values updates the current device health state.
> +
> +		The valid values for the device health state are:
> +
> +			ok
> +				The device is healthy and operating within normal
> +				parameters.
> +
> +			warning
> +				The device is experiencing minor issues but remains
> +				operational.
> +
> +			critical
> +				The device is in a critical state and may not be
> +				operational.
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 95666f950a6f..28a09d06a44c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -112,6 +112,7 @@ xe-y += xe_bb.o \
>  	xe_pxp_debugfs.o \
>  	xe_pxp_submit.o \
>  	xe_query.o \
> +	xe_ras.o \
>  	xe_range_fence.o \
>  	xe_reg_sr.o \
>  	xe_reg_whitelist.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4b45b617a039..cb5484712f1c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -62,6 +62,7 @@
>  #include "xe_psmi.h"
>  #include "xe_pxp.h"
>  #include "xe_query.h"
> +#include "xe_ras.h"
>  #include "xe_shrinker.h"
>  #include "xe_soc_remapper.h"
>  #include "xe_survivability_mode.h"
> @@ -1067,6 +1068,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> +	xe_ras_init(xe);
> +
>  	err = xe_sriov_init_late(xe);
>  	if (err)
>  		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..25609257bd07
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/minmax.h>
> +
> +#include "xe_device.h"
> +#include "xe_device_types.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sriov.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +static const char * const gpu_health_states[] = {
> +	[XE_RAS_HEALTH_STATUS_OK]		= "ok",
> +	[XE_RAS_HEALTH_STATUS_WARNING]		= "warning",
> +	[XE_RAS_HEALTH_STATUS_CRITICAL]		= "critical"
> +};
> +
> +static const int ras_status_to_errno_map[] = {
> +	[XE_RAS_STATUS_SUCCESS]			= 0,
> +	[XE_RAS_STATUS_INVALID_PARAM]		= -EINVAL,
> +	[XE_RAS_STATUS_OP_NOT_SUPPORTED]	= -EOPNOTSUPP,
> +	[XE_RAS_STATUS_TIMEOUT]			= -ETIMEDOUT,
> +	[XE_RAS_STATUS_HARDWARE_FAILURE]	= -EIO,
> +	[XE_RAS_STATUS_INSUFFICIENT_RESOURCES]	= -ENAVAIL,
> +	[XE_RAS_STATUS_UNKNOWN_ERROR]		= -EREMOTEIO
> +};
> +
> +static int ras_status_to_errno(u32 status)
> +{
> +	status = min_t(u32, status, XE_RAS_STATUS_UNKNOWN_ERROR);
> +	return ras_status_to_errno_map[status];
> +}
> +
> +static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
> +				    u32 cmd_mask, void *request, size_t request_len,
> +				    void *response, size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr hdr = {0};
> +
> +	hdr.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		   FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
> +
> +	command->header = hdr;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
> +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_health_get_response response = {0};
> +	struct xe_ras_health_get_input request = {0};
> +	enum xe_sysctrl_mailbox_command_id cmd = XE_SYSCTRL_CMD_GET_HEALTH;
> +	enum xe_ras_health_status health;
> +	int ret;
> +	size_t rlen = 0;
> +
> +	prepare_sysctrl_command(&command, cmd, &request,
> +				sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret)
> +		return ret;
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe,
> +		       "[RAS][GET_HEALTH]: invalid Sysctrl response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EPROTO;
> +	}
> +	if (response.current_health > XE_RAS_HEALTH_STATUS_CRITICAL) {
> +		xe_err(xe, "[RAS][GET_HEALTH]: invalid health state %u from Sysctrl\n",
> +		       response.current_health);
> +		return -EPROTO;
> +	}
> +
> +	health = (enum xe_ras_health_status)response.current_health;
> +
> +	xe_dbg(xe, "[RAS][GET_HEALTH]: current GPU health state = %d (%s)\n",
> +	       health, gpu_health_states[health]);
> +
> +	return sysfs_emit(buf, "%s\n", gpu_health_states[health]);
> +}
> +
> +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_health_set_input request = {0};
> +	struct xe_ras_health_set_response response = {0};
> +	enum xe_sysctrl_mailbox_command_id cmd = XE_SYSCTRL_CMD_SET_HEALTH;
> +	enum xe_ras_health_status health;
> +	int ret;
> +	size_t rlen = 0;
> +	int state;
> +	int ras_status;
> +
> +	state = sysfs_match_string(gpu_health_states,
> +				   buf);
> +	if (state < 0)
> +		return -EINVAL;
> +
> +	request.new_health = (u8)state;
> +
> +	prepare_sysctrl_command(&command, cmd, &request,
> +				sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret)
> +		return ret;
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe,
> +		       "[RAS][SET_HEALTH]: invalid Sysctrl response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EPROTO;
> +	}
> +
> +	ras_status = ras_status_to_errno(response.operation_status);
> +	if (ras_status) {
> +		xe_err(xe,
> +		       "[RAS][SET_HEALTH]: cmd 0x%x failed: fw_status=%u errno=%pe\n",
> +		       cmd, response.operation_status, ERR_PTR(ras_status));
> +		return ras_status;
> +	}
> +
> +	if (response.current_health > XE_RAS_HEALTH_STATUS_CRITICAL) {
> +		xe_err(xe, "[RAS][SET_HEALTH]: invalid health state %u from Sysctrl\n",
> +		       response.current_health);
> +		return -EPROTO;
> +	}
> +
> +	health = (enum xe_ras_health_status)response.current_health;
> +
> +	xe_dbg(xe, "[RAS][SET_HEALTH]: current GPU health state=%d (%s)\n",
> +	       health, gpu_health_states[health]);
> +
> +	return count;
> +}
> +
> +static struct device_attribute dev_attr_gpu_health_rw =
> +	__ATTR_RW_MODE(gpu_health, 0600);
> +
> +static struct device_attribute dev_attr_gpu_health_ro =
> +	__ATTR_RO_MODE(gpu_health, 0400);
> +
> +static struct device_attribute *gpu_health_attr(struct xe_device *xe)
> +{
> +	return IS_SRIOV_VF(xe) ? &dev_attr_gpu_health_ro : &dev_attr_gpu_health_rw;
> +}
> +
> +static void gpu_health_sysfs_fini(void *arg)
> +{
> +	struct device *dev = arg;
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +
> +	device_remove_file(dev, gpu_health_attr(xe));
> +}
> +
> +static int gpu_health_indicator_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int err;
> +
> +	err = device_create_file(dev, gpu_health_attr(xe));
> +	if (err)
> +		return err;
> +
> +	err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize Xe RAS
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	ret = gpu_health_indicator_sysfs_init(xe);
> +	if (ret)
> +		xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", ret);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..14cb973603e7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_device;
> +
> +void xe_ras_init(struct xe_device *xe);
> +
> +#endif
> -- 
> 2.34.1
> 
