Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B49BD41D6D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 17:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62D510E840;
	Thu, 11 Dec 2025 17:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnvmuyAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2CB10E840
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 17:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765474137; x=1797010137;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wisX33pzVujjz38UAiLjD5ohFveSbxZ6ZRVBAzELlqE=;
 b=mnvmuyAv0JW9TVFGSVhEmB2q01Q34KVpadILar5XlXkizBCL5BUfePWr
 jUmc32RVvbPqw4hDhAWQUSMjQ0rSMeh73kKMa4DkpLb/U4OVu17G73hPW
 saix5QASeyOgbsYITxqUQo4X/zA610RmHdTFLWPKUqoQqBeMqzgOL1BNW
 dqBhJAYVIX8ueY4KJ69WkU/k4LSkwpV0X/VAmsfeJ8U78M7NWDAlYEaKt
 j7e2QQ//m+8JhqVFutNKfjVLd6TduUhW/g6JcMXGM0tEO/wnetNyfv5yv
 mN9SOzbKsLmcn6wCmMoLM9euET0JTWjDv0GpZkx/IGbv4taZehEVBm6gi Q==;
X-CSE-ConnectionGUID: gRCEaLhASKemGTSlQYemzQ==
X-CSE-MsgGUID: ATmXkAKwREWmRjcML6QEBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78085080"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78085080"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:28:57 -0800
X-CSE-ConnectionGUID: F1Txan7rQoaqhTPPeVOnoA==
X-CSE-MsgGUID: UqVH00tPTXSkronRXOZU7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="220233570"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:28:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 09:28:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 09:28:56 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 09:28:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpemGYJC1ycTOx4+fTIKJBAIPfrZk2Ep7ZX/fcJpisHqxO4bewlQ2cnaxkmtohKHeB5aoRd+GjVAZEBIj4/X4ekJw5iZHBUzYrT40gGxt920fCRKydWUyfw+j2lzlagy3XiEUVrSEZZ63fbyZ1Iko8DTJuCCkscrDCtX+ebtvslOvEXQyar/kcdPcY8MQVVwJRaAXAt4duNzsvjfRGqOd9gfnfEzewa0RYHR6MSamMzeOKRapVhZcXxOi4hFV2FLjZpgcABBjQJGFIjra7xWhdVMhLTUGIskrOZpkMa8NiVr1P38sdG+JW+5f+3WbaYu3OoF+bXrbTneg+msOUCq3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Eq/oA5tkgVN3irYaOL8eKGWG5Iqwp7CmR83t4xnVAo=;
 b=qzKGnzP0DsZOs8JLpO6XQuXtYGKoHTpWEfvLTtBQFvHGUjbTOug7o6IgnjovTh1KnCTP0J1p8vDmn/bFzVBoiZASTQykSgaee/lRNPhG7AaNxcdWgj4kpPzuQCXIbW2RmMKBzR4z1aSm5Y0iZyPOB9eaqW9tQizO5SnxoJsHHSlHbHyie7Goc5AX80q0WFE6NB0H1Gz/CAIlMTkbeoEbiMTrv4qlkwHN070JGMEbNWEkEgB7RXHbI6imYqjZvQ5Fk3E5mKLT/DK+yau/r8zGmXaB3Xl1T2yXYjxpYv3U8ztkzFSKKZ+JlfjYZt7r1lk6wveK86tcC0R7IeVqbjiaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB8058.namprd11.prod.outlook.com (2603:10b6:510:24d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 17:28:51 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 17:28:51 +0000
Message-ID: <fd96fa00-cb6d-46c3-928e-9a5d5c08122f@intel.com>
Date: Thu, 11 Dec 2025 22:58:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/xe/hwmon: Read thermal sensors count
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>
References: <20251210062301.4080549-1-karthik.poosa@intel.com>
 <20251210062301.4080549-5-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251210062301.4080549-5-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0150.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::7) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: 8807a36c-9d58-4f3b-339c-08de38dac079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmZDWVV6ZmZHdmNDbWx5QkM2NllWZWVld0IrNDFFZ3Vhd3U0WG5VSHlMdnFK?=
 =?utf-8?B?djd3L1RyTDRndGsrTTlpb21GVE0yYlh1ME9ZN1RJUWQxenJjdTE3WFNGVjVM?=
 =?utf-8?B?aFZZLytjNTgyQnZWb01VYXVyYVVDUW1EQWhyc2JKNXpxYlBNSDRXc3NJQ2x4?=
 =?utf-8?B?SUQ2RzdzZ1VGcU1UZTg0aHZqNDVYd05MRzYxVmN3WHJ5aytnL2NrKzRtVWpU?=
 =?utf-8?B?Z0xDUVdvRllwWS9sdndsTnlEbWxZbm5ORmIvR2xIZWdPWUQrbmVLVU9kQnAw?=
 =?utf-8?B?bXJXZ29rRitZeFcvVCs1SEk0ZXQzbmlScUJiRjhBM2xrb2JzQ1U4TzZhOTlE?=
 =?utf-8?B?MEtEOWl6ditpR1N5WitIVzdFQmlkK2RWcEJnSzNzOGIvSTU1N0tPbGRoSVZJ?=
 =?utf-8?B?MVlvRjd0c2o5bWR5eUJFOVVoYjRiN0JpaWNsKzQxbTlvYitMdFFXUG4ydGRm?=
 =?utf-8?B?bkxIUUJ4RHZPa3hLa2FVdUE2UXFvT05vd0wzcG85L1ZzN2s4Mmw0VjFyZ3hW?=
 =?utf-8?B?dDViQVhKN2pLODhuRXZvU1dzUjJWUEt4ZHhFR2lvWjgrK3pFWDB4M1E5bjVz?=
 =?utf-8?B?MmllT3p5UXIxU3pjRUR6SXhKVkJNeE1xbE80dS9hZXJhSG9OWStraXpVamli?=
 =?utf-8?B?YXZxL1pIcDg4WjFqejFibTU1YmpIclhqWUtlcW1KQWRKVG5oOG0zNmVJM3pT?=
 =?utf-8?B?QW1zZjFRTHIrMDNlbS9DMGhlZWRKY0J4QUp6UW9OYlZCWTZuMnd2Ym1GNFJL?=
 =?utf-8?B?R2F0c01RS1pOUnZIcWI1R2s0WDFZMi8yb0twYVhOcWpNQXJacG85UkFmVkJ5?=
 =?utf-8?B?aEtGVnNHQzNMT0tFaEtZbUJtR1kzWlgvMFREdWRhSnpGVWlWSDg0SitCaGNx?=
 =?utf-8?B?cUhjM09Jb3B6dzNpZWRjbWl2bkhZSzIxeW5TR0p2ZGNTWjFETmlSOVlTRVJu?=
 =?utf-8?B?VnhFM1VjU0QybTc1T1FrTGV2dXA4a1FheS9HeGFXdjVuT25ZcjVPQ3VkRXRP?=
 =?utf-8?B?eUJadExsRzBnNW1UeU5WNU5jcVdLbWlERWJGVTROekV6a1U4MktZaHJrdGkw?=
 =?utf-8?B?WXFsbzJFbGticVo4dFk1cmN2YXl0cDd1c3J4dEhnek5HeERtWjZ6TWhpa2h5?=
 =?utf-8?B?am5XWUVPMzRvYy9PQXJVS0d6WmZzMkxVclEvU2EvNkd0bW9MSEtOb3BaRVNK?=
 =?utf-8?B?QzN0TmpwRnUyVlRIbCszbGpaUjlIY0xZSXV5TzczUW5ZZGJyODVHRS9MVS9s?=
 =?utf-8?B?YTJDMUg0c3l6bEZvS0N4anlJZHpNVTNodUxJWkNKVVh0R3ZucGgrdjdMT2I2?=
 =?utf-8?B?Z0U2c0pyUzN6OXdRK29vUnVsZWxES2R4OGlta2ZDZ2dRRFVqbVJoSy9qSkQ5?=
 =?utf-8?B?dlc2ZFR6c3VoOHpQV0hoNk40eENJR0lmRDVibFNTSWNnckJ0dDVEU284SjN5?=
 =?utf-8?B?NGxkT3ErRXhqbFV2Y2F5VHFaNlRRUThNNmFHb0c1cHVidnFMOU5QdTZJTm54?=
 =?utf-8?B?QzVFRDlVYzJmV29SSkRqblFTemVoMi9kNmtkSllhQ3g0bEpkb0VhdDZiUzBr?=
 =?utf-8?B?R2pBdmpYNlpQS2V3dWRyOUFIN3d6Z2VSNUdSbVJURWdmdGJtS0lWb3RBcXBK?=
 =?utf-8?B?U241Ti9oYzU5ZC83WkdZN2xNMGhiOXJBTGMxd1FDYUh3dEdBdmwwbStqYTNK?=
 =?utf-8?B?SmdnN2ZzOWMzSnpMcHdGcU9nd2M4M3hpZStGMDZ1QWF0ZlFrenlHY0w1bDRz?=
 =?utf-8?B?NDBta3FYQTVhSDVoUHM1dkticG9EMEdCVmtRMGh1aEk1SnRMekxNVFpWeFpl?=
 =?utf-8?B?YktqdGkxdDZOeHkyQlhFRVlQNHBTNDV1L0dyUjlGU2Q1bGJXanV1WC95WkJV?=
 =?utf-8?B?djFyOGgxS3RIYmJUK3BVbjNTcnE5ekdmcE1rRlpWYlF2N1RzOGdINkR2N1N5?=
 =?utf-8?Q?Ds8EAwDc7LCAmJ3PT9/8WzUkpE5Ea+Gu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elZxdC9KUSsrUFRWeGhIaUtFTWhIYXBQZ3pYL2JJcmVSQTU1WStUUlVSck51?=
 =?utf-8?B?YW5vZlBya05lendjaEx0UlhyQnU0a3ppcWRDajhqMzZGRGhRd0NvZ0F5VDNP?=
 =?utf-8?B?SlJabVJnK2dzVHd0aVYvek9UaUhNSFFma3Fvd3Bjcm5vclVtWS9GeTdJSkVt?=
 =?utf-8?B?TnAyeG1oU2x3SDZrRHVUZFU3NHpNM2h4cVFZOVBWTU44TW9XUmM5MEw5U0Ix?=
 =?utf-8?B?QnVKU0U5Y1V6R1hxOXZ5UkxHTzVhYWxSNjZUNXRmSnA4MjhHUDY5UXJkclNY?=
 =?utf-8?B?Z0tUcExYSHFVdFBiclRIL0pxczd2U254b0Z4QTJSZjV2eFhtRFF3MS9ocjJN?=
 =?utf-8?B?WVBMLzVST0NHRk1xYjNndVp0aFdUS3NjNFhmUFNjUHczZTQ3eWlBTUhjZVZM?=
 =?utf-8?B?UW5ZcVV4ZU1iM0Q2WFZOdGdES0o4Uk42eVhiQzdURHRlMklzV1cyeTJHY2cz?=
 =?utf-8?B?TjRhZms1TDZFaGdhM0dKY3c5bGQraWdGN3QrTGM0V3N2QVQ4WVZWK3c1QnNk?=
 =?utf-8?B?bkJjc0RBTUJuazM5TzY4TS9Mb3ZEUmxHQ1VreTRTSEJaQk10c2NoSjRtL01S?=
 =?utf-8?B?dW5adVNBc2tISzcya0JvQVI2bzRWOTI4Z0xrZGFiVmlVUWF1WW9BaFJkRm1r?=
 =?utf-8?B?THVQME1UZXN4ank0TCtmT1pEd0dsd0JIRUc1aUhreHo2SlBrZjhwWmhOb0FI?=
 =?utf-8?B?TXBydHl0STNNamxiWWNSSmxLN2tHUlFlclErWWVwbTRnbDZEaU9TRVUvV0VJ?=
 =?utf-8?B?cXZjRlpBeldVVFJSc1JTZHRnK3Y3MXdrSTViRGhZb2I1MHQ3ZXVwUnllT05K?=
 =?utf-8?B?U3pvMFdzLy91dmRJamMraWlwTVJ0MFBrSEVNKytTd3plMlVBZEhXUzFscGpQ?=
 =?utf-8?B?Qi9sWEhBNm11VXJlNkU2UVdKK2t0YWtIbUFGKzVQT3hTeGNSVHl3WnlQTFFz?=
 =?utf-8?B?OGE2NlRDdGM2R2hjQXY2cnRhOUtVaW5pbWF5RXZkcDlDYkV1Z1R6NnhtcWoz?=
 =?utf-8?B?cTNqNk5lME1TM0QwRTdrb2pjc3JpOUJlSW5VTUtRdDZrcm5ocDdISk15VGE3?=
 =?utf-8?B?aTlKWlJEckF5QlI3cjVxU3FiNThVWVhxUlhXN0Z0Y05mQ2xXQnNoL3hMZU9z?=
 =?utf-8?B?eEZTSDdjWGNRT1UwdGVVK0F5OTNwMnFXVlBpZXBzUmV0MzBWa2NTcStpVjQ1?=
 =?utf-8?B?OGhZZEllRXhtWVp2Z2MvcEpiU0I3VG82R2ZoMTJxQjltblJlRXBCa3hmc1Fh?=
 =?utf-8?B?TGs2VS9Kd0Z1d1RXd2FHRUM4U0JPRzZ0TWdCMjZzbWIvZUVwK2gvQ1pGd1lP?=
 =?utf-8?B?ZjJIWTBZMTREMlR3Y3Nlcjdkc0dIZzBkK3FaYVplRDc5dlNJbUNFd0lBU2p1?=
 =?utf-8?B?bVJpN2JBaUx4VXVTeG02dUNmTXM3VDh6RTA4eDhHSEZsaVVQbEFLQjJOVFNV?=
 =?utf-8?B?a0VOOWxrK2h2eW5sUWtWWXR4WkhsS2pjS25raU1HamVtSW5GMGVNYno4dGR0?=
 =?utf-8?B?VkkxRUJXQ3dVOFFKUEVyRWJ6Y05oVC9YSjBPYU1oT0MzTk83Nml5YXdJMFlG?=
 =?utf-8?B?dWZPdnNsK2NvQzZOUXM5dVVmeVJYVnA2d3VWVDMvaTlIN0lLalRKS2g2Ympk?=
 =?utf-8?B?Rkw3QUtWaTN3ZUFQQ0ZHWm5QdWllUFh4Rm5ra1Jycjg2V0YvSVpYYldlRFhl?=
 =?utf-8?B?RkJzUy9wUW91eSsxZnYwc3RES1pla0paeVRVWTdHbG8xV1gyM2IrUkVIaGV0?=
 =?utf-8?B?MWRFTUN4VDhDK1dtNkl6dkFhTXFXOEFFQmhEWnR1ay9qUHFUSjVxanJ4T1ZP?=
 =?utf-8?B?dnJKd1pPZE84WmpsRXVJMWVEM0MyZ2F5bWRwODBicHZKeWhOWlphbTRvc01H?=
 =?utf-8?B?TU0xQWZzRzYvaEFKMXZENE43d2g2NWdnaHF4NnBMWDlmc2J3SVV5MHRyQTRE?=
 =?utf-8?B?R0h3dmwwY3VBbnJqU1hpUisvbjZBV2d1VE1WWG5ZQU9TRmpPQzZMc3Y2enl2?=
 =?utf-8?B?WlRVdllod3ZRLzJKU1d3N1RicFE3czhqT2E2UXF6QndLUTdMa21yOHpvTzNO?=
 =?utf-8?B?Y1JlV0o2QWd0cUxTR2JvVUtRTzZ4UldybkFWWEhLbG11UEdMTCt5NmxJOHlN?=
 =?utf-8?B?bFkrREJBaHIwSWZsVmMzMVg1NVE0NWZMVkhxeXhJcTJMRDh1TW0rNDJKVGMy?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8807a36c-9d58-4f3b-339c-08de38dac079
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 17:28:51.7659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dl4V/QwlX5RqAJTYnCYBqC6C5RRAD53jmyocMOdpALOujtxuCo/3mJELb8NiqUXqdfKUe1VXZyGqYAouRMtEiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8058
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


