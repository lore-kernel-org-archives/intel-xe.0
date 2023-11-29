Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E80C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 16:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360CB10E63A;
	Wed, 29 Nov 2023 16:22:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A2C10E631
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 16:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701274921; x=1732810921;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MJKPwUz2b4hPc2rqLwP50FYZDunJxhcJZ2ox3u8PPT8=;
 b=OKxEyhpj6Iljc5BOUe/+EbYRMx16hD4prumcaVOAhPNXiL65NB1ELpoL
 9hd57wtSeBrKaYp5pwmsDyV5lD5gXySvzH/cxMpcwj0b3VKgbXKgRGYIh
 Z0skyY8DXYJ6y2OoZS4ve643ulQO4RvyjE8pHaOq3F0adCJ9zVsNJNFYU
 4Y6Xpf+6nnhSbTMj1y4WUGlkQTqmaywzKZPN7h+SWl0gARBkxmwseDgUs
 xvTTUMgnibs+sgkc3RUbMfTD0NxDJ5wipyIwaQxhHRecyeAVcw6pqpm+V
 2QMlC/VqQFmzOtWOa2pcIeGozIeQ1VLJgYTVq9JrwpRGiNvWg1zGAszP2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="459683141"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="459683141"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 08:22:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="762371409"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="762371409"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 08:22:00 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:22:00 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:21:59 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 08:21:59 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 08:21:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDzztP868BBXz3cJVmVU7/bexzWs2cuAqLSs9E9cK/UsGjL3u8Fa7nwst7pfIkpFx3BuOHCq+7ysuuP9EuDpWAdCYgVATp3iYXUxI7plJ2yIHJqK6k+moMZvXL5LaYC4it5SrtGeVrPvbWqfuGVrHK+mXdz6iK2HXHezlgGF9MnENfRPi/VG03CzISRDaw2NccI2QoIdaFE5Af44jWIirRZU+dlaxALCK7HNY+13FxOryCL0PdgXqBvRo+KpFsbX96V0Q0BRR4ahQeJ0KgnqiY1ylfElz2byid2Lino/mEEW3eb1XxJRJy0EskbLN0fnk4aLqGK+8n3Azyo2k5Us7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G33AMz10sCniX8vsgnM2tNEy9uCyeLJz1r32ekQ+gkM=;
 b=PIpgRUQ2Q9o293JGdkhTzG7uZfuwz5vR3ZCUFBGGdAkzI2aheTLCsIpSULOJjrWDWaefYEkumrvBuHYAttxxLb/FLfUXrAaxVDLBuc+EPJ4quKgsXk0hsf3RFNCTe19PBEXpIaeEWvkMLsDtutv3R1nzWuILiCJTbdP6DP5Qc5inxTids/sf2IyYCXwI4p2323gRzLUIA6rA1mG063ziKzcbRx0mg7uu+1j0++0McBHfN2NLl92XgQS4tfIe4oNJTkeLna6o55+l+knGMWE1H9T+1dIDozVuTxNteKI5xmlBK4tOvAStqPIL8OQHvFfDpXKX6YS7tXaOOWKQ8CfKXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5131.namprd11.prod.outlook.com (2603:10b6:806:116::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 16:21:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 16:21:58 +0000
Date: Wed, 29 Nov 2023 09:20:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZWcCVidR5/t7gYnv@DUT025-TGLU.fm.intel.com>
References: <20231128203203.1147-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231128203203.1147-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: b26671da-0629-4a7a-4f60-08dbf0f74f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7gJUh6ZfhNANdtRUWoWpwHFVDJZ8qddg58bTvVZ/AkpLSXDaIreAtWtVEcMW7OtwMZTM3qnoQki7vOTfsQSiD77cqFeLRiWMoTti1JJ9t+WJY1Zcp5ey0u+HThO6h9AN8dDVICAdydchSva1vsW4u1YqO6nMx3JkGeIoaRikSzJnRVbZEgXK0QYqQ4M0fByA8GRjXKnQiScMLzIv17MA9m6OCbA8qcusgxc0vNPKmiQUfkuYDaQzwwGBTwGGpbfYLFcui1ZMPQbcJrkMOvxt1gorc1Par/Dksso7kLHy3wOB4nhlL1NI5oC8w1fIvs0JYyJoANF4sIf41fcM39njoEd54YExEXtCPLGpYCHf/FPZDqbwA4I8f9tjvM+Kcvpfojc5M4hBJJ5YyBDbfkyyEsCC1wnL49qh/J6OqtE9rs5F1l0J/OUViX8h9I3aKF4XhwN5iB142QWk2AdifjgPOG3w25g4BrGd2hfj1Pq/8hx+yZ/00Z7aNbPOoC/cceoo6Bs+YaAVvPOzKf24thlGQk76oHkbwmGNzVLjcZVtz025NhoWdme15xmfvSXHQP4i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(316002)(6636002)(6512007)(6506007)(86362001)(6666004)(26005)(478600001)(82960400001)(38100700002)(6486002)(83380400001)(66476007)(5660300002)(66556008)(66946007)(44832011)(2906002)(8936002)(41300700001)(4326008)(6862004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BnF4Z2rI7sQrPCbLjjKLTKlINOYcmxKluWQD/ERv8SKxYv7QOY/84Wk0SCOJ?=
 =?us-ascii?Q?/HWaMldBR/8TWCX8q7CkScseMFcFl04BbOmxBNdGCMT9HzhT4VcHhiGCUGWp?=
 =?us-ascii?Q?ATB0wBMQbfwVIAe6DJYdmM60VO6Qry2tIcEbtE6umqJE3/w4WQj3i0m0IjCC?=
 =?us-ascii?Q?3JermUR4EEJqpjOlJbmISFHNI43wMQ/0e8js/+l9EBRkJSZuqFOykB942uNe?=
 =?us-ascii?Q?YITifJ5mimChhlcPFik3NuOfQDON5BY/yiJetw/YNA7gnE8K4avPt7KXC8oe?=
 =?us-ascii?Q?amkbmRspMFrfBnO8MAQDwUqdGxJs4EgOF03aDRj1Eo1vsufdqJOF1XxlYeRx?=
 =?us-ascii?Q?wcQSwVzpvblMcjUzs2tkOGBaTVyQgbtM/jNmm8bPTmeC808JAYdqTx06Q/Yh?=
 =?us-ascii?Q?aoBuWm2OVfrfYhbUtUzFR8yk0MZXZTNDSHg+15IYU0eS/cVLYpcRrMlLU/7g?=
 =?us-ascii?Q?kraqtB9Jo2DU+SwcpybP7KLcC63iup2ARb9iWKrkqRYj1BsogcBjyAdHw1hc?=
 =?us-ascii?Q?XjhaGaVebhzBId+fQph2h72Gy1OF/zYfbgyyodR+HuGqYWcfDcXtxLXW5OjR?=
 =?us-ascii?Q?kUTlWM9RUns4mop/g/vs7yB0SOUpaogvsLtoXxq1fAyJjGLUU9vXb9nbY8el?=
 =?us-ascii?Q?fIw8g+m8GZjFouXyfenoot+1C5wD+6Y+DiziI3OwV+9XBTZ8LGsSQoTH/Qt4?=
 =?us-ascii?Q?pqVltORrOEbtyYkS02szcRMflGmoO/B3y+umiOzQNWxbuhPUiTLabKIGHGB+?=
 =?us-ascii?Q?qmRUBpcovRYEWuc1xiEp/XpSlwNmEwsEBKoEDJZgAqvy+smSYazeF5seio1y?=
 =?us-ascii?Q?il3FruLEcvsATwLc9R0OnPCCkDlncFciqZykH4fWnZQA63W2ZY8GfwtFwCeG?=
 =?us-ascii?Q?dUV4v55P1j1vWnmb9MDEOEX2027jgqPE7pdY2SByS7Y1JnNZyDwgJjbrY4TY?=
 =?us-ascii?Q?Ug2PEhcICTLbXi8ImKSKtNqeW64bXMCV/PWGr/rcHCObdgayZBEFwowQEj3D?=
 =?us-ascii?Q?Gz3d3kxSI3moCDHwGcHI4QJvfLYwcpRIfyFrOlcBOXg77kdWCwpXIslis+x7?=
 =?us-ascii?Q?DyRalt59w19Rs6N1kejnTYBOobi0OTqVEYT7q403nWYMtbXBqSgVAKxvar1g?=
 =?us-ascii?Q?4wuFSgyx2D0cXbhPaDXrnY/x2A0oq3+J1xi0OyXZA/2tYzq7Si1xoPZnfenT?=
 =?us-ascii?Q?a37gkC4WuCuwFPeYmL99nXuKNdDwybDvcQ5vHGy+ufYTrSPkBoM3wTSZe+fX?=
 =?us-ascii?Q?3Nv8plQ46TeNb5oSu48iOD0TrtDHG9Ba/574szr5CBBfyJIaMZ+qC6DhPBcg?=
 =?us-ascii?Q?lju6OLO5wdDaS15ziEb7MnWkXN5FvNQ86RikVRF+3tuXMaJsEtM9eeMSyysX?=
 =?us-ascii?Q?D3qY+yoArI6d0u4Jf+K/0cUQ5JGN6GmuzQpocGS+RCoCbWRRAJzsuYS93NOg?=
 =?us-ascii?Q?ipIIHnBhysGzdAmQOPY5nvI/1hQdUw0wndHq+0NKDXk1e7UU/80Z4B1zVByd?=
 =?us-ascii?Q?CK1fc5061RZXuunG1mPmGqNS0SgwbHU8V+MIpu30RhZBdh8E2D2tJZftYo6K?=
 =?us-ascii?Q?Crn/NpWwQAwkyuMgrTjDFFPYinOk4yIKN3i9/DQGzuCjbA6C6Yxcek4ezA88?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b26671da-0629-4a7a-4f60-08dbf0f74f3e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 16:21:58.1387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SkVnfycCOXKzbV+OXd/c4j5Afp3PiGEk5brGVdOPHa7ChEyA7N/wYdXcL9m08HujjbsYEhWKJCm1dUB1ygU2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5131
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe/guc: Drop ancient GuC CTB
 definitions
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

On Tue, Nov 28, 2023 at 09:32:01PM +0100, Michal Wajdeczko wrote:
> Those definitions were applicable for old GuC firmwares only.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  .../drm/xe/abi/guc_communication_ctb_abi.h    | 21 -------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> index 41244055cc0c..d34f91002789 100644
> --- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> @@ -165,25 +165,4 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>   * - **flags**, holds various bits to control message handling
>   */
>  
> -/*
> - * Definition of the command transport message header (DW0)
> - *
> - * bit[4..0]	message len (in dwords)
> - * bit[7..5]	reserved
> - * bit[8]	response (G2H only)
> - * bit[8]	write fence to desc (H2G only)
> - * bit[9]	write status to H2G buff (H2G only)
> - * bit[10]	send status back via G2H (H2G only)
> - * bit[15..11]	reserved
> - * bit[31..16]	action code
> - */
> -#define GUC_CT_MSG_LEN_SHIFT			0
> -#define GUC_CT_MSG_LEN_MASK			0x1F
> -#define GUC_CT_MSG_IS_RESPONSE			(1 << 8)
> -#define GUC_CT_MSG_WRITE_FENCE_TO_DESC		(1 << 8)
> -#define GUC_CT_MSG_WRITE_STATUS_TO_BUFF		(1 << 9)
> -#define GUC_CT_MSG_SEND_STATUS			(1 << 10)
> -#define GUC_CT_MSG_ACTION_SHIFT			16
> -#define GUC_CT_MSG_ACTION_MASK			0xFFFF
> -
>  #endif
> -- 
> 2.25.1
> 
