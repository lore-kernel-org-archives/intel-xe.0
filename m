Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D5F606A333
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 17:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gl9WQjB4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA85210E687;
	Wed,  4 Nov 2026 17:06:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4090710E86F
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793812003; x=1825348003;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lzTHyATbN4L/+WcO+5iOgqbRusVMuawPVxV5UeDVN64=;
 b=gl9WQjB4db0vyoyLvNL6VrFu3cwzqE6YHk9/v78XnCTnsutok5l1YtRJ
 WGscW052kqDZ27Oa/6oBsLmwiHeUNRDuMSnkXDdmJzW+MPeS6FVcvTGpC
 d2le4STtn7H36No3Jg0iejVhRxIrcDUArXrzd9VMZ77Xuf1gCbKYiCiez
 apWsoTTAg8XI8Omr9HKA/xPvcr/rLf9MDhzQ6D2chBc5LHrooOweunSe6
 XO/B4yeVmmmscWdOkNmFqC9ZTkCWA1lJydv2LoR1/dKFhN3eNWqXyZqJw
 PNXQr3mg4I3E3KpyKDs97r/Q6hAfMlujjStqYihhmMQuWSxMgHcRo9ES+ w==;
X-CSE-ConnectionGUID: 4Hgyr4+KTf2Lj+Cb/RT8lg==
X-CSE-MsgGUID: qlBz3mH9RKC+N5VIMf++TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2459890"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2459890"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 09:06:42 -0800
X-CSE-ConnectionGUID: jCKshpDGTcmVDzYzglTRcA==
X-CSE-MsgGUID: m06OcLnVRLmdccQ8qy9Ibg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6629456"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 09:06:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 09:06:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 09:06:41 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 09:06:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDxRkmUNsfPa4ReFsG5VOwurKEO4RNO3uRp9E/zic1f3bXZ5T7n5pOWarclq0HSe5tCh6MnV+mZXllAo9GFnzFh2dpbaNd4+1oSSKEJUPTc6/aaFtMh2RsLPmetztdHHVybwbbFxvA5AkJ62aPbVJfUH888jauCVrLBjUcX5DE4NO/jYvqynefnDDaHxLtsYjK5FDOiy5qs4FMMwKNSTNMKU8xB0RJzW4n7AzeZ+pqByz/yEyAuW23nhIlzJ1fW+QJ0H30sFUPObJFkRjMix5oi4F69BuyYCumFMhRDxI0XElNEuB9gvb8lDfWIrBOU/H0xqQjj6baJ/rJIIvc6L4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q17x+rvH1wc94SQh2+pVRWHB4CTrFh0eUoedqlXjKO0=;
 b=p+9Vo4MfK8yV4hK6k3AmsVKVvv5nieZoM63TPvf09KDL/IipwX8/a3QCqJDdvDBwlrAKYpb2Ci37f+pNJ7ZRfXFIS2LBxN0CCWPUWJnRvHJatpzX5nb2sfAXjJke9L9s39FKZD64J5+uWkGrd2thOBfakmD9WSjwNjM/FWOzVjGJHkOElBEjj2vV+hGl3l5MO/Ifn5XxYfoqRQBtk+1lLShk5M+/u3GazpiLA54YXhuD+gou+cqnnyM3ivRJ8PE0v5fpVQ+B80+wZLxw5UXXCGhSqNLXCjzzLuTiAt6x9KurW3+uWpMewZ5ZQ0hwkJllrEuDmGwh029dN9WLQ4X58g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by IA0PR11MB8355.namprd11.prod.outlook.com
 (2603:10b6:208:480::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 17:06:39 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::4fa4:138e:7455:9384]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::4fa4:138e:7455:9384%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 17:06:38 +0000
Date: Wed, 4 Nov 2026 09:06:35 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 05/10] drm/xe: Bail from adjust_idledly() if no
 applicable workaround
Message-ID: <20261104170635.GA38841@msatwood-mobl>
References: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
 <20261030-wa_16031259911-v2-5-919fa1c27070@intel.com>
 <auiH9H2NZGsRZCht@bvivekan-mobl1> <8733tiq9nb.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8733tiq9nb.fsf@intel.com>
