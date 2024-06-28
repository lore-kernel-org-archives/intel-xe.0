Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68845C30658
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 16:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA0010E03E;
	Fri, 28 Jun 2024 16:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="miqwRrAS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFD010E03E
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 16:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719592582; x=1751128582;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SfziYL4EtimOy+KIDzX46TQA9xN0KA6Kd+8oCeR9RoY=;
 b=miqwRrAS0b0gy8K9itmdcgMgmp8rRTdwWgNoKaT8sGn0I9qMBbNvwHi3
 c9h6zMNWx5SQ6wu8SjhIca8a2y0BRPUdFRv1mbUipsZOAeBeYE7oFGL4+
 HYe1wSUNWK5IJHbju6AZSloYpCuoBQ75b+ykR6YariNJjz9u6wUAQ5x23
 zh730JYTKbpSHEOcWajCM/57s8v37vRhEUb+b6TM6cijvnwHBdozg9QxY
 nEx0T4BnQmPOR0Toh30zjBlu+5gCa2pFwOAH+tr/kEH65SJSWqVHQLH6f
 JQv+tKQC/zyRZDspxP55dBmJQoaqAFJO9nlM+qHgOuMwIfFF6vD7vHx/k w==;
X-CSE-ConnectionGUID: 2LB/H10IREC1vN8KHJydHw==
X-CSE-MsgGUID: uL9SS/PZTzCy0yCoSr+XIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="12303877"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="12303877"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:36:21 -0700
X-CSE-ConnectionGUID: 78NXJZOkToGYvx/JhT9WZQ==
X-CSE-MsgGUID: x4kuNCSuQ06htgo+FwbnvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="49261483"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 09:36:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 09:36:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 09:36:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 09:36:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 09:36:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcJhq8QPXwxfes1qPVLVHnhUD5fsq+mssRT+Ee0V+MOhr6J92mmwzEKwaN9AJPzicXU3QEWRVIDs7OMbAjNuIJxe+eY7phCcuMdPygLiyAD3+5tvRhxi9/VvMNAHVQvMuoeSWJL7Vf+utQsZbV3EsCgljghax1exQ9GoPCDlv8KVJENaCzPIBESu7KzgODv3WNyAcYYMwpbgd70trC2Jenr8PIXQjxDT7q5DYltrjkS/qjd+UofkKOFUjQfwCUsH/nZcbw5kfzkS14NjyD0jNltm5sletgQfuV8c2GT0lUeOpPeSHwtS9dpSQRzt5+nLc/1lwN76TLCnSZSzJD/88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rnn4wMDdJMrYVhBx7FXXcvWBz3lztuQ/8LxN6lDGf44=;
 b=fI8YlRkRws+urjf8iGJPhxWLJmD9C2njnwx5CySsFJhiWQmiSvEBH9g4/DeSE38T+KjFSopkkrAReC4WT7SXwFVJfJAknx1UYy1xii4t/cl9+hW9QHJm0HjlF5ToA04ujm2aAYhbMeolTmRg2JzBMkXmBXlcmcrQkNwCAJYHB2stWIflQqBXAoKN+Vs+BzOHTcqGDV9incJiUfm08z1g9CexXLZ1/uCxKnyL2YjW5gAFmKBB6oykFykpfyg0gNeyKu1mw4/GP8A/nK4D5fRVPuNkHNvsgU49J7P/SDFYFjPekE2NdMISH0+r0PXxHg/dDq66NMlXNhOikkYyB+5eIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 16:36:17 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 16:36:17 +0000
Date: Fri, 28 Jun 2024 09:36:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
 <rodrigo.vivi@intel.com>, <krishnaiah.bommu@intel.com>,
 <lucas.demarchi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v9 2/2] drm/xe/pmu: Enable PMU interface
Message-ID: <Zn7mfmm3KGB5uDDB@orsosgc001>
References: <20240613100411.1579218-1-riana.tauro@intel.com>
 <20240613100411.1579218-3-riana.tauro@intel.com>
 <ZnSIZf4PIW9CL4LQ@orsosgc001>
 <9fff12e4-a577-4a37-a9ab-55dc8e8ffbf0@linux.intel.com>
 <Zn2NyxfoHNByLv95@orsosgc001>
 <888bf4a4-77eb-49c4-b8d2-b3252f32a64f@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <888bf4a4-77eb-49c4-b8d2-b3252f32a64f@linux.intel.com>
