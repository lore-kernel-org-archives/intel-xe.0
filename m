Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B718C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 03:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F05310E068;
	Fri, 14 Jun 2024 03:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXsOeUkI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DFD10E068
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 03:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718335795; x=1749871795;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aXOW1yj+3VSEjLtv2q8IiYQV+2VCy3NmUcnEsgB3Rrc=;
 b=fXsOeUkIJ6ylesR2srTdgA38r4q8pw0+646ocm8PqZlVF2Y7EinjcwTR
 BCinzcqgyl4+hnhWGsgffxDzfKctZ5iOJ/2p7voJSimxw0e+D2dxXNhLq
 3eO+AUQhskqvrdle1tntkDDd4+IYX76yJNcywBTVoWpZVC7X3MoSkqgOX
 Zb3PUmtD+3cRBb/e6bsStIaO7DKWyB2NSmii6G5d6ki90t7E+Soe/7d9U
 Pwiu6yBnqGPnx1k8Bim6tbdPxclyQ7gD/d490pSXBXUW8C9b5uAD85i2J
 exvwIBO0jZpDfBtiC71A4LP+7euDbgUV2EebzF+bnPkAWsT13vUPoHn1M g==;
X-CSE-ConnectionGUID: istqyei2RFuFTUMZhL688Q==
X-CSE-MsgGUID: wPuBSYpERGOvvYmxNH4ezA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18129263"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="18129263"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 20:29:55 -0700
X-CSE-ConnectionGUID: 2ZHtNIyWTSu6Xg1UFHMOOA==
X-CSE-MsgGUID: bLDzmJopRU2t+6na4hdqGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="40863147"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 20:29:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 20:29:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 20:29:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 20:29:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhCOhCvmO06m9dO5tfI92PYGpxnA1VNwg9nKneLZFI33OfLuhTUOHVgabJKaBCboaM6YWuVMrvQR9BH3KeKQc4j4XO7b4TPEbiL/ULYKxUNiVK4LxP2YdLVIT8ZT3SiYBzHaoaCH2Nt6mYPIfwEJc1YFe+7anPVEGNw5pVoSpLGUQUGFc8tBJj4YFsRVmml1diYcoLgJtGq+SA2jdksRlmvTuT3qcpEn96rKpakvrU7nq6bcpdSPzojKqqGyHWCyjGXxHQYsm6kp6N1bDVQXQVZbTdPeaSiYjL0aHZDUdr2O3dinM+S3lLvbYV3p9KQ9wZbWBUEcsOoLMT4to+SNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWRsQq79KKRozm2rwCH9Qyg4T3SaEf8b6YDWZLOFH4M=;
 b=UkEhf5lU2ZyLjB9cgTgyThquUA3Jnsc+nlErbbJwjcI2M6TWUbMfAqbt3WxNIM1O73IISr9kGHDqeYPVNFTkJNGWX7jBy4HpJ6A/l0+usg9q61eO7MNEBMjvza5n8+JDb1PJM5URSYR0BGw+AecoiPRlMZYC/PwB1E0HKVTADlSIEUhLQqX750FWJ0ZFbuMxcy89vl0Wxv4Zkxc9psuhc+4A8jOZUEPSlv7c63Z7aojjf+aYFJWKrfCtb1R51pHOVuUvMnR6Ul3sVHgDTfLzQ5Uk/+X47r4wNZDE3anYE0Z6gvRNt/lWDq64LUtAZPn+Rl1oO+sAz+e1xvh4w58Lpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN0PR11MB6183.namprd11.prod.outlook.com (2603:10b6:208:3c5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Fri, 14 Jun
 2024 03:29:43 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 03:29:42 +0000
Message-ID: <ef6ef4e4-cd16-4730-abce-4ea787babf65@intel.com>
Date: Fri, 14 Jun 2024 08:59:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Removed unused xe_ggtt_printk
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240613214700.306424-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240613214700.306424-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN0PR11MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: 679a4915-2082-4ce0-3778-08dc8c223ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|376009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDVjbFJ6T0VpelFvZXorRnh0TFFNK0ViamhMMmFJa2hXUFFHVWIvVzR2U1Bl?=
 =?utf-8?B?SEMwYlcvTUF6RGZjaFJFZlRTVU9oVVEyZ2JPbS9uS0t5UFpxbDVxOVptamR4?=
 =?utf-8?B?cERFSjBwQWFRbUhDaURYMVNqajJyeGduTndidDU1dzVGV1J3eEhwdnJwMUZB?=
 =?utf-8?B?b1BITlREeE5zLzVHNkdGTnBqZzdpcGk3MEVSWnIwVUc0Zlk0Z05aYWlkT1A4?=
 =?utf-8?B?OTVnQ0VZc0JTUVI5THE5T3p3ODhXVWhZNmk4N1V0WWZ0ZmZDbW1CbTUrOTBO?=
 =?utf-8?B?TVIwc1V0WXRudFBILzJGV1IwbGxER3VpMnpRRzFtUld3ZWhGQ1J6WmkyOXFs?=
 =?utf-8?B?NktKMDFtVkRXTXFadVJ4c0NsZitWZzMwSFBOTFJva20wR1VwV2RLZzRmS2p2?=
 =?utf-8?B?Sk5sWFJ4RWlVWktnV2RpYnh0MDJ3dmZoUG5jY2pqV2RleEFsODVHZlhqYzhm?=
 =?utf-8?B?dDN2dHhheThpWUttYW9JeW9KbU1RSXJKVURhQmhac2xwRnF6ai9FdWJOTzdr?=
 =?utf-8?B?Y1FiWE5EcFduRGR2T0FuVnV2NUt0VnV6TFhneUlzb1pISmdIMklObnRQMkhZ?=
 =?utf-8?B?ajRJNjduSldIa2haV3Fxc3ZtbkxSblhFUVFwRGZGVStZdEdsOHpoV29PZFRh?=
 =?utf-8?B?REY0cVczMDhtQ05scWFSR0dSekpHVmQydkp3WEpGZDVLL0g1TWdSNzM4eW1H?=
 =?utf-8?B?RTg2ZlVuSFY0czZMNzBWdVdraFZqVUVOVXU3bW9PS0E5c3N4SVJRWWVHZnh5?=
 =?utf-8?B?bEIwbW9aN0ZqYVA0OXZZNlpmeG9UV2U3S3JHSlZSVmticlJyOW5uSlNRclJB?=
 =?utf-8?B?NFRnU01CejFiS2lIOFFxSEZydnhabEZYQjFVeDdGNjRUVG5xTFZ2eUdILzNk?=
 =?utf-8?B?cnFacjdza3VpWlRPUGFxSTdBRGFrMk8vN2x0TTZMeXczaWRLTlMzZi83dTF6?=
 =?utf-8?B?SnZSNml1eEhlVWxzQThMY003cEhEV0lIL0VCaGprNnkrZ2xaVHZlK3RqS3NI?=
 =?utf-8?B?aHZGajBIN3d6aGJlSEpJS0l2ZE1xdkQwd2lzVFErQ1dMMU5DdTdremI0dG5H?=
 =?utf-8?B?WnFTZmxtZU9LSmV0dXVXWUlBMnQ3VUc0U3ppcnZFT0paL2I0ZjVEY3Q2bTdt?=
 =?utf-8?B?VkJsbCtZQWY0dDIveXNnQjh0aWhZQWRhMm11ZjcxVFRkbTJKcnJBYk5ERXIz?=
 =?utf-8?B?ZUJYT1NLcm8rVXdKSHJqendjL3IreGpBZ2U0OVBzOHhtbmdCSU1XZlJFSWZ4?=
 =?utf-8?B?Y1Z6Nmhkd0FBeTJnN3FKRW1VSTFKdXhEQjg3TFlpM1FtaUEvWGF4MGRiWm5D?=
 =?utf-8?B?MXBvendBbjV2QzJmTG5WMUtRVmZEQXk4OEhWY0RnbHVJQkVVUG0wZmYzeW5K?=
 =?utf-8?B?azFkTERNLzZVendzcjhrWjBrc2FTbTA4eVhEdHJMWWR6aWJCTWROWHlCVjhK?=
 =?utf-8?B?aEdDTnQ1OTRDRVMxeVdRZ3Ryd2h3Y2hUVlozQ0RiSTRXU0hhQStObXVLKzFo?=
 =?utf-8?B?cUpSdmNtVC9hTGlQTDdualVkTkpGbk5JUzlzWjNJdTNCSFdINGxXZTljZnVh?=
 =?utf-8?B?eGlCb01xK1pnWUY5OTNXK3lkZ01saUtVWUIydnB3djQxUTVZandyemV3L3po?=
 =?utf-8?B?VVU3U2lCVUFWZ2xINWI1UWFxQzRGYnZ0UTY0cStlSXMvY3BNN0NJNEpSL2cw?=
 =?utf-8?B?TTVEOVMzMUI1Q1Z6ZUhEK2tMeVVjK1NQRkN0UUs4SjRJMGdKN080UU1STTNP?=
 =?utf-8?Q?BiRkP3RwYaqIvtED0hrZdmXAYC8me8N5UT4GadY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(376009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjhIZ3IzekczS0o4M05PM1lFdS95aGFkR3F6cGVITDMvTGRlY2lDSS9FT2Rh?=
 =?utf-8?B?QUU2cGZqejkwaWIzaVVFMk9lZ2VrUnRTYUZtaXNwYzdiNWdoQmpFZllpVEFi?=
 =?utf-8?B?QWhBeFVkUlI3UHZKWFVPMHJnTWFabWVWTmhYRjF0c3laa2R1NXhxbTA0ODZP?=
 =?utf-8?B?dEhEQlN1QnBjc2JvV2JsN3RSdnFyVktuZ28rRWl2VFFXNmNjZmFma0xxSTgv?=
 =?utf-8?B?aGFuMFlwaVQ3Um5KRW5LNFRDQ0VRU1JwU0VSQVQ2ZHRXNmd6KzRIY1NhS2o3?=
 =?utf-8?B?QzhCL05hVmo3MjFUbmg0OHV0TEFNaENJMUFrTXYwbjVWRExNYXM5TWVZemZQ?=
 =?utf-8?B?bmZ2VHRobFUxRFZZVWtlSVhCNC9yMmtveEp6VTFBSUFjUmNrSGFNV0M3Ty93?=
 =?utf-8?B?Y0s4SzAwUnQzQ3pDTlFQTGVvNnl3MTd3bm9nR3Mxcmo5QUluamFtRmlsWTlV?=
 =?utf-8?B?ZlBYbFhBSENQbnUxS2RhM1FUcFZYRWU2QUduWndGd3p2RWF0RDg5UHZDRTVt?=
 =?utf-8?B?L3U2SXlTS3JDNjNyM2l4TWtrOHB3YUJsY1lzOFRJNXpQS25pR0ZlTEV5cGNG?=
 =?utf-8?B?OUlMNFZobUlnbkpaRHNudDc5cEhkWG9yMW4vWFNPelhKQlkxcnBiRHpDOXIr?=
 =?utf-8?B?T3pzRk9CQTUyMWIySzFCNWErZnljVEdVT3k1RXczaFdGSjVtYzBCbnRkZkZM?=
 =?utf-8?B?R3BHMkhjMURxeWppWXFjZWVQckh6aHR6OEkxME1IM0p0aGE0dXFHOEVsd0Rs?=
 =?utf-8?B?ZEd2cmhhQjdMRjN3UmJBUk1ONklxTGhDMmxucmpUTkpac3VBRGhUOHBDNU1S?=
 =?utf-8?B?ZEI0OHZ0eEFzd29rUUtzYW1WMElFVTNCK1J5TFFyT3BYZ2VRRUs3OVA3N0dP?=
 =?utf-8?B?Nk9BdWY2Q1dCQjR1VEVaaENjZ0FjU1FwL3VqVnZxdldrYTR1eW1kMmNzRTVX?=
 =?utf-8?B?YklEMGFWeUU1cVVWdTh5QUpEcXVlSU5aSmt3YXV3eTFGUWVMN2NBdFpKRUlU?=
 =?utf-8?B?Z1dGNi9RMlRKbFhDRnk1VXBFdW9jOXJmUkt2NGNTQ2szUDFxcDRGZVJvcEEw?=
 =?utf-8?B?WTlBYjIxdnlpL2dqN0Y4SjNpbnQyT2NIVnVxSG1aNGNrREZPak1wRDVWN2pC?=
 =?utf-8?B?ZU9sT0M1Sm5ocnBaR21lOENJU01oV1kvN2FuZS9oVW55TG5VWVFPaGNWUUgx?=
 =?utf-8?B?dFFIUUlQU0VrMSt2eS92NVU0L1FYaGZ5NUZ1bHVFNjRVSzk0ZGFIK0szNm81?=
 =?utf-8?B?bWdLODRhOTVnTlhJSlB2eGFnMldNSlE3SDFLM2hXaUE5RUtVd3kwYk03dWZp?=
 =?utf-8?B?UHdyMlRlNkhUL0dhbVpQeStDRXVsSndkT1llQXl2aU02QW1XT05WaUZnSUd3?=
 =?utf-8?B?OFNpdVA4a3ZZMGN1RUVtRDlqaEFMVDRpQStTRmxPeUlQYWlzM1h4YWRvSnFJ?=
 =?utf-8?B?em11a3dHYmdaWGhydyszTlNreWtrM2R3bTN2S3VDUkZ1dVh3RW9XZVNtcWJ6?=
 =?utf-8?B?ZzNQaW9iTG9sLzJIdVlVY041QVk5ZWNzVkJ0UytucXl2MmNXT3kvV2VJOG83?=
 =?utf-8?B?OVZ5OVRPc0ZvZmx1cEJKZHVybmd2N2tKN2lXcFpidTNTZzZrbUxBMnpSTk8v?=
 =?utf-8?B?UXVmdXYyanBnOG1UdFdxazYwb09oK1RKZGVaMnVTcmJ0aG1FU2ZuWVRZSEEz?=
 =?utf-8?B?eW9hTDJsZzEzUE1NUmt0TlNJUVU5MU0wbUlSYk4rUEViZ3ZJQ0pUWVNNZzhi?=
 =?utf-8?B?VlBMcXk3SzhNT29ib0FZNzhSOGdVQXBKbkJuSkJneVVYcEJGMHBCM1h3bTdW?=
 =?utf-8?B?TzQvYmhoNHN5aW5HWTVIK21MeHU3YjNZSUN5b3Vtamh1ZGcyNHBKOVFQWjIz?=
 =?utf-8?B?UDdkSDMxcE1sWkxWa09PTEN1MUJhdlE3elFzbHRuSkU3ZkE3OU5PQmJzRE9B?=
 =?utf-8?B?RnVjR21hbkpnTTlUTzFEM2ZHbmlQSjlzWjdIRnNEK3RrRk9zVWZVWWxKdGtR?=
 =?utf-8?B?NjZ4eWRIOURtVHNlRXh0dFp2YzAwc2JDTEY3UlYxenE3RTdBS1FDOTQ2Kzhj?=
 =?utf-8?B?cUZRdVdPQTAwSTZBcDE1eERqM1hFb0pHUUVkYU50dElPdHZQaTlpYVpaWU82?=
 =?utf-8?B?emU4RWEvNk1DeTBjNTUzbkR4VUp1Qk5JSnZ0NUpzZ3BMZ2lESmY1YWxyeDJ0?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 679a4915-2082-4ce0-3778-08dc8c223ac0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 03:29:42.5714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWhOV2ZlMQaMLDURTimEQC/3mIBKn++RR8HFzjw0SpYs/D5VCeXueARVxsZek+t89OeUm+CcrMYopwkkR8B6cYd+jY1ZCJ04vfJhYrOC6xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6183
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



On 14-06-2024 03:16, Rodrigo Vivi wrote:
> Apparently this was only useful when enabling ggtt support
> for the very first time and never used again.
> It is also not useful now that we have the ggtt_dump available
> through debugfs.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 20 --------------------
>   drivers/gpu/drm/xe/xe_ggtt.h |  1 -
>   2 files changed, 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ff91fd1b7c8..2d5e802f862d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -277,26 +277,6 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>   	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
>   }
>   
> -void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
> -{
> -	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
> -	u64 addr, scratch_pte;
> -
> -	scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0, pat_index);
> -
> -	printk("%sGlobal GTT:", prefix);
> -	for (addr = 0; addr < ggtt->size; addr += XE_PAGE_SIZE) {
> -		unsigned int i = addr / XE_PAGE_SIZE;
> -
> -		xe_tile_assert(ggtt->tile, addr <= U32_MAX);
> -		if (ggtt->gsm[i] == scratch_pte)
> -			continue;
> -
> -		printk("%s    ggtt[0x%08x] = 0x%016llx",
> -		       prefix, (u32)addr, ggtt->gsm[i]);
> -	}
> -}
> -
>   static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
>   			      const struct drm_mm_node *node, const char *description)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 4a41a1762358..ef86ad7a079b 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -13,7 +13,6 @@ struct drm_printer;
>   void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>   int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>   int xe_ggtt_init(struct xe_ggtt *ggtt);
> -void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);

LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct drm_mm_node *node);
>   void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node);
