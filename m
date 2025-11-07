Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17F8CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 11:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB3210EAAC;
	Fri,  7 Nov 2025 11:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ndy158GJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EDE10EAB8
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 11:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762516591; x=1794052591;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j15sr/WZG0gV1rQpX0lRv66aub+SXFDEifc5ynUVRSI=;
 b=Ndy158GJiKAumT/izJluOY62UzYrPcWiTDXcGBYIMOYhsIg22yY5YfLA
 zLOXyZa+SE9tywkEpr9nQFtmiNn9zAR6BTLw7U8pPr0SRmkCSrjbGHRzf
 CncVyxuHvZFsT+jV5igl1yoC4ovoOl9tgLJOapjCSqu02OMo3SwvFNW/M
 lCIZkV8DTQRx6tfcLRkj6d4tZXxtmTVZ3SJkXUgZvUzt4UY2vE6a5QXt/
 0QeinLUflZzJoj2yNgc2dSAk+3QK6+/hpsUW02LT3eA4T/FYdV5CH2VFQ
 sMu1DxfHtP9DaNY+dD6n2lDPHocjV8qeUQn8AjCH2AyT36rujTjr7eXZ3 w==;
X-CSE-ConnectionGUID: yR/BD33gRYOehtbwzXjXkA==
X-CSE-MsgGUID: GEYvCj5gSvyp4kTeXPodRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="74958924"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="74958924"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:56:30 -0800
X-CSE-ConnectionGUID: j8MHST/jQFK4omJaFYdD4g==
X-CSE-MsgGUID: eKInNm2ZQf6zIqVhjkBEqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="187676943"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:56:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 03:56:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 03:56:29 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 03:56:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNAU2XvS1Q7mo/G8SRj0VnxxuQwiOWotWILGMhqzZfRfpu4jOgaRnkRbZf3WiR2SmAdQJ1U3PBh4nxnI8H7YSQtq6V6iVKdNkicB80HksLNPa9DVxB2UjXDgdUcmcpbGEkiB0iUJI94LZ377qMpMqfTcNiL1jFMkJcSJ8Cb5wckLOCAhRS3S5NA+rLRpb/YyotO457t4sdvny7yW9VXYRE2sxcoLVkrpMoPzbDpSHGyd6t+1u/HuGymFKOD/Ntak/p8+0dnW+MzyjIkkRW7cQ3YrtiPgsEOQQAtGnNLgxlEXMBsiHJ825EJDs+YDMCnzqOKBj7NYHgn9otvibotF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBl8DKpdEpNkbCdp13UxlWUL0KvqcJaskOWhDQlz43g=;
 b=ESfZEEcoXyA+zkhSpqxYmv0nrj9NgQfSjlsXndCCqUhpYERaKLzOb9p3E0rWISqA/jXPGrG3f/H+M5b1G+c6lRuudO6ZgAXgeb5Hoq4aoDl9p7yvEJiHiJWVXjME4yGDLGa1OPS/dQb8Zp5IBs/T0aQ+CfIjUCARetwknc7pwJ77uEbopRGC8qZ+vzxD1sXKNPmU2AwHCJDXa220tg3maWCCai7L2a46wqe+wyYadT2IWD3hQFNjtDoEXW89mm3h2wm4c/7wXDI8i+X4HZF0DbNzyKReHCN+3jlPgI31D+wRReqS3sDTFsITLjodIfGtl5aE4IgezSacCNv5BHrlog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6010.namprd11.prod.outlook.com (2603:10b6:208:371::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 11:56:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 11:56:27 +0000
Date: Fri, 7 Nov 2025 05:56:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v2] drm/xe/pcode: Convert unsupported commands to debug
 level
Message-ID: <x6k3n4bc3gpwnogsiwo44ndgli6hbks2fpprcjagv3q4752edp@tbarhupblkho>
References: <20251107055746.110055-1-raag.jadav@intel.com>
 <qaa6wtbzouftstdptqdidqlmb2gw4n2c24bztuzi5ifp5rpocj@barjesb5hzm5>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <qaa6wtbzouftstdptqdidqlmb2gw4n2c24bztuzi5ifp5rpocj@barjesb5hzm5>