X-ClientProxiedBy: SJ2PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a03:505::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BL3PR11MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 0458dea0-c0a2-4076-9905-08dc97906ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akhxU084aHU3MTllMXgvRDNQL2g5NzFRV0lGbXBodkViTy9qc3hSR0cxQTVm?=
 =?utf-8?B?TmlBalFJcXlkZEdZUnZFelV2bGZ3c3FOc2t2dzd1bWdxSnZKaXlRWTdiVk9Y?=
 =?utf-8?B?UVJjZ2pycVhIWGF0K29rblYrbWxyVHBIS0dvTUkzMEhjMkplbE5rMktpcWhj?=
 =?utf-8?B?NThSUmRDeFBJcVlCMUJjWlV0SVdHVnV5SzNXUEZNYXhQS0xoZUVLN0JkNFVo?=
 =?utf-8?B?c0pkLzhEblI4Y2xUUytXMnF0VzhGaDVVSnNrSVVGR3R3eWRFSnJNbUU1ZVY0?=
 =?utf-8?B?eWF5dzBuTUd5bEFQSHRmNnJsbldWT0U4NjRSdW80VEJteTdXMEw4Mkh2Z1JZ?=
 =?utf-8?B?YW9jKy9rY3Z6cWZTR1pVVURiaW9WaElyUlg2VzZPbDBSTGlWVkVJMWtUcElN?=
 =?utf-8?B?dUl1TU53cjFCOXFYWUZPSEwwV3ZEcVk0bFpSRGVrdlFEbGZZWU94U2pBcFI2?=
 =?utf-8?B?VEltUlNlR0laYlBmYnR3c2c1dG9EZWNEWFhsd3pYSVR5cmtCdCtvZjQ5Qlln?=
 =?utf-8?B?eXZEaERGK2JpMFYxZ3Y0MHR6RFVQQmc2eFdQZGxrNUgzSDJCUWE3T3dFWjJV?=
 =?utf-8?B?eUhlcXNDRklpcGdaUU9CNFd4TWZNdFJSZENxTnlJbGYrRHh3NHBVRElXRE05?=
 =?utf-8?B?WUJTNklnbDhwMzRaWlUyeGp5ckkzc1c3T0NhRFp5TTRRL05IaDFBWW96ektv?=
 =?utf-8?B?ZVFoRnRHN2ErMGo3OFAwb011dnBxaloyUkhEM2tpY29GUUxGVXdDOURNWXQ5?=
 =?utf-8?B?MHNTL0JCTmVRZGcxMzBpdTF5RHhWMkxvVWZ0WCtFQW41azFPV2NDSmEzNHNv?=
 =?utf-8?B?TUpCVUdMVTNQWklMcGhvclRkUTA4ZG8rVHZWSTJYNHNuMEJUdjJEckJzbDZD?=
 =?utf-8?B?d0JsOHZWZ05ienBXVm1DUTFZckFiVWQvVjNXTEQ3Zm5mYjJDWnFZdnM2SGlE?=
 =?utf-8?B?YUtwNlloM3BLalR5TncwMkxJdnJjaFhUdVlMYXVqa2R0QUFTSjR6ZTRkeFJ4?=
 =?utf-8?B?aENPNDhWejJ5cXNSMjN4OWZ3bTNhUVBQeDFFY1R1TmcwaHI5cytzajJqWWNK?=
 =?utf-8?B?QXdzUlhSUHRzbXNyQXZvTnBPdjRwZlZGYkx5RnI3SFMyUmVBamNYWG8xR0Rj?=
 =?utf-8?B?NmV0THM4bk1QcWFSc3dhbHZXTExBUFVlaVpTcUgzdThNemRkTFBFRzdkOE1D?=
 =?utf-8?B?aDR2T2pDQVBpd2FiemNjcVhIdnVUQk00YWIxQWVVdk9TUEVmZkZRNUlqZEtE?=
 =?utf-8?B?TUptbVZvT1VESnd0c1lRTHBHTXBvaTk0Y09vMjliaGdRMjBsR25RNjlxTFJu?=
 =?utf-8?B?dWpwcGlCOGdlQm9kd1RURW9vUG15S2pGQXQzdjFKUW5id2RqYnpYZVUrVlE2?=
 =?utf-8?B?b2s4NlI2aTcrbTRRaVgzZk5CdXZCWDNYTEdub3MrbDg1d3VmZlRYUmdMNUxp?=
 =?utf-8?B?ZHdTaUh5V2tDbVdWcGM5UUZnYkh6aHBFMGozNjk1NGYyeFdnS0R5RGlwN2F0?=
 =?utf-8?B?SW5zWVAvaDUrNGdYYUYyK1hxRFF1M0FWdjlBZlBMNWo4aGtJR3c1S295OHo1?=
 =?utf-8?B?UFlUMFQva252Ym5EbktRS3dHWEM3Smw0WUs1bWZwNDJEaitBN05ocEtPQ1VJ?=
 =?utf-8?B?akpXS0MwdkNXdUwxMTgwZE1IWVFScFhFSjV4UFZkcUNkd01wU1l0KzIxUHRT?=
 =?utf-8?B?V045NUVGUXFuSXVTS2VORVhUYUNwaGhUYXg0VmMvaTJXTHZ3Nnp0SExTS0d0?=
 =?utf-8?B?cHpCMVBDdWFpTGVKeWY5TEtlcjFwRFpOOTJGVmR0cWxGL2J2SkNueUppbnRw?=
 =?utf-8?B?THNkWkJseW5uS2FPR3RxZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm10Yi9MTXgzaDRtZDZEdU9WWHI1ZTR6eHpXbnNwTGJVbUF0K1o4NW9mWFJ2?=
 =?utf-8?B?NDJFNVV4ZktRR0pOYWU3Q0pPWVo5RW1ycUVhRG9oZlR0U1hSZjlueTVrTVZE?=
 =?utf-8?B?ODBqeStvMTRrREI1QmN6dW9waS80S3VmVnAwclRqNUJsOVR6OW5RcGM3SWZY?=
 =?utf-8?B?SWtmUHVYaUtXMEVnMlQ5OG93N2xucHp3YWl0R2gzWE5YUGQ1WE5ldUFFNWJO?=
 =?utf-8?B?WE1CZUloRmZoajJGZ1ZQSWpoRTNiV0NTMjFwRW5DK051WHpRWUNhb1JaL3Z4?=
 =?utf-8?B?eDFOQk56YXlYWWNtOUlVUnNGRmFnUmF0cUppbmgzY05VazBVQUNqMUNyMXUw?=
 =?utf-8?B?SHk2SzM4L21sd2dIcEg5bitDa1BPWTY4aFo5OGJHMXI4ZS9yTDhqYVZPWHdm?=
 =?utf-8?B?TVhTNEU1cU5vRzY2WFdZd3pDdGxaRExieEF3NjFvdldSK2RtVmljWmM4RlM1?=
 =?utf-8?B?ZlNTMUE1czBPYlpnNUU5MTRnaUxUMTJ3NVRneWxTYmlMQ3R2SnczZVJDNmRk?=
 =?utf-8?B?d0R1bDZpM0tTTlZVWXhuVVAvWDJrcXRHWUtvZm9OZjQ0Mzh6bEtvSUdyb3g5?=
 =?utf-8?B?MFFBSDE0aitHa1lHQ1o4Z3VYWlBGYnFJU0pqVWlxY0Y4NDlJWkREVTgvbXhh?=
 =?utf-8?B?eXBodzg3MDRpc0trcjRpMjIrNDhjL0ZVRGhoSVZyMllkUXJYamlyNEV2cGk5?=
 =?utf-8?B?UGhPaldYZXplUnp5OTZHKzBORW9jK1JIaEhsaHNsaFVzYkFFbnlsd0JualVP?=
 =?utf-8?B?bzk4aGl0OUt5TC8vSkl0bFNhWDA2VU93c1RxcTJBTW04eVdGZHROUElEWU45?=
 =?utf-8?B?UGp1ZzFXeVlHWjJWSWtaalpiUWdCbkFTN1RNeUNtQVFKWXc0Q0t3d1J1Y0xG?=
 =?utf-8?B?dE8rMGo3QnRyWCtxYTdzbm84ZUhiZzVlNFdjSEhWbzZpazVHKzJuUGoycGdF?=
 =?utf-8?B?MzYwaGpXZmtxTnhUTjg3OHphZUE0bUpsWkcvTDNoYlFaMlROblY5QW5tcjRN?=
 =?utf-8?B?cGFyNXU1SDNQU3pGSUFqU2YzMU00VlZNSjZjaSt5aDBZYTZEaWJXbnNTdEcw?=
 =?utf-8?B?SjdSZDVaQlllLzNqNm0rUTQxMWtkV0ZZOW5xR2EwaW5ZUDZnYmhhUWtOSUhv?=
 =?utf-8?B?b0ZhYjM2dis2TFB4Q1BYUDdsU2RpUjM4QmN4TkdPS2t6RE9Pb3Y2V0JZODNs?=
 =?utf-8?B?UndjT3Vibm92OHVQei9NVHFYbytlK0tpSmt2aWlBLy9aSi9PUjBPYXJKM0F1?=
 =?utf-8?B?UnNSMG11Z1hHektibnY2T2wwK2FSYTd6eEtYRmJicm1tUTZzMngwTkxKWFV6?=
 =?utf-8?B?dXBiS2ZQUmY4SG9yVk9CR01uK1FMMjcvMVl5SnlYMDJkQSs0REdUcUEzOUNX?=
 =?utf-8?B?S0I1bHpMRW9uanppc0FQN3dVYkhYbFFaM25Mc2lBWnZMemdVeGd2eXphaTZW?=
 =?utf-8?B?NS9IWHVtYVgzMTZNcjVyWkhETjV6dlB2TjlDRXFGVVJ5SG5XcmZSTU1PSUlD?=
 =?utf-8?B?MG9uS2swRVBRQUxzdHNJMGhBZjlLdndUNFRuSWFvNm0zZDZEOFBveVpDNW9I?=
 =?utf-8?B?RU9oY1FZcHJ3Rkx5OEpaNUQvNjdnMGtnY1EzYStQZXBBd3JiRENUcVUrTVdk?=
 =?utf-8?B?MzNkSThRTUhtOHVncUJRL1FHV0p3dHJESDJxb0ROd01xKzJyT0RaTVhWdkF3?=
 =?utf-8?B?amI3T3NtYVJNRDQ0Q21vNDlhWStQdVc5RDBQTTBBNkRBTmxSVTNMdEpOREUr?=
 =?utf-8?B?S1d4ZjdzSlliOUtheno4K0plOEZ4ZksreFFYYUhXNTVPUXplK0R6ZG5HaWpU?=
 =?utf-8?B?bkR4aWQxN05oMGt3Q1RGL2RpVzllZXE3b2tyL2wvdC80UVJlTDNOa2ZJTWJL?=
 =?utf-8?B?YTlHZGdOZlFaVTBScTJrbkNQQWhVbTlJNjVuai9FZ2xkTzhvZEdhd3dXQUZP?=
 =?utf-8?B?cTZHaCtuSkc2dUNPTFk5aGJiUGpVMzU4ak0zTkNOYnZaWTNGODA5dFk1b3Jh?=
 =?utf-8?B?YlVVYTdGSzRmMXhzd3VxSGNTRTRpWVVjbkhmWUk3V3ExcStpTjVpTHF2Wmhr?=
 =?utf-8?B?SFkvSlVTR3pucG83cXNSODBlV3ZFRnZ2ak9DaHJMSjg3c3NBa2w3R2JCS1B3?=
 =?utf-8?B?ekgyT0VSZmlLU2d2akl1TER1QWhkKzEyNXJ1MmduZHhjQVdqNjBKWWxmS2xa?=
 =?utf-8?Q?8B/Z9cV7ATBFG5kQLGOs+Fk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0458dea0-c0a2-4076-9905-08dc97906ed3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 16:36:17.2575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dd2toRPijlkiAhamenNCwJiYs2Jw6t72aDNfFZYj7DExsw0CpKo7MrJNm9Oot5dgW4tt//Ly3ZQRDbV3821TxGooV1wVyeeK+IApU4NhZhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6436
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

