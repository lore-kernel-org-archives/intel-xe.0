Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F994C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 21:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E494D10EA77;
	Fri, 27 Jun 2025 21:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhWWrFvt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC6510E08A
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 21:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751061381; x=1782597381;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nM9h+sADD0BGnPgH3PvS7fQXv/Xl4btzh2A8UIXyfPs=;
 b=DhWWrFvtrn8qtUuwnkr7TmRqwUg6vHrMqw7YnypZVjIgzsqrpzMSi0Zk
 kJSBRhGu7Gu2vSF/LJYrsJdMWqnjmlZ/+YW16gboPTlX07NCE+cVIix5e
 6dsfQXIof+zmf5wyEj3A3DzsSbaFvZz6N8pas6IstZqv93ZEyvOegjyCW
 fMjpgnprzOYVgB3Pdr1BkTw7CQdPoEu3zi4BzcOuD0NGaRtCltr0zMEYt
 zOeougj8lh5FrwOGU6nr+kl/vDgThlLSXz3RWAqrz4Ku3q6nyPAL5KFjk
 eYiEhfs66WqPNGOf5xo+uJz7JlFXZRD4OO9/JkDbDR3AjNA5dwxPu9UV5 g==;
X-CSE-ConnectionGUID: t6j4FQDtRwemx6V2IGLocA==
X-CSE-MsgGUID: XB5Fg69uTKemy/e7dtzByA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53254965"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="53254965"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 14:56:17 -0700
X-CSE-ConnectionGUID: yUSFMoUXRZ2bJ7Z9lzUHcQ==
X-CSE-MsgGUID: XJlmCtyJTJmOvoNjDHJKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="153397286"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 14:56:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:56:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 14:56:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:56:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t97DBYaUkehJW+pesEV42g5ZxhfjMssA7JMAbXQuD5/7jrLhDN+ahcfX5WuDRW+55fCDfen/PhFe5zAWc+DUGvrLR/ujaDqY3bUmhshioER05AbfG3z6mWXrl2I5SgLqW/kEG/+VHJw+HcJmTZUf4PXPNDfToOcmMh1rxvHALFAW0OCnJdvpP6n9ZLNTs4fIIpeLsPkGBBXKNtd6XV2nLKWeSFhviNrmxy0UnAM4/67mqtJDdR6EUTIUz8NQwC9UQLXJmiLYqE8kAkk/7G9Px3XFKlBwDQ2JndUBcl7NlflzsveaNWfU+twuB/9MdFPbiH7HCNuxgwwUQKC3Y0HPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/+UG2R/+2mUdg96VqzyJaTASWkvKkqiTs2RILE9uHs=;
 b=a9jBciGEpv8CBkDHLHY2eSJWNvcWZkOxO4dE6YNpo6Jogld1KmgG4LKI4JjzwPTv7rviWMKNA6X6orNlp63Z1hcDAiAwxTYzAA9wy0NVYXSX4xIFYbJf0dNGIhyl21eYB89dYWs8VH/BkrX6fWE30IB5fPcJq+ylI9dhAdy6VhGoQE26ApjxdidMy90J5+TjjzYT3wgKAZrByrN0akXYJQrBEmOgObtLNh14M0RHDa/UyiRF2/V+ZI9/gGD/IPEacnbEfOuN46kHHPHlG6ErTcYiLMB9DbI7HDXwGJK1EF5yCG5QL7LGRphPTL0shv53IRV68uUh0tFjX5271HD6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8239.namprd11.prod.outlook.com (2603:10b6:610:156::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 21:56:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 21:56:08 +0000
Date: Fri, 27 Jun 2025 14:57:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v7 09/24] drm/xe: Use emit_flush_imm_ggtt helper instead
 of open coding
