Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D71C36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 06:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0233610E1EF;
	Mon, 28 Apr 2025 06:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBfJflaB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDDE10E1EF
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 06:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745822742; x=1777358742;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dh1FBtfGFrx5wMEI8rAwADyY2jEjICemQLofeyNLjC0=;
 b=fBfJflaBq5yl2nGltvwJvWZiH1EXo2wZhhLhvkPFx1a2olUX+ysjz2N6
 tKko5bo42RRj4+Oen3wFmBOAhSIurVPCfFLKF98UGuRLP38VBHBPLYk/U
 NHJP8J6Bs+Ol0JvQ9/0Hw+eCPEnnWitiQnHQC5fMBM0tXMin4aD7ZgRaM
 4ii+JKbznkXLO91Ri6COJGy6IgF4KL3PTmAHWogIcpm2V9qb/iaWwNJRv
 m4WxaG3nAAuuIU+3aCdxAMpFs6UNqdOeqPahZ6Hn8R9bj0w2aFXgOffgV
 vqBgITSGfL4c9QYHa5L0St5GRZDq0nEAPcaESPRz9yIw4E82LGvLBQeaN A==;
X-CSE-ConnectionGUID: /EwW62b9QDCrk3pqyPHEmQ==
X-CSE-MsgGUID: kyko7yvmQPuZL7juS+0tLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47527754"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="47527754"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 23:45:37 -0700
X-CSE-ConnectionGUID: cV2kRfm/SdO0IeAJsqQX0w==
X-CSE-MsgGUID: Xt1ftnyfR/eMQbzKQ8Lwbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133915388"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 23:45:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 23:45:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 23:45:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 23:45:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wu4GwElIZYHrHyI5/NV++pREVWZ3XMrU8gy+o+M8VtSpudzC0qBhPaOKKyRhBps6fzbPSPvt/He+Xo8JBlyJBnlC82NzKybuvGwR2yvKKyqexsBaNZP+LobSqFiYyng3dGR8p5uZEJFV8EYt3ThTK+R1zu4wZXyDLkXRyWMJORDFTwFnzSUAoKVZ6tdi+jNarLAhZWyr96zu6ISoHvdSDfg7JhfoQb5iknEvgfduBIhfigTMwB4wEfznj4SlJGAMkS5uJbtGIC3FLBR4iK9kSM5WsERNg/QVuZmRW5+VUFL2e9ZDRUVzloObdmL5VZXT7dcO8pfgOuXNHVZClbhIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rMY5Iu+klniEw6lk/1tqvAZj34p7xtDQfoUDWYR7zs=;
 b=SOskY4Tj4GIpXSPFlry5E21jTGjMXmI8NouEIEU9uLnqMtAoX/UDWbCSz9au9NRNIAnzBCMAYSAdu/oz/dO0Z892fz8c2/sx55GpZG3eVUkeOOnNy2/AvAFjKJ/uCBr23WFbTlTeXQHfeRmIhfgY2Yq9wEfRM7bIilRv/RtcorE1erOHvHlTTeVLrGkjjulOwzrq89RN1Ix6aQxOjF46m2939rRX/NoNfGGTkz/K2nClXE+xk6+CP8I07q9u0p/FlAJEdsySHZcL8z0jqJbfDFOIMK89lSOEL7MX86YEp+Jh/1U/kxqzTDEw+q3XzJvWTTsx0GOiHFZQEIqxbB2Tdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA4PR11MB9105.namprd11.prod.outlook.com (2603:10b6:208:564::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 06:44:48 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 06:44:48 +0000
Message-ID: <a67a17f3-1b02-4aae-9d70-acc804ddab5d@intel.com>
Date: Mon, 28 Apr 2025 12:14:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/32] drm/xe/svm: Implement prefetch support for SVM
 ranges
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-15-himal.prasad.ghimiray@intel.com>
 <aArN085FxU4PAW8w@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aArN085FxU4PAW8w@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA4PR11MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ebc481-9b81-42ff-70b9-08dd86202b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MURTSnhHYlkvSVh1RGFCVTFUdDRuSStidVgvREw3MmVFTUVzVjZTdDNzQjhy?=
 =?utf-8?B?VzIxNm9vcHpoOVR4dDRNTlJXakdPaVVhR0kwYkZwT1FrSnFNOXpubXFJNnJ1?=
 =?utf-8?B?SXdVSk9idUpzWlpqTjB1eWg0Y0xYd1I0V2FNc3orT2o4SUlVY09SSi9ZZmxD?=
 =?utf-8?B?YVE3N0dhakZaWlU3eHoxa0c3cExWMGJzK2J1LzZRNUREd2tRdzJoN0lBYjFm?=
 =?utf-8?B?NUh1aFVBZjMxSG0wQTJiRGF5U0haVlZEeUI5c2pTOEdKWFJZck1VSFNTRzFP?=
 =?utf-8?B?blgzL2tXdFN2TEdKVVFmLzV0cHp5OTd6NFRoOVRjSC82bm0wbWcvS0E4aFlm?=
 =?utf-8?B?ODAwUUx4K1RPWlJRa2FVUExjZkJKZ0xzWmJLdnhzNHo2YnhYMmJWaDdMSDBy?=
 =?utf-8?B?bnJBUmc4UUYva3NlTWhTbDREK1BVK29hcGtYMytxaWRtSXlaaHFRZ28zOXZm?=
 =?utf-8?B?dnFmQ214N1VEd2ZlbzI5NzdHSkp0bGsrekhNQU5XMk8rK0pwdHI4c3hZZjRy?=
 =?utf-8?B?bzFRbmVLZlRRN1YvaDg3ek1JbTA1UkxXTHNMVDJwWDlWSTZkWHB3emVLb214?=
 =?utf-8?B?UTJGV3pjRzcwMUdJU2RlMlNPcitTRmNtVXhoaW9ZS1VTN01JcmFlTXJWVGVa?=
 =?utf-8?B?NGo4ME53SGdKRGZGTGtISDJrUEhoNUNCTUVEY0RnUDZEdGUrSnVvUHA1Q3F4?=
 =?utf-8?B?QndEUkxFRzd3WCtDalg2Qi8yOEFtS3R3bTN0eWIvS1lxYnFVRjE0T1IvN0F2?=
 =?utf-8?B?M2thNzd2Q0JXeTBtcitidmI2Mk1XZkh1NGhybkxReDA4eG9Ycm4yRFZ1Mk1H?=
 =?utf-8?B?WDFaeW4xeEVKWnRTU2dkSWFUWUJKMHBjdDZLeDdsVWx5L2FYczVZQmU2VUZs?=
 =?utf-8?B?R2xCZUtkdHBPREt4SkJPdUswUEo5Lzh2WW5KUFV6UkJKamxnRUJYeUYrcEF0?=
 =?utf-8?B?bjZsRStVTG91SWg4a1hVUGgyaWJocXoyc1BHQnhTYkJNbHZJVjlFYXAxSlZz?=
 =?utf-8?B?TGdpTGVmVzc2N0hrQUdwUTQ5L3g2MDJ4ZTRaRjFLTnczLzNxSkp2OHloYVI4?=
 =?utf-8?B?ems0ckF6V2ttL3ZzTTByY2JlMEY3dHBkMGJYV1JqTjNkZFV3dWJNNk5aTW54?=
 =?utf-8?B?MzBFeFV4dUxHd3FHcnF0YmRPMFpTc291V1laUEg0Yjk4WUFmTHJvQXprNW9k?=
 =?utf-8?B?cGRkeGtBVGRtUXUrei93VGJTWlZHK3BGbzN3TkFyQ1htZW5yUnQxVk56dEVX?=
 =?utf-8?B?NVRsZWdTZlNhSFlueElDRDVqcUNSRlFNcnFVcWRWUmtQbDRrYnNiM29SM3pK?=
 =?utf-8?B?UVR2V0RNbTFzbkJaNTNXelB3TldncUFBWmNRL3ZEcXBwcytBZnFMUDNpVG1o?=
 =?utf-8?B?djluYmw1UlpCekVGZ2FXeS9yWnJTajVXTkYvcnU1cERsYjJmZmVmTlEyWS9U?=
 =?utf-8?B?VmgwRnVjSWJYQUEzVHdmdmxPWVNldkdXaEN3R2JJS3JXQVZiOVlISndMNjFZ?=
 =?utf-8?B?Nm16THlQUDdoVkdYVG5tbHd3TDB1RkN4RUdHY0ZPMkR2QnUxRDZ5dGFMaVhN?=
 =?utf-8?B?bEI0QmtuRkYwMENsNVlHZUVlOFlHMWg2S1ZMQmk1NWcxcUhrWW1kZXUvUDFl?=
 =?utf-8?B?L2ZZSFVPMVdGYVhpVTJ2ZXUwaExVQ2xaM0RaajVWdEMxREh6SG43dHh5SzM0?=
 =?utf-8?B?MEkwRjZ6WjVkeHBhSk95MkoyQlBVZkp2K0I1a3Blc1l0WWh2NG5xL2tuMnRv?=
 =?utf-8?B?Um1DcTRHZTgybExTRVJpYkx1Vm9KdzVkTmxYZE44a2M0dmU0QWFXYW1VM1hQ?=
 =?utf-8?B?TTJoSS9QY3hlZTdkTmVadDJ2cTJmTkpxMDdJSE5OL21yd3duelpSbVJ3YUI4?=
 =?utf-8?B?T3UxWmV5c0N4Y1o0THhKN1NuamNGZ3FoUzRPL0s5eDRJT3NFVjM2R0FXRHZX?=
 =?utf-8?Q?42Qq2L6jjrY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGM0YjBLbUNHaGlWdGZ5Q1NHL2srREw1MGxaS040UmZldGRmU0ljMENUV3lh?=
 =?utf-8?B?bXlYYmhLS1Fkc3pqak9SNUk5bDR2MUY2cDRkRHFWajFxT1NwdUYzVnc4LytH?=
 =?utf-8?B?WnpGV0YyM2crTm9pdlM2R2JQSzhZa21uSXlnczd3UEs5SFpTQ2FWSDBFWXI4?=
 =?utf-8?B?UFBpOW02bStSb2F1R0pRNmpFQnR2NHRZczZlc1ZMUWNQbzAvWmdoeXFEZGRp?=
 =?utf-8?B?Snl1N2I2OXRRNGd2TjR6aE5nNEVDeFNiaFhqV283MkpJb09NeGcxTlowNEJK?=
 =?utf-8?B?Yys3LzBkRThyRDhWaXpwa0FETnNUNW9YYUJUaG9Hek5sck1aMnowRm4vbVV0?=
 =?utf-8?B?RnJudVowbzQrSlZKMWgwMkMwQVZoS28vNDk3WVlmMDBiVUFub21kVzltM1dE?=
 =?utf-8?B?L3JybnJTbm55UmFxMlhSTUlZbzRFeVA4U3BXMS8yeVgyTE85d0hhWVZGTXdY?=
 =?utf-8?B?WDNmWnVtWU5DOUY3TkNIallNaVREOVpqSnZFTGZsUkdvMEFCSkJIZHIxZEw4?=
 =?utf-8?B?ZmZYaWtGdGVZRVNyQ3RSdEhNcjlDWk5JYnovQ0VxUGlIK2sybm56eXJMNmZR?=
 =?utf-8?B?eGhDdjR5bEdnam5TeDc2cjVGandaVWoveWVhTGl6QThKTXZoWTVCdms0M2ZG?=
 =?utf-8?B?Qkx0U3J3VTBVWDhlTnhKRDVuQjNjaVdSYmZhNVdjWDZoZmRwZDNieXlmaE0w?=
 =?utf-8?B?d2ZOTUwvelVVQVkyMldnd1VrdnUrYk9vVDd4WWlCRTZHMWEyd1lQU3NDajBv?=
 =?utf-8?B?NUF1RldJT3MvdnIvQS9mU29GYWNzQVdEOEc5UDJ6WDlmK2U3ZHV3UkhnVW10?=
 =?utf-8?B?NWhLL0J6UnVmdXBDSWtxM2VxcDlYQjVaWUhnc1BIZkh3dVhXTkg1c1JhKzJW?=
 =?utf-8?B?bWoxWXZoVVFEc2Zyb1ZreGxuNUF4U2NITzQxQTFiLyswSUJSK294WW1iNmZq?=
 =?utf-8?B?NHBBNlhuR0hQVlgzS1NibjFHTFMxVmtyUjRtWUVRdnRlOWlPQVVvRHlBK3Rl?=
 =?utf-8?B?YlVPclpLclZPR0lUWlo5a0oydXhVQzdCYWJOcG9ISXJCVS9yNXJkYk9aQnkv?=
 =?utf-8?B?WW9MS2ZTa1l3ZlI3MXErbUJrZ1NmR2o1YXQwZ1Y0NHNCVmVPeExZZG5JczBS?=
 =?utf-8?B?OXd0YWxJOE1sUi9Nc0pJeWY4UFNMZkovRGxFaVNra0Q3RDBabkMwMHlHM2ZK?=
 =?utf-8?B?cDNqNm5iMlYyOWR0U0lXOC9SL2g0Q1BkRWFYMWFCYllkRUtHVFRoMytZT0h4?=
 =?utf-8?B?d2ZaS0hRWmV1aEh1bGJOK2NWVFc4Nlg5dTAyMHdWQVNXMmFMRXEzb1VYRGtU?=
 =?utf-8?B?QW5JOWZaaVV0QTlPVXFmdTVrbHRrVUxGMWNxbDZ0V3dCai9DcGdVakZEaVVu?=
 =?utf-8?B?bjdsVFNZd2xZUjlSYjdJNXR4YWZHLzgxWDh1SWNkcDc2V1hQc2d5ZGNSOUZz?=
 =?utf-8?B?N3FYTzJWMlpGS3FtV2UzcW1WRkdwZ09rVTk3Rm4vRzJseVNONEtGaDNCeGZG?=
 =?utf-8?B?VnVCZVhBYjQxUExQYjgxR2wvYWpXQVBaaFI2ZXJpOUxrUjVadUFmSjdhc3pJ?=
 =?utf-8?B?c0ZiR2tRcS9Kd2Jnd2s5dnZwSWpnZXpZRGtNMmZIT01WN0RPNi9hcXErREtQ?=
 =?utf-8?B?Rno4anN3RXQ2WHRDZmlhOTU3ekI5aVExVVl3YzVlOW41OGVNUzB6RnhPUFVk?=
 =?utf-8?B?RUZhM2pNT3dQM2N2SmE5cUhpb2E2OTF2YUdtaE1hcEJRbEFWZ3pMWksvMzNp?=
 =?utf-8?B?WjNTU3F2VEVIK3IrOGMwV0MweTQyYVpkTVdJQm9DcmJaUGRHZ3hkL0tma2pJ?=
 =?utf-8?B?clhNbGdDOUFJbmRROXJvWllIei9SV043ZW9WQU1aemxrdFhrbDIwSXJtMU5V?=
 =?utf-8?B?d054QXVML2ttMGpZTTRBWkxONXNjZ1dvUW1LMFdKMG9yTVhUVy82WVArNHVF?=
 =?utf-8?B?TlUxSWc3UU9JTVFYU2djZ3B4TkczcGpubnNYOFlaaURSN3RRU2dMWU4wY2Q2?=
 =?utf-8?B?L1NBUjN2ZVRtdHlsbkVXVUo2VzRlbGF3ZldHZGY3SGhuZkRwa0dhSzlTVTVP?=
 =?utf-8?B?bVdGZ3ptQ1pxSzBMem5OZ0V0SGlRSEVHa1luYUIxMExIZ0paVnk2TWtpbkNu?=
 =?utf-8?B?c3JNT0NGSC9GRXlmMEoyTEI4ZHB2U1JFUGVQVHVCNk5TeHYxOFVIVkx5MXpi?=
 =?utf-8?Q?fDsmYx+TeYCUbkZ2dQbR74Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ebc481-9b81-42ff-70b9-08dd86202b0f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 06:44:47.9647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mecS3gR6Sm2wKb+k7qsT1TQpgcra0z2Q9XBsfuQy82gBuxsZL++A8xmubBPzU0S98UJTpGVoqg9blbQtRJkIigBuRgWm4VYHnLNI91R3Pto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9105
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



