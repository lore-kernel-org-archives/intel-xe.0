Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250E7606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jr/SYWVC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F3710EA57;
	Fri,  6 Nov 2026 15:28:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665DF10EA57
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793978900; x=1825514900;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hz6lomnDBi6NtgNX9RXKmoUcBRcENPq8LgG4rur3/d4=;
 b=Jr/SYWVCXLc/adWjQ8Tpwlh8N3yA8mlBDOjAXbTideL7rGoOsSme8G3O
 GMZGGTxID/T9IwPA2h9Goye3xw/jVV+sO5CPJV0PXGRf/ExxWcgdwDp2h
 YqnornQfwHtV1a78hOxDczDm+GDDiReDQ9YL10RvYHVJ5sJ8nsqfMXww8
 eOHn9JfhrFP69E8hl57wZF8RrkPU/KI5gexV51WgM0bcGTBou9ErtJ+XO
 /3I6UGgjKjjL7xjT8BHvPngtcgIr+hSDEv4SZVdsMCidaGZVf1ude2SZa
 hbCtmbHvVEyxzB/4L1th9tCIFsjRqL6jjmmHp3HA4axwP3u8wJO05A0QJ Q==;
X-CSE-ConnectionGUID: 0iUdYnPORamt1nbgdNpHTw==
X-CSE-MsgGUID: PD/r2ZQMT/Ca17s6E1bGEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2796753"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2796753"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:28:20 -0800
X-CSE-ConnectionGUID: pBXMW5bjQ1e6h2L4HcyMMQ==
X-CSE-MsgGUID: SHHNbwlgS0m5de9cSi8KCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7197401"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:28:20 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 07:28:19 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 07:28:19 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 07:28:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QtsI4AKx/3WhBUbdHW5U4qzCR7zPPn2wWo63jlfG1XppHiSNA52EWp+T9cRuVOJ0fEQOwzHaXQ0eEWTlyBYfTvcs8CGt1v2fjXDsdHIJdpac+1ZW/QYu4k26ILIXcctE30CPR6NMwfWI56QJLTrMIaCVu/UV3F7hmnXEWdkBiksM3330BGsPuq1DSDzwrfd/3y/8MlMTFhoE7raawBylVo85ROtJa+7mEvic23JtAf1p/2+gLL/6T/vjSMNrLdMySCZRoIONs+dwgsFvU5Ssd9bdOcE8jHbrtXvryLdZGDZcdXS7IJmQjHhOpARa7jwW047wm/3NyLPzijEzAS1hIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF65z9KUQehdLf3h2RxEfgbjsoAthaK8pLt5AaOdZ+Q=;
 b=WAQRw/9C3MKp5GnBDP7okHjchQOicQNe4mQwuNkZwcfcpdgH+RLNIcrfFL02ZWEgRf0TmiAT6P1p/NKfDV/ExmHxCp5rATatDVifdZkumiar0ZqriAd4txAUl3rfD2IAmsM75oQ0/UA4ROACYcfu9CJArbEJ3tMD/Y6nLTjLpcUkrhK57//6ZXKj1tJ2SVZEM6Nt2e3EoQSC3BR1YYvtzK+Qaa8LBIihYqv31xqSWkC8wzo4z/Oa+zNUFEimM++9hKKgmPTdh4Q9Fc/WzZj6mvKbqdQFmBle3ACG6Pe25OPiAafa2zD5HE8o71fF93d3UwFQOYVF5e/T/Eie15W0HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by DS4PPF8ECAFAD61.namprd11.prod.outlook.com (2603:10b6:f:fc02::3a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 15:28:03 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 15:28:03 +0000
