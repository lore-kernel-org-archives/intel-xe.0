Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E7DC4167D
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 22:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DDB10E878;
	Wed,  8 Nov 2023 22:22:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E329810E878
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 22:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699482154; x=1731018154;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fXDanTQd8mCQjYcwszrznQAJdIqFZBFDX+RJFPEbMhw=;
 b=Y70LQO6rLh408HwTCykO/6QAdqcMpswZ4I1KKR2d/wxxynJOioytzuWY
 MS86FqqcohmKYGx/lZnWnzpMrCAeTxMeMXyPXobDEYiOY98tgmZw3L3Tn
 OdFq57Ttme6O5p095pRxsxY4pFnAv8Ah5UKpKT4bitFL51axyFRfprGxj
 VEzus5d3KIowg5FCJD6DFsxqTgXK6P6y9Jqg4fbaZjkqHkicU8TXOg++U
 /uQJ6+FKDXWBigPvWa0rog94uweKZjtxCJbr7psnkAMNlDpnyuRp76yZe
 uEQuHrUtOwLCP9+YZ070XzLuxjE53iAFaNvbRaQuJjSEzh2nKOAfJ3Ig4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="388725004"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="388725004"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 14:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="713086896"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="713086896"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 14:22:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 14:22:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 14:22:33 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 14:22:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c32Et8YOlms3DE39hKA6j4Mboxv3HlV/LXJ1qUW9q3532kmzv2SLCP147+mQYLyNkw0o5oEZDgCbRBIamCsKzZxLsRNHb+2t/wd1Z4EgFJrC0EQ8eFxYmRN63XJFhQ3JC559nTA6/tO+MjcSOnZnPQr0gUm0Lft7gPtAmGX5T2eazq4snFfF8HfUSfwmUZpvBA5XTtQrUJH7iJ2ctZnQ1A/zcqLa2FF8/zhIMbrQxxmQOPMXS8WfVprq/Lw4yXPvYAj1u+28MaCZDGRv/9xisxjiyigKv2aWGlTd/ack8v2ASnEl66ah91+MHSZT1VH70cba7fo89H1sALdgQS0uMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9P24J5KFft/qoIeFk7GNlcDzcguFecGCvDm15NWSETA=;
 b=bA/WXsLnhkXzSxfDWUdLTDz7hDQkCmzFG9oPYI7vdKRwgYn8CzC8yRQLqttOi7FN7X8VFbnzxGQBeZIF+E/b8ghCdSxQriau4EWB20F6SXxSz6eT1gYAnkCW6emjighd+CgRwqTPwWqGfOYYUnWB98z8mOb2MZNQp/4+lJOWjRB4ZMsQrWqofv64OM3NXASwlmpwt+nqq6/0uN9I/Mu/JFlFmYo/RCzatXJj/cnaJPaH+MT3TZz1fpPMpQ+8efkutIp5BkW4AiS+0JurFhVqslMTgI/y5GertcEJnoHrSpJmUVEfBcgRHCbqFEqKzyAtOYCWD3/SGr+HdHBfJoToEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DS7PR11MB7886.namprd11.prod.outlook.com (2603:10b6:8:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 22:22:29 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 22:22:29 +0000
Message-ID: <7ad899dd-460b-42c7-b0a1-4007f817bb37@intel.com>
Date: Wed, 8 Nov 2023 14:22:27 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-8-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231027222928.1981633-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:303:b5::32) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DS7PR11MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf20057-0abb-4af8-53c9-08dbe0a931b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WCanEdfciimyotKG23y/zL1g35Hk5XGCewljZJK0kOu2EXvpHaeQCajK0Wn+YLgrOQYFYdWB210c3/rqY/NdS5U0VLBmdJEtwJBcQGKBPWTbkreX9n5nd+XvZp5ZlU3Hr/4hyzFB/kVfeMlsCkjrS/ZXguCRl7lUu6gK8tIUk+8vK6GFMSTg/xVTmppAUKFQ0qIsYkLBYVNjLj99/SzTAw/V5BJ46Mz0UzmiHAbNC3cGa3YTQ9Hg3TZsKzTQZRNe1ySMyT1fgVvwxyttQ3M7fIAf60ucDCkfAYmkY2t1UOyToA+kNpipdA9HOsh4oM+xfdqbsfOV4qnY3vwHP8sfji3udRTAN6T2gw70sOaz0nbNEUEt+OxkIyjajUJljMDefCx4RTn4uVnc6dtsEWv7ojRwN+cgijZt7ke/DQoBc60L2qUb7rqaCges1NA82YU487xm961TDrDKOx/3nwC8oxhzkcnhvLSv1l/KnyJY5ChRSmcNBpBULSSQfFDlVrDN8qPcn7sbWhb2OLPWw7/G+cpESo2wkB4zp8DD8db2TLl40yC4zkE0eVqyzk+WXg0wRFsAPU9/zK+htHa9AJXNjYJwu+uJk27tqPwpTCF5p6Ap8VTN3ndUjOOuIOvLNxYEMbVfclQvwxuOBssmbC83Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(366004)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(31686004)(2616005)(6512007)(26005)(53546011)(6506007)(41300700001)(36756003)(38100700002)(82960400001)(31696002)(86362001)(5660300002)(6486002)(2906002)(66556008)(83380400001)(8676002)(8936002)(316002)(66946007)(478600001)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmcrcnZVQ3JWWHVXZ3NJL2VJUytxMkNoVld5dHZGc3BISlRRU242a3Z5YVVn?=
 =?utf-8?B?M3NsVmk5ajkxTUtDL0VoaE5kMTNIeWsxTlFEcDc0UGViM0V6V2FNUXkrMWhi?=
 =?utf-8?B?ZFV6a01VUUovT2x2Y3F2RTZNZDlCYWN6YVJSMWVheWowTk9PczJRd3cvdUsz?=
 =?utf-8?B?N1hPS3VXODlGMlhiUmNmbG9XOExtUldidWNMb2o1VVExNHhPb3hSVEpZRXVx?=
 =?utf-8?B?WU9nUXJuMFZnRTBqYWZGL1lPRy8vMyt3WU8rMmgzTWRJc1NzbGNTK0N2L0hn?=
 =?utf-8?B?dS83QkI3OWlDNnBiclpFenJSVmhuaUlwaTJqTlNtdzhKY3lPVlZKTy9IWUJ2?=
 =?utf-8?B?UGZkYmlNdkhhR1hxTUgzMUd2cVRKQkNad0M3STQxZmUyanRiUlRsQkZJMmo4?=
 =?utf-8?B?czBpZWVBelN2NjE2bnRVaWRCd09laVRtdUR2R25jalA4SlRsV1l0NUFNRE1i?=
 =?utf-8?B?OEUwbkNRUjlLa2VudzNiVTJQRDlyN29LYTduVlBxNGQzOXhJcXBObU0xUTU0?=
 =?utf-8?B?c2RwbTg0eGduUEMvd0Z1a1NKM3A4dXdXZWpSemJSVUQ4bmtRZFN1a2NBUXlo?=
 =?utf-8?B?VE8xWlA3U3VQdjBXSlRVcHpISkJidkNMS0t6cHM4cFAxYmtQWjBVL2wvNk5Y?=
 =?utf-8?B?cTYvZFRubEFRbUY5enJRNlZRM201M2ExclVmM3diRGx3U3hiTkltRnZBNUU2?=
 =?utf-8?B?VEErSUVWV0FWNlFQUmVxZU1OTm1oZFIvV1dBRWYzRTlpWjRqVzhzQUszZ2Zx?=
 =?utf-8?B?UmxLS1Rxcmcyb1l5cjU0bWtuRnBOMU5aL0RPTE5BYlA2ek1DRm10ZDZLZUJ2?=
 =?utf-8?B?aXc3WVFnY2lFcjg3NDNneXJCaTA0SkQ5SlExZFZrb0pRV3ZNUVVhTzh6c3hV?=
 =?utf-8?B?TVprQUxibElBUnBhMmk5RWZWQnZmTWJqdldyMGZUZ2NzNlU3d3hSTU5hZkN6?=
 =?utf-8?B?SU9VTjZUNTZLN25KbU9HQ2N3ZGs2aFZ2WWtHYmdnYTE4SmJQR01UWk5Pd2Jj?=
 =?utf-8?B?b2NBL0tvZDBhV0U1UjQvSTVxbCtDNWUvZWt6QjB4U2dlenVQKzkvUW1Rcnlt?=
 =?utf-8?B?bGlJMnc2UHhLWUZnQnlBaTNvcW40M1pRYlNmQklPSzM3aGF0WFh2c21lRFV0?=
 =?utf-8?B?dmRSVWtTWGFvSXJhNmN5QVlyL0VFSWI1djByWHNkTko3Z2RSaHdSWTdwbGl6?=
 =?utf-8?B?WEMzT2ttdTNHb05TRGVSb3VwVEhoRy9RZ2d5ZmJNelZpdWszRTg3ckJqSXRR?=
 =?utf-8?B?MjF6UEFzYTAzQURLTXByU3NVaElpeWtLVEFLRzJmU1NjbUhTRm5pSHRjaGIy?=
 =?utf-8?B?K2dtU3BJcmZrOUtxV3pQaXlEcnNRaDZneE1EUy9wb0J0N3BzQTNtdHNZWDhR?=
 =?utf-8?B?YTdMenV4dUQ5NmNQZGF1TXFKVklxbHhlUDZGdzZJbFF4cXA4UTRjZFBsUTVX?=
 =?utf-8?B?aHg3aG4zcDRmU29CNW5FM3g4d2JWSlN4aHR1TUVaQnVRZGxPODdlYzV1ZENG?=
 =?utf-8?B?ZUZnRWJXWHJJaHp5RjFvRXJCK1JLZzIzRFpaYlliREU1UXJvM0VEeUE5ZzNm?=
 =?utf-8?B?NW8rZWRRdHdsN1o3cUJ0QzZQL2x6bXNUTFIyR0N6dVJveEprZzkzSjBaSXBD?=
 =?utf-8?B?OXp5cVhEL1BGaG84VjZmZnQxdFVvblBiMmNOaFVaVTh5eFNsVE15cVJVZ2lo?=
 =?utf-8?B?RU45Yk9NVjRKVWtkWmZLaUZmcnpCSTYvbTFBQlNzNUtMZjBMak9nSkJDRFVh?=
 =?utf-8?B?NjNqQmkzeUk2L2daR2xiclNHZVIvNkZ6RVJ5S25KeUtSZnI5ZHNLUzRQeE1j?=
 =?utf-8?B?NHFEcnF3NnJtb3FkdnhtaGlLRjh2RFQyMzFnN2t6OWtJRHlZT2RWYklZMFdn?=
 =?utf-8?B?NFgzV1ova2o4b2VJZjlkczJBUFdDcnhxWk1kZXFoeWhoNGhlcnlMTFF2cjBJ?=
 =?utf-8?B?UFU3K1JjVWxjV3hpNWNYamR4UjBZQTR4a1prejhhSVVCdW5WclZBVGtnRjNx?=
 =?utf-8?B?N0NxRkxuRXdlNm5rS054cEh2cnVzM2dDTURqd2dIUWFWOU5mSGorWXVVbFRo?=
 =?utf-8?B?MFdMZWZtUlBMYXcrQXQxZWFDYlIvRGxLRFZ5Z3d0bU92N0lac0w5T2xEd25F?=
 =?utf-8?B?ZjNKRldxOU93ZWZ1V2F6bGFSWFZ0U2d2WGZuck11TWsxWnhxaDFqVWFDNmxQ?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf20057-0abb-4af8-53c9-08dbe0a931b2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 22:22:29.4881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOLIA80bF21wFkZJoEkYMmF7M3bPTqcC1xi4SB70qC3r7jiN2+4s8BHJ3Iwp79G6urHTCQk5Js6gaHe2niq6ERuQhwHA0c8b9CM0lcM9Tk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7886
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 07/12] drm/xe/gsc: Implement WA 14015076503
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

