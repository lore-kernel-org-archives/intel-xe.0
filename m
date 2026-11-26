Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B6B606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YjNfU26Z;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=HKz7/I2E
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3CC11246A;
	Thu, 26 Nov 2026 14:18:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BB411246A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 14:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795702688; x=1827238688;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=OyUBPDagEeJOgAcpDuJNT8HMNTMgEhi7cBmVLZYMxzE=;
 b=YjNfU26Z8wI5BNvMTrAZpLBkXBLPZ4o7dwIruJBr/pZrPLSMiCmfBRAT
 SFVj2cQBqUWwvsQn+pMNytcbjPEw7TxZ1feEcS3s86bYeGa/4qDhE2JMU
 ZcvonfidM2kqGe4VNBauN8MiIJ7SDA3LXI0U+WJ0UglJdKrjEnXRHpiPN
 odLm1x2zr8AKGPsT9uLhLAs5Q/D34SXtWDeQ9nmLCF5gsV+XOtiwAwn+N
 KvUtEIS/OfGV4IfbbmceMKTIF0Vla8stK6+AgZe47aY8uEGQkRvuoGkfW
 zf/+d6B50J1dooqPnJBMUFW9wMA8MhVvwWep433iDuh2tuuhY8pIxdFt8 g==;
X-CSE-ConnectionGUID: syegKONKS/OfGWdcVNOk1g==
X-CSE-MsgGUID: vzyvQXG3RluVA18H2eGFng==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4684159"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4684159"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 06:18:08 -0800
X-CSE-ConnectionGUID: nhZ+QzFNSHOmVhGOOxQBAQ==
X-CSE-MsgGUID: 7OJqRmfCS6inmPgoKpMwSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12043098"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 06:18:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:18:06 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 06:18:06 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:18:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lL6O7DAkm8iXNif0mqJ3EZiUtSpAW941PTCEOVt+DbqREURn8tcqSEG93DSzG8yAiGspuMsgqdRp1gYk6tS/35HduKvt7Z3r8A3ujhu9ltpdQusDlB6QVW8hWVv8zZVNJ051lnQ/Ts5wN/A2NRlUcA/SAOKZFzvz9aUQCCT5L/CKwac82XUQncal76GeeZNXFH/xcdLVPwWpptuXPQpLAXVJJMToLVPvulV1DDmNeV+o9Tdke56vnwdDUv/ciCLL7JJKiMPOJojS57voT/H4SemMjJ3mMCjiqV4ZtM/WgSGph9KoKhhTkxmjy06IvO3NXxGwpc+Nhz7fB5sephqvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8D1sBYpgNh9fssdYUjJ2q2QMIO7Ow7vxcnXxx2qCTi4=;
 b=gTCm/sgcmNCsf+a4kRIHqsGP1kY6kEiA2Vklu4eR59dLjQ2MA4TnD+NgR6x8S7hAz0YdRufFU3FYkAlLy52yW6F9/cUwUl2TxLSPtWwepQfRkGQb71wryXKDtGxatXlyHr3kAIjZ8rA38C4K35ERlSKpNbNy1Oy+kedpcJVNFNWO7nwCh1lVwYxbHZzJqb2M15sEPKihNsgV081W2aKtoh/CtC855V3rcKHWS13JXk6Jaz8xJ4OtGM1x11FPbfDVKis3JK9T2kZwWQqWgJItauBFTdnQb9db3Wvs+7pnPH5dWtChMsNEvYS1fZz6O/a4pTK4ne8YvFWm0TblzyEzLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8D1sBYpgNh9fssdYUjJ2q2QMIO7Ow7vxcnXxx2qCTi4=;
 b=HKz7/I2E/KXtKDBBTCB0t6cIBrOLUF+ZalgqS4gqZC+fXBiLgDYTp/VspQ+jtcM/gDcEQNAbQ5mynIIK/5vRbgeff+XGaa4UpauYekiYc79GzDITZ6r4LDud2GTiLVUoDeCj9cmewR0xzOZUIcAdx1j0+t6nE9Wd6rtIniip9Ns=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 14:17:57 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 14:17:56 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>,
 <tilak.tirumalesh.tangudu@intel.com>, <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Print has_sem64 in debugfs info
