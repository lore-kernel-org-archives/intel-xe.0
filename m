Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0030ED132D7
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 14:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4C610E458;
	Mon,  4 Nov 2024 14:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFXpBmhH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CAC10E458
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 14:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730731633; x=1762267633;
 h=message-id:date:from:subject:to:cc:
 content-transfer-encoding:mime-version;
 bh=1GfRpQhMpasPtiPSB6jLT4SzvoQpYC+9XP0teDy7TC4=;
 b=LFXpBmhHNSMVaQtuAbbn09z/xKtbjCALBQfO8dSVDPXq+ztE51O2MyzM
 Z7nkrtBXWVQTztKM/BwoVmqiAdwFsAEzJA8kijzOq0v7RMQpl3xXMWEp2
 TRLmV4rjkDLBDu+fHLi0fYnO+i7QqZIZo0IvseHMc/VdDwLzmZzKkCWDY
 kDtt7c37vyW8Epo81/OgGcqcfD8iHUQMh8avgc7XhB90TuKOgxUWpdrKt
 TbUd4sByoFRopAdRiDJK8nJCUwgUfAJEpsAhMP9ShoxLxvljwU/uqN7ct
 rzv7rc/EoDPFu2fD5hDJJHF0ldDoy9oaYUH/+/ee7g0llfxyoOevw/qhT w==;
X-CSE-ConnectionGUID: RI8J01nuTE+lgZGxLdReRQ==
X-CSE-MsgGUID: fOp2HhoAQQmBPScgwRh7Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30538939"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="30538939"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:47:13 -0800
X-CSE-ConnectionGUID: 0hxuoY/xR0S0cqQeUgLqfw==
X-CSE-MsgGUID: K2YLcS+QTf2X6QemO0gypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="83787319"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 06:47:12 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 06:47:12 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 06:47:11 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 06:47:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjWl8g1MWC6uYNQ8xp8swe6IiOsK1/K2H7WHyLjMfgJ651moOo6pui0HWbP8QVhwqx4N8wUIuJJFCi/GToI5w4tFt0xz+0JQ4BY0WO6RC+Fj40B5aA6JzZaqZDDQtF01KfRwL1ebRV/rrt9U8VmvK0zDJw5BnT/42M9hEbKwRRgR+V5CKhim5+1dOggyQJOSydmkbd5ZbS2IrOb3eAmPK96CBVtG0C6vNontSDT/vsNvTGjWK6xlDd4F5Oo5U4zCtkRba8mN9Qtv/GoK43DdSVIIA3+MAFcpu3SzlvWIhFQv2ynzCeEX+dgZn+nFbVi9TlFjMvXf1sCGXQVC8uImZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7WKqtMavaJT4J2KvV7Bq/epVxqHjqtyCSSAysoxPnU=;
 b=sQRhdan/Z9aJcwv68HaAZpptp1UJosmquVfsxWXO3VzjlnGt0Zr63TWlYAlp4evUTHWNeepFs5Z5lgHoxj6yjNg2+0l4bgPJMRYN1g4KTJYNUJ/LRCt3ot8adTvwaE6xdo9SJ/k6QwDSIDswJ46ctMaqlYK9SvUhRfltdM4WFRt1iZnCDnU3yooT6jOvyq5Gqz9lTQqpxuXN09bohBgvTrSGPuAhQrdCrCwsOY5zRpOMUdrOvgAW+dvEfTFaPP43451rqJarXRVNp5o14Q9SdwR9okkM5/L7+VKHuLDs+8jfrfGVBRScM5Mg4ObglaMYiRI8cIo9Wb+2Mi+Ej4mKSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Mon, 4 Nov
 2024 14:47:09 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 14:47:09 +0000
Message-ID: <b92935b3-264c-421d-ae02-e0d5b90d6a4c@intel.com>
Date: Mon, 4 Nov 2024 16:47:07 +0200
User-Agent: Mozilla Thunderbird
From: "Levi, Ilia" <ilia.levi@intel.com>
Subject: [PATCH 3/3] drm/xe/uapi: Support requesting unique MSI-X for exec
 queue