On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
> When the GSC FW is loaded, we need to inform it when a GSCCS reset is
> coming and then wait 200ms for it to get ready to process the reset.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile           |  2 +-
>   drivers/gpu/drm/xe/regs/xe_gsc_regs.h | 10 ++++++
>   drivers/gpu/drm/xe/xe_gt.c            | 44 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>   4 files changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 474b6044d054..4a442dcf4d79 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>   $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>   	$(call cmd,wa_oob)
>   
> -$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o: $(generated_oob)
> +$(obj)/xe_gt.o $(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o: $(generated_oob)
Is it not worth splitting this into multiple lines?

>   
>   # Please keep these build lists sorted!
>   
> diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> index 22d2ad9cb64d..9a84b55d66ee 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> @@ -16,6 +16,13 @@
>   #define MTL_GSC_HECI1_BASE	0x00116000
>   #define MTL_GSC_HECI2_BASE	0x00117000
>   
> +#define HECI_H_CSR(base)	XE_REG((base) + 0x4)
> +#define   HECI_H_CSR_IE		REG_BIT(0)
> +#define   HECI_H_CSR_IS		REG_BIT(1)
> +#define   HECI_H_CSR_IG		REG_BIT(2)
> +#define   HECI_H_CSR_RDY	REG_BIT(3)
> +#define   HECI_H_CSR_RST	REG_BIT(4)
> +
>   /*
>    * The FWSTS register values are FW defined and can be different between
>    * HECI1 and HECI2
> @@ -26,4 +33,7 @@
>   #define   HECI1_FWSTS1_PROXY_STATE_NORMAL		5
>   #define   HECI1_FWSTS1_INIT_COMPLETE			REG_BIT(9)
>   
> +#define HECI_H_GS1(base)	XE_REG((base) + 0xc4c)
> +#define   HECI_H_GS1_ER_PREP	REG_BIT(0)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 73c090762771..0e8e24bded1c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -10,8 +10,10 @@
>   #include <drm/drm_managed.h>
>   #include <drm/xe_drm.h>
>   
> +#include "generated/xe_wa_oob.h"
>   #include "instructions/xe_gfxpipe_commands.h"
>   #include "instructions/xe_mi_commands.h"
> +#include "regs/xe_gsc_regs.h"
>   #include "regs/xe_gt_regs.h"
>   #include "xe_assert.h"
>   #include "xe_bb.h"
> @@ -504,16 +506,58 @@ int xe_gt_init(struct xe_gt *gt)
>   	return 0;
>   }
>   
> +static int gsc_fw_is_loaded(struct xe_gt *gt)
> +{
> +	return xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
> +			      HECI1_FWSTS1_INIT_COMPLETE;
> +}
This function is duplicated exactly in the GSC source file. That seems 
bad. Either it should be exported and shared or the usage here should be 
moved to the GSC specific file.

John.

> +
> +static void wa_14015076503_start(struct xe_gt *gt)
> +{
> +	/* WA only applies if the GSC is loaded */
> +	if (!XE_WA(gt, 14015076503) || !gsc_fw_is_loaded(gt))
> +		return;
> +
> +	/*
> +	 * wa_14015076503: if the GSC FW is loaded, we need to alert it that
> +	 * we're going to do a GSC engine reset and then wait for 200ms for the
> +	 * FW to get ready for it.
> +	 */
> +	xe_mmio_rmw32(gt, HECI_H_GS1(MTL_GSC_HECI2_BASE),
> +		      0, HECI_H_GS1_ER_PREP);
> +
> +	/* make sure the reset bit is clear when writing the CSR reg */
> +	xe_mmio_rmw32(gt, HECI_H_CSR(MTL_GSC_HECI2_BASE),
> +		      HECI_H_CSR_RST, HECI_H_CSR_IG);
> +	msleep(200);
> +
> +	return;
> +}
> +
> +static void
> +wa_14015076503_end(struct xe_gt *gt)
> +{
> +	if (!XE_WA(gt, 14015076503))
> +		return;
> +
> +	xe_mmio_rmw32(gt, HECI_H_GS1(MTL_GSC_HECI2_BASE),
> +		      HECI_H_GS1_ER_PREP, 0);
> +}
> +
>   static int do_gt_reset(struct xe_gt *gt)
>   {
>   	int err;
>   
> +	wa_14015076503_start(gt);
> +
>   	xe_mmio_write32(gt, GDRST, GRDOM_FULL);
>   	err = xe_mmio_wait32(gt, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
>   	if (err)
>   		xe_gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
>   			  ERR_PTR(err));
>   
> +	wa_14015076503_end(gt);
> +
>   	return err;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index f3ff774dc4aa..132c35497f74 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -19,3 +19,4 @@
>   		SUBPLATFORM(DG2, G12)
>   16017236439	PLATFORM(PVC)
>   22010954014	PLATFORM(DG2)
> +14015076503	MEDIA_VERSION(1300)

