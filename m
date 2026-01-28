Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6472D46C06
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 21:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797F210E0E4;
	Wed, 28 Jan 2026 21:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU8ySJNn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B695E10E0E4
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 21:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769637156; x=1801173156;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gv/auXWlrNTtqJcFfU/ehFwpcEsYD5xTzJ0VF/0i6Kw=;
 b=HU8ySJNnoWfV1zagfvKD4lk7gzL+1INBYOZ/X9wWQt8nhn3Dkk1vbito
 GrWF5b8+q0lKD7vJSjrg1TSPMeNIvceNsqQqk9CSKdTx/Gltjmcs4sQGa
 k3u1Veuu2PbrbbG6ae9U7CWA7ddAig+hwumfAeg70BfJCKm4M4/HtHxdH
 +PxGvTawGLkWThq7fcLIyxbzEnGlarN58jcTdKkkvnzLLIoOvHZedzVdJ
 k8iMmW4PQkq9JwYuMXslY1dCrY36fDvfR9wEjJcEj7zhGvH6kEVdQ8IHA
 nIzNUVK+IqhlgYBfpQLJfZh4qnHYQUiOFUdlTVkAF1942TQnsL7WsT56B g==;
X-CSE-ConnectionGUID: wX6CM6BiQwimWSLbT7SMbA==
X-CSE-MsgGUID: d4oT7bstS8GzvUV9vNQXuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70765353"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70765353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 13:52:35 -0800
X-CSE-ConnectionGUID: VelbVnv/QHmrhi3TLiTy2g==
X-CSE-MsgGUID: AanaoqWxS2itvZ/owJAM+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208622487"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 13:52:18 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 13:52:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 13:52:17 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 13:52:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UE7425JLvyR5UYUel6rm+7OB1yzMCjCBFAWZsxjNeY+zOUTvsy9wQBQDI+XVnt2M8IMPPvzJWrrsG4Y8MsDXXCBmc7n+qI/L/lcWHv8oFfBWnOe+OHfXCA7h6fd1rBi+Wrcbuc4VN0J8ihpDOxHNtEdbb6wYHfZPRyNhUrjWVyPWXkr5hk+vvoSqO/SpwxaIALwO23DcndNvNLXPpD0Ic2sz/fGKLSFy4xSmKLrl1S00c6FEjxcsigZEiScFq1QFLuzGMj1ha+VUtANu64vTohhq2By3tK0XEAY2QGA9uhgQVodXjSIBQYQS/S8kv62zH3i14F69CqQBePHTJCSBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EMfNNkwrigqdt0rmhRFIxQjanc2hnZtmiApNJ4eOMc=;
 b=StNhuwQwcj8iv6grWF7zXVlWw8TAG4BRxLjWB/I8kZ7ilfQLhNfqBX0BSTwKhnadaaYZo7Jv7Ll11jF5eVIxgY7ue4EDYyGHdl6ywNOWqLU/94Glvioyu3HnBr6m1Z0CLNkZIkVAaYGClsHdjqWcLvntvDanmloUgyAGFI7YIxVEsME6R+ABsqilyB+lISHFbtpBnbZxcqCSGYmuAdtjZ0Qve7TN35i7yhXJ+4KxHxDNbrTgrY7JMPc8JTuHf41KTag0ZBjp5QLfiW+4Cd81aUDPihsa/st48lGq0BLNHm6KlcU25zCfNo4Vn0I9oP43ti/Ez+HblMWlVgNvh5KVtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB6622.namprd11.prod.outlook.com (2603:10b6:a03:478::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 21:52:14 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9542.015; Wed, 28 Jan 2026
 21:52:14 +0000
Message-ID: <571da6c4-93ab-404c-821a-c813650d65ea@intel.com>
Date: Wed, 28 Jan 2026 16:52:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe/gsc: Fix GSC proxy cleanup on early
 initialization failure
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260127024315.359176-1-zhanjun.dong@intel.com>
 <b6736da7-a430-43b5-bf48-d09a2af79af0@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <b6736da7-a430-43b5-bf48-d09a2af79af0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::9) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 593ac69a-4c65-45d4-7279-08de5eb77f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWowemwwL0FNbzYwSEtreCtwWlBsRWFpSlczQU5BVGp2SmdVUGZCMlNVdFR0?=
 =?utf-8?B?NnJaZUs4TndBak9ZOWo1dUxNc2RjS3VldVNZNGN6RmNUektaM1BvM3lEbjdQ?=
 =?utf-8?B?bllzVGllOEJJeERFU2FjdUtBZk5CZ2MzN1NIV3BwYUJaRGlSTFdBeThqUkww?=
 =?utf-8?B?SnV5NDJibXd2bXp5Rmd4MThxSWgvTmZqTVZPd1p4dnJKZTBrU1A1cE42U1dI?=
 =?utf-8?B?VGNRaENmYmNQcGl1NmVqaFZxSGdNZ0NkOHlRbDJjcWZzN2kzcGZESHhMNkor?=
 =?utf-8?B?MUZqYU9MQndoeDBMZ2xmVVdKRU94VmJ2TWYvU2pxcjU4YzdQOGJyaEJaQlh1?=
 =?utf-8?B?RXlYYUNhK25NdmJzM0ZRaXlJV2JJcmsxNTExaDkxNUxzWjRkZUdibUJ1M2Er?=
 =?utf-8?B?WEI4LzBzRWoxRmloTTNBOFRTbXMzVkVaTzdGU1NWMVZUbDRRd2NzZ3BGZk5i?=
 =?utf-8?B?RHdrNUt2L0E1dWlsa3dtMjBzRXdidjFzR1g2V1JGOHMvTnhrbFhvaTc1NkpE?=
 =?utf-8?B?bm9UVWQwZ2RHM1ZuMUNBc05xL1U4SzFUK2l5S0VQKzJRb1FTamZGZVkwVWlU?=
 =?utf-8?B?V2d5NnJnVG1pVjV6ekRMYmFQc25scWZuY01VeWZ5anBCdTFpYWhzMFhHZi9B?=
 =?utf-8?B?amtId0grYzV0S2t5OUNQbkZSZFVHa1hRSmRxZmJlUkRiUVd0eEt1dTd4ek55?=
 =?utf-8?B?WVUyNmpkbVB0UHRLendEY0t1T0VkUFVIUVVwMFd5YzV2RlFFQ1E5UWt2cXlT?=
 =?utf-8?B?cW52QTBmS3QwK1JrQXFjWmt5Y3JiT2d0N0NrSmZpVnpKVUpEb1EvZ2g0dFVK?=
 =?utf-8?B?N2ZOQVdoZHEwdE5MM1pTdFVTblNMM1lvbGI3MWcvRENQalBETHlaOHN6bGFj?=
 =?utf-8?B?Q01BNUd2MEdIdmMxbkY4elplb0Rwb1pKa05yK1lJbytiVytpc2RYKzhabFA1?=
 =?utf-8?B?dEVqOGlrZFJSZ1lZbmNIYm84S3gzTEZ4NXRhTDlYOGRndFA2NGdUL3cxVEtn?=
 =?utf-8?B?NkVvQmRJczh3RVdPUFBUWVZwVnRaVkhtMlozaEhMV0U1NFQxMmY5OW5sN2lQ?=
 =?utf-8?B?bGhhdmNmdlFMMm1DS1RCS3JBZmlUbFNrSzFPNDdydDBLZ05lSzZOV281VjFt?=
 =?utf-8?B?cUt4OEtWenprSUhoWkEydy90M1FwV3BtQkJvbjFLakdtZGQ5bk5kRmFhSlpG?=
 =?utf-8?B?cExOQ05sUzhFUWVjQ0hYU056N0hPamNid2tkd21oZVJwZ3JOQ2d4N2lPMUd4?=
 =?utf-8?B?NGNsajNyVUZkNFB4VnJoOUM1bFhicVlpb2ZvWm12QmFrNXFXcDJxK0t1a0hT?=
 =?utf-8?B?cjR3b3EvWVZCU2t4MndYb1ZYZkxWa2gwS2xQSTRGNHkvMVBLSnB6RlpZNTFM?=
 =?utf-8?B?TUFrMC8vNFNtUkFKN05xYU9YelVQbU82OTA0SWxxRTNNZVUvcjQ2UjcvQ2xO?=
 =?utf-8?B?OEFxM3ZhWmtXOVMxSHZjS2pvQVJqc3NucFhzSTlmV1l2Sm40bzNhdXBUNXFC?=
 =?utf-8?B?VjZiUGV5azg4RDl2RHRLV3pGMEhxVlRKZEEwSmhoTHVSc1RCK2pRN1NJaHN1?=
 =?utf-8?B?TGU3QmVIK2xPRGhLNDVSS3dKaGZ0aTJ2S2lnM21jVWRLQ0Izc0tCMTN4Y1Ux?=
 =?utf-8?B?T2x2a1VMb3JCUEtBSC94WUdYa0FkTVd0N1cxaTJYREtGZm1aSFVobjBiMXJJ?=
 =?utf-8?B?U0tOZnF6YWt5dDFldmxaQjIyZlhoTGZYTHQ3YWxqZ0FYQytPUHlrR2JHUnB5?=
 =?utf-8?B?dlYzcVd1a1Z6Rmw5emVBbTZScWp5VUUxWnV0KytwdFVCSTZranpydzA4Qmdq?=
 =?utf-8?B?dVM5VnpmaHhNMFZ5eWFQOUxWWWZZdktHak5ubWhzcVgzTzZheDVIR3pxbXNU?=
 =?utf-8?B?bUVud3JxeTFWa1RSTFhuTmsrRGpYb2NEUi94QmtGaXVTWmQ1T1YxVkFLa1ZL?=
 =?utf-8?B?SFVCaFNJdFpDVUFhWldoZ2pBbU5RWHNTMFYzRXArajBtOWl2YVQ1U0dpY1Nl?=
 =?utf-8?B?c052MzM1OEtUbjh1Q1lFcTh5RFRRZndqdEVXaXpNbmNyOTYxem9VWjRyeVp4?=
 =?utf-8?B?bW5uYTdqci92OEw3V21NQWhSY3VyZDdkdXdQYTdQdzFIWU1kY1Jub0o3Uy9I?=
 =?utf-8?Q?TGJw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmZ1VFFla3ZvTzRBTERwWWN1dTJtU3RJZVllQms2K09lSENrQVFaRDcyS1JX?=
 =?utf-8?B?T3Z1VnhjcjdLaE1RUktZMjRocGtDanA5dnEwS3lsT0cyckowK0cwaE1ZVXFh?=
 =?utf-8?B?WnMyVWNCSnhpTWVWQ09HV0xoYmREb2xWUklCakh4RFVDZW45Yjcrb1c2SGVX?=
 =?utf-8?B?TUp0MXhSM0tZMVVSMVg5YlBCcEpGZFpJekJkc01rOFpuZElwK3RMVEk3Wm5t?=
 =?utf-8?B?eGh0bmpBRmFoaExJV0FkMS9FSUNpOGRIVnc3VHRzemtBcDhUVm9rVXFELytH?=
 =?utf-8?B?ZmFxNWZuMWROVm44UlgrYkV2KzMyVkRqV0FiUjljcFpsTCtQSUJVYlVqUW1V?=
 =?utf-8?B?Ui91VVpxSm12a2hUZVRhaFh4ejlsT1BwZ003TlBrNi8zRmIzeGZzQUpQbktH?=
 =?utf-8?B?TlFUcU9mWnhwblBHUGtQU3lzWnJuV2lzU3ZMTHBVMHFIcmZ1c3MxMDV2WUor?=
 =?utf-8?B?dWZqZ0NlMTN4Mkk4Z1hIMWVqdzV0M2hSanVFZUZFcVZyWTlldk5XRmJYUmVu?=
 =?utf-8?B?emw4VVhBMS9SUmlVQWVhdUZqU1YxQ3JvaGNVdHJ3RkF2L2MyYVMxY0EwS3F1?=
 =?utf-8?B?YktxbjFOS3pwc0hIWXFVQW9sZjJlb3g2V3krUHB0SG5lSFpQUlhRNGJna1Fq?=
 =?utf-8?B?ZXErNnFZQ0F0Y0pNaXhUS2NoaU5HZFl5RlpoTDZhN3c2QXJxVEsyYUIrTUdO?=
 =?utf-8?B?ZzA4SkYxN2hMQVo4VUpUSk05YkovZUE2bGxUM2wrN0ZqY1pHWHlITWtmRXBo?=
 =?utf-8?B?bGJGUnZLR1FMaGhHTkVLT0taSGVuekVXdWJhL1F6MVBUcktiMFByd2M0TzRT?=
 =?utf-8?B?OTZXdlBUUzFDd2tGTFRvNEo4RWtPWVIyY0wvQjRYQnYxM3FTbVhqVWNjT2E5?=
 =?utf-8?B?QVM4Z3RneGszYTdWbkRIOGRCN1JVcENRemtvbzdIYityWW1MSFl1TTRwRmVN?=
 =?utf-8?B?T21TcU1RNHJSeUNBdXpQa25YbmQwaDFXL0o5dzE3VHYycjRhZndLQVRMM0ha?=
 =?utf-8?B?S1ZkYUF3dCtIRVl2cTlDbXkzdy9nK0F6SFlSS000ZWt6NHhiclE0TU51ZTlD?=
 =?utf-8?B?RTMrcjdTNFQ4ckNuQzB1RzFDWUpKZG5mcXBYRzNVR2RMbUc2MWlWUjJyVkFh?=
 =?utf-8?B?a0Y3V29MZDE1MWhKSHRWSWdtcnVOZi84WmRLZmRqMnpYVzAvcVRtazJHNm91?=
 =?utf-8?B?b29IdzVFVjJ4N1ZraERGRzRZOUZ0ZmZjTWRQaGdzR2Y4RGZzV1k1OWZtbHdJ?=
 =?utf-8?B?MlJNTWJack82YmJjQUdVNUNuYnJGQXJwTHJwUFJtQklTa1p0aDNSclNOZnBo?=
 =?utf-8?B?dkErMEdxVUNOY3BVcS9SS1BwZXdvWjBhMU5rQW0rOE5WVWl6K0puaFVrNVc3?=
 =?utf-8?B?SGF3eENxbGdSMmQ3Qm52MkRMR2JDUEJYZlFHV3gyeTFHakc2YzJTam1ER1FC?=
 =?utf-8?B?Z1NxL2NMMllKZWYxWndGWnY1RnN5NWRUWmtMSjJySExPNjcrYXV0UStEa0V2?=
 =?utf-8?B?TFJiRUlSL3ZBN00vVlBPS0hVR1FXeWgvanZzcVZhVjNpRlg5QnlIRlNJSmNt?=
 =?utf-8?B?NHo0Y1NucUszRk5ZS2l0dXlkY2U4a1IyaEpHbWFYd1J1L3BiOVloYiswenhO?=
 =?utf-8?B?QlZ0TUk1bm5aSFczdXJrTEdoY2RNNGNBNGJyRFp1bS8rSEVZTFNKY0xsQ3hP?=
 =?utf-8?B?OE1hZDJTdGwvUGVTVkVlVy9reVVxY0VZSStwT25PVkpWRnpTYitMcnVLWU5u?=
 =?utf-8?B?czE4R1pvanNGTUphM1Z5bVBRUEpLcXNmbVlITU1sMDkyckxKYXFlVXByeW4z?=
 =?utf-8?B?RWR5QzdXUVNUbnJMcnh3cUFXM2dVSERwZzNpTFdvRlpnQjgvcVBITGpMaldy?=
 =?utf-8?B?RTI0SnZHUDEzaVNsWGpwdXZsZ1M4d0x4WnZmUjVYaWFkSStIWERoUEVJNHp1?=
 =?utf-8?B?S1dkclBBS3NEOFZSR3J0blJKRUlEbHFGY1oxdDIrK0JaZnpGRSszNTNiRnZj?=
 =?utf-8?B?U1pRR3BwK21hZTUxWDdEZDRxMUxESEovTUFHdFNGWjRkV2NHamRPVzZTeGxr?=
 =?utf-8?B?eDg4dTVXM3F0MytFdXdxREFaSHk5eXNaazR1MGFDMk9WWjdXTkN0OG9zS0M1?=
 =?utf-8?B?OUZoMDMvUVltZklqYmV1Q0V5ZjBiYzkrZ2xQSTNTbm1JblBsUFRnY3N6akc4?=
 =?utf-8?B?NDF5eDBBcCtQZkpDamh2UlFNZkdQR1NVaFBRVUVtR3A4Tlp4cG84bTVEZ1la?=
 =?utf-8?B?amFnQkZTdXRjZzZwVEV0OEN2ajJsc3ZyMlJqSG9XTzhEWnRKamlaS1pOaFVj?=
 =?utf-8?B?Q1A2TjYyUlJMa1FCa0JSbzRHNDhOZndFbmtlYmVGNmg1WWZqUlNBdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 593ac69a-4c65-45d4-7279-08de5eb77f18
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 21:52:13.9867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcBlf11gJQBWNb4wt8Hbx/sS45tVwdWqn1e+ugbdnScbJL2qgCFRIKLuKTGifoD9B/w9I++LZMlT+Z1pUVTg7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6622
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



