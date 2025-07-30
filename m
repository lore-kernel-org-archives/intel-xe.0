Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AEAC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 08:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA17410E428;
	Wed, 30 Jul 2025 08:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kk1055ZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D56910E428
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 08:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753863841; x=1785399841;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iX1AOQIx82Cp/ZN36Kfr2VJFB/EwOJik2T5ODVJE6Ig=;
 b=kk1055ZC/C7WVAF+MoMsSrLZEOSz2UE0FDnWrorHLiUoIqb4QV0MoD/S
 RvWQvZkoQSve05DnNQTsIWqfYvxyxi0Vx9M0Wa8gpZ0BHlgUQSsDmi/EB
 tg1nhS+oyul/XqtyrRB1Fm2Eoyl26TjCk7VEOMQThPJdqL3QkAE7ImWbp
 JtnB72tvLXAWmEy7z+7Q8YUvIC9nkawoO+Y1Sl4BxhbQyoXrbL1j6uFdL
 2SAWB0qVaF6a3grNm9Vgmdy7jve6dexjYf3+DGzqShwmO13RkFV9hkqj4
 NeJOmdjmz/V9ILZBIp/kGGGwXqvH/DNjUBodnjXV4bQ6D7hk7lRHIjAfs A==;
X-CSE-ConnectionGUID: aR/1cSdnS9uojeb9YjNx5Q==
X-CSE-MsgGUID: 2k7JlYRtRkCFPnhE/JV4fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59982269"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="59982269"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 01:23:52 -0700
X-CSE-ConnectionGUID: +YqRrqs5SbCYoSzsND4l2A==
X-CSE-MsgGUID: SKuFNndnQ7qgsg/mbm311g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163271571"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 01:23:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 01:23:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 01:23:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 01:23:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzzRRL9k8z+bKDoD88JVAqmlF5bEcdLGvDXPKhAHFKBHb9yAPpEy/hjuJJsXNKkW7Snd+CzLQip8oJdiLsgTuBg4NoSH9DMEmZGyyEBaPjbE0G4CQW1/kSYoxCXjitJV73V7Yj/3DTyI1zAdN2LwoA4sR3ZRyr4noPSVlavEGs3vVcOa3b5NcV4CcfTRN+j5w+i2R5NAHNyAEJv2k1yyNccus0O+sq0p7507fbMhQaV8zYPVyOoqL3zyc8E04J/1rP3WO1qeAk/9npb0aobJdVZbE3a6bzOpfbKmmDXLcqTAc9tVeJ0uOyhnYRbfYssKDPmabkdJEa0HH5yBrsucQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MbaqGVjeIvtIIBmOwlqD6kNMpmnyrZT41cwugt25os=;
 b=Bde3XhCBoTXOD/1rMZdlVd071w6qoJ8thxB9vQLkq2UmSOhNfYUIYhbtQS/WlXtjVHpxn0J0QPDzOUoiA0KdKXoWijGKo+Cb3qtIZyiAl2wafdwAvOcddfQkalR7ZIDNzaUIvHEstmpdlNjP9U4YV/bxQfUULEogpfDRjLtx3b8pjZA6kGvthniIeHPUFOjgYQIJHY4slccwedG3k8NaX7lLyopk2lEyR78p03yaOmz7XxzffvZYr3sVegZcy7/xk7qqSsxsonJdIagp23R/0/et8AF8u22zF0MonEQB611FJFp4do9+42PBSvyZMECctIo3llv5ep/kNycYAzBvPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by IA3PR11MB8937.namprd11.prod.outlook.com (2603:10b6:208:57c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 08:23:26 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f%5]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 08:23:26 +0000
Message-ID: <91cb7b75-3fbb-4749-b048-de55a9599ada@intel.com>
Date: Wed, 30 Jul 2025 10:23:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] drm/xe/configfs: Only allow configurations for
 supported devices