X-ClientProxiedBy: PH0PR07CA0065.namprd07.prod.outlook.com
 (2603:10b6:510:f::10) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|IA0PR11MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 160cf6b8-b4f0-4f8a-a2a0-08df3a95fd7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|23010399003|366016|261022105027099003|261021123027099003|260925022911599003|260925021911599003|260925021311599003|11063799006|261021121427099003|4143699003|56012099006|261009223027099003|261026121527099003|261102123227099003|261028144727099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WPeDZAkHvHaMdNy8W+3DzWGba2OWZCNalBgK40Cw1+haYlNNY+Sc+UgBj2X7mPa5WrCuGqHNvsZZ3UsdKH9eQ2df7D7qJXOf+eNZaZwPCA89YJM6fFczx203FL5bat5wcTZWJoPSSMWfEQiuHNoQ9ZEwjNnxBFL80RalcQHxz57zOLtwR83aqkswFSc+0DirR4B9Qdy1jUL4iL6vj+xCMfSoZAQvrec8Bdr7UWP3eQdgOwT78RHRdK1VrMpTZQZsBkoLoeuc4U2zfj39uRbVluDADwsfS0zoZRcWPvAesCAjapRlQubN30YD1emQCxVzyxrmDCxe6Kvr0zOXkyI0fGQCKmynDLPV4TGJLclBdblsKBkLdyIEpdaoLmtj8r0ZMp3VaxVppcWCOA/rxUeiytc2N6YTbZG0S27fJE0zjhysAwHniFNVqqsb3BqMT1U7mwu/g3U1qlFTgOviOedceAaJzIiN1spBF6PrmWnjD8d7nxggCjq96uWiImtpJ1IspWdMw1ahgTPzskfy69Aljlkysm4b/xWeztx0hipgC8CiJtQzrOvqXKe3ApB0+fRZZ8Bkfe29MfLl5ABVQNnlewDjfoCZA7wvfAvaVKISnILHGfRVTsnDxm86glH6usK4HJW/SI0mXtI8b/NCOUMEr8INSvRuwVE/R5B/Q13Ng4I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(23010399003)(366016)(261022105027099003)(261021123027099003)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(261021121427099003)(4143699003)(56012099006)(261009223027099003)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aR5goZYFNk6Gg5+ur4KQ0GAeLQyt4V99PIVCBfI1ZULfJ1vfoB6gdUPymThL?=
 =?us-ascii?Q?r43BSYgVkg/rmLAFVgOwMqkxhZ7v5SkVCXtuaMGOJPJbHs+yrDSobObwHYup?=
 =?us-ascii?Q?XazpjXgtvSjpB7TdhnnglDIdb27v6MrqVaPvLWE3JQZCN6oHmkvLE3U7SZ62?=
 =?us-ascii?Q?8ul6uHxICZLzVgT771O6qISOqn3mo4Keq5SNK/g4s6JNqpOcR4LFrj36ONcs?=
 =?us-ascii?Q?K5Zs6BNrZW9TSHeTA1wypbiLEqqM3Lh+rC2J4ZXaqwispRMIp5KcoPTLiWsq?=
 =?us-ascii?Q?cKpvMrNGG8j8s0fGEvmUf5rr7mgTF6JHaUVU5IQwNnPlpd+CnV21mayn+hu2?=
 =?us-ascii?Q?57H+n8Ps7SgQ60i9rXK1cmcLcswCD5GJn19s+G7BIfNRoeIOOT2t+JCe4ILQ?=
 =?us-ascii?Q?wvSGGXvHhOWz9tFw+0yVykVQ1ke9K9kys1FHZLXWGW8YZ4L1ZkjKZm8esHYf?=
 =?us-ascii?Q?YbJMwiGKi0+pjl7FGA8QgEVtWsEr2uPB18HCmGDu/p/kZpdgwiyd+7Wr4Fog?=
 =?us-ascii?Q?Vcv079EF/F7Nqkqht9pwPkuyfdKJg/GipFHTlbnMPXo//pHwpWh+LDjYEkZ5?=
 =?us-ascii?Q?8kBvHsn5pv+jsyfqCh/aOYa0vGV9h1rK3gMlz1/h+54DPTHMmsL/GTnOodha?=
 =?us-ascii?Q?wO1dPWgptRJcWvk2WApDSM8M/JhPjfECVSJBlVF/KAKLOzpfpU5Rh0HA5tfa?=
 =?us-ascii?Q?E8UI/+IjWTHeXLxAbeq35dzkqNPDlRDJkaJL0LbnFFU5uM7My4I7sR20VURv?=
 =?us-ascii?Q?wYogikS0hUeBB9gUJTZ30ELrgUp6uKXxDYg2eRauW1FacLomuI537awgu9sn?=
 =?us-ascii?Q?3k8XcL9cj2Q9REZQJwiSwsWZacnR/wJISyjAqmyz6FBrTVkBIKF//4EWX/Nm?=
 =?us-ascii?Q?uW5reCEkP/9wZSidyil3Ld71fM2spIUXZk0HxcgQXAUt7xGSLXYUqWXA57GM?=
 =?us-ascii?Q?sqfxIALM7E5MnC0x1ghH/L/j3XcEC2jYn+0tTwsUAB2yDXgoSTd3Z5RLypQC?=
 =?us-ascii?Q?a5ioySF3bnR+gjosnpl/Y6eqON7xh4pme789QhwhTo6AqfiH0MZseZpamGFM?=
 =?us-ascii?Q?uDCfYTS0nJAkQmYs9fXyGeQR0AuFUj0qz5Z/kLYOYy6H++otEBkt7kUqouRV?=
 =?us-ascii?Q?vWd/lNrdza2T2WEHnr8NEs6Ra8th+Vf/3zhyyyI49ByulAd1zwlWSBp3WrlH?=
 =?us-ascii?Q?7Vb/eGHH012PRnDQqIf1fKKLX05aUf/C7P4LZAb+iuE0U/+39yGTWf2BtImP?=
 =?us-ascii?Q?5CX9/mplmRf0YrGsXVoH/R9Pl53VzXflHuvNEYdzBqU1zT4mtHDm20esxXyE?=
 =?us-ascii?Q?x36gr56horKs/c4PIVQFue6xQ/TznGBRlz0erh6j5qs3ksntRhv3oGjaBrAG?=
 =?us-ascii?Q?ZNCWv5AZHj3C3klcYAbrhKx87oD+nmQI+vXGTWQ0EVTleMPFPqzpVcZm73sQ?=
 =?us-ascii?Q?W90nDOjvbBP7UtqpZp8cbR3ijUq3mFEPpNNWBjD/XDEdgegqyhdvx4AgJOYy?=
 =?us-ascii?Q?4Xdi9PardcZMeMPv8opfO6ndyQ2F2BlpxXTmQ9XQii6j+fdEcwON37XSwuM8?=
 =?us-ascii?Q?FwG7ESiYe2ObVBKah4enwf2lxiq5tqYfkCu359Awq6klpuQpfRn06AEWtzzN?=
 =?us-ascii?Q?q2LnshqWDXBtHknIf1lRBDH7rxq8mi1bMFMjvctflZy2FySLOrj6CbvA0fFi?=
 =?us-ascii?Q?hifky81dSoeZ1kOl4TPttY9MTOVUYXreqA/z2GLj2SsHnAKj3kHC56Q/WGwH?=
 =?us-ascii?Q?jF7wWOh3Bg7KmQx54t0xTtg6uGPDHcHF7mN9nC6jM9Lwnmn/qOslBZ5GpD3F?=
