Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79E9C48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 22:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F25112EE3;
	Tue,  6 Feb 2024 22:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qs4HQfvr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0825B112EE3
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 22:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707258340; x=1738794340;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XDaHL/oh2Jzt2Yfytcu8YRwvQETqQg7Y2nxW7PP/J/A=;
 b=Qs4HQfvrrvkmKbAkrD8L1WljXK+VvqC/sEmQiw5edC+tb+BaqqXX7NLK
 NfXYjEKmh0HUv6c6UuTHWD4vPuaCpCA4HK2zOl68WLn8V8TtjodC1rppa
 Hc83tTlceMckZ9Kd2nB3b8U6f1qOTOi+hGUUfirEeOB3tqaVjH/OtjTD7
 t6Ohh58rJRk0vdz2q8ksLKPcglwZqjevLKWvbaaSnwOO8oL2GZBnDPelt
 a9GjEi5PTidvg3CTFXTyvdJy2yGo4wFkH3JbBsr14m1GBxaE3i5JkCSI9
 AfvcjlB/q59R5imKiPmOmJcBkOunRtsypidOPBuRcn601/MYbfg4FjjvK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="26301572"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="26301572"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 14:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5764367"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 14:25:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 14:25:39 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 14:25:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 14:25:39 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 14:25:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ngh8GyTAyd1TqLRK1cwafgahVA87kPJUevbnAnVTbY5/R/hVzDJhd9SiASOVazPcqAtT1lGOO9VoPK14v2wrTHtHAW6fAjq6qmWWmW0SSUlx44fEqsvYiXYaPfH07A+y46acTcildvUr4KhX70vEVxUx2U+saSJanHYpjccGSQBVPbbmxYCMR4obgj0HoBfY3qd5yVcdWlzi1gDYco6+NPAbDbiFbFR6jxYJe/Qzux4FHNq5VAqC4wuJBhgHAdwWOvTb3Uc9CC/lovG+LI1uqClGUtSUflaCnbbwT83kUrPSmVz7LK1MAAqTYGHHsfK4sauqBujU2v6GrEosJT8gdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buQcmntsHcgTzFjUkog3AqZ7A4PH0r2FIAV9eG7vpWU=;
 b=ORY7h6zGj4De+U06Fbe7DIwALocsWEQpT+/5qu6f+gPl5OVWmTQGvj4+u0nznodibIgibgWBDK62wLR5DPTB5lG+7mCWthoKdauTZGQsdcjfDiGvzRAulYNNlT4kK6Sx3kKlmIVknNVVipUlb3c1E0m2261o2xaZj7ruhHryF+mXO2AwIngeh2Y3Avzem/aJmHydaxOdCQluhLIFMhi+9KjkedUJfIr1KEMVvZRHpi9FqS+iMuNpuJ5rQW8HFwhoCsidEBJJwi1PCaKUeRpZx12smlfJjnRyZf5FVnumOZM/Zr/JPGS7eWpcPyr2q+tToLlbUAnR2tgZ7yind/Bj/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 22:25:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 22:25:31 +0000
Date: Tue, 6 Feb 2024 14:25:21 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/16] drm/xe/oa/uapi: Define and parse OA stream
 properties
