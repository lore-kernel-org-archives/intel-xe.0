Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DA3CA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 19:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8409910F071;
	Tue, 29 Sep 2026 19:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXPK2onO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA2210F071
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790709530; x=1822245530;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=twSfrkJ87xykwLEEmMvHeAYCjH+4RZ04dil4KoFiNeY=;
 b=QXPK2onOKlMC2ebIpF4qz4Xm0vB2T+ZmqL6RKoXvfKBef6dz4S8T3cCF
 VpIDnzLHloQ+Vd+hYc3PuH2HG2meUiN4W7LCKTptbNI2AEangyjTKzZxz
 7nKffowlRV8ojUDKPu1xGWOQb5TqC5PH/myyt9AuR+Ze8jJfW//rCqaPp
 N0Xd6T6rtCRoUClzNV3pm0UvFC897yrSFGSn0nsHxP9Gr81aBiStshMEB
 jW/cygVt0JX+5fDK+qZiT/5A0RfY9Hb4BKt+S15f2GtAUFp0BzEp2FyNl
 QDZA4OGmqKFa720uIipQWoOAomrC+3vgFuPql0y1FamRLPqQjIHH0cmrb w==;
X-CSE-ConnectionGUID: 6V8+vcEGQvWbIT8Mkm9v6w==
X-CSE-MsgGUID: 31IME4C/StmbnNkVQCqwjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90658089"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90658089"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:18:50 -0700
X-CSE-ConnectionGUID: IRaUqv7KS3OSJk/Y7gXDCQ==
X-CSE-MsgGUID: 1zYus9EEQxGSi5WRZO+FPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275008942"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:18:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:18:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 12:18:49 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.39)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:18:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRfXgXG+6EeQRtSZgFa+O/n5N5imQnCuc9+fkffSVnmUxMl1adgZwh6gMK7X6hxFutImI4K2wpI3qHTu0Xn+hTzYowLpKVaQ6/ekpLfp5+BcTG4Mr7VtTYTbr2ZsyIrNhum6nrY5B0clsgrj+sv1NKCw0g5DR9idhm/23vAnvvHFI4ZPdBCnUN8UvXdt8tpyLTq2rhkmsnH9Ws1AySfxVwQzLx6GtOV2FMQE0lS1eWVlio2/d80ZTBJfG8txOayHQvzyhxAfgGu2upM46xNh+1doJVSpy/KJqkQx5GSO6/f8KKAUvmgmkNZoItOtwNmuSRJQp5aKFtQQXf1VoAw/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uu5H1Ugs7mNKY1BlOKlqQrcyrk9g+w5hA4vbJFSbTFw=;
 b=PNqmsz8TLf+lBLyn1/O+S4ooUu+X7bl7LTylyLQFNOApgGjWSs4hAM3RYMKsCFFm0DGeQVbxUZl869YZ0IA/VbQV8aSXP9FB0rGh3Tg0KdZzU/qWToitKjFdr0+INQaIFNVN4xPu2jwzbJnLwQi6Q4vEpsD3nxVUflDd1iMczPtU5kSUNc5CAJOYvDyQ3WyqdVrev4SXuHkcMV0hMhuza5AvGrg/c9TY3NJEjkXW7vHGPndsDEvPNmyRRyn8OQE5cAb7j1OByEDzeFxEEzcYvtTmUFSuN5eHdH1ed9blKb5wePJ68Odng6RHwa62mOtwDRghx0/UMo2A+wPT9wBcZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 19:18:42 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 19:18:42 +0000
