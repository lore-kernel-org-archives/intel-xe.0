Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F05C4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 17:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFA510ED6E;
	Thu,  1 Feb 2024 17:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJGDdBVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4093010ED6E
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 17:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706809342; x=1738345342;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ftu3EeOTcjHr9438EtD5PAU14ePM+dQ8uflhL8ZujNw=;
 b=JJGDdBVyDFpnX8RBE2zIWJbNYxWtWElqUqHODU0wUpH+SkWb4uAiDgSL
 yfs11iOcweKRNDVhCpgFzIlKyQ5YZNbvOt3b9gsnE3Ut1ybcZFIQzvYtd
 bnRo9z/nhwBPk6OiqQzxNYvX1WCKsygxm6ynF4tRq/ldcHwkwhliLrkoj
 9XkmxiwDaHwk4xMZrwYRu/JDlB1L/sYukT8ALHnixSFXURc0V4O3JuCTa
 bw97zL2ZFi2aSF41fu62SqVT0ol+9jwlrQY4y3fl7ymb8oPEUWqJskQ92
 K0stYh1/rMcyllJ/MmvC9oLih2tNhzDUDn5q2w4K4wRft3sPQN6iwc4jD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10612919"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="10612919"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 09:42:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="932233790"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="932233790"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 09:42:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 09:42:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 09:42:03 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 09:42:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qt9cOJjEK8vI5RowmxXigDplem0/Nw9TsNy0V8ia12x5CvCstW6hKPxLEgKQWCFeeBZRaDIqMqpxqGyZHehKc85S6L/jBgPJZ034q3fOLiFh9IegQS1101/rgOIqtwcov0VAgRBpPHLhUZ3gD+en+3Z1qBpAz4W36QmLCsh81omtaQyLdJON/J/28yMdr/jzOuzDp/D8Y7IPK0IDL9UJqxntrTgpH778ve6siigi/4YOmWKcpE52LRFNIMPmPWHPJ073F0onCntclqXo9mw3No2wJbHjUZavoEZahiUd1VvHu8zFGYJ8jNrOUpOjg+p4NYGUpl/9tQtCnajlBHZ5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gn5OdgFLmnQXrgdOW7Yc3nzrCbVlt4QbC4iTl2g9D2Q=;
 b=Olut5UcKmGh3SsmjlbEVI6MfKQUUE+/r8By23iY6BlUq4yA0UXZfrQyGWjbaMKWYDDhlPedyRaxMWAs1vxTPcCW3AwJ/C6rBaIGujP2LeTEWWnMeyvMTm3zUCpBOrs2/DSaWBT4FIyUleQ9Hn58t9/juM/JUDfFkH1MIanAFiY2J4pDoGKPQhBFR4opRaDrqRwVikvmz4CbcpmSND3Ve8CDiOWb4kyXtYYvCp8AeIOhRIUQ435eLuzHaBoBq3olB3V6BPUJ5+iB6vskA7YE+VFoSXis5RP12q+60uvSxZqAbu6odbvZgVjRUKHGEwwqt7cyyHmEeqnZ0XnplUfBpQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4644.namprd11.prod.outlook.com (2603:10b6:5:28f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Thu, 1 Feb
 2024 17:42:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.040; Thu, 1 Feb 2024
 17:41:59 +0000
Date: Thu, 1 Feb 2024 17:41:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Brian Welty
 <brian.welty@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/4] drm/xe/huc: Realloc HuC FW in vram for post-hwconfig
Message-ID: <ZbvXuNZjK/qD08RI@DUT025-TGLU.fm.intel.com>
References: <20240129130308.3544466-1-michal.winiarski@intel.com>
 <20240129130308.3544466-3-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129130308.3544466-3-michal.winiarski@intel.com>
