Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FD3CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 11:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5350210E6FB;
	Wed, 24 Sep 2025 11:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9Et+/Sr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101ED10E6FB
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758712528; x=1790248528;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rgNu6m/xdehKJCY0OzqBThC3qJ01dPXVL8kwG16fxwI=;
 b=h9Et+/SroEUvmHZDdVHJ1duE2WOrVnDLoGNuDrvJSKv6g5pRv4CMFvmR
 sNYUyFteCSjqxcUPlGG3i5evjwS2guBwFReOURxqs6zBg746XHuymVzkG
 1AFuNpxb1+JUu9CQfKkvkCRPrD619nshOlfbnchX6A2YN0uFOjO5RiP+f
 //ERjcZp9u943P9H1vhD5Kp5CU5oWeUsdrOfHeGAk3c7VpnXeptRDaRoS
 g4cQHFtBpKzB5ZZg0JQqsK/cJWFWVQueBwsipjSPGQ55Uk1D8dLVRbccT
 yGm1I1Y8u0vjnx06lVvBXnpvdI501ubQV2ko4INRU69jx3rG8GjPEa7bv w==;
X-CSE-ConnectionGUID: dPy4QZGVS2yo2D2Ji0QpWg==
X-CSE-MsgGUID: NouiMC1tQECRu4yzfoPRBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72429912"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="72429912"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:15:27 -0700
X-CSE-ConnectionGUID: S+43FDehR4OF4gHc7tKjjQ==
X-CSE-MsgGUID: f1qFfgq2RTiGiyEN2Vg9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="177411424"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:15:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 04:15:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 04:15:25 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 04:15:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzk9aNkkmewH5VpV9F9G9x2j4TZCZgMwc1MOIjup0eVLcWpnKV3+Pdge1FBiOngKWDvGo7N4qct5jPuL7BIxciHkdKBxzxsXneaXQQdl1JPHT9M8QvnUtbTQ6NriBHdLXQbbU2TTc9aLs/RhsbcFd4tloregJG6n9w5bCY+Z7iY5T4IYSDhEWNhF1ZSyRrc6UNf3WAsiwwkDdiYX1nxDyo6jTlERURPateftaOt2u8DcEn8b0WcJR6ZDyvJJM+BqzruZbqxH72VDXO1EAfyBDwCVQvP2QINbmeMBei852EWUgXT8INdTqkdygclZ4JDV0ePxezrq8/uJ+zGnyRLe+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECMXJnc87IImlJ9H1fMT82aW1O3iHmbg62UgbDeCOdc=;
 b=B0bw5N1YiAataenm+PImoKmMr7TG3fstx3dcDQPcxzi8b6AMamEaMU/oSnmA99X0bAfsWs9iU/5heem4O4oW6Q2yF/9n0nKiQ7Kxc4Jkby+wWA8Efw3xANnkiIiLJN8dM+oiLkKPISV4NAxrscO6eghZU5gQy5vaI6owLRmlZhC3SegyigGRvvWGYJ+tgLyaacURRGGsmrj3HK3loGrI0qrxMOkcQuJSrQ0v/tIuYeVG5UQ/4Tp+0mgMXOO9RC/r4zZuQtzHCRkmD809uzglJ+xu6j3qrd/pnQSNWtVdon3j9z0BKBOKbrBU9szAFU6EaSVe8cYYKlfrqE9tsU+qGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB8286.namprd11.prod.outlook.com (2603:10b6:510:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 11:15:17 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 11:15:16 +0000
Message-ID: <102156c3-a7e9-4237-9f19-866b814b3301@intel.com>
Date: Wed, 24 Sep 2025 13:15:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/34] drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC
 context register
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-21-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250924011601.888293-21-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::28) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9eada7-b63e-491b-6464-08ddfb5ba3ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmNGekpaU0FFOWQvY21XSCtrYmxMdG93TldWZUFRbXNqckFHMVJQcjRoRDFo?=
 =?utf-8?B?QW8yZ2RVN21HUkhmQ0tRUHo0ZGFlbld2TVJiU0lvbEdROHRoNDdRZDlXS2hw?=
 =?utf-8?B?NHNLRTczU3VzeElsR1l4aEJKc1ZTRDJaUVJSQ0VPZWlNNDN5bzhvTzF5RlI2?=
 =?utf-8?B?SmM4eEJwK0FqMEFqaXBpNWNNRTRGbS9ZRUZkcTZ4VFpRc3lwS1pQaWx5S3pV?=
 =?utf-8?B?OE1YSXNmbmpEZ0JRT3Z4ZkRkcVlSdGFNNUMwOEI5enJHTjJCTHBZUkVKM2Zk?=
 =?utf-8?B?ZndCcEhUcTF1eWxYZi9FSTAvRTVSWldka2RCMzFQMXZHUzZ4YmI4ZUpuVHVy?=
 =?utf-8?B?UC9pVkxEcmJpaFdORldDeXF6RWZ5a2FHaExKN0gwc21CSnVoYlJjdVB0dlIz?=
 =?utf-8?B?OGVRVFR2Z3hRbHNHQXRObzJLVUxHOGFQYTFIYUlDdWRWZjVFczZCRFVacElJ?=
 =?utf-8?B?SG0rUmdQb1lnWWN5dHpxZEdyeFB0L2RhUkg4M2hVVlp0SU5uckhybHZOSnVw?=
 =?utf-8?B?Y0pLTDNiZFpITFdNdC9RS0laS1poUlVKd1E4S3EvOGZOMHZxVm1SWGh5NmR3?=
 =?utf-8?B?ZUN6b09RV0g2REFBREd5MDFPQ0RuWkpTNUs5SE9SK0J1djByaXFVS09XRno1?=
 =?utf-8?B?QzR3RW9pL3BybVlOVDVla3ZWcHQvQ24xNWxuY3EyVmZmU251RzBVUlV2ZmR5?=
 =?utf-8?B?RGVPdmYrUWlhMFJkUkdXTDlsT2RMbnByRXFXaVFFSGVPdm91NDdmbUdOanhU?=
 =?utf-8?B?eUovSC8xNkpRWWpMMU5PYkNhQ0hOakNDY25LMDd4VU1hbzdUUk1PM2NoYkRs?=
 =?utf-8?B?bHFQVXVMOXl2VE1jNzUrc05ZaC9pSlgxSFYvUTNrcS9QTFJBMi9LZ1MyRHQ2?=
 =?utf-8?B?a3YvT0xpd3c5cjFCdGRXRWpSc0NjOEdJQWFJSDZpZzBYbFEwb1J4eE9VelFQ?=
 =?utf-8?B?aW9Ud3VTR3QxNVIvUEFONUtlWnZ0WHBwbUtLelZ6VSs5SU9zTXBWazQwTDFY?=
 =?utf-8?B?ZWRnTlRMYklwbyt6SFRzeWZCRlEvRTZQSjg3RnF5MkN1aW5pM250ekhqeDdC?=
 =?utf-8?B?MXlsbWx2d2JZanVGdUJVTkRRWmdzUnZVNk91K0VnWklkNWw2WSswTGt2QW02?=
 =?utf-8?B?RXVjTDBWRjBjbmkwekdkNzNmTzczWVdhUVJKRUR6bTJPSXZKaUpwZWxObDdp?=
 =?utf-8?B?cytuMmJPOGk1d2dwZHF6NVI1RjRVUnlQc01EVWFsVzFUcVZwcTJ3TmNscDhN?=
 =?utf-8?B?cFhWbHB0YlM1ZnFNbHhvenpFR0tqYUs0VUVVdngxMjljYmZuSWdkZzZaYmdI?=
 =?utf-8?B?WUUxN2ZOZER3UjBKRGdFU3RSb2s1WHU2UUJaZ3JTOVlmSDVGOG5wRDRBTVF2?=
 =?utf-8?B?WEY2cW5YaXlwY2ZDemJkajRQU2Q3MnBZWG0xdjhXekdaRHZ4enY2T1Fqc0lZ?=
 =?utf-8?B?VHMvcFBpWjFqaUhSSTc5YWViMThYTEtMQUd5MkNqU0ZmV3hkRmRURlZ0RDJI?=
 =?utf-8?B?R0lFR0N3SmZ1b0VScHluaXh1STlLZmpvYU1qcElIWlVVU2tZc3o3MFlENERn?=
 =?utf-8?B?c2ZqNWp4cHArSlk4dHZMVmhJUUJacHhBUG5vR2U3THZEOVRwSTZkNjRTeFZT?=
 =?utf-8?B?UEtveUIwMkxPTTBxbUVoSVBWeUtwR21FUlNCRlczcGV3NkhUVkRCaFVlUDJS?=
 =?utf-8?B?VGh2QWFKdkxrK2g1V2t6WmtsVDR2REVYVWxVZW5wMUtDS2lNY0hmSHUzRnE2?=
 =?utf-8?B?NkcvODNhQlN3ZW9md0k3alZ0SHNmU29DdTlwNmNLcEVtSTl5N3FkU2ZtUkFz?=
 =?utf-8?B?S1RkUXV1MWdCc3F6NXkybXI0cm5ITkVJaTI5VFU4VzVYR1ZGdUhvTS9aeUh0?=
 =?utf-8?B?eGdNWGlJN2lPZmFBZ1ljT1VRU1Rpa3FDWUZXaXM1aURndWd5MnA3VVczL05L?=
 =?utf-8?Q?ljdYiAicy0k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWVrL0h4b1I0RStyWHlzSlRGVFNPMXdDTU1EdDM4Wk1JNEJDSy9pbnl1aHpQ?=
 =?utf-8?B?SDBoaWt1Y1hISHlDYVNBRmdNWFBlUXBlRXpQV1drbXR0aDVneTFJa2dFUGhB?=
 =?utf-8?B?djMwZmkybWhtemZlTXNBRU9CZXRKN0FkYlBKbi9yUmx3cUhNYUducFJMME1E?=
 =?utf-8?B?WjNoN2RFeWVKT2tCQ3o3d1BWVXVESXUrWXlsTE55T0w4TWxhSnpCVEY2dzRH?=
 =?utf-8?B?d3NHT3FYWjBPZDY1MzN1YlZhd1RrV3pRcUxQTGhJMmxyQTBvTmFvcWJjNFpE?=
 =?utf-8?B?dU9TV2VpSWZicTE2a2RubGJvUTMxVVJISXVnZnBkaGF5WHVxNjh6dUdzS29I?=
 =?utf-8?B?NHZSL2FraWN3ZisvTVRLK0wvN1Z1ejJURk9GUHZWMzVyNzZqUi9xdkV1Mm9D?=
 =?utf-8?B?Z2NMVTA3c2RSeHkxSFdqMitROUZMdW0wZS9HUUdHejAva3lwS1Bqek13YVV0?=
 =?utf-8?B?dmhQZ0dMem9JaEJ0aE4wNXhYblM4V1lZOVZtRTJoa3VUc3o5NVhuaHluSytu?=
 =?utf-8?B?SzhCeS9Jd0pTQ2FsQkNNMWw2bWxkQ3l5cUN2YlYwV0hTVHk3dUFzWW1lY1hO?=
 =?utf-8?B?QVlxcVRsNnIrdzNnMG9sWmRwZG1aUFAyM3pKMzRsYis2R1crNVFPZWVKTlpO?=
 =?utf-8?B?cXZZUldpRmQ2Yy9Kbk01NlozNkVOeWMwMGxxMEdiVlQrZnJKcEFrUkxBR3ly?=
 =?utf-8?B?M1hVU1QvK1NxV1BwbGFKVkpIL21POVRiSnc4cHh0QjloQUs2aTM4ZGM2VzMw?=
 =?utf-8?B?NDdjSHJmQzByMjd2a1BYWWR3TTZ4bll6bWdzVEVjajcyQS9BY3QwQVUyWUxi?=
 =?utf-8?B?dG1GclpsTWg4dXBENDd1S0Zkb2FBRUNlY2lacmpyazlWZW02cDVNUkpsTFFp?=
 =?utf-8?B?WEVPWEJtellFWDdMZmxXOUNjSzFNWHdvYkh2aE9WMVFuK2JncC9PaDlmTmVX?=
 =?utf-8?B?Z2tLaXFFTUhoRXVJSmREWFdpSUcwb09NMzJOUmR4ZC85YlVCNTdpVnIxQUxw?=
 =?utf-8?B?cVZ5WS9sUWhrWForQ2I0a0NRTWduM0FEakFrWEJRYjhRZ1pqdWo5SCtBQ1NM?=
 =?utf-8?B?VCtnd1p1QThSU1VaUC9XajBMQWFJbWoyZWd5c2VENUxsTEZBUXJLY2F2QlhJ?=
 =?utf-8?B?eTQ3UFMrQTV0amdoY1VhTW9WeUVQRndTcHVlQ1JURlR0MUlsZFRhSG41Rklr?=
 =?utf-8?B?K3UydHZWR2NuY2ZrdU82NTJIZGhHZGcwdSt6cUdTNFZNWnVVd1NDbzdYQnNw?=
 =?utf-8?B?aUV6eWR6OG5FRHhzMXpzWkxxRnR0TE5KVWlxSXZrR2VWbzVnQldWV2JWakhu?=
 =?utf-8?B?enB3K09wSy9QUlFPUkQ3SnhidVJGQlIrajVHZ3VsNkJOb1ExaTNSaWxoR1VL?=
 =?utf-8?B?bFU0RENmZktnZVpsY2d3aGlDRkIrbmhrRmcxVy9jbnhLZ2dIbDFOVWZibUww?=
 =?utf-8?B?R0N6QzUvaXNiWG9xSUdwKzlwMTNzTVBDWXNET2lnZVFodjFiS1V4WHFSSU9N?=
 =?utf-8?B?S0FSOXdGeXBTUWsraVUxNTBtVDIxZHlUTWRMLzBOVXRLSzhXMGVPcyt0czhn?=
 =?utf-8?B?dndLWlJXbVUzT1dpUHZmNkIvcXptUWovSC95L2JyZzg1SFArc0RqazlFNE1X?=
 =?utf-8?B?c085Um1YbldTMlR0ZHlpMjF1ZDE3K0JxNS94ajNsQUN0YUwwaEZzS3Zmdlpi?=
 =?utf-8?B?UzNnc09NdXdSQllMNXlkRUFYTHkxNUo3ckVXNys2dkNGNkdxWVlGeG8zVjVR?=
 =?utf-8?B?TXY4Q1BhNlNEaERVMytJVCtTOWI0bVVxT2IzUmJnWm1OaXBuRnVrbGM4QVhp?=
 =?utf-8?B?N3BsWld1MVhudnBKMHM5N29PbFFKdUlEaFBoY1RjWGpud3RyT0pGR0I2Q3Mz?=
 =?utf-8?B?eGRQWkI2UzN5cEdzZFFsd3dJMjdQOWdRSXRQNjhuRWNUdFVVTkF3dGUzZldi?=
 =?utf-8?B?aFJiVzBSR2RBS2R4UHJUeHZKVlcxcEF6NVpoQ0FMVDd3Mm5PTmlvSlJ0WkVU?=
 =?utf-8?B?cHgzMmJmekliWHdNcW54MGVTL1ZLeGVYcHNZbnJhRklScXluYksyazJLOUw0?=
 =?utf-8?B?Znp5VE5yamx3ZXQ3MTlaR2wwZ21yYkJJMmtrZjJ1d0k5ZWJEVkJxMEZZcUcy?=
 =?utf-8?B?N0dUNXEwUVpYS3lJUW9YT3FGWTkrNzh6bE9Kb1JBN3loajJsZ2Fka0F2UEF6?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9eada7-b63e-491b-6464-08ddfb5ba3ea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 11:15:16.9073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfwktoNaXL5W1ptp5Hqo5baFPt8HbngdNIc3X1h2z6/4rL4WOqMb8nuZqGCl7NIHaQs3QS2/VgekdEt+t1MAItu9iIlegCXI/Nscp1rJCFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8286
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



