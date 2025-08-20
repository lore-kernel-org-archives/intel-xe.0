Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B075ECA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 20:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7290010E286;
	Wed, 20 Aug 2025 20:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcTZrIXX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1B710E286
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 20:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755722637; x=1787258637;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QNS4yN1fwxupPcYBCw0qvufLktc2TsH56yJdz3Et49Y=;
 b=GcTZrIXX8GukzK47s5rv6AyjkEjz98Aviy4KmvA0YUpZ0VV/RC0p8yp+
 PTf4f8RIAFGvfESeH59q7UV9RVerMxBVHH6+HbkYegPB0LXg0LRRXLvlx
 AGkXdiFjGEIM8StUT2IipnZztIhk7Q8vX75f5PKFuJMdl0tFJAeXwB1et
 2W4bSjnGzNaFp7Sf8fXTMQRC9abTKQxqnP9E8uVuI4ZX48KF0mmdZuBM2
 ok4+yElp7caPF44B3ipB1NDYVbXAbaSUXg6hUe5r6G4c6zR70Tkepyv4j
 VQQKX/vmf3BASKPLgjqI0b+x4FGCMxKawFTBglMmNPyKsltrbviIyznVg A==;
X-CSE-ConnectionGUID: 1RrxWn9iQNigaD4T03RqzQ==
X-CSE-MsgGUID: qRfiTPcLTAGUCsKwDxJOyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58098315"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="58098315"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 13:43:57 -0700
X-CSE-ConnectionGUID: ZDq5x/dARXGKRO9xMNGD7g==
X-CSE-MsgGUID: hIyMeX83RSeSCYLBff4aEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="191910519"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 13:43:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 13:43:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 13:43:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.49)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 13:43:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBvTdnijlSn4oKZDB5ARvQ6Tv+8sbApxK4GyoKcT9XTfbHxRgyI53fpHbnN+pT3m2HTTdpIQaDe3iF6vqEN7Ykbn3CnC1NOfDzoKl9KrIw7K1CPLYB0GGbwlkKwO6VBRdSo5Z2d/6habziWvWeaWeTOpT5oxEYceycclPvq6CM+YNSxP707Pof8LGPa48WGhKJTD/2EYeGQfWrlNily9fIuJUc+HcpMRXPdbU4tl+2/lFOTWyTAxlNq76JizJcdvg+y1a4waLKbW+fI4nY7K3RcKOpglh3kclBB4pihqh86MIio8GHT7PFPQ4eT38GaJPkSJwWNKjhYrKQAZY18B4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hcvedq0HsqDFhlis8IIXzAEGzVCR2A/dfvtT/5Au/RI=;
 b=FqjJovqObCW/Jpwk6A7UxuliVIyWYYb6bZ4/NfB/VUa/1nJssx7UbMnt4xH3pcKJuqHpKb7IVo4YcO+45a5mAhFN+23cr1/nHdh6wWPr7TurEG6enzUnbAzXN5qSr7Ni5SthdnpuzLAXF8DNdBSBnmvjASCjPHyFOeV/8MG58ULo2hH7Mwb5+88/kQei+stMsGQ2jU7COKiBAaCwTJEeESccIyB6fSCBW/bmfAbL1EWWF8s0R3R7Sqm+LJZdz+DjNE/MTorgUUR3pX7e6eUnIVBIuh/P5Zwg2wyHfMR1L1s5wG5wNTiz0vAo78IZNuIi+yCnuoOsMyYAs7Mdl77Rbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB7661.namprd11.prod.outlook.com (2603:10b6:510:27b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 20:43:47 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 20:43:47 +0000
Message-ID: <effd8c89-1b57-4b16-a7bf-99af9405f06f@intel.com>
Date: Wed, 20 Aug 2025 16:43:45 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v6 2/6] drm/xe/guc: Add LFD related abi definitions
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-3-zhanjun.dong@intel.com>
 <dc4f3619-ff9a-4a63-bea6-978042efdb39@intel.com>