Message-ID: <a2fb78de-852a-429a-93b0-460402566400@intel.com>
Date: Tue, 29 Sep 2026 12:18:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/gsc: Define GSC for NVL-S
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20260923183600.1186943-4-alan.previn.teres.alexis@intel.com>
 <20260923183600.1186943-5-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260923183600.1186943-5-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:303:8f::17) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DS0PR11MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b08954-44eb-40a1-e013-08df1e5e796b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: CnlGwPei4Gl9xFF25dGvIE7kMDjR4DWLrPLY2l58cqqHM6EsJbDeXdU6JIQfXBeHQUD76FiQPyd4bmfP54vpTx3z5BfaqsMArsoRUgpaIzd4H/jtJzUuBqAMyWaYpx0QwI7s+1w6y6k4AFYPY2ctJCOgA8alscS2muuatkJuojRKtypT2kOAzJ2Q5L5x+Ks2xl+4p0+DKoWoBt+tNBqcSPoDC1RkYNIomhZNxnJJJm3MOVcrEhV07/BQwCuZd2CSP5k4UkiUyONchCrhXu9X1xGzWNxwonwHZsg7f/6LVyBzdPwH/FQTwz+KSrO9MzPct4JqAXQU/YGDN6rUtLKlgwf+7OBetsgYwK7aWJfAxYkUZcNi2F2EdA8haQVH9XEc2P/V//ibfRQe0eD7pZc6gQYtrx1crdmQuYkGG86Y9WnwVRcaDBMiSvozl6lwQzcYPR2DM1aZkSDU2Qt7KmRQsxbrxtJkclkEDyNUK8DF7lcL2MrXOypeWwJujdhg2Rh1pq+9ch+YTUCaFesCwwQH7LsTjZVMsLfFYMO6COJUZ3Ov57ZbI/kb2rxifpLfB5hlhdIyXuam5cIULfUgMpvjx6PLHGGKCJLOyoLekFtDFI+meE8ygSrTY/1aG3dpD92u1/n/P6q7IfE9uOkj+NiieeJMHR9lo7iPadGY+xdumjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFVMdWVza24wUFpOVmtTenp6S0ZlVVpLTXQ2cG02OE9jY2Z6RTRzYlEwNjhn?=
 =?utf-8?B?cFZpenYvenVDWm54NXpIREJDek5vUm90NUNTeUhiL3ZBRjVOdUhqK2JjaGg1?=
 =?utf-8?B?SGZ2VHViY29XMk1wekxxZ1VGN0wzMjNWNjdKd2ptY1JoMnJmMHBaYlZpKyt2?=
 =?utf-8?B?S2d3TUY1T1hkaURDaS9qR3RQaXR0bHBWRVZBOVhlZ0E5SHEvOVlkd0FIQmJO?=
 =?utf-8?B?SU9icW9KazlDNTI4d3F0VnRVU3dNUEZpSTRSMU94TTNYNHNjRGdSQlRSUGNn?=
 =?utf-8?B?RFBMQUtHcndhUHBnOVRicy85QVpWTnk4aEFHNGpyTS93RnRsMWhWSFZNNklZ?=
 =?utf-8?B?MkN1bDVEL0h2TzhnOVVMYlFIOHZvYlZ2cFc1VHhtUWhpYlVsQXZhV0NBV0l6?=
 =?utf-8?B?elladzNubnhCQlhqc3g1NkxLWkJpQ1RjK0Z1UjJSRjB2a0htL2ozVFFGUW5W?=
 =?utf-8?B?TmZTQzRFMmFJenNLT0t3ODBqZThvNjh3ek93aDBjUWo0a0w2c1gvbHV6eVQv?=
 =?utf-8?B?UHZEMVM1NkZrVHJ2YjJaZ0VtRzJQWVlwVWZFNWt5MTJseWhrOUxvSU1wMUZU?=
 =?utf-8?B?emxlOW83WTlDcFNvbXd4aTRZckRVdDNRQTR5VDVtaVBIb2lCYVhrck9KQjNP?=
 =?utf-8?B?cjFsdHVwU2R0V3dpMVdUcGErc2FVRnF0YWxBYWN6MWlkbmdZeFRTZFdpbGts?=
 =?utf-8?B?SW9OVVA5TFp3MHhJejFmbHJidGhJL0pSb3pkM1NxUVNBS1BCeWRCMnRMZU0r?=
 =?utf-8?B?VDRrY1VGRE9Hd1ZVRENXd2dRTlZnQUlhSTF0UTloSUhXSEVGanM5Q1VjYUlt?=
 =?utf-8?B?dHhSRGtnd0pWNGFpKzhZMWJiU2g1MmhKZFBHNHk0WW5xYlNELyt3V3dVM3JX?=
 =?utf-8?B?Q2N2bUQzRUs0WE13NnNJWXFUZGx2b3FIUXIyaGhDNmlnU3VMQjM2OTYwNjAx?=
 =?utf-8?B?cFV0MUYyVkhicUUwc00rSDYzdEp6TUsyMnpIamluL05TbzZwS0JjR3U5bEZG?=
 =?utf-8?B?dEp3bGJ6WjJiZVRNSURRMmJNSnhjdXFMSkpKSGk3VTJVd1YrRHZ3SnN4eFhD?=
 =?utf-8?B?YlRPcTJHbDladUVUY0pLNWQwRkRvOWxzejR1enNDMm0yaUtia1NOZzNxY3VS?=
 =?utf-8?B?c1lZR1U2R3pCSzN1cmRaVW4rSzJtK2tnYlFtVEk3SDhacUNyZVc0VGxUdW4y?=
 =?utf-8?B?Y0VCWUlNNmp0dVNTY3dGZUt3RXp3VFlhMi9PcVZtL3BMMndvdnI0Rk50dzJU?=
 =?utf-8?B?dG45bUZ6K3c1RDBCWEJEd2NMYWc5TDFrL1dtU0FRY3RvZUJYRFR4RGc3UVhy?=
 =?utf-8?B?eEpkRzE3bWdyYkhKeTBKZUhIZnN6WUlPY2RCSVgwakhCTVNzK3g1MVdyOWVj?=
 =?utf-8?B?d0wwZUVTNzFFMVJxSEFKajhldEs5NnFxUCs2ZVFidzJyZWc4OUFiWHdEUmxT?=
 =?utf-8?B?eTMxTXhsWmJUejhmTXpuTGVDRXBhRkJEdkgvVnlSVG1JWll2b2tVQ3pnSW5N?=
 =?utf-8?B?UkNrZTJueFRUVURidFNLUHo2SmRyOVczS2NKZTdhTFU3NTZWN1Y5Qks0OXV0?=
 =?utf-8?B?bnlmMk1FTUU4ZUNEU2xBSG1yWUJFY0J4dmkvSWYrSnBTclYxY21QM3I0Q0Zn?=
 =?utf-8?B?WmlyMkwyM0FSRUd3UmxlYUl0WGU3S2dmUDE3b0JWRmRiYXhjM09YYlNRcWIw?=
 =?utf-8?B?SlJla29ZNUgweFAxL1ZIT0xPMlB0UUh5NCt6dDhia0dZenFWelJlcXlQVEdM?=
 =?utf-8?B?WFpxZ1F6dWdjaS9vQkZDT01kUlgrY3BaWXlvR3M0YjJxK0t0bVQ2cDQwNm9G?=
 =?utf-8?B?eFJNczVKWHVRTlhxWEg3TG5hSjdubjkxTWxaMlRUVHhIUVozSkpXZW9qWita?=
 =?utf-8?B?V0tLcGFWdEdnTDVSSHRDaEJrdmR4amZXdVJkaW1FQzVGSG94S3VIZk52WElE?=
 =?utf-8?B?YmhPU2c0bkNLZDZ1ZnQwajArZ2J5RGk5SVluT0hKd2NOdUhVQWd1WDVDeTds?=
 =?utf-8?B?ZXFZSlloQzlDVzUrRDVxbXZtTzlnZVd0OFIxTXh1UDNrK1NwUHNyZzQ3VENz?=
 =?utf-8?B?UFpLdDRRTTVFcWNKZnpUMSs1eGRtWG85YisyN0EvL080ZkNiT0tSODlKMENN?=
 =?utf-8?B?dDBrZ1hPM05OZWtJczFtbE8wT2V2U1haa0VJa2NnTHp5TWNvRDdQVU9UdXJs?=
 =?utf-8?B?cHRraERYdHFpUlBYQ1dvV2NMV3A3aWU1ZWs1RCtmczRQbFlvOHJzTXE4dTlX?=
 =?utf-8?B?NmsyeVI2UVhTQmh0OGQxRXBFV2M1bC9ZVjV3UHNDN2dRQTNFOTFFNWx5RHVi?=
 =?utf-8?B?ODZKWC96anZrN3ZUY2pBR0U4VXJXWG9JVmhRRjZ2Q1ludElPYUdZN3A4QUdK?=
 =?utf-8?Q?956e3f9uuf8kLq1E=3D?=
