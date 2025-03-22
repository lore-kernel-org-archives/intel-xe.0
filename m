Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DFAC36005
	for <intel-xe@archiver.kernel.org>; Sat, 22 Mar 2025 12:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D1710E0C4;
	Sat, 22 Mar 2025 12:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cmpa67Uz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DBB10E0C4
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Mar 2025 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742648240; x=1774184240;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QlAfFkRcjaCbJdZlvBSHNqIePhurzkIDHjgjxN4u2wc=;
 b=cmpa67UzadQePZHfPQ/MUGl1/fH+/uX3yGhzXP9YrSbkNIhZMooksGvk
 sdHCF5h5vydOt2DFNK1WLJFbrcqkmCxMyNLUCBvv9tn4ZPJkXExzv3QOw
 FaJ64Zx5I8s8LBToiYF4h//I8hkHaBybhRSG8Ii1VXxBgnIOdje7ttts/
 iqFZt3fXyjS3i9xyPDLuMahUMyEuDBYO0Z2d9SnvX2tpJ++rS8iZEwcrj
 X4X/Lk6T5cW/cAPU16LUhuiCl9eNuEFkcYXRgyV89o+Pc0AjMPIfoiZFY
 evEI0DL6FVytYIUHPC4T/3QUwTPI54k7EvHUScIfENLAbyGYZ90q8l804 A==;