In-Reply-To: <20261126130802.1258172-1-tilak.tirumalesh.tangudu@intel.com>
References: <20261126130802.1258172-1-tilak.tirumalesh.tangudu@intel.com>
Date: Thu, 26 Nov 2026 11:17:52 -0300
Message-ID: <875wxjad7z.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|DM4PR11MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 7debaadc-b3aa-49da-ce4f-08df4bc81167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|261009223027099003|18002099003|22082099003|261022075727099003|10067099003|261102123227099003|56012099006|11063799006|261026140227099003|261022105027099003|261028144727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: yVaW70aKnbaLzmZYg5CKTr31V5p2HmFv4wnl3fuoXZBkqstcrHZAsfg68XA0QdvjKqdrx+vU3d/uSlYZdmxdwBeXQV3fbWMq84a7R7atp/lvXFY+gs2IjmrA4QdEKYI93E1uDrBcc5ZZ8zbGcz/4EoxS+wLCjnir9cfHYdZzP78WFTNSucZ3bPJEhK8JuVWFeL9EVUgoYWqnRTYyDj+eRmQslaaGcqmxdsx6oQkcdfu//1vreudQKr66TB0NTX8Xeb2tDhL1vZIFPTbcOpuIQZ0oBjlEgAcdKDf0bWNTuAzDUtP4mxFJEcdilT1+kHJwt7AJm0yG91WNrnecbAof7odoB0Hn0UdgDrjFD5wWCfUlif9QF/lE3jgRzLfuFNazGAWM+9vlgnGF5PhrB4z7IOgmvUu4cORiPT7ZgJ01L6Pa2P+RyOsM88IO+jflGZc0ML3Sn8/rb9dz2+pCdW+RGsRqOfM+Z+tbTxpnnfCYaiFB2aucVaYBXxPo9vATQo/Af3IY+6+qIMzgx7VCl8CdLnfdH/YYwyCYNT9bOVe0O2QmjwelsFgA35auVPpAHLPrilTqH0etvpHNBd5WSeiBRYMxOCJiZvPU9ofOIOrSnroQfZjriiYnXQkl1sfG0IVo6b418pvPCa+Z1vNDY+gU/JR8lnGXy/q6DK0/RlwJD6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(261009223027099003)(18002099003)(22082099003)(261022075727099003)(10067099003)(261102123227099003)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?irZRCBrR8rDqExfEKHv7/Yhpx/Fgkn5DEE7UKV6gwWFO3/Fi6EOkHxLmJjKf?=
 =?us-ascii?Q?R2KsrG9o3h3K+xvAhDTLB2o90xTT6E+n3B90JugPF+o8AkR2t3CoioFMFsbU?=
 =?us-ascii?Q?j0Z8dXFhyQAnqMhlUpNO3KD/BCHzQ+KCYrticTU9jHUL62O0iW8VOYVDxBam?=
 =?us-ascii?Q?dQ+lrjjV5BauIrYXNli2xwTzu4tXlM3YsmOiSMWbqJALjCico7XbxTOyMTZp?=
 =?us-ascii?Q?W2fgwRJozKKWfY2Ye+4excJQQZYtXrsnxyevM/nelUbqihJC81fFFeAIKutk?=
 =?us-ascii?Q?3CMTOO9WukveB543JVoVOiGKMAOxBzUyTbnJlCuS7q+6P2wxgud/FvG2iE59?=
 =?us-ascii?Q?QIxmJiD+85zlyxOfvVl+TPCKFAIpVu8JJdWjIDeqeL7u4DsAiwMg/85jFvzX?=
 =?us-ascii?Q?+vpZYqaUGzAOUSN0qHPwxUmO55B+4/6EOutJehktajRzKUVoH75nZhDEmoKJ?=
 =?us-ascii?Q?9QUqyuLlj/lpd28SnufB32ImSg/8iA3MhQuun9N/4Kdm7H+lhzyQO04ZdlUX?=
 =?us-ascii?Q?ohtCCLZUxDJ8qTdDkJnyXaWZzJnQLj36QhybuNaBepusWmaJqmDW8WbGmLMA?=
 =?us-ascii?Q?we4WWYxxXVAplUICbYNMsEvi1dTaB1T3/SzVd5S2c57C9PCQHkiiXdV/QDKA?=
 =?us-ascii?Q?YtdBJTbptVTm916EncUGUO0CiLvOA0cZCpyz3d6om8UyB6wJSTFuadcLOvVr?=
 =?us-ascii?Q?by3aEv6YYCYU2qErhiTxNk58f4RBQZw6Qh8PC0rjEqh0pn3TeHpt516TObXL?=
 =?us-ascii?Q?oUjE1X7YFKIy2JrBD3Tpmyp72qmxiau827FL/2WXPGzFIWPbV/7mLMPoTIgz?=
 =?us-ascii?Q?u0Z6IBGkhp23wK0tVQm1PEXYFF97vM78xQGpycKM2fQavqittokAdXl5XjaZ?=
 =?us-ascii?Q?Sw115tr3GBTFEopvA1dXkiP32fkDQfnJFy+znktMRHK2l8fQmpX1mTKk8XH4?=
 =?us-ascii?Q?fAn8oxgC003X9NkeAspHszWBh0EBRiFDlnWrHBd05eI626DZwSY4DxPHpGLA?=
 =?us-ascii?Q?gyfd0XTeZPra3IGojdGNsrT4ihkPjRDa4bFaFZa7IwsKaVdsNmJHXQFUa8JQ?=
 =?us-ascii?Q?K1RNVCcxen9Ds72SSVVYy/lziFKXY9iUFRpTcT4lrnIDx9YCSlG5sxWnEnoA?=
 =?us-ascii?Q?rT7YURSMTh1sAkUhx+3iUImSvZjRmHi8sChE7NoVQvGGuM8sIR557yKDRBEl?=
 =?us-ascii?Q?+Zywdf5Omv4YQ9FpohIYx0emX/2RBHit7SElpqPWetHqoDxjzr9uwLGGPeln?=
 =?us-ascii?Q?FZvPoqCM0UQ7pILi1HpfOXkDT7jMXYCW79gjpGgzsiff7QfNH8fgW1olbGs9?=
 =?us-ascii?Q?AJ+uynmUiRxwTz6v7jUcKBF57uAdknKB7QUQq9VxdFQJFKyHJRT9c5DjuYok?=
 =?us-ascii?Q?CxP2oFyXJHKFG0STz6zQD2gqnzsZZi3Z1q6XRqaeJTX/W4R2YP61rA4bZ5n/?=
 =?us-ascii?Q?zGXkoZ1jsPWjxwgjlmbLSqwvQ6N5gJERPS9qnb5EjGEecCo4ozWHSrjZtHjP?=
 =?us-ascii?Q?ukNObUSvrqAuAreKHHqNWnIhL2obfOmlC4umXNoJwsTHWyjM4AtuY0VaK1cq?=
 =?us-ascii?Q?GB4DjKKl4SGAAR2WVfu4X1QrHW9hStMBLFVzScse3BhZ2OXb2OyTWkofAQwC?=
 =?us-ascii?Q?+na/51aMfZxXj2NhS1hloTu3g1EuC1mP4Fe5/zVscJrpf5ML9BSpOyKljRQl?=
 =?us-ascii?Q?LkDrg1BkdReK1bjllLlJmsjhErtwvXNYBnxbdR2iIolSYGXhTxnvL87NIKAW?=
 =?us-ascii?Q?ipVyWpvztw=3D=3D?=
