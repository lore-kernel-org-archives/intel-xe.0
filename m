Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2A4C77B7D
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 01:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792AA10E08F;
	Mon,  8 May 2023 01:04:32 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A454310E08F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 01:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683507871; x=1715043871;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/4JneWe0mzmxtqOZ/FfhV2/90SrfOkZr6E0OijxwWNI=;
 b=EuOAclsdU3erLqksufdP2n+Jal5MZXSw+CIMNJ9XaUh1QfsL98wusa51
 fmjXd4pehdrUnnkV3ArHlfxLK7/RCKuihqYnIlvTnt+1/IFWazF1sWxMY
 BoMe4cSfCM+exI8DFsvc/2cDw9ZfPhUR9wL79suYytcUG55+powoIiPhx
 +XTe0s5ZfLC64nzwTSNLDsU5I7cOhtMFhidJ8s3OfTCdKdrk6Sae6Er5T
 w1iU/aleIW7qD+srCZGMBcmiccLnxWj/CDvb6ro/OFy8NEDY6U85UcKCE
 HOgwdUds2KFDs9lqNePrc5YYA0fdsG1QJb4bGTs5HuBRCVz5VTXppEC6O Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="329886708"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="329886708"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2023 18:04:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="648682285"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="648682285"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 07 May 2023 18:04:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 18:04:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 7 May 2023 18:04:30 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 7 May 2023 18:04:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7hqHti1UZPRVYdH+PlYre9w9R2atfcUWOqnmNaSuTIvg2uTdXqZXj7BDhjwS1aIyxkte6ShpZvwKAZS477NQaf6ImSOQ2d0T8TOdjn9aFH4DRutwM8fjsyteMp+D9bGsZllGN00CgkLLMJcu5P/q6igFTcFTBZZv4/bvN/vWohCw4tKAu1Zm7ZvhHxLHWDrYujsx+hTu1Cc2IjLADOorITN1M9ZIn7EiZpmqy0nLsJpqj1NhWEJw9ENZBmvw5HUiDKdpHfb8kQTiVoHGdw2BBERG3EE/uIJKKeypSvBnDjDHItKhXZvK6jMcf30N0pR22SJpR/WB4pz+vrYHRZi+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ra5xjfY3i/dVjOsAyRRsUHO/nB7q/Vfo4XIwN1JDErs=;
 b=V6Izyq8QQPyVXluDRPv9gGCeRX2YhIiWKOfbnUMk2SZNP4NXHmaSvjbT1m32spiEg5HFWiHq0KaNQU+ZX2F6hDRF5ttG0LfE8ee6ITLF1y0eGJNxvp7hkRItw/UvtSizTMu8hZXkgBNAx2Ghe9HgjqVkas3euwMtfvIeE1mwxD+nix5h+51OPHNNe5yrislLvArZIEQot2YG0Il2YHvQ8KyR7lupeDu/gaFW29mI6INXMG+mQ73Ket7VwMMCzPJ+uSdBJrQaleJb+KdPrJt6RwSXc4wB3Z1U98bfHCY6Yr7cM1RkBp4EkZSzy5qlNValXOfXo/11gC7XU/MQ6FaUnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 01:04:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 01:04:28 +0000
