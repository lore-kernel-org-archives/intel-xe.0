Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22C6CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 07:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A076110E592;
	Fri, 20 Oct 2023 07:08:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09D610E590
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 07:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697785689; x=1729321689;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5wL5Wa25MvfKluoKpNrPtz9RFOYLHDpfaLqlk2/A9LM=;
 b=gOge7aLAngEBp2hVvdvKnpRFwWlrTtbr/FFgXljeJajd9TTEKF5d5EK3
 5iAfDUDHYruITVxzMBDGC6/3C3aIt7UUR8XCkh4bMv1lp9D5JlDnQKNvS
 LcJtJOIcYwEpSEDYJWLo5cPFkwiTN3tjNym0jCz0W4gePHiIITP6ke4PZ
 WapXYDagfy+ucqhmCMPzpiu8kTSdz9J79xevkFrMSgEQ2jWHOG+Wo2pCv
 8A9w3LLKuxjKCnLar23D/jJiX86oLp/vhwS6KGv5dSDuxS8zfs6/00Kqp
 vtySQILT+TVR09thuOrWXpsP1KvZIaovOkjcIZM86jClrvdMDFzAaRri5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385320456"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="385320456"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 00:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="760951428"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="760951428"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 00:08:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 00:08:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 00:08:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 00:08:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJ4HDWgYSDsOOD85dQ76kUJi0plOb5j9OD3mYYbaLCp+gMcLeurlC/0kfBETG99v7L1HGmbaAr9jUl2p0+lvryCmigo0O/Tl9hMXlMcmbJJt4djvGxdMzB9b0++TnX4OzmD5FZlbwvOBRDF3oZZX//sEG1GpFsoH5BCcV241o6OPpwUOC5QjIFf9GwFmDXbkucOrYs1FRm+Lv+KMxlTrQGGcjSypvpVX4hzycbEtZLuJm2h4nUX1esUgbaSPY3uLxRECvhKJmyjB7qeeodbN2byj060sWXsgjK6pQ5z6sSEA0zppEIB7ScGGzgGMV3plwI4S6CN4wzfxznNBftXhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0Ltp28ODvCgbdxU/H6KDKIPFQhnycjY2qrsdvFdVcg=;
 b=anqR2+GcWnygaJgX4BopH6OTWC7NyNCc9ReshArfEDn3VxNQlgA2VAu41CPMufSI41dsaA19NKv0MDKVcGXidtaRbUYG7WcUqn+lrx34Vj4miVGvXV9aPrLmmrsCltZCTx5bSfQFtF9VW38hhxLasQv6K/Okk5M10fmN8Y0zKNDTIQg8kKnrJZNspKMrRGFxK5TxnbsPbZ82oVSjOCTPholPiZMBAzFHW7pHkBNhz9DlSBtJkr/YHbcQhWSg8LaXwAA84+SCGjyYnHssGLU1ZtVQtJjpUJu84/henWwWmsSU+iAYkNxevduYthgINty1yS1BZNYcSAvvFfkoaml+zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by BY1PR11MB7982.namprd11.prod.outlook.com (2603:10b6:a03:530::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 07:08:03 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::1e05:8d6e:fa94:9f7c]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::1e05:8d6e:fa94:9f7c%3]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 07:08:02 +0000
