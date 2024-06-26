Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233BFC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 16:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD5A10E92C;
	Wed, 26 Jun 2024 16:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W88POMoJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5FE10E92C
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719418417; x=1750954417;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gwY3DuLu9tBN1733+jsfdRbbKu+RfKmG1G98EETzyug=;
 b=W88POMoJEMyDJifWwTQoCl+5tftPXlfGDyDFOxM1gutU4NqYQpVZFMVx
 ipvttllz4t0e5osiypJ/+BlIMMf7TAjZ/2LCnUI+R+2NIrwSRfaOOFZ8A
 Ot14KdKoTbwWep6JZP2BE6MpWEEVmgwqR/rMA5wJQoLP+UphfOGO5j2Mh
 FFEJctwVIUSPOmUPDmsIUIoEnLtm6c/aCD6/11ivbTkSfY7O95ynkF0Ay
 XiatHAo/MuePWpG7G53BVRZMc3BrJsCVC7kzTH+LofV/kEBLtKwEDFemK
 IfNMJrZVaLRgOmzzqKbsOPP/cH/qF0QY5sjeR4s90ve22qpK9eDR2f17D w==;
X-CSE-ConnectionGUID: 94viWShnTImNwqUR2PRGxw==
X-CSE-MsgGUID: D38jqpWeR5OpYh1xiff66A==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27124256"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="27124256"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 09:13:36 -0700
X-CSE-ConnectionGUID: CtS/PjngR4O6KJq1JrfNjw==
X-CSE-MsgGUID: FEwNgrmfROOQVC2gP0/Y8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="48660805"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 09:13:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 09:13:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 09:13:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 09:13:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 09:13:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKE4B8o3x2Wn7Bs27R9boRVloumgXG3Z9A67JN3lxAb9ZbJ19TfO2znw9i8Iuv7lP07UhY958PHY1zYLrdv2s1vn+suKd9oe9UmYMeVRmx2UaLTZDXSP3xM9xYcfJwZNPSeXHw17twsVKtxlBrqJAe0T87Z8qn34KgE3oh4ES1UbtgvfiXwbUWikgM2BH/4TPShINFDJKVc2BtNpMFevMgEa1KYa4ntuvbfmmKexhGI/jq9RIdhs1sNkEB+TA2ZrgN8Df+ZO56Q1kPGLjVQqnfBBbtHEwnUeuuzgJLcM1VHts7S3hiT47fPmBRsSf1Z5GiiPr1Iw9ajk4RlxzfVJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KduwdZLWSimS0iB6fabex/PRaD0k4UNJF/N+j5m0RIk=;
 b=UnqXOR2upkJ0eO0qSIctsF3z3uQ8sP64P1cstMrWAZt7T6yc/mF+jdjqt+FgNCD+mMcUl8lAEGc6v8X4a7z/FKkzfow580jHN4oySr6xga2RQlNF34kv0Fzg9PvJrFTWk/oYf3hkn3wXaLm2Q/N1GiNwiyVNRu45kVP19kmraRt30I4O77e6ySCB1vOgm7KNCeN3WeSCYKRPLiKlaijaOqnKA2DDdtzZ/att7eCEWgl3IYq9ZIMfec51lfddggY6QUd8hWBKnBt4xi93v3TRdu3QxPDsLSPTu0erF2eQ6imZA6FWBWRXmNqpAxBdTnaJPEetI0YgfnfZQNqlM/aQFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 16:13:29 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 16:13:29 +0000
Date: Wed, 26 Jun 2024 16:12:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 4/7] drm/xe: Convert multiple bind ops into single job
Message-ID: <Znw+Ar2ZBt+3SaQu@DUT025-TGLU.fm.intel.com>
References: <20240626003920.4060633-1-matthew.brost@intel.com>
 <20240626003920.4060633-5-matthew.brost@intel.com>
 <6dc343ad-bd46-4402-bd0a-00ed2b366e7c@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dc343ad-bd46-4402-bd0a-00ed2b366e7c@intel.com>
