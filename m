Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A2FE7716A
	for <intel-xe@archiver.kernel.org>; Sun, 15 Dec 2024 16:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DBB10E0C3;
	Sun, 15 Dec 2024 16:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jE5m05Fj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03CA10E0C3
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Dec 2024 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734281915; x=1765817915;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ykpu6+C17FQHJ/mutJ8dIaEryO84qXRMpho+AsChRPU=;
 b=jE5m05FjxcTTYjKPlb+5VNGjxdPMxxceUmTmLCBovwJIifO2EzjG8GVo
 RjJBoNeAkmKr1r10+DOG1KTCEWnNndubweuMTXG4Wx8475YtqeBL2cMs1
 ZzlHAil3P0ugqD3RTnGxeSwIS2Sm3tcLZTuXtxZLz5r0oY9fz6eebVi4o
 4B3qNs+8zkd2FnpLK9+RAxUmzt93lT2HcySQjzVq3KVYm5+5i60lKFY6v
 XtrpBVqSXV5HgB3qSwnxRh+BFN5ZdJwj+u28HwZulfBAtUcedM0QCQnOc
 KHoRIr3tbPKcrMSgXejLA967jh73uQVj8FV5KOdqYQg5bpYJCKG7nhof+ Q==;
X-CSE-ConnectionGUID: 1UA8KtlNT9OWU8rOs0TXcA==
X-CSE-MsgGUID: bFvv7os1TuWVguI3xEvJBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="37520671"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; d="scan'208";a="37520671"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2024 08:58:34 -0800
X-CSE-ConnectionGUID: qF3W0CHzR6aSmbOpDi1T4A==
X-CSE-MsgGUID: j5arbHnGTcuJFAlV0gHN+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96845400"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2024 08:58:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 15 Dec 2024 08:58:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 15 Dec 2024 08:58:33 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 15 Dec 2024 08:58:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8Wl+lMtbYfcqJePrhV89/nXfCGLHLZNW+IpBPR+0+lB51f2uTLrM5E/bjlJEeD7CpkliUArALdSgmZpu1gLvkiozT2p/XlNG47IrlA2ca4J8kbueAbZzPgwDJ23h3VfxiVd00cgugDjbiyAvg+ISqNqIU1+YIr2VARdNxHongy5E6RjzZHt+uPcmOuphYQ5TcZVL2ZZwbKt9YDz7yzXD3UDmuaz9ed6rHOHtLYTDeGP+bNYGhhdkBX/o5Icpj3Qmhnc5qckjiqMhu4HMURJfoH4LnVhfl4GDAYH0B/oMpf8Rw0QQCbCQgCtrCk7VrmMwZ/gf7RW7pGqpCRYr5iAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8uaLD9RZ2CcS58wfNGU9uDDOROFsRmBB4zxrx4xP6w=;
 b=YLJu5wch+ezePlLXK8UcQwuDLNLbFxezw0OPejzM1VclIxIYLbI01XOQIjGvHeyAyIe5jqQehNW/VPIjWjSchi0KOL8yJNemXELX1VUcEWhTQOD7l7zDPII9QZQGpr7wGeSAZ+okoKRtx7SabTojpzoHk9CHPiVIoGe2kR6g7kPFz/wVT0lSv5nPK1glpcxAc7Q0zMTE4M0kb3Y55cAfRXGYb8OFof9ab1Be/lau5GwxNjjghmYyoV4OIN/xQC4hJcq0/3Bch2wZBtU/qxVqc9Z+CZtAcv+saieAPWxND/LjuHC+YJ/WynqqWxcpBkWW6s9BBaYlodyeSyB8mgZd8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA0PR11MB4624.namprd11.prod.outlook.com (2603:10b6:806:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Sun, 15 Dec
 2024 16:58:17 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.8251.015; Sun, 15 Dec 2024
 16:58:17 +0000
Message-ID: <9d11dae0-7187-46b8-9149-3ae1835eee15@intel.com>
Date: Sun, 15 Dec 2024 08:58:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] drm/xe/pmu: Add GT C6 events
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241207005220.839003-1-vinay.belgaumkar@intel.com>
 <20241207005220.839003-3-vinay.belgaumkar@intel.com>
 <fpqeypgz46ie3ippyqkvevoeldig3aqd62fymtrjlodrfpsbzg@gmuponqgcl4x>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <fpqeypgz46ie3ippyqkvevoeldig3aqd62fymtrjlodrfpsbzg@gmuponqgcl4x>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::35) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA0PR11MB4624:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8d6ecb-28eb-4d22-e8ba-08dd1d29ab9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmdpVE0yUUxUSzlZTnNiTUxvbDgwQkxNNlBDTjlvZ1g0ZnBuSWwrRysvRGwv?=
 =?utf-8?B?SkNZTjRoci96ZXZNQ2QzcHpVUWFrZE92clVmTGk3Ulk1ajVGc1h0QkJrRGRP?=
 =?utf-8?B?SEh1VHNXNlhKMmUxTzhLYUE1L09VbUxqM0VJUmtlb0FvVWpuaE9zRytTbE11?=
 =?utf-8?B?K2FRaXp1ZkJDVGR5K2xWSUFyTUdBNFhHcXFBaG9LRFNwTG1SM1NFMS85Sk13?=
 =?utf-8?B?aTc1UlFtVGtsQmViTTRZaHBoc1FqK1pUYmoxMm1hZmRYMS9UMnBvaFZ3c2Rs?=
 =?utf-8?B?WFp2ZGhCNHlEQVA3QmVob1dCckVrOTVCTm4rcytxUXE3bm1mQTVxQ0RUbC8w?=
 =?utf-8?B?T3Y4VXJDbjRCak5qamN2RnY4aWdUNnBDTXU5SUdBSWJ1WW1PTW41YnBaVWs3?=
 =?utf-8?B?cXkvMFJBRm5CNkUrQ0FQQ3I5RkJWWC9XMmxrWEhpWHJBWmJVWXNidzY4Rk5G?=
 =?utf-8?B?UTV1UFFmelcvWFhiVkR6TUcweUlHUjVUUjZXNXJISnlwbjdIdTdlbTNQMjJV?=
 =?utf-8?B?U0o4ck9pR0pKVFRQRWJXL01zeUtuZFJhTFRmSkZYc1NWN25tL2FPOHVlNnlM?=
 =?utf-8?B?aDd2ZUNVamdxclJDSmZITGJNbFhQZHBNdDBjT0NZZGoraDRCbWs3alNOR0tN?=
 =?utf-8?B?Rmp2RjhuSDRrb3ZHWnUxU3BmQXpJMDBNV0t5YXBMNExkSGZDNmhxcHNuQVJV?=
 =?utf-8?B?c29tRlN5dndJRVd6cXhtUE5ydFVnUnIwdjFhaDFLdEZ1VmJGTDN6L1FwN2dS?=
 =?utf-8?B?Q2QwNTZDNVd1ZnkxZDZRS1k2cDRkZkpRbk1EYU81enZ0dVJJeEdnb2NQSDcv?=
 =?utf-8?B?WGNueThTVzlxR3pXWjl1VGxRMDczU0krM1hTMmJDZjF6SUFwdEc5S1R5Tmlp?=
 =?utf-8?B?N0JUQlNEbHJsbzRLZytYVTg0bVAyeTlTWkxjTDZLMEJ5UkRtYktYRnBGT3du?=
 =?utf-8?B?RkNVUWRzVUJQdStZUE9ZY0xoclFWU1Nqb0duYkplbStPNWxNM2pFbm5QQTRl?=
 =?utf-8?B?SUE2YjhDekZQRlkrVUx3aVVWQ1JQSE5nc1AvV2VRZG5IZDU2V0R6Q2QwUmVY?=
 =?utf-8?B?VURMNUxBcG5YT2E5STJnYUJmNDVxS0dNTFFIVFdFOTlGdkZZWjhTVG4wNW82?=
 =?utf-8?B?VGg0dFZBclkwcGo5MEFORGNJRXhZRlVwbTl6RmhuM2JmakFNcmhrbG9KU3pF?=
 =?utf-8?B?M2MwZTBqaUhBbE9KYm4vU3psMG1iNWYzbmdwU0hOeFQ0M3UvUllDZVcvbm5E?=
 =?utf-8?B?eDc1YVh0VGZrR3Z5bEpFbkpaVmR3RkdQSmg1TFQ3TnIzdXNXb1B1K3IxOVBZ?=
 =?utf-8?B?TXBnbUdPbHVZaG1ZV1RoUXZwSm1jYWVUOVFyaW1hN0VnazJsMUl2QjJYMDF2?=
 =?utf-8?B?ZGp5R0hXSzdqMitSZzFSeU4wejBWRGtzUU01Y2VhZ2l4OVB3UDZRZjdqWnhR?=
 =?utf-8?B?R2NyL2ZSUkJjYktZWExiRE1kN0c2SC80Nmx6M1l1SzVCSm56QlZGV0NFa2RH?=
 =?utf-8?B?dkkzRXdjWkJwdGhSZkpKbXlUZFZ3K3hIUTJtVWp0N3ZwRCswcExKL2dRbzN6?=
 =?utf-8?B?UUc3Y0k4ZHVJbDE1dWVkMXlUU3phaFp4d1lVSndTZE5jZ3JURE1mT0hsYzNp?=
 =?utf-8?B?MTZsYlZ6d0FwelRIU0dFY1o0Szd0bUVvTC9iWUpGelNwRU03TlI5aTVXOWRZ?=
 =?utf-8?B?R3V3VFNMcGszTDRXR2I4ajA0NUJVZER5Mnd1ZmJhby8vdURMcENXOSs2MkVP?=
 =?utf-8?B?eTJ4UUNZWFN3S25Ubms1REFPT1ltc08rVmloQ29SaFdxd3R1b2FSYzFaalU1?=
 =?utf-8?B?UDZ0Y0pQSlhwM1p2NVNOZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW5kNDhXQmhSR0tXSzZKYXh0MTVsRWdEQlEzcFBzcGsxTnJPNVRvN0I0VkVD?=
 =?utf-8?B?OVFVYnNzY3Z6dHZNTndFTjB0Nm1vZHN0eFVYZ2EzZjBDbWgyUW9OSXd6QVdx?=
 =?utf-8?B?Uk1OYlMxNC9CUnBLa0IwcGZneVUxRTFFYlliTlkwdGZmSnZVUDN5WFFZNEZw?=
 =?utf-8?B?RnZrNVBHV0ZUckJEV0hibEFLV0ovblNRM3lBbDl2NGlLU2psUmk2U1hSaFZN?=
 =?utf-8?B?YzVoWm9JbjdVVDZySFc2TXdMbTlYR2tvTVhNTWZvWFQ1UEhOQkZTV2VIS2lp?=
 =?utf-8?B?aVE4dmVNM1gvdWxwY0pQZ1Z1RHM0dHJFUnNwZzdVakhXQjRJdWxBSHpqcjE5?=
 =?utf-8?B?UDRvR04yeDJGa2c1U0Q2aC94alhLUmJobHUwdWFwaE5oY1dHRUIybUpIUmVV?=
 =?utf-8?B?NFhhQkxNVlVCdWs3VE1aZWFmM3Z4Unh6SDNhQ0dUTC9BblQrMi9ENHVCMHlS?=
 =?utf-8?B?cXg5WitEdkpaME5hNlNkOWc2Ylg4cVdKdG9FckZ6dnFwNG5jeTdEWkVCTWNL?=
 =?utf-8?B?TXpJUkhqcEZLS3F1MlB6QkJMRmd0d2FNME5ZeENrR2JNRzBIKzhjUGtYWVVs?=
 =?utf-8?B?Qm5MUVFHMEhpcytkcGlFWlJONEFiZkR6UEFlTnhFMGV2cksyUkRyTUtBaHRZ?=
 =?utf-8?B?SC9MaHVhenJPNDdJK3JFWUhJcFh6MkZZVmIrMmlrVkE2NmhKaWpWVzhITi95?=
 =?utf-8?B?czBRUkpNc0VnYXBUdUR0MnVrZ1JJR20yQk1SZ085UXpLSXc0R0lHMVFKREIr?=
 =?utf-8?B?MElJZUg4RkxweUhmbk1NQjBQb1IwNjNvOHIxZkp2dyt0VDlxS0xpYVN1eXUr?=
 =?utf-8?B?WTF1N0tyUzlYNXlZQnRtZkE0U1o5UjJmM2FSUys5dzcxazl4ZWNJcVpXMFcy?=
 =?utf-8?B?K0ZqNUVSbEd4bVdWMTlyWHU0Wko3OGJZa2xtVXZLUEpvTTdyOWw2dXZDcGRU?=
 =?utf-8?B?MjB2cXI0SnliTUt5Q2hrWU9sOEpGL0NvTlpPekh0eVY5OFJPdW1GdnRTQVNs?=
 =?utf-8?B?N0JTc29xYXhGS1lhMUVXemZ2aiswMG9mNERUOTRyVzdmdHdvTFBhZFhSZ2FO?=
 =?utf-8?B?WEEramtRNzduenc1OW92U1FXdU8vSHFCaVh3QUlOMUR0WVF5bEJKOThXL3VG?=
 =?utf-8?B?cUE2cGFKUmhoaXBKQzZUYUduTXV3SmUrTDNvVGF5UEQzczMvdDh6TXgrS3c1?=
 =?utf-8?B?V3VLUnorNmZwMWprWjgyaGdIVWE3enhtU1E5Ync5SVJBVkliR240VUNkd0Iz?=
 =?utf-8?B?MEhSNHNBbmJKdzZ4MXVhMndDU2FpSlM4Z1lCNkRjdE9oNFlMWVUvVXV4TmtF?=
 =?utf-8?B?WmNVZ2VnaXVlR01XcVljNExSN3ppZFNJSmY1cWNWZndOQkMrZmo4czlnMWdW?=
 =?utf-8?B?TVI1WWg1S2xEQ1ZVYjRyOWtCQVNpVzJLMFpKYmJZTXlRSnpVTzBoKzhIQW51?=
 =?utf-8?B?a2VpdWdsS3daTGlHRnk1MkpBMzBwV3ByeUZ4Skdkanh4L0F5L2xwcE92RDIx?=
 =?utf-8?B?ZEIxb0pITXVtb1grU2theEM1c3BjdmxWcEpEQTdEMzErOXNLMUd0SlFnNit2?=
 =?utf-8?B?ck5yaEh2ZmJzZENBM01CaC8yaWtGQmZLSFlhTjRPb1BxeDdHTVNnVmRLZXhN?=
 =?utf-8?B?bFRuTTkyZyswUTFqMDZkNkRJNWlCYmxEVE96Lzc5T3dXaUdTcTJ4eDA3MHpH?=
 =?utf-8?B?a3FoV0MvLzlUazRKaFBHdTJZYm5pcXFXNVo0STRLcjFoYkYwUnZlb0xhUm5V?=
 =?utf-8?B?SWtrRG41V0pXZUsxbEFFckJZUm04TStCZ3Q2ZmJxVUpGNWFrdnFFeUEwN0xH?=
 =?utf-8?B?Mlc1Z3VaM1Y4eHlrc0RVWm9Jd1FTY1JJOXJQYTQweHdFQ3RhbTcxamsrUWM0?=
 =?utf-8?B?WUZnWmJSb21UOThsZ1RNUnQyNlh2dTVTcUFtR0xYOHROeFFnNSt4cDZBMXNl?=
 =?utf-8?B?cXBKc2VGU2FIdVBxNEszL2J2b2h4SXpBTlpVaFJ2RUJTMG4wOFV3N0RmY0Jk?=
 =?utf-8?B?cStmazkyWXBmYlFZK0IycHJJckhOTEo4UFZaNU83ZUhpbGVTWlZCVUY3K2I1?=
 =?utf-8?B?OTNKQ3F1dmVlMUw3Um9GamMwRWZ0S25XVUpHSlJjdGJWTDMxaEk3R1FDMWRt?=
 =?utf-8?B?NXlJREUwYWVLakk4K2psK2VTN0FzbHlIL2xodXZINkVFZUQ0ZHhRanRXeGYy?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8d6ecb-28eb-4d22-e8ba-08dd1d29ab9e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2024 16:58:16.8917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95dAu900XkwcS4vnnYMl4MT4oVTfkm0Kc7B61TJ2sUsvujH289KgQ2Zdpt5UmJ5FWhYRWnmdJHuOEGEGYl69tvvZMiyhbHwezNmEtq25I5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4624
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


