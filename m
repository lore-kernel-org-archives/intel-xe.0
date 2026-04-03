Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB5ED6AAFA
	for <intel-xe@archiver.kernel.org>; Fri,  3 Apr 2026 02:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E57D10E081;
	Fri,  3 Apr 2026 02:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/hbBaxc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33FF10E081
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Apr 2026 02:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775181983; x=1806717983;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p0Eurj4p6I0f9ECefD6klnXUKi7NIrEqbMPiv6W17vk=;
 b=Y/hbBaxcasC6ya6pW15Fu8q4PlTHu2kjYQu2pKqTxN9STNXoQWUhH5B7
 ayAyEalCBpNY4SHqGJe6ArVfYJUs3eadeCS3O5PLktHHM2X2EnoEuQHir
 sbSADsPvhK4ZaW1DqeACYVGc3Ddvjjgr8qq/qU+DONBjD59nN/bcBniNr
 UREa24C9OiteraS+LSsYbJsIv9OK1vDA5qhZwgoj6pi0sfrfSbdZlMA23
 6TL4es7+EBhpN313mwQb+7R4gyf5IpU6LwasKeHjxU9/uDfrlffAJq3KX
 xpICiLkdlgLHJEhjObl0tda9p6v8x77AbSz3cnUNiktOtlR3NBXu0X5/T w==;
X-CSE-ConnectionGUID: LRq1tfBTTRiv9evdG25/Lw==
X-CSE-MsgGUID: 0yjr4sROS1KoVaria0tUsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76141535"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76141535"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 19:06:22 -0700
X-CSE-ConnectionGUID: NyVadHv3RrGnoa3lVqGcVg==
X-CSE-MsgGUID: fbMw0p92RIybLXQUnfB53Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="265070702"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 19:06:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 19:06:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 19:06:21 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 19:06:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dU4hw+B/D0z1uAbqPdahU20odTSE+ViVGTO8o9RX50B1ppaYZis/hWC0A+p2ujYaA1WmDkYKymg7gNcHgmj3TPe1bm6G+1tZsPz+qU0dLIINVL/60n4L1fEjlknXLETmg6MH4bfGMIrG9RfN1aNrU3KmQpP1qoXqw0pCJ7I9mNOawO2Zl8RP+ESHyTqvmExpTR175X6rLMAIwyt4iCNnSUOIsTwHv4+YcNaQktggrBtPRaorYzwsV1PcwdGu1sFN1aWXae8V1T9gFXE9rQzlwSa17GEBYsezHrT/YEr6Mfk35PZJF/zU2eKOf9J5UzvIWOI6iTEVuc7OZ/BoyJxE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFKSip45LXZyCxGPXL3EZumnPjLLKJlYfyyB5DcLrNs=;
 b=FRXkSD3HSRUtpx6hkd4cUQu+AKO3WERpfu+NrwGRxO5H/WZEZ/fwyBmR/8zCH+bMavhuGN0sgA6/1Y+yhAX0FNmsYyY8isM2ElvxDUBBC0yYHvvek3JTKGxB846nfmAcwx9+Bd4sSmu+nHpKURSnK6wS7fPf8/NigQ4tEEqg4dQ7/pZhhQmhqZbn/E1xAr5r+vvC8fBvDFf8A3z13zoua4vPUJXyq0aCxK5NfSZgBUIpN4vnqSJcs76Lq+w5o/QnhfsTXokdvSg5+8JWCQiL+bFbk9I2k9FQ/mp0IhyiB+fhwqMN8l27wlPDep2EG52nDqf7z08mtypcVP6BxM6cdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 3 Apr
 2026 02:06:15 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 02:06:15 +0000