Content-Language: en-US
In-Reply-To: <dc4f3619-ff9a-4a63-bea6-978042efdb39@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:303:8d::17) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d0aee0-3a73-40e8-9a4e-08dde02a431e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ck80QU0zRUVpWkd2eFZxa3E5Sk5SSGRSZGdRcXU3MjAzSVpUMEVZMnoyRW5x?=
 =?utf-8?B?bmFNaW8rZ1hWK0NGaUlabzhRVUhJSVk5UStFeXpwOEZPNmdNbkVvUUZyWVl0?=
 =?utf-8?B?YUR3VW1TWVZWaDRzb3VnN21sRW54ei9OcndMVURhd29sZitsSjE5ai94SVFO?=
 =?utf-8?B?WnVkd2xlYzJMWnptMy9lQ3p5a09CUXJxaGRuNWRvL3BJNTE3NllrVEQ3VmVJ?=
 =?utf-8?B?RXhOS3JJMjQ1SjEzMFRZZ3hMVjR4NmJCYWgwOUxzaGYvV2UvT3ZoRnlsc3Ni?=
 =?utf-8?B?Nm5kcXpNcWdNWG14bmcvOU9mNWZIajc3Sm11OThBR2ExTlhDYUJJSVdNd3lW?=
 =?utf-8?B?Qy9qKy9Ja3UwU0t4MS9qTDVJWVN2aTkyWHprUDFCS1hVZ3QxWTZVSTJiVUJJ?=
 =?utf-8?B?RWphZ1JFNWxEWERZMU1PYlZydXdsaldQb3B3TE5rMnRwRkg1Yk9vRThpamtk?=
 =?utf-8?B?RVRKWnRLc2hWQVZzQWF1RHBkeEVTTjltRU9xZno2RmZ3bzBKWUVYS1gySTJ5?=
 =?utf-8?B?cUswNVBTclFWZklocjJlVzRkM3h5cis1S1Arb1VrMUhKVE0vbXhmL0dMN2g5?=
 =?utf-8?B?dm9ZcXJMRU9GOFpkdW12Y1lsWldUcXRNekVFeVFFTytQSGpVWG5RS3VVSDVI?=
 =?utf-8?B?WFF2RmU0bHQwbWhqckZnd2tJR25KcHRKSXpTSFcxbThUTTE0Z21yMTh1QmVa?=
 =?utf-8?B?Rm03enh5L1hibUpoa2E0V0R2SUdFbFhOTG5ZS3BJeEdQS2hkalVCNDFIekxK?=
 =?utf-8?B?R0gxZFhlaCsxT0sxU1d5U3NXNllKbXJlMU5EY1Blc0VKV21qQndXTGNQOVZp?=
 =?utf-8?B?d0RqZ3VmOWtRaklSRUtwcnJqQ0lFbTBWQ0NPTXN6azZNbkJ1cHhPczE2bE1M?=
 =?utf-8?B?TTh5aHl2QlB2ZjIwRGNZZExMNC9EekhhZ2Z5VjV0Rk94dmV6RDh2bzZQYkJj?=
 =?utf-8?B?ZkdiTXlzQ3lqV1MxaUZHT0pZNklkdnRBNEhUc3liSk40SVpnQkFLRGNYdFZ1?=
 =?utf-8?B?bEFiM0wzSzEzRzFYMUdXcGhGRHhaYlZ4Zk8zMmFyLzJnNkpsd0ZzTE1iY3Nm?=
 =?utf-8?B?bzFqM09XdnlGenJTRjllWm9BNVVoaFNYeXBnZDYwU3JpSDNTUkt4YVBHUFVQ?=
 =?utf-8?B?blBBblkxM0Q1b1k0N2htTGRza3Y0eHR3dnNwVHZKcW9GMlEvZUpFRVFBSmR6?=
 =?utf-8?B?LytsMHhSd0twdHVGdTJYQ3djbk93dEhHUWVGS3FkRmMrbWltanE4Nm9pOGlz?=
 =?utf-8?B?dWk2VzM0VlY3ckdYcHJXQW9jOVc2Sy82eXg4YkdYN3Q2RjRPQWk3ZmRiRDUv?=
 =?utf-8?B?VjFlaTZ2TlFNRDJucGVoQi9HbDlsMk1TWm9Ta05zYmI4TkZMS2NQRG5TYmk4?=
 =?utf-8?B?R25kRkRuWFo3ME1raGhPc1V3ZkVMREFOaGpLaEIzSE8wdnd0UUp0YXVHYno0?=
 =?utf-8?B?bjZUUmMxZS9Gbk0rZ0d6YklQb1VSMW44VkpIS05iSTl6bDR0ZHgxNlJ6S2dK?=
 =?utf-8?B?U29ZSTlKTjdTbGN0SGpvNDZ0QWJrb2c4MlE2RktaSC9UYnBYKzdGUGJQQ0J4?=
 =?utf-8?B?TVBaSytuT21IUk5VbFZTMTZWWVVuRDNYSmFCRTV1KzZaNitXSXF3OXUvaHlQ?=
 =?utf-8?B?QXYvK292OHBiRGhEdHVydEsxTis5Tys1TUpGRFRvMEd4RXBVZUpsNVZUQ2pa?=
 =?utf-8?B?Y3dGTEJSMWJ0UzJ4cHROWTgwY3I3ZTk3WnFjSEM4b28xd1d1QUdtd0dEUlUv?=
 =?utf-8?B?YWVyOGVFQ1F0Yy8ycS81UDVxSm9EMU51bWE5em53UHA3SWxnS3ZLNTF2Qmow?=
 =?utf-8?B?dnEzd3p1MjFJRi9TaElYc2o0aWR4UVp6eHZ3RUQ2dXhGdzhsQ1JGZnQ3UUh5?=
 =?utf-8?B?bVBkMDRlb0gyUEsrbDJJWVRwb2xTdFcvRnI1bWxQNURlYVNiKzY5cnllNjlm?=
 =?utf-8?Q?ieIaM21KcPY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmlYY0xTWXA1ZVllMGt1NWxaTG9kbkhEUERzaE9ISjg1eWJyN0NVRHNWMS90?=
 =?utf-8?B?TXVYQzdVeThuN1BGZk5SS0daUnhRRDFqMVBIaDYxa01YV3FtTm9mbDFtZzIy?=
 =?utf-8?B?NzZZNGphSUVwcmdxc28zN0ZsMmhwVkVzTGZ2ODA5NlRKNHFJQ1ZKRHBZZ3Qv?=
 =?utf-8?B?RzBud1NVeWlXZ0JWcTh6N0ZTM0hRM2RCWGJrNm8vRHdsRm1aamJmWFliejZG?=
 =?utf-8?B?VUlINHZhU3FwY3owNEVVTnFuOGFxMjhPYlczREpnbnJMOHJzTjRBVklpSVF0?=
 =?utf-8?B?YWNWNXpHWDlhSXlNQWtpZVFTUGNBQjdOZzdtSHo4anJwelQwQXdXeWt1anE4?=
 =?utf-8?B?MDM5cnc4eDlpUVhWVG5ma2c2bGhkeExaMzhBUVJudnVRVHlDYVVybE5GZE1E?=
 =?utf-8?B?WWxLY3VvcFFJcnhvVUVTT29LWXlwNU80a2Q0SWhOMlJEb3lVT2hGQ3VqLyt5?=
 =?utf-8?B?VWpGckpGSmtkZHh3a3pvN2FLQlFDTE1SVDFEYU5JcWJWd2FoMUtEMVhPWHJH?=
 =?utf-8?B?NXhZWVN2WGYvbm9Kck1WWG5TQjNoVXBTMzQxNmpwNlpNWHZJbUIyL0llbnp1?=
 =?utf-8?B?eXBFbzkySkhmZGplYnJKMG5IRVAwclRLcmczanFPUEdjS0dVeHIza0ltNEJr?=
 =?utf-8?B?d3ZWaUVGYkkxWUs3cXNKaHlLektYQzhyTXhiRHNGVC9LUHZsWU04M3BmT1dS?=
 =?utf-8?B?UXBXd201U3hqVU5SMmJwRHMxQXh1OTJCVnFOaFV4SHQxcGNheVFHVE9Mbmsw?=
 =?utf-8?B?aHNvTGsvSFFPd0w3aG1Id0tDZ1FLb3BhUVF0TTVVdG1Nd2hqdEpMQ2xMSDc0?=
 =?utf-8?B?U1FXVGx6Wk5uNGJOenRBVHBlQnlIb2ZKT0l0cWRVY1lMWjllVmdEVFk3OFRK?=
 =?utf-8?B?QjF6anY2bklrdGdWWmhhZ1ArR2FUcVFDanN3L0lsVGpMeDhLZDd3b0FrZnZT?=
 =?utf-8?B?ZDhkWmNFemV4QnF3TUR0TG5JYkh5alhnS2VBeTZaWG9WbzVYMmd3SUdmTytR?=
 =?utf-8?B?Q1VCN1F0UTdwZm9VRnBub1RqTHZJY2o0VnhzYVExY2U0bkd2cW5FODBpVFo1?=
 =?utf-8?B?dVl6RExDSWZFdHZheStZbzN6Z3J3Nm91N2JhMUtKS1loZzhYb0xRS2I4Wmll?=
 =?utf-8?B?TDJzUlg4eVpyZnY2N3pUa0tjN2YyL0xpaDJWYU4wRk92ZGtUTnE5NDdSZjFt?=
 =?utf-8?B?dVlsVGpRdFNDRU1kd1VYeGYvY256am9aSVhXQ1NSWklERnhOY3NVU05pbko1?=
 =?utf-8?B?UDlCY2pheUdjOElkc1ovdTVVU1ZweWVtVGY4Q2k5YlVORWtGaWZZNzVkcitZ?=
 =?utf-8?B?dnErYWlTMXc5WDRKSWpmaUllRVdxVDVNMldZUDZTK21MaE9HeCtGNVdBTmVZ?=
 =?utf-8?B?UFdYSDdDaXllaE5NaEZnZmlXZ3JZNkxQcEp2TGdLSThsZUtISWFzWGpxWFE3?=
 =?utf-8?B?NWFpV1VicU9ITDc0ejVVdGVoOUNFK0pjNk1WaE04YnpST05sT1pwM1hIY21J?=
 =?utf-8?B?VGF1YUEvUk44Ymhqd2FmOGlBNW9JN0RKYkZ4UFdtVUEycTluQU8zWjFEVUQ5?=
 =?utf-8?B?bFNRMGU3UVFRNFJMSVc3a1NoQWJmTklPTHhldlVVbW1VMTY4TUI2ZTBYRWtz?=
 =?utf-8?B?ejcrSUtxSjR6RjI0S1l5aGhvOXg5cWlsLzhvWkNoc1lSdWthRXdBaFNjL25G?=
 =?utf-8?B?djQ4N0d0OTBFMU9DS3laYk5JZmN5Z0liUlJDMzA5NkpteVJnZW14d0Z0NWpB?=
 =?utf-8?B?WDBESTl6YzFYMFVWNHdjcVlzZXBSQytZNGpUZHhzQlZkaWVNZldGWW1vTDVI?=
 =?utf-8?B?Z3ZuTy9lT0p5THQxKzdUUlA1bXhJc1lzZVJvZnhydC9KdUpMR1dwdEN2Y2gy?=
 =?utf-8?B?eEE3RnQ3UzlKMU1XdndXUzRieGFVcTN4TGx5SVZSU3MwUTgvd2tTcWV6OHoy?=
 =?utf-8?B?Wm9YNVphenUzamdtRExoRlQrQlMyRmYxR2RIbnJ0eEVHcnlHNTB3YzFJaVcy?=
 =?utf-8?B?UlRmYjI5ZUkxTWp4Y0NMVlFXWmpVa1JrZ2N3NTNzYUVGV24vTElMTzRnWi9B?=
 =?utf-8?B?K201YlNLY2s1cG11UlVpcTdLa1NVNlpNK1JrNEkwOGF5Wm91ZlByRi95aUUx?=
 =?utf-8?B?QXpSUDl5ME5DVmhiSlRnUDVQYTJmTzRIVzRJcjFXN3dhRC9xbklpa0lHdFVx?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d0aee0-3a73-40e8-9a4e-08dde02a431e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 20:43:47.6853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/FfFqYPeMQy7QynVF5RFhGE5+54/qay8IauhxBrLK8/cC2coLHQvMmXUzlqKWYp7vmiwHfIaXObhw+eptsz5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7661
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



