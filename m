Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FDFC4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 19:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25E210F109;
	Fri,  2 Feb 2024 19:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOM37c+Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8880C10F107
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706902512; x=1738438512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UzFqnpFNxvoHSzEKWR/PU+b06/ptFLqreAy+Dze6vwk=;
 b=cOM37c+QKV9zPCPYeUsidA4p6Sedz9yBIcd2iwj/eehFDuTpC2dbN2eh
 AXAUp7p6R+lBt0ZbXguVQxWTOKXIUG3XsVzeNkS+d1+hWnWOgwHrXc+o6
 YM/7ueA84Nxlq1kiXnh3XEjLK+8oGt+Jz8vUiSM60voJxghZ/lnT6qjJp
 o6maUXSflmbjynF4PZ4Zsm7KoxrFY47ICiWQAKUjbm+gbcMfli13IOZYQ
 vjPYxzTkpqsUCgEel/F1XpsVadof9VGXUOkGqlsgC6v5viGYtSzQ/g1Fd
 TvxCKeyA9Lm8AgCV5GYVPCAmskivmWGqC3o3x56amNTKQZ5seu9pf0f4k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="384368"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="384368"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 11:35:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4760108"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 11:35:12 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 11:35:11 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 11:35:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 11:35:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 11:35:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRM+eAsPKXu72Q2TY72kORzJ4DcpUfHN+0jQaM71zS7JGp8wsTeGcEvPedYcx/L/JzDdbsflbvjHS9mzVeRfNe5+q6N+H9fVlejwGZX4R/gu42TIgQ1BdX4sn/Inqvb6aC3PjFYqu/PcFjBPWjPfLmXfQfVqQjUTYujBDCGiU5IKC2F6esjg8+jL+F2P+TvFTreAufgTsZ7SSvNGnDMOhegLhR0b+kEgSPYAj3P1MYNIUznYE8hvV52pp6m3XqIEB2JjO1jlH2eCryyC5vKAEoUbGksvNhGolnOTcLlfkVlE/pW4oOlPd4yuCbcIgE+vh+0HO5/kZIf1SLtEf5JwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwuDmAOhp4d04SUTOcfWmE1NfUFXCaekfqoD08GBFdI=;
 b=ikPcJEmF3ZmzA1CYPxrcgWRFolju8CcSzei4fFDkXDYrCNZ3FPjWVnWP8WVpCbtrtbEdWzSqUedL1Nf8zFs0hY9+h+l/Ub6JKRe78CKHciyAf5YmwoDyvhFT91RPuwd74eh6Y3oUXn8SzptYKmCrYUG+b1nHyQIbnPWavfW5/WCJCPe1+qzTiPVerXHEuzcojfd4p6DC3RmPQlX249+Da3u1XVq5QQReldwxXReB3jT9eF96seksea89WID2hjy9X7C655PsLpO45v2qVoqHKx6kHIGoeW37p11ScQSDK/D4j5fV6b1KdlDqlKLUHqJGzJMsXoqX9GRI46F5cs/ROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Fri, 2 Feb
 2024 19:35:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Fri, 2 Feb 2024
 19:35:08 +0000
Date: Fri, 2 Feb 2024 13:35:06 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: Re: [PATCH 0/3] Update to GuC 70.19.2 and add LNL
Message-ID: <pm77ns5mf7s4f4dk7jsf4c424bi5evvtvsfpnvf26svluys6ry@fv6lo3wbqh37>
References: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
 <njcmjcrd32ztgxa7gwmgsmhszwsm5je3ojv7mfvpkmm5s7dfep@mqy2hfmadmif>
 <2cd956b3-bccb-4423-be46-435125343449@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2cd956b3-bccb-4423-be46-435125343449@intel.com>
