Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCBACA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 17:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8340C10ECAD;
	Fri, 12 Sep 2025 17:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gg6pB8A7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1131E10ECAD
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 17:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757697205; x=1789233205;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e4+svOyy7t9gKMntHUdKkFsjgBQQdxNIxBzsK8AmQtQ=;
 b=Gg6pB8A7Zx6fU23j6fUNUNDnFbQPixxEGKwCQHiLdsq2jB+QaE4+SLh5
 YoumJk5UtzqSh7+n5lzQ0VqirrHE/hev2XDn20fiWdmGrfbOIGQiDrc9n
 cJNKBlSWDNw7yN82eYXU8NyPL/OqdbSvZkhJjBUS04XRHmoUJuJc/L/ig
 0ZL6h9pdOSyuiB4mUm8Rk7Of0RwTGMCn2zDQSk9hYksqkbsTUbgY4FhK7
 A598OUlqeh0Htf8zlYcc4Lv0QD8prAJu8EvMdjvE6EbVDXj76xkr9ZkVo
 UCGXUIJmdPjYfE6ss3P5G8jhzcCfxeZsJNwl9YwxOB4eowCQYPZp4yRbj g==;
X-CSE-ConnectionGUID: DMQT1LzARhWA3dC1YTY/VA==
X-CSE-MsgGUID: HPQGvXFpRKKauUdLRMnBSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59991559"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59991559"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 10:13:25 -0700
X-CSE-ConnectionGUID: 8koothiHTrOXhXEj/dIjSA==
X-CSE-MsgGUID: hc8AwDG7Sm6iKL+tcADAUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="204783721"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 10:13:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 10:13:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 10:13:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 10:13:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ns8qlE/8c9hpe1TdrFY5UWgoLXZPw6qL1J6+a94TYy2zXuroZwk8AWv21vIVEKVWzlrlNg3ZNbienLynnagQvb4TEMlfPciQjVJ4dToreS8jqIrdpGroKWTiC2m5pstq8OM3IrIYIaa8CELdrkWHrf2+CGfIpAmiaovSxd7BMLDF0f2NtkAi23BfVL8RWl0DpUGUm/nHx5K75rdxXohH6gB8+JlhBnfImdVUg/c/d6/1mrAAtFiGhscXFHiTAIiqojH587QQ90iCST/58V/zPv+EBXn0vJmaNyO2CttgReQ6QhpfeA/IOKBOCR4bWNE+x82lY6dHMT7H622UIpYb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7Ye+c7wkaL3ZiCupL0YndSjqrAeWl0yYpdtkrWUhL8=;
 b=UgqmpQqWmXTCTBoRKYgwV9hsO6YsFBjLgi+6HFd1rc91kipOjnII1Pa3XjYEV6ng8AfMbQu+zXfVNxEhAcGH1pGI0kXEqwqExXgcFHwKH1ykgDRptFM6kK8dEy2jhw7KxeNxhFqsNCffslvgz+BhVaiCMbJEHycALU+RlLpuJyifO4hX2VV3Gj2k17s1sSMg4UxTcz+o+VZk3YtaiHvvb6DAcgqB+o+sZZsM7gYiBdlcFd5Tv69ySsxUozrBt8eTL/rr74XfPZVg98LqH46smpBvadhODOcw+MelGd0CSqh1/crazxvCjlJWgoKe3K/8YIewYkMlYfhCRNgvzTvw7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB7856.namprd11.prod.outlook.com (2603:10b6:208:3f5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 17:13:21 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 17:13:21 +0000
Date: Fri, 12 Sep 2025 19:13:17 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/4] drm/xe: Force user context allocations in user VRAM
Message-ID: <20250912171317.7vhkx5iov6m7zyv6@intel.com>
References: <20250910143736.792426-1-piotr.piorkowski@intel.com>
 <20250910143736.792426-4-piotr.piorkowski@intel.com>
 <92d7142e-0700-4fa7-aac9-da1058b3f98b@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92d7142e-0700-4fa7-aac9-da1058b3f98b@intel.com>
