Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592D9FED2E4
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C8D10E9D7;
	Thu, 12 Mar 2026 08:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRSm6ArW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0344010E9D7
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 08:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302944; x=1804838944;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GBV7Y6mNEE8CVAAhb5ZNSe7fh0bHiurgkTMAHctzxTA=;
 b=QRSm6ArWEPRa82IHa3HuhqfwV6kqiY1wWQJ5lIh3do1lQ2we4ROlFkR2
 xBKWsZUzt1MlsZQXYx3yR3EJesdeBlHSdaJK35BFJ1e0Z8PSlLf37GyAE
 5TRFKvOwIyi/VnGC3VbHJAWlD4q93ZatGp2PlLH7s5KL9eYzCgNdnT1+c
 RjW4XcimS7zWPU0AzOYBfPRZyZxLrI6mWPkNjzYcRNEwEp806aFH5MhQe
 5TRMQbCe+vF+49S9NOBlAVMWLJTMDXcmaXYueUspL4cXAlEWkBNEa/LbX
 dKaYKfdelDXyS8LRFAV1aGLp3MsLMRJHJ+dkx1V+vKBMM2Buv4szJo9tD g==;
X-CSE-ConnectionGUID: 6zVCP39GRJGaOgENJuRHtQ==
X-CSE-MsgGUID: qfEiNpU2Qji/SdaCL7NgAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85861606"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85861606"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:09:04 -0700
X-CSE-ConnectionGUID: jgedmF6CT+meQ1OI4S5EIQ==
X-CSE-MsgGUID: BhHjfK46RtyCpNHgHfQgmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="243765620"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:09:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 01:09:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 01:09:02 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 01:09:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qfsj7M/IWhQ4p5dwi6/U3uC+Twofm+2B0YrP4N3AOoju7vf+MipmPLuLfw6yWddQP2LjtRyYtKANHljAy688SM4YuOTuWyNbCUm6Tm2fRRr2dyJPieZDlVZzHGjy/6PbQeIw7jHZR8yIaQxDQaMy4PNcKZzys2tnrrouxKfxS7fXCcl2TlS3SbJFJeCu61ShUUEbkTcvKBXKLP2zkNHIAMpyrCUQbydbFO3dryGWjAYHbTt4VICi8Z61YWmyjAyvurHH8Rv2Uij3+Qpa1hcEFdZprZ6NjniWKTZd0uoAMptuCFpObvP0/QfI2aYUFuVgxVpo5d4Ni13sjmAJ9y4hhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEyILDcZh+MfmTZxAN51u4N1Mt0ImomkEDRsEiDckkc=;
 b=X4Ox8DKWTtlQsjjV0dkYSNNERie9OpM08ataf2vGh0LMDMvUjE5KTkPvtsekoGIeSkRQtiqpKE/W7zcPYc196gUlpkLYi9a+EmfZhu9K7LirzcEJwaXEhllDGlIGmwxmaT0gC6GZJ8PzBhlNmgfOoufyGHuI6hm3MVU3FbOkcA4L+sEQsYEtUofXVYNan07u8ycLyE93pujUir/YRX5Nso988Mxn8Nb/g+dwEDQ8dnHzcYT9IHB8hh8zxKhsp7LXIfmiykr0queL8G6URfIC5AiMuT7UT7Hm8VhGgCFh+WobBPlkmdVKjcfwiKXqpe5f3bEBYuHfCp9xQlV3HD6mRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 08:08:57 +0000
