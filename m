Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DF6CDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 20:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1DC10E1F4;
	Wed, 11 Oct 2023 20:07:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FEF10E1F4
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697054874; x=1728590874;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GlvU/9KxcDR117R9MFr9CZ3JymwRkqSRYVd2k7JkymU=;
 b=bl9cpc6nbUPOUH+4WgE6WVf/W0YPwA/ndyCyMEDRoOWwjBUPS3OJ1G4i
 PP2EteAj7oqAzFqqY3LadskAJOMvjeJ6OzC4PbsrvNpIrbHMXW1ySRQRi
 pCak4+VJfzf2dXdp80KNoOvXcK7Bq/7nOhMTW8rxD0UN8fQwSpPZax9p5
 rGD+hqrCqxQPAnq2T7ZaFAUvB0YfMpY69wjr0QlJ5SuDlDq8Wfy8HdwHM
 /XktOeRSiUmSLkZsMe3Bqov4Td5GVQ9T08pRTAQjaH+HLhmv1OoV7N82f
 74031s9TY35zk/oTbzj2zz2cK+Vc1CS19Bs3ls84vIn8SF+K7yPkkfVog g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6314378"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="6314378"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 13:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="877819893"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="877819893"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 13:07:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 13:07:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 13:07:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 13:07:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 13:07:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDIKenWzGqDVNltj5LF8VdQ66vn9qs8r9Gd1i900/mCios34pSLc+nJNVollZPZnwUrmRRCNj/2Nt5fM1QI/7lDV0iDC9OYIa4criEjBcndUHs2qzgsKErZOAhHcPXi+Z2llUPMeX651gnQkCOA5dgNwBI9Ukka8hbync5uqPIFwpsDUl+Ducjt4/tiShOl3yt9s9TtRDDYT5SQN/Zk/QP3KQctU2XtkHZ6fkPGJl6QfEaX4XK+s1P9+Ep+z9EoXMLeqahyPOI0vzGgWzq0e+VA3BUnGl6wBIO6tFw6S5ZrXdn2wflgf3DIPC81bCa0xcblqfZw+nTfJGOKVHTYC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79wKYUJjnxBJiEwVvnC7NWHpFY1lzMgc2JfdW1E6jAw=;
 b=W3s2IlyDPDTtLcKX75pfOSxOLCaUnxjuVDEq67p/ojNJsU5Qx2PyFKcixjkM4uge38eiYajKCXxQzyB4zp4s9T2tyP6jUIjI/CIo7wFw8kYfPW63ZXGNJil1nXzVh81tsIcUJ0cnylZM6pynPnoF0Kx7TH39giGqaKixgRzdVhpv/6hfqN1dvj2YhY/X9qdbuELS8XeQLBm6I9jSHAyEf9EZfamNYAlbs70GHZ3phO6AjMAULy2oEaFHPHKiRaBjBaiD6cf7Lvb2LoISIVIq5aNaq9VvZTZSGwyECx2gu9uIwPrITQPBDLxXb4mCU5a1a/mzOrjkbRdYrOVfhorZGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 20:07:50 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5%6]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 20:07:50 +0000
