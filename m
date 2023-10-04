Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B29E7C4DB
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 16:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941AC10E18F;
	Wed,  4 Oct 2023 16:03:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C94D10E18F
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 16:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696435397; x=1727971397;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wXSBeQXOiZWrgfoVx4tIV+rb/qE/x5yaqV/Z5IrykIU=;
 b=ItJck5DlUEVDzUXZU/OUwDqtJ+qkgmFCR3oQAcOpgOZauBgCR2uZxnLd
 1CdyBnEh24V0LnoosbsNiMprEgHRNqyCzkGC+DgUDcMN2On2D63ZbQ6We
 DqzXlI9ywPTvdYoIRWr5yZA32CfWPXzFZwAvISbmRUm8fur63wrTiM1H2
 HzOyTXFaoNLnZ5dNtVecYKxhUDsHmyr2cdbRz0af2Py5IV3Yny49QzL31
 XpruLDrTAB8S4o/ebq1LrsQI88fhpirmOHWeeX2SEKf058VRMzD9tbvfz
 02u9xvJHUTJio3ehOWfQ9VKokZVNn93zLCnje86iAGWbkmMzlK+MSFjjz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="382076307"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="382076307"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:02:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="754975849"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="754975849"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 09:02:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:02:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 09:02:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 09:02:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqwt8rO1uRGxG3N89UAGMPtk49T5s/xVWlkIkuzaLCgcxb6+gzSnMOrJ4F0NlYAi4NIV88ggnoijyqq0GcPILMhuFqponjlTRKX2NJgqw45DpTVyJLQrzVmo1oKB5UbFQNEiS5aan1zMuJO+P3FDPttkB0MTQvc1Vi6zrL0JdRAoDw3lHuXHTvnuht71coHP2WzIyn4yQfv2To2TFg1j53LzKnY6vj49wxVbeKFKcTCBIWCmAnQwtvKFCqfX/CLI4IhYMXNT7QY/VOMPLoz9Sr4YBBlPCPJd5Epd4+sqBzxb02fjgfS4wnCtFUzBCHSDbIUQO4jvqh65fGLUAQa79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5d8HKw/5o7DAeDehN2Ds3IGX5FDI14j+2x3UvUTie2w=;
 b=YFshGopaJSXeL+v57LZlRrpOC6x0WFtBCOZxGH+xQ8OVQHDM5xa1+jAf+xkGEeA/GEGY2G3Jey5ZAK61ScvkqMRK6megGf3Q/cb3iMsyvOEVYPJj3GeGjQ6wX/Mfc0cMYsINJUdfdm/L4QCKNk8NJQT2B2Xk2AgSfCWcrTBxGdLq4YOTLwu8ger9IMPJS3s6lMrbu2DK8NbXOrlWTXp8xiBxFdOvCKF+ixXbjrsXVtJx18In1zal21x52dFyfwVSvGVYy6oynFjqT0Fbvxf5rZAfMLHU0GwDuhvyAZQmTjOzOgmfKamw0bLgYAAO+SlrNo740y57ehPCEpTzo0OIhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7058.namprd11.prod.outlook.com (2603:10b6:930:52::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Wed, 4 Oct
 2023 16:02:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 16:02:15 +0000
Date: Wed, 4 Oct 2023 12:02:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: David Kershner <david.kershner@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Riana Tauro <riana.tauro@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZR2MehAL7QpxTPhV@intel.com>
References: <20231003222145.4090918-1-david.kershner@intel.com>
 <20231003222145.4090918-3-david.kershner@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231003222145.4090918-3-david.kershner@intel.com>
X-ClientProxiedBy: BYAPR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0bd8b6-02f3-4091-9cce-08dbc4f3426f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +KmGRa9Ech8XpGuBblicNkkhkMv4PnXpo7khnRym7rS9DSwA+YB+yl1/5ChmyAgp/FexjNYtYmO0uJ9mQRontUUSkKFWgPxrsZ5hyhzfAfljj8R7O99l9Dhj45IyH8cVXmy+r8qSKv72huDwJBMxTuww5vqfRjjMozQ5Rm/FebovDyyWhD8PA/7sz2Z5f3gkUWlhiFtH4BlzfgZR0Vhziv6DN9+3UdcP+bFes/FU6+eWoVUv1ZNfuO/nguSkWu/rmlpK7mHZ/sQ1jYMusfngjXcpNznFSuu4tq0y2N/lNU0bKIwUIJZ2iF4hvTZNNimvAcRmw7Cf/Ttt4NmqvoBDz6Di5yqS51Yzb1RxAlP0hCe8lBvZpJNSVx0BQrwR7D29BTYeyDjovCSHlQor1H/GLZCidIkQpSGF7rN8RaIy9gPsz0KD0ie+FlAIsVPYVfO8WW11Ws525pakutgCdHMayQc8fdabED5R7OQkmswBeX/fiLWtzsitLCAWUvucQ7NevjKDIPYM2DYhM/+SdHdMo8+MIXee7mg1eNHbxIV4shnj5im69XtiFWb0X5A/FGQB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6512007)(6666004)(6506007)(478600001)(6486002)(26005)(38100700002)(86362001)(82960400001)(41300700001)(66556008)(83380400001)(2616005)(66946007)(2906002)(8676002)(316002)(6636002)(66476007)(44832011)(110136005)(4326008)(36756003)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmM0WW45T0V3MGQrdUNyZ1cxamo0alp1ZGFEK3pzSWpVZHlSajlvczBha1Ez?=
 =?utf-8?B?ZUw5cG44RW11ZDdVZlU4Z1R4NXluVk15RVgzMHhTVW9zWmlxSlhscCtCN2ds?=
 =?utf-8?B?azhTQUpSWXRUYWRXV1BCRjBMYkZ4TE91TTlkclRrQ2pxWnkyaGhuNW1oSVJl?=
 =?utf-8?B?VFUzM0Q2U29NeXJUSU5mczcybkRvTmIrRnIzNkpSTkF4VXlTN0h5ZkdlLzJy?=
 =?utf-8?B?YnVMQ2FEYWFPS3pNSmpnRUI4bGRCMENoSGRDclptdUVTR2xYNjAzV1dOWFd0?=
 =?utf-8?B?Uyszcnd1UkJMdjczdVZIVitQUm40TGY0eHZhT01seUJhUElacTV0c3c3TzV2?=
 =?utf-8?B?NXZuRFRMRjhDMGxIYU9WQVRrTE0yRGJvSmxvanA4blNYdC9IWUFTaU8vaEpk?=
 =?utf-8?B?eEkzZEhoa1JDOHNHTWZONFlMNnN6Q1QzQ0tib0dBbFBmK1B5OHJFMkg4WWZL?=
 =?utf-8?B?RGZ6WWJiRm10QWZBUHgvOU0wZDdCa1FRMFNhQ2QxY1RkL3NKUnY2NVg5Rjk3?=
 =?utf-8?B?V1FaSFZtc2hZZ1FYR3drREN6cnVCOUxvVDhiTGNCY3dOT1N5d3lDNlFlUEQz?=
 =?utf-8?B?eGhIbkc2YzBUTjdBSVVVaEs0MWd3NDVlSmNVYkEwdXBrNXRGYkxySHBZQmI2?=
 =?utf-8?B?bmJyS0lvQXZBMyswM0NRYVBkSnc4c25QeWN2OFFOVkF3UlVVZFd4dnYyRzZF?=
 =?utf-8?B?NXh2UUt5V2RiYTZCaitYVGtFUHpnZ2ZmUkRhU1pFTGVoZjVwM0tCL2VZZ0lx?=
 =?utf-8?B?d2hWWitZMnYybVZPODlYc3hWV3daWEM4aFFySGxGeTQ4dFQyT2hNOXFxckdN?=
 =?utf-8?B?Q0JJVC8rWFZKTityS1pPeTQ3OHpUOG53bG5zZm40TlJOaVcxYjVJWDE4TkVy?=
 =?utf-8?B?bURwL2hNR1JXbFMwWlZpbHVKYTlwTTc5VllOem10eks4c25wcHVZeEVOdGhJ?=
 =?utf-8?B?WUFDSHhDSVVXenVtMHVGUXJqM2ZaTmVoRUFFN2ZLNTB2cFU5cnpkNEtVSVB2?=
 =?utf-8?B?aC9VTlRlTk84UnNvWTVvdWxwUzFiUks1RTRualNwZ1BmamloemtvY21tZm1n?=
 =?utf-8?B?VUpNOG1aOGVTZFlqT0x6N1d5MjE3WXFVNkVGRjRlOE1VYkFrTVEzcXhIS2hE?=
 =?utf-8?B?QllLRDlDaXJsd292QjZDOEtHMGdpL2tCWHdPaGNhNnRxamxJamtJYlBVSWlK?=
 =?utf-8?B?anpLSTdOZG9GSy9MS1lEeG5MTkcxWkMzbG9DeHRRY0JiQnZudzBkR3dVYkhZ?=
 =?utf-8?B?MDN3WXhSZHk5NTFaeGx6NjcxbVRCWkwraTVWdVpqSnAzYkhLaTd6N01kcjZL?=
 =?utf-8?B?dXZubE45c0d0c3czNmNFcG1DbUhJdngyTFNhVGNJVE93MTgyNFNjUjZmRDc5?=
 =?utf-8?B?bGVGUmx3QmN3Y3Z0U0pzbXJJeEhlRTBYZlAvaEJ1QjNkMUNUeGNrbzFDREFS?=
 =?utf-8?B?Z1l3SEQwMXNEUC9IQzYxT0dDaEYycVlMUmhRbXYzUlI2TWVHbDdQQmxtdEk2?=
 =?utf-8?B?L2IrTVZTalZlMTFZelBLMjZoYms0SGp0Q3pQbEg0MG5jR3V0QlFMWklrUW56?=
 =?utf-8?B?eThlUEIwcWE3OTU2Y05NQTF6ZmJvYSthY1hvVllHYjlER293aTJNWUUrVjQz?=
 =?utf-8?B?ZVB3b3VVTjRXYlpXM2RnTFRuSFdXd3RSZkZyOFpaanBYTTVTQXlEOUFLTWpm?=
 =?utf-8?B?YUQxdVZ6YTNvM1V3MkZFWkhyOFdWNy94TlFPOVdaNGJYYkFTV3RTclJtRnJB?=
 =?utf-8?B?d3FXWkJoUTVwcG00ajZuRjNFbmZPSVowTm5tTGNzUE5WTFBYempMS2VINUdX?=
 =?utf-8?B?NWpQUWVab0VyT0lZdExIT1BEOEtDYXdGK1prUGZMWlhjUlc2Q1VoKy9pTDl5?=
 =?utf-8?B?Wm9VVXgvNnltMEtiN3RrdjlGcFNXbklIS0hYYTI5VXlrTDFiRFh0UkhSak9M?=
 =?utf-8?B?WFFvVStUam45UzZYZmpSNE9rRVZ2cEFSSW14NyttRURCTjZVcWJ0WVZkZXFF?=
 =?utf-8?B?ZUNNOXJvYjZVU1F5Ni9WaC9Oa3Q0ejZYNGt0RUVOUUJtRG9ER1laUUVEV0Ru?=
 =?utf-8?B?bnVUdzFlUHFpSktyRFl4SXQxSS9DVlNYNFJJd05sZVc1QnN6ZVU5TUZ0cUdV?=
 =?utf-8?B?TEoybUFhbGQ0ckxUa2pydUVQZis0cHFKdjFUMS9jVXY5M3dGdzMwS1RBeHhK?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0bd8b6-02f3-4091-9cce-08dbc4f3426f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 16:02:15.5145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9eTGML2lktYDxi+buSpTTxG2Hye0nZ/27hYwJ1GfXd2hGuoAAthqeFqFSFjWPg1bqyJ8VBvFOwegpBfKRcGjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7058
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe/xe_hwmon.c: Add static to
 xe_hwmon_process_reg_read64
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
Cc: john.fleck@intel.com, stuart.summers@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 06:21:45PM -0400, David Kershner wrote:
> Add static to xe_hwmon_process_reg_read64 to avoid compile warning:
> 
>     ../drivers/gpu/drm/xe/xe_hwmon.c:126:5: error: no previous prototype
>          for ‘xe_hwmon_process_reg_read64’ [-Werror=missing-prototypes]

yeap, non-exported functions should always be static.
and exported functions like xe_hwmon_register() should have documentation.

> 
> Signed-off-by: David Kershner <david.kershner@intel.com>

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 1deb5007e1e2..172bb85edcf1 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -123,7 +123,7 @@ static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_
>  	}
>  }
>  
> -int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
> +static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
>  {
>  	struct xe_reg reg;
>  
> -- 
> 2.35.1
> 
