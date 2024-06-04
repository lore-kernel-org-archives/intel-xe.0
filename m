Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62474C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 00:44:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0236D10E335;
	Tue,  4 Jun 2024 00:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4CBgOOd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79BC10E335
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 00:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717461873; x=1748997873;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RMU5zG1pN9wgykUmhEGd9oPPb33tno80OEcX6B317Mw=;
 b=c4CBgOOdZwMu7H/yuHtH2a2ENyo+CGQKvqrqc/9lfs8hAQPgjP/5bluj
 LsiAh1LMye7ZSPYG140oXNpSsAx1c+TeYUoyfRLznCuOhTNl6JkwUxBZJ
 4+bFNaXOfYv4qovBGnAcsjQDYv86J9tiMEGAgKPpHZAzT4+AsL6DSNhQ8
 Vi78XZE2qTorPlbyKpyMudxiYIbxa28kCLlHXgwvmMvtMZcXG62JzG2Mu
 YYWBy0O/HHGLcLfQnEwDKdWiUtKDM12khLPU3yFjH2+3fbQA7zNkmZqAR
 znqz0GwyJQqEAbUhkpxvEFloYkBGzWs79TsSwcDlFxXFiVWGn4qaH7V5t A==;
X-CSE-ConnectionGUID: MhvWe7r4TUi0ldbjH55E6g==
X-CSE-MsgGUID: OHvLN1UORKSThpio1altiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="16921024"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="16921024"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 17:44:27 -0700
X-CSE-ConnectionGUID: Y+TlSmjUQjeHSZDhZCtaYA==
X-CSE-MsgGUID: RKI5T9LJRaeiwSaUMRs/iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="37649963"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 17:44:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 17:44:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 17:44:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 17:44:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMVHjUc3koCMH7zyGPEQGZDggfgSDlsCQZhvVKCwWkPL+vtO7Jau5+ktPokDU7B9NIMpibTBDtte3cJRGOtw4ArbuP7nnxpxzBQwsxo2M+k7vxBwvnCTernCq0s1TWfxWG354pZ9fYqvJQBniN3hLxTo031Tk0dW/3JABdrlp0SW1joD9DCcHd3TVr3A7qqvdWeugq5OLXgeV6NJt4Y1J0Yc0F9MOMPpKbFK69rRrh7S/iOILjxgtgg4/CDOJCcXmea8yFBAZ2JYbQp+1M174TdtTcnykzdfwfrkAZpBqqot9ddgMP6+62+TB5fRZXXZUGP7L4j9xiGTzLmntCxUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hR7ed0xQi7/qrR0KAd97ITzZpy+t1SG6IcVq3ZCtDZQ=;
 b=gdK5Cxu+nzuSCtRAYaTjoB7yYR25RX1BpxOE+epxr77nd4h1ASeUOxAkzvsUp8HeegAh1v4EkBHezF0T8eUBVA9R7F8sQ2H1VvhYe5oGMJoc+/AaqpwrE1aRr89QTHCWKEWng03lwwkkBykTa/LIZr4HzXn+LuooAIBJlVCB8pizCnbrArMupg0lNbsIUDr/t5QueM//+st+SJuzul8uGNJyBGiLHDnAQOS0lfpwyZOXuInr05nnVDnEdTBeVbG7Qlp8nd3A9ZMQtDQ1iXQqAVtCreeElwggiJOjCePLt7jPPcvJFP6IjRZelkfcRwpGsWsp9Pjlu3CKHBmhnBs7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH8PR11MB6731.namprd11.prod.outlook.com (2603:10b6:510:1c7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 00:44:23 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Tue, 4 Jun 2024
 00:44:22 +0000