Message-ID: <85638449-3894-4887-b10d-7a6b2b73d4ae@intel.com>
Date: Fri, 20 Oct 2023 10:08:18 +0300
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230919161049.2307855-5-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20230919161049.2307855-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0382.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::20) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|BY1PR11MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: be527de4-3792-44e7-f987-08dbd13b4c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hA2Q0D925Tk0XayQ5+L4L6oFqjSK48mgXdgiMO2esxF54SZ/uzKPNxRlz8cX72IrKvyGkwgsDFnIPjePRLQPz5TfQST+cOmH4SsSGpMEjvH6s3Vc3wBMXtr5o+tGf9+ShD+oBpQmnUQQZzbS5ydGtL/NLn4YmZStGasTLqu+QkI+3/7WsAPhMViCfDM383Fk3sWSDxKvt8jlrwPoaOmfTmurbsbsaZViDGCxLWHuHfMzQ6mv9+25mxlwW96o+JXt7a5D7UC3kI8jhn207b94S4Fx3b1zEtWbIRwBSPRhhrPMGc/QQl86yOsijAu6gaI2S9Cn2M54lqkgj14gOTmWQnS5r5f+EmdI4wBd7nN027vmENMKpzZko7eg29ewhc1ekDPV+EKsYgbMh2+OR5PB2vB2IL4K9UbTVDShuzC506yzdNiRRMVnRXF4Zzbe4gIT4/Zh+A5ODrsJuJYGTvRdDwy4s9cqO8yFtomtBQDdp8b5nBrUIPYHP490k6Ehldvd+cGnhAkhyo1JDbcq2NQF6PCO3isjAEvMgf0ag8xEbjwICbbIUW6RaANCQoaF7wx+uZz1LtU/WBChnkW+Fvms/1PFMy27tbrb08Q7Y7/X+zUA/w1uVAHIfzvSBEkHcC/clAi01qeLglk3sE5xmO8TQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(346002)(396003)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(8936002)(8676002)(31686004)(5660300002)(30864003)(2906002)(2616005)(26005)(36756003)(41300700001)(31696002)(316002)(86362001)(6486002)(478600001)(83380400001)(82960400001)(66556008)(66476007)(38100700002)(66946007)(6512007)(6666004)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yjd5eHlXT1IxVmxCMktJVk12dTJoT0ZhVFA4OUgyY3pLM010RnZ3TGlTaDhs?=
 =?utf-8?B?dzVpNDljcmJMR3JkY1dIdnhLN05SU2NhbUtsK2tTYUkrV1c3b0Nhb1lIUHdM?=
 =?utf-8?B?R3BFTjl4MEhBWjRObldpLzd5RkhTUzc1ZEZ5RlZxUXhCUE1STzJEdTB4dDdq?=
 =?utf-8?B?SjkxV0ZaZVZzU2tpU2FrdUhnU3VndTlBTnFYL1ZMTGpJVGs3ekM1dkR0R2k5?=
 =?utf-8?B?cmdrVW1DeVc0YUIwcGIzazIvekRNWXJ6ZExQRTZ1MGk0N29GTUx3Qm9Rdk5m?=
 =?utf-8?B?clR4MjRoUXJoeThHVG9JWW5IbkRvZGxyWTRqUGh4dDNOYVJ2b3pnRCt4R0Jp?=
 =?utf-8?B?TkNSYnpmUmEwajFaWmlCak9sS1dEd0F4RzNxRjhUM25TcVVVY1kwRWU4cnF6?=
 =?utf-8?B?dGtDejJmQm96M1BQN2dLM2FKL1ZLTGlwUC9NMVVrWkZwL3U1dEZBSC9WUVlq?=
 =?utf-8?B?WEROUWc0MHBkTytiZDVpbksyVml4MFVWK0pyVFBra2NERGZ1MlR1U21OblVz?=
 =?utf-8?B?Wnc5emNja0ZEVUxEdlBUNHA2YUQ1aFJwSmF0UzVxdll6ODgxdGkwUGVWMFVW?=
 =?utf-8?B?Yi96SFB6QktTVVZ2ZWVsZUtQdHc1TWdVSUJkRlYvalBlTzBkVzMxcVJzVTVY?=
 =?utf-8?B?QUlpbFMvcytGMFhtTHdZY05acjlPNmdqOGx4M3ZmU0hkSmRlTFRwTTY2M3V1?=
 =?utf-8?B?dlExejhMdHVPRmhLUjlOeWdtRW1URWYrcnVyK2ZRNW9MeXBjK0E3NEZIN01s?=
 =?utf-8?B?TVlxU1pZWGxoNWpCV1lmVVdDaFROb1VVckcySm9CYXdoaTE1RXRLUmduWUxG?=
 =?utf-8?B?eWFDVXFNQTNURzZsRkhiOGx3NDU5eWRObStiVVNMem5wUVpDMFhBUjdzNWJn?=
 =?utf-8?B?bjVIVmJIdTVQN2plZUh3cUF6K3JvTHFHcURDbkpINGRHSDE3a2s2RmhoZUdB?=
 =?utf-8?B?U1Z4WVpyeU1PcUY5Vk0vbWNuN2dYU2xWYnJqOFM4UEs3b0pPQzhpQ01rNWZC?=
 =?utf-8?B?SzFMaG94WnU5SUF3R2N2WTlBRkVTRVErLzlCS0o2c2x3M3ZlL3Z4b0N3aTRo?=
 =?utf-8?B?WEVPN3V5d3M1S01lTnNPU2tIUzBjZDJMV3dVeXp2dmdTSWNJcExmMHZMVjRY?=
 =?utf-8?B?Ty9mb2xURFRJbVFvTWltN2RmVjlZYzhqVHR0YVh4ZXUxY1hUUjJJUlZUVG9i?=
 =?utf-8?B?NWNCSEJQRTFPNXFFWVljNzA0bDFibyszNGlMWVBiZElOTnJsWTJ5ODFFaEhq?=
 =?utf-8?B?c3pZRUU1Y1A5OFlNUkdVOFRsS3d4cVhSS0FTTTRFd3ZxVXVWdVd2NlhYcHBh?=
 =?utf-8?B?Z0lSaHRyMFp4VXovR1JGSkZUR3M0R2daQTVWeVdLWW4rQjhzQ0xKRjZ3NnJm?=
 =?utf-8?B?RXU0N1VFVmZMZFFaZHVHd2ZaVk0rVkZvWGN6cUNDYXhzT0Z2RnVjckpKK3hV?=
 =?utf-8?B?SE81NnVCOWs4ZVYyd0xOcWhQV24ybjBTRGlwanA0cDkzS3JCOEZOV3RjOVZx?=
 =?utf-8?B?WlArczV3YVRVQjdaVkdGek9NeStkUnJCUXovb0RVZnljVzVwM2hoenA3OEI4?=
 =?utf-8?B?WXFlaU5SWjROTDVMUlJpRVFXYkdOUWR5RDEvaTRPdEFibUJiTnVNWkgrU0Y4?=
 =?utf-8?B?WHVocUM0bW1HOG1rdzg1NW1lWkJ6Q01TNDR4d09XZVZZRGJuMzJmR2hZZ2t1?=
 =?utf-8?B?N2dRNFprd1AxalIwU3dSVjVpdldOSlJUejQrSEk2NTdmZFJxUlFiVXJUamlo?=
 =?utf-8?B?NlpVUXhMRk4wZTU1SHltR2ZlQmdRay9OZHRzd2RuSlZRMVExSHl4blFkMGVJ?=
 =?utf-8?B?MjhNeGExUUt3UndjOERQOXZjMW9hNXA1Y3BxT0pveUFYMVFrdnY4NzRsNzJ3?=
 =?utf-8?B?QkRRcE5pbWNhcVkrUnhwWkZkc1NicWpQRFlMdW1YWktWMG1XdVYvY0tXOHJU?=
 =?utf-8?B?UDRLZkpkWHo5TGtOdlFhdVBXUDJBbUMzOGsrdEpreENjT0o2UEFsWEhBR2R0?=
 =?utf-8?B?aUczZVVMSk9jUnAyd1BxR2dCbjFSelBPNnpSSHQvS2t2Ry9ML3lFeVV0UjRN?=
 =?utf-8?B?OC9XeUkyeUlGdlZiVXp1bVdCWkpnTGQwTS8wcTBzbE9BQkt0RVY3b3Y0cTQ1?=
 =?utf-8?B?NktNWmtCMGl2T0NGMktKSlhXY1N1NDdKbUZzcUczQUY5cXlTRkpLZWNwM3Qv?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be527de4-3792-44e7-f987-08dbd13b4c83
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 07:08:02.1737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pat7GxXzYGUIPkfXd4+ZEIRbvFCnR50aVQlLfXWTlSNMcNSv78v9LTHLKBNn2eKy6kJYgyDERIcGL5lrNGRp2OYzmi5ojipUdukjNwWvyag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7982
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [04/21] drm/xe/oa: Module init/exit and probe/remove
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