Message-ID: <ZcKx0S6nP2eta04f@unerlige-ril>
References: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
 <20240120020026.1261201-7-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240120020026.1261201-7-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: edbed2ad-faeb-4cab-06a1-08dc27628771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scYIcTImlKnJxbi8LPLPpQtIr+ertcvtJ/3wfFQrhbWC4SnG2f7ma+5v9wwufu+/8BdWJ3V2PbsvcRFEATjg2qsnDVfyModjUik09H1/0E/zh5E6ulF5tpjr2UjRNS0MdvLfvOohMyOpI7k2yXFUG+3+jmSqGBzEAZiPLNx/aUKKYblG8CtUx94IZIBk3iplKu0p/MHjuYZ6ob4dbes1IPGL5k8IK0jVXJyHqz3ps7Twg1ue2hbBiJgay3CS0Dl6pM8VitIwPi7a7smTa8vWjPMZ7KvdY+8Vd+t+COMGowp3gkgKl/kw3goOkE961UKYFeHVzE7UkdJHy3qSbHHraN8mrV2lNioXAeoJb6dj8+of+fCr285LiCgT7X71A04NbJtJK+y5Td54qfwc6xrciw571wYClmaNAHBqaxFHt4WC93lWCpiq4QX6QoaclJVfqe9WLJE2cewufVQA+ez0SWyyqMLOdiOiSOcXIa15f2DtoZCHwKTWbfzfSE5z6ThcNNrFPGTLpfC/T82zE3hP0Plp+CnMyaGA4ceayxRWSDAzmkLFE+FAEtZTx6j56d8G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(346002)(376002)(39860400002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(83380400001)(2906002)(38100700002)(82960400001)(41300700001)(33716001)(66946007)(26005)(66476007)(66556008)(6636002)(316002)(86362001)(4326008)(8676002)(6862004)(8936002)(9686003)(478600001)(6506007)(6666004)(6512007)(5660300002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZThxR2g5VW1Rd3ZaVGZydzROVE1LWmhSUHI0YlJMWVcyamhQZTZvcU5qSFgz?=
 =?utf-8?B?YnVBSDN4dFVqZlZwdVUxMzJ5bTJxVVpRTFhvejhteENJM3VQV2tGeWJ2b2cz?=
 =?utf-8?B?UHUzT1BReTVibWt4M1hXcDFXWm1oQlNVR3JrQmlpcUZEN2FGdDloZHFVN0tk?=
 =?utf-8?B?ak1mZGVjYWM0TVprNlpSME9wc0haSmI3enFrbXJYNXJZTy9sTFpiT3N1NVlv?=
 =?utf-8?B?cVNSbkxBaXhKNXNXMGFKWTBHM3l0b3BiVzY4bFBhd0g3K1pNZ1YxbTZWYTlD?=
 =?utf-8?B?L2pNaklnbGszTlBGNllYNFFwemFlTTd3OGFZY2tsaGs2TlpMZldXK1V0UVNK?=
 =?utf-8?B?dnQ5ZXcwcHlrbXJkczZvTHJsRVFoV3FTdzR6RG14L0I1czluWUQ3cmw5VnIz?=
 =?utf-8?B?Yi9QSDFMMEFvNFcyeitHalI5ajFkTzVocGp3TnJzMllqOHlSZFdiN0xZYXBz?=
 =?utf-8?B?ZmZFaW92eHJRVFlzRkJHVVg0ejlJMUJjckhmZG5oM2x3VEZrRlJwK2ROdXgr?=
 =?utf-8?B?Q3VIajdpZmE3ZFB0NXVFUzFhTHh4RXZlbnE5Ung1VkdFY001QjFrelhFOFFJ?=
 =?utf-8?B?YmJrajZMbmZoZGpOeHZWdUpVdGp5RHpucUVhTTBRTXV6dzNubjdKM24xbjJH?=
 =?utf-8?B?aitaeGtDQjh5NTg5Y2Fwc3htOVUwR2pyeFhoOG8zOXJ5cnlsT0g2dG5HeDlT?=
 =?utf-8?B?Nm81VUZLa2c4dVJ0Y3JRU1pnaXY1dU9VQkFoWEMrQ1U1RmpRUGJSSWFWTTM2?=
 =?utf-8?B?WXNoNUovdXRaVDBNcjRNb25rWUZ1TDJFT1dlQXJsUjJUbmk1R3ptSmg5UDJ2?=
 =?utf-8?B?VG9GQjYvbUdZRzZvNlVXaDUxSXdPQ0ozanlWOHBCNWJTMzQ0NXBJT2V5bXcw?=
 =?utf-8?B?SXl1TGRlckZIdHVBbUkzUzUvQmpiQndtRkVtNGd6TkZwNGZob3ZOVkZzNDJx?=
 =?utf-8?B?UjRxKzgxVHlxT0c4QUJxLzN1UlBDWVdqQUR4Sk5xRHB5Vkh5M204NUMxTWM3?=
 =?utf-8?B?bGhtRU9uQUpTS25aUkRuTXFwT3VrdnovZW9tNlh4UnhMK2dpcHM3aFRiTkZP?=
 =?utf-8?B?VFNjZ3N0ZDNuRVQ0ZDRldzZDYVJIT21tS1huOTVIQnNmdmM2MkpaL2hBR0RV?=
 =?utf-8?B?cHVMbExOOEpxcEhCc3Q5ZE4vMXgrR2YyUUY4ZXBZQVlyMEk3b2plQ2ZGSHRK?=
 =?utf-8?B?UFJKZjVQRmFIQnlQRXNCVi81Sm5wc2NyOFlZUVdiODhTN01qZDkycldTNm9K?=
 =?utf-8?B?QktLdVdHbC9Wd3E3dTZsTGQ5a0F4SklmMnlpRHBrQUFBbkNyc21tR25ZTWln?=
 =?utf-8?B?N3llcWlKU2Z2R0Rrd1o1enZub3p6SFhEZ3NBdTNaN3YxRmRaVVBwcFgxOG54?=
 =?utf-8?B?SndWN21sVk51eTVSVWZNQkVaVlJkWG83dnB5Z0U3bnMzUHI2TGpRdXBnamFk?=
 =?utf-8?B?QUttTHZiM3VMLzBBaXNGa3BkbnBFb3AxOXBxQmY3V3pLMVJvamtNUFZuZllQ?=
 =?utf-8?B?cVJTSVI0Qlg1dEJaZStNK1BsQVJxRm9pNXVQWUhpL3NOQlNRL3FnWHhLNnli?=
 =?utf-8?B?QjJ5ejVnYUxlTkVXNzNPa1dhUkk2ZG8vTmxGSW40RkM5MlpOcktCRnA0RWdq?=
 =?utf-8?B?dThyZWZaV1VrMElTY0YzZmhKaGNXTFNyNFlCY05YRnZpcEtzZVh2eUp0bVph?=
 =?utf-8?B?c25GKzVuRDhCVFZzc3FxcEZ0OC9WMDRYNTBjVldnMlNWTnVZZFNhZ1YrZDRY?=
 =?utf-8?B?dWphQXVkZDYzTnhVZVlvbTg5djI3Q0JGZ3hPUGVyVkcyYjhlOEkwZDhlcnIx?=
 =?utf-8?B?K0lXSEpMVlh4OGZqTzk4SFBXcExZaWZKMG9aQ1Uya0gzUDY1M0htSnZGdjI3?=
 =?utf-8?B?SndLTUlraWxlaHpzYzJEN0hxbVkzaVUvOXFsTXJKYVBjU3BkQ3pOTkRsaEMx?=
 =?utf-8?B?ZEVsN09PaVB0Ui9weVZxZGkyT2lOWlQrbytnTS9ZcSs5R0hjbUJ5WHdQL041?=
 =?utf-8?B?K045aG5FNXJvbGRGQ1c4OTcwM1pqVVdwQkxsamVLejZWZUw0dVVKT2UycDFl?=
 =?utf-8?B?bHdWYjhSMVBWZkRLbzd4NWlYRE5tS202WVZEZ0hjTkRTYTkya0FZQlJQTHJa?=
 =?utf-8?B?dFp0WEtPT1cwSE5qQ21TaExHRHFzVVFaQWVoTS9QS1FZcy9wdnBDT3p5blR4?=
 =?utf-8?Q?hGZV2uO7T2o1CuhuBxzeCW4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edbed2ad-faeb-4cab-06a1-08dc27628771
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 22:25:31.3944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PuafrhfSQGz4IfG98zZCfeEi1mMTAoivu6zRT5XxkNdpweeTEbfrybL4Q7ZFbvQ7tmRguMJlkmrMrU1eAYd42dianjZ8XsmCA/mYYCUeqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7636
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

On Fri, Jan 19, 2024 at 06:00:16PM -0800, Ashutosh Dixit wrote:
>Properties for OA streams are specified by user space, when the stream is
>opened, as a chain of drm_xe_ext_set_property struct's. Parse and validate
>these stream properties.
>
>v2: Remove struct drm_xe_oa_open_param (Harish Chegondi)
>    Drop DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US (Umesh)
>    Eliminate comparison with xe_oa_max_sample_rate (Umesh)
>    Drop 'struct drm_xe_oa_record_header' (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c   | 344 +++++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa.h   |   6 +
> drivers/gpu/drm/xe/xe_perf.c |   2 +
> include/uapi/drm/xe_drm.h    |  69 +++++++
> 4 files changed, 421 insertions(+)
>
...
>+
>+static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number,
>+				 struct xe_oa_open_param *param)
>+{
>+	u64 __user *address = u64_to_user_ptr(extension);
>+	struct drm_xe_user_extension ext;
>+	int err;
>+	u32 idx;
>+
>+	if (XE_IOCTL_DBG(oa->xe, ext_number >= DRM_XE_OA_PROPERTY_MAX))
>+		return -E2BIG;

If we want to pass multiple exec_q id params (like discussed offline), 
this check will limit it. I think, for now, we can leave it as is until 
such a use case arises.

rest lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Regards,
Umesh
