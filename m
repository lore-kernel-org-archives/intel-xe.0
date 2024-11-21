Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17650D78797
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 16:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B1110E1D2;
	Thu, 21 Nov 2024 16:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DF8NuO07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A414110E1D2
 for <Intel-Xe@lists.freedesktop.org>; Thu, 21 Nov 2024 16:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732208187; x=1763744187;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3Cfe+nYiEzWQ6RTPG/QSBWy85wiLFMMaxtG50NtMeqQ=;
 b=DF8NuO07MMDzExOaeSwOEPoLHl8rvmEbCUuwdBuOpK6NBDTSZo2j33bj
 u1XsNQnXm7t5boiJG36OkckJ20HKxRM5XbxRSOg7n3ZB+xnFudrCKM3Lh
 Hrjw1zY2oMm91yOyXB7G6joxrsO1En6ZWrf0l61RHKuUoXS13lfsU6LCQ
 55NdS+A53cJEXO1klUPGMr85PZKxLapMcxfx5SiSsUjcO02FimkhKgrwV
 N3Tm0ZO419UVxCpaSkxbbRYMbXyN6zECuJIvHSi0KqM6TLft3KzQhqVEE
 7l4U3U4ty0Zrzh9O1l4H3EVJgSEHD9NqU5RssCEwc6IWMC4uYVOP2x4q1 Q==;
