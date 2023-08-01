Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9908CEB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 03:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6168E10E309;
	Tue,  1 Aug 2023 03:38:35 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727E410E309
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 03:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690861113; x=1722397113;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lIbXSMTK7JfVSRmlZNV8dRi8Amt4PRbOv8FDkFoauwg=;
 b=PUM1UcYJzvkDHNq8JjfZPb4NER0Oi3Eyio3dEGyNUVrHm9409BgaUCdG
 CcoQRarRtIOyBSC1OsWS28RTiLUc5MZFEWBvPxmezAZU+JIGWT6pOoRyu
 9K32wZ5H9hcmJiKe+OhlySFtwiNt+px9lh0FCoI4RcK8GRALsovMu8DWY
 NUYZE0g0YXFc3RpRTgdtSPabzpSUoPoYsREzvvOHAvI7uEIvGVR+YwsEN
 rUkU/xReiQZpw0i83wJM/XTYI5zPtdKywJtuDPWXdQf9+Mb8Jloykf1wH
 fqy/WG4o9v49pwFS4HzlwRkMko+NPBHFltYLeWMpKVCawpUk4h3Gn583t w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="366659335"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="366659335"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 20:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="975120623"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="975120623"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 31 Jul 2023 20:38:32 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 20:38:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 20:38:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 20:38:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOBR4gScxo9cQo4yvTVt1RQ9fHytjUM+HZN595vg/ukgdYy5OWa56tuaqzyx9moyXuFRAqWvCB14eP8gFH2tdcqF0UvJLxSyXjbtLmQn3aXEIL3t0wo4v/pAvZ8LINPxOJzDS0kb8aZhXL6STxqElSoFl4MDmWNR3Jhk40wKeWwYJhQ7KvToTXSaG0Q8e+dwPprFNZP7d1YinnnlUrEvthty4jZMtHcN78PRnhPOwbj22CTpzI2bU8EvTRCZ4mgOtEhsdVDnTMPTKWAmUJt8Kcj+03KJt9ulNQHb6w5HIqet5Ca9d58+/3VPi1a7FZ/CkOH5/HTnby9avo5DIcdb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qey8B9eEZMVJemwmeDFEVbl45b6FTztiwR6MJisuw0=;
 b=BWM8CM1KeTrMA9VAkf7+UUCU4x64pF7ene4Lt+R5bLTvhPCuyaZUwmPCN1lbuKnbaMgw6EzASCbFNi++c46on4qkKJPXigjhVwAWx7iiSVv441aB37+PF9D1gdllPoropZoqVF3oRUg3sv7ZSv6B4bIBq1BFNv4rpvR8GbLa/Ug0/N0AylGZUz9+8UoUQeBz+P34z4m1b6xEz8FDiNMx8BYP86oWNCXMUzxRX4Ji4lCVdGoLVlSW1W3PgnXRjnntBwx2rnd9vSAyrSwCDipClNoN5LPTeU/XSdqwV4CHMJFZHOSJ9aZaqLvpRB4e+oSsltDUgjX5l5gb4HvAbMOFQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Tue, 1 Aug
 2023 03:38:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 03:38:30 +0000
Date: Tue, 1 Aug 2023 03:37:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZMh+B6GqZ/8T5gdG@DUT025-TGLU.fm.intel.com>
References: <20230729040211.36143-1-matthew.brost@intel.com>
 <ZMf4hvT3K8GJmNbf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZMf4hvT3K8GJmNbf@intel.com>
