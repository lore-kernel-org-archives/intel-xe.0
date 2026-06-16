Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0E0CD98D2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 20:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF9110E292;
	Tue, 16 Jun 2026 20:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCLBORNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB85310E292
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781642445; x=1813178445;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OWPrdJdfbn0PqzhuId/kS3z4/t/q2dNVTGr/aLrBSrg=;
 b=HCLBORNA+xaOOpbqnlPu1Ba+lJop2u84i5RNstEtvnmHD0Hwx7KN9fcg
 iuozEtk+KHQvHQRHwNzZhThYaeWK39+z3kO19+z0h9G7mHed8oN0eCbin
 XWJk9r2jsOYabpP0sH2vx8RsbTPVYDSjqNOukqGBYZw2OjzHjF0BmY+xX
 IeDchvC31H6FpLZ2Cw7R7jytWhuM/4tBF3bON40g/8q0p719odMOXBulQ
 xrm8EMnC1GaHB7RDgheVzkk0tYC98IN9CzTIqFpNxjopRNnJywgmExV8w
 CJQobd5hp/q4Di1jO9x07+6Pdg2kiUJow0pGtZNCcQVFGEeDOzGRZMp2Q A==;
X-CSE-ConnectionGUID: JaeqKciYRtmNOjYLxtJqcA==
X-CSE-MsgGUID: ahPSlRtZRRGTZBAtHvLoFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82491572"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82491572"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 13:40:44 -0700
X-CSE-ConnectionGUID: HSZmt4ALTLWIJD6ijuUHNA==
X-CSE-MsgGUID: Ah0bWHEbQdemmYIPuaj2Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247960915"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 13:40:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 13:40:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 13:40:43 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 13:40:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7gKWnRqyb1Tdr9GE5m0Kw/bDUJsFW5yW2l9UEhX6XN48XyJ8i8WdfN/mWPZOOB5CoPaQ12Lah4wgSAth5nUGh+5mIfOt9eN03tu/0o1Ke739ndUSEua9Q6fW2qjmU5/rux1HD8COwA19sYmioB/sO+3jc0R6NcghNUn6ZJ0clFUQBwQ8biUOMW9fcXsp6GuwnAs/Stp2Yye7Yjd+Feps2krh32nXvMmn8mnN7DTm0iZM+hnU+w+jJ5c/DxKY/USuknn69QvcnJk7+MWCliN2YLm/oGW2fJon0Q9Sw8LelRhj+ZvPaLFeruV3F7LTeD/AV9pWsVYpG6HzFjpuZsTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQMRTLpQUOM26i5OE+ohFFrBm4lk1LI8sxSOEKwbuYg=;
 b=odEoJtlZTJVYkCyvI9r6IpZs07Us8jhnN2/325Ep9YrwSsgIxPHm2iA174khb9GRX1txk55/Dvmp8sJ0inXrtdDR9x/rzl7AM+UknfclnO2hlgRIptbtgmyKsorZYRM156iT6H7F1QPq9m3GBsmGdfJKsfnhdZ6uy8f+lVo/XX35p+CxMI0EpA0033rhxuTx7tIoORa/EpzUbclPPydWNlh0Asxg8KNMrCxH3vhgsZ83C1GBCjOpS6Hl8y5H/gYZ0sfUlySFl8E6Ir14bDsVy7q6H90bYohsKMQvNuhsX4cX4rvSSo+d3KhjTMMEcLxyBwH+QIuxol3ujSdo0M2QGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7162.namprd11.prod.outlook.com (2603:10b6:303:212::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 20:40:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 20:40:41 +0000
Date: Tue, 16 Jun 2026 13:40:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Message-ID: <ajG0xutNYUxTC+k7@gsse-cloud1.jf.intel.com>
References: <20260613013859.3886196-1-matthew.brost@intel.com>
 <ajGxJEYsYwseO_Oh@nvishwa1-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajGxJEYsYwseO_Oh@nvishwa1-desk>
X-ClientProxiedBy: MW4PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:303:b5::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f8b670-f10d-4e9f-1eb6-08decbe787c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|6133799003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: EgACjIsGxATUJW4e4ANarIjRDyOSKuJhp4Ibvu7A3g0z2acwymVL6AhBCxtLgdHCMdyl3OO8iGPCfd2YtHNKZz0MPyvorjlsD/7xuzG2JiDqFhjyRwaVSBaMTguPXobGlRdBETquGbs8Ct2odSbSmY8XZwzOYPpAv2PYxvGbhu4JXvcjiWxNvBidUwI+KCdliAiSJtIpxF4zgJ0OIC93iSfUI0DaATIENChjXRKJ1alL/hgD622V6Ed3xBIXjuMA64XtPYqNfak8OyRKr0jur7VyHO1NXqKtMOWJbIHXQJ3uuse8DXtROxdSftPPk+7bZIPFOQjHgWXWY5ubQlLcx1IqWNo/ieelWe8EYDsJggUhRj9Sqjp2un1skzy91Fyw5lB0TObit+Wmce8McfShXMEbHsXCjTNJq2StPfK7kexhea5/vBhQmvCcK/8yFE7Y/Dh3Aog+ouMxfOrfCuxaZYG9YnLi6Fnxd0GYl6T89eiKpT3lSZHLOlsO6Tyg6x28OxYSBfH3zZy0WlhAXAUEBA39QQ77u5ZCYyOtqwmCgu9XDUFnqy8P/9ONiiIr87/QhyOgnmv/QDYJ8myGmPJ8gIeh9k/0DnaWTbrRZbGgLU4lajPtH3d9520TPSYCRwS9mKb9C4SHRS+gizhlm57xicjC2HvM6RiFRJzBYahZo+/qTBJhe77zJCkUteDzFckz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFM2N2x4Z0NTV3E4Mk1EQy9XaHAzRnFKTlhBTHlnTnJhSTlXSkJiTG9acVp0?=
 =?utf-8?B?TTRnMDg0STVyVWZFMGlrVURINFRaencvek5VRDlkSkRVazJIOFVJVkljVUk5?=
 =?utf-8?B?cG9vbUpVb1I0cHZPSkVGLytEbEJHRzNlRGZiL1ZmRjYyTU9CUnB1M0oxajVQ?=
 =?utf-8?B?dXVRM2oxRlRhQWNjTThLR1RnTFRZbFQyNU5NbThLeUw3WlpsNmwwV3M5WWhj?=
 =?utf-8?B?VzJTL3VQTTB2SzN2ZFdvdnBqanpIZXJZOXdnbkgzNFRmMTNZVjZ1ZGNWUkVx?=
 =?utf-8?B?VkM5NzR4L2cyRU5wNEp0WXhVdUtIVmNMRWRaSi85REZmd01yN0tEUzJxV0FH?=
 =?utf-8?B?MTJXSzJ2NTRJdFhXR2gvSFQ1WGh3WC9qb2dwQ2JBRlE5M29vNVZwZUNTY2hq?=
 =?utf-8?B?eDMrWHdqOG5vQ1NpTjl5YjFUZnU2c1NOWFlyUHBnOXE4S3czNjg3WmFGYlhm?=
 =?utf-8?B?U1dSc2wrSENybnFzZmo3ZDhrUU5xZ1E4clpmU1g3bnFFUmMyZGt0UXQ5eEJY?=
 =?utf-8?B?RnViSFRNN1FCbHJjc2dOUlJFTFRsV3g0ZEVEWkNHUzQwa0R5Y3IyVEhjSEpx?=
 =?utf-8?B?dS91ZFNWOVdUNkk3aFpFMjV6ZjhuaStoS0h2eitaQjVoUXMzTnI0UytMUlpW?=
 =?utf-8?B?SFZhWjdMS1dpa2c4a1ZnaUJCa0xud1YyenRGY2xHc2gzbXdTSFZUR3NaYVR5?=
 =?utf-8?B?VDE3NVdLWTNWcENlSytCTWVrOUpLOWs3WGpKL0JrbkQ2UXFmSjd6N05hQVBY?=
 =?utf-8?B?RjZ5Y3dRTUdRWDRGSkw4RjBzbXFpR2RVNmpjWU9vdlYrRkN3L3FGdkkyR0tP?=
 =?utf-8?B?cS95cXlEYUtvNGRndkpraXVTa042YU9VSUJLSWFTN2phVll3Y21DQmxSNFgz?=
 =?utf-8?B?OUxWNDIydzcrR25kNU9vbWpqa1FZQ1N3dlQxRThtYXVDM2kyTS85U1NuNWlI?=
 =?utf-8?B?RE1ZSW1IYzdNN0dJYjBEUitFTFFyK21ZZTE4czVvaFNCakM2NG9tOG5tcnRt?=
 =?utf-8?B?RFQvM3BPOGxNcloxK0Z6dmlWTXdnQWI3YUFSTmJYbWd5YTZZdnZTQU4ycloy?=
 =?utf-8?B?d0p1SmhaQkZEbE1FSmNRT1ErTUlJQ1lLUS9aSjFIbm9SY3RkTU1jWGdkOW9i?=
 =?utf-8?B?RUkxNXptYlJtQ3pURjVhamFuNllQdmJBNGpxZUlDTUI5YmdHbTgwOVUyTnJm?=
 =?utf-8?B?aHU4Vlg5VWoyYXc0cE4xM0dZUU84WlJPZmcyNE9aQ3Q5WHdUeHBES3kxandU?=
 =?utf-8?B?YTBLSmQvNW02bmxzYmZwcWdwd0pTSi9XVTF2UzBQTGNTZmU1c3NtL29CZzdp?=
 =?utf-8?B?aW91bi85ellqd1dRQTYyNDU4ZFRWc1ZLTEFYc0cwWTNyOGlGMkxMbzRsd2tl?=
 =?utf-8?B?SlBiOUpOZFM5SVAzNTZaV2l5VDh5bHltaXFyNXZaMTM3c0RUeTB1VzVEd3lt?=
 =?utf-8?B?bys4OGZSUEV6Nm1wUUZIVXBQS1FDWVV1bXl4Y3QyaVgrSmU3QnVxOVRreHZa?=
 =?utf-8?B?b05RR0llUzJYRmxoejl1N1RRdTdhQktmb0RIYjlWeWtoc2dwRFU0RzM1NEJ4?=
 =?utf-8?B?QzVkR2JZWENUU3RBZTVRUktUdGl0SGdqaW0vTjB1cUsxaktPNTFUUitUNHdu?=
 =?utf-8?B?RDJRSEZobjkzU2NJNW5CM2ZEb2RHUzExME15cFBZa2hOWW1Heko3Q0lXeXRv?=
 =?utf-8?B?OUs4UGQyRCtvQU9uVjFzV0NKaW9ROThHd1JhZStmMEYrdi9BZEtmVGhXMXlo?=
 =?utf-8?B?US9iMFZTdDFlMFJVekZONlhGcGRPalhNRVg5SC9lWWE3SWxBZ20wUmtqYlBk?=
 =?utf-8?B?NS9QTzVRcVZVVVU5ZkVNV0wvOEEvNGFOQlNBeUtHOHFBRlhCUERBQVM1SjF5?=
 =?utf-8?B?Y0RuSVlkSDJkWVNIN1NpNnJIdmlMY1RuVDNDZTRFNHA2bzkvOGNWcGtDQXBT?=
 =?utf-8?B?Qy9JRG5UZDlPQ0ZnUVNNMWR6NnVWK25Ec0tYdGs4ZEdQdzJqRUxOVXlYcGw0?=
 =?utf-8?B?UERxRUhnTHUySlN0UmEyYmhjT3o3YUtRc0ROMDNHSGVUT3FTTDkyZS92bEtS?=
 =?utf-8?B?WWNtQmVBb0Q1YnlqMEZMVzhmb080ayt6TVVkc1dOY0xTeTFraGN1ckJEd1k3?=
 =?utf-8?B?bzFDbDg2R2tjWkpEbmdoRnVpTFhRaHpPWjIxbHJMSTBJcWZEb3NvYkNSTmcr?=
 =?utf-8?B?NTdJdEduem1sUFhuMmJhMXhjT1dWc1JoUUtZOU5CWEorZHlyNVoyN2kxMk9k?=
 =?utf-8?B?YS94b0VLS05ORytoRXEvOVErWGV6dE1Ld1puZGpkL3NqL3JuZGtlQkhZQzBu?=
 =?utf-8?B?ZUxud056RG9GeGtMVkFOdGFOZUtpVUY0SG5uYmpHdjdFclZubnBnOFpLcmk3?=
 =?utf-8?Q?u1f6r3srp4euSfHE=3D?=
X-Exchange-RoutingPolicyChecked: mWG0WPKhPhU8XnrjhiNZ3VMZVATF9eVSRWA6vXlGWL+W+xnDakE3o5yTViXlBnVGsWcgfJnk5i8sve/d+UDsNyOCXnniT83f0ej6qvzB7qLtG09/5E24ZmdQcikcmDUZZmwMU9QDgknCzCarzHxNEXuxXBuAPlckJ/0UHjG4DGNO31U+/EOgP6XWDfrjbmXVzCnftwcg293dmFNDfDYyYFLW+nQmb1wbBioI1+Qa1KehUcQsXV0PUf/oFswICscvUJL46coP+XdGjecam/6gkbjG6p5mKIk2ZVtg9WMsA5CSKlN/r8dgKdrq2BNTqI5Y8dUys1sR/ICduLGbqHtDag==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f8b670-f10d-4e9f-1eb6-08decbe787c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 20:40:41.1115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vK7Dnv66j7/CVS6oxVYFTBcD9ggb8hd00WeAAxwZMApGhwUZeOEM4i/IiCr55QxotDqz+9MpblwPWltHZDteaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7162
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

On Tue, Jun 16, 2026 at 01:25:08PM -0700, Niranjana Vishwanathapura wrote:
> On Fri, Jun 12, 2026 at 06:38:59PM -0700, Matthew Brost wrote:
> > When an FD is closed with many exec queues, teardown relies on the TDR
> > path to clean up scheduling. However, the TDR handling is serialized
> > (i.e., only one exec queue is processed at a time), which can make it
> > too slow compared to GuC scheduling activity.
> > 
> > In this window, GuC may continue to schedule contexts backed by
> > invalid page tables, leading to a cascade of CAT errors and repeated
> > engine resets. This significantly increases recovery time and can
> > degrade system stability.
> > 
> > To mitigate this, eagerly disable scheduling by sending a self-message
> > outside of the TDR path. This prevents further scheduling of invalid
> > contexts and avoids the CAT error/reset cascade.
> > 
> > This change improves robustness and reduces recovery latency in
> > multiple queue teardown scenarios.
> > 
> > Cc: Wang Xin <x.wang@intel.com>
> > Cc: Jia Yao <jia.yao@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Tested-by: Jia Yao <jia.yao@intel.com>
> > 
> > ---
> > v3:
> > - Make kill message static tomake reclaim safe (CI)
> > - Do not issue kill messages for queue which bypass cleanup messages
> >   (sashiko)
> > v4:
> > - Add missing message lock
> > ---
> > drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
> > drivers/gpu/drm/xe/xe_guc_submit.c           | 44 ++++++++++++++++++--
> > 2 files changed, 42 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > index e5e53b421f29..247947fd357f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > @@ -31,7 +31,7 @@ struct xe_guc_exec_queue {
> > 	 * a message needs to sent through the GPU scheduler but memory
> > 	 * allocations are not allowed.
> > 	 */
> > -#define MAX_STATIC_MSG_TYPE	3
> > +#define MAX_STATIC_MSG_TYPE	4
> > 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> > 	/** @destroy_async: do final destroy async from this worker */
> > 	struct work_struct destroy_async;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index afe5d99cdd8b..5ec1dca0324c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1875,11 +1875,21 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
> > 	kfree(msg);
> > }
> > 
> > +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg)
> > +{
> > +	struct xe_exec_queue *q = msg->private_data;
> > +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> > +
> > +	if (exec_queue_enabled(primary))
> > +		disable_scheduling(primary, true);
> 
> Can it race against other path that calls disable_scheduling()?
> Worried that if so, it might hit the below assert in disable_scheduling()
> xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> 

No. The TDR when running stops the queue so it can't thread here.

Both TDR and CLEANUP message directly wait pending disable to clear.

> > +}
> > +
> > #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
> > #define SET_SCHED_PROPS			2
> > #define SUSPEND				3
> > #define RESUME				4
> > #define SET_MULTI_QUEUE_PRIORITY	5
> > +#define KILL				6
> > #define OPCODE_MASK	0xf
> > #define MSG_LOCKED	BIT(8)
> > #define MSG_HEAD	BIT(9)
> > @@ -1906,6 +1916,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
> > 	case SET_MULTI_QUEUE_PRIORITY:
> > 		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
> > 		break;
> > +	case KILL:
> > +		__guc_exec_queue_process_msg_kill(msg);
> > +		break;
> > 	default:
> > 		XE_WARN_ON("Unknown message type");
> > 	}
> > @@ -2018,11 +2031,39 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> > 	return err;
> > }
> > 
> > +static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> > +				       struct xe_sched_msg *msg,
> > +				       u32 opcode);
> > +
> > +#define STATIC_MSG_CLEANUP	0
> > +#define STATIC_MSG_SUSPEND	1
> > +#define STATIC_MSG_RESUME	2
> > +#define STATIC_MSG_KILL		3
> > static void guc_exec_queue_kill(struct xe_exec_queue *q)
> > {
> > +	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL;
> > +
> > 	trace_xe_exec_queue_kill(q);
> > 	set_exec_queue_killed(q);
> > 	__suspend_fence_signal(q);
> > +
> > +	/*
> > +	 * We eagerly send a message to ourselves to disable scheduling, as the
> > +	 * TDR is serialized (i.e., only one exec queue is processed at a time).
> > +	 * If an FD is closed with many exec queues, the TDR can be slower than
> > +	 * the GuC scheduling contexts with invalid page tables, creating a
> > +	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
> > +	 * this by immediately disabling scheduling outside of the TDR.
> > +	 */
> > +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) &&
> > +	    kref_read(&q->refcount) && !exec_queue_wedged(q)) {
> > +		struct xe_gpu_scheduler *sched = &q->guc->sched;
> > +
> > +		xe_sched_msg_lock(sched);
> > +		guc_exec_queue_try_add_msg(q, msg, KILL);
> > +		xe_sched_msg_unlock(sched);
> 
> Given we are adding a message here, do you think it will help if we do
> something like below in xe_file_close()?
> 
> - xe_exec_queue_kill() all queues
> - Flush work_process_msg for all queues

After thinking about the above, implementing xe_exec_queue_kill_sync()
is actually trivial, given that we already have the mechanism to wait on
pending disable in place.

If we go this route, the logic would be:
for_each_queue
        xe_exec_queue_kill

for_each_queue
        xe_exec_queue_kill_sync
        xe_exec_queue_put

I think this would make everyone happy, as there has been a lot of
internal pushback on allowing the device to take CAT errors on FD close.
In the worst-case scenario, blocking here would be preemption_timeout
(set to 1 µs) multiplied by the number of physical engine instances, or
the GuC time to reset a queue multiplied by the number of physical
engine instances.

My mistake for pushing back so much internally—this seems viable to me,
as it fits in with concepts that already exist.

I also need to double-check VF migration to ensure I didn’t break
anything in the patch.

Matt

> - xe_exec_queue_put() all queues
> 
> I know it is not suffecient as GuC may not have processed the messages
> yet. But it is something we can ensure has happened before we release
> queue reference?
> 
> Niranjana
> 
> > +	}
> > +
> > 	xe_guc_exec_queue_trigger_cleanup(q);
> > }
> > 
> > @@ -2066,9 +2107,6 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> > 	return true;
> > }
> > 
> > -#define STATIC_MSG_CLEANUP	0
> > -#define STATIC_MSG_SUSPEND	1
> > -#define STATIC_MSG_RESUME	2
> > static void guc_exec_queue_destroy(struct xe_exec_queue *q)
> > {
> > 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
> > -- 
> > 2.34.1
> > 
