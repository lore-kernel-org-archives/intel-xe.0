Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD3DD0BB7A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 09:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382E910E8B7;
	Thu, 24 Oct 2024 09:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDIh6ZBh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207B210E8B7
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 09:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729760898; x=1761296898;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9OXUc6AAxrUjhLQtXCfVnfvVGBiziGKsdxN/8qpeMrs=;
 b=dDIh6ZBh9NgFbcWmyGqSSvNDBi0CBpEfyqx+DO82Xwkz4oGTXel+27Jj
 KAUohnL4WpVInNtuNwsItdD5rANYzXhARjVGZIGp8N4mcCPVZG2d4MPlX
 5zS373VHLncUC9IEEK8g4yRTWXhEvmI2BafK8ayHu1y26n4+Jby+ngmfG
 ik/buXSaP8njQRwlZKO6O0lXwPeHWfPWpMSDofWbMdzxLZQXXftKlxdAW
 PTEbWt76YOwE0lmUoGbUgo7CS+6RAaVy4aC2Wxo+va3+eq/35Ngz700K6
 0KqdvQ/vnzwYCTtUielU35FgO9R4uYmnRg+k4e3EGvRxgbQiTN3HpufD7 A==;
X-CSE-ConnectionGUID: k16V8ECeRQCt5vsEmn9xSA==
X-CSE-MsgGUID: WtZdPXBDSVmdwNaze2jz7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29546416"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29546416"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:08:17 -0700
X-CSE-ConnectionGUID: HdmE/N9aSnqHFWRWOFbiNg==
X-CSE-MsgGUID: 29ZLJrzmQD+RSC+BVHIASQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="111349265"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 02:08:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 02:08:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 02:08:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 02:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMEzSBPyGZBfzK3cw+Uh9dGZ+iwjIo0Qveiuj4/UICV+j3akfR2wNj08uiYSDhBsZCW6kqaaxXGVwE2vjdA7nGhIfXYUlbcm3Y3TO8u5wf7H6lZ4cd/6lHlMuKu37EQmfEHCCzCEHaONNQfDSP6NUNvsf1MqPgtZ4qlOlKL5VwQnp9t+hp99ksPZ4BeymqYIVwCJI9nSYIkntMaHvsqPQS2qaAg7lKKdBk3/2mIfgrxL+oXGHVIBVp0rZHxjZlUBaOKPYFLkCdSRtu9j8hZFqlu/dy9UPmMbbS11j6Db3/LMTlSLux0ZqP0y/mq/hOOzDTgSspDYNwn6zzQ0zXBLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNWxG6D8EPdWKAysHbvmUuxdAkBSXf8MqngFa8yTJ1A=;
 b=aEoujElPi7vYHLbo1MgGgOGpzQtyaKOKHZkDkwlX26PRmDl7zv8jVMap/bT0ZY4Y6gl9IvU28ifBvi38nWYF0oehj9mKWq7mndBaoXaG/slJ9hjpPkEjhrAb69kxUb+BSpchTmLicY4M9FwtrqYfBv4JV+rsbdgF9eCRC9X2Rzmc6Gheb7YN+AsQWayX+ac/IRiO+30ZdQRd1F/7p4RrMzgLfmNDwFsgKKvTJ/QO/1o5a91hS3WKnawj18YiljhqdtiQXC4hI/uT+iNSZ9c0OdAAX9UrFd/ch+TzAfndE4k2mlNZXJH4qn0B6TkdbnAS8osvxjwmsvlr/Yp3yTq8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.18; Thu, 24 Oct 2024 09:08:13 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 09:08:13 +0000
Message-ID: <629a39e5-39cb-4709-a898-2653620b7540@intel.com>
Date: Thu, 24 Oct 2024 11:08:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ufence: Flush xe ordered_wq in case of ufence
 timeout
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, John Harrison
 <John.C.Harrison@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241023155817.3618388-1-nirmoy.das@intel.com>
 <Zxl7FTC+E7g3uNwp@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <Zxl7FTC+E7g3uNwp@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0026.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::13) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|BN9PR11MB5228:EE_