X-ClientProxiedBy: SJ0PR13CA0063.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: f4b55e34-492f-456f-491d-08dc2426104a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ab0dthq/1q7M0VBfeMELeJJxt03P0BMaxtiSGb4Z+7t7EKBe9DzelgEoHetXKy/pZ2nmFwxGBYBBSdm6VDHC8lJ19FtaTkAazFBPIszAkPpSHK9BPZP4R1oMWPw0LwYQyVgJuZs0dRh9HTP+5RL7xJu+Xuuohx6Dx+V9xiTHoet/cAvogWssYBDnesyR1NoKvWG82uZ5sO23XonWX/dLMXbSolLviTG0YioZCK6jsi/DUulQuXXl1/6pb3fRExLje1oN9U2WhXuEsjezyoCFe7t7MLLNHbU9Tnvz+1An5rR/fC2SkuGKHOIp8ZsirY59B4Yk4Nv0Re5KaQqiC3jLChUtpJOlI1th+kv6fhO/djb0MYHN+zm15CbTjAnepPyNwNkrMVHCPo/iwYAF1O2DKvUAzSwaEVKQww512rGuhhhnEOeULaWpB9fPztW+1HKmAo7m0RVzKggIMgmqf16fYkgmgHcJpI46vpayWaH+cbg5rsSDSqDvDITetBlg2qDkHGpjPOcgUY9Uc+c55nQ21g71dIDRHI2u93ZMuttT2Cs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(376002)(366004)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(9686003)(83380400001)(38100700002)(6512007)(33716001)(26005)(4326008)(966005)(8936002)(5660300002)(8676002)(6506007)(478600001)(316002)(6486002)(6862004)(66476007)(2906002)(15650500001)(66946007)(6636002)(66556008)(82960400001)(41300700001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OTwGAFXNEuM3vZ7YYhFL6f4a3/PbHgL/kZNXDkiADM2dHjNGPFks5bYOm/Wf?=
 =?us-ascii?Q?v+SdAD6alBWtGbSHn01WYogmFEu1Z8sahX5WUjzGV2tbIdwChwDystmVTbfg?=
 =?us-ascii?Q?NKOyDYX0uC+dkSl1gWcqzoiiciQfT0FQZTzf+0UT1nE5kKcIISWvNQz+Uisp?=
 =?us-ascii?Q?kntJtWw2YJ0h3wbEW6cp3UJYeYcGiQcEIWHeKZyvRFH2ruSJAfEpHQiKEkYN?=
 =?us-ascii?Q?0MyZL5rSXXz18hsDh1vzpMKd+lkhwZOho9QiHulhjC/zxyhac4uovoDbXN8L?=
 =?us-ascii?Q?DqpncpuzCDiLQe5SDWA2z+WINbKoWv09ItbY0s9AO4hW3/9Pc65wZEFuKNxT?=
 =?us-ascii?Q?xlDcWpMQNaQl8XQ8W4/Q4amJdCmgY6Fxeb7v2Fqj2COvTFnPdgqY8tWOZ/fA?=
 =?us-ascii?Q?2/qBsttTjCEcLvLiDhYtnAY2JaXOMDFB0zIx+EvQxfdKnYZo61Wv6g/98X/w?=
 =?us-ascii?Q?zywCaDVrZfzCXLGRJvoUWP0V6ie+NKDprtsuNLEa+ITH4IdOX7WogaFkI51i?=
 =?us-ascii?Q?udTeGJJ2KCmhxaq5eMGUU2n7VI4A/OKIPdsX5HKf3XI8gSzuLEVCQ03zL/+T?=
 =?us-ascii?Q?3vSgir2RLmSTKXEESiTZetTnXg0nUfyfZPqRRTRNrug0HhzMwNTLQ4mYIWBy?=
 =?us-ascii?Q?dRZJp5SzLlgHwXKJTpv7O7pxDxL/sEqeG+IsUHzQpgK4HEzPUji6LI2gKYOS?=
 =?us-ascii?Q?n0OJYDZFGzxJjyUOSU7mI6A/LyivP0rC8aHVr6uEpn+Flz2Li0Z7s0JQHJ6K?=
 =?us-ascii?Q?h8IG9VdaV3lp9bzH8YadzoEEUgdrugwvRa6vudMd59DLeFwWIvQ5slfRd3+Z?=
 =?us-ascii?Q?FzZCdjL78tUWGcqb+V8aNGUo4PU5Fen3fCJr1OfGO8+uUmwlXTdt1X363OyK?=
 =?us-ascii?Q?8nOiREwgUsbml0XBjuEl3sJLgmSyhvZIKa2/TMCwJ0uSut43I23gi8hUaPFQ?=
 =?us-ascii?Q?iewulk804M3wgTelO6/Sio83WiqkFuPAahs0JyL3n09DZ/i9DL/ZR5Xz9Pxq?=
 =?us-ascii?Q?igQMUJnsCl1pb6m1cHdnj47R0G6d1RZIQx/2K+tJtEwVEhOxleS+5Av3hUyi?=
 =?us-ascii?Q?noZH/fjOfbCZjcmrLZnydEKrMOIHg2KdM8OINGYgnxb7+pkUxh7L8s82kW9z?=
 =?us-ascii?Q?aawMFYSwLxymgiAZLiOlIYiqMWga839LE8mYvd/gArcSZQ0kUHNZ+dWTokbT?=
 =?us-ascii?Q?9YWs4NKvV/uMZeqwHUXo5KGGKxvpNWxR/OSfSVQKgPDI2XsAgDHIv4X71pWP?=
 =?us-ascii?Q?7deplXpUuMOpSl8mfcCUiNSIlHnnwpb2LCeP5dwZddfz+CfDklRJjRUf4y60?=
 =?us-ascii?Q?IlUM54lAfq8Mq8xnylOZ1nr4fjUqOCOl0ypoDcd19QjBDEC6SFjwKu1ybwaO?=
 =?us-ascii?Q?azgbP0KYFLjT7FAQdMycbCQFDlDrPdslw48B/9kWLK+EXDYX9hbrYL++pwlM?=
 =?us-ascii?Q?W25H+CiRtCGIW/fklzxHFQ1zZPayp2TGPliuLUHklehYO2asb4c2w9Bcd1kr?=
 =?us-ascii?Q?/E7HU4P0Dn9gRvOIb5Q0ryChEjkhP2VZ2/JWbf2ed0kdaPyiWpWQ7Cj8I6Sz?=
 =?us-ascii?Q?Xnk3M+yiGSChcHn0s6PwswJBiYq/mPULuSGjbBdLFvCeiHGD5XUoxlKgdcDA?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b55e34-492f-456f-491d-08dc2426104a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 19:35:08.2365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjgU4IEhTv0jPn5b/5m4Ig03r52I2neFt9pJa1bBqzkRlAnhv9V8Z609LEYR6p6G6Dhx2umEHOgyaKIUCggThZbi5xkOr8zhKhu0hGFIaKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
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

On Fri, Feb 02, 2024 at 10:51:36AM -0800, John Harrison wrote:
>On 2/2/2024 08:53, Lucas De Marchi wrote:
>>On Thu, Feb 01, 2024 at 11:30:47PM -0800, John.C.Harrison@Intel.com 
>>wrote:
>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>>Update to the latest GuC release including the first release for LNL.
>>>Also include the patch version in the expectation check as it can be
>>>important.
>>>
>>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>
>>For CI to be able to test this series you have to do:
>>
>>a) be on top of drm-tip, not drm-xe-next
>Is this instruction special for this particular patch set because of 
>the for-ci conflict? The wiki page is definitely still saying to base 

If you're talking about our internal documentation, it's
outdated since drm-xe-next got merged upstream. Documentation for
drm-xe-next is now maintained upstream as part of drm-tip too.

>patches on drm-xe-next from fdo:/drm/xe/kernel.git.

patches targeting xe are *merged* through drm-xe-next. Usually. And it
usually applies fine if you are on top of drm-tip or drm-xe-next, but
not in this case as we have the topic branch that conflicts.

Since when we got merged, drm-xe-next is "just one more branch" that
forms drm-tip:

https://drm.pages.freedesktop.org/maintainer-tools/drm-xe.html

and drm-tip, as an integration branch, is the merge of all its component
branches that is done on every push to any component branch.

>
>Is there an Xe specific repo for an Xe specific drm-tip? Or are you 
>meaning the genuine drm-tip from fdo:/drm-tip?

not sure I understand the question, but I meant the one and only
drm-tip as per doc above.

Lucas De Marchi
