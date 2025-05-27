Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC41CC54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 17:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9570210E061;
	Tue, 27 May 2025 17:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTDvElGY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B962D10E061
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 17:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748367371; x=1779903371;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fTfY6B6tEoGXMsPa6FdFHl7r/z1a0Z8fyrY2S8W92bM=;
 b=PTDvElGYLpMn//y95DkptQPERiVWqZxjEQaTxbFVRKrUcX1ZUSiKQ6E8
 ju+HUEcGcJCqv3wYgRlDO/5xMNH2CGcpibyk5DqM8v8c4gwx9VM5oSDJX
 7FRZOAkQyZTZd145MJ/Secmh3TaFwj1oisl2PKwo+OKePZInTNU6B9cWR
 xIKYPF2GW+THk6djXmMbAb42YDuW6pEtZsi991U9TYBZk35O0jAQjBbAD
 SvjtCrp+xT9xDpRzesBlecErzyHtGlsCQj5/+Ol9HjT5UnZP6dwrond0r
 tkVspYY2TtZ19EZKjwV4gsc+AtBbeA6R6+c7oMHYlP7mqWqoU1goaAUjh A==;
X-CSE-ConnectionGUID: +x++LdnLQpi9NiJtEvWIAw==
X-CSE-MsgGUID: wdkq80oxRxCa1pugCBwZOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49481005"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="49481005"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 10:36:10 -0700
X-CSE-ConnectionGUID: ISh3qqVuQxy7pVhbNAoYcQ==
X-CSE-MsgGUID: qbDbnCZmT/q6dTvLAgH7JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="143880347"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 10:36:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 10:36:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 10:36:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.87)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 10:36:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BEFUkFqC9mP4GvDc/Wea6kuRBXnGVMiRKUsldbpKreUzpn95nNyYDi2iVOR2hLAiy2ZNgtochASHoxVBmEYsAudYQrk5zaGvNKL8PBL4OMfzzOALrV0OiOFtRcX+GyG3vUY4u+oRGygwEODfq+OiTa8vAl0wf3c+H8XU/nt5DTetAvejo45uyCCOzAZdJKzlVjAbOp11p97f3AK85Qlsstm58kzZpCTtofpEDtBd2cC0nWJc3emd1sStXqgtr5HnjH5thGWcFEcpLTSFsQCvz/9ZJcvC0EgxZS3YB0FKLkijY/KhBu4qS1vRsdkQKmkWRPusohNJaQkzHfo6xIUcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMdnaTVYUlmpocSp8/DlWFGa5IsfbcojF2OC9Vvzk2U=;
 b=sP9bw+IftfWgcOUKuMq+KLVT2Ire6nuK2U2F2ZB8gyGrmuQbWlm1vdwbDUbgkp243HrGkH8juC404T7VRi6Rr6c8QXcsn+m9JIrhg7Eczx3iahxxBqtdd8s7DuxJ0XxdbCZzH9OdXod9Xws2hCowTi6OIZqD7gdPlEzLre+vW++SwrujQjeVJYVrJujVGJpX25cvUYPbSttko+Tvis4LdznKifAZNMr6UEYiuVFxH6hRwlIn0UfgMMNiv0tlEaqUk8XEJxwMDGL1bO/bxCZzMt/OHGpf+ksW2aBDme6maYLcTIPI84DaX+JRYzSS0ssla/hqPqJ6pyXr9QK1FYsfGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5948.namprd11.prod.outlook.com (2603:10b6:806:23c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 27 May
 2025 17:36:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Tue, 27 May 2025
 17:36:04 +0000
Date: Tue, 27 May 2025 10:37:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 18/32] drm/xe/vm: Add attributes struct as member of vma
Message-ID: <aDX4X7X6GAZcaBBv@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-19-himal.prasad.ghimiray@intel.com>
 <aCTik0GGPGymStmr@lstrano-desk.jf.intel.com>
 <eab2c34b-d89a-46f5-9147-bb9060b4a5c1@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eab2c34b-d89a-46f5-9147-bb9060b4a5c1@intel.com>
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: cad4ac14-ac96-422c-967d-08dd9d44f4bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0x1bExFdWJPUHZwbHovYlB6UTRUYzVYZ0hCem9EelFDSEovWG9FRVlldlFl?=
 =?utf-8?B?d2ZVLzQzUjBaS1RydVpaM2VjaHpiVW9JWk1hcitweG5ZN0Z6SXUvOGQ3VWJK?=
 =?utf-8?B?Z0FqSUxaS2hpMmRpNlhSUzlGTmpyaERLSVBJRkliaC94NmRGQUluTGtGZVps?=
 =?utf-8?B?Q0huWTUwZXZvaVRMY2pnYk45SW9YWU1wcnlzZVRkdjJNdzhoWU1XTmNEOE94?=
 =?utf-8?B?UXJjQ3BxUEZqei90aG1DcFlwZk84OElac1hSUWFIQWhiYUNjcFZ5VEZxcy9j?=
 =?utf-8?B?ejJ1OWZCd0E0c0QzUFZZdm9YczBSV3JKWWJ5dU1zUXBlb05WU2ZQUGx5V0pw?=
 =?utf-8?B?UUdwaWhxTW9QKzJibUY2Q1VwNlN0MzFNc1luWkh6Q1RVdjRKdldBZXQrWjZ6?=
 =?utf-8?B?QWFKOU1zdkpiT09HeEora0QrWEJER2I5UkRudHpLUTBQME5LVTQ2UmtPSXNJ?=
 =?utf-8?B?RTM3ckJJYlVOK3ZqQmZqNnBETGpKRWs1WlA4dVZFSFZIVkFuMEJEQ0xZWFdF?=
 =?utf-8?B?RlhPWlVpVjZCMWJZbm5vZlo4TGoweE0yWTJVV1lncjlrbGJIMFBiVFE2dG9v?=
 =?utf-8?B?RzIxck1qWkxCYXdhNFRIZGNVK3hRakdGN1MwN0plSkxuNVZSbktvU1hZc0gz?=
 =?utf-8?B?b2lPUyttbUY2RWlNekZiL3RWSXBvcGRPYnB2Nzd3cS9vSEo2dG1lQjI5aGhZ?=
 =?utf-8?B?SFEwQlJwNTVGM0hsNVoxZ2F0YlB4K2ZlejUvWFlYQUFiSzMxTFhVSHNTdzVs?=
 =?utf-8?B?T3pHbW4xaDBCaldGbVFlcVh6YkR6Tk1KRzJGNStLSXE5RmdBY0tNczRXNWxX?=
 =?utf-8?B?QXFFNEwzRC9qdGY5aUpWcEpCWkFkL29yWmFZbVBSdnpuVFhjeW5Vd3hmVEox?=
 =?utf-8?B?b3RqcHlITGpCZE1EaTNCazRaT3VaME1XUXpPaWgvY1M3cnQ5ZDdqc0tvQnNo?=
 =?utf-8?B?TWhQVzBCZWFtNEI1ek1wZ1I5aGFCUzE0ZkRaSjM1bVUyVFcrcE1BUExlbm9T?=
 =?utf-8?B?VHFoc1plcmRGeUVFTGI1bmVOYjRBZmVScG9OL0h2U2tab1RSNTU2TS9ZNVA5?=
 =?utf-8?B?TU9lQXlhUlh3YVBiT0cvOTQxSGdNUWFnS1lxeUdZRG5UYk4yZmdjT0VPVGtw?=
 =?utf-8?B?TlRtZVlhWWx4K3hiWjJsa0hkZkloeEVmZWg3eVV4QlNKd3FvUkVaTkl1MTVz?=
 =?utf-8?B?ZHNzckp1UnJsR2lxZjNWZUFVWTFldHlxMGRMZ1hOWENzWnZYdUJ1cmZiYzRS?=
 =?utf-8?B?MXNqTHlEVi80M3E3bzF0QktaOGZRTFhzRjVDQTJPR1JueGMxUjNqaVM3V3Rt?=
 =?utf-8?B?VzVMcVFzQ3pGOTFEZFk0TVJFU1JOYmJGaFhNdVd3SDVkb1ozeHRmWjlpMzZ6?=
 =?utf-8?B?WGFLZFdlUi9ld0xOTVNPYms2dENzQktUN3JSZCtoaUlNTkhObytpcjZwMC9R?=
 =?utf-8?B?WVhRYjM0NVJ3UnJnNENZSnp6RHI4aWJ6dUVKUXBlSkxiUC9oSFg2SDJZblpl?=
 =?utf-8?B?L3RVc1p3QTBsdURXMkdUNHdzMWlnbUxsZDhMYzR3VnVwMC9adjlrazZIUjNW?=
 =?utf-8?B?UElZaFdYbk9lc0tMQnN2WGd0NklXYy9rbG90WVR0RXpVKzI1cHFWdzJvZkZ1?=
 =?utf-8?B?ZUxNNmRqYzc0VnFHTS9NUjRJY1k4SUllQU1haUxNNzc5dno3RFQrQ0lyKzhl?=
 =?utf-8?B?QlhMRjhhMnRoSkw0dGVzRGdjbDZ1aG13QmxkQVQ3MWF6b3R6S2FYbnJ3dHdq?=
 =?utf-8?B?RW84Lzl2WEtDZkJFdWcxRlQ0ZEljenRYQ3E4WDlDQWcxd0kzNmdxbU95b0N5?=
 =?utf-8?Q?KhxrMaRyguuXaRF47+bHMwjrGIIOF2hfbm+HU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2ExVUJVemlIeGMvWnFwNEZoMjFiRDlUU1ZPNW1icUh0YnlQclpPQ2l6UGk2?=
 =?utf-8?B?djFTZVBYYW04bUlxNElJMEJ1b1hnYXp0SXpTcU1CSm9hN3FvbkVyU0RFVVB6?=
 =?utf-8?B?cTdxeTJpdWQ3d1U0M3BXQmROcU1hVTdYYW5MOWNaWUdENnZmbFBYaElBdkgz?=
 =?utf-8?B?RE8zL1VpRmZaYVU4Zm4xQmVNeWxNa3R1b0dkc3RFTE1SRHBIM0NrUVNYdkJS?=
 =?utf-8?B?OGRqUkw2aUwyU1pvTkUzdGtkZUs4NjRINC9EVzNTaVFqNnpJNzZOTVozT1Qr?=
 =?utf-8?B?ZVg3STdydlBOdkdjcnFMNlRnMzNCYjhRbWM0bXBmZzNXQmcxQ3NCZWZWTkh4?=
 =?utf-8?B?MHJUdVJ0U2VNa0Erd2VOYVcrVHZySFRENitnc1hKaTZObUo1S2JIaEdGT2Jz?=
 =?utf-8?B?cFEwMWdjcGNuRE0vUHdqS3RjN0l4QUVIeUVyNlNicEE4OCtvNnFGdjBFVm13?=
 =?utf-8?B?UmltdjRDUDcwU2xDZTNrMWlWaW1XMklBc2VHL2s1TUVKWElQSlJwM2hzeElr?=
 =?utf-8?B?eWZQcDZDalliQWszZE4wdEs5eEdoUTNRYXM2eklLZlBBa1pNOFpsUlBVeGk3?=
 =?utf-8?B?VDlzMGd0N0hoTzZFVWFaY2RzSkV3aWlQeEVIcU1IREpvNnRiQUpjd0hyb0Fx?=
 =?utf-8?B?S3AzY3FsN3IrdVRRL1BGbG14dlFwcnZRMXB3UzU2Z3Z0VFUvVzBpTFlMdzdp?=
 =?utf-8?B?YXNmVGJxUHhWRGIzNHA3RFdjNGo1Y3FuYW1INWpsekdvWWNjMWhYMUJjVXdx?=
 =?utf-8?B?U01KNnVHck16NFljcXpQeG1VbzRmYXlCOS9kUzJENUJ3dnhBemFLQUFvTkNW?=
 =?utf-8?B?bVR6V3BsNkFKMlJqVDZkTysrbEhRT082ek9KcnlsVXNMWHkxNWxNcmJyQUFy?=
 =?utf-8?B?ZjZFNlpEOHlNM1Y4RjJuSmpUbEVvTGczblI1Tmg5YVMxb2NFa2pQdkhlU2w4?=
 =?utf-8?B?U0xWYmRTRFJFR3hsUVdOTlVCQkVjZ3o4MVhrSUQ3MnhWN2hnSjdZaFNmc042?=
 =?utf-8?B?bzEwcUQyeXo1MHdSUVAwWXFYTDFnTnZRL2lqR0JjSEx0R0dOU0NMZ0NVbldN?=
 =?utf-8?B?TlZGNDBYOWN6c3BiK1RaK3BPSm80Qncyd0NqaGNFTExHcVZvcklQUjVJUjc3?=
 =?utf-8?B?K2ZEZzNCRjdlbm5jQnQ1TnovbHJvbVEwZHR4c3pHd3dsRkdNa3FRd2lsQkpq?=
 =?utf-8?B?YldDbCtManp6TFZKMTJGTnlCeHIzQ3VLU0ZJM2wzOHJHZnRuRU9EVE15aWMy?=
 =?utf-8?B?VThnWTY3RkpsYmdmdzd5QmhHU2NrampuanhGVGRNMlhVYjE4dFdnSlhqVlBR?=
 =?utf-8?B?RWhuY2owMUNISDZMbjQ5U1pIN0U3Vlo4UW1JdVZjQ09OL1BKaitjc1BicmtN?=
 =?utf-8?B?YnBBMmFMRHRiTEZjQU4zc01IaXdld3hlbmZNREFhRUR0ZzlqTFc4ZW8yQzAv?=
 =?utf-8?B?MVJsT0E1RWlBTElwREFBMkx4b09ZYitMbFQ2NHQ3VnN5TWZZb2RZRlNPOHpy?=
 =?utf-8?B?dGFIa2E0TitMZGFGbFRLVjNoVDlSbXlja2JzM3RNTFgrTERDR0VvMVMydjhw?=
 =?utf-8?B?VWNLNWxiL0RERnVQQ0JWaGhZeFVCeW1rSGQxRW9qQThoN2NLc051ZFZLTkVR?=
 =?utf-8?B?dW9mbEpOSENIKzc0QWxsTjg4cFltcWthdytNTzJLSFZtZElKTUpkc3Z3K0Iw?=
 =?utf-8?B?UEZFODJKYnNQS3VMY1Jma3dhemJ5VjN6SjBkb0lOdmVHVlNZeDYwTnowOVlN?=
 =?utf-8?B?NTFuMWhOY1haS3NCcUFXQzdxVGl6SEQ1UzBCMzQ3YnJsWDVHUy9EY0lsYW5F?=
 =?utf-8?B?V040cnh5eEhFbHhYMUxOWUpUTDJnbWlwTlRZRlZrOTVHOFQ3QTYzcU9PV1dh?=
 =?utf-8?B?MUNaWENLdmdKa3VTYXp2VmdrMFpNQlhSY0xaa3htVWFKTyswUWdNWFhpQm1T?=
 =?utf-8?B?YmJ6V1RSalBpTFU2SHNIZWdWc0tXUHFSZVFNZEl2NXh6VTRvb3RIZG96SmZl?=
 =?utf-8?B?aGlZaExuVzlrSlF6c25ibGpJVUJOZHBDNTdwaEgzUllXMTI0dXkzbjNkajdF?=
 =?utf-8?B?T2I0M0RVcE5qMmVNRW1BOC9KbTZ5dFEycDFYdklVMVF6SGovL0xja0lzclFZ?=
 =?utf-8?B?SStPMTdrRlA2ZlNDdVJwQ0QxY1NqS0hubEdpWlhhWDZJVy94OUZWeExrQ3Na?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cad4ac14-ac96-422c-967d-08dd9d44f4bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 17:36:04.7304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyWhyVOl+3xNbA8dk9ryOxpNAFCjPCCQYapZLuKPD+fnf/hTvFexPCBGGhd4a+SOyzbliE1Q316Ew9zFi/f6SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5948
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