X-MS-Office365-Filtering-Correlation-Id: 4188866f-2f61-4405-ad86-08dcf40b6371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnV5NXJzakVQMmhjQnd5U0l0bzQwaXc2L3VoZVFJVFZBRUdIOEZzQitDSEFH?=
 =?utf-8?B?ZTNLTU1OcVI0UHY5TWdnOWtud1ZiaHp3WmlWTmFWRGhWZ0lOM1VSa3BkdDZn?=
 =?utf-8?B?WHp2akswL3RyYVFKSHFFMHpqNUd1QmlJeVFKaEFXVjlDYjZYQitTUlU1am9w?=
 =?utf-8?B?Z0dZQk03UEFYSUJDM21LaWFXNU5VQ1kyTkxMeDZrOE9kRlV2K0VOWHFHMkNT?=
 =?utf-8?B?Wi9NbDY2U2YxSFA3K0hKbTE5MVd3OWp3YmtnSG1DelZqemhpaE9XMk1MR3VR?=
 =?utf-8?B?YmFQSFY2bkNJVzNLNGp3NHpYRCtOcVBWeWUxd0ZuV0NSNklWSHJFVENVUW9w?=
 =?utf-8?B?dy8vWmJrMk9RZEQ5djd4ZWVlR28yL0tDV1kyS2dMS1NvNVVoNmJaMWxPd1Ns?=
 =?utf-8?B?Yi9VQ3VQTGxzcktmenBXWG1jOGtiSS9uSDJkQkpRbURUSDIybFBEZnFDdnNE?=
 =?utf-8?B?bVBkWE1TOGVDQUNNRTdpUXJWMWQrbGFqYlVHVjdqZ3l4M2l2WXJaRWdMRjJB?=
 =?utf-8?B?eFBQOW5PVGpVWjJzbFR2ajFaR0pTVjRRL1NONXJzc3lsUzZYRGN0OE1WbnFi?=
 =?utf-8?B?dUJ1a0VBa2RpWnRmK0c2YW9CakVPdkM5UmVhWkxwRHlXVkhISy83bTV1L1pn?=
 =?utf-8?B?d1QweW9PWFZHMHB1TE1hRHBwRldLUXJMZ2JEemxOSzc4ckthcU5ZeHN6MGR1?=
 =?utf-8?B?TXJReFpRaGV5ZEt1UDlPMDNhYjF0VXpzTlFyWDlURHRqMWwvUUJaams1MVpJ?=
 =?utf-8?B?T3c2ZGlFOU9RdnpMZWp2Ymo4cDFTOU1nbDhBdVVNQmt0WncydkdLdFZnOU1L?=
 =?utf-8?B?ZUx4T2t4dnlRVHBsYkJIajFNVlUxdTZVYmEwdjZEb3g3OUo0N3JscTZSVjlQ?=
 =?utf-8?B?ZmZCRXVaMFBhcVdCdTduVmQyTlMxTVAyMkJ2UGpHdjRaakxhaWRSeUUrVUF6?=
 =?utf-8?B?bVlRNjBQR0d5Y1RxY1B0SmdKQjRLSE4rdTE0UDl0Mm1jY3BZSG13UXNaaytM?=
 =?utf-8?B?VnJHeDdUSmNpQ2huenUwN2w0SWtXTHNSVFQrYlVUQXVWTHJ1M2dYTXdYY04w?=
 =?utf-8?B?TG1DaUk5Vnk5VVcxL1F0eS9GcDVIM0huZnhQOVozVm5SMGVSSUh2UThqU3l3?=
 =?utf-8?B?RkVoV2dHMmhmZVVXN1hVSVlkWFRBMll0SHVtSUhtUHcvY0JnNEZhTnNZVTBJ?=
 =?utf-8?B?bkxaZS9keENFZXQzK245NExTemZxNEwweGtRUllWMlZqMEdIUGI3NWdsSXZk?=
 =?utf-8?B?MUlxdTEra2xSaVMrc3d3OVpoTUpWcTFtS3RPYm5nb3FzazVQcmNaSGZRc1Jt?=
 =?utf-8?B?QW9vS3cybXpBQUI4YVh5ckh0WU9WNzRWVFB5YXZlQnBqNWg4OHVSRlV5L2hN?=
 =?utf-8?B?TUp4OXBvSGhPNGlsTC9NVTNsQ2dTK1ZsMkU5MDlwaXZsam5ZS01PajllMTJP?=
 =?utf-8?B?SFlwSlgyVGs5U0ZEbGlsckhjT2wvSGxQL3o4T2Z4UC9lVFlEMTduUHYvREhN?=
 =?utf-8?B?NFhDZFgrWHFSUXI2ZjFKMEdZVTdUV2R1VUc4WXY1dDdNcnJjQWRvQVIzNnRJ?=
 =?utf-8?B?Y0NvTXdHYXJGbHBNYXE1aHYvQnp3d3FvUGxHVnVBSDE4UTVicmVjWnFBTUVQ?=
 =?utf-8?B?UkM3Njlab3BLZldRVjl5cUhQcFgwdnNtR1VZMkRlUmZrbjJQL0pvZzViNGg0?=
 =?utf-8?Q?eDBEXqzlS9ppq9AJ/+Fm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VitLd0hENTZxck1VRUNTOWJZOGQ1YldpcWxBUzVKMDl5VmNNRDdFZmVHcyt2?=
 =?utf-8?B?dmZFR2NkdHhoamZ3SEVZUnp4Z05iQytzeElmRk1idHpZcGFPU0d5NklpcVd0?=
 =?utf-8?B?eFMvTDFnZ1JadHhxUEJmbmhjalZhZzJxb3d2cFR6ZDlRVTRZTCtOZEJSRWhM?=
 =?utf-8?B?Wmk3bmhOcElTQUhobVpOR2k1a0tGNlQyeERqeEttOFZVWFU2WFJpQytnZEk4?=
 =?utf-8?B?WlZWdEtIRVphd1NIOHdGcFFpRUtYNWJGRTZSWHRRNlJYTEdvTWg3eGkrZG5K?=
 =?utf-8?B?NC9GczlvZUFZQ3ZOcXd5MGFhcittNlVDWjgvSWtkVlJZSmtCMkdsd0h0eFdq?=
 =?utf-8?B?cmV2MStBdmVNUzMxclYxUzRnVXFVd1lhZ1FTWDgyR1NyUXNyVW5ONVRZTitR?=
 =?utf-8?B?alRTQWpLSWdIek5YaHQwUmVpTnhXVS90SkhEcm10bXNNMnVWOE44WEVER3lK?=
 =?utf-8?B?dzhsYkRxdzZFZVdUU3RSR3JqWEtSa2R3V0JaZzJ1QmRUelFlWFZBaUxvQWlZ?=
 =?utf-8?B?N3VFY1dHU1cyR2Nnb0gvQnFreHRwOE5IOFhvTzZmQW14RzFTUlVGd3lLcHJi?=
 =?utf-8?B?WjV2ZXVMSXZhTktkM1JXZi8xNzJGZ2UyalJpeW1LbHJSM1FUZHJUTFdZVlBa?=
 =?utf-8?B?MG1LNlQwR0dIa1oydXEvV3J0RGFCSTE0cnBJS251TW1QUngyeHRHRVkwVDdK?=
 =?utf-8?B?V3RuUWRVZHBiRVRvMy83U3RVNXh5VGdmdExONTViek42MWdrOTFkRnlZVlVU?=
 =?utf-8?B?N1JITWVIN0ZXNVdVNVVNQUpWaDNrZS8vUXNIMFI3eWE1c1dkWXlldkp2em4r?=
 =?utf-8?B?c0FMRk1RQ2hBODVyUjN0VXUvZTFZRHNuL2xaMkx5aXZ1VWN1N1BNYlBVSC9q?=
 =?utf-8?B?SGVhN0pMSWNDNm9FYlljWkpFZG41NHFIb0ZSVFdVK3FoTHNRaWFRT3lFN2ZO?=
 =?utf-8?B?c2hQUlR0djZUajRieXNZYlgwY2JPYmY4dkJLK1lQYW1nbkdpVVVac2NzNFoz?=
 =?utf-8?B?R1VpbFpCb1JUVVpBWlJGTVlJQWpCN3UzdWw3ejlwWklEWDQwMWo2cDB5K3cz?=
 =?utf-8?B?U3h0MWdMaExUMEFQakgzNXBSZVNFOW5DanFUN3RsZ0VkMDRUQnVnQUkvU3J1?=
 =?utf-8?B?aC9BSmRKM3diNk83WTA3ZHVQRkxhUFlORFlsVFFXWnA2NTRHd2JFcFhhYzdE?=
 =?utf-8?B?ZXNHUy9RK2RhZUl2Q3dBZmJGQWlIeldpejVIeHFMTUNuaXlQWGRydXE4bDVX?=
 =?utf-8?B?cmU0WVpPNjFaQ0lvdHhDai96dnNiaUhqTW0vSHZvamUwUm96YW5QKzdqcXdT?=
 =?utf-8?B?QkhWbkdyNkNVVFY1OFRldk9NWllEUUJxQ080Qm83cTM5cEphNEdVNWdyYXlj?=
 =?utf-8?B?Ky9SWllQdVg4ekZQeGtWVmQyRkptekJvQ0NYaUFud0RUeG42dTFxaGsyMktx?=
 =?utf-8?B?bDBJa3BKRTNoSS9vSlF3OHlzRjNBR2k5bHNmT0xKZ3dPcnREK2JKWXY1V0l2?=
 =?utf-8?B?YW1LUHRJTzNsWWlxL2h5aWJvNG55NUZOSWZMYU14ODVlcVlITWgwYldhTThK?=
 =?utf-8?B?aS82VzJNdTZZdnI2S3VEVkJ6eldNMXduSDVocEtkcENIQm41ODMwVlpOK2dQ?=
 =?utf-8?B?U1IwTmVKQ2JPNkNwc0NQcnZXdEVoaVg1SnFwWFBxbkRXaVFpUmJsZmFnYWE2?=
 =?utf-8?B?WjBzblRvRFBPcU9SVnlwSnhpTURVeERxL2I5VG9ZKzlFa2Frc1hybEtoTEpj?=
 =?utf-8?B?ZnNLTGk0VzFSZmE1Y3gzNktVTUlwM3lJYXV2eWZkSTVTeUMyQW52Nis3djN0?=
 =?utf-8?B?dWk1MVVpUmV1Q3E0L2p3cHRYRnhtZUlhTHVoWVRjQnBDenBUOFRKbXdEZmpU?=
 =?utf-8?B?dm5yUW5tTGx6VmRHbFI1V3dtNVBYNFZLRm1iak5ycENFdEFiaE10cVZncmZ0?=
 =?utf-8?B?RjI0V3YzdDRabGdoaEwxcWZvMHJUUlltQ0R6RW9VTmFhelFrK0t4UlR6bFI4?=
 =?utf-8?B?OEdsRTBlc3NLYVV2SHZlNXZ5Uk5MRnVxaGRXWHIwazExbHZlVURrdkwydU15?=
 =?utf-8?B?dXFpVUZBalBsRFdKbW1CVExwQWNaTnAzRThFZTBpdDJ5TE80cHVacFFoM3hT?=
 =?utf-8?Q?XAGSFnikGY0W1gx3X88SoQ5oJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4188866f-2f61-4405-ad86-08dcf40b6371
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 09:08:13.2711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0yj1a3QHHETu5RP3uS0uyS2Ad4Tq2UBazAx414h8la/qkYUkonQi/02ehNcMthIpuDNE5Z/5D8Qne+nqyhsLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
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