X-ClientProxiedBy: BYAPR11CA0069.namprd11.prod.outlook.com
 (2603:10b6:a03:80::46) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d84eaf-ea3f-4437-28cf-08dc95faeaa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|1800799022|376012;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OeVyn5DlbqfjfwkY1qsPU0HBAGEvOyf5vdeDyOdEt1V/bhI5UvVwXOaCDT?=
 =?iso-8859-1?Q?T8yYNpQDDPFQDjfbVMqL8ll4N0RXbC62A6AGqLXH/OjlicBlKpknhqMuma?=
 =?iso-8859-1?Q?lvZBAorChtpxi9VGFQy0i3MqrPIC+e2nhfah5nR/P4WfE5ywG3/Y62pi6+?=
 =?iso-8859-1?Q?XvTIe+7G5TYtbRkvWqOsE74J6e5VADwVy9rJnwvnqJx6j13ySJB2EHudmc?=
 =?iso-8859-1?Q?DxWj+jqNvusXHEpmqTHlBH7wiQPHHwuUg0fY4IV46+zy/nPCNvUOwdUoJr?=
 =?iso-8859-1?Q?XBf6DA/Bi3CeypZdl5uLKsYKZmStDOA8atV5VhG0i7GUi3ruyPjUz5Rfh7?=
 =?iso-8859-1?Q?qnTGPyLfwAMbMZNiPHOEM8QD8YN45PXjr25aapBxlPjN2PV9xeC5o/Zr6F?=
 =?iso-8859-1?Q?Kr0B3A9b1bgN5z+y+i1ZwaAm4EhJ+domWs/nt2d90wUHDZ0G8csBehMj06?=
 =?iso-8859-1?Q?5XTkfAgGubf2neFP+1W1WIc1W6MzTRTN6Cl0b8DwlcI60iodskwjyRUi34?=
 =?iso-8859-1?Q?CKxtagxB/ofP5SnBfq4D4QPqcynvZM5X21H1FQibNpbyIqbwfRX11HcCW7?=
 =?iso-8859-1?Q?AyY9anlhi1954cqAVEPhQTICOp005RlBQyDqwS4ntQulZWAL1+GYIUhUzO?=
 =?iso-8859-1?Q?d5f6z0tUCyilsPekCwwU5rpL+0lm2bCmKbRomYpKaoIP+EFNanHUxnXPRE?=
 =?iso-8859-1?Q?J4A3MTKBqiSNNIYw+aKTOnJTU2N0u6X18Bo+XjJDxa5MrcT9R5drfL0T7G?=
 =?iso-8859-1?Q?abLCp5VXSaJMb1qGufteydC5RBhHU0wfSsHQ9qY5zgLqkuykfhOfr7eO2h?=
 =?iso-8859-1?Q?V3Je2ozp6t/L9eACGdXnIniPi4x4DxIWq1FonAKJGqowOcvxQ1vmOzf6tQ?=
 =?iso-8859-1?Q?zZ400dFDaXCSh0ohEQDwMPmPBPWn6uJM02Hk9pRytfkxPWttEt9d8ESba7?=
 =?iso-8859-1?Q?3pNz6BLPCuxAv9pgMvd1xlixcnyzkFlhkZ5XlHgioX/pEIRbfKzOej+crC?=
 =?iso-8859-1?Q?jAAzJGrK9U7ErCZeOvS+8AWOsV2CvVdyBg7oxvJO/BKASsZ21XvvMjuF3r?=
 =?iso-8859-1?Q?DvnAskYRKT2t4UWR92lJn+X1bvWBeXB9SXxRMYxSNWIeVli9Z/a1isQ32M?=
 =?iso-8859-1?Q?dKsHJW17tEBvFylGFJLysQAByXMt2wi67a6DCYhNe7mgEyODnWfI66vUH5?=
 =?iso-8859-1?Q?LMKzMPPiEJLJJL7xSJk7DrupbakZFkGrTGyAzPR9EQm1wNc7Q5sJSIJM2A?=
 =?iso-8859-1?Q?YxvZ3BONt5uU3W5x0MFDw91l4YAWW/nTxRsC9nL6DqLJtt9lQ0PS7sZV2z?=
 =?iso-8859-1?Q?k8Scn74+Sx52Y0Svxl3v1Aecd+M478/ibAYS4jX/lC/G6Qw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(1800799022)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Yu4b6Tqe8wdwvmHJkis4cgm3VXhVy+QX8W910D46xe6VJmOV8ugX7y+JtL?=
 =?iso-8859-1?Q?+S0Vtg+Li9LOlQbqKirAZ51/qh3mJ8vp+b3rSRkZMK4UwTOIA3eg+lgkfd?=
 =?iso-8859-1?Q?jcjdoWkFBadL9QANgjlftkifYbWmG1sabiNDgWyD9oO3P/ij01eaTfnc8c?=
 =?iso-8859-1?Q?stJmde1lmUniyXQfgh05P5/Bs71GxpAK/p6wMViwSwZEw2bEnQqlTXytuk?=
 =?iso-8859-1?Q?OUyXOjIdRM88T+BZraMH+D/ejJJCl/RtuOXWgBiCQUf8foZv+y6WFx7li+?=
 =?iso-8859-1?Q?Lrd4VYNDux7zDqmBywS0p4dVaKtFlG/yRID4V2uI2qlPkcxIlM7ZoRCYtw?=
 =?iso-8859-1?Q?FTx2inWO39TXRN7gG0ZQ60UB8RrY5BnBhh22ZFb5sZj1moW7Vf83qZDe7C?=
 =?iso-8859-1?Q?EpMzYs2m+5CeqmVfD9Gt4k9jdzjLCgAg4gOIHnoxUYj4WUgGIefZ0DbCol?=
 =?iso-8859-1?Q?HNewefkQQZRo8ZqdR4LGkH4IGyKRXUMbqcJ5KuNcXuGDmdX9j6JGbqzhiz?=
 =?iso-8859-1?Q?UqFYWJ5/+i4euMZe0j/Mr1Y7x9bupyVitiBflHuqTeVgNIFzaApqwKNgLp?=
 =?iso-8859-1?Q?aqoZon3/4Gu5fM2mlDefHFUssdOdEH+WJ9t34DQSo1t8KwdReso1lTZs+j?=
 =?iso-8859-1?Q?UcdjVL3cg+xaAD5BulIi6EoJUaU8DyN/kpitnda4n/RL1rigORBBVkpyG+?=
 =?iso-8859-1?Q?4jHUzng+DveNKdPYUiK8gLFHelNUI9R8GFsCKSJ0ex6HD1NHVnHA39tzCX?=
 =?iso-8859-1?Q?tyHiICtnSkBjgu/yZq4APQ/IB7lilibQHYW1rE2a44quDuG0jvoc+Dfp4O?=
 =?iso-8859-1?Q?zsjU8wOmiDj/0EYEfqyBLsibiDE1xNLQ46AvsbuYKLSwl0jHIW9I21VtHj?=
 =?iso-8859-1?Q?IA/Lp5ueomAF1/B+71cfd2xPyk/1hrFWskHVh8s4ULoDgtg+BvL5Jvq7fV?=
 =?iso-8859-1?Q?h6DoIoREjNSASmYE712nazjVIy/ZMeUdC2vZus018ep23jw88msOpYbLMz?=
 =?iso-8859-1?Q?mQlYvFjMxvNoEKrIDgZpz8Ujxs2iZuu7NGvmnQrv9qeVerwLOT6fHuBQYm?=
 =?iso-8859-1?Q?FhgeQE9Qm3hCfzYNplJ4CmMVfDrFgvMRKII0EzHgY+iem8QZd7xM9l7dQG?=
 =?iso-8859-1?Q?R/d501Vl00L0xg+mTkYmBWrzre+C4ZEnE6dBoferrwwyKjjwujcb+DpFdE?=
 =?iso-8859-1?Q?6CFsVKPFDsvyTxxYLmsyRaAWHDkeKLg4QQsz/FrV+f0iuq0rM53Pbwe9Bf?=
 =?iso-8859-1?Q?eh74EXePHNtMrrS2KnzU0/XXcGiQXNtQ2xd37/uTfV4F1p8Br5W0k/gxTd?=
 =?iso-8859-1?Q?vnbi9vre5eXN0eSqu+ktbWApG3LMxH7oRcv9uxEwkaYBoVIpn8PL8zUCDt?=
 =?iso-8859-1?Q?uLmEJk8qG+kwVwEkgoW71HoLdntSx1+76kqrvSaekwdowURua/IHWzoDbN?=
 =?iso-8859-1?Q?tX/BC/0xfynOICZ6cBKJkk9s7sGvA0ORq26wAl1SkFau5Kcmvlw95nRmPd?=
 =?iso-8859-1?Q?NjjyCBR68iKc67cLm8ibMyVeqqy2jP35mJQ7YK7CnwP3DfUyHkJ5Dnqjkt?=
 =?iso-8859-1?Q?xN0iRXkf39N3y29UJCqhWMyk936uR8kYcahE5yqJ/XASe+HjYfHT0efrOX?=
 =?iso-8859-1?Q?OeYxFc5BPo+w9c6c8py4EEVioihdaLhM6fooXAojVZS4C7m03uT2i6Yw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d84eaf-ea3f-4437-28cf-08dc95faeaa9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 16:13:29.2060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKSoH8FWK2Ozda/XnFufOsa+IG9CnfKA8N1V3J/5jsFt6SznXyGTJEPkmDetDFnlxJy/LNx+lq1JsEC9ovOWLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8739
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