On 25-04-2025 05:18, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:01PM +0530, Himal Prasad Ghimiray wrote:
>> This commit adds prefetch support for SVM ranges, utilizing the
>> existing ioctl vm_bind functionality to achieve this.
>>
>> v2: rebase
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c |  61 +++++++++---
>>   drivers/gpu/drm/xe/xe_vm.c | 185 +++++++++++++++++++++++++++++++++++--
>>   2 files changed, 222 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index de4e3edda758..59dc065fae93 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -1458,7 +1458,8 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   	struct xe_vm *vm = pt_update->vops->vm;
>>   	struct xe_vma_ops *vops = pt_update->vops;
>>   	struct xe_vma_op *op;
>> -	int err;
>> +	int ranges_count;
>> +	int err, i;
>>   
>>   	err = xe_pt_pre_commit(pt_update);
>>   	if (err)
>> @@ -1467,20 +1468,33 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   	xe_svm_notifier_lock(vm);
>>   
>>   	list_for_each_entry(op, &vops->list, link) {
>> -		struct xe_svm_range *range = op->map_range.range;
>> +		struct xe_svm_range *range = NULL;
>>   
>>   		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>>   			continue;
>>   
>> -		xe_svm_range_debug(range, "PRE-COMMIT");
>> -
>> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>> +		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
>> +			xe_assert(vm->xe,
>> +				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
>> +			ranges_count = op->prefetch_range.ranges_count;
>> +		} else {
>> +			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>> +			ranges_count  = 1;
>> +		}
>>   
>> -		if (!xe_svm_range_pages_valid(range)) {
>> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>> -			xe_svm_notifier_unlock(vm);
>> -			return -EAGAIN;
>> +		for (i = 0; i < ranges_count; i++) {
>> +			if (op->base.op == DRM_GPUVA_OP_PREFETCH)
>> +				range = xa_load(&op->prefetch_range.range, i);
>> +			else
>> +				range = op->map_range.range;
>> +			xe_svm_range_debug(range, "PRE-COMMIT");
>> +
>> +			if (!xe_svm_range_pages_valid(range)) {
>> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>> +				xe_svm_notifier_unlock(vm);
>> +				return -EAGAIN;
>> +			}
>>   		}
>>   	}
>>   
>> @@ -2065,11 +2079,21 @@ static int op_prepare(struct xe_vm *vm,
>>   	{
>>   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>>   
>> -		if (xe_vma_is_cpu_addr_mirror(vma))
>> -			break;
>> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
>> +			struct xe_svm_range *range;
>> +			int i;
>>   
>> -		err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
>> -		pt_update_ops->wait_vm_kernel = true;
>> +			for (i = 0; i < op->prefetch_range.ranges_count; i++) {
>> +				range = xa_load(&op->prefetch_range.range, i);
>> +				err = bind_range_prepare(vm, tile, pt_update_ops,
>> +							 vma, range);
>> +				if (err)
>> +					return err;
>> +			}
>> +		} else {
>> +			err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
>> +			pt_update_ops->wait_vm_kernel = true;
>> +		}
>>   		break;
>>   	}
>>   	case DRM_GPUVA_OP_DRIVER:
>> @@ -2273,9 +2297,16 @@ static void op_commit(struct xe_vm *vm,
>>   	{
>>   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>>   
>> -		if (!xe_vma_is_cpu_addr_mirror(vma))
>> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
>> +			for (int i = 0 ; i < op->prefetch_range.ranges_count; i++) {
>> +				struct xe_svm_range *range = xa_load(&op->prefetch_range.range, i);
>> +
>> +				range_present_and_invalidated_tile(vm, range, tile->id);
>> +			}
>> +		} else {
>>   			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
>>   				       fence2, false);
>> +		}
>>   		break;
>>   	}
>>   	case DRM_GPUVA_OP_DRIVER:
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 57af2c37f927..ffd7ad664921 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -798,10 +798,36 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>>   }
>>   ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
>>   
>> +static void clean_svm_prefetch_op(struct xe_vma_op *op)
>> +{
>> +	struct xe_vma *vma;
>> +
>> +	vma = gpuva_to_vma(op->base.prefetch.va);
>> +
>> +	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma)) {
>> +		xa_destroy(&op->prefetch_range.range);
>> +		op->prefetch_range.ranges_count = 0;
>> +	}
>> +}
>> +
>> +static void clean_svm_prefetch_in_vma_ops(struct xe_vma_ops *vops)
>> +{
>> +	struct xe_vma_op *op;
>> +
>> +	if (!(vops->flags & XE_VMA_OPS_HAS_SVM_PREFETCH))
>> +		return;
>> +
>> +	list_for_each_entry(op, &vops->list, link) {
>> +		clean_svm_prefetch_op(op);
>> +	}
>> +}
>> +
>>   static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>>   {
>>   	int i;
>>   
>> +	clean_svm_prefetch_in_vma_ops(vops);
>> +
>>   	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>>   		kfree(vops->pt_update_ops[i].ops);
>>   }
>> @@ -2248,13 +2274,25 @@ static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
>>   	return true;
>>   }
>>   
>> +static void clean_svm_prefetch_in_gpuva_ops(struct drm_gpuva_ops *ops)
>> +{
>> +	struct drm_gpuva_op *__op;
>> +
>> +	drm_gpuva_for_each_op(__op, ops) {
>> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>> +
>> +		clean_svm_prefetch_op(op);
>> +	}
>> +}
>> +
>>   /*
>>    * Create operations list from IOCTL arguments, setup operations fields so parse
>>    * and commit steps are decoupled from IOCTL arguments. This step can fail.
>>    */
>>   static struct drm_gpuva_ops *
>> -vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>> -			 u64 bo_offset_or_userptr, u64 addr, u64 range,
>> +vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>> +			 struct xe_bo *bo, u64 bo_offset_or_userptr,
>> +			 u64 addr, u64 range,
>>   			 u32 operation, u32 flags,
>>   			 u32 prefetch_region, u16 pat_index)
>>   {
>> @@ -2262,6 +2300,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>   	struct drm_gpuva_ops *ops;
>>   	struct drm_gpuva_op *__op;
>>   	struct drm_gpuvm_bo *vm_bo;
>> +	u64 range_end = addr + range;
>>   	int err;
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>> @@ -2323,14 +2362,61 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>   			op->map.invalidate_on_bind =
>>   				__xe_vm_needs_clear_scratch_pages(vm, flags);
>>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>> -			op->prefetch.region = prefetch_region;
>> -		}
>> +			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>> +
>> +			if (!xe_vma_is_cpu_addr_mirror(vma)) {
>> +				op->prefetch.region = prefetch_region;
>> +				break;
>> +			}
>>   
>> +			struct drm_gpusvm_ctx ctx = {
>> +			.read_only = xe_vma_read_only(vma),
>> +			.devmem_possible = IS_DGFX(vm->xe) &&
>> +					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>> +			.check_pages_threshold = IS_DGFX(vm->xe) &&
>> +						 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
>> +						 SZ_64K : 0,
>> +			};
>> +
>> +			op->prefetch_range.region = prefetch_region;
>> +			struct xe_svm_range *svm_range;
>> +			int i = 0;
>> +
>> +			xa_init(&op->prefetch_range.range);
>> +			op->prefetch_range.ranges_count = 0;
>> +alloc_next_range:
>> +			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
>> +
>> +			if (PTR_ERR(svm_range) == -ENOENT)
>> +				break;
> 
> I missed this in previous review. -ENOENT means a CPU VMA does not
> exist. I think it fairly reasonable use to case for a UMD to issue a
> prefetch to sparsely populated CPU VMA range so I don't think breaking
> here is correct, rather a goto alloc_next_range after adjusting to the
> next address. This gets tricky as we likely don't want to iterate 4k at
> a time... Maybe we add GPU SVM support function which wraps a CPU VMA
> lookup function (find_vma I think) to find the next CPU VMA and returns
> the starting address, if the starting address is within the prefetch
> range we continue the walk.

