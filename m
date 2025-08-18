Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27DACA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 15:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963C110E467;
	Mon, 18 Aug 2025 15:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ieuVri3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83FA10E1EA
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755529422; x=1787065422;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=H3va3b7EVRnI05lCd6thebRhzOLAnIW3p3DDEXK0H2E=;
 b=ieuVri3Kw/eP8i4Zuo0/SatMofIgt7Ut9ACOUyoDlNji8NfsEbGPc9V4
 LHKUOkk+owr8KP1+Iweg6xeslVVleKxXQ3r4/3GYbNvb8H6PqHhiEprD/
 VEL/BP9QFOiCkYeHFk6SQIzXTJv2Mx+uSPWy3leZ+TJmmbS5Dny1j76/Q
 RblXIS6Z7clCA2/XSsM4b4Zowwm0cPFRE93SdSg4Hg8Hwna6FHhsevurb
 Hlyy+5G1hjD3AKQ3sHgwwYCnl8DIiTPgiAxaX3GHHFK+uTywsOMlZxqVh
 ZuL/rnXZP2JB7U/1oIRet7dOeYw7Q6lM4+OHGto8JfyKiSlfIah+poHZG g==;
X-CSE-ConnectionGUID: u4nI2l3+TeGBpM8c/2Flpw==
X-CSE-MsgGUID: Br2cFvoxTKWHldLOA6eojQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="83184568"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="83184568"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:03:41 -0700
X-CSE-ConnectionGUID: VxZZcN4sRNOJWsxvOEPOxg==
X-CSE-MsgGUID: i545a0JqSvWxSisbTtMD5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167109937"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:03:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 08:03:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 08:03:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.54)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 08:03:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDi6Y5y5OQtK9Lui5Tqda1GWKK/7an7B+kaQth89OvGcEMQoi2Mqk2/wQ0EF6iD7vUK55U5/nqoif7MMDG4eJfaIxjOV+2LfjviXAd1PhzLoVgSzcW6E/pvn6wEy4YORNsC4ayySJkHKVGuWJEKXL0Q3wAgJ/h4I3xiJIYQ4nkpzrP7HHqXjcUxJio3HtlndMQdqv6HasL+rI+xabpQ0igq4s55+mX7bQf+3yXjSWbGfZBFIGpzp30jATUIlbT38KMUbj3XVpMtkE3ilHS9we7qznAgxSSDNseJRPbEWjaXChOMnkToXONT3S/vPi4vGJQuc3dwlk+fKO38tw+W/nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP/CF0EVikofkhjUqdgfLurmHHctYiIbzHcTYFpk6rE=;
 b=h1X14NSNFpznxXkDxdPFFLyJZyK8TyqLUVtuvXy4K2blG7EJCXnH7XjweOL+xrRLnvIeMZb3PGk7V38rJBCvxwaSYgHj0HlBrB5bkt3SzSv1bwvC5wi598KTxblmVN6jGh9M0XyLcbIkIQsFZuIyKqk9fs/BUNN1zt1pr3sEv24e6Ku9i2MRzCbI4jgKSqDgT70iHMeeAXI2B0+m1T/BB7HaQBkYDEe77Q0eqJiLAD6vK9Cy/eY+kCyVl/ZrS8LfSwC7fYEYcB5t9jtVgQPqCupLGsIS1KXWT3mYM0E7ffAw5XNTs9uqDEsHDN7zEkd29ZNHvQLfRYB21FmNc8M9lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ5PPF0DADD6EFE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::80d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.21; Mon, 18 Aug
 2025 15:03:39 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 15:03:39 +0000
Message-ID: <06564304-8c58-4efe-8d52-670ddf41d0a6@intel.com>
Date: Mon, 18 Aug 2025 11:03:38 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v6 1/6] drm/xe/guc: Add log init config abi definitions
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-2-zhanjun.dong@intel.com>
 <63752d27-52fc-4c8e-a7ea-3609c077a70f@intel.com>
