Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329D6EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 16:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D7510E0DD;
	Wed, 19 Jul 2023 16:15:36 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790AB10E0DD
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 16:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689783334; x=1721319334;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y0b5V1HWkA8gnU8bcIUCC8roKgrQ2MyKIGjraBbS/R0=;
 b=iEG8KOTgaWx97VLWKD3y9sBh1DBzPMtDeFC+F9CsFeCKQWGQVWJ5AtXj
 6vPMQY3vaCKLLwGpcYkWO60NDTS19ZpYH2oEhkeNjmm06mEHfbGkw9gx4
 9CaeLL0Q9CDTS4wbQmVjW1VOOYg2gHcrbuBUyVm2p+LTBiph4xFEwMPWd
 necE2L0r2zuq+wUe1fWOmge0P13se/IhHZi4GRvoXymxZutjVdvEX/TYq
 Q8B2eOdOeJrxT/ngMDHXS8UyK2jClD4bkNTv+hLvIaRlLsSImnnDLU05Y
 I4m7df6l6PblQQcPrLgTtxmXRwsM5Yrs16eTOHBozoRIY/RAWuBpCFmwj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430278104"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="430278104"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 09:14:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="867534001"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2023 09:14:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 09:14:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 09:14:30 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 09:14:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpPHdC8NTAHKkv6ULMK52066TnxWQTFgHQ26rhS9AMFLW07JI39GFNGaZ7JVvtSlbg09epjtOgRgX8EJntxB3DHvHUYx/n23djvPn18OmKcRWuvo0inyURb09l/gBuZ2lXFbpwE7DybmvYj4ew+7MnAy5w2ykNplONUWN6vqONwW13TQgK41IdVfb2/eMOiFkmASLhyEClXuNS8oyiwa90dDEvdf6HWYIJwLHtgYZI8+YxwuLTwVoL6fOKCnOoJ3niusQkWtlQfFdKeKtGKh+EbVOhIG2mYSlOecucOSuOO1ld9KlTj0yZ6Gn7rEmXWiOGYz8eiyFR/x+2hVIW44Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWixfGyhkw6wEPMsJK1ohtomKvwHS4VJ29FNoROx3/s=;
 b=bna/hPxwA37lOLTG8xlkn8CwsRtvqb7shzvwtgTu+gnkseRliaTJMpezCJ4G6JbMSqI+PI/3EHDzGLh0VCaWeJdQd7j4hRzj0rAzDQYdImU5j4MQlXyZENTfG+WoagsT/grsgHndi+K4r//+iIAaF8/fcG+My53PuVL3TcwZprR+JAKfkzpmXW9ddSLfMlcKnEeYr8KW9FTb28dAg37zeonIsoRgiVtAPMpd0S3/KkiF2jx95b/hnh5bxREoG5EF36OA7ebZJ3ISNAFGoDavc2HZ0S9KDMzvN2fdZjho8Dk+T5/vc29Bw9iPgvCZhwWlcpZ+r1L+5JPK0vgNs78Baw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4854.namprd11.prod.outlook.com (2603:10b6:510:35::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 16:14:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 16:14:20 +0000
Date: Wed, 19 Jul 2023 13:14:13 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <epdgyy6rfna2m5ssle3z7yppf4fmh2hxeckimijxjn4j2uksxl@b45xv3xsyfeb>
References: <20230719135108.7-1-francois.dugast@intel.com>
 <20230719135108.7-2-francois.dugast@intel.com>
 <ZLgBKwPAuBbDx83n@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZLgBKwPAuBbDx83n@intel.com>
