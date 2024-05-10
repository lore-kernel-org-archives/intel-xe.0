Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD74C10F1A
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 01:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BB510E3AF;
	Fri, 10 May 2024 01:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAiX37B5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A9410E3AF
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 01:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715306173; x=1746842173;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IIJYImoej9X8KPlhNlCraWlQ+20SK70WbEEb9TW0gVA=;
 b=RAiX37B5KBBLEebc+3Tmdg5ZaRaVGXYIKdRBmqawh4jstw/KcUWyLX9A
 /3qL+53kktqbVAU1uXxhit7Ud7lFM6NxVgJ7wK/v4Z/e+Rrgahfcv01aj
 wfJ5h4btaMlvmevhak3e04O5W6AW1DqNs4FEWV6uFp2rmqV2Mw+jz05Fd
 mPwpBmnWZUGvVlFOX3fc+J6NpdPPIX27kkMAa31vgqEQbpgN7Hx4tmxZ0
 ikSYt+MsZ8ry1pxSCXW7HVlA03qhrTU0PPd8BTNTdBOLohSUn4OP+xock
 Qg9MS5kJBUQrkUbIi4GkqnEL3NJvPUzVwd6lfWijsspDZe8qZMWPxs61I w==;
X-CSE-ConnectionGUID: rsM57SvRTXmG5laxunx8FA==
X-CSE-MsgGUID: mO0LIrvnSwyy/JraBlSW9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21938329"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; d="scan'208";a="21938329"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 18:55:45 -0700
X-CSE-ConnectionGUID: OEzD07Q4T6aeoFX1JcM5+w==
X-CSE-MsgGUID: o20fqzR9T46iClN15X6oLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; d="scan'208";a="33968107"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 18:55:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 18:55:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 18:55:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 18:55:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 18:55:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORjRG01ovk+Tyu8NyqZA79suxaqdWT9qBoSut1Cu6XyL67R36n/w6HDmRk83L4cUvPZg9HjnEQp0qbdZoeEuPi1Srt9QqI3lllhOAjyiviIi8yEome7qgtR2eC9Gae7dEK6/sYn1ofWwIprWr0nUM3Wk+qEA/NXe+ApHj0Hy7XaWtBcFdVDfrf84hPS7jGVoHbdBhBncdHCLFYDXGQYCyzS+PY5Bn5vW05yTE5ELPx/HwnE4/Cdit0UXuy7CNqKhHfjIL3gOFxX5gFyz2rccR803BLVEozolRfRsEk0YKyQpPhVb9H6A7AtPvP6Gyf87Zj390snCU3NnZnt78TkEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1lv1ZqyAwG1KNyf8sUPB7jmKZQKGyA2kowtlzfRr9Q=;
 b=Dwk2cObwabFqE2g8hA11tBNjrwvFEqNTWbF/qIA2YxPsf/wDmSNR639nVg3KpaLfoE8EgH7OjXXB0z025sKajyGiuY+fLzlokAd7dRQZXm3OGpSsSesOSBjR5ysB5n3k4QpgwFm0JIs96J2MVNZ8Iut6F9m0zS7Mnqwz8eLvWZAg3267kVhGydNAAfHc55bqpf95h0+9tDpYoyNwOwaCEqXYhGGEAf/vtpQyWpSQdB/Ll7egKBLQnt367wAY48TusiB60Mm2Bzmf8i4eTjTG/7mSR1hscymvD81e5lqz3pe4dQKLemYh8Qk4LUc4IEC5ruucfY5c+fqaYdVA3cu7nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7295.namprd11.prod.outlook.com (2603:10b6:208:428::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Fri, 10 May
 2024 01:55:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 01:55:28 +0000
Date: Thu, 9 May 2024 21:55:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cmUg?=
 =?utf-8?Q?for_series_startin?= =?utf-8?Q?g?= with [1/7] drm/xe: Fix
 xe_pm_runtime_get_if_active return
Message-ID: <Zj1-i-RBw8Hye6lP@intel.com>
References: <20240509191657.504300-1-rodrigo.vivi@intel.com>
 <171530217799.2053735.13338439583875803637@8e613ede5ea5>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171530217799.2053735.13338439583875803637@8e613ede5ea5>
X-ClientProxiedBy: MW4PR04CA0181.namprd04.prod.outlook.com
 (2603:10b6:303:86::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d228176-5e69-4e6c-0b72-08dc70944369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDYrcDBFdzhGVnRrdXYwVXFYbmlPbEkvVjBZZzVPY3ppZ3JiWXByL2FtVWpi?=
 =?utf-8?B?WlBRemZUcnBaL1VUeXE4Ty9yNE4zYVJHTlg2T1hITXJ2L0NURk01dGQwZklO?=
 =?utf-8?B?QTNwd2FveGNXZXJLYWVKRG5ucGlORFpsbExwaVdETmFMMzVmd0ZraXU1TndC?=
 =?utf-8?B?dDZvVW9WRUdBbUtiSGE5UzZqczkvT3lvZnV5MTYvZnNiL0JrU2toaDRFZGVF?=
 =?utf-8?B?YkZXSW1kOTcxN3J2ZFZkd0p6UldJV3FQdEswbDNHSVNkbWhaSW5qNXdFRGFX?=
 =?utf-8?B?RFNXbkM5NWpHNE9hQ0hPcDNURGpRdTUxVklRc0hza0VxWm5aYmE5UHdUMG10?=
 =?utf-8?B?STVzWE80Y0N5SGI4NUIvQ3J6UldWVkhoaEdTZzZPNFlkVDhtR3dYTVpjUldP?=
 =?utf-8?B?UmtoZjZORnlXbEtKS0J0SDVLNnpDSnpRVndWc1JiRTdDUHZEL1dKWEFuaGZR?=
 =?utf-8?B?ZjVpUHlwSTFVemk4SXhjYjZ5Y04yME9ORzFWTWRGdEJPTjZPNndXQk5lWVNX?=
 =?utf-8?B?MDZWZ0Qxak9CVGtoNm94SzVyUi9CREt3c2J0S2swYjZKaStkSm1MaEMxSjhJ?=
 =?utf-8?B?L0VkOUt1RVdTeHlwN2pkb2lKNG5JKzFlTVJTc3RBNHI5MnM3bllCUUh2bHdt?=
 =?utf-8?B?TTYxMU1CV0dRdGdreGNUa2pSL3B1c1VoQ0RaR1pYNGdKY3UrZktHeGZBNkFZ?=
 =?utf-8?B?TmFSaGZlYmlqam1sSmd3ZjVRZjJJZHV1VmlOVm1pek4xSEJjWWVDTUNQVE1H?=
 =?utf-8?B?R0UvdWRWdVRGNktKeFlIYnhyTFRSTFpqY25GZ2NvWlI3SEdidmd5SGp2VFUw?=
 =?utf-8?B?Z2FqUzc1RmlxQUtvakUrZllSYng2aUVxMmp0cHZQMi82UFIveDJJc1pVc3hX?=
 =?utf-8?B?Y21iNE9rMXZ4NSs2MnB2Kzd1QVhab3BrOE9PRW15blFuYVdNM1diejdvNE5Y?=
 =?utf-8?B?NVZ2OFNld0pSaUNySUxXcENsQ0xUdDJqMlFwVGNYNUorenAyZjR2OXRpMkpL?=
 =?utf-8?B?bjQ0VEYrc1UvRElYWHdLVGJUdnB2Q1Azb2tHNEVOSng3RXBIejFlWkk5cVZZ?=
 =?utf-8?B?TkJBYUd5bXYydktKMUU0UEtiN1FFMHJPbzYvRDJyKzhUb0RhT0E3RktPZFM0?=
 =?utf-8?B?MEwrelpnekhhM3FPYXd4UFpKRDlrV2V4NmxZcmdtR2h4NXpTb1o4WDh3eWU3?=
 =?utf-8?B?UGxVV216cUFsRWxzZ1hEc2NPak5kdkVZVmRVRWxmWCsyS0prMm4rUUJyM2ZJ?=
 =?utf-8?B?Rkx4R3lpaFdJNjZjb2ZTQVhyRkJEdG1ESDFjaURBRlhKT3NxeEdQV3RqY3pX?=
 =?utf-8?B?bWlERTBLWEZpcnpHK1F3aFpHTlJJOVMzZlF6MEtpRW9Bay85ZGNsYzFKU0ZH?=
 =?utf-8?B?dEgxcjlreDltdi9SSWpranNadHZGamY0ZDhQYXJOdk5KOUhsK3lZSDZxUFN6?=
 =?utf-8?B?OGlaRFhPMUF4OUtSU2JsQ2pWYUxsaE4wRU9kOGFOeHlMa1N0WFpRalZuOGd3?=
 =?utf-8?B?ODJEQmhvcVJiMDVmemRTZSt1MmdBOThOUmhmU0Y4VC8zTThUOUFXVGxlK0dB?=
 =?utf-8?B?OFRUcWNOUHJRRnN0djdHemZXYXRUb0dvTy9uWWtTRVA1QUVMREVDT3l1VkdU?=
 =?utf-8?Q?Ns70JCUVakUdroHRUIpqhyfll0+cFh+7Q5zzD9yi+++c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkROa3kvU2xiVWRlKzdWcUM5RmE4UmhseXdKR0VTeEY0cjYwQ1RBUkJnSDRD?=
 =?utf-8?B?Vk9GbWREcTV0bjJmMVBtRmFxTEQ1Mk5keVV2bXU4TXp5UXJzUHcvVTIrOThl?=
 =?utf-8?B?OE4rbWRuWFV0N1Zpc1FETTR4TXlBdGVDT0d2V3lLNFBMbkRLdEN4d3JZeHZS?=
 =?utf-8?B?QWxCdWhPU01GejBIcHJGcC90WHR2dkxkUENxeVpGTDVjVVlQZ2hHd1MyK2xO?=
 =?utf-8?B?L0Q2VEJtRGN5czJMcm5GMjdGYjJOVWhMeTlMZjdiNDRWRGhraXVsT2t6QlEv?=
 =?utf-8?B?azdJdWFnNXBhUTMyNHZDNkxuWGZCZkJ0d09PSldXNlF4eXMvMTVUSi9ncU1V?=
 =?utf-8?B?aXRhMjhEelB0TldlNzFLY2Ywdjg0QityQXZoQ3Q3QVpZWUhwcnk3OUhVNGRn?=
 =?utf-8?B?Y2V6b3YwOXdyVFlJMUFwZlE2VGJMQWdiOWUrallIQkR6UE1aUEZ6Y2kwS0NQ?=
 =?utf-8?B?Wjl3UytEV0hTdE9nRjR6S2lmam5VSytSNXgzazBWbjFHUCtBMXB3aWRIYWpx?=
 =?utf-8?B?YjA0eHNZUzFmM2NpZ1B3aDdQYWtoQXBRcFJobzAwbjA1RmxMS3RyZjNpZnlV?=
 =?utf-8?B?V0YwNTV0V0ZRemJFb2N0M0NVSm5DZm00UDdaYjQ1alkxenI3NVRyVVo0NGtt?=
 =?utf-8?B?aDl2d2FRU3YrVXN2MlRydmxWVVM4ZStLZ3VHYys0S2tabzdxTHZWNFkrSUMv?=
 =?utf-8?B?TUVrVWxXQnVMY1hFcW0rQ2hnSFdLWEpjWm5ISXNBeFRHMTZ6VFlmd2dGbGNT?=
 =?utf-8?B?Y0JKcFFMcSs3RHdMcjB1SFFac0hZR3Z3MVZPRnREaDZVZk50a24xZXpMSzhK?=
 =?utf-8?B?ZFlyTXN0elFDbExOSmsrRWFTa0kzdkZOZFhJYW1Jc3JYOTZXS0hTNlE2Q2xn?=
 =?utf-8?B?Q2praVE2QzZRY3lQUGFYd0YveWtkcit5ZjMrdnJ2d1VrS0pRbE9oOUxhL3h2?=
 =?utf-8?B?NnlhZTdobmw2K1dENENodUpyRTNmYTlqdGtBSHB4Z0laci9iaENJcjdyWnpt?=
 =?utf-8?B?Um9hOXRRT05nREVzU2k1V1A2MEdNazNFUzAyMjc0M2tOTlM5UGZyU1BQKzUw?=
 =?utf-8?B?b2o2TXA2b1BsbER0a21zdEpxZHFIVHlqb1B2L2d5NWl5cWJISktuazdCQWo3?=
 =?utf-8?B?RGRyZnBlamljOENXU0RVWEI0amlhY2dYUzNxV0RPZHhDYjB1VWZGZytNck9T?=
 =?utf-8?B?M1hWb0ZwVlJtY2hUM0JJaDBURkJWV0ZLeHlIUnBNZktPSjJDUWNNcEdyYk1s?=
 =?utf-8?B?TENka0RhV3krZ3VmWWxGc3ozckljRE1EYkplZUxOaHJyWC84Y1MzUFJ3d0w0?=
 =?utf-8?B?YnMxK2ZUWjgzZ1V4dVZQOUhHcTNWbXZHbGRKaGpKSjhneGpQTmhWVzFiQ3A4?=
 =?utf-8?B?SzNTVU4xMVdlcHd0a2h6WUcvaWx4TmFmd0R5MGljVWZoYU5RT3V2TDFDVXNr?=
 =?utf-8?B?MGlkN0hTY2htYi9GeDVMbWc0RW14KzhaRWVvbDM2Sk1XakF2cWNNVlp1b0k2?=
 =?utf-8?B?YTM1VUtibk9HSzV2d1BlTzVmRjh2UnJIVDVkTFQ4MjR2d3FJTVhrK2JiMVRH?=
 =?utf-8?B?eGY4cFBNZm9ZamplWlVIY2h5a2NrNzhmbWlsa1ArcjhOZjIzUHJLSGZIQWFG?=
 =?utf-8?B?TlNjbzBUYno2QUJTVzVQeE9oZERtQmVXMmFJOHVqaUN1VTNvbkNuUFZSdnNo?=
 =?utf-8?B?UUlHdU5STC96L1N4aWJWdEN3QlFsZU9oOXdyYlFxbXV3TUQ1UlhCdTdVSUtW?=
 =?utf-8?B?eHBZcXdyTlEyRmRqZjIxeE45bHZBRFJzeTRWbGNxWnBzNlY4dnZkU1NETXpP?=
 =?utf-8?B?U0Z0RUk4dE9oUUpYRTRGZndBV2ZaeUJLT3M0cVA1NEQyUnQxQXo1SGUyck1Y?=
 =?utf-8?B?THBDV2RnSjVONU1jSWpBeHRxR0w2M3VCcllpTUVZSU9DalZoYjRiQXJFWW1N?=
 =?utf-8?B?TE1uTk1qc0ZhOXBxOWFFWDRLb0JHVG8vd0w4S2tib1prOFhVeGFoMjRsNXU1?=
 =?utf-8?B?OW85TUkza0dIVk5IdjNZdDZDbGJZYXdnN3A0MEczekNLVEo2MDI3TFU1MEdJ?=
 =?utf-8?B?Sm0rQWdFYXRkWGNDbVBFSGlEODFNbENUb2pyREkzS0tibFgzODU0ZVdTWk1v?=
 =?utf-8?B?WmRPNXkvb3gyT0lnWHJrSXlUVnFxY0R4MEwyUE5rYlBJQ1hLNURnTlJPZWJG?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d228176-5e69-4e6c-0b72-08dc70944369
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 01:55:28.2338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXI9tSJy7y86QUnM2cshziDVExIQqX7wwTiUAPi5ueV1UNYvpn1yUYqNSIvUBEfAcIFN5oIuboEu5o/nRiehJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7295
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

On Fri, May 10, 2024 at 12:49:37AM -0000, Patchwork wrote:
>    Patch Details                                                                
>                                                                                 
>  Series:  series starting with [1/7] drm/xe: Fix xe_pm_runtime_get_if_active    
>           return                                                                
>  URL:     [1]https://patchwork.freedesktop.org/series/133404/                   
>  State:   failure                                                               
>  Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/index.html
>                                                                                 
> CI Bug Log - changes from xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027_full 
>                              -> xe-pw-133404v1_full                             
>                                                                                 
> Summary                                                                         
>                                                                                 
>    FAILURE                                                                      
>                                                                                 
>    Serious unknown changes coming with xe-pw-133404v1_full absolutely need to   
>    be                                                                           
>    verified manually.                                                           
>                                                                                 
>    If you think the reported changes have nothing to do with the changes        
>    introduced in xe-pw-133404v1_full, please notify your bug team               
>    (I915-ci-infra@lists.freedesktop.org) to allow them                          
>    to document this new failure mode, which will reduce false positives in      
>    CI.                                                                          
>                                                                                 
> Participating hosts (3 -> 3)                                                    
>                                                                                 
>    No changes in participating hosts                                            
>                                                                                 
> Possible new issues                                                             
>                                                                                 
>    Here are the unknown changes that may have been introduced in                
>    xe-pw-133404v1_full:                                                         
>                                                                                 
>   IGT changes                                                                   
>                                                                                 
>     Possible regressions                                                        
>                                                                                 
>      • igt@xe_pm@d3hot-basic-exec:                                              
>                                                                                 
>           • shard-adlp: [3]PASS -> [4]FAIL                                      
>      • igt@xe_pm@d3hot-multiple-execs:                                          
>                                                                                 
>           • shard-dg2-set2: [5]PASS -> [6]FAIL +1 other test fail               

this is awkward....
because of this, I'm merging the kernel series right now and then
triggering a retest of the igt tests here.

>                                                                                 
>     Warnings                                                                    
>                                                                                 
>      • igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:     
>           • shard-adlp: [7]SKIP ([8]Intel XE#1201 / [9]Intel XE#656) ->         
>             [10]FAIL                                                            
>                                                                                 
>     Suppressed                                                                  
>                                                                                 
>    The following results come from untrusted machines, tests, or statuses.      
>    They do not affect the overall result.                                       
>                                                                                 
>      • igt@kms_fbcon_fbt@fbc-suspend:                                           
>                                                                                 
>           • {shard-lnl}: [11]FAIL ([12]Intel XE#1609) -> [13]DMESG-WARN         
>      • igt@kms_fbcon_fbt@psr:                                                   
>                                                                                 
>           • {shard-lnl}: NOTRUN -> [14]INCOMPLETE                               
>      • igt@kms_frontbuffer_tracking@psr-suspend:                                
>                                                                                 
>           • {shard-lnl}: [15]PASS -> [16]DMESG-WARN +1 other test dmesg-warn    
>      • {igt@xe_pm@s4-vm-bind-userptr}:                                          
>                                                                                 
>           • shard-adlp: [17]PASS -> [18]ABORT                                   
>                                                                                 
> Known issues                                                                    
>                                                                                 
>    Here are the changes found in xe-pw-133404v1_full that come from known       
>    issues:                                                                      
>                                                                                 
>   IGT changes                                                                   
>                                                                                 
>     Issues hit                                                                  
>                                                                                 
>      • igt@core_hotunplug@hotrebind-lateclose:                                  
>                                                                                 
>           • shard-adlp: NOTRUN -> [19]DMESG-WARN ([20]Intel XE#1214 /           
>             [21]Intel XE#1667)                                                  
>      • igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4:               
>                                                                                 
>           • shard-dg2-set2: [22]PASS -> [23]FAIL ([24]Intel XE#827) +1 other    
>             test fail                                                           
>      • igt@kms_async_flips@async-flip-with-page-flip-events:                    
>                                                                                 
>           • shard-adlp: NOTRUN -> [25]DMESG-WARN ([26]Intel XE#1033 /           
>             [27]Intel XE#1214 / [28]Intel XE#358)                               
>      • igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:  
>                                                                                 
>           • shard-adlp: NOTRUN -> [29]DMESG-WARN ([30]Intel XE#1033 /           
>             [31]Intel XE#1214) +3 other tests dmesg-warn                        
>      • igt@kms_atomic@crtc-invalid-params:                                      
>                                                                                 
>           • shard-adlp: NOTRUN -> [32]INCOMPLETE ([33]Intel XE#1195 /           
>             [34]Intel XE#1330) +1 other test incomplete                         
>      • igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:  
>                                                                                 
>           • shard-dg2-set2: [35]PASS -> [36]FAIL ([37]Intel XE#1388) +1 other   
>             test fail                                                           
>      • igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:        
>                                                                                 
>           • shard-adlp: NOTRUN -> [38]FAIL ([39]Intel XE#1204)                  
>      • igt@kms_big_fb@y-tiled-8bpp-rotate-90:                                   
>                                                                                 
>           • shard-adlp: NOTRUN -> [40]SKIP ([41]Intel XE#1201 / [42]Intel       
>             XE#316) +1 other test skip                                          
>      • igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:    
>                                                                                 
>           • shard-adlp: NOTRUN -> [43]FAIL ([44]Intel XE#1231) +1 other test    
>             fail                                                                
>      • igt@kms_big_fb@yf-tiled-8bpp-rotate-180:                                 
>                                                                                 
>           • shard-adlp: NOTRUN -> [45]SKIP ([46]Intel XE#1124 / [47]Intel       
>             XE#1201) +10 other tests skip                                       
>      • igt@kms_big_joiner@invalid-modeset-force-joiner:                         
>                                                                                 
>           • shard-adlp: NOTRUN -> [48]SKIP ([49]Intel XE#1201) +5 other tests   
>             skip                                                                
>      • igt@kms_bw@linear-tiling-1-displays-1920x1080p:                          
>                                                                                 
>           • shard-adlp: NOTRUN -> [50]SKIP ([51]Intel XE#1201 / [52]Intel       
>             XE#367) +1 other test skip                                          
>      • igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:                    
>                                                                                 
>           • shard-adlp: NOTRUN -> [53]SKIP ([54]Intel XE#1201 / [55]Intel       
>             XE#455 / [56]Intel XE#787) +29 other tests skip                     
>      • igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7:          
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [57]SKIP ([58]Intel XE#1201 / [59]Intel   
>             XE#787) +32 other tests skip                                        
>      • igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:                 
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [60]SKIP ([61]Intel XE#1201 / [62]Intel   
>             XE#829) +2 other tests skip                                         
>      • igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:       
>                                                                                 
>           • shard-adlp: NOTRUN -> [63]SKIP ([64]Intel XE#1201 / [65]Intel       
>             XE#787) +44 other tests skip                                        
>      • igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7:       
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [66]SKIP ([67]Intel XE#1201 / [68]Intel   
>             XE#455 / [69]Intel XE#787) +10 other tests skip                     
>      • igt@kms_chamelium_color@ctm-0-25:                                        
>                                                                                 
>           • shard-adlp: NOTRUN -> [70]SKIP ([71]Intel XE#1201 / [72]Intel       
>             XE#306) +1 other test skip                                          
>      • igt@kms_chamelium_edid@dp-edid-resolution-list:                          
>                                                                                 
>           • shard-adlp: NOTRUN -> [73]SKIP ([74]Intel XE#1201 / [75]Intel       
>             XE#373) +10 other tests skip                                        
>      • igt@kms_content_protection@dp-mst-type-0:                                
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [76]SKIP ([77]Intel XE#1201) +15 other    
>             tests skip                                                          
>      • igt@kms_cursor_crc@cursor-offscreen-max-size:                            
>                                                                                 
>           • shard-adlp: NOTRUN -> [78]SKIP ([79]Intel XE#1201 / [80]Intel       
>             XE#455) +16 other tests skip                                        
>      • igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:        
>                                                                                 
>           • shard-dg2-set2: [81]PASS -> [82]DMESG-WARN ([83]Intel XE#1214 /     
>             [84]Intel XE#282) +12 other tests dmesg-warn                        
>      • igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:                     
>                                                                                 
>           • shard-dg2-set2: [85]PASS -> [86]DMESG-WARN ([87]Intel XE#1214 /     
>             [88]Intel XE#282 / [89]Intel XE#910)                                
>      • igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:              
>                                                                                 
>           • shard-adlp: NOTRUN -> [90]SKIP ([91]Intel XE#1201 / [92]Intel       
>             XE#323) +1 other test skip                                          
>      • igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:  
>                                                                                 
>           • shard-adlp: NOTRUN -> [93]SKIP ([94]Intel XE#1201 / [95]Intel       
>             XE#309) +5 other tests skip                                         
>      • igt@kms_dp_aux_dev:                                                      
>                                                                                 
>           • shard-dg2-set2: [96]PASS -> [97]SKIP ([98]Intel XE#1201) +1 other   
>             test skip                                                           
>      • igt@kms_feature_discovery@chamelium:                                     
>                                                                                 
>           • shard-adlp: NOTRUN -> [99]SKIP ([100]Intel XE#1201 / [101]Intel     
>             XE#701)                                                             
>      • igt@kms_feature_discovery@dp-mst:                                        
>                                                                                 
>           • shard-adlp: NOTRUN -> [102]SKIP ([103]Intel XE#1137 / [104]Intel    
>             XE#1201)                                                            
>      • igt@kms_flip@2x-flip-vs-suspend-interruptible:                           
>                                                                                 
>           • shard-adlp: NOTRUN -> [105]SKIP ([106]Intel XE#1201 / [107]Intel    
>             XE#310) +3 other tests skip                                         
>      • igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:                    
>                                                                                 
>           • shard-dg2-set2: [108]PASS -> [109]DMESG-WARN ([110]Intel XE#1162    
>             / [111]Intel XE#1214) +4 other tests dmesg-warn                     
>      • igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a7:                    
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [112]DMESG-WARN ([113]Intel XE#1162 /     
>             [114]Intel XE#1214) +4 other tests dmesg-warn                       
>      • igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:     
>                                                                                 
>           • shard-adlp: NOTRUN -> [115]DMESG-FAIL ([116]Intel XE#324 /          
>             [117]Intel XE#358) +3 other tests dmesg-fail                        
>      • igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:           
>                                                                                 
>           • shard-adlp: [118]PASS -> [119]FAIL ([120]Intel XE#616)              
>      • igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:     
>                                                                                 
>           • shard-adlp: NOTRUN -> [121]FAIL ([122]Intel XE#616) +8 other        
>             tests fail                                                          
>      • igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:             
>                                                                                 
>           • shard-adlp: NOTRUN -> [123]SKIP ([124]Intel XE#1201 / [125]Intel    
>             XE#656) +40 other tests skip                                        
>      • igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc: 
>                                                                                 
>           • shard-adlp: NOTRUN -> [126]SKIP ([127]Intel XE#1201 / [128]Intel    
>             XE#651) +12 other tests skip                                        
>      • igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:  
>                                                                                 
>           • shard-adlp: NOTRUN -> [129]SKIP ([130]Intel XE#1201 / [131]Intel    
>             XE#653) +15 other tests skip                                        
>      • igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:   
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [132]SKIP ([133]Intel XE#1201 /           
>             [134]Intel XE#653)                                                  
>      • igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:                       
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [135]FAIL ([136]Intel XE#616)             
>      • igt@kms_lease@cursor-implicit-plane:                                     
>                                                                                 
>           • shard-adlp: [137]PASS -> [138]SKIP ([139]Intel XE#1201) +5 other    
>             tests skip                                                          
>      • igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-6:     
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [140]INCOMPLETE ([141]Intel XE#1195) +6   
>             other tests incomplete                                              
>      • igt@kms_plane@pixel-format-source-clamping@pipe-a:                       
>                                                                                 
>           • shard-adlp: NOTRUN -> [142]FAIL ([143]Intel XE#1331) +2 other       
>             tests fail                                                          
>      • igt@kms_plane_alpha_blend@constant-alpha-mid:                            
>                                                                                 
>           • shard-adlp: [144]PASS -> [145]SKIP ([146]Intel XE#1201 /            
>             [147]Intel XE#455) +1 other test skip                               
>      • igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:                
>                                                                                 
>           • shard-adlp: NOTRUN -> [148]FAIL ([149]Intel XE#361) +1 other test   
>             fail                                                                
>      • igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:        
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [150]SKIP ([151]Intel XE#1201 /           
>             [152]Intel XE#305 / [153]Intel XE#455) +1 other test skip           
>      • igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [154]SKIP ([155]Intel XE#1201 /           
>             [156]Intel XE#305) +2 other tests skip                              
>      • igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1:
>                                                                                 
>           • shard-adlp: NOTRUN -> [157]SKIP ([158]Intel XE#1201 / [159]Intel    
>             XE#305) +2 other tests skip                                         
>      • igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1:
>                                                                                 
>           • shard-adlp: NOTRUN -> [160]SKIP ([161]Intel XE#1201 / [162]Intel    
>             XE#305 / [163]Intel XE#455) +1 other test skip                      
>      • igt@kms_pm_backlight@fade-with-suspend:                                  
>                                                                                 
>           • shard-adlp: NOTRUN -> [164]SKIP ([165]Intel XE#1201 / [166]Intel    
>             XE#870)                                                             
>      • igt@kms_pm_dc@dc5-psr:                                                   
>                                                                                 
>           • shard-adlp: NOTRUN -> [167]SKIP ([168]Intel XE#1129 / [169]Intel    
>             XE#1201)                                                            
>      • igt@kms_pm_dc@dc6-dpms:                                                  
>                                                                                 
>           • shard-adlp: NOTRUN -> [170]FAIL ([171]Intel XE#718)                 
>      • igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:                          
>                                                                                 
>           • shard-adlp: NOTRUN -> [172]SKIP ([173]Intel XE#1201 / [174]Intel    
>             XE#836)                                                             
>      • igt@kms_pm_rpm@system-suspend-modeset:                                   
>                                                                                 
>           • shard-adlp: NOTRUN -> [175]SKIP ([176]Intel XE#1201 / [177]Intel    
>             XE#1211)                                                            
>      • igt@kms_psr2_su@frontbuffer-xrgb8888:                                    
>                                                                                 
>           • shard-adlp: NOTRUN -> [178]SKIP ([179]Intel XE#1122 / [180]Intel    
>             XE#1201)                                                            
>      • igt@kms_psr@fbc-pr-sprite-blt:                                           
>                                                                                 
>           • shard-adlp: NOTRUN -> [181]SKIP ([182]Intel XE#1201 / [183]Intel    
>             XE#929) +12 other tests skip                                        
>      • igt@kms_rotation_crc@bad-pixel-format:                                   
>                                                                                 
>           • shard-adlp: NOTRUN -> [184]SKIP ([185]Intel XE#1201 / [186]Intel    
>             XE#327) +1 other test skip                                          
>      • igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:                      
>                                                                                 
>           • shard-adlp: NOTRUN -> [187]SKIP ([188]Intel XE#1127 / [189]Intel    
>             XE#1201)                                                            
>      • igt@kms_sysfs_edid_timing:                                               
>                                                                                 
>           • shard-adlp: NOTRUN -> [190]FAIL ([191]Intel XE#1174)                
>      • igt@kms_vblank@ts-continuation-suspend:                                  
>                                                                                 
>           • shard-adlp: NOTRUN -> [192]DMESG-WARN ([193]Intel XE#1191 /         
>             [194]Intel XE#1214 / [195]Intel XE#1608) +1 other test dmesg-warn   
>      • igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:                  
>                                                                                 
>           • shard-adlp: NOTRUN -> [196]DMESG-WARN ([197]Intel XE#1191 /         
>             [198]Intel XE#1214) +5 other tests dmesg-warn                       
>      • igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:                  
>                                                                                 
>           • shard-adlp: NOTRUN -> [199]DMESG-WARN ([200]Intel XE#1214 /         
>             [201]Intel XE#1608) +2 other tests dmesg-warn                       
>      • igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:                    
>                                                                                 
>           • shard-adlp: NOTRUN -> [202]FAIL ([203]Intel XE#1080) +9 other       
>             tests fail                                                          
>      • igt@xe_ccs@ctrl-surf-copy:                                               
>                                                                                 
>           • shard-adlp: NOTRUN -> [204]SKIP ([205]Intel XE#1201 / [206]Intel    
>             XE#455 / [207]Intel XE#488)                                         
>      • igt@xe_compute@ccs-mode-basic:                                           
>                                                                                 
>           • shard-adlp: NOTRUN -> [208]SKIP ([209]Intel XE#1201 / [210]Intel    
>             XE#1447)                                                            
>      • igt@xe_copy_basic@mem-copy-linear-0x369:                                 
>                                                                                 
>           • shard-adlp: NOTRUN -> [211]SKIP ([212]Intel XE#1123 / [213]Intel    
>             XE#1201) +1 other test skip                                         
>      • igt@xe_create@create-big-vram:                                           
>                                                                                 
>           • shard-adlp: NOTRUN -> [214]SKIP ([215]Intel XE#1062 / [216]Intel    
>             XE#1201)                                                            
>      • igt@xe_evict@evict-beng-cm-threads-large:                                
>                                                                                 
>           • shard-dg2-set2: [217]PASS -> [218]INCOMPLETE ([219]Intel XE#1195    
>             / [220]Intel XE#1473 / [221]Intel XE#392)                           
>      • igt@xe_evict@evict-beng-mixed-threads-large:                             
>                                                                                 
>           • shard-dg2-set2: [222]PASS -> [223]TIMEOUT ([224]Intel XE#1473 /     
>             [225]Intel XE#392)                                                  
>      • igt@xe_evict@evict-beng-threads-large:                                   
>                                                                                 
>           • shard-adlp: NOTRUN -> [226]SKIP ([227]Intel XE#1201 / [228]Intel    
>             XE#261) +6 other tests skip                                         
>      • igt@xe_evict@evict-small-multi-vm:                                       
>                                                                                 
>           • shard-adlp: NOTRUN -> [229]SKIP ([230]Intel XE#1201 / [231]Intel    
>             XE#261 / [232]Intel XE#688)                                         
>      • igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:         
>                                                                                 
>           • shard-adlp: NOTRUN -> [233]SKIP ([234]Intel XE#1201 / [235]Intel    
>             XE#688)                                                             
>      • igt@xe_exec_balancer@once-virtual-userptr-invalidate:                    
>                                                                                 
>           • shard-adlp: [236]PASS -> [237]DMESG-WARN ([238]Intel XE#1214) +1    
>             other test dmesg-warn                                               
>      • igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:                       
>                                                                                 
>           • shard-adlp: NOTRUN -> [239]SKIP ([240]Intel XE#1201 / [241]Intel    
>             XE#1392) +8 other tests skip                                        
>      • igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:                   
>                                                                                 
>           • shard-adlp: NOTRUN -> [242]SKIP ([243]Intel XE#1201 / [244]Intel    
>             XE#288) +24 other tests skip                                        
>      • igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:                 
>                                                                                 
>           • shard-adlp: NOTRUN -> [245]SKIP ([246]Intel XE#1201 / [247]Intel    
>             XE#1562) +1 other test skip                                         
>      • igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:              
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [248]SKIP ([249]Intel XE#1201 /           
>             [250]Intel XE#288)                                                  
>      • igt@xe_exec_reset@cm-close-fd:                                           
>                                                                                 
>           • shard-adlp: [251]PASS -> [252]DMESG-WARN ([253]Intel XE#1214 /      
>             [254]Intel XE#358) +1 other test dmesg-warn                         
>      • igt@xe_module_load@force-load:                                           
>                                                                                 
>           • shard-adlp: NOTRUN -> [255]SKIP ([256]Intel XE#1201 / [257]Intel    
>             XE#378)                                                             
>      • igt@xe_pat@display-vs-wb-transient:                                      
>                                                                                 
>           • shard-adlp: NOTRUN -> [258]SKIP ([259]Intel XE#1201 / [260]Intel    
>             XE#1337)                                                            
>      • igt@xe_pm@s3-d3hot-basic-exec:                                           
>                                                                                 
>           • shard-adlp: [261]PASS -> [262]DMESG-WARN ([263]Intel XE#1162 /      
>             [264]Intel XE#1191 / [265]Intel XE#1214)                            
>      • igt@xe_pm@s4-multiple-execs:                                             
>                                                                                 
>           • shard-adlp: NOTRUN -> [266]DMESG-WARN ([267]Intel XE#1214)          
>      • igt@xe_query@multigpu-query-invalid-extension:                           
>                                                                                 
>           • shard-adlp: NOTRUN -> [268]SKIP ([269]Intel XE#1201 / [270]Intel    
>             XE#944) +2 other tests skip                                         
>                                                                                 
>     Possible fixes                                                              
>                                                                                 
>      • igt@kms_big_fb@4-tiled-64bpp-rotate-180:                                 
>                                                                                 
>           • {shard-lnl}: [271]INCOMPLETE -> [272]PASS                           
>      • igt@kms_cursor_legacy@cursor-vs-flip-toggle:                             
>                                                                                 
>           • shard-dg2-set2: [273]DMESG-WARN ([274]Intel XE#1214 / [275]Intel    
>             XE#282) -> [276]PASS +3 other tests pass                            
>      • igt@kms_flip@dpms-off-confusion@b-hdmi-a6:                               
>                                                                                 
>           • shard-dg2-set2: [277]INCOMPLETE ([278]Intel XE#1195) -> [279]PASS   
>             +3 other tests pass                                                 
>      • igt@kms_psr2_sf@fbc-cursor-plane-update-sf:                              
>                                                                                 
>           • {shard-lnl}: [280]FAIL -> [281]PASS                                 
>      • igt@kms_psr@fbc-psr2-suspend:                                            
>                                                                                 
>           • {shard-lnl}: [282]DMESG-WARN -> [283]PASS +3 other tests pass       
>      • igt@kms_universal_plane@cursor-fb-leak:                                  
>                                                                                 
>           • shard-dg2-set2: [284]FAIL ([285]Intel XE#771 / [286]Intel XE#899)   
>             -> [287]PASS                                                        
>      • igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:                  
>                                                                                 
>           • shard-dg2-set2: [288]FAIL ([289]Intel XE#899) -> [290]PASS          
>      • igt@kms_vblank@ts-continuation-dpms-suspend:                             
>                                                                                 
>           • shard-dg2-set2: [291]DMESG-WARN ([292]Intel XE#1162 / [293]Intel    
>             XE#1214) -> [294]PASS                                               
>      • igt@xe_evict@evict-beng-large-multi-vm-cm:                               
>                                                                                 
>           • shard-dg2-set2: [295]FAIL ([296]Intel XE#1600) -> [297]PASS         
>      • igt@xe_evict@evict-beng-threads-large:                                   
>                                                                                 
>           • shard-dg2-set2: [298]INCOMPLETE ([299]Intel XE#1195 / [300]Intel    
>             XE#1473) -> [301]PASS                                               
>      • igt@xe_evict@evict-mixed-many-threads-small:                             
>                                                                                 
>           • shard-dg2-set2: [302]TIMEOUT ([303]Intel XE#1473) -> [304]PASS      
>      • igt@xe_evict@evict-mixed-threads-large:                                  
>                                                                                 
>           • shard-dg2-set2: [305]INCOMPLETE ([306]Intel XE#1195 / [307]Intel    
>             XE#1473 / [308]Intel XE#392) -> [309]PASS                           
>      • igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
>                                                                                 
>           • {shard-lnl}: [310]DMESG-WARN ([311]Intel XE#1330) -> [312]PASS      
>      • igt@xe_pm@s4-basic:                                                      
>                                                                                 
>           • {shard-lnl}: [313]ABORT ([314]Intel XE#1358 / [315]Intel XE#1607)   
>             -> [316]PASS                                                        
>      • igt@xe_pm@s4-d3hot-basic-exec:                                           
>                                                                                 
>           • shard-adlp: [317]ABORT ([318]Intel XE#1358) -> [319]PASS            
>      • {igt@xe_pm@s4-vm-bind-unbind-all}:                                       
>                                                                                 
>           • {shard-lnl}: [320]ABORT ([321]Intel XE#1794) -> [322]PASS           
>      • igt@xe_vm@large-userptr-misaligned-binds-2097152:                        
>                                                                                 
>           • shard-dg2-set2: [323]SKIP ([324]Intel XE#1201) -> [325]PASS +12     
>             other tests pass                                                    
>                                                                                 
>     Warnings                                                                    
>                                                                                 
>      • igt@core_hotunplug@hotreplug:                                            
>                                                                                 
>           • shard-adlp: [326]ABORT ([327]Intel XE#1538 / [328]Intel XE#1548 /   
>             [329]Intel XE#1717) -> [330]INCOMPLETE ([331]Intel XE#1195 /        
>             [332]Intel XE#1451)                                                 
>      • igt@kms_atomic@plane-primary-overlay-mutable-zpos:                       
>                                                                                 
>           • shard-adlp: [333]SKIP ([334]Intel XE#1201 / [335]Intel XE#455) ->   
>             [336]SKIP ([337]Intel XE#1201)                                      
>      • igt@kms_big_fb@4-tiled-16bpp-rotate-90:                                  
>                                                                                 
>           • shard-dg2-set2: [338]SKIP ([339]Intel XE#1201) -> [340]SKIP         
>             ([341]Intel XE#1201 / [342]Intel XE#316)                            
>      • igt@kms_big_fb@y-tiled-64bpp-rotate-90:                                  
>                                                                                 
>           • shard-adlp: [343]SKIP ([344]Intel XE#1201 / [345]Intel XE#316) ->   
>             [346]SKIP ([347]Intel XE#1201)                                      
>      • igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:        
>                                                                                 
>           • shard-adlp: [348]FAIL ([349]Intel XE#1204) -> [350]SKIP             
>             ([351]Intel XE#1201)                                                
>      • igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:                             
>                                                                                 
>           • shard-adlp: [352]SKIP ([353]Intel XE#1201 / [354]Intel XE#455 /     
>             [355]Intel XE#787) -> [356]SKIP ([357]Intel XE#1201) +2 other       
>             tests skip                                                          
>      • igt@kms_chamelium_audio@hdmi-audio-edid:                                 
>                                                                                 
>           • shard-dg2-set2: [358]SKIP ([359]Intel XE#1201 / [360]i915#2575)     
>             -> [361]SKIP ([362]Intel XE#1201 / [363]Intel XE#373) +1 other      
>             test skip                                                           
>      • igt@kms_cursor_crc@cursor-rapid-movement-512x512:                        
>                                                                                 
>           • shard-adlp: [364]SKIP ([365]Intel XE#1201 / [366]Intel XE#308) ->   
>             [367]SKIP ([368]Intel XE#1201)                                      
>      • igt@kms_cursor_crc@cursor-sliding-32x10:                                 
>                                                                                 
>           • shard-dg2-set2: [369]SKIP ([370]Intel XE#1201 / [371]i915#2575)     
>             -> [372]SKIP ([373]Intel XE#1201 / [374]Intel XE#455)               
>      • igt@kms_fbcon_fbt@fbc-suspend:                                           
>                                                                                 
>           • shard-adlp: [375]INCOMPLETE ([376]Intel XE#1195 / [377]Intel        
>             XE#927) -> [378]DMESG-WARN ([379]Intel XE#1191 / [380]Intel         
>             XE#1214)                                                            
>      • igt@kms_flip@2x-flip-vs-suspend:                                         
>                                                                                 
>           • shard-dg2-set2: [381]DMESG-WARN ([382]Intel XE#1162 / [383]Intel    
>             XE#1214) -> [384]INCOMPLETE ([385]Intel XE#1195)                    
>      • igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:                  
>                                                                                 
>           • shard-dg2-set2: [386]SKIP ([387]Intel XE#1201 / [388]i915#2575)     
>             -> [389]INCOMPLETE ([390]Intel XE#1195) +6 other tests incomplete   
>      • igt@kms_flip@flip-vs-suspend-interruptible:                              
>                                                                                 
>           • shard-adlp: [391]DMESG-WARN ([392]Intel XE#1191 / [393]Intel        
>             XE#1214 / [394]Intel XE#1608) -> [395]INCOMPLETE ([396]Intel        
>             XE#1195 / [397]Intel XE#927)                                        
>      • igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:                    
>                                                                                 
>           • shard-adlp: [398]DMESG-WARN ([399]Intel XE#1191 / [400]Intel        
>             XE#1214 / [401]Intel XE#1608) -> [402]INCOMPLETE ([403]Intel        
>             XE#1195)                                                            
>      • igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:           
>                                                                                 
>           • shard-adlp: [404]SKIP ([405]Intel XE#1201 / [406]Intel XE#651) ->   
>             [407]SKIP ([408]Intel XE#1201) +1 other test skip                   
>      • igt@kms_frontbuffer_tracking@drrs-suspend:                               
>                                                                                 
>           • shard-dg2-set2: [409]SKIP ([410]Intel XE#1201) -> [411]SKIP         
>             ([412]Intel XE#1201 / [413]Intel XE#651) +3 other tests skip        
>      • igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc: 
>                                                                                 
>           • shard-adlp: [414]SKIP ([415]Intel XE#1201 / [416]Intel XE#656) ->   
>             [417]SKIP ([418]Intel XE#1201) +2 other tests skip                  
>      • igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:  
>                                                                                 
>           • shard-adlp: [419]SKIP ([420]Intel XE#1201 / [421]Intel XE#653) ->   
>             [422]SKIP ([423]Intel XE#1201) +2 other tests skip                  
>      • igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:      
>                                                                                 
>           • shard-dg2-set2: [424]SKIP ([425]Intel XE#1201) -> [426]SKIP         
>             ([427]Intel XE#1201 / [428]Intel XE#653) +3 other tests skip        
>      • igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:                      
>                                                                                 
>           • shard-dg2-set2: [429]SKIP ([430]Intel XE#1201 / [431]i915#2575)     
>             -> [432]SKIP ([433]Intel XE#1201 / [434]Intel XE#327)               
>      • igt@xe_exec_compute_mode@once-userptr-invalidate:                        
>                                                                                 
>           • shard-dg2-set2: [435]SKIP ([436]Intel XE#1201) -> [437]INCOMPLETE   
>             ([438]Intel XE#1195) +4 other tests incomplete                      
>      • igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:                 
>                                                                                 
>           • shard-dg2-set2: [439]SKIP ([440]Intel XE#1201) -> [441]SKIP         
>             ([442]Intel XE#1201 / [443]Intel XE#1562)                           
>      • igt@xe_exec_fault_mode@twice-userptr-invalidate-race:                    
>                                                                                 
>           • shard-dg2-set2: [444]SKIP ([445]Intel XE#1201) -> [446]SKIP         
>             ([447]Intel XE#1201 / [448]Intel XE#288) +2 other tests skip        
>      • igt@xe_exec_threads@threads-hang-userptr-invalidate:                     
>                                                                                 
>           • shard-dg2-set2: [449]SKIP ([450]Intel XE#1201) -> [451]INCOMPLETE   
>             ([452]Intel XE#1169 / [453]Intel XE#1195 / [454]Intel XE#1356)      
>      • igt@xe_gt_freq@freq_suspend:                                             
>                                                                                 
>           • shard-adlp: [455]DMESG-WARN ([456]Intel XE#1162 / [457]Intel        
>             XE#1191 / [458]Intel XE#1214) -> [459]DMESG-WARN ([460]Intel        
>             XE#1191 / [461]Intel XE#1214)                                       
>      • igt@xe_pm@s3-exec-after:                                                 
>                                                                                 
>           • shard-adlp: [462]INCOMPLETE ([463]Intel XE#1195 / [464]Intel        
>             XE#1358) -> [465]DMESG-WARN ([466]Intel XE#1191 / [467]Intel        
>             XE#1214)                                                            
>                                                                                 
>    {name}: This element is suppressed. This means it is ignored when            
>    computing                                                                    
>    the status of the difference (SUCCESS, WARNING, or FAILURE).                 
>                                                                                 
> Build changes                                                                   
>                                                                                 
>      • Linux: xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027 ->               
>        xe-pw-133404v1                                                           
>                                                                                 
>    IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @                         
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git                         
>    xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027:                            
>    2756f0412a64d4a3bedfb79b868fbd8c313ed027                                     
>    xe-pw-133404v1: 133404v1                                                     
> 
> References
> 
>    Visible links
>    1. https://patchwork.freedesktop.org/series/133404/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/index.html
>    3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@xe_pm@d3hot-basic-exec.html
>    4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-1/igt@xe_pm@d3hot-basic-exec.html
>    5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-434/igt@xe_pm@d3hot-multiple-execs.html
>    6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-434/igt@xe_pm@d3hot-multiple-execs.html
>    7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    8. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>    9. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   10. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>   11. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html
>   12. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1609
>   13. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html
>   14. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-lnl-8/igt@kms_fbcon_fbt@psr.html
>   15. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-suspend.html
>   16. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-suspend.html
>   17. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
>   18. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
>   19. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@core_hotunplug@hotrebind-lateclose.html
>   20. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   21. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
>   22. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html
>   23. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html
>   24. https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   25. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
>   26. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   27. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   28. https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   29. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>   30. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   31. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   32. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@kms_atomic@crtc-invalid-params.html
>   33. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   34. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   35. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
>   36. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
>   37. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
>   38. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>   39. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   40. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
>   41. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   42. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   43. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>   44. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   45. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
>   46. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   47. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   48. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@kms_big_joiner@invalid-modeset-force-joiner.html
>   49. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   50. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>   51. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   52. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   53. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
>   54. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   55. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   56. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   57. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7.html
>   58. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   59. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   60. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
>   61. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   62. https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   63. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html
>   64. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   65. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   66. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7.html
>   67. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   68. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   69. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   70. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_chamelium_color@ctm-0-25.html
>   71. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   72. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   73. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html
>   74. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   75. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   76. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html
>   77. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   78. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-max-size.html
>   79. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   80. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   81. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html
>   82. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html
>   83. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   84. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   85. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>   86. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>   87. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   88. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   89. https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   90. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>   91. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   92. https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   93. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>   94. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   95. https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   96. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-435/igt@kms_dp_aux_dev.html
>   97. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@kms_dp_aux_dev.html
>   98. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   99. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-6/igt@kms_feature_discovery@chamelium.html
>  100. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  101. https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>  102. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-4/igt@kms_feature_discovery@dp-mst.html
>  103. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>  104. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  105. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>  106. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  107. https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>  108. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
>  109. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
>  110. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>  111. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  112. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a7.html
>  113. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>  114. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  115. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
>  116. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  117. https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>  118. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
>  119. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
>  120. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  121. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
>  122. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  123. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
>  124. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  125. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  126. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
>  127. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  128. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  129. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
>  130. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  131. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  132. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
>  133. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  134. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  135. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-434/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
>  136. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  137. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@kms_lease@cursor-implicit-plane.html
>  138. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_lease@cursor-implicit-plane.html
>  139. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  140. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-6.html
>  141. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  142. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a.html
>  143. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
>  144. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@kms_plane_alpha_blend@constant-alpha-mid.html
>  145. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_plane_alpha_blend@constant-alpha-mid.html
>  146. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  147. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  148. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
>  149. https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>  150. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>  151. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  152. https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>  153. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  154. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
>  155. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  156. https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>  157. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1.html
>  158. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  159. https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>  160. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html
>  161. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  162. https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>  163. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  164. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_pm_backlight@fade-with-suspend.html
>  165. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  166. https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>  167. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html
>  168. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>  169. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  170. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
>  171. https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>  172. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>  173. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  174. https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>  175. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@kms_pm_rpm@system-suspend-modeset.html
>  176. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  177. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>  178. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>  179. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>  180. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  181. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_psr@fbc-pr-sprite-blt.html
>  182. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  183. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  184. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_rotation_crc@bad-pixel-format.html
>  185. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  186. https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>  187. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
>  188. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>  189. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  190. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_sysfs_edid_timing.html
>  191. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
>  192. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
>  193. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  194. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  195. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  196. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
>  197. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  198. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  199. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
>  200. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  201. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  202. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html
>  203. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
>  204. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-6/igt@xe_ccs@ctrl-surf-copy.html
>  205. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  206. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  207. https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>  208. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-4/igt@xe_compute@ccs-mode-basic.html
>  209. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  210. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>  211. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0x369.html
>  212. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>  213. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  214. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-4/igt@xe_create@create-big-vram.html
>  215. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>  216. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  217. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
>  218. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
>  219. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  220. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  221. https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>  222. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html
>  223. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
>  224. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  225. https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>  226. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-6/igt@xe_evict@evict-beng-threads-large.html
>  227. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  228. https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>  229. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-6/igt@xe_evict@evict-small-multi-vm.html
>  230. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  231. https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>  232. https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>  233. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
>  234. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  235. https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>  236. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@xe_exec_balancer@once-virtual-userptr-invalidate.html
>  237. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@xe_exec_balancer@once-virtual-userptr-invalidate.html
>  238. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  239. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html
>  240. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  241. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>  242. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
>  243. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  244. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  245. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
>  246. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  247. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562
>  248. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html
>  249. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  250. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  251. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@xe_exec_reset@cm-close-fd.html
>  252. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@xe_exec_reset@cm-close-fd.html
>  253. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  254. https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>  255. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@xe_module_load@force-load.html
>  256. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  257. https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>  258. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html
>  259. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  260. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>  261. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@xe_pm@s3-d3hot-basic-exec.html
>  262. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html
>  263. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>  264. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  265. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  266. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html
>  267. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  268. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html
>  269. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  270. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  271. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>  272. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>  273. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>  274. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  275. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>  276. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>  277. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-435/igt@kms_flip@dpms-off-confusion@b-hdmi-a6.html
>  278. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  279. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@kms_flip@dpms-off-confusion@b-hdmi-a6.html
>  280. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-lnl-1/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
>  281. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-lnl-1/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
>  282. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html
>  283. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-lnl-7/igt@kms_psr@fbc-psr2-suspend.html
>  284. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
>  285. https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>  286. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  287. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
>  288. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>  289. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  290. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>  291. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html
>  292. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>  293. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  294. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html
>  295. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>  296. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>  297. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>  298. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html
>  299. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  300. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  301. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
>  302. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
>  303. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  304. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
>  305. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
>  306. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  307. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  308. https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>  309. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
>  310. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-lnl-8/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
>  311. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>  312. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-lnl-3/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
>  313. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-lnl-2/igt@xe_pm@s4-basic.html
>  314. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  315. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>  316. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-lnl-8/igt@xe_pm@s4-basic.html
>  317. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
>  318. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  319. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html
>  320. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
>  321. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>  322. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
>  323. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@xe_vm@large-userptr-misaligned-binds-2097152.html
>  324. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  325. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@xe_vm@large-userptr-misaligned-binds-2097152.html
>  326. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-8/igt@core_hotunplug@hotreplug.html
>  327. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
>  328. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
>  329. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
>  330. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-1/igt@core_hotunplug@hotreplug.html
>  331. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  332. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
>  333. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>  334. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  335. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  336. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>  337. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  338. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
>  339. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  340. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
>  341. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  342. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  343. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
>  344. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  345. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  346. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
>  347. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  348. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>  349. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>  350. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>  351. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  352. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
>  353. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  354. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  355. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  356. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
>  357. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  358. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@kms_chamelium_audio@hdmi-audio-edid.html
>  359. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  360. https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>  361. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@kms_chamelium_audio@hdmi-audio-edid.html
>  362. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  363. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  364. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>  365. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  366. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  367. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>  368. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  369. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-32x10.html
>  370. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  371. https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>  372. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-32x10.html
>  373. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  374. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  375. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html
>  376. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  377. https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>  378. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html
>  379. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  380. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  381. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html
>  382. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>  383. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  384. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html
>  385. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  386. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
>  387. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  388. https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>  389. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
>  390. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  391. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
>  392. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  393. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  394. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  395. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
>  396. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  397. https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>  398. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>  399. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  400. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  401. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  402. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>  403. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  404. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
>  405. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  406. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  407. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
>  408. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  409. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html
>  410. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  411. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html
>  412. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  413. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  414. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
>  415. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  416. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  417. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
>  418. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  419. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
>  420. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  421. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  422. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
>  423. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  424. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
>  425. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  426. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
>  427. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  428. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  429. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>  430. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  431. https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>  432. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>  433. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  434. https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>  435. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@xe_exec_compute_mode@once-userptr-invalidate.html
>  436. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  437. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@xe_exec_compute_mode@once-userptr-invalidate.html
>  438. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  439. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
>  440. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  441. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
>  442. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  443. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562
>  444. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>  445. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  446. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>  447. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  448. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  449. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-dg2-464/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
>  450. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  451. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
>  452. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
>  453. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  454. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
>  455. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-6/igt@xe_gt_freq@freq_suspend.html
>  456. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>  457. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  458. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  459. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html
>  460. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  461. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  462. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1265-2756f0412a64d4a3bedfb79b868fbd8c313ed027/shard-adlp-1/igt@xe_pm@s3-exec-after.html
>  463. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  464. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  465. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133404v1/shard-adlp-8/igt@xe_pm@s3-exec-after.html
>  466. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  467. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
