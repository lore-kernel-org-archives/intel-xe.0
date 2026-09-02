Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F645C624D6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 16:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B0310E04E;
	Wed,  2 Sep 2026 16:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QHzAG3yC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB8210E04E
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788366168; x=1819902168;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WI6qVInVVawrjoOKDGlYAPPZ4pQDJYK9YBAeEubJzQ0=;
 b=QHzAG3yCIXCCRz/VjpBo84L1up/UEwMRmn5RdFzBdgw9fWBGuWliWq7g
 y/sFnTAc+omfP1DvMyw8S+Uf/grkJUTpP5Ibm+9AI2pyTqJugJmd45nw8
 gs8OEgUMYNMtlaLJsDm8obZO47DvPpyxED980G51SyU6xSZIN5RgieuUh
 Alu/YH3BACUsTnwMZuF4PESSXkumTUj1xNPHPhkxW1H5HSHVOCXO6SR4f
 A1tnUj2h3c+uffRgq3lVP2uXLX0WQUU3TwzaHvduFyg9CO0n1bVWBO1YB
 5oSWYAG//nIStrqPU5myYSCluss9Ncp45byjvJSgg3CnRa3G1kp9YIy1w g==;
X-CSE-ConnectionGUID: ujjeC8bTSkS2FVlTzGO0mg==
X-CSE-MsgGUID: 8g4IwpuyStuPNFPcfKlPVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88881089"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88881089"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 09:22:47 -0700
X-CSE-ConnectionGUID: 5qDMCokXRJK1ns4BHkHC9A==
X-CSE-MsgGUID: 6Biq2K6ZQV6IqVT+8DIQzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="271424211"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 09:22:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:22:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 09:22:46 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:22:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRkAkynjOc8h8lAq2ptOPDAAqqmr23KfPBqetZhfE3TfC26t5CQSfOMsVuIyYhc+SEHze0b9sOk3mRcP0Rd5Gl/pSdsCbDO6V1yD3aF0tkw1VkUK2JEx1L3kCVGN6wQMVMTaQMIyiis4hqRpVvo+xpVkABDONB2uQG5Z+CbKajg6EUVxalaUSHw6UO1nIF2LWNLHPMkxXyQBx6fkp1xj37Punz6oDTzdBK0E4nBd/dwtv6zmLW42Ri2vttXy6YrZ8ZpKDQgObT3zkfJBcqGvTwgDHQ48MYGrTlqTV2GpkULicE2w1d3eYEfxVCIuPP5o9Gwn9VTik5OuDyx44yUBSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpPFjg51Xy38fdPRNRd7kuF1QfyaRTsov1UC26SFppg=;
 b=YttmhNtLFfZPABbXl2OxE5Az2tT2aKAxCSg5pWddUh4a08MgWO+vIfyrFE869FyNPji5YdP4RTGPuK5eTCZCVD7tq8vZKZdfwvp/qKaYD1ML6HecO9S80n4dIp5ifDPxCh1khIueEy3wJN1vmen23K7jUGIAA6xHRST4tQPrmH1yz4IoCbT+52AcHGNPACDS3v8JclwqDIgpN2rc+O7vtAqBy3wWVCyZ8GkuOQVxALR4CqtAejPqj/j07+QMIaidjrSbOZxQ5S+QE/m05VdR64y4fHJJszCBU3WraQi9DH2ApG+ClahfQpar1BfhxcjnaNT7TQ4Vwi0Z9tl/nfuiSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SJ2PR11MB8470.namprd11.prod.outlook.com (2603:10b6:a03:56f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 16:22:37 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 16:22:29 +0000
Message-ID: <48c21c94-d372-479e-9c80-c0b952bf51cd@intel.com>
Date: Wed, 2 Sep 2026 18:22:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] drm/xe/sysctrl: Improve firmware response error
 logging
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
 <20260831104456.1770605-18-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260831104456.1770605-18-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0006.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::16) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SJ2PR11MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bbcf1c9-6eca-415f-a140-08df090e621a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: sSAW/ErfiL+m3TZQSomGr6S0MMUZWDdXK9IDOXbs5jb5D3I6pPePeefFMmh0rjFzoIXDB9CNQSHJg9wScyzred6IgvSEMdjtXsHccbMHWnZMr0ZneBAwg6F52KU5rOULYFmVQkrZw5H4z0FM2YsnHaQhTzAxJzTedlwMSEPHy4FOZABigz5CLrASvXn9tDP+atISvI7xFReq16QuIVTk5Mv0uDlRnnIHlUhneVNo1tdgGpWesBVIIyRkWTLdNKHBqKK4op8xhSrWb8niQkMLuHmX8VRctX3QZ/Uz9GoZU+8e1cIfI9TVQhIspgnvNha4bI9n2cOI5I+U1SB2uK30/9HIGCi44bZ3RHXVzAjvrWsS7ztT447nGZ1766lLpuVRHMcrH+Ma5Kmp2swel1dQvQszqJ0kewLqFZlV5SySy7U/TlUu/pSsQn6qpOyTepvVDqUDeHXxh1vDe7d0g6Ow1PXcUw7kXujT2x9PawLVizXCdfK2x/rXyZIh3GBec+2NIjVbV8HRDgGl2mvsdY4S/Pwf8PK6oezExCjBHrPHeIiVlDvJy+wgi+wPn61/2p3cJxlwoWwCfI44TEEvL61Ido1n4Hz726tatPbCtktUVeRKFbfAFB5VHq+/1XaeZsZVxbasiT6QQvypXWUvz5j4l7yblQsNHjBSIlJOAYkNAj8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEV4KzkyU0xRUjhyTTZDUWRoWGtlTmdqaDh3UGNseWNkOUtDZHMxOEllejNt?=
 =?utf-8?B?L3ZweXNGdFVqZWYyVjdXZjRaajd5WTB2R1RMalZtYXJDSzgyc3U0T0lMVDVR?=
 =?utf-8?B?TjhZVnVqUXVIMHlDTU9nbDltMWFkTERab2hhMkVJNU1ubFpTWjRzQUlZOWhP?=
 =?utf-8?B?dE9qbTFBTllYVDk3N3U1ZVNvYi9rdnJ4QVpGb2JUUjNoazY4Mkxic2VaR00z?=
 =?utf-8?B?Q1Z4ek9lV1hmMTlYUk1KQnBjR3dyOEhLWWRsR2hSWi9XVkZBbUY2emhsTUpz?=
 =?utf-8?B?WG8rcVRLc3RqNzdJU1BFclVOQmRiT1o1ZEQ1d3Vqd2wwZjEzTFBTRGNNNVZQ?=
 =?utf-8?B?T0pvbEdnTTE0eVVHdlVWb1F3MDEzTTRHQWZLVUtQYWRrTFVEbUxBdjlJd00y?=
 =?utf-8?B?RC9SM2NHcVVqd1c1ZnV3TDMyWHpJYVgrT21pK1ozMnpiWmVtMVlOVjV6YUIv?=
 =?utf-8?B?M1k4M1ptVE14bWFha2JnWUZqdHVEaEplVllEdjdnMzNjZ1pVZlJQVFViODdR?=
 =?utf-8?B?Kytaem9jM2lyVFZoK0RmZnBZTGt2STBVM1FibFpRTk9iMnBOcXZ2eTZRQjBl?=
 =?utf-8?B?RmVYYUVIZ00wWU5kS29RaEFaZ3M1dzNjZGVOZXcxWHVFVmNYaXpRd3VOZ2Rq?=
 =?utf-8?B?UEhEMjBRMzBYRGVISXA3TEo2TzBtTzdGanFJa2RLL01ML0w3NGlURmNyV0xV?=
 =?utf-8?B?WXd6Q294U2hXMnlZR3U2eloySjdTSUpXc05oYjFiQzBUQzIzamtrRGtKSlJ1?=
 =?utf-8?B?UWlWa1UvQjRQVHJjQktWUWR2UW1LdDA2WHBJUnR6UUN4UXp6UGVNd3V3bloy?=
 =?utf-8?B?cGM4dTVqNXBrWkdkTUZpeER0U2hNWVZNbFdzR2pSbnk5SitNZ2hOQi9uSE9w?=
 =?utf-8?B?L1N1S091aGY4Qzh1VlR2bjFjWjY3dTlLNCtiRVdBVnJYWkhsRVhJY2VDdG1a?=
 =?utf-8?B?MUYvQ2tJOGRyODRCZXJ2Q09GWEtRMFo3dGFjeVhrSXEwUjMxMkhhK3ZGTEtn?=
 =?utf-8?B?WkxTY1ZPeVlRRXZETUdvMDZYZHIxbC9PSWc2bFpwZkJncURoT3M1NFRORW1r?=
 =?utf-8?B?aHBLYysxTmR1clFPZkNUMlMzT1BuTmNxNy9VamFBR2JqOW5KWHhTSmdSMzJz?=
 =?utf-8?B?Mm5rV0NuMkZmdXo2WDlVQjlmUkVRSmdHQVBLK1FDa0JtNzdXM0F4MTk5SE5x?=
 =?utf-8?B?Mm1abnUwU0FOblRCb1FET2s0bEVjd09pTkFPZlpXM2gvSW94WWNJL2ZMdDVF?=
 =?utf-8?B?OVpsYld0YjU0TjNNYXNPeTAvU1hkamdlSFcvcXV3N05yZzUvbDVNY1NWdnp5?=
 =?utf-8?B?V3hhdmNMUWl3VVh2L2dvaElFcjV3Y3NUU2NjMkFCTWlRamp6WThFZzF5YjBs?=
 =?utf-8?B?L2hveXArUUVjdXB0UG1VOHF6NGY2K3oxaDlpSWovNEVJcCtBUUtIZ01DV1pG?=
 =?utf-8?B?Ukc4YzlQMEtWaytSK1BoQVl5Q3hCandLdC9ieDlMMGFxN0FJdlZEOGF1cDhn?=
 =?utf-8?B?Qnh0cElDL2ZiQ1Fuc09WeVVUd2xiV1lEQnRsYWdCRHpyYU9raUxuK1JqM2lv?=
 =?utf-8?B?WkM3UXpQaVFmTlV5Ykx3cUFtMUdWOGhYb0c1TExKYmFNT3UxdzBGVURkenNH?=
 =?utf-8?B?VnFiM2QwMDB2NTk0SHRvUHRpN3BWZFl1S0cwc0w3STJtQ1R6QU8vQUJ2aHY4?=
 =?utf-8?B?c09sYVJDRE5pMzkxY0FYeEdBQlIwOElZc3A2bUxQYXR0NEJQWkg5MmZrcVli?=
 =?utf-8?B?TkYwbnBNVExQemNwSjNJeFBxNXdsSmtUMkRmN0tyRDY5UWJIbXZFMWQ5ZlZL?=
 =?utf-8?B?NzIyaTMyRkdnaVJJdzF5U21wdzJIT2RmdFh3ZGVUWUVHS0QxdWoxbktHOFFa?=
 =?utf-8?B?VHZCNDVIZzdBTSt6dThmakkwY0k2Z0VkbXRaRERPaHU4aTVTa28wb2lVdXBt?=
 =?utf-8?B?dDdYbUV3a1lpS0QxS24wWWNCOHpJd1hpajlISEI0S1VROVhBRGRtU3BTR3RB?=
 =?utf-8?B?YVNpaTN4YkMxdjBvVlJPM2VMZnBFSDRMb205ZlBWRnJXMUZ1KzFpYkVnWkxs?=
 =?utf-8?B?V2prRVlmckZhM1NhV3k2WmE2QWdUMlY3VkxGa3BPeEltaUlkN0VoYU42a0FD?=
 =?utf-8?B?QmdXQ01FcmdqOWRvVWNHc3U3c1VsU3ROblRVODJRbDJkd2J4elJ3SFVEdUEx?=
 =?utf-8?B?TmpuSi9qYXIwYjV0OFpOaHV0MG1vdVdJSEQxZjlwMkZveGJjTGYrRmdOWlpU?=
 =?utf-8?B?Vm9VK0U4S3VxUjBpRG9VR2tLTk42NEJQRENCRk9SdENsNW9wUHVtVGRZYldJ?=
 =?utf-8?B?c2ZFSXIxNStMS095QSt5bklsMDl6enNWazI5S3RtVHFtL2Vxb1RmaHZ0eGRJ?=
 =?utf-8?Q?JnU7wMMkf+sbVG5o=3D?=
