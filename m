Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B17BE8B37E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 23:47:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE8010E29A;
	Tue,  3 Feb 2026 23:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rl8N5hNC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0740E10E29A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 23:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770162474; x=1801698474;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cBlZpusb419wx6nmEvrSy3ift9sD4COpc0Qjc0doD2s=;
 b=Rl8N5hNCr4cJ5m04VCOKWlUhdtuH4L8UZzvyJKzs2C47sAB7VLIyhPOQ
 HPaT5N9ukacUXyfzt731dMTTEsrBwiph2aYrBuFZQk3Q9hQJiQZbWbZQr
 tQFJP//xBHrNMtrJBb1Ncm7gQZd3yXuerNjWff25CDgLz3Hdbb0VHULfN
 qKo8NoouCeJDQ7+WqO4k1HMR8amy8gnzmxMV5/CcgRvqzsmL6V2Ay6uVr
 P+DOp9ZFhNTfXrX7bfhiic39OoZaw/BPVbbr/39yD55zoi/b43p7I6ohz
 x57XxeEjgM0aaNwlrENbQ2JgIXWc8/a/ULjCh5iJ6W8Y9Z/G6qTfiB9SN A==;
X-CSE-ConnectionGUID: tmjr/ZrfSR215OXfdkL09Q==
X-CSE-MsgGUID: oyVH/iZ0QbGBYHX4EU20Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71066471"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="71066471"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 15:47:54 -0800
X-CSE-ConnectionGUID: Zmz1AuWXREq2fvSeTSzz1g==
X-CSE-MsgGUID: nerUYtPkS8aCrLq8mH6vXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="209102227"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 15:47:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 15:47:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 15:47:53 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.48)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 15:47:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIyiVzezwj0UEL2KLk7QQ9p9RHEH0ZJXiamROm2Jxl8kcyYHjR7aJE5vrCJJevHwrVKASftfdwC6CLr3kqq6d5HNHDqk0QdgyRraRtMrNR59tI3G/zKF7NVFgEKAjBT3SlEat1nu72fjuu5PuO8AV+T0MNO8PV65DQ/jdRLawF6k6ds/XHZUQrouO+nL+e62aXQfxy8giNbzWIRjQDlxKSjl+HN68oq2va4zKl9bNfhzAnuWrr/vU3vgtMeG6JSD03fAqrST2Cg+PwDhG675xTWLOTEN8L/BMv0t9E8fVFZxRS/qqiFwVC8RhQtTbjhp7oizSLN30AkNedpJA2EpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEUU9Y9rg3Xx4WDl+SST46TmHzuuqvgE6QcHyG3BBvI=;
 b=ROe4jb8uxGwYjNZZqrUYR/BA2FvpBHnt/YxBgtuVUzt1SNu6VdCcY9eeC7jAnYI4o+Ho3lMeoMgwoXtr4dmuOD+kRCF1AUAkw5BjtR8MAksuU/hhBLXBwim0Lnj6ubxLk5huqZKmG0pjIc7GYdu2/qgJm521u4aPfxBF6WXNiw76Ah2D9cwq70eFv1J92ho0HM/n1ziP6Sij8hZhbna+O2U1UtWloDUh6X4aYBbeUrwUEedb8RrPBOSL+TOc0IJ/AwIfE1eTtiGeeEJ0POJTa786+WM+HjJ4uYaKJXBfHMg6WS4i49vl2ANTPjyHQKpgLgsPpS3Dvzvb+SOOUZf8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7792.namprd11.prod.outlook.com (2603:10b6:208:409::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 23:47:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 23:47:50 +0000
Date: Tue, 3 Feb 2026 15:47:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/4] drm/xe: Promote struct xe_tile definition to own
 file
