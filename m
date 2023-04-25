Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA13C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 04:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD8C10E650;
	Tue, 25 Apr 2023 04:26:33 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E9F10E650
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 04:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682396792; x=1713932792;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=s9r/WHhNFmBjTqYQo2YwV1l/mRuKVoiGhVBmpyfo7FI=;
 b=iUOzzqANZPk8NlkE8MbpWP/sC/+EcIpUs447zKTSWEtK8Zi5p9tonJ7i
 jxyRm0BkMX/Gm8RZPkqo0ZemFDNVV8CjiYYTXG/nUnKY61BqkVYtZAT3s
 xjVHpEugkuklnGs/nedZk+rG9y3ANOoP5IS+rDtbsZOy8NLTKobiA+bCN
 3F6KnH3VC4e9oiOABknwkfgY/TrxnqgrCBP85E58f+Xm52vYLJSVy6+2j
 xzJDEkJBPgnsPrLCMLhCfuKIcZyo4anK8/zjcGDOEtyAK8weJ2k+PnTJ1
 4kU7xYgg+qHujIT/niBvGzomD3SBEE3C4dbrUIh0lV8AQ/hvgpdUdION4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="335542110"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; d="scan'208";a="335542110"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 21:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="687207291"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; d="scan'208";a="687207291"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 24 Apr 2023 21:26:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 21:26:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 21:26:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 21:26:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebX9TDrSy4IWS6IswE89JCsmllQw0nblJTddpzeTowjHFlKIXBBerHzNoE5rzjKG/xH5sYKkIFrr6t5OObD8tmCIgbYsaHmKKaZo+pWmnZvsJoxNRM7F/rLXsbz7pVtUYYf4aGR7XoDBCmQiXguut/XrlenA114qp2ckw5lwLKz2+SMJ5ix7HJgWTetXZPxdnFPxthFfXuv4HKFXM6Uneph5P6W39JetkCiwCqTeBLO/7a7c2HkwEmGxQm7tnL/UhSX500rfVyZTBTTPAJYIZo7n15eIvUbbGSvj9i1sJFfBGyyqJC/Lz1UG2kIN918QMCUPY/bodMeeAZJlbOnYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQ1BRLEbdyUCMKxZ2qIslG0CbfYadVgnqJmCzViUbvg=;
 b=MX6ODxKwfU5ETp3vG5RVz1hCn4Hqx+RrQc5ulCNEs3bFOuI+raoKkL5F1yQlVbf8M2snZblcMgwSAl5uW/jAbseC0FtXm2s4iEfHikr0Gw7Jm4N5cmbLCI6GeJ0s/mwIDYnhJ1b4+VuUuvdxjUIsgAmiFpt8k81jgB84PYiVTsF28m+0+9JM4ueqo8nMLKpWW0KBtcXYbC1izcYJyhMjd29sqE6MC5lLJF06mZ6XBKNgBwBaowo5yxvvduYA6NbxzUb+WGsoqnPhp84nu9GfGaGqCwJxOv1vEiXSEx+iL/F9/94ne1EUKUAGWMc9Z7larTo8w2g6b3jbicVM9Npbqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DS7PR11MB7906.namprd11.prod.outlook.com (2603:10b6:8:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 04:26:29 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::9c58:34e2:84e5:751b]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::9c58:34e2:84e5:751b%4]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 04:26:28 +0000