very valid point. will add it in next version.

> 
> Matt
> 
>> +
>> +			if (IS_ERR(svm_range)) {
>> +				err = PTR_ERR(svm_range);
>> +				goto unwind_prefetch_ops;
>> +			}
>> +
>> +			xa_store(&op->prefetch_range.range, i, svm_range, GFP_KERNEL);
>> +			op->prefetch_range.ranges_count++;
>> +			vops->flags |= XE_VMA_OPS_HAS_SVM_PREFETCH;
>> +
>> +			if (range_end > xe_svm_range_end(svm_range) &&
>> +			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
>> +				i++;
>> +				addr = xe_svm_range_end(svm_range);
>> +				goto alloc_next_range;
>> +			}
>> +		}
>>   		print_op(vm->xe, __op);
>>   	}
>>   
>>   	return ops;
>> +
>> +unwind_prefetch_ops:
>> +	clean_svm_prefetch_in_gpuva_ops(ops);
>> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
>> +	return ERR_PTR(err);
>>   }
>> +
>>   ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>>   
>>   static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>> @@ -2645,8 +2731,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   					return err;
>>   			}
>>   
>> -			if (!xe_vma_is_cpu_addr_mirror(vma))
>> +			if (xe_vma_is_cpu_addr_mirror(vma))
>> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask,
>> +							      op->prefetch_range.ranges_count);
>> +			else
>>   				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>> +
>>   			break;
>>   		default:
>>   			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>> @@ -2772,6 +2862,58 @@ static int check_ufence(struct xe_vma *vma)
>>   	return 0;
>>   }
>>   
>> +static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
>> +					 struct xe_vma_op *op)
>> +{
>> +	int err = 0;
>> +
>> +	if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
>> +		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>> +		struct drm_gpusvm_ctx ctx = {
>> +			.read_only = xe_vma_read_only(vma),
>> +			.devmem_possible = IS_DGFX(vm->xe) &&
>> +					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>> +			.check_pages_threshold = IS_DGFX(vm->xe) &&
>> +						 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
>> +						 SZ_64K : 0,
>> +		};
>> +		struct xe_svm_range *svm_range;
>> +		struct xe_tile *tile;
>> +		u32 region;
>> +		int i;
>> +
>> +		if (!xe_vma_is_cpu_addr_mirror(vma))
>> +			return 0;
>> +
>> +		region = op->prefetch_range.region;
>> +
>> +		/* TODO: Threading the migration */
>> +		for (i = 0; i < op->prefetch_range.ranges_count; i++) {
>> +			svm_range = xa_load(&op->prefetch_range.range, i);
>> +			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
>> +				tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
>> +				err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
>> +				if (err) {
>> +					drm_err(&vm->xe->drm, "VRAM allocation failed, can be retried from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
>> +						vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>> +					return -ENODATA;
>> +				}
>> +			}
>> +
>> +			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
>> +			if (err) {
>> +				if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
>> +					err = -ENODATA;
>> +
>> +				drm_err(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
>> +					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>> +				return err;
>> +			}
>> +		}
>> +	}
>> +	return err;
>> +}
>> +
>>   static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   			    struct xe_vma_op *op)
>>   {
>> @@ -2809,7 +2951,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   	case DRM_GPUVA_OP_PREFETCH:
>>   	{
>>   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>> -		u32 region = op->prefetch.region;
>> +		u32 region;
>> +
>> +		if (xe_vma_is_cpu_addr_mirror(vma))
>> +			region = op->prefetch_range.region;
>> +		else
>> +			region = op->prefetch.region;
>>   
>>   		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
>>   
>> @@ -2828,6 +2975,23 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   	return err;
>>   }
>>   
>> +static int xe_vma_ops_execute_ready(struct xe_vm *vm, struct xe_vma_ops *vops)
>> +{
>> +	struct xe_vma_op *op;
>> +	int err;
>> +
>> +	if (!(vops->flags & XE_VMA_OPS_HAS_SVM_PREFETCH))
>> +		return 0;
>> +
>> +	list_for_each_entry(op, &vops->list, link) {
>> +		err = prefetch_ranges_lock_and_prep(vm, op);
>> +		if (err)
>> +			return err;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>>   					   struct xe_vm *vm,
>>   					   struct xe_vma_ops *vops)
>> @@ -2850,7 +3014,6 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>>   	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_LOCK)
>>   		return -ENOSPC;
>>   #endif
>> -
>>   	return 0;
>>   }
>>   
>> @@ -3492,7 +3655,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>>   		u16 pat_index = bind_ops[i].pat_index;
>>   
>> -		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
>> +		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
>>   						  addr, range, op, flags,
>>   						  prefetch_region, pat_index);
>>   		if (IS_ERR(ops[i])) {
>> @@ -3525,6 +3688,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   	if (err)
>>   		goto unwind_ops;
>>   
>> +	err = xe_vma_ops_execute_ready(vm, &vops);
>> +	if (err)
>> +		goto unwind_ops;
>> +
>>   	fence = vm_bind_ioctl_ops_execute(vm, &vops);
>>   	if (IS_ERR(fence))
>>   		err = PTR_ERR(fence);
>> @@ -3594,7 +3761,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
>>   
>>   	xe_vma_ops_init(&vops, vm, q, NULL, 0);
>>   
>> -	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
>> +	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
>>   				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
>>   				       vm->xe->pat.idx[cache_lvl]);
>>   	if (IS_ERR(ops)) {
>> -- 
>> 2.34.1
>>

