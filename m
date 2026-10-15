Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241F1CC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C394E10EBB5;
	Thu, 15 Oct 2026 13:30:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B193A10EBB5
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 13:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792071038; x=1823607038;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z6PetOFdpEpAsfAaiAq7hI/j2Fil+nAcwTEJYZooTE4=;
 b=U8cf5ml8RwR9CNMKOCtHQRRuTU4oS9Qhr1huXsN5RyLkso/OxSSTPC5/
 K1MhpAIM5xuc1gkxJs1tY66dLYi/IOFH/WtE1bh3JokUuMoZXobOdH74e
 czfAVRG9HOjtco1/nizJpOsqMU+kimhIvLtNOmsy1g8TSb7ahLsy2bsGn
 mTYc15GtAS09ZAsXCCB9/hJO9Fl8AW3grC78W3dzlSRA45J4tlUHO19KI
 rrZ0MQuAbpJXa8Q2bD1rMNdRev/ofKLKgInplZ2PxPgWBRf8lfcdnHcjL
 V4hHC0Qjhcq7S0NjPh4RmmOe1jsVdc3dJruvLR9AC9J/ju7MfQmIN5jkF A==;
X-CSE-ConnectionGUID: SLsyyIZGRa+F4OT46DCmYw==
X-CSE-MsgGUID: rCw5e1O7Q5m8qtHN3pTZaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="742468"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="742468"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:30:37 -0700
X-CSE-ConnectionGUID: 1lTdu8uVQEy7Ts8dq6t/+w==
X-CSE-MsgGUID: UWmBfLfpT2CtXZoWG/+URQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2125777"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:30:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:30:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 06:30:36 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.13)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:30:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlL77Oj/7R7AJosDb+SUlINydsXFoAEHsrUOTDqsyaKT2eiwvCbGzBaoh0apNA25QkGqBADuPAaWjukKqzL0w7rYLgaZX8oX054PUHNYR4r0U+2Pc6EpHCHMRiNDgy5l/NlGSqfyG8JW+xwtPW+OXF08SBGMSBrMLvIvD5r53p8DkNWU2rwgva+7TkRmCNK5FSdqFtv6P0DdcJjNcPSVQvhWGFCql2PPLG146mXIJWORa+cdcah2ZI5hgiVFHGM6EIAVuib7L/J0s6gIXg8coGJy58Egugh7YInaFdaDFzpGzWOA/Ju/Go0dp1HuFuVHYRJt3TisXZ7mWndxQA0fKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/0LejQ9IKBasLsGQalLtGyJ8xwDCk7D4TDW666GYKU=;
 b=OT5c3paWbD/jfM7SeBvz48g4v4nlgpT9xIDJ2yTroq+HbcjEtVT2iQdlCzjEvDAKMwmXcoB04GO6aXWXPUS/2w+8NM1tQhfDSjIRhl+0ouzs17djywyjj6at1GRt+uAAaPSvUakaCfYi66/bFuMnP/BkGfJHhtmLQr+7GDdMFq5U9USMDUseBqXArgW6FmnU0F3FJtJqZ3+mmGnR8xq3tb0QAoLb7Qbv7I40pMXySJsvapeAyM8fxxwkgiaT8wSvYbE+yyljyyCOGhPAYJD80U6MU3r+DF9J3Vc+sVJMNna5lSp2Ah3M2t8gFbK3kAugCuXjRDS0paMYv1h6U9KRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS0PR11MB9477.namprd11.prod.outlook.com (2603:10b6:8:290::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 13:30:34 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 13:30:34 +0000
Date: Thu, 15 Oct 2026 06:30:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <mallesh.koujalagi@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v8 1/7] drm/xe/gt: Use GT ordered workqueue for wedging
Message-ID: <atDVeL467De0qK0Q@gsse-cloud1.jf.intel.com>
References: <20261015081042.415942-1-raag.jadav@intel.com>
 <20261015081042.415942-2-raag.jadav@intel.com>
 <atCzaQLVh-SlormW@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <atCzaQLVh-SlormW@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS0PR11MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: a5eeb3fb-118b-4a8f-0cd8-08df2ac07df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|10067099003|4143699003|261009223027099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: Z0ztekgxRCSer8+YI3vNu52XrFdJpJKFhgBPibUug6dX/fot18YyuVO8zIVhyxHcNj3UIHABZNllXOLxBNSykAEGStNf9Yi2L17/dg/tX+GoEqq+868dQjnunuwwMV4LDrmbcXbJQnP12fSB+lqf6qLhKpeK8TXw96AlFsEYPjRrFHMO9tcxiS/Er8o50PY6YY/ZsssKo3iLL2vkhbHLDJcdU8Vjuk0vXS79q6g0EGdWjmfT403zYjdMp5ti2zElozklLK4O8zF50VcmXMbD6zUHoprBPBStunyvXfXyuNO5goFwIFDyX8b6d0TftiUEaWzdryU5d7Qd+cod/Oc0YZn5WpwNWG0tXHE+dI5D/+F5x9+oVGRrQs5R7orhBWOv/cTmtpieDIyJhU4dHQQy5ccUdJYT82WCc7OSngQm382kriq/iLd4n+HDlXSEhmRLsf2i9tQQsiNOqZ43SQjJODqusxB8hYy9bxnvb/rjVziPwLd8YlJN6ROHQv4+ECDtp9qHtfY9lIwI5MgpkH5AOCIhl4fZlFa0b3wm0SZq1HpZhTCGqDwW9Wh05DTNlRVNuE4v6Uy2KjUPHFLkBC+OO4aQa/N8LvH6WYbhIyA9CtJ0OKkRLZimrocXivSxhad1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(261009223027099003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?je0/XA69G8OqhEYdGm8F0e6XWNsp0w8KafUwNrxN7fCzjM4+aHJ2RagcB8Hc?=
 =?us-ascii?Q?JF2jlBk1dm+nKbuxMf1vZ8CL1sdApxEtyBi1N3px+ps0LKxHR72x0eGOwMMQ?=
 =?us-ascii?Q?5Euvr9VPesLNwQqd9p15PS2OAbV3+ehc/gtRvyUuArsCrCBOKs3pT6a2caDU?=
 =?us-ascii?Q?zxYlYjB/W4Vn6FoMDhNv9eyJSdG1EAvxBDoiw8EepDmoKWYJte8rNDZ+/9UY?=
 =?us-ascii?Q?ALQIrNKPSDo5N40XeM4UKhTUtYGr9d6iPrl9E5m8kNoKBZO/aFSk7ztoK1di?=
 =?us-ascii?Q?WCedmK4BQ5s0k8eKGqgS5uGV4ukSO+f5iLeL7n6tDcTHBAGdKOBRRSjAzBYV?=
 =?us-ascii?Q?AbTtoFrNY1l9F2Kkgvgcd0M/MNcmhqHA0mA0XILbYgKqckDv7zcy1btL1kOE?=
 =?us-ascii?Q?17nYkbKMpplTp+pbRjTbjC0QO93t9sw5eop1UrsWK7vXobPTcOGiWoKkKRBz?=
 =?us-ascii?Q?Twfw0c5z36HfdiLiXlinQknDToGa/Qo6JQkfu3fuYL0EB1zrdaoVEyQma4ql?=
 =?us-ascii?Q?Qr7xQaGmowu8N2dk2ONnPpUADb218yI/G6eH0syEQcUbo7FlHY7DrVVbGTwl?=
 =?us-ascii?Q?UAYrO6JeV65dC0HKQMgeezE10rBgJlxj+Mhe2LhDer7a0oiOyiM9QDmmO1Bh?=
 =?us-ascii?Q?2r9H2KIfSOBbYQNuSrT7mGZ2v7ImH6DBMPEeLyze/h/BKyqlNKsFz4NVoQoe?=
 =?us-ascii?Q?dVEgF7QJrbtnzzrLQ5NAhF7mothF1+fd2RShvGD7gWzmeW++sJr1P8160t+k?=
 =?us-ascii?Q?z7ilnuucM3/pbqhUls6DXjL4MwVQHE4Th4EKsSrTA4bWuydJzIlnsCww+cd+?=
 =?us-ascii?Q?gu0MIfxAhEuCsPseU9M44laO2fIgN1kTjgBWr4mqnUTnxIL7WLI/q3yAvvHq?=
 =?us-ascii?Q?3QUEeTq0+s9mQ69yBwQQqueC9RPsZYiLmKaeY9XcRRRibqTMYwdzIYpBq87u?=
 =?us-ascii?Q?FxCLqqnuNZlrV6oxB38WAaJri388MHhd6rTwkRM18p7i6g1dIMW1qLyeTZHR?=
 =?us-ascii?Q?9tM/2e+3fO91zS3iHfz52rx82h7PZMPS9EOvdtgENaDOZRVpXomOckdYrral?=
 =?us-ascii?Q?N1EJ3tz8EBNDWZxJExVqi8BqV8JJsnhLusKaxDuypy3y2/aISkZxWnqcpCp0?=
 =?us-ascii?Q?oWbk/tLNsKWse8Xwbk/CTcl0THW9HKEtljHx934zeOt5QUe9Rc8jn6Pke909?=
 =?us-ascii?Q?v3c1LQFFDj9rGiUOTyy33zQ8UOIJv6DFOKOoSClHMF3YsX1moLExRnTgW/Av?=
 =?us-ascii?Q?UHMN0aJzb7EhmEYR44n3VLO2R5MU8AFV3EenrhdmYzUK6DrZFIZoWBbfJXPB?=
 =?us-ascii?Q?i/z8mejCpmeM0dAerjZOXafu23W+N3KuKMknPtxhcpYEFDFatMCWo1mBIdA6?=
 =?us-ascii?Q?O91jUG/qtJWg/6PxDBNk9h84ZIXMHuuxvX1hvB0bpn45vnWfSL+hG3IGY+Vu?=
 =?us-ascii?Q?8RRzwz6+1T2IWDCAqSET9c55oA3+AC/QflyL9Ob92zGk4HWNvEKoszEi5Hs3?=
 =?us-ascii?Q?0oUh6epFIEVWOdSb0QN9ZkdIayXsH2AdLB4ZbvgtTiaHG4hIbtZHt86kpGCk?=
 =?us-ascii?Q?8o2nVs+hFNj8Dvuit8g/MACnmkHD92dGOWeHvx/BXzrCxmpPfwWs+minceoO?=
 =?us-ascii?Q?mYC/YKgL2AbbWUFxgWPTx798J12w6fdsZu/J9u2FUTDKPVegjR5aX9MAf8N3?=
 =?us-ascii?Q?9Da0d4y9xUNCOniniEVzEgTLD1AtTJ3C8ot3M65IF6BNeODOUBAAX7AtA9iU?=
 =?us-ascii?Q?nR8OJ3KViA=3D=3D?=
X-Exchange-RoutingPolicyChecked: NDqVQS9mIrIBHm9VvKqld72PdHy3TEmH98za5DN5vvRWpDpVfZq28dAWK4OSM9srOB02Lx9ytdNv/YlIKlgzF+QduWgp0KrmYJSr2krvcoqNCxflZn4yub4RIF+p1+D6Tikt3XZ5pzp+Dy9ww/UnwY/xVk2f8KG+Re7PyYHuyLZR44mtZ4lxqkNDOTS3cs8x9ZFNGbP406JrjpFkUHUBseyXzYUOLMP0+emkunrHeUmqbmanSM7rI/j1imLBaGgGo0pEDvawskwvzwsqj0wf46g7i5RzyuEAUJaZnziiQGHBOPe07SoBlqWxsKWJWgWFeqh6MXY7f9Ly+ckRqNmDjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a5eeb3fb-118b-4a8f-0cd8-08df2ac07df1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 13:30:34.6808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Ex5A+SH/O893PGZf8rlWHQ2VAxC66ZkpIkGBnYK+5WHmGj914BM1KRuPTcKFRJDbh8zR799ZxlHXuu5RRWz2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9477
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

On Thu, Oct 15, 2026 at 01:05:13PM +0200, Raag Jadav wrote:
> On Thu, Oct 15, 2026 at 01:40:15PM +0530, Raag Jadav wrote:
> > Currently, xe_gt_declare_wedged() stops GuC CT and initiates exec queue
> > teardown synchronously. This can result in tdr timeout in cases where
> > the device is declared wedged while jobs are still in-flight.
> > 
> > Introduce a worker for GT specific wedge handling and queue the teardown
> > on GT ordered workqueue, so we don't disrupt the scheduler while jobs
> > are still in-flight.
> > 
> > While at it, introduce for_each_initialized_gt() macro and use it for
> > wedging GT. This helps avoid races in case the device is declared wedged
> > in probe sequence before GT is initialized.
> > 
> > Fixes: c9474b726b93 ("drm/xe: Wedge the entire device")
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > v2: Split fixes into separate patches (Rodrigo, Michal)
> > v4: Introduce for_each_initialized_gt() (Michal)
> > v5: Flush GT wedge worker to avoid races (Sashiko)
> > v6: Move wedge worker initialization to xe_gt_init_early() (Rodrigo)
> >     Don't flush GT wedge worker to avoid deadlock (Sashiko)
> > v7: Guard GT wedge worker with runtime PM (Rodrigo)
> > ---
> >  drivers/gpu/drm/xe/xe_device.c   |  2 +-
> >  drivers/gpu/drm/xe/xe_device.h   |  4 ++++
> >  drivers/gpu/drm/xe/xe_gt.c       | 17 +++++++++++++++--
> >  drivers/gpu/drm/xe/xe_gt_types.h |  9 +++++++++
> >  4 files changed, 29 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index db0b883322ef..c7d8aea56f58 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1436,7 +1436,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
> >  			    WEDGED_URL, XE_BUG_URL);
> >  	}
> >  
> > -	for_each_gt(gt, xe, id)
> > +	for_each_initialized_gt(gt, xe, id)
> >  		xe_gt_declare_wedged(gt);
> >  
> >  	if (xe_device_wedged(xe)) {
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index 83d6dafab53c..80bda9b548d5 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -139,6 +139,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
> >  	for_each_gt((gt__), (tile__)->xe, (id__)) \
> >  		for_each_if((gt__)->tile == (tile__))
> >  
> > +#define for_each_initialized_gt(gt__, xe__, id__) \
> > +	for_each_gt((gt__), (xe__), (id__)) \
> > +		for_each_if(READ_ONCE((gt__)->initialized))
> > +
> >  static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
> >  {
> >  	return &gt->pm.fw;
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index bc9bf6f0b5a7..d85406ba6f06 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -175,6 +175,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
> >  }
> >  
> >  static void gt_reset_worker(struct work_struct *w);
> > +static void gt_wedge_worker(struct work_struct *w);
> >  
> >  static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
> >  			 long timeout_jiffies, bool force_reset)
> > @@ -546,6 +547,7 @@ int xe_gt_init_early(struct xe_gt *gt)
> >  	xe_gt_mcr_init_early(gt);
> >  	xe_pat_init(gt);
> >  
> > +	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);
> >  	return 0;
> >  }
> >  
> > @@ -724,6 +726,7 @@ static void xe_gt_fini(void *arg)
> >  	struct xe_gt *gt = arg;
> >  	int i;
> >  
> > +	disable_work_sync(&gt->wedge.worker);
> >  	gt_reset_worker_disable(gt);
> >  
> >  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> > @@ -784,6 +787,8 @@ int xe_gt_init(struct xe_gt *gt)
> >  			return err;
> >  	}
> >  
> > +	/* Must be last */
> > +	WRITE_ONCE(gt->initialized, true);
> >  	return 0;
> >  }
> >  
> > @@ -1204,6 +1209,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
> >  	return NULL;
> >  }
> >  
> > +static void gt_wedge_worker(struct work_struct *w)
> > +{
> > +	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
> > +
> > +	guard(xe_pm_runtime)(gt_to_xe(gt));
> 
> As this runs on GT ordered WQ, I'm a bit unsure about this. I'll rely on
> Matt's input on this.
> 

You can't take a waking PM reference on the GT ordered workqueue, as the
entire workqueue is in the reclaim path. Lockdep will complain once we
eventually annotate the workqueue as reclaim-capable [1]. I agree that
this work item should probably hold a PM reference, but we should follow
the same pattern we use for GT reset [2].

Matt

[1] https://patchwork.freedesktop.org/patch/711929/?series=163245&rev=1
[2] https://patchwork.freedesktop.org/patch/682622/?series=156292&rev=1

> Raag
> 
> > +	xe_uc_declare_wedged(&gt->uc);
> > +	xe_tlb_inval_reset(&gt->tlb_inval);
> > +}
> > +
> >  /**
> >   * xe_gt_declare_wedged() - Declare GT wedged
> >   * @gt: the GT object
> > @@ -1215,6 +1229,5 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
> >  {
> >  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> >  
> > -	xe_uc_declare_wedged(&gt->uc);
> > -	xe_tlb_inval_reset(&gt->tlb_inval);
> > +	queue_work(gt->ordered_wq, &gt->wedge.worker);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 628911346455..c00a7c171f80 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -233,6 +233,12 @@ struct xe_gt {
> >  		struct work_struct worker;
> >  	} reset;
> >  
> > +	/** @wedge: state for GT wedge */
> > +	struct {
> > +		/** @wedge.worker: worker for GT wedge to be done async */
> > +		struct work_struct worker;
> > +	} wedge;
> > +
> >  	/** @tlb_inval: TLB invalidation state */
> >  	struct xe_tlb_inval tlb_inval;
> >  
> > @@ -419,6 +425,9 @@ struct xe_gt {
> >  
> >  	/** @eu_stall: EU stall counters subsystem per gt info */
> >  	struct xe_eu_stall_gt *eu_stall;
> > +
> > +	/** @initialized: GT is initialized */
> > +	bool initialized;
> >  };
> >  
> >  #endif
> > -- 
> > 2.43.0
> > 
