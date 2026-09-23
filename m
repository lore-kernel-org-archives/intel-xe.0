Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2422BC9830B
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 17:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EEB10E93B;
	Wed, 23 Sep 2026 17:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Abe/qkSY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D869E10E93B
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790183503; x=1821719503;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jkr+HAxfQRv+2vb5pDQnQkZJNkdd7OegUhQKV4zIa5M=;
 b=Abe/qkSYS7BHNwutM0s79he9RUe0IYsbjBswa/Z/aWuULG1yB75paQly
 NgAnlnfOWaxCzTiRxsEEQqL8voips7ZQWimxs2yXure6Bg2ndN2ctzC1f
 bVDysCOPpy8zbbQksjcOTx2rF2yQpwZw4oqPpbDY5oCieLgefhRpL0feL
 LW9QEXk7FsSDweiT8eYJtt1ZUIvbAnXzN6XGvH0GbVoG5VP4K4j6tbpxN
 fG91bCAr8pEQJwOVOnOmTgwx1Jsls6buSy+TfHLuFCC2+EoCzKPkxZJLh
 6r2Mdy/zCVvJF+8crIvax6YY1k5OM2QtDyqfUSbVJz9xgdx0QDov4/6s1 w==;
X-CSE-ConnectionGUID: ouiEghNHS2WAN14kSsSGjg==
X-CSE-MsgGUID: QheB5kmOR9KjR9tpaV/dBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91016946"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="91016946"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:11:42 -0700
X-CSE-ConnectionGUID: K/IvRF+UQZaNR2gDmFClPw==
X-CSE-MsgGUID: TDwB+S84SbG+pobBwRDhpw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:11:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 10:11:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 10:11:42 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 10:11:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOv1dXmqrVP6853lOcRYz+g2alydcrajEr5FaDMJfBfsCu0lm3ulLYFMeUNNc0QVYeAi1il1oEk+l0vu0+jmUX/ScENP5fz+NqmDSN/uWBLeCZxFo9ryZqyq75JxlkEXEcJQsEXcXGJtOGJtS/qNw4DyWbfbl3RjrINoZycZ5RTHueFkpumLBIsWhTUjawwaewZ58PIPxxDa7AejssjDSVyKGTpmgUIEBi7dEAX6LQTui6dw4tVMwGUAVjYDeNJYvRgEg3/8ZvCQOKL584HWc7gZCuqpVSWohATUokQMbOaN9Yk+n742QqFPIN/wUe3wzYTbzp/FfGiUqhRPMD+ANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gR98wGitNfe7cmNlD94+tJ3Rg92Srz5e+BM5gsSYaM=;
 b=FCEfTBe5rXOMGgLIQKmaOlE8IRQZFKF49N/KKpMEuazcBSijqD+C+CRqDbiv3hLQlLi/WubTUDThalWd1QJ2Jrc9CIfERplZIextSw9RzeEZhRplpSLdyBFE+kLmvRW2aN3l7p5hHELoP+/nxE3i+iKvnNHk9xqa9jq7PVqy+R/BzVLUaCo/EdR35vbG6zGiEjIibZ2eU+b4pJewxt9oCEvPOe1eddQFD6Lu1ISkcWvcDM3s/WpKBATc410vKr+zuIU22YDiA30CE68aQekG1nhg1wgG2sXByWS4fXkGnoeCky1LJmaFiNSi2SSF7ZiDnX1frIfOa7iu1Now8mSzFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB013943.namprd11.prod.outlook.com
 (2603:10b6:208:548::8) by DS6PR11MB851541.namprd11.prod.outlook.com
 (2603:10b6:8:4c8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 17:11:33 +0000
Received: from IA3PR11MB013943.namprd11.prod.outlook.com
 ([fe80::1766:4eec:eeb0:13c2]) by IA3PR11MB013943.namprd11.prod.outlook.com
 ([fe80::1766:4eec:eeb0:13c2%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 17:11:32 +0000
Date: Wed, 23 Sep 2026 10:11:05 -0700
From: Violet Monti <violet.monti@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Add a new PTL PCI ID
Message-ID: <arQIKbgr4QbAJ-Lj@vmonti-desk>
References: <20260922165607.129560-2-violet.monti@intel.com>
 <arL_YfVMnFsqzzjm@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <arL_YfVMnFsqzzjm@intel.com>
X-ClientProxiedBy: MW4PR04CA0177.namprd04.prod.outlook.com
 (2603:10b6:303:85::32) To SA3PR11MB415608.namprd11.prod.outlook.com
 (2603:10b6:806:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB013943:EE_|DS6PR11MB851541:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b49e06a-be67-4499-0214-08df1995b67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 60fIrVTr4G8t3kqyNR+rHMYDXuwqSogaVqaXFfBglCVVj89rz+Kg/1rdGZmVAW1qFZDTJeKL5LAgwsqXqHx7Zafe6ED8Z4nzQjJFbqI6wtR6YDabGfk6gyB32I/XPPb9dUJuFdpz0ILhcOFMtIEHJX98xEdmJgNZOCHwAkie0L4ePkkwTZbv84/1arRAXslZTGnLyiXrCghbPHVM4zM7GjtUb3nstTTFDsV9/dgsmtPBZyPLyyWdQPH2jiT+z5X+h2OLJg69U4cSXWpghOaOA/n8cKS5s4hvStlsBDY84FJxPJwJC8q2mjz0lmy2KC8wI5tmIAyq9MITnY29H3aeYvI7S3G8oZluqyo9rqlUqu0TPmMKnMFdo9QouaL7t7CdpM3M2g3OhtH01PMGsRewIYUku4XBPIE5I5FHZdAqHetkO+zD0gerHqzD+aRaCQRP0zyoZpON8VWwfGuXcuPnqvSczCtUNz4xQwJDZ8//uU1Li1odXrHM+e0ASXbsslcwzC6OQn7KFxxlALX7KlN9H7wiStCO7VYaSUrRE0gbRWQYRXFyBqYbfZsCq0cmMTsdb3KzL6/lSp5lP8PkQYEL0IWrFT00g5/ve5YiQUKi5kaqhficf33tGkm65CbTF1DhjDy/7pe56K578OrR69MDiE0EJyLqo8ev65pMjtsQY4s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB013943.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?luPKTUBxFaFayE/zkGV+GtiWtH/yoexKBAyYdG17QWfG5NSYuTlWs0vq40QH?=
 =?us-ascii?Q?t4iadPiBaPtKrXDaJEUL+pKotR1CRQzKfNdMIZgrjQCbh0LvVSmN2/IbJW39?=
 =?us-ascii?Q?uoEZwM+dimi7MlJBqlbpPXmVO2Ka+lXMZwf/w6B0J/cVKUqWQPM8F/yPN2ij?=
 =?us-ascii?Q?KREJXRbSZL6uGQ4JbzVXADEdpE9KSMzW+m8LupV9SG5vwCRaXxiAS3hDlIeH?=
 =?us-ascii?Q?gaMFLoYS5n3Tzkxojr3BLCxavU4a4f8eiV3jqFX00bUVWkYUBjMpjOC3B8Hr?=
 =?us-ascii?Q?lLMi6Ixh4p+LTjFvdvV/0Ymy7xoTcItS4XTFjYdZ9mXKgoVoNIj+fm4cJTr4?=
 =?us-ascii?Q?shbSc2yoaYZMum4S20FIXk7qhddtJNbu73Mjcq2GgP89Umf+kUIfGm5uIuO9?=
 =?us-ascii?Q?B5z23ceD/2TxQkp3MmXB7iQroGPqIPnEikRWtM22YpDqsEs4ZF4WglhjhOuX?=
 =?us-ascii?Q?RBV8lSc2WRQhIGhFgh7OF6CBNs1/q4re5iNGPPwI1JrYg/a9GRwkkMk1yW4n?=
 =?us-ascii?Q?2TriI3jtxS7AxiuICYuWoXtV/H1Q2nXkNLwdCmo2MvFdn6piiaPvl5g2WXoa?=
 =?us-ascii?Q?/VS6o3MNFMgvBKeh2whazfwHKiJTqV9rORu6K/1gf1HEgtipo4Q6yLudFdR2?=
 =?us-ascii?Q?snFe4pA9DvttkCJcIELeJr7XBv4LD/qTq4193StEvF5hStPxw8YfbZ0syAyi?=
 =?us-ascii?Q?+BUNeiKDp7U/NID5FVSX72x8HKfQoZyzji224ETElrICWF5M2Ct49nXO5HRu?=
 =?us-ascii?Q?4+ZfgBRSw9zCzd9NsaZx1CVJzP7ZLjd10Nvoct2ULRfooocNWG+GD2yv59RB?=
 =?us-ascii?Q?nRXBOM6m67gxZ/JlocJf+rzBp5ckam3ywfeLXP0GetFosUtFPflt/jDwu2AQ?=
 =?us-ascii?Q?te7Uw7wVwKhgozNeNC1TvnXUtD1kAG+p9oHRYrhT1NdN3jvgnUHV0lJR8IYW?=
 =?us-ascii?Q?Vi/wDHUETiZjQfe8nvPO9MIJKaMgQsAU5XmVsqVd2pB2M86vwUqZKFjQHHrE?=
 =?us-ascii?Q?G0kQHH4fuYdGfZpZhfWSE0LjF/T1gaSG8DxmzCpD2oIWbraCdPsotlBs/ST2?=
 =?us-ascii?Q?aWVhIbwg8XkqKsQse4Txd6F3oqY2u7+6EZgeku+OOxizenb4YeLV3M1kqvfn?=
 =?us-ascii?Q?gN5g9SqjUyo0HBPn452OVzRzjBHWXr/5BLWRMM1Vmk1rOk1uwXld8nICwQde?=
 =?us-ascii?Q?Xo43yoiRHHtU2+6TW+UkdlLsqzyFZYW+83irr+nVgizTAPRch+jW7KlB06yZ?=
 =?us-ascii?Q?3CSmpNCMOn3QC4/g2MdaNHsWTYs9xuRK7txfT/4Tjr7FEh0WYwG7klnsXu+T?=
 =?us-ascii?Q?TahDzPRSPz/gKpFljt3jtwq7HOQR9pZO+V56+678IAG1cd2boulq2fPjvWOz?=
 =?us-ascii?Q?aZsCWsdggvsmtau5qjSodPR4OsqRf5HoJsS8xn09m5nJ6YCjIDH7rAu6sxE0?=
 =?us-ascii?Q?W76MYqan148T+uDfKRJr/RADgT+P5XbUP60NbZYF3UTO3/ZOfsHmIU8A3h+p?=
 =?us-ascii?Q?D8ZDmHnZyWUeMCOvNDCtPP6rspsZIL4kW2i6UdygZ3Bj0K/U1MHctaJIQxUm?=
 =?us-ascii?Q?JQky7ogjDN97xvAypSh9Rz0pwCn9Ra8jezPUZ6gu56sAauTQJjAg9hqRUT9B?=
 =?us-ascii?Q?rNkW1EFYEm8ckjxZhxqiTUe9KQT8TOsbWWOGNxi3b/K+h0My+6yRn6bM54kk?=
 =?us-ascii?Q?MAVARNthL8p/D4NTyQABghFZdAg7XH71kQwAIenJGDo75BxZU3KfEHam9v/0?=
 =?us-ascii?Q?kCINCdhS5w=3D=3D?=
X-Exchange-RoutingPolicyChecked: Bu9Qx8rYyMJYXZQ94gNfEW6fXTLwZEPFywxMS8FAdCHM7NlC53uFzHnPseJPE7MshEt5mNQhRUP42A2yBZefnznvoz4WAm+kQGdHR11jopKNO5Tbty6vApc4dPYX5uRu0k6QGXhVsquf0LvVfslXujOWQDnkRNdCYb64I/7xkYWlaeJg8mzVbHkIHmOIUQ04xFYHsfsB3g3y46XQZwvNXVASszQJdXenE7jklZaV7mLH2aTMPFGfF8tE1U0vU1k88PnCgp9FBm9MNakfDl9JYWn1ar7fh2IpCTTwlnhzwqOXw6pMqKVxb2kRmUX9r7Ac7jEHGT9fbZw12kOOOwisAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b49e06a-be67-4499-0214-08df1995b67f
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB415608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 17:11:31.9538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+VKKgxuzFrvRKNn/AAtSH3Tv5bsFOYU6gC7FUs0Jyi1pnz1fA6iqEiwxavopyQYt62lDw4JLZhSPA4aIvHG2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB851541
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

On Tue, Sep 22, 2026 at 06:21:21PM -0400, Rodrigo Vivi wrote:
> On Tue, Sep 22, 2026 at 09:56:08AM -0700, Violet Monti wrote:
> > A new PCI ID for PTL.
> > 
> > Bspec: 72574
> > 
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > Signed-off-by: Violet Monti <violet.monti@intel.com>
> 
> I honestly believe it would be better and faster if you had just reviewed
> the version that Matt sent yesterday instead of resending it.

The reason for my resubmission was to rerun the CI results after a KUnit
failure unrelated to the PCI ID change. Matt is out for this week, and
delegated this patch to me to review and handle in his absence. Since I
am not the owner of the original submission, I was not able to rerun the
tests using the resubmit.

Is there a preferred method for re-testing patches that have been
delegated, such as situations like this?

Violet
> 
> > ---
> >  include/drm/intel/pciids.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> > index dff389b56eb3..32c88a690ad8 100644
> > --- a/include/drm/intel/pciids.h
> > +++ b/include/drm/intel/pciids.h
> > @@ -880,6 +880,7 @@
> >  	MACRO__(0xB08F, ## __VA_ARGS__), \
> >  	MACRO__(0xB090, ## __VA_ARGS__), \
> >  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> > +	MACRO__(0xB0A1, ## __VA_ARGS__), \
> >  	MACRO__(0xB0B0, ## __VA_ARGS__)
> >  
> >  /* WCL */
> > -- 
> > 2.43.0
> > 
