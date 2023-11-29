Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0E0C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 20:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0333C10E66E;
	Wed, 29 Nov 2023 20:12:20 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 20:12:18 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B7B10E66E
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 20:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701288739; x=1732824739;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LwTHOdYHyKXsPxztPHc4cBFtLJ0RS3OHVmEregpHtQQ=;
 b=ew2Z1Y0TC/OEEr8KypxKsb/d7RZXpv7lLnkH18x+Au1xuWCqX3awesX5
 72ObrRrXrAYbVk18F/OJi/AlffQqlrCZ/kjRoFJVw3SDrptxPAWNXCxyP
 WVQcl81PViURT72LvH4R5eUUwfBqhJOUMwWqGv7THg4acUwt46v4R6BAX
 9nRHQ3B4f3Gcpuv3zCe3k2LhfCZlmEVy2ck0pByX99GOtSdXMQbKmsLlf
 tj65ubRu7yBUvKnXKIjnU9poL23NFurOUBw16qts0Pt3g5Py5w1n6/Xt7
 rkPJpTq6OD7zQ1PTPd0PhXKRLPWCFVBFbaGQdwaEEXMq5qw7oFMw4Be/l g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="121019"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="121019"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 12:05:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798033761"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="798033761"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 12:05:11 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 12:05:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 12:05:10 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 12:05:10 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 12:05:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJaT+BwxtB/6untiWY740/01CV8tF1vXZN+Jb3I0zM0g6TmV5JCZ5erDhxp/rsZIcfdCqZcKw2Fyu9bspZiuy817GM6WLDVrV31NyR2lNirL8PugGRkLad3Ytgh+Mz/Xqe2dQWld810CNT0ITo8ZFmHnWhCaGKj+iDF0VQxWaQqKlY2pqwaaS7R8dYhl6wyTnGjK94EqUhUrjUTvglN6YB/nFb4DIHMFp+/mTHbIFs/JwnYRiEt4wd7W09ym0W+Bs1VLXGxpNrQonEsNQbnXZsHzqMMvi6yBw+m3TnLBCK17+EHmczMgbm93Jn8j5eY1hbUnW/+bdTb64L7Weu5ztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HasATh7ho0yNd9EA1pbJItDg9YwPw6K9b+slwqo17Z4=;
 b=IFZH+nxkEp74ygnLUxNXzhImf3dHvf7u+iBq3sMyqnIzQYJFajtIA5AGFbwSY2P9KXc18kSko9+1ABpVM0biq7wCoY/wBEiWkdiRAUNX+CfS+O7YvkkxXAJWIHNYC3jDEuXYHchvZ+3sgs099Qmtn9IUg7/2zOdyM7zuNS1ho9O1wbmQkQ0aeHi3Tnwdz7HSZ+Pt4xXigp6c85doC5/500lK7wjmmI26uQ7El0MDrsa1hfyC6SDzyc0NrNALo/3QK62wK8JTvNTQlVQ3PKMSWwVG8gWrqwkFUOv0RYB4dgeuJCsOWr/OOqiRgpc+X7TshQyAGDRamsPyYsgRKMTXhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 20:05:07 +0000
Received: from BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::a1fa:aa5b:37c0:5b98]) by BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::a1fa:aa5b:37c0:5b98%4]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 20:05:07 +0000
Message-ID: <b9e7347c-f1a9-adea-1d3a-a8a480e5dbd8@intel.com>
Date: Wed, 29 Nov 2023 12:05:05 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231129011721.2793482-1-daniele.ceraolospurio@intel.com>
 <20231129011721.2793482-3-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