X-MS-Exchange-AntiSpam-MessageData-1: /A5G3eVKhLQQX/rBqYZmYSpH4BiFp+PRS4Y=
X-Exchange-RoutingPolicyChecked: XL8TqikCG9yaIqgoQqvbKXQzpo5FUnTrwysxUg2NdZu4eFrc9hhA972kgu4rhPCYSfXbRLyCTyXcVIlc20pXRoYcyRfXiZWuOqRjA0ufQ2+cwZgCKGCb59yUlnsgxdzWHFxzpHrZ6cuboMDIGAqwCX+gKOnnh6WliUR9CuqpgHIpVii0E0NQHvO3IZgJh31do6emXIMSfpYeGoVu8Ng/v3bf5Byq3ngMWNa6ZfFOpuEhWPWwqqZWaZGXEFZpFP5dpRb6oJIIMONCOlYkFmWNMO703hGXHQh350aBU4q2QNhcMyVlgetqkcvnbuwb5sp2DF2fzkwrCXS9mdfYr5YJbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 160cf6b8-b4f0-4f8a-a2a0-08df3a95fd7b
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 17:06:38.8827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+F9ZbpNLow3tXl1U0qD3Ex/c3h7OJkrd/Opu25l0+k+wfusVk27AMrIGlnlEuwVl3vz5OCISikd5lvAgB36elBKAiWOUAkc2pUpxAONGk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8355
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

