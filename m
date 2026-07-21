Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D462C4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 21:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0E310E0A3;
	Tue, 21 Jul 2026 21:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikHVxRWa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3514610E0A3
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 21:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784670029; x=1816206029;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0xRHeRueI+1gZv3jmd7ihJP1Xse9+RrLWE9IbyoBlkA=;
 b=ikHVxRWawdoa1glJjDgbtCe6SFDsCs9QwW20v0XeX/MVlHOrfTNxb3CC
 iQq21rXFYlVOTCZdeQsNBrRwZG0BlMiU5SbkTyN7TyXdtd9sFBji9aueV
 CfWyiVuzcAbIfFkzR2g7AUjqgD9wRu+CsO1KmG7epwjX0wFkuwU12VFgk
 jZ3c3CPhR67epFxwCMxmI30p9IRI/B5zJu12U1rga5lSPQwjfzSTjGLsL
 RvFoZG3NWO/LVZ28K463UFXTBZfdQuAJUzufdhEKjGk1+kk+Hot8jW/mV
 SFZdE5JgEoM7J8AMvzTP4T2HFkVZuYRDj1BflXl8YYbGEcSWvj2Rcp6c2 A==;
X-CSE-ConnectionGUID: 9y20JjPbSZy6hAUkQt5+aw==
X-CSE-MsgGUID: lPxXlxIuRLuvgslUz6q1fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95655945"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95655945"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 14:40:29 -0700
X-CSE-ConnectionGUID: vgh8rBh/R969dn3nRCbN+g==
X-CSE-MsgGUID: 7CCotQxaTbWxUInSgIHACg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="256098607"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 14:40:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 14:40:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 14:40:28 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 14:40:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/NL4rb+Zkwq3M4jXVWdJzViSkFF2G5ug+hverzezOUgp+/YXqz2hffbzhswNe2258ZvlUc2BrIQBoOXhzniF82u3XzK54gqs4IoNQxoAkDqzgXUDewfHnl2Xwcb4Ebe0gYat0NTEE7RuLZblGS9lovqsT8RiQeqoFcK7bGOPsJle7Z4jZ1CLG0Ku2wYLh/nXIXPdS1tMLWnTeklwLiCcovu133S/RuRpD8GT5cIYrzwzA4IOknAE2lIZLa/HV9UW/tE+sa++c85sM7N3SG/TUCaqN9aQ+vcx5yok+/qTZZK8gOmFos9JGDK7SXokz+NYVutjfRAE+BKpmBq2vOYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgQt0ARugcFQM9GWM7tJURE+k+f1wNDV+AWIe3yUx4Q=;
 b=lp9R+Cu9dE3SP18Y34BvAjUlOlGvOYlBjM0284+BcrqIvi3IR8G1LyA4lZM5bF6o35ho1BUUgREX4zq5cqpbM4HiEZ/MZ1II1cBhl4/03M6udjEnt5NmdVfthIelB11aip//J02eFNl4CaMnw0LMwZ3ob26oDh4xd1J1RUVfzRNKYv5D9i5IThjLcuXdBVnF3z7vX2XlKLuEgNhTvDs59a/1CdSkivKFMMrMbkFv3WucRBNA0ISgl1juuHTeOv97VrpCkNFxWvmFswh54wYq6pk83MCo+QmVTrNRB2kpKfYY5CblvUYKr1ge6Uof0LwqOUH+6qX55ZsU83gErh/ppA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB9830.namprd11.prod.outlook.com (2603:10b6:510:3c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 21:40:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 21:40:25 +0000
Date: Tue, 21 Jul 2026 14:40:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/vm: Use regular comment for GSC VM lockdep
 note in xe_vm_create()
