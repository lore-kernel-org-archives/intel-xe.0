Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ACEC87FCF
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 15:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65C510E58A;
	Mon,  4 Aug 2025 15:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftBzoQL2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE7510E58A
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 15:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754320331; x=1785856331;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rdB6mn44+Ebwas8SgMhEch+BG4U70iLloF30IcdR+wk=;
 b=ftBzoQL2tz4Jpj5rrrlWIHwcXXMC4REpO8cgGP6dEL2AN1FzImcjs5jn
 c4pK7DAzq10t0t4GcAXStDzAmrP31wG5qiGVXrygdYuXhGNx9dziioY7f
 VrfMK7qem+EWYjy57gfOrrVJdug6+Pl+twAO+lbvsRC4REAPsTyBQrqGC
 m0meYsIUn2asPASOYnR1q2fjaiElqDDz2Yyye5t8bG40G5aoC4qJh6dVX
 wr/YandHsLHnfhipGE/PJUMYsJ5Thm/j2BbYFPtFRSBlDmRseekNFDfBk
 lb/UDqRHYTDuBVrVZE6QtfEo+IdDOp+ApS3ASLcsq9ALZ8zsg9w1e2NeL Q==;
X-CSE-ConnectionGUID: /h2Q7ma9QGS3n7y0H/fsNw==
X-CSE-MsgGUID: 6gum1swYSQ+Tcq/0V7pOqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="67653661"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="67653661"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 08:12:11 -0700
X-CSE-ConnectionGUID: zWSIUPsiTlCl4Pk8AitjYg==
X-CSE-MsgGUID: vmgrBSzmTtyBuL8YL6vU8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="168392122"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 08:12:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 08:12:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 08:12:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 08:12:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFbh0whTqFcts6ng8kVO4CIJeuFInTUBD0i5CVlipHRyjBKhd79opGWTvphPdgIlMBjjEZqUaN1uoBHKTk1CeCILPBHyN6Ifp7zx0awDxLNRVedG8Ji0U1SFaTEclkM+4OtGfS0XpRE/ALhSoLI0wP+Fug47hhykywt7IwxD8+upRUapiPR8u/urQ+0+fAUXIUUgr0MGLBp89bycZ9QuPFb55nJEm8y5CF7Hs2fhf8OfX0O58weNTrr4xN5fbloJPzPzm5xvdUdwNKvCgdbIVZ/lEWqv+5PqkZuaYE8zRnrrM5TDBgLbt3UruNlCmUGse69FBHlyvgIyTyE/tyRCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJSBBSZidfEED/2NRGGBISNpWIfZJKnU+N0d0olbSAg=;
 b=nIW+FSyfb0F0vo8P51i+lMCFZmKIItpqBor/ft6lH4AViHBjk4s30qA2qikZDGQp2U5218nViVMTcJsW6w5B8XAD/Q2ixTbCcrn91UKkG6ND3Kw48vNoZZxD5hdEOqk2wHnKqHgbRAYeVQjbe8ZM+6F+BywLiuCFdBTAVCA3tv1vtNWrZHqspZvV1Qc0kZXoo7gmqCdi7YJC3ylK43UeeboETN0MVBtH+f4SX6wHLdKhapLioRvbcqwLXf0jPdKw5/x8K7ExmO3pj58/XelCxuuTG/Y9PsT32ZdnRDnJywq0L6wLPB489oY031e/kYt9CSzHU+OPloXXaSsnorECyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA0PR11MB7750.namprd11.prod.outlook.com (2603:10b6:208:442::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Mon, 4 Aug
 2025 15:11:51 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 15:11:51 +0000
Date: Mon, 4 Aug 2025 11:11:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, "Anshuman
 Gupta" <anshuman.gupta@intel.com>
Subject: Re: [PATCH v3] drm/xe/pm: Disable RPM for SR-IOV VFs with no PCIe PM
 capability]
Message-ID: <aJDNq7IzmGBFSytg@intel.com>
References: <20250801163017.23242-1-satyanarayana.k.v.p@intel.com>
 <aJDI21VmY6Unf9Vw@intel.com>
 <9f22cc70-116f-4ba5-a2f5-08dfce89e5c3@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f22cc70-116f-4ba5-a2f5-08dfce89e5c3@intel.com>