Message-ID: <c64733c1-9472-4308-89c3-43feccc32976@intel.com>
Date: Wed, 11 Oct 2023 13:07:47 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231011135926.7-1-francois.dugast@intel.com>
 <20231011135926.7-5-francois.dugast@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231011135926.7-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0308.namprd04.prod.outlook.com
 (2603:10b6:303:82::13) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: dada3cfb-ed70-436e-fdbd-08dbca95beb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v7GSscku09npbYXIxHj1WCVN4JxW3BoLT8DAtjS3qqiNjnihL66HKsvWyqvFmxQm/6Lbepig7crdHzTTjKBSopB2s2wchvknlD16gAWBC4Ugf6uNbl4BG7qLPQf19MKPVwJRFE+rOQ/EB6H4dwHbFDJgjvgn3s3LI2ZdKOK/IFD2mFZ+ySCzakM4Ct596og4lamZyKxt98Tuhok9LqHY/nn/oCRyndBTbTi/V/icN5wANfO0YSjeHOJaRXKND9GOul66oZz9mAmDSC1i7aOzIFJR3yrkmmkb2953PXfshUCJG/Sl0BVHZHwFm+J1jqvAjHJ5XicIZo0/uDB+XWLVz1AuWZ3onT0iQi+ifm0gmQt2n21TjyHULka2//tPzUp0J1rdHilWHMHzG6Vwyr6KSAYGHpjg1NwC2CQBfTKKKgratNSJprT7e4k3MAHE7dSS/vaGrnWNAPjndM0isXUeLat0Cts36ssv6v7VvJ+ihR5184Qhu8HtxmTgI0h/oXUvDjah0lZGzWcGAV+658mIANOnv9hCpGVujHowuKaJ07dFdU88zQsoWQVPDOetE0BjF5m7dhRjOTjgXvOSPoxkPsEEdLoFxhZOh94xo/i5wL1VEZFgnICedN+5+6WyBnXsZKKq1cwWEPtbdenKhKdFWpYgUsOVLN60ghCzt+YaYoc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(83380400001)(107886003)(6666004)(36756003)(31686004)(478600001)(53546011)(6512007)(6506007)(38100700002)(66556008)(966005)(6486002)(26005)(2616005)(66476007)(66946007)(316002)(8936002)(41300700001)(4326008)(8676002)(5660300002)(2906002)(82960400001)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHBURkMwSytDK1NvamxXSzVIa2VtK0c1K1N1WldYOFViM1JCdE5GWDFmQXox?=
 =?utf-8?B?Q0Z3VlFKeUVrNTlWMFcwSmVYaHNzSU02T2dLU1VZZzRRNThqM3ZJNkdCVStW?=
 =?utf-8?B?QWloRzlXa0ZmYi9TN2tSL2FneWNJODVISk1VbXVjYmJZYW9YaVp4M1ZTNmhz?=
 =?utf-8?B?ZnlOSVphZ2pBdW0vR2ZkdC9PK3RLOFZ1MmVhWElkUUtqVjJrSUJCVkhRamha?=
 =?utf-8?B?dmoxcUNHdjRCQnNnandoZm1rOEJDREhOUitwTUhaWE5PSVVPeGkxVndIaXQr?=
 =?utf-8?B?VW5QYS94QzhneDQzbGpHeTFwMSsvZmdJOWVOczdVb2U0YWorRmtBaDEvREZi?=
 =?utf-8?B?VnVsanFaM2d0cHVaOXdBdG9CQ3NYWkZ1R1NoS2hKT2hWTWxtb1QzQXBzazZ1?=
 =?utf-8?B?bXBZRmt3d3BoT1Frb3Z5cFMyQ3VEMkx0UExwY1JpaTNKNHNsR3ArNjNoOWl2?=
 =?utf-8?B?UzZLdi9OS2tXc255eTl2bTBkeUJRMU0vMkdaN1RObkFDQk04RWFVdkJBSGlB?=
 =?utf-8?B?TERta3RPVlFXSG9IS2FUaFJiTlY3S2FST3JyZWFwN3E0NjNWTFpwb1dtbWtv?=
 =?utf-8?B?ajhIbFVndXhyS0ZPYkZibWh6TDFvYkRvNkcvUEJPT2MzRUFERVpUL1R5WXFl?=
 =?utf-8?B?TWxnYWh0T0F0QU5EdzFZTzFCM2xPNG5naVpPdFpyZFJkOVUrQk9RUGw2WDkz?=
 =?utf-8?B?QStldXNWdWRROWpwVVNOVEtzdjVOL0dubjAxTDNBeTBZN0dlM2lONnlJZVpq?=
 =?utf-8?B?Z2NuUTBudDJRY0NWeWlkU2NxM3UyZDNnU3pWRUxKWS93VXh6VXlXWTNrZVg4?=
 =?utf-8?B?cHh6V2Zpc3NKaE9wYzZqaEFyeVZ3a3pkdmlMQ1BSOWY1clNPR1p4Y1Q0MVVB?=
 =?utf-8?B?TUVpV0UzRm5JeExrTWRpYnNaejN4dmh1dG5KRUNBajNPRjVHWGFkYlc5WlI0?=
 =?utf-8?B?VEtwWFlFMjVrbFBEaHVna1RtWnZLUVlYQUZrUk11dWJVWFJWVnZQWDlQWS9Y?=
 =?utf-8?B?dFhZWTFFMGVzelJNMzBWd1BrSmhWS1VoSW9iMDdKdHNaYlREdFhteFlCV3dq?=
 =?utf-8?B?WVhUQUFZamoyZFdqY3VlVEF1azBHRUhFZHZIQ3ZmRmFPUkhIbkpGSVY3MG0r?=
 =?utf-8?B?Q0F0NHJKd0JBUXk3L21uMHh3T0tiRklZRlpBVE5obklBTTJ4TkIzL2tYR2F1?=
 =?utf-8?B?S3kyOVd6dFROSkhQa2NTR1JEZ3BNNmRTZnBHcDJidTVzZ3pLWis1U2dhSk11?=
 =?utf-8?B?alhJSjJBOGZIb1QzT1p5Vm1RZVJQQ3ZlaHgrc1V2U0tQTEFzbEpDem41Z29q?=
 =?utf-8?B?ejF1VlRhQ0tCUjVLZTdoT2xQY2tqSTBJNDNKd29jRmcwVGRmQk9NQkdxNnYz?=
 =?utf-8?B?L0RDK2hQRjBaKzZwWjNTWFJrNW9OZk9Pd3A1TUhGZmRKQTFpVnNuZWoyOWJE?=
 =?utf-8?B?YjkwZ0s2Q0R3cEE2bjZlQU9HWWV3YXd1YXY5TVpTc0JncUdDa0k2aU15MXNk?=
 =?utf-8?B?TzE5SWxWWGdReVJPNFJBSmVncW9IUjQyYWdrdEZINFlGOWVQTlMvOVlaUVpw?=
 =?utf-8?B?ejVPUnFxRzB0SG9oNTNBRGJsdVBBMlhMK0szVlYyQTBxQzM2L1MxdFJSMXlS?=
 =?utf-8?B?WGNMN2p6OERlRmh3WGlJMy9tc1lMN3Z6MnZNREt3WjlQQ3YxM0s3K0RhYm50?=
 =?utf-8?B?QTVzQVZQcXNJUG9kaXhOYzRUMXlob3NMM21DcVVyZlladUQ2RW9Kd1BWQ1Yr?=
 =?utf-8?B?cmg4V0lyZXpBTzVlT2pUVDNTNTRkUkY0NUhNcDRBNXVaU3N1bjNPWWRCUWJD?=
 =?utf-8?B?YTU5TmtXb002Y29hUis2VHE0dHVaTEVEN2NBeDZ1MUMyRHkvOVVjSG55WnB5?=
 =?utf-8?B?STdEaDg5UTRUeVd2QW1jTk96QlZ2YzdIWkhLOFpFYzJmZXBNem40UTFmaE9i?=
 =?utf-8?B?clFjWkxPNnlRU290dHN4QXpBOWwyWk9nWVYrL0hEWWJTSGMxNVZRRVI3cU1D?=
 =?utf-8?B?bWRqRk51aENqS2tEanNXRDQvWXpqR0QyYnVmMWJodHdMQ0RPU1pCN3BWcis5?=
 =?utf-8?B?MFllcEM1TlJiRnRDLy9zNCtTYVU0TWgySXBnSCtZNHM2Y2R5a0Q5d3NMN05P?=
 =?utf-8?B?Z2g4VHl6S05IL085NXczMERZRi9NS3lNYU1iMUVrL29ZUXR4UFN0N2tlT2xV?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dada3cfb-ed70-436e-fdbd-08dbca95beb2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 20:07:50.6985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTRq9s5W6+4CQpix30UycMRSMsXONMP95XSWGm+zhTda+FEfQumnbFd0FK/o8Y1w6ipwNvJG0PolfTHG/4mZY/lcrFzktSR3mOAUCghvJro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v1 04/17] drm/xe: Add uAPI to query
 micro-controler firmware version
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

