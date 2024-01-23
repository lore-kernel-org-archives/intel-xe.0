Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B239C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 21:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1864010E918;
	Tue, 23 Jan 2024 21:09:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FD410E918
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 21:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706044154; x=1737580154;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ThmVTO2HYsquCauq8GCQu6ebEM9wW0aaxX4BGkt1rB8=;
 b=QoWQkI/Ug7ld4HRhhUSFBvxkv/oXUDhXXR9A8PFQGxQLcPpG0zUJZ2A6
 Ge062Mj2rPxKO4Y7V3O4TaDBX4LrQsvj6+2K5fsEvGqmGYn6DKdHIn9he
 o+MJcmK16gjmI7wUjJJExX5wbbmBGPimMASv6FJn2dwWs7XaeVlHhTqVB
 G7XRyWVhODDY9kjfgSs6z9Be9Wk6XYCf/cIZ53rau0PwlCae4LF1lDJ6b
 CP14G2/NgFaTrvHe31Nd5Yo8nb4H9C2rfAciW7QpaGiewwd519O3w8aXu
 ylFXlZY/swWsVYJ9EwbM5B0KGLi5JgunfVESL2NV4IXYQNDw77Y8DV83q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1536603"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1536603"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 13:09:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929460787"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="929460787"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 13:09:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 13:09:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 13:09:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 13:09:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vj6uJonT2/c1n2RSUO5xMn+dCg6J0ERFoZVifKQOH0c//MgioO218auZK8rC0KMKZQVvtbOsPJdthtA8nuKt5MSvdTCYYjE0pvcTkdeAVwr4nAyWk1nBIcd1o1GiKjWwHMwA1VMkrETtwQUUiojKHSd9MZMN3Sy+bCaVxG/DC+vbMV/DMc76mC5NoaMnauuDgyC0aw5l8rXNzeqZoryGFwmhnIofv9/bwN7gq4XCLe03ayOpWKLY6Usg44vf8qi83xgs3YiQmUjT2N4xr8lZ7JrTGXHHUxMgrfCNLdOf8PGYhi8rxLURMdXxjqlDwcMf7tkOfnYN1BVqv+noVD0rIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2rtEMmj7UEkDUVRCqvTGk9zOosGYgf0KIICWSS9jBM=;
 b=B5wK86LaF6jri8N50lrs56NMBumF3mrIUpWZAChROJ4Tsgd1rGg7LOvHSGrCuomI98M9hqXGdEBKHzMFhOMI4vKxgvu4v0FoHw+gTIxp5iQ7uNmO05Quznxf175t4utWLOX8XsUUHS8JUC5LnMQoJrpsoTGzN2FKyvMjV+L2Oh5T2fxN1z5wdtkMGjAI7bcq7sqswlSrzw/qmxldQA8NnBkonsZdFjp8UHPAKlq4umB+eUAa567eFxiD2JeW33gvDPXiJEIerKsN50zWkH9TM7A3hiw+PqcpU5bf9rQI2JqRAqfUyl1ociGa2lmmiW2us7ka06bvM8vrud+ft3jX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 21:09:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 21:09:01 +0000
Date: Tue, 23 Jan 2024 21:08:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Prefer BIT/GENMASK macros over shifts
Message-ID: <ZbAqsVk3K/KHSOIb@DUT025-TGLU.fm.intel.com>
References: <20240123190201.1599333-1-matthew.brost@intel.com>
 <194d5e8d-e462-474b-93ac-154f82ecb4b4@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <194d5e8d-e462-474b-93ac-154f82ecb4b4@intel.com>
