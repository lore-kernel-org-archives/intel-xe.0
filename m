Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB5DCCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 13:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7F410E904;
	Fri,  3 Oct 2025 13:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kz91Xpzd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B8010E904
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759496785; x=1791032785;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=f48dh2NckzvNQt5uO5A0i+x2wIKy4Ykj5WP5v9KQAu8=;
 b=Kz91Xpzd4tC/VQ9R05VU4HShYzQHiBiZlNGYilomf9mt9vIGnMcUg07Z
 opZ9lJxF30Hd5Bwp+UokKf0E3+KqJU+mfUmlZpXd1KmWhpZD7vl6oDB9c
 DwwrZInGdW/RrS8My7NsRwlu9vwRPqq9BQaLry0GYhnIOk9Ov9u3N+7Bc
 xp/7UgS8LcEnw83OHoWU4s8eKKCEFtPhtlzt1t/rSKPZD8M1qVzKc3Stz
 TB9L0emXA1bLPKiZNXCheBDEtBZlOIA6decuCibBs7Zbgq4sMwQgerbUG
 fjvqjwSKiWK4L5tpLFayZ5z2onanPoEuAJnZWMJ+Z7zg+oCqeBAuDRTZP g==;
X-CSE-ConnectionGUID: dBppdF1fQ5mop0AvUFyicw==
X-CSE-MsgGUID: qNPQYRjBQFmv2gA5HAB6nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61694431"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61694431"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 06:06:24 -0700
X-CSE-ConnectionGUID: pw1QKxz1Sf6nRBg5ts3+Vw==
X-CSE-MsgGUID: yRJHhnADQqi6uVjqFq+9jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="203030890"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 06:06:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 06:06:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 06:06:23 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 06:06:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qH1MlcGSY2+4zG5ZO43JT/ueqELGJsYlPD6zSROwYq8sD8+4N6jY7mUAEAEtLzzx0oMF2AMAk/aYXZD9xJYcKVviEr1+vdDF8SioCitI4WfrsQ0kMXlhMpbnpLnERdfhhExhqCtvvjzVOPSkGicxVTNLOP/Ms+qMKNKnF2Y8UIc0HOSjocXPcHtALmHAg0vzgFkcR2ZWCIWOLTFm3oAxTlbul3ocYO+gCxmCCAE2d6vfMYeaX7t+6vMeMu+73Z0f551NahsUba80kMxufw4w8MYiVGgpmp+sp38FXIlQ0eEsF1IZ8s6tBAdYdLxzksBzH9FIVS9o4Qz2YhjJqATtQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lE8yVGfnSmJZKSHL/Z+zsvgywqI+mBaTMiA3R9XU/n0=;
 b=llYrDHAfQLxG0AqAu/ubVkGrgJZne9kh9ukomYJxowKDqcAl90CJ/zfS8K8gMp1RyGv2mvXd6oIOvk1wLfOVfNvp8DGBmn+jH/lBurdxtn3SbNy2Hjm0C1ZiTteF6srkKx81TbIhSLr1+g1FkCeFriY65fJu+aVgfsCAGDJEIZHRv2hVzrRAy5DIyItKM+t3yUmjbVXbBLbptE81FHnkjpmbGoOJqykTKNtwgLB1rA+H3bOge0hR5FpDlboEKMVQnpoh26818jzoFDEAqGXRVDGMdrGEnVbHYCoHy3kZlVEpCUGVxnOgH9q/2A/MQq9wCHOEyjPSxXeV/EiKRWQ2NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SA2PR11MB5148.namprd11.prod.outlook.com (2603:10b6:806:11e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.19; Fri, 3 Oct
 2025 13:06:19 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Fri, 3 Oct 2025
 13:06:19 +0000
Message-ID: <28b64fa5-b0cd-46f5-b566-ff11770c9ce8@intel.com>
Date: Fri, 3 Oct 2025 15:06:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 29/34] drm/xe/vf: Workaround for race condition in GuC
 firmware during VF pause
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-30-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251002055402.1865880-30-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SA2PR11MB5148:EE_
X-MS-Office365-Filtering-Correlation-Id: 49cd3587-a1ce-41f3-261a-08de027da497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmJwRXpOZ2pRS0FMdzVnc2JjOHlaRC9tQ2VHMTlML3kxSVIvR2JPSVc3REhO?=
 =?utf-8?B?ZzRDYnB5azhDR00xV3pJZEpkVUl5QjNRdnFpWENIOGlhVE5MQ1NSelFRbjBs?=
 =?utf-8?B?MnVTVVlDbnFkWGFNVG16ZGhyaDBGVGVHTmRJbXk5b092NVVYTnpCb1ZoWGlv?=
 =?utf-8?B?MlJjVnVwN00zaVdKa0ZkR1hBR2EyWjZRczJTYXIrc21xMm5HeXZRT1FZRmla?=
 =?utf-8?B?Nzd5amdXZkpZY0JPODJOdW8wYUlIOUo1U0Z1R2JmT2pVT3N5S0dDZCtnSzBQ?=
 =?utf-8?B?aEZEbHJ0ZjI3d1AxaDFSZ0dtMHRDUEs2RXlkdTBHK29LOFpmQmZpb2p5Tkda?=
 =?utf-8?B?MS94emhOc0hGZm1oQ0hMN3cyL24ydFMyMW5VTk5ud0tvVVhVNTQzaFBUdVdq?=
 =?utf-8?B?aWRFUVorN1g1QkV4elRNd0RxdnVvb3JGUTdHOWxzUEhiL1RLeTl3YkcxNzNQ?=
 =?utf-8?B?cVZTeStIcERITHVveUJDOFQ1ZHI5VS82eEQrMXlETWZHYzFOeUhVcitLTXdI?=
 =?utf-8?B?UmluTUFyYzBtaFN1b1lqOWJVWmoydFZnR0dLdDlFMCsrcXVPMWl0ajhTZVU4?=
 =?utf-8?B?ZEI1OWhpSlVrdjEvaURxWmxFZjVCY0NhWmZQTFFLNXo2TTZxL1Y3UTdhT3Zs?=
 =?utf-8?B?NGxkUlJDKzM5SFFlWjJ1L1Q0OFpRcitjU25BVGFWZGlKcVA4L2d6QTVyV3dO?=
 =?utf-8?B?aW4wRnFmUHdyS1A0VWQwS0Zham1wK2puNEdWMnZRUlZUdmJQME54SFBlRWcv?=
 =?utf-8?B?OU9lZ2VWT1FuWDZnenZLYzFjeTJHL3RnbFpvdWRKRlJsUFBpeU56OW51c3p0?=
 =?utf-8?B?UTcvWXJUNlJQSDdMUzdkcWgzZmxkWm5RSXZDRTlXK0I3eDhrUlBha3dPbXJO?=
 =?utf-8?B?UHlvdzhaS1djdUh2b2tvNnptdnJ5enhMYTFiSnY2Rm5xZVJLSnZ3aUZaWEJ1?=
 =?utf-8?B?OVJaU0pHOWt6TUEvYkp0cFJodGRzM2JKbVIzM1U3VlpsK0JwT0pjWEc4c1hq?=
 =?utf-8?B?b25BSkRZeURBeWRhNCtNWGpnL0VwaTVEYTA2Y2k1QmV3R0xPK01mSUFzYjRU?=
 =?utf-8?B?NmZmZlh6ZTlzMktuVzJtVEFiTTZzVHllejh3NzdZK3RyVFovV3h6bnBIVTh3?=
 =?utf-8?B?eTVwWWZqQWwyQkwvQm5NbmE0RFBGd1ZrckFrN1AzelZLTjdsOXl3MnVBaklt?=
 =?utf-8?B?NWNZQis4MGg1UkhsTEtPeW0yY1NPYXpBK1pXSGZNR0YzQ3Mzd1hBbGtQa2tv?=
 =?utf-8?B?U29HYnlRa2cxTmQ0d3Irb0Q1bkdRdWZKRFo2YmVJWWJoNmYvWHFPbXg2QmpP?=
 =?utf-8?B?TkRMWXNPMFpyeWFIMFVjNlZhWXhjSTg4T0tBNnRaRzlDN0Q1aVhFdGhqdm1Q?=
 =?utf-8?B?dG93YzE1a2VYQVhxWklqT1VLanVOdXNqSTFVT24wZytMWFFSMm1mUGx6V0wr?=
 =?utf-8?B?alM5OUVwMXBTRFp1WHRVSDFnZGduKzBRSUJqZzhpcWkramh5eDdEN2xsNkdX?=
 =?utf-8?B?Vkx0Y2tnRW1IKzNxMitCUytXK0h1T0MvcDdYaEFjZ3VoMkQ2U1dnT2hSeWdz?=
 =?utf-8?B?eEJReU1peTM1ZHVVN3hJdlhibEV1cStTOWJtSXlYWllicXhZWmE3eEZ6bGs3?=
 =?utf-8?B?OTZtWkQxVzFrYS9CYjdUakEvMXRUWlNwV3FZMERsV3I0bEhGbjd2cHVvMnVG?=
 =?utf-8?B?RzkyeUkzTFFLbm02dWk0ZEdIbjlhakxxb0tkZkdreGgzNVVvWm5YNHZHQ1VM?=
 =?utf-8?B?aW0yK1AyMXl4Q3hXcXRnZHpZaGtYM0RmTUZ0cnplcWtreS9Qck1EdHpzVnd0?=
 =?utf-8?B?eEFFV2V1K3pjV3p4cG5MTWVaYlQranJNTFFha2FYeUtpNFN3b05lY0VJcHZC?=
 =?utf-8?B?Vk50c09yZWZXZ0h5ZGlVSzRGZ2xxVkVYWmtxQUY0aWo2dUFQR1QzWlVpL1VU?=
 =?utf-8?Q?aecEwagK97pxe4hzshDLKwEtULUqdMEe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmpLVlhva3hONGF2TjRLK0hCek5XSnVnUldtQTdCREdDV1ovOG82SHhSa2Yy?=
 =?utf-8?B?T0VYNDNhRHB0aWxDT21OSWt1VjJBVnEzRElsampYTndvREkwQ3FpejdkSVE0?=
 =?utf-8?B?NlpLeHovRldDWHJQMmQrZkgrMlpvNVU3N2NKZmszZ291YkV1RjJDMUlJdG9S?=
 =?utf-8?B?T2h0MnI5NWViSUN3MGVKTFpPTFpVLzNTVFZFQTZ5RTdSUzMzdm5YQ0hSVmov?=
 =?utf-8?B?VFdROGJmYTIyaUhVRXVsRlNEY0R4MVlPN1pmUCsva0hyUHNubm5BYTlTUnBU?=
 =?utf-8?B?NXAxOWs2S2JYOHBnMHJVcTBsWUtKc3lIWUo4d1ZabCs5Z1dHSVh2WEVUSDVW?=
 =?utf-8?B?R3R5RWt4VU92TCtqRy9CVTcwREE1OFdrdXZQYXJPSlNIaXpwV09sUEQ0NVQv?=
 =?utf-8?B?cWpvblkwVElaRG5LdHY0VTFwaHlaQkZUd1BXNkJwOXJpVTJNS2lOcEV2dWhU?=
 =?utf-8?B?N2JsK0dEazZubmZLdjJpUDdOTHFUbUsyTVdQdFhuZlFCY3BIaWw3TzM4U3RE?=
 =?utf-8?B?SWZaY245dGRGWmwrZWZRNDc0Q0FrSWY5UWFnY25qdzFNTjhrdzJyTWZQS1BJ?=
 =?utf-8?B?NkdaTXFwb2lhN1U1U0M0SitvbUw5N0dMNGdrQmREM201RDA2eHN6bFdnaVNk?=
 =?utf-8?B?V3d2QW1nT2xabWdhUVJDemdURzRJKzY1MDZ1S1ZwaDNrQ1YyaXJubC9LR1N0?=
 =?utf-8?B?RnFJd0dWeFY2cUZ5ZEhvdm9ZelViSkZwOW80a2ZGS1ZTeHczbWRBZXFXcEpN?=
 =?utf-8?B?bmI0RzE2RGt1alBIbW80c0Myb1VJNWsyTGJMWnpXZWQvdFNFeG1BekhaTmtD?=
 =?utf-8?B?M0VCcHQzb2pzMTdDOFdUTUFPUDhNR2h1UFhGN215bW11QWNUY3o1SGF6UEdW?=
 =?utf-8?B?WXJpNGlJQnRhK01vbW1uMjg5TzFkWkJkK3VSRm91Q0xVMXR5ZEdIczJlNUhz?=
 =?utf-8?B?UVVWVm5IOWQ1WEdkeTZlaEhDWm1vTDdYUS9JbENET2MyOEFxdEhaMWVQZHh5?=
 =?utf-8?B?RlBwQ2RPSHJrUGVvTE0rSGlWNUUvM2ZxS2VBQnBrVjAwZW42VG5vRmQzQTND?=
 =?utf-8?B?V3ZHcHNvbHlBZ1huTVZoc0gxUHFycG5VK1V5S2tDaCs2RXV0M1pDbWNnaUZC?=
 =?utf-8?B?OTZPWFlBZXpONkZxajA3ZDRERzNId3VKY3Z4czZWVVNvSUc1VVdpWFhGbFVF?=
 =?utf-8?B?Q0VpQjl4MUdVb2VIcFY4ODZVUXl0Z3JlTVdqOFVQQVZXUWdDL2Y2VkhPLzIr?=
 =?utf-8?B?Mm43UGVFWmwvcHl1Y0drc3g0THNtVkpyMGhmeXgyUGlCZE5UTUlHWmtCVWl4?=
 =?utf-8?B?cWxRRXROQ0JjTzVRODdHT2FqVFJZc2czSVFZNGY1cnRpV0ZkRndaZzh2bncx?=
 =?utf-8?B?c2dPd2RUWUErRFFRcmtLUlFUZUFCVmY1bHBuRisyUVZEbEZFVDZPaWtCR0Mx?=
 =?utf-8?B?dlpNRk5lR0Z2YlpjT2l3dTdnZ09vR2h3cmVIVnJ6UjVWNWNkYUxNTGdHaDBJ?=
 =?utf-8?B?TStuNnRrT1RUSlk3RmthWFJWSEhHUWl6WkRBS2g2R1BBdHpRRTdLOWt1UmZ0?=
 =?utf-8?B?ZkdpUGM2S1U0THNaUkxhY3l5Z3ZrcDVrT2FhaXR5Y1Noczl0ZXk2V0VoUUJY?=
 =?utf-8?B?VytVOWdKbkxhODdCVExhVXBwZFc1cnFXeVhxTWRVUHNwNDNlVXdFdXAzTVBN?=
 =?utf-8?B?NTFwd0ZJb3Z0S251clVjNHBLZGNEUHRFQlB2YnBxZ3gwVnhkVzJtcGxYb2dH?=
 =?utf-8?B?UXAvYlJxWVJJTC9scnN3VHAwZkVybFp0TDJ4OTBNbk9sYVQwZFhKcXVhdWha?=
 =?utf-8?B?WFJvMDRIUTZGbjZBcE84eFZzcGZ5VUVrN1hFN1VpYjc5SnAyUC9OSWtNM09L?=
 =?utf-8?B?UWtjS0dmY3hUYTB1R3QzK05KdUFaemFZaEtKUjhJMVFibDJOUmh4UVZ5b3pt?=
 =?utf-8?B?UVJta1o2eVJFYkNBYS9VWXF3dU9iV3RCWjBSU3dKL3diOVZaVHpsdHVJQ2RX?=
 =?utf-8?B?eHZmV0xhMlVCNE8zQ24rOWJiSEt6NXU0d2Y4RFR3eE53Z1BqbWtXRkJrMXRw?=
 =?utf-8?B?NGV2YkdialZ4REw1WTJzZ21DTDRUVHFzVWY3SlJnRUs2UkFkVERqUk9YYXll?=
 =?utf-8?Q?77G6MgxnAK/sakioUTICr6txr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cd3587-a1ce-41f3-261a-08de027da497
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 13:06:19.1452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtYhz4O3dKL5/TvOgJQfBArVfldHjSoEfbnpDnWHH7VjPe1J2zDiUReOYcP+r/FheOCNj137/UCUANIR+HVZBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5148
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


On 10/2/2025 7:53 AM, Matthew Brost wrote:
> A race condition exists where a paused VF's H2G request can be processed
> and subsequently rejected. This rejection results in a FAST_REQ failure
> being delivered to the KMD, which then terminates the CT via a dead
> worker and triggers a GT reset—an undesirable outcome.
>
> This workaround mitigates the issue by checking if a VF post-migration
> recovery is in progress and aborting these adverse actions accordingly.
> The GuC firmware will address this bug in an upcoming release. Once that
> version is available and VF migration depends on it, this workaround can
> be safely removed.
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 92822d131612..6673576b096b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1395,6 +1395,10 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   
>   		fast_req_report(ct, fence);
>   
> +		/* FIXME: W/A race in the GuC, will get in firmware soon */
> +		if (xe_gt_recovery_inprogress(gt))
> +			return 0;
> +
>   		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
>   
>   		return -EPROTO;