X-CSE-ConnectionGUID: YPYzCwc4T7a0Tqg/DhM7kQ==
X-CSE-MsgGUID: BVDUcGsVSo+Gmx09ulxBWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="61424880"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; d="scan'208";a="61424880"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2025 05:57:19 -0700
X-CSE-ConnectionGUID: l4Hq2yHXRACC822G+g28ZQ==
X-CSE-MsgGUID: sqWJ6eCBSYaYfDrDx/w8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; d="scan'208";a="128692584"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2025 05:57:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 22 Mar 2025 05:57:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 22 Mar 2025 05:57:19 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 22 Mar 2025 05:57:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNsTy6+UAc0DzeneKV7+JXvO/T6053WN3taSZkgHb9c078zygixxl5vWD9BqW/3BLxjHMMMaC2lm+uQWO6XZZ+VWtf4agt21D911SgsrqLM+yPYj4AD6f5W9bNUB1YfMkTmIQYh86NAhCr27noXLuCxpO1vAoibMwE/IATWpRaiADM3vj34faqhU0p6QqHhW4AfD1i1WwBn3sPrx0E+wCNkciM6g58LQf6FKimxflCKOqOoiyteBfJmlXnWNXxvXXrR0NAlforj7q3T94sV7DqNxMM5c0AOZpx5Wf3n5FQP3gHMFttCdejLhFplilUQdv8r69zEMTvFIcnrKvHJD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHJdtwvgX+darqQNX5Gw2RgqxiunbLCsLzPiukD2Hmw=;
 b=P+RHg72YaMazxraqHRy1/NDePIkt12+gOSeC9FaX9YC4JX1xnR/Wxj4n6H8b/o5i3Luo4A8yGTwN8PWEqTOAnQRKD0F9V5a9IoFMvk9IgibdmxhPPxpUxK4gGWYimgJkrsz9RhsyPsllH9zpU0uPXFJbz7zI243WjMRt8HxcVFMTBpSwMg85nF8H2YDFYhkOEHs2TCi8SBinlznYDlvBU7ekQV5Ffc2RwFzI5lgAuw8uJsSaDcTqKgxgrbhT4suIYYUiDe718gQj6H0BaQD3zwJbjeJao/BI5eHZIDa7AZS4ZUy6JMDXHTh5JMsRlyEsvw+QuSmVFSQKlIJB7zHI6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7071.namprd11.prod.outlook.com (2603:10b6:510:215::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Sat, 22 Mar
 2025 12:57:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.036; Sat, 22 Mar 2025
 12:57:16 +0000
Date: Sat, 22 Mar 2025 07:57:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
Message-ID: <azol66l3wmb6r6cy6kh2j5ooglx25bduwj2ybifdxtpvpej23d@jxw766ana4kv>
References: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
 <vx26ng5q4asspsg6lktrj5ok73gbiy3bfg7icu4fybekyt4zad@5h4bsek2mukm>
 <4283fcec-5ddd-4d06-9eae-8e622e9695ee@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4283fcec-5ddd-4d06-9eae-8e622e9695ee@intel.com>
X-ClientProxiedBy: MW4PR04CA0211.namprd04.prod.outlook.com
 (2603:10b6:303:87::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c5d326-ae28-4f93-0b23-08dd694112a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AYQoCYAopsbLvLDbndmE+Bt6FqrhfJX78KtRNu9ODXB94K5TyNaHIJblpT?=
 =?iso-8859-1?Q?mweUWVi3KDVy9P7+xpENbYs+a41elL6iUHHqqLuNAiZQW0fTJa3JBMJ1uD?=
 =?iso-8859-1?Q?fBYuLoT67OrgH4x0LmYJpASPyAMT/yi9qciatF7drpTSJPb9r8LHthwH8Q?=
 =?iso-8859-1?Q?snVwtp/Wrv+Gnza0JIZYAFg8y5sM12fCexMOsavSm1XzjC23JBy9SfmAKN?=
 =?iso-8859-1?Q?VBnOv4Hxlw7xZyx5J87Dbg3b2fumCyLy/prdcQ8NjwugPRjOJNuUAHA9ly?=
 =?iso-8859-1?Q?Y/ZiE/u1TTIDP66y9Ce/ejksmsX7eGEaHpEQ5z2O8B2QbOIanpL6cIZvT1?=
 =?iso-8859-1?Q?wnvqliN2p2kGqHBb4gbsg7zZnpnDULQ2itqoSIcCqqnnYFPwzHSdOlShA6?=
 =?iso-8859-1?Q?dnZan+Y1nCpjhy/dXc3d3Vdcf7cPuM0dU/AFgI2iDkTPn+wxPnbH8EXlXm?=
 =?iso-8859-1?Q?Wg5y35SlqJjccJIUPFntcGpBn02XGa5/8F+1jeanRRRPlpbdo5pBqXyxLK?=
 =?iso-8859-1?Q?XurYGdyJruNm1vd4AzmdRgmjwZiNriEvXwNttbX8tg9Ef4wbjwhKcNwwdM?=
 =?iso-8859-1?Q?jc8mxvT+Zq6cqGyG2q5ShCVSx5B6pimXN4l5D8yziZI02VRKC2DkQu1eNE?=
 =?iso-8859-1?Q?rsR1jx2XxnM40iz6eGYlBRXeR4vgV87BNHp1iI/Qz48/O4FZH8+29nqEKn?=
 =?iso-8859-1?Q?J1TO+mz4Zxnu/2SVoBKyDSrI8i1qw93GDALgBW4GiQ7FHvHxMmuBrkjgQW?=
 =?iso-8859-1?Q?kixG6SQNuHABwle1ut0y+4Bq8GGJIW0jfXCxPe4CVMUvmOA02dgE6eyUUO?=
 =?iso-8859-1?Q?A0oW0uLlEiyyJSMR8SDbVh9FESMIrj+3jYhSTqQJJ9KbPprPV7n5SbNTxI?=
 =?iso-8859-1?Q?wn2cq06/pS1PoK/J0cCtEZvT1+UAI6H2nb1KsI1PCoKGFH20umv2Qsj97w?=
 =?iso-8859-1?Q?p3BPtYFDjZDxqkJYjMswydk9dxCOlYKhTVPwOivXfX6jFBb/59cQt4VqFq?=
 =?iso-8859-1?Q?IzNdeZsfBHyXYqOBWam1k6iUoHxgfY7IDiR+oO8jdbS+Er1Y7EK2N0Grs+?=
 =?iso-8859-1?Q?jAJF1SjE5G3an66i9/3NzXjK3TUkf9W2vETh6lEMsZyr8dDsofLZ6uanSZ?=
 =?iso-8859-1?Q?qFyysLbDqHglwGvU/Sonm4a7vbMmeqdq0/iR/vFve7+CWAsdC/XLWGyMo6?=
 =?iso-8859-1?Q?I01/PGvVWwF9lRi4L29UaD4U0V2RoRezY4srvsz2LYsnLijJXKRVFCl6Mk?=
 =?iso-8859-1?Q?uu+wlypxTzk0l1yVrzaPt3y+9fzfBUchmhlOr0JWK+Ui0GmLeXU5/l+ioR?=
 =?iso-8859-1?Q?ZWnb1EmAlUBJDu6j6TTxgfd5F/pZ76oTGbP6j74hUNOhzfoVVIEfkr7ltD?=
 =?iso-8859-1?Q?p4OONFHkqTQ+74UuJYX+23Z1D1hHz78F8+ZphhNWclQqBaShrsg8vVECmY?=
 =?iso-8859-1?Q?HjcMURDVSkTIpYn6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TM9E/uFwLVIegAvRExhoMRmZDQwa0FNpFlDIOf016hqymnP/cj3wfM7PUM?=
 =?iso-8859-1?Q?72t7Ft2p1F1JAG39rWlMl3VtDQgrQgPnU1IRD5z0NswxpdH8xtNLk0DwlV?=
 =?iso-8859-1?Q?VvdvrxujijMEqpurRDtCDXzLxJ/1G0pqvA5rnsgc4FpeMl1kjXI4ylKwOt?=
 =?iso-8859-1?Q?Hir9u16hLlNCEwzYgLaBjTqGwSsQVhYUBYb0Kv0I/Ngr9+nG7xg+Nsv9Q2?=
 =?iso-8859-1?Q?fIjPa0NFGZ6TYAROK0eD5jmVHzm9czjUcfQS1lMYYt5gOP89qzrRXN9zH9?=
 =?iso-8859-1?Q?BY6maX2WsAAF+wOYqdTjqvUdufH2wtHHYiV8pWDQmLwAV2SjQ0CZ6Ocq7p?=
 =?iso-8859-1?Q?fEBdPTWaylSx8b4ZeW/yX/i0SCR6ODdHE1+6dYAMD+DMU4tUk/d0M4qCB2?=
 =?iso-8859-1?Q?Q5Cxw+r7gXqPIi+n5BzwQbryXGz2nzl5wgJd3SGL9qsbO6ARHhWYynzcXb?=
 =?iso-8859-1?Q?JSW4WTl9jvm/CMU/AYnRCGUOH4ZKIWcIxn/xGuI+VtO+WkvHBOqpUMHGmI?=
 =?iso-8859-1?Q?cVCGi/wMweXRIUp+xMVCi0YL4vvi4sUwDAfDrIxDx94AZAEXZBp+1ik/uK?=
 =?iso-8859-1?Q?nBl1v6lOH+ZfBVVrOXINGWOPy+UyOapw1yG98a2epGCwhhqy3dnvAWS+tB?=
 =?iso-8859-1?Q?C7WdHGOmGdn5S/4fm4VLt4NB6A4El1aFU4zR3DPknlTmE/+zGFdNWSO6Ax?=
 =?iso-8859-1?Q?aNHW798FsDtYgEz/iRsohHjmvEnrEqLragsmcCk94imenM3vVJY4HxrfSI?=
 =?iso-8859-1?Q?69X9DpuMAJ4YICjHgG1ouH1rUD+YUR+OElI56qqHJuH1b0FIpfF4bzAZxv?=
 =?iso-8859-1?Q?rvFY6OapIXFn0vDk2IoDiX+sElFk5Kz6r+uLieaDEcSYZoMFtIrYgyzvyc?=
 =?iso-8859-1?Q?PkFZZLbVVGunmG1r6ClR4KACqxXG7/I3lMedDhLrw5LHsE8XReATsoqfT/?=
 =?iso-8859-1?Q?MM9A4ft3rW3Y6C86lI4y3udcnqBpEEubOr5RMiZE+xYIQH9NUsm2zz/+nN?=
 =?iso-8859-1?Q?2VQ5GpNQdUmqj3SrQya9nWkf0snBM+tafJCuEcsqieDUgFmv6VfoPwULCl?=
 =?iso-8859-1?Q?K5mHtou00sT+9YYcAtmb0vcnfnyN3o8OQyHxwG6XNd+ktrgYJhFAApBwaW?=
 =?iso-8859-1?Q?bQDOp+96dPkh+15L1Za2xD0eosGjX2UeirGaSfaJ7XlEcwDzIzOYXLcFBW?=
 =?iso-8859-1?Q?EyGqF9/C9vuTT/oW0DPqyE05427115MnqTXbcbXQPy+euF6YtQQt99D32K?=
 =?iso-8859-1?Q?kzRnaxt6rTVtFmytuU9K0xonZBX3+70c+P9t7l9jNO8IW31cksU7smJLus?=
 =?iso-8859-1?Q?3ZL9TdAyjXzZMKr2X1SwhNE08Up3YnocNxPZpaNEBHYw/FdDB1AXyLAV21?=
 =?iso-8859-1?Q?qKYLQPxmhT6ykgfHU2i5PQV9X92mVF5cDYzevmfYkokgb4GpqXR+qoqgNj?=
 =?iso-8859-1?Q?SJIyb9lKmPRuj/a3PAzCI7n3ZAbX5gCUemcKucYMDuuMICsdx+z/TYUKDO?=
 =?iso-8859-1?Q?hdS5WKhA+ltT6KnlvkEPhy4lGE/YSJ203s3ScpFIs5fqewRWkExLbhsTly?=
 =?iso-8859-1?Q?Yf4xEh21C5iSO0R1PHCoh7Ffe45kbUh7VM3Cr5uIG5DlNDDocTqYbexcsl?=
 =?iso-8859-1?Q?vOR/iUwECi8OxTM4F2MfDgaeDiKaip/bwb5V+HkNAB8eVQh5exaZ84xg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c5d326-ae28-4f93-0b23-08dd694112a0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2025 12:57:16.4441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjDnoQZ8QItled5J4ddvl+FuNhZGYtU9m9FvgPOKw87GNFiX6lEj4rqM0SYbc8x+EcOe6UljQWAIOnGB03EIAy1TbrzfXqMm6UNfW9Jfz/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
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

On Fri, Mar 21, 2025 at 03:45:21PM -0700, Belgaumkar, Vinay wrote:
>
>On 3/13/2025 2:45 PM, Lucas De Marchi wrote:
>>On Tue, Mar 11, 2025 at 05:14:08PM -0700, Vinay Belgaumkar wrote:
>>>Define PMU events for GT frequency (actual and requested). This is
>>>a port from the i915 driver implementation, where an internal timer
>>>is used to aggregate GT frequencies over certain fixed interval.
>>>Following PMU events are being added-
>>                     ^
>>why do you use "-"  instead of ":"?
>>
>>>
>>> xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>>> xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>>>
>>>Standard perf commands can be used to monitor GT frequency-
>>> $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>>>
>>>    1.001175175                700 M xe/gt-requested-frequency,gt=0/
>>>    2.005891881                703 M xe/gt-requested-frequency,gt=0/
>>>    3.007318169                700 M xe/gt-requested-frequency,gt=0/
>>>
>>>Actual frequencies will be reported as 0 when GT is in C6.
>>
>>
>>I think we need to document somewhere, but at the very least in the
>>commit message what the event count actually is. Let me see if I get
>>this right:  if userspace is sampling every 1sec, and assuming the gpu
>>is at 700MHz for the first 0.5sec and at 1.4 GHz, userspace should
>>expect to see ~1050 as the value. Correct?  I find this frequency
>>handling very different from anything else reported via perf. Other
>>than i915, are there any other cases you know of?
>
>Yes,  user will see a gradual ramp. One thing that could work is 
>something along these lines:
>
>@@ -324,7 +327,10 @@ static void xe_pmu_event_update(struct perf_event 
>*event)
>                new = __xe_pmu_event_read(event);
>        } while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
>
>-       local64_add(new - prev, &event->count);
>+       if (is_gt_frequency_event(id))
>+               local64_add(new, &event->count);
>+       else
>+               local64_add(new - prev, &event->count);
>
>This will give us instantaneous values and will not need the use of an 
>internal timer.  Should be ok to do it this way?

yes, I think it'd be preferred. It's much simpler and don't prevent us
from eventually adding an avg_* event if the needs arise. Which would
also be clearer on what that is.

thanks
Lucas De Marchi
