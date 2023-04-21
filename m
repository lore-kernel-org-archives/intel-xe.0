Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1334BC77B75
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 08:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB82810E25B;
	Fri, 21 Apr 2023 08:21:23 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E2B10E25B
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 08:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682065282; x=1713601282;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pXpttuG4zXGjJMzfEe85GO0zgGriLB6uC+CpHUROLS8=;
 b=eD96kXWZTOOY9Ta91GZLubnnhJILeIj9qSTXkTbQBkTT6hav9ky/JtgR
 zavPYEdnOS8iu4XLYh5BBJ80gboAodeGaq3Qx57AVLqU7q0E7yZcVyi7S
 AnxfNR+S0zb+ey+CzRzCkcltxWHhBn+TKlhyaYohkoJNxDy1B8LM8WGGl
 xJZ62qT/kaMjYc61y89YNARjtRo9E6R5sG5prfdS1Gtp2t5PzDmsehKTj
 miv0hndm2t2S/67T94ixa3ffs9wdNwOKYHwhQDnj+CrcBrkxenew7WdQy
 Zf0mneiU6E2W1bLXCxyaLWgI5prg/1RZowaC9ZxppfKfPTUK5K4AKJPPI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="408882313"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="408882313"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 01:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="866625796"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="866625796"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 21 Apr 2023 01:21:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 01:21:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 01:21:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 01:21:19 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 01:21:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbeT+R8OdfzmHI4kD0GLQpYG8RAuESAHHhch0Qy+2e0SrKRN+8+XfY6wxktLNipN4lmy5yW7kVeXbJgtdjn6zdoYlvSlXxoqH+rETb3eNY38XNlC5/EHUX6sdxwoX+vABYL8mc92qFW6G/PznYH/j+WRKjbxwpacXA7IaQDGy0ECrsgBGQ3sEfd+TZMxRJTvPI8ILv+S2xlLuy9d0RXyuiG0jtnoyFhMMoJrF1F0MwlQ7dmuco8r4+DAe/l9R8ft0hzpwMGBj0N8xq6c9IoySVNU6iGdsUCFP23WrGS7IdRNfscH3j+hbL8aOd916BnJ75pUnKb0fq576STZZbkr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRGaN/Klv31sToeOdZAy5zLU57STaL4hNCcttJo2b6M=;
 b=el7oFY6STtFqLwNjl9rjGStBmNmMQVW5DGMp0QaLxKKrs+adhNY1jzTbnrGXdLNEKovxJDWJ3e6Xb39slbaTCErpunBLCKPmXt+F66zeYf0KckUa3ffz8gwXVtMQFUJG/xk/jnu0DraWUKOLRGHGJaT2/he35mLcZcJgpXHg0z4+XL/QGOI72nkFVWCb9tMlvf2/rJi+6cSfmfxVvsEAO7iyclaETCNSNbEPw4UEDAklGJFGQh9PFyir0sb0/T7f4Ty/PVC8v88OYXjDl2vGrxF5zE3BdHL/ZjI/e2BEbwRrx5/xgmwuopT7qmrqLN9IdCGQ2fAZKvGXKqXXhWIH2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7916.namprd11.prod.outlook.com (2603:10b6:610:131::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 08:21:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6298.045; Fri, 21 Apr 2023
 08:21:17 +0000
Date: Fri, 21 Apr 2023 08:21:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZEJHbr1vU3OJ/Nbc@DUT025-TGLU.fm.intel.com>
References: <20230328210920.2110910-1-matthew.brost@intel.com>
 <20230328210920.2110910-2-matthew.brost@intel.com>
 <10c2bc38-176b-5e7a-baf6-7233831eb201@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <10c2bc38-176b-5e7a-baf6-7233831eb201@intel.com>
X-ClientProxiedBy: BYAPR06CA0030.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbaf224-f820-4422-6fc0-08db42416092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rGnFwtHv+omm2NT0zUVqQoUkaAbyOavLfasdvW8nQx1OezUPpF1U1NQmQ9S6OC5t1o7HiDSRkso9QZBC92tqvKr8stEOcl67t0MVjwAYH7K6UH8WC3rdWfJP1VMz6v6ew1UtsZfKEV1dSINxOLSmpcyQLoKVxgGrPk2GPT26k3ia4cZveypIDkv3oY33mTWjmjsAxDy8howVQbY66XYckx4GO6uwPTn1abzVncpsQd3XVLtYXS4xURI7WVlzjQP/S/xfuaP8uQYn7dnMbYPcjonrW6sdHFTVeEI0M+vEdlSRiguXnE9iVfP9n3eJBckIaUj4qx56cgrcObPaNVhqeewi9gREy6aOp/XleXv8+rZ3QwGjxD/TlO0pR4Stby43qqmjYcccCfmEfCIQSoB9QA1Xewde6Pzo/z+Qu8YNNrZVvsingz9h13c47SltOQy8f4p6C/a5rNExNOmxFAonhm4hOX9KP/M+/oLTlPBeKDmGdLTd/WHfjN9lNFCOXvxU7DkDPq4LV0OBfYEQH2Y+CbpQzV+c72cdFl6ScV7dGqdYE3AKOPEmEP7NIPoyDHzOC0js8+asceIIXBlZKLaG/ci2TS2P8YLOQlqMyxR4cBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(4326008)(6636002)(316002)(66946007)(66476007)(66556008)(478600001)(6666004)(6486002)(8936002)(6862004)(5660300002)(8676002)(41300700001)(2906002)(44832011)(86362001)(82960400001)(38100700002)(26005)(6506007)(6512007)(53546011)(83380400001)(186003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ygpY8NHOsEEfH7Rr/DaqlCe85Vpi32WAzSgQOPFnCmj+SFmfiNzPncLe78Rt?=
 =?us-ascii?Q?PgQCVOT27DDjAefTHl9y0NqNwOwKjYrOq+sPpGQDSu43Ox4C7G4MmG8yijUt?=
 =?us-ascii?Q?2GQLEwpjMOeH3XJnawnDW1/NKBj/E097QV/vvXcglcGo6RyFr4M0kdwL0B6x?=
 =?us-ascii?Q?uo09Xdhv9UsxhnPLaEB05XN4TXzrC+JQxSS5DRmnF+OzsxOo5N2MxjXMGyW0?=
 =?us-ascii?Q?G3kkNCBEf0BypZTImBjJ9OPdWLFndGUy2bCqdYLvjeMnORXGs4qZwgM7JaEk?=
 =?us-ascii?Q?19DmUEsqnHRSrXkRKIuHRHR2bZiztwkznSgwRl0N+qAsblW72mcdsrOJ7TdS?=
 =?us-ascii?Q?NrAmFgoZMqkdlaz/l+Ry+mS1trxPCJnCzlS2iZ94mbi90vaPA1uLNriJ9maZ?=
 =?us-ascii?Q?1SuG88dAgnmpyrgSSWXP0qAV+hrFCRsmdo1ZgkmFfnrq2fOpJ9ptOBCn6DVN?=
 =?us-ascii?Q?DKIJwlRZNGqExUkvdinXFC7Jssza4QgkrB4LANItyMYcgXw6rVt6CmGLk8mz?=
 =?us-ascii?Q?Wj1m/1sc+ozTJfGtm4eGgrbZ7gPEQHgVXalS9OASe82SsCWOz2ia1EvwlX+h?=
 =?us-ascii?Q?Mdjmz3+lcT1/XQvZ2NBrNjUJjQ4iBYNP9u+FkvDA307Epv86mCtItqNdOfTt?=
 =?us-ascii?Q?y2IvT3oHdvVGd9Aqs72PKdJzzLYm0ZWp+5OBiqVh75Pi5tLuoOXDRhRUv1Cg?=
 =?us-ascii?Q?Uoabw1oxdeCxmtEpvUzCNPSZ+f8wbX3S4KlV144+MZXmFNAuINfK1af0ojhi?=
 =?us-ascii?Q?Sjy5oO1hpUWLtIIyaMhaeQjeXK+sTQXPkYt81d/I39SFFsH7MmHbQgdCZGUA?=
 =?us-ascii?Q?DRSKuNt9Gj7TiLgJOdtiFqd4i4PheSJ1fGqLwobBGpTxEXdU1qxlGhX8SZHr?=
 =?us-ascii?Q?nfthSn1Fd0H1gnl8ExsyABGqeWWGh9PR0aMqN4XlvdaU/kngDHFnKTnfdk6F?=
 =?us-ascii?Q?E2yRdJ+j6lOgXzYHz2PruTUiRx0PXrCmBnnX0e11cnxo9YS200Ri6B/5jzgD?=
 =?us-ascii?Q?KeJHu3ZM19HXiZtrHPU/6gZqeLwbXQyudMJFRyKG0c2nh8UMGtZ+fKyC7EHE?=
 =?us-ascii?Q?brdw6BxrnT9IUxiOmI0880BI1zZYihH1ejVjZQrGVHXB8h6llu6LjLrkSztw?=
 =?us-ascii?Q?QrzJKS8iQQYMYjoqgpFvx4DR4VawgjubkD8RpnyWHQUHxmBV0v7ORkrm408N?=
 =?us-ascii?Q?8LuuCwDWViQkMhOmhuDsqAdyzfMu1fO1bKhaMlsZy5HymDzOsv3VkXrrFJvn?=
 =?us-ascii?Q?fUEnF11T+8bV/9RmnaVT6yNr+7DhpBhZKwKyGiN5/d+kg5mZrwh8pS3htAm4?=
 =?us-ascii?Q?Bd4vaHEKlBaUNDr0iai/L+W9E7J5kPj8HKF+XZ94UfAg0Htc0W35b/jrCTIQ?=
 =?us-ascii?Q?pUYKOtnsGPQbJpkxvHb63bYV9/c4ajR97/UgM0FTzGjsm/6nkmy9lSckUjbx?=
 =?us-ascii?Q?WOMyGeqajaWogFc/8zhzIpJ0B7x0WiMgKgg/8xQ8whWeDMODOtGotTDa7c5e?=
 =?us-ascii?Q?WT5D0r91poIkFrS+FmgxuWxh3mf87a9peeDV7+IOmpsOTKNvQn4YUaYOXtkn?=
 =?us-ascii?Q?JqINp1FTCU7hwbY5sAHnyJh0rKwWLjDYQaBogZxP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbaf224-f820-4422-6fc0-08db42416092
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 08:21:16.7841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRTtnTBccrdM2cZyFS1x3z/xmRSlvHsdZHzh6RgyMY7izSCstNIBLozFF6EAoq7zNniUG6RgSOMLAyPRVR3rmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7916
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe/guc: Read HXG fields from DW1 of
 G2H response
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

On Thu, Mar 30, 2023 at 05:38:09PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 28.03.2023 23:09, Matthew Brost wrote:
> > The HXG fields are DW1 not DW0, fix this.
> 
> the problem is (was) that some of new Xe CTB code is not correctly

I am offendend by right and wrong statements, that is like a opinion.

> distinguishing between the CTB message (transport layer) and HXG message
> (payload of CTB, actual H2G/G2H message)
> 
> note that all HXG actions definitions describe HXG messages that start
> at DW0 (hence MSG_0, MSG_1 and so on)
> 
> thus using:
> 
> 	FIELD_GET(GUC_HXG_xxx_MSG_0_yyy, msg[1]);
> 
> seems just wrong and better to be replaced with:
> 
> 	FIELD_GET(GUC_HXG_xxx_MSG_0_yyy, hxg[0]);
> 
> where:
> 
> 	u32 *hxg = ctb_msg + GUC_CTB_MSG_MIN_LEN;
> 

Post a patch, I'll review and be fair.

Matt

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 5e00b75d3ca2..e5ed9022a0a2 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -783,13 +783,13 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
> >  	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
> >  		g2h_fence->fail = true;
> >  		g2h_fence->error =
> > -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[0]);
> > +			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]);
> >  		g2h_fence->hint =
> > -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[0]);
> > +			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]);
> >  	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
> >  		g2h_fence->retry = true;
> >  		g2h_fence->reason =
> > -			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[0]);
> > +			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[1]);
> >  	} else if (g2h_fence->response_buffer) {
> >  		g2h_fence->response_len = response_len;
> >  		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