To: <intel-xe@lists.freedesktop.org>
CC: <ilia.levi@intel.com>, niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, <koby.elbaz@intel.com>,
 <yaron.avizrat@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0028.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::10) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|DS0PR11MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: f79e0546-c4d7-43b2-5043-08dcfcdf8f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3IveTRtQ1pKemZWSnd5ZjRLQWlUSk1tTCtOQjBGeVJvaVpNa1NWTjFjRkhk?=
 =?utf-8?B?QWJwT0dQRHNGVnQ2RmtQS0U1cGJMVGdYSGVxdFJxUnBtSGpiaGorWW53UGtj?=
 =?utf-8?B?VU5PYmRKS2ZQWGJiZVoxY1NaVklqYUYraFFDNUh5TUFMQTgrZjhVVXJmVmZX?=
 =?utf-8?B?emhXVXZiaHBwMXJRTHNZTDZ0czNtME8xZ3JJRWZaMTdqR0lFVlIrVUpjOGJY?=
 =?utf-8?B?ZmYxbmZjTXg0SkozVU5zb1FUOWRYODZqbk96RzJPSnRENEZtQm9ObG1LcUZj?=
 =?utf-8?B?VlpGZ0JvZnloNEVtOHk2dG8wRTQyRTZtRTNHQjBzZUQxYjlZSXNkQ0xmQ2tj?=
 =?utf-8?B?R1lVbUx1ZHBONzFDVHJqWkhVek9FNFhPYjJIb0tuQVhmRXpzZW9JVWFQMERi?=
 =?utf-8?B?QVNmVXBYQ25zZXZBa05JRlRwbXJCYzVhWU5JZzlBNFUvMCtvQnphN2lXS0Jl?=
 =?utf-8?B?K2pSRlNEZFpjMzdia3N0dGt4WDI0TnB5bVNHU0xwTzlrWVFyYzJNYUpkd1Rx?=
 =?utf-8?B?TERnbmgyOGlOaTlvYlE5OXVYc2pGZFFpVW16S1lBcklGbXQzdFRWWk5iM2p1?=
 =?utf-8?B?L2xvVmVqc0hWUnRNUm0wSHZGOTB2RUxnTDhCaVJZcHk2eE1HdXNQVllhcWV6?=
 =?utf-8?B?alhENEZVMEdaR3FmR0FsUjBHOElXZ1RjOGJDRFpYN2N0aitpYjl1ajNKZ201?=
 =?utf-8?B?aHg3SlYzMXNYTkd0K09nRFR4WHVqSldJWmxnYTdaTm9nR014OEJkUjVOMjI5?=
 =?utf-8?B?a0VmSFVMMWxiQUdoWXZPQldGd25SMUNwUElLeEhGYjI2NWlsa2FSdEFQQkVp?=
 =?utf-8?B?SGtMOVYrK1FOMitIMC9sZ0loOFFRNGowV0dkRmhRMDNndUdjN0JJNG82T1cw?=
 =?utf-8?B?RUErYUlYaHJHWlAyTStFQStsdXUwcnBWcnhMMFZmMVVXS2F1WXJ5QUQweXBK?=
 =?utf-8?B?K0NudnQ1aWJ5WDlpOE9yNE1YZHRTaWplOFJmTlRtSDBSKzJHOXo0Qk4xekVS?=
 =?utf-8?B?bmpPeXFlNkJwYjNEWjJiQ2VFWWJNWjdZS3htaklxUU5FeERweU54VGluVm8v?=
 =?utf-8?B?Q0VLT1c0TERPNnBLNTdOV1NYTjQrMlEwUmRTK05JWnJ3dnNkKzU3S2pZMGs4?=
 =?utf-8?B?RDFBV2hDaVpyRzFuaE5sTElObHlSSkFVQ1pmcWVOU0U2eDNIVldueGNDb3Z5?=
 =?utf-8?B?T2JUVFRidmFXbkxMWWFCcGYxVjhvZm84eWVXZmZwdXV3YkUzdXVNZVBVaHo4?=
 =?utf-8?B?SXhlbUpPWjk1KzZ3RWl5MEs0SThzTzcvZU80RTBDSDFiKzVrV1V3MmM1YWtE?=
 =?utf-8?B?ekpuY0JqaGNXamppaVV5RGJHaFN2a25vTGxRQUhhak5ZUmowTU9zMUd2aEJB?=
 =?utf-8?B?N0VYNUVDUytWZFRMeEQ5VDdFMk5CV1lWaWRRQ1cxYmQ4NG56Mjg1TTVSQVY4?=
 =?utf-8?B?ZHNFS296YW1qT3lNN0xaeFdVZDRiOVgyOVB5NytnZGFrSHdWRVBtQ1F4cy83?=
 =?utf-8?B?Rnl1WEJ3Mnd3cGJSb1plM3MvaUFYSUhsMDhyZVVjb3daNnpQNDVBK3JmSzFH?=
 =?utf-8?B?RUl0TEc1R3FDOU56K1BMV3ZMM3RldmpOU0Q3Ti9qNWVwZkJCZGNkZldzTkdT?=
 =?utf-8?B?RGYxM1dUUjVTTGtPSXJGbHRNZkdFU29iaEc3cnJON2hoQk5yTUVxeE9QRWp0?=
 =?utf-8?B?NmhMMDd1Y3Fid1VhbnFkd1g4WFBqcm12blBTbFFtT3I3aHFac3V6SU5PODg4?=
 =?utf-8?Q?AjGAcvVdIh0lu3Lqtk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXhncDd1ODJXSG9ldFdBRlBKNmhOMXhWUit5Q21uWEV1S09XY2NxNmVtQVd3?=
 =?utf-8?B?ay9iVHlaUWlGNU9JczMxZ2VEeDBPM0QzVm10bytSTlBhVEVRcTJnbmdSQlVo?=
 =?utf-8?B?dTI3R3k1bHJhUXJzUHdzdXhYbjNHd25lMnJJY1JiVXhNZ1llSCtaNUVvcE9p?=
 =?utf-8?B?d3VVclk0MTJ2amljSmV5Yjh3WVJJNTBMbFdMOWlWTnR1Q0FCdmYyVkZNVU5N?=
 =?utf-8?B?aWJpUVA3NEdqd2p2QjBjRGNJVm1JYXJ5S0dQVFczRHdENzdnVFVON0x5VW5J?=
 =?utf-8?B?dXBtZDRmajRhVDVZYXRJQ0RMbkh0cWpXa1J5cXh1L2FhcHczQXVUUmxBc2g2?=
 =?utf-8?B?b3FISU1wY2lXSTQzajV6MXpjVkNNd2tjeEg1LzNValV3TkVVV2RhbXIwWTIy?=
 =?utf-8?B?bmF1dEpjNVJ5MEhVWnFRVGo5QWdpNDlYOFJpWGxtTXBtdWFGdnlJRllVTUo4?=
 =?utf-8?B?UGxJbFNFQmQ5RTlLTkx0cTNuZmFwMUF4OFlKSlp6OXZ2TW1KTWNCMEJZQmJM?=
 =?utf-8?B?MWcraTJ4WmZSa282SFIyTXJjbVNJZW1TVTlFS013Ylk3OVdVZC9TWUE0MnJj?=
 =?utf-8?B?bU96K3UvWnljRkVlb0wyTTU5RnlzaWtjaEdCdkMvdGFUdDE2cHJwa3k4UUp2?=
 =?utf-8?B?RG5KSjRKMmFUMXd1K0JkM0F0WnZCNFE1UXBBUUlkTzdZU1dYVDVhN3Q3MzZr?=
 =?utf-8?B?aVhXWGRHa21JVzZJczc5cTBwTzFYdWJ6SXhRT1FSR1lTYjFkWGppcDBFaVBB?=
 =?utf-8?B?YldqbFduZnMwS3R5SHZYYzdIVXpXL0JvWmxNSUpmOWp0WjNrYUd0TVdKOWNw?=
 =?utf-8?B?VWR0UkFTMXJkTVZnbGIxMzBIbmVxV3FCbFRLUTM1QmhEcFJIMG5HTkF4d2ox?=
 =?utf-8?B?NTFNaDdhVlRHTnZST1ByOWdDUzlRa0hsZWgxV3YxYnQzV3E3ckpTeVZTRGhN?=
 =?utf-8?B?U1U3VGtRRmNWR1I1V1BwTCtJbTBwWVpwSEQ5a2ZCSjR4RUlPQ0pMeFlvOVRk?=
 =?utf-8?B?bG1NTWRYYnU5QysvZGJCNHZnWXFkY0Y1ZkFUZWxoOUp1YlZKNVdhU1MzTmhL?=
 =?utf-8?B?d3V6cWtKQUJsTytpV1UraUY0TlErVTVEbTdDN3U5ZUpwcGZ3cXNzTG1rZlZs?=
 =?utf-8?B?VThaZTI3Z3cxMnQ1c2ZWc0ErNjhNb2FuV1hIT3dhMXFORHBseDZvbGJ2bVRC?=
 =?utf-8?B?TFJuTkRvQ3o2ZUVCbjQxODE1QXlVbGlWTEZ5MmVacjI4SE0vVVQ4TjBVb2o2?=
 =?utf-8?B?N2VNYSt3b0kvNVZlaTJGUDVJTGE1eU5DaTU4VC9Pb0M3cFN6Q3UzTGp2NEY4?=
 =?utf-8?B?dDVRSUZqM1gxWkkva3B6OVZhVkVOYlo5TzhCY0J2NmJqTi90R0JTaUNpOTNS?=
 =?utf-8?B?TGduUWE0QkNHbzlhaHpFZC9KaUlaMnZHYnJocjNIZUltR0Rna2E3TFFqNUVw?=
 =?utf-8?B?UFVhbS9QclZvcTlsMHl0SW9zWWpZaUFRYmJqNktiTlZmWFFTckVxZlljeUJB?=
 =?utf-8?B?eVF1eWw5c2NWOC9lZENNNDhsOFRwS3lHUUFaY21MWUFvQXM5OUl3MStpQ21O?=
 =?utf-8?B?dkd6MmRUMzUxdi9vZFVDcmRwT05hZ21iRWhNREN4RFVqWGc1bDh2RE5pZ29o?=
 =?utf-8?B?Y2tETVFNQ0V0bTNOd2pnMzg3M3JmM1lPK1IreDRxVzJ5cHVqTnZXdG5nVzRo?=
 =?utf-8?B?amxsLzliVU9kNEJxOHNFMXI4ajVFbTYybEF2NzJDMk1wVURqMytmV2E2V21o?=
 =?utf-8?B?ZjltODVCaU5xR2F2cEdiaVlIbCtEZlczVlFrZHZ0NVVqb1B3dmxFcW5vMndD?=
 =?utf-8?B?QTUyM1Z5Q21MeFFLanE1V1NRYVYzd3RUMEVBU3JZYkQrWkZtRE5HL0lVU1Ru?=
 =?utf-8?B?d0ZzZE5reEdtYXJSZEViaFVqY3JmZTJmN1ovUStsT0JmUnJHd2tSTDdnSzY0?=
 =?utf-8?B?L2t0WVVTb2x5MUQ3OGZmR1hra05Vd3Ewd0dLRncyUHV0Q0NITnYxb2RpTjlZ?=
 =?utf-8?B?Tm1wOXM1RFVVMGNLakFkVml6RzJnUWJ2akJZczVnNDJZMlM3NTVEL2NLNU1q?=
 =?utf-8?B?eUJQazgzeTVXMGEzZWdjWnZNTTV2eExqbzNCM0hTSHN5MkJFajRFQ3Z4Vnpk?=
 =?utf-8?Q?dYDJ0DQdCRZcVNahBokqPcagY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f79e0546-c4d7-43b2-5043-08dcfcdf8f2e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:47:09.2203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbxI4ZTjI534xg6tSoKVQ9evQMyzkmr1CcWDVOoBWkPgoZLy+7HawmqNgZLL0sLtcQNCoCNYiDv0bTjrFxB2sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7971
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

