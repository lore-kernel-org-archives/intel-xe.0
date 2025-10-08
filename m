Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FA2CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 17:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5C810E879;
	Wed,  8 Oct 2025 17:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9toHA4p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CC910E879
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 17:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759944299; x=1791480299;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=KpEYo051t6BlY97j2qpn2Sm78mDIIc/xMIjcDx3Zxc4=;
 b=i9toHA4phBAxOkRAnyeFXpV51m+MgjJzoNYP5nVjxt7v0ZMVfTu+IfNc
 GSsgW53QUe9LlUqGavTYfUJHlaiA/Xz8HrF9t90e98NliBYeJl4kZulDs
 C4/0kmJuyMsRmGEt1iB6RaigsHgjnOpM+xa1yvt+3K5J/jniBorKghYIB
 1dwgnpF44ACTMp01emaDactZ7LKCwRwADAxMFD2r9puBJnXi70fvJB5G6
 iEKNF3+eXw68CtbNb6f67A388gprtIcZ8MbEIvf9cpSAScHyhRyPDbGNL
 ZUFeD8nFNaZTSZcqKnwAxpobnXQXQ1kpTgJkPO6/R2qlpw7QJ0V9cadq0 A==;
X-CSE-ConnectionGUID: uPiEDarITA6MT2Wj26rmIg==
X-CSE-MsgGUID: fPSnnJU0QvCQbMwm3SI2kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65973493"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208,217";a="65973493"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 10:24:58 -0700
X-CSE-ConnectionGUID: QQC1fb4fQFiJjYdOJNJuAA==
X-CSE-MsgGUID: CoaZ+hUUTN2m1WfbCk8QSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; 
 d="scan'208,217";a="180905070"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 10:24:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 10:24:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 10:24:57 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 10:24:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJ1yAFxbJjiznpkXFykfsL2G5wyzkHYTZsMj+XSE026E18xo95NbQTYQVKQLi5n6ctMFQDErrpYmR37Re57Iqo96BGam4PFiPkYnfDz1LipNLT5f92BPI50PIAw05R2/Ctfj7kwdSzULnY1zEuxK3QQD+9NtZzpAcdq1HUkvaXiZ3KXPRpiHvGqLrzAO4d0p+lr+XWwXzgEYTvXdCMqlUhycxa0tGbNwJRZ8KuHe6227Xwkj8YP3mGM+gGzlpnuHrCSQ2A/LlovXfipi5Nppbnl0HJEoYQkt5Zu4erGwznVEAoy0k2vlQEWrQpfGi2qoxBwPo5Iqz712972T4fXBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWVonWZm/H5RHqPIfDb/Va+cP76lHbUVOs+qRjglja8=;
 b=jLPA70ubFuZX3+rdp3vTfgQ7FYgvcM+vm7bFFQA48MywoXuSTis9539c+WWvbWUTqpKwbHxHy4ZeutbDW0OEUH6lfS2sVkUAF3eRXeNGCdTW3x7ketSLkdidJ6to7Z1c3hEY6Korhu3dFKs92szvuSJlJjXTWSzFG6GKBZntszihFIKSkevECHCw3WQEcRJcvXVIZr3E0GtEuZ3+/zi2LeIGByesW1n13pOt9CqEgTkiYND6AkBGiH4r+wxF4Xrmq44j2B4MhL5t3xxyGjzOliy/0gJlKOTW6+M+1tyWx6NJHkpjLyMi/31TOK6Okp8Q3CRtlK9foOeO6KqC1hvi8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA2PR11MB4953.namprd11.prod.outlook.com (2603:10b6:806:117::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 17:24:54 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9160.018; Wed, 8 Oct 2025
 17:24:54 +0000
Content-Type: multipart/alternative;
 boundary="------------6ZMHrDOBBZAAwZM1FMgVmgrF"
Message-ID: <e50a9f82-976b-4cac-988c-4ce137402c5d@intel.com>
Date: Wed, 8 Oct 2025 10:24:45 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGU6IEVu?=
 =?UTF-8?Q?able_media_sampler_power_gating?=
To: <intel-xe@lists.freedesktop.org>
References: <20251007230208.1567234-1-vinay.belgaumkar@intel.com>
 <175989032876.15825.12024952879309754730@6aec98b87f92>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <175989032876.15825.12024952879309754730@6aec98b87f92>
X-ClientProxiedBy: DU2P250CA0004.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::9) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA2PR11MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a040529-e8d4-4a23-8894-08de068f97ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WklQQ3puMWxVUkR1Z3ZwcU5ySjkvTDkvWGpsZlFaUDRQa05UcUFOUFZnRUVB?=
 =?utf-8?B?eEtoTXJRTGZ5NVBmd1FqczJ5emNxUTNlK3p1VnVFVUxQVFJRc1pBVVpjM0hM?=
 =?utf-8?B?Vm5uMFcvcElVclpkZFNlT0dYaW9adjBGNm9OMW0wdGNmeWxRVWJtQnFEZElP?=
 =?utf-8?B?cENxTkp2NDhjZ1dteHA0Z2NQYUZCK2FaRGJZMHRKd0ZIOHNLOFd2VkRIbmxk?=
 =?utf-8?B?UHU3Z2VTeXVYZ2NwajZ0VnRLVmlaV3RQZWhYd3cvSHdBNXVjUGYyWi9EeGhi?=
 =?utf-8?B?Q1R5M3puN200WHhhampBZ3ROSDBuSTEvTmVLSlFGZ29pRlJGK0xWaEhkWGVa?=
 =?utf-8?B?OU5xUXZhekRjTWhzWk9EOFFxZHVpaXRGdk8wdUZ5UDJsNFp2YXhmSFBmWmdE?=
 =?utf-8?B?MDJNUmJydXYxcGw1OWtuZzM5aEtHMEdUclZKR0VXK3pUWVFpYVRSUXViQndx?=
 =?utf-8?B?VG9MbWoyZWN3RzdlWFRPS3g1d05JSnJ2aFhJR1JvWEhwMUZ3aHYvczZhZVov?=
 =?utf-8?B?L3ZLNE1uYTJ5TFVPZk9HeThUMURzNkYwRkR1KzNxbXJpdUVlcDA3VFR2Kzdp?=
 =?utf-8?B?L0xiWldlZ0lDUW5UMjVIdnJpdFBvR3ZWWFppWm1DWXhXelRkQVl6QXF0M1FC?=
 =?utf-8?B?ekJDanY3OWgxTnpYcms1UFpXbHp2cXZkSnFhZDk0Y0U5aUk2SWduZ1A4MGxp?=
 =?utf-8?B?Yk5BdVF1a3BDSVFUbC9SSVBOMkVndFhiNlJRY1lXaGd0cTBoSjZPK1JGSU1m?=
 =?utf-8?B?YjZSYUQzODRCK0NCLzJaN2hHczh6cWFPZ0JiZk1SVHNlQUo4blIrcHF1SWZB?=
 =?utf-8?B?NHRmSVYxWWtPMzRMRGQzMkpuNEErQ0ZvNU5EQjdKK3lwQ0xMZC9hcDIrVjJM?=
 =?utf-8?B?dFM3KzN4OHBQazNRL1RydlhNdFlrSzlDelJqVTZoMjRvczhTcVE0Si9OS3FM?=
 =?utf-8?B?dFI5WDQzMnRiazcwWTVPTDBwejN0UXphWWYyeGlZcnVnN1cySzJpSXhNMjVr?=
 =?utf-8?B?dVlFQmpvcnhlYklLZi94WEVSZ1Z0RnR1UFdEa3pSZG5FeXUvVWQzWkpyUjNY?=
 =?utf-8?B?UDlPQWJrRnhieS9HTDJsVUtHM0o2OExEaGtTTzlrYzRMSyt3NGJ1R0JUOGVC?=
 =?utf-8?B?bjBtV0RFV281S0hZbmJ5VitqWGJWYVF1bTk0NE9XenRWakRqcmM3anE1b2I5?=
 =?utf-8?B?Nk5laEZDMTlRWXRSVlI1cmFiZ3NvQUR5VGVsakpON0VpVFJzZWh6eVFiNVcx?=
 =?utf-8?B?UTIyemFDNlBYa010amZsc2FQZWwzSFA1NXdsenRQdzd3Ty9iZXhCSkdIbU96?=
 =?utf-8?B?OTdKOTl6YUYrZ0NzU3VFd21WRU1nOWlqYXBub1pESTBTV1FqNzh4ei9LMkh0?=
 =?utf-8?B?b2ZmdGk3ZWhJamJkTHFCR2NkMW5BRW5qaWxKY0hDWFk4eDdGMVpyTDhadlYx?=
 =?utf-8?B?eEoyZGJGYXhYNmE0WDJTOVV0enU5MFVRTTN1ZmdnVW5xc0UwM3pGYnk0N0RL?=
 =?utf-8?B?S2ZPdjFyK25QbVh0ZEtaek5JM0tVNjFZTTUzbmxMSFdoWlNZNVJCc1lZd1Fr?=
 =?utf-8?B?dXpNZXR6OWtKR01BazdVZnB6eDFvZlhNUVl2MjQya0pQQkRIMU5iY3JHOElw?=
 =?utf-8?B?ZkNuc00yVGNuUmpBOE9SYkJxaUc2MG1mRzVwNTB5RzNaMjhoekRqMko3TjBF?=
 =?utf-8?B?clpSU2FCTHdkRFNVVktDK2Rnem45MWtIWVRtYjRHS0tIb2IxdHlKRitUSmVC?=
 =?utf-8?B?K08xQ25XOTc1OFQ2TlNmU3NTekZ1bzFtVkV6ZHJHcUNrRDZOUnM5VmxRTW9P?=
 =?utf-8?B?Z1liemQyOGg0b0JsZVNDaUQ2SUpFUDAwb2NiM0JHQno0eVBvU3NQRGhYVnNs?=
 =?utf-8?B?eVlDeUpLL01JaDhpZW04aWNZS0F3MVRzQlBXRU9mV1RGMEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlFkRmpjc3NkeWJIdlFPNWx4dzk0Y2dxVnRzbVJ1bExkajAvaERPckc4YlIw?=
 =?utf-8?B?c2o1UWVtdTJhYnFuWkh6b0hLS2VUWjhTYmJYcXF1cGNYN29tSGp5ckxWSXBk?=
 =?utf-8?B?ZWY2RWVBNm94ajZhNkhOcDJvZmpBcGpsY3d5TW9XU2tNZldVamd4YzZSUmdt?=
 =?utf-8?B?OFlHM0RWR2VqRkJVNVRlbkVIZmJMSXF6UHJEWVNpK1F3YzNHQWlGMGFUdUhO?=
 =?utf-8?B?MDRYaHhJWGRoZHlCNFM3OUkyR1hUVFROZ1ZSVWRMQ2xuZGhUdUZvdFhHQ0J6?=
 =?utf-8?B?OU9OUVd1ZU5WMWNPOTRDb0hQc3NaU2tHQVp6VDVhTEVXRWd3ZW5EMVl3UmxW?=
 =?utf-8?B?YklMUy91MEwrL0tubFBsNHAyaXBKZXFkSDRlUk80SVFZSC9GeWFNR3RGY3Y3?=
 =?utf-8?B?UTVhYm9yZ2VidEl1WEdhVXNUYThvUjU5WndxTDZtTXI0SkYrdlRycGo3Slhp?=
 =?utf-8?B?bUxhUll6WlYwMm5uYWRRWnJlelJoTWU1Z1ZUamR3R1k3dFJzdHVhN3FGeVRY?=
 =?utf-8?B?Qi9zMjlHUE1rYWZGYXh5elBuM0gxVEIwaVFNbDhyRy85RENFYkNqNGdBTWdl?=
 =?utf-8?B?eTg5V055dk1uNmdRU2V5M2YwOVZxaEZ6ZW1vVFpuREZXK1lNUGdjMmNIUW5D?=
 =?utf-8?B?TW5rMGdWRkRPQkpYVnpNVUg3Y0pwb25SV2liRlZqYjVhMkw1L3ZZTmNDdUNm?=
 =?utf-8?B?SGNXRk1zekFwYUVZOGRUVCsrNnIrd3Fvd1d4Wjd1ZVdlS3k3SDlkWm9aUFFC?=
 =?utf-8?B?RkVBTUpMMElySURyMlVlUURVaTA5M3FZR1BONTAxTndVblp6Y2VHRDNORWV1?=
 =?utf-8?B?aUhTVEdleDNoR2VVR0padjdoTytsQWdES3ludmdncDl3TGxSS1Rja1diTWdz?=
 =?utf-8?B?cStzYSt3VzFZMCtxcFFDenRVVFV6a0E0QlU4NmVTUUxKSEJQdUNzUmsrNFpL?=
 =?utf-8?B?QS9GWmdnNjJGMGhSTU5yZTNGdUxuekVrY1h2ai9abHluMG1sOGNuMStwY0Iy?=
 =?utf-8?B?bDQwUTh1Z2lYVWxnYmVvTGhoUFpOK25wZ0pCNjJyb0l2bS9EbHc5RmtZS20w?=
 =?utf-8?B?SlhaL3l2Y0ljd1Z4WTJNSmxqanM3YWU4eERoN29GMHpzRVNQUlRqRVV6bENN?=
 =?utf-8?B?dzkzU1MzTlpQZ1Awbnd4R3ZOMHRHcTVQMHlXR1NqVG1NWnhtSTgzZXRYSmNC?=
 =?utf-8?B?ZUJXSDBsQ0lySERWSDBacEM1RFNKUjdFVWV4cGxOWWxacHpld1gwLzQ2eWxQ?=
 =?utf-8?B?UWVCc3VTVEs5NlQwN2hmblRVbURzMmc3VVBLY3o2WjFBdXFYK1Ria3FnSG5w?=
 =?utf-8?B?RmJRWFlwVlBRVmwxTVpmVjBGZS9rN0s3Y2NYb2lVa3RselZYSzRVZU5nYVkv?=
 =?utf-8?B?STZPZmxkK2U3dHd1a28wTGIzMG9GR0VXaEVSRTlhL2lYcTRTamFBb3FpdjVt?=
 =?utf-8?B?NGIxS0lDRDd3K2JQc3ZWNjZQOEQrVUkwK285L1hFQkU5cExRVEIydHE0RDdK?=
 =?utf-8?B?M0dNNVBhRHRoOU9sMERBUkVKTjBPdTF1OXVKUTNFQ05PV0w4aDljMHh6dFk4?=
 =?utf-8?B?WlMrNjVLQnNJRSs4bGU5cUprQXNkOXgvU1dsT1k3blJJQzVEdEJrelBwU2lt?=
 =?utf-8?B?cUZCTGZ3VW1FdW1BbW8wL0RBM0ZsaFhnVllycVZpY1BLUmpEdGwvZ0VBdjV2?=
 =?utf-8?B?WGlZdGdRY0RVa1ROMG5MUWFXaU1HbTFzalRjdEtPdHdQRlhySTREZG83SkZJ?=
 =?utf-8?B?ZW4vOVpicXhhak83OUNqanJwYUdDRXNpd0t0dHJ5OGZVaWVMd1V5WkV0cHdq?=
 =?utf-8?B?MUsxRTZ1R092anF5VGxTZHhsc09LWkwvYm5UdmZ3aU51bWJUb0MvUFE0VWsx?=
 =?utf-8?B?TjdkUzhlR1pFUHJxVkRYbUdlejl6Wmo4VnNpYmVuYVRmK1Y1Q0FmTitrdTQ3?=
 =?utf-8?B?ZHh2VzdyNUhrVkgxLzNqdUJ5aVUyNFhjWXo1RDQvSkU4NENKMVhpMWdyQW1H?=
 =?utf-8?B?MlhFdmtTVkJ1SWIzM0JhR05udUhpMzFGaFNyMnI4UlBiY2lzVlQ2aHhudXZF?=
 =?utf-8?B?OWhYMm5JSmNFYzRkTFRlMzFNWUtBWm8vaDRkVmkyME51dFpWZEgwTG4wa2pj?=
 =?utf-8?B?NWV1bituSFVZWDArWDNGUUlTc2VCRUNlWTVqY252UGRJU2x4SmdsQ3g0UDNV?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a040529-e8d4-4a23-8894-08de068f97ff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 17:24:54.2540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3lrkQ68R7fcECD06FkKef04lyJ608jxtq25/z6ATHrGKZ3Ws4F9WYDvKsUamuUETPCtXo8yeVsk8fmKAojXTNna56xYXtLuC5znBJJWgvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4953
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

