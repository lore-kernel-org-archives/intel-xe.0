Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615FDD1D88F
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 18:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E43E10E0EF;
	Tue, 15 Oct 2024 18:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bh8gh8LX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B5710E0EF
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 18:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729015254; x=1760551254;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3dzF+mRAoscOspCqE5sIeqLN61NAvFClk74BXdSgACg=;
 b=bh8gh8LXSIZzqSXWYoon97dRGQLHSXVpGJd80eGmaCDWpAKMagWT1ncs
 6wzJe+vuguTNiYXS1oZxvyKSMPY2URnkZmF0CqqH6uGkaU9PrUGWfucTh
 3aOLhfHm+uL4fS5DstLwyQC5UvMbxgh4pJEGSVg9C0ER29jkZ1fVyZEe3
 t2E87mrFh224qx+P92UwbXDctEG3sEDUFDd1SLBBa2gONJW6MRuaM4zoj
 HNGytRcnYmuHj541WrlPSw4qHlShT/mNBP2eJj0Rop31DWWGXPhcEeUni
 2KFZyLAsRDCvtETuyKm3p6EO3igq9K2LI6CAW2mDCWpuf9y7jDrismGNP g==;
X-CSE-ConnectionGUID: TgeL73otSOCh/QzpaXlGRg==
X-CSE-MsgGUID: X9U6gshLRt6ndo95KZS/lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28557680"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28557680"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 11:00:40 -0700
X-CSE-ConnectionGUID: Sqmg/mCTR3yrBBzPjy2Mxg==
X-CSE-MsgGUID: Ip0JxdG2Q3iaGafu7M1Qjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="82627645"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 11:00:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 11:00:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 11:00:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 11:00:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 11:00:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jynNnHW7SRSWvfUZloLYSfOTgytVlKdEKHHSSye6ZCYcGH56tTqNmlFpCk0tPYAnwlsoxnWop/LeUMsarp30pW2ulOsT6KQBIS5c7GdsaaU2B+h0QRWuY4Fyem/78ReU/MdrRrFW9P4st+/mZfx3hGUVYmhmUHrfWK/i5lJuLCO8Xl/XSgRTJz5FLSpB514BdBIUy28nKa6vmFNBCDidY9krbAkgfVlnOz0CK4e0FdSBVJlgVnAuHdliC387w/FvnKA9Go454+eIFpXH3LCdLWnPiDlnNJIrSSeajOI0WtPJvGmvAd3/rQkMgIlLATGtfSA38O3TB71qDRtDYM9uFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qdccsyXwWGzHyDjaOxlxd54NiBeITsbEHUNbj9ktXI=;
 b=rryT5fjX2jAfJGbTdTOpi+RKZ0UkV9IYeppv5gMLEUnIJf2KBGY2q1t82kSzIIxiqZYeutxuyW9dBDrLaAmy/ktVBnA4/mX0YJvzOIVBFfkXSjF7WCdGQCD8TL0L9rjkVziF7+s+Ja168RN3v1B7vZkcdHDE9Za/n4DpSRc/RKB4f5bEJeBXNYGkDcE5aux4c8uAcYWM/i5dpALaIuy53ay0MeoJJFAM4CbYDa5EkAvSmJ3w1Amnb0nkFCPfkWg1eXFsbEU7sW93nt299zxP89v0nnNJOzdTJIYcidMW/Wanczb+qkypIafn2QsQhLvy5UJKPUlUpCnsqZ1BbQzREA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BL1PR11MB5272.namprd11.prod.outlook.com (2603:10b6:208:30a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Tue, 15 Oct
 2024 18:00:37 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 18:00:36 +0000
Message-ID: <9bc7e679-b12b-4201-8e58-4e0746bc6dd9@intel.com>
Date: Tue, 15 Oct 2024 23:30:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/26] drm/xe/xe_drm_client: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-15-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-15-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BL1PR11MB5272:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8a5db1-a7cb-4203-03b1-08dced434595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzVTeGRmYUFnVGlCdlVXVFB6Qjl5R1MyM1JTMHJDM2VuRGJIUEtldlZDbzYr?=
 =?utf-8?B?MWZ2TjRHTml4cWZmTVhtMlo5SGZtT2dUU1k4YmtONVV2M3B4Mjc0TzkyUWt1?=
 =?utf-8?B?SmpsQ1FsWFA2MWMyNStTaFhSajkxTzZGNDlPRlgwaGtXNCtTak1GeWJ4Nmhy?=
 =?utf-8?B?NXo0ZzdWanlRVXA2YzlHZlhveUN6bVpvSi8zc0hSL2JSblRIYTcxYlE3ZS9C?=
 =?utf-8?B?bW8vMmZ4eEZZUVNrLytnbUhaMXZlZGI5UVhkY1lnVFFGU2hGV1BlQmVsem1o?=
 =?utf-8?B?L2lhaXJUby9ZemVBRHRNL2h6WHh5U21nb0NGZ0JHNDcwelF2MFB5U3IyU1lO?=
 =?utf-8?B?STdKY3ZUQTJoUUhNV2ZCSzVOZGRySUZhNlIrRXdoQ3F0R2pMMkFjSXBSYmJl?=
 =?utf-8?B?MnQzVGdjNWx2UG56dHViQy9JeFh2MDk2UGtTWmR0ZHdlOHkxVS9USjdrb04y?=
 =?utf-8?B?N0VkWTQrZGNIOG1pMmppSERTV2oyaS9NTnBrdndnMHdxUEdUKzB5dHNxQjFm?=
 =?utf-8?B?QmVEbkM3bjRjQjBMd1dZN2drL0p1d043ZndkUGhMMjRSem5ZUSs5enF0RURC?=
 =?utf-8?B?ckNRMWkvVGhNSHdzV2ZSb0JuZ2poK0JyNXdwcXhmSktMQ2NLTVdHTmpod3V4?=
 =?utf-8?B?cGV1V2lidFdYN3d6UTVUZVM0OEtEWFg5TlpIdzVQN0NRVHNFQlRIeThMam9U?=
 =?utf-8?B?bU12UytWVnA0UER0NEwzRjc1ZU5oSzhHazQzUVJ2SFdhQ2tYbDNMcyt4ZmJi?=
 =?utf-8?B?ejlkdFFOWC9waVpaOUcxSjhOZ3BTdWFsVUNRMklzNmxjNk15YmhyK2x6Yk53?=
 =?utf-8?B?cVBMLzRyRWVxZGlnUnNnTXBaWGZYWkU3VHYzSUtvS2pLanZGbDNtSEUza0M3?=
 =?utf-8?B?TkxhV3dqU0N3amtpNVdGZHF2QWpEZXNSWk04MENOcmlLb3Y4Qzh1ZkZTM01J?=
 =?utf-8?B?WjdOL1FnQzdtTHIySU1MN1hLMkNPOW85d1QwaUJrcmdDTmFsMXNwWWNpUlZi?=
 =?utf-8?B?Q2h6eXJ3dUQ4SXJCVkE4WUdrRm0xNmVrc2k0bTNvQmY1SUQwSVlvVWRvcDJF?=
 =?utf-8?B?NU9qOGFhdHFsWWwzcFBQTFlQV3Z4Z3ZXQnVZdzVmUHQrcG5qQ04zQmpwZHJq?=
 =?utf-8?B?Uzhpam1YSkFwN0orZk5yQ1pOaXZydjVXMzZvZWgwczl0eVNKYVIvOEU4TDhx?=
 =?utf-8?B?d1BnK1ZIMkU4a1NEWEVLUW1SZVRWRDlEYWs3aWJ2QXh0SFh2VHdWSDIwUG10?=
 =?utf-8?B?U3lyckhUbG0rOXJ1SktHOGs3N1ZVQUsremFtT3hYWTlTV3hERm5WQjdqQWxS?=
 =?utf-8?B?ZTMyaGZ5cGxaQVA4cWtLL0djL2ZNTXBaNno5aVhGbVRkS2Zqc1hJUy9QMU5w?=
 =?utf-8?B?UnFYODNmYWhhYzBHMEZERUk2MC9OZkt5VnFoWkhjd1orR1hKVnh6ZjdYcUNm?=
 =?utf-8?B?clRCQ0o0OFBDYUgyTGduamVaTlJWT1U5RlZlUTNOeHJyOFpDZ2RLWFh3RnpN?=
 =?utf-8?B?Z1QrWHFKT2VlaG9BVXFHaWxYOFp5dVZ2WjNOR1VQZElTYTkyUHUxdDZyeVhF?=
 =?utf-8?B?VS9aUmg4UjRyNGF0S2hNKzY5dDV1NE1GVEQ3WDkyWlN0di9kbjBvazZwYm9I?=
 =?utf-8?B?SnZwcDZ6WEdUbWZzYTZ4L0cxeUh5dDJmRTRVcEFILzg1RVZBRmEyWVN0VVFv?=
 =?utf-8?B?am9JVzZ3M0t5aFphYTFQQ1NiTW5IeUlNOFJrdmlvdzNWV0NyL1o3MGh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?allpZllMNHNLZ01UUjVlZFh5RmtuQW10UmlyME9KUVdxSjRBRTl4YnNtMzg4?=
 =?utf-8?B?Q3dDam1VeTdwbUR4aWVFNkp1R2Zwc1lXSGlFb1RKU0EwdTVxMm9HZXZrVlc3?=
 =?utf-8?B?T1dZMnhqSUhsZ25rVEhsNUd0SEw5a0QweXdMY1BPcGVNN2xPUnFVYmdPODl5?=
 =?utf-8?B?aTExQ08xK3pWYmc3RnVCVWlCZENPandYRlk2b3BxQmZFRjlwVUt1Y083NjNs?=
 =?utf-8?B?N210dnozTW9XQ3F5K045NVovZkZrcW9YNDZGUG5qbkFML3JYcU14TjhqVGVW?=
 =?utf-8?B?WlE2RGlGUVBpc0YwcUljeHJwU2k4RFJ0NXJ1ZEUveUxzMllKK1hVMUJNd0oz?=
 =?utf-8?B?MUxaRnl2V0ZPRWxoanFJM2dRRXEvcFZMc2R5dldXQ0o4RFI5Y0NrNjlBc09B?=
 =?utf-8?B?QktodWdaUW92NnlFTFR1TzlnS2ljTi9Ta0JHUHNRZ0lsWGxkdHowVDFpWHM1?=
 =?utf-8?B?c1hTVUYrM3NhMnpuRmVZZFp1cHhGa0ppNlB6Z213Y1hOQnJjTUZ5OFh2YS9k?=
 =?utf-8?B?eDlJM1paZlRuTFRjMFhoREdjL0V0c0hWemxUUnIzVllleU1ZZ2E1dXc0RG1m?=
 =?utf-8?B?QlZWR3dMd0MyRTVXM25wQUowVmFCL3B6cjRXeGtOUU5mWEFkbENweWEyNnVI?=
 =?utf-8?B?ZTNSKzhzcXlTTmc0aCtVQ3dCOWNhdTF4V1JyQmJ5VFM1RDhtTUF1MHNFb3Rl?=
 =?utf-8?B?ZGlwekVBeUtvS1FWMFBEOGlwNmtvdU1ZWlgyZHA3MFZXODF3TmFnSkxsNEpN?=
 =?utf-8?B?QkNRQ3ZDQ0FCQnppaWFJcVVjUTJxYUZsQ2ZVVWFqNkFybmdNMlJWN2R1TkVs?=
 =?utf-8?B?UXFHeHRFL0hLdlkySE1xTFRyYVdFM2ozdGNSd3V6S0FucFJxdC9OZ2IrRXor?=
 =?utf-8?B?ZTJPdkNCMVRtZHRmYi9IcElTb1pLc1dTTTFLeDZBR2VRNkcrZlpybDNVUGhp?=
 =?utf-8?B?OWpsd2svSDhNTWFieVlrWWFxVC9VZUN5MmJVOUY1NnZsRmhPNmFzNlVacFRU?=
 =?utf-8?B?MHVoN3FNQk1abEpYclVRRm16V2VxZGs0SENzaUlCRUJ2bEl3NEdxUFhyYkNI?=
 =?utf-8?B?TG5UZnhyL0x6VER1ZlVVU3E4akFrak42SFIxNVlhejIwWmZMTTN5cThHSlk3?=
 =?utf-8?B?WEk4TnV1alFXdE44dTVFMEZHbG92bFVnbHl3ZmY4clM1T0NLMkZzM2ZSSllY?=
 =?utf-8?B?RWhxdVNlTEpDZFBoOUVqSzNUWlg3V0ZWODh4SUY3QmN6eXN1S2YzenpEQU1W?=
 =?utf-8?B?TnIxVVhZVk15SHRaZTJxM1Vkd21WYzNXYnNFQ0RJNnU3MnJudksxam9BMFky?=
 =?utf-8?B?dWlBVmNkK3J4dGhSTVg3OUdKZnNCZXhxUVFSNDFUQ2w2ODcwZ0RuOFVVaSs3?=
 =?utf-8?B?c0pIZDFkRllVZXBTaytGZHBhNmFMajZicHRJaDZOL1dURWxOWlVEYTQ2dHcw?=
 =?utf-8?B?Z1h2QnVDU29DellyUTNkWDhSWklBaTlGKzFwUTcxOWQ5Z1k0ZHZNVi9IUDZU?=
 =?utf-8?B?OFcyblo1TVJPeFBMQlNya1dIZWxRemFDQjhIL09EQXNIRnBhdDdvdWFlVG1P?=
 =?utf-8?B?Ky9tOXpqek84OHVyY3VjbFVheUlDV2lrQUc5Nk5QakprLzZMM3RzdFdQUHQv?=
 =?utf-8?B?T1d5TmppUHpZWXR0U0ExTDR5ajZKQnJsUGcvTzV0NWpjV0pYOXNJZ1FUZlhs?=
 =?utf-8?B?NmdsMzRCd2tqeVo5akcxOTJsbHpnZm9qOUpUdWx3YkFxbXZGdkF2L01JNEky?=
 =?utf-8?B?Zzd2YjM0UCs4OFpBWUlxb3FOeUxSM3Y4V3BXNnNkOW1wUWlMMDdHZTJHbWtx?=
 =?utf-8?B?L1lja0R5aEtoTUFwZnNZQ3NObzFTUU5DM3lxekFOWmQzVHprNW8zTkN5SUVM?=
 =?utf-8?B?YS9URmxtSDd6NDgvYUZjS3c3RzJHMlMzdStQK2ZFK29WNzZ0azh0MmxmaWlD?=
 =?utf-8?B?VWxYa1ZIaUZRNlZOSVl3SUJWejQ4bUI5cGRXRFZUZ2lwZjl0ZElYWlZsU04v?=
 =?utf-8?B?eUhTQ21ZenYxWktKOHc1aytoV054dG42d3A4UkJmVnVnUDlacnBBSGtycUpD?=
 =?utf-8?B?SzJsNVdxb1hsTXpQNzRHZTJLVk9OVkhPWkt1azErTTdVdXFCeXhaV0M3aXpC?=
 =?utf-8?B?WitaWmo4T0ZnYVZMeUlWMWhHRTBDS2JXMEkwWVZjbTREQ2ppazRtWHpaZmhE?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8a5db1-a7cb-4203-03b1-08dced434595
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 18:00:36.8998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAq487gr59jIrCHqo0AduZds1uUuaKGUsi8MfzrrXuj4AZ/F6qTdhaNkIUzQU7pYGW2tVWUHcEBRCL1Z4qH2MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5272
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Use helper xe_force_wake_ref_has_domain to
> verify all domains are initialized or not. Update the return handling of
> xe_force_wake_get() to reflect this behavior, and ensure that the return
> value is passed as input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
> 
> v5
> - return unsigned int from xe_force_wake_get()
> 
> v6
> - use xe_force_wake_ref_has_domain()
> 
> v7
> - Fix commit message
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index fb52a23e28f8..22f0f1a6dfd5 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -278,6 +278,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>   	struct xe_hw_engine *hwe;
>   	struct xe_exec_queue *q;
>   	u64 gpu_timestamp;
> +	unsigned int fw_ref;
>   
>   	xe_pm_runtime_get(xe);
>   
> @@ -303,13 +304,16 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>   			continue;
>   
>   		fw = xe_hw_engine_to_fw_domain(hwe);
> -		if (xe_force_wake_get(gt_to_fw(gt), fw)) {
> +
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
> +		if (!xe_force_wake_ref_has_domain(fw_ref, fw)) {
>   			hwe = NULL;
> +			xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   			break;
>   		}
>   
>   		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		break;
>   	}

LGTM.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   

