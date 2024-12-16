Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235CCE7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 08:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBEF10E3FE;
	Mon, 16 Dec 2024 08:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZPDmyEc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1A210E405
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 08:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734336224; x=1765872224;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cBWDCmkFN9L/btf4Mev4KVvEzyAHmygCVD/9OJwfa+o=;
 b=BZPDmyEcHTA0Hbb52cNHs7s57AIoafrn+KTbA5T+0BG11ZUE6XasSNDU
 VEUFpA4vJGgUaqg4XsQyhs5KKpVTCuT/egikvlpf0bXei2sYnqzwPOboT
 jsMmcD34fqTz8CCw7Arx9UUkBKDsZK/nnCkxb/KHYTcJ8VDIiYwoNVg0d
 Er8udErAzc2SFJ4j3NE9oGU+bSAyDwa1ItoTuotUPHlnc5eGqMgCVtQZ2
 LvMVPj4Iy6ZpaU8h8RoDH0hjmFX8J7956kT+t7GFQLvpEmmzaZN/PsteD
 Z5TMg8rbtHhGtAic/LUe3J52M0oXVQj3MQUu/oXus8IzAXBTk/IDfILo4 w==;
X-CSE-ConnectionGUID: jzwk/fVxQ6ufl0k6B9NA1A==
X-CSE-MsgGUID: AD1BXu4NRxWTn1Z/aHL6MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34033389"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; d="scan'208";a="34033389"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 00:03:38 -0800
X-CSE-ConnectionGUID: cd4GMVV3Swu3Nwak8yWQOw==
X-CSE-MsgGUID: ei4Bp1pBStGzDiK/Gn+CLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101274207"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 00:03:38 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 00:03:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 00:03:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 00:03:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrXnITGoke61qK9D9zTCHrOoXcE6TzbKb2OzmEGweDg9uSIu9t0dmH1vljBJ2orzC6f7/LKhKJqFz6HlJCfICZhwN4FdyWp5LpQlg8f7HMz70lxU/kkuKaXbjCBwenFwCth97Wad+q5jZ2h1AIcrgHD+2OJxXR+qpTESjrV9JpOYLI51sH3NlgPG3gZWSQiZKWwohkESP3jjc/bQDTnNKBJXRVfOwpaK+pe8zoXrDR93VmtARn49prU6Vq30lyBVDenIqTBX8k03J/VwjSTQgwo1+bN4NXa9WOTHZBqCTvFW1eBFbTLyiCV0ov6CEFqHPfXASuS9KMKYRIyNVafL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuojmQGslhTX3X5zfo/CMp3CkOk4BCeMZHu+qchXa6c=;
 b=XVdWnhvfrNyMWy0H8rKNmDSa1z1XOmamqj3+Tk6dmklT+IjCwukI/Icx8j4zGTy84yxVJ6NukwsAvvamkLpAE/48jZUdKviSILFGF+6zzz3zV/uaTaWFha1sA7NqO2Dl8X9PzaQguRwMgs0aWol2ANiFPRyFl+vWz+/Z3pXp/WMlhGAWT0uDzhcqMjaAfpGdOmZziHLZ7whD3XAF7k0ztFSQcbDXsVhiM06K+vSePO8Oyqpus/P6xn1L95Ynu1vMtySr0txjaXTQzZIOpzlEuPLJbcf6teY0jPJBIJ8WjVe6cryya2rZTajhBfD0ODytyGxGUqqMA1FqMPBONqaHXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB7166.namprd11.prod.outlook.com (2603:10b6:510:1e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 08:03:21 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 08:03:21 +0000
Message-ID: <6efef814-f727-49ad-84ad-6701b7a97716@intel.com>
Date: Mon, 16 Dec 2024 13:33:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RFC drm/xe: Add functions and sysfs for boot
 survivability
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <aravind.iddamsetty@intel.com>
References: <20241212054945.1091894-1-riana.tauro@intel.com>
 <20241212054945.1091894-2-riana.tauro@intel.com> <Z1tqV9UpBeG_fITD@intel.com>
 <ccd408ab-ede9-43d5-bde0-0e8e989b332c@intel.com> <Z1ycWEYbI745oiBb@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z1ycWEYbI745oiBb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 27711014-b1c6-475f-daf5-08dd1da81bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z21YYngwNStmQ1RqWXkvOFYzUmIvbG15RFVGbUN2cDk5c0JUMDdSRUNQWk1Y?=
 =?utf-8?B?U0E4a2VKcEl5TGNJZVBzQWJEQ2RwYnVMSm16cFdQVnJ3dWdVVlY2a3dtcDZE?=
 =?utf-8?B?dTQzb1dMSnpoUG16aEZGM0pxaVM0ZHVsdXJWanFYNi9pRDF6TVdMWUg2bVF2?=
 =?utf-8?B?M0N2dnZtNG1vcnNzMW9Oc1RXOGJQWkVNbmdBNnJiaXVFTUR2Q1IrQmRKYVJu?=
 =?utf-8?B?V205eXBBK2prM25peEJ5OGZ3d2cwWGVVdXdSMm9MRVg3M0VETlhmRTAyS3VT?=
 =?utf-8?B?Uy9UYUMxaFVvWWxiMElFTUpjcDZjR2NjcHFnMThkZm4xT2NBdzdhSHU1akow?=
 =?utf-8?B?SVphTXNwcEpYTm9Udk16L0UwbzlRNGVHRE1XUkRnOUJubEl5bzErN1BidTV2?=
 =?utf-8?B?OEFKOVc2aWRNN0pNRktyaHo3YUV4MUwwYVZkdDl5QW4wZHMxVFdhZHJlYkVG?=
 =?utf-8?B?bEZRTGFxcWxkRjIvcmk4akJDMTlzYXFiUWg4Y25rb3FVREhDV3EvSWt5MFBN?=
 =?utf-8?B?UVBhaitDM2lGL2NGaHFRRkRXcWhBd0xoSzAyTUs2cnczd3pKazVlUmhIamdn?=
 =?utf-8?B?YXV1cnhqU2RqZXVwaW5HNFQ5MWR6Y3ppZDdHeG9pZGs1RHREYVdDcmVNd1k2?=
 =?utf-8?B?QmhvYkZiN1llYUc1VERUdXpEM0V4bXdpRGVGeHNacytrbUF5bWkxUnZoRUJI?=
 =?utf-8?B?NURVbUNnZnVWdVBPNHlJT3BQNXNyc3lrREx0MWQ1cmgrSzhadEZkQURiV2JD?=
 =?utf-8?B?UFpBWnFERWpZS3VXRGc2UXd1R0FiVTBHOHhaYVJ1dmdRdm1QbHZXNG83Skl0?=
 =?utf-8?B?azZLak1QbkFmclA5L2tuc1ExQkYxaURjWG1BK0x0R1pUYjg4aCs0NzltOXVP?=
 =?utf-8?B?Rm5hejZhbWVWMXlLN2ZJK01acjM0c3JzUFhHNkNnaFFGYmRYaENOd29XK01M?=
 =?utf-8?B?ajBDQVZnSHhBek9TVTNlTFZhUE1sVVRsWHlMK25uZGkvZkV0SlltM2trVjBK?=
 =?utf-8?B?aFdMbkhjNEttOEtRV0haM2swcEdpbXpwQ1JTelM5RFhQU1FWd3JodmFIdGhi?=
 =?utf-8?B?OUFGeUF5VE10NHpqeUlyN0daSVdLb09NVDZOSmsycnR4Z0RQWEdHK0dEclNJ?=
 =?utf-8?B?elIzajgzYXdQOEFOTkRGSlprZloyLytkVmpsR3hQeW9Ic2tmTkx6bW5GSFho?=
 =?utf-8?B?M2JOR3E4ZmRWZlZmdmhHWW8rdXFGVEtISDIvRjhKN2ozVW5TTThhNjY1bjk5?=
 =?utf-8?B?TWp6alo1ZHZhbG1iUnlGeTRvMTA4eXEyRTRaY3FsUEcrdUdQelZqNFZKb1k1?=
 =?utf-8?B?RGxzLzhFL21aZFoydUJjWHpTKzNEK0pSTDdYazZnT3ZVaDcvZUVOTkRrUExa?=
 =?utf-8?B?NE0ybjczNzRKdGxiUjd2ZVpTaEJVa3JuZ1BQRko4RG5KQnJ4QzhzMWtOWHkv?=
 =?utf-8?B?cTFZSjYyL2FReWNSNEwrQll4anI3QXk1Wlg3MzRsSGkrSXdoYzA4UDYzbytS?=
 =?utf-8?B?K20zaHZWeXYwdC9COTRTUUl5YTBPWHVlVGQrOUJsSzdQUWRHbVUzY24yMHdL?=
 =?utf-8?B?ZGlMR1duRWsxeFZpYm1ENHV2Q2NJL1RFNlZmUlBvSGJGbzg3OEQwZDZXWGJV?=
 =?utf-8?B?dWI1bTlRTmJXM01WMkVvZXhKQWRmWm90cUZ3eERvZXBKZlhYRUxqYjBEYmdx?=
 =?utf-8?B?N0FzRnh6TWZVUzRhRG1TUmU4NHQ4Y1JVWC9lV3VzUzJmNGNUdnFlSGpCd1Uv?=
 =?utf-8?B?MFpORnh0QjVCTzYwWDd5dzJtb2xTYXY0eENsMnFWeG5lbFlFWWNFWnhhTmRj?=
 =?utf-8?B?WGpKSVVvVS9weHd1N2JWN0R3VThBWURZQVBJcHJ3UXdjN1luVGRsWEVCVHVO?=
 =?utf-8?Q?6HIjesvfs1yBu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3JqKzRVMzh3bThGbFBBVXdkMS9jSGtDZTFuWlNEVjQwbXRFMTlLM3FSMGt3?=
 =?utf-8?B?OVM0VDVrRVVoaHUwbUVjc2lZQllOOVF1R0lrT3JlVksrNmpFOW0ybDA2b2VK?=
 =?utf-8?B?eXUwZ0wzcXFORVNDNFpKZlJhc0tHVEp2OU5GMkppQnp3WDFJZUd0SmJ1YlBi?=
 =?utf-8?B?YVRvcDNiWXBKWUxqSktteTNsNWJITlRpQ0JYOUVrWE1wNXB5bERINlp5R05P?=
 =?utf-8?B?TmJGa2ZaVnZ3ZVpIY3cwSCtMbllBbUNFbWVmT1lITWZ3MmU2UW83WG9kSVFQ?=
 =?utf-8?B?WFRlYytSMkVrakZoVEthZ2NMUlhVRjFHVDk5MjJHRmNxTVV5Smg3SWU0bEZt?=
 =?utf-8?B?NENrYXF2M0E2NU9FTlZIeDZweTJ6ZFJBRVFOV3kxK3oremR1NGgwZmdhWkJv?=
 =?utf-8?B?OW45dXNBOWdzelRadHgvc09vNCs5UHBtOXE5c3lSeTRCWm5KQjFDNWlWWksw?=
 =?utf-8?B?bVh3eWtKR3VDQW51UlNpeThGVGpoS3BaQnVRbDhxSXZYa0tWd2swVGE2U2xL?=
 =?utf-8?B?R24wbDl3NzhyWXNFZ2FpYW9RL3lTby8wblRCWDNHSThQREwra1hzRHRIZ3Nj?=
 =?utf-8?B?L0hsVUlSeHpnMFA3WlJTVEFZZnBOcWRpMS91MFhXL2pkSHFwZ0hUOU1OOWx0?=
 =?utf-8?B?VGo0TzdjNTJaWktKcURwc3hTYjZDTFVpNHl5bk9zQzVJd3NsY0VkYncxVFlV?=
 =?utf-8?B?d1laSk9OUEtZZlo4SUlEVUF5RVRWWVluZTVja2VMK3l5d253NzJ6QXEvd1Rt?=
 =?utf-8?B?cHk0SHZXaFZJbGc3WXhzMC85c0UxM1BoYlU0dnUyVWNJaWpFa1U2a0U4dVYx?=
 =?utf-8?B?cDdBd2JBTmpsREU2cTJDc0JkZW01R0J1eTVZLzgzR0VlZktlSk02bnhnaFdj?=
 =?utf-8?B?SFdZTWZUN2tBWElHK1Juem1zS0sveDlwVFpSN0M4ZlgxMDVxYTF2VWp4d1J1?=
 =?utf-8?B?Qmt5NFUxTFNxVWd1L29na0dVUnJsYmVrTm1NQ3VrdDNTazVldHhxN2ZwczdW?=
 =?utf-8?B?QzZjZWdNekNoTC9nb2M0NVEyb0lreXBBR0ZlQjF0MGJESzNySm0zbHNISkZJ?=
 =?utf-8?B?MFhZVm5LeHJFTlU1c1pUZ2FjdjMvRkNsSitaOGxBT2dOWGhQL0RUTWdpbTlM?=
 =?utf-8?B?NythNTdOL0tOZHhKbFFTYkdObU13RXV2Q0NmaHk1bFliVUwwRXp5Q1RRSlQ4?=
 =?utf-8?B?NlcxL0RYSkVMRjczbzR6SkdVdVhHSEtuT2lUdVpIVWhTZ0ZreEtpODJuYVhZ?=
 =?utf-8?B?NDAweElPdXMzamg0WW9qS0hIMklZWENicnZlTmVNMTJlbUpYVEF2VkFpQ1Bm?=
 =?utf-8?B?Qy9RUUJqZGpsZjNCR2ZMTVVUOU1hK3dTMEJSbnBEbEdqTmxhRUV0anZUdXZX?=
 =?utf-8?B?b2pBc1NqU2xOcm9waXRaNVo2WkRaTHl0akhmZjJkRlIzMWZYODNqMUh3NThZ?=
 =?utf-8?B?QXlyd2M3L2phbGZ1alYvVkJPNFpKUDU2Q21lVHkwSU5qN1dTcW1zODNPTXN2?=
 =?utf-8?B?TVI3aVEzeXJJb2E5ZURBQXBpZFJaaVFydU01S0pMQzJ1SjRQaEFwL2NBWXBD?=
 =?utf-8?B?S1ZkbW4ycElkbkNYL1FqZzlwR1dWS2QwR1B5L29FSTgvMmVtTi9aTmI1SGxE?=
 =?utf-8?B?U200UEdULzV6QWo0aVhCalBCMEtLTW9UdUdJaWZtWDc4VDFrdFZySFlqMXVi?=
 =?utf-8?B?R1VkbExLTlgwY3dDK3dRdlRiaE5qMDV4YUhKSDFjU25FV0tlbjYyY01pZlUv?=
 =?utf-8?B?blpmU0Zkd0h1VkZER1FrSTdOTjdJRFhmcDUzRzhCOGxKd24ycUtGWUl6ZllE?=
 =?utf-8?B?ejNya2xXeXIvTXpYVGpZMFFwRXRaQndDZnZTOTRNVkZrWFo5QjNmUGZzQnl2?=
 =?utf-8?B?Y2R5dlcwWW85anhEa3Ztd2ROQy90bnliSWtWc2dhQjF5cTZPY1NEeUFHTkpH?=
 =?utf-8?B?UW4zRHU4NlBwL0xIRVZ6emFRTFh4QXlmT0VTTStJbTIrbW95M25DWlg1RGxC?=
 =?utf-8?B?WXhoUXVjc3Ntekk2QzU1S3FGb1ltQU5FM0YrUk9OT1VlT3hGdFpYMVFuRk5u?=
 =?utf-8?B?UE1ybjZydWRCOFlRUmQ5b1ZCNU1QdGJ3Q1dXeGdjYWdud1hRVmczcmU4bGJX?=
 =?utf-8?Q?FTXE+SMzQpiuKhOfuoWzfv4wh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27711014-b1c6-475f-daf5-08dd1da81bbf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 08:03:21.5276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UftXkdm7pm7GjkI4+Q10OzqmRrsrQj4z0WwfgAkbAFdtdR/Ka4MAGZycKUWOEK6ZidgOH0dghmWNG1IgkVZ8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7166
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



On 12/14/2024 2:13 AM, Rodrigo Vivi wrote:
> On Fri, Dec 13, 2024 at 01:34:23PM +0530, Riana Tauro wrote:
>> Hi Rodrigo
>>
>> Thank you for the review comments.
>>
>> On 12/13/2024 4:27 AM, Rodrigo Vivi wrote:
>>> On Thu, Dec 12, 2024 at 11:19:44AM +0530, Riana Tauro wrote:
>>>> Boot Survivability is a software based workflow for recovering a system
>>>> in a failed boot state. Here system recoverability is concerned with
>>>> recovering the firmware responsible for boot.
>>>>
>>>> This is implemented by loading the driver with bare minimum (no drm card)
>>>> to allow the firmware to be flashed through mei/gsc and collect telemetry.
>>>> The driver's probe flow is modified such that it enters survivability mode
>>>> when pcode initialization is incomplete and boot status denotes a failure.
>>>> In this mode, drm card is not exposed and PCI sysfs is used to indicate
>>>> survivability mode and provide additional information required for debug
>>>>
>>>> This patch adds initialization functions and exposes admin
>>>> readable sysfs entries
>>>>
>>>> The new sysfs will have the below layout
>>>>
>>>> 	/sys/bus/.../bdf
>>>> 		     ├── survivability_info
>>>>                    ├── survivability_mode
>>>
>>> Let's make only one file and get all the info inside the survivability_mode
>>> one.
>> Then any application using this will have to parse value?
>>
>> Oh you meant, the presence of the file will indicate the mode and contents
>> will give the required information. Okay will modify this
>>>
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/Makefile                   |   1 +
>>>>    drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>>>>    drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
>>>>    drivers/gpu/drm/xe/xe_survivability_mode.c    | 225 ++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
>>>>    .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
>>>>    6 files changed, 296 insertions(+)
>>>>    create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>    create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
>>>>    create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index 7730e0596299..dc60512a5c47 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>>>>    	xe_sa.o \
>>>>    	xe_sched_job.o \
>>>>    	xe_step.o \
>>>> +	xe_survivability_mode.o \
>>>>    	xe_sync.o \
>>>>    	xe_tile.o \
>>>>    	xe_tile_sysfs.o \
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index 1373a222f5a5..79bd0bd94e9c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -21,6 +21,7 @@
>>>>    #include "xe_pt_types.h"
>>>>    #include "xe_sriov_types.h"
>>>>    #include "xe_step_types.h"
>>>> +#include "xe_survivability_mode_types.h"
>>>>    #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>>    #define TEST_VM_OPS_ERROR
>>>> @@ -341,6 +342,9 @@ struct xe_device {
>>>>    		u8 skip_pcode:1;
>>>>    	} info;
>>>> +	/** @survivability: survivability information for device */
>>>> +	struct xe_survivability survivability;
>>>> +
>>>>    	/** @irq: device interrupt state */
>>>>    	struct {
>>>>    		/** @irq.lock: lock for processing irq's on this device */
>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> index f153ce96f69a..4e373b8199ca 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> @@ -49,6 +49,20 @@
>>>>    /* Domain IDs (param2) */
>>>>    #define     PCODE_MBOX_DOMAIN_HBM		0x2
>>>> +#define PCODE_SCRATCH_ADDR(x)		XE_REG(0x138320 + ((x) * 4))
>>>> +/* PCODE_SCRATCH0 */
>>>> +#define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
>>>> +#define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
>>>> +#define   HISTORY_TRACKING		REG_BIT(11)
>>>> +#define   OVERFLOW_SUPPORT		REG_BIT(10)
>>>> +#define   AUXINFO_SUPPORT		REG_BIT(9)
>>>> +#define   BOOT_STATUS			REG_GENMASK(3, 1)
>>>> +#define      CRITICAL_FAILURE		4
>>>> +#define      NON_CRITICAL_FAILURE	7
>>>> +
>>>> +/* Auxillary info bits */
>>>> +#define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
>>>> +
>>>>    struct pcode_err_decode {
>>>>    	int errno;
>>>>    	const char *str;
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> new file mode 100644
>>>> index 000000000000..7e36989efd68
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> @@ -0,0 +1,225 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2024 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <drm/drm_managed.h>
>>>
>>> this include moves together the linux group below,
>>> on top of it...
>>>
>>>> +
>>>> +#include "xe_survivability_mode_types.h"
>>>> +#include "xe_survivability_mode.h"
>>>> +
>>>> +#include <linux/kobject.h>
>>>> +#include <linux/pci.h>
>>>> +#include <linux/sysfs.h>
>>>> +
>>>> +#include "xe_device.h"
>>>> +#include "xe_gt.h"
>>>> +#include "xe_mmio.h"
>>>> +#include "xe_pcode_api.h"
>>>> +
>>>> +#define MAX_SCRATCH_MMIO 8
>>>> +
>>>> +/**
>>>> + * DOC: Xe Boot Survivability
>>>> + *
>>>> + * Boot Survivability is a software based workflow for recovering a system in a failed boot state
>>>> + * Here system recoverability is concerned with recovering the firmware responsible for boot.
>>>> + *
>>>> + * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
>>>> + * to be flashed through mei and collect telemetry. The driver's probe flow is modified
>>>> + * such that it enters survivability mode when pcode initialization is incomplete and boot status
>>>> + * denotes a failure. In this mode, drm card is not exposed and PCI sysfs is used to indicate the
>>>> + * survivability mode and provide additional information required for debug
>>>> + *
>>>> + * Xe KMD exposes below admin-only readable sysfs in survivability mode
>>>> + *
>>>> + * device/survivability_mode: Indicates driver is in survivability mode
>>>
>>> We need to make in a way that the presence of the file itself is the indication
>>> of the survivability_mode.  No file, no survivability_mode. No survivability_mode, no file.
>>>
>>> Which I believe your code is already doing this below...
>>>
>>>> + * device/survivability_info: Provides additional information on why the driver entered
>>>> + *			      survivability mode.
>>>> + *
>>>> + *			      Capability Information - Provides boot status
>>>> + *			      Postcode Information   - Provides information about the failure
>>>> + *			      Overflow Information   - Provides history of previous failures
>>>> + *			      Auxillary Information  - Certain failures may have information in
>>>> + *						       addition to postcode information
>>>
>>> then this move into the single file...
>>>
>>>> + *
>>>> + * TODO: Notify mei about survivability mode
>>>> + */
>>>> +
>>>> +static void set_survivability_info(struct xe_device *xe, struct xe_survivability_info *info,
>>>> +				   int id, char *name)
>>>> +{
>>>> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>>>> +
>>>> +	strscpy(info[id].name, name, sizeof(info[id].name));
>>>> +	info[id].reg = PCODE_SCRATCH_ADDR(id).raw;
>>>> +	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(id));
>>>> +
>>>> +	drm_info(&xe->drm, "%s: 0x%x - 0x%x\n", info[id].name,
>>>> +		 info[id].reg, info[id].value);
>>>> +}
>>>> +
>>>> +static int fill_survivability_info(struct xe_device *xe)
>>>> +{
>>>> +	struct xe_survivability *survivability = &xe->survivability;
>>>> +	struct xe_survivability_info *info = survivability->info;
>>>> +	u32 capability_info;
>>>> +	int id = 0;
>>>> +
>>>> +	drm_info(&xe->drm, "Survivability Mode Information\n");
>>>
>>> no need for the drm_info here
>> Added a prefix here to indicate the below information is related to
>> Survivability
>>
>> Otherwise it will only display as below in case of Critical failure.
>> Critical failure currently doesn't enter into the survivability mode
>> and will not have sysfs.
> 
> Indeed. for the critical error we print dmesg, do-not create the sysfs
> and fail probe. Perhaps that deserves a separate function?
> 
The same is being done even now. The init function below returns after 
printing dmesg.

/* Only log debug information and exit if it is a critical failure */
if (survivability->boot_status == CRITICAL_FAILURE)
	return;
>>
>>
In the review comment you suggested to remove
drm_info(&xe->drm, "Survivability Mode Information\n");
Without this, in case of critical failure there won't be any indication 
that the below dmesg is related to survivability mode.

Thanks
Riana Tauro
>> [ 4708.689214] xe <bdf>: [drm] Capability Info: <value>
>> [ 4708.689221] xe <bdf>: [drm] Postcode Info: <value>
>> [ 4708.689226] xe <bdf>: [drm] Overflow Info: <value>
>> [ 4708.689230] xe <bdf>: [drm] Auxiliary Info 0: <value>
>>
>> Will remove if not required or add the function name.
>>
>> Thanks,
>> Riana Tauro
>>>
>>>> +	set_survivability_info(xe, info, id, "Capability Info");
>>>> +	capability_info = info[id].value;
>>>> +
>>>> +	if (capability_info & HISTORY_TRACKING) {
>>>> +		id++;
>>>> +		set_survivability_info(xe, info, id, "Postcode Info");
>>>> +
>>>> +		if (capability_info & OVERFLOW_SUPPORT) {
>>>> +			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, capability_info);
>>>> +			/* ID should be within MAX_SCRATCH_MMIO */
>>>> +			if (id >= MAX_SCRATCH_MMIO)
>>>> +				return -EINVAL;
>>>> +			set_survivability_info(xe, info, id, "Overflow Info");
>>>> +		}
>>>> +	}
>>>> +
>>>> +	if (capability_info & AUXINFO_SUPPORT) {
>>>> +		u32 aux_info;
>>>> +		int index = 0;
>>>> +		char name[NAME_MAX];
>>>> +
>>>> +		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, capability_info);
>>>> +		if (id >= MAX_SCRATCH_MMIO)
>>>> +			return -EINVAL;
>>>> +
>>>> +		snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
>>>> +		set_survivability_info(xe, info, id, name);
>>>> +		aux_info = info[id].value;
>>>> +
>>>> +		while ((id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info)) &&
>>>> +		       (id < MAX_SCRATCH_MMIO)) {
>>>> +			index++;
>>>> +			snprintf(name, NAME_MAX, "Prev Auxiliary Info %d", index);
>>>> +			set_survivability_info(xe, info, id, name);
>>>> +			aux_info = info[id].value;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static ssize_t survivability_info_show(struct device *dev,
>>>> +				       struct device_attribute *attr, char *buff)
>>>> +{
>>>> +	struct pci_dev *pdev = to_pci_dev(dev);
>>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> +	struct xe_survivability *survivability = &xe->survivability;
>>>> +	struct xe_survivability_info *info = survivability->info;
>>>> +	int index = 0, count = 0;
>>>> +
>>>> +	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
>>>> +		if (info[index].reg)
>>>> +			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
>>>> +					       info[index].reg, info[index].value);
>>>> +	}
>>>> +
>>>> +	return count;
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR_ADMIN_RO(survivability_info);
>>>> +
>>>> +static ssize_t survivability_mode_show(struct device *dev,
>>>> +				       struct device_attribute *attr, char *buff)
>>>> +{
>>>> +	struct pci_dev *pdev = to_pci_dev(dev);
>>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> +	struct xe_survivability *survivability = &xe->survivability;
>>>> +
>>>> +	return sysfs_emit(buff, "%d\n", survivability->mode);
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>>>> +
>>>> +static const struct attribute *survivability_attrs[] = {
>>>> +	&dev_attr_survivability_mode.attr,
>>>> +	&dev_attr_survivability_info.attr,
>>>> +	NULL,
>>>> +};
>>>> +
>>>> +/**
>>>> + * xe_survivability_mode_required- checks if survivability mode is required
>>>> + * @xe: xe device instance
>>>> + *
>>>> + * This function reads the boot status of the capability register and
>>>> + * checks if it is required to enter boot survivability mode.
>>>> + *
>>>> + * Return: true if survivability mode required, false otherwise
>>>> + */
>>>> +bool xe_survivability_mode_required(struct xe_device *xe)
>>>> +{
>>>> +	struct xe_survivability *survivability = &xe->survivability;
>>>> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>>>> +	u32 data;
>>>> +
>>>> +	data = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(0));
>>>> +	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
>>>> +
>>>> +	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
>>>> +		survivability->boot_status == CRITICAL_FAILURE);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_survivability_mode_remove - remove survivability mode
>>>> + * @xe: xe device instance
>>>> + *
>>>> + * clean up sysfs entries of survivability mode
>>>> + */
>>>> +void xe_survivability_mode_remove(struct xe_device *xe)
>>>> +{
>>>> +	sysfs_remove_files(&xe->drm.dev->kobj, survivability_attrs);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_survivability_mode_init - Initialize the survivability mode
>>>> + * @xe: xe device instance
>>>> + *
>>>> + * Initializes the sysfs and required actions to enter survivability mode
>>>> + */
>>>> +void xe_survivability_mode_init(struct xe_device *xe)
>>>> +{
>>>> +	struct xe_survivability *survivability = &xe->survivability;
>>>> +	struct xe_survivability_info *info;
>>>> +	struct device *dev = xe->drm.dev;
>>>> +	int ret = 0;
>>>> +
>>>> +	survivability->size = MAX_SCRATCH_MMIO;
>>>> +
>>>> +	info = drmm_kcalloc(&xe->drm, survivability->size, sizeof(*info), GFP_KERNEL);
>>>> +	if (!info) {
>>>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	survivability->info = info;
>>>> +
>>>> +	ret = fill_survivability_info(xe);
>>>> +	if (ret)
>>>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, ret);
>>>> +
>>>> +	/* Only log debug information and exit if it is a critical failure */
>>>> +	if (survivability->boot_status == CRITICAL_FAILURE)
>>>> +		return;
>>>> +
>>>> +	/* set survivability mode */
>>>> +	survivability->mode = true;
>>>> +
>>>> +	drm_info(&xe->drm, "In Survivability Mode\n");
>>>
>>> this one is good!
>>>
>>>> +
>>>> +	ret = sysfs_create_files(&dev->kobj, survivability_attrs);
>>>> +	if (ret) {
>>>> +		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	/* TODO: Pass Survivability Mode notification to required child drivers */
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
>>>> new file mode 100644
>>>> index 000000000000..0d5c325322a2
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>>>> @@ -0,0 +1,17 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2024 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_SURVIVABILITY_MODE_H_
>>>> +#define _XE_SURVIVABILITY_MODE_H_
>>>> +
>>>> +#include <linux/types.h>
>>>> +
>>>> +struct xe_device;
>>>> +
>>>> +void xe_survivability_mode_init(struct xe_device *xe);
>>>> +void xe_survivability_mode_remove(struct xe_device *xe);
>>>> +bool xe_survivability_mode_required(struct xe_device *xe);
>>>> +
>>>> +#endif /* _XE_SURVIVABILITY_MODE_H_ */
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>> new file mode 100644
>>>> index 000000000000..f9dbb6d80692
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>> @@ -0,0 +1,35 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2024 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_SURVIVABILITY_MODE_TYPES_H_
>>>> +#define _XE_SURVIVABILITY_MODE_TYPES_H_
>>>> +
>>>> +#include <linux/limits.h>
>>>> +#include <linux/types.h>
>>>> +
>>>> +struct xe_survivability_info {
>>>> +	char name[NAME_MAX];
>>>> +	u32 reg;
>>>> +	u32 value;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct xe_survivability: Contains survivability mode information
>>>> + */
>>>> +struct xe_survivability {
>>>> +	/** @info: struct that holds survivability info from scratch registers */
>>>> +	struct xe_survivability_info *info;
>>>> +
>>>> +	/** @size: number of scratch registers */
>>>> +	u32 size;
>>>> +
>>>> +	/** @boot_status: indicates critical/non critical boot failure */
>>>> +	u8 boot_status;
>>>> +
>>>> +	/** mode: boolean to indicate survivability mode */
>>>> +	bool mode;
>>>> +};
>>>> +
>>>> +#endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
>>>> -- 
>>>> 2.47.1
>>>>
>>

