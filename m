Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B269CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 17:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E261410E4D6;
	Mon, 22 Sep 2025 17:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+t6NhbB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C4F10E4D8
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758562289; x=1790098289;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RKegoJTsQVnK4BzEwFIhpcf+rt9Ddk1CVlTaOFUuAsg=;
 b=B+t6NhbBiRFT1JAT0DUp6iE//bha4DW9D9+YpYyBprMEmFTsRUZoWe30
 LLMISooICBSTsEkQfjkc/rwI27mgaVVL1kRGJmgQXcFQNHYgAtI4pX0GX
 4QIki1lA28kZX7KTACLMTKljcJwL5Y4y9Y/pU3hanIp5P/cCT+azlO+aT
 ZbkSdWbusklF+uHH740TXIkcy51lVWOavho7jAnKrCQuzv/B7GTV3PRx1
 Z/OVhWjZ5Xwt3co+dpekigMtWsFgoYeMiSHSfYQbAZgkqSqYD/Ilp6PyN
 cY5o3S/XKwsRPLWBVw+QpAqOUfAH9UHBkCTunA1QXBw0Zmv1k6HEB2q57 Q==;
X-CSE-ConnectionGUID: imK/oswqQReqqvR/QLkB2w==
X-CSE-MsgGUID: 0sTOYZ3FREmXK+uDlSkH5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60887483"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="60887483"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:31:00 -0700
X-CSE-ConnectionGUID: AqHzccr0QXuj20u9wnITUA==
X-CSE-MsgGUID: kQ1u9CHsRv22kWxIXJ1zaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176105256"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:30:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:30:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 10:30:59 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:30:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tL7gwu0HiXCVouMIVKRJ2lUek5rpa+oDFKua1JigN6QURc3gGcLkptks8IRMP+e6w0MXStFtzWDND2+5k9xwskm9+JLNnz5uoBZpoFe5S/mVvDVRV2zECfwISmkRuBGS66wiZYsujM+WiYlrftYfVnZ2MggTMfidOh5WSI/HqpjG7mos4i95GA8Ex8l3eoKZ3dnLHAp3dxIbhClRoNYVh3dvFPOFnBT22mpfNvEFLeXyMpgB9MWgPQAzm7zKMLQ/MdtvEsY68ScJe6ISDc86/TVXWMCju5o0+b3OpwxbwdW6wZvwzB2EEjXQlvBpSEiaPTw+dvBAViPZtoiQUeH65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agVnsbFQv1zG8bDSEy+YV1JEgqy5dTz8hNkluzVzzUM=;
 b=jm7m33xiA6JNITD4YeZR/D2bl1Q9DtwhaXQeZ5X9P/WUf+BQ4zN/jCUy+91kBqRy1fh+dSJB+xk9BJtPYjdNDj4UflefUEAhpbWSuuWMjLBEyn4U5ECf3WkiiVh1ldTShOZxaazZdS17eBP+fVFHiAec2RcqZARauD71hQbOb1lVI0J2EZYnDYautep1CXn2BzFodkTwo6aL7TJl542e/IueZlW70pejE9oxio/eoKp78AkFZ59HH0jZMNGPZzWZPhz3ovuivD2SWSbzudtvai9yeHF33kvhb34dlVXTwg4blq10xTVaX9jnnbWfKd8V19Xsl8FfRhjodVYkgTndzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.17; Mon, 22 Sep
 2025 17:30:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:30:56 +0000
Date: Mon, 22 Sep 2025 12:30:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Correct mask and pattern check in
 lookup_engine_info