On 10/11/2023 06:59, Francois Dugast wrote:
> From: José Roberto de Souza <jose.souza@intel.com>
>
> Due to a bug in GuC firmware, Mesa can't enable by default the usage of
> compute engines in DG2 and newer.
>
> A new GuC firmware fixed the issue but until now there was no way
> for Mesa to know if KMD was running with the fixed GuC version or not,
> so this uAPI is required.
>
> It may be expanded in future to query other firmware versions too.
>
> More information: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661
> Mesa usage: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233
>
> v2:
> - changed to submission version
> - added branch version to be future proof
> - checking if pads and reserved are zero
>
> v3:
> - add braces around case XE_QUERY_UC_TYPE_GUC to make CI happy
>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 41 +++++++++++++++++++++++++++++++++++
>   include/uapi/drm/xe_drm.h     | 31 ++++++++++++++++++++++++++
>   2 files changed, 72 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 10b9878ec95a..efbcf2ef436e 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -498,6 +498,46 @@ static int query_gt_topology(struct xe_device *xe,
>   	return 0;
>   }
>   
> +static int
> +query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
> +{
> +	struct drm_xe_query_uc_fw_version __user *query_ptr = u64_to_user_ptr(query->data);
> +	size_t size = sizeof(struct drm_xe_query_uc_fw_version);
> +	struct drm_xe_query_uc_fw_version resp;
> +
> +	if (query->size == 0) {
> +		query->size = size;
> +		return 0;
> +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> +		return -EINVAL;
> +	}
> +
> +	if (copy_from_user(&resp, query_ptr, size))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, resp.pad || resp.pad2 || resp.reserved))
> +		return -EINVAL;
> +
> +	switch (resp.uc_type) {
> +	case XE_QUERY_UC_TYPE_GUC: {
> +		struct xe_guc *guc = &xe->tiles[0].primary_gt->uc.guc;
> +
> +		resp.major_ver = guc->submission_state.version.major;
> +		resp.minor_ver = guc->submission_state.version.minor;
> +		resp.patch_ver = guc->submission_state.version.patch;
> +		resp.branch_ver = 0;
> +		break;
> +	}
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (copy_to_user(query_ptr, &resp, size))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   static int (* const xe_query_funcs[])(struct xe_device *xe,
>   				      struct drm_xe_device_query *query) = {
>   	query_engines,
> @@ -507,6 +547,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>   	query_hwconfig,
>   	query_gt_topology,
>   	query_engine_cycles,
> +	query_uc_fw_version,
>   };
>   
>   int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 47d2d0468339..f7ca52aba79b 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -466,6 +466,36 @@ struct drm_xe_query_topology_mask {
>   	__u8 mask[];
>   };
>   
> +/**
> + * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
> + *
> + * Given a uc_type this will return the major, minor, patch and branch version
> + * of the micro-controller firmware.
> + */
> +struct drm_xe_query_uc_fw_version {
> +	/** @uc: The micro-controller type to query firmware version */
> +#define XE_QUERY_UC_TYPE_GUC 0
I thought it was agreed to use TYPE_GUC_SUBMISSION to differentiate from 
the file version which may need to be added at some point (e.g. for 
reporting status in a control panel or something).

> +	__u16 uc_type;
> +
> +	/** @pad: MBZ */
> +	__u16 pad;
And wasn't there a comment about just using a u32 for the type? What is 
the advantage to splitting it into two u16 values?

John.

> +
> +	/* @major_ver: major uc fw version */
> +	__u32 major_ver;
> +	/* @minor_ver: minor uc fw version */
> +	__u32 minor_ver;
> +	/* @patch_ver: patch uc fw version */
> +	__u32 patch_ver;
> +	/* @branch_ver: branch uc fw version */
> +	__u32 branch_ver;
> +
> +	/** @pad2: MBZ */
> +	__u32 pad2;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved;
> +};
> +
>   /**
>    * struct drm_xe_device_query - main structure to query device information
>    *
> @@ -518,6 +548,7 @@ struct drm_xe_device_query {
>   #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
>   #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
>   #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> +#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>   	/** @query: The type of data to query */
>   	__u32 query;
>   