Unique MSI-X per exec queue will improve the performance of the
IRQ handler. In case no MSI-X is available, the uAPI will return
-EBUSY error and the user would be able to execute the uAPI again
without the flag (fallback to default MSI-X).

Co-authored-by: Ilia Levi <ilia.levi@intel.com>
Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 58 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_irq_msix.c         | 26 +++++++++++
 drivers/gpu/drm/xe/xe_irq_msix.h         |  1 +
 include/uapi/drm/xe_drm.h                |  8 +++-
 5 files changed, 89 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 73d71acd6c7d..184131184dda 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -12,10 +12,12 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_device.h"
+#include "xe_drv.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hw_fence.h"
+#include "xe_irq_msix.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_migrate.h"
@@ -34,8 +36,46 @@ enum xe_exec_queue_sched_prop {
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
                       u64 extensions, int ext_number);
 
+static int xe_exec_queue_msix_init(struct xe_device *xe, struct xe_exec_queue *q, bool unique_msix)
+{
+    u16 msix;
+    int ret = 0;
+
+    if (!xe_device_has_msix(xe))
+        return 0;
+
+    if (!unique_msix) {
+        q->msix = xe->irq.msix.default_msix;
+        return 0;
+    }
+
+    ret = xe_irq_msix_request_irq(xe, xe_irq_msix_hwe_handler, q,
+                      DRIVER_NAME "-exec-queue", true, &msix);
+    if (ret < 0) {
+        drm_dbg(&xe->drm, "Can't allocate unique MSI-X to exec queue (%d)\n", ret);
+        return ret;
+    }
+
+    q->msix = msix;
+
+    return 0;
+}
+
+static void xe_exec_queue_msix_fini(struct xe_exec_queue *q)
+{
+    struct xe_device *xe = gt_to_xe(q->gt);
+
+    if (!xe_device_has_msix(xe))
+        return;
+
+    if (q->msix && q->msix != xe->irq.msix.default_msix)
+        xe_irq_msix_free_irq(xe, q->msix);
+}
+
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
+    xe_exec_queue_msix_fini(q);
+
     if (q->vm)
         xe_vm_put(q->vm);
 