On 12/10/2024 2:31 PM, Lucas De Marchi wrote:
> On Fri, Dec 06, 2024 at 04:52:19PM -0800, Vinay Belgaumkar wrote:
>> Provide a PMU interface for GT C6 residency counters. The implementation
>> is ported over from the i915 PMU code. Residency is provided in units of
>> ms(like sysfs entry in - /sys/class/drm/card0/device/tile0/gt0/gtidle).
>>
>> Sample usage and output-
>>
>> $ perf list | grep c6
>>
>>  xe_0000_00_02.0/c6-residency/                 [Kernel PMU event]
>>
>> $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
>>  xe_eventid  xe_gt_id
>
> redundant xe prefix... we could live without it.
ok.
>
>> $ cat /sys/bus/event_source/devices/xe_0000_00_02.0/format/*
>>  config:0-20
>
> if you are using just 21 bits of the first config,
>
>>  config1:0-2
>
> why do you go with the second config here?
yup, will reuse 60:64 of config just like i915.
>
>>
>> $ perf stat -e xe_0000_00_02.0/c6-residency,xe_gt_id=0/ -I1000
>>
>> $           time     counts unit events
>>     1.001183454       1001 ms xe_0000_00_02.0/c6-residency,xe_gt_id=0/
>>     2.004434757       1002 ms xe_0000_00_02.0/c6-residency,xe_gt_id=0/
>
> that looks much better than before
>
>>
>> v2: Checkpatch fix, move timer code to next patch
>> v3: Fix kunit issue
>> v4: Fix for locking issue, fix review comments (Riana)
>> v5: Add xe_pmu_disable() function to reset enable_count
>> v6: Change rc6 to c6 (Riana)
>> v7: Fix another comment format
>> v8: Replace RC6 with C6 (Riana)
>> v9: Define sampling freq in next patch
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt.c        |   3 +
>> drivers/gpu/drm/xe/xe_gt_idle.c   |  17 ++-
>> drivers/gpu/drm/xe/xe_gt_idle.h   |   1 +
>> drivers/gpu/drm/xe/xe_pmu.c       | 214 ++++++++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>> drivers/gpu/drm/xe/xe_pmu_types.h |  57 ++++++++
>> 6 files changed, 289 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index d6744be01a68..3321f1b72c6e 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -47,6 +47,7 @@
>> #include "xe_mmio.h"
>> #include "xe_pat.h"
>> #include "xe_pm.h"
>> +#include "xe_pmu.h"
>> #include "xe_mocs.h"
>> #include "xe_reg_sr.h"
>> #include "xe_ring_ops.h"
>> @@ -877,6 +878,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>
>>     xe_gt_idle_disable_pg(gt);
>>
>> +    xe_pmu_suspend(gt);
>> +
>>     xe_gt_disable_host_l2_vram(gt);
>>
>>     xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index fd80afeef56a..47b5696c7137 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -275,18 +275,25 @@ static ssize_t idle_status_show(struct device 
>> *dev,
>> }
>> static DEVICE_ATTR_RO(idle_status);
>>
>> +u64 xe_gt_idle_residency(struct xe_gt_idle *gtidle)
>> +{
>> +    struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>> +
>> +    return get_residency_ms(gtidle, gtidle->idle_residency(pc));
>> +}
>> +
>> static ssize_t idle_residency_ms_show(struct device *dev,
>>                       struct device_attribute *attr, char *buff)
>> {
>>     struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>> -    struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>> +    struct xe_gt *gt = gtidle_to_gt(gtidle);
>>     u64 residency;
>>
>> -    xe_pm_runtime_get(pc_to_xe(pc));
>> -    residency = gtidle->idle_residency(pc);
>> -    xe_pm_runtime_put(pc_to_xe(pc));
>> +    xe_pm_runtime_get(gt_to_xe(gt));
>> +    residency = xe_gt_idle_residency(gtidle);
>> +    xe_pm_runtime_put(gt_to_xe(gt));
>>
>> -    return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, 
>> residency));
>> +    return sysfs_emit(buff, "%llu\n", residency);
>> }
>> static DEVICE_ATTR_RO(idle_residency_ms);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h 
>> b/drivers/gpu/drm/xe/xe_gt_idle.h
>> index 4455a6501cb0..795a02c9d89c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
>> void xe_gt_idle_enable_pg(struct xe_gt *gt);
>> void xe_gt_idle_disable_pg(struct xe_gt *gt);
>> int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>> +u64 xe_gt_idle_residency(struct xe_gt_idle *gtidle);
>
>
> this xe_gt_idle changes should be in a prep patch, and make unit
> visible:
>
> xe_gt_idle_residency_msec().
>
> AFAICS it's a pre-existent problem, but now it's worse as you have 2
> entrypoints:  there's no lock protecting gtidle updates. This means that
> if you have perf running and something cat'ing the idle_residency_ms
> file you are likely to have {prev,cur}_residency out of sync.
Will add locking here.
>
>>
>> #endif /* _XE_GT_IDLE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 55668bd0178f..951c1b86aa88 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -11,8 +11,11 @@
>> #include "xe_device.h"
>> #include "xe_force_wake.h"
>> #include "xe_gt_clock.h"
>> +#include "xe_gt_idle.h"
>> +#include "xe_guc_pc.h"
>> #include "xe_mmio.h"
>> #include "xe_macros.h"
>> +#include "xe_module.h"
>> #include "xe_pm.h"
>> #include "xe_pmu.h"
>>
>> @@ -46,8 +49,29 @@ static unsigned int xe_pmu_target_cpu = -1;
>>  * To list a specific event for a GT at regular intervals-
>>  * $ perf stat -e <event_name,xe_gt_id=> -I <interval>
>>  *
>> + * For C6, following command will give GT residency per second-
>> + * $ perf stat -e xe_0000_00_02.0/c6-residency,xe_gt_id=0/ -I 1000
>> + *            time             counts unit events
>> + *     1.001183454               1001 ms 
>> xe_0000_00_02.0/c6-residency,xe_gt_id=0/
>> + *     2.004434757               1002 ms 
>> xe_0000_00_02.0/c6-residency,xe_gt_id=0/
>> + *     3.005854217               1000 ms 
>> xe_0000_00_02.0/c6-residency,xe_gt_id=0/
>> + *
>> + * To verify this matches with sysfs values of c6, you can run 
>> following command-
>> + * $ for i in {1..10} ; do cat 
>> /sys/class/drm/card0/device/tile0/gt0/gtidle/idle_residency_ms;
>> + *   sleep 1; done
>> + *      2348877
>> + *      2349901
>> + *      2350917
>> + *      2352945
>> + *
>> + * Each value is roughly a 1000ms increment here as well. This is 
>> expected GT residency when idle.
>>  */
>>
>> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> +{
>> +    return container_of(event->pmu, struct xe_pmu, base);
>> +}
>> +
>> static unsigned int config_gt_id(const u64 config)
>> {
>>     return config >> __XE_PMU_GT_SHIFT;
>> @@ -58,6 +82,35 @@ static u64 config_counter(const u64 config)
>>     return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> }
>>
>> +static unsigned int other_bit(const u64 config)
>> +{
>> +    unsigned int val;
>> +
>> +    switch (config_counter(config)) {
>> +    case XE_PMU_C6_RESIDENCY:
>> +        val = __XE_PMU_C6_RESIDENCY_ENABLED;
>> +        break;
>> +    default:
>> +        /*
>> +         * Events that do not require sampling, or tracking state
>> +         * transitions between enabled and disabled can be ignored.
>> +         */
>> +        return -1;
>> +    }
>> +
>> +    return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
>> +}
>> +
>> +static unsigned int config_bit(const u64 config)
>> +{
>> +    return other_bit(config);
>> +}
>> +
>> +static unsigned int event_bit(struct perf_event *event)
>> +{
>> +    return config_bit(event->attr.config);
>> +}
>> +
>> static void xe_pmu_event_destroy(struct perf_event *event)
>> {
>>     struct xe_device *xe =
>> @@ -77,6 +130,10 @@ config_status(struct xe_device *xe, u64 config)
>>         return -ENOENT;
>>
>>     switch (config_counter(config)) {
>> +    case XE_PMU_C6_RESIDENCY:
>> +        if (xe->info.skip_guc_pc)
>> +            return -ENODEV;
>> +        break;
>>     default:
>>         return -ENOENT;
>>     }
>> @@ -125,6 +182,63 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>     return 0;
>> }
>>
>> +static inline s64 ktime_since_raw(const ktime_t kt)
>> +{
>> +    return ktime_to_ms(ktime_sub(ktime_get_raw(), kt));
>> +}
>> +
>> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int 
>> sample)
>> +{
>> +    return pmu->event_sample[gt_id][sample].cur;
>> +}
>> +
>> +static void
>> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 
>> val)
>> +{
>> +    pmu->event_sample[gt_id][sample].cur = val;
>> +}
>> +
>> +static u64 get_rc6(struct xe_gt *gt)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    const unsigned int gt_id = gt->info.id;
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    bool device_awake;
>> +    unsigned long flags;
>> +    u64 val;
>> +
>> +    device_awake = xe_pm_runtime_get_if_active(xe);
>> +    if (device_awake) {
>> +        val = xe_gt_idle_residency(&gt->gtidle);
>> +        xe_pm_runtime_put(xe);
>> +    }
>> +
>> +    spin_lock_irqsave(&pmu->lock, flags);
>
> another current huge pain from i915...  this can't be a spinlock_t
> since the perf infra is holding a raw_spinlock_t when it calls
> enable/read/etc.
>
> See 
> https://intel-gfx-ci.01.org/tree/drm-tip/shards-all.html?testfilter=perf
>
> <4> [97.879451] =============================
> <4> [97.879495] [ BUG: Invalid wait context ]
> <4> [97.879538] 6.13.0-rc2-CI_DRM_15815-g6fc9ce9b9be4+ #1 Not tainted
> <4> [97.879600] -----------------------------
> <4> [97.879641] swapper/0/0 is trying to lock:
> <4> [97.879684] ffff88812045b910 (&pmu->lock){....}-{3:3}, at: 
> i915_pmu_enable+0x48/0x3a0 [i915]
> <4> [97.880184] other info that might help us debug this:
> <4> [97.880235] context-{5:5}
> <4> [97.880264] 1 lock held by swapper/0/0:
> <4> [97.880308]  #0: ffff88885f432038 (&cpuctx_lock){....}-{2:2}, at: 
> __perf_install_in_context+0x3f/0x360
> <4> [97.880411] stack backtrace:
> <4> [97.880443] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 
> 6.13.0-rc2-CI_DRM_15815-g6fc9ce9b9be4+ #1
> <4> [97.880535] Hardware name: Intel Corporation Meteor Lake Client 
> Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 
> 01/31/2024
> <4> [97.880656] Call Trace:
> <4> [97.880683]  <TASK>
> <4> [97.880708]  dump_stack_lvl+0x91/0xf0
> <4> [97.880752]  dump_stack+0x10/0x20
> <4> [97.880789]  __lock_acquire+0x990/0x2820
> <4> [97.880839]  lock_acquire+0xc9/0x300
> <4> [97.880881]  ? i915_pmu_enable+0x48/0x3a0 [i915]
> <4> [97.881355]  _raw_spin_lock_irqsave+0x49/0x80
> <4> [97.881409]  ? i915_pmu_enable+0x48/0x3a0 [i915]
> <4> [97.881723]  i915_pmu_enable+0x48/0x3a0 [i915]
> <4> [97.882011]  i915_pmu_event_add+0x71/0x90 [i915]
>
>
> I'm trying to fix that in i915, but it's not easy as we can't simply
> convert to raw_spinlock_t :-/
Changed this to use raw_spin_lock as per offline discussions.
>
>
>
>> +
>> +    if (device_awake) {
>> +        store_sample(pmu, gt_id, __XE_SAMPLE_C6, val);
>> +    } else {
>> +        /*
>> +         * We think we are runtime suspended.
>> +         *
>> +         * Report the delta from when the device was suspended to now,
>> +         * on top of the last known real value, as the approximated C6
>> +         * counter value.
>> +         */
>> +        val = ktime_since_raw(pmu->sleep_last[gt_id]);
>> +        val += read_sample(pmu, gt_id, __XE_SAMPLE_C6);
>> +    }
>> +
>> +    if (val < read_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED))
>> +        val = read_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED);
>> +    else
>> +        store_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED, val);
>> +
>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +    return val;
>> +}
>> +
>> static u64 __xe_pmu_event_read(struct perf_event *event)
>> {
>>     struct xe_device *xe =
>> @@ -135,6 +249,9 @@ static u64 __xe_pmu_event_read(struct perf_event 
>> *event)
>>     u64 val = 0;
>>
>>     switch (config_counter(config)) {
>> +    case XE_PMU_C6_RESIDENCY:
>> +        val = get_rc6(gt);
>> +        break;
>>     default:
>>         drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>     }
>> @@ -165,6 +282,28 @@ static void xe_pmu_event_read(struct perf_event 
>> *event)
>>
>> static void xe_pmu_enable(struct perf_event *event)
>> {
>> +    struct xe_pmu *pmu = event_to_pmu(event);
>> +    const unsigned int bit = event_bit(event);
>> +    unsigned long flags;
>> +
>> +    if (bit == -1)
>> +        goto update;
>> +
>> +    spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    /*
>> +     * Update the bitmask of enabled events and increment
>> +     * the event reference counter.
>> +     */
>> +    BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
>> +    XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>> +    XE_WARN_ON(pmu->enable_count[bit] == ~0);
>> +
>> +    pmu->enable |= BIT(bit);
>> +    pmu->enable_count[bit]++;
>> +
>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>> +update:
>>     /*
>>      * Store the current counter value so we can report the correct 
>> delta
>>      * for all listeners. Even when the event was already enabled and 
>> has
>> @@ -173,6 +312,31 @@ static void xe_pmu_enable(struct perf_event *event)
>>     local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>> }
>>
>> +static void xe_pmu_disable(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    const unsigned int bit = event_bit(event);
>> +    unsigned long flags;
>> +
>> +    if (bit == -1)
>> +        return;
>> +
>> +    spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>> +    XE_WARN_ON(pmu->enable_count[bit] == 0);
>> +    /*
>> +     * Decrement the reference count and clear the enabled
>> +     * bitmask when the last listener on an event goes away.
>> +     */
>> +    if (--pmu->enable_count[bit] == 0)
>> +        pmu->enable &= ~BIT(bit);
>> +
>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>> static void xe_pmu_event_start(struct perf_event *event, int flags)
>> {
>>     struct xe_device *xe =
>> @@ -198,6 +362,8 @@ static void xe_pmu_event_stop(struct perf_event 
>> *event, int flags)
>>     if (flags & PERF_EF_UPDATE)
>>         xe_pmu_event_read(event);
>>
>> +    xe_pmu_disable(event);
>> +
>> out:
>>     event->hw.state = PERF_HES_STOPPED;
>> }
>> @@ -330,6 +496,7 @@ create_event_attributes(struct xe_pmu *pmu)
>>         const char *name;
>>         const char *unit;
>>     } events[] = {
>> +        __event(0, "c6-residency", "ms"),
>>     };
>>
>>     struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> @@ -511,6 +678,33 @@ static void xe_pmu_unregister_cpuhp_state(struct 
>> xe_pmu *pmu)
>>     cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
>> }
>>
>> +static void store_rc6_residency(struct xe_gt *gt)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    store_sample(pmu, gt->info.id, __XE_SAMPLE_C6,
>> +             xe_gt_idle_residency(&gt->gtidle));
>> +    pmu->sleep_last[gt->info.id] = ktime_get_raw();
>> +}
>> +
>> +/**
>> + * xe_pmu_suspend() - Save residency count before suspend
>> + * @gt: GT object
>> + */
>> +void xe_pmu_suspend(struct xe_gt *gt)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    if (!pmu->base.event_init)
>> +        return;
>> +
>> +    spin_lock_irq(&pmu->lock);
>> +    store_rc6_residency(gt);
>> +    spin_unlock_irq(&pmu->lock);
>> +}
>> +
>> /**
>>  * xe_pmu_unregister() - Remove/cleanup PMU registration
>>  * @arg: Ptr to pmu
>> @@ -536,6 +730,24 @@ void xe_pmu_unregister(void *arg)
>>     free_event_attributes(pmu);
>> }
>>
>> +static void init_rc6(struct xe_pmu *pmu)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    struct xe_gt *gt;
>> +    unsigned int j;
>> +
>> +    for_each_gt(gt, xe, j) {
>> +        xe_pm_runtime_get(xe);
>> +        u64 val = xe_gt_idle_residency(&gt->gtidle);
>> +
>> +        store_sample(pmu, j, __XE_SAMPLE_C6, val);
>> +        store_sample(pmu, j, __XE_SAMPLE_C6_LAST_REPORTED,
>> +                 val);
>> +        pmu->sleep_last[j] = ktime_get_raw();
>> +        xe_pm_runtime_put(xe);
>> +    }
>> +}
>> +
>> /**
>>  * xe_pmu_register() - Define basic PMU properties for Xe and add 
>> event callbacks.
>>  * @pmu: the PMU object
>> @@ -575,6 +787,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>>     if (!pmu->events_attr_group.attrs)
>>         goto err_name;
>>
>> +    init_rc6(pmu);
>> +
>>     pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>>                     GFP_KERNEL);
>>     if (!pmu->base.attr_groups)
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> index d07e5dfdfec0..17f5a8d7d45c 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -15,11 +15,13 @@ int xe_pmu_init(void);
>> void xe_pmu_exit(void);
>> void xe_pmu_register(struct xe_pmu *pmu);
>> void xe_pmu_unregister(void *arg);
>> +void xe_pmu_suspend(struct xe_gt *gt);
>> #else
>> static inline int xe_pmu_init(void) { return 0; }
>> static inline void xe_pmu_exit(void) {}
>> static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>> static inline void xe_pmu_unregister(void *arg) {}
>> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>> #endif
>>
>> #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index 920518967c84..b150850ae57d 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -10,6 +10,8 @@
>> #include <linux/spinlock_types.h>
>>
>> enum {
>> +    __XE_SAMPLE_C6,
>> +    __XE_SAMPLE_C6_LAST_REPORTED,
>>     __XE_NUM_PMU_SAMPLERS
>> };
>>
>> @@ -25,6 +27,26 @@ enum {
>>
>> #define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
>>
>> +#define XE_PMU_C6_RESIDENCY                    __XE_PMU_PM(0)
>> +#define __XE_PMU_C6_RESIDENCY(gt)              ___XE_PMU_PM(gt, 0)
>> +
>> +/*
>> + * Non-engine events that we need to track enabled-disabled 
>> transition and
>> + * current state.
>> + */
>> +enum xe_pmu_tracked_events {
>> +    __XE_PMU_C6_RESIDENCY_ENABLED,
>> +    __XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
>> +};
>> +
>> +/* Global PMU mask to track enabled events */
>> +#define XE_PMU_MASK_BITS \
>> +    (XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
>> +
>> +struct xe_pmu_sample {
>> +    u64 cur;
>> +};
>> +
>> struct xe_pmu {
>>     /**
>>      * @cpuhp: Struct used for CPU hotplug handling.
>> @@ -67,6 +89,41 @@ struct xe_pmu {
>>      * @pmu_attr: Memory block holding device attributes.
>>      */
>>     void *pmu_attr;
>> +
>> +    /**
>> +     * @enable: Bitmask of specific enabled events.
>> +     *
>> +     * For some events we need to track their state and do some 
>> internal
>> +     * house keeping.
>> +     *
>> +     * Each engine event sampler type and event listed in enum
>> +     * i915_pmu_tracked_events gets a bit in this field.
>
> i915?
>
>
> apparently this doesn't do anything here, it's only incrementing and
> decrementing a counter without doing anything. What am I missing?

This enable field is used to start/stop sampling timer in the next 
patch. However, it is useful to track all PM related event bits, so 
adding it for C6 as well.

Thanks,

Vinay.

>
>
> Lucas De Marchi
>
>> +     *
>> +     * Low bits are engine samplers and other events continue from 
>> there.
>> +     */
>> +    u32 enable;
>> +
>> +    /**
>> +     * @enable_count: Reference counter for enabled events.
>> +     *
>> +     * Array indices are mapped in the same way as bits in the 
>> @enable field
>> +     * and they are used to control sampling on/off when multiple 
>> clients
>> +     * are using the PMU API.
>> +     */
>> +    unsigned int enable_count[XE_PMU_MASK_BITS];
>> +    /**
>> +     * @sample: Current and previous (raw) counters for sampling 
>> events.
>> +     *
>> +     * These counters are updated from the i915 PMU sampling timer.
>> +     *
>> +     * Only global counters are held here, while the per-engine ones 
>> are in
>> +     * struct intel_engine_cs.
>> +     */
>> +    struct xe_pmu_sample 
>> event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> +    /**
>> +     * @sleep_last: Last time GT parked for C6 estimation.
>> +     */
>> +    ktime_t sleep_last[XE_PMU_MAX_GT];
>> };
>>
>> #endif
>> -- 
>> 2.38.1
>>
