Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E15CCFA02
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 18:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6047C10E160;
	Sat,  1 Nov 2025 18:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjGsipFH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0891410E15F
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 18:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762020434; x=1793556434;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kfhwuxN8jZZJOno0LK/QWLlxuU/K8CLJKBzfPpvdnEs=;
 b=cjGsipFHmZxq0WgmRtEr4MAlFdErCso4lFk0ZCYWK41vgAgXMk82aoV/
 z+HT4RqPkoH29EjDZqK7XTm+Xhrnm0D2a04qNfXZJ55wfiN/9tiilW3pz
 28T5fHo+4v6iOV1lG/5Jdf+P5HdVGvKPcEhVNbChwY2W9rc0UFieNB6CW
 Qv9MQXDaWVNFubgzr4i2DZJLXodmSZOCFVnGu6hc1j/KKMbe/FpfvGREd
 fuHbHQzD4jlHAZoVyOj+cJGyxBVNtDVe8G6/JhdiG7JNsnklt7986wtRL
 KUT7TrrwmBbGH2H8v8M2jGYSloXG3uQU/+E5wH8xKVeKkvYvl73OUPbNp w==;
X-CSE-ConnectionGUID: 0Qjs5RcjSSa+uTpYrtOw1A==
X-CSE-MsgGUID: u97ZZo27RpKnOv3gRM+RBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="66772845"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; d="scan'208";a="66772845"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 11:07:14 -0700
X-CSE-ConnectionGUID: mqQt357/TLqQRKr0ZeMO/Q==
X-CSE-MsgGUID: iKaQmA98SAitw9BnI67SIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; d="scan'208";a="186167847"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 11:07:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 11:07:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 1 Nov 2025 11:07:12 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 11:07:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9xxPwqd9cj57XTmkmnFBjapQ3a5oNipMWqnVRudpMujgssj7HQ2XVkgqjX1ttqjNyCZjY2gSBCjlNnMdxlnkSC1tHbBVuxejZFOw/riVU1jVwWjSzayXhpBIya83mPnGenzmiSB7/t/TxS6G4Sfin715U4iZ7T/LYqsWGt81+VUEGFuwaepZfAUaF7dlzQRN0BRelyE5x7UGM+qL/8+04ZB2tK9ksiaR0QwpCagZHUq7NXy/Xp7bGpVKueOJxKEK1SnYaycjh7bW+ltobazuaZ98V3OhtqgxIFtdGhuOmpUznfPedCggxsy6GsSywswfmONLYoblBGHxjWJJc97/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqNXW3evOKfBZq/CZAbPeNNGL8+g+oEP4QqLNXNwsj4=;
 b=SKbIszfN47oIikF00z5JPlcJ7/IxXm20rrnMqxaISEWTN5x38c6At3aOoDFo7sywutFTC+4MFiHlvxd264/rYvg3zoA2Hi2ExOgJMw5Hw65Ox+U2ms5qz2r93K3+M6XC13Dy1lVYGrgPWaBUnlxBNaPBqZQs6xDBDcCZOTC0+p6S5GC4bTkS/F7m6LP0R4hwoFQ2+M31B02LBjfwAVeyivS9w0LzkD6ekyX9jzCJArtHouAc2/Zw2NzFyQ3BYV0RA+6Z/QDMRLW8BNe7cKLp6sFF6/5sOS1BR3Tvi9Np5VDI7rBOiz6jnMMR24IJX8e8gUkfSlybaXLFIrClNEPO0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4654.namprd11.prod.outlook.com (2603:10b6:806:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 18:07:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Sat, 1 Nov 2025
 18:07:10 +0000
Date: Sat, 1 Nov 2025 11:07:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/16] drm/xe/multi_queue: Add GuC interface for multi
 queue support
