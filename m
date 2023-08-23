Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDC9EE49AB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 06:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110E910E239;
	Wed, 23 Aug 2023 06:32:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34DE10E350
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 06:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692772373; x=1724308373;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=6C7UQzs4k3CkpykDac/aOz8PQBJMJqTedIQ0J3vt0Pw=;
 b=P4SNKGSCP3DgIpQcN1a26gqGt1njeOChBnvq90+ulEfmPUPs4dccNNa3
 pDNSRAbiqRayUNlHtd3UiQX5lxmH5tLYzW4k5lRNWDI2WNdb0hYcu8oUP
 Syci2iy1BEXv2hLejCzDs8M33PyyGyyLVXP9cafiH9eKoNC55Q9HNtpQZ
 00blaGzKD3ZzeeV9zW7gEWrZuq90fZXrzw6W760SK9lROrNBmxe4IVtA2
 Unv7sSHhS0iZ1ClOGBUQ/DzmGN9M5HULc4CCwG+Ia8hQJ6cxvwlpSksRC
 ro8dDgoF91zXWkw5vBXIdYk+ZKuoCkRHztKULyxRjZ3BQ0OkhtGl7SDbk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="376812352"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="376812352"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 23:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880284455"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2023 23:32:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 23:32:32 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 23:32:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 23:32:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 23:32:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4wFOwuSl0J9/gs8Ru7zMrPi4zLuxGjA7jAe7ByKnJmpZVVeYYZtMSDsCix8lvImoZBeRNeQrUP2j+e4Rcc27hoQ5vgpEZeO2YJSZ+wvcw7Bc8zIOVp4BWhstIjTNqBpI1hjidoTlwSK1/OjDFlnYyVZKRoBOpDJfTCxqY3YxXngOOaIuXesNGxeDBpcYAlIU8nn+RYmja11Ugf/zvQB3aE7p5tfll8CBijWdTZD4I+QqL8BBRq+BYxOz+byoWbrhEhg0wN3RYlmJ+96UxuXiX64q1LONmFWL+6Wf3Bq4FLcJxAcJlOC7pHOYvwINMK69/9Jr0m/BKZ9tYp8gbUPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zx7PguZOMUjSa9J0yGcAfPkr2SPl8CDHA+y1pnU1LHA=;
 b=GRLNu7vF2kzVeh3ZVy6Q7k4McDqTfrKuxpWz22ZrbXYz+p0kvFlB0cZPcBTRulXPzyPE+lCYPCFIR0Y2ldTtxwd2GFF2hvNyIvCn/6CweZ1HdPLjjbRtPjl+sRAI2Ke0cj+1jDCaElgh+M7OstIBUmyg05lsi3pX1bjCG3FnTTOqKb+e/4lTcUtgzzz6oOqgYHMV4O9cUmfGGxeBAt1bquvvR5MkhqUqZwbXnUFEWmqlR6btbGiKdpIfo89xS7PNO0QtPg8obMwPneKZuGvG2sTuO5te5yRbzJpV2XV+yjhNdsXQT4pHZSllTR7hIbEWmzsJH4V1HGWRYIHEZD6kaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Wed, 23 Aug 2023 06:32:30 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 06:32:30 +0000
Date: Wed, 23 Aug 2023 12:02:20 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZOWn9E+FKZ3NVCiX@bvivekan-mobl>
References: <20230823050955.1226024-1-riana.tauro@intel.com>
 <20230823050955.1226024-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230823050955.1226024-2-riana.tauro@intel.com>
