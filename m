Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ACBC678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 06:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCC610E5ED;
	Fri,  3 Mar 2023 06:07:38 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF1410E5ED
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 06:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677823658; x=1709359658;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dxyHSI30pX3qBEGOyylP5f6YSMx75w8KPxLNRfT25go=;
 b=F6JR/qIMvSbi3j/REkEqMlLdqTXAanV5JkHXlXOljlUTrVrMMsEQBGGq
 8W5PtsWmSx1XvIQIIbYhbIQ1WW8pXwANKO1iRjciNsFq4MyBAFtYH1soy
 cgHwvHZ0+/C/M54ZfbReJhEZQ7sYKmMr+qu64uyFgIuhzNQ5Q838jmH36
 kqmRPImCk21yfSY7x7AZhCk2oPk05GXK8VCJL0M6Zk9Y0kL5Z+sw30shv
 3xkqHczDKvzMi1VTsypFAgp73uSBEUNAwAEMfrKrAy7J4akgoPPd/H8ff
 dOctHjgzUTum8YtCx8rQhV7H2HQDJLiwRQtBQXfb11NCpGEsJpF8Xc3tI g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="336483248"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="336483248"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 22:07:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668534006"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="668534006"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 22:07:34 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:07:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 22:07:34 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 2 Mar 2023 22:07:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leTBbkw8qDKn3WKjIb+xfcrFtFlWOtnGPoJRKQNdj9fUxlcKMhr5ypE3D3iySYlM5tf9Hd3HCyC0wnyWwGwXPOGL41agYfmmrv3ZM6OMjQRnjdC8vRTVNmrjsF1jPT/yXSUwzG723tVGNue7bEWgQ0v2jiTMOr1eyjext9YMLpiDCvLopu2otTxxIBPENPgtwwGIjl0ruujFNB2mRbwZ7GeTF72Hx7+WtEMgFMsbPqCLVARhJMLJpUFJssTm/o7qPAndmMD+edRsHpuTulLeBPBlsl3MmPRsBft8mssTd3pWa/otuecTCdpjAp5QhD80ENjf5oRNCJHu18PXjFDOiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtN4LQJ2dnxlvuxX6cTAaWq6MdIsTub7O0hobpsc7Ug=;
 b=HvPNTF0SX1IGWlbggii16XxN6w2QcFTD49VIM91r6skxSpaxXwLTc3ndaxuGKsA6GfJNUVGD7HZzzPv3gTI30E7MUaRv8yy0RH/J1teoFEnz7z/s5bqmpObAvujlo15ywQVc51wAPQIov4b3plKivG2c1vyXh0T0JLmjtZWQm3D+QZZdZuLKRNUe3Liz3sxf7USlcc6ddxBjLRGSB8NOnZqXPouwQ4z5vPrxOi8jtHs2Rl2ymyUrymxWKI3QL3eutsJvl8w9ZnCAlDTgVwdQuRZGOkPCj/38UoIHrIn+x2856U+PS+/E02Z8N3eGFENjKMuoAn7KsMciuXhVmmlFYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6228.namprd11.prod.outlook.com (2603:10b6:a03:459::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 06:07:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 06:07:31 +0000
Date: Thu, 2 Mar 2023 22:07:28 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230303060728.aelnqm2orekhmqj2@ldmartin-desk2.lan>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
 <20230302141230.2804699-4-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230302141230.2804699-4-jani.nikula@intel.com>
X-ClientProxiedBy: BY5PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:180::46) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a49822-7334-4151-ed12-08db1bad9282
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DSj3fglthbYi83g3dCMO+2C2/UY38G16vLZ/XLPur20E1t+RGBdBWdq547tX/jmnp6sRkFxf6qrHGi98xjC5slmghUkLMK6x86KM7ifBrG6ihxkXBVF6l4AtmslvAas8Fg93Q2xTEXZehIx/ij17i9yQ7u30dFAXY4pO3/Z6fs2y7r1LmSJwrBBE+zvz5LjVqNc0blxpjWGhSF4OPA/lVcvdVuf+w7FJRFpJaeRTbDxmRYrWbQ1w/hCu5vctRF4LzoIpfgxvl5Jqu9okHIreeNb9mMrIvdsVR++SAWUmqIoA7tsaHTQfzNV6zP9LyVAcx8E912C22WxcZI3CyJfPhFe5gWI0UsYRqFzZKKSIN4zaA91DrUBn6g6uxDsKl/GJLca4ZBVIOQQzMzN0gMV0AK2H4nYXBN7cqWIyBVoxJoSdaFW2+zayrae3eHT6KSXzeORFAVdhpkiQ97ISbfEiLAyiQlM/jhvhSljD0QZd0IFuuBxUpoJ+gqeqFjNZFbBdsxBfxM+r//n/QssBvsCmG+azustavqvUzm9F9iHbdIeyQAdoyqHa72z6pVOJ0PQgUsjU8ugymjJFq7Bi+UeGk0i11E1ISCbYAyiNYemW8hCBg1yJ7CndwSQgHOgawbdslsqKYdY7pPwDPLZNSW3Ldw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199018)(83380400001)(6666004)(36756003)(86362001)(38100700002)(6862004)(82960400001)(5660300002)(8936002)(478600001)(66946007)(186003)(26005)(66556008)(6486002)(1076003)(9686003)(6506007)(6512007)(316002)(8676002)(66476007)(4744005)(2906002)(4326008)(41300700001)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vpe1RpWznDaJCvso1gmzUwCS5/zdNwDnsL8eLFT2Pxvc6tSJrCh/MRfUUFhZ?=
 =?us-ascii?Q?ABoJ6qVCld5aoeWDQgpqCqoxlO56480XQlwQFj9XdjeyLbnLJAfMl1ijAVo/?=
 =?us-ascii?Q?CJmlpYHosVdfjeHACIc1pfs0Jr+sr3nLr4nejQ/VRssZ0rZeHXuDJEto9p5X?=
 =?us-ascii?Q?ygo5eyDMXVftDBviFFwYDxhO6ic3135yqGNw5kR/as6m1EXXf9xUM9vrG6ZC?=
 =?us-ascii?Q?O8fkuvtbpoROZPHtHD/76YGWwhc74Ds1G8qPi9ueJvyw/2S+Qm/VwnhjMBQL?=
 =?us-ascii?Q?/bI9EcLQr/I8uX3fHjuASEaOFP4jaiuU41DV1IsxVnFVe6WAN/7qpQ9/fMU1?=
 =?us-ascii?Q?9Ojwp88B5+cVg6UKTsmUce213ZSv43lQyH/s30BfUCHB5wYjX4csW22cmPxm?=
 =?us-ascii?Q?CjfeSKb1eShujhokB3jN0cD0HT7C9vvON7Ov937VcxqHR6CC4Mq+Y3djM47I?=
 =?us-ascii?Q?AdbJzQbos9hnkEofr69fF7KE2rukUi7MOHnlIH+gh69fmzJs51AQjLdxxlKE?=
 =?us-ascii?Q?LWxggHk7oDj9D+SHWR5LNeLy7FcFVaVuyZaQwq0MPFjW5dq8supwkyeUntjM?=
 =?us-ascii?Q?POE9KJD5OIPwKR7+zZwJapWPRrA45OZ0IVHp8AxtVTEoIAPwd58nyFJGVju3?=
 =?us-ascii?Q?+CoJ4o+9Jws26HExpi0ar7jlZsxN5imjVW9OjMZQ18wNvxjMwVCzJqwWa46L?=
 =?us-ascii?Q?vvgAvHaATzhbYFO+BEgV1Bb9A7oFDj1oMm2z/RV78HaNIJFgPq8zqjTQRsg1?=
 =?us-ascii?Q?J6K+n5CMbEmhF/s3qodwdoclNRdpeqVrSkGqPIWEBUdlNR3GUiMf4j/a90t3?=
 =?us-ascii?Q?iNJFx9utbX8BkQREgxxF8Nn82R1mPj6gABpBDnn8zLaTu8QcHYKnUT2uJqWX?=
 =?us-ascii?Q?mO5DZiQ4rKJJBf9c+U4RiMJ11inl/cPePqJrTR3bkJgGfEj1kt5eDLbc6k7O?=
 =?us-ascii?Q?HDrKHTUo/PlouZRrNkImnW/bF2Tlr5arGeV4fFbkwNdyvwJ0dcv7VDCXNaPS?=
 =?us-ascii?Q?bZX043jv8LVPYnkH73cIR7i8c3ZU+zUmT/zAGDj1TQFW9PN706wF8LGg6PL3?=
 =?us-ascii?Q?pmm4cJ9jBJue2QG1ly5WtFNvNYnGV+j4Q6+ByZj1yQsEkKCBGJVFPYSGmGnU?=
 =?us-ascii?Q?eIhXRqi26ixhxGwIlv6d3pfsnV9uZFfd0DC0rCvaFtcu8cZRHVtGEv0CIhpP?=
 =?us-ascii?Q?aBI06UEp8iJpdcw28vlsI97wrppiHeS/r/FpmoEvVn3yddrMV6Cte59eq/c7?=
 =?us-ascii?Q?XZcYe73TrqtXhBavVoKqDzaJdcIYlmWeaWImDTCJl3WGMmbJbt0UnXVlJ/sB?=
 =?us-ascii?Q?kIumkJ1vI1Qvco96KwdjIiW0HwFqofZDzwhbBeUmB0y2su/PeebrffWV7Hmi?=
 =?us-ascii?Q?ofbsLZ4iJ68kV/KLINHjkvgM9BdyDuFdid5yeMZ/VD87n006BrOa6iAQStR/?=
 =?us-ascii?Q?tL531dTOp4ZSQ98kfa5uAgqgO57L5dvVwFFCQBDgxa/pfJIGjGIrVX9UOXay?=
 =?us-ascii?Q?X/NRaw+Ax/xnMrMJ/32qmuJRAAqHH/mCm5aYojP3Jd0k7RXQ24ZI2OeqeL6X?=
 =?us-ascii?Q?t8TxK7hpvd+DGqSn02s7pnkKOfF+Gu6m0o+jrNMadTsGmn6NChMPaXRh4PeI?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a49822-7334-4151-ed12-08db1bad9282
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 06:07:30.6724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nu7rU94Jeq21fyxUjDv/v8Z1eHfM/wyPNy0x5+yPy5e0k2CE1AfleZQG6TTs8s0nmKMFHBG0O7PMh2VTSGF6tillWRbcIKknqQnHgbO5Ico=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6228
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/8] drm/xe: drop unnecessary include
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 04:12:25PM +0200, Jani Nikula wrote:
>The file does not exist in upstream i915 anymore.

since the tree is going to be rebased, then this will need to be
squashed in the commit that added it, otherwise we will have broken
commits.

May be good to add a note here.

Lucas De Marchi

>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> drivers/gpu/drm/xe/display/intel_pm_types.h | 2 --
> 1 file changed, 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/intel_pm_types.h b/drivers/gpu/drm/xe/display/intel_pm_types.h
>index 8bf1594a9d1b..0bd4b1cb9c83 100644
>--- a/drivers/gpu/drm/xe/display/intel_pm_types.h
>+++ b/drivers/gpu/drm/xe/display/intel_pm_types.h
>@@ -8,8 +8,6 @@
>
> #include <linux/types.h>
>
>-#include "display/intel_display.h"
>-
> enum intel_ddb_partitioning {
> 	INTEL_DDB_PART_1_2,
> 	INTEL_DDB_PART_5_6, /* IVB+ */
>-- 
>2.39.1
>
