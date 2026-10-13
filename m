Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560DBCC6B1C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A78D10E2EB;
	Tue, 13 Oct 2026 18:50:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33DD10E2EB
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791917405; x=1823453405;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+ZsU3h0LZEcrnFkOB799g8KKZn/vTwXiAKx0a+UmHpw=;
 b=hOA2Bzbq4D6Bs8jt4kA7mYhkyYjWkTelyk80IPh8VlwQxnVg4R6dRtgO
 uihZZut5UITzqjmxsXyHj0vz1OFPwb1BEEum9zRYNxl59tgRPaALob2Kn
 0KuFJvX4cgcUZhbeyZC6Bk0jKx3pMX58hticJ4axvoxfj31Rk7dpjHCQC
 bS6OouaqaOEn9ocfVALdVA2ZXYVamZB3cZ0AWXl2Id1aF2tKuyh1kPhSY
 Nvvlbnk8oxfrWC+k/qb3KEanYdNcnfF8Vqt2jOqXu+cdanOdcGoZS20ZI
 nJfOTcjIVIU/tqm7FG2BxGW/4/G1nKRP4E1pie+0d2q8Soeoeu1Y+RScX Q==;
X-CSE-ConnectionGUID: BSz9rwmZSua+6ihHC2ukqw==
X-CSE-MsgGUID: qlgAd6jHTZGFLMicxgqJIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="646952"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="646952"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:04 -0700
X-CSE-ConnectionGUID: g+8dBYFhQjSpgxDHg+tqtA==
X-CSE-MsgGUID: 6YphtGsaSdWSXVLnhwCuaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1295421"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:50:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 11:50:04 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.57)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:50:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExEGT84t+pJ3MYM8A3owinEEGP7sXcKezFzyGtKn+dq+VWHLw1H0HfFTIATEObvu2ZuXSGEx/1bA4NczMEhG8zOlftu3zSC1Nm1MdY0nSXf6gsEhXDA/3R2OQzfzRLXk9uXaw7/2pGrFUInMvk/fbqSPIe8CylvY6OM9ritM0quCFQQuPNRvanywYiA6X5yfsSEFAoVSc/wgNIGib4EZmgPoYzdK0emelyObey8j0Qc+D3aiYtJY7oY0p8PT7qnaFSHt7MYco4vvKO4dFaBQGbzgHfksOwNrOGMf1NHodvUZSb8KBn8jHpif2+sev7blVJFylmRjPAUgBj8OdM/haQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzXe4BylNM8ehfkQrFHuVU4uocmLdmsMWxmOe6vM2O8=;
 b=VT2Wy1b4ttpMttR030+zywyY64jGWU/VviOOzxwza2ZeSR+AZFSbL1lDgbMPS0RFef4XIZYUmi8Hiz6BDITzd8s95GbdaQTdBN2EI1iSmPNmNbd1SuH2+HIYpCoZTi/j4KKUtpSFllXuXI2AJKPIzOvGDI6oyl9ku4U4I55HeLS7qGEOEFWG5vCC1lTjLadNEo79y0RrkhnalYjcct6GV7d+VE1mc85EsicWwjECBei8XCE6b8bfcgnNRJc9FirchNSEejRcIdy18eG8YWYhW6PDQhzBkKh5z4RUoP5Z5df1xyADsEsKEcbSsQZpnabYRW6AKGCMllkB/PJkiHAVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SA2PR11MB5099.namprd11.prod.outlook.com (2603:10b6:806:f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 13 Oct
 2026 18:49:58 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 18:49:58 +0000
Date: Tue, 13 Oct 2026 11:49:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <lukasz.laguna@intel.com>, <matthew.d.roper@intel.com>,
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v5 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
Message-ID: <as59U8Fmp2fDcYIo@gsse-cloud1.jf.intel.com>
References: <20261013110439.181447-1-raag.jadav@intel.com>
 <20261013110439.181447-2-raag.jadav@intel.com>
 <as54eD2FDuQdiT6b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <as54eD2FDuQdiT6b@intel.com>
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SA2PR11MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: c8784182-4bef-425b-de0f-08df295ac74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|261009223027099003|4143699003|56012099006|10067099003|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3bjBbxna39eb7+PSNJfvhLkFuka+8r3YxtHwM+1iQkW7HJ8tBrQjxFilEF+Eg8Z4SwHFjb0B9vxhc+7qiR+e/qEQa7Y/cLyhAGq7P1YAIf3HHbpBU22csFjBhH6yWM8RuO4z2hSJBtI1nuLkd4muIEl4kYPEwhuLMscCaAMDj0w537HpzirMOLKA/NZwm5KVIP+vzi3vFyrlCuMMotouy/Pp1mqFe50C2cabtOmdo9DAhjViWJDYE4PivkDNJHZ/aFwB+NKabbr6enmCoWfoaV3gm3wLsLPKDyKumnqbPQeH2DyFnNrCRBRGOoLwWiA+i9nUdYP4LK/s4XhiY9koyGGEVjr8lZRZ6fEEmmpMBaqCd0mY/9jE7pePmFLTRyRzM4YKQWuHmKHK5TKL6/FeBaDen7gG2/N9SeDmW2FlZgMoMZWHDLkAHWwDJGrx1H5LlBEHAot7WghBliKUoFx1xRLt6t6dOvECPpGbLHoIDtJ6aFzgtWz8h1MBvJ5eNjW1aDTliKnE2D5Dw196fEM3VDIOLRs1ZbtodSNT01GPafDIVnMz6NgnUuYTE2YGva3GLZNfajSacVldsrM10EPc4OejCB+7z0WX0d18bZWjrterMsJiwl1sQLD9eOaDSij8Se9yR3ywV37EgKFNB/xwxWdldftkXnQRnRlv5JRlKvk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261009223027099003)(4143699003)(56012099006)(10067099003)(6133799003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m4Lq/CDagt5JN0RfdNBNthgnPTqMQe7yLVksmczo9JvKQQsGLWpg8J0Klv83?=
 =?us-ascii?Q?Rhk6/KGQglLhRiNfLp9cVi0UTpvo3GxJkhMqKdiaJ3JbiSI3d2klSZAUZ5WU?=
 =?us-ascii?Q?c22fIKW3nW4rN+DGaAZyoP9AI9eqEifKeAGlcM0I+bYgOlejtBjJ0EdAIv9R?=
 =?us-ascii?Q?Do4Sw8shEZiXV4G7Yxcvwzmn/LhphXSKX2LGR9+//gSg5c2uE9ffTx/cNeB8?=
 =?us-ascii?Q?D2yBm1aFhBOkVFYdevzreQGL9LRUFwB+joZf+NKVDQBsA3wItPEWQiiiI+sJ?=
 =?us-ascii?Q?89dO9g9G4WfS/2fGapU1VTOpSyZcTc+K8p5hdwNUdTbqe8GfzKOAv+8Eg1ov?=
 =?us-ascii?Q?Ar53WjD9/27LL8+uU1q2owngsyfd23xJuWY2dnJy9kagDimFEmiA8DVAE3yL?=
 =?us-ascii?Q?nXj9724I5e1WGoDFbrbJa1xOLc07Zg75yt36ZQaVe7UYs5mYQoJ3aCg27vAx?=
 =?us-ascii?Q?SibjHrW8xCJ+sKCMOJ+AIC2aR35eWI/QxAjrH+tCAkd3d68ckPmZhy5DLlQu?=
 =?us-ascii?Q?gtqsgrws8x47vIMCoS+2U6xeATXJGe0kpaJ48WP0XOTwcnabABN21tphzCkE?=
 =?us-ascii?Q?pb5KAgHRcwB98dfSPd/uKPy3iYFaRABm2U0Ue8Pk2MG7jH2m9M+b6EvVw96B?=
 =?us-ascii?Q?NrN5bwzl1xah02A/pNikkMp8b0GpaNe7puh/1p6U6+u5fKgPZDIMwJXWv4E1?=
 =?us-ascii?Q?zVjBb7TOu74Egjmv/8+Pln52vPvuGXQ0Sue6hnOYjDU2T/8CMD4xVQwtc8nd?=
 =?us-ascii?Q?oNWPR9/JAEh87RE/vyivKxCUlh7cY4Lt/QWj1FO3HaNRfghY3v3KloeaYYbk?=
 =?us-ascii?Q?y2xb59U8F5rIcPS4F9fsU9pWEQGyjkMYwY4GZwpcv9dPjEtmCOfJwOAiZYD3?=
 =?us-ascii?Q?i9z4Wje7ImQ6VN3sWA4K2YT39ktdy7Ogjns4aZMOIm508E/ELGoTgwjQweGa?=
 =?us-ascii?Q?cJlY/qXueQjKlLtakklwyQu1mc3hSVV3jPwp84qaWxbvalcscueeyL2CtmLc?=
 =?us-ascii?Q?8li4APJ9mIjIoV/VRPmY7LWCI91hSoqXcmRJEh5RrFfLC54H/sbcQCxNom6N?=
 =?us-ascii?Q?0bmz0DUbdy8YadRjOhnfJf+I42FN4aRYkm21PvMhAwEnXeZHQjXTvlYr8vvc?=
 =?us-ascii?Q?vyAfUjQHsd5rTNG5uHIdZgf+3G3o+TIeLoC3ERpEKdp90pMoG9qymwbKQidC?=
 =?us-ascii?Q?KkDz3U6ZILZXUu8HekXSolBW29m0BZC+3jk2Kb3fws0oY0erpik6ycNjPBMF?=
 =?us-ascii?Q?dAFOCfYGYPF0GERR6m4VvXQTxxvSpwCdQjdh+XvVdC5w8tuAaCMFCdccT4yv?=
 =?us-ascii?Q?SadivlFbu7gEsE8zF96VLjONg+ucAzu2QcTtskGh5gzMtVOPA+dF7nKllYn5?=
 =?us-ascii?Q?DgiJM3caFenDfkYdlIhW+vejZKgTNHezM6RLjDYUdefINOmW6o8AouvuPDlK?=
 =?us-ascii?Q?JKXnMYceVSp2vJLcrBw6OObltwq/U/3YF0dmJ3zEXmRVXz/CGTf7yYGc143U?=
 =?us-ascii?Q?/7BzJS4vYl2y6fjeM0Uouax0tyUr1jH/HOlx8aRhhAPHZ+oYnCwGfEq3bGfR?=
 =?us-ascii?Q?zv9yTdVX3Ma7rvd8hfusfP/ztNzKC9wKyk22JhwntQevccrTnw4wi8L3S4W8?=
 =?us-ascii?Q?ireAGkWF5kA9nyM5KKvONqnkJGEqM0oc4eLVz+u8ECyAp2su6+9XiPndri+K?=
 =?us-ascii?Q?ZDdINpI8waCfivTp4rOqwEe7SplqEKFDijwtx3yOHzKXs0cjWgQGr7HaAbiT?=
 =?us-ascii?Q?F/N4S1YQOa4Hk8S/jFRSfrEOc1ofI1U=3D?=
X-Exchange-RoutingPolicyChecked: 5He2N3Pi9EBsiT00OiVh0u4KrqG/uSV5NRcIakTF0Jsit2/H/791SLrG4PjYNnzHMx4bz1dx7xWvfphmaEYGq6bAcUxo0omsfJcuJAB89wmrB10T3dzIAziVcXQNXATJc4Bx6Pn9YW10s+xuzyhojE9oEsjxnXsYVMOYTFE9lwzy+TSsJFDHhlLc+HDZp7Nmml31Ofa7bU5LGj4SMsfV3x+j+5vEK5pkQWFqrgvRILpKZ1C3dNpuoWNU7uPYJwFA7aZib2s6MAfm6GKja9Kd2fpKJZc3PEzbXDJO/BT7GnNJ5/7XpRwOUDfm8KHh4E2PDij2v+Aps3Nx2AyE9HV8FA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c8784182-4bef-425b-de0f-08df295ac74b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:49:57.9513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/uThuZWyDAVGeoo7HbK3Kshjsbk4AoDVpCMP9GjSerquYZyMBjSjoaUtutxifc9PDpPsh7STYcd3tltU4Li+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5099
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

On Tue, Oct 13, 2026 at 02:29:12PM -0400, Rodrigo Vivi wrote:
> On Tue, Oct 13, 2026 at 04:33:53PM +0530, Raag Jadav wrote:
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
> > ---
> >  drivers/gpu/drm/xe/xe_device.c   |  2 +-
> >  drivers/gpu/drm/xe/xe_device.h   |  4 ++++
> >  drivers/gpu/drm/xe/xe_gt.c       | 18 ++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_gt_types.h |  9 +++++++++
> >  4 files changed, 30 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 8392c9fad3c4..22ae10958d7f 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1432,7 +1432,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
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
> > index 775c826b68b4..4e047cfaf603 100644
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
> > @@ -706,6 +707,8 @@ static void xe_gt_fini(void *arg)
> >  	struct xe_gt *gt = arg;
> >  	int i;
> >  
> > +	disable_work_sync(&gt->wedge.worker);
> > +
> >  	if (disable_work_sync(&gt->reset.worker))
> >  		/*
> >  		 * If gt_reset_worker was halted from executing, take care of
> > @@ -725,6 +728,7 @@ int xe_gt_init(struct xe_gt *gt)
> >  	int i;
> >  
> >  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
> > +	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);
> 
> perhaps this should be in the gt_alloc or some init early?
> 
> >  
> >  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
> >  		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
> > @@ -769,6 +773,8 @@ int xe_gt_init(struct xe_gt *gt)
> >  			return err;
> >  	}
> >  
> > +	/* Must be last */
> > +	WRITE_ONCE(gt->initialized, true);
> >  	return 0;
> >  }
> >  
> > @@ -1010,6 +1016,14 @@ void xe_gt_reset_async(struct xe_gt *gt)
> >  		xe_pm_runtime_put(xe);
> >  }
> >  
> > +static void gt_wedge_worker(struct work_struct *w)
> > +{
> > +	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
> > +
> > +	xe_uc_declare_wedged(&gt->uc);
> > +	xe_tlb_inval_reset(&gt->tlb_inval);
> > +}
> > +
> >  void xe_gt_suspend_prepare(struct xe_gt *gt)
> >  {
> >  	xe_uc_suspend_prepare(&gt->uc);
> > @@ -1200,6 +1214,6 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
> >  {
> >  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> >  
> > -	xe_uc_declare_wedged(&gt->uc);
> > -	xe_tlb_inval_reset(&gt->tlb_inval);
> > +	queue_work(gt->ordered_wq, &gt->wedge.worker);
> > +	flush_work(&gt->wedge.worker);
> 
> This flush serialize things, but apparently it deadlock somewhere else now.
> Perhaps we should avoid this one here and instead flush for each gt in
> pci disable case.
> 

Good catch - I misssed this.

Yeah, flushes are always dangerous. I'm guessing the deadlock is because
some locks can be held here that are also taken on `gt->ordered_wq`.
This code can be called from IRQ context, from the ordered workqueue
itself, or from the DRM scheduler submit worker. All of those
possibilities are problematic, and even if we somehow got this right
today, we'd probably break it again later.

In any case, I agree that we should drop the flush here. If we need to
serialize against this work being in flight, let's add a serialization
point elsewhere and, in teardown paths, disable the wedge work item
(although I haven't fully thought that part through).

I suspect that any path requiring wedge serialization also needs to
serialize against an in-flight GT reset, VF migration, etc., and we may
be missing code to handle those cases today.

Matt

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