X-Exchange-RoutingPolicyChecked: aN02uR6lliOlp6D+MFfokS5EfrtwkYhIj6iHIiEQpdMfSfJdLBSQ5gpgcu+RM9434L9mXK0Yf0Nd5MQa49248VVSwv1wnBjloQXMGfpT9QvOHIZrqJI3B1B8WcZQg4kZ6luNZ0THB3xUTYdiy0iCYptmYM7Kz3B/RAGCNtkhhAWgHjEsBIEWZ18Td/lYhHrdsS872IPavAdfRdMB2ntZHkfZbCiahgmOfABpvrZqolQkEkKbZzcHBW4g+JEs+g1Jb6dVzaTXcnYJ9TuDexBQVvjdWYzS6Sju+N1pEI+IX1JwUaoEUA7eipBZ/7+7VmAQxAhR3Z9TcWThZSkwW2nkSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7debaadc-b3aa-49da-ce4f-08df4bc81167
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 14:17:56.8710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDyyWPJWVuVxsseYxjCxgeCESNv0ObE4ARArindh4LVaZS3jTgqabui1qOLorRIeRksLYpgEcKCch83BMz3bTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6067
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

<tilak.tirumalesh.tangudu@intel.com> writes:

> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
> Print gt->info.has_sem64 alongside the other per-GT fields in the
> debugfs info file, which will be needed by stakeholders such as test
> and debug tools to know whether to use MI_SEMAPHORE_WAIT_64 on a GT.
>
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index bc62d1054d29..e0458c21eb09 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -242,6 +242,7 @@ static int info(struct seq_file *m, void *data)
>  		print_engine_mask(&p, gt, gt->info.engine_mask);
>  		drm_printf(&p, "gt%d multi_queue_engine_classes", id);
>  		print_engine_class_mask(&p, gt->info.multi_queue_engine_class_mask);
> +		drm_printf(&p, "gt%d has_sem64 %s\n", id, str_yes_no(gt->info.has_sem64));
>  	}
>  
>  	return 0;
> -- 
> 2.46.0