On Tue, May 20, 2025 at 02:57:45PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 15-05-2025 00:06, Matthew Brost wrote:
> > On Mon, Apr 07, 2025 at 03:47:05PM +0530, Himal Prasad Ghimiray wrote:
> > > The attribute of xe_vma will determine the migration policy and the
> > > encoding of the page table entries (PTEs) for that vma.
> > > This attribute helps manage how memory pages are moved and how their
> > > addresses are translated. It will be used by madvise to set the
> > > behavior of the vma.
> > > 
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_vm.c       |  6 ++++++
> > >   drivers/gpu/drm/xe/xe_vm_types.h | 20 ++++++++++++++++++++
> > >   2 files changed, 26 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 27a8dbe709c2..1ff9e477e061 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2470,6 +2470,12 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> > >   		vma = ERR_PTR(err);
> > >   	}
> > > +	/*TODO: assign devmem_fd of local vram once multi device
> > > +	 * support is added.
> > > +	 */
> > > +	vma->attr.preferred_loc.devmem_fd = 1;
> > 
> > Assigning a value of '1' is a bit odd... I'd prefer using a define or
> > something similar to indicate the intended behavior. I noticed a few
> > other assignments to '1' in the final result—same comment applies to
> > those.
> 
> Sure
> 
> > 
> > > +	vma->attr.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED;
> > > +
> > >   	return vma;
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index d3c1209348e9..5f5feffecb82 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -77,6 +77,19 @@ struct xe_userptr {
> > >   #endif
> > >   };
> > > +/**
> > > + * struct xe_vma_mem_attr - memory attributes associated with vma
> > > + */
> > > +struct xe_vma_mem_attr {
> > > +	/** @preferred_loc: perferred memory_location*/
> > > +	struct {
> > > +		u32 migration_policy; /* represents migration policies */
> > > +		u32 devmem_fd; /* devmem_fd used for determining pagemap_fd requested by user */
> > > +	} preferred_loc;
> > 
> > I'm a little unclear on how these variables work.
> > 
> > In the uAPI for migration_policy, I see MIGRATE_ALL_PAGES and
> > MIGRATE_ONLY_SYSTEM_PAGES (these should probably be normalized with a
> > DRM_XE_* prefix, by the way), but it's unclear to me what exactly these
> > mean or how they're used based on the final result—could you clarify?
> 
> With multi-device support the idea was to have flexibility to move only
> system pages to preferred location or also move pages from other vram
> location to preferred location.
> 

Ok, I think having bits set aside for this makes sense.

> > 
> > Likewise, I'm confused about the devmem_fd usage. It can either be
> > assigned a devmem_fd from the uAPI, but in some cases, it's interpreted
> > as a region. I assume this is anticipating multi-GPU support, but again,
> > the plan isn't clear to me. Could you explain?
> 
> The devmem_fd is intended to be used to determine the struct drm_pagemap *,
> which in turn will be used to identify the tile associated with VRAM for
> allocation and binding. The changes that introduce the
> devmem_fd->drm_pagemap->tile [1] linkage will be part of the upcoming
> multi-GPU support.
> 
> To ensure that the current changes are easily scalable and can be extended
> for multi-GPU support, I am defining devmem_fd in the UAPI and using it in
> the KMD as a region placeholder until multi-GPU support is integrated.
> 

Hmm, will this break the uAPI though? e.g. How does the UMD choose
between region and FD at the uAPI level? If the answer is once multi-GPU
lands it is always a FD rather than region then we really need to land
some of the multi-GPU patches at same time as madvise - at least the
ones which export memory regions as FDs.

Let's loop in Thomas on the multi-GPU assumptions too to ensure
correctness.

Matt 

> [1] https://patchwork.freedesktop.org/patch/642773/?series=146227&rev=1
> 
> 
> > 
> > In general I agree with the idea of xe_vma_mem_attr though.
> > 
> > Matt
> > 
> > > +	/** @atomic_access: The atomic access type for the vma */
> > > +	u32 atomic_access;
> > > +};
> > > +
> > >   struct xe_vma {
> > >   	/** @gpuva: Base GPUVA object */
> > >   	struct drm_gpuva gpuva;
> > > @@ -128,6 +141,13 @@ struct xe_vma {
> > >   	 * Needs to be signalled before UNMAP can be processed.
> > >   	 */
> > >   	struct xe_user_fence *ufence;
> > > +
> > > +	/**
> > > +	 * @attr: The attributes of vma which determines the migration policy
> > > +	 * and encoding of the PTEs for this vma.
> > > +	 */
> > > +	struct xe_vma_mem_attr attr;
> > > +
> > >   };
> > >   /**
> > > -- 
> > > 2.34.1
> > > 
> 