Message-ID: <al/nRhe5aNxVVUIS@gsse-cloud1.jf.intel.com>
References: <20260721205516.4058959-1-shuicheng.lin@intel.com>
 <20260721205516.4058959-4-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260721205516.4058959-4-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:303:6a::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f7b24a-5651-4f1c-5e90-08dee770ac8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|4143699003|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rIp0NngzoroZHZS2jBfqrx0iJ6PZtkxH882/rKvWN8YOrTEQN9lzUHZN/s7HYNz4M5D82+DfDrstRd4MGmXxLHalk5DKQyCO67BsNABAESQlkveNCPbW3ARWikW/SMHGmhp43wVR/XL2w7VcNXCISpkhNmnp79jF363Vm3qniK6+dYWsVjS82l/Y13rwpvbyoCSrap6m6F9WbQtkyw4VUmdN8Qhrlzj76JKsab82+WKaxwr9/6Oq368210tGJrV8hz8Bt3wMWGvVCNsaF6wcpaiA3ck1XvI3eyIg1/MgY0YplrEuRILZgA/eFEOQVBsoyP9lkBMKSSmAs/UUVT3Zdscmou2gnGng23PVHK+xLsvrac/VJLgDVCeZXfr/vMgofnqRSzKbCYMScCFFZh6TiNqXczSN3uZ44AySLY+gWuC5ExbfGhR+Ci/+PyJB/jsPAmDIk8CjhxOVK3qRJKGfo4NU2f+hbJN6oNjkhB3STJdxHVIptnGuE1PTgZu+spQkrQEgJf/TDZnuTZI4ty+HMtSw0bq51VADHsWztLay75Gf1IkTIiWagKOA0n8h0iVLB8WRQAo7ZcNuGklZ/XgecC6w5bldB6mjzCjnQfioU4gL4q3FzgMH0vC2BjtHRp+fZYlLHqJK7SA/2Wdiaooyc4ytXQfoedGf2E1jPn/C9ww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sTvPAb9KVPJ9ObhW3Qa3sIRtGHbVbx+zqfQqyrXGPNUwTdeeBpXqV/43EuN8?=
 =?us-ascii?Q?CgiBCfHkdnUWwQaZ+1iQnPTxutfhaUGPcxWVUKXS6HRJ3r04LmJ4HYdB9Pb5?=
 =?us-ascii?Q?EyJvjeGwHnvjkfK+H9MTy2Rj7pO+gokJMchQLrNjm6bIf2BdUFOTc18fIfyo?=
 =?us-ascii?Q?/icFqdy7vvLmu1AaGEVG6Z1vzwhqua2OwbNUDsmPBrNlJ098zPjL7peqg/5L?=
 =?us-ascii?Q?26U5kWvb4QWhA2n5UeaDyUrNhLDmlx5Wn3G4BHQKNTa5tG3CiT8866rGRoyN?=
 =?us-ascii?Q?G5qIG63VKMvmNqyBsdE7qYWeYjiy5G1cgEeuuPrq/ePegYtPiSgQFlHYzGUz?=
 =?us-ascii?Q?HVmba59hXaL5/tJr9KNgZ3nyF5Pf6+WCh/Fj15xAJYO94IWXchc8o7GI2Ahs?=
 =?us-ascii?Q?DfRiwaeyiQtNClKmjaFG+PM9EyabmbFFoSOiTwRSEbN9YXSQsY6KFZ4s5s1x?=
 =?us-ascii?Q?rXEev1yjBmdFhCpy6XO+uRStY2y8dD390jsSLa1VbzRUd92MiILJrK+w2Kuk?=
 =?us-ascii?Q?dpVJmqSNcC6h3jdMakCrloQUYqGevht3utzQEKKjN24npl1CSU1JKgpCg2op?=
 =?us-ascii?Q?SXlaYwc7Qj/dXo+BLMPzcqLR+5y9LPTRrbtYiy905OVY1TSw0A2TgbIMVTUm?=
 =?us-ascii?Q?Wn4eOfU5wybzkBKnAI9dg5VDufNHCZEyEpDkLDaM2I0w/9+OyLs9b2F115J4?=
 =?us-ascii?Q?eI/lBGLAovhnOJSBd02y9BRDQFzNZVv1fV8iV6xfuiM4uX5XMpSjVL+6GE3j?=
 =?us-ascii?Q?lB80A/1Y3TaVytu8mqb8YWxwGYX19kC3bIspcBps3S90MrWsuaJ6xbxVBi+C?=
 =?us-ascii?Q?tq4TpTR+ZzkO04Ie3DxcYsa7Ip+QoDGKJseFblv/zfMTZY+IIv+nfl2Kk+Vo?=
 =?us-ascii?Q?Py8Drxou68tv0Evd54Myhw8fa57CDbBwvpuxbj2J5fs1AJ793lowNv6DwfKY?=
 =?us-ascii?Q?wJ9SD1tHKz1kXrNNExXKVfJD2bjvN8/tg+uGtdRG8ofG0b8pTmZHhrdwRVWT?=
 =?us-ascii?Q?LCZ/2n3/j8dfH9v9aRG9FGbGLMWJJ5uKilNUsxbDlAH7SdHEEPRJeyQysMgo?=
 =?us-ascii?Q?yGDOEwvysHN2CRwDYdr8i/3LxjrP2V4lugZbx/Vq9tIHqB0jVjvhl86FDEst?=
 =?us-ascii?Q?Y8b09kPDSA9fg1a+K/DCJOYLCsQfLdIaylgYYIGdfnlAVOD2QXQnOeoKqMKw?=
 =?us-ascii?Q?vTslZh75j2RdOXlG0ah9jNJL4RdLPHUgO1ot5OHNGTH9rdoaE3lS2vbW7Jf3?=
 =?us-ascii?Q?mJawJRp6TIzZRwVqdFbc7JkjZSvSynY39qmL2EQvbXWLBr+wGPA4XfRKd3Lc?=
 =?us-ascii?Q?U2pI5OUF48xON7LQnqWZZRiEY2XfrAeIhAJeHnJqi5hOWKZiF0f1zbn9bpcG?=
 =?us-ascii?Q?LUQOQaFngjr9+bkd2rw65H6iHVpXP0/aQ3qDDSu2DZ5c5b3vv6Tiq550TsK8?=
 =?us-ascii?Q?ID9B1HTMZgUU0CD9YEFlrZioAoe+N8BfiutCRRM+djK5WpGL0qjNy6Nc3d7G?=
 =?us-ascii?Q?HfgJ+hKZ4yl7NeUHEF4FBcta53991P07U7tN2c+JgA5g6kdmmHM0sXXjG7Hh?=
 =?us-ascii?Q?DAnsd4qqcm4+3L8k2KSqU1RC7/XXbKZNmssMUJpbWJsmqfTDPKNbKLQajqRt?=
 =?us-ascii?Q?iRrbly/oLgcN0e882X5YHQKyzNAXxvWVNrgbxsyhPXyfwj05t8takHGBsEWy?=
 =?us-ascii?Q?hbVHLSzO6LEYYAM6+b9J4zUvlqMefHddGaajTLR7VAhBSaunwnTOVBmY18Bb?=
 =?us-ascii?Q?KPPwSKeIJkCPjbiVC2061PUjvrpxlUA=3D?=
