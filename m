Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061A7E9A03B
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 23:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B307510E2AF;
	Tue, 17 Feb 2026 23:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8vIY60r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE88610E2AF
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 23:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771370304; x=1802906304;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=No3C5OUA2FYde+pCHYaT9J8sBKo3KXiQTES2yTSeos4=;
 b=n8vIY60rlrJ1iXRySQa2rD5IEkEUhkzBge6lkzd2Oigi2ga6mf6rtZrA
 7Pktm6NKwsEeyBvEyJcwsNSzNidmbkzwmhMGPeob1Mck5JFa1Nprt2VXc
 iEE7BXxA/IG0LiQom8SkbFz46U4HYZxOdxE8d0fzI7tNCWluq0Bm2Ci1F
 LZ60qd9CctpiIIWila0b3hu7wYH7YgK2z75SEEoalTNpSLpNVJUUOtZrS
 iCrXkrCvra8PjnRGPGNc1h0q3XjX5UReIWmR4O3CE4pE5aM69DUJK/doZ
 MSRaJU8kaW6SRAhCSRCpfABL38AiAIHSP0QUncyb6DW2q4MPg0+oCI0rT w==;
X-CSE-ConnectionGUID: 91UyqktAR7WrQxbWGcM+Mw==
X-CSE-MsgGUID: PFg251ptQ9CTYAkpApfUhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76290617"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="76290617"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 15:18:23 -0800
X-CSE-ConnectionGUID: pm4sEkteTR6ssWj7BzOgbg==
X-CSE-MsgGUID: YH16qajnTM60oceFJB5bIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="213252918"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 15:18:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 15:18:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 15:18:22 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 15:18:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0vFU4jWkLTxlrKu2IOPCvtCeyoTr2CzK9lQ2bG5oolT3RfjYtySWKK92e5cGr1qDROLgwM4ARz/LNzMcJdw36TWx6HcqxiK7zJQmTQSidRRKnnW0mqoBIZf5A4L6D8LDy7e5PjgmqiRfqFR7ee5/aUINy/WQf8pBTxu4UJV3jG+R9nfFGqDdtnlhY4dGnHHWXmuYPhqZjVwHIKOIWiLqWswDZuhoPfljsW+dfHIwLgYgKV5IAdR69gplFcgGU/igfuCB4wrWlXNkrB44mJE4s4TFaHpD3bUYY57Sh0aT8KLTqBH3m+GIikyuygsqpjnnGvRKhktpCYfsHpFs36tAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccNJKHl7G9EUyt+/J0dLNGupjKsfPXopwm/q597cL98=;
 b=qPWaQ+1ugmwlB/k702p6HcR03wWru3Liwm+6iCxdXe645c8P1MYgdhgQjjDXWA3XC0YJ9fAvst5+9LyE15kwAqKVKNwyO+U/xqRxKmwP11+v5iOIusBzdbYETu67lP5mVXJ4LEHY9fuPodLWart3potnE2IHcUYbTMIiZECydi1QqVGSWbbfWhTx51sZoNzjKEIY+EHwPeXHJqREzO4N1Evy+XZCMkcsJC6/SAurFs1gU6U5tHJ0F0oYb/FVLa9OemB7bi1H7EtifDnrxFkiruaG/zB26FqFr120WQatwn7W7aAnElUvEjlZaUtfnUCJlAvR7UM8CpRGFZKvGoqirw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4686.namprd11.prod.outlook.com (2603:10b6:806:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 23:18:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 23:18:20 +0000
Date: Tue, 17 Feb 2026 15:18:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Convert GT stats to per-cpu counters
Message-ID: <aZT3OqKwKBFk6g99@lstrano-desk.jf.intel.com>
References: <20260217200552.596718-1-matthew.brost@intel.com>
 <874e96d6cad9793ae5f8d7cd8657cd1bb923a92c.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874e96d6cad9793ae5f8d7cd8657cd1bb923a92c.camel@intel.com>
X-ClientProxiedBy: MW4P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4686:EE_
X-MS-Office365-Filtering-Correlation-Id: 061e21b8-4537-4127-54d8-08de6e7ad700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XYiOCeSkvJPAtfhes7U/v7to+ejl+Hsv4f4D087L8ulYByvA3mkEQCF4Ng?=
 =?iso-8859-1?Q?2dbfaJMoQZht5wPuYyQ5QbBMDo3N8YRZNxSn5Ex/Z323QCbHxrMYTjFtIR?=
 =?iso-8859-1?Q?Hev8F0AVAw14N5ZMxDl1xX+91vrU9wrGP/s6gX7cLOHOvdj13GfuZ0CTsm?=
 =?iso-8859-1?Q?B4BAuiYW8+j6jhIg+IGgAtcU3zNW5XlVxZkzzYFa/aJhkyFcX0ZcUlVDNX?=
 =?iso-8859-1?Q?xpm0tNHOL6Lm4obEMJ3BJTtBF0BUAjI8LZsSHYXWcBB8gMGZKqR+VmCN1b?=
 =?iso-8859-1?Q?RBbcx+Jz0O2AkgjkACwlzhi8xdm6/QpQKyUMzIxB/FHanrqBwpEVM4NNUJ?=
 =?iso-8859-1?Q?aTSZt1daBjSUrX+rgryZuIIOI0h7Taf3zslqlaiUnLLaH5bqo7SThmA7Cn?=
 =?iso-8859-1?Q?BbLilH8/a2zpfzx7NESQvGxo2EPwtaS1PcEFrHRoM9caykrbUmCIzHcO9d?=
 =?iso-8859-1?Q?sBC9jbensfGtPA9rmHQTy18mwHuBJ+oQrH3RUXSBkofkTgvWjyHjkAPs94?=
 =?iso-8859-1?Q?Cd49d53lGS7IsuMLx1Ky5PzYwsvK6goja9UybZuGHwJEiFaRgWuJkjF8No?=
 =?iso-8859-1?Q?eOB6tUm5RHQq46mCRoB79Crx3IZuwD9jvX+IjPoeAXCdxflWJupAMrUz5d?=
 =?iso-8859-1?Q?76cKW3YS09nSOg5km8Lt5/66dynnzW+e/1nywxZ1YHtrv9Qgp1WZ0YoDK3?=
 =?iso-8859-1?Q?5FgImMcaqwz1U02CQhcmY0XA8U2Jv4DFjn6eI2ReuPjnyCmVrPtwqb4vgU?=
 =?iso-8859-1?Q?NLg9VM2ogNBbSPLcdEWqtbe6dE4ObsodER3DcmY4DBa1PN/bnkQZ6zrdLX?=
 =?iso-8859-1?Q?0972FPGGrDYPFqI3GsSfxsdyQr1s1BXHv50aWVQaGG70AK+CASDWekuuyn?=
 =?iso-8859-1?Q?mScuL9c/XH1xX42bdM+gvgQhlPD8Pg1/IFaEiSLXcerRThXFx77zIJhUKc?=
 =?iso-8859-1?Q?YdG3/31q6H8AV+rdzOx1S9ALOWIlayS9sJFgFkZWL+7KSlHotn6aUsB+s1?=
 =?iso-8859-1?Q?IAONAKmGbl7c5i5q96W+OJ2TtknfPrEjYH42GKZBNrp6Soif7FltWbcuni?=
 =?iso-8859-1?Q?sEMhsrMq8f54cy7k17Wfg221lnYN3LPXJluOVn5djhMwVCL0Qy52E5FR3z?=
 =?iso-8859-1?Q?lbt0nO3sz6LHz9FGurAYU8n2NUd1IftTOJ8k7ShhG5Tb3OX0gjPgSD6EhU?=
 =?iso-8859-1?Q?+RCKuVdrUAap+/M7UH9+yhDX+BlcqCgdHKq1cxa1BF1Vtjt7yBL5X6X0me?=
 =?iso-8859-1?Q?xT+0PFqGv5DvmTtD7rBQP6PSS+O8DxRvDU7VZgbGbK5eXKNZ+hQgZOun0b?=
 =?iso-8859-1?Q?eGXaXLlmyHZJ2zCczWQZJqjuAA52ZzgAYrvRrIg6zMh6NerCyGcJydIO1P?=
 =?iso-8859-1?Q?bU61Tddzo2R/s8r2fxczDoD+q3l0mKtgaEcs+fy9zLpc/vRcR2zPY+3ISK?=
 =?iso-8859-1?Q?vajppt0Zlm+eaQ0PYJi/Kxaf+retZiuMRc9JRKdU/JiFRrvt9VVEvNxICT?=
 =?iso-8859-1?Q?88CBybjHvS8SvXylk9qgKJRo9USroTk2ronckueE1BgbSCBMy3Dwcx9LoP?=
 =?iso-8859-1?Q?FFkUNqe4CnRuL7Wip4UNulK/a4i7gNVx0upo7hV/cFeVPdZiduM5o9kwrZ?=
 =?iso-8859-1?Q?4MCZSlf4EuCyg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aJcG9bUorm/hR//S36wVM8CoRS1jhf+u9rf7MWhDK+SiuOcevXlPfmJf9h?=
 =?iso-8859-1?Q?BQeMvHSJYa6I8E4mAtH/6gylIOsio84ohCjPju+6Gbg4u6w9+LhPsCfBnU?=
 =?iso-8859-1?Q?hKYwKRJSHnFuc/WSkteyROAcrvouZ3KXNohUnjAGLH0C49PRc5QM1uKWNw?=
 =?iso-8859-1?Q?/YFebmGQd2zGq5GnD9B81N1eKi6xVfJjDUN9Igq5jJKBv6xZwGbL611iLb?=
 =?iso-8859-1?Q?e8NUiTMz7ZqxsG0UhrRbi6OcF7QuCm0OIcS/NPhPwiKqSNmIN92+xgaP0n?=
 =?iso-8859-1?Q?nem730UwUcBCahUDi81JVo6CCoEX9xKwKwJpUCjn5+vwEPOS+toMq6DubP?=
 =?iso-8859-1?Q?R4FCSjPTZFOQnkjTFZBt5n+Jku//CRrR+B/ygVNUozHYbVQe0HTo2Fbj4Q?=
 =?iso-8859-1?Q?CAHNO0/bHs+tY2rxSUNIYppxBUR7n/kDUE3ekQR+Dmu8IlN6XG1rKV5gWt?=
 =?iso-8859-1?Q?eBnRw8Ox84dUTbFvkCrUKIICrWFSQ/TWDhDoJw2/R76mqR3AkKcrRfjWGK?=
 =?iso-8859-1?Q?CkWMr8XpdwcpQyoUpkbaNTkqfYPjvQLlPWtkxgESZ/xik6iJehvqQQmlsD?=
 =?iso-8859-1?Q?kMHfuTmkthfVniD5jQUuCQWgfwO+HL/AmVCS3W9utPpUlUi/ib+y0aVvZS?=
 =?iso-8859-1?Q?vGhhJVbfrwFSedp3fJ/qDaF53q+cH9IAnWBD7JoHvJNxfVRGKLTM6B8Odf?=
 =?iso-8859-1?Q?vfQh+7M0+Xi7C7k+FYgqwsKlSwESXBC1373OvgKjNpF81UrV2GzCmwcQl5?=
 =?iso-8859-1?Q?3IQru5ms3KTLInVi5g5hyyO4RW/7+x6EfQg3kRGh/kWoh5KDJ1SyTmyBv8?=
 =?iso-8859-1?Q?laABe4r1lbLQSdOb8w/3c+K4Bvx0cNQkPf66gdL1qLT1qYsZ/qU/NGcKNU?=
 =?iso-8859-1?Q?W0H+rWE7HzNbxvBw/LRQkyyljSNRlEDQBTYQbTlkctdTv6DvZULzjL9Kml?=
 =?iso-8859-1?Q?xeAth/VDsJeomlX7D0+l3v/HyIelXBj3hTwX25pPRvy97JSgFD65bhmrz5?=
 =?iso-8859-1?Q?bdRpzttiKUlRwVfXxJXUbmrMU30evxdWoOale/DEynpUEV8GyZ5HXgUpB9?=
 =?iso-8859-1?Q?GWqy0JPxbq0cLVaI7ky4OwFKuR3sQi1UKICXPRFQ5OBEU6y0P5dgExdbDu?=
 =?iso-8859-1?Q?QIz7HwddUguvnzv0D8JCRNShH7g6AipRbL/qrAs5hCoCD6u1m26KjASWch?=
 =?iso-8859-1?Q?5wNkea08M4qIvCtq1oOqvROmm5R5LKsLuFmgQdSZd0G4PY2WiTs8sBtgrh?=
 =?iso-8859-1?Q?4jARdSNHcCtNQc8YLH2mxDEQEXctt1a5uFdIn6wvj4vjt5GX7QS9zt3j2f?=
 =?iso-8859-1?Q?LB3VztEmzPnA5o9tIDwhEBTYsD2GC/iQKayWroeJFc/kNK7ouXPXILtrEE?=
 =?iso-8859-1?Q?bQoukzKbbPKvTGigTMyMdh99P20/sYyqOofsZz9XDKM9NVuaulatgEU+vY?=
 =?iso-8859-1?Q?31EJb3W1w7YjY1AS28vfoPSiXxJZggaJ9ohu72ZwBFhk8tlPJZ4ikqcB/u?=
 =?iso-8859-1?Q?GopjyOtSrL6cxhjoE+6GlOSuJzPV76ma+IcPwRImdo38db18GpemxU04cN?=
 =?iso-8859-1?Q?e+EnYY6JuNhXXqeMyZiGc/iUgyN8MADd6pAc8cnVYHaymHOZkByoJ68qR7?=
 =?iso-8859-1?Q?Payqw9qFbjaXyrSfG9PfbI38uPxLeC7neWJD3oXmN4/ARUueUvezJN0fdD?=
 =?iso-8859-1?Q?SpXJKbN3PLX+7UZSo/e6IwlQ2PiRNn6zTLQ+y/4ARVd4cLBE9dp/1+nY7n?=
 =?iso-8859-1?Q?gvaqAhTMfDO7LIcdVllKpEbf79szTG+3Gtwf/t7Hre5v5OLWePTSr85yoH?=
 =?iso-8859-1?Q?EmjTiuVP1g4Ttg63q6tCgUlJTZrTGek=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 061e21b8-4537-4127-54d8-08de6e7ad700
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 23:18:20.7318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDBedabGMyRRlfMrXey7V+YgydHnuKgCyCPclBmpbTq2M2UjxBmVb15bvQcME7tseA4FjIF49tZLIOoja5fsWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4686
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

On Tue, Feb 17, 2026 at 04:13:14PM -0700, Summers, Stuart wrote:
> On Tue, 2026-02-17 at 12:05 -0800, Matthew Brost wrote:
> > Current GT statistics use atomic64_t counters. Atomic operations
> > incur
> > a global coherency penalty.
> > 
> > Transition to dynamic per-cpu counters using alloc_percpu(). This
> > allows
> > stats to be incremented via this_cpu_add(), which compiles to a
> > single
> > non-locking instruction. This approach keeps the hot-path updates
> > local
> > to the CPU, avoiding expensive cross-core cache invalidation traffic.
> > 
> > Use for_each_possible_cpu() during aggregation and clear operations
> > to
> > ensure data consistency across CPU hotplug events.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c             |  5 +++
> >  drivers/gpu/drm/xe/xe_gt_stats.c       | 57 +++++++++++++++++++++---
> > --
> >  drivers/gpu/drm/xe/xe_gt_stats.h       |  6 +++
> >  drivers/gpu/drm/xe/xe_gt_stats_types.h | 19 +++++++++
> >  drivers/gpu/drm/xe/xe_gt_types.h       |  5 +--
> >  5 files changed, 78 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 68c4771de040..1203d087b68f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -33,6 +33,7 @@
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_sriov_pf.h"
> >  #include "xe_gt_sriov_vf.h"
> > +#include "xe_gt_stats.h"
> >  #include "xe_gt_sysfs.h"
> >  #include "xe_gt_topology.h"
> >  #include "xe_guc_exec_queue_types.h"
> > @@ -455,6 +456,10 @@ int xe_gt_init_early(struct xe_gt *gt)
> >         if (err)
> >                 return err;
> >  
> > +       err = xe_gt_stats_init(gt);
> > +       if (err)
> > +               return err;
> > +
> >         CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> >         if (!fw_ref.domains)
> >                 return -ETIMEDOUT;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c
> > b/drivers/gpu/drm/xe/xe_gt_stats.c
> > index 37506434d7a3..f4bb0bf33995 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -3,12 +3,37 @@
> >   * Copyright © 2024 Intel Corporation
> >   */
> >  
> > -#include <linux/atomic.h>
> > -
> > +#include <drm/drm_managed.h>
> >  #include <drm/drm_print.h>
> >  
> > +#include "xe_device.h"
> >  #include "xe_gt_stats.h"
> > -#include "xe_gt_types.h"
> > +
> > +static void xe_gt_stats_fini(struct drm_device *drm, void *arg)
> > +{
> > +       struct xe_gt *gt = arg;
> > +
> > +       free_percpu(gt->stats);
> > +}
> > +
> > +/**
> > + * xe_gt_stats_init() - Initialize GT statistics
> > + * @gt: GT structure
> > + *
> > + * Allocate per-CPU GT statistics. Using per-CPU stats allows
> > increments
> > + * to occur without cross-CPU atomics.
> > + *
> > + * Return: 0 on success, -ENOMEM on failure.
> > + */
> > +int xe_gt_stats_init(struct xe_gt *gt)
> > +{
> > +       gt->stats = alloc_percpu(struct xe_gt_stats);
> > +       if (!gt->stats)
> > +               return -ENOMEM;
> > +
> > +       return drmm_add_action_or_reset(&gt_to_xe(gt)->drm,
> > xe_gt_stats_fini,
> > +                                       gt);
> > +}
> >  
> >  /**
> >   * xe_gt_stats_incr - Increments the specified stats counter
> > @@ -23,7 +48,7 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum
> > xe_gt_stats_id id, int incr)
> >         if (id >= __XE_GT_STATS_NUM_IDS)
> >                 return;
> >  
> > -       atomic64_add(incr, &gt->stats.counters[id]);
> > +       this_cpu_add(gt->stats->counters[id], incr);
> >  }
> >  
> >  #define DEF_STAT_STR(ID, name) [XE_GT_STATS_ID_##ID] = name
> > @@ -94,9 +119,18 @@ int xe_gt_stats_print_info(struct xe_gt *gt,
> > struct drm_printer *p)
> >  {
> >         enum xe_gt_stats_id id;
> >  
> > -       for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
> > -               drm_printf(p, "%s: %lld\n", stat_description[id],
> > -                          atomic64_read(&gt->stats.counters[id]));
> > +       for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id) {
> > +               u64 total = 0;
> > +               int cpu;
> > +
> > +               for_each_possible_cpu(cpu) {
> > +                       struct xe_gt_stats *s = per_cpu_ptr(gt-
> > >stats, cpu);
> > +
> > +                       total += s->counters[id];
> > +               }
> > +
> > +               drm_printf(p, "%s: %lld\n", stat_description[id],
> > total);
> > +       }
> >  
> >         return 0;
> >  }
> > @@ -109,8 +143,11 @@ int xe_gt_stats_print_info(struct xe_gt *gt,
> > struct drm_printer *p)
> >   */
> >  void xe_gt_stats_clear(struct xe_gt *gt)
> >  {
> > -       int id;
> > +       int cpu;
> > +
> > +       for_each_possible_cpu(cpu) {
> > +               struct xe_gt_stats *s = per_cpu_ptr(gt->stats, cpu);
> >  
> > -       for (id = 0; id < ARRAY_SIZE(gt->stats.counters); ++id)
> > -               atomic64_set(&gt->stats.counters[id], 0);
> > +               memset(s, 0, sizeof(*s));
> 
> Do we need a lock around this and the total get above? I get that the
> CPU increments should be ok, but when we aggregate, isn't there a
> chance we're overwriting something here?
> 

Worst case your clear gets overwritten or total reads a somewhat stale
value. I think that is a fair tradeoff vs using atomics. We have started
to add these stats all over the place in hotpaths so not doing atomics
seems like a win given these are typically enable on production builds.

Matt

> Thanks,
> Stuart
> 
> > +       }
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h
> > b/drivers/gpu/drm/xe/xe_gt_stats.h
> > index 59a7bf60e242..3d0defab9b30 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> > @@ -14,10 +14,16 @@ struct xe_gt;
> >  struct drm_printer;
> >  
> >  #ifdef CONFIG_DEBUG_FS
> > +int xe_gt_stats_init(struct xe_gt *gt);
> >  int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
> >  void xe_gt_stats_clear(struct xe_gt *gt);
> >  void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id
> > id, int incr);
> >  #else
> > +static inline int xe_gt_stats_init(struct xe_gt *gt)
> > +{
> > +       return 0;
> > +}
> > +
> >  static inline void
> >  xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id,
> >                  int incr)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > index b8accdbc54eb..79568591bd67 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > @@ -6,6 +6,8 @@
> >  #ifndef _XE_GT_STATS_TYPES_H_
> >  #define _XE_GT_STATS_TYPES_H_
> >  
> > +#include <linux/types.h>
> > +
> >  enum xe_gt_stats_id {
> >         XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
> >         XE_GT_STATS_ID_TLB_INVAL,
> > @@ -58,4 +60,21 @@ enum xe_gt_stats_id {
> >         __XE_GT_STATS_NUM_IDS,
> >  };
> >  
> > +/**
> > + * struct xe_gt_stats - Per-CPU GT statistics counters
> > + * @counters: Array of 64-bit counters indexed by &enum
> > xe_gt_stats_id
> > + *
> > + * This structure is used for high-frequency, per-CPU statistics
> > collection
> > + * in the Xe driver. By using a per-CPU allocation and ensuring the
> > structure
> > + * is cache-line aligned, we avoid the performance-heavy atomics and
> > cache
> > + * coherency traffic.
> > + *
> > + * Updates to these counters should be performed using the
> > this_cpu_add()
> > + * macro to ensure they are atomic with respect to local interrupts
> > and
> > + * preemption-safe without the overhead of explicit locking.
> > + */
> > +struct xe_gt_stats {
> > +       u64 counters[__XE_GT_STATS_NUM_IDS];
> > +} ____cacheline_aligned;
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > b/drivers/gpu/drm/xe/xe_gt_types.h
> > index caf7e7e78be9..8b55cf25a75f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -158,10 +158,7 @@ struct xe_gt {
> >  
> >  #if IS_ENABLED(CONFIG_DEBUG_FS)
> >         /** @stats: GT stats */
> > -       struct {
> > -               /** @stats.counters: counters for various GT stats */
> > -               atomic64_t counters[__XE_GT_STATS_NUM_IDS];
> > -       } stats;
> > +       struct xe_gt_stats __percpu *stats;
> >  #endif
> >  
> >         /**
> 
