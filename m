Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9E7C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 18:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6846910E314;
	Wed,  5 Jun 2024 18:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YABBZsxe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC60610E314
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 18:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717611600; x=1749147600;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6Jl88fORlNCpKkocQOCU1UcRbFyYe9CyiMqwkZxvo4o=;
 b=YABBZsxeoT6+z/d7FS8J6MRXekD57XNNgjdRsrth9KJVVfl+8e98EaH7
 vWSUtTxHXzzSJpFvLB+vhHI8YtJci+ULpYszRHR5jtrHTmjrjUV7Cdtes
 yWa6jg5sGfHw9Fvtj5h9gj9RFxrLIcy1T1ozrpmbuhY8vUlGqNpibP4nk
 phrrh+otFN9NkToI/4/mPA1NnjqcWrNyD46wBS2Y1XmLX0ilg3ZqDdI70
 OVUqSKx/xe/tjw60v3a2sS0s3WennWA2vYJvv8RcqkMipoX3aDvvLtDpk
 DwmpzHt7EW/XXORDS8OQqfs+oysH0tfoQYLTobcDzC/bPWr2bejgpsGmI A==;
X-CSE-ConnectionGUID: IST1Xv31TMm0mlXfntPjTw==
X-CSE-MsgGUID: sTS1ZZ48Que2KlVTN8V5zw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="18064812"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="18064812"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:19:59 -0700
X-CSE-ConnectionGUID: 7B87gxQNSlitT/wBmtCn2A==
X-CSE-MsgGUID: h6tLTrEGQ9qbgx1A6tj3XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="37751643"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 11:20:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 11:19:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 11:19:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 11:19:58 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 11:19:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEAIwP1STsbXTP+dPXppiFiVkKARJ0Dzy4AIIofeHtY0dq/UJEe+NMmss7yqa8IIgXd4bAxaCaFVfOmzyHhkbrrtLFoThR6kOQkjSvQ8+5g76QBxL00Pe4WoHp6ILg5UIXL32WD6+vynLCGDHcS2f7O2V6wGTaQ56/JWLCXmWnHAxOvqu6K35b0Hb48j4x3NiSiVaQ4zpdk0/YQtAMitkne8asY07+IyZD7if8kgxR4QhGN1l56dv34r9yOHgt/Yf+/srV4dvn35WSqu58wNOwqk58S+3Xvp+nFv1mfjrOBiYeq4yxWChQa+XpLTPUbOm75QC2m+9Kcjbflbjhj4Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XpzLdfiM/QeAZldSQcBtD/T36wUmfK7lryjfL40c7E=;
 b=oWRhhvksTFjChHr++tjzmd5TEvA18/xUxUS6M0WUFqjDX9StpECEITNGJ9Z4gjlNZLPFf2DJjCKlBv/a4fJWmnajGOvLWoqSjQnFHRgfp75qbOfY3xFnU+QuPWX7Euw+AAon4J5xAoV2YHhnk1zuLIp2R1mNus4IyG/EZdizUnQKILaROqAjx5R5wHAVl0xT3PwqqI/KWPeP6IEGL7R2CaZbHafSJKkWN3/DsGFhGgZl3pG2E978vJnY/anfROT/MrjFIt+QgJycZGZMUd/dZ5Cl/xwTf1rudK+EIjLDckMWXWLEmxas8e+hcI98hjSyjxuA62p2BELjml908NwjVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 18:19:54 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 18:19:54 +0000
Date: Wed, 5 Jun 2024 18:19:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: uninitialized fence causing null ptr
 dereference