X-ClientProxiedBy: BY5PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ba962b-f5c2-41fa-0211-08de1df4ae40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qijy0fqDZnXD22YPGPgEvkQ7RbaPkWvskNe4IAzMob9dgW+DCetrWj9Kc94v?=
 =?us-ascii?Q?ZcoiGlNJDv5F6lwea3gc/qtNzL8JgykuzlKSLSy/vZ9loUyHGqyIh2LqT4Ud?=
 =?us-ascii?Q?GTJy4zNw+ttnQY5oymjrL5I1CK3RbzeMKTvT/Q2JOuKFZmp8kVl2xRrWoorb?=
 =?us-ascii?Q?4d0dqyPVkZGT8PhcrUdlza39rUxHx2A3IC+9AKpX/WSelrZ5wm2jjmI5uisz?=
 =?us-ascii?Q?0hOd0wNLC0uUnKBw21F1hpcOr5vQveV/6IQUci8GZwpMQYcRofns0QRro9HO?=
 =?us-ascii?Q?Ug6SCYF3xQuRQq4Lof+3Ps+uFqkF/raunwDblA08vjcyPsjvsveU9ZzkHJ6i?=
 =?us-ascii?Q?vZhMZkssWZ+LhmFrREmNDtDUzWf0xlxzoM2BLjx1Y7YNTUiKLP5wqDWY/5iI?=
 =?us-ascii?Q?7EVjmivi2Ep8ZfkDPiJ+8xrADaLP2AZ9YPmlk6ZBCLv/qHI2YmvK9PlikXmD?=
 =?us-ascii?Q?cFSUAgkYvnrBqnV0iEbkvvXpZ4L2q255r/GreEnHJ82Kmu+Wp6NH+yXgGlBG?=
 =?us-ascii?Q?HvcflMV1hTqGBim5GxsUWQSxmlMwnCcrr2fU3RaPPNcp5/mex6UcVhd34LaM?=
 =?us-ascii?Q?4tVv6JWQLLsjP5OMLQ0iTTKQ5uuFwBTxMmE6rvsx5kBwbbFstjUqva9FL905?=
 =?us-ascii?Q?oVugHbvKROLUo0jlXBpyt1QJNdmLHeYAk2/Jql6VleRg45hCHNPNgYCI9oNV?=
 =?us-ascii?Q?9HzFbj3ny4Cbs/XyOvzwsDwtCZRcsbta4q1MHSNiPF6cb2TC5MXn4jMtpfqv?=
 =?us-ascii?Q?EN6e7wSGPlNziOOKWBvrRYXphdkR+UU20OmKuyKTGgx1kS2ZzMqkzGsKg9RY?=
 =?us-ascii?Q?wV9kAr9weD6dIv+THi3FYwTCzaZUFS3LjNknmqSGPhPnHsqn97c2utlo7wZd?=
 =?us-ascii?Q?svSoN0ktEz+rhrUIw/dZIDpExKZHgWTlwrJgTVmiHpI1Zv+knTxyG+DCKnLP?=
 =?us-ascii?Q?3QlAE0TGfxITHbBlJgjpQkp3I4Xkqklv0Boz/fdnTEQBRN7YwPHCZ7EriD0P?=
 =?us-ascii?Q?etL4+dvvHRWoya9EToGgwDcqP7ZrKeI5hhxldkvtRMehg3bjVOBAyggLBHmd?=
 =?us-ascii?Q?2HLJR1+gFYs/y9QRfjAcc3AQnnoEnwlm1G0fWZVqVjNc4QRR3XqnaEW51gaY?=
 =?us-ascii?Q?rZkGW1xbdYGHkoxy+L+yLhfog0on3mzWNU8DuCUJbb3tWFcIdmhIQwOCi5kT?=
 =?us-ascii?Q?tnecHTWoPhkTjIAzPuC6gQYOdU+XRmwkNOjK7TpZk8+dO0G11ws6u2wLiC5H?=
 =?us-ascii?Q?BYIkQLM3pa5dQfAfwKnJf16yyG7Cut0bwIXB4Rj2fdxj5gjxZNVcJaceUUS4?=
 =?us-ascii?Q?e86Mlx59CC20GB/C0G/ns8F4KSEuPDXBNPCki3deuFXRILkN/vr5rYLxGOj9?=
 =?us-ascii?Q?lNUTF2jg/oIxSZQWS+Av0DKNtERH83n0R8DXQ+cpCpqUye2+IFZxk3/0eerQ?=
 =?us-ascii?Q?E35pCkAdgMtOIZ7yhz3hBW/lKTS7UQgNcE9wRCWRVCTDKlY7oDHDYIT6fYQh?=
 =?us-ascii?Q?njucI0XyRnMOX9cIcmP8hrvTfxEcPkA7dn/c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5iVFL/K0/2q3/q/iwFrpVbGPpFAztUFN4zyQ72ZpsLcYBxDSo1dWdJsrA8EX?=
 =?us-ascii?Q?ugyxL26zZNZQwEOelH5DgmeuXRhm+qlK91h9YDGnMey1gSoOeqw53cCF3nsH?=
 =?us-ascii?Q?6H3vU5NiFhpHEjNbNI+1zjg+pDMIGBzx83fPZspFh4gqqSWwKAxb98Q6JfJu?=
 =?us-ascii?Q?NRE/D388hKVWXCIlOl4BJHmPosfa/9xeStg7wi5XswWkva8Lc8e+HzSW6sB1?=
 =?us-ascii?Q?UQRco3Tv9zvsOwdlXXfMFLIwlhptF8m7pEp+WqCqNmJjFb4gVMO4Dlw5+GXa?=
 =?us-ascii?Q?iIcbZD4nQ4XsX7oLD5E+DoebZOFlhGsq8kwTphTn72eD83qADAibMKTvYlc5?=
 =?us-ascii?Q?5N33UyTp69jaraTwxDhOyAKFjrzPfeYyRZ6+61duESJJVc3gLJZMBI3EauF/?=
 =?us-ascii?Q?SWJvevaTWgeih46vU/XoLHaChUNs/W0QumOoScc317DPz0Nr8jSslqYm+ZeR?=
 =?us-ascii?Q?UsFm+XLqltA0ivY8lcT9TIsQ3AuN8L9jZqKRHUlbjQHJtbDki2J2oqUua1GP?=
 =?us-ascii?Q?tISA/I7jAU1w2XajHG/8/P8NLxEoASicloArWC5VVE1blo3Up9fTAQzrIVIQ?=
 =?us-ascii?Q?GP/S7k1MXSe1/lfSBi1qIbLSjAkdLt2mVn2pbvfZ8+cq47+A1LhwJXq2/juf?=
 =?us-ascii?Q?OSxPA5XAHloVDA69yXuKOvXDmdw6XVXzPP8QzuCagB+MqMOgM4hV6iHLCq/x?=
 =?us-ascii?Q?aDy/bsC51AN/crqB7Sab2xpr1bO4u8ppgvoNlkACaJTvRUoKd8N5nPsZcF+O?=
 =?us-ascii?Q?OstOWXtbpDx1RpSYQHjATow+arQcSq7Jyuhc7ZpNY8GEeqvMnLYtytW054IR?=
 =?us-ascii?Q?CLZW4434Go3qmJEL8utexSJzSrEjRzZofihvq6rHDwPJHn5rNDOF/7kiiNp/?=
 =?us-ascii?Q?eHpKAs9Fv1LmPEUy0St4FLSPkZZtHxdu3URS8fPph0uoag7EmgEIaR96iFtP?=
 =?us-ascii?Q?EK15sNj+k0eA0X4uCpHH+k10ihwIaPM5xZUR1Kdx5e5+1zCsJjn5coo7Jwwg?=
 =?us-ascii?Q?e3WnT9oo6Nf49bIVZCGtJzJKa4pTC42MJTCM3gYoWyqFKTJ+V9hBl9urE8f3?=
 =?us-ascii?Q?W3Ug9uT47kJmQSOXtk/PUN8pEFa5jWqHuzHhhU7VyZJazWqi+sqxor68N8qC?=
 =?us-ascii?Q?xSmSWqUAmgS7tKRrP+2EGeZEaI0JtdmTbyFnrPj669HfijkC6r83olnYqPay?=
 =?us-ascii?Q?KFBYlSZIh0nrA3VoRpkYs/U/ROBQjwSe2JpDGq6s6CuTUEpLtou6JUzVDHrg?=
 =?us-ascii?Q?887QSBjKBBZQuFmiV12jvim+pXqBagsWW7RXAqCxPazk2Okosg0peVHJft7W?=
 =?us-ascii?Q?4c4a4ICn0OZP6xwuuRPLgHg89A70If8Wrfp+oF+j1dQkyi56L+xerEMmA+7M?=
 =?us-ascii?Q?VG/xUa0cqH85EWtj9l9peDy04j7fJaUrkBg9FmqDspOpiFhc5FEagmcSi4Gy?=
 =?us-ascii?Q?evF7Qyi9xavYNWBp3qoDk1ND5zvi+lnAi2C9xZFK1qvSOamy61tE+lT0o4HJ?=
 =?us-ascii?Q?rREg5q0LXchvvEEQcKUlGMRmj3gJzXBfChvZRlBC5DpKTvJB8X+5WKkp7+2C?=
 =?us-ascii?Q?Om18HxrXxhh0EA4ShNVts08jQXMfy+3zgM5L5YOQW6PgxsuSXVdvhCkZ1vCE?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ba962b-f5c2-41fa-0211-08de1df4ae40
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:56:26.9668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLH+QZ7koAgabB909wuxsS2eNntv4CMHv38/SPHCNbLg/vE/4mFmhpsiW2daDCZguJqKAu4VPD/y6VdPr+M0804ntErTUvPvKnY/CArkego=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6010
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