Message-ID: <aQZMTMd7JftUTcy5@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-4-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-4-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4654:EE_
X-MS-Office365-Filtering-Correlation-Id: dd077b69-9c2b-4b95-877c-08de197179cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1yr5S7Khfwk5d3wCsrqH5ZUqrIZUOiAQZ/kavab1AXvqmGhApOBvmH7z9OyD?=
 =?us-ascii?Q?AehsjOU/u0f8UQDautbYFI7yV35pR5Ra+pGMAewn1eIxzXAteWpZLfY4vPei?=
 =?us-ascii?Q?LquOZfwJcEwwsiQLwMIY15VvybASomswuZq3kHWneInpWSdxb6hEZkIXwDJP?=
 =?us-ascii?Q?gK5fk+GLFUlqx+tBW6vyxKcOWxEf/G40y1SXrR05UbE6+1z3hQJiAdbyFVCF?=
 =?us-ascii?Q?w7oxm0k3N4hw0X6s/N/NyMqPDp/d1oTfIrMbgWquHkLKi23d+BYFn4/8GtcS?=
 =?us-ascii?Q?iEPNA17g+3mwlp0YDGWlZ6f6BmRvguM68enHY9pWfkX1rWav+DjqG2WgWZ/w?=
 =?us-ascii?Q?8Iapi6vXifVMHm+e7TqI1dUH029oiniZ1ajd9geqoMHJTlbpC7KQzpSW9Mfr?=
 =?us-ascii?Q?9Zi3zeyoZ5/tffTon1usjdvCldz/rNXzv977J5euHmZfoQjbzL24TOd8+bCw?=
 =?us-ascii?Q?2BT/DeZxSXtUsPUAgpHE/sq4mnFIT8fzkk1+6QrSXfQ3jEpMbSgO2p10H1Cc?=
 =?us-ascii?Q?XAbOaoqkBgR9PgCHwzOitBdBNwGd5s9/isvbcyMwYtsk/vNC2nXzpsCtlvCp?=
 =?us-ascii?Q?HYP9x0/hIWAIHFhhrrNBTda5P1RSEIkc8h4xTRlsOb9Ux6fM4VOEXQUFzTvL?=
 =?us-ascii?Q?AaIpjE8o10qA8U5x8uniI+m8BHnDhDMs/0LnoIvEf+ItNpuEVHUCqYu8ISUy?=
 =?us-ascii?Q?hxb08NhSGBPz/mAbPqD1oCHoTVhQAxaSWqig8dL6yZZQ4zX9n1fWVnX6c0mV?=
 =?us-ascii?Q?r1Xcp75Yuf6B+ihQwtvOQnOY+VGibdh1eU5GVfqcXQiLWE5/AnO+mIhwqN6X?=
 =?us-ascii?Q?LYOn3WTiFrEJ4sr2bwmzMVFKbqPv+5vf8If7c51ipd44e1OyXPRqIcaLOqVl?=
 =?us-ascii?Q?pABTLeDSqCGsBo1CuXaqEkShixYLaDyynJVCGTekUsRJs4uMZk4tiQwEcHbc?=
 =?us-ascii?Q?6dGDHoXZfYiXHn9bu5rU/cyM91yPcTBcF/jmMwivefoyHh8P+3um9k8JnhWU?=
 =?us-ascii?Q?YASHCiSdhS954spXY+vF9TNOxn/6xZRpVguOAYaIMKL9344shNZpvGtnCF5Z?=
 =?us-ascii?Q?8aTd5Lbik6gal6ksR7OUwcN2ara1ZO09Bqeen20MmkdznQuYQgeOlgnFSpvf?=
 =?us-ascii?Q?bUUpRGcBzpSSIbcdZiX4zO2quzlzUxrtObtNWBmSTvS/kEkXpvl7GkHAENnG?=
 =?us-ascii?Q?9szRoktkEYKJZxrpVqO5UNaxkGdT8NoT6uY1G1CX9ZRpZXI+2m22ivzrEteK?=
 =?us-ascii?Q?ME6nW2Vhk4kAvauBInoLqgNxLjMEoWq03fQ2QXNdCLjDsGQ3omUICjZGFy8u?=
 =?us-ascii?Q?hRqGZsOx3wsWqGpXSvl7D5adZe39BmM/CGpWf+X9+TXEfA+4DOSF1cauHMq0?=
 =?us-ascii?Q?FLEhhaoqxscTLs7OSX1zrNM7ZXhljVPXiQl4iKbVtLNz+F3a5mllCZWGq4c4?=
 =?us-ascii?Q?jW3ohlsK+CWpkMO7utExm3UPjJFV3cg+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dp7fu6kLv9PGyLsIX6ixVIaIq99NSnqED/kvabeStEH/LGGnAvjVQC+vm5Pr?=
 =?us-ascii?Q?cE3EcGjGkoG3WlMSj9kBgh0zN30hamYXq4++vugGKDuhYS/zea0gXWBn6AT3?=
 =?us-ascii?Q?EjED8+0ZRerX3K77jh9ATkS2ZRXrrWpdE5NNakEuFI+vQvTEozuUo/jb/uW6?=
 =?us-ascii?Q?2fPSgulJCajOPHfIz5cQN35o3Ew/zYrysOdbenTNggtX/U8o729n+qBbkFoL?=
 =?us-ascii?Q?HLbz4gsBewdxU2SLOXctDF9Z6Jw8D19HZnwko6SwWCd6DDB7aAZ5nR2EbAHG?=
 =?us-ascii?Q?tQNMAHRNV55MwZHwkg/P6cFLhrn0ljCNE0WFgSFMwxRwFG+++AAHkEhqLuCU?=
 =?us-ascii?Q?/G8u1vPp7wMVMub6JU8cUOFbBC4HXjsH5Lwi887RJ8raFYBIgK6Hiex+1NtU?=
 =?us-ascii?Q?kNez33vA8BiKcW9Sj6C7aHoGrJ74usX5wIiQTq5476gV+Bcw8c/aAe35l9gH?=
 =?us-ascii?Q?l7DcVz6z93OHL4xKEg3x+lr8+zvhZjBhaCB83h0AcsjV1nZgEF2EfQ36DpJx?=
 =?us-ascii?Q?2zZUZe0WSUvIMi5yyQvIkMycOpv0jwclj2lnlCDbkDNrVwPk0ndMzWFBRxCB?=
 =?us-ascii?Q?CAGG2fMkWV5mEFhzTjwoos53FISqs0et2A3HPOMFgZliwosU8a1xBFtExDtJ?=
 =?us-ascii?Q?3MygvAww6WlWdiRzvfXDv8CnuOWrA/2Z+4hQ9kisre5QW5qI3VKz13z0p922?=
 =?us-ascii?Q?6VceQqZ6t1D75hXVWDBXBJ24tORJ6buTaGh2NK+03QN4PcGn+s6tqjXA1KI5?=
 =?us-ascii?Q?od5LhOfbbur7eem3l/sssGxZLKoMKI0sJP01CKdkNvog7dpGHqed5OWpDWct?=
 =?us-ascii?Q?/QrZpk0gKyWv6kXeKRwK+cHtd89iTYAS0RjqBxLBDZoL/4ub23iL9A8rypCQ?=
 =?us-ascii?Q?1eloVDcmwm98996pOfdMMhAMYSzaLj6izIWGX2Cvr1CQC5Jm4rrXKi8//v9W?=
 =?us-ascii?Q?rrPVk8VqXax2MP8ZMACSAjzDBqVjp1rn4o0OjdcGaJ9eWwJ3YBWh/yFhYXli?=
 =?us-ascii?Q?1/bFNBDKJWMCnblC9TurajRiE8QgoWOqFpiTFYBt7F0lKtGPXIDrtX9nkBI4?=
 =?us-ascii?Q?QII88tKMvGQutaVJyGMNqYuwbQhMTu/CXpuhWBVL9/aJrEa7u8+USDotAg1q?=
 =?us-ascii?Q?kvMdAd1TONWU5MWPqGRM59FEKmpoctxMmN0W1K5xGKTs2FVrrp2S/20d0Nfe?=
 =?us-ascii?Q?qwkVjcJ/3oBMVtKKtrqQ1wykKkEeeNDu5wzgpt5G1C8OTnUh0ZOM2Rl+Jiz8?=
 =?us-ascii?Q?XygEeFr5SjwuHPxYnVsrJIdoLSoZ1cG7WRcs7xX4ElAAUnCmBX/LeCCXqTvy?=
 =?us-ascii?Q?scdUTh/LAwjL//kSULZhIwg3KTFA50/lv80oeseqoOSPVgFJdRp9DvHCAMjr?=
 =?us-ascii?Q?aXGBLgFt/pWMeKwJjcYH4h6n/dsAHpulasCyAiXGd1URLhkkOAvkDFQpQ7Kk?=
 =?us-ascii?Q?/43MC8jYpwcljslan6VVtZiMah6+hkEy6jILbel3To4j4Y2Hrg1G1dmWpUGL?=
 =?us-ascii?Q?H/x6iB24hc9DLHwbYEyvD/r3n6GvmDHghgybV1jN3uujI2fSwvSnWRpcaRoP?=
 =?us-ascii?Q?/T+wLRabEed46aSYb/84vPNmxp5ZgISFqs46BdoLtg903N/4y1N9C8xMO5sb?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd077b69-9c2b-4b95-877c-08de197179cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 18:07:10.1133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdjqEIonK2clJMJkOpxsJkDY8kfnqHHa/AnBhK6rUO33QYzgF1IAcy1xL1457zvlM1LG3H1IuHHYgEyV0yE+AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4654
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