On 2025-07-29 2:07 p.m., Michal Wajdeczko wrote:
> 
> 
> On 7/22/2025 3:35 AM, Zhanjun Dong wrote:
>> Add GuC LFD (Log Format Descriptors) related ABI definitions.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_lfd_abi.h | 282 +++++++++++++++++++++++++++
>>   1 file changed, 282 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/abi/guc_lfd_abi.h
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
>> new file mode 100644
>> index 000000000000..b6888ab47e25
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
>> @@ -0,0 +1,282 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_GUC_LFD_ABI_H_
>> +#define _ABI_GUC_LFD_ABI_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#include "guc_lic_abi.h"
>> +
>> +/* Magic keys define */
>> +#define GUC_LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
>> +#define GUC_LFD_LOG_BUFFER_MARKER_2		0xDEADFEED
>> +#define GUC_LFD_CRASH_DUMP_BUFFER_MARKER_2	0x8086DEAD
>> +#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
>> +#define GUC_LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
>> +#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
>> +#define GUC_LFD_DATA_HEADER_MAGIC		0x8086
>> +
>> +/* The current major version of GuC-Log-File format. */
>> +#define GUC_LFD_FORMAT_VERSION_MAJOR		0x0001
>> +/* The current minor version of GuC-Log-File format. */
>> +#define GUC_LFD_FORMAT_VERSION_MINOR		0x0000
>> +
>> +/** enum guc_lfd_type - Log format descriptor type */
>> +enum guc_lfd_type {
>> +	/**
>> +	 * @GUC_LFD_TYPE_FW_REQUIRED_RANGE_START: Start of range for
>> +	 * required LFDs from GuC
>> +	 */
>> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
>> +	/**
>> +	 * @GUC_LFD_TYPE_FW_VERSION: GuC Firmware Version structure. LFDs
>> +	 * payload is guc_lfd_data_fw_version
> 
> hmm, if this type identifies specific lfd payload, why it uses a lic type?
> 
> if both types has to match, say that, and add static_assert to check that somewhere
> 
> (edit: or maybe those lfd specific structures are simply redundant, and
> you can directly say here that payload is that lic or other struct)
To be changed to number
> 
>> +	 */
>> +	GUC_LFD_TYPE_FW_VERSION = GUC_LIC_TYPE_GUC_SW_VERSION,
>> +	/**
>> +	 * @GUC_LFD_TYPE_GUC_DEVICE_ID: GuC microcontroller device ID.
>> +	 * LFDs payload is guc_lfd_data_guc_devid
>> +	 */
>> +	GUC_LFD_TYPE_GUC_DEVICE_ID = GUC_LIC_TYPE_GUC_DEVICE_ID,
>> +	/**
>> +	 * @GUC_LFD_TYPE_TSC_FREQUENCY: Frequency of GuC timestamps. LFDs
>> +	 * payload is guc_lfd_data_tsc_freq
>> +	 */
>> +	GUC_LFD_TYPE_TSC_FREQUENCY = GUC_LIC_TYPE_TSC_FREQUENCY,
>> +	/**
>> +	 * @GUC_LFD_TYPE_GMD_ID: HW GMD ID. LFDs payload is
>> +	 * guc_lfd_data_gmdid
>> +	 */
>> +	GUC_LFD_TYPE_GMD_ID = GUC_LIC_TYPE_GMD_ID,
>> +	/**
>> +	 * @GUC_LFD_TYPE_BUILD_PLATFORM_ID: GuC build platform ID. LFDs
>> +	 * payload is guc_lfd_data_build_platformid
>> +	 */
>> +	GUC_LFD_TYPE_BUILD_PLATFORM_ID = GUC_LIC_TYPE_BUILD_PLATFORM_ID,
>> +	/** @GUC_LFD_TYPE_FW_REQUIRED_RANGE_END: End of this range */
> 
> "End of this range" is repeated few times below, make it unique per enum
Sure
> 
>> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
>> +	/**
>> +	 * @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START: Start of range for
>> +	 * required LFDs from GuC
>> +	 */
>> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
>> +	/**
>> +	 * @GUC_LFD_TYPE_LOG_EVENTS_BUFFER: Log-event-entries buffer. LFDs
>> +	 * payload is guc_lfd_data_log_events_buf
>> +	 */
>> +	GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
>> +	/**
>> +	 * @GUC_LFD_TYPE_FW_CRASH_DUMP: GuC generated crash-dump blob.
>> +	 * LFDs payload is guc_lfd_data_fw_crashdump
>> +	 */
>> +	GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
>> +	/** @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END: End of this range */
>> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
>> +	/**
>> +	 * @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START: Start of range for
>> +	 * required KMD LFDs
>> +	 */
>> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
>> +	/**
>> +	 * @GUC_LFD_TYPE_OS_ID: An identifier for the OS. LFDs payload is
>> +	 * guc_lfd_data_os_id
>> +	 */
>> +	GUC_LFD_TYPE_OS_ID = 0x4000,
>> +	/** @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END: End of this range */
>> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
>> +	/**
>> +	 * @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START: Start of range for
>> +	 * optional KMD LFDs
>> +	 */
>> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
>> +	/**
>> +	 * @GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT: Binary representation of
>> +	 * GuC log-events schema. LFDs TLV payload is
>> +	 * guc_lfd_data_binary_schema
>> +	 */
>> +	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
>> +	/**
>> +	 * @GUC_LFD_TYPE_HOST_COMMENT: ASCII string containing comments
>> +	 * from the host/KMD. LFDs TLV payload is
>> +	 * guc_lfd_data_host_comment
>> +	 */
>> +	GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
>> +	/** @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END: End of this range */
>> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
>> +	/** @GUC_LFD_TYPE_RESERVED_RANGE_START: Start of reserved range */
>> +	GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
>> +	/** @GUC_LFD_TYPE_RESERVED_RANGE_END: End of this range */
>> +	GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
>> +};
>> +
>> +/** enum guc_lfd_os_type - OS Type LFD-ID */
>> +enum guc_lfd_os_type {
>> +	/** @GUC_LFD_OS_TYPE_OSID_WIN: Windows OS */
>> +	GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
>> +	/** @GUC_LFD_OS_TYPE_OSID_LIN: Linux OS */
>> +	GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
>> +	/** @GUC_LFD_OS_TYPE_OSID_VMW: VMWare OS */
>> +	GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
>> +	/** @GUC_LFD_OS_TYPE_OSID_OTHER: Other */
>> +	GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
>> +};
>> +
>> +/**
>> + * struct guc_lfd_data - Log format descriptor (LFD).
>> + * A type of KLV with custom field-sizes + magic numbers.
>> + */
>> +struct guc_lfd_data {
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32 dw0;
>> +	/*
>> +	 * Expected value: GUC_LFD_DATA_HEADER_MAGIC.
>> +	 * Helpful in detecting file errors.
>> +	 */
>> +#define GUC_LFD_DATA_MAGIC		GENMASK(15, 0)
>> +	/*
>> +	 * File descriptor type (the 'T' in TLV) is used to identify how
>> +	 * to interpret `data` below. For the range of types, see
>> +	 * guc_lfd_type
>> +	 */
>> +#define GUC_LFD_DATA_DESC_TYPE		GENMASK(31, 16)
>> +	/** @dw_size: Number of dwords the `data` field contains. */
>> +	u32 dw_size;
>> +	/** @data: Data defined by File descriptor type. */
>> +	u32 data[] __counted_by(dw_size);
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_version - GuC Log File Format Version.
>> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
>> + * than 1.12)
>> + */
>> +struct guc_lfd_version {
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32 dw0;
>> +	/*
>> +	 * Guc-Log-File Format minor version. Must be
>> +	 * GUC_LOG_FILE_FORMAT_VERSION_MINOR
>> +	 */
>> +#define GUC_LFD_VERSION_MINOR	GENMASK(15, 0)
>> +	/*
>> +	 * Guc-Log-File Format major version. Must be
>> +	 * GUC_LOG_FILE_FORMAT_VERSION_MAJOR
>> +	 */
>> +#define GUC_LFD_VERSION_MAJOR	GENMASK(31, 16)
> 
> very easy to confuse with
> 
>    #define GUC_LFD_FORMAT_VERSION_MAJOR	
>    #define GUC_LFD_FORMAT_VERSION_MINOR
> 
> maybe there should be:
> 
> GUC_LFD_VERSION_DW0_MASK_MAJOR	GENMASK()
> GUC_LFD_VERSION_DW0_MASK_MINOR	GENMASK()
> 
> and
> 
> GUC_LFD_VERSION_MAJOR	1u
> GUC_LFD_VERSION_MINOR	0u
Will do a cleanup among this series, to rename all macros names for 
GENMASK to be
STRUCTURE_NAME_XXX_MASK_YYY
XXX is structure field name
YYY is bit field name


> 
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_guc_devid - GuC Device ID.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_guc_devid {
>> +	/**
>> +	 * @guc_devid: GuC microcontroller device ID defined as described
>> +	 * in GUC_LIC_TYPE_GUC_DEVICE_ID
>> +	 */
>> +	u32 guc_devid;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_tsc_freq - GuC TSC Fequency.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_tsc_freq {
>> +	/**
>> +	 * @tsc_freq: GuC timestamp counter frequency as described in
>> +	 * GUC_LIC_TYPE_TSC_FREQUENCY
>> +	 */
>> +	u32 tsc_freq;
>> +} __packed;
>> +
>> +/** struct guc_lfd_data_gmdid - GMD ID. */
>> +struct guc_lfd_data_gmdid {
>> +	/** @gmd_id: GMD ID as described in GUC_LIC_TYPE_GMD_ID */
>> +	u32 gmd_id;
>> +} __packed;
>> +
>> +/** struct guc_lfd_data_build_platformid - GuC build platform ID. */
>> +struct guc_lfd_data_build_platformid {
>> +	/**
>> +	 * @platform_build_id: GuC build platform ID as described in
>> +	 * GUC_LIC_TYPE_BUILD_PLATFORM_ID
>> +	 */
>> +	u32 platform_build_id;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_log_events_buf - GuC Log Events Buffer.
>> + * This is optional fw LFD data
>> + */
>> +struct guc_lfd_data_log_events_buf {
>> +	/**
>> +	 * @log_events_format_version: version of GuC log format of buffer
>> +	 */
>> +	u32 log_events_format_version;
> 
> need defines for VER_1 and VER_2
This header file is for LFD abi, and LFD feature do not interpret log 
event data contents, so details inside log event buffure seems out of 
scope. Better to avoid mention things not touched.

> 
>> +	/**
>> +	 * @log_format_buf: If `log_format_version` == 1, array of
>> +	 * guc_log_format_version_1. If `log_format_version` == 2, array
>> +	 * of guc_log_format_version_2. Dword size determined by
>> +	 * guc_logfile_lfd.`desc_dw_size` - 1
>> +	 */
>> +	u32 log_format_buf[];
Will be changed to
	@log_event: The log event data.>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_os_info - OS Version Information.
>> + * This is mandatory host LFD data
> 
> btw, why is it mandatory?
That is come from LFD spec. My understanding is UMD tools need this OS 
info for parsing.
As John commented, not need to specify, will be removed.
> 
>> + */
>> +struct guc_lfd_data_os_info {
>> +	/**
>> +	 * @os_id: enum values to identify the OS brand (1=Windows,
>> +	 * 2=Linux, etc..). See guc_lfd_os_type for the range of types
>> +	 */
>> +	u32 os_id;
>> +	/**
>> +	 * @build_version: ASCII string containing OS build version
>> +	 * information based on os_id. String is padded with null
>> +	 * characters to ensure its DWORD aligned. Dword size determined
>> +	 * by guc_logfile_lfd.`desc_dw_size` - 1
>> +	 */
>> +	char build_version[];
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_fw_version - GuC FW Version.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_fw_version {
>> +	/**
>> +	 * @guc_sw_version: The full version of the GuC microkernel that
>> +	 * generated the logs as described in
>> +	 * GUC_LIC_TYPE_GUC_SW_VERSION.
>> +	 */
>> +	struct guc_sw_version guc_sw_version;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_logfile_header - Header of GuC Log Streaming-LFD-File Format.
>> + * This structure encapsulates the layout of the guc-log-file format
>> + */
>> +struct guc_lfd_file_header {
>> +	/**
>> +	 * @magic: A magic number set by producer of a GuC log file to
>> +	 * identify that file is a valid guc-log-file containing a stream
>> +	 * of LFDs: Expected value: GUC_LFD_DRIVER_KEY_STREAMING
>> +	 */
>> +	u64 magic;
>> +	/**
>> +	 * @version: Version of this file format layout as per
>> +	 * guc_lfd_version
>> +	 */
>> +	struct guc_lfd_version version;
>> +	/**
>> +	 * @lfd_stream: A stream of one or more guc_lfd_data LFD data
>> +	 */
>> +	struct guc_lfd_data lfd_stream;
> 
> no need to repeat lfd from struct name in field name
> 
> s/lfd_stream/stream
sure

> 
>> +} __packed;
>> +
>> +#endif
> 

