Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A88C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 17:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736B910FF60;
	Wed,  8 May 2024 17:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ff3LgMoz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24DB10FF60
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 17:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715189065; x=1746725065;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pYRoeenW3mrE4cIcMOld0pFwgdX0qul2PmNLMEyi4lc=;
 b=ff3LgMozSMrOeJ0Z9BKZe64n1Oz8HNcxbuLDItUHCNPxBgdp5WSzMQRR
 5/91CGrNXLCV4UbY6SOsCH8WMZCrSOJmn8Fauph7PjO1aPvWLQt/kWVMl
 TUIEX7DhDy/95Bk/ZloPqRVB5xCL3JB8eiDls7jGaIQpaNUjSL9m14D2B
 4be0jbemPyqAEa9OU6/FcJ73Fj317hk7vh1mpIu1zJqJ5I10gRnnrhGJ5
 SJ5h7Mg8AcjGQ+LzM0CZzwaLrg4S8MRGl7ZBnXTAJLn+sZoqW/sqw/Lvr
 kHNPdnXKVbah7n3/t2FyDcrhH6qN+7NaX4g1Uou0jLy7ech6Kup30Y0oK A==;
X-CSE-ConnectionGUID: DZW33IaoQduLUzQofwAG2w==
X-CSE-MsgGUID: W1VTPPGnRtqjwMLH96C+oQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11430988"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11430988"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 10:24:24 -0700
X-CSE-ConnectionGUID: /bQMyl3kQsaE0lGtxCmPCQ==
X-CSE-MsgGUID: k7MBuxJnTMGJf6mbOOhQCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29533546"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 10:24:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 10:24:24 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 10:24:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 10:24:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 10:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJi64qCAfkV0snxcIWAVwPNHpY83S0Ux1SefRELtIOK5V/bRz1z9Nj5uauN0iQTh3p8IEFTNiz8GDX57nRZ0VSXtI99i+BNdE/rNqngstXr6SIGXwgPw1gK6HqEoPEAfPpnaVL7T0MBXzOI77Tf+Mqy0NINjWyES9THplE0+UK7nyakygADozEy4qS821naLiQIQYer63KljrMeo0SNnLTT7Bi8jPZKPv/ia/YhiTFycwz1/dSQyRlHID+nrd+rf2buB5RPZ1JSW5VabxAqrTMSfOMbwmt5bfx/3fCpIqWYx4S0cNRkGVzazYNTJFDH5aaopPx1YdUb0n1bSf5bSOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9yqSUVTjY+9LcRXmUVg7EbFk3JPIkvYQ5aF0qWAFk8=;
 b=ZJZY64hmHyWmjtZwmDtUB+5//r4sobjkKVonY90iuvQJF+pUZ1ajr8thRH7pWKf9mnr8JTb8anlZfhUnlFfyF9225N44y8xsb4t/V32fKoB04vV8BGVMaX86XxCbodqnX/muOK8R0VbFLYtZGuKGYSjFRnKvyg6/LLQyFN5rjZK8CZFQMAjzS6N/Q1XArfctN+xhbJED2O1fVyOI3pVHes89GW/PTQviKkpOfi2cY/wuhqZ1C/YmoQcjZysr+5coZEYdffe0P+X80ysp0CEUSBg82RpzOobY2P594U2IN8oz0Jpbj5ZZamuXMuBSPifmZza7wZDviz75+kJAx6RL+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 17:24:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 17:24:19 +0000
