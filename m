Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACACDD26D6B
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 15:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB4E10E8F3;
	Fri,  9 Jan 2026 15:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWgWWc6m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3F410E8F3
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 15:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767973967; x=1799509967;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i8mekk4ZyjUYl85JS5dq9rtRoszVtb8Vp3Po/s9rZdA=;
 b=EWgWWc6mljPab0jz1INuL3iDmAnVriOePor+LFLzJt9IggnbPuCSgEuI
 sHT+Ue6drMF6jEBHGeuapHOli1BbpP2CkDg9m9BaGT0MXaTL3OB+mjigT
 t1QCw2djMCj/FpoAzpqHvmi45oXS5njIwNXg3FlHc2ncThlyO7lQvdgy0
 dHEtkAXZ4nMsVqeTpT1nOiVEmPMm1gjxA29bq35UoZl/NmniAZ5ZpG05e
 xRqe9EM/otZIorhs9Sl1yXEIOQauNa3LLUYaS9TitduI+uDkkvyk42moz
 r+SYdh/bSxliVltU9nDpAUtAWkXSFg+qqLrY8jcagf9yMeIMO6/R9iD6t w==;
X-CSE-ConnectionGUID: yhTGVykzRLytin9FAitlVQ==
X-CSE-MsgGUID: 3SkJDkFoS2aXGfS5ctHwNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="92019350"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="92019350"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:52:46 -0800
X-CSE-ConnectionGUID: CtjxmOzkS2KAXUevZg5UIg==
X-CSE-MsgGUID: zoQjXdB5QbCSeFXtx5ZsSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="207653209"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:52:46 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 07:52:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 07:52:45 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 07:52:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPYarEaOhLtAqXmJ0ZNgm06LHpD6ayrlTQ24f8WnA3Lc5e8AQAbATpyxtimKMSgxj6J3ZmtmA8r1RhV51+g7HtwyYRYLMiI3/5ppX2aDAFCuouDR26si1ltOE3aFX86n2Qt3sAGotUrJhEKo6tNvBz57MeADqWGPel65yWzqQYBNVucLCkXGUOJZkUa4/RobqEWKekPVjf5cVfXkB6YBlpvdubhaQGEKNtKuKUgQ0/OS4bnN+2NNwj456cUUOwIAcYOKlp2zoLJ3HrGVRhZZVcFr9aDt5KhKi+XDivuLdBLD2aRTcbFYLo/jkIq6Sm/J/m88j5VycHcL0ewuf0iuFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZs3KNvDlC2gcqU3HYCiIJ7j8VOflMxdIR34XvUq4xA=;
 b=tnCt+hSDrX9EiX9Xrt9JxGSv4EHo9QAYoBgBa3pInvcjVtYLE6fTv7oxTSfz/d6Uu6h0nt5BBx6kgcCSYOGcm8Hp/wDWvA6nKQYElxmEv1LTxlTZvFBF4xbKnRwqgfbfoZSM+eEVQoz7hRPB0dwuFFR2bZ3KEsgDLmsZlm1tts9Mi4c0woO0UWesJwBUmpiZFv23hfNmwcL0mFlQGL7hO3CP/kAfbvTp1VdFvh+FwFxZKnCL8odWmZOo4qfaeQ9RYknV1lhrPbegfgAi4Q/46C3F6m3pveh0LrrmiYglFfLOLF5vW3rG4xrRNFWSPej0WEbD4g9qGs6/VkQCl5Uc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SJ1PR11MB6225.namprd11.prod.outlook.com (2603:10b6:a03:45c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 15:52:42 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%6]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 15:52:42 +0000
