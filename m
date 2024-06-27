Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7109C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 23:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBAF10E1AF;
	Thu, 27 Jun 2024 23:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AA559BjC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8D210E1AF
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 23:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719532203; x=1751068203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GTVzgJlFDqxERTZRkhPYI+XYFhtdXZQYIrP6S4l8bbU=;
 b=AA559BjCtgaYC1K9ctcV9Ws6K9yqpuQ4A/AhnaeyqEgHxCOFuNvepK6B
 lx2nDJPFVWsMMmq95K+e33ieWJgij4MnAWVu7sJIfWStCMeiRr07iJlF1
 CwwdoWUSPTbTeiRI8WO2W8Gtd3q3k6Fi1e40WQGMZpetmlEsesxBWz57p
 kOfw5mzxaRnxzMKeHXYN21K6NsEFokOevp48ed6x7BBjXt/nJ7YWP4WLj
 13N3Z1eDiyq2rsORjZhMEAk/1Qg3JcRTy7QcGIueXNAplyhB6JBAVOE2R
 oDVsWLtDiCQ534Xma7bY42FUjkUoikZO0USFRymhRIOeOq8OFTetln5k6 w==;
X-CSE-ConnectionGUID: dnjSuYlpSGKBFjbA94GQbA==
X-CSE-MsgGUID: 1bfwlwgXQK2fFaPcHHQQrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27384891"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="27384891"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 16:50:02 -0700
X-CSE-ConnectionGUID: nndomJ8qRBW1GbobKpae3A==
X-CSE-MsgGUID: xMAYMcmZSsKG+tKu/Yt7YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="44669032"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 16:50:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 16:50:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 16:50:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 16:50:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 16:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRyTc7dpudOrzEZnUr7C3YeTIog/n3ZjK7wA69CGVeSgyvgyI10UGmy3tWlIDVMgvGnz0GD32NxgqC0Nm07vwqQ0rmJf6bpA4AXBgiPXDybakzvzQfLliV+3yZTBMtEqJfwRhqcjgFpeIzhNq9Epd0Ejv96L/sRd6g8KSyldJSDlNuFp+ETGcN9jE78iLKeQK+84tZw4SajErs+9eOzSk8hGxdGXloBVdZLz+1pPLpe9Yr510nv9pqG9NNwj057fkms0xlVk6NHPviI1qhf7laE0BjFYTUIDzTnHwHukfhrYJpz65mXM2iM7QqdYrGtBLvF/VtRs/Ixkh1rK6sbL/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cU9DLZbE2yn3N3n/jaGktHhCcnM5lXlbwgUld7hxF30=;
 b=QJSEPQGsdru6nRAWNp63zNNWWaVV1b3v6Sm3ynslupregCjQD0omaQGKcZjI6LnNgzjrOwwCYaKj0IoIM0JuJvwwnIxhyzzv6Xb7Qii7kIbfU6fLBAyANU0ZnNpQ353WvVoqvnjHr7CUPvCUTfD8Yojjox2E+2NB2IwsMZ/tFsvGpRPz0H54Fdts3f58B+ER+gwml+ot3OnJhVAN/oWT+b2PyR6WD712M2VlT91Bg0x/syie1q5Mjg1rrw4O5nu+5uweDoOrk2EOAKUbVLOoedNJH7R3QbSe8NjOh+MNed9yox3NR85wDqdV2wWXh5+c/4hVXMZjHQ/KYfILk6QWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH8PR11MB7045.namprd11.prod.outlook.com (2603:10b6:510:217::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 23:49:59 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 23:49:59 +0000
Date: Thu, 27 Jun 2024 16:49:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 1/2] drm/xe: Use a helper to get delta run ticks from the
 exec queue