X-ClientProxiedBy: BYAPR11CA0091.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: f50b1768-7cac-4a39-f0f6-08db9240c63f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hp3Dy5/Wh38LJKxKkonliraoNqBoF5qTOXz44BacvypGIEsH79zNWPm7dBdOAwvGvx7dUYsZmtidBlBkv/0+xIctvW86Wf89Yp+mygZzny/zBDBRV2ZuzytsUIfOOiz95ml2U7vPKBE60omhyvq94UxbUpGdM7gONojFiU5ueo15BCw0ON3GRlcuw5Wg7nn05o4JyhhWU/5rpHwMWCI6nc7u9/pAVSAB6TBKIYlnwZKDQpAksVjoQeSqhi2YEIoypN4K/eVhyv64venWnus4rg9jQNFm/6fjDe/9OjVywOd/iEGWtNkK2jaVQf83XjlWZWb/8bqFaNd4n5U4iFWBNcz5wNItY1WAU/uqqJdAlerqbS7wsUo5Pf5ILQwepImtDNpZFhCqAgdkwQc9CjtRPjxvToP2IIFHbAllw67lrtUYNM5Uu6ZGJBK14OAXWd3z+UOgn+HeIRtCelfaGoFrL5XdDBAU9/ywyMy74a13eh0h4vOznxsofMoYb5MrPp20CeNtxyQlnAfV3j/rlhI+oxFJxbfHc8bdHKffruJbrkgoVwfhfqDBW4cZeJ1KbvPa9g3fhLbyrv1T2IyOcoDOGbetf9xBAQM6PGhmPrn+XG0qCinE4ZUiAcL0zlC6XHMq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199021)(6512007)(6486002)(6666004)(83380400001)(86362001)(186003)(38100700002)(82960400001)(26005)(6506007)(6636002)(5660300002)(6862004)(4326008)(41300700001)(8936002)(8676002)(66946007)(66476007)(2906002)(316002)(478600001)(66556008)(44832011)(70780200001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0GbVj2ZmHLNAlZfMkR15yfCxjCzqSSQc9hhKloJKK3HaN0X24qXqpbu7TiXE?=
 =?us-ascii?Q?gkn2wJjCLB5OfdL+e64Tck8AmG9rsIOKXfnoCvUPqP9L0gD0fdrkLQdsZN7P?=
 =?us-ascii?Q?IKDoTKkPqYwq3BhevHYP4En1p3IooQUUEl1XgmMvnj4Yns7iiXvDO88Ii1fG?=
 =?us-ascii?Q?1+aOCGmzSlbwkKIexdOZMWr2rpVUpVnmVG0gyXq6CqKJK6UVzzHTtcTLEWd4?=
 =?us-ascii?Q?DKmUQnbUnBkbHS9A4fkVw6jncfhXoG45BH2oPkjgZF+QR/Gyb5Xd0+u6RNHH?=
 =?us-ascii?Q?goYhzeXFRMkBabAoJV/DdW9R+f9QEq8GZNXHScxY8UGaRkGoPb2ulYrdBOiX?=
 =?us-ascii?Q?OMAJKleV7HAJZn2d/ZhIM+ORw7iKx/7nZso2Urwh53leWV6UvB/NoEq3JH1B?=
 =?us-ascii?Q?LSBT4Ag0yH+bVA09YSNjbIHs8USrtRa9rVvXkKkEf0MbL+FYhd9BSEORR7k1?=
 =?us-ascii?Q?+pfvwqGKG+ph5MPwal2CA7nfIpalKtmBTAL/tuKeOnqENo7h60hCLAfVOYvp?=
 =?us-ascii?Q?LfMuKn8yPNhEsE0LSnhexrwKsznIMXjHZRnRUqFoBTQtQrs9OS37h4VD8y0h?=
 =?us-ascii?Q?7IC9LBh2kJ5amxpLuEEe+t57bl7IQQiogNQGbr2iEdrEO3E0gj7rMbcFd4la?=
 =?us-ascii?Q?tae4hjfghtSrOxp5AXD1BssUyeVjyt1PfBRV04y6VYSne/u/xa3z4ic5m3Pb?=
 =?us-ascii?Q?NUThE7WtFSoEerIP+M4IDfwmp8d2mjbYVZynyoPQdYqbJ0JdSQklZazZG3R9?=
 =?us-ascii?Q?Aq21aXhtYLE3mij8GpmVfKqeLxTVcms/pr7EkByh4VpZKoeSg+pvjJqbehkC?=
 =?us-ascii?Q?mn17bATg0P5YQWbk5v5pzh6YHvbxdLpl9INxigiozvNdRG6Zh4vIm8FRHJi4?=
 =?us-ascii?Q?s2Mv/7QNCnj3oKrR8YJz+28LMI952mWLAw5yclLE2tvKtvJZpGPrnpzSNwXe?=
 =?us-ascii?Q?PtJWEo0aRaEnHTX4Z0NsqeEX2PtzOM9O81En4mXDYYVD5IhmumK7KgfNDaU3?=
 =?us-ascii?Q?0eNqVu0yg0HdMx0sc1xz/u4u2xwk59WNP8xMGneKDmR2hJFr/wIYxTqz/Tf1?=
 =?us-ascii?Q?kyZFd0wQOMerVT2/+SbfgXru/rQPm9XNl+gG/tbzKiALPj5sjnK8fgEU2JtU?=
 =?us-ascii?Q?7x0UUhAzpZwDUJE1jFVT1/ZcKk7rB+VZvTizYEXfuE6ZOhK6qlrU3PjlDEC8?=
 =?us-ascii?Q?KUl764gu1x7cI/RrMRF91nCyfgKaLSRBLHqUK9KQcb+V/WHXMF74X02G81mK?=
 =?us-ascii?Q?hKoy0Mb5LYjpq6trBlod/LzlPmeZW9Py9pwtjXKaJ3pN+W3y4TckpQdEKolJ?=
 =?us-ascii?Q?fQNlwA3CDaQe0G2BQHA0jy8plDAxOr30OVJp/vxzkPqyJGbmLe7XokGHSEUQ?=
 =?us-ascii?Q?UOjqK8W+88YrdiYUO3DIplDOQnfyHO6JjIXPZYb39npX1ApPsPqwuGlsbxjH?=
 =?us-ascii?Q?xa1qYPo+2IbXgd4MVBg9uifq8Gz1Wjs9mBceVxTbF9LILVccdlLO5O6TjF9+?=
 =?us-ascii?Q?bCIYodBxbnYwYEAqcKCHynf8MPPqqZs1Wj7VPLQtdsI4k61UHTXea21EQTUm?=
 =?us-ascii?Q?+uIl4oJ3UuhndMpkJKkIAZ2sZVrqeoBB0NcFJz0YcZC/hfNioTbKYSrHjcTb?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f50b1768-7cac-4a39-f0f6-08db9240c63f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 03:38:30.5921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqmHyumqK/ahAd4Z/icbfmZKAEuq0LFTmvbqFYhXNL8dD8uGoscGERibqtW+2AE7gZPjKsrxiwikuZe28JyHxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5925
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: remove header variable from
 parse_g2h_msg
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

On Mon, Jul 31, 2023 at 02:08:06PM -0400, Rodrigo Vivi wrote:
> On Fri, Jul 28, 2023 at 09:02:11PM -0700, Matthew Brost wrote:
> > The header variable is unused, remove it.
> > 
> > Suggested-by: Oded Gabbay <ogabbay@kernel.org>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index d322eadbe75a..6c757efa88b8 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -829,12 +829,11 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
> >  static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> >  {
> >  	struct xe_device *xe = ct_to_xe(ct);
> > -	u32 header, hxg, origin, type;
> > +	u32 hxg, origin, type;
> >  	int ret;
> >  
> >  	lockdep_assert_held(&ct->lock);
> >  
> > -	header = msg[0];
> 
> Shouldn't we be parsing the header and checking for the len?
> against corrupted messages?
> 

Yep and we do. From g2h_read:

 955         /* Read header */
 956         xe_map_memcpy_from(xe, msg, &g2h->cmds, sizeof(u32) * g2h->info.head,
 957                            sizeof(u32));
 958         len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
 959         if (len > avail) {
 960                 drm_err(&xe->drm,
 961                         "G2H channel broken on read, avail=%d, len=%d, reset required\n",
 962                         avail, len);
 963                 g2h->info.broken = true;
 964
 965                 return -EPROTO;
 966         }

Matt

> something like on i915's intel_guc_ct.c:
> 
>   /* message len with header */
>         len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, header) + GUC_CTB_MSG_MIN_LEN;
>  	if (unlikely(len > (u32)available)) {
>                 CT_ERROR(ct, "Incomplete message %*ph %*ph %*ph\n",
> 	                 4, &header,
>                          4 * (head + available - 1 > size ?
>                               size - head : available - 1), &cmds[head],
> 	                 4 * (head + available - 1 > size ?
>                               available - 1 - size + head : 0), &cmds[0]);
>                 desc->status |= GUC_CTB_STATUS_UNDERFLOW;
> 	        goto corrupted;
>         }
> 
> 
> >  	hxg = msg[1];
> >  
> >  	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
> > -- 
> > 2.34.1
> > 