X-Exchange-RoutingPolicyChecked: n06Hn1eyaABYr2vIJHC7jjhRVxE9TxLUNyvIlFrEi8a10I0+Gu49Mi8wIIJaVg2mNAQ44Hbltr5Qljz6l9Qqem7fnjxCbNOVNtJWLPt9rECS8nCkU9Rs0dBT8DHZ7Lqs/9fg30zM0Qc3G9RIGNds+pDaSZI65VfvLnfKjopr5SmSo2GB7BCh8igmqmlYEaD6FxlMQpVufACYAFl6stzNu3X3oj133P1jn0G8E5o6X8uvrcsbisao8H8l4U6wdSndsJWRvRwE6wd8Xvb/Q8GbU3Lrh/Hy0jvW2CbEByJnmih19Mbg6+QT01qbHE6/R6Y81aj9F1DsR+G5490v7IkNLA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbcf1c9-6eca-415f-a140-08df090e621a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:22:29.2786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFoIhKMU6Db2hX+mxvM3+fTZT8qhGc/lrPwm6C6ME+bmLPGOh9VK4WdnNnDQJjQtQ2YarVjHgBqPMPbo7T5Yvl+dgSJJPPUL7CjjZDky6PE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8470
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



On 8/31/2026 12:45 PM, Mallesh Koujalagi wrote:
> Use xe_log_err() helper and include additional details when a
> response header mismatch occurs.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v5:
> - Use %#x after REG_FIELD_GET change. (Michal)
> 
> v6:
> - Move REG_FIELD_GET to different patch. (Michal)
> - Update response message.
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 3aa868f60b38..87e656820279 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -233,13 +233,15 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>  	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>  	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
>  	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
> -		xe_err(xe, "sysctrl: Response header mismatch\n");
> +		xe_log_err(xe, SYSCTRL, -EPROTO,
> +			   "Response header mismatch: %#x != %#x\n",
> +			   le32_to_cpu(hdr->data), le32_to_cpu(req->data));

nit: do we need this le32 conversions when we print both raw values?

>  		return -EPROTO;
>  	}
>  
>  	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
> -		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
> -		       XE_SYSCTRL_HDR_RESULT(hdr));
> +		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x\n",
> +			   XE_SYSCTRL_HDR_RESULT(hdr));
>  		return -EIO;
>  	}
>  

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