Date: Mon, 8 May 2023 01:03:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <ZFhKf054dwcLraVh@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-7-matthew.brost@intel.com>
 <ZFVNNY4cdVC8aZc5@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFVNNY4cdVC8aZc5@rdvivi-mobl4>
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5482:EE_
X-MS-Office365-Filtering-Correlation-Id: e64237d3-91a1-456b-e5b3-08db4f602b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6NF1xUrqWafWinOcnxwt1ilr3h31aHB9NEU4uOXnJtcvyZPb5JG2c3uRna181bSOfIFclIDX84Y3270LULOU7HQ7UmUU3vYPai250i0YUNNxGUCZXJR0qTXWQYYgO3IfM5K3C09oYkj0yd2/nRA4j3GCT/oXoEilCL4EZLQfMq5kVTMCbOdFRmvsdAv9mbQa38zqmJUWeasU1wpHivbnnlok2wnBhibvxhlBS5lNlEy7xmGi48nHZsqDixOWjgMkEzjfz/unjmDf6o/LOmvodflY54kDuTfHBUWihGcTNwq/ea0TtPxOkG+70aa8IXthvlBgnkQTOmB+F/MhLiKBHPYvn5ZfvhLDl5iCsXc7EhsTcEdXQ8vso85dlUjiHafCupYeXdN6pAfbKVcYo36FwogR7rS5XQ6R5C3A0w5DnJuV+PGP9h9CyytIZA9oWE/aQj+e0KGCzhRnFq4GySLBYTTSPBtlduiwbteo2lnQ7oAZNzApNPXLjQPui8UfFahwbYfSZemEE+1Y6BtIdPaFGER2j43wyG/0H0LuXXjv/h3KoN3sKvDiZSF5m1Brr8FY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199021)(26005)(6506007)(6512007)(6486002)(83380400001)(38100700002)(86362001)(82960400001)(186003)(478600001)(2906002)(5660300002)(66476007)(66556008)(6916009)(4326008)(316002)(8936002)(8676002)(41300700001)(44832011)(66946007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OXVjMmg2fNDRQX+1LgDXPBGC62AEoB2/KTOnNDdBSNmU3VOMxWvmmYYFkjZN?=
 =?us-ascii?Q?9ZDyMLsifAdZDLhQNPZZVZIvaZMovx8YM4e4/fm3C5/rZAyahcTl8jt6Fw4o?=
 =?us-ascii?Q?fBR2jq+qIN0eoW2Yuvj6PVkoxb+hUcve/q3/UcuysowIsltxASSx2gJZBnHo?=
 =?us-ascii?Q?QUaJm2e4KoKe+YlOXrzOZlJxNDoKq74wuywIiUBFshKZp9HGgmWVHaanRZaV?=
 =?us-ascii?Q?jp4YA7ozym7blYfyFHPEt45WNi5JBIMq1Ll8r7oteg1DiBhlku/Lgxshl/9N?=
 =?us-ascii?Q?LX5N6mDj/5fB7kg5OwBq3OsLLBEBqD5OnY8Xdi5RqI3CNdqCs+W+2DU5SK44?=
 =?us-ascii?Q?dQRwI5H1k/GggVMF5FRwk1ap4AaBeS5gXmyL+wY1dUwiENV9bkVpWdWF8zA2?=
 =?us-ascii?Q?aUhNfkBwKYD0UmRZkajXSLz86+Srxi+ifxIeLwpIIbObtxrdS1ju5mDp5jZd?=
 =?us-ascii?Q?aWV9GPJPzr1ghxAIBsF36KOV3b7rcx9mGgF1b82ATpBArsrNP+7xlyjlVWMb?=
 =?us-ascii?Q?gDfU0TAIuXpazAGkkYkTghRBOtef6uPsUBeCk21lkKw/YFwtXp7+aSIyTXPu?=
 =?us-ascii?Q?AH6FX9uLXSGz2358qYtdmDU9SQzzm0c2qSXIHneojnCSJ9Tz5fRtxK9utl4w?=
 =?us-ascii?Q?OgImU72oqzrJ62d9ypYBypkr5sPzy9IE9kTErwitTGJ0U/jKiW34c6gc4pcA?=
 =?us-ascii?Q?8AoH3YJVomWDe2Fst8xPVEoz2Q4Bg79MZIO9ZmuSqsb5nAmJrlNbtpt5NTvX?=
 =?us-ascii?Q?A1gFYw0aA1oAeUgq417YN/VOp6Pfaqog47QP+znu4FVxi/aNOhSESmLqJkNH?=
 =?us-ascii?Q?Y4G0iumEnEijiVcWSjE72UNH3C6LqDC0yMMS2K4o5lwn9Jtak60o7pkLK+2k?=
 =?us-ascii?Q?5kzTlWPGPP4qoCx2YLHsI9dlCo93PRID8sgLTU7CkqAx1K4C2V7iSstw3cQw?=
 =?us-ascii?Q?kMyKNECKQQEQL/UGS4/TDxc4g63gELMtIHvddcHjXCovjOe19c+URrGaWiAc?=
 =?us-ascii?Q?BtyKczicw4VtMJwkkRXTbFPnsKxYpy9YFM2mucxBVCpRJS/St4zML8Gfq4EA?=
 =?us-ascii?Q?clrJXGulG3LQzWIsaepGLSCTlLxiaOTr7M+ARGd7pmeQ+2qpBtf0kd5OZHwU?=
 =?us-ascii?Q?gUWPEV4AjQ9aHmA6Kddxbb4qPraH6q1uMyO+1QqKLo5wOYOmKWJqJa6Fw4lD?=
 =?us-ascii?Q?Zqjh2xY+4xE7viTMI3T5Kg034hfA4HBx/DwMdohDwGdvIF5qOPwHs3o1r2wx?=
 =?us-ascii?Q?gJX9Nv7npiyZPjR902bVYBA9y2BntSO6ia6lfnnnZ8GoncwqpjX84XFkdRbX?=
 =?us-ascii?Q?LAFlG+Wr8pREg6Ucqwmwux+1nzFX5B7qdMBS/EPmhQSeIk4v+HGkeAiWqbFE?=
 =?us-ascii?Q?es/pncXks07LrAcz8nWPUknLn5Jz7xDZ/UceJrY/NyGWglF4AwgvC4QzSGqI?=
 =?us-ascii?Q?VrDynuqSYwQW84qLb6121QJAFYDm8pyU7YvyYI3LYiSgF5PFsvChpoFO/0x4?=
 =?us-ascii?Q?0ge5JZkZ4TpFaYsAjoibMHUySEsn0tMAk+kMT0zNpm1yjJD1zcc778cSLNHN?=
 =?us-ascii?Q?GgpPLtKh2b44QTkoMmRxshEmU+bYMCKbf1eDv1fgnUqxEBGTLiZkyuLzggX0?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e64237d3-91a1-456b-e5b3-08db4f602b75
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 01:04:27.4352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2iQgCuWsUfqMqnMWWEbSS042LMvMH20GM0gqLj2TY9fTRozGWQEyn1bHwDZpTlzCWxk0Cj+8WAkSuANf+5ASg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5482
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 06/31] drm/xe: Ensure LR engines are not
 persistent
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

On Fri, May 05, 2023 at 02:38:45PM -0400, Rodrigo Vivi wrote:
> On Mon, May 01, 2023 at 05:17:02PM -0700, Matthew Brost wrote:
> > With our ref counting scheme LR engines only close properly if not
> > persistent, ensure that LR engines are non-persistent.
> 
> Better to spell out long running somewhere here...
> 

Will do.

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_engine.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > index d1e84d7adbd4..91600b1e8249 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -596,7 +596,9 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
> >  			return -ENOENT;
> >  
> >  		e = xe_engine_create(xe, vm, logical_mask,
> > -				     args->width, hwe, ENGINE_FLAG_PERSISTENT);
> > +				     args->width, hwe,
> > +				     xe_vm_no_dma_fences(vm) ? 0 :
> 
> shouldn't we use that existent function xe_engine_is_lr instead of this?
>

The engine isn't created yet... So no this seems to be correct as a LR
engine us a user engine with a VM that doesn't allow DMA fences.

Matt<

> > +				     ENGINE_FLAG_PERSISTENT);
> >  		xe_vm_put(vm);
> >  		if (IS_ERR(e))
> >  			return PTR_ERR(e);
> > -- 
> > 2.34.1
> > 
