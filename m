Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B33CDD1D5
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 20:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45B410E010;
	Mon, 30 Sep 2024 20:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOSERCfN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2041C10E010
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 20:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727728532; x=1759264532;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DJzcQdoS14cjoIELOFDgzZf2lD3XALZMDMlokcjlhVc=;
 b=XOSERCfNq8e02yRVwlPL2haDqc6pAi2BjkfnREOZ6HVU5+05XReqbRH0
 c50e9Pqrryi+YR6ALJQC1TlrLCk5Ovq3CJW9l1Mg5O55upDwqvQ0dXazM
 TDs48QbClrzfjcpvyhgSLDXtUNTLkjAeneuHJMOJpSp/gG0y8MKvofzbr
 /NNjKf22ZkWZcLLR5D50zXHGKiw+FuRy6YtyXDf6E0fCHg2qSKmo3+7oa
 MovcfM4Gl04jgAwi2/he2qYbo0ZgAIdDn132h9e2IJJlKORkzaFMha5PI
 AUVZjcjdHQj1M1vnF2cIxVNaYV4BhFkjt4WssGacCQvIeFZdteqjLt1DG A==;
X-CSE-ConnectionGUID: 4QkE0vlpTkSMI4VmVs3WEw==
X-CSE-MsgGUID: AKIETwUFQGeNcdzv9PDTjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="27015588"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="27015588"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 13:34:47 -0700
X-CSE-ConnectionGUID: mXaRrngBRja023IwFLUB7A==
X-CSE-MsgGUID: +qQ/sIKrQ1mlxQkYhBCboQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="78392096"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 13:34:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 13:34:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 13:34:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 13:34:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmgTHTKSjuYdSABah6P28YSNXlXQP/GrAEJazLCz1UeC0ySkgAnOZnrgdjYj+r/cG8LxpnEU8754aYC+o+vL/gMC97x2ODevFkQHDCzg6tSNeHTeMmsAkdDgn3uvkuESZwSNX5tgMesA/RHssf0NWelvaTg5EiSOzsbt7eZG31/E9I4tccHBGCrjLIcSz8sPK2e/XPMOHe38vR2uroZoCZuYc4u5gouQTydxhIm2ew7EG2vbJbV8p+Rsuf5xPlZALEXLaz2BM8la9rzAbMY18KdRnM1LO8H14QAxbqx8LSR385hqQFTTOnSAIrIK2D/vKOeHzDPuRWk8bF/4EtC+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8pO2XWsmHBXmV88OP17hX7Lgqh1g4+ArROJjGo/m9E=;
 b=FCK8CwSMqcyFQr0RfCB7WigTUfmEvQvGFiGS7mahv1n/0xB66q8wsJF75UNyPbQA6WwXLSMy5be1CetK0WT63g+NCzos/tY1jnA4A5VbYSdHncPlvNSakLId6SFHp21jkwtrJJQVjAYWmQ6/BNyQRwfskbV7t308w1QKmZzjnmT9scRWyrZyBqJ0tufUcFgSN4QuC+dX87/2EHPnh2+vJEHjZptBN0vJI/uUb8mXc6+4mfpoOgt7b2ovXvCn0e0Qfbh1NVnjALTjYry0HbCL/suqlkh5SW+6mf6xSPHH6OMmf5/z4CnBMGpxeDjszW2p5rOEakV4OvleZv0nYtkGIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV2PR11MB6047.namprd11.prod.outlook.com (2603:10b6:408:179::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 20:34:38 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 20:34:37 +0000
Date: Mon, 30 Sep 2024 13:34:36 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/7] drm/xe/oa: Separate batch submission from waiting
 for completion