Content-Language: en-US
In-Reply-To: <63752d27-52fc-4c8e-a7ea-3609c077a70f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:303:b5::23) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ5PPF0DADD6EFE:EE_
X-MS-Office365-Filtering-Correlation-Id: ca220aa8-47b1-496c-d25f-08ddde6869d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGtIY0Y3ZmxrMUE5bFhWZnNEeTRYNm11RE9VME96SHhnZ01mWlVySnhGWjB0?=
 =?utf-8?B?RVlNVytRdEVpN2FuYjFkb3hnMnR3UE05OXEwbWNMSTZNSksrbm1uZE42OVBl?=
 =?utf-8?B?dHg4R1JwVzZQNVlyNUdhRjYrYjNWWjNRNkROYXl5SjU5K3hOcTBUM2JjL1p6?=
 =?utf-8?B?VGVqU05FajdUbnlHVXRpNE16a1dtaXArZDNJOG9CZ3YxekZscjIxd2FFelpL?=
 =?utf-8?B?YkFPMlBSNmJzaWcwL05qdzRPK21iNUFEVzVVTXlDQ05mUTI2Vk44Nkk2bHFv?=
 =?utf-8?B?VHVodmdONHVsc2sybm12VjgybU1UcmVYWmg3eGIyc1Fudnp0RzdhN2tvY3dh?=
 =?utf-8?B?QkQyRFM4U3ZROFAvb2kraEZIWXlEVlovMWRHc0FDem13a1JaL1h2cEx4UFMz?=
 =?utf-8?B?OU1iLzVlRk1USHN1SndTQVNqWUJ4N2lvOXZNRGlCQlpwaGFpRklWc1dGZlFT?=
 =?utf-8?B?c2VDV2pqZmJOWnp3OVNCZERyd0NQdXlubUhLTkdHL05VNTE0c0tGOVRZYjVs?=
 =?utf-8?B?OGZueUpIaHRGMWtOVnNlT1ZHL29Vek0wUEkwN2RIWTROWFZ5WjBEdlFzM05I?=
 =?utf-8?B?cWp1QmFlVTFkaENSZTJZVkRyajhDSWx1TTVkTVJ0RG9HeDRzWG93UmpWakFK?=
 =?utf-8?B?NjlSMFNUR0xaczZjT28wdnRwdEpzOTNxKzBkbnF2MXlmMklKK0dyZFJrbGZl?=
 =?utf-8?B?ejFoaDdtQ25kcWpKUmIxWWRQdzZrVUxvdjJDUTNmRUhTbjQ3VVYxM1NWbHIr?=
 =?utf-8?B?OFFLRXN0YU00bXlPSHRvZmRVU3UrbUxIQkVRd2VxQ1NZdU9SMEw4RGJ3dEFS?=
 =?utf-8?B?NlBnY2FGTDlkT08waTdzbi9DZGRtT3ZzQXRKU0g5UTZhSm1JeXpkQnB5L2NM?=
 =?utf-8?B?RlFBc1FuMXlUcWp4RzFrbmVkL0FqemlwdTR6cnp3Rm5sdjJ3Z1lVdFlMVzMy?=
 =?utf-8?B?YWpKOGhEVWxaQ2NOazlDNEMrMEJhWTVFSHlxYUtxbTQ1dDNkTUM1clFJTkkx?=
 =?utf-8?B?L1draDJBYlJTenZ3SDZ4aHhyYkhqYzdOS3ZmSUVvSWZrdkxCR2VQNmpOWU9r?=
 =?utf-8?B?dmE1M0VVRVpTRHh4S0dNZ2tmVHNKQyszTUJ0eUVyUVRHdUlsUGM5T1k2bytQ?=
 =?utf-8?B?VzBrbFdPczFGZ1pRb0N0YngwdzJrTnhCNjJzdjlsbzZJZzVqSjZzQ3pDRVJJ?=
 =?utf-8?B?emVUWmFqTFdJOVlkMVdCR1ZzU3hVY2ZZSnBmeHNEVmRKNHVnUHlVTGdtb1Ra?=
 =?utf-8?B?SjBubklHWnJvNU1VMm9rT1M0WnVRZWtoYjlMelYvclEyOFZEMFU5bTZtaTUr?=
 =?utf-8?B?Ni9jMlUwV0xmdXBXM0lwVitiekhIdElhbGZmb3pOOGo0dll1RzN4cmxSYk0v?=
 =?utf-8?B?SjljYWo3UVZqMTh0SFh0K2NFZjg1ajNadEZKS04vS1JYTTh5MFJQYmZaV3JK?=
 =?utf-8?B?Y2hMOHBxQmVLS2VEVXNTQytqUTVZbnVnZVdCaDR5aHFMZlN2VHB4dXJsTFdF?=
 =?utf-8?B?d0ZxVjViM1k1bUhWSXNwSDNoSk5mc3BqdUFlT1VBQnJMdjNiYm13cUFTVnpp?=
 =?utf-8?B?MU9hYUJyVnBBbmVEWFMyTkdjemc0Ym9WNHh2RTFtcm53NmtRVG5jc2FOM2c5?=
 =?utf-8?B?dGZWM1pNQUZjTmpMVGMyU3BlQ3BPK3B1RDBwNGFrVXRNN1lwUkhGYXRDOVBW?=
 =?utf-8?B?UEFWcHZuSWswK2hWS1lHWW9kUGFQczQ1aWN0Umc2cUxGTVZTSjhaTnpWenRR?=
 =?utf-8?B?RGlhYktvK3pKUExadDNraGhrUzBYdUluVWt1L3RUQThhWlo4cC9WZ2RjMnlX?=
 =?utf-8?B?VFR0dDdTbXpZUlc0dmZHeG9yTHdHOWpFbGVtTmRESEpsYVVXTWZJRW9LRTBW?=
 =?utf-8?B?YkdIYWpTeWNJemEzTUVFYWpLZHpDdGxHVVoxNm1IelRYZlFQbjlCTGwvL21n?=
 =?utf-8?Q?nl0tinSCkY8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXdZa2EyTFNVVktJYlY4bDl3UEt2dXZuSkVxWVBLUTg3NmUxMmgrbTR2SEIy?=
 =?utf-8?B?OHUyMEJkZzE5TXB2eEQzSmRUVjRSTm44UHlDUkwyUFJMcHVtYzdmeUt4QkFm?=
 =?utf-8?B?SGFhVVJaeXVGT24yek54ZXlmUEd1UkI4blRZY0JUWDdQTU5adFMzRFl4dytu?=
 =?utf-8?B?eWxEdXMreUtENllsZ2doSEs1YmN3SkxmODNTSzBtd3E0WlZsYnVDODMrRGZZ?=
 =?utf-8?B?MHlNdGkySnEyNHlyNlVtWW5SSkJCWEpleUFta0MvbkVGcWY0dWkzNjA4Nkt0?=
 =?utf-8?B?Vlp6bkRDbThBRFJGUG5DUUErN1BVK3hzSE9EZGhsaFEwc01xNHFUZ1h5Njcy?=
 =?utf-8?B?emNIbEx4UHA4Q1FRd3p4dEhhRlgraEpFVEh1R21wVTZmS2dOYlBmL1dMREFw?=
 =?utf-8?B?Z2QvYUF2dFlZLzJpek9CYUhCcXpmT1FURVR5V1NlZVVHRDVmcTIxUUs1V3c3?=
 =?utf-8?B?LzJGdEFMR256MGhCQklYVHlTN0ROdXZrQkp4dUFTdnFnUkVLUWdrQkxPWkNY?=
 =?utf-8?B?dUpYbzRaVi9oUnVoWGppaHdnOGJ2UDA2bHZXdGpKaWRNVXhpSDc1WkJldHZ0?=
 =?utf-8?B?UFA1Q25qNFp6MW9Xb0pDbGwwQ3htTDlydFA3NFk5ZXdDWitVZ0Q2NHp2L2pv?=
 =?utf-8?B?MVRuUERWcEZROVhBaUkzblg0ZFRhMWdFVy9KQk5GVjM4UUl0ZE15emtDWDZQ?=
 =?utf-8?B?VVlqa1Y3cE5KRkNsbDBtRjhNNERGUEVKSjc3L3c4ZElYMit0NmgzNXFrMWlJ?=
 =?utf-8?B?dWZod01HK291M2lSaWVDdGdPUDlGMzdHYjFJRk9IL2RQL1RIM3RKNENkMGZD?=
 =?utf-8?B?NndhMU4zK05KRUduU0FOZTVrUXljenk2OVo5N3hiL1Nid3VOYldRdG9iaGZG?=
 =?utf-8?B?SmJDS2I3VHpUU0U3eTJYZTliRGt3SXRZSWd2cXVqQU5mUkpOcmVzcmFER3F0?=
 =?utf-8?B?dk4vV01aMEtzaEVTcFZwSlN0VTEvbTR2U1BTd3gwc1NDOXludXBLYXpEMmhy?=
 =?utf-8?B?UGlBVEhwMEpodmxhbDVqZ0ZXaU43UldaMUp2Mmx2ZHVwZGtYUFB2T3FIeEZH?=
 =?utf-8?B?RFJpWlU0VlI4bG5mOUViZE5hdUFZVURCeXVoRDllTXdmZnF1bVBrSUdZOTZ5?=
 =?utf-8?B?THF2YzJLanBuc0YwMkxqQmxMUm5CeTMyVVNCZ3BSa2pRZkphaWpucXE1ZWpR?=
 =?utf-8?B?bUNoWUMzZlFRU214VFhRbXVFTGoyZlRXdytNWUNVQ3Zud2NuK3JZYm0rZkh5?=
 =?utf-8?B?eS8xQVlETFZkUmJoK0xoYzdzZ0pRUUxWdjd3NitUVW53NjlCZGRQS2RmaS9r?=
 =?utf-8?B?aUtSTUMvTm05ZmRTTExONjZhUlhycmNvMSszS1diSExldEw3MTZJYncvZFRv?=
 =?utf-8?B?VTRKY3pGb2grR2FPYzVLSS9xeExXLytDTTNtZm5GRkJQV2xFc29uZEJZZUpz?=
 =?utf-8?B?QmJiS2lCOTVUWVNYU1Y2dmZtbFpLdTN0QkVEN1AxUkxLUW1qeVNBeGpDYXlt?=
 =?utf-8?B?VjM5N1pLU3orbUpzV3J3UFRNeitTcXQ4cmFkaEZWUVBCaSt0cUdHcUVYYUI3?=
 =?utf-8?B?c2VjQk9oUzkyNnQ1OFpHK0phWHgyQVEzS2N1M0E4TjVZSytzY1FiTGhuV25F?=
 =?utf-8?B?bjZSd0ZHbVM0d2x2eW1hUGJCM2FSRlhTT1RlenM0S2Y2UDdFaWoycnJsQmRW?=
 =?utf-8?B?K2J0WDMxejdGcTZLSGJTeWR5SnliZXBoWW5JYXVDclo5U2RzSVVjUk5NWUYz?=
 =?utf-8?B?NXd0ay8xcWFqQlRhV0VSSTdxMDloVHVlalc3ci9XZTl3djhwdU9SNmw3VTZ2?=
 =?utf-8?B?Yk1BZVBIaWZPZXNwSmhsMFdOaExKQkhwUnZNbTM2Y01nYTV1OGIyZElYQnBp?=
 =?utf-8?B?dUlFd0diWlNXd05YQ09OQmQwaWhmQ2lYY09Ib05NZDQzU3ZBbGNTcTBxVllH?=
 =?utf-8?B?SFh3cTZyM052UUppOWp5c2NXNGkwS29mOUh4cE9Sa094enBrYngrV1RlaUtn?=
 =?utf-8?B?ZDU4R2V5RHk5QkdLeVcwbzBzdDMzWWU2MFg3UDBYZ0Q2RG9rU1FFVlJHUXJO?=
 =?utf-8?B?OXJXdWFvS0FybTVXOU1jSEFUV2ptekRsVW5VczhaVkZlTWVxVnJMTVBMRk5m?=
 =?utf-8?B?TVMrUE9JbEFCOFZrU1NmRVFYMW9sdmRjUnpTdGRMdDE1TDAxRFZHV3NqWE0x?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca220aa8-47b1-496c-d25f-08ddde6869d7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 15:03:39.1694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Y1ru5VQrH0cQVqQ7FDLDJu+4o2dwsjbFhwU/GimXB/vtb/DcuV/kOmP+f4/4vk3EK7ePwVU5rjR2s8Jvr8snQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0DADD6EFE
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



