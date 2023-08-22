Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F6EEE4996
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 05:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A0C10E2DC;
	Tue, 22 Aug 2023 05:41:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E6910E2DC
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 05:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692682904; x=1724218904;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mxmta7AtZrndLt0ciPs9p1WEMYy6AcbvkyDu/t3u0vc=;
 b=I97DyQE+Mkl7nOuOslKZJVJMafKHLfuSfjxyozgK2Nb+EuUMOSG1YlkA
 /Ys4eb5AGHaw4P7AX8nTFUKettDtvMEanmukhqV1CNc4VdsY2nFvS7QCG
 DTapj8b0WKSZlDlE/3NP1bm3twa7sEoM+ceoRv5HBjmIiUKN4F0Z23avt
 dC1iYcqQH1QFNXLqbwiT8yBuqKFLwCZU09xvaN9g+JMdyFkKGYo9x2C8r
 VOq2r36BXfOD/g8xyDfN+s0q6UUdDxZWijgp4P7yAtcIw6F/EflrZBYCZ
 dKXHjzDLfqGJN0PAZILH0nK2F4DtkPysGgOpuz2x6vLrR6jf0bvy50PY5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="372677003"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="372677003"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 22:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826195436"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="826195436"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2023 22:41:44 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 22:41:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 22:41:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 22:41:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QONHQdnsYQZu2XbtjYjpG50O3uL5qs6T4qWovOqk8ppVP4boINDfqNPXJKPCwY08bFQfV6xeqdg2/lbw7PaMQt/Sal3lFnsEjphak1ryv4ODIAuBJf4kTv+SPyCwUoxaUYRcTfG8p2TA/MDFIZOOyf713l9fi27WuYAAuiTJSq1Y3DySX7LrX6eUP7ym+FKAKoG4Q98yOQVh5PlPgeRCHWRDejccebV2e8EzGG35TnCJDF4JIHU7rE3gLnqvQ76XXDU1q2dh8R26nBlWIKtxIyWOVyfA4IrT3221cUzSJ9mKDr+Ruo8stGshDEE1A5SFgWjPe9f4tk6dquzbBuaDew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E47Gel75AaL1JblkGoFBF5ud8RimHVMNICv249ySM2I=;
 b=JKUo47pjlFkC0a0OKU7c2I3vkDd1CzFnr4zAmLFvBBpv8kFoWAfeXzxg7syA3XfsF0BMxkwgxlyDgXhHuVK9ym3IPddYeGjMmlPBe/AYNL5DyiRVSyRGuUEkBOlUB2Z6fQxGc/aF9VuSsKCAdN/gK4stDCE2Y2Awc5GvT4jLsh+9Z8fMU53F3iKxG2S5RDt10DC2seUsOhZXPRwuVAp/1DEt1+qGchyetQ7KWhI86fBKjS02if5c8ExeyhK2Kwve1ELb1fhI7oKLOg+7KYVBIxt9Bu07ccebIwXELtv3XVbvitvPLiEEhOCit2lADYUo5Jd37nynupauw5cZ5R43aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SN7PR11MB8110.namprd11.prod.outlook.com (2603:10b6:806:2e1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 05:41:42 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 05:41:42 +0000
Date: Tue, 22 Aug 2023 11:11:30 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZORKipeRk/9R2i5x@bvivekan-mobl>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
 <20230818220824.700519-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230818220824.700519-10-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN3PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::10) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SN7PR11MB8110:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c2aeca-ce18-4b72-a722-08dba2d2767c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: axspMAmMEsrW4naD24SauFNaZfopay3PA/dWwJro6U871WIT2hANnlQ+Yab8myZl2u/dhvJS59g00Up/ge+Rv1qEgQIxtLTOqmDSMgPx4iz+WoF+G8AlT1yeOWsaqF/cypU31auIXWWnhk41pgvr/41QdSDoEI2fxT3w/GfnQSeuZubNcPPgU4nStrPHbA20NkUunyAGATYasRzk7d+pqmX+cSzV0NrFfeuNDJ9SxwmkLUB1ANXKAjblPIAtC/A7kGXtAuubRze2vpeDD23Jf0ioW1/Msq1jPIkUoJ4ZHZxBND3Tsh+k25ZQd03+jAW+2TsUF0WAMBMFNVxt8A2dhDp+Knv4hBpt+Jtz7h2ZnWVZOM79DoJdZL2F6K8juV7wR+3eyoIYRWxt+uIfK2G/6UFn3WqVRUojlvapBr5KUG8Q4nKC0c0t5EljVIzxAmoTrwQOeGfpRk+vmdXgbnzY5GZb2XHP9ehA9rLlODE+PZNUhBpZYc7Ul5dqAKBGPuX1jf4yNEqrn/eeiumgciVKAuA3gvDB6McmfaIYIBTF+skmsGYtVb8je0wvLD52Au2C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(6512007)(66946007)(9686003)(82960400001)(8676002)(8936002)(107886003)(4326008)(33716001)(41300700001)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(2906002)(86362001)(44832011)(5660300002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3h6NzFrem1vRGxZbVUzbmQxWTRDYU5ac3A1RlkzMjI5allPcUI5VnpqWUFj?=
 =?utf-8?B?cE1OV2N0VW1jRXBQeFdsVHZvMXBOUFNtSUNranRocDJNMW4wR3p1dHEzU2Jz?=
 =?utf-8?B?U1Z6QjVBK21xZzdlR3FtRW1lcTJiSlFpS0hKanVZVE5KdW9xZnppMUIrZUxa?=
 =?utf-8?B?bERZelZMd2NTbmwySmFxdFlvV0ZvYlZyMVJvT1dabVBwRVlSQTR1a0JhWlVz?=
 =?utf-8?B?aHFQL1VlcURYakFFSVVvb1pRTkJza1Vlekw5ZllpUW1EYUxuZUtLdDh1QUV6?=
 =?utf-8?B?VGc4YndVR3IrNXdLT3BFcWM4OWR1TkZSRjJuVWFqSTVRZHhXUW1mRnVOUllR?=
 =?utf-8?B?ckJML3I5MW5nYmRDVFlQejArQUU2TGRHMmJBeDEvQWlFYzIrVm9OcWVVVG4z?=
 =?utf-8?B?UGVLYS9IRmc2bXA3TmVzNlIwSWZlaXNHT3dzemREWHBVdHZuWmdRWnl0S2ty?=
 =?utf-8?B?cWw4d1ZobnhVWDFFQmRCWnhZZkxwaURtMGRHdEtMcHZSZlVuYmFiaWw0SjJO?=
 =?utf-8?B?am15NEl0aEs0ODhZNVMzUjlXUHpjRldEaXhLZy9Vb1h2bE5zM0ttd2c3Ykoy?=
 =?utf-8?B?M0JnNnROa3MyeWRCUVZ6bzJlS2laclc3S215cnNXblcwTFVJWTVPRmdzMmMw?=
 =?utf-8?B?cndTOEtlOGE2YXRiQkdIeFJDU0RZaTFSTVNqUTVrdnhkbjBiRFVKeHpRbmdX?=
 =?utf-8?B?UmhUdXBZOXhHY2ttL0tIY1FCL2hKSFp3Z3pUNitxTzNyS0pSQ3RIaEZoYmdq?=
 =?utf-8?B?V3d6K1Ird2VoSndGbjRVMDJZRUd4Q2xqd3ZQT3FLVk9aNDdaQ2pVK3NTUGI3?=
 =?utf-8?B?RzZzZWdncXVJcE53Z05tdW5wVG5tQmlHcFMzWnJjVGNLeFRjaVNzaVRuT1RI?=
 =?utf-8?B?Z3lDYzc2TXlmYVhCQ2xHRlgvWGY3aGlHTFk2dkdNTWJ1ajY0djgzZzVLYTJ3?=
 =?utf-8?B?VmIxUWUrYklmdk5kK0RaSFRydkxaUlpMRGpabU03bWZJa2I3WTFRRVRUY09h?=
 =?utf-8?B?Sks3UVQ3R3pCNVdCZmk4MFdqWVVUNGlEcG1TZjFzZWVWUGcvRm01Z0VkK3ls?=
 =?utf-8?B?TllUNGtYMm5vZjkyR0R4L3pMVUd3Y3BXZWR3cUYzWjExNHZvSHE5Z1EvbDJm?=
 =?utf-8?B?dHlqNWx4bk5LY0wzc1FkK01DcjFPM1lTY3h6bFpYejk2YjYyRk9qQTZEdSs4?=
 =?utf-8?B?N1Y1UG5VQkNGZzc0aXlET3VUSGFlWUd3Q3hueDBzUFBzQlNhTjJ1TFI1b1VF?=
 =?utf-8?B?d1lBS2dFTU96aG5JT2IxMFRrWUlUMUNwdE1GWnFJQ2tJOWZTbzlLZzhXS2l0?=
 =?utf-8?B?bWNnTUl2MkhUSSs1b25LSjlDVXk0MSt5ZGJuc2kzQTl6Sy91dVpJTk0rcWNx?=
 =?utf-8?B?b1RpSmRPeUtkNjVpWXNNTzVsRUk3ZmFOWjlVUXBYYlB4YkMyRThRNDJnRmFq?=
 =?utf-8?B?L2hMZXBTdTNQTHNDRFNSeWlyTEZScUdyYkNWZStGTk05cGJRS3VQNEhVOEZr?=
 =?utf-8?B?SXpIbEZQM3dDTlI3blI4ZVAzemFyaWt4WldycjhiTGNReVJZZGRoY1YyZGFR?=
 =?utf-8?B?YjNobG5HaWQ3aXNJSG54SmxYbWRkdUtzMlI4RFN6TUR5eExwcE5iMG0yTURu?=
 =?utf-8?B?YUU2MFI3ZmRDZTNrZWU0blRPbHlXY2FFa3JqenFtUlQyOFJwRElGREpxSUo5?=
 =?utf-8?B?VnB0L2JZQ1R3cDVoRENjMWwxb2pTWlFwNkdtTkFsazVjKzFZM1J5Y0ZmTktG?=
 =?utf-8?B?bGJzcXdYN0dPc0ZDZldCS1pCaThhYmRnS3N4cUhCUU5MNHFNRUpjNU4wa082?=
 =?utf-8?B?K2lWejhYQnlDRnJGV3VabERxNlZnMUdBZDhFelRyWTNWcDBVVktaNnBDTm8r?=
 =?utf-8?B?Q0NSMHd2ekF6TllJcm4zZ3VYd2tsTWY1RC9hYWFta3ZHWFFGUm5ZS1c3NU1F?=
 =?utf-8?B?Rmc3WFFibWhENnQ3cnlZazBjK3VQeXRXeDI0b1VsNTkxM2pXRGJuUnk1c2lE?=
 =?utf-8?B?dHZaRjVWeGFzTnN1NmtUSm1KZWxoVEU0Y1RGS2lINjI5Q3lmMjVkckdIS0g0?=
 =?utf-8?B?dmpHYnIzaVc2dFM4b0d6Z1F0elF2N0tBeEVhZ2VIS1djU2ZUOFcvcm44Mktz?=
 =?utf-8?B?TmtCQno1YmpGeXRVaHFUc3o4TGErMWFpYjc0aHhmSjN2REYxOGJFbVB4QjhP?=
 =?utf-8?Q?7E3/kVDTr2e6Hbiu2EJ7q+w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c2aeca-ce18-4b72-a722-08dba2d2767c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:41:42.1169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyTL4k3y9iz5PIL6jXdwNw+J6qbOs7TNfqKtFvV1PAVm+mAHs2AY/vi9q/9UyJt+TjOh1agBiycfh8IO4j40gSFE0OjB1Feajk42fmUGR7RhNTd/rmrOKTYd6YfkcoQY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8110
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 09/15] drm/xe/xe2: Define Xe2_LPM IP
 features
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 18.08.2023 15:08, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Xe2_LPM media is represented by GMD_ID values 20.00 and 20.04.
> It provides 1 VD + 1 VE + 1 SFC.
> 
> Bspec: 70821, 70819
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ed6c4bf8c63b..fdd2eba1b91f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -221,6 +221,12 @@ static const struct xe_media_desc media_xelpmp = {
>  		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
>  };
>  
> +static const struct xe_media_desc media_xe2 = {
> +	.name = "Xe2_LPM",
> +	.hw_engine_mask =
> +		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
> +};
> +
>  static const struct xe_device_desc tgl_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
> @@ -344,6 +350,8 @@ static struct gmdid_map graphics_ip_map[] = {
>  /* Map of GMD_ID values to media IP */
>  static struct gmdid_map media_ip_map[] = {
>  	{ 1300, &media_xelpmp },
> +	{ 2000, &media_xe2 },
> +	{ 2004, &media_xe2 },
>  };
>  
>  #define INTEL_VGA_DEVICE(id, info) {			\
> -- 
> 2.40.1
> 
