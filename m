Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3C8C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 19:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE56D112DF9;
	Tue, 16 Apr 2024 19:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ElpvQrOR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3403F112DF9
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 19:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713295241; x=1744831241;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9ST2bxgz74uJHW6ssnZlkO0CkkcXBO+uuh+rOqD6cvk=;
 b=ElpvQrORjz8DWq94qRkV9EyybCj3HLQrWiTRJ1cgoIjbbdcRtM4v3JHj
 TCI4Xg+saVwXo6Os1mhzpIgKBVd5Pq6joL9ubesYDJZrztLG7BfEmyW1U
 RoWKFBc4RNeDx74R5sRn00i5MLu2o4jCEQ2oBX7AbG9wvlOJ2PrxT5RN2
 kNMKpjoa6GVWDQaRXvC6ZQxqeeL35KRZHD7OB2vQxZ59QA3fhtLOJc+ys
 Xu/6k+QUnHUNh48P/g3novJAbaLsrOL9dqR1GekSQdY7g/GsOKjNpCPnu
 VD1JTClmyMF0KQkUflbUTKJlFje+KFxlpc/F4heAebBsRwIzkNOmVF6W3 A==;
X-CSE-ConnectionGUID: LQF9Y6IRSCSquJ8/x2QDvg==
X-CSE-MsgGUID: pHlFWr+HTPeUjFjimJNtEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19904579"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="19904579"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 12:20:41 -0700
X-CSE-ConnectionGUID: x33mlcmqSBG6RdeI+tNTiw==
X-CSE-MsgGUID: fR4U2OZMQxC+5UzHbQvTJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26926409"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 12:20:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 12:20:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 12:20:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 12:20:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oA7akpdbMmpgNo76i0JQpAMWCQ2zeNld5GeSVBU1H0QpciclPHCsYG1cl7sz2FgpZlXRkkhopoLZZZ34hlgW1+GqVfAN/kely28XSRepVunesiVl9ee4CJI+0S6LvWk5ve52vmf5dUS6nOyV7DzE3ePNFPV8M8JfGvDxyxRWlvX08rk8zgRt5vQ3YpmM6+lwC9EvVXFW3S+xJnfq7ls2jeJHzRJopXaWxoRFgNzXPThTa4KF7nnNVf7GPEDqttmLBEiElglnkc11WDADvKjMgt4v1mIfQMseLxqwyLZBNMeLDgZ6wGYp8SiXMHiy74Kwk/oAIFvlQYU833Y3xu8ylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsCHqGm00juNoCUyToQwK63WET3UoyAr1YD4Otx+Il4=;
 b=gvjNwxqaELJINy1qRHsLDY5yi+5q1GeFNGX6zGkAjXuvpv07fAZbORSCC01haxlqPpKeV3BY3wJLeq4zmP7Y30KQg7HHH1Uwaj+dRK2hFsNmD5kPb7cJEV076hgdEbqVCqLjaWoG+F47IQ5IqCW5NXoZt2oZ7EL8632QGJMNIT9gskBUZvF7nFj6r64ssdJxNIazmTFBCwWcWawwYKVEBaSxoY/ZlU7+5cp7lwPVWEQ4Um9T/nKjDbAV4d8q4FH73p0zOxHVQwjfETj4zWi4H3O69rVuThj1XPVpk18jZl4Drt+ckPFxfZthH2HOp/kujuu+1WA038f3ORqn+P+10A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Tue, 16 Apr
 2024 19:20:34 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 19:20:34 +0000