Message-ID: <ZvsLXNoZN5LgA17g@orsosgc001>
References: <20240918195330.3167756-1-ashutosh.dixit@intel.com>
 <20240918195330.3167756-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240918195330.3167756-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:a03:74::41) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV2PR11MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 12988045-4339-4d4e-a0a2-08dce18f4d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzJXSUw5dmhYYzVybVk2SFBJdWJrMFF5K0pGY2M5eDlBK2lEZXkrMzRkbmdu?=
 =?utf-8?B?SktZUXhkbXViK1hkNGoranY5YzNRTTdLQTdzZ0FkeDhYUXpoR1VjaHRxc0Np?=
 =?utf-8?B?TUNkK21rNjBtM3BKcDg4MHhrWXY0L2VzbG9DQ1l3VUlZVjFEUzdUUVM3VUUz?=
 =?utf-8?B?d09JS3ZQQWFqNkorbUluUkN0ZUtBQzFEYlFQRS9SUVRZaXhVaGRpMHRuRnkv?=
 =?utf-8?B?WXlIdnRtSkN4M0duODhiQWcrTVZ0emxKMjFYYXVRYTVnOHlTNHpTL2grMmQ1?=
 =?utf-8?B?dlp0UzBGbDlZVUFGangzckQxMHRtSFEzRUZiaGVhb0R1MkxTMHkvZnpLQitw?=
 =?utf-8?B?K3lXTjBJT0pPNGc5MGgzK3FUTVZ5YlJEWWxremF3eVA0YmJWWlBFRTRqckFE?=
 =?utf-8?B?emxqL0p2TU9XWm9hUWZnQmhucG5KWHR0TDdMWVExZnFGdmpIczJicVBZUUg1?=
 =?utf-8?B?TVBFeEpXYUZBUDBOak5FdHRJVEwyendQaWwxUndKemtKSHpKYUNkbFlGYVBz?=
 =?utf-8?B?RVNzNExHbFRWWEFDOEE0Y0kzQ3BmQmc1MEhtQklLMWRCUnpaN21JT3FzVHhP?=
 =?utf-8?B?OHovWGoxWm53NU10VVR6dnlWcUh6YVh5OHE0MXREQWRXd0ttdjNzTzVucm9X?=
 =?utf-8?B?UU42aXBnSmF5bFJGV2pNQVphVno2amlFYmNKUlRtVFR5ZlBHdkg1M0FjK1lP?=
 =?utf-8?B?cG9aVVJwcWpPYkUxUXRwTlhlclR6RjlPbFpNZ1hrODlqUjlhQ1NGZ1lUM2JE?=
 =?utf-8?B?NzJkb0t1cXpzYkRuNWNSTDJwZ2FKdUJrb1pBSkhQV1B5N3VjblNCSUVJMXA4?=
 =?utf-8?B?WFZJQTdQbDNaT2dxOWdZUlcydDlzRlBCeGhzWHAvdkhtNDR4TEFTTHBhdytq?=
 =?utf-8?B?NXRmWHMySk5KNjVxVnJITmJwS29xdjZjZlYwam1DOFc2OUY4NjhWSnFqdlUy?=
 =?utf-8?B?NzIyS3BTT2N6TFZzbmpmT0Zrdmk5MmZiWkR6c2QzOEt1Q2doZXRxM2RrYitM?=
 =?utf-8?B?a2Q2c2V6NUQ4SzRURi9MRTl6T3ZvRUp6WkRIQzJEMnNaU2g0UjQxVDRYVVlu?=
 =?utf-8?B?MHpadk5tRTBaT3FPZTF3SGYrTy9BOTNIUG1kZEE1cy9UMGNRVHhXTTV0NndS?=
 =?utf-8?B?VmxMQU9NL2Y5UlpXNHRsdEhwdWFIYXNsa3FHSjBOMHhVYWpmd0c5OEdOV1BJ?=
 =?utf-8?B?MkVOdFZIcm9iSVBIOGdrYXRRb08yZ3JSQ0xNUVpPSkFUSEJVdzFxM3VyNGUy?=
 =?utf-8?B?dFl1ZkdQay9xdFFBL21jTUxhY3BER2laQmRkVnNycDVMekEzY2RlRHIraEdq?=
 =?utf-8?B?SForazVIaTArZjZwekpMVU9TdHBNaFh4NFNIQlBTU2M5YlpoQUVuVVdETUV5?=
 =?utf-8?B?NEw1SGpvM05MQ2VNOXhBSTB4ejN1SmpwZk1JMG4waGIyOEJIaDdHbGlDMlVp?=
 =?utf-8?B?Ukl2TWlnZXZmdXVZaEwwRUFoYmVjdW9DdHdHcm9XSWpyVzA4UUcvem1zRENV?=
 =?utf-8?B?cEFsRmRmcTNIOEh6WS90YXkrdWVsamtadGpmYnhlR0J2T1JQamJqZTNNekU0?=
 =?utf-8?B?RkhORmpxVkxVWUYxNWc0OFdxcDU4RnNaWStILzJIYzAwN0R1emJ4ZDBJM2dq?=
 =?utf-8?B?dXRYeFArelJlUGpsUHdjekpHbFJwVnhWMS9Pa2FYTFJQaHE4SXQvY3dpYnBh?=
 =?utf-8?B?VGo5TzBDcmpTckJpTFowcVh5SGRNd1l3MTZjQTlmNVk4eXFEcGNUZ3hBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFpEUmQycjkxdmZmdFV2akpZQk94VmF5b3dLSDNORUNDdVpzc0R2Y1VVNWVa?=
 =?utf-8?B?S3R5U1lhSCtmQUNCQlVkWVdBN0xyaW43TVpQbWMzQS93aEx6cW9ROStPVCtT?=
 =?utf-8?B?eGlSei9Od1d0dVlSRksxeVNqTWpaR2l5YW5jb045NUhZeXlPblFzZDlxT2RD?=
 =?utf-8?B?d1NwMlhpZjRTRWc3WWlCckViUGl4RHFOUTFVRXlxVnUzSHdkN1p2cS9wRWtk?=
 =?utf-8?B?ZkdDK2ZTYXdveDdmRXlmM1dtZHlJVHZ5aktwMUlqckRqR2pTa1dKN3N1Tkpp?=
 =?utf-8?B?L1lzU3lEZzNDM1JFU25SeDBEYVJKWG1ZZHhFdjVvNzRodGMyRzV0VjExRlda?=
 =?utf-8?B?bE92MGhFTWJiUkhkWER1UkNDbC9xZEFnNVNoRWZ1ZzVYYkY5dkl2UTZtcElT?=
 =?utf-8?B?ZW02ZWxSMjJyWHN0dzZnbzhNUTA0WjBLazFFOGhsUTd4VHh0S1hjRHNwcXRz?=
 =?utf-8?B?Qk03bTJBOFloVllLQzUxR2xBWFNSNUtiRmJCNitDdmFSMlI0Q0N4VUltV3Y0?=
 =?utf-8?B?eVprNWg3TnN5N2dTS0xra3FwbkRJQVo5eEZTQjgrdS9xL1g2QWZsYjJ2UzdZ?=
 =?utf-8?B?UE95dTdzek5Ca29uRjRGK3RwOUZXTytjNitrR3JjaDhremVJYlFLSzQ4OGRu?=
 =?utf-8?B?WGMyUWpKWnNsOXBFQnhnaFE5T2pOTVI1c0V0QnAyWlQweXRoejZHSmxLbHZQ?=
 =?utf-8?B?ZmJMTzk0ZEt3THVnU01UUmh1Lzl1dkZhMzQ0c28xRjJNMHBkWkp4QVBMbDZk?=
 =?utf-8?B?U09jZGpwWE1vNjcxeHRKSi8vdnZzOXVSVTZOSE1VOC80eEhUNWhGNHdyditx?=
 =?utf-8?B?bXJzazBwOFdFR0k3aFdIb3pFZ3N5UWtoaTBKaWdsUkl5ZTNDZW90WEJnT0NS?=
 =?utf-8?B?NDdoTXFjcUxUaDVOVzlnSTFlK0FsQk41eFBlejNTY0xQWHJHck5oa0FEaVl0?=
 =?utf-8?B?d0IvSjNhY2ZDMXJhRjI5SUlYaFgzMU9XR1RVaXlvWnRhWW9jUlRicnVpYzFu?=
 =?utf-8?B?bkZyYzI1N2huaDJOOTc0Z3pzWS9CbWtGOW0vRktHZ0N3dEFod0JXMkR4cnJO?=
 =?utf-8?B?eHdoT1hrenhNNGphRU5PY2ZMdE9ic3FIcVFyZlF6S2ZoU0pPQjlSaFlQUVRU?=
 =?utf-8?B?bnpMb21RWWlxdVcxbGZuOE5SdTJid0ZoS0VXOEs0amlURXRWaVN0OGtWMTdG?=
 =?utf-8?B?NnV3VVNxZFVSQmx2WTkrcG5mUzF1Y1pGQXlxYWFUYjhTMXpBZE9mMU5UeU5X?=
 =?utf-8?B?UVI1N1BpY1Jka056SmFHUkZTeG44a0gva2UyRzFpNzRIaUFiTkVZRktJTUtE?=
 =?utf-8?B?ME1JdjduN2ZkSEdUUUF5b0M5aG5vKzlTdjBpd3BlRzhNR3hEa1k4SVBVOFpN?=
 =?utf-8?B?cWN4a1RqSnBhclpjQ25sTldnaW1uSG5wUFJndE03NHlEQVE2R2dwNUg5SDJr?=
 =?utf-8?B?K3JOckJuVC9qSnhVT2ZiNTcwSVcwdG9xYTAyWTVsejI4MG5GcDQvVU9tVnpP?=
 =?utf-8?B?c3FFZklOY1lyVTJsazBzcXFwVXNWMlFsR1JZVkNRNWxtUFd4eDdkQ2w0ZXVB?=
 =?utf-8?B?amUxNDZybm5mTjhWZlNUNlJnWWNzbTZtZDlJQUJ0UjE5Y1cxUEZTeEJYR3hr?=
 =?utf-8?B?T2xSZW0vZ2JxZGRyUit1Y0RadmoxbFM4RWNLRWl6UHhRajZzMWJJMWo3K0JZ?=
 =?utf-8?B?TDNrSmJYQk4zbTNWMjNId2lZRWFKSkFndWhWVEJSQkFKN0xJK1EwcG5Qc1Yv?=
 =?utf-8?B?Mnd6UjFwRFg3SWttY2V6YlJoeG9nUE1mK21rT25xVUlBNnNwcUlRN1BpQWFI?=
 =?utf-8?B?VEFjelR5M3VPQm1NUkJWZC9jcURVK1NJVXdSR2dCbmFkbVluNzFtejZPTHU0?=
 =?utf-8?B?KzBYSGVpNWNhQkRSdkp3NytCWngyaUI1MDFGTkRMMW1pYTFvOUx1L3RNb2VL?=
 =?utf-8?B?aitlMGNzeGd3ZVRLcEwxK0dLbUZGRHBNTVZOcS9qMlZ2MWN2NFo5TTgzazR0?=
 =?utf-8?B?dG8zRXJQSElUNXcvQ3k1SElQcHlQTjVwaDcxbHA3YXU1M0FxQWFXWGN0MHlQ?=
 =?utf-8?B?M1hScFM1eFdlUHg3WVBXbDliakV0eXc3QXB2T21CTlVlU3I5alVOQVN3eVJQ?=
 =?utf-8?B?WWI1TFk3c1hPWGcwZ2pibDFBbTMvRTFQa0grTVJJQ3NLL2NvRGRVMzNVYUYy?=
 =?utf-8?Q?+1D9o2+FWEh0CTrgNqsShfs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12988045-4339-4d4e-a0a2-08dce18f4d90
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 20:34:37.8649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NoFcGHMJcO0DYe97bmlMKgbbk/99pHomrMVlXBt2NZEi8F/L/C8q3+0vANg4FJ90LJYklSjvuZCjnO2vZhv1czI2buV4ss4vtS6EIW8ukQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6047
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

