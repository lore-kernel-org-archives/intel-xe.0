Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A33D1CA13
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 01:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B6F10E122;
	Tue,  5 Nov 2024 01:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MrgVJV/v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E4F10E122
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 01:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730769245; x=1762305245;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Gw7IWfbD64ic7NVmOBm8G4nfQ1e5Qtb9WH2bKFib1Pc=;
 b=MrgVJV/v8hxr0mMbAPHEg1HoYGylXkJK8yTzKZpRMpd4onUYdlyfHD0B
 DAU0tMlrZHsXy8Vpt8lzBLLhlWqwgdFxolVhytDSQtV3kMa/+uRShxvid
 TxxTx/GjhIA4M4CKulX2w7YEpUQzvv8deYwLHZOsvu4wJ5bCOBMuUj2zF
 9QLsOYmcwv+Hs2X1OFKTDffsd43X9NMbqPgittcyPjNCXpaSn72zM2jwZ
 fkIdAsVDqBKWO7U0SeoEGBxFJ5Qk1/FSwOfmzOSK1Vuh8D/GEqnDK9ig5
 92u6bZHdvjBVGmdMFjZMEQ+moQOiQk2YCBObhRnAJ3ubXPuK6fPyGynwI w==;
X-CSE-ConnectionGUID: 72+4RNEmTGGMMbtGFafPSQ==
X-CSE-MsgGUID: Mh1ZSfxtROquK7CgAyt1UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29919565"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="29919565"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 17:14:04 -0800
X-CSE-ConnectionGUID: 2ShgiuNWR/Kg2XlUTgxHBw==
X-CSE-MsgGUID: CMWBO9qoSNmSLEXO/Siing==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="84164179"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 17:14:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 17:14:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 17:14:02 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 17:14:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ss0bh6TIo9nO4vma9UGXtvTXsgUqz1glPwIvQgMF9dZ8B87FtAVUflLry+U5e+/5OHlChN0ycexMSas2jHKRj5jYL5rd8V7s8HLYFoi/7AqJ9lmgUcm/B1ahJDb4eZtlo6AvdW12Y2WxmgXJO5QPxMRzsfNH4sN2Ckxgsy9ghUXZO2ExAHubD/lYizS1WuOSdAB+Z2XCC8cEcFNs+6PMJF8+cKEU3uguX39UEIQuK4lAPVyHJST9CLcI9WMAun9akiKdDWeLdxZjQLmcsITOTW8IcPAz3coSYGhYpjZldCbtQ+e83TfBCjpKzfC29zhKTT2ChtgVzJKYjwdmIi7PEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgQUl8QPrZ8rxSIWzIKeckKlmV330obK2ZlBcJOwwik=;
 b=XDBarx3qlszIWHYEtt3dqTCfjlx5BHo7drkRwx1835MI5ezjzQS5kJOr8ePj5l1zxfAXlHth3WRrAH5SvtXY4wS4d71tVeDqxN7jND+o5jV/PoP/hkRruQgK0GeoghDO4vIAioX1cjzag5VbJuMlRSXvhnxw+s4LlQTD3f2zWgkC0HyNKNWHVVc8Fc64K6VPuHJg5tAkdTH5G36fdIUbXmWqto7C/SyMjO5nn6ij5Yz+aeEqPMm1gdIgvNTb/UlY1hpp9LzsHmHqigp/hloxdymsNRBNSnwPzF8Ixlhsb3RRpCE+i/8VjPV1dJd7EeB/Djon7AxneLfhMoUFi+IkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7414.namprd11.prod.outlook.com (2603:10b6:806:31c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 01:13:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 01:13:55 +0000
Date: Mon, 4 Nov 2024 17:14:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe/pf: Expose access to the VF GGTT PTEs over
 debugfs
Message-ID: <ZylxciEFAXP749BX@lstrano-desk.jf.intel.com>
References: <20241103201633.1859-1-michal.wajdeczko@intel.com>
 <20241103201633.1859-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241103201633.1859-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0136.namprd04.prod.outlook.com
 (2603:10b6:303:84::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f58075-1547-4e6d-c071-08dcfd371e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWJqbDFTQnE1RU5rN3YwZTV5K2lPbmkzR09FR2JiUmRqRDB0WXF4S1RXeVBk?=
 =?utf-8?B?MUdLMy9qTk5CUG1rNmRWdU5uNWl1NzlEN1FubGViZHM5dTYwOVZvUTU5YmIr?=
 =?utf-8?B?WVhubFFzZmNoK1BnYnlhYTFhenlVQ09wRGZOT0QzZnprR1ViVTUzOVlDSGlz?=
 =?utf-8?B?b3NRMHNlSG81WEdHWWlueENMTWRWRzJ1ckc2RngxOTc1RitGWUdzYW5TTklK?=
 =?utf-8?B?ekxiTEZSWHRMZURGeTc0UHpVWG8yMTVYSU8ybzMvVHIwanZQbEQ1UEFGOUhq?=
 =?utf-8?B?cnUvVWFwLzBQTWJCWklkRzBoeS9NdlpaSE50Y1NzaDgyWE1KVGlQTXVKZEM3?=
 =?utf-8?B?TFkyM0xpdnd1R1VieVlFaVRKRlJhTkxnYkJBNXJiSDhESTU1MSt6TG1MblRF?=
 =?utf-8?B?aSt0Qno1aFdXd0d6eTF5MlRzM253WnloZXBSWmF2Ym5sc3dVMm9URGJKL2Y2?=
 =?utf-8?B?TXR6ODZlRVR2TXpTYVduQ0hsaWZMNTJBb0ZPVjJxNmZPMEN4SHhxOGFGQ0xX?=
 =?utf-8?B?Y0xDcjVnTXdYZllKaEFVVTMza3FKUmczbFNHVWFBOHI5bTl0RWtBWU5iVWpx?=
 =?utf-8?B?VE1COEV6THlDd3lGcGdEZThQNVlBTlVFNDZCRm9Wa0JRZkM5SmVld2FTQnFx?=
 =?utf-8?B?UFh2eVRYSzMwcmdTUnJVMUtGV1U0QVZkL2Y2bkt0ZjhoaHk1R1c4ZU5Ca1N3?=
 =?utf-8?B?TUJ2SktRM3U0cHpUOC83Y0hxbnJhQ09NUzQ5UWI0d0ZBbDB5MlhHYXRneVNV?=
 =?utf-8?B?Nm13RHQ2RHg2aTBPbDRCUFNXSHk3REt4Zys1VlhYSXBPU0xYZVRVSVRtS3BL?=
 =?utf-8?B?ZkNVTVFoTXlCRWZ1UFM2dmUvY3M0RTJBY09uM3cvYW9FYVhvQm00K0M1NEdz?=
 =?utf-8?B?WWxBcXN1cjQ1R1BFQ3J2N3VrSmZsS1BIMCtubmlON0tiMU03bWdKeUxtak9M?=
 =?utf-8?B?SHA1QVprMi9najlqeEpXb0xyMVhMRXVYVk9aRmxMWTEzMWdNWmlKOWpDL0Uv?=
 =?utf-8?B?K3NNYW1Wek5pOUo3cENPODlMdVdyTmVtSzB3U1lJQVhLcWsxcEI3MkxVaTEr?=
 =?utf-8?B?TU1Tb2hsQ2RaekZVUXd1a3NRY2pTVDh5czFOVHltQm5vRVJTR2ViVmgydkVG?=
 =?utf-8?B?VmxvYTBPRkxSdUMvWWd2RUtYMnBFWUQ3bk5YdlZ0T1Y4d1hyM2hpTWc5WWlM?=
 =?utf-8?B?TlJkV2Z3TVZhZ0hvMDZTRzREKzNoenpZZzV6azdSU2d0M3hpb3FYWUlQejhD?=
 =?utf-8?B?WlJXSGtVNjRSa1hKWmVkRXBwNG5OMTR5eHNCVXQ3cHBPRmpxZ24rbTFHVUlN?=
 =?utf-8?B?OVROdE9DM2NHcXAzTzhjQkFkMEMrcnRnSThGMXcwcWpEVE55Rm5CMnNPYVdH?=
 =?utf-8?B?QlAxdmN6L0tNOE1mT2NVbWZ3Tkx6aWNRMEoraWdodEJiVmprT0dyR25UTkRC?=
 =?utf-8?B?NEdJU1pwdmVvc3M2bGpueklWNzZZZ1Y1VmxPWWRKN0F5SVdkNkxnenA3aVNF?=
 =?utf-8?B?R05yWUdJSitBS3lxNUdyMHBjeWtNT3NncE0zbXdhd29HdTJKSmpGOUw5NTBn?=
 =?utf-8?B?SXVaNlhKQ1NpWVdJREYwYlJzOUlraTVCSTcwVGQ5MnI4QUxqYi91eHNNaFBU?=
 =?utf-8?B?cFRUVmNEY3VWdXNvQU5PU0RPeGNmbElhK1ZaK1FFeVQ0clB1aVZyUklVU1hE?=
 =?utf-8?B?NWJCZVNBWElmVWp5cDNNU1F3V0p4RW9KZElGQWlHb0FyUDBIWFhFbmxnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VSs3QVpvNmJOUHcwUmpBK3JieURQbnJ0T2Vrdk12L285QWlqeFduRXE1OGVu?=
 =?utf-8?B?Qk5aOHR0c28yVWNhS1ZPRmlMaVhIUTQ5ZVRnOGpZWFVzR21sbE9DRmlBWSsy?=
 =?utf-8?B?ZzM5cmJsSXNwM0k0MmlodUVEbklZOWw3dlVDMHZac2tTd3g4ajIxOW9Tcjlh?=
 =?utf-8?B?VG9SbzRObE5zZ2wyYU8yeU8rMFV1SGlBdEY1bkZBdmM0K3JRSVpyRExOcS9V?=
 =?utf-8?B?cFY2YnJoWVZ3dks5TUhlY1JqUTJsYmVQcXNtMDJCWGdjUThpeDRPMi9WQW5J?=
 =?utf-8?B?MUcwY1VKWERDd0p3RVB0SjVva0VLY2FsZ2Jta3lQa0k5c0xDVmVYblR2WWoz?=
 =?utf-8?B?WHZTTjlQbEhockNsbEMwU1R4VjBjdzk4cVJnUldFSWlPeXQ5UU9ULzYybEFB?=
 =?utf-8?B?cXBwbjJPQkwrdFA3ckF1ZkZzclpTK2JEWjY1YlM2WWV2SVdTRzRrandIOHJr?=
 =?utf-8?B?VHdzTGNLaEFrZGh5eUVWNWV2VnZCcit3aGFPQVlFcnFCbkd1U2hqc3o0eTVW?=
 =?utf-8?B?QnRKZkhldU5HcW91RkF0ZFlnbFZRT0lmUkhIMC8zSXhOQTJMRDRvdk95Mk5p?=
 =?utf-8?B?TXJyZXErOGFvMnA0SkZlNnk5aHhXbGgzenZSbitVR21rWXJaZmtKK2ZWcEdH?=
 =?utf-8?B?bnQyUmxLRVNEdmVmRTd4djVRSHp0UHNRdG92anZPakp3cU4xd0pGNVpBanNm?=
 =?utf-8?B?MEZaNWFTZy8wbjJGVU1QbXpQNEFmMVF3ZWkxdUZsV1p3Vnh3TjljYVNqK0ZW?=
 =?utf-8?B?NUN3RzYrZ2hMcXZGdHJ4d2FJOHVuVytScUVRUFE2OFEzaEJ2Yi9hbkUveGVh?=
 =?utf-8?B?dG1vdkx6V1diYTk3bDR1VGtacjhtMUMyVGZObmtwRWNFWG1TOWVZYWhLbk1h?=
 =?utf-8?B?K3d2cjhVbnJPM1BqdER2K1RmemRudmtaQWIyN3ZEZDgyZEVTUUk4Wjd5cVJT?=
 =?utf-8?B?TytFQWJEemlBNUhxR3Zyby8zM3MxMElsU1Bva0U1Z3A5YVo5cjNORjZOK1Bt?=
 =?utf-8?B?R0MwaGZjQUVuOXhPeDZiZURqWlVhNytGSEh6cXE3VmlhM0d4Kzk4djNZYlgw?=
 =?utf-8?B?d3JVNjZaNFppMDJtaEMwaWgxSkZRZTJzTmRwa1hGUlV3NFdKZng1MXFUOEcw?=
 =?utf-8?B?Z2tJNEthK05qbXBBaDZRZTQvelN2NzUvQXJGZ2sxSFVpK0EvaDF5eXF4Mm1x?=
 =?utf-8?B?SnJoMEcvcVN2MUZqRHFiOUtMbDVuN1MxTGVrRS9VSldCYSt1enVVK3RjUmpl?=
 =?utf-8?B?R1Y3MDNuVlhxMGYzOE1FbEVJeDY1bkM5SlVqVVlMUlhpSzNWQ0xFVW93QURO?=
 =?utf-8?B?VnNMREdWc1FmYWdQcnFSNzlocHNodDNDb0p5aENwTEVTOGx3SzYvN0xreDd3?=
 =?utf-8?B?Z3JBY1FkRldKNmYydUZoQ0ZuUTZReVhQQldkclhlU2ZZYy9nMHpVMmpzd0Rt?=
 =?utf-8?B?dHY0M0tKZjNxaVZuVjJnaGJ6ZVc2SCtiWVY1cVQveXl2TyswZW5xbVFKbGt1?=
 =?utf-8?B?M0ZlemNkS2ZDZXd5U0QyOHdXeC9iVER5dm1KNjlOemU0ODNrT0NiYzBKMExV?=
 =?utf-8?B?ekFmMnppUHljenIvelpVQk10Nm5qUkZGaDhKd0J3NEMwc1g1dlFTSnhCc1Z1?=
 =?utf-8?B?aUVkQzdjc1o2VlhKRG41YmtUWVBSWVliaWFlS0dlQ2V6QnUxbytaTENUb2I2?=
 =?utf-8?B?RGVvYTRjYWt2alpweFpUSUtTZkdCTHNKNzI5NUVnM3plOWVlUlZsUjNHYUov?=
 =?utf-8?B?RjgrbVdDdVlPV3VLZjVQNHVKemtoWTM4S0tpbXBPM3dZa05xdlNyaW9URDNi?=
 =?utf-8?B?cGk4YWlRaCtCZjExYnR6U3ZXUmtyZmpmRyt1Nk1IRllHaFVaWVdkWjZEUWpW?=
 =?utf-8?B?aXYzcUFlYmE4UEtRaDViTWJ0cS8zNFBlUWtJNFNoL0JXRXRRSXN5QUxKQXI5?=
 =?utf-8?B?TXNwZThOS3JWdG83WmdXQkNoN2NXcnA4SUFVRURMamFxUE4rOXFsRVMvRzNG?=
 =?utf-8?B?VFhLWHdaN2NGYmYvZVRPR2k0akNGaFJWL3ViaWJ6QjNRTW5YY0t2Y2tWc3Rq?=
 =?utf-8?B?RVNick1rS043ZUpFN1NFa0pCU3Zid1V5M1dyWXRQazZOODFackROWWlLd3hn?=
 =?utf-8?B?V0J0UDZ6cXI1eXNLdzhqRUtYK2xDWFhKK3BEZ0Z0dDV5RS9jQmZLOGpEeDNI?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f58075-1547-4e6d-c071-08dcfd371e5e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 01:13:55.6258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUAxmE6AkKqvI1tMFelGncxJYEZXqylvhdUElx+BH8rj3OCRJR+V65eSEGsbs6CAFipvfCrujcOBPvn2kal4wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7414
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

On Sun, Nov 03, 2024 at 09:16:33PM +0100, Michal Wajdeczko wrote:
> For feature enabling and testing purposes, allow to capture and
> replace VF's GGTT PTEs data using debugfs blob file.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 62 +++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 05df4ab3514b..69ba830d9e8d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -11,6 +11,7 @@
>  #include "xe_bo.h"
>  #include "xe_debugfs.h"
>  #include "xe_device.h"
> +#include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_gt_debugfs.h"
>  #include "xe_gt_sriov_pf_config.h"
> @@ -497,6 +498,64 @@ static const struct file_operations config_blob_ops = {
>  	.llseek		= default_llseek,
>  };
>  
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── vf1
> + *      │   │   ├── ggtt_raw
> + */
> +
> +static ssize_t ggtt_raw_read(struct file *file, char __user *buf,
> +			     size_t count, loff_t *pos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct dentry *parent = dent->d_parent;
> +	unsigned int vfid = extract_vfid(parent);
> +	struct xe_gt *gt = extract_gt(parent);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	ssize_t ret;
> +
> +	xe_pm_runtime_get(xe);
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));

+ Thomas to confirm I'm making sense here.

So this relates to this patch [1] / Thomas comment [2].

You are adding memory allocations here under the
xe_gt_sriov_pf_master_mutex which renders [1] incomplete.

So you need to one of two things:

1. Never do any memory allocations under xe_gt_sriov_pf_master_mutex. If
you choose this option taint this mutex with reclaim when loading the
PF. It is then safe to xe_gt_sriov_pf_master_mutex in suspend / resume /
reset flows.

2. Remove xe_gt_sriov_pf_master_mutex from suspend / resume / reset
flows.

In addition to above, also never allocate memory in suspend / resume /
reset flows.

Not blocker here but just using this as an example to explain the
current SRIOV locking problems. Hope this helps.

Matt

[1] https://patchwork.freedesktop.org/patch/619024/?series=139801&rev=1
[2] https://lore.kernel.org/intel-xe/3e13401972fd49240f486fd7d47580e576794c78.camel@intel.com/

> +
> +	ret = xe_ggtt_node_read(gt->sriov.pf.vfs[vfid].config.ggtt_region,
> +				buf, count, pos);
> +
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> +static ssize_t ggtt_raw_write(struct file *file, const char __user *buf,
> +			      size_t count, loff_t *pos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct dentry *parent = dent->d_parent;
> +	unsigned int vfid = extract_vfid(parent);
> +	struct xe_gt *gt = extract_gt(parent);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	ssize_t ret;
> +
> +	xe_pm_runtime_get(xe);
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	ret = xe_ggtt_node_write(gt->sriov.pf.vfs[vfid].config.ggtt_region,
> +				 buf, count, pos);
> +
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations ggtt_raw_ops = {
> +	.owner		= THIS_MODULE,
> +	.read		= ggtt_raw_read,
> +	.write		= ggtt_raw_write,
> +	.llseek		= default_llseek,
> +};
> +
>  /**
>   * xe_gt_sriov_pf_debugfs_register - Register SR-IOV PF specific entries in GT debugfs.
>   * @gt: the &xe_gt to register
> @@ -554,6 +613,9 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>  			debugfs_create_file("config_blob",
>  					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
>  					    vfdentry, NULL, &config_blob_ops);
> +			debugfs_create_file("ggtt_raw",
> +					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
> +					    vfdentry, NULL, &ggtt_raw_ops);
>  		}
>  	}
>  }
> -- 
> 2.43.0
> 