To: John Harrison <john.c.harrison@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-11-michal.wajdeczko@intel.com>
 <aIk_4BBGSuIp19WQ@intel.com> <311dc290-d5fe-4214-b332-96337f3c80a8@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <311dc290-d5fe-4214-b332-96337f3c80a8@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_|IA3PR11MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae3946e-e2ff-4070-44ff-08ddcf425b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjJyejZPZ0xsZW1veGFoUnBuaVU3OEhqb0lYajJTanNWRlpIR1pKN3VRNlZq?=
 =?utf-8?B?bEZXdWlZNVVqeHgvcFk1MlVoMWd6QkVyeDVxVnVHMU9Qd2tjTGoxbmJVQ1F4?=
 =?utf-8?B?aHhMeHhuMEVZWFRLSjRXK0VzM2tOdXdRNXl2UDdveldOc2xCZVRSTWdYME8x?=
 =?utf-8?B?UG13TmhnMzJ4L0dsTlpyZkY0T2owOVV0YTFiNnNxbGRQa1Yrby9qUFUyTTk1?=
 =?utf-8?B?RmZZT2pWLzA0MjdJUFlzQnZBUFRRRmx4Y2RjMzRHMUd5d3J4V2JUSmJRaHdC?=
 =?utf-8?B?RlI4ZWdBeGFjODl5K0t2cVBCZlplY0FWL2luSzRMTFhzeElLeTJlbXIyaCtl?=
 =?utf-8?B?Yng1SnNDSG5heXZTdWltN25KREx5L3JnbEFBRjNDZ0hXdGlnMXVnZEN1Z1hR?=
 =?utf-8?B?eEpHeXZ3ZFBMSGlCRUxxRFlpOHdzRUV0NEtwc1pkdVF1RDlONXgzbDFncUdm?=
 =?utf-8?B?NGduWFhkdTA0b3FJRDI2eHFwdlZDcVQybUFjcjNxcjVmWmt0RWYxZGs2cWpK?=
 =?utf-8?B?anYyVVdwRGRrc2wrVjQzdjJ6aVFZUTdOVzBqM2NyakNLTUdsbmtWT2VwYUhH?=
 =?utf-8?B?RXlwQjUwd0RndU52TlBwOUJiS0Q5OXNEWmgxb0V2VTNJendiaFRPYnVyTlc4?=
 =?utf-8?B?WXUzcnZqOUJqSzhUc3kwUGpuYU0wc20rc3Fsa3FLNDVUazFsTHZSTGlhNGVm?=
 =?utf-8?B?U2ZUa3JOa1o5RHBRSVNSQnVucGxoUnl5VC9LcXpnOEtEb2lVdGtBdnNabU93?=
 =?utf-8?B?aHRUbTUzUjMybmhESmQwMDZ3aFlXVVd5cEZXSUhLcmlkL3dneWlLK1VvSm4z?=
 =?utf-8?B?MS9WaDZWNnBMN1JYZ2NBT2NCSERUbnZCMmhFNzd3RmNwS1ZNYyswdEczdysx?=
 =?utf-8?B?aWJIVUEvblBLbHY3dTNxMmo2UVJFL0VjaXE4YmdvNERDcEhEY0p6ejZxNGNF?=
 =?utf-8?B?aXgvVmRubldRM3A5NllScnhyMWxRMkJzQjFMQzFkOEVQOXp1ZVorTVNzWEMy?=
 =?utf-8?B?b3FLQ0ZVSGNoenRTSkUvSVlqOGtpalV6WEpqSWdSU0NHTG9nbi8vUkVwelMz?=
 =?utf-8?B?RjFlcmU1Y1lINDlLSzZhVFFqM0k3OXR0bmtkZ3ZLc01VN0VnYjBJeDJqWHd5?=
 =?utf-8?B?TThpRlZNWWoxeFVUVm44QmZOOWloN2Z2THF2UWtZWG9NMSttazc1OWVWamFZ?=
 =?utf-8?B?eWppU0FLaW9EdkkzUFRqMEI5MXFmRTYyVVpRNmZ3NTJ3WjcwR2FNMjNwRC9z?=
 =?utf-8?B?cWp1enkvSUQzUkwwTklLYTNSbE9TUm11aHB2VjBTajNLQ1d5cVV5TmRoM3B6?=
 =?utf-8?B?WUl3VTFVdW1tVGZxY3Uxc3FKdllRSjJVUU9RRFhqQjJPMWJrc0FqTDk0NEly?=
 =?utf-8?B?MkY3c2QyemQ1bm5PTHIrVklCK0g1T3ZRaWU5V3hFR1dYemhEVzRlUFpsMkUz?=
 =?utf-8?B?TldFNjlvbUkwd3pRaUZuOVpoSldBOC9jTlMrWER0aEN6NWN0MXpkRDk0R1F1?=
 =?utf-8?B?SFlqcVQ0bkVhZFhMOVVuK0lTM1F1VEFFTUdMbHRyaWV6WnBZdUFtdDNVOFFy?=
 =?utf-8?B?dVFCRnI0V0xHZnVNSzdIamJHKzZUdkZ0aENRSHN4dUF6bkhkREt6V1NubExV?=
 =?utf-8?B?NC9zRzRjTVZZR3NpVlhObEEzdEozQUxEZnVuTE5CN1BPb3ZMRGRpM3dRcVdl?=
 =?utf-8?B?a2NwZkNvTWpNOEh1dlRwbjdEajFJeEh1VGlaSlVYeE1pYVc5dlI5YzRkYjFJ?=
 =?utf-8?B?aEwvbXBabHNFbktvWktHZkQ4U1Y4RGtlTmRFTmwvQlpQZ1dDYjFrWVdIV0pJ?=
 =?utf-8?B?WkJUR0xEY0Q4RG00RllnakhoU0tzQWloQitjV2lvUWI0VmJmWFFyZWpyOGFx?=
 =?utf-8?B?RXdCeTF2cnVFQU9SQ25nM2ZKZW9QYS9abG9aUTY5VWRXVXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkIvNkFJakRGL3RSRURiYW8wMUV0V3NGL3Yza2lwQmw0c0ZBQk5YYU1Wc0cv?=
 =?utf-8?B?emlqS3R4enpFc1k3dCtlWXdCVkhQb3RSRE96Qk9zN2paSFErUm9sN0JhdVVW?=
 =?utf-8?B?ZmNZN1dCWEltQmZ3Mks2WDk3TkJ2OGcyWE1UZ3cxZzlMaitwSGFNTjdsVmg5?=
 =?utf-8?B?aUxkOTMzR3N2aFlUVVRpcDBPdG5kSnF6SVFUVVQxdUROTnJsbldNWkZ4a0tR?=
 =?utf-8?B?Y1FNcnhUMkVwR0p3ZnVCNVRjbTJuNEpkZERUMnBOSnZxUndONmJ1SUJjZmtW?=
 =?utf-8?B?WU13c1NIZFFVeGIzL00zRXoxYXlRNTZ6ekVZTnd0eWNIcWt4MkowWTB3dC9W?=
 =?utf-8?B?dFlKdyt4UWk2cUowZ2ZNb3U1bktKTEs1RHl0YXdKdjdBMU9jTVlWTEpaZkE1?=
 =?utf-8?B?Uk5VY1Z6dlFDU0FpdDd5aXlrV1k5aGxMMy85azBYK3hoYTgvNW5kdkwrNWJF?=
 =?utf-8?B?dStqTUFob1NLVFl3QXo3cjJhN1Vhb2tkaWpmMERZMysxTzBJUzE1WHF6VXFS?=
 =?utf-8?B?S2V4OWhJQkt1VW5kSVdsUDNnbU9keHpFTmxGV1QxY29DRUs5MGVVejlIaitt?=
 =?utf-8?B?RDdpTko2dWw1M2VZdDJBNHNmcEkvKzF2cC9jNjFtOS84U1MvamJhdEUra1p6?=
 =?utf-8?B?STlqSW43Q2RxaEhQVEVUVkE2cnlKdVRWa1RBemZWbzR0SzJtZUx4SXVCSU9H?=
 =?utf-8?B?KzAybHA4N1d5a2xiVGNJdVczZkVtMGVkaGlkUk1TdFlidTlZZEFhTTR3M2Zh?=
 =?utf-8?B?QlF4bTlNeGpLNDVrU1FmWEJLTGhFOWVWZkRxbFQ4ZDFVQTFiNCtvN3gvbmdF?=
 =?utf-8?B?Y0NQM1crejRZUnpCTTViUVJXb0ZFNklmOGh2cVcwNnhXYXI3WE1ZQmRkc2lE?=
 =?utf-8?B?RDhWQkx2Vk1UY2k5Sk9KRHd1T3M1dksrT0syOUE2cWV2aUc5ZnRid0lIR0ho?=
 =?utf-8?B?MU9NL0h5OWdJNUI0V3o0dEc4L25xNlRwYlpvRFZrMEVLNXNmeDM1V1lZamZ3?=
 =?utf-8?B?WFFlQjdwY2Z0bzN0dWRaRmxyNjBBTUd0UERFeHhkNm5xZVRBaXVpTzNhZitQ?=
 =?utf-8?B?R1Nqa3VZSlJIUTdyVk9yTUNkWk1RY0ZPait0U3pGRWs1bWRJYkhaa3dCRklI?=
 =?utf-8?B?V091aG1NanJTQlMyT2IydUdZalQ1VnZZTHJPeU5vazJvN0RQUFBYb2dMUUhH?=
 =?utf-8?B?Z1FaaXVsd0FqYnlzSTQ0aUFRZFJTQjdYaXhzdUpqRENvblhBYjNSa0VFbWFp?=
 =?utf-8?B?anZWT0JDK1ZZQzBlYXhXa29YRUtpNHUxdUt2RWRmK2JEVWx2cndYMUJobGx2?=
 =?utf-8?B?T3ZTNTJMb1VBMU5INlRnbS95RUlhUXA0UG5NNjdBbmFndlFjcWxiRHpCSmRz?=
 =?utf-8?B?N09WYUNGdnBpVWdnc1FHRnJVcVM2clA4NGxKRElhSWJFY0tuYmVlSEYvdGdT?=
 =?utf-8?B?WFVMZHl6ZzhHU29KTEN1Zk5BeU1BcEFSTW5XTnBxck52VmowTWd5M1VCdUJx?=
 =?utf-8?B?U0VPWHpQOUxSQUlmZFB1a05Xa1h1YlJqN2Z1eVhWUTJRZ2FPQXdQRnRFUFRy?=
 =?utf-8?B?VXBqZHhpM2FWbjYwWVZpTjFaYzUralh1VG9aY211ZnhKazNaZHNrOFVPc2RS?=
 =?utf-8?B?SlpNVlJiVTN3akQrZHF0RVlIUDlsUlJuYUV3bXUzQm1yUnRkcmVEUElSejUw?=
 =?utf-8?B?S0ZyMG1FQjFyaFpuZHIyRERSRzF0RlRlMW53ckEveDcrd2d3dFFNZmZxc0or?=
 =?utf-8?B?RmhmNkg2QjVnQ2IzQWNmMW5jNVpJckVjYWIyRHBycDNlbUJDUi82alNkUUhx?=
 =?utf-8?B?VzRZOGFLenRWbzRsUzNPbEZYajdDZnlsRDBxelVZRnVtcUlVMjN1M2g0Kzdk?=
 =?utf-8?B?RlBSLzIrOTA0dEViTFdEUlExUjhyUktVYlYxSEJ5dnRFSklqRUNRNFJkRU8z?=
 =?utf-8?B?WlhUSk43bjZ4dHRJODI2VVcxVUdXU3NpYmlBWGhwZjgzSG9NaU5LSXBxdXk1?=
 =?utf-8?B?eGEyaHhKZzRqOVZOOW1rT3lIU2lsVTA2d1dMWnE1NkxOaUs5elM4TitDQTZI?=
 =?utf-8?B?VkRwbVhXMW1Md3hXa25MbzgweFhid3VLSkk4VnUrME9sMWVjZ2lxc1hUMmhh?=
 =?utf-8?B?bStyLzRUUENvUmp5eTl5cTBBMFJLTFV1TGFLMS9DOTJmY3dyeFlNeVIydnNp?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae3946e-e2ff-4070-44ff-08ddcf425b09
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 08:23:26.3190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNeOlAgytvTN23P0cY8n+dwDhCwGafEPbLbjKPWQStMope2TmfnEszST/pfkMRuNCtvRtzahTyVUo1f2nkIpBc4+M0tmWSE7PV4p7RYtUUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8937
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