On Wed, Jun 26, 2024 at 03:03:41PM +0100, Matthew Auld wrote:
> On 26/06/2024 01:39, Matthew Brost wrote:
> > This aligns with the uAPI of an array of binds or single bind that
> > results in multiple GPUVA ops to be considered a single atomic
> > operations.
> > 
> > The implemenation is roughly:
> > - xe_vma_ops is a list of xe_vma_op (GPUVA op)
> > - each xe_vma_op resolves to 0-3 PT ops
> > - xe_vma_ops creates a single job
> > - if at any point during binding a failure occurs, xe_vma_ops contains
> >    the information necessary unwind the PT and VMA (GPUVA) state
> > 
> > v2:
> >   - add missing dma-resv slot reservation (CI, testing)
> > v4:
> >   - Fix TLB invalidation (Paulo)
> >   - Add missing xe_sched_job_last_fence_add/test_dep check (Inspection)
> > v5:
> >   - Invert i, j usage (Matthew Auld)
> >   - Add helper to test and add job dep (Matthew Auld)
> >   - Return on anything but -ETIME for cpu bind (Matthew Auld)
> >   - Return -ENOBUFS if suballoc of BB fails due to size (Matthew Auld)
> >   - s/do/Do (Matthew Auld)
> >   - Add missing comma (Matthew Auld)
> >   - Do not assign return value to xe_range_fence_insert (Matthew Auld)
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo_types.h |    2 +
> >   drivers/gpu/drm/xe/xe_migrate.c  |  306 ++++-----
> >   drivers/gpu/drm/xe/xe_migrate.h  |   32 +-
> >   drivers/gpu/drm/xe/xe_pt.c       | 1102 +++++++++++++++++++-----------
> >   drivers/gpu/drm/xe/xe_pt.h       |   14 +-
> >   drivers/gpu/drm/xe/xe_pt_types.h |   36 +
> >   drivers/gpu/drm/xe/xe_vm.c       |  519 +++-----------
> >   drivers/gpu/drm/xe/xe_vm.h       |    2 +
> >   drivers/gpu/drm/xe/xe_vm_types.h |   45 +-
> >   9 files changed, 1036 insertions(+), 1022 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > index 86422e113d39..02d68873558a 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -58,6 +58,8 @@ struct xe_bo {
> >   #endif
> >   	/** @freed: List node for delayed put. */
> >   	struct llist_node freed;
> > +	/** @update_index: Update index if PT BO */
> > +	int update_index;
> >   	/** @created: Whether the bo has passed initial creation */
> >   	bool created;
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index af62783d34ac..160bfcd510ae 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1125,6 +1125,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >   }
> >   static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> > +			  const struct xe_vm_pgtable_update_op *pt_op,
> >   			  const struct xe_vm_pgtable_update *update,
> >   			  struct xe_migrate_pt_update *pt_update)
> >   {
> > @@ -1159,8 +1160,12 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> >   		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> >   		bb->cs[bb->len++] = lower_32_bits(addr);
> >   		bb->cs[bb->len++] = upper_32_bits(addr);
> > -		ops->populate(pt_update, tile, NULL, bb->cs + bb->len, ofs, chunk,
> > -			      update);
> > +		if (pt_op->bind)
> > +			ops->populate(pt_update, tile, NULL, bb->cs + bb->len,
> > +				      ofs, chunk, update);
> > +		else
> > +			ops->clear(pt_update, tile, NULL, bb->cs + bb->len,
> > +				   ofs, chunk, update);
> >   		bb->len += chunk * 2;
> >   		ofs += chunk;
> > @@ -1185,114 +1190,58 @@ struct migrate_test_params {
> >   static struct dma_fence *
> >   xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
> > -			       struct xe_vm *vm, struct xe_bo *bo,
> > -			       const struct  xe_vm_pgtable_update *updates,
> > -			       u32 num_updates, bool wait_vm,
> >   			       struct xe_migrate_pt_update *pt_update)
> >   {
> >   	XE_TEST_DECLARE(struct migrate_test_params *test =
> >   			to_migrate_test_params
> >   			(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));)
> >   	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> > -	struct dma_fence *fence;
> > +	struct xe_vm *vm = pt_update->vops->vm;
> > +	struct xe_vm_pgtable_update_ops *pt_update_ops =
> > +		&pt_update->vops->pt_update_ops[pt_update->tile_id];
> >   	int err;
> > -	u32 i;
> > +	u32 i, j;
> >   	if (XE_TEST_ONLY(test && test->force_gpu))
> >   		return ERR_PTR(-ETIME);
> > -	if (bo && !dma_resv_test_signaled(bo->ttm.base.resv,
> > -					  DMA_RESV_USAGE_KERNEL))
> > -		return ERR_PTR(-ETIME);
> > -
> > -	if (wait_vm && !dma_resv_test_signaled(xe_vm_resv(vm),
> > -					       DMA_RESV_USAGE_BOOKKEEP))
> > -		return ERR_PTR(-ETIME);
> > -
> >   	if (ops->pre_commit) {
> >   		pt_update->job = NULL;
> >   		err = ops->pre_commit(pt_update);
> >   		if (err)
> >   			return ERR_PTR(err);
> >   	}
> > -	for (i = 0; i < num_updates; i++) {
> > -		const struct xe_vm_pgtable_update *update = &updates[i];
> > -
> > -		ops->populate(pt_update, m->tile, &update->pt_bo->vmap, NULL,
> > -			      update->ofs, update->qwords, update);
> > -	}
> > -
> > -	if (vm) {
> > -		trace_xe_vm_cpu_bind(vm);
> > -		xe_device_wmb(vm->xe);
> > -	}
> > -
> > -	fence = dma_fence_get_stub();
> > -
> > -	return fence;
> > -}
> > -
> > -static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
> > -			struct xe_sync_entry *syncs, u32 num_syncs)
> > -{
> > -	struct dma_fence *fence;
> > -	int i;
> > -	for (i = 0; i < num_syncs; i++) {
> > -		fence = syncs[i].fence;
> > -
> > -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > -				       &fence->flags))
> > -			return false;
> > -	}
> > -	if (q) {
> > -		fence = xe_exec_queue_last_fence_get(q, vm);
> > -		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> > -			dma_fence_put(fence);
> > -			return false;
> > +	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > +		const struct xe_vm_pgtable_update_op *pt_op =
> > +			&pt_update_ops->ops[i];
> > +
> > +		for (j = 0; j < pt_op->num_entries; j++) {
> > +			const struct xe_vm_pgtable_update *update =
> > +				&pt_op->entries[j];
> > +
> > +			if (pt_op->bind)
> > +				ops->populate(pt_update, m->tile,
> > +					      &update->pt_bo->vmap, NULL,
> > +					      update->ofs, update->qwords,
> > +					      update);
> > +			else
> > +				ops->clear(pt_update, m->tile,
> > +					   &update->pt_bo->vmap, NULL,
> > +					   update->ofs, update->qwords, update);
> >   		}
> > -		dma_fence_put(fence);
> >   	}
> > -	return true;
> > +	trace_xe_vm_cpu_bind(vm);
> > +	xe_device_wmb(vm->xe);
> > +
> > +	return dma_fence_get_stub();
> >   }
> > -/**
> > - * xe_migrate_update_pgtables() - Pipelined page-table update
> > - * @m: The migrate context.
> > - * @vm: The vm we'll be updating.
> > - * @bo: The bo whose dma-resv we will await before updating, or NULL if userptr.
> > - * @q: The exec queue to be used for the update or NULL if the default
> > - * migration engine is to be used.
> > - * @updates: An array of update descriptors.
> > - * @num_updates: Number of descriptors in @updates.
> > - * @syncs: Array of xe_sync_entry to await before updating. Note that waits
> > - * will block the engine timeline.
> > - * @num_syncs: Number of entries in @syncs.
> > - * @pt_update: Pointer to a struct xe_migrate_pt_update, which contains
> > - * pointers to callback functions and, if subclassed, private arguments to
> > - * those.
> > - *
> > - * Perform a pipelined page-table update. The update descriptors are typically
> > - * built under the same lock critical section as a call to this function. If
> > - * using the default engine for the updates, they will be performed in the
> > - * order they grab the job_mutex. If different engines are used, external
> > - * synchronization is needed for overlapping updates to maintain page-table
> > - * consistency. Note that the meaing of "overlapping" is that the updates
> > - * touch the same page-table, which might be a higher-level page-directory.
> > - * If no pipelining is needed, then updates may be performed by the cpu.
> > - *
> > - * Return: A dma_fence that, when signaled, indicates the update completion.
> > - */
> > -struct dma_fence *
> > -xe_migrate_update_pgtables(struct xe_migrate *m,
> > -			   struct xe_vm *vm,
> > -			   struct xe_bo *bo,
> > -			   struct xe_exec_queue *q,
> > -			   const struct xe_vm_pgtable_update *updates,
> > -			   u32 num_updates,
> > -			   struct xe_sync_entry *syncs, u32 num_syncs,
> > -			   struct xe_migrate_pt_update *pt_update)
> > +static struct dma_fence *
> > +__xe_migrate_update_pgtables(struct xe_migrate *m,
> > +			     struct xe_migrate_pt_update *pt_update,
> > +			     struct xe_vm_pgtable_update_ops *pt_update_ops)
> >   {
> >   	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> >   	struct xe_tile *tile = m->tile;
> > @@ -1301,59 +1250,53 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >   	struct xe_sched_job *job;
> >   	struct dma_fence *fence;
> >   	struct drm_suballoc *sa_bo = NULL;
> > -	struct xe_vma *vma = pt_update->vma;
> >   	struct xe_bb *bb;
> > -	u32 i, batch_size, ppgtt_ofs, update_idx, page_ofs = 0;
> > +	u32 i, j, batch_size = 0, ppgtt_ofs, update_idx, page_ofs = 0;
> > +	u32 num_updates = 0, current_update = 0;
> >   	u64 addr;
> >   	int err = 0;
> > -	bool usm = !q && xe->info.has_usm;
> > -	bool first_munmap_rebind = vma &&
> > -		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
> > -	struct xe_exec_queue *q_override = !q ? m->q : q;
> > -	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> > +	bool is_migrate = pt_update_ops->q == m->q;
> > +	bool usm = is_migrate && xe->info.has_usm;
> > +
> > +	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > +		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> > +		struct xe_vm_pgtable_update *updates = pt_op->entries;
> > -	/* Use the CPU if no in syncs and engine is idle */
> > -	if (no_in_syncs(vm, q, syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
> > -		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
> > -							num_updates,
> > -							first_munmap_rebind,
> > -							pt_update);
> > -		if (!IS_ERR(fence) || fence == ERR_PTR(-EAGAIN))
> > -			return fence;
> > +		num_updates += pt_op->num_entries;
> > +		for (j = 0; j < pt_op->num_entries; ++j) {
> > +			u32 num_cmds = DIV_ROUND_UP(updates[j].qwords, 0x1ff);
> 
> Why 0x1ff here? Should it not be MAX_PTE_PER_SDI? There is a failure in CI
> here: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v5/shard-lnl-8/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html
> 

Yes it should be MAX_PTE_PER_SDI, copy paste error or perhaps this code
changed since my patch was originally authored. Will fix. 

> Wondering if this is the cause? i.e we think we can fit more stores per
> MI_STORE_DATA_IMM, since write_pgtable() below is using MAX_PTE_PER_SDI and
> not 0x1ff?

Hmm, unsure. Will have to dig in on HW. The math to calculate batch_size
could be wrong somewhere else too.

> 
> > +
> > +			/* align noop + MI_STORE_DATA_IMM cmd prefix */
> > +			batch_size += 4 * num_cmds + updates[j].qwords * 2;
> > +		}
> >   	}
> >   	/* fixed + PTE entries */
> >   	if (IS_DGFX(xe))
> > -		batch_size = 2;
> > +		batch_size += 2;
> >   	else
> > -		batch_size = 6 + num_updates * 2;
> > -
> > -	for (i = 0; i < num_updates; i++) {
> > -		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, MAX_PTE_PER_SDI);
> > +		batch_size += 6 + num_updates * 2;
> > -		/* align noop + MI_STORE_DATA_IMM cmd prefix */
> > -		batch_size += 4 * num_cmds + updates[i].qwords * 2;
> > -	}
> > -
> > -	/*
> > -	 * XXX: Create temp bo to copy from, if batch_size becomes too big?
> > -	 *
> > -	 * Worst case: Sum(2 * (each lower level page size) + (top level page size))
> > -	 * Should be reasonably bound..
> > -	 */
> > -	xe_tile_assert(tile, batch_size < SZ_128K);
> > +	bb = xe_bb_new(gt, batch_size, usm);
> 
> So do we now validate that batch_size fits within the total pool size
> somewhere, to avoid triggering the warning in drm_suballoc_new? Did your igt
> not trigger the warning? Also the below check is not too late?
>