Message-ID: <e03bfeed-23a0-de71-aa90-d75d743b575b@intel.com>
Date: Tue, 25 Apr 2023 09:56:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
 <20230406092631.2820028-3-himal.prasad.ghimiray@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230406092631.2820028-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0203.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::15) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|DS7PR11MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 5894bc90-7b54-4a16-93e8-08db45453d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IkItP0OZeZd3lpIUMG32iuL9CeZAEHQM8UekcZPrlJSFSmKzB4Cume4mFcb7B+xXFL7xEPYzbVY2xY1Zc93aa6k+bClM13D/D1e8BZx7XGaBV38P3FKiHZ907UqOi5Ptzl0jp0zCDXXU7f6ecSEDaP4cJd84v/xSKv9WzlzOaO3i/96MGcgpw77pc5TLjsrO/3NnO/657FbqqaJT5LtDdqyXwPdr6OhhdYE1mt2ejGHaCkLxc8HHf5lNlFE5dcEkMCeJszgfn+S0XkygdsM1i86t6JheSA7PQ7KFJ9azdVuV25EN1eWI1b1NsEvWj++aed1hu0YjQ9fIgZ8fFWbVenGH/6Mb7KHPCOXCh0kbVmdUTs/0UsX2ST3cpcXqWa8EOiUCnXtPmqdA8sAQQtCqqZXKGM9yqJwgBzwXSpF7vWDbvIiNSHLzSAdgOtbBXhTe06rg2+d0VDB3wEVtU8xViyK5aeCouN8CITb2xsgiPMRqy830VH6KkD3BJ6T6wLX55Kv+mZGVGTrWRHoZBTnu6T9pM6qEK0WUviau9j8HsGLvOgcBmEROa6kL45Bwzxsl1ybcgyrTmgwNce+bxCZpBfOom+G4iNi7uwLCLBb2f99FV1+DrHriLfPgqFAv5mWX1dKRZeUOSTKgLa8byr7Msw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199021)(478600001)(83380400001)(2616005)(36756003)(6506007)(53546011)(26005)(6512007)(186003)(82960400001)(31696002)(86362001)(38100700002)(6666004)(6486002)(8676002)(41300700001)(8936002)(316002)(66946007)(66556008)(66476007)(2906002)(31686004)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vy9KMlUzM25xSjlDWi9nRXZxQWswS2Rja0g1NmhwUTd1WHV3N1VRK3VmZTNi?=
 =?utf-8?B?NURvbENzL2psdG9oRDBnQzU2c0xoL0JTMUV4U2pSbTNVYldjOEVscVVHekxr?=
 =?utf-8?B?c3ZEeXBoZ080ZXVmYzhvMGw5LzBYWTdGZ3RrdFM4TFFma0E2dENXZzUwMk5Z?=
 =?utf-8?B?TzIzMDJnUjdkYWVGeWJwOUx4Q1g3WlZtNk1GTW1sVkMxRWdHUGRRTFdReWh1?=
 =?utf-8?B?czl0azBSR3RNRHpSVXVHTXF6NFVURUFSRzROeGZnNWQxRHhGYjBjTkx2bUU1?=
 =?utf-8?B?cENxTnRqdTZRVU1kL1hVS2trN2hNTmZ0RDdCcE1WZGFNeTNnNEIwT1JldXdN?=
 =?utf-8?B?bGtSaHF1d1FaTkJxeEdIRm1ibktwZlFEcUpOSS9DR0JIa040MkRBRFIxNGRv?=
 =?utf-8?B?Qzh5WWMxMlFsRlVDdkFsS3AzNVUvcC9UN2JuVnBIdi9Ya29yWmYzZm1ycTBn?=
 =?utf-8?B?SEJQcGh0WDg0dGFpS0dXUUZicldLSk5OWlNYTzBlYlR2OU5yOEhQWEpnMng3?=
 =?utf-8?B?bG5pVjhWTDZ6cW1RMDFxTXdNYVlIYmc5Y3VUcFRQZS9RUk1LYXFzdGlNMDVM?=
 =?utf-8?B?UUhjWTBDQ3AvUkU2Y0NubSs5VStZaHdSY1lNSlBiMXI3R0MrYnhPSmpQSU5q?=
 =?utf-8?B?MHlKNFRrUWliSGtYTVRZbjRaRFd4dmtHd3IxRWxhTExnR0JXdWplT0F6QWEz?=
 =?utf-8?B?RGJJMi9oVlNQZ1RDMUsybVRZeVBwd3NwOVcrNlVPYmpXbTZuazBNSXJHYVhu?=
 =?utf-8?B?dGZvcy94eWh2L29CSFBPdHBKd2xhcGw2RDd4a0xUbm5Ubm9YcTBpdEpIWVUv?=
 =?utf-8?B?YWdJdmdxNWVBQUJUZ0NKTzE5WkZtR1AvNWg2QTRITWlDWVlvay9BV1Z3TkZh?=
 =?utf-8?B?SUlGYzcwQVFPaW1rcURibzZqRVl3ME1CUmpiQklrTGk5VlRRYVhlZXFSN2Vi?=
 =?utf-8?B?MXJlVUlQRDF6bGg3RkRkRytjUjhJZmxkQXBXenNTOGE5OUlMbHFlZEp2cTA2?=
 =?utf-8?B?S01qSmVSMGwyZ3lKR1VUMFpUM1FyaTlLa2tiNVJsems4dDJCZlVYOUJEUmRy?=
 =?utf-8?B?bjRoMmRVaVJjNjcxY0tKZU10TFFtbXEzNzdWNWNCa0d2TkU2d05OcUVPc3NC?=
 =?utf-8?B?UnRqN3RZeFVpaXJpcWxXdHFnZytVTW13Uzh6YUpuaXBSYk44YmlHV2dpVXNu?=
 =?utf-8?B?NUZzWThlY3NqUkFoQ1Z3cUFnWk1kenZTK0hudk44N0IyL3NOWGMram5HNWI1?=
 =?utf-8?B?dWtrV0VFcEhnbmhkMU9UejQ2L3I4TE9zbFQ5SWF2clIwVENhd3l1WXN0MWI5?=
 =?utf-8?B?bjJ5ZHJKMU5SUXFLRWpjZlRsaUxRczVKdWdXSEFjdkVzMXpyZXpHblZSb3JI?=
 =?utf-8?B?MThOTENWNy9oN1lKZnROWENWNjJQZWZQSzNWdnh6c3E4YUliSEFsNzRCeUtt?=
 =?utf-8?B?VlR6bExjU3J5MU9IT0hHbjRnR0dOOUYxMVAvbjZXVW5yMnlqbnludnhxTlNy?=
 =?utf-8?B?WXQ4dGwzWXRCdTRtdlVPeGJ3ZzFjdHJVUXk0SkpNamFQeUorWEJiZlhWcDRs?=
 =?utf-8?B?YU1lMWk1S3hDTzBtb0NJSFJQMlNGL28xZmlaeUhHTlkxZmN3aCtEUDlXUFNB?=
 =?utf-8?B?a1J6WEFhVzMvMUVhN0ZieElLMXYzUU1zakhmU045bmgwTzYyQUpLVUlSVU92?=
 =?utf-8?B?djdEZnZJOUY5NFU3VVVrZFZ2eXhoeldMMDl3NEw0WDhWUWNFRWx1MVF5YVlI?=
 =?utf-8?B?b3pLMG1IOEt3MnJ1SVdBODc0eithWHZncUVzclpKRW04dTF0TUlJRkd0ZGVG?=
 =?utf-8?B?WVJaSW5QVjBMem54ZlBHQVlyMGM1NGJsUFd5RW4wT2xodXVEY1FVV056V3lO?=
 =?utf-8?B?cGN5dk5HZ1dCa2NEOVZzUlJpQnN6QUZLV2ROUDNkeWhmdHh2U2J6T0l4S0w5?=
 =?utf-8?B?REdhWUhqV1hFNk40NS9ma1RCQ1NNQTVISEFiKzhvTGltM1QwQzVza0dNMXk5?=
 =?utf-8?B?OEd3UGpQOHhFZGdzY1ZhUlRiSDYxbEN6T3pGdEJzaThHeUdKbDRUeXA5NTFm?=
 =?utf-8?B?SDQvZEovZW1uT0VQeEFhbnNLNXhyRVV6UFN0VW13TkFtd05Vei94Y3VVSVFZ?=
 =?utf-8?B?RWIwVmU4dnl1QXNXSVB0Ny9UcVNZdTF4Z3J2MTNiaG9ObTZ1eGhIZE1pMkpK?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5894bc90-7b54-4a16-93e8-08db45453d0d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 04:26:28.6045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrjoQUmxEabMt3w4KtbSCsZIBtelYwnA+5G3DUGbGGOmZbcN0VDBzUisB7jQUjJxJi3W1h0dQAsq/PZl5QBE2bwtcHNvujfGJuqTbI4/3P8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7906
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe/ras: Log the GT hw errors.
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