Message-ID: <ZmCsFytzsaX6hdqz@DUT025-TGLU.fm.intel.com>
References: <20240605181528.2047987-1-fei.yang@intel.com>
 <20240605181528.2047987-2-fei.yang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240605181528.2047987-2-fei.yang@intel.com>
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: 866f7df2-17b6-42df-0d80-08dc858c1900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0gBFUaeqGrNOZW+URejQQ5U+bfCHpfmZW9K09J6hgpni1C1YEANTlzW7Ty?=
 =?iso-8859-1?Q?IVKtOfbVN56D42iAIqcAr01HsvkGsldLNeHMDWR9EDabn//7R75+YcPfkr?=
 =?iso-8859-1?Q?oISY2NGZJTTqoy9fwDOFa3K2uFrTDsANwM66LcS9hv9GfFwxN1tZOecGJ0?=
 =?iso-8859-1?Q?CziyZUNWJ1w9mCRkVoZQ4EtxQ8OkNDtSEZyJOrTNQdBPXrI48JmP5M4yHK?=
 =?iso-8859-1?Q?0kspqtJhBvQMG+ze64OGJ2V9IEfHQgUMoci1xpcxZoqZIu15cdWFaPgGKF?=
 =?iso-8859-1?Q?U+odqK8jXYHLWiY/l1aA/0wha4+D4L01OLrkF4Sp57n3Bfos2ujdmN4nu1?=
 =?iso-8859-1?Q?66uG3zCAR/wTPU9VkybQH+4H+TzWXrXQc7uJsUc2rE3vI8i7heVqecLoFV?=
 =?iso-8859-1?Q?uUBDMU5eN0vB4BwJHtjSre4tVGbioCkr9+0EdpMnr/ofUNsqX6CKWJIyKe?=
 =?iso-8859-1?Q?iolfgwL1ByTHVdjlLmbgYoZpCRXSkyUXnOVU+wp1VtLbwhDcVm+os0Til2?=
 =?iso-8859-1?Q?nET7eL7sGoDcXjTUzywy+3AwyT/swbzmykafE6FQhzrviK1yTUtQ9uzqYu?=
 =?iso-8859-1?Q?6i0WEl7g7jsvqBUgeeNrOBnSgWSYUuQWrLnoeLZI6nPZd17S8xnmfMf8rS?=
 =?iso-8859-1?Q?nMRBqHVG9zrTfIQtFT9yRSdlejDsY2cACMi/Tr1ww5PM3y7zh9S/SV/ie8?=
 =?iso-8859-1?Q?eirixPhhAtNyvnYcYHSnem/OA5h7tpJ3WNeZXVkwqUUvlJ8AI16/553hGn?=
 =?iso-8859-1?Q?fjU8CNMa7rh5WWLpkR1U0n4BsL4IKJz1InSwiVTrxgWzRP7BckvMQS8WKJ?=
 =?iso-8859-1?Q?KQKXduFdFxxmlwsaufqP/ZiOk06/SgCLqWWmIYej6lUV49ng0JozbGmVml?=
 =?iso-8859-1?Q?pTGR9jqqJSNJ9Zz8jxJDtmi9ik7SA0qL8EjBzsdf9rwaFNcYcya0v6bvAj?=
 =?iso-8859-1?Q?vw44dfnqG9ntgSDaBXKPNn04jj5einkqby8uf7mQfU1bU6Zi8GhYLdREQT?=
 =?iso-8859-1?Q?yxxYHdramYsc5nluq6e3QhQ1n11t+o1CTmThrmqDttTU484OfkD0PwZn7c?=
 =?iso-8859-1?Q?lamEWE2tig8k0dgrk3XID4cJNg/LirUqwEVWsDJ34X70yLn620QUoeneYY?=
 =?iso-8859-1?Q?E/tXms9Y6+jcCbJptR8EOHSBhUUkX/+GvqUCwDpdMzwSo65DCjO82oPPLZ?=
 =?iso-8859-1?Q?MT/0GdPDTwpPtkuZ+vglX0a5f0oeYYWEECUFl2I9ewUcVhE+zc1YjhIUaG?=
 =?iso-8859-1?Q?4nr/5Kv/vTsOCEaxxJTBGVHfkGHu9s68dAAkxKFvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ej3qOwMVvz42hDSaoVNI11x2iKkoI34jkPRnkN+zzW7O7FD30TNIxwAOXs?=
 =?iso-8859-1?Q?0+MEdKJ2PychISQKH5TnTrHi/cCEBA+v2jNO7n677P2rGCk7nvodXnRsxG?=
 =?iso-8859-1?Q?s0XruhbS5+Rtd2002cDKdZbQVYX2U467n4g58GDUP+57ySt9d1Jy9H0Dku?=
 =?iso-8859-1?Q?ptwiRIKQlZbuAM6mNy6uNBM/XH/aC+LqTiTEI5JuSM+NCu//RYyzblfUwz?=
 =?iso-8859-1?Q?/sgphKPqRLsxzZGbsLUDj8JtgF6/Y//GG1JnQjW4JeWCmH8UHhQNLO+VGd?=
 =?iso-8859-1?Q?qUveB08BHHKMF/bcC9QOV/hk50QrNgInUT2RjbIOgzL80A9pznlHcb5NXf?=
 =?iso-8859-1?Q?8ESOVLWs99D9RRfZQnNVyfx82hfu3WKx4XWhrEphAMXqO9ZfGkAFhQ4Bq8?=
 =?iso-8859-1?Q?NZzefYsuKZyRckaG7jCJEXBT1Jc0EG7uR25CRlYhYAjs4aUcRFw3gAxkLh?=
 =?iso-8859-1?Q?3oct/9FQO8QJjgw7Twhf9P774qeLyDfW2v2iDHnq/eKsuESuGSZowc90SL?=
 =?iso-8859-1?Q?ecMnIq/Sr/MXXNQO2txrWMAvim0jH5o9Eq6Wkp1iu5CMkMSG8PWTlvTdpR?=
 =?iso-8859-1?Q?ZZ/WRxX2x0lRciboY7s5WE2033qDPRrWJv77ONCrTNHxcZdcapMKKN7jA6?=
 =?iso-8859-1?Q?swjCCj5FDpBdmR2ZNfNxNFH8UXc2lFyclQYu2BBtLscW61AL5txiaubYtO?=
 =?iso-8859-1?Q?g0yP2SBlZ1pytJn/9HnUDif8ajj26SpjU3+OpGKR2PSJhdCR8NyNJgrm9n?=
 =?iso-8859-1?Q?rxvRwqkO0FnYrNJaMJRdmXpR85Pl4iznsD6S0nCqo150ZYtTgMchjJwIz0?=
 =?iso-8859-1?Q?PhIBuA0H7RlJMZZn7VjEZDt5vkNB9k9vlpYa8kUQhlc1GJO43tWDFC8KtR?=
 =?iso-8859-1?Q?f1wqf4CyaZs0oPa3i6dPYNXg9+GdVafAUuL+Wvnr5riF359hpCM3N497nh?=
 =?iso-8859-1?Q?KkXk7tnc3EzpHNjPZRnRWIA8jEIaM/qysTB20zNzV0gE04IhjoEHWCZ3/y?=
 =?iso-8859-1?Q?TTRtfGQftB8DLFyHpTfEQJUkvXlp4bVuZTIL2Qia9Jk11ivYT4vf2SIEx5?=
 =?iso-8859-1?Q?OVbGrtqlkG1naaTrCGP3Tm/XrAzpO9dMdzghU+6uTVV54GTeCrgoKWjAjL?=
 =?iso-8859-1?Q?ann3mclqQNYyOvqY6QyqnOiG+Od+OaX+VIhVmgmGZNjJC3lEpENuNiIIyF?=
 =?iso-8859-1?Q?ZyFemOoFuiLt1ZHRHfsKLJsmuI4DNsg8E5Buho5lqKBemlB7ds4+KNNesp?=
 =?iso-8859-1?Q?pAaqr1Fg2BJkzDk6BXxJav2LigBlQA8C5bNT7ovSzn1vouK28qACqMQYnP?=
 =?iso-8859-1?Q?LnoNoiRg93SN/SvOKjG1REDcZdgs374DBYL14opCeP62pm6BlxwC5kPycd?=
 =?iso-8859-1?Q?pQWqaXLpqnqm1bEEgRZMA/434LpYtf8kvpSacHZbhW9YGlLdLMqW8xkqty?=
 =?iso-8859-1?Q?cVL2P3DOqCuJ67EvE32n2WIp+5N7GdntG3gbsCopQ+eamHhPDU6GPYTzvd?=
 =?iso-8859-1?Q?TPDHm0y1WtEcj6MRU9LE92/tk+kzGTMMb8ITThh/1T+gxyT8V5b1pfzDpp?=
 =?iso-8859-1?Q?nuWbb4Skdopht5e0KC2gl22cYgcK477mLZTx60Zdnpnq5U6Rh81Zqu+cKm?=
 =?iso-8859-1?Q?I8YsT+jvCqtzXGKvwDAQ1utNKjGVx8tK2nbqb65GVv5LVhDLc0UtM+rw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 866f7df2-17b6-42df-0d80-08dc858c1900
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 18:19:54.2496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5i7cft3wBfvK3HLIHO8/saI8akM9eydKEtjQARclg1V1EgjSAjDEDACTba1/Sbl1CSHrYpm68Vo6Wq3h5n+a/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6370
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

