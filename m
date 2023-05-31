Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095BDC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 21:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ACC89220;
	Wed, 31 May 2023 21:38:30 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F53789125
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 21:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685569109; x=1717105109;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=EKJ1dGgnMlBRn2To3G5N1Kmv8Qkl8yfjZJV2E1LnRE0=;
 b=oHzbiKosIwDYQ1IIPh2FWHxwErx02IKGygBPG9WY745q6+Woga2esAXH
 Glt4VPQJMiu4PrjK9/+ZNyhiznR7QF6rGEJQag6z+5uFEyXsIT6tC9FVP
 3zyTOFdIca4YG+sizlU+Ely61AuWUWh+tV2KBDPRRRXCJIChcYFOFc4G2
 01h/NUM2aYvnpiumnZwPKrJfe+pdSnh4Av9yT9ZiMxHKF6G1zQj5PQJog
 9zLrMvd94CErHgDJNC+jc4bkleR/F9ad7f4m6mbHwjemIMT0G6yMeKjaL
 cyabEpU8UOkG7+/xqfC9SjAXBWAuHlYcKNfyoMtes6hOwvKI5TJkvg0GH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="352874240"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="352874240"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 14:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657513412"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657513412"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 31 May 2023 14:38:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 14:38:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 14:38:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 14:38:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 14:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HelqWIKmz/CnyAlTZVsWR2r6ZRHkDxNgL4FFBaXmyM9dCqNfFNKQ/WAUs6KGPOmxQI6+reHZ+ODVAs12npw/GLQagqbJE4sqxtHRbJg0DKHBGVhqLHHKRIikxXHZVVteHBRV10Q+LKQN3DOwtkecPr1BKAIJkSOGPA5aa9Q8j6Qjkt5uZrYwGVg0fG5BQGNdayylJd/DZ9sWpk0LaPvkreq6y9X0KqCA2qKybCdCw/dK8tPdl5xvoBvWCPGreySgJKtcp618vIsLnL7purC+liCYDOTw8VkYN8zoHNTh1xJ+mg3BVrHzO/JUSLsrhQ57dw5X5W697VCildEh66AkOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hreu0HrdEh0pfLErnC4Bk1pmw79jhuMRz/UG20nyCWk=;
 b=WiKpSMF0BWB7ExahbosQmROYTwEZVAPfcso9oPRDY5WUEwwVfB4W5Mm/STEud/QyqFE0/W0FLRwss+IgNc/Tt0j8FUXCNEXcMpHvRI/AEFQryCYx6hmTKI9FLRlRDuENPKv4E0TQcfGhVU8ExMZsXG2Lbbd3WOTmoRpHzMjXIzqGzVm/+uRo6E60OddgHECGdAApQTtvhhuwkUVigo2E9X9NAbESwg+CP00LMatAVvX8B736IdF54siyOvVVKLpPNDUNL+Dat9aXjgn9Iizc/D6G1bL9XsNJNcnm4Tdr3ufnHAKexTlFDfS7vyqu0avlu5hPYb4fhYnlywRWqshM9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ2PR11MB8422.namprd11.prod.outlook.com (2603:10b6:a03:542::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Wed, 31 May
 2023 21:38:25 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 21:38:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <168556108480.1068887.9605005606411033865@gjsousa-mobl2>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
 <20230530211549.2632538-11-matthew.d.roper@intel.com>
 <168556108480.1068887.9605005606411033865@gjsousa-mobl2>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 31 May 2023 18:38:20 -0300
Message-ID: <168556910044.1068887.9107002097746802159@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY3PR10CA0018.namprd10.prod.outlook.com
 (2603:10b6:a03:255::23) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ2PR11MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: c0025640-8cbe-40c9-a433-08db621f5d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ICSwA+Chy2aMytAguN+z1J6X6iCRFKf7VYNLXKlf6N7Apdd0Jbt70OOjxEKbM0KT/c0l74bGQ3W3HF6fCdKFXcK2MpkATszJI3SNof4iojyt0Fl3yaLOhKkraRt12SDZ0sPKED33C4y4C+6axsHMHUFpHod2Sdy59bNwertUiFrO+PK6eQJxjLD1vveU34ymCxMisfYVxtnbzEk6jsVohBfN0Pi0xFmPfjogfH53DhWBuHAGWMl4zhCackOgixFg4K2HTt3/ia7sYB5AFZKaLSPDj6KKNVp/fehmmimYgjKssOAm2xHpyWkWMNdeAGQSbRuS39AGtY7OVhCMDUXancwPUTGM+pwovdnareTF2EV6o4+aUYvcOWvSUbapJgSB9LLjHRXpcgq+KyENdTh4/ceVYQ2FrVW9mrXSTVe8hazo0/G95Lc02FJVlvo9klBG6vursN/Usuj7NbOx0CLTkH5TIYBkINVl1bw0ymZAZnqKNQ6jo7bdL5hFEjXg3EsP6JJilxVs+aZR6vRbbXlmfiQZh/zFIeQMXAEuS/SMrspQXHCCvlaXIz/woNoGwXfq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(83380400001)(86362001)(66946007)(6666004)(316002)(66476007)(5660300002)(4326008)(66556008)(107886003)(6486002)(38100700002)(82960400001)(41300700001)(8676002)(33716001)(8936002)(2906002)(4744005)(6512007)(6506007)(9686003)(186003)(44832011)(478600001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnJSWExtVFdqS1N1WEN2bnZIRkJVRHhtZzRuQ0tIaHpkR2phZUxHN09vd205?=
 =?utf-8?B?Ukp6ZGFXbEZhQ1A2YUFnbHVtbGsyeTZTNVora0JwYW5oSXdnd0FES0dmMUYz?=
 =?utf-8?B?Y2xLLzN5dm9ydXZ5a0hGRFJPZDZQUnphWkhJTFN5MWoxUGxwWWRUQTk4LzVV?=
 =?utf-8?B?NFBpRnJNZTFHUmxlZVN4WVNMZ2JuVFp2YXIwZUpoNGRZS0VVUm9LV0VCRGVw?=
 =?utf-8?B?RGgwSUxGRnRFVEtJVGZ3RmFpaVRBam5SYmt5STgyem9QTFNNM2lPQklCOUU2?=
 =?utf-8?B?OVBBcGk4ckluTFRmdHREeWZYald6LzNGQVdFT3hZZlFZeVk5MXdKQ1pWZ3pX?=
 =?utf-8?B?Q0pTU0JIZmlpQmtqRDlUQzVvYWNocGpuTmduZXQ4a3FEOCs1Ry8wYmNzcUw3?=
 =?utf-8?B?SCtHUmY1eVBNNEYvWXluRHQxS3lXYjdoS29KeWN4ZVM3U0dxUVNaak1ydWl2?=
 =?utf-8?B?MENzVWdUZGFoYVZtVklpcDlPSzJueUJ2OThIWUxHR2Uva0VyMjgveFkxaU55?=
 =?utf-8?B?SzMySVB3dVRBWnBMMktkNFJsNW5Gd21JcysrWkFQVGNSNTlrRVBuKzZ2bnhk?=
 =?utf-8?B?d29sbXd1NXRSUFpoNmJ5RmJHTE1RVVo5R3poUDlsMnFsWllJenNGOG05VnNv?=
 =?utf-8?B?UHFLTGxTM1ozZzNEcmRsVUIrdkM4aWZtVTZRNmpFdFp4d09NOVRtYktvdkJi?=
 =?utf-8?B?T3RLRWFBanJxS0J3aWl5eVZMM3ZkMThZZWE0dytYRUc4WEROZmZWeDFjaWhP?=
 =?utf-8?B?SUNnRUl3MWVSaU8xNlJDdGNYVng5eU4zT1FEK1dmZlVUMXB3L1U4b3IweXUx?=
 =?utf-8?B?cG5xaUZ4cWNMZWJjUjJCL3lkb1pwbjAyZmpjQm55WWZubkI4UmpwWFd5NmFI?=
 =?utf-8?B?RiszRHd1a0treStpenBLMzJyQ3Y5SGR4azNqTkpGQTZCUlMyZkN0UzVkWGwv?=
 =?utf-8?B?a3lzUXdUVHFSQWFLNDJxV1luZVdQb3dSWnJIcVZYanh0OFRBQUFjdGo1dGtD?=
 =?utf-8?B?azRSTUVIZTlidUxvUUpOSlJyc0cxUWx5Q1gvNjN2d2sxY1piREhXSzh1a2hr?=
 =?utf-8?B?VWU1bTd4L2VIWWgwbHQ2MHRPcVZ0UHl2NllRWU0wMFhBUXlnNUEyTmlRRHl0?=
 =?utf-8?B?MGU3TnFQRnovKytNenAyTFo0eGxTa3UrYnZqWnBEbWUvWnpPWEY5Y29DL0k4?=
 =?utf-8?B?YUkzMnIzUllLLzZNMmRrYnhidzgrbHdaemJiY1JGZXgxREM4MkxmeGZ1UVQ1?=
 =?utf-8?B?b3dCUGNyY0RlU1djWnoxMWd5UUkrZ3AwQzNxbDg4ZW8yemQ1Tko0RzdrUjNX?=
 =?utf-8?B?YmliL0txcHhUWGlSUFdsc3NhUWllUyt6ai9RMjBxbTdRcGtJOW04NTRiNmJE?=
 =?utf-8?B?WjVHbmZPWE5CaGJyTWI3aHNIYkVreUNhcGtUbndEQ21hSXp6MTZNTXhHUkN1?=
 =?utf-8?B?dWtBZW1EbGg3N0NnYmVxby9sUmZ1czlIQ3hIc3VoeE1mREtDL0lLc2VYUkNE?=
 =?utf-8?B?MjNoUWJvK0JnRThwVWtBZkdKZC9YaUVQWnFQVHZ4b2JieFdMS3R6akNEeU5H?=
 =?utf-8?B?LzJHdmRBeGFJVUZCVlVyY3BBL3ZyOVJFZndMcldSc0ZlNjBDUzNNb1Jyd3NS?=
 =?utf-8?B?SFFTeWpJSzNZcWpEM1I5NGRjWFhUbWdWeXpDeEtxdWtkeEZSMFNEaE9xTW56?=
 =?utf-8?B?enFRV1Q1UTYrdDAzYWhhZ1p6c3RCZzcvaW0rWkVoOFprbVNjZHo0eTd4RzI0?=
 =?utf-8?B?U0RDTUFyRXhDR2tna3VPZ2p6emNGamk0S1NBUVAzVUIwU2ljb3hkZGF5akh6?=
 =?utf-8?B?ODA4R0wvVjE3QzlZRWljMHlmdng0UlNWZ0t2Q3hBcmc3WDZsZXRjaXBJQncw?=
 =?utf-8?B?OFM4aHk0WUhSRUQ0dWg0MUp0MllFVVhBQXB1WFBISmRFQzZOMGRMdSsyVldM?=
 =?utf-8?B?ZlpRWlNSSkYrUXhPYVRFcHkrREI0ZjVRb3pWVkJKdDRtQVYvOGZDSzA4RVN0?=
 =?utf-8?B?RUxxNGtMa1V5U2lQV0h4U2Y2VFVHLy85M3dHMmdXcFFyYkFVMVJOREtzMWla?=
 =?utf-8?B?WTNPYnVKcVhIV0VyQ1lXMDlqa0dIZ0trekJPWE0yeVUrK2lxTlhBaUhVSkts?=
 =?utf-8?B?VXYwdGtLTHhXdnF1RmVzZ3R4WE5FSFFFZ2l5Zmdkb3h6cEpJM3BWeCtFN2ll?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0025640-8cbe-40c9-a433-08db621f5d49
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 21:38:25.3614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8xby4q7wFqczxNj2iu4tFEBCjhz6jpcfJXd4B+FfLXCO0+mrlIZl4vb8NvnZ+Y0l7wqltNtxy7BjqE18wiRDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8422
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 10/31] drm/xe: Move VRAM from GT to tile
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
Cc: matthew.d.roper@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Gustavo Sousa (2023-05-31 16:24:44-03:00)
> (...)
>=20
>>-static s64 detect_bar2_dgfx(struct xe_gt *gt, struct xe_ttm_stolen_mgr *=
mgr)
>>+static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_m=
gr *mgr)
>> {
>>-        struct pci_dev *pdev =3D to_pci_dev(gt_to_xe(gt)->drm.dev);
>>+        struct xe_tile *tile =3D xe_device_get_root_tile(xe);
>>+        struct xe_gt *mmio =3D &tile->primary_gt;
>
>Was naming this variable "mmio" intentional here?

Ah okay, I got the intention after reading the explanation in "drm/xe:
Interrupts are delivered per-tile, not per-GT".

--
Gustavo Sousa