Date: Fri, 6 Nov 2026 10:27:58 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <tejas.upadhyay@intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v5] drm/xe/guc: Demote uncorrectable local error log on CRI
Message-ID: <au3x_rnJwEhK2KIE@intel.com>
References: <20261106034804.2005214-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261106034804.2005214-2-varun.gupta@intel.com>
X-ClientProxiedBy: SJ0PR05CA0126.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::11) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|DS4PPF8ECAFAD61:EE_
X-MS-Office365-Filtering-Correlation-Id: e819ee5e-9144-498d-5b12-08df3c1a8c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|6133799003|10067099003|11063799006|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261022113327099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: 6Q0i44xO6tsETBUWOZz1mt/i46aHkSyyYs+XuN/ReatEeqt4Cog3y+Nh6EFMDLIA9blUahn/7ArG2fyYxNktiVOeVwbDJKFCcBiH77/2Vh2LPIw8wbyu3mXdC1plWPQPgD/TdFovCopWRg+TToITvRe/vjDkg/aeOmPlfPN+brSCZyhOJRcAH10u99pCK8f7zBhEzE7N/07zkYFpl351H5KDXH/k6R5s9GTcPotUpwXS7jPJ57rpXtDNyjoqarOFJG1fT5pXH7jjKbFECFrvOaV6d/U+H7xSJSW1vLV/qA0bUi5BqqRdh16Y4CX4xqyFzapOuCVmO/BLcrSDNPhN+n7ZITJHoh5Aw+FkNhHaqiypmC6e4uZPQCfEMPLE9XZua+IAE9PgwAtTS6ThXg/tk3QsoEJ9TWwPGybCZpNk/Q2phSKhernSj5x1+5ZeuJ/kRdCA7A3xKz6b8TTCm9ndIbepHDCvf5egEks3K9RPCQbkuzjEWtd7d9ynVWXkdDFrNoWfdPFDwDejNrQugcfizU+Jy2cBQWJLBa9fMOYiLXWYnQti5VJ72gVfwjLzS4E89K2a8Uu6+blrr4uUOF6sF5bO3HJn1G1ZBAk7M+l/C9FlHyp1gDtlIe8OX8jiqAlCVtY4RsoXRysd/9Kz939wb6NuspmsWBSX3v2ghYKD0OM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261022113327099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(56012099006)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2LvukaDXjSVfYsLni2p23HdrPLYO3+Kh8mijo7yxIAkG8ZY/wbKDIuNQIWPy?=
 =?us-ascii?Q?ZvyGGDwxgaMwkDvG/RtTuzNopKlcql34trFQEdTc8vyqny7WOmc2IHEIIM3L?=
 =?us-ascii?Q?UomrmazgSVyK53M9qbohPYFe6ToCBLICqwiN5GfbVnfy26ornbqCQWJmXDcB?=
 =?us-ascii?Q?9Ay93i2CIaBM7+jeD8qaWF+8mxBWJWS6YL7cXgLiS4YNQtr4uT0DTn3T41T+?=
 =?us-ascii?Q?0Xfyn3MUxX1aaZgjKb8md69DSpGaTcZQWaasrHzANERPRu6/K3CfYC6KuvPb?=
 =?us-ascii?Q?TdDpAgy1rv8l/g/iEwJOhE053P/FVwUVcfkz9rNhtyDJCb0WlVpIfhaTyRFg?=
 =?us-ascii?Q?Z68VQSAunn0DVjGr8vexoUAv06If1SH/lPGAO4AmYdYAvsbxd3jCg1CmEGjV?=
 =?us-ascii?Q?jMgUPxakQSgX2aq4OMairv/+dymK9f7GbOe2I9Ref0sXhFGm+493DYJwWuCP?=
 =?us-ascii?Q?3bIzfLCx+W5oB2BC7iTYrIbvwOeDvEdezp0vZUsMugcAQwiZX8jfcuhWPG5+?=
 =?us-ascii?Q?U8zURpMxPFCE5lRs8IHW26rnHyKkoetTgyIEC6XNXy6OpNnyv6tBOqm2QHbn?=
 =?us-ascii?Q?cHiwCjnsezhjd2hhloo20PR6xmI2PokqHLOPGtqezurd+t7zKeuKuQCHY6D2?=
 =?us-ascii?Q?+0v6PbEvvuN+jFm6V4a1pSion2w9tV7ZroSrcNMQqChQsluzNQSKkeJVqal2?=
 =?us-ascii?Q?BMRON/t+8jhnj+yHUdmimt3ga/eRwVX7xpjSp3R858Z4EzO2jFL1NvbMeD6E?=
 =?us-ascii?Q?GEtM6UGzMF8r4v4PA9FCZOe860N3I2Q613quIdLj5LJNr1xwmFqDICoh9O0k?=
 =?us-ascii?Q?SiJJrcUhCJKfEzG0TUTorgpeWYQV2TudoUuH9dPvYMKZd9oaLdXw+4OguYsi?=
 =?us-ascii?Q?pn7Gd6ndYHGX5ef8XQ527egsl3N7u238+JTKktLDzarToaJfwtRIMjmKYW3A?=
 =?us-ascii?Q?D1mDCwGenFotjazvmqql3283b6mQY8DfWYp1b5kTD/Eff7qReSNkk2nYmG4N?=
 =?us-ascii?Q?VAxXCn6hkG6DJo6ftQmWnaD/qRwFuzeGTfOxzy3bg3bAMCVWSkNnZMSvdfhH?=
 =?us-ascii?Q?zW88ir7Pw1P+m5JN+ULAqbtsQjgo7g8ZsgiBSDO93tJpt7pDgqad14rQYOzw?=
 =?us-ascii?Q?WX9//JG86WqxXVeE3nbXiOLUp6xkPmnjuj2j2E2le4aTDR0L9ohvjU3cMQaQ?=
 =?us-ascii?Q?kbr/qT3mmVcT3HEiY0nlehPwnETtDryJDsjx1cNc6fkHn4hXrMJ/xlFjOAjf?=
 =?us-ascii?Q?atGI/uKAI6VHLzMfncRR6FqXacO/1tcTAaRI7XXxswpYEPzqMOyn9NyEERGh?=
 =?us-ascii?Q?eDhwvqnwMIqn12fM0STGOna0udkg03w3WsMK4/zzkWRwyZt/O65br32Tfla7?=
 =?us-ascii?Q?4dJu7ZNnA+qhHjcbDJZWTje2JAAoHWBGIF4Pwdi4m22uovzlHNXSd0zc8Jc9?=
 =?us-ascii?Q?z4Zx2mXN02ieD+o24dfbewkUycNSI7q5kSjAw8vfrThi6wrXxSjw9Mqkgyud?=
 =?us-ascii?Q?MeC85ciaMNcTX2HlL/4SzCFokWU08aNegUR+2sSRthTu3PgPmDl3ZnS07l+j?=
 =?us-ascii?Q?9NnuYvPwav39Xezof1rUZGOqq3EM0IEN/SJdUjq9kSTF1MfScNpCd1w4jJBs?=
 =?us-ascii?Q?0ZkM6VfasoicgSNtO0YLVo8RLDQqv+2qMDqq6gJ+A2zE1VYfKK/CLHyOti3W?=
 =?us-ascii?Q?8YqMxEEs+j0cqwne5SgjKJHequ+XAeaEedTz3da+iojO5sEkQnCNyqDef/Pr?=
 =?us-ascii?Q?Dn0ZJpYfUA=3D=3D?=