X-ClientProxiedBy: PN2PR01CA0197.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::6) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: de365bb1-b4e8-4e86-db1c-08dba3a2b998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCXRbsoYA1bZA5f5C1wSMs3Fi1c1goDjPyOkPAhVgFZn834GUeYWsa0+w0n+gg5p6mnJYCF6yKfDSZj6nMBXv7gfQMeWmZjGZKk8LcxNKGX7VW6lNcHmVF/SxErg63CdXmlfnTrCnrABf8SF9OuGKsSEAG+LCzCzL1xx15mFboBuiNjGD3RGy7N6BwLJhV8bzyxjrIr41gpfw6TDINZIognpgUb2ZklRsEFmO08Eqofah9TyTwsgeFsAUlcRHpn3KjHxMJ/FihV78Ktrllaxjt1lrw+GUJJeqQ1BTyBejHo0jFGowIYWbA1Tcaw/dcJzlLQhfbjT14cgo7DHzMahiLYN5ykgNk7xGFBUj2/QMjPMGZt+p8aIeRKWyWqRZbQsJ7qTA52HaE30cF37XoBvZ5ovZ2p1HmhyvCL0ct8RxIYBfL3ZO8MeSxaPLOx/LramwM2ElKkyYpNeCW3NWtN40ftsg5+OOZ0SL59WPHwolGZr0GuMQUxfz9A/mfjRjcleFXi7rP5+jVJ7JTcmrBbUCwezmtC/2ToiNJM5zHoSx4wroodi2ynvbOHeNWz5V5ZAb5G5YEZYgEhiVOwkfgXALKGMy638eaKuNHrLTxfTKDg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199024)(186009)(1800799009)(33716001)(86362001)(478600001)(5660300002)(8936002)(8676002)(26005)(44832011)(38100700002)(83380400001)(2906002)(9686003)(6512007)(82960400001)(6506007)(6666004)(316002)(53546011)(6486002)(66476007)(66556008)(41300700001)(66946007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2JFa3VIUGtDa0VNL3hyaWI5TG8zdy9kcjlWWHVCMTdLU1BLR2FTbWdjRUpy?=
 =?utf-8?B?V3pPK0VMNDgyb1ZUQTRZRU5pYnMyUFZVS3NZckErSkdnVlpKTVQ0blJKVGFt?=
 =?utf-8?B?QmNlWmNQS2V2RkNsUWxNRytIY0Y4azBybDBlV05SVi9hYXBvWDczM3hIaTJM?=
 =?utf-8?B?bmZITlVGNHVZVVFER3Y5SktXMWRhWUpuQjN3ZE9aLzBTdHhhRUtiRDYwRlJz?=
 =?utf-8?B?b1EwUUtwT3hFbkhETjJmalFPeWpwOVBUQm1jdHc2UktaaGZlWmpqNDV5R1Fw?=
 =?utf-8?B?b050czFuNmV1OFAzb0dWcTFid3p3MnlKUTJOdWhNcVpqTmNuY0FTMWVEa0Mz?=
 =?utf-8?B?WVhDSzErK25HTHVHNkNCbnZYZGpaR05uZDZrd2FSWnlZdDF3QkF1eVZpck94?=
 =?utf-8?B?UTNFOEFNQ3JRUExBalNKbW4rMU0ybE5pYnN0SjdSQ2F6Si9nbzJqMTZSUDUy?=
 =?utf-8?B?MjNiQks5ZkxsMmZoNmd1RklxbzZEM1h0TkZDQjJkZVFDU1ZKODlhYWxXWWU4?=
 =?utf-8?B?ZGF1bVZMZUduSUlCdXdNalZxbFVHU0RRSjRMMnFpU21GaWdSUG9tbjlqV1RU?=
 =?utf-8?B?dk9EVlk4N1FuY0FGN081Uk0vZmFGeWdsSjZFYWFLdU8rZmxxekRjdkZ2NTdN?=
 =?utf-8?B?YURnWU13YUZLRVBBLzYxQWtWY3Nnc0VkUmRJQndYWXNFVnlmS1RjQVJIZlZi?=
 =?utf-8?B?cVNNU2hxQ2RPYThuNGtLTXJBVmQ5WnlyWW9Md1l0Y2l2aWdnbWNyV1ZIOTNj?=
 =?utf-8?B?YUlkWnZFeVc5TzBVVjVLc01qT0Fqa2k3Mnk0dllpSVFJU0FDZGpac1NSSUdB?=
 =?utf-8?B?N0J4SFllQWFyUklsVXhWc0dtUFN0TDBlMm5FbTJySkdNbzVRaVRQZlVmL1ZR?=
 =?utf-8?B?WTBWWmZ1T2FFbjVFSTB4OWdMMUJLVDBoQVBXa2o3VkJiRFJFSk8xUkN3OURh?=
 =?utf-8?B?MENiQXEvZUZkbjJVTHBjNzdTUnNOOWF1Ui8rd0lUZXpJWVhEVUY3OUZ6d054?=
 =?utf-8?B?MXk4OW41SXlGM1JMbDdJa3lqN3dhTGlhM2hNZUgwenlrSVpMbWtnVUJQLzA1?=
 =?utf-8?B?RkpvOTRTdXArT0JaRnNGQnF1cWFSN1ZiblNZWk12VXFuQTY2VzRYR1ZPcmdx?=
 =?utf-8?B?SG00dks3S1JVaEhtaWhWZVlNU2JvcVh3LzBIY1VBN2JpQ1hsUWVoNnlVdjVn?=
 =?utf-8?B?amJ6dGZ2OGVVZGM2RDJEeit3MzRZVjc0ZGI4OG1QTkRJUDA1Q0dJdjBLaHY5?=
 =?utf-8?B?cEhrMmlYaEVKcGtZQTVsZzl6VWl5VGU5U2pkNTJXdGlZTmNreC9HdUJXMXZU?=
 =?utf-8?B?YzgrVFB0blpSa1Nha212b3IrelZWMTl5T1BYNUlJWnNqNTN6N2hQMUxkeDVC?=
 =?utf-8?B?MmVGK0I2Y1FvellTOWJpWjlnMkU0Q0RHMEpPRG8rWmthdWNnbjUwK2cxSVRM?=
 =?utf-8?B?WU5HUGRQT2U4VDVyWVRZOGd6aTdSeGVweEhSQzBiNzNXUGZLKzU2aCsyWGlm?=
 =?utf-8?B?eGhiSWR4ZUFETjdPeWZiNWlpRjRWK3lXRkdwejQwUHNiTERXT0hXMmh5VlVR?=
 =?utf-8?B?a244bnZqNXZoVXR1eGd3YS9hMGttZm5zemtIb0dBUk1QVW01ZUZra0lUTkt1?=
 =?utf-8?B?NFV0eUN1cVNnNGYxZXAwa1VsVktsbTdQa2RzU1cybXZ3aEo4OHFodDV2MEtt?=
 =?utf-8?B?WjcxTTJOek9LTzhpZUJtYXg1YW9nSm16S3RYMzNxY3gzMm5nR0N1RE9rV0hn?=
 =?utf-8?B?dEZzU1FhTUVJT3EvTXF5UWRZKzNEYnpUblY2L0M3VVkxZVpQUlBkSXFqT1da?=
 =?utf-8?B?VlMvUkhKN2FiNjBLVFZRTUtXL2UyMEZDNnNkZ1lKekI0VmtkU0ErUHdBblRt?=
 =?utf-8?B?WC8rcTE0MVFFTmM4TnFqZFVrNmNBSTU2dmJpUmh1d0NGV2ZPdUZSN2s4c1lO?=
 =?utf-8?B?aFl0SVVXcnRDQUJqNEJYbzNybHkxMDZ1NnNOOUdhV1dUNHdqYUtNSW84VTFU?=
 =?utf-8?B?ay8xMUdibWNpU0VrRE9TdHJFbGNqN2hxUDd1QUVXNlY1cjRzckVpSzliTkg3?=
 =?utf-8?B?K1pVcmNHR1lSaE9ZUlBoK3JtU3RkRTRwZWNLWi9IcTF0dG5WQkZjdUkydTE5?=
 =?utf-8?B?bGNvdCtlazM1cVFuTStyK1ZCRnBwN0hpc0VVazN4QjNsVDVvL2tBRStoUHZF?=
 =?utf-8?Q?Zre3X2gUnwehJ+aUle8AtNU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de365bb1-b4e8-4e86-db1c-08dba3a2b998
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 06:32:30.0209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bGvYo/6/xtr1jtNzVUbIR6f6/kWSnYQIenuXtikBPDiF3X9ozB1go1nXMxO2ZHZ2DgkJRIROO4yDnCRzfYyY43UnzaFfT80bsG+kSmasZNKrxkxs/iJ0kJR0PZ2F1FY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] RFC drm/xe: Disable ctb communication
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