On 10/24/2024 12:39 AM, Matthew Brost wrote:
> On Wed, Oct 23, 2024 at 05:58:17PM +0200, Nirmoy Das wrote:
>> Flush xe ordered_wq in case of ufence timeout which is observed
>> on LNL and that points recent scheduling issue with E-cores.
>>
>> This is similar to the recent fix:
>> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
>> response timeout") and should be removed once there is E core
>> scheduling fix.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Seems like a reasonable W/A for now which I think we want in 6.12 too.
> I'd follow up with the maintainer who is doing our 6.12 PR to make sure
> this gets in.


Make sense, I will reach out over #xe-chat. Adding a fixes tag that should be useful too.

Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")


>
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Thanks!


Nirmoy

>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> index f5deb81eba01..7f034871345b 100644
>> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> @@ -155,6 +155,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>>  		}
>>  
>>  		if (!timeout) {
>> +			/*
>> +			 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
>> +			 * in case of g2h response timeout")
>> +			 *
>> +			 * TODO: Drop this change once workqueue scheduling delay issue is
>> +			 * fixed on LNL Hybrid CPU.
>> +			 */
>> +			__flush_workqueue(xe->ordered_wq);
>> +			err = do_compare(addr, args->value, args->mask, args->op);
>> +			if (err <= 0)
>> +				break;
>>  			err = -ETIME;
>>  			break;
>>  		}
>> -- 
>> 2.46.0
>>