X-Exchange-RoutingPolicyChecked: aqLlJPqiLwfI9v5QIdeXqHlXjd5wjAgC1NM79Qi2CjI93Ci9e/GjVgP63Lt/3Ol4fEBRu6+x3N5HPirk4UUHIB/wGiQHkbXPJqSqMkTsiUNs1ffSQvZT59vPrxWDeCLnjwjand5rxC/zWz3aUGp5ULcTGceWBIcbg3NH82D2zGkBBMEkwMbg1+gGa3z9NkMIuShGHYvjDvrUsFyrjlrGexf19Kekp6FZMesSlgRK7IaQw2gm6ozwiBbelmqFtHCiswU+RadylxH0S4mHGluJyXdIxuhf3Q8usMAi5VId7YbPDT39h5KeMAcczdvRzOin/c1VyjhzKfQQ4+QRw4FPGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e819ee5e-9144-498d-5b12-08df3c1a8c66
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:28:03.4434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKv/JUru0f3eZjwRxKwDpCN8FrfvizJCoQeb5AQ2+STbODNgaeHdB/ay7x0jiQo4MPbHrkxcCjBol5JI3QwKug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF8ECAFAD61
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

On Fri, Nov 06, 2026 at 09:18:05AM +0530, Varun Gupta wrote:
> The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
> local, queue-level context termination rather than a global device or
> driver failure. On CRI, due to a hardware limitation, the platform cannot
> distinguish GT translation faults from true RAS conditions, meaning
> standard workloads routinely trigger this error.
> 
> Printing this at ERROR level is too noisy and causes false-positive
> dmesg-warn failures in CI. Demote the log level to debug for CRI.
> 
> v5:
>   - Correct commmit message and comment (Tejas)
> v4:
>   - Change to _dbg instead of _info. (Matt)
> v3:
>   - Limit the demotion to CRI and add comment explaining the HW limitation
>     (Rodrigo)
> v2:
>   - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
>     (Himal)
> 
> Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing soon, thanks for the patch and patience

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e7c2778029c..b14b37b767f5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3610,7 +3610,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	guc_id = msg[0];
>  
>  	if (guc_id == GUC_ID_UNKNOWN) {
> -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
>  		return 0;
>  	}
>  
> @@ -3618,9 +3618,19 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	xe_gt_err(gt,
> -		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> +	/*
> +	 * On CRI, the hardware cannot distinguish GT translation faults
> +	 * from true RAS conditions. Demote to debug to avoid false
> +	 * positive hardware error logs.
> +	 */
> +	if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND)
> +		xe_gt_dbg(gt,
> +			  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> +			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> +	else
> +		xe_gt_err(gt,
> +			  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> +			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>  
>  	trace_xe_guc_uncorrectable_error(q);
>  
> -- 
> 2.43.0
> 