On 2025-07-29 2:34 p.m., John Harrison wrote:
> On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
>> Add GuC log init config (LIC) ABI definitions.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_lic_abi.h | 107 +++++++++++++++++++++++++++
>>   1 file changed, 107 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/abi/guc_lic_abi.h
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_lic_abi.h b/drivers/gpu/drm/ 
>> xe/abi/guc_lic_abi.h
>> new file mode 100644
>> index 000000000000..a4e27da304cd
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/guc_lic_abi.h
>> @@ -0,0 +1,107 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_GUC_LIC_ABI_H_
>> +#define _ABI_GUC_LIC_ABI_H_
>> +
>> +#include <linux/types.h>
>> +
>> +/** enum guc_lic_type - Log Init Config TLV IDs. */
> We use KLV in the Xe driver not TLV.
KLV is Key-Length-Value
TLV is Type-Length-Value
as the Key here is the type, that make it become TLV, is it right?

>> +enum guc_lic_type {
>> +    /**
>> +     * @GUC_LIC_TYPE_GUC_SW_VERSION: GuC firmware version. Value
>> +     * is a 32 bit number represented by guc_sw_version.
>> +     */
>> +    GUC_LIC_TYPE_GUC_SW_VERSION = 0x1,
>> +    /**
>> +     * @GUC_LIC_TYPE_GUC_DEVICE_ID: GuC device id. Value is a 32
>> +     * bit.
>> +     */
>> +    GUC_LIC_TYPE_GUC_DEVICE_ID = 0x2,
>> +    /**
>> +     * @GUC_LIC_TYPE_TSC_FREQUENCY: GuC timestamp counter
>> +     * frequency. Value is a 32 bit number representing frequency in
>> +     * kHz. This timestamp is utilized in log entries, timer and
>> +     * for engine utilization tracking.
>> +     */
>> +    GUC_LIC_TYPE_TSC_FREQUENCY = 0x3,
>> +    /**
>> +     * @GUC_LIC_TYPE_GMD_ID: HW GMD ID. Value is a 32 bit number
>> +     * representing graphics, media and display HW architecture IDs.
>> +     */
>> +    GUC_LIC_TYPE_GMD_ID = 0x4,
>> +    /**
>> +     * @GUC_LIC_TYPE_BUILD_PLATFORM_ID: GuC build platform ID.
>> +     * Value is 32 bits.
>> +     */
>> +    GUC_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
>> +};
>> +
>> +/**
>> + * struct guc_sw_version - This structure describes the full version 
>> of a
>> + * software component.
>> + */
>> +struct guc_sw_version {
>> +    /** @dw0: A 32 bits dword, contains multiple bit fields */
>> +    u32 dw0;
>> +#define GUC_SW_VERSION_PATCH_VERSION        GENMASK(7, 0)
>> +#define GUC_SW_VERSION_MINOR_VERSION        GENMASK(15, 8)
>> +#define GUC_SW_VERSION_MAJOR_VERSION        GENMASK(23, 16)
>> +#define GUC_SW_VERSION_BRANCH_ID        GENMASK(31, 24)
>> +} __packed;
> Is there any point in having this defined as a structure? Elsewhere we 
> just have a u32 in the parent structure and the bitmask definitions for 
> access. Given that this doesn't even have a parent structure, it is just 
> the data field of a KLV, it makes even less sense to have a structure 
> defined for it.
Sure, Will make it a u32.

