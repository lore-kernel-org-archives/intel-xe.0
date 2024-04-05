Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D068AC67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 12:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6680310E549;
	Fri,  5 Apr 2024 12:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BiVTWMYY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A1410E549
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 12:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712318627; x=1743854627;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=LKwmquZRNZC9frsNvtPeke0t8rSYAhFnY1j2GCq7I0w=;
 b=BiVTWMYYqXW6F9lQfPks6PyBlsewFB4Kj5Ua3afqE+ZkcZqkhxJgoY13
 vTLgir9+SZGIrMQej1KOZRBMovbCgGuXoY44ZKHHO4wzGsf2tmuSvXf40
 g+dl2EPWQDpZBqtVAuSKWW54aP1ys2GyclghIrnA7qvJjxweIYNHhGrEn
 sMlYQPStd8LpeC5oRm4WZQJZLpnVSbYKizZiuvHWEgNzfZjpWz4wyU1MN
 t9zvd0yf5aKBYCMbwiNGavgOEe62EF3k+P8YlynU234ie7frO6cSeeuXR
 fgIEZODBSgO8kclBY3kYuJRMAAs2KmqRnH4NPelh9AIUuzwr/kWttk7RR Q==;
X-CSE-ConnectionGUID: 2MVI1Pr/TbKC/NXwnoW49w==
X-CSE-MsgGUID: 7IN8Qk9FQVeA4g2mda2NIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11419972"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208,217";a="11419972"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:03:47 -0700
X-CSE-ConnectionGUID: gx1hC3NrRvu/RnuSr5ngdg==
X-CSE-MsgGUID: l0yaur9YROuyLhGk09dkFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208,217";a="50380093"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 05:03:46 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 05:03:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 05:03:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 05:03:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0SVh3x4pcfm5WIJfD6V9s/7pfqxB2JFIGG2mQujwht6v1SJwgrgfHia0GkQMih0fcWyjtCWCUm49rRWCo95FeUIjHBtZO5g32Jv1b348hFdPQfW2P4P13pRxrhHe/2b6wumJwBmeMtA5FQPB8rpRwY3zRHHKxS+Hh3SLgrMgsbxzSpOPrljEDIwGrzfBHKTE935fK5i8x7LjIt7iIOsvrJyGxYfzek5ZALqTXqEtSQHcLb2/v226KBAGCh64n5FIMY4MRIG+86njoDRdsqNcKZtzZmGTLd/zdqhk+CFh4LHr6AvmUZUZiz3Eu8X7u+RuDDmJYoCwRB5IyIIPXwbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grkDseyNiL4TjLGiJjORV+Pv7Hr7Nlfv63TW5a5Gne8=;
 b=TFlBOrDpX9IZfSp+QB8EDFYd1S3F3eodqqjEREXkj/Nz105khmJ+bp2GJqi9F/1Y4cvUY5u1qqJO93fs2erupT0dmIPQeQN+kiUUOwbflqB3lNa0IXYCsRTSXhWjqL8bMTR5BXW2Y6Vs53prfdLGixbEjmunR+pLZUzF5yY68b7GUeVbWfC5dejSPcQA5L1ELWzZ60nLjLE+TxrXPfwVCXmX9qYQP+X70IbJizaFKIhv26+SX9pacBhcpzlqduGoSoI2+mLRby+RIemMEyNCaGdzXhVJEIR8YVFyjNrlikofo6koctYdcciuuDyfxW+pRmUMEDbc6WpciLnUDJnBKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 12:03:39 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 12:03:39 +0000
Content-Type: multipart/alternative;
 boundary="------------RiizJntUDkVESfeYnuzYq86d"
Message-ID: <2e9233d2-26fb-453f-99ab-f1688c091d45@intel.com>
Date: Fri, 5 Apr 2024 17:33:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Drop xe_vm_assert_held() macro definition from
 xe_bo.h
