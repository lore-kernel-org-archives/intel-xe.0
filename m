Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D606C10DC3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 00:53:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37FF10E9BB;
	Fri,  8 Dec 2023 00:53:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB7210E9BD
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 00:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701996825; x=1733532825;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PUdosRC2zQf4bK8ByAQQkOX99hlyZecC+mJ8SS+Pjgo=;
 b=UNH7nzEXao70u14px1bEI4Sr8f4Lc4q7OEsum1MvW6OVmdlqsSV8JFJU
 rmLc6REkPT9Mxq2nrimeVZ8TCqa+5PcNy4BocQbj5F7EjLE1izLZC9Rkj
 aWJerFi8zvRD7yVCHusHq+y/SLC5usRJRLW+Xxr2x2N3jPlTWxX3Xon3I
 Qyhjj3/dTt2XE1R/vP/RE4pE3S8JXlhIYAJ5XfMYAfQV9qZg+qu5xbJYX
 IbtkPTvdu8mZsjQynEybXF+hXTiLst1BSWtFeM0RQ3EuJ0ny5BOyrFwhg
 ogaWUc2eOtNF3Bw4jgFihnZMr767rW+7Z/SUgI8j8cGV0hQHl3yF05eQj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="15889059"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="15889059"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 16:53:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="13304601"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 16:53:43 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 16:53:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 16:53:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 16:53:42 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 16:53:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrkLk9dCKOrbJ+qRrzjb+ed0LoYNutw8DGX6SsbJGsdHEqhUPQgUHwdyl3QcoqTxRqWKqNHxcuQ1y5v7zgigQkvx3uMohxN+P4e1y+VQtTKg8RTsDLJK2gtrJoXxRWebg3aaZk8vdE3L5EV2Aoux2rIElyQj7UvPBy95MHHn8gc3zrQGfrbYvUKRScxD2f3jzmibcGM5qTcvsiE1lrNBilP9Wm67xgybhtlvEEuQ17Et31fNKbNczuWmUsOuOWGxNynv7bsquL5vZw+M0dFDjqLt0TQ6HeuZR63w1UlOBY8K6Na1MuSpijwn3hBr5yjClbr/X64XWVKGlFttojdxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Gv17i/qoNhxpcZh/JUrMENFS0Xk/n74qCzZh+1cRSk=;
 b=kUAfqJXK/MDi/m7U8Or1nDcWHZK/Qrv5jWGmfyemePJiRB+8TDD7rAhQ0OnhMwl4v0BlBSOVMe1mgjZz2JuER6PF4VlpUTfsR4Umb9Bbfush78l+iQ8P0IAsUp3FJBYOYttap2SQOvJdLz3lPM7Hz216Fe34qHdNWwcUEZRxuIUobWJv7D1QXfqynXsETL9JLFnuhsvrqDacKhmYQb8T3n9YWA56/wvF9NRSQLrYk7qZkT//ktnHB3IayO+SNiXh8Ckgz20W+qw4bIfQRTIGAf19PsyFB2PeGuD0Y/ZNrNYteQtegPxR2qe9502PtbXvft6L67hLbb5R/G3m1mY3sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB5263.namprd11.prod.outlook.com (2603:10b6:5:38a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 00:53:39 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 00:53:39 +0000