On 06-04-2023 14:56, Himal Prasad Ghimiray wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> 
> Count the CORRECTABLE and FATAL GT hardware errors as
> signaled by relevant interrupt and respective registers.
> 
> For non relevant interrupts count them as driver interrupt error.
> 
> For platform supporting error vector registers count and report
> the respective vector errors.
> 
> Co-authored-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h    |  77 ++++++-
>  drivers/gpu/drm/xe/xe_device_types.h |   2 +
>  drivers/gpu/drm/xe/xe_gt.c           |  29 +++
>  drivers/gpu/drm/xe/xe_gt_types.h     |  43 ++++
>  drivers/gpu/drm/xe/xe_irq.c          | 332 ++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_pci.c          |   3 +
>  6 files changed, 453 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index dff74b093d4e..b3d35d0c5a77 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -122,14 +122,50 @@ enum hardware_error {
>  	HARDWARE_ERROR_MAX,
>  };
>  
> +#define DEV_PCIEERR_STATUS              _MMIO(0x100180)
> +#define DEV_PCIEERR_IS_FATAL(x)         (REG_BIT(2) << (x * 4))
>  #define _DEV_ERR_STAT_FATAL             0x100174
>  #define _DEV_ERR_STAT_NONFATAL          0x100178
>  #define _DEV_ERR_STAT_CORRECTABLE       0x10017c
>  #define DEV_ERR_STAT_REG(x)             _MMIO(_PICK_EVEN((x), \
>  						_DEV_ERR_STAT_CORRECTABLE, \
>  						_DEV_ERR_STAT_NONFATAL))
> +
>  #define  DEV_ERR_STAT_GT_ERROR          REG_BIT(0)
>  
> +enum gt_vctr_registers {
> +	ERR_STAT_GT_VCTR0 = 0,
> +	ERR_STAT_GT_VCTR1,
> +	ERR_STAT_GT_VCTR2,
> +	ERR_STAT_GT_VCTR3,
> +	ERR_STAT_GT_VCTR4,
> +	ERR_STAT_GT_VCTR5,
> +	ERR_STAT_GT_VCTR6,
> +	ERR_STAT_GT_VCTR7,
> +};
> +
> +#define ERR_STAT_GT_COR_VCTR_LEN        (4)
> +#define _ERR_STAT_GT_COR_VCTR_0         0x1002a0
> +#define _ERR_STAT_GT_COR_VCTR_1         0x1002a4
> +#define _ERR_STAT_GT_COR_VCTR_2         0x1002a8
> +#define _ERR_STAT_GT_COR_VCTR_3         0x1002ac
> +#define ERR_STAT_GT_COR_VCTR_REG(x)     _MMIO(_PICK_EVEN((x), \
> +						_ERR_STAT_GT_COR_VCTR_0, \
> +						_ERR_STAT_GT_COR_VCTR_1))
> +
> +#define ERR_STAT_GT_FATAL_VCTR_LEN      (8)
> +#define _ERR_STAT_GT_FATAL_VCTR_0       0x100260
> +#define _ERR_STAT_GT_FATAL_VCTR_1       0x100264
> +#define _ERR_STAT_GT_FATAL_VCTR_2       0x100268
> +#define _ERR_STAT_GT_FATAL_VCTR_3       0x10026c
> +#define _ERR_STAT_GT_FATAL_VCTR_4       0x100270
> +#define _ERR_STAT_GT_FATAL_VCTR_5       0x100274
> +#define _ERR_STAT_GT_FATAL_VCTR_6       0x100278
> +#define _ERR_STAT_GT_FATAL_VCTR_7       0x10027c
> +#define ERR_STAT_GT_FATAL_VCTR_REG(x)   _MMIO(_PICK_EVEN((x), \
> +					_ERR_STAT_GT_FATAL_VCTR_0, \
> +					_ERR_STAT_GT_FATAL_VCTR_1))
> +
>  #define _ERR_STAT_GT_COR                0x100160
>  #define _ERR_STAT_GT_NONFATAL           0x100164
>  #define _ERR_STAT_GT_FATAL              0x100168
> @@ -137,7 +173,42 @@ enum hardware_error {
>  						_ERR_STAT_GT_COR, \
>  						_ERR_STAT_GT_NONFATAL))
>  
> -#define  EU_GRF_ERROR                   REG_BIT(15)
> -#define  EU_IC_ERROR                    REG_BIT(14)
> -
> +#define  EU_GRF_COR_ERR                 (15)
> +#define  EU_IC_COR_ERR                  (14)
> +#define  SLM_COR_ERR                    (13)
> +#define  SAMPLER_COR_ERR                (12)
> +#define  GUC_COR_ERR                    (1)
> +#define  L3_SNG_COR_ERR                 (0)
> +
> +#define PVC_COR_ERR_MASK \
> +		(REG_BIT(GUC_COR_ERR) | \
> +		 REG_BIT(SLM_COR_ERR) | \
> +		 REG_BIT(EU_IC_COR_ERR) | \
> +		 REG_BIT(EU_GRF_COR_ERR))
> +
> +#define EU_GRF_FAT_ERR                  (15)
> +#define EU_IC_FAT_ERR                   (14)
> +#define SLM_FAT_ERR                     (13)
> +#define SAMPLER_FAT_ERR                 (12)
> +#define SQIDI_FAT_ERR                   (9)
> +#define IDI_PAR_FAT_ERR                 (8)
> +#define GUC_FAT_ERR                     (6)
> +#define L3_ECC_CHK_FAT_ERR              (5)
> +#define L3_DOUBLE_FAT_ERR               (4)
> +#define FPU_UNCORR_FAT_ERR              (3)
> +#define ARRAY_BIST_FAT_ERR              (1)
> +
> +#define PVC_FAT_ERR_MASK \
> +		(REG_BIT(FPU_UNCORR_FAT_ERR) | \
> +		 REG_BIT(GUC_FAT_ERR)  | \
> +		 REG_BIT(SLM_FAT_ERR)  | \
> +		 REG_BIT(EU_GRF_FAT_ERR))
> +
> +#define GT_HW_ERROR_MAX_ERR_BITS        16
> +
> +#define _SLM_ECC_ERROR_CNT              0xe7f4
> +#define _SLM_UNCORR_ECC_ERROR_CNT       0xe7c0
> +#define SLM_ECC_ERROR_CNTR(x)           _MMIO((x) == HARDWARE_ERROR_CORRECTABLE ? \
> +						_SLM_ECC_ERROR_CNT : \
> +						_SLM_UNCORR_ECC_ERROR_CNT)
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 88f863edc41c..ecabf4d6690d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -99,6 +99,8 @@ struct xe_device {
>  		bool has_link_copy_engine;
>  		/** @enable_display: display enabled */
>  		bool enable_display;
> +		/** @has_gt_error_vectors: whether platform supports ERROR VECTORS */
> +		bool has_gt_error_vectors;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		struct xe_device_display_info {
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index bc821f431c45..ce9ce2748394 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -44,6 +44,35 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +static const char * const xe_gt_driver_errors_to_str[] = {
> +	[INTEL_GT_DRIVER_ERROR_INTERRUPT] = "INTERRUPT",
> +};
> +
> +void xe_gt_log_driver_error(struct xe_gt *gt,
> +			    const enum xe_gt_driver_errors error,
> +			    const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_driver_errors_to_str) !=
> +		     INTEL_GT_DRIVER_ERROR_COUNT);
> +
> +	WARN_ON_ONCE(error >= INTEL_GT_DRIVER_ERROR_COUNT);
> +
> +	gt->errors.driver[error]++;
> +
> +	drm_err_ratelimited(&gt_to_xe(gt)->drm, "GT%u [%s] %pV",
> +			    gt->info.id,
> +			    xe_gt_driver_errors_to_str[error],
> +			    &vaf);
> +	va_end(args);
> +}
> +
>  struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
>  {
>  	struct xe_gt *search;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 8f29aba455e0..9580a40c0142 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -33,6 +33,43 @@ enum xe_gt_type {
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>  
> +/* Count of GT Correctable and FATAL HW ERRORS */
> +enum intel_gt_hw_errors {
> +	INTEL_GT_HW_ERROR_COR_SUBSLICE = 0,
> +	INTEL_GT_HW_ERROR_COR_L3BANK,
> +	INTEL_GT_HW_ERROR_COR_L3_SNG,
> +	INTEL_GT_HW_ERROR_COR_GUC,
> +	INTEL_GT_HW_ERROR_COR_SAMPLER,
> +	INTEL_GT_HW_ERROR_COR_SLM,
> +	INTEL_GT_HW_ERROR_COR_EU_IC,
> +	INTEL_GT_HW_ERROR_COR_EU_GRF,
> +	INTEL_GT_HW_ERROR_FAT_SUBSLICE,
> +	INTEL_GT_HW_ERROR_FAT_L3BANK,
> +	INTEL_GT_HW_ERROR_FAT_ARR_BIST,
> +	INTEL_GT_HW_ERROR_FAT_FPU,
> +	INTEL_GT_HW_ERROR_FAT_L3_DOUB,
> +	INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK,
> +	INTEL_GT_HW_ERROR_FAT_GUC,
> +	INTEL_GT_HW_ERROR_FAT_IDI_PAR,
> +	INTEL_GT_HW_ERROR_FAT_SQIDI,
> +	INTEL_GT_HW_ERROR_FAT_SAMPLER,
> +	INTEL_GT_HW_ERROR_FAT_SLM,
> +	INTEL_GT_HW_ERROR_FAT_EU_IC,
> +	INTEL_GT_HW_ERROR_FAT_EU_GRF,
> +	INTEL_GT_HW_ERROR_FAT_TLB,
> +	INTEL_GT_HW_ERROR_FAT_L3_FABRIC,
> +	INTEL_GT_HW_ERROR_COUNT
> +};
> +
> +enum xe_gt_driver_errors {
> +	INTEL_GT_DRIVER_ERROR_INTERRUPT = 0,
> +	INTEL_GT_DRIVER_ERROR_COUNT
> +};
Let's have driver errors as a separate patch and limit this to only HW
errors.

Thanks,
Aravind.
