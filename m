Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA3FCEB2FD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 05:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB6810E285;
	Tue,  1 Oct 2024 05:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVQYUyb9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A00D10E285
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 05:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727759040; x=1759295040;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IgsNciQ/pjtbsvTfp5S/+WLKnhrckp+4motZWtMcAEc=;
 b=DVQYUyb9gMawEju1wbeEGxQNHyeUZnXZRoFhHyDNlHOiz7xzd8Ydvstu
 +DJTaObt8xWxC2oFqG/PDUr7ChONIXR/Y1V0OyVieqPltjLROvswLDNDu
 5OMJTtRwdUDR8lHBVB2Mzvz6GlxGA5K61MSjL8eIYGJ+aZRx9nBXFphmN
 fASxhUw+6Op23XVp85KFLULXqh8YZ3FYXovvzBQ7/vX01BqyjJBE07daq
 hJkDYT28d6c1WWdGrKWaq0y9iqH5DBIrnvyhIm4B4vIb9hhVNqss4PYVT
 utRcfpXKCFwD1lzVPrIhKnnUi+dEn8Rf/Q0rJGlzwcNQh9utq3pRpeMTF w==;
X-CSE-ConnectionGUID: lsG8KQkdTQu9bMWRZxjUTg==
X-CSE-MsgGUID: Cm1w5HfGT7+AWKJ3/KV08w==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="44394170"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="44394170"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 22:04:00 -0700
X-CSE-ConnectionGUID: pPFJV95dQrGpzfrgdnkJzQ==
X-CSE-MsgGUID: +dFLbjHXTH2Z76Y2IPoGEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="78381713"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 22:04:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 22:03:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 22:03:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 22:03:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 22:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFP/dU0jPH07XvPpzEgfRfonNiJZ649O8jOoyPM9KhyrPA4gTmSxx0FF4tSirbYCfdaXMY8ii344a9Ckwc1VVN0heC8y4FlBYJqCnoIxoqcjYQCxdXR5nB4nklS3P7Dt/k70To67+tlx94MpuX9wPb6qExmTuv8ICcViS/fPCIEj3/KWElPKOaYNUsXcF/DjS3ClhUjREFiqFrHxgcbQDNmzPvfwDOrubIs//x8NFUOQIN7/LTsTUnHsRFH/5UecvF3y4jFgAT4YSbOKVJnMzS/Pb3v2IB18ux33XPETq99g1gYuwkyjmc6pKSEAOLqcH3rpf4GVD9Z+hIweULjjsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRFsa3mr9cSs7D8T5pti+w1x0Ik74SxP5pLRnTbTnXE=;
 b=UyWb/znaBoXdz/anJs4tQDoCHd5wRWosHl8X8NntwchTvZbtCTGGlS8WikxecRZZxtL9k2GfW1eE2jfAuHPMlldgsPHDLhKbEHVaDaP4V6OvR3AUa9NizNK1kA4QivdezTnJI5HBSVO7iImXq3jKC0OlyiMx5oITf6I8xCoE7Y6UND+I90p0jfsE8DQHTrfWs6FsxQAq9Gu5KXg6lvjaFbgRvfuJ/BEAtDr57XeDISKazt+SYPA4bvSl6KR1ZKEqC4CIdnhdxxQmhc5/GMnDJjGSPWO5JM35MlGBOnb+wf2xtj8ZVHuacfQTEBTTUohaxIsv+KH3GzYSQeLUMg8AjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB6369.namprd11.prod.outlook.com (2603:10b6:208:3af::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 05:03:55 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 05:03:54 +0000
Message-ID: <5292f7e0-b637-4742-afa4-492fab9018ff@intel.com>
Date: Tue, 1 Oct 2024 10:33:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/25] drm/xe: Add member initialized_domains to
 xe_force_wake()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-2-himal.prasad.ghimiray@intel.com>
 <bf859513-171b-4b2f-b342-1ca3c07f508b@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <bf859513-171b-4b2f-b342-1ca3c07f508b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::32) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: 688b4663-ee39-44c3-d21a-08dce1d672b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTFkOHBlbU9mUno3N0xocVcyQjBjMmVoZk1WSGpaWm5MbHFyQUtVMjZ3Tkpk?=
 =?utf-8?B?VjFTVncvRU1LUXV1ajVQTVhlY0V4WU95TTdyV0h0YXpGOGVXY2ZJNnNMZE05?=
 =?utf-8?B?RW1zK2N0WnE1c1BwV2hJd3lSVlJyOFNiM0I5SWg0M21xRFRETjd6WW85bEp3?=
 =?utf-8?B?SjRINzAySEtjOG5ybC9rNFVtWnMvdk10UU8reVY5NERJY2d2V2VFY3EzUlZw?=
 =?utf-8?B?ei9Yd004QlcrbEZDeGNyeE8xUDJ5b1NkYzZCMEJUcWw3VkpPZ3Fyd1JLSnk4?=
 =?utf-8?B?bEtXL0ZsRWhjZzhFTkl5Tkd2aHpMVGZFaE9jK3hJUHlCSmdhMGJ1VUs0aEVS?=
 =?utf-8?B?LzI5T2pRY2tXQWxNZVgyMWtJN0xtNVFDTVFqb1hYN2pJWUpEb2Q1K0ljc0tZ?=
 =?utf-8?B?TlJJVGdUQmk5cllZVVJObUFoNjZyNWo1NHhBY2ZWUEFZUW1Ya1BVM2w4NjJQ?=
 =?utf-8?B?cjZVaGdrWERiWFRmK0ZvRkxIdUNrMWRqMTRYTThoMXhuU0VpcEprRmlPUW9S?=
 =?utf-8?B?TlMveDRIUWNEVTFURUlTN01UcW1UTFBtaW56TFlRSEpTbTI0OWpvUUhxY0lZ?=
 =?utf-8?B?REFySk5SVnFMU0gxdStLcG1rOEx4d1BXQjNJUzhrRGcxc3h5dFl5RXZPUjE1?=
 =?utf-8?B?Q0Jnc1JIZXB2Ukxnb2Vtc0VuN0NnZTVIdnFVQXNZT3BxL1VqVnhxNTRtWHJl?=
 =?utf-8?B?LzZpMzhBcTBkSE9yT0lJdUIvM1dnazNXMzFTY0ZZRDQwa3o0QTRzNGxNUC82?=
 =?utf-8?B?b1ZQK3U5dm5rN1hLLzV1Zml5YkhjREhZM3BxT0Q3ZzBIQVFod0VYc3RxMUR5?=
 =?utf-8?B?N1VBV2xCWSszTHBZMWt2SHdjdUtzdjdSTDhmZVQ2M1Z5eUFEZVRCc2hsWFZP?=
 =?utf-8?B?SnpuSW13NVIycWFGdlVQUzJ2TDZ0ZnFvaldYanpLc1E5T25IeWRlNGhIZ2FD?=
 =?utf-8?B?SWVIZHc1TGlBSTFpbExRRFc3T1lkUTBGM3dHUG5zYjhLQkwvRm9qM0RLSFdC?=
 =?utf-8?B?UG1qL01od3hwUGJ2dGt3YTMwMWkxYmhMMnZ3RzR0TnBjdmJoM0hLUmxHZm53?=
 =?utf-8?B?T3BvdDZGaHZUTTlIamJhS2YzTHdFYS9tSHNHU3VIbFhxOG52cVVMR1JMT2lo?=
 =?utf-8?B?NmRZQ1lEU0xxcmpQU2tRUHBRblRtbS81VDBrWWkrbDBkNzlIM3ROREl3SVhL?=
 =?utf-8?B?YkYxL3JaOXdsVkZVYkdOQXhhRHFvbVVyOWMrdXExY21UWXVSOVBEd0tvNHly?=
 =?utf-8?B?bHhleStpcXFwMnFQWUxWSzBzbDVRajRCUG9Tc0dqTDVvQzh1L1JCeEVMdklP?=
 =?utf-8?B?cDJHamhYcEJMS3Z0d2V4bldSOXQwdVRYbTVaVWd0RnVvT2puMStoMGVuSEQ5?=
 =?utf-8?B?bVhtQ1ZyblMyWFpQcjBwZFpRcWZlLzJ3SXUxMzloTXZhMkdyZndTaWRiZlpI?=
 =?utf-8?B?MzIraGtId0V3V3NjOC9vL3Jrc2V5ckxJVTc4QnltcnVpSXNBSFRoWHJWU0xa?=
 =?utf-8?B?a005bUZMT2ZzdVFBVjd6SDV3Q2s2TjJOQnB2U056ZG9MTHkyN3JBNkRlT3FU?=
 =?utf-8?B?L1RlcG9vWVdGRmpsL1NCWHpxWHVSaVpIV2JTZEhXbjRWWTVKcndGdW51dmN2?=
 =?utf-8?B?cXg1V29LZGVqL0JPdlRLbzBKY25vdGN1SEE1Y3hCemV6QXovY1Fka1p3ZW51?=
 =?utf-8?B?WWNmeUsrMWp5Yk0wUFpCRWZsS0ZSU2xPRmRJRWdrd3U5NnBSc2JhM2p3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3poN25qZ204UklXWjVZNUV0REFIWm1td1hmVExWcnlqZ1g2ancxRWdDM0Vx?=
 =?utf-8?B?U2grUjMvdE5vank0WFJuZXZZcVpNeFRXdDlnQnJXZllUVTljaUZuSFl5c3Fs?=
 =?utf-8?B?RFdzYlhhRUd0akNzUmdQZmhWS0ZOb1c0OXJraDBrOXB4Q3hiTHJwSVBTb3lY?=
 =?utf-8?B?aFIwVUtmQjdBMXNsZkRBdGkwalVNeWtDZTRhQzdmMWtLSFlmSnI5cnk0WGhH?=
 =?utf-8?B?K1FESmpnUllZWUN4a1NyY0F6L1FLSUorWjZiaXNwcnFKeXh3Qkp3TWtneWxt?=
 =?utf-8?B?UEJNQ1JFOEJDZXRZeVdOZnpXWVpiUjhTVjVVVzR4aGE0S0RJNytuVElkRXJy?=
 =?utf-8?B?QkVkSHBMNHBjeDQzKzdDODJpdmdFYy9lb0tEWU50bmxGaXB1M3FhTHo2ZmU5?=
 =?utf-8?B?KzBab1FKclcrVkpvNmFVaDI5NnNVcFJmNUh5Wk0yeGNhdU04djEwdy9MS3lD?=
 =?utf-8?B?dVJjVjVIV3VYcWRLbGd0bmVmekJCZkxWTWVqMktvWWgwU3dIdWdpVFdZNlhO?=
 =?utf-8?B?Rk9LWU9JQTdLazVHWG4zYjJvd0FMZVNnQmRJVE9WMGN5aElyZXlmWDFzRDZS?=
 =?utf-8?B?T1kzT1JkQWFZRDMySFJFL3JFak9FTEo0Q21OWXQySmxabWhwelZERG1EZTYy?=
 =?utf-8?B?QXFIUTZWNXd0bThXSW9nd0RyU0R5QWxpOC9pRjFhM2RYWk0wY0FwR0wrcTY3?=
 =?utf-8?B?ZUhZR2hjQjVlYmlLQUlYbWV4OHJZSEltTForSUtkYmVjajF4M25SUW0wZ1JR?=
 =?utf-8?B?WE93MFBPVmlhLzdKMW5WdU5CSXBGREI1UllRei8zWnNPT1UwbzJkVHNWbWVN?=
 =?utf-8?B?a2xlc3N6NlA0VDAwZHZ6Q0IxOWdheWJZcXpKdFdUaUlQeU9pbEdlVktjb3JD?=
 =?utf-8?B?SWx1ZFdKWXMxcWdSUXBVbnNPY0w2alRxeURZSm9iUUdHKzdvNDNrZFpBZzdp?=
 =?utf-8?B?NGlxMU1YckhKQ0hEWVowVmdJVjVQZWJ3OW4va1hDdGxKRjZYRFErOSszMFNF?=
 =?utf-8?B?aVFJU1RHVkQwR0hBY0Z1eU5tcEk2R25MODNNTVU2S3BLVlZwMVZBdUZaRjBU?=
 =?utf-8?B?U0ZVR3FBTENpMERmZDNLRjYwTzV3Q01aNHA5dW5OeHJ4SFVtYTcxUm1VYVVP?=
 =?utf-8?B?cjZMNUxPdVY2RUw4ZE1LNEFPbnE1dDB5K3dHcmtYSCt5aTJvYnRGSmE1bU9K?=
 =?utf-8?B?elBkS1NZQTdLK0ozYWRGa2xDOHVxNkNTSnVVeFYvMlVlZ2ZIT3Q5Z1N5Sk5H?=
 =?utf-8?B?cUovekRJS1VQdlVFdHJIMnI2VFV6SUJIWjBYVXBzUG9CMUdSejB1RTllYmRi?=
 =?utf-8?B?R3EvdTNaWEFMQVg1YzRIdENXT3lEWkNlVGZTSzcxdE9BdzdqQVVsQ3N3NGdV?=
 =?utf-8?B?MXJzU01mRGxxT1F4Tm5WZGRacjZCejZSeGM2SjNMRDlnRXhsb1hOY3BSWk5W?=
 =?utf-8?B?cHRVSHhESGQ3aHZvNWVhVG9BNHRUREt5cjJxZG5Zd0gxaXNFMWVNRlVRdThF?=
 =?utf-8?B?RG9IZXJ0VVFhRElMQytzMjZXYXpHekhkSFhBcmlhckZ3bW1YTHpnOTZOOSt6?=
 =?utf-8?B?MkFSUm5ReTVJZHd2b3ozM3JnU3NtaWRBcHQ0a0ZFZk1ycGhGM3pFVlV0RkVy?=
 =?utf-8?B?RXo3UjZBbG9TUExTN3VtSDdOUTI3ZWhVdHloN0xlVGdwUm81V0haRlFSRkN2?=
 =?utf-8?B?b2VaNHJzTWxNTnpUU1FCSDVNdUd2ZG1tdXd5Qm1kUGZpTVdNejMwbk1uaDRa?=
 =?utf-8?B?Sk1sUWxzTjZrbDNlT0NBRHZHdGQxSDUxcXpHOE9YTHlDZ0p4ZmpEbGh4QjY0?=
 =?utf-8?B?VW1FdVZLS3lXd3ZnQkp6Zm5xZE8wa2ErcEVaenJkZm8xZWd3M3p1WWtmeFBl?=
 =?utf-8?B?V05hQzR3dGVEQzgyMXdYWFhDWjBKaFdKcFVUSktCZUtkYS9xaTN6L290dHRV?=
 =?utf-8?B?M3B6dHZhSGFQNEliVjNwRVVEaVh1cSs5UjIvTUlPL2RNQldwRElmVENBMU5x?=
 =?utf-8?B?bm1CeGxZM1I1RHd1UWZ3c2dMZnBTeCt5dE0vV25CK1pKN09MSjFDcUJOV1lp?=
 =?utf-8?B?TXBJZlNSRVR0OHBvS2dudmlvdytVbGx5L2RIMExnbnN2U0lWVko1TTMwNkNi?=
 =?utf-8?B?QWsrQ2hUTmdMY3ZYWmF5OEZ4RkdlQWtqWjNZNng3dlU2Y3h3dFhXYXhvRDZ5?=
 =?utf-8?Q?Ci4tdPcgy5SgSGB3ZS4BJGs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 688b4663-ee39-44c3-d21a-08dce1d672b5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 05:03:54.6326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHyVoGB0T/zg4htzl5Ic74x00/p/jcvaDsdkJdgpAPYWOUvB2UYG+NC3vOvW4mbkawV/y4Ca+fhsLpt9RKMfrxUbo4Ze+RHDUlmtc5tzcvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6369
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



