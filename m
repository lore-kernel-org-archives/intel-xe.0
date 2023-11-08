Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44537C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 22:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B105A10E875;
	Wed,  8 Nov 2023 22:17:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BFF10E875
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 22:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699481834; x=1731017834;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wcmTm4mTCMYz/U6+9smI6c/JgwCvZmxkL0dWOp84TOk=;
 b=n6gr+SeOTDWeH/ohQeo4oRsRI47Ayc5Bq0wP6U9GppH2UVGCEu8rVpqL
 qVYfmS0rzPbGD+bQw6J5iMCep2zfQZBPxKoJdeV1Ht4743Xus07OxYf6R
 eIdY6azDZhcIyUCZStlHLGNd9aK/VyDXiW26cqzULm2fLJmVBf2DYt7aL
 VRP1conlObt5Op1SfeoTnNpEjM0DiOpHSnRgKYwbfY5pZPVj3tWWhJzy6
 Mu6gyuPm3GZTBrcheH8JJM2W4GvK420ZzCFn4zWps3VyJy+eHQIl/OtaX
 vQmjvkX6xYicozfgYaPK8IYZw9HIGBuXkl3KoGI+LxWEndEZcNjJIiC4k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="388724273"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="388724273"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 14:17:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="713085596"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="713085596"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 14:17:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 14:17:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 14:17:12 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 14:17:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVg34xDAfEHPwzpaR6X4JzCbMdGhZriKzgtA4V/rHoKK2NDWwB6TiX6KfUmKbguYGANDZ/UKNGCV8UqA3qaGrvTkgnPoVcAJWMA1laAumWKuBRCJZjX7L6BMs7xT4diqS0xdQ6a0tBo81ww/wtdukYtFIy32zrNj2ac+pZ03jX/AxccB/u3Z8zF/xwsfpSfu0+8pX134cYbEyShB08otI2bMYl0FicWvDI6FiBmHMba72w6X8pgr1Eyc94sJ1p2Xk6ITQoIHwB1YIxv4Goufrt5mBNo4bfcrxaXI9SArl3q5+qF0poWAKZYPUvou/6xs5B/lEWb6yHPw9SVJG76zWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+s4UTzXH7f3fSQTW6S/PD0yl9QhIqdR5SbFzoiVCVE=;
 b=enRgNi0MEe3F9avcEOpJ4E9Y5U/wF0c3ZEXBLs1l5byfZgyBHEaefI9POH0y0YbzP3+ds1+D4x4vlQFGOXr+keSmDoqXu9G9HYBHOOPMjsii51axMlO9QEblJy5Z1XDQzeGtS1HHEFYdwODT/Ikk4jw5Iv2ZJDVPg/o0vINUdSWz4MqnqXQCPi0o0UrsVRws6WD31YZWm+MFcQnIXuqtnp1lSJOGSk6NSd0Vr3m1G1Ly8Q9etXqHFwLNdoPytU2XsDpCHTRnWwIxnV5TxiibI9sYl2ynx8sfoshW+Kix9fv1Mz/To/1Mo/FaH36opj4RHVgUzRW6MneFFgHUsFV3/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH8PR11MB6880.namprd11.prod.outlook.com (2603:10b6:510:228::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Wed, 8 Nov
 2023 22:17:09 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 22:17:09 +0000
Message-ID: <602813e9-7dc0-4cf4-bc6a-338c5ee36065@intel.com>
Date: Wed, 8 Nov 2023 14:17:06 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-7-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231027222928.1981633-7-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0156.namprd04.prod.outlook.com
 (2603:10b6:303:85::11) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH8PR11MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 0020c536-130e-4b05-7308-08dbe0a872e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ljCYnoaMfDmzxAC6soUi2WLmoKms4fwvyW5KZdlc0uyYgYS/s5zNDxBmpkSvjU07hyavZvyeLKu/KwTtYpXKLRUUMfH8GkFDb1RNJeLhsGIGMGM6N+HGCP7m0D+X1s54jWZE+rae2sKvYh7QaSGXRd3ELbqCo01sSo3jmK/nd9unACo+axt03/7N5M2zs7eZr6tozJa6i7SxfXoQrIWhm+wVGl0mtrig14RkWR27E4qfKPbWTNgfbX0KT8k0K7/e/mTaR7hW900wMdaNAYogI3FSoBCtI8e5gdN1s/brsSO8XxIkHwSwuDletZDzdx2IWbMgbJcQsDd8FPrxCe87Qx9TAuqRuDXJ2HtcOZdU618JmOP/N7TFAOFtStiZ7fvg8KQP1x+JYHkHGKAWnvv+r9JdXRuSRm7GxbEHyMZyWEw6CovNhlAMR3AzGrgqMup3sPYeNFepCr4K+9kHwUyiVDajeJvxWQln4qQwu9M1uwp+vUV+YmNeUZ+E5wo72WD9nepJdxPx1Y6bqmZzuAZhIVfE9GBsh0lEM/UBu8CGksC7SuZUYYgHZmVx0SDOzrtkk3HrY3d7YNQrprC9rWI0nOkYEmIpjhSvTw0tLIAsHEUtvyEWS2wEoz84/0j85wAdNTauQsF6jouJFOdR/ACD3l7Cy5i0ZLMkRyXGABE6hJcOn6iL7+a5Ya3Jete41Hgb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(346002)(39860400002)(136003)(230922051799003)(230173577357003)(230273577357003)(1800799009)(186009)(64100799003)(451199024)(6486002)(26005)(6512007)(107886003)(38100700002)(2616005)(6506007)(6666004)(53546011)(41300700001)(8936002)(2906002)(83380400001)(4326008)(8676002)(30864003)(66476007)(5660300002)(316002)(478600001)(66946007)(66556008)(36756003)(31696002)(86362001)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2ZhcERVUTdhbmJhbDFTeVFXZ2psVHlxTFZLL1hYQWVHcWR6cDZoOFJwNjBE?=
 =?utf-8?B?dGNEL3hQNW9VWGNRcks3UFBmdFFWYzFtbEdCQXhyVEZZcFpXd01hTWFFbHJM?=
 =?utf-8?B?OGNqT0xXUFVZL2k0N2s5bzhmTEg3ZUFLS0IxTVJ6STdWRW01ZWhmbTRqbkVM?=
 =?utf-8?B?S1VwbGZQaThpK1Y2ajR1Z2RUS201K3BDd1FCRGR0YVNJaUtUTUNTSVlIR00y?=
 =?utf-8?B?NTdLelN4WXhDOUtpYjNuc0V5dWJoeVFkblBwV1BmVkk5TVpKNmVIbXhBU1Z6?=
 =?utf-8?B?ZHVRL3c5VDBJTTBSaDNaWnNZYmgzS0ZPUUkyM0FKdXIvK1dvN3I2blNqSVNK?=
 =?utf-8?B?SEhzdktwNmt1MmRtRVJGaEprTzFDYS9nYUZGK3gxMlJ5SGtPSGN0RnNRanBZ?=
 =?utf-8?B?Z2lIS0ZqZGo0V1ZHbzloZVFjR1BtNXVMUGwxZG1UTkdoQXBOMEZsbjU1RUlB?=
 =?utf-8?B?N3NmazI4K3ZJdGZPMHpOZndweUluNW1KMHBtSTI0eElMbHRocUVDNmUyeU1s?=
 =?utf-8?B?OTZMTEVTM0Z6TGEzQTRNbXZHMVhJQ0I0a3dBTmNldlI0dUpCdlNJNXZ0WEx4?=
 =?utf-8?B?SXhKNFlPeGFFVHNnbUwxenBTSHpyZkRvTGI2OGw3UGVKZzFDellDSXVBczh4?=
 =?utf-8?B?a0JBQTJBZjUyVXdNYkxDQ2dXaG1MT1hTb29OanVPamZ5ZUwrVmtMT0IwNmRK?=
 =?utf-8?B?YmlFNVdPd0VBL2I4TUNkVWFsSWxOUU82bUltQlQ2b0xyd0NvT1BWUFVFZHhC?=
 =?utf-8?B?a0VqeVpBQnlOUTI0bzU0VjI1dXo5dzZtanRUc3FwTG5LRVNZR0Z0TkVWNzdm?=
 =?utf-8?B?S3p2V3NoZk1Pakx3dit3SEtjUkJiVkZPSUVRL2hXWWkrSlJQR09xU2hkNmZv?=
 =?utf-8?B?Tnh1OExMV0lwaHQ0RWZhQlpoWU8xdUZ3RVN4d2dUN0ZHVXpteU1PV0xWT1B5?=
 =?utf-8?B?d09SMGxwR2luWHREVFRHWFdLUUdUOHlvWVVKd3JJVUROOUFVTTRhRmFsWUlz?=
 =?utf-8?B?czB6K2FoQjQ3QnB4UmhsSHJCNVE1YTFXeDNTeExEdWZleDRadGh6NjB0UkpD?=
 =?utf-8?B?WFZmbFUrcGlIajI4WEhMVGt2L2xwWXV3N3A0ekNqeVZGSWtoUitDNVpsdWgx?=
 =?utf-8?B?MWRzWE1IcTI4RWU5ZFJZTW92dmdDOHRWNXBBZTlWdWNMUUdjMHExcU0wSlBq?=
 =?utf-8?B?VVExOTN4cXdqNEdxQmFsTWhva1Ruak1pRzJiaFAvZFRRZzd2bDJNaWMyRUY3?=
 =?utf-8?B?ajdNYWFHdmNRek8rWVVVTWRPaUZKaEFjZlJrNFd6aEFuVU1ia2Q1WTN3T2sw?=
 =?utf-8?B?Zk8xTnBDUGtnZHpJZ2tlVEZWVFllOWRmOEFhVEdaaTF0M2hBTjNPK3lSWlhm?=
 =?utf-8?B?M25iT3dSdDc5Y3dpZmpLaU1ReTlDQVRYUXNhTlIwSHVxMTRNby9IUWxzQmVP?=
 =?utf-8?B?ZmxOcmZYOERGYzNqUkNBelJKOTN5dUJUWnUzMjUwWWp2VzVVbFpPQk85dUZH?=
 =?utf-8?B?OWtYTmlqT2EyMmx0WjJScVFwZFV3aWNmV3JFMUxpMXdQdnlxa3RiRWtuTFpF?=
 =?utf-8?B?OEsrUWErUnpqQVJuQkNQYTZTNDJGb2xaZnNldEtqeGZZS2tuNWZubzJpK2wy?=
 =?utf-8?B?YTcrVSs0MmlXZFp6bi9UWll0aTZoOVJHUEpidlRyaHd5dDZodjJIMG9tY3lT?=
 =?utf-8?B?YmtUSVJoMnFLK0FCWkFRRUVoMkNKcjl0RXFHL1MySkx2RnE1MzFKbHNLMlRy?=
 =?utf-8?B?Q0pod3NZNHFhYS93Zk9IR2dvdFpEdWtFakh5K3hJSGpLaDkyRjkzcG1jUDE4?=
 =?utf-8?B?VnV5TnpIS0dWUFRwR3VPNXVZRnNKZEM1YXY3bGlGTXROeVUxUTVIelIwN1Q1?=
 =?utf-8?B?QXRUcExaYk0yZkpSS1NBNUN5WW1iK1c3cnQxT25BM0MzTHBLUFlwcS9BNmdT?=
 =?utf-8?B?UzZFdkF3WnBMd3BCQ3FTKzcwRHI5Wi9mcjZ3LzJQZGlSTDlzZytzMDkzZ0gv?=
 =?utf-8?B?SFJFMlNUVlJVK29DYzRMcFU4OHBaQXR2amloUVN1MWtnM3kwYjR0bEhudDZt?=
 =?utf-8?B?U1BRZGtGQS9lN0QxdGwxQ1J1V05YbFJzR21URkwwK3VuZG1WaHNJMUNpTDFZ?=
 =?utf-8?B?NTN5MlF5YUxmZ1Q4WnVvVWNxS0hiK2tHajlyd2krdE1leHc1ZVhBY1lHNU5h?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0020c536-130e-4b05-7308-08dbe0a872e2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 22:17:09.0864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdJjmRyOnbyXgL6AI2SvuS52uEokLW9QMCsZeOcUUWWA8eJ8+iqjeD1862VAv0hmNa+6fTjTyYA4EBzn++6Yia0PIytxrxgNoBLEbLp3lfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6880
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/12] drm/xe/gsc: GSC FW load
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
> The GSC FW must be copied in a 4MB stolen memory allocation, whose GGTT
> address is then passed as a parameter to a dedicated load instruction
> submitted via the GSC engine.
>
> Since the GSC load is relatively slow (up to 250ms), we perform it
> asynchronously via a worker. This requires us to make sure that the
> worker has stopped before suspending/unloading.
>
> Note that we can't yet use xe_migrate_copy for the copy because it
> doesn't work with stolen memory right now, so we do a memcpy from the
> CPU side instead.
>
> Bspec: 65306, 65346
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/xe/instructions/xe_gsc_commands.h |  34 +++
>   .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
>   drivers/gpu/drm/xe/regs/xe_gsc_regs.h         |  29 +++
>   drivers/gpu/drm/xe/xe_gsc.c                   | 240 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gsc.h                   |   3 +
>   drivers/gpu/drm/xe/xe_gsc_types.h             |  17 ++
>   drivers/gpu/drm/xe/xe_uc.c                    |  12 +-
>   7 files changed, 335 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
> new file mode 100644
> index 000000000000..c7a833d7f965
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GSC_COMMANDS_H_
> +#define _XE_GSC_COMMANDS_H_
> +
> +#include "instructions/xe_instr_defs.h"
> +
> +/*
> + * All GSCCS-specific commands have fixed length, so we can include it in the
> + * defines. Note that the generic GSC command header structure includes an
> + * optional data field in bits 9-21, but there are no commands that actually use
> + * it; some of the commands are instead defined as having an extended length
> + * field spanning bits 0-15, even if the extra bits are not required because the
> + * longest GSCCS command is only 8 dwords. To handle this, the defines below use
> + * a single field for both data and len. If we ever get a commands that does
> + * actually have data and this approach doesn't work for it we can re-work it
> + * at that point.
> + */
> +
> +#define GSC_OPCODE		REG_GENMASK(28, 22)
> +#define GSC_CMD_DATA_AND_LEN	REG_GENMASK(21, 0)
> +
> +#define __GSC_INSTR(op, dl) \
> +	(XE_INSTR_GSC | \
> +	REG_FIELD_PREP(GSC_OPCODE, op) | \
> +	REG_FIELD_PREP(GSC_CMD_DATA_AND_LEN, dl))
> +
> +#define GSC_FW_LOAD __GSC_INSTR(1, 2)
> +#define   GSC_FW_LOAD_LIMIT_VALID REG_BIT(31)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> index e403b4fcc20a..04179b2a48e1 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> @@ -15,6 +15,7 @@
>    */
>   #define XE_INSTR_CMD_TYPE		GENMASK(31, 29)
>   #define   XE_INSTR_MI			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
> +#define   XE_INSTR_GSC			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x2)
>   #define   XE_INSTR_GFXPIPE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
>   
>   /*
> diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> new file mode 100644
> index 000000000000..22d2ad9cb64d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GSC_REGS_H_
> +#define _XE_GSC_REGS_H_
> +
> +#include <linux/compiler.h>
> +#include <linux/types.h>
> +
> +#include "regs/xe_reg_defs.h"
> +
> +/* Definitions of GSC H/W registers, bits, etc */
> +
> +#define MTL_GSC_HECI1_BASE	0x00116000
> +#define MTL_GSC_HECI2_BASE	0x00117000
> +
> +/*
> + * The FWSTS register values are FW defined and can be different between
> + * HECI1 and HECI2
> + */
> +#define HECI_FWSTS1(base)				XE_REG((base) + 0xc40)
> +#define   HECI1_FWSTS1_CURRENT_STATE			REG_GENMASK(3, 0)
> +#define   HECI1_FWSTS1_CURRENT_STATE_RESET		0
> +#define   HECI1_FWSTS1_PROXY_STATE_NORMAL		5
> +#define   HECI1_FWSTS1_INIT_COMPLETE			REG_BIT(9)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 3f709577d73b..7e5ba9039163 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -5,10 +5,20 @@
>   
>   #include "xe_gsc.h"
>   
> +#include <drm/drm_managed.h>
> +
> +#include "xe_bb.h"
> +#include "xe_bo.h"
>   #include "xe_device.h"
> +#include "xe_exec_queue.h"
>   #include "xe_gt.h"
>   #include "xe_gt_printk.h"
> +#include "xe_map.h"
> +#include "xe_mmio.h"
> +#include "xe_sched_job.h"
>   #include "xe_uc_fw.h"
> +#include "instructions/xe_gsc_commands.h"
> +#include "regs/xe_gsc_regs.h"
>   
>   static struct xe_gt *
>   gsc_to_gt(struct xe_gsc *gsc)
> @@ -16,6 +26,134 @@ gsc_to_gt(struct xe_gsc *gsc)
>   	return container_of(gsc, struct xe_gt, uc.gsc);
>   }
>   
> +static int memcpy_fw(struct xe_gsc *gsc)
> +{
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 fw_size = gsc->fw.size;
> +	void *storage;
> +
> +	/*
> +	 * FIXME: xe_migrate_copy does not work with stolen mem yet, so we use
> +	 * a memcpy for now.
> +	 */
> +	storage = kmalloc(fw_size, GFP_KERNEL);
> +	if (!storage)
> +		return -ENOMEM;
> +
> +	xe_map_memcpy_from(xe, storage, &gsc->fw.bo->vmap, 0, fw_size);
> +	xe_map_memcpy_to(xe, &gsc->private->vmap, 0, storage, fw_size);
> +	xe_map_memset(xe, &gsc->private->vmap, fw_size, 0, gsc->private->size - fw_size);
> +
> +	kfree(storage);
> +
> +	return 0;
> +}
> +
> +static int emit_gsc_upload(struct xe_gsc *gsc)
> +{
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	u32 offset = xe_bo_ggtt_addr(gsc->private);
> +	struct xe_bb *bb;
> +	struct xe_sched_job *job;
> +	struct dma_fence *fence;
> +	long timeout;
> +
> +	bb = xe_bb_new(gt, 4, false);
> +	if (IS_ERR(bb))
> +		return PTR_ERR(bb);
> +
> +	bb->cs[bb->len++] = GSC_FW_LOAD;
> +	bb->cs[bb->len++] = lower_32_bits(offset);
> +	bb->cs[bb->len++] = upper_32_bits(offset);
> +	bb->cs[bb->len++] = (gsc->private->size / SZ_4K) | GSC_FW_LOAD_LIMIT_VALID;
> +
> +	job = xe_bb_create_job(gsc->q, bb);
> +	if (IS_ERR(job)) {
> +		xe_bb_free(bb, NULL);
> +		return PTR_ERR(job);
> +	}
> +
> +	xe_sched_job_arm(job);
> +	fence = dma_fence_get(&job->drm.s_fence->finished);
> +	xe_sched_job_push(job);
> +
> +	timeout = dma_fence_wait_timeout(fence, false, HZ);
> +	dma_fence_put(fence);
> +	xe_bb_free(bb, NULL);
> +	if (timeout < 0)
> +		return timeout;
> +	else if (!timeout)
> +		return -ETIME;
> +
> +	return 0;
> +}
> +
> +static int gsc_fw_is_loaded(struct xe_gt *gt)
> +{
> +	return xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
> +			      HECI1_FWSTS1_INIT_COMPLETE;
> +}
> +
> +static int gsc_fw_wait(struct xe_gt *gt)
> +{
> +	return xe_mmio_wait32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE),
> +			      HECI1_FWSTS1_INIT_COMPLETE,
> +			      HECI1_FWSTS1_INIT_COMPLETE,
> +			      500, NULL, false);
The 500 at least needs a comment to explain where it comes from and why. 
If not a #define as well.

