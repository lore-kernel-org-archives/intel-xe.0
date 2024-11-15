Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EED0D68BD5
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 20:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05BF10E173;
	Fri, 15 Nov 2024 20:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYMQhBJ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E5210E173
 for <Intel-Xe@lists.freedesktop.org>; Fri, 15 Nov 2024 20:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731703788; x=1763239788;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sfG52LTx3tuMBK5vDiI2FBE3Ql7rst3OcCf2tB+PtnM=;
 b=YYMQhBJ9AiD5LUcTlIkHEZa5rUBJ1/LUEY3lDFxa8SseUJ/Y1aj613kM
 flMB0gvXEbgoGN70cSReHAu3CYDU/X18/hHMbwVlbBzNUCok0LdfJjDUU
 r5/iLzwZYjHgqtBSvw2OPMxa/6YTzj3eJ+yJEwUFffhanQE2ECRLlsFF2
 fEXQe6/P0LBVf4OXLLe3osF7SZ8aM1hzMr0uU9y89bj0RiULH3iCCd0Cb
 0E2H/Lwl9HFdvdPqScIwKzHuYUu6bT8s7+PkIYSnSWQe6wNoNp9wZ3iST
 bkslqie2CuTLAQ66iSGeLTHWcMB2gOWDnTrluRSWbnVXk8wCbXAH6dUY2 w==;