Message-ID: <aF8T3CDISLRYn6nH@lstrano-desk.jf.intel.com>
References: <20250627133340.54603-1-tvrtko.ursulin@igalia.com>
 <20250627133340.54603-10-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250627133340.54603-10-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c721cfc-8127-473a-0a1d-08ddb5c56c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4P0cc6CVtfTSeuOzP4OOfOhkRhcHSHpCNWpVPuS2BmhvjKnKuvk/7Zb58lz3?=
 =?us-ascii?Q?x4ecvn2suthGpWJNkKdaj1fvE8W416UOWdssUybCyyhrsuHjkIGlI4jLjQUL?=
 =?us-ascii?Q?goVSYqnNv6hzvUEpYL37KaXZwz5czKiyryKt0l/5fDHu4/Bsh/hlxuZkSpV6?=
 =?us-ascii?Q?K+ne/5npooBLVK1moaFkJ6w0QKacSH7wu5QoI6P6hXrV0s0Gxy/9SmtSVbFT?=
 =?us-ascii?Q?eE+k6R/Yz43JGRx85fOZ9x6teq426VKC0Y/yT0IXWB37brFQdKazXFFRZyM6?=
 =?us-ascii?Q?+tSam9/9fsd66ftr5eVii2l5uKyqqXXf2qgkogNErve7aF9kCoLiX23WLnXp?=
 =?us-ascii?Q?AwxoHBVGDJtqqMHVv7qQMWRdykyTHzdpxTWp4hWSZAdZb9FfqRD75mbY2Y6p?=
 =?us-ascii?Q?KFneUhPLVWRE7w0ARjSsnk9Oz4F2xLOwLQ0S4k6ZRMJLB79vWC9fDLcW7wNi?=
 =?us-ascii?Q?Ndz/nJ3TnUDB/7MWX5xNscTCg+MjM0Mvfm3PqsIxq7w6j3EErKKL7fGp3/sz?=
 =?us-ascii?Q?wsSKhlVjW8HLineWbE6fduVYIxhqevJjOM3Sl6xkLLsTo6KtIRpTYWF8zaX0?=
 =?us-ascii?Q?j+WEHIsWixneunoyFDLDFLsnuKO8GNZOX4br5Mq82wd+4NSDqAC4Kd6cS3Go?=
 =?us-ascii?Q?KhlrcU73thWhCdbz1QvK9oY7IgNupWIZfh9gW2IYNq+Or4Z20SBEtc1uCmVQ?=
 =?us-ascii?Q?eYNIV7Ra1hZETKJKT2maTAPpH/9Zl4KDh5sz0ckz6H77HjWX7J67m2aJ0iyt?=
 =?us-ascii?Q?YzyC12If5b9wXD/YL+qScJQbFgLywjCEg78hMu83BKW33/z0jlMA9ZZEi43C?=
 =?us-ascii?Q?SfeV3YDtB2q+AHVzgAYYxVvGPv5+ipiPUDl8P/BkTrnAEgX01cFtAqYnhia8?=
 =?us-ascii?Q?wEM6VKAWJ4jMAzBhoHu/E3zG7GM/X9gY9atYWTC8JWXVv3m0ddeI6d6m0FK1?=
 =?us-ascii?Q?+euGn/kk3a8BA8KHlQB+pZ95OOakSJ3NEhL/Nd7BX070vLbwxvyAhb0pRpNJ?=
 =?us-ascii?Q?P9gIm0KXdZ9ljPWCMLOtGUaxNlspQPY1cMAdcal6TuuorJB7kjKph/4g8LqL?=
 =?us-ascii?Q?TS0wqhzVSGIenI7vUa/bzhLdmJzZi1qNwktO09XdgUGNXbaYZ8Z+x6i0uczs?=
 =?us-ascii?Q?fFk2yW4vRgxckxjruerbw+wTF8WCdnQy2Uz1vYX2czJXFbDEzByG7q/ZUekw?=
 =?us-ascii?Q?+oJejLQkyzt8veyrwKDmeEHlX+JLLympejq7tsuC30e5OpZP4nFO43lDjecR?=
 =?us-ascii?Q?QiYSpmkh6UHu9noGiwPCISv5RfzTiNy+YqnNnMnwyN1v/QQEDVcxOYJmqaAA?=
 =?us-ascii?Q?Nbcn+Svbm2sS3rjN3w6w2FnKfG94gzMbq2c63OKxhtOnMah2WO9aC/HS48cR?=
 =?us-ascii?Q?D8iTwaZyRHPOd8vYDhn7jkD1Qq0dxeNgQONNq47gggy3QJpfurCvfWNo48QR?=
 =?us-ascii?Q?3pwRc6jhv6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dZhM8meRm7JcGK4WmKW+B4iY26CzNbSnfgGmkSRLDAXCPasnu7U4Cwl90/AO?=
 =?us-ascii?Q?KTjOTG5VKavAFcgeRlRGZYlYhE4llINtJ82vzVTO9YokTHBJHS6px96GwcTf?=
 =?us-ascii?Q?NyFp2hogAeZKnu0CxQoBdPVdQLx1F22rSakGKfMJybk7+rcgq+9vlEVRQUnu?=
 =?us-ascii?Q?CK6igFQ6WZgld2ZKm4svif4+cqwi8kEqMTDoGUdwClzOS0Uq6kHx67HmczX2?=
 =?us-ascii?Q?hP3OXxR/ugtGwsOfo5T1pddXeUMcP9Kw87mhtyaqddy/6I6iFY0xehd4KpoE?=
 =?us-ascii?Q?KT1flH6i3QS9fExDBDUoUnJcTaelKNtxTPLkP7lR/rQmDGE/afxGSCWhxQHz?=
 =?us-ascii?Q?SB/zQctSSY9tGRHdZTY7tCnw3Uo5L3LI4KvxDCg5XNAROTxeAa44DXgfNVxn?=
 =?us-ascii?Q?LBYCXo9tT59CeL5NPv9Smul5tPdVY8xRWYMKH21o51q/T70EqekotkzLGFGO?=
 =?us-ascii?Q?6cTi03VUVTMCcwJmpM5CorXtnYNc5VNvlkNOG7l4SCmVGbkU/Ta0WD0FwOt9?=
 =?us-ascii?Q?mB9CYOGg/00Ca8zzk/4lWf0V+VDF32IT80sU+iBIWi7LOa8GPEPWK4SmY2jv?=
 =?us-ascii?Q?skM/9Roi93bUxNfxe9WIR41oG2M4MdzrG1R8ZMb8UnhmM5OggEMMus6J5fY1?=
 =?us-ascii?Q?TGiR7Lsb1z0wTsh7Z4f1Qy5FzTtFm3jMI3FX6mMXD7jFDllB/N0coimcoLD+?=
 =?us-ascii?Q?kjhL2YodXVcMWq72XftoKqVZWq65efBk1QYMqc8SgwuAPnVJD+YQBJMFfNsz?=
 =?us-ascii?Q?fnAnqUV4421xjpQ+Kt4zGuFsgVBS10tSH4Z4mP9lL5wB+AfFwbJ0YRjPZnYo?=
 =?us-ascii?Q?GK20MpXMmEIy6jEtu0QJPw8rlQaChyOYXBb9he+GQe5+6/GSECH9IYQMl8Tc?=
 =?us-ascii?Q?rJiD78MD9Oj8NvGhr02e9oCY0pvbIN14gzvJrv9ZpQNJrwLOeZBqGOAfwBjJ?=
 =?us-ascii?Q?dX1h4EEn2D+zWjfb0qKTFf2OLv2ZmNol9DbU+Fxm6JqGYkNhZ1/vhxX6rn3R?=
 =?us-ascii?Q?nDhywcTWHTs8tBvClvt7pKSv25nkkXjtXaSRz7MvNNdnboCEbjONFNfj9CLC?=
 =?us-ascii?Q?mIrfglnGYyToAz8RbO9UTW2tdBU2SJxcc3Hlwbcjc+OqIvwnHxWmruh0VR/V?=
 =?us-ascii?Q?IYzmwAUyqsvJK67O7zr75njUHNoaKowKzn0Y3aciMz3eujGerSw9S1yF+T1B?=
 =?us-ascii?Q?9eqtoWn1NPQJhYPMOkGQdnX5+BZ1ZQo5BCJwd6++PMBjBbDxxZxPDZZcyMZx?=
 =?us-ascii?Q?AGqoYtV/vPYmI1YBPg1YU5hHDLtOl3Q893E3MMvG1fEf8HU+Kz8aXAq3RPS0?=
 =?us-ascii?Q?wC2NHYjW/m3n1SQr1Jp1s7GK6f8dQxuQV/50kvbAFwsDT7a6Bq8+R32BYDgv?=
 =?us-ascii?Q?wvrHQyDwEYPQh5qjahZ3W2ls01fhuLES0MaeX6CRFA9QpENlriAq6YaTdti9?=
 =?us-ascii?Q?yckcfMBIiKxjGjEzqqx1lID1x03x0Xe3ZkvFzk0PMJwcQlOiq9PxqQcdfy9X?=
 =?us-ascii?Q?WPiaDGFGOlT/xBjoAi0OFhgIBADK7RfuqV4k7gxoa35CSDb6iuFgJvnEoe6J?=
 =?us-ascii?Q?NUB+mdUypTKctC9VjjShMV50vGPOOtp0S43SrALfn7Uk+AKhuzBObXg+aPas?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c721cfc-8127-473a-0a1d-08ddb5c56c2f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 21:56:08.6147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRtFDXkF1Fa/wmDYC4+sIfz/etKrgRFv28Vd/VMkKAa+zdxJsCc04O6vhQISYcnJcoN9p5HwILR+0lxy0eGZYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8239
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

On Fri, Jun 27, 2025 at 02:33:22PM +0100, Tvrtko Ursulin wrote:
> Helper is already there so lets just use it.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index bc1689db4cd7..b356134aca88 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -417,11 +417,9 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  
>  	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
>  
> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
> -		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
> -	dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
> -	dw[i++] = 0;
> -	dw[i++] = seqno; /* value */
> +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
> +				MI_INVALIDATE_TLB | job->migrate_flush_flags,
> +				dw, i);
>  
>  	i = emit_user_interrupt(dw, i);
>  
> -- 
> 2.48.0
> 
