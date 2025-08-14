Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF36CA0EE4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 19:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9801110E8D1;
	Thu, 14 Aug 2025 19:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCR8E3Pr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A66010E8D1
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 19:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755198103; x=1786734103;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qCDAMOEsN/oGxPRJD8Qbu/0CvmfFAorCQL80GJo2lc0=;
 b=QCR8E3Prmc7mQjW+tV7GwgAjVTEX9y4D9DQrr92IPDbWU81OsfpiLxUC
 NtqaI+SBGv7145Mp0kYQ9VdqpzIvEB1aK3xZng658gQm1ipD6IFymz6pP
 j/lqGvMY18PmxeU7SzH3Lmmih6qzb/k0/PekbmA90iERgiJxyADSQuKJi
 /jzoXqgLcj+zvNoZSBNp07pq+hhANtaHE5tFjVLlr0lH5X0Fn47L6uqCo
 QIANMV6lAZ1QmJKPvp9sIpShKd9aWg5esYIMljbYM+V3Zmv8IE4MDAtHS
 rddtFi22MjfVvZwpLpSZBaXcswq32Wfer5OdHq13C0A+VgjIJAjpv//HP A==;
X-CSE-ConnectionGUID: vq+iQz1NTAOb16jPr7p3+A==
X-CSE-MsgGUID: cjL+5i6eRrWGu69OjsbTvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="82959475"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="82959475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 12:01:43 -0700
X-CSE-ConnectionGUID: gtNTJsJ2Qui/ivN5dl91WQ==
X-CSE-MsgGUID: O/ii8STWRVqO1rl+OXqrSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="171032076"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 12:01:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 12:01:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 12:01:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.85) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 12:01:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITI+CmpbJlkTxWE6V6Y5B6c4pBMV+IqaiMQD6PGx/XJTfcX+GiPwQKmge2X7JpNeXH3Ih+iT0bf8wW3Jzo6EHkBpmAUEs2eAXhCUzEJp5zoufU81eYt1gJ9z/ZdsfH2VQeGwXYQOaZT/DO8alIIVZNOORZS84JlXRxn1N5+WiO4rWl2yuVKgfiyi1hbnSIfc8ADtPHC/ZBXwin128DGG42mYjbbnlI1bOXnBPM6/cfk7jyfARpperdxDt4q+LV319mmD4IXv/rEkBNiBGbb8rsVyP5qiycWuMh8qZzYMHoPWIMDl9gcmjFS1bWTFOgcaExNgZyl23PNpSutXJEqIbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8F/OSczTBlOHlhrdfDiVdTTm8LOduiq3AYEabxNrI70=;
 b=b4RtHBY5cGFAzkysBiJF4RuFVf1rQqAj5qPY7TWdvpp3r61P60X8c5pvnH5YXBhwD+6WR868QCMfhut5BFiwskx5aoZ+V+Iis419vfWoqjD5uxWUTqk8bbo+u45m7UpLyUA/VKI+fhYNxEY/L+bW7IrCSrRH847ygpnzbGHWyVSbW9KIQCWtYVITRluuZPBzAU97ENSZMRfz3aqRguqa5Ak5mnOnRmB7aADfSEfLkP21VIyXd7jhebq0D1q4PGKlko9vjVOXrwIQvnu1cnXXCi5kOtvKtVqzFhxeOWg4foZnf6eM6QQZlXQh/S+/T2JI4NKJ6rwcOGeYp8hPL9KAZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB4919.namprd11.prod.outlook.com (2603:10b6:510:34::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 19:01:34 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 19:01:34 +0000
Date: Thu, 14 Aug 2025 12:01:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 MADVISE FOR XE (rev7)
Message-ID: <aJ4yigZQgkekQyqG@lstrano-desk.jf.intel.com>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
 <175518561806.236499.16332326224966446672@1538d3639d33>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175518561806.236499.16332326224966446672@1538d3639d33>
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: 884dd1c1-0331-4546-84d4-08dddb64fc6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OCtZSXZlWThmcURsaXQ2S296QWhSVGpaakF0SCswcXVGYVBUWEJucHNHZEta?=
 =?utf-8?B?blB4dUVqSjZRc1ZZMVhSTVV6c1gxb29nWWc1L1JHY1lpWXp4VEQ1SkRvSmtF?=
 =?utf-8?B?K2VtOGJpSDVZOFlzM3N4VGdnRUREclhzZy95dzB1aTUzUGVpZFdrdHVrbVdh?=
 =?utf-8?B?QmNzVGx3Q1NmdWcrQS9JcDR4akNFRG1OMlYvWG92Zm1JOUxyR0taRWFrN3dV?=
 =?utf-8?B?ZllKc3RVT3FHWms0RTdqc3dvbVhRMG1YcjI1Rm0zZ2twR0F0V1N2VWVqdG5a?=
 =?utf-8?B?ZnRrZG53SUR0b2dFTE1RMFk3d0ZsUGRLRFhMenF4U0J4S1BmV0pxeVJ6N0ZP?=
 =?utf-8?B?NWNPWmlsRENaQWdkRzFHZUE4WnJpbU9mbGtzZWNvSTUwQnkwNjVoeW5WL1U2?=
 =?utf-8?B?eUdDOXFReUVPRDdzVUNjQnJsTTl3Mk5WdVk2K0NVTEV1bkk2a1I5QXJXUk5U?=
 =?utf-8?B?TGJwN1NkeXN2S1dqLzFJVDNGZVB1OXBLSWxwZGw3ZGR3RDUrM01TeUVoNnJr?=
 =?utf-8?B?MS9VOWppay9zeDJjU2RlalRpNmVGV1BjWDh1ZFV1Y3FkUVIzdVR1bkxHcmlU?=
 =?utf-8?B?Zk1OZFdqVVdYOWJwR3prMkdXL3lKN1VKdWlXUHhzbityWEVXeUdESnZpb1Nt?=
 =?utf-8?B?YzVraWhpTXo5M2JmK1c0NWtaRFd1Y3l2UGY2bVg3WU9lb1BrTm5wZDg4V21u?=
 =?utf-8?B?aXZwc0c0TmM4UVRKWDMvZk5XSnRoZXJxY2VrTzBHYTRJSkdqRDdvWGNVZVk0?=
 =?utf-8?B?YjJJNUgyOEZvVXU4TDRrZU5NdHZtVmJ3d1pVUzNVSnJVT2pSeitqcmdXSGQ2?=
 =?utf-8?B?Ujl0WHlPd24wNjZWeG1GSVpmOWpUa0ZKQTJVVlRqNjNNV2ZOT0l4OW5nMXh2?=
 =?utf-8?B?dXpTTFloYVZ6Zmd5bTgvR1VYa2htWTRxbDNpc1FJKzV1UEEvT2puamFIWjZG?=
 =?utf-8?B?SytwcVE5d0J6SnQzK3dmUURUZXB5dWhKK2I2anU5ZUVoc1VHM1EzKzlKc0hv?=
 =?utf-8?B?RlcvZ2cwL1VveFFJY2l1V1hMV21xUUpTR1ZzNWNNN01RUWxXODlZaE9sOVlE?=
 =?utf-8?B?ZDYvUGxlNUN0ei9laVlTQUJKZytsTi9JVm5uVWtvdExoRlFYNkM4QUFTRjBZ?=
 =?utf-8?B?cVVhZEU4NTNic2NUTFljdDAvN2lJdUs2RUJTeGM1a1R1eEs1WmtnOURqWW03?=
 =?utf-8?B?RG9hVDJEcWdBbkRGK3Rkc0lnUDBibHlGbzI1UVl3MDNubmpUelMveG5ldTNQ?=
 =?utf-8?B?UVB0S2pTTXRLUEU1TG1GTWFWS2dGeXpFVnVPOXJEMUxCSW1odjBXbkVjZnBh?=
 =?utf-8?B?NGtIV1k5TzdIK3hvckxPMk92UXE3TXdRY0RwZEJMYUdDRWR2OTdsMjhPQ25X?=
 =?utf-8?B?SG1HUzkrNFc4dkVIOWg1bFpET2hhQUFsZFhlbVp2c0hFQUdOQmRNc1NXNERj?=
 =?utf-8?B?NU1zWHg3YnNDTEdvRzFiR0lZd2p6WFYyR3R2dVY0bndyQ1lpUVBMMmtJc09T?=
 =?utf-8?B?OXFUMytRM2ExQXF2OFdTZ2NoN3NwNHlxaG5aMGZvTktIbGZPYzFkWFc1SmJh?=
 =?utf-8?B?dWIvTkhIUkQxcFJCZlhkalAwdTh6TDNMMDZLNkIzd2psYzVnbENVbWE3NjJ4?=
 =?utf-8?B?bVNTZFg4WVNJYzhxNzF6UDVzMk5sdFZkL1lDU2RWaENDa0VKT3hxa21LSXBx?=
 =?utf-8?B?T3lSZGx5azZ6cytwVFJ4WlZramwwOHQwbW9ieXFFanN3RVFYY2s2c09iTjZE?=
 =?utf-8?B?MkxGZG9ieW5TUGticnNvakNEamRXcmVpbkN2OTYzeW8zaDl6cisyRXFuNW1k?=
 =?utf-8?Q?ONbh4bRZef1rSW6/6f/Wjq5kVLShXgXFQ0qa4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWFqbEpqSEx3UUpuSXFEbU1JQXRLU3Q0cnpXODVadTNwWWdOU29WVFpkMkgx?=
 =?utf-8?B?SEdpbXdNK0tRZDNYRmoxbjlKVUxCa2NqVG9ublpUcTZJYUVjSXJrVm9PNE5j?=
 =?utf-8?B?TmNvVzNZZkNmMzJMSkZjekRuWGEvbG44cUJaYnZFaVlWQ21wS1prMUpKOUtu?=
 =?utf-8?B?N1J5WVVxbC9RSndlNlBJT0xORUdYOEVHbjM4SkxPUlRacHRRZHhSbjhlenFs?=
 =?utf-8?B?cHdXNklObGJFSlBpd211eEtlY2xNMEdnaUtuVEVWNWpJcnErbHFZeTFYTzZy?=
 =?utf-8?B?U2FXVllsK3VNak9IQWJ1eHFHU0tFUjhQcmNIcEZtNkRmSm9JM0k5cnNwSTV2?=
 =?utf-8?B?RkRrWTNRYitUdUZVcFRBZ3ZOUExicTl1V09EUXZLYytOaEhrVzVZK2dDcDlL?=
 =?utf-8?B?cnNzaFdVUGxGNXRQL2FLVTV1S1JZRjIrNXlxeDRjSnBSOEdSampxZXhpNWd2?=
 =?utf-8?B?SjNZaEcvVkxPSGpHWmFtSGN1cjlzdXdxYmlMOEMrcDE3eFFnUnc3bllBbkpr?=
 =?utf-8?B?VmdseXlEVGpGTzIyckhQUlF1STYrOGtkSVR2MGJBUUdLbTBOSEYyOXJaRXkw?=
 =?utf-8?B?cVMyZDdVMm5tMGp6b3pwVHU3eUdZZCtIOXAxNmowZHh4N0NldE5zOW0rb3h0?=
 =?utf-8?B?MCtiU1cxQkJpR1FicERpdVBPbUlRTW15bUwwaWxYWGhMa2lMSXNBaTlGc0xh?=
 =?utf-8?B?TUI1dVFZcEV5NGQySE8yajZuQUtjclFDYmU4ay9EcG1reGJ0RGswcFhLOFJK?=
 =?utf-8?B?c0VLSGdTQ2YzSVN2STZjeWk2SlNON0lWTUJia0NYUHpSb2RlUk5ZSGR3aFpK?=
 =?utf-8?B?ZndWVWg0WFR3L01vMmw1bUJtcThhdXlMUmw3WTVLakNtNzcrdWtjUjJCZytX?=
 =?utf-8?B?NUY4OFRjNzcxd0o5THpkekVTQlFadFdFL3BSK3FkNi84NlBaaGI5c2pFUlNK?=
 =?utf-8?B?VFd3QjBYK1lhNDdidFJVdzVEd2tWdC9hTWxBQUJaNGo4MnhueWV3UWk2V0Fz?=
 =?utf-8?B?NnZMdUVuZGdjUkxESWROOEtXVUkybjgvcy9sT092UmpLZUwyMFhTdkQwNDlt?=
 =?utf-8?B?N24rZEloUTRRYXlYZmZqa2p5eGhUdExHYjRZdDZ4N2g0Q2pBL00yRUhCZ0Fr?=
 =?utf-8?B?aXBwL29HRjRiYXFwa0dlSW1GVVJ4Q1pESEFtS01vZ1VYRDFUa0wwS3R2cFlT?=
 =?utf-8?B?N3ZhSlJzWFZYU2psZFNHMUhVcURsU2R2eElTcDN1UFdCbzNWNGR4dUt2QW4w?=
 =?utf-8?B?Rk5HMU1kekFWRmNaS3E5enVrTXFWZXJJN0R6MVVabzNTeTIvQUt2RmZoR0Vj?=
 =?utf-8?B?Q0lLK3RUNFhndko5MkJSWVp1UTJOUzg3TWg5SUJSZ3k0UnVhazdaM1ZVdmJR?=
 =?utf-8?B?L0pPaFovTkFOclZIc3NqVEhyUStxL0RGdjBObGpwN2Erd0YzWmYxUGIreDJo?=
 =?utf-8?B?cTZSeXlCNzVJUVJ4TjZjK3gxMDVjaXBMMlBUdU9CMEVGaHZmQVh0QVd6ZmdR?=
 =?utf-8?B?UGRzSTZmQUFPNDJWTXJpVGJDWkhaRVhBNXc5SXZieDZ5Lzlzb2d2a1ZDQ09X?=
 =?utf-8?B?OWprN0pmVmVZVVpRTDJnT21KRWRObGNhdXozYUlXTFVVYWRkWUUwZFdDejVZ?=
 =?utf-8?B?T2hSMGpxdFUycnJXZDdCSlhxS0FzMUtzazFsSEtpS0JwZFpyMjBFWURta0gx?=
 =?utf-8?B?Q1BiSEtaa1A3RTRaNG95VzdTUGlKZEVZT2ZkNWRYUzEzRjN3WUZSWlRJUHlQ?=
 =?utf-8?B?TmVVRUFHbkw1OU1Wb0trUEtUbnNlTGNVcDdHMTcvM2hpU20waDdTNktzYkJo?=
 =?utf-8?B?TExaWmVaM3FQMERsS0tKL0JraG9weXdkc1JMcDdPdWYxVVJYblpOY2JEcDBN?=
 =?utf-8?B?VUljdWl3RDZxYzV3bW0wN1lraHFQS3pmamRLNVYrdkxUb2x6QnF1RnFjZXIw?=
 =?utf-8?B?RDdnV0FOamlsTHB0cnZpd2wxZ2Q4eWViK21RS010QjI0amdMZmdkdC9DWnV5?=
 =?utf-8?B?TFN3OWN0M3dRd09uem5yMzJjb0JSNm5yT3EvSWRUYitRS3FVNkhxUmNHQTlr?=
 =?utf-8?B?d3BlcG1UUURjbzk0Wi8rcUU4ZmFFMGgwTlE1STVkdFA5T0VqSlRJa2wyYkRG?=
 =?utf-8?B?ZE1hZHBoZkFQRm9Fd0xxL3M4MGxRK3Z4VUQ4RjdrVCtBVFNPTjBLbml4OWNs?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 884dd1c1-0331-4546-84d4-08dddb64fc6c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 19:01:34.3768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/CsCCTuv0EQfhtxQneCSNlGZM5nzAgYFK5oLxh4+KXOkv4z0bdKyfmHG0th04UppLHaJLUoqv+gtilgCFwITw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4919
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

On Thu, Aug 14, 2025 at 03:33:38PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: MADVISE FOR XE (rev7)
> URL   : https://patchwork.freedesktop.org/series/149550/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb_FULL -> xe-pw-149550v7_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-149550v7_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-149550v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-149550v7_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap:
>     - shard-bmg:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap.html
> 

This might be a legitimate issue. On my BMG, I can run
xe_exec_system_allocator 100% reliably, so I suggest testing on BMG to
see if you can reproduce failures with xe_exec_system_allocator before
and after this series. If failures appear only after, we’ll need to fix
them. Let me know if you need any help with debugging—I’ve spent a long
time getting xe_exec_system_allocator stable.

Matt

>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-149550v7_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-adlp:         [PASS][3] -> [ABORT][4] ([Intel XE#5826])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2233])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1466])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][7] ([Intel XE#4543]) +6 other tests dmesg-warn
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_async_flips@invalid-async-flip-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#3768])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@kms_async_flips@invalid-async-flip-atomic.html
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#3768])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-8/igt@kms_async_flips@invalid-async-flip-atomic.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2370])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#316]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1407]) +4 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#3658])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2327]) +4 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>     - shard-adlp:         [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#4543]) +6 other tests dmesg-fail
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][17] ([Intel XE#4543]) +1 other test dmesg-fail
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1477])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#610])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +15 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +11 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1124]) +5 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124]) +11 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#2191])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2191])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>     - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2314] / [Intel XE#2894])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2314] / [Intel XE#2894])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#2191])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1512]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#367]) +4 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#367]) +5 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#367]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#367]) +3 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +18 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#2907]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#2907]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2669]) +7 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2887]) +15 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][40] -> [INCOMPLETE][41] ([Intel XE#3862]) +1 other test incomplete
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#3432]) +2 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#3432]) +3 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#787]) +209 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#455] / [Intel XE#787]) +41 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#787]) +20 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-9/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][49] ([Intel XE#1727] / [Intel XE#3113])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][50] ([Intel XE#3113])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2724])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-2/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#4416]) +3 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#373]) +12 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-3/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#373]) +5 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-6/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#306])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2252]) +10 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#373]) +8 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#1178]) +1 other test fail
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#3278])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][60] ([Intel XE#1178]) +2 other tests fail
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2341]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2320]) +7 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2321]) +2 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2321]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x170.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#308])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1424]) +7 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#308])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#2291])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2291]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#309]) +3 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@forked-move:
>     - shard-bmg:          NOTRUN -> [ABORT][72] ([Intel XE#5826]) +1 other test abort
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-7/igt@kms_cursor_legacy@forked-move.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#323])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2286])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-lnl:          NOTRUN -> [ABORT][75] ([Intel XE#5826]) +3 other tests abort
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-3/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1508])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#5428])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1340])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2244]) +2 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#2244]) +3 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#4422]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#4422])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#5425])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#2373])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2375])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1137])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1421]) +3 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#2316]) +3 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][91] -> [INCOMPLETE][92] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#310]) +2 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2316])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][95] ([Intel XE#5753]) +1 other test incomplete
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-2/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>     - shard-lnl:          [PASS][96] -> [FAIL][97] ([Intel XE#301])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
>     - shard-adlp:         [PASS][98] -> [DMESG-WARN][99] ([Intel XE#4543]) +4 other tests dmesg-warn
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          NOTRUN -> [FAIL][100] ([Intel XE#301]) +1 other test fail
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [PASS][101] -> [DMESG-WARN][102] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
>     - shard-lnl:          NOTRUN -> [FAIL][103] ([Intel XE#4683]) +3 other tests fail
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#455]) +14 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1401]) +2 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2293]) +2 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2380]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1397] / [Intel XE#1745])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1397])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#651]) +8 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2311]) +35 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#5390]) +9 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2312]) +8 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#651]) +14 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#656]) +17 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#651]) +30 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1469])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2352]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#658])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#653]) +24 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#656]) +42 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#653]) +10 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
>     - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2313]) +34 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1503]) +1 other test skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html
>     - shard-bmg:          [PASS][127] -> [SKIP][128] ([Intel XE#1503])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#346])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-6/igt@kms_joiner@basic-big-joiner.html
>     - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#346])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#346])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html
>     - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#346])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-7/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4298])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2934])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>     - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#2925])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#455]) +15 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-8/igt@kms_panel_fitting@legacy.html
>     - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2486])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-3/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#4359])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-433/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
>     - shard-lnl:          NOTRUN -> [FAIL][139] ([Intel XE#5195]) +2 other tests fail
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
> 
>   * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][140] ([Intel XE#616]) +3 other tests fail
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> 
>   * igt@kms_plane_lowres@tiling-4:
>     - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#599]) +3 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-7/igt@kms_plane_lowres@tiling-4.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#4596])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#4596])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-8/igt@kms_plane_multiple@2x-tiling-yf.html
>     - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#5021])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#5021])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-yf.html
>     - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#4596])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#5020])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-2/igt@kms_plane_multiple@tiling-yf.html
>     - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#5020])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#5020])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-466/igt@kms_plane_multiple@tiling-yf.html
>     - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#5020])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#309])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2763]) +9 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
>     - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#2763]) +15 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#870])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#870])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#1131])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2392])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#1129])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#3309])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html
>     - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#3309])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@kms_pm_dc@dc5-retention-flops.html
>     - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#3309])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-2/igt@kms_pm_dc@dc5-retention-flops.html
>     - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#3309])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [PASS][163] -> [FAIL][164] ([Intel XE#718]) +1 other test fail
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#1439] / [Intel XE#836])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#1439] / [Intel XE#3141]) +1 other test skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#1489] / [Intel XE#5899]) +8 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>     - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#5899]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#4608] / [Intel XE#5899]) +4 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#1489] / [Intel XE#5899]) +3 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#2893] / [Intel XE#5899])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#1489] / [Intel XE#5899]) +10 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#1128] / [Intel XE#5899])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>     - shard-adlp:         NOTRUN -> [SKIP][174] ([Intel XE#1122] / [Intel XE#5580] / [Intel XE#5899])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#1122] / [Intel XE#5899])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-cursor-render:
>     - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#5784] / [Intel XE#5899]) +4 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-8/igt@kms_psr@fbc-psr-cursor-render.html
> 
>   * igt@kms_psr@fbc-psr-primary-render:
>     - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#2234] / [Intel XE#2850] / [Intel XE#5899]) +16 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#2850] / [Intel XE#5899] / [Intel XE#929]) +11 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-dpms@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#4609] / [Intel XE#5899]) +2 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@kms_psr@fbc-psr2-dpms@edp-1.html
> 
>   * igt@kms_psr@pr-primary-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#1406] / [Intel XE#5899]) +6 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-5/igt@kms_psr@pr-primary-blt.html
> 
>   * igt@kms_psr@psr-cursor-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#2850] / [Intel XE#5899] / [Intel XE#929]) +6 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-8/igt@kms_psr@psr-cursor-blt.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#2234] / [Intel XE#5899])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#3414]) +1 other test skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#1127])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
>     - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#3414] / [Intel XE#3904])
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#3414] / [Intel XE#3904])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2413])
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#1435])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#1499])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#1499]) +1 other test skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-bmg:          NOTRUN -> [FAIL][191] ([Intel XE#5794])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_configfs@survivability-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#5249])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-436/igt@xe_configfs@survivability-mode.html
>     - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#5249])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-3/igt@xe_configfs@survivability-mode.html
>     - shard-adlp:         NOTRUN -> [SKIP][194] ([Intel XE#5249])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-8/igt@xe_configfs@survivability-mode.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#1123])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>     - shard-adlp:         NOTRUN -> [SKIP][196] ([Intel XE#1123])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#1126]) +1 other test skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_eu_stall@blocking-read:
>     - shard-adlp:         NOTRUN -> [SKIP][198] ([Intel XE#5626])
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-1/igt@xe_eu_stall@blocking-read.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#5626])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-435/igt@xe_eu_stall@blocking-read.html
> 
>   * igt@xe_eudebug@vma-ufence-faultable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#4837]) +9 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-464/igt@xe_eudebug@vma-ufence-faultable.html
>     - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#4837]) +13 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@xe_eudebug@vma-ufence-faultable.html
> 
>   * igt@xe_eudebug_online@basic-breakpoint:
>     - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#4837]) +13 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-5/igt@xe_eudebug_online@basic-breakpoint.html
>     - shard-adlp:         NOTRUN -> [SKIP][203] ([Intel XE#4837] / [Intel XE#5565]) +5 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-6/igt@xe_eudebug_online@basic-breakpoint.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][204] ([Intel XE#261] / [Intel XE#5564]) +1 other test skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-3/igt@xe_evict@evict-beng-large-multi-vm.html
> 
>   * igt@xe_evict@evict-beng-small:
>     - shard-adlp:         NOTRUN -> [SKIP][205] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +1 other test skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-4/igt@xe_evict@evict-beng-small.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>     - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#688]) +6 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>     - shard-adlp:         NOTRUN -> [SKIP][207] ([Intel XE#688])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][208] ([Intel XE#1392])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#2322]) +11 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>     - shard-dg2-set2:     [PASS][210] -> [SKIP][211] ([Intel XE#1392]) +2 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
>     - shard-adlp:         NOTRUN -> [SKIP][212] ([Intel XE#1392] / [Intel XE#5575]) +4 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#1392]) +9 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][214] ([Intel XE#288] / [Intel XE#5561]) +10 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#288]) +18 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>     - shard-adlp:         NOTRUN -> [SKIP][216] ([Intel XE#2360] / [Intel XE#5573])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#2360])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-adlp:         [PASS][218] -> [DMESG-WARN][219] ([Intel XE#3876])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-2/igt@xe_exec_reset@parallel-gt-reset.html
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][220] ([Intel XE#3876])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][221] ([Intel XE#3876])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][222] ([Intel XE#4915]) +222 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-463/igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset.html
> 
>   * igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][223] ([Intel XE#4943]) +30 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][224] ([Intel XE#4943]) +24 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@twice-large-new-race:
>     - shard-adlp:         NOTRUN -> [SKIP][225] ([Intel XE#4915]) +151 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-4/igt@xe_exec_system_allocator@twice-large-new-race.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-adlp:         NOTRUN -> [ABORT][226] ([Intel XE#4917] / [Intel XE#5530])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   * igt@xe_mmap@pci-membarrier-bad-pagesize:
>     - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#5100]) +1 other test skip
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@xe_mmap@pci-membarrier-bad-pagesize.html
>     - shard-adlp:         NOTRUN -> [SKIP][228] ([Intel XE#5100])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-9/igt@xe_mmap@pci-membarrier-bad-pagesize.html
> 
>   * igt@xe_mmap@vram:
>     - shard-lnl:          NOTRUN -> [SKIP][229] ([Intel XE#1416])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-1/igt@xe_mmap@vram.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-bmg:          NOTRUN -> [SKIP][230] ([Intel XE#2457])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-7/igt@xe_module_load@force-load.html
> 
>   * igt@xe_oa@buffer-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][231] ([Intel XE#5103])
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-434/igt@xe_oa@buffer-size.html
> 
>   * igt@xe_oa@invalid-create-userspace-config:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][232] ([Intel XE#3573]) +5 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-466/igt@xe_oa@invalid-create-userspace-config.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][233] ([Intel XE#2248])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-5/igt@xe_oa@oa-tlb-invalidate.html
>     - shard-bmg:          NOTRUN -> [SKIP][234] ([Intel XE#2248])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_oa@rc6-disable:
>     - shard-adlp:         NOTRUN -> [SKIP][235] ([Intel XE#3573]) +6 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-4/igt@xe_oa@rc6-disable.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-adlp:         NOTRUN -> [SKIP][236] ([Intel XE#1337] / [Intel XE#5572])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][237] ([Intel XE#1337])
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-adlp:         NOTRUN -> [SKIP][238] ([Intel XE#1061] / [Intel XE#5568])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-8/igt@xe_peer2peer@read.html
>     - shard-bmg:          NOTRUN -> [SKIP][239] ([Intel XE#2427])
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-7/igt@xe_peer2peer@read.html
>     - shard-lnl:          NOTRUN -> [SKIP][240] ([Intel XE#1061])
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-8/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][241] ([Intel XE#2284] / [Intel XE#366])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][242] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-adlp:         NOTRUN -> [SKIP][243] ([Intel XE#2284] / [Intel XE#366])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-8/igt@xe_pm@s3-d3cold-basic-exec.html
>     - shard-bmg:          NOTRUN -> [SKIP][244] ([Intel XE#2284]) +1 other test skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-3/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-bmg:          [PASS][245] -> [DMESG-FAIL][246] ([Intel XE#5545])
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-5/igt@xe_pm@s3-mocs.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-1/igt@xe_pm@s3-mocs.html
>     - shard-adlp:         [PASS][247] -> [DMESG-FAIL][248] ([Intel XE#5545])
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-adlp-1/igt@xe_pm@s3-mocs.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-2/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-lnl:          NOTRUN -> [SKIP][249] ([Intel XE#584]) +3 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_pxp@display-pxp-fb:
>     - shard-adlp:         NOTRUN -> [SKIP][250] ([Intel XE#4733])
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-6/igt@xe_pxp@display-pxp-fb.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][251] ([Intel XE#4733]) +3 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
>     - shard-adlp:         NOTRUN -> [SKIP][252] ([Intel XE#4733] / [Intel XE#5594])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-6/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][253] ([Intel XE#4733]) +3 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-8/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-adlp:         NOTRUN -> [SKIP][254] ([Intel XE#944]) +1 other test skip
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-4/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][255] ([Intel XE#944]) +4 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-pxp-status:
>     - shard-lnl:          NOTRUN -> [SKIP][256] ([Intel XE#944]) +2 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-3/igt@xe_query@multigpu-query-pxp-status.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][257] ([Intel XE#944]) +4 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   * igt@xe_spin_batch@spin-mem-copy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][258] ([Intel XE#4821])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-436/igt@xe_spin_batch@spin-mem-copy.html
> 
>   * igt@xe_sriov_auto_provisioning@exclusive-ranges:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][259] ([Intel XE#4130])
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
>     - shard-lnl:          NOTRUN -> [SKIP][260] ([Intel XE#4130]) +1 other test skip
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unplug-rescan:
>     - shard-lnl:          [ABORT][261] ([Intel XE#5826]) -> [PASS][262]
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-lnl-3/igt@core_hotunplug@unplug-rescan.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-8/igt@core_hotunplug@unplug-rescan.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][263] ([Intel XE#3862]) -> [PASS][264]
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
>     - shard-bmg:          [FAIL][265] ([Intel XE#5376]) -> [PASS][266] +1 other test pass
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-bmg:          [SKIP][267] ([Intel XE#2291]) -> [PASS][268] +2 other tests pass
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-adlp:         [ABORT][269] ([Intel XE#4847]) -> [PASS][270]
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-adlp-3/igt@kms_fbcon_fbt@fbc-suspend.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [SKIP][271] ([Intel XE#2316]) -> [PASS][272] +4 other tests pass
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][273] ([Intel XE#301]) -> [PASS][274]
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][275] ([Intel XE#4543]) -> [PASS][276] +10 other tests pass
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-adlp-4/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-6/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         [DMESG-FAIL][277] ([Intel XE#4543]) -> [PASS][278] +9 other tests pass
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-adlp:         [DMESG-WARN][279] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][280] +4 other tests pass
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-bmg:          [SKIP][281] ([Intel XE#4596]) -> [PASS][282]
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_psr@fbc-psr-suspend@edp-1:
>     - shard-lnl:          [ABORT][283] ([Intel XE#2625] / [Intel XE#4847]) -> [PASS][284] +1 other test pass
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-lnl-7/igt@kms_psr@fbc-psr-suspend@edp-1.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-2/igt@kms_psr@fbc-psr-suspend@edp-1.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][285] ([Intel XE#4459]) -> [PASS][286] +1 other test pass
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-dg2-set2:     [SKIP][287] ([Intel XE#1392]) -> [PASS][288] +4 other tests pass
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
>     - shard-lnl:          [FAIL][289] -> [PASS][290]
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [SKIP][291] ([Intel XE#2341]) -> [FAIL][292] ([Intel XE#1178])
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-6/igt@kms_content_protection@legacy.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-3/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-bmg:          [ABORT][293] ([Intel XE#5826]) -> [SKIP][294] ([Intel XE#2291])
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][295] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][296] ([Intel XE#301])
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-rmfb:
>     - shard-adlp:         [DMESG-WARN][297] ([Intel XE#5208]) -> [DMESG-WARN][298] ([Intel XE#4543] / [Intel XE#5208])
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-adlp-4/igt@kms_flip@flip-vs-rmfb.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-2/igt@kms_flip@flip-vs-rmfb.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][299] ([Intel XE#2312]) -> [SKIP][300] ([Intel XE#2311]) +10 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][301] ([Intel XE#5390]) -> [SKIP][302] ([Intel XE#2312]) +1 other test skip
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][303] ([Intel XE#2312]) -> [SKIP][304] ([Intel XE#5390])
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][305] ([Intel XE#2311]) -> [SKIP][306] ([Intel XE#2312]) +11 other tests skip
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][307] ([Intel XE#2313]) -> [SKIP][308] ([Intel XE#2312]) +5 other tests skip
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-bmg:          [SKIP][309] ([Intel XE#2312]) -> [SKIP][310] ([Intel XE#2313]) +3 other tests skip
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-adlp:         [SKIP][311] ([Intel XE#5915]) -> [SKIP][312] ([Intel XE#836])
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-adlp-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][313] ([Intel XE#2426]) -> [FAIL][314] ([Intel XE#1729])
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-dg2-set2:     [FAIL][315] ([Intel XE#1729]) -> [SKIP][316] ([Intel XE#362])
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][317] ([Intel XE#2426]) -> [SKIP][318] ([Intel XE#2509])
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
>   [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4847]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4847
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
>   [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249
>   [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
>   [Intel XE#5428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428
>   [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5568
>   [Intel XE#5572]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5572
>   [Intel XE#5573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5573
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
>   [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
>   [Intel XE#5753]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5753
>   [Intel XE#5784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5784
>   [Intel XE#5794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5794
>   [Intel XE#5826]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5826
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#5899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899
>   [Intel XE#5915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5915
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8493 -> IGT_8494
>   * Linux: xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb -> xe-pw-149550v7
> 
>   IGT_8493: 8493
>   IGT_8494: 8494
>   xe-3545-7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb: 7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb
>   xe-pw-149550v7: 149550v7
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149550v7/index.html