X-ClientProxiedBy: TLZP290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1b615f-c163-4393-59af-08ddf21faccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWNhYXQ5UlVLRDJFeVUyaHhmZEEzN2p0TDNTWTYxM2xJNzczT1FTM2JOTjhq?=
 =?utf-8?B?aktRR00zSjY1T1JGTGpIMUFoTW1WYU1qbUQrdklFSnlwZ3lRUkhoVE1kQ1lM?=
 =?utf-8?B?dWNIcUtRVjNEMGF2R2JLVEFOeml3N2xNZ0hqR3AzNEhraDQvN3ZQTk84dHFS?=
 =?utf-8?B?cXo4MlN2WElXWnZQMXY1QlFkcFNMN2Q5Y1F4RFVCTXJXYjNJUnNmTGZha3pR?=
 =?utf-8?B?eXhmVVdPMVhENktCSkVZSnpzSW9iVXBRUWlIbWJqd2d1YlJuU09yWGdITmwx?=
 =?utf-8?B?OFlkczBKMHhldXQzYmVXb1U3U2d5d1VPMUhQZGFCcnVLcEVrM0pXNjZnV21i?=
 =?utf-8?B?S3huWmxIcE53bmt0aGZZVE9ZckdqMHZZUHlSQkRzM2MwcGQ3bUNGOWx6ZnN5?=
 =?utf-8?B?Y2F5cGgveWFBbnpHbkdidExocVVnc2V1WlpOM2xJWFF0cGZUZHJwaUY3VFRy?=
 =?utf-8?B?WlAzcUJZYkQ2NEpJbWZwdk10WVZRRjlRNEp1WUQ2ZVJMbEFBRnBldWQ2Mmt0?=
 =?utf-8?B?d044MTJWNEZHaUUzdzNvNlhkQnBybFIwcVd2TEFSOVhab2pZMXFTWnI2WlRO?=
 =?utf-8?B?eUFialQ3M21JdUVpQ1F5dUdTU0tXKzByR3VoYVdDNkpQSldxN1NwOHcvUVRa?=
 =?utf-8?B?Nmx2YXdna0dDcmxmZFNkbEs5TENvTzA5UFpCYnFwc0tnWURPMXJlWVJMRlMx?=
 =?utf-8?B?TSs3SU91VGF4VG1teG9WNXhadHI3Sk5HTElFRjR6Y0dVMXZkeGtESFh3MXl2?=
 =?utf-8?B?azAwR212SEFLN1ZkWlRpeG5vU3UydWJXV1VnbWdBcTM1NEczdnFaZnY3Y2ls?=
 =?utf-8?B?bWhnMWlsRHNxdk5rVmIxek5EQ2RoOW1YZUIxWFNOYkY5anVPSjVyeTJFVDJj?=
 =?utf-8?B?Z3NnZ0VIdkVUaWdCdUF0RWhZd011YjRnVW9ZZ25hN3RDZjlFbHV1MkdBZ0x6?=
 =?utf-8?B?cnpIbm9mZGVNWEVIbWVuemtpcERuWnExSzZNN1ZTMEdvNlZ4SitSajRkYmdL?=
 =?utf-8?B?S01TV3V5OElOSjVMcjNmN2wwcU9DazFTa2hrVnduOEE4NjlEK3U2eWVxT01Q?=
 =?utf-8?B?aDFKVTVvZllNYU94eXJFQlFFTStka1ZVSUxwcUNCdk1lWk8wNW1UcXhjOG52?=
 =?utf-8?B?dmdQZE45MGdyc0IyRVlIRGZ6MWlLUkN1ZnF4Tkgza0xiakpLc3ZpVHdVd1Nu?=
 =?utf-8?B?M3pzVE5ObUdvZGcyV0FPNWFRWndoMXJ2RWo3eEFydHJEd2ZkZzlxamk4d1p6?=
 =?utf-8?B?MkZhMUk5OHBIZVB6UTJHTHVzbkNDMVN5Si9aejIrTFIvOVJLeit4VXAzczA2?=
 =?utf-8?B?VlFCdE53bDFJWGFvakROM096TXVmZkxKeG1MM2tXVHZTUnUrVHZsTklvK2F3?=
 =?utf-8?B?TERJVHQ0WnhaMkJLWHNGaWFCdWtBWEswaEQ3VUxKcHIxSUlUZmdKOWtURXBX?=
 =?utf-8?B?SVB0MVZwaUR1ZlRVMjNxNXYzYitnTVNKeTVkUnFvem51UkU2MFZTaTF0WGY5?=
 =?utf-8?B?TStVdjl0bEU0YmlEQTdCZzBCVHNkcThiblZYSUZOQjlZRHo4ejFFTEw1Tmp4?=
 =?utf-8?B?b05jTjRRQnNkaDNaYUNBeWEvSndVL091NHFQQ3ZMelVQd3NWRkY2enpHdHRM?=
 =?utf-8?B?V2d6czJhd3lrbTNjWFMrNjcxN0hRci9RQld2cnBDeFV5ejU3YmorYlhCMXA0?=
 =?utf-8?B?am5KanZ1cWJ3dmJnelVObkhzMHQ2aS96TnVGeU5hL0l3anVHa3BKQUJld2Nt?=
 =?utf-8?B?MnRCRXdxYkl1Wm5UR0laTzZuQWxCRk5xUmcrYzhjR1BMaVZ2NHdxSGJwR0s3?=
 =?utf-8?B?RkNlWkw0YjNkMmhvdFpIeW1JdmJOekgvSFRxR3N2K3c2TzBsS3EyWjJERmwv?=
 =?utf-8?B?elNBV1VLM2ZiUzR0SmVINXZlN293Um81TU4rc0F4eWlmbExrcDJZNy82WlFy?=
 =?utf-8?Q?VMaNL6723RA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU41ZlVwczR5c3NBa2ViaUR3K0J3WWxrK3F1b0JRNFdoSkhtazVlZzlFOTN2?=
 =?utf-8?B?YWVMZFRNWXlsOFpvUmNYQis2RjFGeGdrYXNxYjYvTUpadXM4ZlRTS2dpVzJO?=
 =?utf-8?B?TFFEWFVmNlcxNVJYSExUU0xEQmUwZnpjU29YSmhxNmlPQTBFTnYwSStuYlBm?=
 =?utf-8?B?U09VSWpIeFdmeURqNk1xeFRlZ3lWb2MrYUpodk0yeko4OUpPMjh5YUsrSU0z?=
 =?utf-8?B?SFFtRWJmdHpDM3dMVWlBa1ZKS0pLNTFnajJoRndZU3VDVjQrbEs5RUdROEc3?=
 =?utf-8?B?cTZ5MTNCcDhhcXhTOTFVMDV2ZHowRmpMc25ES05oRloyNmtZZTNaVXdDWHlT?=
 =?utf-8?B?QUJiUzlzOE95VkVhdFpoc3dJOE1tYnhEc3FCbGs4MUxKZ0pueHZkTEFtZ1R2?=
 =?utf-8?B?SE1KaG13VFZ3czdIYWlMRjNPbm5xUzczcEF2aWFSVXo5dnkzUzUyendBOE1s?=
 =?utf-8?B?ZVNkS0IyV3VzcUtBSENmT2hEZWprZFk2QTIzNStSVHhvWEN1NGVkeHUrQ3hS?=
 =?utf-8?B?c2daQytuRnVnRWpSN0x6bWw2RDNiU3gwbGxaSjJXN0hYeDIrb0xxbW1mQW5S?=
 =?utf-8?B?OWtaNE84bFpIWWFSd0NGN1ltQkpLTkVya3NCQzlKL0MvQTJhMFhncFI5d0hR?=
 =?utf-8?B?eEF4dXVJcW01U2M1Wk1OTVVPUHFkM2J4WEFqNFNvUm9kNzlEQlJOSDd4MUFo?=
 =?utf-8?B?amNWeDJEOThxTEFPcGhFV1prcjE1MitvdDVlTVAwWnpOaHI3UG9nRi9TNU1C?=
 =?utf-8?B?Zk9abjBRT1o3eGFUcmdQRTRXUmhrdHNRelJtbXFibzNKU1ZuQ1dyNFp5WGow?=
 =?utf-8?B?RVo4cDlHZ1I3Tm5PN1ZOY1NGMDhEbXgzdlVpNlFERWl6blVhVDdHUUlpSlNO?=
 =?utf-8?B?ZmFyczYySjVxR1o0byt6dVo4dWN0L3VTV3lsUXlVNXcway8xVXVSeGlrQVZt?=
 =?utf-8?B?bzRWWWVzSG4yWjhnZlNkajE2LzdHb0lTUlpKVzNBSGdXc1NzNTI5YTdaRklJ?=
 =?utf-8?B?RlZmQXRjVE1BS3lZcnNBcmFNWDV1aEhTaFVscU5ITFkzcG8wLzJ0d3l2cWc2?=
 =?utf-8?B?OTZJaWt6NUtVVFRNUHcvRjYxUlJLNS9wWXY5NzIyWjdNaG5UUkIzRnVlYnhl?=
 =?utf-8?B?VVBWNTJ0TXNPMG84WFd0VFVIMUhWUSt2Rm9SS283VHNiMGJtUmRSRGhQNW1n?=
 =?utf-8?B?eFgweTVpMlVKT3NSbE02ajduV3hQVU5OOWxrb3YrVFBsYWlreldXMXV1NzIx?=
 =?utf-8?B?d3BxMkZFR2l1RzBxaVhqYTYraEF6TXlZR2Z3NkZpWjVUbWVTWGd0d2ZuMVZT?=
 =?utf-8?B?MnQ5UFIxbUlHa0NBYkJBWXBDOFhvbWw5Rkx3ZVkzbERHK25DMktsYzY2aVpu?=
 =?utf-8?B?OSs2SXk4RVNGaVIvVDYyODR5WlZkd3pkanNBa2w1Y1ZxaHc4a3pjRDFHYTBn?=
 =?utf-8?B?aFVEWUZlU05UMERhdVJDbTZjM21KTStaV3dMMCsvdWx5RzFqUG94V3dhMDAy?=
 =?utf-8?B?ZWVxWFBBZDkzb0lyaWJDS2dCTU8wUi9GWi9iZHUrZ05RQlg1S3I2UnNVRkxv?=
 =?utf-8?B?NDdkRTZ4WDZ6VzhObzhVT0NISlIybEh5bUpSdXBwdTJINm1UUjRJQkJ6NUlG?=
 =?utf-8?B?WWNuQXZjOStwZGZJN2hOaE1aV1BXQlJuRTdlNHVudTlDeU92MkI3TUZac2th?=
 =?utf-8?B?QjRYa0ZaeE9ZdXZXZVBUL3dzQkNNbzFRSkZmeUpwcklCZkU0QUVhWUgzRlhV?=
 =?utf-8?B?cGNOdGMrN2svSUd5Y1djUm9LY21FWDlGN242cWhQYlJmV05YS01TRmtUY2xh?=
 =?utf-8?B?SE9COUVvNmovRXpDZ24vTCtuSFUyUVV5UStteWtPNWxXUXN4a1J3Nk1lRHRx?=
 =?utf-8?B?U2lBVm4zUXhSazAxQjBSQWozbWlXVTlRN3RvWFFXZ01WL2VwOEN3KzY3OXB4?=
 =?utf-8?B?SDl5K1IrY01zcU9DdXFiRFc0V0N5Y0E5VmR3YjQ0NExpNXNlcklKZ1RiRFlL?=
 =?utf-8?B?UjlCSUpuY2NrRHZLUFJxQVBxY0I1dXZwZ3FuRmtIR2VjVzA2cTN3QWVTSTU1?=
 =?utf-8?B?VkJNdGl6WlNmM0hLb1hFMFB4OC9yekdWVy9SRWV2YmJ4QWdZZUZlYmFKN1li?=
 =?utf-8?B?ZW9rRWRCZzdQTlhYVmNqR1F1U2U3MTFIUVZIeFo4TDNjS2xRUy81dUhMYzRk?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1b615f-c163-4393-59af-08ddf21faccb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 17:13:21.5661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Rg07FukKXTjGLAw/hrAnVTnTAI798Xe1WFFnr4mGkMVzrQOt7cbZkYk8OP0SMKP+DG+K/Vcnj41knjSarC4pT29yifKBVdpoIF2MHzmhKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7856
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

