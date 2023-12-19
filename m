Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C91C41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 16:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6606710E19E;
	Tue, 19 Dec 2023 16:26:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FA910E19E
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703003207; x=1734539207;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=REiW2+XX0vyYiQwrXxzrHjNl9M9OIF24/jyD355zDTQ=;
 b=HF22/qzTjPXYCpXmMZ907Hv+6yvd3MuDKhNBJaNtzH+jsHYsp6NHuS2O
 hcEj7gf2sfzNu0OMPgRr+yo92OFPD1dzIwzoKLP1bJ/Uz9bD8dS5/XWM0
 CJ8I3oIjr4fFVCwIB6f7Nx8zTSrV4wD3DqMePU2WXo77UkCqdE6T3Mky8
 1B7wkX3jQhTIM3MeCwcGsi7p1gPoWUpjNgX42f4dqBFtrtdsoNTKgfq1H
 7HJHhVDZUy8IWD5lCYNKAXGmk8EnS/dk8F7E67TMAXAEH3Uqr5yFXqjAl
 miYWFUY5zOWtzPNePjv0sLFNrehaIQv7nskuhRGHSyaUqxwxw7F1JOc0T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="375830501"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="375830501"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 08:26:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="17928523"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 08:26:17 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 08:26:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 08:26:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 08:26:15 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 08:26:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfHldKCfk8MonqREXzrnJioTpeHhNwPGaFthb5JhIHvnRYyzRcHb4yxVPUdnxb8SJJH0Fk/TcNLs5UZdpd/47Fm3cCs3vzXIJ16v3GkQJ3D8x3FFCb1mF8WvRHgqfrXD8hRHjXikVVNktm1uj1Tb554TDUlpIGvSBoYpy+B5llBUfvdXE6BNQAE3sPI3f7b6z2cPXl9DPbVqWUxuNVaR/HewEUlDtnq2BEmR6kera29J9oKkKA49e6w1vpftm99iysJol4kGfiJhhTJQVDdQd+UQW8+ez9lHEtkONcRic4xgVjRIDG5Hsm2EbuclHfM0mBe8hGs4d2BbA3CnsXnPYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xS3MzuwzCKkpyoQW/sVj9HeUM1FDYW7QCgQrgN1N3nw=;
 b=QBao5bNz9hkF4KNHTqiaAyAUfW0AWzjc2sdi/yR0Rb/9J67W/WTAsxvzGrBwAFiHxxAt20rkBNDk8Ppwa4hEt/X9r8QbJgmR4XsB8H6sRlZq931rBudaFDiqgrzHmPOayD8B3hzyBJXcyVhhdMpJ4nHyFftQXLRqSNHvhEg+8QzrDMORyIgslQ6alm/9iek4nkmjGxqg/X+E1mMuvmZAc4n4Wt+scoZas6HgTuAr2G0JTXYj5RUC01xgXEVzJheI2mV3JVTsa6rKpQQCodKCVOd36SuMQb7/9YTRum9kCN9V5v/v4Q+oXGh+c8hvV1lOUpllRnEamLgRPrg7HKy5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB7535.namprd11.prod.outlook.com (2603:10b6:806:307::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.35; Tue, 19 Dec
 2023 16:26:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 16:26:05 +0000
Date: Tue, 19 Dec 2023 08:26:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xelpg: Extend Wa_14019877138 for Graphics 12.7
Message-ID: <20231219162603.GF1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231219070018.8931-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231219070018.8931-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b51bf8-9093-408c-9f8b-08dc00af330b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B7XwSHv+atgdLnzS4qmibA0Cy3FTu+twdBs+lqOtBPHMGnf6z8s12iLZXBMZgRtxvmPe9Rc1CklYLtK+KltpcV6eNshoMg84iKnuBsjBS24Mlu67XThTy/hwBrr4cWk6Oad983g7T5zcao0y/2rrKa2z4Sy1K53dHxZ5Xwn7IZmQipXwUp1HGcWLG5LUxCWuPs0wlwQG5KRiT1AeR0XjEK955KZP/u4xCAH8nUMog4QPFhrKdKD0Dlnhdwtk6A/HTYVRWLcTbtiBUbSgXETkY87quTo8045NFejpYmSMR0dJVH6WKLLM9rZxKw+tVU0FL7ICJV0QLEVRyeFykVz7zV7IErsnGc7QxLGDKOXIJ1HrNNG8DteF0YBsxQpB9w10pYrCIkk0ZqImolF/OvnMqrzlmAGpTb2jpQlqi2bZu+GQcQYFTmFGxXTqdIBRsdbq4/KsZ93SY/qrBIqG4wY+NKbbU+8JLHqwBT/KpzRNueWuyJMBKQ3dZ2CjKZ0f2NHv50CXbQdT4tC5p1t2DFJrSBuj1nR/TGN7uLwBXiggHgkIDQcQjV2JwkVtjwTw3eCg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(316002)(6636002)(83380400001)(66556008)(66476007)(66946007)(8676002)(4326008)(6862004)(5660300002)(8936002)(2906002)(6512007)(26005)(1076003)(38100700002)(6486002)(478600001)(86362001)(41300700001)(82960400001)(33656002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sey9Dy1SCb+fAq1nq7ijUjLvVlYJi7zUn5sUUtihL5Xqy7ODMZ+IRETl0xux?=
 =?us-ascii?Q?Bh8gwkjg6aL0DHTkvvKny1cQhOwrdCiMKEOcyu38ThceTitBi4Zc4EfN1s8U?=
 =?us-ascii?Q?q/kmXvU+bcpNQSRvpKLxzVfkqWtcUWRz90NrF8YLfYYonCXi7cUR+L5dbpR8?=
 =?us-ascii?Q?8k2tQbtg0tNg83rphDf6TVM+hg5soc3z6hzTLsvnILLVsySZrx7mnFMFV6HJ?=
 =?us-ascii?Q?5SCeSC725gBuJVYYZAylaxJ1/DWjF7lIJHmk9T5XOL33e2oWNDXticEbJWiN?=
 =?us-ascii?Q?Haejq2akEGmJEfZv/ivsyS7OfvkMfgSIWItEp7Lr76+gkuhsHpOSVtDfu7BU?=
 =?us-ascii?Q?W4O4ctEUlBYVRE8snBgBVnlKRhdjlHOl6jx87LKlveZFefqk1k+DGyVKt1Wp?=
 =?us-ascii?Q?aM2aBAwbgRySU8F0HbZAg3E1aWLOyDkKPiyk0N6NXfJ1YrtNiaTc/2W9AAPl?=
 =?us-ascii?Q?OtdpTtI8dG9Tq3s6CnAvtAJn4Wxk1AaKQfZr6SKfwo6N04LZNYuLmdZHSWTD?=
 =?us-ascii?Q?dbvkCYw6kcvdhR2SKYAqySPOmlIfdV+sPEPV5WJeB1a779BR/scfFgHVivfs?=
 =?us-ascii?Q?Ovc5e614dhziYq6YTlb/+42v+/TI97/M+OG/AWyrMr39y12Jor17wP8vtkVV?=
 =?us-ascii?Q?aNfkKHCb41HvwkaJYjlynYkoSHR4WodcInQ0t0z51TnrnvvPDoZtYPCEdITv?=
 =?us-ascii?Q?hCzLFygTfdXpJGctIsPSJHQDJz3o8eTervb/ZB5eoEe532v93Ac2oV51/9f9?=
 =?us-ascii?Q?twTlphbRn/AAFkT/hdkuQmP0vsvj1hLt8kdLbyhSPIajp6RBlhPiT50mEQ6o?=
 =?us-ascii?Q?f8Jpd9uCaHYRm7gciXeneJm9Sdd9Y5YTmXIil8Z1EIeuSJ3M+BQ8t9vtOb5H?=
 =?us-ascii?Q?25sNIQrypOZ56w5d6wIlDu2bq/dHDtcbwhrYqEbw0Y9kXmhjTmUimohas/fz?=
 =?us-ascii?Q?GDUNw8T6Iu9TNz6tgQ2zu9nhZVW/HQt0hQYsrYs0mDLT8FwLunGXOJObb3vp?=
 =?us-ascii?Q?b7rP6jTZTFruW/+rL8n1B80K86bKiYkUfO2kL6Gepv9erKNDHLr6cTH207Ul?=
 =?us-ascii?Q?hLTxGo0yTNSISfZWIIfhBs2w869Sz2XmhvynJotHvVJbRJnrCmMQGj1fNRhJ?=
 =?us-ascii?Q?P1jtOF7fWssEPaJdcNGOHMlB3IR77xWEZbuHQ7V1qsl2NwU4d+AH/sYeYWgx?=
 =?us-ascii?Q?JV0PqCF5dXWbgySQtw+21EMo9CfUeMp8Hlm0QfSaJAp9lLLKha4YnTYStVw7?=
 =?us-ascii?Q?rK6sEyensBcQukoZrrx0oU8gXzHoxi0J+g9FSYI+NclnNUH/4XclvVbvBSWj?=
 =?us-ascii?Q?2Ngbvdy5HbbbR3VDQBah4amU9Dbt3CO02Svhi9n9WeJgjBFXC9BD1r6aUE0v?=
 =?us-ascii?Q?U2KaVJi0ZJ8gEnKilSt34QliXmBL6UYRnoJd0pFgqqP6TZotwrqtSFjBHCRq?=
 =?us-ascii?Q?ofP7CiF7lrsRKOdo6shFFTEZ+YukaUWh2YOq/sAGxdMpNT7aYGV3zLcShjzr?=
 =?us-ascii?Q?VK7O10mN6/OCYaoicrRKechzh2TZERyArzqaUrbrMJNjQsp4Fe6DfC5k9gLc?=
 =?us-ascii?Q?AMhC9Hs2+NrnEJGGAmXQWwh29CuohEghETtzB030zHcshlE5yt12ODTpcpX+?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b51bf8-9093-408c-9f8b-08dc00af330b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 16:26:05.6614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWn4d2+FtmqIVavWEDSielhwGeqHr8+8KWRw802/XBTLUaFs1fbyFWdIDic/h6FR0OKPCehRtC9d+/olfK414WHDhXqYWfp30Wa3pDO7sIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7535
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

On Tue, Dec 19, 2023 at 12:30:18PM +0530, Tejas Upadhyay wrote:
> Wa_14019877138 is also needed for xe_lpg graphics 12.7

Driver version numbers aren't decimal numbers, so we shouldn't write
"12.7" (that would correspond to 12.07, rather than the 12.70/12.71 you
intended).

It doesn't look like this workaround is finalized yet for these IP
versions, but given that it is already finalized for both newer (Xe2)
and older (Xe_HPG) versions, it's probably safe to assume this will
become official on Xe_LPG as well.  You should probably ping the
internal workaround records to make sure that's moving forward, but in
the meantime it's probably fine to go ahead and add this.

Aside from avoiding "12.7" in the commit, message,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Do you have an i915 patch for this?  Since Xe_LPG is used by MTL/ARL,
i915 is still the official driver where it's important to add this.


Matt

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 7d6b86d602c8..3456ca6f7b32 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -536,6 +536,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
>  	},
> +	{ XE_RTP_NAME("14019877138"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> +	},
>  
>  	/* Xe2_LPG */
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