On 19/09/2023 19:10, Ashutosh Dixit wrote:
> Perform OA initialization at module init and probe time:
>
> * Setup perf_stream_paranoid and oa_max_sample_rate files in /proc
> * Setup metrics sysfs directories to expose which metrics configurations
>    are available
> * Setup OA groups which associate hw engines with OA units
> * Initialize OA units
>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile             |   1 +
>   drivers/gpu/drm/xe/xe_device.c          |  11 +
>   drivers/gpu/drm/xe/xe_device_types.h    |   4 +
>   drivers/gpu/drm/xe/xe_gt_types.h        |   4 +
>   drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 +
>   drivers/gpu/drm/xe/xe_module.c          |   5 +
>   drivers/gpu/drm/xe/xe_oa.c              | 309 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_oa.h              |  18 ++
>   8 files changed, 354 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_oa.c
>   create mode 100644 drivers/gpu/drm/xe/xe_oa.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cc95a46b5e4d3..a40c4827b9c85 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -84,6 +84,7 @@ xe-y += xe_bb.o \
>   	xe_mmio.o \
>   	xe_mocs.o \
>   	xe_module.o \
> +	xe_oa.o \
>   	xe_pat.o \
>   	xe_pci.o \
>   	xe_pcode.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b6bcb6c3482e7..2c3dac6340f04 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -25,6 +25,7 @@
>   #include "xe_irq.h"
>   #include "xe_mmio.h"
>   #include "xe_module.h"
> +#include "xe_oa.h"
>   #include "xe_pcode.h"
>   #include "xe_pm.h"
>   #include "xe_query.h"
> @@ -323,6 +324,10 @@ int xe_device_probe(struct xe_device *xe)
>   			goto err_irq_shutdown;
>   	}
>   
> +	err = xe_oa_init(xe);
> +	if (err)
> +		goto err_irq_shutdown;
> +
>   	err = xe_display_init(xe);
>   	if (err)
>   		goto err_irq_shutdown;
> @@ -333,6 +338,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_display_register(xe);
>   
> +	xe_oa_register(xe);
> +
>   	xe_debugfs_register(xe);
>   
>   	xe_pmu_register(&xe->pmu);
> @@ -363,10 +370,14 @@ static void xe_device_remove_display(struct xe_device *xe)
>   
>   void xe_device_remove(struct xe_device *xe)
>   {
> +	xe_oa_unregister(xe);
> +
>   	xe_device_remove_display(xe);
>   
>   	xe_display_fini(xe);
>   
> +	xe_oa_fini(xe);
> +
>   	xe_irq_shutdown(xe);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a82f28c6a3a01..8161407913607 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -17,6 +17,7 @@
>   #include "xe_platform_types.h"
>   #include "xe_pmu.h"
>   #include "xe_step_types.h"
> +#include "xe_oa.h"
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>   #include "soc/intel_pch.h"
> @@ -365,6 +366,9 @@ struct xe_device {
>   	/** @pmu: performance monitoring unit */
>   	struct xe_pmu pmu;
>   
> +	/** @oa: oa perf counter subsystem */
> +	struct xe_oa oa;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d4310be3e1e7c..dc700198f33f7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -13,6 +13,7 @@
>   #include "xe_reg_sr_types.h"
>   #include "xe_sa_types.h"
>   #include "xe_uc_types.h"
> +#include "xe_oa.h"
>   
>   struct xe_exec_queue_ops;
>   struct xe_migrate;
> @@ -347,6 +348,9 @@ struct xe_gt {
>   		/** @oob: bitmap with active OOB workaroudns */
>   		unsigned long *oob;
>   	} wa_active;
> +
> +	/** @oa: oa perf counter subsystem per gt info */
> +	struct xe_oa_gt oa;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index cd4bc1412a3ff..c38674c827c91 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -146,6 +146,8 @@ struct xe_hw_engine {
>   	enum xe_hw_engine_id engine_id;
>   	/** @eclass: pointer to per hw engine class interface */
>   	struct xe_hw_engine_class_intf *eclass;
> +	/** @oa_group: oa unit for this hw engine */
> +	struct xe_oa_group *oa_group;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 7194595e7f312..5bf957b127f0f 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -11,6 +11,7 @@
>   #include "xe_drv.h"
>   #include "xe_hw_fence.h"
>   #include "xe_module.h"
> +#include "xe_oa.h"
>   #include "xe_pci.h"
>   #include "xe_pmu.h"
>   #include "xe_sched_job.h"
> @@ -68,6 +69,10 @@ static const struct init_funcs init_funcs[] = {
>   		.init = xe_register_pci_driver,
>   		.exit = xe_unregister_pci_driver,
>   	},
> +	{
> +		.init = xe_oa_sysctl_register,
> +		.exit = xe_oa_sysctl_unregister,
> +	},
>   };
>   
>   static int __init xe_init(void)
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> new file mode 100644
> index 0000000000000..fae067e73c027
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -0,0 +1,309 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/anon_inodes.h>
> +#include <linux/nospec.h>
> +#include <linux/sizes.h>
> +#include <linux/uuid.h>
> +
> +#include <drm/xe_drm.h>
> +#include <drm/drm_drv.h>
> +
> +#include "regs/xe_oa_regs.h"
> +#include "xe_gt.h"
> +#include "xe_device.h"
> +#include "xe_oa.h"
> +
> +static u32 xe_oa_stream_paranoid = true;
> +static int xe_oa_sample_rate_hard_limit;
> +static u32 xe_oa_max_sample_rate = 100000;
> +
> +static const struct xe_oa_format oa_formats[] = {
> +	[XE_OA_FORMAT_C4_B8]			= { 7, 64 },
> +	[XE_OA_FORMAT_A12]			= { 0, 64 },
> +	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128 },
> +	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
> +	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
> +	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256 },
> +	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, TYPE_OAM, HDR_64_BIT },
> +	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, TYPE_OAM, HDR_64_BIT },
> +};
> +
> +static struct ctl_table_header *sysctl_header;
> +
> +void xe_oa_register(struct xe_device *xe)
> +{
> +	struct xe_oa *oa = &xe->oa;
> +
> +	if (!oa->xe)
> +		return;
> +
> +	oa->metrics_kobj = kobject_create_and_add("metrics",
> +						  &xe->drm.primary->kdev->kobj);
> +}
> +
> +void xe_oa_unregister(struct xe_device *xe)
> +{
> +	struct xe_oa *oa = &xe->oa;
> +
> +	if (!oa->metrics_kobj)
> +		return;
> +
> +	kobject_put(oa->metrics_kobj);
> +	oa->metrics_kobj = NULL;
> +}
> +
> +static u32 num_oa_groups_per_gt(struct xe_gt *gt)
> +{
> +	return 1;
> +}
> +
> +static u32 __oam_engine_group(struct xe_hw_engine *hwe)
> +{
> +	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) >= 1270) {
> +		/*
> +		 * There's 1 SAMEDIA gt and 1 OAM per SAMEDIA gt. All media slices
> +		 * within the gt use the same OAM. All MTL SKUs list 1 SA MEDIA.
> +		 */
> +		drm_WARN_ON(&hwe->gt->tile->xe->drm,
> +			    hwe->gt->info.type != XE_GT_TYPE_MEDIA);
> +
> +		return OA_GROUP_OAM_SAMEDIA_0;
> +	}
> +
> +	return OA_GROUP_INVALID;
> +}
> +
> +static u32 __oa_engine_group(struct xe_hw_engine *hwe)
> +{
> +	switch (hwe->class) {
> +	case XE_ENGINE_CLASS_RENDER:
> +		return OA_GROUP_OAG;
> +
> +	case XE_ENGINE_CLASS_VIDEO_DECODE:
> +	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return __oam_engine_group(hwe);
> +
> +	default:
> +		return OA_GROUP_INVALID;
> +	}
> +}
> +
> +static struct xe_oa_regs __oam_regs(u32 base)
> +{
> +	return (struct xe_oa_regs) {
> +		base,
> +		GEN12_OAM_HEAD_POINTER(base),
> +		GEN12_OAM_TAIL_POINTER(base),
> +		GEN12_OAM_BUFFER(base),
> +		GEN12_OAM_CONTEXT_CONTROL(base),
> +		GEN12_OAM_CONTROL(base),
> +		GEN12_OAM_DEBUG(base),
> +		GEN12_OAM_STATUS(base),
> +		GEN12_OAM_CONTROL_COUNTER_FORMAT_SHIFT,
> +	};
> +}
> +
> +static struct xe_oa_regs __oag_regs(void)
> +{
> +	return (struct xe_oa_regs) {
> +		0,
> +		GEN12_OAG_OAHEADPTR,
> +		GEN12_OAG_OATAILPTR,
> +		GEN12_OAG_OABUFFER,
> +		GEN12_OAG_OAGLBCTXCTRL,
> +		GEN12_OAG_OACONTROL,
> +		GEN12_OAG_OA_DEBUG,
> +		GEN12_OAG_OASTATUS,
> +		GEN12_OAG_OACONTROL_OA_COUNTER_FORMAT_SHIFT,
> +	};
> +}
> +
> +static void xe_oa_init_groups(struct xe_gt *gt)
> +{
> +	const u32 mtl_oa_base[] = {
> +		[OA_GROUP_OAM_SAMEDIA_0] = 0x393000,
> +	};
> +	int i, num_groups = gt->oa.num_oa_groups;
> +
> +	for (i = 0; i < num_groups; i++) {
> +		struct xe_oa_group *g = &gt->oa.group[i];
> +
> +		/* Fused off engines can result in a group with num_engines == 0 */
> +		if (g->num_engines == 0)
> +			continue;
> +
> +		if (i == OA_GROUP_OAG && gt->info.type != XE_GT_TYPE_MEDIA) {
> +			g->regs = __oag_regs();
> +			g->type = TYPE_OAG;
> +		} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
> +			g->regs = __oam_regs(mtl_oa_base[i]);
> +			g->type = TYPE_OAM;
> +		}
> +
> +		/* Set oa_unit_ids now to ensure ids remain contiguous. */
> +		g->oa_unit_id = gt->tile->xe->oa.oa_unit_ids++;
> +	}
> +}
> +
> +static int xe_oa_init_gt(struct xe_gt *gt)
> +{
> +	u32 num_groups = num_oa_groups_per_gt(gt);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct xe_oa_group *g;
> +
> +	g = kcalloc(num_groups, sizeof(*g), GFP_KERNEL);
> +	if (!g)
> +		return -ENOMEM;
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		u32 index = __oa_engine_group(hwe);
> +
> +		hwe->oa_group = NULL;
> +		if (index < num_groups) {
> +			g[index].num_engines++;
> +			hwe->oa_group = &g[index];
> +		}
> +	}
> +
> +	gt->oa.num_oa_groups = num_groups;
> +	gt->oa.group = g;
> +
> +	xe_oa_init_groups(gt);
> +
> +	return 0;
> +}
> +
> +static int xe_oa_init_engine_groups(struct xe_oa *oa)
> +{
> +	struct xe_gt *gt;
> +	int i, ret;
> +
> +	for_each_gt(gt, oa->xe, i) {
> +		ret = xe_oa_init_gt(gt);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void oa_format_add(struct xe_oa *oa, enum drm_xe_oa_format format)
> +{
> +	__set_bit(format, oa->format_mask);
> +}
> +
> +static void xe_oa_init_supported_formats(struct xe_oa *oa)
> +{
> +	switch (oa->xe->info.platform) {
> +	case XE_ALDERLAKE_S:
> +	case XE_ALDERLAKE_P:

case XE_ALDERLAKE_N:

case XE_DG1:

case XE_TIGERLAKE:

case XE_ROCKETLAKE:


Those are essentially the same from the OA register/format point of view.

> +		oa_format_add(oa, XE_OA_FORMAT_A12);
> +		oa_format_add(oa, XE_OA_FORMAT_A12_B8_C8);
> +		oa_format_add(oa, XE_OA_FORMAT_A32u40_A4u32_B8_C8);
> +		oa_format_add(oa, XE_OA_FORMAT_C4_B8);
> +		break;
> +
> +	case XE_DG2:
> +		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
> +		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
> +		break;
> +
> +	case XE_METEORLAKE:
> +		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
> +		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
> +		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
> +		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
> +		break;
> +
> +	default:
> +		drm_err(&oa->xe->drm, "Unknown platform\n");
> +	}
> +}
> +
> +int xe_oa_init(struct xe_device *xe)
> +{
> +	struct xe_oa *oa = &xe->oa;
> +	struct xe_gt *gt;
> +	int i, ret;
> +
> +	/* Support OA only with GuC submission and Gen12+ */
> +	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
> +		return 0;
> +
> +	oa->xe = xe;
> +	oa->oa_formats = oa_formats;
> +
> +	for_each_gt(gt, xe, i)
> +		mutex_init(&gt->oa.lock);
> +
> +	/* Choose a representative limit */
> +	xe_oa_sample_rate_hard_limit = xe_root_mmio_gt(xe)->info.clock_freq / 2;
> +
> +	mutex_init(&oa->metrics_lock);
> +	idr_init_base(&oa->metrics_idr, 1);
> +
> +	ret = xe_oa_init_engine_groups(oa);
> +	if (ret) {
> +		drm_err(&xe->drm, "OA initialization failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	xe_oa_init_supported_formats(oa);
> +
> +	oa->xe = xe;
> +	return 0;
> +}
> +
> +void xe_oa_fini(struct xe_device *xe)
> +{
> +	struct xe_oa *oa = &xe->oa;
> +	struct xe_gt *gt;
> +	int i;
> +
> +	if (!oa->xe)
> +		return;
> +
> +	for_each_gt(gt, xe, i)
> +		kfree(gt->oa.group);
> +
> +	idr_destroy(&oa->metrics_idr);
> +
> +	oa->xe = NULL;
> +}
> +
> +static struct ctl_table oa_ctl_table[] = {
> +	{
> +	 .procname = "perf_stream_paranoid",
> +	 .data = &xe_oa_stream_paranoid,
> +	 .maxlen = sizeof(xe_oa_stream_paranoid),
> +	 .mode = 0644,
> +	 .proc_handler = proc_dointvec_minmax,
> +	 .extra1 = SYSCTL_ZERO,
> +	 .extra2 = SYSCTL_ONE,
> +	 },
> +	{
> +	 .procname = "oa_max_sample_rate",
> +	 .data = &xe_oa_max_sample_rate,
> +	 .maxlen = sizeof(xe_oa_max_sample_rate),
> +	 .mode = 0644,
> +	 .proc_handler = proc_dointvec_minmax,
> +	 .extra1 = SYSCTL_ZERO,
> +	 .extra2 = &xe_oa_sample_rate_hard_limit,
> +	 },
> +	{}
> +};
> +
> +int xe_oa_sysctl_register(void)
> +{
> +	sysctl_header = register_sysctl("dev/xe", oa_ctl_table);
> +	return 0;
> +}
> +
> +void xe_oa_sysctl_unregister(void)
> +{
> +	unregister_sysctl_table(sysctl_header);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
> new file mode 100644
> index 0000000000000..ba4ba80fd34cb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_oa.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_OA_H_
> +#define _XE_OA_H_
> +
> +#include "xe_oa_types.h"
> +
> +int xe_oa_init(struct xe_device *xe);
> +void xe_oa_fini(struct xe_device *xe);
> +void xe_oa_register(struct xe_device *xe);
> +void xe_oa_unregister(struct xe_device *xe);
> +int xe_oa_sysctl_register(void);
> +void xe_oa_sysctl_unregister(void);
> +
> +#endif