Date: Wed, 8 May 2024 12:24:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Fix the warning conditions
Message-ID: <lr3yegs6pkxveotjrlta6tkl2hecx5jm2ajhd364wt2wkt4bko@oofkocfj5uda>
References: <20240508152216.3263109-1-himal.prasad.ghimiray@intel.com>
 <20240508152216.3263109-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240508152216.3263109-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e7deed-333f-4e4d-c7d3-08dc6f83b1d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cAPhz2CVtClFKtu0jCS9muR1Q4L+Wm1Ou3X2i/EhN1Q+tuLfcg7cmYfVKd6r?=
 =?us-ascii?Q?QFpKc/yyUAFiyuI0E1n/0PNbqvRbd51C+3V/SKnVAZCxOWFO5AuR3vgt4X4b?=
 =?us-ascii?Q?AS9lBdRKMpWmN2XaPm4Dx5jHfuktT6OJ0naM0y08v5QBmGNmUx4x64bGYL5f?=
 =?us-ascii?Q?OgZHwRVGEozdJISME2t5dwne9qlHwmfhRPH4oDEdANjH1kZMxDbquT4EhMnI?=
 =?us-ascii?Q?Pib4mG3O+iKpYVoln4fGw1AtK73HaRxd8bbhFqcpQYkfHVn7QpiAxkA38BHR?=
 =?us-ascii?Q?RnqkYBZchwlswbsKg/bqRUq6t+kWgzPfSQ2b1AwlvutXgWE/sZb/ex1XtROT?=
 =?us-ascii?Q?vv+cnEzmburawh/58UTZkw/Fhws3YFhNbvXpHTwVrns0b5sYTLZ8jf5jNEvM?=
 =?us-ascii?Q?Mb8J0aAMYAxTpEt4tozkr53XilAx6k41e5jr7pEEkNQJh5dkghX7R0wEgqGq?=
 =?us-ascii?Q?WPcqgf8SWZU+E5IxBT/tgcM+IIX9Ev84+lTWPtckznQG9bokKTQkGRtvqqdq?=
 =?us-ascii?Q?CUfSpoTQvNlnvTZFGZkixlrKpnTBa6QXEaXHfjQ1qNIplWcJBWRomEtfoCNt?=
 =?us-ascii?Q?rVKxX+ZbvMLHLI/cxt1jQwiLTGVaUUfK0rsQcBvxnZ/obOWTPziO0H466uhs?=
 =?us-ascii?Q?toGfy24q8ZdOkVCdnmfEAIx6B0YbkFYfU9OWfQ3clztJZLKcTW6Fgn76cKJV?=
 =?us-ascii?Q?jq3YJVMlaIzlulQwMgUfWCV/EMWJPVuoUkNQ8SZYEsAaJ1F2W8zvYhQkdmld?=
 =?us-ascii?Q?kqdVprLiPUNhmiOn7Y04q7sFcCnB+qXpIkdighzGhkqsmW4d4zBR61O9kMpu?=
 =?us-ascii?Q?YuogBfVhkrfo2OI4qy1sJtYrm1ANCum8p28ymSDe+IPSpxP33lkq1jz/lipC?=
 =?us-ascii?Q?lJo2xpZlc7DipNo0+X8KlDMXoyr9dORLz2Lpl2rV3W/9ikU5PwC+J5e9MivB?=
 =?us-ascii?Q?HfsLCwvHuGDVEBoHaKPz76si7CyVfACVkn1voMMKn+FC2Na96G9Lj/V632Dn?=
 =?us-ascii?Q?2VQZejC53upc0qNftxyHf+T/60+8BJTAyjUplL0jPFnM4PSA43XFSRyVdOxN?=
 =?us-ascii?Q?n+IFCBDzj/jBuOwg/am13dmS7x8dP2D054MDBGPdqjv1dYKle9GsaisVGVlu?=
 =?us-ascii?Q?b+WO4tSNr7kJ/IQ4PhksVNTNj3EcmNaDDO+PXyPCyGlk0tJhoistJiIc019n?=
 =?us-ascii?Q?ROIwVgFRBitXFQRuUnwfvG/wsaXu9Lc4nJ5uOkmDIO8SoE+860sIO/w+/RMo?=
 =?us-ascii?Q?LweQqjjKXNzGaEEzegmenPB9eP00/vtwWl88uh1VVg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ksDZc4fRI9mLKJAVPzGzR/kM9Qsw0yq8y+pPaw3yfVIDC6Ja1c45yMHj8YAL?=
 =?us-ascii?Q?boM/Fx3elCo09E8JROQ50NnH8d30zO+cR5y+TBxuxEnEXGqw1DAhwQY+t8fS?=
 =?us-ascii?Q?V6v9c4keOCibUnZ6yUSROIlGWwtAT76kWAke2IoPbleDPYylP/Kc74MStzcD?=
 =?us-ascii?Q?K3VwR7G4msR5onk6OCUw35ciSHLSFZ4bFMwM6QPuKsCWHWRlET7elbJVn85x?=
 =?us-ascii?Q?TDLzj2tjw+WIpI3rxUcV58dPlVywMa1BQVG8tyxzY3yCEqyyjn29ajGhEQDy?=
 =?us-ascii?Q?BeWKmZw/Z92FRI7y7p8rBV6WBfFYcvsMVAcAFQjxmSAz6E7BFiXSGt8E6bTJ?=
 =?us-ascii?Q?8/QvOXa5HP4xW4dBx0E5dl/4Bt3BUoR28nDDoZDfjVzVAL6FdASjYG8k4XCf?=
 =?us-ascii?Q?5W6KH1z3AmDv1mroxv6i6F+wFQOaX0bUDS9ZanjoHZXFrn4SiW+SEmcPCc22?=
 =?us-ascii?Q?aAhkEY2JFaDIsplIwf2lo81rf041MJhL/hkBftx3i3C/hNqyt4wJXmM5rRgX?=
 =?us-ascii?Q?wSo30bCngS4hvvRy2HfiJ1cBA4cfMRWyVVlbACd/1Mj28wTbjQKQ7xR2rKqv?=
 =?us-ascii?Q?Q1Ui0D0hbuZRyRdQMFvlWdtWguEPIwpa+noYq6d980r7ElDBgOz5ln74nJOC?=
 =?us-ascii?Q?KiRqxnPpT944T4GUiUa+vR7IN6qkxCF0hY+zEVRCNcOGR58TdApIVUTsI5qN?=
 =?us-ascii?Q?30hyxrnpV7EBXN5rTK27Zt4ovfQzFF0mK7mj93FflMW/1GeJOpi3s+a5M147?=
 =?us-ascii?Q?hXNFzd6LcXBggfCZQHyr190YeQRw0fURtch2KywvaFIVl991942EZAsg2V0P?=
 =?us-ascii?Q?DirthjuQpWzd50TtQaBquLj5UGm7Zdo+XrA8kpr2s8KM8mn7q1vcwzbLwdwn?=
 =?us-ascii?Q?JlcArqoG1gmNz1J3kBpFttczESG7hR5cAMcUjQxmstykojCKIV934Gpftihl?=
 =?us-ascii?Q?8f8Sa5E3UMmbYMPoxtov1YL2TN8TN4dWlN90TUzoCu6PJRNQqrkgIPLbDI3s?=
 =?us-ascii?Q?cCHRJQfOIJ4fU37cTUlZ2QCU4xntVLfV7tI/lsrD0y/TJu3is4BgQFXbnowH?=
 =?us-ascii?Q?fIjt4d3jEJInTbxD9TFvb3EwybP6mmCXCwe49QMnpIpQvGE6Mctpi1C4BAv7?=
 =?us-ascii?Q?eaBjV86lMQqn8xYd+5usWDGWpocoa16JUX0syuULN3RZowUKw8TJ/xGRHBrX?=
 =?us-ascii?Q?TXSHkgbpi+zQVByypFPuAphNNbrgKA6DAY9bO6OUWHa4+uiCLrHo5+b8OXxq?=
 =?us-ascii?Q?437Cpv8PoS7XD9g/UbcHbEqdtuYEmDGymyACgiDI8EYlhwM5QuzQ7b4ezUrS?=
 =?us-ascii?Q?/TjOw9+UrUkaDH82aVzamlqkb5hvr7vAMmPj1jw2B5lj0o8lBpqOvxJPbiHJ?=
 =?us-ascii?Q?YEPYeG/QChunW2m9Gk/iXD68AwNIBn8KcpJCe40mhhU92UN85V1Fwp0Vp5CB?=
 =?us-ascii?Q?y81p5T/xdhXcRFX1BA9V4jWf9vMCQ9aLHcvGxwGD9Z2sDLxjdJt783LJZipS?=
 =?us-ascii?Q?mfuTLCfs6OD70KJYPD0w2vqW1fKhgB6vGeHtQ+pArnShfLn43Z3X9oA46w/7?=
 =?us-ascii?Q?AFeaKk+OKjfPnO176bWNgHNq/UVAax4YqZkwDfUFOflNA8xquTxPG3XWt0rY?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e7deed-333f-4e4d-c7d3-08dc6f83b1d5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 17:24:19.7093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAv8BW/x9zyLgN8f7ANGhWK/2DVjklPmBMtv91rPQ5RM9xeBFaNa5l8WoVCWLmtYbBX/ewT2H8zbSTgYgZzTvn3fdkbzp1F2Gs/3uOP2Tik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
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

