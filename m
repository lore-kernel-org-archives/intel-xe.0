Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8E7C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 21:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8256010E2D5;
	Fri, 29 Dec 2023 21:16:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D9110E2D5
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 21:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703884590; x=1735420590;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gmSRAD7y9woS/Nqs0bRRxNZpFavnDEqPFQVCqKvUrL8=;
 b=K7FDCSAD+zXfcESsqfcJwfmncw/UKXhwPYv8GMkWWaC+UsuUdd3y3/M4
 JHpoz49vtwsTB9cuJDPG+N0ZbYxeaAfC58eB0phVv+12BCSYGGunpKS0F
 X8YpJkFW49oxWY1ZBIwI+AKgprBLZcjV6WMX3kgjkfrSWyIK085tyjSZc
 ABTntOZtH5RHdwKYCYbf9vITDpV+enbdqczY/izhtp5eMSE7RLpAfT/8Z
 yO5AWwMzYTbpwDtfffF/MkkI/XRtgVel4cwkAM90/ZpPBhp2V+737IC+j
 cutFTQ8N4WefQkYmOTm25kVsZWPnu8JL6PG2Tfnq9uaAZEYYMN1q7h45m g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="381647871"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="381647871"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 13:16:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="869479635"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="869479635"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Dec 2023 13:16:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 13:16:21 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Dec 2023 13:16:21 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Dec 2023 13:16:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ss7oKL/MqIx8Ar1OLzw+sWq9pdbCUC/8Hc6chvjHC4hTmi+KbMqY/H7nhXyjoq9se5kY9W4h/DWF+ksY1xwR0vxXJH6TeZ53TJMOTpM1WU5IX+8ouLHSQ1JbG6wzzal1/E9NEdhXxZcCsEcwjYNLihKZkEIWGo2lB4AblBXgdzMJu/af7CF1wylL85nYoFdp+9tK/Nq2k/LmuFjW9h2keGIxmvl5dTY6xShdVXZaVfDdZl3UCbqJcjKn4rdBMb/3Y5LOJc8a9WdAQuNWpvoEHlKwK8SNZwlEfxA0GXV9pv61mCB8M63IWIN9sBaWFNJnP2AS00LP3CRpOjFkbPWpJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acuwUcAM0wNrVc6E1ftiwloskNdfOEM5VJ0dZ4Y+kkc=;
 b=N0dssdOQDZI3ALYFVyFw3JPhvPB3XKusgo5t16E/JB6lqZVLJglRxQSY3VZSmPsHgVXdRW4Su/3zDrUk7rYSeRbfgKeWgGMUYpe4WoiilUu+PZlQffjpcQthS5wjobIQKiLYyc5LiFX3eA2xcScIl0bAa0uVMPqDyq2ZYyNGmKyXUZh9epdpUxwdVa3+hoD38X/pgmbWVFi2UOXuslaQy4Egdgi8wZcfXZlAtitdPLw/Ad9gw2s25c+Lb0mRiQTu/0DqBgihshUgTD9mVU4nS7BwhV97QeQP8dPzPLBURC6sLJh2a7wPhUtywrbeAVQV3O1Qnd3hwARG3tg9EcxMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Fri, 29 Dec
 2023 21:16:17 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 21:16:17 +0000
Date: Fri, 29 Dec 2023 22:16:15 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 10/10] drm/xe/guc: Start handling GuC Relay event messages
Message-ID: <20231229211615.ghuk5gczqj5vrkja@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
 <20231227235838.212-11-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227235838.212-11-michal.wajdeczko@intel.com>