Message-ID: <760dfcff-cb81-4434-a03c-6ab89c9fdded@intel.com>
Date: Thu, 7 Dec 2023 16:53:18 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] !fixup: drm/xe/gsc: GSC FW load
Content-Language: en-US
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231207205556.495523-1-mika.kuoppala@linux.intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20231207205556.495523-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:332::22) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ab1b64-eebd-48c1-36be-08dbf7881248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WB5InTGruf0HErplPZ1F+LZyBfh8zKcjHMobmxoR79Jr5t5I7iqUQgim4ly5N/Um5cPbLGT6SQeE5HwjMxgdxeIMO+4V1a3IcrTEe3uLkjRLKaka1ZF8AEleqwxLjI5SoF61uuICDWuhuT/x/TfI4+cUm1DVgjJ87hRL6vlKrLbUIt01Wwt6OtIMWchiEYKXZi4E/1Bd3vZrTOVFoJOGs3oWa+RBlVBfojgIizi8czJKvZra0Qkz7e3DqcUsD1Y8HA1gua54d0I5FJqUrysLx5FKf1orx2bqlX4adhod43QDiAGrCJhDvuLI/bboIzXZbBslb4vJ2RAwO/tpSlNAViT14VkaNrF9TNa2mYtiFBoPzGSHawOJdgAfRCftgiuQ+EdbGE6PFPejg6x2qO1DlPPYJZ5bLCx1nEonW2mu7TmzI78Rdn3gtujCEGhm0SriI6bdewpu8elKVtaDmep0m4CFaoiv/oc5DmuihONeYy5I3sSWcClR7JSPo/cXUXxzKk0dXMLiC/QFHxTrxjDWANN2p60/5R3U0vIxfSNOBUfINUS5jXjg56HlK6XIHwjHs8rGoUwhsKk0eaujhJrGos+Xgyfe819hAkBQIqdo0Jxi3nOY2iOQDWcH6+m/g4zVuwTiEogIGfRuz+YbO3cSjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(31696002)(83380400001)(82960400001)(8676002)(8936002)(6512007)(41300700001)(86362001)(26005)(2616005)(31686004)(38100700002)(6506007)(6666004)(53546011)(478600001)(6486002)(66476007)(66556008)(66946007)(2906002)(316002)(4744005)(36756003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUtLQUZ0ZG83ak9qazlVcXVmbG1ZRnViajJSRFhnUnJhSkR0aUM2REN6YzFQ?=
 =?utf-8?B?MlN3WG81THBoWHZQNXdsdzFMSjRsWDNydzRzZWtXOFlxV0FRRitQU0FWOHdj?=
 =?utf-8?B?aTFFRGt2QXo0dzZiTE1ISWZSRmR0M3pXY2FKTHlxbDJPY1lQNGh0dDRBL1V0?=
 =?utf-8?B?U0ZZOWltMFExS3VMUHFNTmhUNGcvYmJHWUkxRTVHRnVYdVFrS2E1VlJ0dW5L?=
 =?utf-8?B?QTQ4ZmNsT1dnNGFDWmNIeW5LSUhsaHVmK3RuL2xzVE02bTNhcU1wOFZVaUcw?=
 =?utf-8?B?UmNmUzNkaDE4MjA5d2dnZEhlKy9nYUJJSkZHVWxTTHNZb28zNjlaRkNDMTBO?=
 =?utf-8?B?TDl1MnF5bWRqOVpJM0hmY1ptUGxySUdkcmp1RGJocFYxcUlwWUNsdmNGMFZR?=
 =?utf-8?B?RGRaajV1c2NjeHFEZG9tbXRpd2NFckU0OE9oQWpSTnlPZU9JQ2xRaVZrRHZk?=
 =?utf-8?B?NzRPUUREb212WFdoUXdxd2o1WDRLVHZTcTIwdFVxaXlRM0l4dXJUY1lmM1lt?=
 =?utf-8?B?cUN2NndoZ0VUaUJid29VNS96eGN2RXpPN1REV1N4dUUwTlFBanlidHgvby85?=
 =?utf-8?B?Nm1MTW4wOHpZQ1llVDJ3dzdPMVh2ZmU2N0Z1eFA1bUhhR3ZsV3FaZEVKejVo?=
 =?utf-8?B?c29EbHdaU3dpc3ViVE5OUWJBRlBkWGxKVVJWK0UyalRxZzBwc1IxUjJZQ01Z?=
 =?utf-8?B?NTFqUDFOVU5CekVEb2RrY0tiSEdRMjZhVHF3MzFRM3pib3R5S0ZaWFMzN3R5?=
 =?utf-8?B?My90SDlpV01Md2lKR0xEajRiaUlnYVV4cmJONlUyc290VmZKWjhXYU91YkRI?=
 =?utf-8?B?aFVEbHF4VE9CZjA5VGVkUTEzZGxBK3BzcXkxVW00VnVMSEw3ZlBGUUY2dkZX?=
 =?utf-8?B?eEpvbkpPeHJSYUtndXduTis4ZlkwZ0J6K2dFQS8wUUpaQ2FFeVF6Mmpoeko1?=
 =?utf-8?B?aW5JdFNHcGlRaVEzT0xNUXR1MWNaa1N0cjRaTWh2c3BzWVV1eVFGekZyM1ZU?=
 =?utf-8?B?WFoxNUlzOFM2ZnQ5dXkvTWN4U2s4VDExc2ViUlQ5dVdEWE96NTlxcXpTTUdh?=
 =?utf-8?B?cTNVcFZ1d0NreEJDM24yMXVJL3AxeU9sY1BHcUt4dVNBZTZVUWNhMTFVR2RG?=
 =?utf-8?B?S3J5RTR6bjJLQXlScjJ1S040NGtUdkxyVWNKMG1lOVFQd2c1Q2k2VmQvWi9q?=
 =?utf-8?B?UGpicG12dFhQdmxyTDhRaEVsUStuNTM2TVNTVTVDcWN1QjRLUHQxUHFuRGR2?=
 =?utf-8?B?UUhuQVgza0ZWRzFXY3VVdEhTbTlsNlZ4Wm5qSVZFVGMrbEEwMTV6TndTNjBq?=
 =?utf-8?B?WjVFOXlESEJBY2x5b3pybm1yejZGVXlYenMzcVVYSllUM1d0UGhFREpHOUk2?=
 =?utf-8?B?L0kyTjkrT3Z1MkpwbkNjM3lKSFRtOVVMQnVKSFZBQ0tSWTBabHhmWWNLMkJ2?=
 =?utf-8?B?cHZGeUtKL0xFcnpPTWRyVHdPZmtzMGVxYkp1OHFGTDhLY1BaSnNkMkxkMjA4?=
 =?utf-8?B?U0IzQ0pXUnpKbHVwWGxwYlhXaEF1MytNVDN6NnZPY2hZa2tsK1JQckhSOTJ6?=
 =?utf-8?B?TE11bm5LUzYvNHQ4LzBQTTlGU1NFSnRZTzFyMk9waDlkTXZkYm4wQ3IxS0sr?=
 =?utf-8?B?WVdjMml4dmVJV0Jab25SY243aWZLS0ZxOFdFcS91NndDdURZT1huVjdYSCtm?=
 =?utf-8?B?eS9CTkhNVmh4TlFEbFpObzhXS1JQMTFBUG1KeGVOK0NpemRJTm9DVklTSThv?=
 =?utf-8?B?bGYrNWFOc09pZ0gwVnljL3ZKUU02aUNxTS84ZU56eWZuVy83Sjl3dXVqejJD?=
 =?utf-8?B?VmttSFl6NnNURCtWRGIwSkZmdEIyWmwxVzNEUVFFZktlbWRncERpQXNTL25o?=
 =?utf-8?B?RWpxem1qZWk5UTZIQTh4bVQwbTh1YTlBRlBla3Z2V2ZsUklPRWNrV0doZkUr?=
 =?utf-8?B?NnlEcHJMMGpBQXB4Ry9SK3kydjlVeW5wQ0FpRTVoVnB0Qmp6eGdjQXFWZCtV?=
 =?utf-8?B?Ky9GQjJCQWFzWHFUaUlBendKZVNkcEdqd2JnUkdJM1hrcEczdUpYV1BlWmY5?=
 =?utf-8?B?YnZYdkNueDhidm5OVnM3bDZPRS9TT1FQM2xoUk9oS3QxZ2VQVGJGMUl3cFEv?=
 =?utf-8?B?TFJIM3lCd2Y3bDRFT0tNLzVGMWExSm1ZYytPenkzWkllUjQ0WVNjL3ZsUHFJ?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ab1b64-eebd-48c1-36be-08dbf7881248
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 00:53:39.1267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLjiIuOXshY3SQpKGVdJX76UBDiLB5+h/c2Xjp9JEnD+aFC+skWTHpCJnm4Cwn3wSnZMWP7Fa2v0pEfiSQkYFVnVBJicvdDDtj527wrMj7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5263
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



On 12/7/2023 12:55 PM, Mika Kuoppala wrote:
> Fix timeout to be in usecs for xe_mmio_wait32
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Thanks for catching this.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_gsc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 4aad6a8c9dde..a8a895cf4b44 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -182,7 +182,7 @@ static int gsc_fw_wait(struct xe_gt *gt)
>   	return xe_mmio_wait32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE),
>   			      HECI1_FWSTS1_INIT_COMPLETE,
>   			      HECI1_FWSTS1_INIT_COMPLETE,
> -			      500, NULL, false);
> +			      500 * USEC_PER_MSEC, NULL, false);
>   }
>   
>   static int gsc_upload(struct xe_gsc *gsc)

