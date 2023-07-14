Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03493EB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 11:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EE610E863;
	Fri, 14 Jul 2023 11:49:25 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE1E10E863
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 11:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689335364; x=1720871364;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DRQ5n0u/8BkX1yzHMfymK72PkFCNC86QXBGUNwx+piM=;
 b=JKzl0UGGOsg1sgWJPS/uCxr3dqEQbdGZtf3+Jmm8dvw5joe+QO89uz6p
 gxhUmZX9p0AF8hs3FFMKsKSjpVBqQBIIb2JYa5ghGrTjwKlC0ExbK6PWp
 QlxKTWIFI86eUC5b5tbq018MdNnNTM1Jw1TPMutK28/iIZsDVCnLnbnWj
 hk/e2ANTFoYwcnTt/2yRz0a7nB+f4wcGYjDb5Wo6gCGKc4B+zTIuDuMJC
 eLCSMIYH+/7o/vIqbqu87pi84yqFSiG6hM1wWLOcb4ivNh4+wRLW2OZ5J
 RvLAqVa2KNZ9niDNO/upEtlvkUiVfbh39TbXpIqaLYffs/4w934rujf/R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="369003894"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="369003894"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 04:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="672664413"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="672664413"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 14 Jul 2023 04:49:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 04:49:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 04:49:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 04:49:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 04:49:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFcykKNO85otkwUCpJx5HuEY5bRqOljVG2a1fJXDxEKpmGH/WXMPIC3LLZXfjqybkBXP1vqpRmVpnavKbKyaDkl5gVd8z8FSn/P0wNNt4qInKONoUcrBSfGch3UGIi2bgE/UZ/408Mu1tOtf+Nzwbt1TT6SMlbQFfcheU0muU1GX/Ivc+xHpC/3bg156fMcfnl9BFXagWkSgz4jyLxLCKhiSsEb9Kp3dTHtaJqq5v+OJd2pWyXeR5+SKG1ClEQLGa6f0CXrpwQeIyqLt3ezJhGUsOcFBdTWFh06FLtYVKByCWnDSthb98mO2APLW7lj8+2+KchLZq2FKjxCfYc/PMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diiO5rhiv7oEIer9EjOWT0w/mmn23oQlpD5PTzmqVe0=;
 b=gs/EpiQuwzUcMou9NLt4ErlXB4XiLUr3iD2PS2uD35OxMT3kMRtNSmkKryX9Do8R0UCAbVU3iNHj13X/R5NACiIdSVpX9ygCXLAu+e46tA+yvkxOGFmGt/UB+QD4FgcM5gD+UINIf0vVwURnuqmg+iIJ0R8bClUtqSWPaGCXKQC4exZ2m4N4gltiwDwzqk27vpVQsx9wZU9bFNG5p3HtmzcoYEIyaTyVQIDGGoNJmThQ6p3aWdcz+s72mqosGPXIAbrDE6Drnvrfm9Y2i/wcuJlBl/hCu8AlBHxrw1j3rdDd/qGJK4TxdVHcVZ6faU1sEXC6lVKEsjW3Vo/B3Ts82Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BL1PR11MB5304.namprd11.prod.outlook.com (2603:10b6:208:316::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 11:49:12 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::b66c:648e:c290:43bb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::b66c:648e:c290:43bb%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 11:49:12 +0000
Message-ID: <8d24ff61-95a7-78f4-0dbc-bbd1f7c050c0@intel.com>
Date: Fri, 14 Jul 2023 17:19:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Anshuman Gupta <anshuman.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230713143121.3901357-1-anshuman.gupta@intel.com>
 <20230713143121.3901357-5-anshuman.gupta@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230713143121.3901357-5-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::16) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BL1PR11MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: 85fa4497-a223-4171-d08f-08db84605783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NrYvFA3kG9qftEfnXj82cWtFYx6TFg8hJ+DeWzq2CR2EN+MnyEF4Toysq41455P+6LbMm7gQwdSC0uZMtMAxWBSWRQRAF4K8FL76QUgDhajnyRegBsrYd8kLoA3jBLAe0sSoUSf7eG8l/Xl3khLgpPGu8RbPsqUqOQsVeU+FTO6jzys0jkEdSkexQqDXYn3/No8wzFKqC8gAtnLpKLwGgkfUy2npqdsoIPv/uxO1i2MilNxQ3be2eftNPcGaxUbJo+8g1tZivNw5yAnyyL5Sf9F4+v5LQU7dOIMBMJmPeWCNhpOZ/CvoNXUNTr7KPG6VAcPFpbzb59iPfWuppE+Z55ZmakDWoZXrafR9LAMgB+UTmNVpCW7IBUcQWqf1ze5dpAtQUPoFMi9IjIfiTxr/6MURCZjPoMSjvEVgRjv+6dsxGVQjiweOShAyyCBKZoBtsqSFHTDo9hdqlIzga1RzBtg3AqVpPdMiw6VzxCH6rOCt2fbnk3vnDE8lNyStfXkqkQiC0qGmxE9STNGqjcq0+jeJdmRmJ3po2z6V9PwmJg4rIpflaYb+JmL1Bw+tC6kAIo9qcQxTmQTjdyQkNP0nR8Uw6kwrm8vGIPAI3djLKVQosGTUDAF+0LZ5Emz1tc59YnlIOc+7Sgn/XzgyHEt2Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(41300700001)(107886003)(66476007)(4326008)(66946007)(66556008)(31686004)(478600001)(5660300002)(2906002)(316002)(8936002)(8676002)(6666004)(6486002)(6512007)(86362001)(82960400001)(26005)(6506007)(53546011)(31696002)(186003)(83380400001)(36756003)(2616005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkc5ZmtYclA5MEZJeGs2YWFpa2Z3VmZWNUZPMmE2RGVNQ3BFN0lCWVJmL0Nj?=
 =?utf-8?B?NlQ4VjFENXFpcXRKTGJOV2Q4eGUwRFFtY0VjeHBYM0ttZy9aSURFNnVobTV4?=
 =?utf-8?B?bFpNTXRBc3pHeVkrenlXYStKZ0dlSm02a2IvYk1qMmtFT09Dc1d2RmpYTUM0?=
 =?utf-8?B?b2pMMUxxWHowVVI0dXZhNXN5UFJJVnZkTzgxTnRTQi9FSlNrVmZ4R04yVnZr?=
 =?utf-8?B?NFpRYW5zWmhsVlBseE85SGlRa2thM1NCdXU5SDVUMlg5M2oydGh2cnoxd1Yz?=
 =?utf-8?B?TEExUFZLaXM1SVRYNURva2ZNNHVPSWZQR284UmZjWGJSc1RVcWo2bnQ2blZX?=
 =?utf-8?B?Z2N6aXU2aXNFdm13Z0pTa3BXWDNzcUtHSFRsd2ErejVhaWNxQ0ZJVS9heDBh?=
 =?utf-8?B?MzdncXR3cmtsVWFxSHBSQmtoZXlSelhETUNSMkVPckFLUnJaWDlIZk81UEpk?=
 =?utf-8?B?eURyVlR2OE9JZWVmVWRvODZta2tybit3bkhpMzljMGdOYW5QQU4wdXdRU2Vq?=
 =?utf-8?B?QytrZktqMWZxQTNDWFdVWWdEb01pWENpSTArakhaTDBJSHBpTllwOHNldzhZ?=
 =?utf-8?B?VU1BTStuSW5PUE1HYjdXbk82Ym01TitoRG1VV2hNbUxraXJYNmI2NTR2S2xZ?=
 =?utf-8?B?OFhwakJXQmsvc2hFeXQwV2g2R0NJcWl6U0ZUQlBoTGNjWjRvNkxiYjJPNnFy?=
 =?utf-8?B?bXB1YnhpQlJVSEp4QjRSeGJUOExFSDZJdnVtNklNOFpqNFliaktlaVFHSzZh?=
 =?utf-8?B?WHhLVnJoYzAyemFBUGVPcXRPWFZFSk1LSlh4VlZUL25EbENseUdZVk51Z0p0?=
 =?utf-8?B?eE1OTUJFeDlXSk1hTStUR1p4cTdkL0RYcFJBMGpBWSt1QWtuSm5TeGdaU1Zj?=
 =?utf-8?B?TEdCRkt3eENFMVl6N0pSOFVyWmNidmVUbFZsdkp2M1lUVy82a0J2dWJFSzl2?=
 =?utf-8?B?V3dWcEs5V2xHTDhtSk9MVk0yYW5ETXh0elBlbFdFNGFCam1DVGFBQmNLeGY2?=
 =?utf-8?B?bnZ5RHFOUzYxdGpFamlTcXd1ODN5Tm9ZVmJCeWIzaXlGZGw4RThsWnIzb1dv?=
 =?utf-8?B?aUdtSFJicS9ud2NSaG1BWlc0VlFZOXcwQ2tiLytLQ2lVeXZtOE96Qnp0VHhH?=
 =?utf-8?B?b3ZwcGhvTTluL3FwTzJUZVdCU3pwOVhRVnVCdlVsV3VwK04xdmhETXhYcktz?=
 =?utf-8?B?L09zSVArTVJBd2hsc1NVZGxhaWI3QkFVMzBuSVY2NnNVclJsUkExNDRqT0Zu?=
 =?utf-8?B?am12NjFldkVnMWIvUkRKTlpDd1RITFp4d1M3elhINkhBdjdLbFA0NE1mTUdr?=
 =?utf-8?B?Z0FKdFR4TzM4d3k2ZHpWOVBmS3BjS1JSc2JvOGVSR2xJc0ZmcFRBVzd4bjZ3?=
 =?utf-8?B?QnkrcFJJQ0ZrREdtRGxEOWV0MWlIN0dUOEg5dm00ejVYQmQrTmkxVGlSOFJ3?=
 =?utf-8?B?RWtuMDVsZlZrb0hKa1hHUnpHOTlvUlU2MENwS3hQb3Z4ZTN1NUNWVDFQNFU3?=
 =?utf-8?B?eWxVcHlrSFVQOXJOeGhtQlJ4WW80czVRZjh0YUZCUEN6RWZiOFI4Y0NXT2VF?=
 =?utf-8?B?RzR0R2xSbDFVQjBsWEVUWFcrbnlJQXhZRndST2lZbTRna0I2Y2xhRHNnaHFJ?=
 =?utf-8?B?N1Q5ejNhNlF5WUM3OUpUcktnYzZ6OTgzQmFMV1JCc0I0Q3JBakg0S2dYQ1RP?=
 =?utf-8?B?NDNNR2c5RTUzOTYyR2t4aGxHR0xtcUQxZ0tuWFhxWDZCVTRZUUV0UVVkU2Rp?=
 =?utf-8?B?MmViZmVXT0FkenI0eHZpbXFRcVlhWUVtY09oekZlcjV3OVEwYkp3UmFqbi9K?=
 =?utf-8?B?cTFMbG1sdFpobVRwaXRJYm1pemNQRWVkZi93WW1uR1dqVTFLSXBKc2NRS1Q5?=
 =?utf-8?B?TSttTWRQMjNUNDg2WVg0RHQxQVJKdFpZWlltRno0SmkzdllRSk5pa1BVY1ds?=
 =?utf-8?B?My8rOHVERnpGQWVYWG01akNzV2pRL284VUltQWQ2RVZEaFlwRy9nK3hqZGpn?=
 =?utf-8?B?aytwMVM2dkpEK1dwaEpOSTYzbTlTQ0syU0dLS1BEb081Uyt6UGRnbHRzT2dR?=
 =?utf-8?B?N29XMjFxSDhSdGpRM3lORllkcENSemFsc2k0SW9kMnpxRFNkemYzRzhFOGtB?=
 =?utf-8?B?RklHbEpvK0FyTlJCNUpDd1dsb3AwWnZvdVB4eDhxRmxIOGFtY2hFNnJXc1la?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fa4497-a223-4171-d08f-08db84605783
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 11:49:12.6156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFy54hOIXWOjvA8zt8yZ38cBKpiasZ260qdndg/yZEpB5GHgDtJcWmC6IHm5/JHL4XWCeHCSeh7ZnQY3+Dq/4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5304
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 4/5] xe/drm/pm: Toggle d3cold_allowed
 using vram_usages
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
Cc: sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 13-07-2023 20:01, Anshuman Gupta wrote:
> Adding support to control d3cold by using vram_usages metric from
> ttm resource manager.
> When root port  is capable of d3cold but xe has disallowed d3cold
> due to vrame_usages above vram_d3ccold_threshol. It is required to
> disable d3cold to avoid any resume failure because root port can
> still transition to d3cold when all of pcie endpoints and
> {upstream, virtual} switch ports will transition to d3hot.
> Also cleaning up the TODO code comment.
> 
> v2:
> - Modify d3cold.allowed in xe_pm_d3cold_allowed_toggle. [Riana]
> - Cond changed (total_vram_used_mb < xe->d3cold.vram_threshold)
>    according to doc comment.
> v3:
> - Added enum instead of true/flase argument in
>    d3cold_toggle(). [Rodrigo]
> - Removed TODO comment. [Rodrigo]
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 36 +++++++++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_pm.c  | 25 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pm.h  |  1 +
>   3 files changed, 59 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ce4bdfcbc46d..871868301838 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -26,6 +26,11 @@
>   #include "xe_pm.h"
>   #include "xe_step.h"
>   
> +enum toggle_d3cold {
> +	D3COLD_DISABLE,
> +	D3COLD_ENABLE,
> +};
> +
>   struct xe_subplatform_desc {
>   	enum xe_subplatform subplatform;
>   	const char *name;
> @@ -754,6 +759,28 @@ static int xe_pci_resume(struct device *dev)
>   	return 0;
>   }
>   
> +static void d3cold_toggle(struct pci_dev *pdev, enum toggle_d3cold toggle)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct pci_dev *root_pdev;
> +
> +	if (!xe->d3cold.capable)
> +		return;
> +
> +	root_pdev = pcie_find_root_port(pdev);
> +	if (!root_pdev)
> +		return;
> +
> +	switch (toggle) {
> +	case D3COLD_DISABLE:
> +		pci_d3cold_disable(root_pdev);
> +		break;
> +	case D3COLD_ENABLE:
> +		pci_d3cold_enable(root_pdev);
> +		break;
> +	}
> +}
> +
>   static int xe_pci_runtime_suspend(struct device *dev)
>   {
>   	struct pci_dev *pdev = to_pci_dev(dev);
> @@ -771,6 +798,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>   		pci_ignore_hotplug(pdev);
>   		pci_set_power_state(pdev, PCI_D3cold);
>   	} else {
> +		d3cold_toggle(pdev, D3COLD_DISABLE);
>   		pci_set_power_state(pdev, PCI_D3hot);
>   	}
>   
> @@ -795,6 +823,8 @@ static int xe_pci_runtime_resume(struct device *dev)
>   			return err;
>   
>   		pci_set_master(pdev);
> +	} else {
> +		d3cold_toggle(pdev, D3COLD_ENABLE);
>   	}
>   
>   	return xe_pm_runtime_resume(xe);
> @@ -808,15 +838,15 @@ static int xe_pci_runtime_idle(struct device *dev)
>   	if (!xe->d3cold.capable) {
>   		xe->d3cold.allowed = false;
>   	} else {
> +		xe_pm_d3cold_allowed_toggle(xe);
> +
>   		/*
>   		 * TODO: d3cold should be allowed (true) if
>   		 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
>   		 * but maybe include some other conditions. So, before
>   		 * we can re-enable the D3cold, we need to:
>   		 * 1. rewrite the VRAM save / restore to avoid buffer object locks
> -		 * 2. block D3cold if we have a big amount of device memory in use
> -		 *    in order to reduce the latency.
> -		 * 3. at resume, detect if we really lost power and avoid memory
> +		 * 2. at resume, detect if we really lost power and avoid memory
>   		 *    restoration if we were only up to d3cold I think avoid restoration if d3hot?
Regards,
Badal
>   		 */
>   		xe->d3cold.allowed = false;
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 07e204990aa9..c732317b55cb 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -292,3 +292,28 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
>   
>   	return 0;
>   }
> +
> +void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
> +{
> +	struct ttm_resource_manager *man;
> +	u32 total_vram_used_mb = 0;
> +	u64 vram_used;
> +	int i;
> +
> +	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
> +		man = ttm_manager_type(&xe->ttm, i);
> +		if (man) {
> +			vram_used = ttm_resource_manager_usage(man);
> +			total_vram_used_mb += DIV_ROUND_UP_ULL(vram_used, 1024 * 1024);
> +		}
> +	}
> +
> +	mutex_lock(&xe->d3cold.lock);
> +
> +	if (total_vram_used_mb < xe->d3cold.vram_threshold)
> +		xe->d3cold.allowed = true;
> +	else
> +		xe->d3cold.allowed = false;
> +
> +	mutex_unlock(&xe->d3cold.lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index bbd91a5855cd..ee30cf025f64 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -25,5 +25,6 @@ bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
>   void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>   int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
> +void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
>   
>   #endif