X-ClientProxiedBy: BY5PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4644:EE_
X-MS-Office365-Filtering-Correlation-Id: aef91902-9c73-4bee-d61d-08dc234d17b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CX+Prqc8ZRNggB4fw3+E5ivzCCKAZ+XRyr5qYcn98zRjoEIgTUEM9jJimgFN9WegrjhhMJAQfN6pnXtSHRrdmLpJjsiFHTJw1h2HjqsB4f3f6lJM6Wn11FWGwI7V8idir5sjL3rUu6bJhJXUwtmpDNpmTGUJHzGi3rOcLDwpnDoDXgDe5WvRGinG3PXvxgUrew4CU+Uh37XFXh7bR4vNlMH35obZYn1E5KicLcbL7bbJvBsn5OAV+1VpuCigBFohH9u3deqgaP7f9rVlFMqVduJnwaMB8mIsz0ZwWVP9OHRDt809UwInKv/vdnjE10JMjjv6UU5SILLA3d+krcZtaP2Ryl54M/lVi2sIn/WMpnhRSV7QkogS9eLkRrk6JX/ndZRQdmh3mMwfxNm9eakwYpYkBel4geS2WtFBvhKzPqHHx/2MMLhAhjRcWqNtAQi+a36W7YJwjR8j60Kp30vIQUxe5LnKOL8ATHUEKDTmrp4tjbYYZbImvdBaY3nQ0zaBDmJhY2nNRnrM9krYZq1kczhkEmN+5EXwbc6QxF0HmUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(26005)(6486002)(6512007)(6666004)(478600001)(6506007)(83380400001)(82960400001)(38100700002)(966005)(86362001)(44832011)(5660300002)(66946007)(66556008)(316002)(6636002)(54906003)(66476007)(8676002)(4326008)(6862004)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW9VT1FjK3orcU5NM0o1UndHY3g2Qi8zVVBDMDFZaXcwWmk1TTEyOHdKMnYr?=
 =?utf-8?B?SE5XTDNLWFQ0eWpPU080R1RlTkovOFVxeGQwQXNtQmxFYTZMZHNVazFWWk1X?=
 =?utf-8?B?ZE5XNVp4OE04WDJkSU5DTi9vamJicEhtM2RpWFA0SzRPcmhxTjZpa3luN2hl?=
 =?utf-8?B?Q2lrb0JZSmRhSEkreWRydWlTRE1nS3hXOGJ2OG9taktuU2plMmFGd2FmOUZU?=
 =?utf-8?B?MHZpVHgveG40Y2xwdWkxTkgrZFFmNHFvMm5kRVg3TFRxTldjcTJPZFdVZXhE?=
 =?utf-8?B?QlY0bGNaeFE1eFZYUTdtTnFWMk8xd2hVSWdnRmZTMWFWcjZVMzlvTHE5WW1Z?=
 =?utf-8?B?THllMXhta0hlS2UyVHdIUGhUS0Q1T1RKK0hjbVc3cGozZ0diNG1SRkd0NWxN?=
 =?utf-8?B?dGVJVVVodG1JTmx0bG55dXYzMTBYOThFZ0Z5amlsVnNGWUZKZWF3NVRCdlZY?=
 =?utf-8?B?WkVZZFVqMlNlL3YwOURsU2szWW83RENTUWU1clB5N05DK0VOLzg0ZEc2ZEZV?=
 =?utf-8?B?aGNIamJjT3hjREZKL2t4a2NLWmNObWJwOXBOamRyS0lybndqMXZPamc0di9L?=
 =?utf-8?B?Y1VKYVl1NEZkZ3ROdDZjZ3dlR1UrWGVCaDFPU0tvWHdCMWhwMnhIYkNkQnpt?=
 =?utf-8?B?Nm51S3J2QTBqZDlXenl1TE5JL3hRbWdjalRLblRpK011SG5GRHhNajBQcklq?=
 =?utf-8?B?TVBCamo5MlBKNDZleWJLSjVFUWFCQVlKR2xVSTIzZVB2SGlkNUxtcXFUL1JM?=
 =?utf-8?B?amdleGdFWkNqMWdNUHRXZDJ5SjNxZXJ1SWxTU3prdE5nTnh4VUptTVBlcVRN?=
 =?utf-8?B?czBJaWJlQ1Avb2dDQmtjVTk3cmpwUGIzR2Z0dE1rUlJjSkRhS0s4YXBUU3VS?=
 =?utf-8?B?UU1LT0ZmUDJpMExpOGowdVNBNC9XUnlJeTRYMjI0d2thZWJzWUpYaXZpbUlJ?=
 =?utf-8?B?VkFJV1F6bWVYckxzZEJ6dGUzS0lHT1ZkZE0vVjN0L0pDUTJMYnUrSHh0NzZl?=
 =?utf-8?B?eVVJY00zQmJFYVFzWjFicW1kdmJQWUx2WnVSN1JYSjFKWXN1WjdvRCtuVnFG?=
 =?utf-8?B?bGhBTFZieWU3M1pQYmNqMXJqTUNaQXhkNXNKcU4wZVhVaWNhRGx3WGlHNUts?=
 =?utf-8?B?VHp2NUhlSFY4M2plYUMwcmN5UmpjUStjVWFFMnZSSXZYZHBpNUpCbmxwcEJR?=
 =?utf-8?B?MS9namdjM2pVT0c3aGtsMWN1SWdRNnJSNmcyaFNwUEF5RjU2TnlJcmpzUW9u?=
 =?utf-8?B?Nytxdnd2MWZMRDBYL3hJenV5SXM0RkpIWUc3SHdrUFNrcENObFIrK0dyT1Vk?=
 =?utf-8?B?ZkhVb3h6cWNhVjJyNEpQZnZrWWUxZjBERHhtUGNadW5CZURKYVQrdC9zNFV4?=
 =?utf-8?B?c2tvK1doc1ZnMWdUU1o1MWdHYUJwL2s0ZVcySXZ5eS8zZnpSdzF6dVBjNHh6?=
 =?utf-8?B?Z0VpVGVpMGdzV21QbWNaWTJKM3J0WlVpNk11WUF5a3B0bFJwcFFOMjRGYi9r?=
 =?utf-8?B?QldjTjU1MmdvS25nb3RFT1FIS1JLb2NIeGIxcHAydW5zMGRLU2pYN3MyQUdW?=
 =?utf-8?B?Nlk5K1pJK0J4bWdMZDdRL3gxbW04Zi80T1lkOGcxbmZCWGdMZ3k3cG9ia3NF?=
 =?utf-8?B?eDdERUpHZkRkVUhNNHE0S3BoWFRPdWFERkdrUEVVQlcwWStwR1dEa0pmanNY?=
 =?utf-8?B?Ukt6Snl4ck5XeTBya0NwSkdTbHV5SkNubmF6TkxQZzZNaUNZRk5scDdLdDNE?=
 =?utf-8?B?QlY1YW9KMEN1ZEM1ZWM0dmh1VCtrcEptL3RNM3VrT0hTdk1SbkRaajFxWStp?=
 =?utf-8?B?bEJuREQxWkhpQXVsUDMzMVNheituOCsycWJVWlR3REFTRU1uK0tKblRCMWZi?=
 =?utf-8?B?bHBvRERsRDJ2d3RUWmIzNmIwYTBUOHFCNkIrbkVlZElpNC8wUTlsV2U4alcy?=
 =?utf-8?B?SGNaNTNiazlna3NMQURyM2ZXT2JFaDIzZFVRSDZkbEE4ek04NVVmTWV1UFpQ?=
 =?utf-8?B?YUFEcXBhTFVlY1gxaG5aZ2lUUVpNdUwwTXNjMjNZWTE5LzNFSm90dVpuTlB3?=
 =?utf-8?B?MkNnV2lnOEt0d05XV3l3a0RXWndpbDFRNTg4Nm5NTzJULzRHQllIQTBWUGxM?=
 =?utf-8?B?c05TTzA3dlpQVm1ZZEFJc0wwTW9ZQ3ZybHpyOWdUVnFUckhJRnozOWU1akoz?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aef91902-9c73-4bee-d61d-08dc234d17b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 17:41:59.7811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYzopTghhTYB1lF6qy6OfZVlZBqH3jdfjAu0YOWtBwTDuazVF+6WDzL81ORRIKBIGAGSyjKbq/Voxn8G0UKwJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4644
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