I think the idea with xe_tile_assert is we should not expose asserts
which user space can trigger. e.g. When I run [1] we shouldn't see
asserts pop.

The below IGT passed so I think letting xe_bb_new fail and converting to
-ENOBUFS is correct.

[1] https://patchwork.freedesktop.org/series/135143/
 
> > +	if (IS_ERR(bb)) {
> > +		/*
> > +		 * BB to large, return -ENOBUFS indicating user should split
> > +		 * array of binds into smaller chunks.
> > +		 */
> > +		if (PTR_ERR(bb) == -EINVAL)
> > +			return ERR_PTR(-ENOBUFS);
> > -	bb = xe_bb_new(gt, batch_size, !q && xe->info.has_usm);
> > -	if (IS_ERR(bb))
> >   		return ERR_CAST(bb);
> > +	}
> >   	/* For sysmem PTE's, need to map them in our hole.. */
> >   	if (!IS_DGFX(xe)) {
> >   		ppgtt_ofs = NUM_KERNEL_PDE - 1;
> > -		if (q) {
> > -			xe_tile_assert(tile, num_updates <= NUM_VMUSA_WRITES_PER_UNIT);
> > +		if (!is_migrate) {
> > +			u32 num_units = DIV_ROUND_UP(num_updates,
> > +						     NUM_VMUSA_WRITES_PER_UNIT);
> > -			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
> > +			sa_bo = drm_suballoc_new(&m->vm_update_sa, num_units,
> >   						 GFP_KERNEL, true, 0);
> 
> And maybe here also?
> 

Hmm, I think here we should also convert IS_ERR(sa_bo) to -ENOBUFS. Will
fix.

> >   			if (IS_ERR(sa_bo)) {
> >   				err = PTR_ERR(sa_bo);
> > @@ -1373,14 +1316,26 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >   		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
> >   		bb->cs[bb->len++] = 0; /* upper_32_bits */
> 
> Off camera this is doing:
> 
> b->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(num_updates);
> 
> What are certain that num_updates still can be done with single command
> here?  Do we not need to break it up like we do with write_pgtable? If it's

The IGT assert from the CI failure will pop if we overun the allocated
batch buffer. So I think we are good on our commands fitting.

We could potentially break this but kinda goes against the idea a single
job per IOCTL. Also I don't really want to overengineer this when we
have a planned UMD fallback path via returning -ENOBUFS and eventually
want to move to CPU binds and this entire problem just goes away.

Matt

> not an issue I think would be good to add an assert to ensure it fits?
>
> <snip>
