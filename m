Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D54CA5FD2
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 12:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89BD10E02C;
	Thu,  1 Oct 2026 12:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXZKJ2cj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C0C10E02C
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 12:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790858909; x=1822394909;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=neeKgJ5PZbilZDmxZCmb40tlpJcpOXZHZBUgKus4x44=;
 b=fXZKJ2cj05pbn2SCYCgDi3y/XyZx+opX6DZQt3seGLTXvWV4ivy0yRWf
 IuibfUOqb4TjKsYt5qfOEv7L+MfcVazOlui07F1+bT82lVor/PpgiVK1t
 Iol8PyDxNpoli3Id76mMLtBtfT+p8s5HhgrZqBeU7qbqZu5ML24S63xxe
 Lu092aDK5x0nIvK+hDq+EuKocxChQ1u4eVe0ILIX7WGmFn2n21ch4BUaP
 7dyVd/RujUOzwa9GX28jnbu3OftUy4CMKAKCvgbg1oF0FuxKTlKCZlazo
 zmdDSs4l+pJvFAAnXH77EJTWGoOdb/bsD4X0xrSCC1v/LNgC78P6lZpt0 g==;
X-CSE-ConnectionGUID: cz1/HCHOQua1jkOp05NXwA==
X-CSE-MsgGUID: 1p0yjhq+TqKSJemJxJ7m4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="94326304"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="94326304"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 05:48:28 -0700
X-CSE-ConnectionGUID: AJk0FlbmTYykU9KHaSLWhw==
X-CSE-MsgGUID: bz82RcUCQ4+LfxbpmqZc9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279769309"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 05:48:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 05:48:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 05:48:28 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 05:48:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVhfbS6KSyZZTfn5PUSyudM4NJjfSb9S8MwVfYNsWs+UDpxnsnypTwIGdj1K+h6MhfNPj2aGa2cAh9gMiTQeKBZD2vhL75Td5cSCYrSo9SRuGFS9I3F3lSUC7f4NFCGOjncqfWjo9cRXLGxhDsWQzD5guKNf6xy3yvgjVmC4jQZUl4lnI5uWsU4gL/o1mB+W2pgaD+hdFxG7WxecejBu0NhF1Fdy45MoYsy5DAEi6hy7AeOe1b9yBTLtdl/kVsoG35yi8xoRFtcvyrnxAdoOidUZ+VY6lDf8n34UJ9vhJXkag2VRqYY6oQjHK4FQRIaouCJVkImZfi9xM5xC5pMOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjVzmvCB+1xBEKT0nWTVxwp+Kaw9shqfNXAukNJTIZs=;
 b=ICzsGF4pLNDCIc0CB45Eoeyv2c4pakZi6vDkYiU38GBVjo6UfD2iWXVIAUQqcY63Odkzj6TYiY4nugLe0/VHQweh5Ew0Fd162ap+FnHme/T9ZKV3W981BN2PCK34C6h4HzX221HSePoSDfCJbtbwhTjYA2/SJYi1aDj+XHb291kR881kesrC41Ep+42jUo7TNm7U4cUq3tn2ADr34IBuqqtk3M9mH/ii1EeqsPKH1HsY9izPsXtJQbeQ0gYWq4JVrjLkJSmgb9OZ9Uy6iWjpBKnKI8+cEOhZ8hZDG1CnlhpSeIWZpEl+C5iBMB5/jMmCwJr4M8PriuZblnGRtCq62Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MW4PR11MB6572.namprd11.prod.outlook.com (2603:10b6:303:1ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 1 Oct
 2026 12:48:20 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:48:20 +0000
Date: Thu, 1 Oct 2026 08:48:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Violet Monti <violet.monti@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Add a new PTL PCI ID
Message-ID: <ar5WiRfrxIQ0uHRd@intel.com>
References: <20260922165607.129560-2-violet.monti@intel.com>
 <arL_YfVMnFsqzzjm@intel.com> <arQIKbgr4QbAJ-Lj@vmonti-desk>
 <arcahvIqBmCytAmw@intel.com> <ar5VC6_a7lqYHUQe@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ar5VC6_a7lqYHUQe@intel.com>
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MW4PR11MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 1907a6b7-5e28-4162-44e9-08df1fba4539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|11063799006|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: pc7uZwlcOmXOedFP2jU9uJ2rGaeYjRcJUJ9T/tSBRPI14Udn6NC+1l+lgmBeKC2aREImu2d7k072QE8DJRdf01CO7t68PDmZ+vX3vjgdBjbTskWi3Ogwfy8Tk7nPRBZOxv7frTsM1JyMSUAnoGl3nMFotXDIe5jBb9VCVvZgnQEUosPKHCkW9rB9UYu9bw0sWjmvRiX04x9GRuYfSIOcc2njX7XrsiAZdF4t+cEqx2ruALtxsiWs6R/LrvFAJegXiCxlON7dvT+YjtemOI02+kUePUjto9FLnlePfS/rgAHvxWK6I3lXS48OTV3AJ0WRTU0bghGclsa2Qwy8F0ZaayOp7pvVyADCSo1H4oRttyQSfvZ8Vfl+VcgP8bI0SvK4K/Zv8qemoqK9m4W0dfYi+XER4GVbgSv7uPPeQiKuwQfDN+AHIkHNaJg16pIasYo49tcSjl9VcAaUV8hvgAIWIK3X9S+pTQGs4FXIcTf47hbioTvOF7clsA98Kc4QyzZJGA6RJARw4TFKZM9I622PFPl/qx4XtRPNdiioo92MvfTra8Xl9vN6uk7GK/f74Q9fYOf5SnvIkyJcx4pGKOG9L8FYTPUKofqS/KPvujqMkkEYkeFYrq4jW9+qsDLB2UVia6zA3ojGfbit2q5MDL50/vztRmay2CEoFM/YgPWcTLo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(10067099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0vaTj5pYOfSeBmGMfOvIe7fY/eimvb9tSp0qdg98reu/hYthqx3nq3SEvrmP?=
 =?us-ascii?Q?myOtGLfn5l/obhWOf+eyASb2XoKhKujZXBIvaN6hHy/CaQ0AbiU+xv6DRHeB?=
 =?us-ascii?Q?uwu55SvJ93a9ypdhxccRfPt/cKzyO7cXhX1Xsn35F3woZy2XjM91w+2XVc9z?=
 =?us-ascii?Q?Jmyntsgnl9rUyFJ2gTQv+GN2BTAGsMExKD66U8b5dlSdgZgkMRgbMlA/HRPF?=
 =?us-ascii?Q?GtX08G+VP52S7ETc8ku9a0vEXlrtqBX6RKwaX5b5/mYZWN7wyL2Pe0/VGcVS?=
 =?us-ascii?Q?iQ5HKjDYsh4hW2UwhbbWpCuYHFS27x+jSXCgJpCx223+CZ2g+7dN9T5yvIdq?=
 =?us-ascii?Q?Iv2IqaK4lSTV6zPSKeZEOKseaIoa/XkK1ftMySwVnLsvFWM+HW1TeC0tZTsX?=
 =?us-ascii?Q?JX057EZE3MVR8BysLhPWZi223JGxzyxBoApb5XwshmYBslc3jja9Vu5WFMTv?=
 =?us-ascii?Q?pM0siBuiTzWZjir6uilv/QcjPuz0RjTQNkpU88wUmp9EKZ9hom1ctdIHJLYJ?=
 =?us-ascii?Q?10w54aJskuihp+J4hOvmhWOFFObEEoDGGhr2FAOnnLo9pfkQW0Sup5PCQP8R?=
 =?us-ascii?Q?+4xAA8VgOVU83cqBBYcqEoLXqOHp62WogqOb7Fm6bGz8m+B4EOYQfIpOJxAd?=
 =?us-ascii?Q?1f8cFv+AlsfP3bq+JXSDv5/MygbNXc10Eg4zXRr92h4qJ5K/k98h530zGknU?=
 =?us-ascii?Q?NFRNLAVacsrqB4LB3+PMz+zwZZqIeEXz0DnT+6SXs1kPbfdwzQD8t47HeUpR?=
 =?us-ascii?Q?G+K/Q7ltRzX3Rlfz4QgCs+JHj9/qu7A/mIfDOvix+Bz/oL6VD/UD+clxDGE9?=
 =?us-ascii?Q?HuntLPfD3Ko37lCnHBudEif1QRMgWAQsYF/mTj/YY/5H+Je16kdDf0mDFrOV?=
 =?us-ascii?Q?cUyklWgsZWK1AInVyQYimQOhizpgA6dgoop/WhxoYvJMNpb5w5qw5AFBxxin?=
 =?us-ascii?Q?PA8GQva37mzJUj0LzzTtZPhiloSmGMxEdJ5O6/I/LKnDGRNlANTZH78PCmVw?=
 =?us-ascii?Q?zjjd9henzbBC0+h2VYT19eg6KZGB3v0w/TDaAr4CswMhJlCU8xRhrJx3o6hk?=
 =?us-ascii?Q?H5DyekKFqcBVsJp6DbLT3JuP5wksL961DKOnj5aR/s/Hl9Hf10MDjaj8D+cv?=
 =?us-ascii?Q?ZQ40fl3nVu8yeMHx703jpT6mv8ywtPo8CCBP8MyhnnsHLdShzWwsMnKpAEUe?=
 =?us-ascii?Q?WpZwzsZqo/Db1Lo/RDjIkwd+3WYg2Kx2aaVB1Mkii3ZRLyXs9sKydvHHvD1Z?=
 =?us-ascii?Q?n8IOhajdZBb5DtI+JTqgJ8hcyViM6+A7dV+3moJOorI+Asi6LOtkTVQ2Zsxm?=
 =?us-ascii?Q?dSW+e+I/bI/VXB5TwiyBx2aBaswZqHWvX1em+8PZOOnY+hCpwb8zeWb9aRCr?=
 =?us-ascii?Q?Ta4oSwcTrrYXUIxsXakhnph8YBBCCLQVpxJvrFjnZFos57Up3uSy90m5dDFr?=
 =?us-ascii?Q?O5LTtNSnsK1vQ89U/ruAreujPmJDtSHU6p/mYi2yZZblZjxVwFH+02yjMKic?=
 =?us-ascii?Q?jauDWslKGfE/CV8ftCZjyiYJ0kCPxX23Mly31vTwjkwguOhE4epQZOmpnPfT?=
 =?us-ascii?Q?vDBVohvrIc3v267ZQ/TE7bUMJOQN2M7XxsKTbTIsrx7hNzPwwDLCQcVWW4ek?=
 =?us-ascii?Q?zqLVELcYw4X4k14St5xX2yTbOqTHz6wiR827BNuS92ff3weEJ5sXRxOuYN4p?=
 =?us-ascii?Q?WRoGS3qWDvqIjirb3GVBVuvIfuQCxghUBEb+t6zzNJ0zp7A7HhQncWbIO392?=
 =?us-ascii?Q?sLclu29ByVjQuPhOmd4Pra/DjyXNSpQ=3D?=
X-Exchange-RoutingPolicyChecked: fubEqob6GZcCfpCB55oP9ahXtdl9U07jKzt8yu5JJJyguaCDe8IWhe09wYqbvwRRykjBV6s8OYPBn8lw5bcz1BboVnevwO88RvsQjkE7oImPA4Ast4W5Ly0WXbgvbydodwzr6wrULw1+xZlqXJbvlDS3KWoChgekWkqroRPFLTkpYyyAstbz/++yJCymScNStR+WJzdUYmHFweyNHWghvZwnl7Ijzkz9SVSx9zaAolwZdMp6YxBlK5MT2e/oxKJ+3UHIz61U9ilqtBPvCAP+xdU3/DqyyqiQ5v2+nDAFvHPvoBriUFm1bRR8xqNIKZcQ0V4F3xRaUAX/ZrfH03bTiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1907a6b7-5e28-4162-44e9-08df1fba4539
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:48:20.2431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VjjUe38CSW0a0Rko9bEHBcMvvtDLOOJ9w6k0X/Xa6CcT7MZk2QL6JD+34TWZsFquIkjODq/AExHr9hcf42BLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6572
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

On Thu, Oct 01, 2026 at 08:41:59AM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 25, 2026 at 09:06:14PM -0400, Rodrigo Vivi wrote:
> > On Wed, Sep 23, 2026 at 10:11:05AM -0700, Violet Monti wrote:
> > > On Tue, Sep 22, 2026 at 06:21:21PM -0400, Rodrigo Vivi wrote:
> > > > On Tue, Sep 22, 2026 at 09:56:08AM -0700, Violet Monti wrote:
> > > > > A new PCI ID for PTL.
> > > > > 
> > > > > Bspec: 72574
> > > > > 
> > > > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > > > Signed-off-by: Violet Monti <violet.monti@intel.com>
> > > > 
> > > > I honestly believe it would be better and faster if you had just reviewed
> > > > the version that Matt sent yesterday instead of resending it.
> > > 
> > > The reason for my resubmission was to rerun the CI results after a KUnit
> > > failure unrelated to the PCI ID change. Matt is out for this week, and
> > > delegated this patch to me to review and handle in his absence. Since I
> > > am not the owner of the original submission, I was not able to rerun the
> > > tests using the resubmit.
> > > 
> > > Is there a preferred method for re-testing patches that have been
> > > delegated, such as situations like this?
> > 
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > and pushed. Thanks for the patch and diligence.
> 
> Matt, please accept my apologies, but I just noticed that I pushed the patch
> with the wrong authorship.

I fixed the authorship and force-pushed the branch.

> 
> Violet, next time you are handling someone's else patch you sign it off, but
> never ever change the authorship of it if you haven't modified the content.
> 
> > 
> > > 
> > > Violet
> > > > 
> > > > > ---
> > > > >  include/drm/intel/pciids.h | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> > > > > index dff389b56eb3..32c88a690ad8 100644
> > > > > --- a/include/drm/intel/pciids.h
> > > > > +++ b/include/drm/intel/pciids.h
> > > > > @@ -880,6 +880,7 @@
> > > > >  	MACRO__(0xB08F, ## __VA_ARGS__), \
> > > > >  	MACRO__(0xB090, ## __VA_ARGS__), \
> > > > >  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> > > > > +	MACRO__(0xB0A1, ## __VA_ARGS__), \
> > > > >  	MACRO__(0xB0B0, ## __VA_ARGS__)
> > > > >  
> > > > >  /* WCL */
> > > > > -- 
> > > > > 2.43.0
> > > > > 