Message-ID: <Zn36pZg7njqr2wAv@orsosgc001>
References: <20240627172348.84991-1-umesh.nerlige.ramappa@intel.com>
 <20240627172348.84991-2-umesh.nerlige.ramappa@intel.com>
 <kv6aazz5pvucxo64xenzu6zyss3vk32ibja7a6clvf4khnsg7y@22fr4yhyg5ug>
 <Zn3MLsmFw1fnaJK+@orsosgc001>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zn3MLsmFw1fnaJK+@orsosgc001>
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH8PR11MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f0063e-b0c8-4dc5-7cab-08dc9703dadf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eW04MnJHWWxhTWRvYzRHVkprYWRCckJCNEhISUNmRmhhNmQ0S3JNT1YrTlR2?=
 =?utf-8?B?WFV4RlNBdnpSSG93QTFOeWhoaTdsS1VSS1d4MlNCZDJBMU5JUVNubHIrWW1R?=
 =?utf-8?B?RnBDZjQzK2d3NGZ6cXF6N3I1RFBjaWNyQnZocGZzcVFyRUJCMW1xYmxOV3Fr?=
 =?utf-8?B?LzBSb0R3aU55Tk1rWGFNaFhNaDJnRjczczFvei9WWVFlajBzenVpM3FURjZT?=
 =?utf-8?B?ZmZuSmU4NkMyUys0NVVHMlZSc1dqTEZmYmRiMm9tUGVSRzNURG1SQVlBSXA3?=
 =?utf-8?B?NUQ2bG5tMzljUCtQN3A0bnkxUmxXY280WTNzU2lLd2orUm5MT2tKZkVMNzZM?=
 =?utf-8?B?QkJ5a2thZTRtMnFETDJ2K2NrQlBIOGlZUHZEdi9Sck9oRk94dmtzU04vdDYr?=
 =?utf-8?B?ZWR1Vy84dVoyWlBoMGg2TG9kWEU5bCtwNk9CNVEzaC96MFppQ0s1OWc2RjUz?=
 =?utf-8?B?TmFENTZHejJlNkZJd3hIWUFUOUgyc1lKS0tIMUdVYXpBbnNseTNxQ0RTMW9m?=
 =?utf-8?B?Q0ZML3Bpci9PSnhrMkhKMkJGeWVKZUtVOXRjcENldlJvRHp2QXY5cnpoR3U0?=
 =?utf-8?B?NHZQY0ZtUTFWeGxEckJxRkxsbXFjTUNRMmh0MXpCbGJZdm16emRCRVFKYUdv?=
 =?utf-8?B?R3BGQWJRNjJxSzlTc3lpdEJxLytNVzROMGpibERWYXl0bzRtcm1yMGgvVmhG?=
 =?utf-8?B?SWtQQS80MXpON0x4aGZzUzdMaHZOYTlWRVJpYU12dXV0VzFrdEtkcHZWQ1ln?=
 =?utf-8?B?RkNRTFM4SW1ndzZUOFhSaGM2QlJOMm1aM0x1MiswNTgvNzNFbmNEWjNMemRS?=
 =?utf-8?B?Q3ZLVUJadDJDaC9XWEVlZFFYTmJPT2MvOE5sZ1h0YU5kdjlJL0FIZ09KUFZl?=
 =?utf-8?B?K2ZROG5MN05rZWFnZW9JYnhmQ0w4T1FzMG1nZE9iQjJZV0poc1QxUkxBZzh1?=
 =?utf-8?B?UWs2UVpoRXB1cCtRYXR4OVlmU0FqdWI5N1IrcjdRMEszNGhFVW93YldIUXUv?=
 =?utf-8?B?cHducEdVMWdrcXBBMmwyZnFWN0p3R3dCTE1qWVhqVThSVHBTZXpnRXNWS1Ra?=
 =?utf-8?B?dEwrY3hIMGx1VVdncVJqNDNBZVZiUG1Fb3QzcFJJcUkydnNzRnZaanRQZW8x?=
 =?utf-8?B?M002Y0NiczZWRmdUQ3VGS251UVBrR1J3UCtzMWdGTXBvL25xeEVYZk9ONmJp?=
 =?utf-8?B?U0xhWHYxZlZBVGpGc0hMNVRHL0EzOXR5QnVER0xjU0lCaC81VzljRHJBcCth?=
 =?utf-8?B?Q3JmYkR4aHdPS1Jwd0w3OWdDYkdUVExHcWxTeE92Znd4R0pYSGVnSGw3b2U5?=
 =?utf-8?B?c2ZkVUVhcmJsQm43ZmV6d290STNrdnFuWDQ5SHVxMzdpR2FhOXZjR1dFUllp?=
 =?utf-8?B?dVpWUHpveGZMU0Rkb2Nib3Nxd2hhT2VHb3BqdFkvMVZkNGZiWmo5MkREbUFa?=
 =?utf-8?B?dEowMXBzeVdzd29RQUlyL3Y0K0RNb2lVVTJsb0ljeHFHTFBPcnpueVRHL2VQ?=
 =?utf-8?B?OWRlVG1EbUlJajlRcFpxbHhQVFpPbWI3aks3U0VSZ1BHcXZGRG9vRnJZYUU0?=
 =?utf-8?B?ck1DZGRlcGdjTFV6Nnh3QWQ2dDY5NENvUWZYSmEwcXNRM0prQnFhU29IVngx?=
 =?utf-8?B?Mkx1NU1ScExROENJYVY4YlR5TTE3OVJpYkdPU2lqMFZiVG82VTdleitLWG5Z?=
 =?utf-8?B?ek94ZkcxbG5nd2RDakJqTjZTZTRJZnlISUJHTkZuSkIvcVkzQWJnNDFWWDBP?=
 =?utf-8?B?dWtFV3pOci9iaHRicndqd0U4ME52aXo1NVZUcjVvNSthKzJleWxEZlBod2FJ?=
 =?utf-8?B?OHFwNTVyaW1ndHZTdENVZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmNVMzdoTXgyaGtaeHJzNlc5THdGRjF5dDZMdk1jQzdtVS9ocjRqczQ2dlo1?=
 =?utf-8?B?RjYyRXFZMGE2alJ5b2hpWGtsNDRrQnhuQ0NLZTJDNXRieHNReXNSM2syRkdD?=
 =?utf-8?B?OW9peHdKVmtVTHdZc1FWZjFyUXpaeGxxeDluT1IrL2cxc1B0RHhrL3F4Qm96?=
 =?utf-8?B?OVE1UHJnMjRXakNIcVBNWktTaUxTamhyZ0RCTmdpdVpvNVlzTFFlRGUySlZa?=
 =?utf-8?B?Nmo4dlpRa1JQSHJGNFFCSjVpd29LSjVxMDhvcHl5TW9XVTFtLzJUbC9OWDBD?=
 =?utf-8?B?OVUxVWpVRWlyNHhsRTlDbkVZVFRQMy9kN3NlSWNMMWxLZHM1N3ZPcmhpUkdN?=
 =?utf-8?B?cXJLYTBUM2RwYi9IVGtoK21WNU5MZ1htUVdXOTcrWEdId3pwNUVkelAzQ01T?=
 =?utf-8?B?bCtPTFZMcDU5cXdKUW9PRXoyMzlrREVFbUdWWTV2aTQzV3dGRzhPb2xXaHcy?=
 =?utf-8?B?QjdmOUZZNy9pOGp1dzFtaHIvSnlaWmVuTTdIb2tFbzdndmhVZXVlZitUTitJ?=
 =?utf-8?B?TkQ0OWNzQVk2K3pKNjVGUno5WjJKSVAvL0RJUjUxb3owc2VZdVhxdFFmVENM?=
 =?utf-8?B?Y1E0bGkxWnV5UU1YQmxTZGxJb2ZFTjhKMVl5YWlDMTRwVi9XajJPbTludHhw?=
 =?utf-8?B?L056emxVSkVCY25WTDhBWndNYWJWRDRJOXVOK1lsbk0rRUJBbjNlMWRjck9T?=
 =?utf-8?B?OEFQMGxnQ1UxOW9mbVZDUnhTUVd6bWlFdUt0aTR6a3dxbVIzQ1ZjL3dhS3I4?=
 =?utf-8?B?T3ZCbkhISnNJdWpEeVovZDBnSHlTR0hVYm1oNWJOb3h5bWdQVjNhQjliUGZa?=
 =?utf-8?B?SDhOYTNwaktkVW1tVG5YdEpTZzhnNFRBYzB0Vk9ERm5jSEduTGVvUWZZbzhP?=
 =?utf-8?B?YlRCRGRFaFNVMEZDcFF5cTdvbm5yU3AvcW9QWlp4cGlKdGd5NllGUmlCU0pC?=
 =?utf-8?B?K1l5Tjl4Q096WDZ6WWF6QVNDa3c4SnhLcHJPdU55dVlwN2lEblJCZ3J1TGlh?=
 =?utf-8?B?R1hMSlZqN3pYaHlzT2xCSHJJZTRPTk95dUMxU3FBUGdkK1VQZmhuZHA0V1dn?=
 =?utf-8?B?VG4ybkEzY1I3cHdxTXhyTUU2TDlsM3lLaS8rS05zNERvRmVHV3ZyWExlSEJB?=
 =?utf-8?B?WXFGeXhaYlp6NVZucjRlWUpwMm5sTDI3SDZWeG1CQ2UydDZ6MEExRjEzdjA1?=
 =?utf-8?B?SWhLYTRRT204VWlRUzBISDV5aHV6MUxjcE9xZDZOL1dyNlV2OVE4M1lZVStW?=
 =?utf-8?B?TXJJcm90Snk4dGF4bmdRcE5jb0pXTWZ3NjBYNGk4QU8wYVdHSTREZm55ajVB?=
 =?utf-8?B?TTZNaE5oUEZQT2hDU2p3d1ZldjNCbE9YT25yVmp4RzlUZG1UT0ZCd0VCcjEx?=
 =?utf-8?B?WlkxbWVXc3dPbzBEaGtFMm5oekx0VGxIM3RCRllQbkh1RllhUldMeUJyZmV1?=
 =?utf-8?B?SE5ueGJpVSt1WVBaVXhJWmoyTWtRZGl2aTBJZ0xrVS9adWZhM1N1NUdPRkVr?=
 =?utf-8?B?d3BBVXNlUlVXZWJOMXhZMXpobENKRm1MTDNhK0ZsaXZJUjZuQWhPTnF3UDZa?=
 =?utf-8?B?dFNhU3VrdGFMOThjL2JpZTdwbU95cGMyUk9iWHUvMjNUVzNJT3EvNFVQbFZx?=
 =?utf-8?B?NEJhOTQxL2FjeU1HbmI4VFM3NWhkQ21xZlp3RURLSzdWcmZHL25XczlETFl4?=
 =?utf-8?B?eEpRc0pBOEJ6NU82dlVRR043MnZxTFB3NldCK0VNcThYMEdVQTkveWRLMitF?=
 =?utf-8?B?SU9FZG03b2NHVEhWZmNTR09OdDAybTZiV0F0RW82UzdjL1IycDVuMENuNlB0?=
 =?utf-8?B?enJEZW1oTWdaZDg2RjlJekxyNnYvdm9YdVRqckJtS21OOExmcGtCTkJKTlQ1?=
 =?utf-8?B?dVZzYnY0SEtqQUpKVnZvR0thRmMrc08wMW1Sdll1aStaZTJ5YWd4aUNyTlRx?=
 =?utf-8?B?Rk1OV2FLazJEeE1yNjBLc2RXTGZCdVF2SDN3bVZwZDRQaEUwTHBUM1RpL3JP?=
 =?utf-8?B?YXVacnY3VlBUNDYzSUpZS0htcTJjUGZFcDhUaXNHTFJQcEh2U0dZYk80dWs0?=
 =?utf-8?B?aTV5SEQ3MSt0WGpWSHlPY0ErOGdKcmFqNVgySEZkZmpDbis0ZUVRZTZKSWhv?=
 =?utf-8?B?SnpCNUxyTjgyd1pwVFBMcDJRUWlJNXFMQkNtRXh4ZkVsUVZzWjVZdStkOXJv?=
 =?utf-8?Q?kWOqrMeERUIdOZMnTB4o2GI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f0063e-b0c8-4dc5-7cab-08dc9703dadf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 23:49:59.3844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGY7Lj6VIVBeCRUb8AavgZNFAKINfS2n9RFRPzxsvosMguSe0/K1R8HP5MRYykYzalq9EeyeA8mc/CZi/1EtDJ8e9TnkS22cTUNoWVcNeso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7045
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