On Tue, Nov 03, 2026 at 11:20:24AM -0300, Gustavo Sousa wrote:
> "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
> writes:
> 
> > On 30.10.2026 19:57, Gustavo Sousa wrote:
> >> Re-organize adjust_idledly() so that we return and avoid touching the
> >> hardware if no applicable workaround was found.
> >> 
> >> Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_hw_engine.c | 32 +++++++++++++++++++-------------
> >>  1 file changed, 19 insertions(+), 13 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> index 01a7baf061eb..32d33c70e7f4 100644
> >> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> >> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> @@ -605,7 +605,7 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
> >>  	u64 idledly_ps, idledly_hw_ps;
> >>  	u64 min_idledly_ps = 0;
> >>  	u64 max_idledly_ps = -1;
> >> -	bool inhibit_switch = false;
> >> +	bool clear_inhibit_switch = false;
> >>  	bool wa_applied = false;
> >>  
> >>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> >> @@ -616,12 +616,6 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
> >>  		if (!idledly_units_ps)
> >>  			return;
> >>  
> >> -		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> >> -		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> >> -		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> >> -		idledly_ps = idledly * idledly_units_ps;
> >> -		idledly_hw_ps = idledly_ps;
> >> -
> >>  		if (XE_GT_WA(gt, 14025941587))
> >>  			min_idledly_ps = max(min_idledly_ps, 5000000);
> >>  
> >> @@ -633,13 +627,24 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
> >>  					       max_idledly_ps,
> >>  					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
> >>  
> >> -			/* Clear the inhibit switch without disturbing a valid delay. */
> >> -			if (inhibit_switch) {
> >> -				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> >> -				wa_applied = true;
> >> -			}
> >> +			clear_inhibit_switch = true;
> >>  		}
> >>  
> >> +		/* No applicable workaround found. */
> >> +		if (min_idledly_ps == 0 && max_idledly_ps == -1 && !clear_inhibit_switch)
> >> +			return;
> >
> > We can skip the check for "max_idledly_ps == -1".
> 
> You say that because of the "!clear_inhibit_switch" check?
> 
> If so, I would prefer that we keep the check so that we do not tie the
> maximum idle delay with the clear_inhibit_switch flag.  It is true that
> today the only workaround that defines a maximum idle delay also sets
> clear_inhibit_switch, but I think we should make the logic treat those
> two things orthogonally, like it is already being done below.
> 
> >
> > Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> Thanks! :-)
> 
> Let me know if I can go ahead with you r-b on the patch as-is; or if you
> prefer to further discuss this.
> 
> --
I agree with Gustavo here, please keep in the check. With that
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Gustavo Sousa
> 
> >
> > Regards,
> > Bala
> >
> >> +
> >> +		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> >> +
> >> +		if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED) {
> >> +			idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> >> +			wa_applied = true;
> >> +		}
> >> +
> >> +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> >> +		idledly_ps = idledly * idledly_units_ps;
> >> +		idledly_hw_ps = idledly_ps;
> >> +
> >>  		/*
> >>  		 * min_idledly_ps is applied before max_idledly_ps, which takes
> >>  		 * priority if the two ever conflict (not expected in practice).
> >> @@ -671,7 +676,8 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
> >>  
> >>  			xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
> >>  				  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
> >> -				  !!inhibit_switch, gt->info.timestamp_base);
> >> +				  !!(idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED),
> >> +				  gt->info.timestamp_base);
> >>  			xe_mmio_write32(&gt->mmio,
> >>  					RING_IDLEDLY(hwe->mmio_base),
> >>  					idledly_reg_val);
> >> 
> >> -- 
> >> 2.56.0
> >> 