On Fri, Oct 31, 2025 at 11:29:23AM -0700, Niranjana Vishwanathapura wrote:
> Implement GuC commands and response along with the Context
> Group Page (CGP) interface for multi queue support.
> 
> Ensure that only primary queue (q0) of a multi queue group
> communicate with GuC. The secondary queues of the group only
> need to maintain LRCA and interface with drm scheduler.
> 
> Use primary queue's submit_wq for all secondary queues of a multi
> queue group. This serialization avoids any locking around CGP
> synchronization with GuC.
> 

Not a complete review, but a few comments.

> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |   3 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
>  drivers/gpu/drm/xe/xe_guc_ct.c           |   4 +
>  drivers/gpu/drm/xe/xe_guc_fwif.h         |   3 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 302 +++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
>  6 files changed, 270 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 47756e4674a1..3e9fbed9cda6 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -139,6 +139,9 @@ enum xe_guc_action {
>  	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>  	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>  	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
> +	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
> +	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
> +	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
>  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 3856776df5c4..38e47b003259 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -47,6 +47,8 @@ struct xe_exec_queue_group {
>  	struct xarray xa;
>  	/** @list_lock: Secondary queue list lock */
>  	struct mutex list_lock;
> +	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
> +	bool sync_pending;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index e68953ef3a00..48b5006eb080 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1304,6 +1304,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	lockdep_assert_held(&ct->lock);
>  
>  	switch (action) {
> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
>  	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
>  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
>  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
> @@ -1570,6 +1571,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = xe_guc_g2g_test_notification(guc, payload, adj_len);
>  		break;
>  #endif
> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
> +		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
> +		break;
>  	default:
>  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index c90dd266e9cf..610dfb2f1cb5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -16,6 +16,7 @@
>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>  #define G2H_LEN_DW_TLB_INVALIDATE		3
>  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
> +#define G2H_LEN_DW_MULTI_QUEUE_CONTEXT		4

This value doesn't look right. I'm not sure where 4 is coming from.

The length of XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE
appears to be 2. So with a value of 4, I believe the G2H credits will
leak.

You can run a multi-q test, then check the following debugfs:

cat /sys/kernel/debug/dri/0/gt0/uc/guc_info

In particular, these are the interesting fields:

G2H CTB (all sizes in DW):
        ...
	resv_space: 16384
        ...
	g2h outstanding: 0

^^^ This is what an idle G2H should look like. I suspect both G2H
outstanding values will be non-zero, and resv_space will continuously
decrease when running a multi-queue test.

>  
>  #define GUC_ID_MAX			65535
>  #define GUC_ID_UNKNOWN			0xffffffff
> @@ -62,6 +63,8 @@ struct guc_ctxt_registration_info {
>  	u32 wq_base_lo;
>  	u32 wq_base_hi;
>  	u32 wq_size;
> +	u32 cgp_lo;
> +	u32 cgp_hi;
>  	u32 hwlrca_lo;
>  	u32 hwlrca_hi;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d4ffdb71ef3d..d2aa9a2524e7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -46,6 +46,7 @@
>  #include "xe_trace.h"
>  #include "xe_uc_fw.h"
>  #include "xe_vm.h"
> +#include "xe_bo.h"
>  
>  static struct xe_guc *
>  exec_queue_to_guc(struct xe_exec_queue *q)
> @@ -541,7 +542,8 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>  	u32 slpc_exec_queue_freq_req = 0;
>  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>  
> -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
> +		     !xe_exec_queue_is_multi_queue_secondary(q));
>  
>  	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
>  		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> @@ -561,6 +563,8 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>  {
>  	struct exec_queue_policy policy;
>  
> +	xe_assert(guc_to_xe(guc), !xe_exec_queue_is_multi_queue_secondary(q));
> +
>  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>  	__guc_exec_queue_policy_add_preemption_timeout(&policy, 1);
>  
> @@ -575,6 +579,130 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>  	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>  			field_, val_)
>  
> +#define CGP_VERSION_MAJOR_SHIFT	8
> +
> +static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
> +					       struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	u32 guc_id = group->primary->guc->id;
> +
> +	/* Currently implementing CGP version 1.0 */
> +	xe_map_wr(xe, &group->cgp_bo->vmap, 0, u32,
> +		  1 << CGP_VERSION_MAJOR_SHIFT);
> +
> +	xe_map_wr(xe, &group->cgp_bo->vmap,
> +		  (32 + q->multi_queue.pos * 2) * sizeof(u32),
> +		  u32, lower_32_bits(xe_lrc_descriptor(q->lrc[0])));
> +
> +	xe_map_wr(xe, &group->cgp_bo->vmap,
> +		  (33 + q->multi_queue.pos * 2) * sizeof(u32),
> +		  u32, guc_id);
> +
> +	if (q->multi_queue.pos / 32) {
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32),
> +			  u32, BIT(q->multi_queue.pos % 32));
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32), u32, 0);
> +	} else {
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32),
> +			  u32, BIT(q->multi_queue.pos));
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32), u32, 0);
> +	}
> +}
> +
> +static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
> +					     struct xe_exec_queue *q,
> +					     const u32 *action, u32 len)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_device *xe = guc_to_xe(guc);
> +	long ret;
> +
> +	/*
> +	 * As all queues of a multi queue group use single drm scheduler
> +	 * submit workqueue, CGP synchronization with GuC are serialized.
> +	 * Hence, no locking is required here.
> +	 * Wait for any pending CGP_SYNC_DONE response before updating the
> +	 * CGP page and sending CGP_SYNC message.
> +	 */
> +	ret = wait_event_timeout(guc->ct.wq,
> +				 !READ_ONCE(group->sync_pending) ||
> +				 xe_guc_read_stopped(guc), HZ);
> +	if (!ret || xe_guc_read_stopped(guc)) {
> +		drm_err(&xe->drm, "Wait for CGP_SYNC_DONE response failed!\n");

If this occurs you need a GT reset which should detect
group->sync_pending in guc_exec_queue_stop and clean it up.

Also here is where VF migration needs to be considered. The
wait_event_timeout should pop out on vf_recovery being set, but not
trigger a GT reset. In this case we need likely need some per secondary
queue tracking state to figure out which secondary queues lost the CPG
syncs so that flow can recover. We can figure out part out a bit later
though.

> +		/* Something wrong with the CTB or GuC, no need to proceed */
> +		return;
> +	}
> +
> +	xe_guc_exec_queue_group_cgp_update(xe, q);
> +
> +	WRITE_ONCE(group->sync_pending, true);
> +	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);