On Fri, Nov 07, 2025 at 05:43:00AM -0600, Lucas De Marchi wrote:
>On Fri, Nov 07, 2025 at 11:26:11AM +0530, Raag Jadav wrote:
>>If the device is running older pcode firmware, it is possible that newer
>>mailbox commands are not supported by it. The respective functionality
>>isn't useful in that case but neither is error logging, since it doesn't
>>particularly signify anything wrong with pcode firmware or device as a
>>whole. This is useful in cases where we want to make a decision on driver
>>functionality based on pcode return codes and a bit simpler design choice
>>compared to other solutions like checking pcode firmware version, which
>>comes with additional complexity of binding every single command to a
>>specific version and deems pcode commands useless in case driver fails to
>>obtain it for reasons unrelated to pcode.
>>
>>v2: Split unsupported command cases
>>
>>Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>---
>>
>>Following up on earlier attempt[1] now that we really have things blowing
>>up. Another alternative would be to further split boottime and runtime cases
>>but that again is its own design discussion.
>>
>>[1] https://lore.kernel.org/intel-xe/Z8n1Uy1hqAkYxeFE@black.fi.intel.com/
>>
>>drivers/gpu/drm/xe/xe_pcode.c | 9 +++++++--
>>1 file changed, 7 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>>index 6a7ddb9005f9..d9a0bd7ea36c 100644
>>--- a/drivers/gpu/drm/xe/xe_pcode.c
>>+++ b/drivers/gpu/drm/xe/xe_pcode.c
>>@@ -47,8 +47,13 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>>
>>	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
>>	if (err) {
>>-		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
>>-			err_decode[err].str ?: "Unknown");
>>+		if (err == -ENXIO)
>
>err is u32 and it does & PCODE_ERROR_MASK when reading. It will never be
>negative. Did you mean to check the mapped value from err_decode?
>
>	if (err_decode[err].errno == -ENXIO)
>
>or just using the non-mapped values here would be ok too.
>
>Btw, that array with 256 entries seems wasteful for the number of
>entries we actually fill.