Message-ID: <9324d102-0540-430d-a0b1-8fc3c65802b6@intel.com>
Date: Wed, 17 Apr 2024 00:50:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe: Introduce a simple wedged state
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY8PR11MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b7a5d2-dbda-4c51-b1e6-08dc5e4a49f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iRwMLdhVNE1FB3ijUWlSGOD8es7lr9ZfZ61I456SsuyRWTb7gWZdDZIfmWE8YEHJx/5EODpPYKeYda3Skx/sZjPlpWhv2nJzgio6ldfBjWbWiwnq7UUCFV1K0zLZCIs8ug8VC40taM5QswMVJd+49bU33KGUanuE0X2wJuwYszZWA/HuLgjOA207SjbpUhJooHcbzsdvlb3I677EoyLb7gjPyZuPFIRbeA9QEwAWbbtr2DIseBt8TFk0qZW8OJESoMLi2xTixYftFDjC32QDLAKqqI50Mj8tSEnpTer1nIpmOUnCdygiUPhKp574HxB6+nLNBaIdHNZ35dPGXxIzMu/nzX08zGnaDMK3sQX7Tsy97aqDL6481JX3l8ocd4DX6w37vZB2CE9nhX2cW2DWanZBHbdF8HBz29HEAx+JtMd2lA9vXGO5sY5Ll93HqDRn7CZjG4sX4el53o0OrnKR6ZdJ3cGkiPImJCFtib2cQHdaqbl9etgbGCEptp0pJRV32+BBOPrIMst8eN+y58o+P0QZp8evWRoi3of4wV7QeMbVDkCDK3PLwO5tuzbiENPxZcH7RSd9bh2azw6xr9hJN9/IQbyVR0SuzQJLQjDkqR4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1ppVlRkcEJ6eTlqNGFKZ0dIUHZ2WTd1R3FiaEtieVFqL2hweHlocTduZzdI?=
 =?utf-8?B?R1M2ckFteGN1YzFHSTVJbFRsK0VPNTlDN09FbWUyUnczR2dMQVp0K1J5Z0NV?=
 =?utf-8?B?S0l0YW9iQlE3QzQ3S2V1aFQvQS9wSW1JOHhnV2tXRlkreWtkbG90Rkd4WHd2?=
 =?utf-8?B?TFJnZHJFRXBrVlp5TENQdTMzeWlIRHIwK21OMHlHeWh5a1I4ZUs3NER5QTRh?=
 =?utf-8?B?eHpzakVhTzF0Qy9LVlVwRnpZQWwyRjdpZ056Mzc4MGVWSmc0bTBOUE85Y0Ny?=
 =?utf-8?B?UERTZUFjR3U0THFSMzkxNzUvODRyUzUrTTJteXpxS1MxZ0hnMDk0dnRrZkRN?=
 =?utf-8?B?Nlg1aXZORkJuL1RpUGs4OENOZ2NJRjA0Y2VHQm4vLzU1VllibW90ZFN3S1Q4?=
 =?utf-8?B?eEVvVDFBS2Q5YUdiem1EQURYQkNUOU9aY25wZzBmYmJXRDJiLzJ5Ty9IaGNF?=
 =?utf-8?B?YmVaRWVpc1UwSXZJUVVlTWV6a0xtc2w1S0gwM3ZNM2Y1U2NSeDZlZHJZdGdr?=
 =?utf-8?B?cUpKd3RoSW1XdERLUFV1M3FKM2RVTDhTZzNCUUZycm90aHNIWlZJN1RmZ3Zu?=
 =?utf-8?B?T0Q1OW9WTmhOZGpwV1NrQjh6cWNJKzhwWllKWEgwVGVBTE5YTGpHQ3hJYzNx?=
 =?utf-8?B?Ui9xUnlucDlZNFAzUzNiaVBCcEg3dzBuSGxuK01hWTFiSGRrRTdUNlk4VFAz?=
 =?utf-8?B?aWR2azRoVU15UTYyclJRYW8rKytaeTFadWV5d0JWUVdhUGFsZm11ZE15emZr?=
 =?utf-8?B?T2FPWHVSUGowektZTXpjTEhBOENnSnQ2d1grNFQwenNxZmZZY3U0OU5BNm5C?=
 =?utf-8?B?NUdmaTlzczhqTmwwQkFyZE5xMWFyV29MTTBpbnJXMm5xM1dYSm9UaEFGVUVy?=
 =?utf-8?B?UnVSNVY4MUZzS29WV0hmUFZaZkZHKy92VzV3YStEMm1EeFBWZHVCY2JKNTRP?=
 =?utf-8?B?VGRnYm5EU2ZpT0M1NW8zRzhGZnI3RWJkcVBmc3BwRU1VYkdhenBXZjJwNGYw?=
 =?utf-8?B?ZzJ0ZE9mc2tmUVc1ajBtZHZYcE1mNFdYVUQzOUNhbXhIeDN6YXlWWXlPMDg1?=
 =?utf-8?B?T1c0MkozbGRERGppbHpQVUZVUkRVaDdyZm9kbmtaeHZaQ3FYYnVsV0xPbW5k?=
 =?utf-8?B?bDZmazFTcWt2cWNHZVZvS3VpYnN3a0dQZmlid1U4QVdScVhWQ1BRVlUvOCtk?=
 =?utf-8?B?T0FURFR0UDRIa3k5czFEVDFJUmZaNXVNT0tuMDdlWHROb2xOMWlZdFMwLzM1?=
 =?utf-8?B?SDZXNko5ZG5kNGxNcEx3OXJQWElMcVZXQUpqdE5TaFpPbGtPKzFoRlNMTm9p?=
 =?utf-8?B?alNFTmNVR2ppYktBSGNmbmJnZ1o5aFJVZzFCS2NhTFg3R1ZFTnF0QVdWMGhn?=
 =?utf-8?B?SHFMOElPMzBaQmxiTnh4bkZsb2pNNGJSTEt0TDVsSWVnM1E0MHRSd2xtV2tz?=
 =?utf-8?B?eWE2SlprQzBGV1pheTV5bWRrU3c5UTVWbXRlQmRVdTJkdnBzQWVLTGtLTmd6?=
 =?utf-8?B?QWhvVTVCeUZLVFpmNDArbWdKL2ZXL0dyRUtFcUtlYVBLZ0ZwKzZpZDNZVm4z?=
 =?utf-8?B?M0Z5VjJzaFRIZDU4WlZ5YWtzbFVzQ2VsSWVWeUN2WlNac0o4c1ExUXVNYmRt?=
 =?utf-8?B?NFlSajF2elBtQThxQUowcElqQlpsSk80TlZyTWI3YzNtL2Q2R3IzMFZqTkQ0?=
 =?utf-8?B?R3RSSUhJMTMrSkRLNTBPRlh1VUgrS3p2MGtYbmxOaGZ2bmdDd0QvN0xneDAz?=
 =?utf-8?B?dElHZGRtem5tNVI3SER4cTc0bFZ3NDl1Z1kvajF1VUw0VENGeEdXZzdWZVdz?=
 =?utf-8?B?N01UNDhaR3AxeEtVWFlncDZkRG9iTm1IY2RDNVhBa2RIcmlGVElFRDd1L3V3?=
 =?utf-8?B?Q0pOTVZRd29KVjNmTkVNb2FRTEJISTJhd1BHMDJPVnZWVTk1cWMyMEhBZHJ6?=
 =?utf-8?B?TTNZRVZvMDhKcjlQN0hyQ09vTys3OXpaSGxtK1hWTU8wU2xtYndVbHpOSVpK?=
 =?utf-8?B?VXhBVkN2Q0dOSnQrRitRNGlIOUdXWXBrVmRkTU4wMVdRU244MEFwakhtbG9W?=
 =?utf-8?B?UUJaalVGUXBrQnU4UFVUK2wyWGx0N1V6STlWSmpOV2dKOTltZ2dURWpnVmwx?=
 =?utf-8?B?N2lkZXp5R0tKSytZMHcvVHRrWVQ4d3p3aGpuYXFsQ2RWNlFlT3gxVTQ3VkdM?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b7a5d2-dbda-4c51-b1e6-08dc5e4a49f1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 19:20:34.4630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REs6ZZV6wIMLg/lwknIMqg94pSxhVK/Fg+h79MEgW6FfXW3fm727ZVk9jzBv16efWzu9/j9gfV1U9mp1FFEgp61ZNMWLPpHNwS6OxqzPa3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
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