Date: Thu, 2 Apr 2026 19:06:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 05/15] drm/xe: Implement xe_access_counter_handler
Message-ID: <ac8gk1MaTl64ttbS@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-6-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318074456.2839499-6-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:303:b7::8) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: a370acad-c522-4f4a-abd3-08de9125963b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: xnlnHzJITHWiX//rG97WcsFYBNzmFsnbW3BDJJuDzE8WhTUq4NH4EQRw31DS8baKYlMQS0VpJslkW0ZYeGmcoGm3ZH1k0qMelLEVT2EwC+A3KOw9tyJ4U1GG8tr4djCrBNK841OpXEPA37d/dcuRqA8HFDVueZdjF2LEGSlgtDGGGMTNqlrA1e79hQT2JnNxCGK/DCSoGpzH2+KFRRdFgv8kOr/VyLJuuMfwDm+cZSEchEKCXAL1Nbd74p4ccIMCE2F7Hg7J+pHq5ayAgPaPWMUcVftuFin9xKum0dv5EoRXhjo7Z9uEZvmd7an1umY4nIfNQI2CvZpBDvSB9iSkdxHaJuS0TzO33zYRFHP6T3g8fCBbO6KtywjTYOncIjCRsdtzPYqxzjeNukGLHO4kmMelPY9pVhq50dukgxl0iY0thcGvyCxMzWidFGFPpxPR9PVS1W8q+ME9RfRUBgQYBCS/dW7B4XzJ1X7pQPnH8THUj8w46Hw3PeFXJhPkE7eeL2zn+CNGjloYPCUncqvrMGQzwEsM/Iomk2Mrsi6dRfITOXkyGaqKNj2QBBOk7Bu+RvufJkSPZzVelP05VzCwknkeIx2/m6z0LSxcupZhY7ffqE8AoLu5iCnfOOrJk1bfNz9GLi+V0x/bsTEeNvXJVjCEEKi6DZ3+bpMB25Ku7wjXFw8hj/gW0HEmYGJmHctg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHdvSG04YkpqWVlWYzNRUFIwTDVwU3NuLzl5QVNqbzhvaWt0UjlXTTVNcmdm?=
 =?utf-8?B?Y3dWcTFEUHJGMzdoSWxxcXFYQVU2QmczRU8ydFpNZjhQczh2a2VDZlcwTW1y?=
 =?utf-8?B?c2tiUDR5YS9yc0RBTzlldjFySnBiUGF4WUc4clBNVDdEZEVCeDlnbWdWZmhi?=
 =?utf-8?B?bGhqMFAvb3pIVUdvK1h2NlZBTFFtTmJ2MDhleUtUQ2lqN1lLUlFxdmFHMEhI?=
 =?utf-8?B?NHh5TktoUmYrbzZFYmJaOUVtRjM4dGErQlBkQjhuYzBwRkpPcjAveHYxbVgv?=
 =?utf-8?B?dEtwem02aC9ITkkwK1l0T0RDTFBXeVZWVGcxZ3IwWERQYlFCSDNwVDJnRElk?=
 =?utf-8?B?c2RpWkQwdE9FOElzZFdKdklTZHFwWGU2TzhYMldsQ1hSbGkrdDhBRG9vTW05?=
 =?utf-8?B?bVVsMDJoYVVEb1ZsUlFIS2hKZi9SbDBqZDBSbTdndnNVdkw0bnRvMkc3OC9n?=
 =?utf-8?B?dmNkbzNHRFpIVFlJd2VxWG9CcnN4V1Vxd2ZHdk5NV05meVExNmNXa05ubjIw?=
 =?utf-8?B?WG5KQ3EzMlppYzYwMGVocW03ZVNzZm9yYTNmQlV3b2FBRkNRRWlsTko1N1VK?=
 =?utf-8?B?WlBGYmRuQmcwb2hJVmkrSFdpaUpUNFVlNzR2WkFtUUN1TDdhYWZ2S1NBTHBs?=
 =?utf-8?B?NFBRYzVXdmRDMkVsa05jcUN6NDhVUVk2b0xFMG56NGxrUUNSY3pqc0Z6Q25t?=
 =?utf-8?B?N0VtR29WdUlOVWdkVU5zZVE0bVpNUjVpNHNLaFptUEd2T3duL0dVM1F1NzZy?=
 =?utf-8?B?S241TW9aLzg0bjFpNGdWdWgrbkthNHRyYjhnNTA2aEFraTZBWWJvODFhRUlP?=
 =?utf-8?B?WEIrZnZTdnFlQXJxWDhUMVRBbllnZHhuN1Z2aCtlS1ZHTUVqZXBTL3pVb216?=
 =?utf-8?B?WU51czJIT3prRldXTXlrSytVUHJ3VE1xVWNOMmNoYlZSZzI2WGZ5VmpTdlYx?=
 =?utf-8?B?WnRWd0cwZUU0YkcwTGszSkkxck90VnRNdnB1cncxMDh5RDFjNVlNbEtFNUpB?=
 =?utf-8?B?Z2lEWmx2ZWFhNUQzdHE4V2xzc1ZiYWZvMU15NldCYld6N1NGalFkSytuMnZh?=
 =?utf-8?B?d3cvRFZaaGp0TzBEMXRhY2pEbVY3TWpuUWRQUWRDaHFkVGo5emxBRjQ1am9l?=
 =?utf-8?B?R2J3SnljVzdzbjhFOGs0c3FaNzM3eFdqWlpxcXBSNE44ZDFhdVk0L010Rm1v?=
 =?utf-8?B?aCsxcUkzUWFhTDFOVmJNN0tPYmlrUjZkZEVBMnRtR2hHMGlTQkpnZngyUWNp?=
 =?utf-8?B?dWdVQWdJcGhkL1lOYmVUcXc4b2VOUTF6YytSdXltTG9qSVlhaStUQ29IWDdV?=
 =?utf-8?B?d0ViajFZMlU5dU9yM0MvSEJERldiRFFUc1RQQ0ZrZE1xL0NtMXZ6RWYvdjdt?=
 =?utf-8?B?NlJRMUVBSmc4WTZGV0NWdE5LbWpuK1BXN3Ird3g4czlGbWd2UGcwWG1tcFNM?=
 =?utf-8?B?Ym9leWVIMFY0RkZxcVYxVEVLeHlWYm1sellCRnMwdG11d3JVRFVBSTU3ckdS?=
 =?utf-8?B?SnNoYzhJTHZ2K2d5T1JHdExmYkNuWUZBYmJucHNpbjJnaTRYTGlPT3dGc3VO?=
 =?utf-8?B?bmxkYit4NHhjWHEzTjVDQTgvZGcydTdOQXovVmlpa2NOd3Y3dnMyYVByRStq?=
 =?utf-8?B?a0tOZnBNSFhSbGtoaEdFMTFSVjNyQ1hDVDdGYytwaThDZjIzaVU4ZkRtRU1z?=
 =?utf-8?B?T3o0WWVMbzhmbTBTYnFRQWoxelI5SThGb3B2ZlZuQThZb2c3bVFGSHNiVGl0?=
 =?utf-8?B?TE5RTE9uMVhobmFsaDQ1YUcrREZ5NStKL1JNYUx4ckFvVWlSOXcwanhHRGZP?=
 =?utf-8?B?dWxyeE13dEdVNFlnU25NQ2l5U3BTaTJYUXgrUm5xTEUwMDhEVkc3bjRwNFJL?=
 =?utf-8?B?RmVNM2FxZS9nWi9XRDcwdzZwL3ROTExubU5XdXJGOHc1MjUyWCtkSytJV3BW?=
 =?utf-8?B?OEhWR2FqeTg0MmxqK1NSalpmRFdpdExPQjZJSHM1dTlqdVk2eUpWVWF6amRH?=
 =?utf-8?B?QmM1cC85TXJUczdWM3NWYXVuY3Ira0o2ZVBjRFdKNFJhVm9mcnovaDlBc3g0?=
 =?utf-8?B?MTRYVHNMZlNPU2hqeVRJVFY3dzNVYnFSdG50SnhRSHZvNEJHbTRNM1JOWTlz?=
 =?utf-8?B?QVpXdXg4ZFA4TnVpOGtUOHJTdFIrUjNoWEJ0TVZVOTErdXJWcldwdXM4R2Vl?=
 =?utf-8?B?U0t5dm00Mi9VRitDd3FRN0FvSUg3alJkMlU5YVRRNVVLakdSNnd1VHkwT3dj?=
 =?utf-8?B?bFBVWGJNMW1FTG4xNGIrSk1XZGVSd2d1UCtOSzZvamVMTmkvOFdzcUZXSW1U?=
 =?utf-8?B?U2lDZDJsRXFGN0Nubjl6aktuV0JsZ1FkMy9EbjJ5Zi81by9xUGJJOS9RQVN4?=
 =?utf-8?Q?dhjY/X53m4MCy4Zg=3D?=