On Wed, Jun 05, 2024 at 11:15:28AM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> [  141.256160] BUG: kernel NULL pointer dereference, address: 0000000000000028
> [  141.257162] #PF: supervisor read access in kernel mode
> [  141.257943] #PF: error_code(0x0000) - not-present page
> [  141.258722] PGD 800000018c95c067 P4D 800000018c95c067 PUD 18c95d067 PMD 0
> [  141.259751] Oops: 0000 [#1] PREEMPT SMP PTI
> [  141.260409] CPU: 0 PID: 7277 Comm: gemm_bf16 Kdump: loaded Tainted: G     U             6.9.0-xe-474+ #1
> [  141.261812] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2007
> [  141.262669] RIP: 0010:trace_event_raw_event_xe_sched_job+0x50/0x100 [xe]
> [  141.263644] Code: 02 00 00 0f 85 ad 00 00 00 ba 30 00 00 00 4c 89 e6 48 8d 7d b8 e8 a0 c4 78 e0 48 85 c0 74 7b 48 8b 93 18 01 00 00 48 8d 7d b8 <48> 8b 52 28 89 50 08 8b 93 38 01 00 00 89 50 0c 48 8b 93 08 01 00
> [  141.266281] RSP: 0000:ffffc900017ff1c0 EFLAGS: 00010282
> [  141.267075] RAX: ffff8881001c4208 RBX: ffff888188499380 RCX: 00000000000007a3
> [  141.268100] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc900017ff1c0
> [  141.269123] RBP: ffffc900017ff208 R08: 0000000000000002 R09: 0000000000000001
> [  141.270145] R10: 0000000000000034 R11: c0673accd9eb118e R12: ffff888157969908
> [  141.271166] R13: ffff888188499380 R14: ffff888188499380 R15: 0000000000000001
> [  141.272187] FS:  00007f38147d4780(0000) GS:ffff888237e00000(0000) knlGS:0000000000000000
> [  141.273402] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  141.274250] CR2: 0000000000000028 CR3: 0000000188490005 CR4: 0000000000570ef0
> [  141.275268] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  141.276284] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> [  141.277297] PKRU: 55555554
> [  141.277758] Call Trace:
> [  141.278186]  <TASK>
> [  141.278571]  ? show_regs+0x67/0x70
> [  141.279114]  ? __die_body+0x20/0x70
> [  141.279666]  ? __die+0x2b/0x40
> [  141.280164]  ? page_fault_oops+0x153/0x4b0
> [  141.280782]  ? search_bpf_extables+0x96/0x160
> [  141.281439]  ? trace_event_raw_event_xe_sched_job+0x50/0x100 [xe]
> [  141.282317]  ? search_exception_tables+0x5f/0x70
> [  141.283004]  ? kernelmode_fixup_or_oops.isra.0+0x61/0x80
> [  141.283771]  ? __bad_area_nosemaphore+0x18e/0x290
> [  141.284466]  ? __lock_acquire+0xa22/0x30a0
> [  141.285080]  ? bad_area_nosemaphore+0x16/0x20
> [  141.285733]  ? do_user_addr_fault+0x338/0xa80
> [  141.286384]  ? trace_clock_local+0x10/0x30
> [  141.286993]  ? __rb_reserve_next+0x62/0x4c0
> [  141.287611]  ? exc_page_fault+0x87/0x2a0
> [  141.288197]  ? asm_exc_page_fault+0x27/0x30
> [  141.288813]  ? trace_event_raw_event_xe_sched_job+0x50/0x100 [xe]
> [  141.289678]  xe_sched_job_create+0x29d/0x2e0 [xe]
> [  141.290373]  __xe_bb_create_job+0x93/0x220 [xe]
> 
> Fixes: 0ac7a2c745e8 ("drm/xe: Don't initialize fences at xe_sched_job_create()")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks for the patch, noticed this too [1].

Since I'm hear and our patches are the same:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Will merge once this CI passes.

[1] https://patchwork.freedesktop.org/series/134484/

> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sched_job.h | 2 +-
>  drivers/gpu/drm/xe/xe_trace.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
> index 002c3b5c0a5c..0c3ddbb7e25f 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> @@ -70,7 +70,7 @@ to_xe_sched_job(struct drm_sched_job *drm)
>  
>  static inline u32 xe_sched_job_seqno(struct xe_sched_job *job)
>  {
> -	return job->fence->seqno;
> +	return (job->fence) ? job->fence->seqno : 0;
>  }
>  
>  static inline u32 xe_sched_job_lrc_seqno(struct xe_sched_job *job)
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 450f407c66e8..ea61387e0f5e 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -270,7 +270,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>  			   __entry->guc_state =
>  			   atomic_read(&job->q->guc->state);
>  			   __entry->flags = job->q->flags;
> -			   __entry->error = job->fence->error;
> +			   __entry->error = (job->fence) ? job->fence->error : 0;
>  			   __entry->fence = job->fence;
>  			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
>  			   ),
> -- 
> 2.25.1
> 