On 10-12-2025 11:52, Karthik Poosa wrote:
> Read number of thermal sensors available.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 28 ++++++++++++++++++++++++----
>   1 file changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c4a200cc2c23..e843021d13ec 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -99,6 +99,11 @@ enum sensor_attr_power {
>    */
>   #define PL_WRITE_MBX_TIMEOUT_MS	(1)
>   
> +/*
> + * Number of thermal sensors.
> + */
> +#define MAX_THERMAL_SENSORS    (11)
> +
>   /**
>    * struct xe_hwmon_energy_info - to accumulate energy
>    */
> @@ -126,9 +131,11 @@ struct xe_hwmon_thermal_info {
>   	union {
>   		/** @limits: temperatures limits */
>   		u8 limit[8];
> -		/** @data: limits data dwords */
> -		u32 data[2];
> +		/** @dword: limit dwords */
> +		u32 dword[2];
Please maintain variable name consistent throughout the series.
>   	};
> +	/** @count: no of temperature sensors */
> +	u8 count;
>   };
>   
>   /**
> @@ -716,18 +723,31 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>   	int ret = 0;
> +	u32 val = 0;
>   
>   	if (!hwmon->xe->info.has_mbx_power_limits)
>   		return -ENXIO;
>   
>   	/* Read thermal info */
>   	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
> -			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
> +			    &hwmon->temp.dword[0], &hwmon->temp.dword[1]);
>   	drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x val1 0x%x\n", ret,
> -		hwmon->temp.data[0], hwmon->temp.data[1]);
> +		hwmon->temp.dword[0], hwmon->temp.dword[1]);
>   	if (ret)
>   		return ret;
>   
> +	/* Read thermal config */
> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
> +			    &val, NULL);
> +	drm_dbg(&hwmon->xe->drm, "thermal config read ret %d, count %d\n", ret, val);
> +	if (ret)
> +		return ret;
> +
> +	hwmon->temp.count = val & TEMP_MASK;
> +	if (hwmon->temp.count > MAX_THERMAL_SENSORS)

Why this restriction?

> +		drm_warn(&hwmon->xe->drm, "thermal config count %d exceeds supported limit %d\n",
> +			 hwmon->temp.count, MAX_THERMAL_SENSORS);
> +
>   	return 0;
I am seeing patch 5 is exposing avj of hwmon->temp.count sensors, so 
could you please combine patch 4 and 5.

Thanks,
Badal

>   }
>   