On Wed, May 08, 2024 at 08:52:16PM GMT, Himal Prasad Ghimiray wrote:
>The maximum timeout display uses in xe_pcode_request is 3 msec, add the
>warning in cases the function is misused with higher timeouts.
>
>Add a warning if pcode_try_request is not passed the timeout parameter
>greater than 0.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pcode.c | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>index a5e7da8cf944..9c4eefdf6642 100644
>--- a/drivers/gpu/drm/xe/xe_pcode.c
>+++ b/drivers/gpu/drm/xe/xe_pcode.c
>@@ -10,6 +10,7 @@
>
> #include <drm/drm_managed.h>
>
>+#include "xe_assert.h"
> #include "xe_device.h"
> #include "xe_gt.h"
> #include "xe_mmio.h"
>@@ -124,6 +125,8 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
> {
> 	int slept, wait = 10;
>
>+	xe_gt_assert(gt, timeout_us > 0);
>+
> 	for (slept = 0; slept < timeout_us; slept += wait) {
> 		if (locked)
> 			*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
>@@ -169,6 +172,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
> 	u32 status;
> 	int ret;
>
>+	xe_gt_assert(gt, timeout_base_ms <= 3);
>+
> 	mutex_lock(&gt->pcode.lock);
>
> 	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
>@@ -188,7 +193,6 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
> 	 */
> 	drm_err(&gt_to_xe(gt)->drm,
> 		"PCODE timeout, retrying with preemption disabled\n");
>-	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
> 	preempt_disable();
> 	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
> 				true, 50 * 1000, true);
>-- 
>2.25.1
>