On 7/30/2025 12:20 AM, John Harrison wrote:
> On 7/29/2025 2:40 PM, Rodrigo Vivi wrote:
>> On Tue, Jul 29, 2025 at 01:42:14PM +0200, Michal Wajdeczko wrote:
>>> Since we already lookup for the real PCI device before we allow
>>> to create its directory config, we might also check if the found
>>> device matches our driver PCI ID list. This will prevent creation
>>> of the directory configs for the unsupported devices.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>> v2: rebased
>>> ---
>>>   drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++++++
>>>   1 file changed, 17 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>>> index 5f145ccdf535..766775772eef 100644
>>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>> @@ -275,11 +275,22 @@ static const struct config_item_type xe_config_device_type = {
>>>       .ct_owner    = THIS_MODULE,
>>>   };
>>>   +static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
>>> +{
>>> +    struct device_driver *driver = driver_find("xe", &pci_bus_type);
>>> +    struct pci_driver *drv = to_pci_driver(driver);
>>> +    const struct pci_device_id *ids = drv ? drv->id_table : NULL;
>>> +    const struct pci_device_id *found = pci_match_id(ids, pdev);
>>> +
>>> +    return found ? (const void *)found->driver_data : NULL;
>>> +}
>>> +
>>>   static struct config_group *xe_config_make_device_group(struct config_group *group,
>>>                               const char *name)
>>>   {
>>>       unsigned int domain, bus, slot, function;
>>>       struct xe_config_group_device *dev;
>>> +    const struct xe_device_desc *match;
>>>       struct pci_dev *pdev;
>>>       char canonical[16];
>>>       int ret;
>>> @@ -297,8 +308,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>>       pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>>>       if (!pdev)
>>>           return ERR_PTR(-ENODEV);
>>> +
>>> +    match = xe_match_desc(pdev);
>>> +
>>>       pci_dev_put(pdev);
>>>   +    if (!match)
>>> +        return ERR_PTR(-ECANCELED);
>> why ECANCELED instead of ENODEV?
> Or EINVAL? This is for when a user has created a directory for a PCI device that exists but it is not a Xe device? Seems like ENODEV is not the correct option given that the device does exist. But ECANCELED also seems odd.

we can always return -EINVAL but user will have no clue what went wrong

so the idea was:

-EINVAL     when config directory name is malformed
-ENODEV     config directory name is correct but
            there is no such device under such BDF
-ECANCELED  when device exists but it is not covered by Xe driver

since you both don't like -ECANCELED for this case, what about:

-ECONNREFUSED /* Connection refused */
-EOPNOTSUPP   /* Operation not supported on transport endpoint */
-ENXIO        /* No such device or address */

> 
> John.
> 
>>
>>> +
>>>       dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>>>       if (!dev)
>>>           return ERR_PTR(-ENOMEM);
>>> -- 
>>> 2.47.1
>>>
> 