> 
>> +
>> +/**
>> + * struct guc_lic_format_version - Log Init Config Structure Version.
>> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
>> + * than 1.12)
>> + */
>> +struct guc_lic_format_version {
>> +    /** @dw0: A 32 bits dword, contains multiple bit fields */
>> +    u32 dw0;
>> +    /*
>> +     *  Log-Init-Config structure minor version. Must be
>> +     * GUC_LIC_FORMAT_VERSION_MASK_MINOR
>> +     */
>> +#define GUC_LIC_FORMAT_VERSION_MASK_MINOR        GENMASK(15, 0)
>> +    /*
>> +     *  Log-Init-Config structure major version. Must be
>> +     * GUC_LIC_FORMAT_VERSION_MASK_MAJOR
>> +     */
>> +#define GUC_LIC_FORMAT_VERSION_MASK_MAJOR        GENMASK(31, 16)
>> +} __packed;
> Again, why bother with a structure containing a single dword. Just use a 
> u32 in the parent structure.
Will make it a u32.

> 
>> +
>> +/**
>> + * struct guc_lic - GuC lic (Log-Init-Config) structure.
>> + * This is populated by the GUC at log init time and is located in 
>> the log
>> + * buffer as per the Log Buffer Layout (In Memory). The array of guc log
>> + * buffer states plus this structure must not exceed 4KB
> The last sentence is an instruction for the GuC firmware implementation 
> people. And the 'as per ...' is a reference to another section in the 
> spec that you do not have access to in this header file. I would just 
> stop with 'is located in the log buffer memory allocation'.
will follow the recommendation
> John.
> 
>> + */
>> +struct guc_lic {
>> +    /**
>> +     * @magic: A magic number set by GuC to identify that this
>> +     * structure contains valid information: magic = GUC_LIC_MAGIC.
>> +     * Used to verify the information in this structure is valid.
>> +     */
>> +    u32 magic;
>> +#define GUC_LIC_MAGIC            0x8086900D
>> +
>> +    /**
>> +     * @version: The version of the this structure. Represented by
>> +     * guc_lic_format_version
>> +     */
>> +    struct guc_lic_format_version version;
>> +#define GUC_LIC_FORMAT_VERSION_MAJOR    1u
>> +#define GUC_LIC_FORMAT_VERSION_MINOR    0u
>> +
>> +    /** @dw_size: Number of Dws the `data` array contains. */
>> +    u32 dw_size;
>> +    /**
>> +     * @data: Array of dwords representing a list of LIC KLVs of
>> +     * type guc_klv_generic with keys represented by guc_lic_type
>> +     */
>> +    u32 data[] __counted_by(dw_size);
>> +} __packed;
>> +
>> +#endif
> 