X-ClientProxiedBy: CP6P284CA0058.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:1ab::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA0PR11MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f8e0db-0148-4c16-5154-08ddd3693d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTV3WUxLVEtpSVpVaTcwY254Vkd5TDN4RUpieFVISVZTT3pOQkFaNEorMTMz?=
 =?utf-8?B?bWc1cmhJanZlTC9FVFZoZkRyL2dnQW0wV3lQckdaZ3lsc3lSeEZMRlNpMXBC?=
 =?utf-8?B?U2tXb2QwaEJGTFRKbVlEaHR6eSs3NDlxREZOeEZQd1pKdjhJd244a2VxTTFx?=
 =?utf-8?B?VytuSUR2c2l5OFR1OURST3I0RStoVUJCQnVGcFd0dnFxOER5aFJNQzNkT0c0?=
 =?utf-8?B?eFltMnZKWG94TE8wbjVPL1liZ0pwUXJobnNNc1JHYmtrcjQ2RExiNFlMV3JP?=
 =?utf-8?B?MEVCbXpsZkRnd3hEaVFmS3p4bHB0eHV2VHJoTkVKOFVUS3k4T2xKT0pJdEJy?=
 =?utf-8?B?a3dCejhSazQ2RVUrTDdsU01iRVo4bTd5Nk50R2VMaERwMitFZUFxbXB0d3Fz?=
 =?utf-8?B?RGVxZmwzUW44WUgyTk43Ris4ei83cHRXMG52VFAvWHRpaTdoNm44aWI4NDkv?=
 =?utf-8?B?clphcnVCMGZhWCtValZiK08wTXVYaE1sWHVDYTZCcnJoaFZpYk9hVkRSQWxM?=
 =?utf-8?B?ekIwMlprQjNUK3E4ZTk1QXJrRys4Z1hjS2ExWUU0RHZsM0d4L3ppTThnaHlJ?=
 =?utf-8?B?NWtpWnIzNlVlUXBGdlgrcHgzVU1jQnV3U0Q1MkNKM1dPUWFtZk5iQWpyQUdX?=
 =?utf-8?B?RDR1UFpRb25KTWhDbG5nV0VYSVJWT0FsNXF2YUlBbHpIZXlCaHlWZWs5SDlj?=
 =?utf-8?B?Mk93bW9lcVEyeXBFQ0hZd1BQcE5mQnJsaEQwMTBEQzVYOXpRVkdVMFJSYlM0?=
 =?utf-8?B?T1RwWmhBRStEeGJIamxwLzhqUDhXdmJLZmtQeXFFb1hWZUE0SEllR1Axbld1?=
 =?utf-8?B?SzVlVjRIbXBndCtWajVrcmVxMXArRU94d1NUMG5DWmtlWXRrN2lLVEg1cjND?=
 =?utf-8?B?K1NWeTBnRU5VUmxpWTBwUm1UNCs4c1puRmRoRlgzakVPQ29Bem15T2VHcTdj?=
 =?utf-8?B?TXlObjMvT0pjUDVncXRwbEZWQUQ1L1F2c1UxR2VoVWNmSm9JZmo0MjlJWVRn?=
 =?utf-8?B?aDM2NktWVkJuYmtBcHc5Qk1KQTE2YlJrd0RTeEVCWDhGeFJRWEtqSnBic0U5?=
 =?utf-8?B?VEdpWnVWb1l5c2IzVGlUekt0VEhlTXV5SWFpWTBxdVBxM1BSaUlJa281U1Jo?=
 =?utf-8?B?S3ZvRmoyRmFsbGcrMUE0bHlxWVF2ZUhNWXc2eVFJd1B4R1Q4YzloTzM4OGZh?=
 =?utf-8?B?VTNxYm1jU3c5c0RzZUhPaWFFLzBJaXBaZmRtb0pET1BDVE9rejhQSW1HY2Jk?=
 =?utf-8?B?UnZ5ek1kc204YklDL1hNaGFISWFQL25jQ2ZaeDVOTW1jbWg5a2ZrN1JWY1Va?=
 =?utf-8?B?Uk9hdS9ZUmdsalRLY1NtdDB0M01HRG44Z2FHZDYvSVcvV2dvb3YwYk9QVUFr?=
 =?utf-8?B?azJJbHJpYmZnRXpYa3djaTd5MGVlTzE3WTRaSlVjMVlybERkQUsrUUNzNzBQ?=
 =?utf-8?B?VURLTCtwYTRMTXdnWW5NZjFRUnFpeWNLT1owb2VIY2tzSWpFZzVoWHFnTThD?=
 =?utf-8?B?eEtYeFNQajVDN1ovN0crMUQ5MUx5aWt1TTBkTWcrMTdMTHpiLzdLMXpmdjkz?=
 =?utf-8?B?NmxMaEd6SHp0VmRmM3d3dHRaQk9yM05TeXBYSnllTktIUHgweE1kTEpIWXJI?=
 =?utf-8?B?QmZJNy81clRHRksrdnVFckxvbUZTTXkvRUdUblhNTnh0Yms2ZStQOUNRdXlC?=
 =?utf-8?B?OFRtWk5NRXl4L3B0cHl0b3l2VzVVSzBPUHp0c3V4RWFNUjlWdFlEMThUSnVW?=
 =?utf-8?B?cDJmU0hEd0RyVHhwdFE2T2ljUjEzM0xsTWNUMnNsM3N0N3pnUDN4MFVjcjFZ?=
 =?utf-8?B?WFJmbXRRWUUxQzFzVWVpT1BodGZCWHM0VHdHM3lXRnJ5Mm9FNnU0YW8wOEdj?=
 =?utf-8?B?MzFpODdFKzR3Mk9tbVFOTkZsUENubDZRSysycXdlNWVXNE1Wa0JSY2N3eWRS?=
 =?utf-8?Q?48xuw2ZmWxc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VitSTVAwWUtxN2xLNHBuSmt0QUVWZWhKYk1jY040eXVLMXpTOXRzc2I5STlM?=
 =?utf-8?B?aHd0cmNhKzE2WDBBYkZlazNGYTJLM1gwMmk3QUVtL01oZ3d3eDJickFUNUdD?=
 =?utf-8?B?Vy8rbzZhNWxPbGZ6WUxXTlJ2aHYydWkzdnpuQTdsWk8rekJZSTZkV2hHRHht?=
 =?utf-8?B?M3o2Qk80ckl0eEdVTFkrVEN5L2hOeGhzbEQ4blRMUXdnQzFaVExOZ1F4SVdr?=
 =?utf-8?B?aEowSWNKdVRlZWptRjczREhlTnBEbjZPdmN5M0tWa21lb1dyT0Fmb1o1cHRQ?=
 =?utf-8?B?TXhDcWNva3Rac3ByekN4OStCaVRHUTh2eWlERTAxV0Z3bXdwTjMxc3NaZlM5?=
 =?utf-8?B?QWZoNkk4OVpnQko1OFVRY2gyTmFTR2p0MUEvdWt4WHViZkxITlNqWGptU2cr?=
 =?utf-8?B?V0dMYzA2d0VmSWtUOTA1NWNqMngrU2ZOQUwzYnRHd0hiV2ozM1pReVpIalVa?=
 =?utf-8?B?aDM5MCs1ZHZra2Fod05MdjM5ZWE4SDR1UDc1TVp1WUdWaWxZMTM0d2VqTzBu?=
 =?utf-8?B?a01tbU54QmtjQngrWG1TSnU2d2pBMXBXbzFLc1hPVlExYnEvRjVjVFh3ZlBC?=
 =?utf-8?B?bWFVOVN0bVEwUjE1WHBqWENWbzdBQ1BxNFY0dGhFR2VTa2tqN0l4VDJpb25h?=
 =?utf-8?B?OWlCU3JtU0x6cFhTdUJUblVqTUpkTlFvdXFOdjBreS82TGFSNHlNckNoeWw0?=
 =?utf-8?B?NWFiaFRTcXVkZE5oUU95M3g2Rlg1R1VjZWVyQ3pSN1phYUlvelpVZFVualJV?=
 =?utf-8?B?eW11OUk3Ykt3UG5wbEV4d00zdTAwajBGTi9IUHQzMDR3OUtSdGxOME50Tlp2?=
 =?utf-8?B?Nk5vM0RTSnNpdWQzdnNkTzFONHdQQ05nM3NIQktIMkMxWDRIUWJTNkVFUWVr?=
 =?utf-8?B?ZnZ6UXdJMVU5bEFCN0xyR0F6dCtuVUFUVEtTNVNqaGQraGVzZlFETE00dnpy?=
 =?utf-8?B?azlXb3lxS1VUU2tMYmlrcXcxd2tvcGRMZ0VGd0FMS3djYXoxeHlZdjdCWngv?=
 =?utf-8?B?QWgwK2sxaW1GSWxIQUcybVJuUFhydDZhR21JTkovbEs0NWpmYlhpVlVFWmM5?=
 =?utf-8?B?MzRLVlV4c3dMQXNFUEdaVVVBYlY0Q3RieUw1QkgxZCt1djIxL1FWOWt5cmRB?=
 =?utf-8?B?cmNKSmhOWTVDa1pSWWNseFlSSnIxVUhyMWx3MmJEaXVTek1ZRi9NS1ZlQWFp?=
 =?utf-8?B?cnJvYnVONTdESlpKNkM5bjJUM0c2dytYcDlKOEV0WEtXdHA2NDlGY3l6eUF0?=
 =?utf-8?B?ZGh0NHlBMC8vNENHSGd2QjlqTFlSZE9uaWZMRnJIRVVzZkx2OVFLVEVWTE8w?=
 =?utf-8?B?MGNFZkdCd3BTTUxTbDhqSWtTTjdOZjVkSXZ1TjUxMUltQU94L2YyQ3p3b0pV?=
 =?utf-8?B?akFqeU5sTHcvaFdJTDRtY1FjQlNBZ1ZSWVJDNFpmY2Q1SWVJY1NrSnZwb3lW?=
 =?utf-8?B?a1BBdXZxbk5oMHYyZlFkN1I2Q1pxRjhpdTFTNkhGMXgzcUhlclVRSG1jZUl5?=
 =?utf-8?B?SjRrNTJYaWNFaVVydDZ4MXcrYjg4V09jY1gwbmVVZ0Z2M3M0ZjEydGJHZHdK?=
 =?utf-8?B?SVliMGxpc0phcG9ZSEZIalQ1WHpCeURDWUR1ZG1pM0tvcno2UG1QbUxzbFJR?=
 =?utf-8?B?c0JVMlIzY3ptOFZSQy9EbXFlNGE3NEVZMVpEWWhidG13VjRCK3YzSHBneGY5?=
 =?utf-8?B?SVMyM0dLNzg5UUlNWXNKZFBYeWF0TFVHTUt5REM2TmU1ZUlyYmt0SFdReU9N?=
 =?utf-8?B?d1h4aGV6cS9CRms1VEYyaWRmWDR2NzZmMkgvMXdSSkZRQ2txT1laZnpEWWds?=
 =?utf-8?B?ekdCdXo1anE3WU9mdmVtaFEwRmQxcitPNThxTlgyTFBmNG5QK1lPOFhtaXRR?=
 =?utf-8?B?eGljTE01TTlKb0wzMEFmSEk4N0E0REo3bjc0aURSVHo4WGd0YlpRMDNoRk5y?=
 =?utf-8?B?NTE1bm9TbVkrN2tkSSs5SDdkUS9GNXlZZnU1SS9QV3pob3o0OVEzMTJZQVlz?=
 =?utf-8?B?dTRVb2RMMm1tT1Bnd0pWZ1dNYWllcUxXMlNLbjJicWFRVlUvc3pIWmkwTG1v?=
 =?utf-8?B?dlBsTVJRQ0NhYTJrT0ZUdXRwbGU4Q09UTDVEOVNXNHJ2dC9MbHNMcnhrbTMw?=
 =?utf-8?Q?YQBL2RQ9627hWxAYZzrGRaJ3j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f8e0db-0148-4c16-5154-08ddd3693d6e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 15:11:51.5309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pby3PXFSBO0GTEcVqjhURTns1KDHtZqyf2CevYlb/40w6yeYxFVWAgZk7aWkOZRf/jeDEPzurwSD5hC5pmm6qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7750
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