X-ClientProxiedBy: FR2P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 363d842e-d6cf-4c60-74ff-08dc08b365a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gxxEvjUfZAMeCG4dsCSpsH4XhQcSYzmNRGhVfWjhQjyL1Nem+lIr6550n5SFFolf8TxXlhe8D+A8DVp7JGqSWTg3V1Z8Gzk3E5l3i5ndj0SW/+S/yz1WRFPzZXLZlEfehyLTT5RX2fjDqkfRhD2yKi4lcDjUOL+5NnIra82j8d840qlC4FWX63X7fEg1UlIH/n6HIvsBcfdx/cO4wu51KnsECpHOzEPv3SJdXk2fqeMQgFez9pgNrzU2HJcMjxerWuFp3fkG1JGTltwQtNRTKf363odrvuf1IXSfBicnCecdB5oTekS/nOiWcX3iC+igzc3GJdzJ/brpaqBfq66DeGgpl/d50X11BARZpVYq7+uIG5pkGYZwuaIwySmuu6lTAaoNpeH7nm3GwD1HwXJ2tJYl/ljJxWAg3qh3EyB5d2PKnl+2eFwiul4WwA/RXQJrJDKQsRi3H7KI/bj1A2D/ZizCyKsBSkh1oFtHilnJfYM7x75SrL2fhM8ymMq81f2kNmOqmeZfol4vFOQ0ihTlHluCULx7d0qgdSPvnbnq8fGpgIlTxZAuXzbGxDFW1gcc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38100700002)(41300700001)(2616005)(66574015)(83380400001)(26005)(86362001)(1076003)(36756003)(82960400001)(2906002)(6636002)(37006003)(66476007)(6506007)(6512007)(15650500001)(4326008)(8676002)(6862004)(5660300002)(8936002)(6486002)(478600001)(316002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2hLdDdrSExyZGg0enJzbkpTV2hBTWFUTzBIem1oMzdKVnVuWlJWdlpzQW81?=
 =?utf-8?B?aUFaVlhtZTJodkg3ZllVL1dlZWtpOWJobVozVUx1UHlETjExb1hHM3BDUkpU?=
 =?utf-8?B?ckZ6REEwOEV2Q3ZOZDd0ekE2UTZsaXNiaWZMbk9leCtScFA4STFwNGFvckNH?=
 =?utf-8?B?OHhPYlNxT1BoaXBNbWtyR1ZJallyWHkyTmFlVldSOXd5LzUveVBWRERZNjBS?=
 =?utf-8?B?V1hpRFpTQlpaVHBzODhPOFhOcytGNjdhbmRjZHFiOFltQklmUmw2ZkErVXI4?=
 =?utf-8?B?dkhwYVBpeTVLMlZVYVFnVnFyVFdxY01kVzRxVThEamRvUjBYVVlyaEk3WSs0?=
 =?utf-8?B?SGhJM1loa3lGa1orb0p3K0djdWlXdm5MdjVVWkw4ZmZBdEJETGU2a24zcElW?=
 =?utf-8?B?L1NYc2JMNTNsakNrTDVZMHB3VW1Yc1J2c25YWkRlekRJYWQzTHhQdEVCQ2V0?=
 =?utf-8?B?M0Z0SnowNlgzeFNHeGdDcHh6VEloRjR3VUNVMUpTZUE5c1NSM3U0bUJ6WHA1?=
 =?utf-8?B?S1dNcWxYRGE5UVRSZFYyaHZJbytxYTZBSGxkdXJUTjE0RzhFUngwZk9IbGRx?=
 =?utf-8?B?QTR5ZUVJSjBkb2dINDFJMkRwWXY1MmhtZk1MQSt0enpORkNRc25KZy9oeDA0?=
 =?utf-8?B?d0Q0NTZPMGlTTUVtZFVPdDY5QkJYSHN5QndFZGFOWDFLVHlZSTN0WFVSdS9R?=
 =?utf-8?B?MXJ5aTN2bndvaDZSRzA2SmdSWmRKa2o4bFlqeStBK1JOaU1SQllpKzhHSUE0?=
 =?utf-8?B?Z1hMdU9sNlhlc0ZPNUF3ZlAwdmFyWE50enNDYUZEZkdBWUpENVBFTTByUHFr?=
 =?utf-8?B?WGlVYTNnU2xVR1YxMFkzTXd6U2xGVkpLb1puMFV4ZHlYZjk4TG1JbFdQdFFq?=
 =?utf-8?B?NmIrcnVIK0VPWDJwOVdLQUphbzIzTXJDQ2dCVEVWQU9FY0x6SVdJbUUzaFBH?=
 =?utf-8?B?L0hVcUFtMm0wK1hrSDlSaEEraHh0SDNJSEh5U2Fob3ptbVdxS2p6SzhNRjFC?=
 =?utf-8?B?aENkUVFYR1JuUmZhVFhHc2JEcHc1eVdwZW1Yb3JicFB0N1RDcWp3bk51T0RK?=
 =?utf-8?B?cUJpWUZ3SHRTdFllL0xzMkpJM3lOOHBCb0YvWThCT3FqZEhVVzJJSnhaKzBw?=
 =?utf-8?B?dVFVK0VtcDRFNzg4Vmo3UFh3OFJtdld2bDF5eDl3Wm4yR0YyV0EyMXdvSitQ?=
 =?utf-8?B?UmdEQ1NNTVp1V3Z5S2xaN0Q0ek1SWFc0SFIyMXhNb2FsSVJDYVAzT1ZiUXZ4?=
 =?utf-8?B?dTZYY1hsQy9MenkrUkhVTXQ2RkRCSnduWEVsTFhXU0tJVUZUT3hqa0ExRG0z?=
 =?utf-8?B?emZsRVdzRFlnbEVUWk1Sa3NrcTM1OWFHbDRTTlNPL1BIWDhNYUVFZm90SmRK?=
 =?utf-8?B?Y3YyS2VxUDdobXBWbkpuSGR2TlpWNFFYQ1NWcXl4WkhwMGpPdVdJV2VwNzFO?=
 =?utf-8?B?VncxSG9uclFWVGc1cW1OT00wUTBwOGI5akRpekx4Z3IzUkRBR1hEdnFjZFJx?=
 =?utf-8?B?Skt1SnFGYkZDa2pLZ1IxaHR2RnZBRVN5T285TExZQVJWY0NrdVNTS3RpZ0Ju?=
 =?utf-8?B?dmc3YTNjZk9iQzBWR3RYWSsyQ1ZtT2NyTnVCZ1pOdnNjUHBVVHI5UytyQUl1?=
 =?utf-8?B?Ri9YamNOeUZmRjhuMUZLOU9KVUN5RW5ZSGNyS0FOS0VWSFBVaU8wR3p6OVEv?=
 =?utf-8?B?UGJxL29nTGY2MFpzMitxUFpzd2FKM0NPekF3Qkg0UmozS2FXYUpqSmh5Wmdp?=
 =?utf-8?B?Ukg1Y1JCZmZzK2Q3TnJ6TGswV0JWdHYwODVpTndkaGlTNENzN1QrUmk4Ui9p?=
 =?utf-8?B?R01NK0JGb0hNYzFJcU1KRFJ6MGV0N2VXaWhBL0tuUG5IQVUxSWZBc09JQndU?=
 =?utf-8?B?R0VNbWtsZ0tHTld2Vm5nWjlnU3Qya2JoWkp0RVo1Z2x4RzZvc2lMWjk5bHVU?=
 =?utf-8?B?NUpEc2tLWFNKekViY1NmV01WR0xSUmxDa0MxYUg5enFqTmpLdEVHSUhOSUFD?=
 =?utf-8?B?cTMzdWMraXhhc1ZiMjVWN21VR25YWjNsNTd1ZHIvaXdCZGhwV0FHcCtoRDBM?=
 =?utf-8?B?VzBzby9HVWFRbUNRRUR4emZGN08xSVNaV01Ia2FDUU5EMytxWU1PWEpZdXht?=
 =?utf-8?B?UHJKYUVzSGxIVjlyYVNIb0g0TWU4VUxtVUlEOGpFdE5HNjFrZjRFcHRmVFgv?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 363d842e-d6cf-4c60-74ff-08dc08b365a7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 21:16:17.8395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmsjbT4yXp3yNQbxqcLimPU8ItH6BSeN4Gd72ZOLE4ftpR5QhPavR9Or9ixhblZzqPbwHMo6+9v0gW09VpU96ZKkItYCFy6zLESPfbJOYaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2023-gru-28 00:58:38 +0100]:
> GuC Relay infrastructure is ready, start handling relay messages
> from the GuC to unblock testing on the live system.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 8f208267ffc6..c29f095aa1b9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "abi/guc_actions_abi.h"
> +#include "abi/guc_actions_sriov_abi.h"
>  #include "abi/guc_klvs_abi.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -22,6 +23,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
> +#include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
>  #include "xe_map.h"
>  #include "xe_pm.h"
> @@ -969,6 +971,12 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = xe_guc_access_counter_notify_handler(guc, payload,
>  							   adj_len);
>  		break;
> +	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> +		ret = xe_guc_relay_process_guc2pf(&guc->relay, payload, adj_len);
> +		break;
> +	case XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF:
> +		ret = xe_guc_relay_process_guc2vf(&guc->relay, payload, adj_len);
> +		break;
>  	default:
>  		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
>  	}
> -- 
> 2.25.1
> 

-- 