X-ClientProxiedBy: YQBPR0101CA0173.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4854:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be2f0a3-5272-442b-6855-08db88733573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yn0A7MddPHlXAZFXr6xG4Gsfj3pTiDvpoI5v2lk41juDbsuzwxlp5dwC+9k7VooDbQA0cT1n0PCDB+nSNMzNK4l4Qfz2XNlT9nOa5wJa1yXVA7ZtzEgBhc1O4/aZ1eyk/m/bEgrWYn3NuSozboSAP91jsarDVaARYIk9815nmfKwCqRGilB1VlwD0wDpwRTiLIKZs2p5AjADJ3aizZXGq14uFCJD/wg7jQ4xSnE55HUnY/qP+KeaZlUBQnhRkHlSPI9VpxrkbK6O/OA/u30DrlfB9UfCb/XjEMkfXKa2/ZHPw0f0B3FrnRtjEMXmVT0N6TUw/9TwxHk3LqWlaWjO0t8QkZACvahBQC84hkQ4jED1HMGDwHCM47auJPzkqy/b/NjzMzVAvodlqdK5OGKCPJRp+mk0uE1Sce0qKPRcqZiMiMDF/tBD4HtCSBhfWaLJtrL77kET7ut/8dIk518LutA7ZcTMk8fW/EmlJiT1mq8DQn3DJ1pYLW6hh3NRXRDWiPyby1s9gXcLMCMRVcmYFacyNZ2SCcrU5PgC+gLhKwD9KFRy4V7/1gepk4f2t43W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199021)(41300700001)(6862004)(8936002)(8676002)(5660300002)(4326008)(316002)(6636002)(6486002)(6512007)(33716001)(38100700002)(9686003)(6666004)(66556008)(66946007)(66476007)(83380400001)(2906002)(86362001)(478600001)(82960400001)(6506007)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H1+TyiPiKYi+zsY0Yy5dCBiwnWvzE4/TR/NWPi8i/t/AVYlYrqgCJGl2xUwB?=
 =?us-ascii?Q?sfpgMEUU+TgpgXBupsndD8WZiM/3X+B1Xw8kN+aaoiVXq9kWSx87mXv2IGLF?=
 =?us-ascii?Q?bHKAdja9Hn4dNV5qmrttTktzSee5o/sLheeesFNBZZGVqXNhzRFtroFP1Ufb?=
 =?us-ascii?Q?+eDeW3j0rFYuV5Ugdh6aPgaLAAcq1iyeUH4mc4P+KJkcAU56rbxIOM/acNNs?=
 =?us-ascii?Q?UKNqAPC5s9F/g+TD3TqwEp25/xtJkEMM2UdtC2qAcC/qY0r3unau0Myxo0e/?=
 =?us-ascii?Q?RsBSmVK9I7yNX84HSjnTdEv6p/ygnd5kRREK1no8MbkpY0GopI8PMRX5viLx?=
 =?us-ascii?Q?tEiufXCD36RmIfPd+jz6hcpGMwAOrC8FCi/AUXnFiY09NS1fYAfPfb7YXEM8?=
 =?us-ascii?Q?UsYpDziCUcD59XWgo79pW+s5qIanzv2pS4alGeHttONtqXq/ND1Pj7dPXLFV?=
 =?us-ascii?Q?XbcfziSljG2lJ0Ba1AjEv1lnWJf0ST7IfmZPq9p3EqPB9ipdFAJkIvQWvYAd?=
 =?us-ascii?Q?rWgmgRxS/GabWPu+6ijG8GnOaTZ6B22gmnPu6lvjKd2Xq6iVzxvf6AsApty0?=
 =?us-ascii?Q?bFjzpGJMpoIoCz7pjg32FbvFXdTeXTTpmtyjl32qeR1CKn12uHPdZlLLH44l?=
 =?us-ascii?Q?On3IVfqwtqEA8TgcbC+xW7XNseYyBppQnD3PNOA+FflgmDNGgP7MOnIQxn06?=
 =?us-ascii?Q?Flof9Eg2XNpIi2u3TW4Q3ecUDVPfuYUaEWWL5tIFKVG82frRmdjLjHT6pWH4?=
 =?us-ascii?Q?GsHSakT44UbgzFPlF2eF7QpB0lcR7XsJTHLOTQl1PPskpgn/uOY79U+nxx9Q?=
 =?us-ascii?Q?SvrYHVVs10KezjDtzLrUVfXQoYFJEUO/Pk9k6h9ORyEpRurDr4OiqJKOEUCr?=
 =?us-ascii?Q?8i7V4ckRo19HRk+VgVVHzq3xZDPja2JIEK34WhnRl4uQuRQhIgxAlFwj9Yn4?=
 =?us-ascii?Q?nQSg31+SK8dwWvTLSibSSxr10946nAMeHOrEtj2Ad+ZdMgN31tYngb79kvwY?=
 =?us-ascii?Q?qAlRbsrzRLoSlmDXt/K9kn1OkRZWSF4LDe/FnjYscAfY0kj9YKuP0WA4LHib?=
 =?us-ascii?Q?s6PlEoyVhX5bOLzd73JuMpZdpjEqaazRWGa17RGvjYL+4BgFqXpiZq9Nq51E?=
 =?us-ascii?Q?aoFPTLGoarLGJyc7FxRN0aiN7ToKxcTs7K9/0xqNKLqHUlmtN8MMYqZzYSTX?=
 =?us-ascii?Q?xt5CnPRdeWK+YyN3e9kdpLrhqzYYM7Y5S2Q12/6pXJMoSXu1fOYiDvghsthF?=
 =?us-ascii?Q?wsCXWcRyxJ3rDeIWWrZcMROq2/iQJ3i2iEyI5/91p7osd9s3+sN90DWTlveM?=
 =?us-ascii?Q?9zgK8KsT0z+BnZ+4CjVomQ4l0kXySscMjh/DL7kib39kKnONIqxqA6GPWiat?=
 =?us-ascii?Q?kkW7atwYEbolsVelfXBSnpCMrgS5kWAd3y6M7Jl8G82BbP9xdBE9e/qlfJrp?=
 =?us-ascii?Q?bOvVqsr+ZSiKSZwcEbS17x80MlrvF3uiloWJRs+q+Qq9FIlVw/ain1mXkyjF?=
 =?us-ascii?Q?UR7z9CNqLTZDtJbpLLZICuvUSDc7oiQav+OZBP6B8RXJ4wfJjjlUMBWCBTWN?=
 =?us-ascii?Q?Lii560kfHh5NtAL2JJrg+MPDcDqR5w9P8AOVCDJznfKAEKd1BqYD4NhalWQJ?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be2f0a3-5272-442b-6855-08db88733573
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 16:14:20.6036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXqt46ykkDCA43Qn+chEhF3oLR31ZdFxZwsAgEhXqykLUG4pO1G78HlYXb3TTWSKX25Xnd3FqJn5ZgWhdWQGkEDEuxiYELuB0dTFQL0jDfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4854
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/execlist: Remove leftover
 printk messages
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 11:28:43AM -0400, Rodrigo Vivi wrote:
>On Wed, Jul 19, 2023 at 01:51:07PM +0000, Francois Dugast wrote:
>> Those look like leftover debug and are not even being used. If they were
>> real debug/info, they should be using the drm helpers.
>>
>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_execlist.c | 8 --------
>>  1 file changed, 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>> index 46293c9bb6a8..3aec37985f32 100644
>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>> @@ -47,8 +47,6 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>>  	struct xe_device *xe = gt_to_xe(gt);
>>  	u64 lrc_desc;
>>
>> -	printk(KERN_INFO "__start_lrc(%s, 0x%p, %u)\n", hwe->name, lrc, ctx_id);
>> -
>>  	lrc_desc = xe_lrc_descriptor(lrc);
>>
>>  	if (GRAPHICS_VERx100(xe) >= 1250) {
>> @@ -125,9 +123,6 @@ static void __xe_execlist_port_idle(struct xe_execlist_port *port)
>>  	if (!port->running_exl)
>>  		return;
>>
>> -	printk(KERN_INFO "__xe_execlist_port_idle(%d:%d)\n", port->hwe->class,
>> -	       port->hwe->instance);
>> -
>>  	xe_lrc_write_ring(&port->hwe->kernel_lrc, noop, sizeof(noop));
>>  	__start_lrc(port->hwe, &port->hwe->kernel_lrc, 0);
>>  	port->running_exl = NULL;
>> @@ -176,9 +171,6 @@ static u64 read_execlist_status(struct xe_hw_engine *hwe)
>>  	lo = xe_mmio_read32(gt, RING_EXECLIST_STATUS_LO(hwe->mmio_base));
>>  	hi = xe_mmio_read32(gt, RING_EXECLIST_STATUS_HI(hwe->mmio_base));
>>
>> -	printk(KERN_INFO "EXECLIST_STATUS %d:%d = 0x%08x %08x\n", hwe->class,
>> -	       hwe->instance, hi, lo);
>
>This one is indeed annoying when it happens, so we need to get rid of,
>but I believe we need to have at least a big drm_info somewhere to let us
>know that execlist is in place. Probably at execlist_engine_init ?!

at this point, probably a warning at execlist_engine_init() and
independent of this patch.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>
>> -
>>  	return lo | (u64)hi << 32;
>>  }
>>
>> --
>> 2.34.1
>>