X-ClientProxiedBy: SJ0PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:a03:333::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 65959cd8-289c-4950-2fcb-08dc1c5785a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CKrjuvjwOblgcEQIg5cXLemVZ8JILLq6XF7qje62kGJbnPntWb/RQ6R5JdKaEEhnVaMEXHoRRGDU4G6r/5ot6zn12b6Z0sGR7YtYmGmZRdIIKgtbiCMHOh2x0JsSS3FQJjJVqBZRto2jYSCh5qBIe5YbFv0OfJOrb+QKNyyPspGzJ8N9CmyDiU1zBp+mWOdJDgJ+HvU7EpozHV2MXxLN/iItwchhB/hY+HULUczriaSCXAz4SK86/HFwzkzjiXNnBpYrnNG+ZM4FqlbhczpfXHpoEnkUInJ6iJzyhPOqjYeXCA56F47UbpmiZ4SMki4SqW5gO/0URFqEiOEuUlND/Hzzujpxj8fKb+Fu4XqukIBIaJp3sAwthNcQvZk9HogJMX6A45EONbrritV4dgLP1brHYx0D3YuRPz5KN3uqkOSkEYAySj7I6YDn8PxcJXhO2M+KkgKh5EyJQwU0exzU/ut9w8PXsg3DbtgM4FNdkK6EA//a1UPF8cdJ6oJKL1VCix9C2Xo9LdUhiKKvOCQ1NkFSm5FcUnazpSnGKmbqCf0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(346002)(376002)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(86362001)(6512007)(53546011)(6486002)(82960400001)(38100700002)(107886003)(2906002)(83380400001)(26005)(316002)(66556008)(5660300002)(6506007)(66574015)(478600001)(966005)(66946007)(4326008)(6862004)(44832011)(8936002)(66476007)(41300700001)(6636002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HL7VV2zOlerkIrYE1AJJSyhdCe173NQ28tG/hRCKnqV2KwU255Rmvb+yKj?=
 =?iso-8859-1?Q?rp1Xhqmg09Aar3mbnG3ZnD8Sr/NqKUv5AIlm8JUeKlLfGEAn6c8P3yhsrK?=
 =?iso-8859-1?Q?R5yi1TaULdc/dwNOnXJDzoCLWCzm1hE8v5UgWGUojwGGZwjeHz/7HVKJW9?=
 =?iso-8859-1?Q?ucq2Brtr8RExCS15+FMbpBu6OfLpD69cAU0EQdaeHtgQIqZQZJiRlL66Sw?=
 =?iso-8859-1?Q?3Bjt/Mg+uukNJ5iogRitXFJe4db55YNYwDxQX5ZnDJWFPFpqOPBy8AuTv2?=
 =?iso-8859-1?Q?HRExds6AaOD3ZnXycjY19yqUWCu2cW15opSTrjOzw2vNI68uP2IfIZ+6HM?=
 =?iso-8859-1?Q?cowvounexrAJPV5qXMasyWysmYnV4TXDd2dFNnm/dkTVZ7Ch2e5/G9gEv3?=
 =?iso-8859-1?Q?kLwfHRiBbWU5hzQL7FCWdrAOYJPrh+YUBIuHwb6vb+96eWhmfpWrbUNUrC?=
 =?iso-8859-1?Q?pRvzp6Or5wW/i831G3400Ced7mLOOXjf1+vphLlEqndIkw3frcND5kDMXy?=
 =?iso-8859-1?Q?NHYXCDIb4OH8LMgDRLT98CoVtH9w3Y3TziO/or1aAum1gLEpf4lbLvZaDP?=
 =?iso-8859-1?Q?Jgieyb7QMuIYTMABrxi+gBCJnnmW6JaykZECqk1WukL4g1IfoB6VgmL+/P?=
 =?iso-8859-1?Q?KgNL4OOaM/9F1hzEtG37xtzu1QHiTcXTKkNmw7Uavi8oXYu5d9uju4rDWI?=
 =?iso-8859-1?Q?8R+hkpIS2w1bXBatoHf0t0YqSzuVd0RhJdWvgMmmqaCO+WNCl6JNKU5NAE?=
 =?iso-8859-1?Q?hEuZfj84mKqZTPcEuy/miIEu0e7VQ8+uoLaHgX0hC9aACjGlCkbn9gRQ08?=
 =?iso-8859-1?Q?SY0W6inHxOFcHYEE03L9rZzXnHBRXyrP+/SmddhT4l/R5/p77A8Wp+GgWi?=
 =?iso-8859-1?Q?7wY+UYixccczbz3Va3BK2EQRkF/yDsSn7nbKlukEOXNdd95p8zcAytENyx?=
 =?iso-8859-1?Q?gioa6ZPXccVD2BA1ln364E+bATp59Lz7ecTN5SUJnVnFwvuCn7hW4of0Wn?=
 =?iso-8859-1?Q?E7DQdkreO7SAcxAWyTzmRiNMBsi50l/Rsh53ElH9Tk1/iFvS8w5BmhaBV5?=
 =?iso-8859-1?Q?YveI3JahlkcGcag800dNmCvB4YbXaqkN13GAngBZMOgUIrca2cRA8qx/li?=
 =?iso-8859-1?Q?GZAc4qU8g3umjXfp8y5wZowiZ6OosaSylGkN8QQJOtM1GTroAXP/PS+wDC?=
 =?iso-8859-1?Q?1ouT+vS7pBgpRLMRzC3pFDNhL6oULMDprdOSXwl9sX+XAybJOVFKeM+0xt?=
 =?iso-8859-1?Q?VKTbvLb0Fu51gNSyE1Gchvj2aHAe6MBmu/HPT8/2HzpbeS2wQyMq7zlK89?=
 =?iso-8859-1?Q?QNFwLqZ3c9peb9jAqXC2rDTB47AcpJpK6m5icM7wi7OIHfgfHaFYDY0oh1?=
 =?iso-8859-1?Q?iGnBfmVcc9x7ohBGR35Jva9H5mHAjNxFahV7vXbQ8UAc7Y8rEmeyFFC3hx?=
 =?iso-8859-1?Q?q+tebYq0og9fYjou91DAs31GIAlFqy/opFBQ3MT43pz82PijHe3tFNnxfO?=
 =?iso-8859-1?Q?uvEIwGgGVwzjymmmbR4CIl7icyFfg749hwOAEjXobQrrodAP0QeWZrJ+Ye?=
 =?iso-8859-1?Q?B4Y4dGYL7mgUjSdKnnnXqmbv53egW+FHTYXnWtowVW76EQoX6xBzaf2Dgl?=
 =?iso-8859-1?Q?XsXOUPlIaDhc86S7YL2pVCsv5E5uVcpCPF3OQZkDGS3OiTQewl2zJc8w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65959cd8-289c-4950-2fcb-08dc1c5785a9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 21:09:01.1494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWbmcwOBxLDW6QYXlieVIlLzFvMSmK1vDNu+Tm7cFJkmS0EK8C9LP0Mb+5dj9EKbs1zQytmgBwbJbfBBGqFbww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7651
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 09:14:06PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 23.01.2024 20:02, Matthew Brost wrote:
> > Using BIT/GENMASK macros is a better convention than using manual shift
> > and will also fix build errors [1].
> > 
> > [1] http://kisskb.ellerman.id.au/kisskb/buildresult/15112475/log/
> 
> commit message and diff doesn't match (missed patch ?)
> 