Message-ID: <rf6v73qkdzduxcctem7e4o3zs6pdoijcctbginwfkuqv3dg5gg@txogogihmmlq>
References: <20250922155544.67712-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250922155544.67712-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: e2910ac0-db3a-4287-ac98-08ddf9fdc98a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S97uW1NXsznAXbNiI6dGePl7BkLZ1vaZC0MJk5ppcNtBPW3oD6zj3lNe8EzX?=
 =?us-ascii?Q?XTy8QB4vr8qNwFB9dPzKGvE0HCd5ntFBsAHnvOkyx4ZFAThqK8mCRvpC9dln?=
 =?us-ascii?Q?IQ4QoFkmlE9XnBFtIGG2041llOhzRds3+IOpXvir5A0EWs53Ym1Yg4RtVu2U?=
 =?us-ascii?Q?ABs2eyyZSeYQYEIgo9uyXfAcDPvH4W8JoCA430gTXEV4ZG4lHpW4/KNif+Wb?=
 =?us-ascii?Q?gH8zd/ouOsHo5vnW1/Aqpl33bRVkU3xZw8zo/I9jsvYZp3G/7rTFdDlW4Hb3?=
 =?us-ascii?Q?+sYgO8+hgaqOKqfXQ66ZYjTG0NcG2UYU/3fX0Vuu7C8+Eyl4uefpi6UhejV2?=
 =?us-ascii?Q?/nEMcRh3xsH+wsvBHOgWfFDa7R8hPha5GLXi5kR/TRTGvRcBoXTKdqACyQkN?=
 =?us-ascii?Q?B9Vvxf8hO5W51f7JK41k1ZW1BIUssL32qfLpi3jUSuQsSvjZi0nGFQhwEeds?=
 =?us-ascii?Q?wIniTihi4TXoOv1mQahVi4af6c4JAXW14G9QnlfQLbxbdMboLx9nnIo5lby6?=
 =?us-ascii?Q?PmggFJKc2/UqKbUB9jkxODxNe+v6OJvu/lWNVvuiBqpASyyCJsFidhlJ5mwI?=
 =?us-ascii?Q?fnnpTnTZ8OdzGVXFvpfSHnVrp6RY5Qtya9PJCD2NHc66qbJ3+ZstQMqSwXkG?=
 =?us-ascii?Q?wXvwBKLWlYiTRY0jTCE1KJh9BfYGV/luMkH7MI+Bt6/D2aI4TQqhA0hT68X2?=
 =?us-ascii?Q?yxzC6M7XFjw5NbQE91SOWi3isP6VXfXjEeNq7WenwC4QO8McqQE7NP7sAgwS?=
 =?us-ascii?Q?RUufUasPbhHfS9Ko8FgBL4zPan/6xYxjELENigFVF95XrAHuPl20qgh4D9aN?=
 =?us-ascii?Q?1RjFN4Gbt3cZkqJGLVj69vDZGYCbHlN1/mZvt+f4eubfMOonDigXy0Lxe/3F?=
 =?us-ascii?Q?BOlY/fK/O2FHWZPCcwfxyL/2f7NFVqYUwLvsBe8h73wkHEHc4NixQkxQgm2Z?=
 =?us-ascii?Q?9zmxutMH+5WNcSB1fIAwIxW24tkWnYKN6l70Ea1dnClHu6t4OE0HF2IHGiVM?=
 =?us-ascii?Q?w43anlaW1U7zVbZ0pTUi8Yb69SGHBPIKa33T8bRx4q+lTYtb51iMOATAIlmJ?=
 =?us-ascii?Q?mjMvMvDXtNuGYvd6CnhxV69Cw9MEBsP4uBeWUdZ1Y8Y+Tq0H+Z/tKtB7PXm2?=
 =?us-ascii?Q?FwkLGoNDm/UFK854lekHlBD7t4aXOanCwodtruTvG3fmoAh/26Tc7Gavlo7H?=
 =?us-ascii?Q?Qa5RQOFIbw53/LSVx1cke76hiz4Ku6rlX1qzD08fm1Ohnd+hQLh1j2kazcXG?=
 =?us-ascii?Q?F6kGVyErfE1dku296IpA2NtQizV5m01QleLV9VxkelRz6zu7MNVcTlhsSJrT?=
 =?us-ascii?Q?/pOyETi/ZhqECaI2HU0LHlcnN1HIsO83cDxq+Q3neqYhH0rVf4RiC09Zc2DN?=
 =?us-ascii?Q?t5y3zHD7s9nQJtheYy1tRh2WGVBKfXdNS3lEI2k5JtkzFV8JmUBe3gxrxbtJ?=
 =?us-ascii?Q?BxAsSXk3JZXFbfE7FjCBNVk9kimPtzcz2VFiY+WGGXVmK0XZmXKHPA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Vdo0zb6SbyFgV+hgWjZnXAX9Bs3CSoYTuYP5xjTd9+31lQ+prMLr+zdxrKk?=
 =?us-ascii?Q?94yb1X74KfcU4exq1l+fbGPBqdzruTMoYKbsiccc1qsQdZ36+OvBENcAT1Y5?=
 =?us-ascii?Q?GBK2nmwb0/P9Ik5nE6iwYwWYS5NZ/4jQADHmsnUfxO+k3V0ZmMcfpzyo0Vj5?=
 =?us-ascii?Q?a8Qg1jJ8pxtvq3lGhM1CbIctG9+y+p158zXGIwrO4HQLGp2I6Js1OwbszbM6?=
 =?us-ascii?Q?oS2Kth27umyaxBWZcZIJ4w9QArAp5jj8N4K1dfxrQ4zaxmqUYV//TdsiA9dU?=
 =?us-ascii?Q?1O73xv5vY5grGrfp86w8LyVX347gzk9NwuHt9kIjXegT7LMkrxRIV84m5RvY?=
 =?us-ascii?Q?8YwS+sbTgActRriZ2b8I+mYE9IryUdGsz8sI+fp281N/MmsJKUr8urFbVZiF?=
 =?us-ascii?Q?Z4ziI24dk4yyU78/iIK0Gnon+NjTaA7Yn+g1FkLDH54CtFFef+/4PUc3qxsI?=
 =?us-ascii?Q?dmGbFrJrO1JTQy/Cr6aIoUZ+X8Xr/069OBvNOqDpgAU9jqYg4ebhp6czLY5W?=
 =?us-ascii?Q?f/JtK35clKuT3w7PhIHNLlvHG3t5VSY9x0qgrV7IATykRnc0oAvF75Z4u+B6?=
 =?us-ascii?Q?ajZLNaY0Opyh/tHxchIpk48rSUiYMBSWOJkg1SFceXKtCbJTfCdFWt5L1Og8?=
 =?us-ascii?Q?64HYszhHEK40Iq0wEmsrfxjlsQ4HnUSVpf9zpePsYz2GWVsInnNy/CHbfpin?=
 =?us-ascii?Q?SKj6CxIOCM5Q1ls+Qn35P9+gcS7Kt4/RkFA54vTI+JT0verXGx9waSTgouf+?=
 =?us-ascii?Q?r/JkE6OGSnhyGekutVfSClrrBMGb6hqZbQYfdyYrR1QPPnnLu8i9pWSUMf6H?=
 =?us-ascii?Q?K7WjVlY2NZkX/98dt4fNFRy7FaTh3+dILr//xOkzuRlT0xDlpIMZvAbT+YsS?=
 =?us-ascii?Q?2f6lFQLdb9llUMJiI4Mia+0V0DQP6pJAStnp0lntqazy6Z+FvE/M7FScEUrd?=
 =?us-ascii?Q?/AWXLPoJFz0gvn0RJ//ufDCmV1eE4UNoTGxo3N4vCVvQ98+bGYVfgHZTtNvJ?=
 =?us-ascii?Q?ruQfJ90POBfK5vMKl+o0IebS4Ek24GFXG6Ihr92gOcx1dVJS+LdQ4XNtQONT?=
 =?us-ascii?Q?Ef8Tw7QzefKkrOnsMp+4r1iZaVTJSekaeFWFSNoDYH8u8OOtoCQRKzuOf8wd?=
 =?us-ascii?Q?9brueX5IrBurr3YT87449WaDy+xgH+HuE8/qgihVsY+O4OGQYKVF7e5raiyy?=
 =?us-ascii?Q?JrUjT0/BvNKYe10m4/oI7CJfmVb4CIOpg+rA6jyKuSjzSlCXBlH9fH+8lGAo?=
 =?us-ascii?Q?GPplirhvAO5vNInu7qr8IaLVUQ9Uy4V0IFDZWrA/Bvo84xdThLOpGqvzpn8S?=
 =?us-ascii?Q?hasSlmANS7cUr01/23e61dI9xmPyXo1pQC5A2VS40ishDc/Fqg2puCo0kst5?=
 =?us-ascii?Q?h8vXdreDPpqvj85cNFZx/PfwF/p8yhCKrSb5MqdnVOXzzZac1yTPCBnP9PJc?=
 =?us-ascii?Q?yCZMts56Sg4f+F0TmO617kOxg5lrhK77U2x7eishs1x5ISGjKDLL6ELYGaEI?=
 =?us-ascii?Q?A3Iii9f08UZUXWV8O2gowY/3CYedBxMdCVsYU0Md3zMOnD1otyGOql8t0/vv?=
 =?us-ascii?Q?13wtZgw91RtSFC2f8HvkxhI/wrAg/OvSGcHIjAKgpxA6vT9CdkHcLSPkC4Y5?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2910ac0-db3a-4287-ac98-08ddf9fdc98a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:30:56.2645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azK5bss0AB3WsPZ+L8DUtsN9pktfJNmhJ8yIgHPR5Rj5qTKhUySDnBUHTqT+x6OcwC2HwOC+N27Fg8ihzNype3BjJJQfqFtxsNf9JvcTYDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5112
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