Matthew Auld <matthew.auld@intel.com> wrote on pią [2025-wrz-12 16:37:31 +0100]:
> On 10/09/2025 15:37, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > In general, kernel structures should be allocated in the kernel-dedicated
> > VRAM region. However, userspace context data - while used by the kernel -
> > does not need to reside there.
> > Let's force the allocation of such data in the general-purpose VRAM region
> > accessible to userspace.
> > 
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec_queue.c | 7 +++++--
> >   drivers/gpu/drm/xe/xe_lrc.c        | 3 +++
> >   drivers/gpu/drm/xe/xe_lrc.h        | 6 ++++--
> >   drivers/gpu/drm/xe/xe_pt.c         | 2 +-
> >   4 files changed, 13 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 063c89d981e5..9a8fa3ed5d09 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -160,7 +160,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> >   	return q;
> >   }
> > -static int __xe_exec_queue_init(struct xe_exec_queue *q)
> > +static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> >   {
> >   	int i, err;
> >   	u32 flags = 0;
> > @@ -179,6 +179,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
> >   			flags |= XE_LRC_CREATE_RUNALONE;
> >   	}
> > +	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
> > +		flags |= XE_LRC_CREATE_USER_CTX;
> > +
> >   	for (i = 0; i < q->width; ++i) {
> >   		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
> >   		if (IS_ERR(q->lrc[i])) {
> > @@ -215,7 +218,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
> >   	if (IS_ERR(q))
> >   		return q;
> > -	err = __xe_exec_queue_init(q);
> > +	err = __xe_exec_queue_init(q, flags);
> >   	if (err)
> >   		goto err_post_alloc;
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 6d52e0eb97f5..423b0a1cde99 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -1340,6 +1340,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> >   	if (vm && vm->xef) /* userspace */
> >   		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
> > +	if (init_flags & XE_LRC_CREATE_USER_CTX)
> > +		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;
> 
> Should this be folded into the vm && vm->xef check above? Seem like we would
> also want LATE_RESTORE in such cases? Could be a separate change since it's
> a behviour change, but looks to be an improvement by itself?
> 

Actually, I hadn't considered that before, as I wasn't sure whether LATE_RESTORE
was also useful in the second wider case. If you think it's a good idea, I can prepare
a separate patch for it as part of this series.


> > +
> >   	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
> >   					    bo_size,
> >   					    ttm_bo_type_kernel,
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > index 188565465779..21a3daab0154 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -44,8 +44,10 @@ struct xe_lrc_snapshot {
> >   #define LRC_WA_BB_SIZE SZ_4K
> > -#define XE_LRC_CREATE_RUNALONE 0x1
> > -#define XE_LRC_CREATE_PXP 0x2
> > +#define XE_LRC_CREATE_RUNALONE		BIT(0)
> > +#define XE_LRC_CREATE_PXP		BIT(1)
> > +#define XE_LRC_CREATE_USER_CTX		BIT(2)
> > +
> >   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> >   			     u32 ring_size, u16 msix_vec, u32 flags);
> >   void xe_lrc_destroy(struct kref *ref);
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 01eea8eb1779..1b9c497f30e1 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -123,7 +123,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> >   		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
> >   		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
> >   	if (vm->xef) /* userspace */
> > -		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
> > +		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
> >   	pt->level = level;
> 

-- 