The problem here appears to be two fold:

- The value of G2H_LEN_DW_MULTI_QUEUE_CONTEXT looks incorrect
- On multi-q registration both G2H credits and count are set but multi-q
  register doesn't produce a G2H response. See my comment above thinga
  getting leaked, that can't happen as PM will be off and eventually G2H
  credits will run out and deadlock the CT channel leading to a GT reset.

> +}
> +
> +static void __register_exec_queue(struct xe_guc *guc,
> +				  struct guc_ctxt_registration_info *info)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_REGISTER_CONTEXT,
> +		info->flags,
> +		info->context_idx,
> +		info->engine_class,
> +		info->engine_submit_mask,
> +		info->wq_desc_lo,
> +		info->wq_desc_hi,
> +		info->wq_base_lo,
> +		info->wq_base_hi,
> +		info->wq_size,
> +		info->hwlrca_lo,
> +		info->hwlrca_hi,
> +	};
> +
> +	/* explicitly checks some fields that we might fixup later */
> +	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
> +	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
> +	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +}
> +
> +static void __register_exec_queue_group(struct xe_guc *guc,
> +					struct xe_exec_queue *q,
> +					struct guc_ctxt_registration_info *info)
> +{
> +#define MAX_MULTI_QUEUE_REG_SIZE	(8)
> +	struct xe_device *xe = guc_to_xe(guc);
> +	u32 action[MAX_MULTI_QUEUE_REG_SIZE];
> +	int len = 0;
> +
> +	if (xe_exec_queue_is_multi_queue_primary(q)) {
> +		action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE;

Again as mentioned above, this command doesn't require G2H credits
unless this produces a XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE
response.

> +		action[len++] = info->flags;
> +		action[len++] = info->context_idx;
> +		action[len++] = info->engine_class;
> +		action[len++] = info->engine_submit_mask;
> +		action[len++] = 0; /* Reserved */
> +		action[len++] = info->cgp_lo;
> +		action[len++] = info->cgp_hi;
> +	} else {
> +		/*
> +		 * No need to wait before CGP sync since CT descriptors
> +		 * should be ordered.
> +		 */
> +
> +		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
> +		action[len++] = q->multi_queue.group->primary->guc->id;
> +	}
> +
> +	xe_assert(xe, len <= MAX_MULTI_QUEUE_REG_SIZE);
> +#undef MAX_MULTI_QUEUE_REG_SIZE
> +
> +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> +}
> +
>  static void __register_mlrc_exec_queue(struct xe_guc *guc,
>  				       struct xe_exec_queue *q,
>  				       struct guc_ctxt_registration_info *info)
> @@ -622,35 +750,6 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
>  	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
>  }
>  
> -static void __register_exec_queue(struct xe_guc *guc,
> -				  struct guc_ctxt_registration_info *info)
> -{
> -	u32 action[] = {
> -		XE_GUC_ACTION_REGISTER_CONTEXT,
> -		info->flags,
> -		info->context_idx,
> -		info->engine_class,
> -		info->engine_submit_mask,
> -		info->wq_desc_lo,
> -		info->wq_desc_hi,
> -		info->wq_base_lo,
> -		info->wq_base_hi,
> -		info->wq_size,
> -		info->hwlrca_lo,
> -		info->hwlrca_hi,
> -	};
> -
> -	/* explicitly checks some fields that we might fixup later */
> -	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
> -		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
> -	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
> -		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
> -	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
> -		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
> -
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> -}
> -
>  static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -670,6 +769,13 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
>  		FIELD_PREP(CONTEXT_REGISTRATION_FLAG_TYPE, ctx_type);
>  
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		info.cgp_lo = xe_bo_ggtt_addr(group->cgp_bo);
> +		info.cgp_hi = 0;
> +	}
> +
>  	if (xe_exec_queue_is_parallel(q)) {
>  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>  		struct iosys_map map = xe_lrc_parallel_map(lrc);
> @@ -700,11 +806,15 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  
>  	set_exec_queue_registered(q);
>  	trace_xe_exec_queue_register(q);
> -	if (xe_exec_queue_is_parallel(q))
> +	if (xe_exec_queue_is_multi_queue(q))
> +		__register_exec_queue_group(guc, q, &info);
> +	else if (xe_exec_queue_is_parallel(q))
>  		__register_mlrc_exec_queue(guc, q, &info);
>  	else
>  		__register_exec_queue(guc, &info);
> -	init_policies(guc, q);
> +
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		init_policies(guc, q);
>  }
>  
>  static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> @@ -833,6 +943,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>  	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
>  		return;
>  
> +	/*
> +	 * All queues in a multi-queue group will use the primary queue
> +	 * of the group to interface with GuC.
> +	 */
> +	q = xe_exec_queue_multi_queue_primary(q);
> +
>  	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
>  		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>  		action[len++] = q->guc->id;
> @@ -879,6 +995,18 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  	trace_xe_sched_job_run(job);
>  
>  	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +
> +			if (exec_queue_killed_or_banned_or_wedged(primary)) {
> +				killed_or_banned_or_wedged = true;
> +				goto run_job_out;
> +			}
> +
> +			if (!exec_queue_registered(primary))
> +				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
> +		}
> +
>  		if (!exec_queue_registered(q))
>  			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>  		if (!job->skip_emit)
> @@ -887,6 +1015,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  		job->skip_emit = false;
>  	}
>  
> +run_job_out:
>  	/*
>  	 * We don't care about job-fence ordering in LR VMs because these fences
>  	 * are never exported; they are used solely to keep jobs on the pending
> @@ -912,6 +1041,11 @@ int xe_guc_read_stopped(struct xe_guc *guc)
>  	return atomic_read(&guc->submission_state.stopped);
>  }
>  
> +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
> +						    struct xe_exec_queue *q,
> +						    u32 runnable_state);
> +static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
> +
>  #define MAKE_SCHED_CONTEXT_ACTION(q, enable_disable)			\
>  	u32 action[] = {						\
>  		XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET,			\
> @@ -925,7 +1059,9 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>  	int ret;
>  
> -	set_min_preemption_timeout(guc, q);
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		set_min_preemption_timeout(guc, q);
> +
>  	smp_rmb();
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 (!exec_queue_pending_enable(q) &&
> @@ -953,9 +1089,12 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	 * Reserve space for both G2H here as the 2nd G2H is sent from a G2H
>  	 * handler and we are not allowed to reserved G2H space in handlers.
>  	 */
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_multi_queue_secondary_sched_done(guc, q, 0);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>  }
>  
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> @@ -1161,8 +1300,11 @@ static void enable_scheduling(struct xe_exec_queue *q)
>  	set_exec_queue_enabled(q);
>  	trace_xe_exec_queue_scheduling_enable(q);
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_multi_queue_secondary_sched_done(guc, q, 1);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>  
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 !exec_queue_pending_enable(q) ||
> @@ -1186,14 +1328,17 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>  	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>  
> -	if (immediate)
> +	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
>  		set_min_preemption_timeout(guc, q);
>  	clear_exec_queue_enabled(q);
>  	set_exec_queue_pending_disable(q);
>  	trace_xe_exec_queue_scheduling_disable(q);
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_multi_queue_secondary_sched_done(guc, q, 0);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>  }
>  
>  static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> @@ -1211,8 +1356,11 @@ static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>  	set_exec_queue_destroyed(q);
>  	trace_xe_exec_queue_deregister(q);
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_deregister_done(guc, q);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>  }
>  
>  static enum drm_gpu_sched_stat
> @@ -1660,6 +1808,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct workqueue_struct *submit_wq = NULL;
>  	struct xe_guc_exec_queue *ge;
>  	long timeout;
>  	int err, i;
> @@ -1680,8 +1829,20 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
> +
> +	/*
> +	 * Use primary queue's submit_wq for all secondary queues of a
> +	 * multi queue group. This serialization avoids any locking around
> +	 * CGP synchronization with GuC.
> +	 */
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +
> +		submit_wq = primary->guc->sched.base.submit_wq;
> +	}
> +
>  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
> +			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>  			    q->name, gt_to_xe(q->gt)->drm.dev);
>  	if (err)
> @@ -2418,7 +2579,11 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>  
>  	trace_xe_exec_queue_deregister(q);
>  
> -	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_deregister_done(guc, q);
> +	else
> +		xe_guc_ct_send_g2h_handler(&guc->ct, action,
> +					   ARRAY_SIZE(action));
>  }
>  
>  static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> @@ -2468,6 +2633,15 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  	}
>  }
>  
> +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
> +						    struct xe_exec_queue *q,
> +						    u32 runnable_state)
> +{
> +	mutex_lock(&guc->ct.lock);

I don't think you need the CT lock here. This per-queue state which
should be safe to modify without the any lock. The CT lock never
protects queue state, we just happen to have it in G2H responses because
of how the CT layer works.

> +	handle_sched_done(guc, q, runnable_state);
> +	mutex_unlock(&guc->ct.lock);
> +}
> +
>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_exec_queue *q;
> @@ -2672,6 +2846,44 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>  	return 0;
>  }
>  
> +/**
> + * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
> + * @guc: guc
> + * @msg: message indicating CGP sync done
> + * @len: length of message
> + *
> + * Set multi queue group's sync_pending flag to false and wakeup anyone waiting
> + * for CGP synchronization to complete.
> + *
> + * Return: 0 on success, -EPROTO for malformed messages.
> + */
> +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_exec_queue *q;
> +	u32 guc_id = msg[0];
> +
> +	if (unlikely(len < 1)) {
> +		drm_err(&xe->drm, "Invalid CGP_SYNC_DONE length %u", len);
> +		return -EPROTO;
> +	}
> +
> +	q = g2h_exec_queue_lookup(guc, guc_id);
> +	if (unlikely(!q))
> +		return -EPROTO;
> +
> +	if (!xe_exec_queue_is_multi_queue_primary(q)) {
> +		drm_err(&xe->drm, "Unexpected CGP_SYNC_DONE response");
> +		return -EPROTO;
> +	}
> +
> +	/* Wakeup the serialized cgp update wait */
> +	WRITE_ONCE(q->multi_queue.group->sync_pending, false);

So here - I suspect we need to associate the CGP_SYNC_DONE with a
secondary queue state tracking in order to get VF migration to work.
Again we can figure his part of a bit later but should be considered.

Matt

> +	wake_up_all(&guc->ct.wq);
> +
> +	return 0;
> +}
> +
>  static void
>  guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
>  				   struct xe_guc_submit_exec_queue_snapshot *snapshot)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index b49a2748ec46..abfa94bce391 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -34,6 +34,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  					       u32 len);
>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
> +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  
>  struct xe_guc_submit_exec_queue_snapshot *
>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
> -- 
> 2.43.0
> 