Message-ID: <20260203234748.GU458797@mdroper-desk1.amr.corp.intel.com>
References: <20260203211240.745-1-michal.wajdeczko@intel.com>
 <20260203211240.745-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260203211240.745-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR08CA0001.namprd08.prod.outlook.com
 (2603:10b6:a03:100::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b3b556-7f98-4aeb-8998-08de637ea40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?pzWGFYtAva1eBT8EUrjvwLRjhLJ9VOsGjVfLQwu6cc8QXz2pUeckgjqXA+?=
 =?iso-8859-1?Q?/d81rlybz1JWEqHq5mFmbAQpxIlpI7OL4bat0Xtvj7GygjOfm9OyCtWHK8?=
 =?iso-8859-1?Q?Db8lBC0Jnrmn20HkP8QYGRLOvWQPC+6Alc0p+cSLRoTob1ROIh7oEf3aTA?=
 =?iso-8859-1?Q?Qp/RZhG3Ea3HctsPx0MoTZgdUb4a8xBMi7x2PwZ0kj6hvQ/ZjFCNpax6hm?=
 =?iso-8859-1?Q?9hoi2qYRhcQPXRP9dBR2SNA7fa/c62sT9R1dHPud7cWm6CuW4gaPCCCyJY?=
 =?iso-8859-1?Q?JPN8EG4ofb46xn3booo6/ngbUbR6AnRdiNZCPNclZWJQh3NYNObM3+/KfE?=
 =?iso-8859-1?Q?QlrAWIuEYXewO5X13BF+KgtqzOxfs67FDuU3++nwi3PbfN+PXdTTLW1ymf?=
 =?iso-8859-1?Q?QlEZfuE+5GfHQdP+oFniC5/v1LNMSNcU9JOa6z66z11nfbnLujlASTWRAf?=
 =?iso-8859-1?Q?XZJBHUJ1VVdrP6NeishxHLhiXorN8Hlf0Iy+7d0944r6x2aAkV2YWok0Lz?=
 =?iso-8859-1?Q?jb5EcvkXxZEvQ2atVezxdIFpDUUDMPrFI26IhzQYNdZNt+D8r3J0/YUMue?=
 =?iso-8859-1?Q?swPWXyjCbuqkw+lSrOi9CXQ4Gp0ZI+gcagNfoh8vfnhY76UMLk8+DMt/mD?=
 =?iso-8859-1?Q?a/0lO6r67vylTTKkhIqqx0HbgTl1scZnpXvr9oedNL2Sd9F4HhSYZvCiYn?=
 =?iso-8859-1?Q?kujZMBbAH0ACNmet0ikq3DlPNDDJOH496pSyPYC/5qYpyp09RXoDom5S6i?=
 =?iso-8859-1?Q?1DJ0FhqKIsqEeCuuvz9tL9/CJtX53eaZatLvUvB2RnIBRRylPdVgLXtsLt?=
 =?iso-8859-1?Q?KjdFTGbP5GUCBHqSRv6e+xZEhv1e3Nh65CQAAI2IAjqJJI7hFpoIz0Ntp/?=
 =?iso-8859-1?Q?gzCHqsJT0bgXimFuhowuDO1X6n+Oi74fYZP9WoRQsEAahAdECg/jQRIKEv?=
 =?iso-8859-1?Q?5J60l3AcbDeRpaNfKjP9HYR/OMuCEYYh6KnYCJV5L2pTZYNxPCVsrjP41a?=
 =?iso-8859-1?Q?XgXPeEtV3s2CAb2BLY2iGr7PxkmoumfDr7kLLIVGPcL8/izuLXc3aVRgGs?=
 =?iso-8859-1?Q?mDR4e7TJuzTnqLJztszOrTvrmJMHRz934dByvU8+LFxBDER2JE8UL5xiy1?=
 =?iso-8859-1?Q?EZ2nMLoGofqibFboytciXd0xFRL+dOis3u3ZNbBwUmpnUL6RN2GrHs9uEb?=
 =?iso-8859-1?Q?xMcptCTi+/eucIbvfZg0rrXnBzs1mxMfDe8ZshywuHjEHd7+jxnleJEMjB?=
 =?iso-8859-1?Q?qSgHI2Haob4Nj5QhghJF1zhFIeujY7hXoTq2xCIR3S7K+zVCC5Rf4kY0fZ?=
 =?iso-8859-1?Q?kZdBRmzsB3Iij5OHBPFB2+hm6uNs7JmWcGGdUlYEwjgYYTn+Kcr9O23GMr?=
 =?iso-8859-1?Q?n/h0B3eLPV/qpU2sv/XoUlXb6YaZf7NjZKaTB1CjJVA5RTAuLqba0Q529J?=
 =?iso-8859-1?Q?yhxuluIEymV6EFwf8Udp1HuJ8VSlpBy+Wq4gIlGaLXAlopONSHXIIoaHTw?=
 =?iso-8859-1?Q?I0spKzc0LnH4Bu7sLUvM1HXqe6BJ011OPCaRIJPzeu7TKEBu8UuCgBmqls?=
 =?iso-8859-1?Q?a6R3X8x//xBQfNWdZCH3+Hdcn4nu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?S2zyRMo/yb1cNOpuhMUxh3pBBT/CV5dsRFBLwZwLRYHHiIzfZ7OTaF+PjI?=
 =?iso-8859-1?Q?RfM2GA0ZmWdyIwouQq1M97Gy6B8ZazRWAd6zGxwrnOlhnTc/bDHWLcqxKT?=
 =?iso-8859-1?Q?KX6brHwbQMY4X+h8ghpOo08dOhajp0g75YUl4TYi+O78XXkBXLDocQma3+?=
 =?iso-8859-1?Q?P13zHR+DeisN8F2ODyiSDOHVRzttHyJDilkUQHNvcErzz/719oSbhwBNCn?=
 =?iso-8859-1?Q?zBVL77BJeebLCV/4b/yGxY7suUApo8wTC0ez+SGMCp6QcFmoHvleDBLRv/?=
 =?iso-8859-1?Q?jYtzdjumFleQ2g8x0dQ+rJ5XU+g2+Xhiw601zPuk1GPOl9Y87EW3u/3E9q?=
 =?iso-8859-1?Q?m5p1H+yoMomzxz1X18fEzgC/tXrZe9jXsEaC1uiZ5r0BLybNckVFxr/ggO?=
 =?iso-8859-1?Q?Oph9SKPppWQHJSxDiaCRddg+PJaSc2tdWblln0xbTxAnIUaltD656dguUK?=
 =?iso-8859-1?Q?mINPF11jlTkXwSvp1sYpPRmgUesNydzGt6oRi83R5AgFOc8VcfLBrdFifE?=
 =?iso-8859-1?Q?Ij6+hODGLzfPKZh/JTJT1dcWYkJ0/YiZGaF9lc1T/wqiQnw1ofMNhXViR3?=
 =?iso-8859-1?Q?Kg5adOsxfYbwEQJlTLrC4OKle4fHQB96pkaMI+mgWk7k9fKL5fsBIrL6At?=
 =?iso-8859-1?Q?3hrbN4GWkWfLmBN3A3LnJa45gGgBxqES+H1V+iHeoDU37dJQQ1/bs7cEVk?=
 =?iso-8859-1?Q?Sm0wbpuHJfN67wfk+eMy84JSMGRWa/3BRaxVvlX7xHITrFf2QwdS225rvD?=
 =?iso-8859-1?Q?3wWnxegSL2Ped/EPwDYreiziK3cS1xRpO/nGaOHw+R60+Ch9pv+AwI+6nm?=
 =?iso-8859-1?Q?UjmKU10BRTU+h+hKPfArRdtgdXfYX6ugzga+b86s7zU35eQxsllVEPsAmK?=
 =?iso-8859-1?Q?tUDmFdL+MLH0ZeoQeeyatrHmsktj3kXMYYSX00XmHvfcq7KgGcha88oXz2?=
 =?iso-8859-1?Q?ZEMULoCE3ufW0N11vTqOOFSceAbdqS62D2wzYBt8kqYJi0nSw270KtUETj?=
 =?iso-8859-1?Q?nDG0RW+rfejdsP9s3NpkrK3oDJRDttXBYlnbXEJ74DVqSqgMRfTKfrNxbI?=
 =?iso-8859-1?Q?KG27YDGWKgvNxrijC9El1FZUBdb2cS7aXmtsE9Fint2bOF0tJaT/bKxtnX?=
 =?iso-8859-1?Q?uFjJJPmMc2aagx1afINXqpG6sSpa5nX0czbjlpXbYcRddHoawTXpE05Rnf?=
 =?iso-8859-1?Q?tYzWDtT7McksKcgJfoKoWwITrsdiQrOoKKBRe03T8VoTUf8hHqbfg977fM?=
 =?iso-8859-1?Q?sTTE7csqRlBJcmrT1yaMFPhhYVssXpVpACleqcLPrvNaGFO/I2HomU8obA?=
 =?iso-8859-1?Q?9NMMiHw2MDyA13TEjArOzSE/uotKFh7WGxalZ+NMq4gCc+gDaxjEMBhSKG?=
 =?iso-8859-1?Q?9FyDeOlmz5TkpujCJzgpPI8EDRFSabiI3wIRYNCdwU+XSJ7RTJI2QTumbx?=
 =?iso-8859-1?Q?c9dZ7V3cJXZKvJra4YTcU64Ckvgme91JJIYsEO8fuiFoGecMULNc3yL2QO?=
 =?iso-8859-1?Q?QLQpQWnYgbjPIDO/qp9KOGKuTSVj8+VdQ00ymBhTrIR0SEnB/GF7ESeDPX?=
 =?iso-8859-1?Q?g56xcC+BWwsg2TsWr2zmyqkUwzLle/RcCj+1TDLjFUt44/Bdqo0XJ4A3i2?=
 =?iso-8859-1?Q?wX1NVSazIcFRCpbaza8s3Pk+740y3PjS995sbGmFJs79ow4slxVX1IMg+J?=
 =?iso-8859-1?Q?PRiyS8+WBnjPKTw2+R9JjSCmWhtXfGPNa6p0xOioxOlvgcbxP/dGusxnTM?=
 =?iso-8859-1?Q?dICi16VSJlHKKktVUSVwP6VL3az/3CSE5LS7hg9RoCr0IZswm+BcZbb4eQ?=
 =?iso-8859-1?Q?psfjo5ouANDiXiwKwCxnQwr90Yp10Jg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b3b556-7f98-4aeb-8998-08de637ea40d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 23:47:50.3894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /53xkfLI3si786r3auZ9dcXhMPYA2jOD4/lLp1pjvEgsbDw1pnsvDuFJVInC7QBGIW4Hd+BES16FFaWYpaVPrstu7hDF4h7V95AwPL9P6qM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7792
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

On Tue, Feb 03, 2026 at 10:12:38PM +0100, Michal Wajdeczko wrote:
> We already have separate .c and .h files for xe_tile functions,
> time to introduce _types.h to follow what other components do.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> v1: https://patchwork.freedesktop.org/patch/656886/?series=149807&rev=1
> v2: rebased, xe_vram_region already moved
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 129 +-----------------------
>  drivers/gpu/drm/xe/xe_tile_types.h   | 141 +++++++++++++++++++++++++++
>  2 files changed, 142 insertions(+), 128 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2ea931c1550a..14bf2c027f89 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -15,10 +15,6 @@
>  #include "xe_devcoredump_types.h"
>  #include "xe_heci_gsc.h"
>  #include "xe_late_bind_fw_types.h"
> -#include "xe_lmtt_types.h"
> -#include "xe_memirq_types.h"
> -#include "xe_mert.h"
> -#include "xe_mmio_types.h"
>  #include "xe_oa_types.h"
>  #include "xe_pagefault_types.h"
>  #include "xe_platform_types.h"
> @@ -30,7 +26,7 @@
>  #include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
> -#include "xe_tile_sriov_vf_types.h"
> +#include "xe_tile_types.h"
>  #include "xe_validation.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> @@ -96,129 +92,6 @@ enum xe_wedged_mode {
>  	 (_xe)->info.step.graphics >= (min_step) &&			\
>  	 (_xe)->info.step.graphics < (max_step))
>  
> -#define tile_to_xe(tile__)								\
> -	_Generic(tile__,								\
> -		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
> -		 struct xe_tile * : (tile__)->xe)
> -
> -/**
> - * struct xe_tile - hardware tile structure
> - *
> - * From a driver perspective, a "tile" is effectively a complete GPU, containing
> - * an SGunit, 1-2 GTs, and (for discrete platforms) VRAM.
> - *
> - * Multi-tile platforms effectively bundle multiple GPUs behind a single PCI
> - * device and designate one "root" tile as being responsible for external PCI
> - * communication.  PCI BAR0 exposes the GGTT and MMIO register space for each
> - * tile in a stacked layout, and PCI BAR2 exposes the local memory associated
> - * with each tile similarly.  Device-wide interrupts can be enabled/disabled
> - * at the root tile, and the MSTR_TILE_INTR register will report which tiles
> - * have interrupts that need servicing.
> - */
> -struct xe_tile {
> -	/** @xe: Backpointer to tile's PCI device */
> -	struct xe_device *xe;
> -
> -	/** @id: ID of the tile */
> -	u8 id;
> -
> -	/**
> -	 * @primary_gt: Primary GT
> -	 */
> -	struct xe_gt *primary_gt;
> -
> -	/**
> -	 * @media_gt: Media GT
> -	 *
> -	 * Only present on devices with media version >= 13.
> -	 */
> -	struct xe_gt *media_gt;
> -
> -	/**
> -	 * @mmio: MMIO info for a tile.
> -	 *
> -	 * Each tile has its own 16MB space in BAR0, laid out as:
> -	 * * 0-4MB: registers
> -	 * * 4MB-8MB: reserved
> -	 * * 8MB-16MB: global GTT
> -	 */
> -	struct xe_mmio mmio;
> -
> -	/** @mem: memory management info for tile */
> -	struct {
> -		/**
> -		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
> -		 *
> -		 * Although VRAM is associated with a specific tile, it can
> -		 * still be accessed by all tiles' GTs.
> -		 */
> -		struct xe_vram_region *kernel_vram;
> -
> -		/**
> -		 * @mem.vram: general purpose VRAM info for tile.
> -		 *
> -		 * Although VRAM is associated with a specific tile, it can
> -		 * still be accessed by all tiles' GTs.
> -		 */
> -		struct xe_vram_region *vram;
> -
> -		/** @mem.ggtt: Global graphics translation table */
> -		struct xe_ggtt *ggtt;
> -
> -		/**
> -		 * @mem.kernel_bb_pool: Pool from which batchbuffers are allocated.
> -		 *
> -		 * Media GT shares a pool with its primary GT.
> -		 */
> -		struct xe_sa_manager *kernel_bb_pool;
> -
> -		/**
> -		 * @mem.reclaim_pool: Pool for PRLs allocated.
> -		 *
> -		 * Only main GT has page reclaim list allocations.
> -		 */
> -		struct xe_sa_manager *reclaim_pool;
> -	} mem;
> -
> -	/** @sriov: tile level virtualization data */
> -	union {
> -		struct {
> -			/** @sriov.pf.lmtt: Local Memory Translation Table. */
> -			struct xe_lmtt lmtt;
> -		} pf;
> -		struct {
> -			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> -			struct xe_ggtt_node *ggtt_balloon[2];
> -			/** @sriov.vf.self_config: VF configuration data */
> -			struct xe_tile_sriov_vf_selfconfig self_config;
> -		} vf;
> -	} sriov;
> -
> -	/** @memirq: Memory Based Interrupts. */
> -	struct xe_memirq memirq;
> -
> -	/** @csc_hw_error_work: worker to report CSC HW errors */
> -	struct work_struct csc_hw_error_work;
> -
> -	/** @pcode: tile's PCODE */
> -	struct {
> -		/** @pcode.lock: protecting tile's PCODE mailbox data */
> -		struct mutex lock;
> -	} pcode;
> -
> -	/** @migrate: Migration helper for vram blits and clearing */
> -	struct xe_migrate *migrate;
> -
> -	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
> -	struct kobject *sysfs;
> -
> -	/** @debugfs: debugfs directory associated with this tile */
> -	struct dentry *debugfs;
> -
> -	/** @mert: MERT-related data */
> -	struct xe_mert mert;
> -};
> -
>  /**
>   * struct xe_device - Top level struct of Xe device
>   */
> diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
> new file mode 100644
> index 000000000000..33932fd547d7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_types.h
> @@ -0,0 +1,141 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022-2026 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_TYPES_H_
> +#define _XE_TILE_TYPES_H_
> +
> +#include <linux/mutex_types.h>
> +#include <linux/workqueue_types.h>
> +
> +#include "xe_lmtt_types.h"
> +#include "xe_memirq_types.h"
> +#include "xe_mert.h"
> +#include "xe_mmio_types.h"
> +#include "xe_tile_sriov_vf_types.h"
> +
> +#define tile_to_xe(tile__)								\
> +	_Generic(tile__,								\
> +		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
> +		 struct xe_tile * : (tile__)->xe)
> +
> +/**
> + * struct xe_tile - hardware tile structure
> + *
> + * From a driver perspective, a "tile" is effectively a complete GPU, containing
> + * an SGunit, 1-2 GTs, and (for discrete platforms) VRAM.
> + *
> + * Multi-tile platforms effectively bundle multiple GPUs behind a single PCI
> + * device and designate one "root" tile as being responsible for external PCI
> + * communication.  PCI BAR0 exposes the GGTT and MMIO register space for each
> + * tile in a stacked layout, and PCI BAR2 exposes the local memory associated
> + * with each tile similarly.  Device-wide interrupts can be enabled/disabled
> + * at the root tile, and the MSTR_TILE_INTR register will report which tiles
> + * have interrupts that need servicing.
> + */
> +struct xe_tile {
> +	/** @xe: Backpointer to tile's PCI device */
> +	struct xe_device *xe;
> +
> +	/** @id: ID of the tile */
> +	u8 id;
> +
> +	/**
> +	 * @primary_gt: Primary GT
> +	 */
> +	struct xe_gt *primary_gt;
> +
> +	/**
> +	 * @media_gt: Media GT
> +	 *
> +	 * Only present on devices with media version >= 13.
> +	 */
> +	struct xe_gt *media_gt;
> +
> +	/**
> +	 * @mmio: MMIO info for a tile.
> +	 *
> +	 * Each tile has its own 16MB space in BAR0, laid out as:
> +	 * * 0-4MB: registers
> +	 * * 4MB-8MB: reserved
> +	 * * 8MB-16MB: global GTT
> +	 */
> +	struct xe_mmio mmio;
> +
> +	/** @mem: memory management info for tile */
> +	struct {
> +		/**
> +		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
> +		 *
> +		 * Although VRAM is associated with a specific tile, it can
> +		 * still be accessed by all tiles' GTs.
> +		 */
> +		struct xe_vram_region *kernel_vram;
> +
> +		/**
> +		 * @mem.vram: general purpose VRAM info for tile.
> +		 *
> +		 * Although VRAM is associated with a specific tile, it can
> +		 * still be accessed by all tiles' GTs.
> +		 */
> +		struct xe_vram_region *vram;
> +
> +		/** @mem.ggtt: Global graphics translation table */
> +		struct xe_ggtt *ggtt;
> +
> +		/**
> +		 * @mem.kernel_bb_pool: Pool from which batchbuffers are allocated.
> +		 *
> +		 * Media GT shares a pool with its primary GT.
> +		 */
> +		struct xe_sa_manager *kernel_bb_pool;
> +
> +		/**
> +		 * @mem.reclaim_pool: Pool for PRLs allocated.
> +		 *
> +		 * Only main GT has page reclaim list allocations.
> +		 */
> +		struct xe_sa_manager *reclaim_pool;
> +	} mem;
> +
> +	/** @sriov: tile level virtualization data */
> +	union {
> +		struct {
> +			/** @sriov.pf.lmtt: Local Memory Translation Table. */
> +			struct xe_lmtt lmtt;
> +		} pf;
> +		struct {
> +			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> +			struct xe_ggtt_node *ggtt_balloon[2];
> +			/** @sriov.vf.self_config: VF configuration data */
> +			struct xe_tile_sriov_vf_selfconfig self_config;
> +		} vf;
> +	} sriov;
> +
> +	/** @memirq: Memory Based Interrupts. */
> +	struct xe_memirq memirq;
> +
> +	/** @csc_hw_error_work: worker to report CSC HW errors */
> +	struct work_struct csc_hw_error_work;
> +
> +	/** @pcode: tile's PCODE */
> +	struct {
> +		/** @pcode.lock: protecting tile's PCODE mailbox data */
> +		struct mutex lock;
> +	} pcode;
> +
> +	/** @migrate: Migration helper for vram blits and clearing */
> +	struct xe_migrate *migrate;
> +
> +	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
> +	struct kobject *sysfs;
> +
> +	/** @debugfs: debugfs directory associated with this tile */
> +	struct dentry *debugfs;
> +
> +	/** @mert: MERT-related data */
> +	struct xe_mert mert;
> +};
> +
> +#endif
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