something like this would be even easier to add your change on top:

| diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
| index 6a7ddb9005f99..dee3165fb37d1 100644
| --- a/drivers/gpu/drm/xe/xe_pcode.c
| +++ b/drivers/gpu/drm/xe/xe_pcode.c
| @@ -32,27 +32,40 @@
|  
|  static int pcode_mailbox_status(struct xe_tile *tile)
|  {
| +	const char *err_str;
| +	int err_decode;
|  	u32 err;
| -	static const struct pcode_err_decode err_decode[] = {
| -		[PCODE_ILLEGAL_CMD] = {-ENXIO, "Illegal Command"},
| -		[PCODE_TIMEOUT] = {-ETIMEDOUT, "Timed out"},
| -		[PCODE_ILLEGAL_DATA] = {-EINVAL, "Illegal Data"},
| -		[PCODE_ILLEGAL_SUBCOMMAND] = {-ENXIO, "Illegal Subcommand"},
| -		[PCODE_LOCKED] = {-EBUSY, "PCODE Locked"},
| -		[PCODE_GT_RATIO_OUT_OF_RANGE] = {-EOVERFLOW,
| -			"GT ratio out of range"},
| -		[PCODE_REJECTED] = {-EACCES, "PCODE Rejected"},
| -		[PCODE_ERROR_MASK] = {-EPROTO, "Unknown"},
| -	};
| +
| +#define CASE_ERR(_err, _err_decode, _err_str)	\
| +	case _err:				\
| +		err_decode = _err_decode;	\
| +		err_str = _err_str;		\
| +		break
|  
|  	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
| +	switch (err) {
| +	CASE_ERR(PCODE_ILLEGAL_CMD,	      -ENXIO,     "Illegal Command");
| +	CASE_ERR(PCODE_TIMEOUT,               -ETIMEDOUT, "Timed out");
| +	CASE_ERR(PCODE_ILLEGAL_DATA,          -EINVAL,    "Illegal Data");
| +	CASE_ERR(PCODE_ILLEGAL_SUBCOMMAND,    -ENXIO,     "Illegal Subcommand");
| +	CASE_ERR(PCODE_LOCKED,                -EBUSY,     "PCODE Locked");
| +	CASE_ERR(PCODE_GT_RATIO_OUT_OF_RANGE, -EOVERFLOW, "GT ratio out of range");
| +	CASE_ERR(PCODE_REJECTED,              -EACCES,    "PCODE Rejected");
| +	CASE_ERR(PCODE_ERROR_MASK,            -EPROTO,    "Unknown");
| +	default:
| +		err_decode = -EPROTO;
| +		err_str = "Unknown";
| +	}
| +
|  	if (err) {
| -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
| -			err_decode[err].str ?: "Unknown");
| -		return err_decode[err].errno ?: -EPROTO;
| +		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
| +			err_decode, err_str);
| +
| +		return err_decode;
|  	}
|  
|  	return 0;
| +#undef CASE_ERR
|  }
|  
|  static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
| diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
| index 92bfcba51e199..70dcd6625680c 100644
| --- a/drivers/gpu/drm/xe/xe_pcode_api.h
| +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
| @@ -92,9 +92,3 @@
|  #define BMG_PCIE_CAP			XE_REG(0x138340)
|  #define   LINK_DOWNGRADE		REG_GENMASK(1, 0)
|  #define     DOWNGRADE_CAPABLE		2
| -
| -struct pcode_err_decode {
| -	int errno;
| -	const char *str;
| -};
| -


./scripts/bloat-o-meter /p2/build-drm-tip/drivers/gpu/drm/xe/xe_pcode.o.old /p2/build-drm-tip/drivers/gpu/drm/xe/xe_pcode.o
add/remove: 0/1 grow/shrink: 2/0 up/down: 222/-4096 (-3874)
Function                                     old     new   delta
__pcode_mailbox_rw                           363     480    +117
__pcode_mailbox_rw.cold                       58     163    +105
err_decode                                  4096       -   -4096
Total: Before=7890, After=4016, chg -49.10%

it saves almost half of the space :)

Lucas De Marchi


>
>Lucas De Marchi
>
>>+			drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
>>+				err, err_decode[err].str ?: "Unknown");
>>+		else
>>+			drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
>>+				err, err_decode[err].str ?: "Unknown");
>>+
>>		return err_decode[err].errno ?: -EPROTO;
>>	}
>>
>>-- 
>>2.43.0
>>