On Mon, Jan 29, 2024 at 02:03:06PM +0100, Michał Winiarski wrote:
> Similar to GuC, we're using system memory for the initial stage, and
> move the image to vram when it's available for subsequent loads (e.g.
> after reset).
> 

This patch LGTM but same question as in [1] - should we release the
system memory for the HuC once the VRAM is allocated?

Matt

[1] https://patchwork.freedesktop.org/patch/576287/?series=129268&rev=1 

> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_huc.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_huc.h |  1 +
>  drivers/gpu/drm/xe/xe_uc.c  |  4 ++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index eca109791c6ae..b545f850087cd 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -112,6 +112,25 @@ int xe_huc_init(struct xe_huc *huc)
>  	return ret;
>  }
>  
> +int xe_huc_init_post_hwconfig(struct xe_huc *huc)
> +{
> +	struct xe_tile *tile = gt_to_tile(huc_to_gt(huc));
> +	struct xe_device *xe = huc_to_xe(huc);
> +	int ret;
> +
> +	if (!IS_DGFX(huc_to_xe(huc)))
> +		return 0;
> +
> +	if (!xe_uc_fw_is_loadable(&huc->fw))
> +		return 0;
> +
> +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &huc->fw.bo);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  int xe_huc_upload(struct xe_huc *huc)
>  {
>  	if (!xe_uc_fw_is_loadable(&huc->fw))
> diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
> index 532017230287f..3ab56cc14b00a 100644
> --- a/drivers/gpu/drm/xe/xe_huc.h
> +++ b/drivers/gpu/drm/xe/xe_huc.h
> @@ -17,6 +17,7 @@ enum xe_huc_auth_types {
>  };
>  
>  int xe_huc_init(struct xe_huc *huc);
> +int xe_huc_init_post_hwconfig(struct xe_huc *huc);
>  int xe_huc_upload(struct xe_huc *huc);
>  int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type);
>  bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 8f37a809525fb..d62137306d280 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -94,6 +94,10 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc)
>  	if (err)
>  		return err;
>  
> +	err = xe_huc_init_post_hwconfig(&uc->huc);
> +	if (err)
> +		return err;
> +
>  	return xe_gsc_init_post_hwconfig(&uc->gsc);
>  }
>  
> -- 
> 2.43.0
> 