Date: Tue, 4 Jun 2024 00:43:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Drop redundant ARAT timer enabling
Message-ID: <Zl5jO5P4M4/0ckga@DUT025-TGLU.fm.intel.com>
References: <20240603190747.1372-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240603190747.1372-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH8PR11MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4a5df9-dea0-4a30-4005-08dc842f7a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m795r2n0Cycg9h7L9+u9tqxInmyqe8dGEMvEz/DXBYDEBw15tXOPKwAFGcM4?=
 =?us-ascii?Q?hYLLyq35wyJGs4/auEy8/UoOZp7FDtXhS+zCf5Bi17MsX8ChqdSTQTtZP5SO?=
 =?us-ascii?Q?v9FDR6hCo9xa5piRktcJz7vgazoh+NbUFPzNhlnq36NV2eadLJVgj5sCmIZ8?=
 =?us-ascii?Q?YGkZZcwzdRb8LfvtQx5s/uMMKjnByVwGxKE/y1U27Z/ddc7Zpe/A69IbQcqI?=
 =?us-ascii?Q?i55IZgGuNjFuZwskwyWH2xNf8neSWKIRfNhDpeZw6s/mlfJWsUGS73VpRDIy?=
 =?us-ascii?Q?fGZ5xbZ9quEBaQ0HmJ5FcsuVUqkrderOwSfy28eDuJqb9Xz/6QUaWdvytfJg?=
 =?us-ascii?Q?DI74YNl1xCvz6aTh25SrrXpYByZQQdGz3zXmQhhUAEzNGJJ1k4stHp6pJOPK?=
 =?us-ascii?Q?741DVIniwi6PLxSeEnaWy+Fbh12VUd4B8GU0/RwaU48U9o47Wd5d70n5hFpM?=
 =?us-ascii?Q?LsmPNFN99eWnvaRtBILlCrakpMAbEzmcex0PVtLIP4pq/60wt0L5+brzjT0F?=
 =?us-ascii?Q?4NimVhFpJmQiz9TkSr37auzEeZZmPoYTjffRDlDq7hPPuCFCl8hKooBPFLrK?=
 =?us-ascii?Q?5WMJTckBTKW0nAMrWDeCG2Ce9oq3ppSDhV8YuGUBDKrzCqKcs+vljBwJ8qC3?=
 =?us-ascii?Q?/3Euuyv56BeuEJbf+FdBvbKoz7TiIVuFFL79cpjOxigO5L2lh5wCPIiX02EJ?=
 =?us-ascii?Q?eCnX89zn7KOrfedPFnNJmMDWMG7DaWs5AuK5se5K6Z2c7NC6Xk/aOOjHU6sQ?=
 =?us-ascii?Q?wsKpQdBEp7mvES1rP2NR4qmGMRRq9IaNKU6Rb+oCdVTcT2uy5OnVGMJUVa6m?=
 =?us-ascii?Q?COyFv3ERAz527RZDidzhLYQyJd7xzIyCz0B1l7kVABu8Tyj/YMd0S8V/nZNY?=
 =?us-ascii?Q?LbdLSDMk1usVqsOWBOV1VXTd7umE0qmUUQo1ExWUc0XKvN2omR+SgaokPbRl?=
 =?us-ascii?Q?XDxhxGiEFriigmhcaLn6fnRdmGrPddl3xKulg89fpM6QYrW8xzYS4H7RtYka?=
 =?us-ascii?Q?lhVeXFZwty7HqHdcM/zRAibM7TWjAqcJYUHoDFNoGg1YmC0Sje1yIalI/QOf?=
 =?us-ascii?Q?OtDWGjh/WO9hDDTDvd+4CdJdrlaIEvt/eDdztfxPQtWJZ9yhCq+fHFeaLNwq?=
 =?us-ascii?Q?aewYAOqTxfCVzj17EpCqu6HHGExkD1nOi+2TIfmMkhFzD7OQJNZ6koLjmYks?=
 =?us-ascii?Q?QJ98vIDrXgAiimiXWyllcrItpGmc9LR5yqN+hOljM0AXzB/fkWSssoCLOkCP?=
 =?us-ascii?Q?B5vclG4ylxsQ6Ex8YWDkhKfnvMmKh+1x/6IULR7U+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TMK54qHZshKBDTXvU/6QkSp1pYHLih6mdAfk1XTKEDuEar29u/TWSPwU3u83?=
 =?us-ascii?Q?vGAQ/6IYCBUGGfN+UD1TDZWHGwTunx83f70KPJKt4SVyjsrUOE/Vw2sjpOJu?=
 =?us-ascii?Q?qIeSxOHx1ch+f045XI7FAJqyKFtMR8aiUs7xwAmqeJeuxKjx8A4Xe75Hp2cT?=
 =?us-ascii?Q?sZs246LIRgJc/M4J/ADpWtl+uGDaULa1uIE4ZKnwHmT2UFFTlYi2lzydu7i1?=
 =?us-ascii?Q?JbMH9RyA2p09J4K1mkrVhhCm5+e59m0QwXKbJ8sDB3rwAVJl9ni8riv9GPUh?=
 =?us-ascii?Q?00XWkrIIa5JM2zztkx7yYvk4ltDHHMZaU38GC713zzKlfnmwQiUGd15ce4CY?=
 =?us-ascii?Q?+IJTIfKNNroj5bO8afT6MAGMs0Qo1SzPDOVjQumJWlM3zPLCyqcJqIvhfFCr?=
 =?us-ascii?Q?YNHWDN6+ZUPnowD56v3d6QGSGty6duphlQ3D3iejGYYwJq4mLoHXF2p/rfyN?=
 =?us-ascii?Q?vAdgaeOLRHkvYpg5jK+x99aj7pRYR17oLgiHph2SOdGflQaGNs918CrryB6Z?=
 =?us-ascii?Q?Z9Oe4KbJwEfwTKicM4rZFo82lKdfuFV6nuZO3b8eCe7o4vRV8VTh8qpG71rS?=
 =?us-ascii?Q?7R14RBcy+1SIrlBFPUOe+Grqkwp38zttimu8unnEGp0F6OLHqtoYwoTE+mpg?=
 =?us-ascii?Q?N0b/whmkONoFmYTU74LuoVSYXKXVfA9khV47u9QhSlDTCGCcNX2BU4IMzW3I?=
 =?us-ascii?Q?QZhvXMS77qvu0jqa9Jf0JyrtyMa9a5aGxnS9OjDM+duJT+p0Yij74uP/QDWm?=
 =?us-ascii?Q?02+kQR/ZS6JGDpxk+iyMenEABAOzZd4+Ge23ARclE8XoqPsQQ9fr0IUUUvWn?=
 =?us-ascii?Q?1tMIWSkk+BWDkBQrhGaCEF4fDfuV66X7taQGrnF7PpewiMtiuJupxxxiaOph?=
 =?us-ascii?Q?3Z3IFmN1OeuTItRsMYFDxV5n5YPWO/2E1nrEaozHZtJa/4NXK54oCHUPy/T9?=
 =?us-ascii?Q?393qPJ0KdlS1MHWPA107VYQ8wZubCfQCB+dCNyKLww2I3JK2uDq2p+BhKzso?=
 =?us-ascii?Q?mUWmrpfNlUaJsNFfOt7IdqXsN5Zc2iyc2pXsVH8CLy6RxqMUqudHo4+2g2ux?=
 =?us-ascii?Q?fK314ccshR3dCuxbzmNXJcLly+4uH4UIjOXk5mG0MLlwLEuoH/XybRxlJsde?=
 =?us-ascii?Q?+B2Ka4tAXCSV6z8lRp0AGoZfS6oSlsh7NaALJcl4PDoBWTFM4ovkWlsAXp4u?=
 =?us-ascii?Q?lDz66vGsAp9HoiYSmEJ3Wj+doxL7VmVRCQKeigRVc0fg9ZaMY0S878BspiC2?=
 =?us-ascii?Q?AnNNptHo31MqFuKVPWx9JYlflYjXw67ripjw9ZLC1uwKygQuj+wScvbp0SkH?=
 =?us-ascii?Q?GjTECr4fTf+e6OAQVXvxPPKwFeaxbcCuP+TxHnoejUTcOPXoSCfXzkCvSnN5?=
 =?us-ascii?Q?CALfKoFG1ymCtJRYiy9hBTe4/8Dnpz9F0T9As25nE7uPEA1yNWQoqN5TQDI7?=
 =?us-ascii?Q?x8C272SLtaPnTuStOgySEYc3eRZz5Tl8OtQP8IyEDUoiopoHslNxnNUaaEG9?=
 =?us-ascii?Q?2EJ0E2ZsKpgtTKz+lPKw/uLk/py8JefiS6G2bJGS1kj9cE7UGHCmbuPCHzi9?=
 =?us-ascii?Q?KgqfWA4BA2ZsL4kcF46Ju9F7/j8WHICeCj/XfPRdEhWYBe8ACDUyqmnPbZJd?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4a5df9-dea0-4a30-4005-08dc842f7a17
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 00:44:22.7632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IdlvYD3d8G1n2u9sFcfMFKQex085YacD/dNRSQcXpVH19fKFTkji60lScLqpzsb6ztFBzVVJIBH+Sburknnfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6731
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

On Mon, Jun 03, 2024 at 09:07:47PM +0200, Michal Wajdeczko wrote:
> This interrupt is enabled by default and there is no need to
> re-enable it as there is no other code in the Xe driver that
> could change this setting.
> 

I agree this is likely the wrong location but also think it is little
unsafe to rely on default values. I recall having to add this in in i915
at one point and without this GuC submission doesn't work. How about
moving it to the IRQ layer plus a comment along the lines of should be
enabled by default but let's be paranoid and set it anyways?

Matt 

> Bspec: 52572
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 086a048876ba..f4d728350694 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -862,9 +862,6 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  			return err;
>  	}
>  
> -	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
> -		      ARAT_EXPIRED_INTRMSK, 0);
> -
>  	err = xe_guc_ct_enable(&guc->ct);
>  	if (err)
>  		return err;
> -- 
> 2.43.0
> 