On 9/24/2025 3:15 AM, Matthew Brost wrote:
> The only case where the GuC submission backend cannot reason 100%
> correctly is when a GuC context is registered during VF post-migration
> recovery. In this scenario, it's possible that the GuC context register
> H2G is processed, but the immediately following schedule-enable H2G gets
> lost.

what do you mean by "lost"?

if it was not processed by the SRC GuC, then it is still in CTB and shall
be processed by DST GuC, unless we strip it from the CTB by ourselves, but
in this case we should notice that, no?

> 
> A double register is harmless when using `GUC_HXG_TYPE_EVENT`, as GuC
> simply drops the duplicate H2G. To keep things simple, use
> `GUC_HXG_TYPE_EVENT` for all context registrations on VFs.

with this we will miss any early errors from the GuC on non-migration cases
while unlikely, IMO we shouldn't just hide potential errors

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 32 ++++++++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 661ab1bf4502..aa9fb08f7856 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -737,6 +737,26 @@ static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
>  	return seqno;
>  }
>  
> +#define MAKE_ACTION(type, __action)				\
> +({								\
> +	FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |			\
> +	FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |			\
> +		   GUC_HXG_EVENT_MSG_0_DATA0, __action);	\
> +})
> +
> +static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
> +{
> +	/*
> +	 * If we are VF resuming, we can't exactly track if a context
> +	 * registration has been completed in the GuC state machine, it is
> +	 * harmless to resend as it will just fail silently if
> +	 * GUC_HXG_TYPE_EVENT is used.
> +	 */
> +	return IS_SRIOV_VF(xe) &&
> +		(action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC ||
> +		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
> +}
> +
>  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>  
>  static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> @@ -808,18 +828,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
>  		FIELD_PREP(GUC_CTB_MSG_0_FENCE, ct_fence_value);
>  	if (want_response) {
> -		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_REQUEST, action[0]);
> +	} else if (vf_action_can_safely_fail(xe, action[0])) {
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_EVENT, action[0]);
>  	} else {
>  		fast_req_track(ct, ct_fence_value,
>  			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
>  
> -		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
> -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_FAST_REQUEST, action[0]);
>  	}
>  
>  	/* H2G header in cmd[1] replaces action[0] so: */