Message-ID: <2d9aa2eb-bc17-4717-8189-f14049c8126d@intel.com>
Date: Fri, 9 Jan 2026 07:52:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/gsc: Make GSC FW load optional for newer
 platforms
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
 <20260108011340.2562349-6-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260108011340.2562349-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:303:b8::6) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SJ1PR11MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: e1191e4c-a1c3-4f53-f048-08de4f971fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QW1HMGNmbVZjNThqUUxYVWlnYVU1WXkxN3Z0dHErZzR5bzY5SEw2Tkp3SjRG?=
 =?utf-8?B?TUVsQ1IzS0ZZZ3c2UjNqRStEZVRWQjdYUlRXc3FzT0lpYmRJNDFGQ3ppVkRH?=
 =?utf-8?B?YThOTlY5UFU5T3RPNFQ3NVFneHpUOEpSbkdCN2VKaFpFa3llem1GUnYyMjMr?=
 =?utf-8?B?T1Q3TXExRWNCYWg4cGRwWmtReFVRdFRCbkdacDdiZHZ5eHpZMGd6Skd6UnVs?=
 =?utf-8?B?YlJPMTMwbXpNb3lIQ2VsT3hITDJjUjNBYVBWQzJmQjIrVmRyc0NrVHpOZTUv?=
 =?utf-8?B?bFZWMGpkWEE0OC94UzZiRGdZK2Jpd0I3YXJTYzV3OVI0VEpHcnJmbjZCK0hB?=
 =?utf-8?B?bnJxaGxqblFYOGwvZWtLZURZNXdBUGM5ZzEzdzdESDJJUVJXdnBudGU0MGNF?=
 =?utf-8?B?NTZOTjRRUGRZUzBmdWpvb1B4bTczdEwvV1NOYS8wbW15N2JpWHhxTXYxM3RN?=
 =?utf-8?B?WDBMWHRtTzV6NlByUmlKRG9qWGRGdjgyNlZ3Tnl6R2htUVJ0VDVNUDRWcWp5?=
 =?utf-8?B?WG05U2lDQzRIZS9HMFY4dEFKM0k3SVk0WWtDVEo4ZzhDOTBGZmNOZERtb2lz?=
 =?utf-8?B?NHliYnF2TXNWOUVPN0d1ZTF1b0RCczhWaW5OWTA5NDE5T1MwcTZ2U0R2Z3FJ?=
 =?utf-8?B?Z3VpbHFhMGlGMVBjVlFsaUIzN1ZraENyWGZxZzRTK0FIL1dHTW5IdjNkZVdo?=
 =?utf-8?B?V2JzODNwcC9tNHV3eGlaeUQ3Mk1acmgyNVJPK1ZjbEkrcWQ2Vnk5ME1PcGs2?=
 =?utf-8?B?K0xDMWlCRmlVRkNISU9CWFNFNTRQZWtYSFFDZytkVWF0VjhJS01FQzdTZm5F?=
 =?utf-8?B?YWs4MEh0Q1dOQVhkQ01iUHZtWDhoWU1SdUdlOCtSd0hPK0dRZ2gxOW5FNEtV?=
 =?utf-8?B?VDVjZ0tYSStualZET2EwdGZKV2c1MnFBWVZPMmtSWDFITlZyNHFXd2loc3dL?=
 =?utf-8?B?VUNYSzdUYTcweDVoYVNScVZpbmFwN0Q1Uzg2ejdVcmpxa0hiNnhLR2hOTHU5?=
 =?utf-8?B?V1VCMXg2dnZCeUJEVTgzZ0t5MzR5NGpBaGdISG5GUWFRVmtBNlpqbng4OU5G?=
 =?utf-8?B?VE5wWDJPdmhkVmE3ZVBnTGNIaGliUUJmYUpDWm52aWRSQ1NlWFZiOXNjcDk3?=
 =?utf-8?B?NDVhQkVBQUduN2oxNlNTQ0VQZ2ZPQnp2SGw3SmhacGkyT1dLQ2J6SWlnM3ZW?=
 =?utf-8?B?MHlaRDN6eWhxWFU4YVhZdmxnVE8wMXdoOVNUU2xBMW1nUEw1Y3Zid1picGNZ?=
 =?utf-8?B?ZE9SNllpdkdrQTZwSkkwNUIzdnI0UGsxV3Q2Z0Qzd2FLMzJXRXBxLzR4dzZC?=
 =?utf-8?B?ZnpFYlAvSm01NVFqNXJ4a0ZpMCtrV3FlZ25FWjdHQXlSWDFSQTRza2FuUGdD?=
 =?utf-8?B?a1QxNFlVeWRNOG1ZbXUvaG82M2R1dng5a0ppVE14ejNFOHFTaWFWS1REVzdE?=
 =?utf-8?B?Nm5mT3phQXd4eTZpYzI3cHlFRVg5Q0l6eklZdTgrbFhGOG9sOXlzN2RLN3h0?=
 =?utf-8?B?TDlVaS9VaDhGbWRzOHdHL0xMVjlRMFZKTTZMVWdjZ25oTUlUWTJITXRHeUF6?=
 =?utf-8?B?VmZqa3o2NVJ5QllSdVh5cnJMT2FqNGpRd2xWbGs0T1FiTmR3WEtjK2pqcEdH?=
 =?utf-8?B?Q3ZwTnRraXozaXdWdmxVcjJ6Q090czZjVmhENXBFbzc3LzFDelNuVE9hU3NC?=
 =?utf-8?B?OE9jTGhyUWlUT2M3RUg4UmU2dVIwNjVEYmJoQjRpdHZQMnBsazNMU1o2Zloz?=
 =?utf-8?B?ZHJHdlI1UElKUTU2U2lxK1JCWUh0Z1I2THQwemlEd083TFcwQTlycnlkOTBq?=
 =?utf-8?B?cU1wd0NDM3g3eUxjT2Frcmd3QVhZWjZtK09ZNjNoNGc2YWMrNVVVM0hkWDhB?=
 =?utf-8?B?U01Xc3l6QmVBaldSRmt1QUJYVUpKQmpTMk5WUjNDc2RCbVk1dmRIeHJMdzhm?=
 =?utf-8?Q?9Zyj/R38skZXMp5JwHVaCttqRBpwKuwF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWpFQml1dWhzcnVkQ05pWldudERJMHJoaXFkVVNwTENwRExTcmY4bWFWc05F?=
 =?utf-8?B?Vk1pZGJrRmNQNzk2TVlVTWMxRVc3aDRxdmhOWklTMHFEUVdHYmFLVStFUktw?=
 =?utf-8?B?K1JUQVRqZ2MvcDRiaUViS3phRlRTRk5jdU8zNXpXVHZNclRLUHJZMUg0VmdP?=
 =?utf-8?B?YkZrQ2dhNklmODFSYW56bGhNN2RQaTIwYjFyVEdxZzhWdWNXN2FZQzZUNmZu?=
 =?utf-8?B?RUxlVUt0ZHRsK0hBL01vRnlNTWphVHdWV1ozNXpNaWVXMXk1NkNJVDFTamZG?=
 =?utf-8?B?MXpVV1RKRlM0U1JlUGZ0b1NYcUZSUldPanJUdU41VW42YXRINVo2WE9uNHd0?=
 =?utf-8?B?bmVja3krd2VjSEJBczluNkppUFRtQitMaVJhRWlkd3BYczRGVWw5YVE1RThl?=
 =?utf-8?B?NGQ1VTlwTlRtZXZNWXpOQ1dqK0UyTUVNU3JNdGpxNGFpQVpReFpRZWNpVDcv?=
 =?utf-8?B?ODd5R1VENlg5eU9vZy8xT3hwT3VXbW1ic0JqczBHU25NTVFEaFlBN00wclJz?=
 =?utf-8?B?TCthMWV1a2Nua0tPOGNDdStBMm5OLzhzM1ZTMEg3QmxUVEllYVZORkpQZ3lt?=
 =?utf-8?B?VldHN0daYXlsVSsyQ285dnN3Mjd6c25ERGZUVkVsUE5USU9hUERxY25lb09U?=
 =?utf-8?B?UFdwdzlXYjZiL1BqMDFFK2djRFBDSE5sck5GRGQ0WFF6aWRYcUg3R2VCM1p1?=
 =?utf-8?B?Z2gyVjdjTXhJMENJRklGMitZM2xmRFhBMnJSRmluMDhJelcvU2VMWS9pZS8w?=
 =?utf-8?B?RG5QaVVTZWY3YktFRkdiaHZHVjMyNWJFcVlkOHc1YVgxdU02dGkrQlpWZmZn?=
 =?utf-8?B?cWo1TlhnL29DMGIwSGREdW9FMm1BWm9OSExzTEg1RXI3UHNSeHkzdkNLUkNH?=
 =?utf-8?B?bis1UngwMzFweVVvaDJLV2d4WUEwY0lta2ZxamVmelV5NW4yK3Erb2FZUnNV?=
 =?utf-8?B?Q1FlT21nb1BYNG9EZGIrRGtxZWdpbUZUK0ExNHM4cTd2a1FtVUErMG9MM1hR?=
 =?utf-8?B?djV3Nm90ZXFxdkF2OGMrMU44MlpvL1JWK05RSHVSQ0F4SndBL2hRT01yOWsw?=
 =?utf-8?B?ZHJZLzBPR21CQ0lRWE5uUHNUVHhkbmJrTGowNDVMTzluUE5jOTNCak9FU3hG?=
 =?utf-8?B?Vlk5dUc2aWNvZm5zNVVyNmhhNmI3cjhYVkF5K2JnL29wZjg3Rmp6Z2VDQnVa?=
 =?utf-8?B?aGRiYUlBNHg5OW9WQ0w4L3dEMFJ0VW01OWZSMkFUSkpyL2laUlgzenovREQx?=
 =?utf-8?B?QlFkSFFaUFp0Q3Awd1VYU09QcjFTa1VUTHZPN2tWSjBsaHVvL1MvV3Ewb05Z?=
 =?utf-8?B?WnlBSDdYK1ltU1hadVBVdkpCa0lCbkcyS1IxMzFlc3Z0bWk1U3dIclhvVnVh?=
 =?utf-8?B?SnRMK1hIV0xJdzVGQWEyZWpKU3YyK25nby9rL0p4TWVqajFrenVRSjJ2TzE1?=
 =?utf-8?B?bjNteWNzWHFZaTlCa1BNb1BOWVpGcGlXUlVDL1ZVRlJtMDdENkcrS0hWUFNI?=
 =?utf-8?B?dWd4cDhIMDZPS25obXFNYnR6VktheHhENnU5RXk4dWxUOStnaGp1N0tMYXc0?=
 =?utf-8?B?SWJieVBSQi9VWjA4bTFWTGZnZlhWSkNQWjE1UlFYVXJaaTNlMjlMeERick1Q?=
 =?utf-8?B?SDUvZWIxOFE1NWVxcTdyY2YyVFcvd0piWm9Ga2RWS0RaVlZMWlJHcnZITldN?=
 =?utf-8?B?SEJyZHY5ZzN0RC9XanA0bUJBNUcwN2c2QmFQQ2xZNnZwWW1Xc0FBd1lWUmNH?=
 =?utf-8?B?dHdkZzBHSEN4N0t6MGJIa0poRThUVTE0V21WMVpMc0tmUU1lUyttQng2MTIr?=
 =?utf-8?B?ZlBMeGczYk9YbWt4ZmgzeGZCeXBtRlQ3aWJEUmJHTXl3RkpJV1VNalJwOSs4?=
 =?utf-8?B?b3Y4UjBNVVVZTSthTVdnT0ZjUTA2Z2ZEUjVGZjNqMzR5Q2tLaEJMWVlQKzFD?=
 =?utf-8?B?REpGcWpLUFZVQ3JYNkRNbnJzWGs3MW5zOEhkd1BSVGwyQ2loeVdzUjRrT0Rr?=
 =?utf-8?B?bE1IdHg0QzIyc2wxQmhLQ0JUMngyZE5nYWlmUEVaUWVaTUNxQ1ZoZk5MKzBj?=
 =?utf-8?B?WVNnd1NOZ0FQeWlWNFd6dXdEME1Yam5kT1ZXRUpwN1RWbXVON0g2VlljNGZX?=
 =?utf-8?B?d0hoOWkyTGJrOFRHQ29KeUZqSURKbHFNamRjM3FZSFRCZ0p4bzJaNTg4eVNq?=
 =?utf-8?B?UHFwVGtQWjF1NUtrSmZHU3dlKzRNWmlIVlF3Vk1iRkRPakpxYVJITkI2MVV5?=
 =?utf-8?B?QndSTU55MkhUSGNSWkF6dFBjU1hGTWpiTnp2NEthVEplbmE2eGNiUHMwdE55?=
 =?utf-8?B?TkJkQ2czU3J1eWgzOWVzWk9TZ1hFM1lMeU51bjhxenZ1UUtxS2haOXBxWFho?=
 =?utf-8?Q?QdOapqHUUQ7Hh4fU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1191e4c-a1c3-4f53-f048-08de4f971fa5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 15:52:42.4614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVOZpMVH7DmcBwrhD6jlmzsMuQ7IKNss3uOAl9IrC54u771EEkjIwtTScR6gDQJw5SHQQCqErYNbS2YsyV+Ygal9QyLftTd8PG4WqIfNbdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6225
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

On 1/7/2026 5:13 PM, Daniele Ceraolo Spurio wrote:
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index a3157b0fe791..8ad27c884f68 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -414,15 +414,16 @@ int xe_gsc_init(struct xe_gsc *gsc)
>  	}
>  
>  	/*
> -	 * Some platforms can have GuC but not GSC. That would cause
> -	 * xe_uc_fw_init(gsc) to return a "not supported" failure code and abort
> -	 * all firmware loading. So check for GSC being enabled before
> -	 * propagating the failure back up. That way the higher level will keep
> -	 * going and load GuC as appropriate.
> +	 * Starting from BMG the GSC is no longer needed for MC6 entry, so the
> +	 * only missing features if the FW is lacking would be the content
> +	 * protection ones. This is acceptable, si we allow the driver load to
correct 'si' to be 'since'.


With minor change to documentation. (Can be rolled into next patch).
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>