On Wed, Sep 18, 2024 at 12:53:23PM -0700, Ashutosh Dixit wrote:
>When we introduce xe_syncs, we don't wait for internal OA programming
>batches to complete. That is, xe_syncs are signaled asynchronously. In
>anticipation for this, separate out batch submission from waiting for
>completion of those batches.
>
>v2: Change return type of xe_oa_submit_bb to "struct dma_fence *" (Matt B)
>v3: Retain init "int err = 0;" in xe_oa_submit_bb (Jose)
>
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c | 57 +++++++++++++++++++++++++++++---------
> 1 file changed, 44 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 354ee9045efc8..52805e159e6fd 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -570,11 +570,10 @@ static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
> 	return ret;
> }
>
>-static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
>+static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
> {
> 	struct xe_sched_job *job;
> 	struct dma_fence *fence;
>-	long timeout;
> 	int err = 0;
>
> 	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
>@@ -588,14 +587,9 @@ static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
> 	fence = dma_fence_get(&job->drm.s_fence->finished);
> 	xe_sched_job_push(job);
>
>-	timeout = dma_fence_wait_timeout(fence, false, HZ);
>-	dma_fence_put(fence);
>-	if (timeout < 0)
>-		err = timeout;
>-	else if (!timeout)
>-		err = -ETIME;
>+	return fence;
> exit:
>-	return err;
>+	return ERR_PTR(err);
> }
>
> static void write_cs_mi_lri(struct xe_bb *bb, const struct xe_oa_reg *reg_data, u32 n_regs)
>@@ -659,6 +653,7 @@ static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
> static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lrc,
> 				  const struct flex *flex, u32 count)
> {
>+	struct dma_fence *fence;
> 	struct xe_bb *bb;
> 	int err;
>
>@@ -670,7 +665,16 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
>
> 	xe_oa_store_flex(stream, lrc, bb, flex, count);
>
>-	err = xe_oa_submit_bb(stream, bb);
>+	fence = xe_oa_submit_bb(stream, bb);
>+	if (IS_ERR(fence)) {
>+		err = PTR_ERR(fence);
>+		goto free_bb;
>+	}
>+	xe_bb_free(bb, fence);
>+	dma_fence_put(fence);
>+
>+	return 0;
>+free_bb:
> 	xe_bb_free(bb, NULL);
> exit:
> 	return err;

Just a nit - if you initialize fence and err, then this will be as 
below.  Note that if fence is NULL, dma_fence_put doesn't do anything.

{
	struct dma_fence *fence = NULL;
	struct xe_bb *bb;
	int err = 0;
...
	fence = xe_oa_submit_bb(stream, bb);
	if (IS_ERR(fence))
		err = PTR_ERR(fence);

	xe_bb_free(bb, NULL);
	dma_fence_put(fence);
exit:
	return err;
}

otherwise, lgtm

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

	

>@@ -678,6 +682,7 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
>
> static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
> {
>+	struct dma_fence *fence;
> 	struct xe_bb *bb;
> 	int err;
>
>@@ -689,7 +694,16 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
>
> 	write_cs_mi_lri(bb, reg_lri, 1);
>
>-	err = xe_oa_submit_bb(stream, bb);
>+	fence = xe_oa_submit_bb(stream, bb);
>+	if (IS_ERR(fence)) {
>+		err = PTR_ERR(fence);
>+		goto free_bb;
>+	}
>+	xe_bb_free(bb, fence);
>+	dma_fence_put(fence);
>+
>+	return 0;
>+free_bb:
> 	xe_bb_free(bb, NULL);
> exit:
> 	return err;
>@@ -922,15 +936,32 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
> {
> #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
> 	struct xe_oa_config_bo *oa_bo;
>-	int err, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
>+	int err = 0, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
>+	struct dma_fence *fence;
>+	long timeout;
>
>+	/* Emit OA configuration batch */
> 	oa_bo = xe_oa_alloc_config_buffer(stream, config);
> 	if (IS_ERR(oa_bo)) {
> 		err = PTR_ERR(oa_bo);
> 		goto exit;
> 	}
>
>-	err = xe_oa_submit_bb(stream, oa_bo->bb);
>+	fence = xe_oa_submit_bb(stream, oa_bo->bb);
>+	if (IS_ERR(fence)) {
>+		err = PTR_ERR(fence);
>+		goto exit;
>+	}
>+
>+	/* Wait till all previous batches have executed */
>+	timeout = dma_fence_wait_timeout(fence, false, 5 * HZ);
>+	dma_fence_put(fence);
>+	if (timeout < 0)
>+		err = timeout;
>+	else if (!timeout)
>+		err = -ETIME;
>+	if (err)
>+		drm_dbg(&stream->oa->xe->drm, "dma_fence_wait_timeout err %d\n", err);
>
> 	/* Additional empirical delay needed for NOA programming after registers are written */
> 	usleep_range(us, 2 * us);
>-- 
>2.41.0
>