In-Reply-To: <20231129011721.2793482-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::13) To BYAPR11MB3398.namprd11.prod.outlook.com
 (2603:10b6:a03:19::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b1d16f-508d-4fd9-5dc2-08dbf1167b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Twq7AoM1qi6I+rrjFNbYf1BpXW3oy/y/egdlVSjn7Z9N//nScJtK4nSbET9IWaN4M+2PyAFfGD8xs5lrUSESwD8huFyQ9175EDQkXDSHsJVsQfgClSyEmsrIm+B378U73wupZInQeRlaQnQz86kMlTWYFze5HCFV+ur80zsOwsxb/cQwH5Vb39ZjHG9xF++lUCqH9B+Ly1Ytf1R2H/dsXAZKq6Sxc3SwRh9iTucDiPP8yMkSxwVcADypFViD7bNhXMsxS7WTrPuQA47Mjycr/GThNJyzYWMC2TPoM4trsbddEfdl646DbS/cavAdxqSL+3sVHmvHPrsnFj1P2Byw6247QO6Mbb53GgJV9NgbDao81LzAUxl4wKGOsmA8hLf7vsKY346LlRqSVXlWPv9s8I14eFFsYLux9jg+oyYuIceoadvCAFl15KUJFNbABXQTe+90/1OoQWUmWpj8lvalFPRmQs7+dUHk1gFQ9YmOT9xn6CP2/JZcbsQUJc3siMdEBIyyFm+FCSxp+H2ovD5W+IRBCksJbCfkIVSeWWR3niM4izH9P9Dnz+MXuPLTXN9cTqrtbRlwylX1yHilZddzU+T9L+y9y7EtnRimU39cJ6vrmu/tBXLxVdKvitwqBU22ITty1Nvd0K/axezzL6G9zUxaGvC5dl3K+OBuKBoRALChmk6VX8gBBe/5x8bDMpBP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3398.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66476007)(36756003)(107886003)(26005)(2616005)(83380400001)(8676002)(86362001)(4326008)(8936002)(66556008)(53546011)(66946007)(6506007)(316002)(54906003)(2906002)(6512007)(478600001)(6486002)(5660300002)(30864003)(82960400001)(31696002)(41300700001)(202311291699003)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU1lL3JwVndUVmlqZjM0My90TU4wTHNyeXRQYVM0d29iOW05cSs3TXdwRnVo?=
 =?utf-8?B?K2lHWHFvQWU3Qm1GSE1mb2M4SVVxU0IwNzdNaitBQmp6YklhUUcralFZWEY2?=
 =?utf-8?B?UzFGNzBwa1liK3VyeHBRRk5VTHB1SksyYnB1aHNsSXcwUitOeHgzb2dEdTR0?=
 =?utf-8?B?RFFwNk92a2NabDRHSklma0FRelpQMFlBaGtEaGpWNWRRMHYza3lzbjcrMWdl?=
 =?utf-8?B?UytOcHZET0g3VkpLRVlYYXlmRnhaNDlBRGExM0FoVmQ0cTRnN0h5alM3YkZ1?=
 =?utf-8?B?SVFIUTIyTng5TVFQQ0hYRHFTT1E2TFE0bVEyYlljU21RMVpZS0laVndVcFNJ?=
 =?utf-8?B?d1JGamlMZkNlNHFOM0xQZUNScjVPRVhmN0ZkMGxNUDlhMytvaGVtWUdFTDNl?=
 =?utf-8?B?SExqanlvUERBdlcrUEU0RDFxYk9vMGcrQVppK0tjTUlIMEFSVTVsQ0VZaXBu?=
 =?utf-8?B?M0JCWXJaQ21DNjNUZ1RKNWJKaDVGeTlMRld4NGdjbUZjU2txeENPUy9FWXVM?=
 =?utf-8?B?RzBqYzFnTzIwU1hvc3J1NUdQTE1sSFJTUFlhcUthTTdpNjlGTDB1Ri9ZZEN3?=
 =?utf-8?B?K29wNmV5TzlYdTBDaXg5NEVBTWljMVhNQmR2QVdWcUdIOUhBNHdxV29sSkNT?=
 =?utf-8?B?VWJYbW0rWFVzcTMwM1Q2RDg4NGRiUU5rcjVSa25KZHhldGwvR3RKQnpLUGhP?=
 =?utf-8?B?RjVSNXZiWUJXS3RNZlowSk54bC9QU1l5T1h6aTJjZEtnQ005STZEMW43SWl5?=
 =?utf-8?B?UGZXeENjSDBCMHdsQ1hjU0JYVTVDOFBEeFRPaitJaUFxQ1l5a1RaejRoNFE1?=
 =?utf-8?B?eFc4cnkvdDlNSklwQ1lhSC9TemtXc2wra0pZZWVqMlpKcnJtVXcxVXNQMnNR?=
 =?utf-8?B?aUtsLzVZaTZKUWVXQ2d6NGN2UUVsMDE4K2NkRktjZXVpWWE1WUdOVXRNMlR0?=
 =?utf-8?B?NkdPOGlrQTJYTnp0TmU2dEZTelZrQnVJcWNHeU5NZWpsejJUSG1BdFJYeVdN?=
 =?utf-8?B?dFQyYlhBZzhqRkVwRDVZeXRMMU9IVjMybEljUGxWTENjYUtYajJwdksyRjd3?=
 =?utf-8?B?Um9EQkhteXpmZWxZOTFkRkxuMWJjWkwrYy9oWWduYk51RWpoNEtFSXNyY2lE?=
 =?utf-8?B?SVhTd2p6TzlRR0JkUTAxVXdDVGRha0NTVXFSZUo0aDR6K2lpQTB3a1Z3WWRJ?=
 =?utf-8?B?T3hJcjAvNXBHMWMrTW55NElMTlhoSUp0VHZKN2tnR3ZPRVlZTUJEbHptUlRq?=
 =?utf-8?B?S0tCSmtRdFZSSit3WXhYamt3dHd2eUJnV2R3em1jTzBJL1p3cG5MZmxTWG1l?=
 =?utf-8?B?QUxEM3RzSUI5RktDU3grNC9qM1JGQ2FVdmVzOW51K1VBcGRNMlFFVklLSy9M?=
 =?utf-8?B?QlZVZ2RldWlsMCtlQTlPbnVxWldBZGd2N1pHSVB6OVlaUnhEZkxUa1Z0eXhk?=
 =?utf-8?B?SWtFdTlOZW5CUEU5Sk80VGwyOFR3clFhV1FwOGIxblhNMU9kbHZUOC85R2do?=
 =?utf-8?B?d1IvUjlPMjVkOWVzc0Y2WDdwTWlOTnJ3MFZYTWw1WkdJeU9acjREcEM2UEJm?=
 =?utf-8?B?WEdqN3BXWmhtQW82Qmk0T3lsdzJ5T2daTndxMG9pOGpDSVJ5VldaOHhyUFRU?=
 =?utf-8?B?ZHJVMC9iVmdPaUdOLzZJcUZ0VVdObzJUa1F3aWVPamdaSHd3ZFhxd1NUYU0y?=
 =?utf-8?B?Z0U0K2UrT1dRZTlmUUtUL0FCZ0UyQzFSZDEzODVkV3RmclVVTEpUSjkwN21z?=
 =?utf-8?B?R0dXa2ZEOTBEdzFDNS91clVNYXZmT2szeUUrRkw5dTN2V09XMjNTWDB5blVl?=
 =?utf-8?B?YzdKVml3NG9vUjUvd0d2YUN6N3l6VXlmdHhxd1dOZHRrbWVXNCswaVg0Z2VK?=
 =?utf-8?B?VVNveklzNXhsU2JORVZDOHRVWXl1TzRtR2wzUW9iS2xSdGRpTFQ3eVJaS3M2?=
 =?utf-8?B?c25UdUFySVI3V1pRdHorWU5KbEMrZ0FHMU9sOUVrbEI0a1laVW5URHdlSCt0?=
 =?utf-8?B?YjRTYWFGdGs1WWRCNFhEK2JwM1VFbkZycFhud0NDN3diM3Frb29IQ0U4RFh2?=
 =?utf-8?B?c1hlSnY1Q1dXeFQ3K2U2Y2NBYXRUOC91ZnpvYWZsbWhESU1MTERqd0gydWtV?=
 =?utf-8?B?OHFyTzFOd0FoNXAzeWRiVUhiT0Q3MUYzYWd3OER4L2U4U2VDUUFzSitOWmV0?=
 =?utf-8?Q?vQp9tx/R/o51iQfafyPFHAs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b1d16f-508d-4fd9-5dc2-08dbf1167b95
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3398.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 20:05:06.9726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lIjLV7TQngUfUDdRR+6PT9cmafBS6XD4QAglpLwo1Np1QdiqWZW2ldE71OrJlJ+hQGdeOnsz3ZqCqjURmAHl6UfYVBLWmgFG2E5nNSUxhCefbzqmFkeMtDHzkpmBeqi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/huc: HuC authentication via GSC
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

On 11/28/2023 5:17 PM, Daniele Ceraolo Spurio wrote:
> HuC authentication via GSC is performed by submitting the appropriate
> PXP packet to the GSC FW. This packet can trigger a "pending" reply from
> the FW, so we need to handle that and resubmit. Note that the auth via
> GSC can only be performed if the HuC has already been authenticated by
> the GuC.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |  59 ++++++++
>   drivers/gpu/drm/xe/xe_gsc.c                   |  14 +-
>   drivers/gpu/drm/xe/xe_huc.c                   | 141 +++++++++++++++++-
>   drivers/gpu/drm/xe/xe_huc.h                   |   1 +
>   drivers/gpu/drm/xe/xe_huc_types.h             |   5 +
>   drivers/gpu/drm/xe/xe_uc_fw.c                 |   2 +
>   drivers/gpu/drm/xe/xe_uc_fw_types.h           |   3 +
>   7 files changed, 218 insertions(+), 7 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
>
> diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> new file mode 100644
> index 000000000000..57520809e48d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _ABI_GSC_PXP_COMMANDS_ABI_H
> +#define _ABI_GSC_PXP_COMMANDS_ABI_H
> +
> +#include <linux/types.h>
> +
> +/* Heci client ID for PXP commands */
> +#define HECI_MEADDRESS_PXP 17
> +
> +#define PXP_APIVER(x, y) (((x) & 0xFFFF) << 16 | ((y) & 0xFFFF))
> +
> +/*
> + * there are a lot of status codes for PXP, but we only define the cross-API
> + * common ones that we actually can handle in the kernel driver. Other failure
> + * codes should be printed to error msg for debug.
> + */
> +enum pxp_status {
> +	PXP_STATUS_SUCCESS = 0x0,
> +	PXP_STATUS_ERROR_API_VERSION = 0x1002,
> +	PXP_STATUS_NOT_READY = 0x100e,
> +	PXP_STATUS_PLATFCONFIG_KF1_NOVERIF = 0x101a,
> +	PXP_STATUS_PLATFCONFIG_KF1_BAD = 0x101f,
> +	PXP_STATUS_OP_NOT_PERMITTED = 0x4013
> +};
> +
> +/* Common PXP FW message header */
> +struct pxp_cmd_header {
> +	u32 api_version;
> +	u32 command_id;
> +	union {
> +		u32 status; /* out */
> +		u32 stream_id; /* in */
> +#define PXP_CMDHDR_EXTDATA_SESSION_VALID GENMASK(0, 0)
> +#define PXP_CMDHDR_EXTDATA_APP_TYPE GENMASK(1, 1)
> +#define PXP_CMDHDR_EXTDATA_SESSION_ID GENMASK(17, 2)
> +	};
> +	/* Length of the message (excluding the header) */
> +	u32 buffer_len;
> +} __packed;
> +
> +#define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
> +
> +/* PXP-Input-Packet: HUC Auth-only */
> +struct pxp43_new_huc_auth_in {
> +	struct pxp_cmd_header header;
> +	u64 huc_base_address;
> +	u32 huc_size;
> +} __packed;
> +
> +/* PXP-Output-Packet: HUC Load and Authentication or Auth-only */
> +struct pxp43_huc_auth_out {
> +	struct pxp_cmd_header header;
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 020b7b4c6ffc..4aad6a8c9dde 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -16,6 +16,7 @@
>   #include "xe_gsc_submit.h"
>   #include "xe_gt.h"
>   #include "xe_gt_printk.h"
> +#include "xe_huc.h"
>   #include "xe_map.h"
>   #include "xe_mmio.h"
>   #include "xe_sched_job.h"
> @@ -257,11 +258,18 @@ static void gsc_work(struct work_struct *work)
>   	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>   
>   	ret = gsc_upload(gsc);
> -	if (ret && ret != -EEXIST)
> +	if (ret && ret != -EEXIST) {
>   		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> -	else
> -		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
> +		goto out;
> +	}
>   
> +	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
> +
> +	/* HuC auth failure is not fatal */
> +	if (xe_huc_is_authenticated(&gt->uc.huc, XE_HUC_AUTH_VIA_GUC))
> +		xe_huc_auth(&gt->uc.huc, XE_HUC_AUTH_VIA_GSC);
> +
> +out:
>   	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>   	xe_device_mem_access_put(xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 9845165a819c..3c7e1c10d5fa 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -5,14 +5,19 @@
>   
>   #include "xe_huc.h"
>   
> +#include <drm/drm_managed.h>
> +
> +#include "abi/gsc_pxp_commands_abi.h"
>   #include "regs/xe_gsc_regs.h"
>   #include "regs/xe_guc_regs.h"
>   #include "xe_assert.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
> +#include "xe_gsc_submit.h"
>   #include "xe_gt.h"
>   #include "xe_guc.h"
> +#include "xe_map.h"
>   #include "xe_mmio.h"
>   #include "xe_uc_fw.h"
>   
> @@ -34,6 +39,42 @@ huc_to_guc(struct xe_huc *huc)
>   	return &container_of(huc, struct xe_uc, huc)->guc;
>   }
>   
> +static void free_gsc_pkt(struct drm_device *drm, void *arg)
> +{
> +	struct xe_huc *huc = arg;
> +
> +	xe_bo_unpin_map_no_vm(huc->gsc_pkt);
> +	huc->gsc_pkt = NULL;
> +}
> +
> +#define PXP43_HUC_AUTH_INOUT_SIZE SZ_4K
> +static int huc_alloc_gsc_pkt(struct xe_huc *huc)
> +{
> +	struct xe_gt *gt = huc_to_gt(huc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_bo *bo;
> +	int err;
> +
> +	/* we use a single object for both input and output */
> +	bo = xe_bo_create_pin_map(xe, gt_to_tile(gt), NULL,
> +				  PXP43_HUC_AUTH_INOUT_SIZE * 2,
> +				  ttm_bo_type_kernel,
> +				  XE_BO_CREATE_SYSTEM_BIT |
> +				  XE_BO_CREATE_GGTT_BIT);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	huc->gsc_pkt = bo;
> +
> +	err = drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
> +	if (err) {
> +		free_gsc_pkt(&xe->drm, huc);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
>   int xe_huc_init(struct xe_huc *huc)
>   {
>   	struct xe_gt *gt = huc_to_gt(huc);
> @@ -56,6 +97,12 @@ int xe_huc_init(struct xe_huc *huc)
>   	if (!xe_uc_fw_is_enabled(&huc->fw))
>   		return 0;
>   
> +	if (huc->fw.has_gsc_headers) {
> +		ret = huc_alloc_gsc_pkt(huc);
> +		if (ret)
> +			goto out;
> +	}
> +
>   	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
>   
>   	return 0;
> @@ -72,6 +119,89 @@ int xe_huc_upload(struct xe_huc *huc)
>   	return xe_uc_fw_upload(&huc->fw, 0, HUC_UKERNEL);
>   }
>   
> +#define huc_auth_msg_wr(xe_, map_, offset_, field_, val_) \
> +	xe_map_wr_field(xe_, map_, offset_, struct pxp43_new_huc_auth_in, field_, val_)
> +#define huc_auth_msg_rd(xe_, map_, offset_, field_) \
> +	xe_map_rd_field(xe_, map_, offset_, struct pxp43_huc_auth_out, field_)
> +
> +static u32 huc_emit_pxp_auth_msg(struct xe_device *xe, struct iosys_map *map,
> +				 u32 wr_offset, u32 huc_offset, u32 huc_size)
> +{
> +	xe_map_memset(xe, map, wr_offset, 0, sizeof(struct pxp43_new_huc_auth_in));
> +
> +	huc_auth_msg_wr(xe, map, wr_offset, header.api_version, PXP_APIVER(4, 3));
> +	huc_auth_msg_wr(xe, map, wr_offset, header.command_id, PXP43_CMDID_NEW_HUC_AUTH);
> +	huc_auth_msg_wr(xe, map, wr_offset, header.status, 0);
> +	huc_auth_msg_wr(xe, map, wr_offset, header.buffer_len,
> +			sizeof(struct pxp43_new_huc_auth_in) - sizeof(struct pxp_cmd_header));
> +	huc_auth_msg_wr(xe, map, wr_offset, huc_base_address, huc_offset);
> +	huc_auth_msg_wr(xe, map, wr_offset, huc_size, huc_size);
> +
> +	return wr_offset + sizeof(struct pxp43_new_huc_auth_in);
> +}
> +
> +static int huc_auth_via_gsccs(struct xe_huc *huc)
> +{
> +	struct xe_gt *gt = huc_to_gt(huc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_bo *pkt = huc->gsc_pkt;
> +	u32 wr_offset;
> +	u32 rd_offset;
> +	u64 ggtt_offset;
> +	u32 out_status;
> +	int retry = 5;
> +	int err = 0;
> +
> +	if (!pkt)
> +		return -ENODEV;
> +
> +	ggtt_offset = xe_bo_ggtt_addr(pkt);
> +
> +	wr_offset = xe_gsc_emit_header(xe, &pkt->vmap, 0, HECI_MEADDRESS_PXP, 0,
> +				       sizeof(struct pxp43_new_huc_auth_in));
> +	wr_offset = huc_emit_pxp_auth_msg(xe, &pkt->vmap, wr_offset,
> +					 xe_bo_ggtt_addr(huc->fw.bo),
> +					 huc->fw.bo->size);
> +	do {
> +		err = xe_gsc_pkt_submit_kernel(&gt->uc.gsc, ggtt_offset, wr_offset,
> +					       ggtt_offset + PXP43_HUC_AUTH_INOUT_SIZE,
> +					       PXP43_HUC_AUTH_INOUT_SIZE);
> +		if (err)
> +			break;
> +
> +		if (xe_gsc_check_and_update_pending(xe, &pkt->vmap, 0, &pkt->vmap,
> +						    PXP43_HUC_AUTH_INOUT_SIZE)) {
> +			err = -EBUSY;
> +			msleep(50);
> +		}
> +	} while (--retry && err == -EBUSY);
> +
> +	if (err) {
> +		drm_err(&xe->drm, "failed to submit GSC request to auth: %d\n", err);
> +		return err;
> +	}
> +
> +	err = xe_gsc_read_out_header(xe, &pkt->vmap, PXP43_HUC_AUTH_INOUT_SIZE,
> +				     sizeof(struct pxp43_huc_auth_out), &rd_offset);
> +	if (err) {
> +		drm_err(&xe->drm, "HuC: invalid GSC reply for auth (err=%d)\n", err);
> +		return err;
> +	}
> +
> +	/*
> +	 * The GSC will return PXP_STATUS_OP_NOT_PERMITTED if the HuC is already
> +	 * authenticated. If the same error is ever returned with HuC not loaded
> +	 * we'll still catch it when we check the authentication bit later.
> +	 */
> +	out_status = huc_auth_msg_rd(xe, &pkt->vmap, rd_offset, header.status);
> +	if (out_status != PXP_STATUS_SUCCESS && out_status != PXP_STATUS_OP_NOT_PERMITTED) {
> +		drm_err(&xe->drm, "auth failed with GSC error = 0x%x\n", out_status);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>   static const struct {
>   	const char *name;
>   	struct xe_reg reg;
> @@ -85,8 +215,10 @@ static const struct {
>   				  HECI1_FWSTS5_HUC_AUTH_DONE },
>   };
>   
> -static bool huc_is_authenticated(struct xe_gt *gt, enum xe_huc_auth_types type)
> +bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type)
>   {
> +	struct xe_gt *gt = huc_to_gt(huc);
> +
>   	return xe_mmio_read32(gt, huc_auth_modes[type].reg) & huc_auth_modes[type].val;
>   }
>   
> @@ -100,10 +232,8 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
>   	if (!xe_uc_fw_is_loadable(&huc->fw))
>   		return 0;
>   
> -	xe_assert(xe, !xe_uc_fw_is_running(&huc->fw));
> -
>   	/* On newer platforms the HuC survives reset, so no need to re-auth */
> -	if (huc_is_authenticated(gt, type)) {
> +	if (xe_huc_is_authenticated(huc, type)) {
>   		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
>   		return 0;
>   	}
> @@ -116,6 +246,9 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
>   		ret = xe_guc_auth_huc(guc, xe_bo_ggtt_addr(huc->fw.bo) +
>   				      xe_uc_fw_rsa_offset(&huc->fw));
>   		break;
> +	case XE_HUC_AUTH_VIA_GSC:
> +		ret = huc_auth_via_gsccs(huc);
> +		break;
>   	default:
>   		XE_WARN_ON(type);
>   		return -EINVAL;
> diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
> index b8c387f14b8e..532017230287 100644
> --- a/drivers/gpu/drm/xe/xe_huc.h
> +++ b/drivers/gpu/drm/xe/xe_huc.h
> @@ -19,6 +19,7 @@ enum xe_huc_auth_types {
>   int xe_huc_init(struct xe_huc *huc);
>   int xe_huc_upload(struct xe_huc *huc);
>   int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type);
> +bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type);
>   void xe_huc_sanitize(struct xe_huc *huc);
>   void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p);
>   
> diff --git a/drivers/gpu/drm/xe/xe_huc_types.h b/drivers/gpu/drm/xe/xe_huc_types.h
> index cae6d19097df..cfbaa5e0dfca 100644
> --- a/drivers/gpu/drm/xe/xe_huc_types.h
> +++ b/drivers/gpu/drm/xe/xe_huc_types.h
> @@ -8,12 +8,17 @@
>   
>   #include "xe_uc_fw_types.h"
>   
> +struct xe_bo;
> +
>   /**
>    * struct xe_huc - HuC
>    */
>   struct xe_huc {
>   	/** @fw: Generic uC firmware management */
>   	struct xe_uc_fw fw;
> +
> +	/** @gsc_pkt: bo to store the packet for auth via GSC */
> +	struct xe_bo *gsc_pkt;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 2fcec528a1d1..eb1e6a883f13 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -529,6 +529,8 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
>   		uc_fw->css_offset = offset;
>   	}
>   
> +	uc_fw->has_gsc_headers = true;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index fc1de0cc9324..ee914a5d8523 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -112,6 +112,9 @@ struct xe_uc_fw {
>   	/** @bo: XE BO for uC firmware */
>   	struct xe_bo *bo;
>   
> +	/** @has_gsc_headers: whether the FW image starts with GSC headers */
> +	bool has_gsc_headers;
> +
>   	/*
>   	 * The firmware build process will generate a version header file with
>   	 * major and minor version defined. The versions are built into CSS

Reviewed-by: Balasubrawmanian, Vivaik 
<vivaik.balasubrawmanian@intel.com> 
<mailto:vivaik.balasubrawmanian@intel.com>