To: <intel-xe@lists.freedesktop.org>
References: <20240405113844.803-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240405113844.803-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: PN2PR01CA0218.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA2PR11MB4907:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LvgnXtikR4c2zlypx4UJgx9YFSpHEktzq0EN8ilOSCqWeBs8y0kiZ+ppLBD4IVWgtjxswbjNhu62HSgzWOQr1Scnlu5CKR8Ox3BPeokfbR/U5MVn1bOaHPjXvzJqVI8IMGC3/vPb5x+YNfZLvP+isVUulqmD1XGcz34Aa2W5yK6uqBYr5ZTWo9jk//yFGdbmEulyq7XlSXYFGIdzSg/QfmtqZRilqqqqCMUvJuqMzZfigLFixLw/pEsIE3Hr+uD+DopGL624Kkl1bAPVn8k7gh9POvNzy+n81JcWHM65W2SzXPs6BNWCklBV/ulsVCwGPqn/VLFItLYa4gd1zZTL8gJ+ElupndwGO5kXo/qVIBFQ43k1/jMT1f02T179k6c4Od8A1vxFxKmYQ8P+nhdxnQzFzZqc2ModxRAOqzaHZmTEKusgKf1DNDbhlPlOazw8qCVy9l7Q3ZKBcr1yIKvo726kVAzrC6EdSQwR07NyvssQ4c5RJ5RiM3IgOz7WefHJfPL6JCkUISfd0qeqydt73o8GTtHl+QCxqv1DCGxDTwbZVSZ6bql1pHsKYYg43T6aAK6twTdlwANhnAVircuA/Ov7MfwlkCiAD+dT+4MZahwKhMI6pGNdbxWBaKy+WrIa9jriJqVNy6dCc8C+m6rMvjAZ9OSTW7QpHWBMT0LHkcA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTlXSDUrZVVES21IOTI5VE41aEJOQ2JuSHROY3JxZURjV0E1OUpFY0JidkFL?=
 =?utf-8?B?WnNXeFpPRWVEN01KU0lpNjU2N3ZsWlowUW9vTzZhb2w0ZTY0eStsek03eldx?=
 =?utf-8?B?M1VIcW56Q3NzYnRTN3gwL2EzREtPT09HVXRvT1pSeGltV1dlSENtYVF2eHND?=
 =?utf-8?B?NTczalFRaGhCT0Q2QklFWkEzNDh6U1lDakI2Y1NrVEV5OXVQSE9VQms0dW4z?=
 =?utf-8?B?cGdUdVZLc3hQSk1zTEpqZWFmYkw4ZXBaUjVGM2c0N2Myb3B1RVRsaVl3eW9j?=
 =?utf-8?B?Q3NCaEZYODYxMDNJMGRSTHRqVXl5VGM1alFHOTlEK3ZnYlpkS3NnUVIrdm9X?=
 =?utf-8?B?Ri9BS29FcU52aEowbWtJWC96Nzk3Y1BYcytqRm1XZ04zWmRoRjJIQS9oeTV2?=
 =?utf-8?B?eUZkWkc1VTVkV3dFN1N6Z2NUbkhtNmpTZmp1ajNZN1cybnYyb2dpVEdvUTBY?=
 =?utf-8?B?ZjVxaU9kVkFYOC9WYmp4OVJ6SER4K3l4NW1KQjJUSlJqSFB6V3VnK28wYS9J?=
 =?utf-8?B?ZEg1Vm93TXhNQ2t5d09oOU4ra2Y5bVVCMFVVejlmM1hTMTZCYjBQZnIzRHlT?=
 =?utf-8?B?Sk5RaXJ3azVKM04yRU0rL3pmeURKQ0lRVVZVVEw5RnlsZGg0dk4xcVNLYlU0?=
 =?utf-8?B?MVNaaThNTm9DMXZZdWlUS3FUU3BmY2V4Unp6TXJ3bkVzc0FOcWtONFE0bzEx?=
 =?utf-8?B?N3FJTGlRWFFQZTdLWW05cHlTMmtJK3lQYnFaM0RWTmx3YUJIZlN6cmNSc2hy?=
 =?utf-8?B?dDJMWmRpcDE0L0JsRkJ2bUdlRS9TbU5XVi9Sd0ZNckRYL2tPeEZaYzhZQUJ1?=
 =?utf-8?B?TDdOS1g2Z1BCSlE3RVl5ZjZ6UE1xakRKSjdvOVZ4VE52cnNxL3c3NGorREFy?=
 =?utf-8?B?MmRqTHd5TmQvNi8vUVNNL01EUlRYc2pVOUdDTGZRTFgxRUVEWktEdkZuVGtE?=
 =?utf-8?B?MWFqL2gybFloNmFEVDVnellyUGRDTFYvSHNoVmZFOEVWa0RCSnEyVlFVdTE3?=
 =?utf-8?B?NEx5YmE3UWxwZ3E0RHhUZFFIcU9pdk5zSFNjUTc4OHlORzVWNzBnQWdNSEN4?=
 =?utf-8?B?UjRzZkJKUmxRSUlKU0JRYk5WQXV3WWhSYU1vM3d2L1B0eTBoVFN2QzVkUUxX?=
 =?utf-8?B?MFRMVGxqTVFUNndYbDJVVk5DaXF2VVc5U3QrUGNpMHUvSjBkTmVFUk9LOFB0?=
 =?utf-8?B?V1RtSjFXSS9vdVltdHp6OFRYL2xYMHp5QndzdEkxSHUvcVdFdkIxbkZkc0Z5?=
 =?utf-8?B?WjZkKzF6akp1Y1pNOERlcG5TbDZORDYxM2tEanBlQUJZSllCL0VCbHJ0ekt3?=
 =?utf-8?B?djdEM2hKOWVmWGZWNU5vb3YyQWZyQXZOK2ZTbUdRc0l6ZDhlUUxUK0lKdTBw?=
 =?utf-8?B?Sy8rMGdGdXJmWnZYZmtoajl2bUF0eWJVeG1Ud3VRbHRGSUZERW45OFRhSFM1?=
 =?utf-8?B?NGZqWW05c0FuUk5MbVRMTWt0QXJteEpQQVpQZE5oSXdYWi9KTTNla2orc0s5?=
 =?utf-8?B?aWFrWU9JYTNZZUdHT0FCRVpxMzAzaGRpQ1V6bnczNGh3ZUtVdTM5bGt4Ymsx?=
 =?utf-8?B?OXdtOWVZdDMxaTFENkZETldhWCtPcFVDSXVXcjZrT1Rac0hlUlU4L2V5a0tn?=
 =?utf-8?B?Rnk2K2VEbHhhVUh3aFZ5cXEwOTdhRFVyUU1FRFRTSmFnalpqQnlZUUlqZ0tt?=
 =?utf-8?B?bDBNMjBzTHZXTVBBSHhOQytWbE1sdm04MWlQVU1ub0NHRE5Vb2ZBTkhzZldT?=
 =?utf-8?B?MXAzbFpsZlRNLytMcWgwR2MrM2k3MmxzZlh3dklRQjBhalJaMDlhWEVPNkZm?=
 =?utf-8?B?b0poUUYzMjZmQ3MrZDZ1a05EdyszajUyWWpBWVZiM24vdFZYL0dOUU1BYy9m?=
 =?utf-8?B?Y3lXV3pwbXFjUVAwN29RVFFWc2YyNnJacHErbVpYR1ZSMGJjZEZCN0loRFE0?=
 =?utf-8?B?eXJ0S0cxZTEyS0ExaFA5YWprMDhVczF6N3FGREZ5YlBvMDFOSHhFSTluN1E2?=
 =?utf-8?B?c01TTFRUVkE5cGZ1NEswVzVtZ2czOGVjNDN3eUlpUXBkL1pjK3QxcUxpejFu?=
 =?utf-8?B?MzlSRkF3QTc5NmJ1OG1sRy90OGliWFdSZitueHp4Rzh0SGgwYlRXU1dEWUVO?=
 =?utf-8?B?NFlVQ24vaFRpbnlpU2ZjZzFBMEFJbzIwV3JJK1YvV3ZQODQrcEtlbzRxSlR1?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b12892c0-580d-442a-28eb-08dc55686dc2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 12:03:38.9720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNvBeeVPvpZ4V0RHfqOsmCqhYGbv0WUuSvwWZJ3yolnjwEDduuM22s+t5mwApaCSnYRXHQskst8uPL0oBrJngpaYzrlKnhqJCtaOT3X0nAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
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

