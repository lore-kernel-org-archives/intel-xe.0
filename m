Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83790C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 14:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C306910E747;
	Thu, 30 May 2024 14:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSTWxNBo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E50B10E747
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717080830; x=1748616830;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=85SmpzXuKRGTskmf4LoXpYROG/oV2dV+smKUvDEEZmU=;
 b=CSTWxNBolVitYM/ypAYCQ6+RIe4zIZL7LGvKwQJQGeUXanG0Rk0r5Zm9
 JOCwYRZNzHr8tFymvyRn7WHB5hTrV/k25U8AMOO5eTfis9DZny5lQa1RP
 ve7xEbKbpemnlbU/PwM4QK4dCFfgSBHOY10rKefxkMVL/I+DT50MT0HfS
 q+nIf/VyTdY2owh6pbwBAtHimfm488Gkrf5fQYI2pISXv37du62TRVKwF
 SWvluop7q2Ld28gfsGZmdVX7i1I5G7lM6U92zfsvepQLYjc/7vGrR9jvx
 kB8maKniNy+fFQRIIMCydN4e4EZGxrGXcUZk/6hTQcr8EetZCAO63Crb4 Q==;
X-CSE-ConnectionGUID: i7Stz8YLT++mdj2vyJx2VA==
X-CSE-MsgGUID: 6/LMMn7VRmCSOfvtPvK2mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13406388"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="13406388"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 07:53:50 -0700
X-CSE-ConnectionGUID: F+8x8bNiTJ62MFdKNlDOdQ==
X-CSE-MsgGUID: WW2tyCJoTva3bWhz/ciLnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36414765"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 07:53:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 07:53:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 07:53:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 07:53:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 07:53:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWGr4Areov/cj8P5BYNmus3ocYrjjGVMCWCKfLJiSVOUnF+yGHE71zBt5mahdYS0lJzpb3RH4i0uT5Ip10OktlGdlKp/vW9TaLtSbrbjI+m8hbiTBjGRArNyIOQ4BAt2ODzEif+osEhqTBrFjDxD0SlPbYu08ohA6u0EGkL+lDj1L/Sj9g0/AST2cd9395A6QQ959+V2sXgPZEBV/nyoqIBoLNG2CTErcueTorovvu0gkEELJ2f2qUVXEFpzeQi3G4gDws6JguMYwENH3615yriSPE5vnIhI7/jl3CAfzseL0Xvyz2Cb6y4LoBPWIimsMvLJt4jWa4aBxv5YzHYrZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnRua/NIk4IHCME1nszFliSckCPxZu0yUiWsrEWk1CE=;
 b=JLx3PP2yAbYqYpyqXWP+ua1AgCFsWQ1R6Wp5rdREHmxe60MQTca6+9TgKsI8SsoUaFXhZa6eguShidyu/crgyc+Xbz3HUlu4tSnXDi4nV6scK6ZBlvTFdylZmF0WBSklWQvTzePmBWHO3pZH2JkNNAm2KUgMR2a6z6zvnQ0poF1zxqv1BMv1RYVw5tOcayNpSOfTFk39e0uRhAlaP6WmfpLKzfmVPP3/OWF5a6Zb0O01j+1tjJCYiMjwtl0k14dk+IHBHpDOaO0ssSuS6WeiiN2wRh5BzCwBH95nkVaawtOZYTnPor1F6C0ylj+0tZQ9qO9hMPMSI5XrbJIy9zGL7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4513.namprd11.prod.outlook.com (2603:10b6:5:2a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Thu, 30 May
 2024 14:53:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 14:53:46 +0000
Date: Thu, 30 May 2024 09:53:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLktVbml0?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe2lpm: Add permanent Wa_14020756599
Message-ID: <v2s6htgczrr35mo3ghw2nchdz6pmjpqmzfl5wiudemezxiwfhx@6v6w4mplqinp>
References: <20240530105229.490430-1-tejas.upadhyay@intel.com>
 <171706671216.2238127.6116030491167635806@8e613ede5ea5>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171706671216.2238127.6116030491167635806@8e613ede5ea5>
X-ClientProxiedBy: MW4PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:303:16d::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4513:EE_
X-MS-Office365-Filtering-Correlation-Id: ef167277-4a97-4d64-bf77-08dc80b84e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MllVZk0zb1YybEJXWXFyY0h1eldWbFJEYkVyYVJxYURSVzRkV3hwM1A3clBr?=
 =?utf-8?B?ZFJzRndZVmJqVUF4QkRNVkUzNlBiNWlrMDEzY1NITnQwNWt0N1ZiaVlReXRh?=
 =?utf-8?B?b0xxR0pxeW9iSndJMUx5cTFEZnhUTkdOdmREaDJDL0dqOVgyUkgwRGQzZkhH?=
 =?utf-8?B?dWwwY2RNbXdFaVhuU0plaDlYdTdDWE1UVnJERVJqWkxFeEFobUROY3NNQTFJ?=
 =?utf-8?B?NE9rVzl1VjNmazVWTDc4NE1WakZNSncrZ25tVHFFUDMvTVhnRUd0ZDIzV2Ni?=
 =?utf-8?B?aDRYamUxenhueG9ZMm9nd0RRNTQvSHd0OXk4MFpCNUc0eHRUWnhPazlYOU9k?=
 =?utf-8?B?MDJBNlV0L3crKzlLR0ZmUHVtMExJQTJ0NWdrTlY5ZHRZMWNBRUNheFVoRDVu?=
 =?utf-8?B?R1V5eEhFc3kzK2ovWkZGT3YweTl3bVBWM25yRUIyNU51OGZROWZQdVYzWm40?=
 =?utf-8?B?SXJkR3lIYmsrUUgvVkhLN3BQMWw1M3hoakswRGt1ODdLSHVKSDc5SkxnNit3?=
 =?utf-8?B?TVV0NWxDY2U5ZWp5Tnh1dFZUWXczZ0REcUJLVmlUV1N6UHc1M2FqdXc0WEI4?=
 =?utf-8?B?dVduL2RMVS9mcGRXYUJZa0ZoRWJkTGtFTE9qaHBYQmQ1VVkzVHl3V2FDVVJ6?=
 =?utf-8?B?MHZvejI3eTVTcmJDeGFCUithNlhLQTZ0VE9xZzM4VUpVaUNiTGUrUjVaUkda?=
 =?utf-8?B?bjRpVFpzMHFHNDhqS1h4V3BkY04ya3hpV1NNT0RJbFN6b0M4ak42TU5LWnpQ?=
 =?utf-8?B?Yit5d0lMVnhXVzN6bVFXK2YvaEJJMWMydXExL0VJdXdMbDR1dEdiY0gyL2pO?=
 =?utf-8?B?M0dFZE8vOFNab0dkeUFCUlBHakdUdmhDK3hNT0FkUkxCM01zb1lHcnRpVW1J?=
 =?utf-8?B?ZkxsY1o1d1RKcFFWWkQwMGFpcUNtRHl2cHV6MXM5dUlURmplMlRuV0NlVUNh?=
 =?utf-8?B?NXFLV0VhdTZRcDFLczdKWEUvNzUvSTN6cGJrTU9ZMDBhYk5BeitoVkxYMmZW?=
 =?utf-8?B?dFN0cjlHeGNwOHNNc2pVbWFxZjQ5ZFI0N3p6elhydjhKMUpFdHNvaEwvMkhN?=
 =?utf-8?B?aWphKy80ZUxXaXhhOG5HeFVmQ0hjRjBtVHdjUTVLOGpqc0duQ3ZrekFSN2tr?=
 =?utf-8?B?M0VSNDc0M1Zzd3pIZktDYjNXcDl3c2NockcxdzJnTkdSdDFhM1dXcDRZV1kx?=
 =?utf-8?B?OGVUY2FYTGFtQ3ZUOVhuaVJJWVpHZVJWRWFLMWhBYmw1REVxUHNxSElleDln?=
 =?utf-8?B?K3lLNngwY1FSVzBLb0NYVXBHWC9ueGJBOUxLMnNMMHNHdXhtQ3QzMHYya0xE?=
 =?utf-8?B?UTYyMjNtbFFlU2QyR2YrbVVzR2diMDVocnk2RGtLYjJiRENoWWw3ZGdRRjFq?=
 =?utf-8?B?dUlPSlpkVERwVUp0VEhvTmphSG9OMmxKZ1VTT1lVWkkxc0tmcmgwVXVoajBn?=
 =?utf-8?B?Z3RZdktnOS9IY0V2YlhkNm9pQUQvUGVPWG1DTXhGdjNmemRsQ0FmL1RSN0d0?=
 =?utf-8?B?UjdHSDU5ZUF6RG5RQ005SEExaDhTSmtPSmZScTVjdVhRY2k1bURRQ04vRUFV?=
 =?utf-8?B?M0t6cm40ZE05SUdhd1BCZ0lldlEwQjhiOWpYTVFCN2F4ZUFLRXk3UENYemdw?=
 =?utf-8?Q?H3pXwgys6TJxNdnRIknZu3Ns70m+pbY8WXKSDYs88PT8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXNiazhQVUNsRTBYWWlVRzErSWo5R0tnZ01sRG1WMVlpUk4zVVExeS8wOStl?=
 =?utf-8?B?U3NYQ2FRb2FkQlUwV1VmS3RhOEpIQXlhd0JHMEp5NGpyYWZBcVNrR0FFcllk?=
 =?utf-8?B?bHc1dWUvYytmSVhwVGc2SlpMRXFkdS96WG9WMmluUkVpTzVIcjAxdmpSUUVW?=
 =?utf-8?B?Z1hzUUlGUGpmT1Q5TDRDSnczQnVDTFB4NStodHpsQUxpTkJ0R3JDcm1mM1Y4?=
 =?utf-8?B?ODE4dVViOHQ3VytEWFdqM040RE91OXdSeFlYVytkaTB3bWhKVW40a1lVMys3?=
 =?utf-8?B?S3V3ODd5aUR2L1VpeWNqY2tWRm45N3g3UmxWVE9QQkFjSFpoN1kzMUpWanFR?=
 =?utf-8?B?T3VDWGdZMURERXp0anZVMDhGMC9kMDF1U00vZ0VJWXJwV1VFc2FjblZ3cUNz?=
 =?utf-8?B?R1hhd3VPSFhyZDJOclpSTDJPaVZTWWJFbW5uT21CK1dCbktZVFF2L3d1Sm5J?=
 =?utf-8?B?dWh4dUF6Tk9aYXJJRjg0U2ZhQnZ3Q01MK3pEU2tEWXZsaUVaVHkrc24zanlI?=
 =?utf-8?B?clg4U0pMUWZqUHBYcFpWUk1jWGRFK0szdlhIb0Vzb1lVU21aQ2RuSTV0ME8r?=
 =?utf-8?B?ZGVmeVViLytZenp3Z2g4Y3dkMkxTbDBDUVNYWWdmc2V0cGNobUM2ZW4yZnln?=
 =?utf-8?B?RGNqMzJ6bVprOEtqRmV4dU1xMHhNTnpWQlRVSDZ5YVBTUm5saXQwUDI0anpR?=
 =?utf-8?B?eHA1ZGZpTEtDS1k5OGFkdm8zQkhKOVJGbWtKWlRpWHNVWVh2UkU5OVR0emZl?=
 =?utf-8?B?c3hrdVIvclhNVkNkZm5XM3pSWFp1VExyeEZwcGxJS1puRUwzNy9KRUQvS2Rw?=
 =?utf-8?B?VE1Ud1lZZ1RBeDdmTjFiUFBYeGxzUFZzeUlTemZIdVAwNWJIMXZVcEtZa0Vs?=
 =?utf-8?B?MUhocCtGOUxZSUEza0xsbitURElrQ1VKQURTUEtJTTBldEhLbEJyNW5Ndkcy?=
 =?utf-8?B?NmRSbFZ2VHRPK01MTis1ejRwaDFTSXZqMTg5clNqb1I3eWhUcEt0Uks0OERL?=
 =?utf-8?B?ZUVUdWtXeGtTNmd5bUEwazRMd1h0MTBFL2JqRjN0Q1RYeXlydUNOTlZCQWY2?=
 =?utf-8?B?YjFYSy9jano5ZGUydngvWHdKYmdVL3ZLKzVYOGZjbVhTaVRUdkJ1b0lQT04w?=
 =?utf-8?B?WW93eVBTRHJNSGNBNU94WTMzRjNBWTZiZjNWQkFZM1lEWWJCQmpPbHhIZ0hS?=
 =?utf-8?B?cFNnR1RTU0djeWZpcVU4Z0E0dDdoUGlnbmsvcXZpa0F5TGRCK3I5dEo0bUFL?=
 =?utf-8?B?bzc3YUJiTjA5Rm5UNUNxUVd3VUl1YmpndjQwMHhFVS8wa256T20xVWZMU082?=
 =?utf-8?B?ODhRUW9SakUyVHV2Sml3dDVBR0ZtMFAva2NKbTBPTmRkVzg3TzE1NW9mVzFt?=
 =?utf-8?B?S1RXQTQ3ckRoK3BZSkZWMTA2bUJtTTMrT1ZFOTk2YWMySVVNZ0ZaSnBWeHBx?=
 =?utf-8?B?Y1JON2NEcWFuS1BGdUw4KzhIQ1hBQTdsZnllZkVxdjA4REMxWFVYRVFqMEpv?=
 =?utf-8?B?Y3Zjc051dW05RmVNYURzak0vVVhmZ3Q0cHVNLzNiMjhqT1o1aHdtWDJRQkgv?=
 =?utf-8?B?ZmxoTjExdlV2Y0VZNEJpa2tmRGp5Q0hIRVNKaUltOG96SXdZODM4Y3dGUVU4?=
 =?utf-8?B?YVVOZ0xiK04vYkdib0NwREpuRlFUSUNFR1d3N1MvekhjU0NwYWtaRUYzVXYz?=
 =?utf-8?B?YUVhQkxBaGp3ZUZuY2lQODRiT2dGanlaclFDeEtreUpNMGtob1NrZDBzajJ3?=
 =?utf-8?B?Mm9KRStBdmpNRFljZjF4OUx5ZzlCNG5yOXdZM0xJRU1XK0F0OXlpK0ZwVk9N?=
 =?utf-8?B?OW5UNG9uZkxqck5qaU5GR1RHcXF2VkZhaElCV0RRTkZaQ1FkNmZWb2plMWVp?=
 =?utf-8?B?RVMrRWhLbVFEdVpaWi92YnZWZEJmbmRteHRENk5ET0tndGFNMjBMaXQwd2sv?=
 =?utf-8?B?Y2pWNGJsVjcxQW8xaGVCQXMxUmU2aXRWR045MHRvQm9LbGczc0wzRHJkUzRk?=
 =?utf-8?B?R1VnZ2MrNEJ3L2JGOE1wais4OXJpNUJ4NmE5cHg1WXF6UW1rOUIvcGNIcW5s?=
 =?utf-8?B?bFgwbVo4blhKNDMrNVRFaHN6UFRmTmZJVENLbFd6djhGWTNPY2dPL3dMTmJW?=
 =?utf-8?B?ZmZsdXE2RVU5blZTMHBZYTJBVGNvUWpYREVwLytHdnZldzV0aXB2L1BXOFdW?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef167277-4a97-4d64-bf77-08dc80b84e86
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 14:53:46.2354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SW8cUNA4jMI78vM6vfgQE4OoDzgiu2jZ8S9uZLrs65EiKMOG38rLpU/FnXeVxaIyEVm65fAhFSW87FndzkCaNen8asG+QbPr3U7SAFpPYxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4513
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

On Thu, May 30, 2024 at 10:58:32AM GMT, Patchwork wrote:
>== Series Details ==
>
>Series: drm/xe/xe2lpm: Add permanent Wa_14020756599
>URL   : https://patchwork.freedesktop.org/series/134245/
>State : failure
>
>== Summary ==
>
>+ trap cleanup EXIT
>+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
>[10:57:57] Configuring KUnit Kernel ...
>Generating .config ...
>Populating config with:
>$ make ARCH=um O=.kunit olddefconfig
>[10:58:02] Building KUnit Kernel ...
>Populating config with:
>$ make ARCH=um O=.kunit olddefconfig
>Building with:
>$ make ARCH=um O=.kunit --jobs=48
>../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
>  156 | u64 ioread64_lo_hi(const void __iomem *addr)
>      |     ^~~~~~~~~~~~~~
>../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
>  163 | u64 ioread64_hi_lo(const void __iomem *addr)
>      |     ^~~~~~~~~~~~~~
>../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
>  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
>      |     ^~~~~~~~~~~~~~~~
>../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
>  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
>      |     ^~~~~~~~~~~~~~~~
>../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
>  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
>      |      ^~~~~~~~~~~~~~~
>../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
>  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
>      |      ^~~~~~~~~~~~~~~
>../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
>  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
>      |      ^~~~~~~~~~~~~~~~~
>../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
>  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
>      |      ^~~~~~~~~~~~~~~~~
>
>[10:58:28] Starting KUnit Kernel (1/1)...
>[10:58:28] ============================================================
>Running tests with:
>$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
>[10:58:28] =================== guc_dbm (7 subtests) ===================
>[10:58:28] [PASSED] test_empty
>[10:58:28] [PASSED] test_default
>[10:58:28] ======================== test_size  ========================
>[10:58:28] [PASSED] 4
>[10:58:28] [PASSED] 8
>[10:58:28] [PASSED] 32
>[10:58:28] [PASSED] 256
>[10:58:28] ==================== [PASSED] test_size ====================
>[10:58:28] ======================= test_reuse  ========================
>[10:58:28] [PASSED] 4
>[10:58:28] [PASSED] 8
>[10:58:28] [PASSED] 32
>[10:58:28] [PASSED] 256
>[10:58:28] =================== [PASSED] test_reuse ====================
>[10:58:28] =================== test_range_overlap  ====================
>[10:58:28] [PASSED] 4
>[10:58:28] [PASSED] 8
>[10:58:28] [PASSED] 32
>[10:58:28] [PASSED] 256
>[10:58:28] =============== [PASSED] test_range_overlap ================
>[10:58:28] =================== test_range_compact  ====================
>[10:58:28] [PASSED] 4
>[10:58:28] [PASSED] 8
>[10:58:28] [PASSED] 32
>[10:58:28] [PASSED] 256
>[10:58:28] =============== [PASSED] test_range_compact ================
>[10:58:28] ==================== test_range_spare  =====================
>[10:58:28] [PASSED] 4
>[10:58:28] [PASSED] 8
>[10:58:28] [PASSED] 32
>[10:58:28] [PASSED] 256
>[10:58:28] ================ [PASSED] test_range_spare =================
>[10:58:28] ===================== [PASSED] guc_dbm =====================
>[10:58:28] =================== guc_idm (6 subtests) ===================
>[10:58:28] [PASSED] bad_init
>[10:58:28] [PASSED] no_init
>[10:58:28] [PASSED] init_fini
>[10:58:28] [PASSED] check_used
>[10:58:28] [PASSED] check_quota
>[10:58:28] [PASSED] check_all
>[10:58:28] ===================== [PASSED] guc_idm =====================
>[10:58:28] ================== no_relay (3 subtests) ===================
>[10:58:28] [PASSED] xe_drops_guc2pf_if_not_ready
>[10:58:28] [PASSED] xe_drops_guc2vf_if_not_ready
>[10:58:28] [PASSED] xe_rejects_send_if_not_ready
>[10:58:28] ==================== [PASSED] no_relay =====================
>[10:58:28] ================== pf_relay (14 subtests) ==================
>[10:58:28] [PASSED] pf_rejects_guc2pf_too_short
>[10:58:28] [PASSED] pf_rejects_guc2pf_too_long
>[10:58:28] [PASSED] pf_rejects_guc2pf_no_payload
>[10:58:28] [PASSED] pf_fails_no_payload
>[10:58:28] [PASSED] pf_fails_bad_origin
>[10:58:28] [PASSED] pf_fails_bad_type
>[10:58:28] [PASSED] pf_txn_reports_error
>[10:58:28] [PASSED] pf_txn_sends_pf2guc
>[10:58:28] [PASSED] pf_sends_pf2guc
>[10:58:28] [SKIPPED] pf_loopback_nop
>[10:58:28] [SKIPPED] pf_loopback_echo
>[10:58:28] [SKIPPED] pf_loopback_fail
>[10:58:28] [SKIPPED] pf_loopback_busy
>[10:58:28] [SKIPPED] pf_loopback_retry
>[10:58:28] ==================== [PASSED] pf_relay =====================
>[10:58:28] ================== vf_relay (3 subtests) ===================
>[10:58:28] [PASSED] vf_rejects_guc2vf_too_short
>[10:58:28] [PASSED] vf_rejects_guc2vf_too_long
>[10:58:28] [PASSED] vf_rejects_guc2vf_no_payload
>[10:58:28] ==================== [PASSED] vf_relay =====================
>[10:58:28] ================= pf_service (11 subtests) =================
>[10:58:28] [PASSED] pf_negotiate_any
>[10:58:28] [PASSED] pf_negotiate_base_match
>[10:58:28] [PASSED] pf_negotiate_base_newer
>[10:58:28] [PASSED] pf_negotiate_base_next
>[10:58:28] [SKIPPED] pf_negotiate_base_older
>[10:58:28] [PASSED] pf_negotiate_base_prev
>[10:58:28] [PASSED] pf_negotiate_latest_match
>[10:58:28] [PASSED] pf_negotiate_latest_newer
>[10:58:28] [PASSED] pf_negotiate_latest_next
>[10:58:28] [SKIPPED] pf_negotiate_latest_older
>[10:58:28] [SKIPPED] pf_negotiate_latest_prev
>[10:58:28] =================== [PASSED] pf_service ====================
>[10:58:28] ===================== lmtt (1 subtest) =====================
>[10:58:28] ======================== test_ops  =========================
>[10:58:28] [PASSED] 2-level
>[10:58:28] [PASSED] multi-level
>[10:58:28] ==================== [PASSED] test_ops =====================
>[10:58:28] ====================== [PASSED] lmtt =======================
>[10:58:28] ==================== xe_bo (2 subtests) ====================
>[10:58:28] [SKIPPED] xe_ccs_migrate_kunit
>[10:58:28] [SKIPPED] xe_bo_evict_kunit
>[10:58:28] ===================== [SKIPPED] xe_bo ======================
>[10:58:28] ================== xe_dma_buf (1 subtest) ==================
>[10:58:28] [SKIPPED] xe_dma_buf_kunit
>[10:58:28] =================== [SKIPPED] xe_dma_buf ===================
>[10:58:28] ================== xe_migrate (1 subtest) ==================
>[10:58:28] [SKIPPED] xe_migrate_sanity_kunit
>[10:58:28] =================== [SKIPPED] xe_migrate ===================
>[10:58:28] =================== xe_mocs (2 subtests) ===================
>[10:58:28] [SKIPPED] xe_live_mocs_kernel_kunit
>[10:58:28] [SKIPPED] xe_live_mocs_reset_kunit
>[10:58:28] ==================== [SKIPPED] xe_mocs =====================
>[10:58:28] ==================== args (11 subtests) ====================
>[10:58:28] [PASSED] count_args_test
>[10:58:28] [PASSED] call_args_example
>[10:58:28] [PASSED] call_args_test
>[10:58:28] [PASSED] drop_first_arg_example
>[10:58:28] [PASSED] drop_first_arg_test
>[10:58:28] [PASSED] first_arg_example
>[10:58:28] [PASSED] first_arg_test
>[10:58:28] [PASSED] last_arg_example
>[10:58:28] [PASSED] last_arg_test
>[10:58:28] [PASSED] pick_arg_example
>[10:58:28] [PASSED] sep_comma_example
>[10:58:28] ====================== [PASSED] args =======================
>[10:58:28] =================== xe_pci (2 subtests) ====================
>[10:58:28] [PASSED] xe_gmdid_graphics_ip
>[10:58:28] [PASSED] xe_gmdid_media_ip
>[10:58:28] ===================== [PASSED] xe_pci ======================
>[10:58:28] ==================== xe_rtp (1 subtest) ====================
>[10:58:28] ================== xe_rtp_process_tests  ===================
>[10:58:28] [PASSED] coalesce-same-reg
>[10:58:28] [PASSED] no-match-no-add
>[10:58:28] [PASSED] no-match-no-add-multiple-rules
>[10:58:28] [PASSED] two-regs-two-entries
>[10:58:28] [PASSED] clr-one-set-other
>[10:58:28] [PASSED] set-field
>[10:58:28] [PASSED] conflict-duplicate
>[10:58:28] [PASSED] conflict-not-disjoint
>[10:58:28] [PASSED] conflict-reg-type
>[10:58:28] ============== [PASSED] xe_rtp_process_tests ===============
>stty: 'standard input': Inappropriate ioctl for device
>[10:58:28] ===================== [PASSED] xe_rtp ======================
>[10:58:28] ==================== xe_wa (1 subtest) =====================
>[10:58:28] ======================== xe_wa_gt  =========================
>[10:58:28] [ERROR] Test: xe_wa_gt: missing subtest result line!
>[10:58:28]
>[10:58:28] Pid: 195, comm: kunit_try_catch Tainted: G        W        N 6.10.0-rc1
>[10:58:28] RIP: 0033:xe_rtp_match_rcs_when_media2000+0xc/0x30

			^ seems related to this very change

Lucas De Marchi