X-CSE-ConnectionGUID: il9xCkUmQzao0JV5mrIHCw==
X-CSE-MsgGUID: PP8XhZchRvami8PBHxUJ+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31674132"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31674132"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 12:49:47 -0800
X-CSE-ConnectionGUID: kJwtJaW/QC+KMsygtpsrNw==
X-CSE-MsgGUID: BSTMH2tQS/GuCtCL+cglqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="111938556"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 12:49:47 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 12:49:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 12:49:46 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 12:49:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkt+rS6UIFqT2UWcK1OAnEyGJBo4s3tUKoqTw4QblM07r3dGcPuCp0FS2fZhbSYdD0dz7wEsb2ulyAHeismFFu/kZbhNyOUdkb1nANRtbtIicaCXiwLhpHaC8sWGLmxyJbp8s7ubGobR4ue/D7hcqmKnN+J2geNlyQi3Ye/CU3Q+0jJhJRMY75GLD72SaCvwF2k/xiZV8Q4Y0Fds5C9w+Fhy4zNs/PF4QZUZF42yyZKpzMKS/sHpnS1pM8OG6SaYYtYT117JHPQAs85P+G+GFbCgu3Xev6QND42Y/IiVxpTDSXDOW4U2E8ulTXcMjSGjFQJBBJohhXglWzMSe/ahFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2Gn5sDAMnCG1y5WJeOk8gVGRDK2Evfast/Nxhd0/EE=;
 b=vhCjSNnKVh0b1ERvc5XjUhoBmRS7IBnvwDR30yvxixq0D3IIw4EBa4q+SXpZXexRCo8Z1OUJW5wlt5mrMqewATEXrdmQPvnHinptehe01Y/kA31nKmKkswOvQufkSVq5OPw4cX58nLy0XI4qu1B4D/f1X0rXEt7jtc5kh4iU1SudeXkbv8yI+VaGp2ykYlcMDC8fof7p19qRE35FzkbI/n4zCaZIQGy37cdnrQCnBhL214w+NQz3jFl/6nrF+zvm4ArKMj54IrbUH7TGTYnpIRtS8+/HMYHTbbngGzXeqqLLE7ylugT2gPUXpxGCgXX6OXbWGZgZcFimPXo+olGSZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ1PR11MB6155.namprd11.prod.outlook.com (2603:10b6:a03:45e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 20:49:43 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 20:49:43 +0000
Message-ID: <738f9382-265a-489d-840f-5a0ed0ef9643@intel.com>
Date: Fri, 15 Nov 2024 12:49:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for G2G communications
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
 <20241108202216.2020164-3-John.C.Harrison@Intel.com>
 <ZzeczRm2B3ekqb4Y@lstrano-desk.jf.intel.com>
 <b2707450-2273-4933-bd2a-bc175c3905ac@intel.com>
 <ZzelyrwhddiK0QBY@lstrano-desk.jf.intel.com>
 <a52b5323-6d2c-405a-b23b-8727a67551fa@intel.com>
 <ZzetNxeXh6xvywII@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZzetNxeXh6xvywII@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::13) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ1PR11MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: a6acc39c-8810-4d26-9335-08dd05b70849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RENQSWY0UVZITGlWcWhMOU0rcmhOQnZrRjZjRDUxV0xpc1grUzNiTkppN05m?=
 =?utf-8?B?Tkk5a1Q5TmJLbjlSckptVnJnN3U5L3AxNG5Vdk1tWkhHM1d1UTY0SmRFdXRs?=
 =?utf-8?B?Y1NaaHROZElyY0hFTU8zdFdTcHVMT1ZyTFhKNWxkanJocmpRdWNpZC9KV1k5?=
 =?utf-8?B?SmtvL2FUREpsa3BKOU9ISFVBZzZsVmJkK2N5d0ovdUxUU21uVEhWYytLWWNP?=
 =?utf-8?B?ajN6MTJtRU1vY24yOVRwWnhDRnlJYitnbjZNOHY5dks5dHNGTnhYVmxST25y?=
 =?utf-8?B?bXNIeG5lZTNEZTNWbTFYb3RXQlBYYVJaMHRsajlQbklONUlwSWRWUHo5SFlu?=
 =?utf-8?B?YWFZM2tubno4UFptdnJ3eUc1SDdHVEtaRWhLeGJPbkJkRlVUYkFwVmV3cVg5?=
 =?utf-8?B?cDdZV2JiQzN1cG44U3c1K0JPbTExZnUzaEczNnlJNWVGSXVLZmlrSXFsV0s4?=
 =?utf-8?B?cU5jdjBock9FWlJMaE1TTFZlZXo0RHQxWFU0VzJxbzZrMk5tVEZJOUlBWXli?=
 =?utf-8?B?Y2VvY0tibDJYbmpycGZCbGg5SmhTMHhkdjdnaWlPcVhuZWFoTTB4NGQzYzdX?=
 =?utf-8?B?U3ZJeWhWeExKYTFZbXE5R1FFSjYyMCtFY0s5UytSTHFVTlpZcUJ4ei9UU2ZK?=
 =?utf-8?B?Y1h6eGhsNExzdm1NOTllVjRuWVhNMXIzejNNM2o1OWNsTEhyeTdrV1hlZWNM?=
 =?utf-8?B?NkU4bFNMWU5PaXQ0eVJNakNRZFpaMVhqendBR1BveFRPbXJaa0lwWTVKYmE1?=
 =?utf-8?B?ejA1enN4b3hPVm51dzdjUGpYNFd3OHlyckYwQjJBNm1TSDIxOTExNUxkV2da?=
 =?utf-8?B?VUk5MEh3blU0SWVwbUlONTdrQzNnYnVMUi9jaFJyb25QVndCS0hsM3VMWGFZ?=
 =?utf-8?B?Uy8rcGlmZjZpaGRFT25YT0dkdm1NT3Z4UFNnbjNjanVrMGEzVmh5N0Znd2Qy?=
 =?utf-8?B?ek1oTElHeWtLdlU5d245RmduTGxGVm1vcGtoL1BmTG94NGw5a3RMVURuTlBK?=
 =?utf-8?B?akdNS2R4L3Exa3ZLbVVQdFZlVkVXdEthamJTVERsa1NqbVpXa3FjU2tjOXpL?=
 =?utf-8?B?cDF6MTFtUzVzeDNuSWhGVG9ucEh4K21HZGgzQ0lENlJzTG5aZlhETGNGdWRw?=
 =?utf-8?B?Q1JadHpCbDlFbG42SXkydGkwQUNWL2Yza3k3OVAveHhEeWluRWMwZEpwN2Jm?=
 =?utf-8?B?c1lKVCtBUUlNV08xN3ZKSkd2RFhyZDBPbUsyVy8rRGI4QlB5T3JMa1dtelB4?=
 =?utf-8?B?UTJ1Q3ZQeEZBQ1dpancvdjZZaFBkVjB1R2xjbDRmMFFBdExIUGRUcDNtV2tZ?=
 =?utf-8?B?UlNwbmRjQ1kzYWQweCtkSmFyWnJzbmhvODgwUktER1FKRlFNcHRBQnh1TGFS?=
 =?utf-8?B?SUdqRjAxdGd2RjNoY09STjIveHZjbTRxemlycVBjTEl6T3lGRGxuUkkrK3Yv?=
 =?utf-8?B?cWh3b2dUVG43YW9JWGVqMC9LZkhoOFc4cVNCQVZDRlg4SnBCd0dVYmMyNTNN?=
 =?utf-8?B?YnM5L3JoSWo0MHdyZm9uMytMUmVxS3Vta2tySXQ5WUYvMFdpMUZxZjRQTFdK?=
 =?utf-8?B?eDFOdTBPVHlYYVVCTzIyd3V1cDM0SlphdUxDcWdmajkxUXFzd2d1aTEzUVdi?=
 =?utf-8?B?RWZSYXpGK2FqT09UVVpjQXZOTHFkRUZiMjA1cHR2anVaZFNNK2Y3OEJHVUhL?=
 =?utf-8?B?L2h2S0k5Y3BIS0s1S2pjaUw1S3N4cDZ1YVBXQjFSYVYzUmNEM05wQXlwdTN2?=
 =?utf-8?Q?zI/ZKtlrahqRHniqqPKtJ84k9LsNUKOACaQa/OV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1VvTzJ4OU9icUVlOVV4UE90OFY3MkRDV3hITytXejUvUWgzcHJKRXBOVXI1?=
 =?utf-8?B?NXhlS1RacGFOVU4xVXh1Yjh3b0FNK3o0L0NkM0h3eWpHVXVjUzh0eStHYlhS?=
 =?utf-8?B?VFBVSE9UVVlsOGlieDhnNGM2bXYxeUlDSnBsai9Tb0YvbDJsMy9LOC9YdWNt?=
 =?utf-8?B?N1dqTndGRjhQUjJjTTAvVmR0ZXpVTDRublF5K1RqTWZFOHFjZFBBU2I4V0VJ?=
 =?utf-8?B?U1NlamtCMGpaMi9HemxJbVBpZmR5RHZ4cHovSDl3QUU5MXBIaUk3eVdMaXdJ?=
 =?utf-8?B?bUwxTDRpQ3ZZQXAzUlIwNHlqQkErTTQ3ZmNlS2VyWnUvUlZoUDQvWDBnTmEx?=
 =?utf-8?B?TkZBRHE0emRqYnhQUHBhZ3QrNU5KYXhtd3IvOFZpNG1QZHJqd3BYSDJESUZS?=
 =?utf-8?B?RWM2VlI5SG80R0xtTFFGOFRVVmR5ZDZLamVzRzF0UGMzSGFqU1hIRHBVTnRU?=
 =?utf-8?B?SVV2TEJFd0duZldHcDNwSHRrL1pzUXRUQ0tzYjJCUDJSdzl2dFhhZE5VZmJC?=
 =?utf-8?B?Wk1yaXhiMHBaWDd3eExTblFaQ05WYUh5VWxMcGdkOXJkODA4YXE0NE5tUFN4?=
 =?utf-8?B?M1psZXM3SzBWTXVrd3VTU3FBZEV3a0xsOUZocSt5NEQ1OFR6c24rTUFtTmNY?=
 =?utf-8?B?N2pFVEllRGNDWXliQmhUS1ZKSFJTcUV1cGVFbUpqczIxSnErVG16VmNGa2NO?=
 =?utf-8?B?QlRzZDZyb0hidjZIQkdPNkYzTmFQd3hpdDlIL0xJL2dPTU1vU2t1Q1FzSlNZ?=
 =?utf-8?B?MVZ1YUVFZ3NwV0ZLWWtBKzhmamNyNnlOdDdOQUhxRXE4TlJtZHlzcHZYOStH?=
 =?utf-8?B?blV5L2dsVU9FRzk3T0RZdUYyNnZPTEpWQURHalZ5bGhVYVdaVkhHMmNZN0I2?=
 =?utf-8?B?WktMNzNHUUV0azBqZ0dRWnM5UFBDRUFZTHc4b0tEdEdFL2FLRWg0cHdISCtM?=
 =?utf-8?B?ZzcvODJVV2FtUUxjbVFaTXBjbmE5Rm10UmxSdFUwY0Zsc0xjTG9rREFhYlRq?=
 =?utf-8?B?YlpnVUNPV2QvMXBNc05WTklWSXQ4bGFrWS9jUVZDanhjZVVldVlqZU1nMEYw?=
 =?utf-8?B?V0hqQkYvZEVrdWM1SDdoazBnbFJaczNodkF5SGhSNlU0SGhiSFI5WFZETk1v?=
 =?utf-8?B?eTNOK2JvR2t1K3NieUVVNS9PN2Uyb0FDSUM5ZjAxdDFZNWVWbXozaXpIcmhW?=
 =?utf-8?B?cldGVUlpbXNtVHNWTUdReXFiY29jWFIyM3psUEE1R3JjNEw5QlY5YXN4UEpO?=
 =?utf-8?B?MUIzcXhaRXNFSDRaemtHUGxscXJvaU5wSmFyTHlreUw4SnYwZzlSWmVIVHBy?=
 =?utf-8?B?Z3drS09mNmVtd0ZWTnRHOG9FNzM3L05UNFdkVDM3QnM3Q0dta2REbTZxdzJl?=
 =?utf-8?B?WG0wbmVkTTc2WENjM3dZQXNNY3U2cnZ0eWNXUGh6M2xaK0dFOVlpYS9wRzZH?=
 =?utf-8?B?SWFRaW1ueHlyNzgzZ2p1SzNwUlBrSEp5WU1XTGdwb2NHejZBVW5rYVMxYkMw?=
 =?utf-8?B?QUZ6NmQxaWhkUFVvRVdzN3NLYWRXRFl2RGI0NUUzeDBDVHpna3puUlB2T0Ra?=
 =?utf-8?B?NFI1S3QzN3pvRXBDV2FSeXFKN1pHQXNySEJ1eFlYWHN3aEcrbEdjQUNBcFVr?=
 =?utf-8?B?eitOcUJLaHdVU0tFcy9OS0pwMktuZVI5blpWOGNvSk5GSXdtc0ZHY1l2TkJt?=
 =?utf-8?B?R3V5SXI4Z3BMeWhwY095YUliUTZvNnZrQ3kvUnpJK2Z1alZwMEJrVXVhN1Bo?=
 =?utf-8?B?MERjYWNrdVk3ODYwdldMZ0RNY0huNE1jYWdKenYvbnd4R0h5bmVPbFEyelB4?=
 =?utf-8?B?ampLVmQ2WnlaS21rT2d2bUxkNU1yeUx3bUxaMk1qT0JPdUNDdmkvNTZIcTRU?=
 =?utf-8?B?NDBiSUhxNi9XdTduS1ZMdmRXOUdzYVdDakNEekR4NjF2WnFuVXJyZ0c4Sjcz?=
 =?utf-8?B?K2pjM2JMRmRQdzlHS080M2QwMEdKQUtKVVUyNTJhdXg1MDZ3S0dOQ3M2TFZi?=
 =?utf-8?B?K1B4Umo1ODBnTEt1cWpSM0l3NGRhZytQaDBlOEJDa25QSHNoVGJ4OGVJM0Fs?=
 =?utf-8?B?UVhOYmlsd1FQU0RLMzZSRFErNjlTdmZCaXVKMERXVzR6OU83ZVc2SngxUVNQ?=
 =?utf-8?B?ZUxIZllyK0h2Mk5DSnJkcXBoam1WOG1FdnJFUHcyMlFPZXBITFF3bjNZUW5H?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6acc39c-8810-4d26-9335-08dd05b70849
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 20:49:43.4595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sd6mQo4f4p57UFM+T7j3xDx2ahBU1DT+Imtjh0zS9qEFXnFNjQ6reF3C1nq8pstSIUlt9eCApF4Sic0Me8JtU0vkjACIcw0IxVpZIgWKKho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6155
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