On Fri, Jun 28, 2024 at 03:11:02PM +0530, Aravind Iddamsetty wrote:
>
>On 27/06/24 21:35, Umesh Nerlige Ramappa wrote:
>> On Thu, Jun 27, 2024 at 12:19:44PM +0530, Aravind Iddamsetty wrote:
>>>
>>> On 21/06/24 01:22, Umesh Nerlige Ramappa wrote:
>>>> On Thu, Jun 13, 2024 at 03:34:11PM +0530, Riana Tauro wrote:
>>>>> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>>>
>>>>> There are a set of engine group busyness counters provided by HW which are
>>>>> perfect fit to be exposed via PMU perf events.
>>>>>
>>>>> BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
>>>>>
>>>>> events can be listed using:
>>>>> perf list
>>>>>  xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>>>>  xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>>>>  xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>>>>  xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>>>>>
>>>>> and can be read using:
>>>>>
>>>>> perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
>>>>>           time        counts unit events
>>>>>     1.001139062            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>     2.003294678            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>     3.005199582            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>     4.007076497            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>     5.008553068            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>     6.010531563        43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>     7.012468029        44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>     8.013463515            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>     9.015300183            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>    10.017233010            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>    10.971934120            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>
>>>>> The pmu base implementation is taken from i915.
>>>>>
>>>>> v2:
>>>>> Store last known value when device is awake return that while the GT is
>>>>> suspended and then update the driver copy when read during awake.
>>>>>
>>>>> v3:
>>>>> 1. drop init_samples, as storing counters before going to suspend should
>>>>> be sufficient.
>>>>> 2. ported the "drm/i915/pmu: Make PMU sample array two-dimensional" and
>>>>> dropped helpers to store and read samples.
>>>>> 3. use xe_device_mem_access_get_if_ongoing to check if device is active
>>>>> before reading the OA registers.
>>>>> 4. dropped format attr as no longer needed
>>>>> 5. introduce xe_pmu_suspend to call engine_group_busyness_store
>>>>> 6. few other nits.
>>>>>
>>>>> v4: minor nits.
>>>>>
>>>>> v5: take forcewake when accessing the OAG registers
>>>>>
>>>>> v6:
>>>>> 1. drop engine_busyness_sample_type
>>>>> 2. update UAPI documentation
>>>>>
>>>>> v7:
>>>>> 1. update UAPI documentation
>>>>> 2. drop MEDIA_GT specific change for media busyness counter.
>>>>>
>>>>> v8:
>>>>> 1. rebase
>>>>> 2. replace mem_access_if_ongoing with xe_pm_runtime_get_if_active
>>>>> 3. remove interrupts pmu event
>>>>>
>>>>> v9: replace drmm_add_action_or_reset with devm (Matthew Auld)
>>>>>
>>>>> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>>>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>>> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>> ---
>>>>> drivers/gpu/drm/xe/Makefile          |   2 +
>>>>> drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
>>>>> drivers/gpu/drm/xe/xe_device.c       |   2 +
>>>>> drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>>>> drivers/gpu/drm/xe/xe_gt.c           |   2 +
>>>>> drivers/gpu/drm/xe/xe_module.c       |   5 +
>>>>> drivers/gpu/drm/xe/xe_pmu.c          | 631 +++++++++++++++++++++++++++
>>>>> drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>>>>> drivers/gpu/drm/xe/xe_pmu_types.h    |  67 +++
>>>>> include/uapi/drm/xe_drm.h            |  39 ++
>>>>> 10 files changed, 783 insertions(+)
>>>>> create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>>>>> create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>>>>> create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>>> index cbf961b90237..83bf1e07669b 100644
>>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>>> @@ -278,6 +278,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>>>>     i915-display/skl_universal_plane.o \
>>>>>     i915-display/skl_watermark.o
>>>>>
>>>>> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>>>>> +
>>>>> ifeq ($(CONFIG_ACPI),y)
>>>>>     xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>>>>         i915-display/intel_acpi.o \
>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> index 47c26c37608d..22821dcd4e1b 100644
>>>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> @@ -390,6 +390,11 @@
>>>>> #define   INVALIDATION_BROADCAST_MODE_DIS    REG_BIT(12)
>>>>> #define   GLOBAL_INVALIDATION_MODE        REG_BIT(2)
>>>>>
>>>>> +#define XE_OAG_RC0_ANY_ENGINE_BUSY_FREE        XE_REG(0xdb80)
>>>>> +#define XE_OAG_ANY_MEDIA_FF_BUSY_FREE        XE_REG(0xdba0)
>>>>> +#define XE_OAG_BLT_BUSY_FREE            XE_REG(0xdbbc)
>>>>> +#define XE_OAG_RENDER_BUSY_FREE            XE_REG(0xdbdc)
>>>>> +
>>>>> #define HALF_SLICE_CHICKEN5            XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
>>>>> #define   DISABLE_SAMPLE_G_PERFORMANCE        REG_BIT(0)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>>> index 64691a56d59c..bb00c8c9ec9b 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>>> @@ -668,6 +668,8 @@ int xe_device_probe(struct xe_device *xe)
>>>>>
>>>>>     xe_hwmon_register(xe);
>>>>>
>>>>> +    xe_pmu_register(&xe->pmu);
>>>>> +
>>>>>     return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>>>>
>>>>> err_fini_display:
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> index 52bc461171d5..a5dba7325cf1 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> @@ -18,6 +18,7 @@
>>>>> #include "xe_lmtt_types.h"
>>>>> #include "xe_memirq_types.h"
>>>>> #include "xe_platform_types.h"
>>>>> +#include "xe_pmu.h"
>>>>> #include "xe_pt_types.h"
>>>>> #include "xe_sriov_types.h"
>>>>> #include "xe_step_types.h"
>>>>> @@ -473,6 +474,9 @@ struct xe_device {
>>>>>         int mode;
>>>>>     } wedged;
>>>>>
>>>>> +    /** @pmu: performance monitoring unit */
>>>>> +    struct xe_pmu pmu;
>>>>> +
>>>>>     /* private: */
>>>>>
>>>>> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>>> index 57d84751e160..477d0ae5f230 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>>> @@ -782,6 +782,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>>>>     if (err)
>>>>>         goto err_msg;
>>>>>
>>>>> +    xe_pmu_suspend(gt);
>>>>> +
>>>>>     err = xe_uc_suspend(&gt->uc);
>>>>>     if (err)
>>>>>         goto err_force_wake;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>>>> index 3edeb30d5ccb..26f814f97fc2 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>>> @@ -11,6 +11,7 @@
>>>>> #include "xe_drv.h"
>>>>> #include "xe_hw_fence.h"
>>>>> #include "xe_pci.h"
>>>>> +#include "xe_pmu.h"
>>>>> #include "xe_sched_job.h"
>>>>>
>>>>> struct xe_modparam xe_modparam = {
>>>>> @@ -74,6 +75,10 @@ static const struct init_funcs init_funcs[] = {
>>>>>         .init = xe_sched_job_module_init,
>>>>>         .exit = xe_sched_job_module_exit,
>>>>>     },
>>>>> +    {
>>>>> +        .init = xe_pmu_init,
>>>>> +        .exit = xe_pmu_exit,
>>>>> +    },
>>>>>     {
>>>>>         .init = xe_register_pci_driver,
>>>>>         .exit = xe_unregister_pci_driver,
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>>> new file mode 100644
>>>>> index 000000000000..64960a358af2
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>>> @@ -0,0 +1,631 @@
>>>>> +// SPDX-License-Identifier: MIT
>>>>> +/*
>>>>> + * Copyright © 2024 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#include <drm/drm_drv.h>
>>>>> +#include <drm/drm_managed.h>
>>>>> +#include <drm/xe_drm.h>
>>>>> +
>>>>> +#include "regs/xe_gt_regs.h"
>>>>> +#include "xe_device.h"
>>>>> +#include "xe_force_wake.h"
>>>>> +#include "xe_gt_clock.h"
>>>>> +#include "xe_mmio.h"
>>>>> +#include "xe_macros.h"
>>>>> +#include "xe_pm.h"
>>>>> +
>>>>> +static cpumask_t xe_pmu_cpumask;
>>>>> +static unsigned int xe_pmu_target_cpu = -1;
>>>>> +
>>>>> +static unsigned int config_gt_id(const u64 config)
>>>>> +{
>>>>> +    return config >> __XE_PMU_GT_SHIFT;
>>>>> +}
>>>>> +
>>>>> +static u64 config_counter(const u64 config)
>>>>> +{
>>>>> +    return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_event_destroy(struct perf_event *event)
>>>>> +{
>>>>> +    struct xe_device *xe =
>>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +
>>>>> +    drm_WARN_ON(&xe->drm, event->parent);
>>>>> +
>>>>> +    drm_dev_put(&xe->drm);
>>>>> +}
>>>>> +
>>>>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>>>>> +{
>>>>> +    u64 val;
>>>>> +
>>>>> +    switch (sample_type) {
>>>>> +    case __XE_SAMPLE_RENDER_GROUP_BUSY:
>>>>> +        val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>>>>> +        break;
>>>>> +    case __XE_SAMPLE_COPY_GROUP_BUSY:
>>>>> +        val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>>>>> +        break;
>>>>> +    case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>>>>> +        val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>>>>> +        break;
>>>>> +    case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>>>>> +        val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>>>>> +        break;
>>>>> +    default:
>>>>> +        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>>>> +    }
>>>>> +
>>>>> +    return xe_gt_clock_cycles_to_ns(gt, val * 16);
>>>>> +}
>>>>> +
>>>>> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>>>>> +{
>>>>> +    int sample_type = config_counter(config);
>>>>> +    const unsigned int gt_id = gt->info.id;
>>>>> +    struct xe_device *xe = gt->tile->xe;
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>> +    unsigned long flags;
>>>>> +    bool device_awake;
>>>>> +    u64 val;
>>>>> +
>>>>> +    device_awake = xe_pm_runtime_get_if_active(xe);
>>>>> +    if (device_awake) {
>>>>> +        XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>>>>> +        val = __engine_group_busyness_read(gt, sample_type);
>>>>> +        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>>> +        xe_pm_runtime_put(xe);
>>>>> +    }
>>>>> +
>>>>> +    spin_lock_irqsave(&pmu->lock, flags);
>>>>> +
>>>>> +    if (device_awake)
>>>>> +        pmu->sample[gt_id][sample_type] = val;
>>>>> +    else
>>>>> +        val = pmu->sample[gt_id][sample_type];
>>>>> +
>>>>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>>>>> +
>>>>> +    return val;
>>>>> +}
>>>>> +
>>>>> +static void engine_group_busyness_store(struct xe_gt *gt)
>>>>> +{
>>>>> +    struct xe_pmu *pmu = &gt->tile->xe->pmu;
>>>>> +    unsigned int gt_id = gt->info.id;
>>>>> +    unsigned long flags;
>>>>> +    int i;
>>>>> +
>>>>> +    spin_lock_irqsave(&pmu->lock, flags);
>>>>> +
>>>>> +    for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++)
>>>>> +        pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
>>>>> +
>>>>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>>>>> +}
>>>>> +
>>>>> +static int
>>>>> +config_status(struct xe_device *xe, u64 config)
>>>>> +{
>>>>> +    unsigned int gt_id = config_gt_id(config);
>>>>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>>>> +
>>>>> +    if (gt_id >= XE_PMU_MAX_GT)
>>>>> +        return -ENOENT;
>>>>> +
>>>>> +    switch (config_counter(config)) {
>>>>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>>>>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>>>>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>>> +        if (gt->info.type == XE_GT_TYPE_MEDIA)
>>>>> +            return -ENOENT;
>>>>> +        break;
>>>>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>>> +        if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
>>>>> +            return -ENOENT;
>>>>> +        break;
>>>>> +    default:
>>>>> +        return -ENOENT;
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_event_init(struct perf_event *event)
>>>>> +{
>>>>> +    struct xe_device *xe =
>>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (pmu->closed)
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    if (event->attr.type != event->pmu->type)
>>>>> +        return -ENOENT;
>>>>> +
>>>>> +    /* unsupported modes and filters */
>>>>> +    if (event->attr.sample_period) /* no sampling */
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    if (has_branch_stack(event))
>>>>> +        return -EOPNOTSUPP;
>>>>> +
>>>>> +    if (event->cpu < 0)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    /* only allow running on one cpu at a time */
>>>>> +    if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    ret = config_status(xe, event->attr.config);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>> +
>>>>> +    if (!event->parent) {
>>>>> +        drm_dev_get(&xe->drm);
>>>>> +        event->destroy = xe_pmu_event_destroy;
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>>>>> +{
>>>>> +    struct xe_device *xe =
>>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +    const unsigned int gt_id = config_gt_id(event->attr.config);
>>>>> +    const u64 config = event->attr.config;
>>>>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>>>> +    u64 val;
>>>>> +
>>>>> +    switch (config_counter(config)) {
>>>>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>>>>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>>>>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>>> +        val = engine_group_busyness_read(gt, config);
>>>>> +        break;
>>>>> +    default:
>>>>> +        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>>>> +    }
>>>>> +
>>>>> +    return val;
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_event_read(struct perf_event *event)
>>>>> +{
>>>>> +    struct xe_device *xe =
>>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +    struct hw_perf_event *hwc = &event->hw;
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>> +    u64 prev, new;
>>>>> +
>>>>> +    if (pmu->closed) {
>>>>> +        event->hw.state = PERF_HES_STOPPED;
>>>>> +        return;
>>>>> +    }
>>>>> +again:
>>>>> +    prev = local64_read(&hwc->prev_count);
>>>>> +    new = __xe_pmu_event_read(event);
>>>>> +
>>>>> +    if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>>>>> +        goto again;
>>>>> +
>>>>> +    local64_add(new - prev, &event->count);
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_enable(struct perf_event *event)
>>>>> +{
>>>>> +    /*
>>>>> +     * Store the current counter value so we can report the correct delta
>>>>> +     * for all listeners. Even when the event was already enabled and has
>>>>> +     * an existing non-zero value.
>>>>> +     */
>>>>> +    local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_event_start(struct perf_event *event, int flags)
>>>>> +{
>>>>> +    struct xe_device *xe =
>>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>> +
>>>>> +    if (pmu->closed)
>>>>> +        return;
>>>>> +
>>>>> +    xe_pmu_enable(event);
>>>>> +    event->hw.state = 0;
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
>>>>> +{
>>>>> +    if (flags & PERF_EF_UPDATE)
>>>>> +        xe_pmu_event_read(event);
>>>>> +
>>>>> +    event->hw.state = PERF_HES_STOPPED;
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_event_add(struct perf_event *event, int flags)
>>>>> +{
>>>>> +    struct xe_device *xe =
>>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>> +
>>>>> +    if (pmu->closed)
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    if (flags & PERF_EF_START)
>>>>> +        xe_pmu_event_start(event, flags);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_event_del(struct perf_event *event, int flags)
>>>>> +{
>>>>> +    xe_pmu_event_stop(event, PERF_EF_UPDATE);
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_event_event_idx(struct perf_event *event)
>>>>> +{
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +struct xe_ext_attribute {
>>>>> +    struct device_attribute attr;
>>>>> +    unsigned long val;
>>>>> +};
>>>>> +
>>>>> +static ssize_t xe_pmu_event_show(struct device *dev,
>>>>> +                 struct device_attribute *attr, char *buf)
>>>>> +{
>>>>> +    struct xe_ext_attribute *eattr;
>>>>> +
>>>>> +    eattr = container_of(attr, struct xe_ext_attribute, attr);
>>>>> +    return sprintf(buf, "config=0x%lx\n", eattr->val);
>>>>> +}
>>>>> +
>>>>> +static ssize_t cpumask_show(struct device *dev,
>>>>> +                struct device_attribute *attr, char *buf)
>>>>> +{
>>>>> +    return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>>>>> +}
>>>>> +
>>>>> +static DEVICE_ATTR_RO(cpumask);
>>>>> +
>>>>> +static struct attribute *xe_cpumask_attrs[] = {
>>>>> +    &dev_attr_cpumask.attr,
>>>>> +    NULL,
>>>>> +};
>>>>> +
>>>>> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
>>>>> +    .attrs = xe_cpumask_attrs,
>>>>> +};
>>>>> +
>>>>> +#define __event(__counter, __name, __unit) \
>>>>> +{ \
>>>>> +    .counter = (__counter), \
>>>>> +    .name = (__name), \
>>>>> +    .unit = (__unit), \
>>>>> +}
>>>>> +
>>>>> +static struct xe_ext_attribute *
>>>>> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
>>>>> +{
>>>>> +    sysfs_attr_init(&attr->attr.attr);
>>>>> +    attr->attr.attr.name = name;
>>>>> +    attr->attr.attr.mode = 0444;
>>>>> +    attr->attr.show = xe_pmu_event_show;
>>>>> +    attr->val = config;
>>>>> +
>>>>> +    return ++attr;
>>>>> +}
>>>>> +
>>>>> +static struct perf_pmu_events_attr *
>>>>> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>>>>> +         const char *str)
>>>>> +{
>>>>> +    sysfs_attr_init(&attr->attr.attr);
>>>>> +    attr->attr.attr.name = name;
>>>>> +    attr->attr.attr.mode = 0444;
>>>>> +    attr->attr.show = perf_event_sysfs_show;
>>>>> +    attr->event_str = str;
>>>>> +
>>>>> +    return ++attr;
>>>>> +}
>>>>> +
>>>>> +static struct attribute **
>>>>> +create_event_attributes(struct xe_pmu *pmu)
>>>>> +{
>>>>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>>> +    static const struct {
>>>>> +        unsigned int counter;
>>>>> +        const char *name;
>>>>> +        const char *unit;
>>>>> +    } events[] = {
>>>>> +        __event(0, "render-group-busy", "ns"),
>>>>> +        __event(1, "copy-group-busy", "ns"),
>>>>> +        __event(2, "media-group-busy", "ns"),
>>>>> +        __event(3, "any-engine-group-busy", "ns"),
>>>>> +    };
>>>>> +
>>>>> +    struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>>>>> +    struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>>>>> +    struct attribute **attr = NULL, **attr_iter;
>>>>> +    unsigned int count = 0;
>>>>> +    unsigned int i, j;
>>>>> +    struct xe_gt *gt;
>>>>> +
>>>>> +    /* Count how many counters we will be exposing. */
>>>>> +    for_each_gt(gt, xe, j) {
>>>>> +        for (i = 0; i < ARRAY_SIZE(events); i++) {
>>>>> +            u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>>>>> +
>>>>> +            if (!config_status(xe, config))
>>>>> +                count++;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    /* Allocate attribute objects and table. */
>>>>> +    xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>>>>> +    if (!xe_attr)
>>>>> +        goto err_alloc;
>>>>> +
>>>>> +    pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>>>>> +    if (!pmu_attr)
>>>>> +        goto err_alloc;
>>>>> +
>>>>> +    /* Max one pointer of each attribute type plus a termination entry. */
>>>>> +    attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>>>>> +    if (!attr)
>>>>> +        goto err_alloc;
>>>>> +
>>>>> +    xe_iter = xe_attr;
>>>>> +    pmu_iter = pmu_attr;
>>>>> +    attr_iter = attr;
>>>>> +
>>>>> +    for_each_gt(gt, xe, j) {
>>>>> +        for (i = 0; i < ARRAY_SIZE(events); i++) {
>>>>> +            u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>>>>> +            char *str;
>>>>> +
>>>>> +            if (config_status(xe, config))
>>>>> +                continue;
>>>>> +
>>>>> +            str = kasprintf(GFP_KERNEL, "%s-gt%u",
>>>>> +                    events[i].name, j);
>>>>> +            if (!str)
>>>>> +                goto err;
>>>>> +
>>>>> +            *attr_iter++ = &xe_iter->attr.attr;
>>>>> +            xe_iter = add_xe_attr(xe_iter, str, config);
>>>>> +
>>>>> +            if (events[i].unit) {
>>>>> +                str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
>>>>> +                        events[i].name, j);
>>>>> +                if (!str)
>>>>> +                    goto err;
>>>>> +
>>>>> +                *attr_iter++ = &pmu_iter->attr.attr;
>>>>> +                pmu_iter = add_pmu_attr(pmu_iter, str,
>>>>> +                            events[i].unit);
>>>>> +            }
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    pmu->xe_attr = xe_attr;
>>>>> +    pmu->pmu_attr = pmu_attr;
>>>>> +
>>>>> +    return attr;
>>>>> +
>>>>> +err:
>>>>> +    for (attr_iter = attr; *attr_iter; attr_iter++)
>>>>> +        kfree((*attr_iter)->name);
>>>>> +
>>>>> +err_alloc:
>>>>> +    kfree(attr);
>>>>> +    kfree(xe_attr);
>>>>> +    kfree(pmu_attr);
>>>>> +
>>>>> +    return NULL;
>>>>> +}
>>>>> +
>>>>> +static void free_event_attributes(struct xe_pmu *pmu)
>>>>> +{
>>>>> +    struct attribute **attr_iter = pmu->events_attr_group.attrs;
>>>>> +
>>>>> +    for (; *attr_iter; attr_iter++)
>>>>> +        kfree((*attr_iter)->name);
>>>>> +
>>>>> +    kfree(pmu->events_attr_group.attrs);
>>>>> +    kfree(pmu->xe_attr);
>>>>> +    kfree(pmu->pmu_attr);
>>>>> +
>>>>> +    pmu->events_attr_group.attrs = NULL;
>>>>> +    pmu->xe_attr = NULL;
>>>>> +    pmu->pmu_attr = NULL;
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>>>>> +{
>>>>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>>>>> +
>>>>> +    /* Select the first online CPU as a designated reader. */
>>>>> +    if (cpumask_empty(&xe_pmu_cpumask))
>>>>> +        cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>>>>> +{
>>>>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>>>>> +    unsigned int target = xe_pmu_target_cpu;
>>>>> +
>>>>> +    /*
>>>>> +     * Unregistering an instance generates a CPU offline event which we must
>>>>> +     * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>>>>> +     */
>>>>> +    if (pmu->closed)
>>>>> +        return 0;
>>>>> +
>>>>> +    if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>>>>> +        target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>>>>> +
>>>>> +        /* Migrate events if there is a valid target */
>>>>> +        if (target < nr_cpu_ids) {
>>>>> +            cpumask_set_cpu(target, &xe_pmu_cpumask);
>>>>> +            xe_pmu_target_cpu = target;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>>>>> +        perf_pmu_migrate_context(&pmu->base, cpu, target);
>>>>> +        pmu->cpuhp.cpu = target;
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
>>>>> +
>>>>> +int xe_pmu_init(void)
>>>>> +{
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>>>>> +                      "perf/x86/intel/xe:online",
>>>>> +                      xe_pmu_cpu_online,
>>>>> +                      xe_pmu_cpu_offline);
>>>>> +    if (ret < 0)
>>>>> +        pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>>>>> +              ret);
>>>>> +    else
>>>>> +        cpuhp_slot = ret;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +void xe_pmu_exit(void)
>>>>> +{
>>>>> +    if (cpuhp_slot != CPUHP_INVALID)
>>>>> +        cpuhp_remove_multi_state(cpuhp_slot);
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>>>>> +{
>>>>> +    if (cpuhp_slot == CPUHP_INVALID)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>>>>> +{
>>>>> +    cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>>>>> +}
>>>>> +
>>>>> +void xe_pmu_suspend(struct xe_gt *gt)
>>>>> +{
>>>>> +    engine_group_busyness_store(gt);
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_unregister(void *arg)
>>>>> +{
>>>>> +    struct xe_pmu *pmu = arg;
>>>>> +
>>>>> +    if (!pmu->base.event_init)
>>>>> +        return;
>>>>> +
>>>>> +    /*
>>>>> +     * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
>>>>> +     * ensures all currently executing ones will have exited before we
>>>>> +     * proceed with unregistration.
>>>>> +     */
>>>>> +    pmu->closed = true;
>>>>> +    synchronize_rcu();
>>>>> +
>>>>> +    xe_pmu_unregister_cpuhp_state(pmu);
>>>>> +
>>>>> +    perf_pmu_unregister(&pmu->base);
>>>>> +    pmu->base.event_init = NULL;
>>>>> +    kfree(pmu->base.attr_groups);
>>>>> +    kfree(pmu->name);
>>>>> +    free_event_attributes(pmu);
>>>>> +}
>>>>> +
>>>>> +void xe_pmu_register(struct xe_pmu *pmu)
>>>>> +{
>>>>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>>> +    const struct attribute_group *attr_groups[] = {
>>>>> +        &pmu->events_attr_group,
>>>>> +        &xe_pmu_cpumask_attr_group,
>>>>> +        NULL
>>>>> +    };
>>>>> +
>>>>> +    int ret = -ENOMEM;
>>>>> +
>>>>> +    spin_lock_init(&pmu->lock);
>>>>> +    pmu->cpuhp.cpu = -1;
>>>>> +
>>>>> +    pmu->name = kasprintf(GFP_KERNEL,
>>>>> +                  "xe_%s",
>>>>> +                  dev_name(xe->drm.dev));
>>>>> +    if (pmu->name)
>>>>> +        /* tools/perf reserves colons as special. */
>>>>> +        strreplace((char *)pmu->name, ':', '_');
>>>>> +
>>>>> +    if (!pmu->name)
>>>>> +        goto err;
>>>>> +
>>>>> +    pmu->events_attr_group.name = "events";
>>>>> +    pmu->events_attr_group.attrs = create_event_attributes(pmu);
>>>>> +    if (!pmu->events_attr_group.attrs)
>>>>> +        goto err_name;
>>>>> +
>>>>> +    pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>>>>> +                    GFP_KERNEL);
>>>>> +    if (!pmu->base.attr_groups)
>>>>> +        goto err_attr;
>>>>> +
>>>>> +    pmu->base.module    = THIS_MODULE;
>>>>> +    pmu->base.task_ctx_nr    = perf_invalid_context;
>>>>> +    pmu->base.event_init    = xe_pmu_event_init;
>>>>> +    pmu->base.add        = xe_pmu_event_add;
>>>>> +    pmu->base.del        = xe_pmu_event_del;
>>>>> +    pmu->base.start        = xe_pmu_event_start;
>>>>> +    pmu->base.stop        = xe_pmu_event_stop;
>>>>> +    pmu->base.read        = xe_pmu_event_read;
>>>>> +    pmu->base.event_idx    = xe_pmu_event_event_idx;
>>>>> +
>>>>> +    ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>>>>> +    if (ret)
>>>>> +        goto err_groups;
>>>>> +
>>>>> +    ret = xe_pmu_register_cpuhp_state(pmu);
>>>>> +    if (ret)
>>>>> +        goto err_unreg;
>>>>> +
>>>>> +    ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
>>>>> +    if (ret)
>>>>> +        goto err_cpuhp;
>>>>> +
>>>>> +    return;
>>>>> +
>>>>> +err_cpuhp:
>>>>> +    xe_pmu_unregister_cpuhp_state(pmu);
>>>>> +err_unreg:
>>>>> +    perf_pmu_unregister(&pmu->base);
>>>>> +err_groups:
>>>>> +    kfree(pmu->base.attr_groups);
>>>>> +err_attr:
>>>>> +    pmu->base.event_init = NULL;
>>>>> +    free_event_attributes(pmu);
>>>>> +err_name:
>>>>> +    kfree(pmu->name);
>>>>> +err:
>>>>> +    drm_notice(&xe->drm, "Failed to register PMU!\n");
>>>>> +}
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>>>>> new file mode 100644
>>>>> index 000000000000..8afa256f9dac
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>>>>> @@ -0,0 +1,26 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright © 2024 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#ifndef _XE_PMU_H_
>>>>> +#define _XE_PMU_H_
>>>>> +
>>>>> +#include "xe_pmu_types.h"
>>>>> +
>>>>> +struct xe_gt;
>>>>> +
>>>>> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
>>>>> +int xe_pmu_init(void);
>>>>> +void xe_pmu_exit(void);
>>>>> +void xe_pmu_register(struct xe_pmu *pmu);
>>>>> +void xe_pmu_suspend(struct xe_gt *gt);
>>>>> +#else
>>>>> +static inline int xe_pmu_init(void) { return 0; }
>>>>> +static inline void xe_pmu_exit(void) {}
>>>>> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>>>>> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>>>>> +#endif
>>>>> +
>>>>> +#endif
>>>>> +
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>> new file mode 100644
>>>>> index 000000000000..e86e8d7e0356
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>> @@ -0,0 +1,67 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright © 2024 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#ifndef _XE_PMU_TYPES_H_
>>>>> +#define _XE_PMU_TYPES_H_
>>>>> +
>>>>> +#include <linux/perf_event.h>
>>>>> +#include <linux/spinlock_types.h>
>>>>> +#include <uapi/drm/xe_drm.h>
>>>>> +
>>>>> +enum {
>>>>> +    __XE_SAMPLE_RENDER_GROUP_BUSY,
>>>>> +    __XE_SAMPLE_COPY_GROUP_BUSY,
>>>>> +    __XE_SAMPLE_MEDIA_GROUP_BUSY,
>>>>> +    __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>>>>> +    __XE_NUM_PMU_SAMPLERS
>>>>> +};
>>>>> +
>>>>> +#define XE_PMU_MAX_GT 2
>>>>> +
>>>>> +struct xe_pmu {
>>>>> +    /**
>>>>> +     * @cpuhp: Struct used for CPU hotplug handling.
>>>>> +     */
>>>>> +    struct {
>>>>> +        struct hlist_node node;
>>>>> +        unsigned int cpu;
>>>>> +    } cpuhp;
>>>>> +    /**
>>>>> +     * @base: PMU base.
>>>>> +     */
>>>>> +    struct pmu base;
>>>>> +    /**
>>>>> +     * @closed: xe is unregistering.
>>>>> +     */
>>>>> +    bool closed;
>>>>> +    /**
>>>>> +     * @name: Name as registered with perf core.
>>>>> +     */
>>>>> +    const char *name;
>>>>> +    /**
>>>>> +     * @lock: Lock protecting enable mask and ref count handling.
>>>>> +     */
>>>>> +    spinlock_t lock;
>>>>> +    /**
>>>>> +     * @sample: Current and previous (raw) counters.
>>>>> +     *
>>>>> +     * These counters are updated when the device is awake.
>>>>> +     */
>>>>> +    u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>>>>> +    /**
>>>>> +     * @events_attr_group: Device events attribute group.
>>>>> +     */
>>>>> +    struct attribute_group events_attr_group;
>>>>> +    /**
>>>>> +     * @xe_attr: Memory block holding device attributes.
>>>>> +     */
>>>>> +    void *xe_attr;
>>>>> +    /**
>>>>> +     * @pmu_attr: Memory block holding device attributes.
>>>>> +     */
>>>>> +    void *pmu_attr;
>>>>> +};
>>>>> +
>>>>> +#endif
>>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>> index d7b0903c22b2..07ca545354f7 100644
>>>>> --- a/include/uapi/drm/xe_drm.h
>>>>> +++ b/include/uapi/drm/xe_drm.h
>>>>> @@ -1370,6 +1370,45 @@ struct drm_xe_wait_user_fence {
>>>>>     __u64 reserved[2];
>>>>> };
>>>>>
>>>>> +/**
>>>>> + * DOC: XE PMU event config IDs
>>>>> + *
>>>>> + * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed in xe_drm.h
>>>>> + * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>>>>> + * particular event.
>>>>> + *
>>>>> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>>>>> + *
>>>>> + * .. code-block:: C
>>>>> + *
>>>>> + *    struct perf_event_attr attr;
>>>>> + *    long long count;
>>>>> + *    int cpu = 0;
>>>>> + *    int fd;
>>>>> + *
>>>>> + *    memset(&attr, 0, sizeof(struct perf_event_attr));
>>>>> + *    attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
>>>>> + *    attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>>>>> + *    attr.use_clockid = 1;
>>>>> + *    attr.clockid = CLOCK_MONOTONIC;
>>>>> + *    attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>>>>> + *
>>>>> + *    fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>>>>> + */
>>>>> +
>>>>> +/*
>>>>> + * Top bits of every counter are GT id.
>>>>> + */
>>>>> +#define __XE_PMU_GT_SHIFT (56)
>>>>> +
>>>>> +#define ___XE_PMU_OTHER(gt, x) \
>>>>> +    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>>>> +
>>>>> +#define XE_PMU_RENDER_GROUP_BUSY(gt)        ___XE_PMU_OTHER(gt, 0)
>>>>> +#define XE_PMU_COPY_GROUP_BUSY(gt)        ___XE_PMU_OTHER(gt, 1)
>>>>> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)        ___XE_PMU_OTHER(gt, 2)
>>>>> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)    ___XE_PMU_OTHER(gt, 3)
>>>>
>>>> + Lucas for inputs
>>>>
>>>> We should align this to the interface planned for other PMU busyness counters as well as how we do PCEU. i.e.
>>>>
>>>> 1) counters are in ticks
>>>> 2) total time in ticks is also exported to the user.
>>>>
>>>> For 1), I would just append TICKS to the counter names and drop the conversion to _ns in __engine_group_busyness_read(). Also, drop the patch that adds this conversion helper.
>>>>
>>>> For 2) define a new counter - total active ticks that would return the 'CPU' timestamp converted to gpu ticks. The reason I am insisting on CPU timestamp here is because we want to have a time base that is ticking even when the GPU is idle.
>>>
>>> why can't we expose what the HW presents[1] to us via register and leave the interpretation to userspace.
>>
>> HW is indeed exposing ticks. In this case, I am suggesting to expose that directly to the user, so I think you are saying the same.
>correct
>>
>> As for interpretation, we need to make sure it works consistently in SRIOV. The L0 API for group busyness itself imposes the requirement for another counter to make sense of [1]. This additional counter has always existed, but in prior implementations, it was just using the CPU time in the equation. The CPU sample time is always returned in all the PMU counters. With SRIOV, it will still be CPU time, but only the time that a VF executed for and that information is only available to the KMD/GuC.  Without that information, interpreting the ticks in [1] will not be meaningful. 
>
>I hope in SRIOV case you are mentioning about accessing these counters from PF right? if it is from VF I'm not sure if these registers are accessible.

Correct, PF only. 

Regards,
Umesh

>
>Regards,
>Aravind.
>>
>> Regards,
>> Umesh
>>
>>
>>>
>>> Thanks,
>>> Aravind.
>>>>
>>>> Regards,
>>>> Umesh
>>>>
>>>>> +
>>>>> #if defined(__cplusplus)
>>>>> }
>>>>> #endif
>>>>> -- 
>>>>> 2.40.0
>>>>>