@@ -68,7 +108,12 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
     q->gt = gt;
     q->class = hwe->class;
     q->width = width;
-    q->msix = xe->irq.msix.default_msix;
+    err = xe_exec_queue_msix_init(xe, q, flags & EXEC_QUEUE_FLAG_UNIQUE_MSIX);
+    if (err) {
+        kfree(q);
+        return ERR_PTR(err);
+    }
+
     q->logical_mask = logical_mask;
     q->fence_irq = &gt->fence_irq[hwe->class];
     q->ring_ops = gt->ring_ops[hwe->class];
@@ -536,13 +581,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
     struct xe_gt *gt;
     struct xe_tile *tile;
     struct xe_exec_queue *q = NULL;
+    u32 flags = 0;
     u32 logical_mask;
     u32 id;
     u32 len;
     int err;
 
-    if (XE_IOCTL_DBG(xe, args->flags) ||
-        XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+    if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
         return -EINVAL;
 
     len = args->width * args->num_placements;
@@ -558,6 +603,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
     if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
         return -EINVAL;
 
+    if (args->flags & DRM_XE_EXEC_QUEUE_CREATE_FLAG_UNIQUE_INTERRUPT_HINT)
+        flags |= EXEC_QUEUE_FLAG_UNIQUE_MSIX;
+
     if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
         if (XE_IOCTL_DBG(xe, args->width != 1) ||
             XE_IOCTL_DBG(xe, args->num_placements != 1) ||
@@ -566,8 +614,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
         for_each_tile(tile, xe, id) {
             struct xe_exec_queue *new;
-            u32 flags = EXEC_QUEUE_FLAG_VM;
 
+            flags |= EXEC_QUEUE_FLAG_VM;
             if (id)
                 flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
 
@@ -614,7 +662,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
         }
 
         q = xe_exec_queue_create(xe, vm, logical_mask,
-                     args->width, hwe, 0,
+                     args->width, hwe, flags,
                      args->extensions);
         up_read(&vm->lock);
         xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 19fd66d59dd7..047a3fae849f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -85,6 +85,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD    BIT(3)
 /* kernel exec_queue only, set priority to highest level */
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY        BIT(4)
+/* queue with unique msix interrupt */
+#define EXEC_QUEUE_FLAG_UNIQUE_MSIX        BIT(5)
 
     /**
      * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_irq_msix.c b/drivers/gpu/drm/xe/xe_irq_msix.c
index f873bcfe5283..53d05aafb2a7 100644
--- a/drivers/gpu/drm/xe/xe_irq_msix.c
+++ b/drivers/gpu/drm/xe/xe_irq_msix.c
@@ -9,6 +9,7 @@
 
 #include "xe_device.h"
 #include "xe_drv.h"
+#include "xe_exec_queue_types.h"
 #include "xe_guc.h"
 #include "xe_memirq.h"
 
@@ -67,6 +68,23 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
     return IRQ_HANDLED;
 }
 
+/**
+ * xe_irq_msix_hwe_handler - MSI-X IRQ handler for hw engines
+ * @irq: the irq raised
+ * @arg: the exec queue that raised the interrupt
+ *
+ * In MSI-X mode command streamers raise an interrupt only as a result of
+ * MI_USER_INTERRUPT and MI_FLUSH_DW_NOTIFY commands.
+ */
+irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg)
+{
+    struct xe_exec_queue *q = arg;
+
+    xe_memirq_hwe_handler(&gt_to_tile(q->hwe->gt)->memirq, q->hwe);
+
+    return IRQ_HANDLED;
+}
+
 static int xe_irq_msix_alloc_vector(struct xe_device *xe, void *irq_buf,
                     bool dynamic_msix, u16 *msix)
 {
@@ -133,6 +151,14 @@ void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
     int irq;
     void *irq_buf;
 
+    /*
+     * When removing the driver this function can be called twice for each msix that was
+     * allocated for exec queue. First from irq_uninstall() and then from exec queue free.
+     * Hence, it is possible that the xarray was already destroyed or the entry was removed.
+     */
+    if (xa_empty(&xe->irq.msix.indexes))
+        return;
+
     irq_buf = xa_load(&xe->irq.msix.indexes, msix);
     if (!irq_buf)
         return;
diff --git a/drivers/gpu/drm/xe/xe_irq_msix.h b/drivers/gpu/drm/xe/xe_irq_msix.h
index a9c8ce18172e..04619d991b10 100644
--- a/drivers/gpu/drm/xe/xe_irq_msix.h
+++ b/drivers/gpu/drm/xe/xe_irq_msix.h
@@ -17,5 +17,6 @@ void xe_irq_msix_synchronize_irq(struct xe_device *xe);
 int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
                 const char *name, bool dynamic_msix, u16 *msix);
 void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix);
+irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg);
 
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4a8a4a63e99c..5f32553b14fb 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1123,7 +1123,13 @@ struct drm_xe_exec_queue_create {
     /** @vm_id: VM to use for this exec queue */
     __u32 vm_id;
 
-    /** @flags: MBZ */
+    /*
+     * When creating exec queue in MSIX platforms, the user can request a unique MSIX interrupt
+     * for the irq handler. If there is no available MSIX, -EBUSY will be returned.
+     */
+#define    DRM_XE_EXEC_QUEUE_CREATE_FLAG_UNIQUE_INTERRUPT_HINT (0x1 << 0)
+
+    /** @flags: create queue flags */
     __u32 flags;
 
     /** @exec_queue_id: Returned exec queue ID */
-- 
2.43.2


