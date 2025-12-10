Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02784D3B9BA
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 02:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16C210E23B;
	Wed, 10 Dec 2025 02:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CGP3m7NF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A53310E23B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 02:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765332918; x=1796868918;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=klCLaw/VgbGhgXG3JKV9x1BHxgYRdo0IqtMEeQIzkH0=;
 b=CGP3m7NFSzoOsR8EixOy6qaOpc+PeflPv26ZqgYidkmHM9a1hqV5n2MT
 Kx3PrBIo7DTKwJVkO8aNB6AqRmqJGeCnw0MqDQNM9aUCKbW64tTExwm1J
 ucuFbXju9/rO7sTiNpz8AXHdWGh/gJeEVdmBlrTLGJKfe/UHuCya7869K
 Nnh/eN+XfjwwIH7vlZ3duCcPhIn6mW4XpBY+AsPCiaYI1Q0GS7BH2QBBx
 Ltitp2fyjIVWDvD8UmmdAqLohaaXeaZ2dHp6qLX/xf+qV0rAVPCphQjKS
 6vHjWGcWJak6THrwgdfhqOTzo+OqA5wYzUY/dOMkEKc610i/JdjYHw+sc A==;
X-CSE-ConnectionGUID: 1et8h4SXSt6iNLcLEGfGnw==
X-CSE-MsgGUID: ZoyTrM1hT9SAPbpJbMxfLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78767753"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="78767753"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 18:15:18 -0800
X-CSE-ConnectionGUID: Ts4zbv1LTbSSdKJ/5MgUNA==
X-CSE-MsgGUID: evbn2gX8TceJdN+lQ3JT7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="201499350"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 18:15:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 18:15:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 18:15:16 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 18:15:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWJsdoPJ1uhJg7hzIumhiPOTCqI8Dc3GWRb1aPmhoVnp3WOnDzjr1YMZy3jS+DtZR6ZuNCfSDOIcbASaArB6ZC5JQ2s7RuqNfbPy67mcK4e3TVcfOl4HWg9VmyVPVMdG6K8km+Rrp3voVz4MwEiryw8JXQx1GVmPFHWOH8cbnZAurj/2nBPsGHgu46qk6nBDcvkY8DDJyQuKbuCsc4kjSQL2k5aJOE28GND1XEUEOCqugjMdD/lWHTuezN4si7DauxXpoNQsU89OQWL5FLRyxyXfao0D7SxwykJwCrR/ffzzlCaVtce3jGHh19VPD+lbFA9hw5FzVc2+8/Y2SrrZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YaUeQWgE3Jot7qi3z1BD+Np5XpJIhYtU2qiUPZ0njg=;
 b=uMHCIRQEbJop7J2sRuov61vLnghVWTv57ye7BE0frqMty589yFHzkR4mSlHWDWtg5KSBdJ+5Mb3mfuPScLCq52K5f9eHN3zAYK6IcSR6x4c1QvnDNqtwVZDFrHLwB4OMWyJZMrsmCavKZgKrC7bqFb/VEgtxIu0jYjPxkiJbHTz9UBn+u3V4+TLWb7iSJ1fkZzFfZmu8GaEPj6GvrykRMj9g+J9B8p1I8UveOS8+548fThQkMvNlC5ElDr6pPfHeH5hOwAXWdVw//mMb90cvoyiXxjeUJZUnk0VWXZL6QKZM8fKog5k0G1O7ZgLIHmf/CkN8N1tbge9HWkjcYHFHAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 02:15:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 02:15:13 +0000