Received: from CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671]) by CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671%3]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 08:08:57 +0000
Message-ID: <b0f2b557-f713-427c-b1e6-66bde00ff489@intel.com>
Date: Thu, 12 Mar 2026 13:38:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] drm/xe/xe_pci_error: Process errors in
 mmio_enabled
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-24-riana.tauro@intel.com>
 <b308163f-a203-4cc4-b558-1de58fb1251c@intel.com>
 <4fee6a95-1101-404a-909d-7f3654a8b129@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <4fee6a95-1101-404a-909d-7f3654a8b129@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0060.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::9) To CY5PR11MB6209.namprd11.prod.outlook.com
 (2603:10b6:930:27::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6209:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: b319b239-ad61-4472-5e5c-08de800e9c2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: eU9k/+jBsQX1Qa4mYfMAK2fYdATVhpNQtbepC0Vm4HNSuHTwlM4AiIGeGqXtbWwz56XswArV4Y/oqjsY+VpdUK00+KTdQogYPw304+bBHl64aC4TdugcKrRhOXnoEAKpXKb4GYJod+JbnXMopKGGrA1+IVpjXzP364Fj6cS5UH/J1o0vcYQz2ACGqNGw3HVlRfHeACtZYSMfSw/ja4LN8SCrExYjQ7GcK4ixm0tV8QZtC0FUc05J16cqsw+do6khA8q0rhzsj6xaxyxLw5hNh2PxwzNg2HMiecmv3K2/W/EkCUKK2xXR5dHCcKOAt40GSB9z4Cp7DntFe28oiZAjtz/v5FmcEKkSNI0WBe99xvd6EmOyZcbomiMQS5TSgItRIoPthMWwhOQFr6fScf0cXOJuNcxRZCQ6qSRFcJMvASRH+gid+kCv76SfQQBa94Srk2Kcc1JC78OcCv/1gXWW3ioqcHRZlxwUELeK6JvtCU+iSEa3sTAZmEDo0q23xZ5q5D90mPt6XCf6cetscReTVeutxiwIjx4c6fphKfjTuHJ2K6Au0wQJ5QcD2WCWdqstqeGigmq7+A18H8SfbBuQeZk976uYKJkqFtKgdYPM2YijrdCY8LKLAus2bC5XuOX7zrMII9DCSVcCmrOSfKO9WbKKVlLL1cIbzVxQCCjEkxShi4ZdLelO4LpiRi0VmbTV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6209.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHNtcGtkUG16UlN0NFNDQ0xwY1JkVWE3MXFUZENOVHpUTk9ib1RBRUNOR2hV?=
 =?utf-8?B?Tm00K2QxZlZYSHZjbGVLWlV6SE9MN2o4Tk5zdWtLWjJab0NPekhPYVpjTTl6?=
 =?utf-8?B?MTl0UG1xOTg5dG96YW85bDZ0a2p5bXRlYTB4ZHlOM2dzMUY4SHJhUXgybGNk?=
 =?utf-8?B?ZFRRUGtYUnBFNFNFd0p5YnZIcmRRakhGUFFOeW52UDVaUG84dGRqRmRjdHky?=
 =?utf-8?B?TUdWWWRnRzYzYjV0bWpmM1p0WFkxYnlXZVVFR01tdm1xaHJtM3cwTVVaeEx4?=
 =?utf-8?B?dS9xbG9EUTF2VFhvWnhyMExEdml3U01RRnU2L2hiQ0dqWExseTJJY1BsV3li?=
 =?utf-8?B?UWRVQ3hsZC84YUNaUFZ4MXRkcWhwc2lhNHlmQlhPUFc0NDEweHpRaTFqZGRE?=
 =?utf-8?B?NlZqSVVoVDFxZHNsQXEzNHdXWkNaT3RqNVg2NlJJSXJsbGR4VDd2aXpjSUds?=
 =?utf-8?B?MWpKNndGdnhweU5JUEJQTm5sT3VLeS94TFRDTmNmc0U1elBJei9kcmFmcWJl?=
 =?utf-8?B?b2UvcldyWEQ5RzFuYkJuRzZQTTNzM3BqanZseVVmc2NJTWRsMXJQSEpZQ3VN?=
 =?utf-8?B?Zk5ucTV4MldCTkpXM2lLelh5R0RNTE9XRHRrdDlvZmR5bThBcUxvS3NidkZv?=
 =?utf-8?B?akFUS1Z1WkU1aitWRmJDazFyKytDbnhMWnlrVEhWb0o1UjNCMURxRnFzNHNH?=
 =?utf-8?B?V1l5RXNwZVlyWTFCdFBxMTFBMzg0OWNvQ05aM2hWb3hCQ05pZUVLYVQwOW4y?=
 =?utf-8?B?Rkw5Mm9FRVpic293YlVFM1VWWWZiQXpTa0xHNUV3b28zaU14a1QwRnZza256?=
 =?utf-8?B?VFhha2dZUy9PQ2o3VkFPTkNCNTFEUmI2OXJNNGNiOVgzbXFYa3V3STc3NUlk?=
 =?utf-8?B?N284VnczR3VLM2VqTHpLNmgxUlVRNzh4aWJibVBqeUsrRlR0SDFwaUxvdHND?=
 =?utf-8?B?eGhYVDhGMG96WGJ3aWMzWEpoZEZKelQybVNmUU5Ed2pXZkZoMHhUeFZHeHJt?=
 =?utf-8?B?cTYzbkdKNk5rc1BaVzhPU3grd3N2UE1kUjVJOHJkTlhkc2ZsZytBenB4Y3Nv?=
 =?utf-8?B?NTM2RDc1UGZmbTZod29qVzJUYUdaU3NDOUptaUpRWDhMSjVvT3o0d0JSbVFo?=
 =?utf-8?B?V251L2JIYkxGSFg1S0FHdlJHczEyRkFxTjJHYkxadndFNUNXbHpaYStKOWZr?=
 =?utf-8?B?d0lhWXdOemRibkE5VEc3U1VKNUdPalBJSVVyeVBqd1pleSs5NkVPaXJiUCtW?=
 =?utf-8?B?QVA1R2JLWnF2Q2xSMEZiUXJtOEtQZHdZZDgweXhnd21wa25UckNmRkhkOXB3?=
 =?utf-8?B?V0RFMlFtTDZkMUdDemR4bkF2ZkwzZHJGUlFiZkIxdURKeVB2Vk05OUJpOXQ2?=
 =?utf-8?B?VlFENWZ2TnAyMDdXaUVKeGpod3hJdWtKS1VNcklCa25aZWhGSS9kRGw1TURU?=
 =?utf-8?B?VFMzZzcxTEptMDMxSk93M2Y1ay91QjdUQVh4YkxDc2FYUUhTdXBtQUtCcVk1?=
 =?utf-8?B?ekhyamZwNXVHZUxhWklURnhkU3QzcGNkT3lzMkhmSmFwMGlNTTVNYkw4L0xi?=
 =?utf-8?B?STJld09QTUtZY2RzdkJiNm05SjZlemVWOUZBM1N5QTI0ZTh3VXRlWTdMaTRi?=
 =?utf-8?B?RWV5bGxVL2pia0hhQ1Ivc3ZqSnBPUU9IQm9ZYndLWFFiYWtzSFFyTkJYajNx?=
 =?utf-8?B?M3hYN3pJT2pONTlOZzlEYlUxSWRRZUt2UjlJY2ltU3M2R2hHN21HVHNObTJq?=
 =?utf-8?B?c1hNcjl5dlQvNU5pRkVLQkFJZzM2dXZ5bWtpUDErcHIwY21FTGVDRm1vMWQv?=
 =?utf-8?B?TTZOL2oyNHQ2dnJGR1IyZlVHTE9CSDBQY3RTdXYzbHQvcnpzYW1raHlBWWZz?=
 =?utf-8?B?VUVhVjBxUC9ORUZENjNJK1E5clk5MXZsd3ZlbXVmSWt2eW1MUkp1NnBSWFJj?=
 =?utf-8?B?UkNnM3J6TTJtTDVMMy9NMUpaWUk1VnVaNy80d0h6VDdQcGlBd0dFeXlFTm1l?=
 =?utf-8?B?ek8rOUpKR2hZYTUvYklMdU0wRGROcHZHVXpzUGE3N01aWERPVjJLb0k0bG5K?=
 =?utf-8?B?K04ybkZpbS9GODMzMXdaWkxKazgralRVaUM3K2pzUkpWM2ZwT2xiRjRnalRU?=
 =?utf-8?B?MTJoZWgrYVYrY3FMaFREZHQremZqMjR0U0dsNmlFbENLc0lpKzI1dG1tTzJY?=
 =?utf-8?B?ZXErTWxoWjFMQ0tqK3daT3hmd1UxTjhjYlJjVURHekVid1lvUjhYT0h3TFE2?=
 =?utf-8?B?cnppbXpUY1pMazUzVXBOYk5ZWG0ybnhyaWtTUER6amRMZXBjTVZabmo1bnlt?=
 =?utf-8?B?NEpsL1lsSlpoU05sVk1XVmVkSVpiVmtoMndLSmtBUGpxdkxUU05LYnZuV3ZI?=
 =?utf-8?Q?Wjp4W0X5I4ZVxVmQ=3D?=
X-Exchange-RoutingPolicyChecked: M7yDqp4p0RLXKxE2dncYjCUa59IPulXVmzhKpTX83SL8KpqV+EcfUV0owOdb6bT/o+WhvMbYsHdZmS6vhccRd3xYxdeJeS9EW7SlqCrMZp7TJDxUGCQ0W9jJmKkZXqksjB6FhTLXQspjQgisZ7xWDQsVVKZGodwVBFtVc6eRQnlody0pdalts/4XE6H9V89TjZOJXmahscdl7boHMxqlHcAv5crwcqY/Oqa6csA2jDNKFM5gqyFXn9ZySuFlVxrCAJpoFOp6EyukmiiHBEc6EHPgSpQ7X1YPL5H4E5KfZNMbQkx/B+YETkGPmZF8p3wTNSmy53cP+B2LQln62u1eSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b319b239-ad61-4472-5e5c-08de800e9c2e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6209.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:08:57.5614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1Lc/v+fHUuBjBtcqiyi9FsUj6vG5ljjsdj9H6uFJeEObgy1EDMJDt8z3zth3X88ZttsbkP8TcWoMoV75j5qLw/pCC8e+SNXFRXdjXYG3DA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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


On 11-03-2026 08:09 pm, Riana Tauro wrote:
> Hi Mallesh
>
> On 3/11/2026 12:40 PM, Mallesh, Koujalagi wrote:
>>
>> On 02-03-2026 03:52 pm, Riana Tauro wrote:
>>> Query system controller when any non fatal error occurs to check
>>> the type of the error, contain and recover.
>>>
>>> The system controller is queried in the mmio_enabled callback.
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>> v2: use ras recovery enum (Raag)
>>> ---
>>>   drivers/gpu/drm/xe/xe_pci_error.c | 13 ++++++++++++-
>>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/ 
>>> xe_pci_error.c
>>> index ba62868f00d4..35bc5b8cee99 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>>> @@ -9,6 +9,7 @@
>>>   #include "xe_device.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_pci.h"
>>> +#include "xe_ras.h"
>>>   #include "xe_uc.h"
>>>   static void xe_pci_error_handling(struct pci_dev *pdev)
>>> @@ -26,6 +27,12 @@ static void xe_pci_error_handling(struct pci_dev 
>>> *pdev)
>>>       pci_disable_device(pdev);
>>>   }
>> Explain the mapping rationale
>
> Do you mean commit message?
> In the code the naming is self explanatory