On 11/15/2024 12:21, Matthew Brost wrote:
> On Fri, Nov 15, 2024 at 12:00:20PM -0800, John Harrison wrote:
>> On 11/15/2024 11:49, Matthew Brost wrote:
>>> On Fri, Nov 15, 2024 at 11:34:40AM -0800, John Harrison wrote:
>>>> On 11/15/2024 11:11, Matthew Brost wrote:
>>>>> On Fri, Nov 08, 2024 at 12:22:16PM -0800, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> Some features require inter-GuC communication channels on multi-tile
>>>>>> devices. So allocate and enable such.
>>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/abi/guc_actions_abi.h |  20 ++
>>>>>>     drivers/gpu/drm/xe/xe_guc.c              | 276 ++++++++++++++++++++++-
>>>>>>     drivers/gpu/drm/xe/xe_guc_types.h        |  10 +
>>>>>>     3 files changed, 305 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>>>> index b54fe40fc5a9..fee385532fb0 100644
>>>>>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>>>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>>>> @@ -134,6 +134,8 @@ enum xe_guc_action {
>>>>>>     	XE_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
>>>>>>     	XE_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
>>>>>>     	XE_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
>>>>>> +	XE_GUC_ACTION_REGISTER_G2G = 0x4507,
>>>>>> +	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>>>>>>     	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>>>>>>     	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>>>>>     	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>>>>> @@ -218,4 +220,22 @@ enum xe_guc_tlb_inval_mode {
>>>>>>     	XE_GUC_TLB_INVAL_MODE_LITE = 0x1,
>>>>>>     };
>>>>>> +/*
>>>>>> + * GuC to GuC communication (de-)registration fields:
>>>>>> + */
>>>>>> +enum xe_guc_g2g_type {
>>>>>> +	XE_G2G_TYPE_IN = 0x0,
>>>>>> +	XE_G2G_TYPE_OUT,
>>>>>> +	XE_G2G_TYPE_LIMIT,
>>>>>> +};
>>>>>> +
>>>>>> +#define XE_G2G_REGISTER_DEVICE	REG_GENMASK(16, 16)
>>>>>> +#define XE_G2G_REGISTER_TILE	REG_GENMASK(15, 12)
>>>>>> +#define XE_G2G_REGISTER_TYPE	REG_GENMASK(11, 8)
>>>>>> +#define XE_G2G_REGISTER_SIZE	REG_GENMASK(7, 0)
>>>>>> +
>>>>>> +#define XE_G2G_DEREGISTER_DEVICE	REG_GENMASK(16, 16)
>>>>>> +#define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
>>>>>> +#define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
>>>>>> +
>>>>>>     #endif
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> index 1cbad8a91798..899094423291 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> @@ -44,7 +44,15 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>>>>>>     			    struct xe_bo *bo)
>>>>>>     {
>>>>>>     	struct xe_device *xe = guc_to_xe(guc);
>>>>>> -	u32 addr = xe_bo_ggtt_addr(bo);
>>>>>> +	u32 addr;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * For most BOs, the address on the allocating tile is fine. However for
>>>>>> +	 * some, e.g. G2G CTB, the address on a specific tile is required as it
>>>>>> +	 * might be different for each tile. So, just always ask for the address
>>>>>> +	 * on the target GuC.
>>>>>> +	 */
>>>>>> +	addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
>>>>>>     	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
>>>>>>     	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
>>>>>> @@ -244,6 +252,263 @@ static void guc_write_params(struct xe_guc *guc)
>>>>>>     		xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(1 + i), guc->params[i]);
>>>>>>     }
>>>>>> +static int guc_action_register_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev,
>>>>>> +					  u32 desc_addr, u32 buff_addr, u32 size)
>>>>>> +{
>>>>>> +	struct xe_gt *gt = guc_to_gt(guc);
>>>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>>>> +	u32 action[] = {
>>>>>> +		XE_GUC_ACTION_REGISTER_G2G,
>>>>>> +		FIELD_PREP(XE_G2G_REGISTER_SIZE, size / SZ_4K - 1) |
>>>>>> +		FIELD_PREP(XE_G2G_REGISTER_TYPE, type) |
>>>>>> +		FIELD_PREP(XE_G2G_REGISTER_TILE, dst_tile) |
>>>>>> +		FIELD_PREP(XE_G2G_REGISTER_DEVICE, dst_dev),
>>>>>> +		desc_addr,
>>>>>> +		buff_addr,
>>>>>> +	};
>>>>>> +
>>>>>> +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
>>>>>> +	xe_assert(xe, !(size % SZ_4K));
>>>>>> +
>>>>>> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>>>>> +}
>>>>>> +
>>>>>> +static int guc_action_deregister_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev)
>>>>>> +{
>>>>>> +	struct xe_gt *gt = guc_to_gt(guc);
>>>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>>>> +	u32 action[] = {
>>>>>> +		XE_GUC_ACTION_DEREGISTER_G2G,
>>>>>> +		FIELD_PREP(XE_G2G_DEREGISTER_TYPE, type) |
>>>>>> +		FIELD_PREP(XE_G2G_DEREGISTER_TILE, dst_tile) |
>>>>>> +		FIELD_PREP(XE_G2G_DEREGISTER_DEVICE, dst_dev),
>>>>>> +	};
>>>>>> +
>>>>>> +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
>>>>>> +
>>>>>> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>>>>> +}
>>>>>> +
>>>>>> +#define G2G_DEV(gt)	(((gt)->info.type == XE_GT_TYPE_MAIN) ? 0 : 1)
>>>>>> +
>>>>>> +#define G2G_BUFFER_SIZE (SZ_4K)
>>>>>> +#define G2G_DESC_SIZE (64)
>>>>>> +#define G2G_DESC_AREA_SIZE (SZ_4K)
>>>>>> +
>>>>>> +/*
>>>>>> + * Generate a unique id for each bi-directional CTB for each pair of
>>>>>> + * near and far tiles/devices. The id can then be used as an index into
>>>>>> + * a single allocation that is sub-divided into multiple CTBs.
>>>>>> + *
>>>>>> + * For example, with two devices per tile and two tiles, the table should
>>>>>> + * look like:
>>>>>> + *           Far <tile>.<dev>
>>>>>> + *         0.0   0.1   1.0   1.1
>>>>>> + * N 0.0  --/-- 00/01 02/03 04/05
>>>>>> + * e 0.1  01/00 --/-- 06/07 08/09
>>>>>> + * a 1.0  03/02 07/06 --/-- 10/11
>>>>>> + * r 1.1  05/04 09/08 11/10 --/--
>>>>>> + *
>>>>>> + * Where each entry is Rx/Tx channel id.
>>>>>> + *
>>>>>> + * So GuC #3 (tile 1, dev 1) talking to GuC #2 (tile 1, dev 0) would
>>>>>> + * be reading from channel #11 and writing to channel #10. Whereas,
>>>>>> + * GuC #2 talking to GuC #3 would be read on #10 and write to #11.
>>>>>> + */
>>>>>> +static unsigned int g2g_slot(u32 near_tile, u32 near_dev, u32 far_tile, u32 far_dev,
>>>>>> +			     u32 type, u32 max_inst, bool have_dev)
>>>>>> +{
>>>>> This function makes my head hurt but I don't have any other suggestions.
>>>>>
>>>>>> +	u32 near = near_tile, far = far_tile;
>>>>>> +	u32 idx = 0;
>>>>>> +	int i;
>>>>>> +
>>>>>> +	if (have_dev) {
>>>>>> +		near = (near << 1) | near_dev;
>>>>>> +		far = (far << 1) | far_dev;
>>>>>> +	}
>>>>>> +
>>>>>> +	if (far > near) {
>>>>>> +		for (i = near; i > 0; i--)
>>>>>> +			idx += max_inst - i;
>>>>>> +		idx += (far - 1 - near);
>>>>>> +		idx *= 2;
>>>>>> +		idx += type;
>>>>>> +		return idx;
>>>>>> +	}
>>>>>> +
>>>>>> +	if (far < near) {
>>>>>> +		for (i = far; i > 0; i--)
>>>>>> +			idx += max_inst - i;
>>>>>> +		idx += (near - 1 - far);
>>>>>> +		idx *= 2;
>>>>>> +		idx += (1 - type);
>>>>>> +		return idx;
>>>>>> +	}
>>>>>> +
>>>>>> +	return -1;
>>>>>> +}
>>>>>> +
>>>>>> +static int guc_g2g_register(struct xe_guc *near_guc, struct xe_gt *far_gt, u32 type, bool have_dev)
>>>>>> +{
>>>>>> +	struct xe_gt *near_gt = guc_to_gt(near_guc);
>>>>>> +	struct xe_device *xe = gt_to_xe(near_gt);
>>>>>> +	struct xe_bo *g2g_bo;
>>>>>> +	u32 near_tile = gt_to_tile(near_gt)->id;
>>>>>> +	u32 near_dev = G2G_DEV(near_gt);
>>>>>> +	u32 far_tile = gt_to_tile(far_gt)->id;
>>>>>> +	u32 far_dev = G2G_DEV(far_gt);
>>>>>> +	u32 max = xe->info.gt_count;
>>>>>> +	u32 base, desc, buf;
>>>>>> +	int slot;
>>>>>> +
>>>>>> +	xe_assert(xe, xe == gt_to_xe(far_gt));
>>>>>> +
>>>>>> +	g2g_bo = near_guc->g2g.bo;
>>>>>> +	xe_assert(xe, g2g_bo);
>>>>>> +
>>>>>> +	slot = g2g_slot(near_tile, near_dev, far_tile, far_dev, type, max, have_dev);
>>>>>> +	xe_assert(xe, slot >= 0);
>>>>>> +
>>>>>> +	base = guc_bo_ggtt_addr(near_guc, g2g_bo);
>>>>>> +	desc = base + slot * G2G_DESC_SIZE;
>>>>>> +	buf = base + slot * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
>>>>>> +
>>>>>> +	xe_assert(xe, (desc - base + G2G_DESC_SIZE) <= G2G_DESC_AREA_SIZE);
>>>>>> +	xe_assert(xe, (buf - base + G2G_BUFFER_SIZE) <= g2g_bo->size);
>>>>>> +
>>>>>> +	return guc_action_register_g2g_buffer(near_guc, type, far_tile, far_dev,
>>>>>> +					      desc, buf, G2G_BUFFER_SIZE);
>>>>>> +}
>>>>>> +
>>>>>> +static void guc_g2g_deregister(struct xe_guc *guc, u32 far_tile, u32 far_dev, u32 type)
>>>>>> +{
>>>>>> +	guc_action_deregister_g2g_buffer(guc, type, far_tile, far_dev);
>>>>>> +}
>>>>>> +
>>>>>> +static u32 guc_g2g_size(struct xe_guc *guc)
>>>>>> +{
>>>>>> +	struct xe_gt *gt = guc_to_gt(guc);
>>>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>>>> +	unsigned int count = xe->info.gt_count;
>>>>>> +	u32 num_channels = (count * (count - 1)) / 2;
>>>>>> +
>>>>>> +	return num_channels * XE_G2G_TYPE_LIMIT * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
>>>>>> +}
>>>>>> +
>>>>>> +static bool xe_guc_g2g_wanted(struct xe_device *xe)
>>>>>> +{
>>>>>> +	/* Can't do GuC to GuC communication if there is only one GuC */
>>>>>> +	if (xe->info.gt_count <= 1)
>>>>>> +		return false;
>>>>>> +
>>>>>> +	/* No current user */
>>>>>> +	return false;
>>>>>> +}
>>>>>> +
>>>>>> +static int guc_g2g_alloc(struct xe_guc *guc)
>>>>>> +{
>>>>>> +	struct xe_gt *gt = guc_to_gt(guc);
>>>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>>>> +	struct xe_tile *tile = gt_to_tile(gt);
>>>>>> +	struct xe_bo *bo;
>>>>>> +	u32 g2g_size;
>>>>>> +
>>>>>> +	if (guc->g2g.bo)
>>>>>> +		return 0;
>>>>>> +
>>>>>> +	if (gt->info.id != 0) {
>>>>>> +		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
>>>>>> +		struct xe_guc *root_guc = &root_gt->uc.guc;
>>>>>> +		struct xe_bo *bo;
>>>>>> +
>>>>>> +		bo = xe_bo_get(root_guc->g2g.bo);
>>>>>> +		if (IS_ERR(bo))
>>>>>> +			return PTR_ERR(bo);
>>>>> A few things.
>>>>>
>>>>> - xe_bo_get returns BO or NULL.
>>>> Meaning just use if(bo) rather than the IS_ERR wrapper?
>>>>
>>> Yes but if(!bo) is the error case. Assuming a typo on your end.
>> Yes. I meant "if(!bo) return -ENODEV;"
>>
>>>>> - Checking the return seems overkill
>>>> Seems wrong to not return an error if there is no allocation. E.g. just
>>>> change it to 'return -ENODEV' or some such if the bo is null?
>>>>
>>> That's fine if want to leave in the error case but tons of places in
>>> driver don't have this check. Maybe that is an oversight though in some
>>> cases. Some cases we are in a non-failure path though. It can only
>>> return NULL if argument is NULL.
>> Indeed. But the source is coming from another GT. So technically it is
>> outside of the control of this GT. And I like defensive programming and
>> always checking for errors!
>>
>>>>> - I don't see an associated xe_bo_put
>>>>> - Do we even need a reference? i.e. The clean up is handled by DRM managed on driver unload.
>>>> Technically, the get is not required at present if the secondary GTs can all
>>>> assume that the root GT is guaranteed to be holding its reference at all
>>>> times. It seems cleaner (and more future proof) to not make such
>>>> assumptions, though. Just have each GT look after its own usages and
>>>> requirements.
>>>>
>>>> And yes, there is currently no put because everything just magically
>>>> vanishes on driver unload (same as per a whole bunch of other driver
>>> That function only drops a ref, so if you don't have put the BO will
>>> never actually get destroyed. I'd expect if you load the driver on a
>>> multt-GT device with this series and then unload it you will get loud
>>> complaints in dmesg unless I'm missing something. So if you leave in the
>>> get, you need put unless I'm missing something.
>> Hmm. Confused. I've run this code plenty on various types of multi-GT
>> devices and not noticed any complaints. Do I need any particular CONFIG
>> options enabled? Pretty sure I've run with the regular kernel leak detector
>> enabled but maybe not in a while.
>>
> I do bad things locally that leak memory all the time and IIRC it
> usually the TTM memory managers complaining about being unclean. I just
> looked and didn't see anything but drm_buddy_fini appears to have a
> couple of WARNs that should pop. So maybe this only shows on VRAM
> devices. Have you tried this on BMG?
Blurgh. It helps to actually unload the module! I keep forgetting that 
the kunit version of selftests doesn't reload the module for each test 
:(. Yes, it does leak. I'll fix it up.

John.

> Matt
>
>> John.
>>
>>> Matt
>>>
>>>> internal BOs). The selftest does require dynamically releasing and
>>>> re-allocating the shared BO in various different configurations, though
>>>> (including different per GT splits that mean the root GT isn't necessarily
>>>> owning the allocation, it might not even have an allocation). That code
>>>> isn't included in this patch set at present for a bunch of 'not ready'
>>>> reasons.
>>>>
>>>>>> +
>>>>>> +		guc->g2g.bo = bo;
>>>>>> +		guc->g2g.owned = false;
>>>>>> +		return 0;
>>>>>> +	}
>>>>>> +
>>>>>> +	g2g_size = guc_g2g_size(guc);
>>>>>> +	bo = xe_managed_bo_create_pin_map(xe, tile, g2g_size,
>>>>>> +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>>>>> +					  XE_BO_FLAG_GGTT |
>>>>>> +					  XE_BO_FLAG_GGTT_ALL |
>>>>>> +					  XE_BO_FLAG_GGTT_INVALIDATE);
>>>>>> +	if (IS_ERR(bo))
>>>>>> +		return PTR_ERR(bo);
>>>>>> +
>>>>>> +	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
>>>>>> +	guc->g2g.bo = bo;
>>>>>> +	guc->g2g.owned = true;
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int guc_g2g_start(struct xe_guc *guc)
>>>>>> +{
>>>>>> +	struct xe_gt *far_gt, *gt = guc_to_gt(guc);
>>>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>>>> +	unsigned int i, j;
>>>>>> +	int t, err;
>>>>>> +	bool have_dev;
>>>>>> +
>>>>>> +	if (!guc->g2g.bo) {
>>>>>> +		int ret;
>>>>>> +
>>>>>> +		ret = guc_g2g_alloc(guc);
>>>>>> +		if (ret)
>>>>>> +			return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	/* GuC interface will need extending if more GT device types are ever created. */
>>>>>> +	xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || (gt->info.type == XE_GT_TYPE_MEDIA));
>>>>>> +
>>>>>> +	/* Channel numbering depends on whether there are multiple GTs per tile */
>>>>>> +	have_dev = xe->info.gt_count > xe->info.tile_count;
>>>>>> +
>>>>>> +	for_each_gt(far_gt, xe, i) {
>>>>>> +		u32 far_tile, far_dev;
>>>>>> +
>>>>>> +		if (far_gt->info.id == gt->info.id)
>>>>>> +			continue;
>>>>>> +
>>>>>> +		far_tile = gt_to_tile(far_gt)->id;
>>>>>> +		far_dev = G2G_DEV(far_gt);
>>>>>> +
>>>>>> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++) {
>>>>>> +			err = guc_g2g_register(guc, far_gt, t, have_dev);
>>>>>> +			if (err) {
>>>>>> +				while (--t >= 0)
>>>>>> +					guc_g2g_deregister(guc, far_tile, far_dev, t);
>>>>>> +				goto err_deregister;
>>>>>> +			}
>>>>>> +		}
>>>>>> +	}
>>>>>> +
>>>>>> +	return 0;
>>>>>> +
>>>>>> +err_deregister:
>>>>>> +	for_each_gt(far_gt, xe, j) {
>>>>>> +		u32 tile, dev;
>>>>>> +
>>>>>> +		if (far_gt->info.id == gt->info.id)
>>>>>> +			continue;
>>>>>> +
>>>>>> +		if (j >= i)
>>>>>> +			break;
>>>>>> +
>>>>>> +		tile = gt_to_tile(far_gt)->id;
>>>>>> +		dev = G2G_DEV(far_gt);
>>>>>> +
>>>>>> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++)
>>>>>> +			guc_g2g_deregister(guc, tile, dev, t);
>>>>>> +	}
>>>>>> +
>>>>>> +	return err;
>>>>>> +}
>>>>>> +
>>>>>>     static void guc_fini_hw(void *arg)
>>>>>>     {
>>>>>>     	struct xe_guc *guc = arg;
>>>>>> @@ -423,7 +688,16 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>>>>>     int xe_guc_post_load_init(struct xe_guc *guc)
>>>>>>     {
>>>>>> +	int ret;
>>>>>> +
>>>>>>     	xe_guc_ads_populate_post_load(&guc->ads);
>>>>>> +
>>>>>> +	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
>>>>>> +		ret = guc_g2g_start(guc);
>>>>>> +		if (ret)
>>>>>> +			return ret;
>>>>>> +	}
>>>>>> +
>>>>>>     	guc->submission_state.enabled = true;
>>>>>>     	return 0;
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>>>>>> index fa75f57bf5da..83a41ebcdc91 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>>>>>> @@ -64,6 +64,15 @@ struct xe_guc {
>>>>>>     	struct xe_guc_pc pc;
>>>>>>     	/** @dbm: GuC Doorbell Manager */
>>>>>>     	struct xe_guc_db_mgr dbm;
>>>>>> +
>>>>>> +	/** @g2g: GuC to GuC communication state */
>>>>>> +	struct {
>>>>>> +		/** @g2g.bo: Storage for GuC to GuC communication channels */
>>>>>> +		struct xe_bo *bo;
>>>>>> +		/** @g2g.owned: Is the BO owned by this GT or just mapped in */
>>>>>> +		bool owned;
>>>>>> +	} g2g;
>>>>>> +
>>>>>>     	/** @submission_state: GuC submission state */
>>>>>>     	struct {
>>>>>>     		/** @submission_state.idm: GuC context ID Manager */
>>>>>> @@ -79,6 +88,7 @@ struct xe_guc {
>>>>>>     		/** @submission_state.fini_wq: submit fini wait queue */
>>>>>>     		wait_queue_head_t fini_wq;
>>>>>>     	} submission_state;
>>>>>> +
>>>>> Unrelated.
>>>> Sort of. If the coding style is to have blank lines between sub-structs then
>>>> adding the g2g struct ahead of submission_state gives it a blank line above
>>>> but not below, which is therefore wrong because it is both mis-matched start
>>>> vs end and not following the style guide. On the other hand, if blank lines
>>>> should not be included at all then the lines before/after the g2g struct
>>>> should be dropped.
>>>>
>>>> John.
>>>>
>>>>> Matt
>>>>>
>>>>>>     	/** @hwconfig: Hardware config state */
>>>>>>     	struct {
>>>>>>     		/** @hwconfig.bo: buffer object of the hardware config */
>>>>>> -- 
>>>>>> 2.47.0
>>>>>>