X-Exchange-RoutingPolicyChecked: srLRa+HILahm9eYg5DXxHO7JhlIKiRezmqBTiLFFamvz7DuVEs3ukx0E4QmNxbQJxx5DDT2iGldRNSsVI/ItVIGygOwl/JiYfnKWpIJrIuaz045ejmiyTvp5iu+zSaRGTkxlcAx3UyMqTDpMH5OhMmodnYufnPOPB5V+MZN0Uwn5nkm72LATkUk7OIst7Y0Pf+lZfsy6/HD/cKvTjwHxBgpV9C06P8nHo+vpEjpQNdTiCoXSp38BQSA/IuWbKSDBWoeXMjgz2qnwMvOsPrlU2FzTFsGHjqO40hK19wQA6Z2aDC87Ww3K9GbGQtKf9Lc2QWMXSKkGdPSn7Wpup1Xd7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b08954-44eb-40a1-e013-08df1e5e796b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:18:42.5333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnHNrQiLB8uLro6HlL5KG3URlFq4U5LRUA/bxRv5Ug+EUXQF6361UaimwO5uXF09mkhUAwQolFMNwWbTuAaQvwjR8QaXP/jat/0tjk/No+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
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

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

On 9/23/2026 11:36 AM, Alan Previn wrote:
> NVL-S is identified by GSC major version 108.
> The compatibility version is 0.0.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index e29878b255ba..6edba1401f7a 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -145,6 +145,7 @@ struct fw_blobs_by_type {
>  
>  /* for the GSC FW we match the compatibility version and not the release one */
>  #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
> +	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 0, 0))	\
>  	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
>  	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
>  	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))