Yep, will resend with abi/*.h changes.

> and the actual problem was only due to missed "u" suffix in
> GUC_CTB_MSG_0_FENCE and GUC_HXG_MSG_0_ORIGIN definitions (as using 0x
> notation alone really doesn't make those integer definitions unsigned)
> 
> note that those were already fixed on i915 by commit 962bd34bb457f6353f
> and discussed here in [1]
> 
> [1] https://patchwork.freedesktop.org/patch/573620/?series=128312&rev=1
> 

Thanks for the reference.

I prefer the way I have fixed this. Let me resend and we can discuss more

Matt

> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c    | 2 +-
> >  drivers/gpu/drm/xe/xe_guc_relay.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index ee5d99456aeb..fc5cc2b2bcc5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -866,7 +866,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
> >  	 */
> >  	if (fence & CT_SEQNO_UNTRACKED) {
> >  		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
> > -			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
> > +			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%lx, h=%lu\n",
> >  				  fence,
> >  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> >  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
> > diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> > index c0a2d8d5d3b3..2d1f19270d9a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> > @@ -300,7 +300,7 @@ static int relay_send_transaction(struct xe_guc_relay *relay, struct relay_trans
> >  		ret = -EPROTO;
> >  	}
> >  	if (unlikely(ret < 0)) {
> > -		relay_notice(relay, "Failed to send %s.%x to GuC (%pe) %*ph ...\n",
> > +		relay_notice(relay, "Failed to send %s.%lx to GuC (%pe) %*ph ...\n",
> >  			     guc_hxg_type_to_string(FIELD_GET(GUC_HXG_MSG_0_TYPE, buf[0])),
> >  			     FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, buf[0]),
> >  			     ERR_PTR(ret), (int)sizeof(u32) * txn->offset, buf);
