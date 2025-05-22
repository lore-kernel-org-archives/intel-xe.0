Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBFCC54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 15:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE7010E83A;
	Thu, 22 May 2025 15:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jX47bdfG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF0F10EA7D
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 15:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747927645; x=1779463645;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n+0GZIZxfY8hVp6KEUqHraOY2nj8hOP6nZtE7x00pB4=;
 b=jX47bdfG6IgQxy1z65It3CIMB56dFr4sGh8tIXshyrPuV48mE0uP1UxH
 oytH7lwTzUEJ/AhRwPj1QI0qd0hdmNAczTxOVgJ0o8wBxwsMDR//KvoHF
 Kbd30lHoWUnYIcBkfUObTGd9GpbDqnps79M0VAGHeRqB4aKWE4JS/cLNl
 7ifiHuo7Dwy/1QbqbmW9P/NIZ1Y4iuLPz19Av+TpQ44WNTiIXUV28Fqrr
 TeIenvRZzEX1s4SyikyRDXMdEbrKKU3c3O3mnbxDQw8ZA07jPLf1QLBKu
 MX0A0SJ1vrXASGRQhyZcoZlZL1ZY3KbRlBy5PuNH8INllRl8hGGWJceAn Q==;
X-CSE-ConnectionGUID: R1ej4ycVRzacZq0dFZaNGQ==
X-CSE-MsgGUID: k7kWsCt+TJSCkZ2bDCbTnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53624943"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="53624943"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 08:27:21 -0700
X-CSE-ConnectionGUID: Dn42ee+TRku1vvmBDPt6IQ==
X-CSE-MsgGUID: rXGgmF7qT2WXZQ27mGxorw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="144610507"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 08:27:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 08:27:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 08:27:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 08:27:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVXegcLb+TGgejvSIoGk3u6+y7Yg/+vgCmtUC4gXMZK1VYAZMNR3Bv4U2jSF24slhGvIQRGX1FbqNF0rPp/DPT6WMGzuAYeseMqmq2tpsVjTW5hKL0xHXGJ2AwgW/9yvMxCtnwZXu87p5cMm1T3JA20vhWm+0OkxRGh/fUEpLxzYIjjqUgO3KpYFUnhjCvEq/eEOy0e3X0+Tu9wV+ST9jUQWdlRr6+auLVaZm0+xVnI+Rndj/mbHXkIWpsHqBnzVQpVLFXxJxg6UvoXBXsgsNKWWmobjHfFV2Cn6Iw5MNNHgxLX8FrGgWyliXqUKoeqKGfme4ZyTRkeOFG5k/fcqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hP+9EW9J0KcJJ6D/6rbzb0TcUBHcBhgj281dya7eBk0=;
 b=Ez3GfcZrjxBOwF1WsVYpKm7+ZXnABwn/ClJFJJgvcCzhu6H+XkzRudlMxp1yzvn4RiTNhgC5PEkM6A2qx17e+ndWUEsdRzKxAEGdrkHH3EXLPN1pHe/2rUs+ZuBDUqX+4zaAmLRF9VnYXvj1iFVkqwJ2gj4ijTB97eEtx5C6YEPCHfFKMqU52iIqyk0jK3SCniS4ncEzue7QAIGwSJRm2f2vHs0n8bZKjWx7+GylwYZyV2Xndktot31SWQO3RVZHgzGsEB4BcGd4T/hwdffG8OUFWzmNEnPf01fAk+AMcUFo7MkmJYQ1ZiX6ni2jlOEMQBl1v2R62apsq9BH3uYKSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6996.namprd11.prod.outlook.com (2603:10b6:806:2af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 22 May
 2025 15:27:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8746.029; Thu, 22 May 2025
 15:27:17 +0000
Date: Thu, 22 May 2025 10:27:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe: Add configfs to load with fewer engines
Message-ID: <4hwiqrobszgyw43jhwzum5amdajbi22qvdmbzqy7jeykjgkcmt@dhag2pnhyjca>
References: <20250520-engine-mask-v2-1-46e76f935b35@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520-engine-mask-v2-1-46e76f935b35@intel.com>
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f969cd0-0055-40b3-cadf-08dd994522c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HzAog2vHK1ftAqYRsG8eTsQ/EWdgomZpPJrpj5g+uLxKFo3SGaijuzTESD?=
 =?iso-8859-1?Q?T3kz+AK0z9mRGa/PEspnWvG2fFWoefjGsfEXsL68hs5fz58CfK6JMFkLRy?=
 =?iso-8859-1?Q?3pryMV1/as2bK+EFORNHEVQ2QIK+gy/Eh91ER7uMwEdqz9EG+9t9VhYxJr?=
 =?iso-8859-1?Q?jLoYvlRPgrHUdGxac8wENI5d3YFh17ymvpYrG4h4/oR3Rl+pvMWZYyTvIy?=
 =?iso-8859-1?Q?5EoSGvakwjUqKvIx3aZhL+IrmGhn8U64YYlyAPHA46jTMWOTnKOHy0Uxp9?=
 =?iso-8859-1?Q?ACVF7k5Q9m9p0msRZ6M2tRfl3Rh1VoE1YqzuOiF0oS7SOoXoe2RD1g60sN?=
 =?iso-8859-1?Q?P6loLydEPIGIPvGlkylJ4t0HinoqfBUsliOWtRTLGto2j0UcVBSXGGTPja?=
 =?iso-8859-1?Q?gcwUdnqzUy2zdGmmXVvWI865rmjdnkQ5CYikUqB2Vvme4KjkhYE70CJAn5?=
 =?iso-8859-1?Q?TTpqR6sE0g3YuOgelakbpp59r+j/d07DlQk/QeAL0PCa3ACcRP3zr8n8XL?=
 =?iso-8859-1?Q?mwP0PKjdH1gHT8CDDRu8xz9TVLE8uW+kbaVhNJuu4iMxe88gcrS2bCPeLE?=
 =?iso-8859-1?Q?YH1zlj8Z+Wk9cfz9aErpFU6q9aT1DdA4Ivul5vWhkvhsY19GfJ4Kw4ZgRs?=
 =?iso-8859-1?Q?T/+N4aRcUi8evcHARi50sGJy/L7vy/pYWDf69NJZ57SQDu7FIEyRtTKqPK?=
 =?iso-8859-1?Q?6zqOgikYTMh9a5Ea/et9RHRulluM3nnfZ1Inbpcw+slainnytqebDa0gyr?=
 =?iso-8859-1?Q?8pRXVZTAMnB6lOQmOQAARJS/q6GBYdNe/OM1Eat1XRJkjxaQKLh6MSm2d0?=
 =?iso-8859-1?Q?nuJDrLrQWjqNb+urtrltepIYMKuSyPG2GUa+rFFQlrVP0pqnrBcO7fSUrD?=
 =?iso-8859-1?Q?E0mPVT/i1p2RcF6e3y2I7VoAwfILwh0oN+2vAjtRnpG5Q9OxF67MBG4JUr?=
 =?iso-8859-1?Q?LpgyOgfn4J+bLnGT9Vm8b5K2s8Z5mpKma28GosvQV/7A9nq2rtLcQvn+6U?=
 =?iso-8859-1?Q?VdxmYXHarpj+T2JMV8n8B6N0aeFpcOh7QPyXyiMCDBPHMuLgpvQTFPcCH/?=
 =?iso-8859-1?Q?qNZT7qhx1Z1nT/wy3eKCMBHf6fNzTtBavA38Zs7qL+8BX+eu1RIio9cH7/?=
 =?iso-8859-1?Q?Yk3/B9j5mjOzHuaF+fbP/DuX7uKh+b+z58SpvUzNUjg8ezgwF3Y1GCho1+?=
 =?iso-8859-1?Q?BQzSZlfGbRw0BemvdomhFmJjqr9Ojv/4ukKTJQZaylaOZuIsMOknd3S6zr?=
 =?iso-8859-1?Q?pPI6DV4H1rTGupOuXJIhEGfpu4JcD9K9JGrW/pMiGTUrJTBdPNR/hRhIpg?=
 =?iso-8859-1?Q?tgJfMAE2KWZixjHgGzwCt9xHLfwNlF49JMO9svY9WmBizfrE4zl4Q2rD55?=
 =?iso-8859-1?Q?SqipwqfKb44svBtkKrDGjrkN6PB73gMnonwWxLCFp44JzPnRU3duhvlUEb?=
 =?iso-8859-1?Q?kU4Q+jgYFa2Jnorl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HZvU3zOqdCQB1Ya/Q5VkplLF4BRenDueUvIvBn3dNzFiSF5vDPRGhvwWkD?=
 =?iso-8859-1?Q?hyYe21rV2yQ22QGdcEu6U5LFivwA+Aycl2JgjYIHFRtWEUvZ7GEp0DNVeH?=
 =?iso-8859-1?Q?n5qtDMYMjLVZt3n/66ijGrYQ2AyMcOVwT3XLVWWIPvdA2HxQVreB9H6Gx5?=
 =?iso-8859-1?Q?ZDP50X6nsSVNRCLDTeFiSOVgNHiepYOWnIjd4VlJF9GhGnOf4iZTTylMmH?=
 =?iso-8859-1?Q?IVcYicb5uCeqIOfyjMduW2v9RAFUx5XKWcuQko/A0waKhwrzfsYixnvZe8?=
 =?iso-8859-1?Q?s9PtUfkgc+sE64aCIcFMAPffOPmG9ZDCe+OCRR/kxapcpqy5w4dmQ56LU6?=
 =?iso-8859-1?Q?xC9W7CaMhnYAQx6P8pWLqSHI/3MJRQSNzwAz01c58KKoAZp4g+QpEix41v?=
 =?iso-8859-1?Q?ZQwNYsPXH6r+H43GOvkuJ4p9Xi+Ph0+KlrKeowlAlRTGm1GS0O6CqAUSku?=
 =?iso-8859-1?Q?ojUaKrLoSOK7oE/yQJf+Q3298vBrUzECiUGaCWwRs0voR+t1+JBd3tGeLm?=
 =?iso-8859-1?Q?CIZojmtgBaX1xJ3LImkKcYkroaeIcoNQExvQ73QNSRo4NCiVyV1VVuV+Yz?=
 =?iso-8859-1?Q?BihnSCthKoWoR5lZkKEkus+ckLIRu8/ISUTzvtU496xN3juEAtDBrDzWxj?=
 =?iso-8859-1?Q?9RSIOVm3sh5TmE8k7ecmdvIgIz5qksBjedYdAGefSmrWVUxJoaA15R5ijK?=
 =?iso-8859-1?Q?DzyXm1GMKvr92mrIo1dQzkd5f6vD/l85xFrDRwO/HdlaPeMPwiuj+ATBGi?=
 =?iso-8859-1?Q?lC4pXgHkf5JPVuvzSG7TcKgiWnb48VFPOgsVgFbsWN29qMRCQ3F9dBdH8c?=
 =?iso-8859-1?Q?OvO3LiIAVsUBD0tlejbSbnRMfh6mvZEmLnm2sIGozvxlGEFs3fGhR0Jj0o?=
 =?iso-8859-1?Q?ZIJh9gngO+bsQb1rYCjmn7R0c9XTpZe0WdL2KjNMn8rPZaczmD07ejn9kx?=
 =?iso-8859-1?Q?JmpYKDPuBRbtlpZcYbykHmta7UhbKbtefYDoTaEkTvnte0LyiB9LQ2ntPi?=
 =?iso-8859-1?Q?UQHYGbkRBdBjC8uqz68/RbufbAwT5hY9Rehjgprqjz1H7D6IY0C8c0Jnpy?=
 =?iso-8859-1?Q?ve+WKQfv1Gwml0+nrZoVBrglys/Ip6xixE2z3iAm8WRRg0pEJ7E5kreNYy?=
 =?iso-8859-1?Q?HzoEW8jFv+EQlpaQfD/UBxFVTH9QiRHvrrWPuVwhdlGDBiOjAlXzWlgc6+?=
 =?iso-8859-1?Q?yDne410zAgDaiU0Ci0/EeN7l/sXvBNJMVVCUHJ6qjpYHn4I9Bw1FtO6vE/?=
 =?iso-8859-1?Q?W+itDVc59Qz2mqjQxBn0CNThe7wPV8F68NQflJPe1MxXDxG4vs2QnjBULb?=
 =?iso-8859-1?Q?T7ZsWCoszobusXlcvpiDDXuH2GrWxGuyepfeUi40OOOIgZOC9xlaAX9lbm?=
 =?iso-8859-1?Q?2XR5B0AypmQT1omyNiYYG1IXF//xJwhObz1SwL0UetBYUJ1wATdMfMec5C?=
 =?iso-8859-1?Q?W/xIecp2QZio+qtxwD4kW4q0XSy30BsBUBxBBcADdDnaKE4ROzirw+Y/z9?=
 =?iso-8859-1?Q?V2s4OGXlNAYdYobFgaTd/TeSRw6NmumNeAGJ34QkTx88bAyyJaqOGLZm/m?=
 =?iso-8859-1?Q?UFwK1NlGnDSa+stPJh//zMkRkudOvm0WzPo+lvnd1fH3+mNC5Vy8wsdTWU?=
 =?iso-8859-1?Q?AMHIbJK5bsw3EV27RdF8hjmXKJt1Y0b2/2y+patirs47PQRUCux9Jg1Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f969cd0-0055-40b3-cadf-08dd994522c3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 15:27:17.3906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UeSkwnIoRd1tja1+OgfCdJvQ2MRFSdlKt0/6IwKJ8yRF4QsWiR4Of4Nw+v2RPBLrJSVEok0+ZceXk5jCsW+nVo+JS/mGEFgLJmYzQ3INtQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6996
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

On Tue, May 20, 2025 at 02:28:58PM -0700, Lucas De Marchi wrote:
>Sometimes it's useful to load the driver with a smaller set of engines
>to allow more targeted debugging, particularly on early enabling. Add a
>file in configfs that allows enable only a set of engines.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>Changes in v2:
>- Fix build with CONFIG_CONFIGFS_FS=n
>- Link to v1: https://lore.kernel.org/r/20250520-engine-mask-v1-1-ce6daf16d23b@intel.com
>---
> drivers/gpu/drm/xe/xe_configfs.c  | 133 ++++++++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h  |   2 +
> drivers/gpu/drm/xe/xe_hw_engine.c |  20 ++++++
> 3 files changed, 155 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index cb9f175c89a1c..fb433503501c8 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -3,14 +3,18 @@
>  * Copyright © 2025 Intel Corporation
>  */
>
>+#include <linux/bitops.h>
> #include <linux/configfs.h>
> #include <linux/init.h>
> #include <linux/module.h>
> #include <linux/pci.h>
>+#include <linux/string.h>
>
> #include "xe_configfs.h"
> #include "xe_module.h"
>
>+#include "xe_hw_engine_types.h"
>+
> /**
>  * DOC: Xe Configfs
>  *
>@@ -48,6 +52,23 @@
>  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>  *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
>  *
>+ * Allowed engine:
>+ * ---------------
>+ *
>+ * Allow only a set of engine(s) to be available - this is the equivalent of
>+ * fusing engines off in software. Examples:
>+ *
>+ * Allow only one render and one copy engines, nothing else::
>+ *
>+ *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
>+ *
>+ * Allow only compute engines and first copy engine::
>+ *
>+ *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
>+ *
>+ * The requested configuration may not be supported by the platform and driver
>+ * may fail to probe - intended for debugging purposes.
>+ *
>  * Remove devices
>  * ==============
>  *
>@@ -60,6 +81,7 @@ struct xe_config_device {
> 	struct config_group group;
>
> 	bool survivability_mode;
>+	u64 engine_allowed;
>
> 	/* protects attributes */
> 	struct mutex lock;
>@@ -94,10 +116,95 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
> 	return len;
> }
>
>+static ssize_t engine_allowed_show(struct config_item *item, char *page)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+
>+	return sprintf(page, "%#llx\n", dev->engine_allowed);
>+}
>+
>+static bool lookup_engine_mask(const char *name, size_t namelen, u64 *mask)
>+{
>+	static const struct  {
>+		const char *cls;
>+		u64 mask;
>+	} map[] = {
>+		{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
>+		{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
>+		{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
>+		{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
>+		{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
>+	};
>+	size_t i;

I have another wip patch on top that benefits on moving this outside the
function and making it a generally useful lookup engine/class lookup.
So, I'm squashing the change and will be on my v3. Currently I'm on the
the fence on even moving it to xe_hw_engine.

Other than that, the rest of the patch is still good for a first review.

Thanks
Lucas De Marchi

>+
>+	for (i = 0; i < ARRAY_SIZE(map); i++) {
>+		size_t clslen = strlen(map[i].cls);
>+		size_t numlen = namelen - clslen;
>+		char instancestr[4];
>+		u8 instance;
>+
>+		if (namelen < clslen + 1 || strncmp(name, map[i].cls, clslen))
>+			continue;
>+
>+		if (name[clslen] == '*' && numlen == 1) {
>+			*mask = map[i].mask;
>+			return true;
>+		}
>+
>+		if (numlen > sizeof(instancestr) - 1)
>+			return false;
>+
>+		memcpy(instancestr, name + clslen, numlen);
>+		instancestr[numlen] = '\0';
>+
>+		if (!kstrtou8(instancestr, 10, &instance)) {
>+			u16 bit = __ffs64(map[i].mask) + instance;
>+			u64 val;
>+
>+			if (bit > sizeof(val) * BITS_PER_BYTE)
>+				return false;
>+
>+			val = BIT_ULL(bit);
>+			if ((val | map[i].mask) == map[i].mask) {
>+				*mask = val;
>+				return true;
>+			}
>+		}
>+
>+		return false;
>+	}
>+
>+	return false;
>+}
>+
>+static ssize_t engine_allowed_store(struct config_item *item, const char *page,
>+				    size_t len)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+	size_t namelen, p;
>+	u64 mask, val = 0;
>+
>+	for (p = 0; p < len; p += namelen + 1) {
>+		namelen = strcspn(page + p, ",\n");
>+		if (!lookup_engine_mask(page + p, namelen, &mask))
>+			return -EINVAL;
>+
>+		val |= mask;
>+	}
>+
>+	mutex_lock(&dev->lock);
>+	dev->engine_allowed = val;
>+	mutex_unlock(&dev->lock);
>+
>+	return len;
>+}
>+
> CONFIGFS_ATTR(, survivability_mode);
>+CONFIGFS_ATTR(, engine_allowed);
>
> static struct configfs_attribute *xe_config_device_attrs[] = {
> 	&attr_survivability_mode,
>+	&attr_engine_allowed,
> 	NULL,
> };
>
>@@ -139,6 +246,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> 	if (!dev)
> 		return ERR_PTR(-ENOMEM);
>
>+	/* Default values */
>+	dev->engine_allowed = U64_MAX;
>+
> 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>
> 	mutex_init(&dev->lock);
>@@ -226,6 +336,29 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
> 	config_item_put(&dev->group.cg_item);
> }
>
>+/**
>+ * xe_configfs_get_engine_allowed - get engine allowed mask from configfs
>+ * @pdev: pci device
>+ *
>+ * Find the configfs group that belongs to the pci device and return
>+ * the mask of engines allowed to be used.
>+ *
>+ * Return: engine mask with allowed engines
>+ */
>+u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
>+{
>+	struct xe_config_device *dev = configfs_find_group(pdev);
>+	u64 engine_allowed;
>+
>+	if (!dev)
>+		return U64_MAX;
>+
>+	engine_allowed = dev->engine_allowed;
>+	config_item_put(&dev->group.cg_item);
>+
>+	return engine_allowed;
>+}
>+
> int __init xe_configfs_init(void)
> {
> 	struct config_group *root = &xe_configfs.su_group;
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>index d7d041ec26117..c80131f994a71 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.h
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -14,11 +14,13 @@ int xe_configfs_init(void);
> void xe_configfs_exit(void);
> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>+u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev);
> #else
> static inline int xe_configfs_init(void) { return 0; };
> static inline void xe_configfs_exit(void) {};
> static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; };
> static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) {};
>+static inline u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev) { return U64_MAX; }
> #endif
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 93241fd0a4ba3..af750ed8c0f00 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -17,6 +17,7 @@
> #include "regs/xe_irq_regs.h"
> #include "xe_assert.h"
> #include "xe_bo.h"
>+#include "xe_configfs.h"
> #include "xe_device.h"
> #include "xe_execlist.h"
> #include "xe_force_wake.h"
>@@ -810,6 +811,24 @@ static void check_gsc_availability(struct xe_gt *gt)
> 	}
> }
>
>+static void check_sw_fuses(struct xe_gt *gt)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+	u64 sw_allowed = xe_configfs_get_engine_allowed(to_pci_dev(xe->drm.dev));
>+	enum xe_hw_engine_id id;
>+
>+	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
>+		if (!(gt->info.engine_mask & BIT(id)))
>+			continue;
>+
>+		if (!(sw_allowed & BIT(id))) {
>+			gt->info.engine_mask &= ~BIT(id);
>+			drm_info(&xe->drm, "%s fused off (in sw)\n",
>+				 engine_infos[id].name);
>+		}
>+	}
>+}
>+
> int xe_hw_engines_init_early(struct xe_gt *gt)
> {
> 	int i;
>@@ -818,6 +837,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
> 	read_copy_fuses(gt);
> 	read_compute_fuses(gt);
> 	check_gsc_availability(gt);
>+	check_sw_fuses(gt);
>
> 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
> 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>
>
>