--------------RiizJntUDkVESfeYnuzYq86d
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 05-04-2024 17:08, Michal Wajdeczko wrote:
> It is already defined in xe_vm.h and shouldn't be duplicated.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.h | 8 --------
>   1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index bae042b35fa8..8d2da4022a17 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -13,14 +13,6 @@
>   #include "xe_vm_types.h"
>   #include "xe_vm.h"
>   
> -/**
> - * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
> - * @vm: The vm
> - */
> -#define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
> -
> -
> -

LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   #define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
>   
>   #define XE_BO_FLAG_USER		BIT(0)
--------------RiizJntUDkVESfeYnuzYq86d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 05-04-2024 17:08, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240405113844.803-1-michal.wajdeczko@intel.com">
      <pre class="moz-quote-pre" wrap="">It is already defined in xe_vm.h and shouldn't be duplicated.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_bo.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index bae042b35fa8..8d2da4022a17 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -13,14 +13,6 @@
 #include &quot;xe_vm_types.h&quot;
 #include &quot;xe_vm.h&quot;
 
-/**
- * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
- * @vm: The vm
- */
-#define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
-
-
-</pre>
    </blockquote>
    <p><span style="color: rgb(13, 13, 13); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">LGTM.</span></p>
    <p>Reviewed-by: Himal Prasad Ghimiray
      <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a><br>
    </p>
    <blockquote type="cite" cite="mid:20240405113844.803-1-michal.wajdeczko@intel.com">
      <pre class="moz-quote-pre" wrap="">
 #define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
 
 #define XE_BO_FLAG_USER		BIT(0)
</pre>
    </blockquote>
  </body>
</html>

--------------RiizJntUDkVESfeYnuzYq86d--