X-CSE-ConnectionGUID: H3llJsFwQ4+mapETpO/CRQ==
X-CSE-MsgGUID: Bu2Amrz3TdK1eWn+ToqDSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43731748"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="43731748"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 08:56:26 -0800
X-CSE-ConnectionGUID: P+4VsSOmRe6aszMv/VSFmw==
X-CSE-MsgGUID: XdxQJOgcRMuR/b5AB49OpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90434300"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 08:56:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 08:56:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 08:56:24 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 08:56:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yj7bm+lhBdb52AbMv0q/YTSoopF1GzyeN2vyy42/N/UEtItWA4L6+6Erdjvli1GPyaFrLDRa0IyIVKN0fECB4504QF62f63iDg6FZVO03c3f757g6QrjBsFjefoSBuj9VpWir/tFWlhMP0FLiwfQV3aur5f5SJOz8TD63oR/sWBXo9qUfUCXQYnQsQ6n8uKDrHM/j9myZ5cecxcgG1apWr+5IAiZqCbVwpJRWLZ0trw5Qn7fF/vcnzu3wy94VHLbeg4IC4wOfIk/0Y1Wm5YFAr18GM9oHNIDv1/Hvhr2B2uI5cMEJt1uOwyPtIvl6xXOt7c01qsDe4yIAn3Dqr3+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svidPvROj/e1sFJ0bPg0QO3j2mjz1EVrxgJD6OrUzLQ=;
 b=Ni9z3rTqGB0O15ZycchYUID0CA1HFSnoWL3HkaSAs9nWb3b5k0Th5LLONtdPnj7+HTFEzdIkE3q+G9sUEuSovXuV4+1LPAkx3iszX4wBTSdDGegoP/OJohEXPCdEn7fp8fPAdi3Ue+iMTurF8dCgXTlS96rdHnKZeSMMvMc3vra+Xd47vKceD3zZtJnJzWaASEu/d0F6rKHDwTbkLsyQtJA9idv8UHC6aHPMlepyreIQ873SYk8NLubR++sWH3xW6o2Gff8aodWFsKnFBS5Ev8PDhBllVpStC+hbim2ifwpZsn0ksdoBBjRn7lXZNFjz82UBEBzZBCEfh9mNRv4BjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB4966.namprd11.prod.outlook.com (2603:10b6:510:42::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Thu, 21 Nov
 2024 16:56:22 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 16:56:22 +0000
Message-ID: <4bc83b58-8f52-47da-a8da-96d8ad6cfeb5@intel.com>
Date: Thu, 21 Nov 2024 08:56:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add lock around devcoredump capture status
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
 <20241120232257.1025282-3-John.C.Harrison@Intel.com>
 <Zz6pPI/q0hfTfZ3/@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zz6pPI/q0hfTfZ3/@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0242.namprd04.prod.outlook.com
 (2603:10b6:303:88::7) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB4966:EE_
X-MS-Office365-Filtering-Correlation-Id: 8108c582-e4a9-48a5-03f8-08dd0a4d6d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXFaVjlJbTFmWnZsd1Y4d2lJVk9iaFEzb2xrYnpmRGxRY3VWTkxvZUF0d1l6?=
 =?utf-8?B?RkpkTDE0b1dNVklmZm1SK3dmejNKeHlxVFh4VlpiUFlwdkwvODZzRGdna0t2?=
 =?utf-8?B?clgrV0crUzE4aHprbXM1QnpoQkhvSG5WL296WVBweHdMd1ZFYXh2by9UbGVT?=
 =?utf-8?B?V2tnbnlkUlR0VGxhbjQzVi9IMlMwUDF5bXFyR1pJWEJ5M1ovNUQ3NTRvcGR4?=
 =?utf-8?B?N1lKS0F5M3BSREoySE1jNE1NT2VLRnBhM3dMN2kyUHp1Sk9RU3dhMkxPL1hT?=
 =?utf-8?B?MG1SdXdtTzhHd2R6MXVwNTJMSkJ4emxlVTRkczIyZWtGUTdsbGpSd1c1eWNk?=
 =?utf-8?B?M2JQWHUxWXM0ZXh5bFIwS05VZ1FKbDRoZkF1RFVlRWpaM3dZOCt1ckE0QjZV?=
 =?utf-8?B?ei9YbTVMbjc1Y1kzbm53MHBHeDVjb091NkFSNVl3OEd4cndFV0VWejV1ekUr?=
 =?utf-8?B?RFlwVm5Zb3h1L0EvRHV1aEZjaVBaK21iTUR3QWRsWFpPOUJ2SW5wZVN5S2Nq?=
 =?utf-8?B?OUF2TWx6TzZHRU1hNmVFM2FaOTk1aDdzRGVJenJvaERKWW9FbkU4eUFaUGll?=
 =?utf-8?B?K3VpSUQ2SDlROGt2UnBwcFVsVkt3TEgxNmlBaXM2YjBiSFpEMnF5SnNJWVpN?=
 =?utf-8?B?U2hCWk1uWlhoU1pxRTZHL0o3ZTNhN0RkY0ZVVkNvY1Z2R3pTdjFPYkNIT3RJ?=
 =?utf-8?B?eHRJZGt2dWJNd3ZUV2dPMER4MDZQdHJRRHdPV3N2U3B3RElDN3pPUFJ5dmJm?=
 =?utf-8?B?NS9Hbmx6d2p2aW5sTjN2c1hPRVUxSU9VcGlMbmR6MzA4ci9tN29ON0Frc1Bk?=
 =?utf-8?B?bnlqTUNlN0tOTmtsTzBPVWtRWWZPcTNYbHFZUkRlY2J0bTNEMzg0SlRjbFRC?=
 =?utf-8?B?RS91VXFwMUsvMm80bDZJeTNubTBoK2U3RWhQcFQyZlVWY0JVeXFUL2JzUzdv?=
 =?utf-8?B?ZDBXNnVjelBSRkMwd0xCcnUxUWszUHUrMDhuYklBNTBOU2RmRVR1N2tkRW4x?=
 =?utf-8?B?WC9ndnRldGlIeW9NdDhMRkdXcWNLK1RsaWR0Wjl4aWpxZGU2c2xidWgwc0lR?=
 =?utf-8?B?VW16cTVlVXhKYmdQWDYwV01HbFJjN25FaWJla0xmVlpob0UxcWFKbXBiMlov?=
 =?utf-8?B?b2NwNGQvK1NUTG9jUkdtZDV4azJKYk52MzE2R2JZTjdKVjZOWFJxdVhXRnlY?=
 =?utf-8?B?eDIrekZMRjRYTlJ1eEM2SkpoY3VSNi9HenhVN0haclI2VmRseWY1Q3RIckR0?=
 =?utf-8?B?WS8rS213MkdFaHNEWmRVVU42eXpQbmxoL3JLbEF4QiswM3FlN0ZHdkJzRVZK?=
 =?utf-8?B?djBxZDI5TGhqa2RNZTZyOFhVTDVkOW1KRHZRdXdWWHNsQThPTlpHRmkvR1Fr?=
 =?utf-8?B?Y3krcHBpNkVKQU9sM1hIMVBIWnhZdXRUdVJBY0cwNXRpYzBBMURVcy96OUxF?=
 =?utf-8?B?d0lhbGZBT0FuYnFSOENyRHkvbUx3RTFKSk1sOE53RE5EU1FtemhmSTB2bnlU?=
 =?utf-8?B?ejVpRG1heUN3YmlCN1BtRC90WGFTcGxiUEorVytjeTkzNi9xV3MwelJNZ2ZX?=
 =?utf-8?B?ajhvQUJlTFc4TnZWcS82VjdteWFnMjRURUNUNS9qY0QvTXJ0SHp1RmJQaDha?=
 =?utf-8?B?OXNtbGpodEhST09ENHg4WHo0NzdlSEJacm9DUFhIRU85VnQxVXZwSW5wbzc2?=
 =?utf-8?B?VnEwb0hIYnpjV2ljYzlmeEV3MnRyc1YrU0YwUmk5Rk5NcnlzSzRRTjdzR2dJ?=
 =?utf-8?Q?ZN9EvyoqxQEQFwr1QRUA07BFxhWpzGeBKNpRjsZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEQzaEdkSWszN1VSRVQrY213MkZMNUFBVUxIK254d3h5L05XbXY1OW1sNURJ?=
 =?utf-8?B?d1B6NnY4UE5MbkdDN1FsRm5lYytxaGZxVERubGRZVDVLYklXUkVWbDVHZVUr?=
 =?utf-8?B?ZTFXVnplanRsaUZnTFcwNHlQb2hIK0czZ2hqNWFjN0psU09GcUZMbXN1MTZJ?=
 =?utf-8?B?U3JWdzBzam5Rb2E2MWJBRDNJT2szVHE4SFRwSnJmdkc4ZmpUZVlEMzl3MXBs?=
 =?utf-8?B?NkFmZkpFNFhqSzNSN0VjVTk4N0xSTjVOWWV4SzUyRUpLTzRZa254S0dha0tJ?=
 =?utf-8?B?RWlXdXp1M0VlVkZ0TnM3UDVYZ0J3dmtmcEdiTmtrZk1jaDM1c3FIckw1ZE5R?=
 =?utf-8?B?b2lreUJhaGRoaVdkYmVIbkc4NENnaVRva0p3ZkJxTkFDeE5SMFBEdTRtV1pZ?=
 =?utf-8?B?SG1DZkpYNEh2anV1VGVkMC9QNUs2MTQ2VHFYUmRySVBmNzJudytBaThieC9i?=
 =?utf-8?B?a1hkVGMyUXRUN2djNEVERWk0bmVja3ZCaVBkUVJkWGRoNmhhQWFXTTNRTXZt?=
 =?utf-8?B?emZaL0dFYXhjdG1rUTh6T1lZV1c4SEhNT2pDYzZBS1hqVmd0eS8vYnJWaDFZ?=
 =?utf-8?B?L2hua0Q0RUlMMnZQbG9OdEFiTjR5QVNWM3pYemN2dHVvazZNMzExV1h2WUZq?=
 =?utf-8?B?bTFVdGlxYkl4YWxUM3c4TDgwVnRjbTF5WEttTkVQd3Z4Rnl2QTF1c1FtTkZ0?=
 =?utf-8?B?YW5PeWNUSzlSUmVzUlhER2VGVUJPN1FzOEZpRE9wRzBRTlB0M3RtaVp5VjM4?=
 =?utf-8?B?WUtzV0JwdTM0UzBoODg1V285K0R4czRPbm1WNmRTRXFBOGFJL091enp1d2VZ?=
 =?utf-8?B?UlhpMndvME5haGEvMlFIbGxGTkxKTmN3TW5RN0FWSmh4WXYvUGgwZWcrckM2?=
 =?utf-8?B?TGhadldSTXpnS3lhL3ZMdkJCdVFRMGU1dUo3S2kxV1VkUG94QWY4OFFQQ01C?=
 =?utf-8?B?OWszb2dibnptUE13SGhoMXB3NUQ1YWtHVWlXUHdLVVExYkJlZFRLR1p1WGZT?=
 =?utf-8?B?aXVFaXRhNjdKeW9CV1Z2Y2xIeVdyemo5bXYwZFBIR1JHQ0hZNExjZm1DZ0ps?=
 =?utf-8?B?VzFmVkhDMFhycGZwL3liS0VPN0lubmhxcUgxbXVGTlNmaUFGSWdBaXRMWlZ6?=
 =?utf-8?B?MkQ2NUpIdERMRVVvUHUzSmJqYStqWDJVRjhMd3h1eVdpYk05Mi83bWxUN0VR?=
 =?utf-8?B?b3JtMElYOXBpd2g3bTJQMHdOeTRRUkc2emIxMTJmTnNwbVFWR0V5RUhKaEh5?=
 =?utf-8?B?YjFZS2tqK3VUVnlTOVpWcjNnZFFxRVhEMlhDVlh2RzBZemxRbEhMYVViNWNX?=
 =?utf-8?B?enhhRUoxMThYaFgxdFB2bnNWMXlhc3hEd0JSZjlyT1NYNjgvbm1DUDUwYi9q?=
 =?utf-8?B?b1VncEtFSXlkekRyVXZxL2NmYjlyUStyQmNhZm5DVkN2K3BrMlZ5V21ZWExn?=
 =?utf-8?B?ZDB3Tk5vRTdwSlFlTWpDN25QNk9rQ25URjB6N3krTDNTTXQ4Zmx4S1JKZEFC?=
 =?utf-8?B?U3hJVjZaMzhIQ25wZVI5dmlhSE03aTk1UFVhbmNINUJsL3VFNXFTV3NwRXpZ?=
 =?utf-8?B?dk9XWUlUVURmZkZsNXN6TzJZWUNxUFRva2VXOEVwVEZveWxGODErK2lSaXQw?=
 =?utf-8?B?VHBXM1N3WFFIeVlLNXk1aUVVWnk1YkZuYklBY2lJRTl5UGlnU25id3J1UHFn?=
 =?utf-8?B?NndsZ0gxOEZIalpoRnhZNk1NNnYvNXpRTG9xS081M2Z1Yk45UTN6eUVRV04x?=
 =?utf-8?B?UHJta2hvb3hiekhpZHV2bmlicTlsRHYveVpFUmZuNmY5OWhyRk1zZjhXeFAw?=
 =?utf-8?B?OXlieWJUNFc2eVlKYUpXMzVRRlBvRVozZUFrT1FnNTY5b0JHN1BJVU4xTmdn?=
 =?utf-8?B?S2FrM1ZVT2RWckNaNms2dU9vUkpyZ2hBSmRPZ0hmRGNTTE1sM1JXbTIvTnBV?=
 =?utf-8?B?VDRiM24xamFNV0xNWmF6L3gwb3JSNWZCcEs1VENzY0FQQXQ3cmlVaU9rV2RQ?=
 =?utf-8?B?NlBUdlBrS1pqWE1FdXRUWGRNZk1aMEJCZVc2TGorRkE2ekg1MlNRdGpOVUNp?=
 =?utf-8?B?Y082ZlZ5RFh6UXRVci9aM2JzVnUvR3hqNkplZUd3bXNHaTNXZStnL0EvaE5s?=
 =?utf-8?B?TTZCSzV0elBWZEhYUGgvUWNtaXdmSHEzSFJUWlhtdm44ZGdOZUdrYjN3RXFi?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8108c582-e4a9-48a5-03f8-08dd0a4d6d83
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 16:56:22.4395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTDr2goBZcHhX8H6NhbDaxXJd9zyOlQeAoOVl4/eZZAv32O9pKSIPUQjbXkjkSkUWQuRzzRN4Vpb5tkFNprG21o+75SfhDgBo7p7OOBnDFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4966
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

On 11/20/2024 19:30, Matthew Brost wrote:
> On Wed, Nov 20, 2024 at 03:22:57PM -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There are now multiple places that can trigger a coredump. Some of
>> which can happen in parallel. There is already a check against
>> capturing multiple dumps sequentially, but without locking it doesn't
>> guarantee to work against concurrent dumps. And if two dumps do happen
>> in parallel, they can end up doing Bad Things such as one call stack
>> freeing the data the other call stack is still processing. Which leads
>> to a crashed kernel. So add the lock.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c       | 18 ++++++++++++++----
>>   drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
>>   2 files changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index b5aebe8fb06d..05f3c9185ef3 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -235,9 +235,13 @@ static void xe_devcoredump_free(void *data)
>>   
>>   	/* To prevent stale data on next snapshot, clear everything */
>>   	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
>> -	coredump->captured = false;
>> +
>>   	drm_info(&coredump_to_xe(coredump)->drm,
>>   		 "Xe device coredump has been deleted.\n");
>> +
>> +	spin_lock_irq(&coredump->lock);
>> +	coredump->captured = false;
>> +	spin_unlock_irq(&coredump->lock);
> I don't think you need the IRQ version here, or in the other usage. I
> don't believe in either case here we are in IRQ contexts, or if we were
> one of the cases would use spin_lock (already in an IRQ context) and
> the other would use spin_lock_irq (not in an IRQ context but another
> case can be). Certainly taking spin_lock_irq in all use cases of a lock
> seems unnecessary.
Yeah, that was a copy/paste that I was meaning to go back and update as 
necessary but evidently forgot to.

>
> Is there some follow on patches where this changes?
There will be. Still more re-work to be done for the GT targetted 
capture support.

>
> Adding the lock seems right though and should enable coredumps on
> multi-GT or from which are not the GT ordered WQ.
Yeah, with the capture on GT reset I was hitting the race and got a very 
dead kernel a couple of times (because there were parallel captures for 
the same failure - one via GT reset and one via DRM timeout). Not sure 
if it is possible to hit with the current job specific captures but I 
don't see why not. If you had parallel independent hangs on both GTs of 
a multi-GT system then it seems like it would still go bang. Just much 
harder to hit.

>
> Maybe also add helpers like...
>
> void xe_devcoredump_release()
> {
> 	spin_lock(&coredump->lock);
> 	coredump->captured = false;
> 	spin_unlock(&coredump->lock);
> }
>
> bool xe_devcoredump_acquire();
> {
> 	bool acquired;
>
> 	spin_lock(&coredump->lock);
> 	acquired = !coredump->captured;
> 	coredump->captured = true;
> 	spin_unlock(&coredump->lock);
>
> 	return acquired;
> }
>
> IMO - this makes this locking semantic a bit more clear.
Not convinced. There are exactly one places where each of these 
functions would be used. And acquire/release doesn't seem like the right 
terminology to me. Especially when the release is from a totally 
different call path. The 'acquire' is an internally triggered thing by 
the driver but the 'release' is in response to a sysfs write from the 
user. The intent is really just alloc and free but for a singleton 
entity so there can only ever be one instance at a time.  However, the 
above code is not the actual alloc/free so calling it that would be wrong.

The implementation is more about back-off-when-busy than regular mutex 
locking. It could potentially be done with a kref thing and 
inc-if-not-zero functionality, but that also seemed more confusion than 
just having a spinlock around a simple bool.

John.

>
>>   }
>>   
>>   static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>> @@ -310,14 +314,18 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
>>   	struct xe_device *xe = gt_to_xe(q->gt);
>>   	struct xe_devcoredump *coredump = &xe->devcoredump;
>>   	va_list varg;
>> +	bool captured;
>>   
>> -	if (coredump->captured) {
>> +	spin_lock_irq(&coredump->lock);
>> +	captured = coredump->captured;
>> +	coredump->captured = true;
>> +	spin_unlock_irq(&coredump->lock);
>> +
>> +	if (captured) {
> Then here...
>
> if (!xe_devcoredump_acquire())
> 	msg...
> 	return;
>
>>   		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
>>   		return;
>>   	}
>>   
>> -	coredump->captured = true;
>> -
>>   	va_start(varg, fmt);
>>   	coredump->snapshot.reason = kvasprintf(GFP_KERNEL, fmt, varg);
>>   	va_end(varg);
>> @@ -342,6 +350,8 @@ static void xe_driver_devcoredump_fini(void *arg)
>>   
>>   int xe_devcoredump_init(struct xe_device *xe)
>>   {
>> +	spin_lock_init(&xe->devcoredump.lock);
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> index e6234e887102..6b776abd8bf4 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> @@ -80,6 +80,8 @@ struct xe_devcoredump_snapshot {
>>    * for reading the information.
>>    */
>>   struct xe_devcoredump {
>> +	/** @lock: protects access to 'captured' to prevent concurrent captures */
>> +	spinlock_t lock;
>>   	/** @captured: The snapshot of the first hang has already been taken. */
> Protected by @lock.
>
> Matt
>
>>   	bool captured;
>>   	/** @snapshot: Snapshot is captured at time of the first crash */
>> -- 
>> 2.47.0
>>