I assume this is the <=250ms in the commit description?

> +}
> +
> +static int gsc_upload(struct xe_gsc *gsc)
> +{
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	int err;
> +
> +	if (XE_WARN_ON(!xe_uc_fw_is_loadable(&gsc->fw) || !gsc->q || gsc_fw_is_loaded(gt)))
The last term here is a register read of a firmware written value? The 
kernel should not barf with WARNs and such due to external data. Those 
are for internal bugs only. Dodgy external data should just be an 
xe_gt_err, shouldn't it?

> +		return 0;
And returning zero means the state will transition to TRANSFERRED not 
LOAD_FAIL. That seems plausible in the case of already loaded, but in 
the other cases that seems wrong?

John.

> +
> +	err = memcpy_fw(gsc);
> +	if (err) {
> +		xe_gt_err(gt, "Failed to memcpy GSC FW\n");
> +		return err;
> +	}
> +
> +	err = emit_gsc_upload(gsc);
> +	if (err) {
> +		xe_gt_err(gt, "Failed to emit GSC FW upload (%pe)\n", ERR_PTR(err));
> +		return err;
> +	}
> +
> +	err = gsc_fw_wait(gt);
> +	if (err) {
> +		xe_gt_err(gt, "Failed to wait for GSC load (%pe)\n", ERR_PTR(err));
> +		return err;
> +	}
> +
> +	xe_gt_dbg(gt, "GSC FW async load completed\n");
> +
> +	return 0;
> +}
> +
> +static void gsc_work(struct work_struct *work)
> +{
> +	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int ret;
> +
> +	xe_device_mem_access_get(xe);
> +	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +
> +	ret = gsc_upload(gsc);
> +	if (ret)
> +		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> +	else
> +		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
> +
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> +	xe_device_mem_access_put(xe);
> +}
> +
>   int xe_gsc_init(struct xe_gsc *gsc)
>   {
>   	struct xe_gt *gt = gsc_to_gt(gsc);
> @@ -23,6 +161,7 @@ int xe_gsc_init(struct xe_gsc *gsc)
>   	int ret;
>   
>   	gsc->fw.type = XE_UC_FW_TYPE_GSC;
> +	INIT_WORK(&gsc->work, gsc_work);
>   
>   	/* The GSC uC is only available on the media GT */
>   	if (tile->media_gt && (gt != tile->media_gt)) {
> @@ -48,3 +187,104 @@ int xe_gsc_init(struct xe_gsc *gsc)
>   	return ret;
>   }
>   
> +static void free_resources(struct drm_device *drm, void *arg)
> +{
> +	struct xe_gsc *gsc = arg;
> +
> +	if (gsc->wq) {
> +		destroy_workqueue(gsc->wq);
> +		gsc->wq = NULL;
> +	}
> +
> +	if (gsc->q) {
> +		xe_exec_queue_put(gsc->q);
> +		gsc->q = NULL;
> +	}
> +
> +	if (gsc->private) {
> +		xe_bo_unpin_map_no_vm(gsc->private);
> +		gsc->private = NULL;
> +	}
> +}
> +
> +int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
> +{
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_OTHER, 0, true);
> +	struct xe_exec_queue *q;
> +	struct workqueue_struct *wq;
> +	struct xe_bo *bo;
> +	int err;
> +
> +	if (!xe_uc_fw_is_available(&gsc->fw))
> +		return 0;
> +
> +	if (!hwe)
> +		return -ENODEV;
> +
> +	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4M,
> +				  ttm_bo_type_kernel,
> +				  XE_BO_CREATE_STOLEN_BIT |
> +				  XE_BO_CREATE_GGTT_BIT);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	q = xe_exec_queue_create(xe, NULL,
> +				 BIT(hwe->logical_instance), 1, hwe,
> +				 EXEC_QUEUE_FLAG_KERNEL |
> +				 EXEC_QUEUE_FLAG_PERMANENT);
> +	if (IS_ERR(q)) {
> +		xe_gt_err(gt, "Failed to create queue for GSC submission\n");
> +		err = PTR_ERR(q);
> +		goto out_bo;
> +	}
> +
> +	wq = alloc_ordered_workqueue("gsc-ordered-wq", 0);
> +	if (!wq) {
> +		err = -ENOMEM;
> +		goto out_q;
> +	}
> +
> +	gsc->private = bo;
> +	gsc->q = q;
> +	gsc->wq = wq;
> +
> +	err = drmm_add_action_or_reset(&xe->drm, free_resources, gsc);
> +	if (err)
> +		return err;
> +
> +	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOADABLE);
> +
> +	return 0;
> +
> +out_q:
> +	xe_exec_queue_put(q);
> +out_bo:
> +	xe_bo_unpin_map_no_vm(bo);
> +	return err;
> +
> +}
> +
> +void xe_gsc_load_start(struct xe_gsc *gsc)
> +{
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +
> +	if (!xe_uc_fw_is_loadable(&gsc->fw) || !gsc->q)
> +		return;
> +
> +	/* GSC FW survives GT reset and D3Hot */
> +	if (gsc_fw_is_loaded(gt)) {
> +		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
> +		return;
> +	}
> +
> +	queue_work(gsc->wq, &gsc->work);
> +}
> +
> +void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
> +{
> +	if (xe_uc_fw_is_loadable(&gsc->fw) && gsc->wq)
> +		flush_work(&gsc->work);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
> index baa7f21f4204..f870eddc77d4 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.h
> +++ b/drivers/gpu/drm/xe/xe_gsc.h
> @@ -9,5 +9,8 @@
>   #include "xe_gsc_types.h"
>   
>   int xe_gsc_init(struct xe_gsc *gsc);
> +int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
> +void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
> +void xe_gsc_load_start(struct xe_gsc *gsc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
> index 1bc50583fe58..57fefd66a7ea 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_types.h
> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
> @@ -6,8 +6,13 @@
>   #ifndef _XE_GSC_TYPES_H_
>   #define _XE_GSC_TYPES_H_
>   
> +#include <linux/workqueue.h>
> +
>   #include "xe_uc_fw_types.h"
>   
> +struct xe_bo;
> +struct xe_exec_queue;
> +
>   /**
>    * struct xe_gsc - GSC
>    */
> @@ -17,6 +22,18 @@ struct xe_gsc {
>   
>   	/** @security_version: SVN found in the fetched blob */
>   	u32 security_version;
> +
> +	/** @private: Private data for use by the GSC FW */
> +	struct xe_bo *private;
> +
> +	/** @q: Default queue used for submissions to GSC FW */
> +	struct xe_exec_queue *q;
> +
> +	/** @wq: workqueue to handle jobs for delayed load and proxy handling */
> +	struct workqueue_struct *wq;
> +
> +	/** @work: delayed load and proxy handling work */
> +	struct work_struct work;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index b67154c78dff..15dcd1f91e9c 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -74,11 +74,17 @@ int xe_uc_init(struct xe_uc *uc)
>    */
>   int xe_uc_init_post_hwconfig(struct xe_uc *uc)
>   {
> +	int err;
> +
>   	/* GuC submission not enabled, nothing to do */
>   	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>   		return 0;
>   
> -	return xe_guc_init_post_hwconfig(&uc->guc);
> +	err = xe_guc_init_post_hwconfig(&uc->guc);
> +	if (err)
> +		return err;
> +
> +	return xe_gsc_init_post_hwconfig(&uc->gsc);
>   }
>   
>   static int uc_reset(struct xe_uc *uc)
> @@ -173,6 +179,9 @@ int xe_uc_init_hw(struct xe_uc *uc)
>   	ret = xe_huc_auth(&uc->huc);
>   	xe_gt_assert(uc_to_gt(uc), !ret);
>   
> +	/* GSC load is async */
> +	xe_gsc_load_start(&uc->gsc);
> +
>   	return 0;
>   }
>   
> @@ -197,6 +206,7 @@ void xe_uc_gucrc_disable(struct xe_uc *uc)
>   
>   void xe_uc_stop_prepare(struct xe_uc *uc)
>   {
> +	xe_gsc_wait_for_worker_completion(&uc->gsc);
>   	xe_guc_stop_prepare(&uc->guc);
>   }
>   