On 23.08.2023 10:39, Riana Tauro wrote:
> During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
> transistions. It is not necessary for GuC to reset for D0 -> D3hot,
> only enable/disable ctb communication.
> 
> Modify the existing ct disable function to send a request
> to disable ct communication if firmware is running.
> Add a function to disable guc communication.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c    | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h    |  1 +
>  drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++++++-
>  drivers/gpu/drm/xe/xe_guc_ct.h |  2 +-
>  4 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 2493c5859948..3e4c00bee6bf 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -557,6 +557,21 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  	return 0;
>  }
>  
> +int xe_guc_disable_communication(struct xe_guc *guc)
> +{
> +	int err;
> +	struct xe_guc_ct *ct = &guc->ct;
> +
> +	err = xe_guc_ct_disable(ct);
> +	if (err)
> +		return err;
> +
> +	/* Check for messages received during/after the CT disable */
> +	guc_handle_mmio_msg(guc);
> +
> +	return 0;
> +}
> +
>  int xe_guc_suspend(struct xe_guc *guc)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 3addd8fc674a..18cf5d02eea7 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -18,6 +18,7 @@ int xe_guc_post_load_init(struct xe_guc *guc);
>  int xe_guc_reset(struct xe_guc *guc);
>  int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> +int xe_guc_disable_communication(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 59136b6a7c6f..64c2029b2752 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -21,6 +21,7 @@
>  #include "xe_map.h"
>  #include "xe_pm.h"
>  #include "xe_trace.h"
> +#include "xe_uc_fw.h"
>  
>  /* Used when a CT send wants to block and / or receive data */
>  struct g2h_fence {
> @@ -319,15 +320,23 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	return err;
>  }
>  
> -void xe_guc_ct_disable(struct xe_guc_ct *ct)
> +int xe_guc_ct_disable(struct xe_guc_ct *ct)
>  {
> +	struct xe_guc *guc = ct_to_guc(ct);
> +	int ret = 0;
> +
>  	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
>  	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
>  	ct->enabled = false; /* Finally disable CT communication */
>  	spin_unlock_irq(&ct->fast_lock);
>  	mutex_unlock(&ct->lock);
>  
> +	if (xe_uc_fw_is_running(&guc->fw))
> +		ret = guc_ct_control_toggle(ct, false);

ct->enabled holds incorrect status (false) if guc_ct_control_toggle()
fails.

Regards,
Bala
> +
>  	xa_destroy(&ct->fence_lookup);
> +
> +	return ret;
>  }
>  
>  static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index f15f8a4857e0..1ad150c19ae3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -12,7 +12,7 @@ struct drm_printer;
>  
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> -void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +int xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
>  struct xe_guc_ct_snapshot *
> -- 
> 2.40.0
> 