On Thu, Jun 27, 2024 at 01:31:42PM -0700, Umesh Nerlige Ramappa wrote:
>On Thu, Jun 27, 2024 at 03:24:23PM -0500, Lucas De Marchi wrote:
>>On Fri, Jun 28, 2024 at 01:23:47AM GMT, Umesh Nerlige Ramappa wrote:
>>>As per earlier review feedback - code manipulating exec queue fields
>>>should not be present in xe_device.c. Use a helper to get the delta run
>>>ticks from exec queue.
>>>
>>>v2: Drop the Fixes tag
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
>>
>>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>I think the names are not very good for what this is doing now.  It's
>>not clear *_delta_xxxx  will flush the previous accumulated values.
>>
>>Maybe it'd be better to have:
>>
>>	xe_exec_queue_accumulate_run_ticks();
>>	xef->run_ticks[q->class] += xe_exec_queue_flush_run_ticks(q);
>>
>>So names are clearer and you don't have a function that does 2 things.
>
>Sure, I will rename them.

I think I will hold off on this patch since I need to add the reference 
counting for xef object. Once I do that, this may not be needed.

Thanks,
Umesh
>
>Regards,
>Umesh
>>
>>Lucas De Marchi
>>
>>>---
>>>drivers/gpu/drm/xe/xe_drm_client.c |  7 ++-----
>>>drivers/gpu/drm/xe/xe_exec_queue.c | 18 ++++++++++++++++++
>>>drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
>>>3 files changed, 21 insertions(+), 5 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>>index 4a19b771e3a0..e0c4a50d372c 100644
>>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>>@@ -251,11 +251,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>>
>>>	/* Accumulate all the exec queues from this client */
>>>	mutex_lock(&xef->exec_queue.lock);
>>>-	xa_for_each(&xef->exec_queue.xa, i, q) {
>>>-		xe_exec_queue_update_run_ticks(q);
>>>-		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
>>>-		q->old_run_ticks = q->run_ticks;
>>>-	}
>>>+	xa_for_each(&xef->exec_queue.xa, i, q)
>>>+		xef->run_ticks[q->class] += xe_exec_queue_delta_run_ticks(q);
>>>	mutex_unlock(&xef->exec_queue.lock);
>>>
>>>	/* Get the total GPU cycles */
>>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>index 0ba37835849b..4d90a16745d2 100644
>>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>@@ -786,6 +786,24 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>>>	q->run_ticks += (new_ts - old_ts) * q->width;
>>>}
>>>
>>>+/**
>>>+ * xe_exec_queue_delta_run_ticks() - Get delta of queue run_ticks
>>>+ * @q: The exec queue
>>>+ *
>>>+ * Update run ticks for the specific queue and then return the delta when
>>>+ * compared to the previous value of run ticks.
>>>+ */
>>>+u64 xe_exec_queue_delta_run_ticks(struct xe_exec_queue *q)
>>>+{
>>>+	u64 delta_ticks;
>>>+
>>>+	xe_exec_queue_update_run_ticks(q);
>>>+	delta_ticks = q->run_ticks - q->old_run_ticks;
>>>+	q->old_run_ticks = q->run_ticks;
>>>+
>>>+	return delta_ticks;
>>>+}
>>>+
>>>void xe_exec_queue_kill(struct xe_exec_queue *q)
>>>{
>>>	struct xe_exec_queue *eq = q, *next;
>>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>>>index 289a3a51d2a2..42f683e5d88a 100644
>>>--- a/drivers/gpu/drm/xe/xe_exec_queue.h
>>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>>>@@ -76,5 +76,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>>>void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>>>				  struct dma_fence *fence);
>>>void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>>>+u64 xe_exec_queue_delta_run_ticks(struct xe_exec_queue *q);
>>>
>>>#endif
>>>-- 
>>>2.34.1
>>>