X-Exchange-RoutingPolicyChecked: X0e3uIvTVEEMqLDCqI8FsmEFwyyNK5ZJOYejOlgWYBF9+JgK37fsSDq5oppeR2Enf5FG7MkRbS2Ce76SASFhytmkucPwDXDua5Hc8ba6de5X3VQmqnEIqGkxsNyE8hQgxsNM8p92qdigSJAIjOG9D6uURnFlJQ4SICGP+H+sDxB/TWT/hBn7+oCA0AUUi4WEZVxgbCkw/MaE8/iwy5x7PvdA48890fSyWXAvQa0UtZG0pbYYZtIr/IjsA0aZKK1z/SUYTDLkZCMzknNf4ZRnEATglm+qvbipXv2TbA9lbquhNtklwsZ7SFKNUHFOcGMoN7NhuYW11tkjoJopPEKt+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: a370acad-c522-4f4a-abd3-08de9125963b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 02:06:15.5546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRYVxcmOdtAnFAVlPMxu5HKmxLU9p/q1MHMul0s+cfJ1BNQ3bHHxuEEfXtDo7yKPEDuYGS7OZCls9Dyqhq5AYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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

On Wed, Mar 18, 2026 at 01:14:46PM +0530, Himal Prasad Ghimiray wrote:
> Enqueue access counter notifications to the appropriate queue based on
> ASID and schedule worker to process them.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_access_counter.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
> index cafcc42897f8..a2ce9dc45d05 100644
> --- a/drivers/gpu/drm/xe/xe_access_counter.c
> +++ b/drivers/gpu/drm/xe/xe_access_counter.c
> @@ -87,12 +87,29 @@ int xe_access_counter_init(struct xe_device *xe)
>   * @xe: xe device
>   * @ac: access counter notification
>   *
> - * Process an access counter notification from the producer layer.
> + * Sink the access counter notification to a queue (i.e., a memory buffer) and
> + * queue a worker to service it.
>   *
>   * Return: 0 on success, negative error code on error
>   */
>  int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac)
>  {
> -	/* Stub implementation - to be filled in */
> -	return 0;
> +	struct xe_usm_queue *ac_queue = xe->usm.ac_queue +
> +		(ac->consumer.xe3.asid % XE_ACCESS_COUNTER_QUEUE_COUNT);

So again, let’s go with a single-queue [1], multiple-worker design.
Also, do not pick a worker based on ASID hashing, because once we move
to fine-grained locking [2], we can service access counters using
vm->lock in read mode.

Yes, BO-based migrations still need the VM dma-resv lock, so we would
serialize there, but given how BO migrations and binds are pipelined,
this ends up being a relatively small window unless we wait on the
migration under VM's dma-resv lock, which we don't need to do. SVM or
userptr (assuming we implement this eventually) access-counter migration
would remain pretty much fully parallel on the same VM.

Matt

[1] https://patchwork.freedesktop.org/patch/712591/?series=163429&rev=1#comment_1317960
[2] https://patchwork.freedesktop.org/patch/707294/?series=162167&rev=4

> +	unsigned long flags;
> +	bool full;
> +
> +	spin_lock_irqsave(&ac_queue->lock, flags);
> +	full = xe_usm_queue_full(ac_queue, sizeof(struct xe_access_counter));
> +	if (!full) {
> +		xe_usm_queue_push(ac_queue, ac, xe_access_counter_entry_size());
> +		queue_work(xe->usm.pf_wq, &ac_queue->worker);
> +	} else {
> +		drm_warn(&xe->drm,
> +			 "AccessCounter Queue (%d) full, shouldn't be possible\n",
> +			 ac->consumer.xe3.asid % XE_ACCESS_COUNTER_QUEUE_COUNT);
> +	}
> +	spin_unlock_irqrestore(&ac_queue->lock, flags);
> +
> +	return full ? -ENOSPC : 0;
>  }
> -- 
> 2.34.1
> 