X-Exchange-RoutingPolicyChecked: A6onsS9zpREMA5u9BAccBp8ijYhbmcwDF4xhUkq09RFZPjvSuM40btNdJqNlDGLFkH92Zee/WSn4AloAVq6+ROMuVtMNBIsUWH6vWl8RaE3savxP+KFRZSXTmO6HAPOBQ+CAT92KdcFE8pAL1DF3bjj5iAvGLnxC/bRzie5W7wnErLicfTOyfBEt/jrTa0JsBUG6vd9hFOzKdMKdB0v2ZzVPK40ZiNwdLplPEeOPetoApFivUfViooFDcwNnbqxJ+9TrORe05gnxeiVnuuCOMvIQwcinZ46wrldUfZzrMjnZlHjEvXCCSklojbzJfM5i3JsG3wVp5UslNONzGhgDxA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f7b24a-5651-4f1c-5e90-08dee770ac8b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 21:40:25.4744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRC+oBl0S2q9/u0U2uB0XZuQKiRAPcvnskGmXzc23Nyo1OAfLNLG5gZg0j0/jCmAvChPzrJ/aXSB/uJkl6o6HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9830
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

On Tue, Jul 21, 2026 at 08:55:16PM +0000, Shuicheng Lin wrote:
> The block comment describing the GSC VM lockdep annotation uses the
> kernel-doc opening marker (/**), but it is an in-function
> implementation note rather than API documentation. Per
> Documentation/doc-guide/kernel-doc.rst, /** is reserved for kernel-doc
> comments describing functions, structs, and other API elements, and
> using it for other comments can confuse kernel-doc tooling.
> 
> Switch it to a regular block comment (/*).
> 
> No functional change.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Assisted-by: Claude:claude-opus-4.7
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index cdd131f7c7cf..5f37e84cb42a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1645,7 +1645,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  
>  	if (xef)
>  		vm->xef = xe_file_get(xef);
> -	/**
> +	/*
>  	 * GSC VMs are kernel-owned, only used for PXP ops and can sometimes be
>  	 * manipulated under the PXP mutex. However, the PXP mutex can be taken
>  	 * under a user-VM lock when the PXP session is started at exec_queue
> -- 
> 2.43.0
> 