On Mon, Aug 04, 2025 at 08:30:12PM +0530, K V P, Satyanarayana wrote:
> 
> 
> On 04-08-2025 20:21, Rodrigo Vivi wrote:
> > On Fri, Aug 01, 2025 at 10:00:17PM +0530, Satyanarayana K V P wrote:
> > > Enable Runtime Power Management (RPM) for PCI Express devices by utilizing
> > > their native Power Management (PM) capabilities. The specification (as per
> > > section 5.10.1 in PCI Express® Base Specification Revision 7.0) mandates
> > > that Virtual Functions (VFs) without Power Management capability inherit
> > > their associated Physical Function's (PF) power state.
> > > 
> > > As per PCIe spec "If a VF does not implement the PCI Power Management
> > > Capability, then the VF behaves as if it had been programmed into the
> > > equivalent power state of its associated PF"
> > > 
> > > Since Intel GPU VFs lack PM capability implementations, VFs power behavior
> > 
> > If this is a true statement your patch below is wrong.
> > It should simply be if (IS_VF) return;
> > 
> The current GPU VFs are lacking PM capability. But in future, if VFs (new
> generation GPUs) support PM capability, then VF should be able to manage PM
> on its own. As per spec, if VF does not implement PCI PM capability, it
> should follow PF power states. If implemented, VF should manage PM directly.
> 
> So, checking for both pm_cap and IS_VF.