Date: Tue, 9 Dec 2025 18:15:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v5 07/10] drm/xe: Prep page reclaim in tlb inval job
Message-ID: <aTjXr96MYXJ/t7Zb@lstrano-desk.jf.intel.com>
References: <20251210014517.3184135-12-brian3.nguyen@intel.com>
 <20251210014517.3184135-19-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251210014517.3184135-19-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4PR04CA0322.namprd04.prod.outlook.com
 (2603:10b6:303:82::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: 06145cc5-c969-4c0f-f29a-08de3791f3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hTKRya/lkvLDrhy7ccq9mj3YU6zLkE5lOY+ZP6txRwm7aMRzonvXGO+ssU4J?=
 =?us-ascii?Q?SSF+ZBjph+7RoVFFj32Q1k4Ayg7wNPA1YIOgJCq9YmN9+ugQ80A9gd1mYVN4?=
 =?us-ascii?Q?3K4Yt5JW5G/uGf9bLwsia8erG1+U50P/axtRo9ctYKGrpwOS8SPKJk9HimHv?=
 =?us-ascii?Q?D42ixllfLq3SokVFA6eJbsDC5BYS+ibP2wgRAZ6Gb7Aee1bj/ZANwdw/neSK?=
 =?us-ascii?Q?3BWmKv2bAcTqdyHBy4z8QrCHZvkE9PygP83jOdJ1LM/IQjr70yQdwmGTtykC?=
 =?us-ascii?Q?mBYA3bmv8OKRr7668rZpJ2ZeRgQJ5y+LqrZ7H7tTIpLAg/SmBPrjmxNM1jRb?=
 =?us-ascii?Q?omnO9PE+XAW+U9B89YqSLmxX1ILVu9TkCgBx0Vy/SbXHrRLiEYsECx+IAk11?=
 =?us-ascii?Q?iNNTRN44r7hZzkH64KG6m+8D/1cnSvuh8k9r+wYjraRWlRMfeSkZUFXcAuPR?=
 =?us-ascii?Q?WmEn7MRlxf2Z4nLZvX6FCMweAo2ILW9+0fRPlFymG5XCicWOCZ4k6Y7Ny3pZ?=
 =?us-ascii?Q?VQCo/utu6eqCJz2AkKEmipxe5FL12sZOUqsTauTQb/IaMVKihsEau8SnPGg3?=
 =?us-ascii?Q?qEwuKSuTPAE2YWvRjYLYpqEmVBk73cmfJWstym1k5yZkA0tF4qJMkHUE9Byz?=
 =?us-ascii?Q?VscdfjUr+ov4yKvwtppNs8igJbijORg3FxhC12fPjTplNfS+1Xfsy5eFgyff?=
 =?us-ascii?Q?2IkDAlKdLSwbSo7UQ8eR3n8w0M7DF+2QCL4uVoXprKuo8W3P4s4NSm36hpeX?=
 =?us-ascii?Q?ONEgvXXRBG440tG7S+E27eGxOdrRNjnT0cZMogCoJNP3L1px6DMnq5zvPwHp?=
 =?us-ascii?Q?sEagGbRaxX+lesNAv+lZt5qaOlDaZIhnrEck2FMyjNF3o1Cmgc812HF1cR7C?=
 =?us-ascii?Q?dSMtYETUSnnGPGiO+PA/rNg9QURSRpNhWXPwep6sOVIqAIm3E8NduJUFkre/?=
 =?us-ascii?Q?F1C/ziG4+OarNLRlqLMtQ5urN2DWz/3t2hiv+QamyVIFNfZidZwsfQjKo+vW?=
 =?us-ascii?Q?00SKae57mMqr1ka3wbFykuigmQ3TsGYR0V+PY0XvQYO96YW520SgA0eFKAib?=
 =?us-ascii?Q?tM/x+75EQtqxDRwPINX/T5pQghcPWWpJoUdQ92RJFCMqBPeY7eNkv6nqs4SW?=
 =?us-ascii?Q?bLeKkrcFWeuY61yTgEvuw1S3zFnFZiORZXPmBJvGRbg9G82QPo0uq1vu9l4D?=
 =?us-ascii?Q?Ch5wSKQUebN/CvpSraW5Qg1jpAtEuojvlwWpMf4h8bkYSWKAEscWEi/cl70b?=
 =?us-ascii?Q?ydk1nCIvbR7fcfz66KdNuBf0WNKEpGJZ3MgtQQVAwE1edT54wL0nVnA9MJ9c?=
 =?us-ascii?Q?rWYrKe0q8+q9C63U+57y8xLp4yFuDePHifrOwp017A6kFZ+mDy72sQsSAIde?=
 =?us-ascii?Q?cXNkPjM6Lz0yuccPo/Ec3XRjrBNsZVk6cRJgdulMAq36tyJGsDIQRA2uqbTa?=
 =?us-ascii?Q?5BC2Hxu/Xz4/8MlFk8ziZmcIBtj8o4+u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IKPFQ8Wnp2t0rZbiD6QEs1yUdDmZQCyvYt8YDLY4pkw4G2rxBRaBTFhIemSF?=
 =?us-ascii?Q?/gveDd9mwh7oWm32RbV5YbomYpTMhFOHwtNK07yMxHsbakNf40SeByJxZtk0?=
 =?us-ascii?Q?BIK7sZVcaV4GcuMrVBfFaxTilCWiDTW8QZQw5igfpvgXIKda4OJuIFx5TYeA?=
 =?us-ascii?Q?q5WXzMUo3USFMZ7erTnZhN1aeFXBII+rNJP+87QlTXo9fSdqFgORN2ufQ6v7?=
 =?us-ascii?Q?RuRqFcHJiWKLjjedAfZvaa0BTpypyYTW6nwl4R3HSye8sJR8KSl12wFoI+kv?=
 =?us-ascii?Q?iB+iCLGfHO8jz4WHaKqqvbVdljGvSo+g8BRfppBD6CCW//b6c3uArZv9omRt?=
 =?us-ascii?Q?ARUcO/5/3lal2bVSscmAp+Ltn3vwRbmMoLeq/g/ZLZ2JaZFSUPqIwTZZMI4U?=
 =?us-ascii?Q?sdfm+M8sTw4BQ0aT6eo6wPZSnX/DsCzK2vD+7e2ngZD4zvOREmLIBq7wwx+9?=
 =?us-ascii?Q?shyJbQ50CU5f30H/2G3Sh7bn69xEqGcmIP4zwG0D0M51X7Ze+zvutSvbtyc5?=
 =?us-ascii?Q?Sn7ThmKdHp0hhLixym+/LLQ2ONNT8vcL+gYRpNdQuT3JE+2Uq9QHk0qIUIZC?=
 =?us-ascii?Q?Sd/HZ3BMGKmTyECW+sw6BrhOhCTCIdq5Q2GNtPfEoEipQKWXSdQbIgZ2SI3c?=
 =?us-ascii?Q?7xChkH5/3GXfy+RnhR7n4JHUucPlpAgVh3NKke+laMwKaikSYU031b5FAean?=
 =?us-ascii?Q?SqJ3ZxwWCc76gGvtPfRdeG3/2gskYrh3jvYN6ycbcurNQp8jTvADUorxFtza?=
 =?us-ascii?Q?PjRHiJeqjxq4elDZE5n9cGR8ENhxtJFADAtAMyVpa29Aj2BZy7raauqu+Q4y?=
 =?us-ascii?Q?BmKg1ScMDPysry4unqb/ba5Pw+EwAY5EzZqQcZejz9UDxzr/wO4Dl9+AvT35?=
 =?us-ascii?Q?LHffHIsJDEdLkKQeBBBtNAaKXfSMQyIMhBdUPlSTIEN4STZckFw6BBjeKJRB?=
 =?us-ascii?Q?eTl4l9VDcEuUy4RkxMvMC1UejWMZsRwk0KUXVBvjnK4lUdH+D8n0Btb/5/ld?=
 =?us-ascii?Q?+YBRwvjDThhu1j1pH1WulpEV4hVm0w+Plwu+UWh/8VNgMzsXdgIN+E/VCCMm?=
 =?us-ascii?Q?gJR3IGapjyuYfrD+neKsH4UJrILM+f1JM/jjKz2PKlXx3tHfhwYcemgn4l1e?=
 =?us-ascii?Q?nbb0WhFjjFTpFE99Z077CAdz8nUFejkoaNT6H+SAPq6zuXg5ndjx+fNkp0iO?=
 =?us-ascii?Q?LD0DVX+02paBieRw/UHPEbB7+h+JWRwgeG0EI9QSr1bV9w61sVwbLkmDD5ro?=
 =?us-ascii?Q?u+xM/C5Jh+w0uFAGSeAIvKpgho0SS8RLemKCN35DwXBhzkgLjxhuKXERkVbq?=
 =?us-ascii?Q?+Ul+XaE/5o1feLEifY7QOVC0HAb02hNKLpKimnBL/NtgoPJTBj3PDUgR0rM8?=
 =?us-ascii?Q?Fl7eQXb7e/bfvz/iezuWlmkhldp1zGP7Ms5EDMSP6oOYulhV2VIvcpoqJK4r?=
 =?us-ascii?Q?xwjXEyRemB0htz4B9q1Qt1i9NA/0Kg+p3vor2RjhMx/iw1oGqsVYw1EzBwTa?=
 =?us-ascii?Q?wdvRPlmwBKtyAEQICwP/fIWmoJO/YdV2NSxTCNVVYxVwdugyUadoFF4GaLFN?=
 =?us-ascii?Q?0JKLXwQFPSrFSgbhmQteJBqfsKmtIczi/T4octWIqsaWBxOUdtKfQqGDpzSQ?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06145cc5-c969-4c0f-f29a-08de3791f3e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 02:15:13.6048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlynouDEEsH3tmRu6VCagCOQZ3SU3RPHUBKPKUquOhrH5Ifh3agb9s7kup18AHyfWVHWAGRgHF+Cv/oqzaIKmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
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

On Wed, Dec 10, 2025 at 09:45:25AM +0800, Brian Nguyen wrote:
> Use page reclaim list as indicator if page reclaim action is desired and
> pass it to tlb inval fence to handle.
> 
> Job will need to maintain its own embedded copy to ensure lifetime of
> PRL exist until job has run.
> 
> v2:
>  - Use xe variant of WARN_ON (Michal)
> 
> v3:
>  - Add comments for PRL tile handling and flush behavior with media.
>    (Matthew Brost)
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pt.c            | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tlb_inval_job.h |  4 ++++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 89802cc16b47..78e2f037f8e1 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2512,6 +2512,17 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  			goto kill_vm_tile1;
>  		}
>  		update.ijob = ijob;
> +		/*
> +		 * Only add page reclaim for the primary GT. Media GT does not have
> +		 * any PPC to flush, so enabling the PPC flush bit for media is
> +		 * effectively a NOP and provides no performance benefit nor
> +		 * interfere with primary GT.
> +		 */
> +		if (xe_page_reclaim_list_valid(&pt_update_ops->prl)) {
> +			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl);
> +			/* Release ref from alloc, job will now handle it */
> +			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> +		}
>  
>  		if (tile->media_gt) {
>  			dep_scheduler = to_dep_scheduler(q, tile->media_gt);
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> index 78e39a4fb264..fc5b4a32a32d 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> @@ -7,7 +7,9 @@
>  #include "xe_dep_job_types.h"
>  #include "xe_dep_scheduler.h"
>  #include "xe_exec_queue.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
> +#include "xe_page_reclaim.h"
>  #include "xe_tlb_inval.h"
>  #include "xe_tlb_inval_job.h"
>  #include "xe_migrate.h"
> @@ -116,6 +118,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
>  	job->start = start;
>  	job->end = end;
>  	job->fence_armed = false;
> +	xe_page_reclaim_list_init(&job->prl);
>  	job->dep.ops = &dep_job_ops;
>  	job->type = type;
>  	kref_init(&job->refcount);
> @@ -149,6 +152,25 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
>  	return ERR_PTR(err);
>  }
>  
> +/**
> + * xe_tlb_inval_job_add_page_reclaim() - Embed PRL into a TLB job
> + * @job: TLB invalidation job that may trigger reclamation
> + * @prl: Page reclaim list populated during unbind
> + *
> + * Copies @prl into the job and takes an extra reference to the entry page so
> + * ownership can transfer to the TLB fence when the job is pushed.
> + */
> +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> +				       struct xe_page_reclaim_list *prl)
> +{
> +	struct xe_device *xe = gt_to_xe(job->q->gt);
> +
> +	xe_gt_WARN_ON(job->q->gt, !xe->info.has_page_reclaim_hw_assist);
> +	job->prl = *prl;
> +	/* Pair with put in job_destroy */
> +	xe_page_reclaim_entries_get(job->prl.entries);
> +}
> +
>  static void xe_tlb_inval_job_destroy(struct kref *ref)
>  {
>  	struct xe_tlb_inval_job *job = container_of(ref, typeof(*job),
> @@ -159,6 +181,9 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
>  	struct xe_device *xe = gt_to_xe(q->gt);
>  	struct xe_vm *vm = job->vm;
>  
> +	/* BO creation retains a copy (if used), so no longer needed */
> +	xe_page_reclaim_entries_put(job->prl.entries);
> +
>  	if (!job->fence_armed)
>  		kfree(ifence);
>  	else
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> index 4d6df1a6c6ca..03d6e21cd611 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> @@ -12,6 +12,7 @@ struct dma_fence;
>  struct xe_dep_scheduler;
>  struct xe_exec_queue;
>  struct xe_migrate;
> +struct xe_page_reclaim_list;
>  struct xe_tlb_inval;
>  struct xe_tlb_inval_job;
>  struct xe_vm;
> @@ -21,6 +22,9 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
>  			struct xe_dep_scheduler *dep_scheduler,
>  			struct xe_vm *vm, u64 start, u64 end, int type);
>  
> +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> +				       struct xe_page_reclaim_list *prl);
> +
>  int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
>  
>  struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
> -- 
> 2.52.0
> 