On 10-04-2024 03:45, Rodrigo Vivi wrote:
> Introduce a very simple 'wedged' state where any attempt
> to access the GPU is entirely blocked.
>
> On some critical cases, like on gt_reset failure, we need to
> block any other attempt to use the GPU. Otherwise we are at
> a risk of reaching cases that would force us to reboot the machine.
>
> So, when this cases are identified we corner and block any GPU
> access. No IOCTL and not even another GT reset should be attempted.
>
> The 'wedged' state in Xe is an end state with no way back.
> Only a device "re-probe" (unbind + bind) can restore the GPU access.
>
> v2: - s/wedged/busted (Lucas)
>      - use unbind+bind instead of module reload (Lucas)
>      - added more info on unbind operations and instruction on bug report
>      - only print the message once.
>
> v3: - s/busted/wedged (Ashutosh, Tvrtko, Thomas)
>      - don't assume user has sudo and tee available (Lucas)
>
> v4: - remove unnecessary cases around ct communication or migration.
>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> #v2
RB is valid for this patch too.
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> #v2
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
>   drivers/gpu/drm/xe/xe_device.h       | 20 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>   drivers/gpu/drm/xe/xe_gt.c           |  5 ++++-
>   drivers/gpu/drm/xe/xe_guc_pc.c       |  3 +++
>   5 files changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 9083f5e02dd9..67de795e43b3 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>   	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
>   	long ret;
>   
> +	if (xe_device_wedged(xe))
> +		return -ECANCELED;
> +
>   	ret = xe_pm_runtime_get_ioctl(xe);
>   	if (ret >= 0)
>   		ret = drm_ioctl(file, cmd, arg);
> @@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>   	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
>   	long ret;
>   
> +	if (xe_device_wedged(xe))
> +		return -ECANCELED;
> +
>   	ret = xe_pm_runtime_get_ioctl(xe);
>   	if (ret >= 0)
>   		ret = drm_compat_ioctl(file, cmd, arg);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index d413bc2c6be5..c532209c5bbd 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -176,4 +176,24 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>   u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
>   u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>   
> +static inline bool xe_device_wedged(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->wedged);
> +}
> +
> +static inline void xe_device_declare_wedged(struct xe_device *xe)
> +{
> +	if (!atomic_xchg(&xe->wedged, 1)) {
> +		xe->needs_flr_on_fini = true;
> +		drm_err(&xe->drm,
> +			"CRITICAL: Xe has declared device %s as wedged.\n"
> +			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> +			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
> +			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
> +			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> +			dev_name(xe->drm.dev));
> +	}
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index faa32407efa5..b9ef60f21750 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -458,6 +458,9 @@ struct xe_device {
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> +	/** @wedged: Xe device faced a critical error and is now blocked. */
> +	atomic_t wedged;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index cfa5da900461..0844081b88ef 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
>   {
>   	int err;
>   
> +	if (xe_device_wedged(gt_to_xe(gt)))
> +		return -ECANCELED;
> +
>   	/* We only support GT resets with GuC submission */
>   	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>   		return -ENODEV;
> @@ -685,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
>   err_fail:
>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>   
> -	gt_to_xe(gt)->needs_flr_on_fini = true;
> +	xe_device_declare_wedged(gt_to_xe(gt));
>   
>   	return err;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 521ae24f2314..f4663f1b0a80 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -902,6 +902,9 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
>   		return;
>   	}
>   
> +	if (xe_device_wedged(xe))
> +		return;
> +
>   	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>   	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>   	XE_WARN_ON(xe_guc_pc_stop(pc));