On Mon, Sep 22, 2025 at 03:55:44PM +0000, Jonathan Cavitt wrote:
>lookup_engine_info is described as such:
>
>"Lookup engine_info. If @mask is not NULL, reduce the mask according to
>the instance in @pattern"
>
>According to the description, we should be exiting the execution early
>if mask is NULL.  However, we appear to only do this if mask AND pattern
>are NULL, as opposed to when mask OR pattern are NULL.  Fix this.

that's not true. the condition is if mask is NULL and we are at the end
of the pattern string, i.e. *pattern is '\0'.

Passing mask as NULL means the caller is only interested in the engine
info.

	lookup_engine_info("rcs9", NULL);

we don't want this to pass neither:

	lookup_engine_info("rcs", &mask);

Lucas De Marchi

>
>Fixes: e2a9854d806e ("drm/xe/configfs: Allow to select by class only")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Raag Jadav <raag.jadav@intel.com>
>Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 8a9b950e7a6d..0c048d4a33ab 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -324,7 +324,7 @@ static const struct engine_info *lookup_engine_info(const char *pattern, u64 *ma
> 			continue;
>
> 		pattern += strlen(engine_info[i].cls);
>-		if (!mask && !*pattern)
>+		if (!mask || !*pattern)
> 			return &engine_info[i];
>
> 		if (!strcmp(pattern, "*")) {
>-- 
>2.43.0
>