Not commit message. Add  a brief code comments 
(ras_recovery_action_to_pci_result) about map RAS recovery action to PCI 
AER results.

For example DISCONNECT: Require system intervention (FW update, cold reset)

Since we called PCI DISCONNECT when CSC Firmware errors that need a 
flash update.

Thanks

-/Mallesh

>
>>> +static pci_ers_result_t ras_recovery_action_to_pci_result[] = {
>> The mapping array should be constant, never modified.
>>> +    [XE_RAS_RECOVERY_ACTION_RECOVERED] = PCI_ERS_RESULT_RECOVERED,
>>> +    [XE_RAS_RECOVERY_ACTION_RESET] = PCI_ERS_RESULT_NEED_RESET,
>>> +    [XE_RAS_RECOVERY_ACTION_DISCONNECT] = PCI_ERS_RESULT_DISCONNECT,
>>> +};
>>> +
>>>   static pci_ers_result_t xe_pci_error_detected(struct pci_dev 
>>> *pdev, pci_channel_state_t state)
>>>   {
>>>       struct xe_device *xe = pdev_to_xe_device(pdev);
>>> @@ -50,9 +57,13 @@ static pci_ers_result_t 
>>> xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>>>   static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev 
>>> *pdev)
>>>   {
>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +    enum xe_ras_recovery_action action;
>> Add action_max @ end of enum to validate.
>
> Answered below, but for consistency i can add max
>
>>> +
>>>       dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
>>> +    action = xe_ras_process_errors(xe);
>> What will happen, if RAS processing takes significant time?
>
> System controller times out after a duration. Refer patch
> https://patchwork.freedesktop.org/patch/710637/?series=159554&rev=10
>
> If the ret is negative in process_errors
>
> +        ret = xe_sysctrl_send_command(xe, &command, &rlen);
> +        if (ret || !rlen) {
> +            xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> +            goto err;
> +        }
> +
>
> We request for a reset assuming a SC error.
>
>
>>> -    return PCI_ERS_RESULT_NEED_RESET;
>>
>> Use array bound check before using action to avoid out of bounds 
>> array access
>
> The action here comes from a xe_ras_process_errors which also returns
> enum. This action is explicitly sent and is not coming from user
> or firmware.
>
> Adding a check here seems unnecessary.
>
> Thanks
> Riana
>
>>
>> Thanks,
>>
>> -/Mallesh
>>
>>> +    return ras_recovery_action_to_pci_result[action];
>>>   }
>>>   static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>
