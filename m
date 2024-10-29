Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36219D3A692
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 19:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C135710E6EF;
	Tue, 29 Oct 2024 19:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cz6R8nWb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7829A10E6F0
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 19:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730230321; x=1761766321;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f+fgP7ypNYJWSNg0ZEsv3XAxbYUCa8S46FZORNqofh4=;
 b=cz6R8nWbepQpjB+EQ5slXumSfNvfpKtNZeVsmLoIBLepiwIvZn4bjo8r
 vocYmmDBUPIa5NI+RKVmGe+41mQc2+T1nNYuI88Iet5GNHbFoSH06KJVQ
 J8aSW9FuN08bIF46K3FW0FcNvcqeTxu7Y0BcHBs7yjmTX+qWrRd4hJBjd
 9ZmWvoOCKPa0vaRef9bm+3mvDUmHRS/rOX0/y4ty4RoPO/VVHk0nUX8/J
 6WGX7BYflB+zLDD0EjrBQcmCcZoxn7qjIyKYsbZFDhU+YaBkcrRr26PGA
 yqJj2wEy2TWHdeNw1VbPbQbeOw8ufTR5ToZ5r3gpvfSTNnkj0voXr8+cL A==;
X-CSE-ConnectionGUID: zNBu498GRyiRDqege1GtVw==
X-CSE-MsgGUID: DJM+yXztQGKLs6Oge635Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29797760"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="29797760"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:31:59 -0700
X-CSE-ConnectionGUID: o0aoC8dgQQi+86Laiu6/IQ==
X-CSE-MsgGUID: 85qP+qxfQumRgbOslsSBww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="81696342"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 12:31:59 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 12:31:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 12:31:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 12:31:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGWWrUSi4Gs9eWhmkI6vxnyDVljWoq6OOOgKM9Tyw8drCLEvqnzVx+JdC69nnpbnohDKQus3RCR0Gild20Xhli91zmhURr+/jU+P+eaPOacffR9QipZ+Tw9KJZH9u3K4GbOv0azv3f9jqBwYF7PTQLDqEDCbXJRrr8yossgK+MiiGe84/R1/3zEaRLhv5DQCGLdflG8A+sG+f6x1j+2NciiyNr2vBVZMXQEfWXpmiHsl0nKHubD7Xg871GI4u/x5PXdaKb4G5WNzWiCjGvxgfRFgUoV2mxhZNhUdAQl9ziwVi6LxyuyYxbyDBAgb17C3BAfsCtnYwPvozXMF++YNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fEtgN86SEkiCgE6R/8Hz19bTaflbBg7+3LVJPQQ3mQ=;
 b=oUlb0SiwIhXS8KBujIl3z0OhiXfOhDYVxhOdh27ANQ4KoBrjQzUbpT9+4Gm8FN5/vC1rubnXUJCUSDBzFPbRJ4KtmEZ8XWobBXBkCxQAJFP47uzbeP7YXERYHJhgwe9m0dHeCWwMItRPBt+OGc5iAK3r4Rq1axqHesIKZcuIoLbWJ02CqieBw8ERwfPXjzg8Sz+Zx7rInA/6YluAxdFvavnRPfpZRFp2dBu2lPGvKNMAuwo1nhyD4qzppKDud5nBz0zKFlqFUi6W58jpf2sPbHV/K1cBUCT6uTPj6QFpzM3YX2ML93sIGeNyhzx+lGNaLDvQeZ13T59rFyNYhD19Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA2PR11MB5033.namprd11.prod.outlook.com (2603:10b6:806:115::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Tue, 29 Oct
 2024 19:31:56 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 19:31:56 +0000
Date: Tue, 29 Oct 2024 12:31:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Message-ID: <ZyE4KuowiDE1bBhC@orsosgc001>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-4-lucas.demarchi@intel.com>
 <Zx/1BZ93nLSC1pFs@orsosgc001>
 <zdjmy5xxglhenvw72jto4oajnkuczyuetp2nnrgkfat77vhmnx@xq6fthganhf7>
 <ZyEbAH60kKHDyA/m@orsosgc001>
 <miao7b7igj35dgaaqea2li7vc722gxwjslnqklwqf34zavtsb6@dhj4cxfpmyoo>
 <gjm5bmsmlxn7upcvegofokepypbnbhvnkb2ikcakezoxlpvkn3@zc4glcg466ff>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <gjm5bmsmlxn7upcvegofokepypbnbhvnkb2ikcakezoxlpvkn3@zc4glcg466ff>
X-ClientProxiedBy: MW2PR16CA0024.namprd16.prod.outlook.com (2603:10b6:907::37)
 To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA2PR11MB5033:EE_
X-MS-Office365-Filtering-Correlation-Id: 432d0533-db20-4724-9bc0-08dcf8505938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGxkT01rdVBWbmkya0xIckErUUI0R1VBWGZyUWhFdzY0V0JEWU5FZC9GY0hS?=
 =?utf-8?B?UStWdm54WjdGRTdvOHorNmdsR0k1VFVkZzdWYjd2bkIzZjZJZG5VN2ZrMzhp?=
 =?utf-8?B?WlQ3dm1LcjltOHFEMUZGU09EclEwNnlLaUZFYUFPdmdqV2xhdUlNS3RlU3dB?=
 =?utf-8?B?SXJKU1VZMmFPRGRjbTZWdnFrcENjaTRJMWxVY1lGNlZRREhwb0lYQVZUOTRI?=
 =?utf-8?B?VVB3SmpPRGNuTW9CamNOU1puQ0xuZWxzV1lEaU1URlRMaUdWTUhzTGZiQytS?=
 =?utf-8?B?dUVjQ0ZmUEFJc2R4N2lKajZHNE83Z2plOWNOMGhqdmxBc0E1eGIyelFMOE9w?=
 =?utf-8?B?Y2R2UHVyRTRiRFNjcjllelpnN2hleTVDMDEvMWhWTndKRmhBcXdiM3JHMGJo?=
 =?utf-8?B?Y3llekltQW5QS0NDc0oxRW9wT2FaUFg3S1VZL3M3OVNNcWZOUkRwVjJNakpK?=
 =?utf-8?B?a1g3VVBQeEc1Syt1eXk0L1JrM0dUTENPTE1JdVdwSjBzeVlTYmxac3FacS8w?=
 =?utf-8?B?QmkxNEpDM0JtS0lTMWlnd2gyL2VJc2x5eFhZa285ZklXekxQVTB6bURndUVQ?=
 =?utf-8?B?WEtwSmFaT2dGOEMySHF6SlpyMDFVVGJZbE1FMGcxdm1EbXR1OGl3WGFHd1Bq?=
 =?utf-8?B?UDBhYXpsSzZmNW9ldWlqUGtoMU9YUTNPQUZQRGJlQng4QnhUWnRGS3RSSHdT?=
 =?utf-8?B?eDl1cjh6M2N6Y1hOSWZPZkkrbW0xS3ZsdGVIcHpNS2pRSkVDbGoyTE45Qyt1?=
 =?utf-8?B?c2lhVWo1R0w1ZE8xeGw2Qll6czF6TlJzR1RxVzVXUEpTejg3OCt2NDB2Y3Zz?=
 =?utf-8?B?ME5veXdGMHFhSEErVmhlRExSbW5pS2xWdjFiU0tobHpxamFXbWtKajk1TDBQ?=
 =?utf-8?B?bEtIS25jV25FeDVjN1VidmZuanMydXZ5c0xkMXdEVDhteFVuNzNLTWNtVXhj?=
 =?utf-8?B?b0NUMzh3d0V1c3Bqa05HQlFjOGRVL0FXelZYWmxoVHFoZCtrZmlLbWRidUlS?=
 =?utf-8?B?THRxUXAxOGJSSnRyVklKamdJM3VOSWNnaGJwbTMvdVFFY2xSZmk4S3FCeVFS?=
 =?utf-8?B?dE9oQVdzdmtSaVFSMGVaSUdaWXp0V3FHNTNSOVFkWE51ZVBWa0kxakhnTWdC?=
 =?utf-8?B?YkVJMHdQS2JTMHIvd21MMFljbTJlRFhISTRKNlBRcVJueDFOa3gyUzRGeit1?=
 =?utf-8?B?SU16OGJ1aitUNForWmE1b0hiOFZ6b3JuUlR2aDhsL3BqR0s0UmpDd2IzM2I5?=
 =?utf-8?B?VDF4bXplOVBqR1JtRGxxYkVjOFU0alFkSUNFUVNDblFBWENjWTZyZjR3ZVBW?=
 =?utf-8?B?eG1lT0lhUnFBTUpIbExrSGpvanlxYVFyWDQ0Wkk4b2ZYMGErYmJtOVBZZjVs?=
 =?utf-8?B?aFdjYzc1Q0c0N2VMTTh0Q01PNWNQU1VmTjJjVW5uMnZRS1FCSEI3M1pNdm5m?=
 =?utf-8?B?a1hZTlRtbGhvRkt1b3VPSkxhbm10K2ZKdjRhWVhXRjlhU01ZMzNodHpwMnd2?=
 =?utf-8?B?NDAxK0E0UkZxZDcvZDhONEtpTTVUbE8za015MDZ0QU9qOGVPZjdiK3R2MEl5?=
 =?utf-8?B?UXhzYjdseUhnektiMnh5eUxnOVFjR1V5VXBFbmpFRVdHKzZRQUxSZHZBSW1k?=
 =?utf-8?B?cktRTmRHZ1lXRmJXd1U2TDN1Z0FtMlJleGxkcHh6Q21lVmY1djR3cWlEb0lG?=
 =?utf-8?B?ZUZjSlNZUGpUZXppWG5LU0VHRHg0WHV6YUFtdFI5Y29HMTdTR3l3VmI1Q3pT?=
 =?utf-8?Q?GIBe6kuLpBTrRN1Xogoc6Vz5vBXLGvop5g5Zdkg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0ZwUE9RV3lrODhyd0xVK0YzUzRjOXh4Y0ExbHkwQkc3bEM3QmljU2FmTkZ2?=
 =?utf-8?B?U05xNlFFTFFOaXhNOGl6OExtdWRwdXJvYjRqc3RvTzExZDFBSS9RM0pvL08v?=
 =?utf-8?B?c1l4aFE4c29zNTVzQXFSbC9mOGkxL3FvUGl4K0dyMjl0RHdaeVdMWW1qK2tv?=
 =?utf-8?B?eFpRTTRLbU9OL0x5MGV2aXJSY3ZqUjV2RWQ0SDlxTmdQak5YKy9Xb0c3NzY4?=
 =?utf-8?B?djNWU0Nmd2I2K0hiQ3R6K3JWbmVoVEpXazFaWVNMcFI1bTU2SGFEWkx6L3VK?=
 =?utf-8?B?dWtPSWhwb3pJS29WQWJhSTRMQ1pvLzkwVDZRZ3FkN3lYRFkrQ2lHNjR6VUc4?=
 =?utf-8?B?Z2orbS9hS3pHcXZJaW9WUUNsRzZ3a1B0MDZQNkx1d1BsUEgwaFZva0Fna2R4?=
 =?utf-8?B?SS94NnM5NDJrVFE0OWNqc2pMckZFYnRWdURjUzMxeWhtUG1KV0xsOXoxa1Uw?=
 =?utf-8?B?eFRJUjd5bW00bytiYUNyZCtlWGRYdDByRnBjTDhFd2ROUi9uS2tTcGo0MUtV?=
 =?utf-8?B?bFNUTnhiTjUwSzBEeDRnSDU4eEw3Q2NBSXZweDNEMXk3b1k3ZWNTRVNLZHRn?=
 =?utf-8?B?QmpnenFlM2FSQUlkY1BOWjB1NCtLS2xhaEs0eGoyRFZjSFhjUkoyYzZVZUI4?=
 =?utf-8?B?ZXJjT0pWL3BDWVNjaUJZbTN6N2NabTlQNHRIOW5sT3FZc1V6b0VaMkFaNzV1?=
 =?utf-8?B?ZTQzQ1IrQ2xZWW1zWjd3N0V0STU2Wm1QVmxrdzArZHVJRFFVYm0wRVVjWDZF?=
 =?utf-8?B?LzFsTXFGbllyWTk5MjdaTnlLS2NkRkRLUmVLdmNXRnA3K1NxMTViSG9uZGFv?=
 =?utf-8?B?dFBUZHlwR1NpcTFhMDNKUWR6a2pjMis1T0ZlaGpYSkloc3RMWFhGMi9ac3ZO?=
 =?utf-8?B?M3A5ejJpYW84YnJEUlY5MnorWmFFb2pGdndQeDNHcFlyMnhLdkpXRVpEcytB?=
 =?utf-8?B?SXlKN2JGcDNzYlVqc2RYanVNZmlWQTZGSGZvSHY1dEcvekpySkdIQmlWaU5X?=
 =?utf-8?B?Mi90TWNxbVgrN1VKRm9LY0dtN1ZjMzFhR1BUWkQ3VWtHTExDUEMyZi9xaWNT?=
 =?utf-8?B?TWN3dVRUak5pVTF4U0FMcFRFU1JYQ3JqZ2kvNzN1MWdWM0NOc0h6T0x4WStq?=
 =?utf-8?B?TEFyZ280YUw3UlQwMG16NzNzc2NpQkJnd3pNcUtkN3hRN2huRGRDVXV2YnVI?=
 =?utf-8?B?T0ZJdklKOEE5bFNVbHZHTENDeW94cUlyb1ZxendoZ1pYUjBtUkhBSHpiYnI5?=
 =?utf-8?B?TmlGMW0reEcva1d6eFIzMnY5YzlPeEs2bVJCQUxMWDlDOGgzSlFEeW9Ec2J2?=
 =?utf-8?B?bTB0ZEp2aTBIeFk0c2FCZ0hHamlFMnJIUXNBKzBvTjV3bXB4dlV3Ly9hSXBP?=
 =?utf-8?B?UlpGRlpUMFE5eFM1VE1YZVZoZHU3VUdUcTU0bFdVV3pOTTQ1aTBlRmFTaVM4?=
 =?utf-8?B?OXNoaGJKYnREb3Rad2JsOWRwWUtTRHFPWTdsMUlGUUZUUVNHU1ZtZ3NKZnV3?=
 =?utf-8?B?S3lwYVpDYXVhUzZCVlU1N1lJcVI1UGY3ZkJjK0VrTllaRUNueDhqL1dtSlJw?=
 =?utf-8?B?WUZGRis4ZGQ5SjZxeW5yMmM1SithNEc0bHp4QXRoKzZZc1hta0Y4elZNbkRJ?=
 =?utf-8?B?R1ZqOGVkbys2RURhbGVNL3hjb2kxZWxjeWFBRWRSK3paVWp0RDJ2UnNvYmRm?=
 =?utf-8?B?S2Q3UTBpeFpOVWNMaDdVbDNOenNRQnlCSEZOQjhERWhCYnNsNUltSCsvWnRy?=
 =?utf-8?B?T0g2K3F2bHAzWWx6WEphVDcyUXk0dkR3aE0xeEU3djk3Yjg5MENKMnNwM3Zn?=
 =?utf-8?B?Wk8wNmNXTFg2UFF5V293dHJyNHc2YTBDMnZDbTloRE16dTRzYUpUMXcweFpr?=
 =?utf-8?B?cHhqb29YMytGMEU1cWVMUmtDZUZCWjBWVTF1ZlR6TVNERDY4WVV6Mk8rRHhU?=
 =?utf-8?B?WVgwejYxMHZNT1VabWQzNWttZ09KQ1RaN2FacGZqNWJRM1J6dmgrR1JCbVdJ?=
 =?utf-8?B?MndkUEJjNWw0bEorTVk2QXZzYnUrWXYzb3RtaG1EQWYrUnJpSkZSa2tyZEoz?=
 =?utf-8?B?aGRWbGl5eTBuRGdSZ3p1Qk9QTjdBVFljbnhBYUZqOVYrMzhHWUloSnhmdjVj?=
 =?utf-8?B?S2pLR3JYbmwyclplWFVTa2VHRi94NktqUFc3SWlYZXViY2dFUFNIMEgrYlFx?=
 =?utf-8?Q?UF5i4V2rQoC5YmOIdS8Q4fc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 432d0533-db20-4724-9bc0-08dcf8505938
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 19:31:56.0144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GcE4hLXYO5E+iOpLBl8q4wmqNypw7TUYBdovZwrWoPgBep6+RfoMxz+hzm/Qb5KJLvFy+Sj5gi3JQZykUQshRD+fVAcrzSSDPUCCbAu/lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5033
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

On Tue, Oct 29, 2024 at 02:12:22PM -0500, Lucas De Marchi wrote:
>On Tue, Oct 29, 2024 at 12:58:35PM -0500, Lucas De Marchi wrote:
>>>>Starting subtest: utilization-single-full-load-destroy-queue
>>>>....
>>>>(xe_drm_fdinfo:5997) DEBUG: vcs: spinner ended (timestamp=4818209)
>>>>(xe_drm_fdinfo:5997) DEBUG: vcs: sample 1: cycles 9637999, total_cycles 19272820538
>>>>(xe_drm_fdinfo:5997) DEBUG: vcs: sample 2: cycles 9637999, total_cycles 19277703269
>>>>(xe_drm_fdinfo:5997) DEBUG: vcs: percent: 0.000000
>>>>(xe_drm_fdinfo:5997) CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:527:
>>>>(xe_drm_fdinfo:5997) CRITICAL: Failed assertion: 95.0 < percent
>>>>(xe_drm_fdinfo:5997) CRITICAL: error: 95.000000 >= 0.000000
>>>>(xe_drm_fdinfo:5997) igt_core-INFO: Stack trace:
>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #1 [check_results+0x204]
>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #2 ../tests/intel/xe_drm_fdinfo.c:860 __igt_unique____real_main806()
>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #3 ../tests/intel/xe_drm_fdinfo.c:806 main()
>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #6 [_start+0x25]
>>>>****  END  ****
>>>>
>>>>which makes me think it's probably related to the kill being async as
>>>>you mentioned.
>>>>
>>>>I wonder if we should synchronize the call in the fdinfo read with the
>>>>queues that are going away.
>>>
>>>Hmm, maybe.
>>
>>doing that it passes for me 62/100 running all
>>xe_drm_fdinfo@utilization-* tests.
>>
>>The failure on run 63 is different  and I think it's another bug or
>
>
>so the other failure, that I forgot to paste:
>
>	Starting subtest: utilization-all-full-load
>	(xe_drm_fdinfo:14864) CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:528:
>	(xe_drm_fdinfo:14864) CRITICAL: Failed assertion: percent < 105.0
>	(xe_drm_fdinfo:14864) CRITICAL: error: 315.453826 >= 105.000000
>	Stack trace:
>	  #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>	  #1 ../tests/intel/xe_drm_fdinfo.c:520 check_results()
>	  #2 ../tests/intel/xe_drm_fdinfo.c:464 __igt_unique____real_main806()
>	  #3 ../tests/intel/xe_drm_fdinfo.c:806 main()
>	  #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>	  #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>	  #6 [_start+0x25]
>	Subtest utilization-all-full-load failed.
>	**** DEBUG ****
>	(xe_drm_fdinfo:14864) DEBUG: rcs: spinner started
>	(xe_drm_fdinfo:14864) DEBUG: bcs: spinner started
>	(xe_drm_fdinfo:14864) DEBUG: ccs: spinner started
>	(xe_drm_fdinfo:14864) DEBUG: vcs: spinner started
>	(xe_drm_fdinfo:14864) DEBUG: vecs: spinner started
>	(xe_drm_fdinfo:14864) DEBUG: rcs: spinner ended (timestamp=15218479)
>	(xe_drm_fdinfo:14864) DEBUG: bcs: spinner ended (timestamp=15194339)
>	(xe_drm_fdinfo:14864) DEBUG: vcs: spinner ended (timestamp=4837648)
>	(xe_drm_fdinfo:14864) DEBUG: vecs: spinner ended (timestamp=4816316)
>	(xe_drm_fdinfo:14864) DEBUG: ccs: spinner ended (timestamp=4859494)
>	(xe_drm_fdinfo:14864) DEBUG: rcs: sample 1: cycles 40481368, total_cycles 31104224861
>	(xe_drm_fdinfo:14864) DEBUG: rcs: sample 2: cycles 55700053, total_cycles 31109049238
>	(xe_drm_fdinfo:14864) DEBUG: rcs: percent: 315.453826
>	(xe_drm_fdinfo:14864) CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:528:
>	(xe_drm_fdinfo:14864) CRITICAL: Failed assertion: percent < 105.0
>	(xe_drm_fdinfo:14864) CRITICAL: error: 315.453826 >= 105.000000
>	(xe_drm_fdinfo:14864) igt_core-INFO: Stack trace:
>	(xe_drm_fdinfo:14864) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>
>
>From the timestamp read by the GPU;
>rcs timestamp=15218479 and bcs timestamp=15194339... which is indeed much
>higher than the total_cycles available:
>31109049238 - 31104224861 = 4824377, which is reasonably similar to the
>timestamp for the other engines.
>
>my hypothesis is something like this:
>
>sample1:
>	accumulate_exec_queue (t = 0)
>				<<<<<<<< premption
>	read_total_gpu_cycles (t = 200)
>
>sample2:
>	accumulate_exec_queue (t = 300)
>	read_total_gpu_cycles  (t = 300)
>

It could as well be the second sample, see my previous email on why run 
ticks can be larger than the gt timestamp delta.

For the sake of narrowing it down, you could capture the value of 
CTX_TIMESTAMP mmio before killing the exec queue in destroy. It should 
be ticking since the context is active. Once the context stops, it would 
have an updated value. That way we know how long it took to stop.

Thanks,
Umesh

>
>which makes cycles = 300, total_cycles = 200.
>
>One easy thing to help: move the force wake finding/getting to the
>beginning. I don't think it will be 100% bullet proof, but it improved
>the execution on a misbehaving LNL to 100/100 pass. Maybe I was lucky in
>this run.
>
>Other than that we may need to resort to keep a copy of the last stamp
>reported, redoing it if nonsense comes out, or add some locking
>
>Lucas De Marchi
>
>>race. This is what I'm testing with currently:
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index a3e777ad281e3..eaee19efeadce 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -614,6 +614,11 @@ struct xe_file {
>>                * does things while being held.
>>                */
>>               struct mutex lock;
>>+               /**
>>+                * @exec_queue.pending_removal: items pending to be removed to
>>+                * synchronize GPU state update with ongoing query.
>>+                */
>>+               atomic_t pending_removal;
>>       } exec_queue;
>>       /** @run_ticks: hw engine class run time in ticks for this drm client */
>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>index a9b0d640b2581..5f6347d12eec5 100644
>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>@@ -327,6 +327,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>       if (!read_total_gpu_timestamp(xe, &gpu_timestamp))
>>               goto fail_gpu_timestamp;
>>+       /*
>>+        * Wait for any exec queue going away: their cycles will get updated on
>>+        * context switch out, so wait for that to happen
>>+        */
>>+        wait_var_event(&xef->exec_queue.pending_removal,
>>+                       !atomic_read(&xef->exec_queue.pending_removal));
>>+
>>       xe_pm_runtime_put(xe);
>>       for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>index fd0f3b3c9101d..58dd35beb15ad 100644
>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>@@ -262,8 +262,11 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>>       /*
>>        * Before releasing our ref to lrc and xef, accumulate our run ticks
>>+        * and wakeup any waiters.
>>        */
>>       xe_exec_queue_update_run_ticks(q);
>>+       if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
>>+               wake_up_var(&q->xef->exec_queue.pending_removal);
>>       for (i = 0; i < q->width; ++i)
>>               xe_lrc_put(q->lrc[i]);
>>@@ -824,6 +827,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>>           XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>               return -EINVAL;
>>+       atomic_inc(&xef->exec_queue.pending_removal);
>>       mutex_lock(&xef->exec_queue.lock);
>>       q = xa_erase(&xef->exec_queue.xa, args->exec_queue_id);
>>       mutex_unlock(&xef->exec_queue.lock);
>>
>>
>>Idea is that any process reading the fdinfo needs to wait on contexts
>>going away via kill.
>>
>>
>>>
>>>I was of the opinion that we should solve it in Xe by adding an 
>>>update call in an additional place (like you are doing), but after 
>>>digging into it a bit, I am not sure if we should resolve this 
>>>specific issue. Instead, we should alter the test to not check for 
>>>accuracy when the queue is destroyed before taking the second 
>>>sample. We know that the ticks will get updated at some reasonable 
>>>point in future and the user will see it in subsequent fdinfo 
>>>queries anyways. If that "reasonable point in future" is 
>>>unacceptably large, then I think the problem is outside the PCEU 
>>>domain.
>>>
>>>Note that the original reason we added the test was to catch the 
>>>ref count issue with xef object (which is now fixed).
>>>
>>>>
>>>>Another thought I had was to use the wabb, but afaics we can only
>>>>execute something on context restore, not on context save.
>>>
>>>I am curious what you want to run in context save though and how 
>>>it's any different from what's happening now - CTX_TIMESTAMP is 
>>>being updated on save.
>>
>>I was thinking about letting the gpu use MI_MATH to keep calculating
>>the delta.... but yeah, it wouldn't help in this particular case.
>>
>>
>>>
>>>>
>>>>>
>>>>>If the ftrace is getting filed up, we could throttle that.
>>>>
>>>>oh no, that is definitely not what I want. If we enable the tracepoint, we
>>>>want to see it, not artifically drop the events.
>>>>
>>>>Initially (and to get a good measure of function runtime), I was
>>>>actually using retsnoop rather than using the previously non-existent
>>>>tracepoint:
>>>>
>>>>	retsnoop -e xe_lrc_update_timestamp -e xe_lrc_create -e xe_lrc_destroy  -S -A -C args.fmt-max-arg-width=0
>>>
>>>Didn't know that. That's ^ useful.
>>
>>life saver - I keep forgetting options for the other tools to do similar
>>stuff, but this one is so simple and effective.
>>
>>Lucas De Marchi
>>
>>>
>>>Thanks,
>>>Umesh
>>>>
>>>>Lucas De Marchi
>>>>
>>>>>
>>>>>Thanks,
>>>>>Umesh
>>>>>
>>>>>>	trace_xe_exec_queue_close(q);
>>>>>>	xe_exec_queue_put(q);
>>>>>>
>>>>>>-- 
>>>>>>2.47.0
>>>>>>