On 2026-01-27 6:32 p.m., Daniele Ceraolo Spurio wrote:
> 
> 
> On 1/26/2026 6:43 PM, Zhanjun Dong wrote:
>> xe_gsc_proxy_remove undoes what is done in both xe_gsc_proxy_init and
>> xe_gsc_proxy_start; however, if we fail between those 2 calls, it is
>> possible that the HW forcewake access hasn't been initialized yet and so
>> we hit errors when the cleanup code tries to write GSC register. To
>> avoid that, split the cleanup in 2 functions so that the HW cleanup is
>> only called if the HW setup was completed successfully.
>>
>> Additionally, fix error handling in xe_gsc_proxy_start to properly
>> disable interrupts on failure paths before returning, ensuring cleanup
>> is performed correctly when xe_gsc_proxy_request_handler() or
>> xe_gsc_proxy_init_done() fails.
> 
> This second one is not a fix. In the current behavior, if 
> xe_gsc_proxy_start fails then xe_gsc_proxy_remove is called and the 
> cleanup is performed correctly. Since you're removing that part of the 
> cleanup from xe_gsc_proxy_remove then this new change to 
> xe_gsc_proxy_start becomes necessary.
Yes, to be updated in next rev.
> 
>>
>> Fixes: ff6cd29b690b ("drm/xe: Cleanup unwind of gt initialization")
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>> v2:
>> - Split cleanup into two functions: xe_gsc_proxy_remove() for SW cleanup
>>    and xe_gsc_proxy_stop() for HW cleanup that requires forcewake access.
>> - Add error handling in xe_gsc_proxy_start to disable interrupts on
>>    early error exits.
>> ---
>>   drivers/gpu/drm/xe/xe_gsc_proxy.c | 42 ++++++++++++++++++++-----------
>>   1 file changed, 28 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/ 
>> xe_gsc_proxy.c
>> index 42438b21f235..0f62ee7dab4a 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>> @@ -444,16 +444,6 @@ static void xe_gsc_proxy_remove(void *arg)
>>       if (!gsc->proxy.component_added)
>>           return;
>> -    /* disable HECI2 IRQs */
>> -    scoped_guard(xe_pm_runtime, xe) {
>> -        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
>> -        if (!fw_ref.domains)
>> -            xe_gt_err(gt, "failed to get forcewake to disable GSC 
>> interrupts\n");
>> -
>> -        /* try do disable irq even if forcewake failed */
>> -        gsc_proxy_irq_toggle(gsc, false);
>> -    }
>> -
>>       xe_gsc_wait_for_worker_completion(gsc);
> 
> in v1 you had xe_gsc_wait_for_worker_completion moved to 
> xe_gsc_proxy_stop(). I think that works better, since the worker 
> shouldn't be queued anymore after we disable interrupts.
Sure, will follow this in next rev.

Regards,
Zhanjun Dong
> 
> Daniele
> 
>>       component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
>> @@ -502,6 +492,23 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>>       return devm_add_action_or_reset(xe->drm.dev, 
>> xe_gsc_proxy_remove, gsc);
>>   }
>> +static void xe_gsc_proxy_stop(void *arg)
>> +{
>> +    struct xe_gsc *gsc = arg;
>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +
>> +    /* disable HECI2 IRQs */
>> +    scoped_guard(xe_pm_runtime, xe) {
>> +        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
>> +        if (!fw_ref.domains)
>> +            xe_gt_err(gt, "failed to get forcewake to disable GSC 
>> interrupts\n");
>> +
>> +        /* try do disable irq even if forcewake failed */
>> +        gsc_proxy_irq_toggle(gsc, false);
>> +    }
>> +}
>> +
>>   /**
>>    * xe_gsc_proxy_start() - start the proxy by submitting the first 
>> request
>>    * @gsc: the GSC uC
>> @@ -510,6 +517,8 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>>    */
>>   int xe_gsc_proxy_start(struct xe_gsc *gsc)
>>   {
>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>> +    struct xe_device *xe = gt_to_xe(gt);
>>       int err;
>>       /* enable the proxy interrupt in the GSC shim layer */
>> @@ -521,12 +530,17 @@ int xe_gsc_proxy_start(struct xe_gsc *gsc)
>>        */
>>       err = xe_gsc_proxy_request_handler(gsc);
>>       if (err)
>> -        return err;
>> +        goto err_irq_disable;
>>       if (!xe_gsc_proxy_init_done(gsc)) {
>> -        xe_gt_err(gsc_to_gt(gsc), "GSC FW reports proxy init not 
>> completed\n");
>> -        return -EIO;
>> +        xe_gt_err(gt, "GSC FW reports proxy init not completed\n");
>> +        err = -EIO;
>> +        goto err_irq_disable;
>>       }
>> -    return 0;
>> +    return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_stop, 
>> gsc);
>> +
>> +err_irq_disable:
>> +    gsc_proxy_irq_toggle(gsc, false);
>> +    return err;
>>   }
> 

