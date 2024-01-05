Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B83C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 20:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573BB10E06F;
	Fri,  5 Jan 2024 20:13:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97A610E06F
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 20:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704485609; x=1736021609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8RasD9FJJfKC98BXcfKT/lPM6Q7owMDXXAB6PRUg+HY=;
 b=i2DORonNY+UA6o7XUlfRkvKUeqmhDzGsvA+LzY0nUOFgmJMLYk+KG3st
 igIa6VBCkJCbWCamTqD6EUrT09phIVFD0JIF/4FOM5QnitfUgCZ/w3HFJ
 CkWL8CkLdOweRfPJB2lryLHT6y/Me+tvdz/Xfe/lbJbtaZ0VaJprwfrrV
 Ph1H8BPdF78WeG2+ldsjPT+M/wOhxrPRzjuOTaRqIYkxdrSJWFmVqQsF3
 ruZAIPTUpAq1xsj8tbHmggwsL5nHYaW3Su/2ns1+KVP10Bo7Co+K1Df4a
 TjT27KBfwMr7InMlApRfMFJjzB+JzlFwk05Bb0CgdPlY5NZOScgrOpc8K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="401362053"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="401362053"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 12:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="815039693"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="815039693"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 12:13:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 12:13:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 12:13:28 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 12:13:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jteydbnndBsxHAELhoap2jgwrkLpz3u8Ba5u6Bmqo10P3nHkDaL9h1aXldI3E7aDz+/adLEV6SYulN5WLLzfLMPXWwi6mNuJvl2pEDjsAn1FRBj5tJw6/wRh6q1XyO8OwerHBYQMGWmBtBj4G/K55+pj4tLaHQKzFJtNFM7/4S3+IDCp7H1j9Y2i+K1Fsw0iVIiONZwGO1Jl3uD+IIaadlH6XLRQJoIu4J6Eglopod490jfnNsxX85vQlRmDT0XpQwVJXyyd71iPSULyvS7c5HTMVptGE1ieTzMALNeJDeMkRDhiWgjQfsZdcDXd5e/GIxOytSHbuVbAjR4M+Hdxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuA3bZennfoJ5d8EwEys3qUCjg8299kUcQua7huI6iw=;
 b=e7ijZjgOmWjpuh+2A+A5PsZQGdJTeBJSzeRCAuOU+RHvae8Jz6iF9VeGvETittTRXh1f/j/BJ6cO+ZdZkZgC7BwkWhxVgIQAzMRMRruLyLywFeLufErqD2qn0NJt+ksm4He7YgtY9EfCuLDwNDaq0vI8WQpZAmTy/8axlwdTSFMASIXCe8qq2apBIin9gse4JWb4wzEMZj77lXnCsMCIeEhFbtblH2s90rvjg3AqBL/oe3VcwH5EWGsTAf+8fsrT6yAtDCtQKMRXV4FAmyttR4F9luxQj+yuZBNm/FQ8EH4sedULCFOHL+D1YjFMVgDfztffSNJVexOoC8Y9JKJOaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Fri, 5 Jan
 2024 20:13:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 20:13:26 +0000
Date: Fri, 5 Jan 2024 20:12:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Only take actions in CT irq handler if CTs
 are enabled
Message-ID: <ZZhisNhXuhxg/iS6@DUT025-TGLU.fm.intel.com>
References: <20240102214320.1255783-1-matthew.brost@intel.com>
 <c2af7f83-d615-48db-8d7e-c660d0db71ec@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c2af7f83-d615-48db-8d7e-c660d0db71ec@intel.com>