On 01-10-2024 01:21, Michal Wajdeczko wrote:
> 
> 
> On 30.09.2024 07:31, Himal Prasad Ghimiray wrote:
>> This field serves as a bitmask representing all initialized forcewake
>> domains on the GT.
>>
>> While at it, fix the datatype for awake_domains since it can have
>> value different from enum xe_force_wake_domains.
> 
> up to maintainers, but for me this is unrelated change

Ok. Will move it to separate patch.


> 
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c       | 24 +++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_force_wake_types.h |  4 +++-
>>   2 files changed, 20 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index a64c14757c84..5ce9e912818a 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -21,15 +21,25 @@ static const char *str_wake_sleep(bool wake)
>>   	return wake ? "wake" : "sleep";
>>   }
>>   
>> -static void domain_init(struct xe_force_wake_domain *domain,
>> +static void mark_domain_initialized(struct xe_force_wake *fw,
>> +				    enum xe_force_wake_domain_id id)
>> +{
>> +	fw->initialized_domains |= BIT(id);
>> +}
>> +
>> +static void domain_init(struct xe_force_wake *fw,
> 
> since this function is no longer taking 'domain' as param, then IMO it
> should be named like:

Ok.

> 
> 	init_domain(fw, id, reg, ack)
> 
>>   			enum xe_force_wake_domain_id id,
>>   			struct xe_reg reg, struct xe_reg ack)
>>   {
>> +	struct xe_force_wake_domain *domain = &fw->domains[id];
>> +
>>   	domain->id = id;
>>   	domain->reg_ctl = reg;
>>   	domain->reg_ack = ack;
>>   	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
>>   	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
>> +
>> +	mark_domain_initialized(fw, id);
>>   }
>>   
>>   void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>> @@ -43,12 +53,12 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>>   	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>>   
>>   	if (xe->info.graphics_verx100 >= 1270) {
>> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
>> +		domain_init(fw,
>>   			    XE_FW_DOMAIN_ID_GT,
>>   			    FORCEWAKE_GT,
>>   			    FORCEWAKE_ACK_GT_MTL);
> 
> likely above alignment could be optimized at least to:
> 
> 	init_domain(fw, XE_FW_DOMAIN_ID_GT,
> 		    FORCEWAKE_GT,
> 		    FORCEWAKE_ACK_GT_MTL);
> 

ok

> 
>>   	} else {
>> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
>> +		domain_init(fw,
>>   			    XE_FW_DOMAIN_ID_GT,
>>   			    FORCEWAKE_GT,
>>   			    FORCEWAKE_ACK_GT);
>> @@ -63,7 +73,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>   	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>>   
>>   	if (!xe_gt_is_media_type(gt))
>> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
>> +		domain_init(fw,
>>   			    XE_FW_DOMAIN_ID_RENDER,
>>   			    FORCEWAKE_RENDER,
>>   			    FORCEWAKE_ACK_RENDER);
>> @@ -72,7 +82,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>   		if (!(gt->info.engine_mask & BIT(i)))
>>   			continue;
>>   
>> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j],
>> +		domain_init(fw,
>>   			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
>>   			    FORCEWAKE_MEDIA_VDBOX(j),
>>   			    FORCEWAKE_ACK_MEDIA_VDBOX(j));
>> @@ -82,14 +92,14 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>   		if (!(gt->info.engine_mask & BIT(i)))
>>   			continue;
>>   
>> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j],
>> +		domain_init(fw,
>>   			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
>>   			    FORCEWAKE_MEDIA_VEBOX(j),
>>   			    FORCEWAKE_ACK_MEDIA_VEBOX(j));
>>   	}
>>   
>>   	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
>> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GSC],
>> +		domain_init(fw,
>>   			    XE_FW_DOMAIN_ID_GSC,
>>   			    FORCEWAKE_GSC,
>>   			    FORCEWAKE_ACK_GSC);
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
>> index ed0edc2cdf9f..fde17dc3d01e 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
>> @@ -78,7 +78,9 @@ struct xe_force_wake {
>>   	/** @lock: protects everything force wake struct */
>>   	spinlock_t lock;
>>   	/** @awake_domains: mask of all domains awake */
>> -	enum xe_force_wake_domains awake_domains;
>> +	unsigned int awake_domains;
>> +	/** @initialized_domains: mask of all initialized domains */
>> +	unsigned int initialized_domains;
>>   	/** @domains: force wake domains */
>>   	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
>>   };
> 