So the commit message should be written in a way to explain that possibility.

But anyway, please step back for a moment and think about the whole flow
itself and the reasoning behind pm_cap.

pci subsystem is the one already checking the pm_caps before doing the
pci pm transitions. If the check is not there, please go there and add it
to the pci subsystem.

From our side, if we need to avoid that VF follows the PF and goes to sleep,
then the PF needs to get an extra refcount for the whole duration of the VF,
so PF won't be allowed to sleep then VF will also not sleep.

> 
> > > must mirror their PF's state. During VF creation, the PF remains active
> > > from the PCI subsystem perspective. To maintain consistency, explicitly
> > > disable RPM for VFs missing PM capability to ensure they follow their PF's
> > > power management status rather than entering low-power states
> > > independently.
> > > 
> > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > ---
> > > V2 -> V3:
> > > - Fixed review comments (Michal Wajdeczko).
> > > 
> > > V1 -> V2:
> > > - Disable RPM only for VF devices when PM cap is not implemented.
> > > ---
> > >   drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++++++
> > >   1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index 8aae66660931..019de04fa7bb 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -246,8 +246,18 @@ static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
> > >   static void xe_pm_runtime_init(struct xe_device *xe)
> > >   {
> > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > >   	struct device *dev = xe->drm.dev;
> > > +	/*
> > > +	 * Disable RPM for VFs if PM cap is not supported.
> > > +	 * As per PCIe specification, "If a VF does not implement the PCI Power
> > > +	 * Management Capability, then the VF behaves as if it had been programmed
> > > +	 * into the equivalent power state of its associated PF"
> > > +	 */
> > > +	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
> > > +		return;
> > > +
> > >   	/*
> > >   	 * Disable the system suspend direct complete optimization.
> > >   	 * We need to ensure that the regular device suspend/resume functions
> > > @@ -366,8 +376,12 @@ int xe_pm_init(struct xe_device *xe)
> > >   static void xe_pm_runtime_fini(struct xe_device *xe)
> > >   {
> > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > >   	struct device *dev = xe->drm.dev;
> > > +	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
> > > +		return;
> > > +
> > >   	pm_runtime_get_sync(dev);
> > >   	pm_runtime_forbid(dev);
> > >   }
> > > -- 
> > > 2.43.0
> > > 
> 