--------------6ZMHrDOBBZAAwZM1FMgVmgrF
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/7/2025 7:25 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe: Enable media sampler power gating
> *URL:* 	https://patchwork.freedesktop.org/series/155564/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44_FULL ->
>   xe-pw-155564v1_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-155564v1_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-155564v1_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-155564v1_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_pm_residency@cpg-gt-toggle:
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-434/igt@xe_pm_residency@cpg-gt-toggle.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-433/igt@xe_pm_residency@cpg-gt-toggle.html>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-4/igt@xe_pm_residency@cpg-gt-toggle.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-9/igt@xe_pm_residency@cpg-gt-toggle.html>
>
The sampler powergate status gets cleared, so no point in displaying it 
here. Will send v2 with this fix.

Thanks,

Vinay.

>  *
>
>
>     New tests
>
> New tests have been introduced between 
> xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44_FULL and 
> xe-pw-155564v1_FULL:
>
>
>       New IGT tests (36)
>
>  *
>
>     igt@core_hotunplug@unbind-rebind:
>
>       o Statuses : 3 pass(s)
>       o Exec time: [3.71, 10.52] s
>  *
>
>     igt@intel_hwmon@hwmon-read:
>
>       o Statuses : 2 pass(s) 2 skip(s)
>       o Exec time: [0.0, 0.00] s
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o Statuses : 2 pass(s) 2 skip(s)
>       o Exec time: [0.0, 0.03] s
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o Statuses : 3 pass(s)
>       o Exec time: [8.80, 19.55] s
>  *
>
>     igt@kms_async_flips@crc:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [9.21] s
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o Statuses : 4 pass(s)
>       o Exec time: [0.96, 3.87] s
>  *
>
>     igt@kms_async_flips@test-cursor:
>
>       o Statuses : 3 pass(s) 1 skip(s)
>       o Exec time: [0.0, 3.07] s
>  *
>
>     igt@kms_async_flips@test-time-stamp:
>
>       o Statuses : 4 pass(s)
>       o Exec time: [1.08, 3.79] s
>  *
>
>     igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.49] s
>  *
>
>     igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.40] s
>  *
>
>     igt@kms_flip@basic-flip-vs-dpms@a-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.79] s
>  *
>
>     igt@kms_flip@basic-flip-vs-dpms@b-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.74] s
>  *
>
>     igt@kms_flip@basic-flip-vs-dpms@c-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.72] s
>  *
>
>     igt@kms_flip@basic-flip-vs-dpms@d-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.73] s
>  *
>
>     igt@kms_flip@basic-flip-vs-modeset@a-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.80] s
>  *
>
>     igt@kms_flip@basic-flip-vs-modeset@b-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.72] s
>  *
>
>     igt@kms_flip@basic-flip-vs-modeset@c-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.70] s
>  *
>
>     igt@kms_flip@basic-flip-vs-modeset@d-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.70] s
>  *
>
>     igt@kms_flip@bo-too-big@a-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.24] s
>  *
>
>     igt@kms_flip@bo-too-big@b-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.24] s
>  *
>
>     igt@kms_flip@bo-too-big@c-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.23] s
>  *
>
>     igt@kms_flip@bo-too-big@d-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.23] s
>  *
>
>     igt@kms_flip@flip-vs-rmfb-interruptible@a-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [4.01] s
>  *
>
>     igt@kms_flip@flip-vs-rmfb-interruptible@b-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.96] s
>  *
>
>     igt@kms_flip@flip-vs-rmfb-interruptible@c-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.96] s
>  *
>
>     igt@kms_flip@flip-vs-rmfb-interruptible@d-dp4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.96] s
>  *
>
>     igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.42] s
>  *
>
>     igt@kms_plane_alpha_blend@alpha-7efc@pipe-d-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.51] s
>  *
>
>     igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.65] s
>  *
>
>     igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.70] s
>  *
>
>     igt@kms_plane_cursor@primary@pipe-b-hdmi-a-3-size-128:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.93] s
>  *
>
>     igt@kms_plane_cursor@primary@pipe-b-hdmi-a-3-size-256:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.95] s
>  *
>
>     igt@kms_plane_cursor@primary@pipe-b-hdmi-a-3-size-64:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.97] s
>  *
>
>     igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-3-size-128:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.95] s
>  *
>
>     igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-3-size-256:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.00] s
>  *
>
>     igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-3-size-64:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.01] s
>
>
>     Known issues
>
> Here are the changes found in xe-pw-155564v1_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html>
>         (Intel XE#3908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-0:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-9/igt@kms_big_fb@linear-32bpp-rotate-0.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) +3
>         other tests dmesg-warn
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html>
>         (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +7
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>         +139 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +23
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_audio@dp-audio:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_chamelium_audio@dp-audio.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +3
>         other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html>
>         (Intel XE#4494
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494> /
>         i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dp_link_training@non-uhbr-sst:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>  *
>
>     igt@kms_dp_link_training@uhbr-sst:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_dp_link_training@uhbr-sst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_fbcon_fbt@psr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_flip@2x-flip-vs-panning:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-panning.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +2
>         other tests skip
>  *
>
>     igt@kms_flip@flip-vs-rmfb:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-2/igt@kms_flip@flip-vs-rmfb.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-1/igt@kms_flip@flip-vs-rmfb.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543> /
>         Intel XE#5208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208>)
>  *
>
>     igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +9
>         other tests dmesg-warn
>  *
>
>     igt@kms_flip@flip-vs-suspend@c-dp4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) +1
>         other test incomplete
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +2
>         other tests dmesg-fail
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +6
>         other tests skip
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html>
>         (Intel XE#3012
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (Intel XE#2925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>  *
>
>     igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +2
>         other tests fail
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (Intel XE#2571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_plane_scaling@intel-max-src-size.html>
>         (Intel XE#3307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307>)
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr@fbc-psr2-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_psr@fbc-psr2-basic.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>  *
>
>     igt@kms_psr@fbc-psr2-basic@edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_psr@fbc-psr2-basic@edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4609
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609>)
>  *
>
>     igt@kms_psr@psr2-basic:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_psr@psr2-basic.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>  *
>
>     igt@kms_vrr@flip-dpms:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_vrr@flip-dpms.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@xe_eudebug@basic-vm-bind-extended-discovery:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-extended-discovery.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +2
>         other tests skip
>  *
>
>     igt@xe_eudebug_sriov@deny-sriov:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_eudebug_sriov@deny-sriov.html>
>         (Intel XE#4518
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518>)
>  *
>
>     igt@xe_evict@evict-large-external:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_evict@evict-large-external.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-userptr-rebind:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-rebind.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +5
>         other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html>
>         (Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_exec_sip_eudebug@breakpoint-writesip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_exec_sip_eudebug@breakpoint-writesip.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@twice-large-mmap-file-nomemset:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_exec_system_allocator@twice-large-mmap-file-nomemset.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +54 other tests skip
>  *
>
>     igt@xe_oa@non-privileged-access-vaddr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html>
>         (Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +2
>         other tests skip
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1420
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420> /
>         Intel XE#2838
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-query:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_query@multigpu-query-invalid-query.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-pxp-status:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_query@multigpu-query-pxp-status.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-9/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html>
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         (Intel XE#4633
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-on-nop:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html>
>  *
>
>     igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-436/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html>
>         (Intel XE#5408
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-4/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-4/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-9/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html>
>         +6 other tests pass
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-466/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html>
>  *
>
>     igt@kms_pipe_crc_basic@hang-read-crc:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-1/igt@kms_pipe_crc_basic@hang-read-crc.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-2/igt@kms_pipe_crc_basic@hang-read-crc.html>
>         +4 other tests pass
>  *
>
>     igt@kms_plane_cursor@viewport:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-433/igt@kms_plane_cursor@viewport.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-433/igt@kms_plane_cursor@viewport.html>
>         +1 other test pass
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html>
>         +5 other tests pass
>  *
>
>     igt@xe_live_ktest@xe_bo:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-436/igt@xe_live_ktest@xe_bo.html>
>         (Intel XE#4842
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_live_ktest@xe_bo.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html>
>         (Intel XE#4921
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543> /
>         Intel XE#4921
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921>) +1
>         other test dmesg-fail
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html>
>         (Intel XE#4760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#4760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +3
>         other tests skip
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#4917
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917> /
>         Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44 ->
>     xe-pw-155564v1
>
> IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44: 
> ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44
> xe-pw-155564v1: 155564v1
>
--------------6ZMHrDOBBZAAwZM1FMgVmgrF
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/7/2025 7:25 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:175989032876.15825.12024952879309754730@6aec98b87f92">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe: Enable media sampler power gating</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/155564/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/155564/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44_FULL -&gt;
        xe-pw-155564v1_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-155564v1_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-155564v1_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-155564v1_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_pm_residency@cpg-gt-toggle:
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-434/igt@xe_pm_residency@cpg-gt-toggle.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-433/igt@xe_pm_residency@cpg-gt-toggle.html" moz-do-not-send="true">FAIL</a></li>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-4/igt@xe_pm_residency@cpg-gt-toggle.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-9/igt@xe_pm_residency@cpg-gt-toggle.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>The sampler powergate status gets cleared, so no point in
      displaying it here. Will send v2 with this fix.</p>
    <p>Thanks,</p>
    <p>Vinay.</p>
    <blockquote type="cite" cite="mid:175989032876.15825.12024952879309754730@6aec98b87f92">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between
        xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44_FULL and
        xe-pw-155564v1_FULL:</p>
      <h3>New IGT tests (36)</h3>
      <ul>
        <li>
          <p>igt@core_hotunplug@unbind-rebind:</p>
          <ul>
            <li>Statuses : 3 pass(s)</li>
            <li>Exec time: [3.71, 10.52] s</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-read:</p>
          <ul>
            <li>Statuses : 2 pass(s) 2 skip(s)</li>
            <li>Exec time: [0.0, 0.00] s</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>Statuses : 2 pass(s) 2 skip(s)</li>
            <li>Exec time: [0.0, 0.03] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>Statuses : 3 pass(s)</li>
            <li>Exec time: [8.80, 19.55] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [9.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip:</p>
          <ul>
            <li>Statuses : 4 pass(s)</li>
            <li>Exec time: [0.96, 3.87] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-cursor:</p>
          <ul>
            <li>Statuses : 3 pass(s) 1 skip(s)</li>
            <li>Exec time: [0.0, 3.07] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-time-stamp:</p>
          <ul>
            <li>Statuses : 4 pass(s)</li>
            <li>Exec time: [1.08, 3.79] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.49] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.40] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-dpms@a-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.79] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-dpms@b-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.74] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-dpms@c-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.72] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-dpms@d-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.73] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-modeset@a-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.80] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-modeset@b-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.72] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-modeset@c-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.70] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-modeset@d-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.70] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@bo-too-big@a-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.24] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@bo-too-big@b-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.24] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@bo-too-big@c-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.23] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@bo-too-big@d-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.23] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb-interruptible@a-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [4.01] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb-interruptible@b-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.96] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb-interruptible@c-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.96] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb-interruptible@d-dp4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.96] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.42] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.51] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.65] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.70] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary@pipe-b-hdmi-a-3-size-128:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.93] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary@pipe-b-hdmi-a-3-size-256:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.95] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary@pipe-b-hdmi-a-3-size-64:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.97] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-3-size-128:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.95] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-3-size-256:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.00] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-3-size-64:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.01] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-155564v1_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908" moz-do-not-send="true">Intel XE#3908</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send="true">Intel XE#1407</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-9/igt@kms_big_fb@linear-32bpp-rotate-0.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953" moz-do-not-send="true">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173" moz-do-not-send="true">Intel XE#4173</a>) +3 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669" moz-do-not-send="true">Intel XE#2669</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +139 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +23 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-not-send="true">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@dp-audio:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_chamelium_audio@dp-audio.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send="true">Intel XE#2321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send="true">Intel XE#2291</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494" moz-do-not-send="true">Intel XE#4494</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804" moz-do-not-send="true">i915#3804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@non-uhbr-sst:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354" moz-do-not-send="true">Intel XE#4354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-sst:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_dp_link_training@uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354" moz-do-not-send="true">Intel XE#4354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_fbcon_fbt@psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776" moz-do-not-send="true">Intel XE#776</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701" moz-do-not-send="true">Intel XE#701</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-panning.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send="true">Intel XE#2316</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-2/igt@kms_flip@flip-vs-rmfb.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-1/igt@kms_flip@flip-vs-rmfb.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send="true">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208" moz-do-not-send="true">Intel XE#5208</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send="true">Intel XE#4543</a>) +9 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send="true">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597" moz-do-not-send="true">Intel XE#2597</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send="true">Intel XE#4543</a>) +2 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@prune-stale-modes:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_force_connector_basic@prune-stale-modes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352" moz-do-not-send="true">Intel XE#352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658" moz-do-not-send="true">Intel XE#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012" moz-do-not-send="true">Intel XE#3012</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925" moz-do-not-send="true">Intel XE#2925</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-send="true">Intel XE#616</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571" moz-do-not-send="true">Intel XE#2571</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307" moz-do-not-send="true">Intel XE#3307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_pm_backlight@fade.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_psr@fbc-psr2-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_psr@fbc-psr2-basic@edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609" moz-do-not-send="true">Intel XE#4609</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-basic:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_psr@psr2-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send="true">Intel XE#1127</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-dpms:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_vrr@flip-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-extended-discovery.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_sriov@deny-sriov:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_eudebug_sriov@deny-sriov.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518" moz-do-not-send="true">Intel XE#4518</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-external:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_evict@evict-large-external.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-userptr-rebind:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360" moz-do-not-send="true">Intel XE#2360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_exec_sip_eudebug@breakpoint-writesip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send="true">Intel XE#4943</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@twice-large-mmap-file-nomemset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_exec_system_allocator@twice-large-mmap-file-nomemset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915" moz-do-not-send="true">Intel XE#4915</a>) +54 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@non-privileged-access-vaddr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573" moz-do-not-send="true">Intel XE#3573</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_pat@pat-index-xehpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420" moz-do-not-send="true">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838" moz-do-not-send="true">Intel XE#2838</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-query:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_query@multigpu-query-invalid-query.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-pxp-status:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@xe_query@multigpu-query-pxp-status.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-9/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send="true">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send="true">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894" moz-do-not-send="true">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send="true">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633" moz-do-not-send="true">Intel XE#4633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send="true">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-436/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send="true">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408" moz-do-not-send="true">Intel XE#5408</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-4/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-4/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send="true">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-9/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html" moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-466/igt@kms_hdr@invalid-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-1/igt@kms_pipe_crc_basic@hang-read-crc.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953" moz-do-not-send="true">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173" moz-do-not-send="true">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-2/igt@kms_pipe_crc_basic@hang-read-crc.html" moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@viewport:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-433/igt@kms_plane_cursor@viewport.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-send="true">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-433/igt@kms_plane_cursor@viewport.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html" moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-436/igt@xe_live_ktest@xe_bo.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842" moz-do-not-send="true">Intel XE#4842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-434/igt@xe_live_ktest@xe_bo.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921" moz-do-not-send="true">Intel XE#4921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send="true">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921" moz-do-not-send="true">Intel XE#4921</a>) +1 other test
              dmesg-fail</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760" moz-do-not-send="true">Intel XE#4760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760" moz-do-not-send="true">Intel XE#4760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do-not-send="true">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374" moz-do-not-send="true">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-do-not-send="true">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-do-not-send="true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509" moz-do-not-send="true">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send="true">Intel XE#2426</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917" moz-do-not-send="true">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466" moz-do-not-send="true">Intel XE#5466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v1/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466" moz-do-not-send="true">Intel XE#5466</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44
          -&gt; xe-pw-155564v1</li>
      </ul>
      <p>IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-3884-ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44:
        ceff45305e07bda5e3b4d6e9f7b750eb2c20cf44<br>
        xe-pw-155564v1: 155564v1</p>
    </blockquote>
  </body>
</html>

--------------6ZMHrDOBBZAAwZM1FMgVmgrF--