X-ClientProxiedBy: BY5PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO6PR11MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: 72eef6e9-d9c8-462c-b549-08dc0e2ac663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ASVHOwR2S04chr/mi+MSNGF1R5C8Q1vmJ8gxag8MZelWmHRtwEbiri3CN8FSizO/lADW/9PxHTyXIuSsAon64BR0cY6Y2bNm1uX6t/hnwGqH61NQ+FG4l0SnJ8LCJLEBv3yFQiouOYwf5ThX79Q4r1XLEUSOG1H/p8uTlyQ9AfNYLTri7zIQ2/p/Y3wedpf13lWI7fSMpWvAeLU5dk2rdagwLjXrj1P+W/OEUzbsSrmNYw1mfcKHwu0XnR/N1NIt+nbVFbDcIx6EukNqONL3aYbxb2mJWlmtQszYlk9wxOFZ/UkRAOrnsHjzbTj8osiI44MjS8HkNtVslROkXAS7jzI45N9FAoE5W+lgD5vuxD6uYC30esbbNHGFhSBtTRoVF5xYXMoSJwsBvWdDnk4hgunJIACeRWb+5HItLLE1DyZh4Ey78y8vbhdnghfFKXaB/1/OOLJHjtXecuxoeLYXEgcNGfa+bk+QwZv1vRFXGqBwDSyCPjLmQdQ29g5lfty//QMdtKn35hw+Drz8go6N9fqRItLlZWUSJvMr3DpATQFELESXoFsYvoqO5b9K1+Hn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(86362001)(82960400001)(6506007)(6486002)(6666004)(478600001)(53546011)(6636002)(66556008)(6512007)(66476007)(66946007)(26005)(44832011)(6862004)(2906002)(5660300002)(316002)(8936002)(8676002)(4326008)(38100700002)(83380400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?05B47yGF9NY5gzhse6JM711bosN5Hwczlj7akESF7VRqvb5lSlEfmCZYq5aJ?=
 =?us-ascii?Q?TJ6aygEzf2ijMVVUFlEYaf5I06UVlLg4fzBffI0bLZ4nfkJKdEeUtrO4jzKZ?=
 =?us-ascii?Q?6IyCLgpzqLk6lCDjsr4JQQJ8jfvriRztqUJPDOF8K2rTVTZPG225Ftpj3Ttr?=
 =?us-ascii?Q?uFaBk3wJRhX80SnIMvu8CNRW2n6qvPheLxcOM1ux5NrSdTDtGYWliiSqDe1t?=
 =?us-ascii?Q?bForqag8+ibjP9TF7vtb4XKrE0hG9Gd5nuDzxy+ujlPXDizRq5sPG7gwiP31?=
 =?us-ascii?Q?yXLoY5SNL7LvrGihB9SRZQpUandb/0lQwsYOAyMFdD9qp/DQVdwNdtewvoCt?=
 =?us-ascii?Q?BhW7GybberMP2qZxomvStNVUxs/MWKiUn9sfIjUUAMvazr0cGdFzW6TshRer?=
 =?us-ascii?Q?QZRC2hCuS9ZkUrRPBvgqhlR/fClvnxjRrfEo8jgQMPLyKPrA+yBgfWRpmWWG?=
 =?us-ascii?Q?d3rcmJ7maq7KF4gXIAPhAOF8Z3EWBWja0i3dgFut5uoMHPYKjpXY5dViUuQR?=
 =?us-ascii?Q?+5PY6BC6kqnhPFT85JHNLvnxs2mWh/bnpEnh2KkkCjode0uH+0hOWat47U2/?=
 =?us-ascii?Q?xpP7gNjqatI36dzgeEg6SU6krZD0fY6HmhFfcaQqhgbTcnvJw3Hgy8RBkgmy?=
 =?us-ascii?Q?/37Ws6W8rIRLJLl2Q7js9BUx1uWTHNA8NjRPN0+6XWQsf2Ol2vmfQM88kO7c?=
 =?us-ascii?Q?Xs7Gdio0DnF9arA4DlU+JeUa+34f9+/1H80kW8sHPdNoD5nSEmM7MemeKti5?=
 =?us-ascii?Q?LOW+FIRHXPtdNMK9T5pobASjJD4/4E3IYokGd+wY/lx1nM3M6ZMw7AbD9NWu?=
 =?us-ascii?Q?kZIaTHZBtopx/tINFZcWxNACo4UeaUpbMu75GN1EBb+SyUD93YyeB8XC0r+4?=
 =?us-ascii?Q?kPC7+z26x5T2X+IhOFa5vZMAaAehxdTB49AiilL0S3KZsUYc304ZbGj0j8ZX?=
 =?us-ascii?Q?eaM2YiD2V4I+pdvL0a6u+49ETlV0JQ2Za79Kj5ACnAn83XVGcN5Hq1nJoWm4?=
 =?us-ascii?Q?ziozNkUuc3FqIOoZS+jRceJ1RrVlQfDdXnC2xmGMLynomwQ+IzC0cfdQQzZa?=
 =?us-ascii?Q?KNlw+2+RUTAVdvnCd9DFHkDYVlrtrR+gEEs31UFHWgUxk2Npcv5qnrbn8+XE?=
 =?us-ascii?Q?Ic4rdPYkV1eTpzohNOMU8/fe/KlfiHX4S99PKklMqBQv3poRbdLn0foucP3+?=
 =?us-ascii?Q?iejSJOksF/yqGmOB3Vwg8/liuJLztljFlNuLWPYNbNzXmXsGFCLmHZPdcUC6?=
 =?us-ascii?Q?D+h/KLRAtX24/iQnfa07euMN6UEJa8bu1XYeinoRr8WieRS45yniq6XtEfts?=
 =?us-ascii?Q?BlRujXkfe3mqwqsB/j8mV0IwZDFsdo4uqLHfQz1v/Uu6ZgXsz4Yts0j7/TRw?=
 =?us-ascii?Q?CiXDG6ypoZTpNP6MFY9aN/qkRbsKXsslcjuUVFqmjYnl7BwBK8ozFG282wvE?=
 =?us-ascii?Q?xZJMMBTQZX9koq4sPB9qUSQMDXzX02vBA7Xxam+G+v2b5vvC+TpJWAQ9zXsp?=
 =?us-ascii?Q?5tMpbaIZfK5qWkhxoHtLsL8IOZAXBU/PhU6eq8ClV2BqrgoRP920QDlTPbr3?=
 =?us-ascii?Q?YCORVtoXkhuQQHG/XL6M0RtxIKHwCf9duQXTvGOtNMJs06WUPSfFstAdHijb?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72eef6e9-d9c8-462c-b549-08dc0e2ac663
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 20:13:26.1090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgxUQ71Yk3BiejuJEipA3IhqJC1Ha0XBBD3THa0NTNLHDRBBGEKn3vzCYtSAlTxgrbgtlnppWM0E6hBXgXNwvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5651
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

On Fri, Jan 05, 2024 at 08:59:36PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 02.01.2024 22:43, Matthew Brost wrote:
> > Protect entire IRQ handler by CT being enabled rather than just G2H
> > handler.
> > 
> > Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.h | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index f15f8a4857e0..05302db02e08 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -24,10 +24,11 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
> >  
> >  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> >  {
> > -	wake_up_all(&ct->wq);
> > -	if (ct->enabled)
> > +	if (ct->enabled) {
> 
> nit: to simplify the code I would rather exit early if (!ct->enabled)
> 

I like that too, will repost with your RB.

> > +		wake_up_all(&ct->wq);
> 
> btw, shouldn't we wake up wq _after_ we process a g2h message?
> and maybe this should be done in fast_path or worker?
> 

I'll take an AR to look into this, the ct->wq is used for a lot of
cases. Will do a full audit of this.

Matt

> >  		queue_work(system_unbound_wq, &ct->g2h_worker);
> > -	xe_guc_ct_fast_path(ct);
> > +		xe_guc_ct_fast_path(ct);
> > +	}
> 
> anyway, since we move forward,
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> >  }
> >  
> >  /* Basic CT send / receives */
