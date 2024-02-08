Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00F4C4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 15:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09A510E90D;
	Thu,  8 Feb 2024 15:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqsamVJq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4EC10E90D
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707406494; x=1738942494;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QjfdGuVpfLl14wFDmVj+h9I14eJTkMP8R6EZarZunU0=;
 b=gqsamVJqdE1mV5RYxhNLRCCMQM1wUmmzSQPXrkNUTVynG2jE/2FT/gWk
 VFq5HRpi9nFVdwiGV/zwastijAWwXHH06x15sregEd5qFtlJRPdEYS8Zo
 tBW/3IAYot1Fw+LG7R/jugSxnS0TZUxk0KRy85gvu72fFgd+22eW3VUDt
 IPNnxzeY+g6hcNxXZ8NvofVVz+rLaWceytsPxt5vDa6SHp6cFiY3D8YMv
 i6Uoysadw7cN1x6fzAnoAX3elTZVkGi5PfiYlCLndAl589dEAq+GZmFQj
 RJt+dhxRu7Ug1Pe3+PnECtr/9RXv+m12hTRboEslfUrGf4mtivisYVc78 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="23720608"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="23720608"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 07:34:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6337358"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 07:34:51 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 07:34:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 07:34:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 07:34:50 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 07:34:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNJr7gGIR/u/i9tWi2D3vmkvnY3HqAB7jw/s4kwownajs6Z6C42i2VBPtUAWu7Gb0pK37YB3+oqqqeW13xknvKRreik08CTAwJmeyv3AalI8nNVd6wyIz8yd8sTKooYd0Pey145z1d0J21x4Xx0m86/sNEC8pPxAaRQEICq+B4XoGwA3NUiP+3fjx7vGQ8LFBqK+Fxl+MVFSEOkWGQ8/aKegWWH1baBsP+0t+RgadT5hKVz6OjkkS9hhkV/V9Gbz0BJqD/1wwai/h7OgFAOMCyfgXk22f7sUwSMjSmMpD0fIKjQFNmUmhI9EcnKtW152/reZK6xvk3MVpfiMRodv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ar3ReIjS2F8iWcG5UUaJtTKbEaSXVGfuT7ZngKlg20=;
 b=mj8viie8b4H+tWafuyC3YXhEY0Xv2it/VTWM9L8SxX6M3RUAGwqBtwr76ApX5cEba3sQj1aOufCkB65aODxviWPwZHyAVs45Ol0wUNqw0N5H9aKjQ1c4VQUcZYvuy9FVSFFOeihZMSKRcq6lVzfbJqZCeRm0NTGcrFRivpinoGJpr2JaLPSkJvoPXyRnPvjo5HLXuqijO9Pt0R+8j7CaVGn/UfZ4cATtuNleHFFjFtshQXGRbhfDEi21eLYRbehm34ovon6jKPdBWkuPWTLzugcgZS+3YDY35saVXaFsq8KLQBvC29TNGEFKqbbcOByZJ8AGSmriNRWmWkEt7o+N2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7371.namprd11.prod.outlook.com (2603:10b6:610:151::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37; Thu, 8 Feb
 2024 15:34:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 15:34:46 +0000
Date: Thu, 8 Feb 2024 09:34:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Remove support for persistent exec_queues
Message-ID: <otvidki36j6hyxvrz22e6eimxysqqmkz6zwscgkc7cllfeksyv@5ghkjyf2oxbl>
References: <20240208083845.4303-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240208083845.4303-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:74::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 156dbbe8-9f3a-4c6f-fb80-08dc28bb7aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tw1pLrcdfixzbEgg5k5Hr22/uV+lyTH1X9027pGiX1TxxBxJJpc9d81ufWbvLIyi1AI+qh3P27oz9EOQAh7QynCCCABhg4dYKm1YAu98yfNaiYJvddN7syilbfVE8yPOm6oHkQQYwm/SmyN9M/PvrY5KbxnYcQVz2IHuF1G1P0jdiiU5J1sAIdvTfe5G9NrOsgwUpFZwlpabwQOljSHsiFXOaY5e+1LgFaUzbXbyO/fRW8U9PjJ24diRpVBjz8H+Oz2JutQsoXon401FlQOt/Z6s30gt00qaVEaG29Fnl5YtOVLyskM1wly+Uf8Owwtyg7MJL1u/2IcmQj6AKRe0vPqfYGNin+9m/eqrZUd2pboZX24GnX070/K7ZPi0/5sCBJsf22LZTaBQX+eTcQyPTMrwpWGuPor4NoJi/GtwaCRjm9pl70X9Mp4cK83N/EIDv0Dm/NYL0Zs+dr6v1r/BjCTXn9Il7wIM98KZBRltVASKIqgOOquh+iadSsKhG3eUAx7J8l3rZQNkWGZTaXmx0N5gCzs+cdoFJHQzd5dBzwMld/kn3tKqEA2NKG72Vlsk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(366004)(376002)(39860400002)(136003)(230273577357003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(478600001)(6486002)(82960400001)(83380400001)(9686003)(30864003)(86362001)(2906002)(26005)(6512007)(41300700001)(33716001)(66574015)(6506007)(6916009)(316002)(5660300002)(66476007)(66946007)(54906003)(66556008)(8936002)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EIVQzcmp7T6ZST/cs9GiJB2T1PQbHmP1Az8eLh099SrsL4b1V0BYaXxVXX?=
 =?iso-8859-1?Q?JZxxS5kYOh/1JMGfMS4h8Rg67Hio6xK7k/nEJysu0/QaMG3prH4Zvrlt+g?=
 =?iso-8859-1?Q?Y/85aItWQM2gP7OFi2LGmaC2Hu2sRkw7aXvn/X+l/mZFu2AyvtM3U1+Aa6?=
 =?iso-8859-1?Q?u0+XYd3q1d4EOOuxe4EpAhk/4pRUE1YRACi38HPf7fJCgTg216gJ1R+GSD?=
 =?iso-8859-1?Q?ZL2ceq25gjFTh+eK5DerOlMROEe19YQew63eoqP5mt6Tq/J7PKt1nvpn+s?=
 =?iso-8859-1?Q?aS8nKbQDtDBPhsUDw5tMdiYY5f98T8O/6UZnIZii+SORpJBfZFouOJiEgJ?=
 =?iso-8859-1?Q?T76AWU7oWhT9mygVvjf2JW7tla0vvJSC8RmmF2bUSFIKaYdZe+XpiHS+V8?=
 =?iso-8859-1?Q?TgRdGRE0pyVmgpR+Kg/Ww07wGQux5GtNH8lVv6Hrbbn/ZJ3Z7L5hCTjWfp?=
 =?iso-8859-1?Q?4h7mJcpV+wRRj2NRj024BftxnKbvKE3IVl34cUOZD1DMyl/mACFb2dFVri?=
 =?iso-8859-1?Q?bhSS0nyDQt8fL9w36YFrCUsaZbNDP1Z1cH/KnlIgE9gnCtmRTPRd6SoJT+?=
 =?iso-8859-1?Q?9MSK3htqAYONx6nEoy5js7zwENxn9Bro8JaySAbmTkKWA4eKC/ADrgbG06?=
 =?iso-8859-1?Q?Uuy3tOMSIeD6m9Ieygif6fxWD2OHpGHgll6pcvLrE9xAj5VyYRF72zA/1U?=
 =?iso-8859-1?Q?lNcw/9PoivbQzFTcmmO7is9yY/45ksRulF4cI8zfK4YV+xdRccG0fIlnvc?=
 =?iso-8859-1?Q?qG+8P0ZR9sgAipVayd4gbGT+pvrKvy7+D7dCros4Mm/ulNA6ILAcYlFyZt?=
 =?iso-8859-1?Q?8nCYTXW/iiqqQf1J7lSp52pLrvWFxEcxUwnJ7Xi8qRmUjeQGNe1Vm88vBO?=
 =?iso-8859-1?Q?tyeUC8L+kP/O9n7OnGX+4UBtkpaKHVXYfTia8Ak16ZEnj9oZNFXJiDNfZp?=
 =?iso-8859-1?Q?5RFIG8MPJcKGHX1JVjT23Co+M/lJIRpNXVNmVyGFVbr0+yBQa07HZw3urQ?=
 =?iso-8859-1?Q?7dlQg8wXGfSHtIkEpSBCp1gSUhOdYdZNcjQszH/kiX3LRUjuqcy6xh1Tzc?=
 =?iso-8859-1?Q?F03G6LU2PsVv7oPn1UO/A10n7wEjAjbmN2ZT7AMpvPhfixVmTSqDv5r2z8?=
 =?iso-8859-1?Q?4LusC89IcdRBlwLqTKPECzQFExurBvIDDOqSZkmm4yDxDlfcpVbISo1EFh?=
 =?iso-8859-1?Q?j/UZOegHS2z/jq7yGw2jRT17vh7Bd6ELBzr0PHavX+qITnbIg3mHsoOtss?=
 =?iso-8859-1?Q?cpcJzi4k5BLrQROxbaeeJ87AQn8I26uUFCHuLWxqGHXdAgJaJpswciqfsz?=
 =?iso-8859-1?Q?PngHhcQu3An9ydw74HtlvEvELyqWTwaNvDK9RW6gBcbkWhXF+y3wC+xNa+?=
 =?iso-8859-1?Q?uaNHwQOi4ojn1jwKmHLE+8DxkqlkWTaqaHBXNMCqhCPEpeId1zZWvPYpBn?=
 =?iso-8859-1?Q?jE0RDiM7AW9mpwfKE2L0xqOS+XpHQFgC7KXxC9mKA0fjhxTkUVIGqblj72?=
 =?iso-8859-1?Q?TYD7kVyttfM9gGBoLMOQEVY/bH+3KOy0OLvCzO6tMDaSrmbBsv/Iabqxzq?=
 =?iso-8859-1?Q?n5GRXXj7mjjK7lM1anKhnpVHxncFuOIoP1h7qmDqiaJmNadRWsamRGzyK9?=
 =?iso-8859-1?Q?dps6RLl5RNVfPONJL3995kL+aJMydvec4Umi+Gb7pFaUjHfTpiA2zKIg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 156dbbe8-9f3a-4c6f-fb80-08dc28bb7aea
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 15:34:46.8670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1QmYi3bpZ+rGxYC0D7jDQQGUsorvAhbDpwZtbbcrYABTxp5qJxK93DQAD8RNiuz3s1Jau9TN1YEAe2JaA/YIRPbzt3EWf3UZI1QwqzLPVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7371
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

On Thu, Feb 08, 2024 at 09:38:45AM +0100, Thomas Hellström wrote:
>Persistent exec_queues delays explicit destruction of exec_queues
>until they are done executing, but destruction on process exit
>is still immediate. It turns out no UMD is relying on this
>functionality, so remove it. If there turns out to be a use-case
>in the future, let's re-add.
>
>Persistent exec_queues were never used for LR VMs
>
>v2:
>- Don't add an "UNUSED" define for the missing property
>  (Lucas, Rodrigo)
>
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: David Airlie <airlied@gmail.com>
>Cc: Daniel Vetter <daniel@ffwll.ch>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Francois Dugast <francois.dugast@intel.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I think you missed a review comment from Niranjana. Should add this diff
on top:


| 	diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
| 	index 648391961fc4..a695f97ac0f3 100644
| 	--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
| 	+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
| 	@@ -105,16 +105,6 @@ struct xe_exec_queue {
| 			struct xe_guc_exec_queue *guc;
| 		};
| 	 
| 	-	/**
| 	-	 * @persistent: persistent exec queue state
| 	-	 */
| 	-	struct {
| 	-		/** @persistent.xef: file which this exec queue belongs to */
| 	-		struct xe_file *xef;
| 	-		/** @persisiten.link: link in list of persistent exec queues */
| 	-		struct list_head link;
| 	-	} persistent;
| 	-
| 		union {
| 			/**
| 			 * @parallel: parallel submission state

with that,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device.c       | 39 ----------------------------
> drivers/gpu/drm/xe/xe_device.h       |  4 ---
> drivers/gpu/drm/xe/xe_device_types.h |  8 ------
> drivers/gpu/drm/xe/xe_exec_queue.c   | 36 +++++--------------------
> drivers/gpu/drm/xe/xe_execlist.c     |  2 --
> drivers/gpu/drm/xe/xe_guc_submit.c   |  2 --
> include/uapi/drm/xe_drm.h            |  1 -
> 7 files changed, 6 insertions(+), 86 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 5b84d7305520..1cf7561c8b4d 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -86,9 +86,6 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> 	return 0;
> }
>
>-static void device_kill_persistent_exec_queues(struct xe_device *xe,
>-					       struct xe_file *xef);
>-
> static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> {
> 	struct xe_device *xe = to_xe_device(dev);
>@@ -105,8 +102,6 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> 	mutex_unlock(&xef->exec_queue.lock);
> 	xa_destroy(&xef->exec_queue.xa);
> 	mutex_destroy(&xef->exec_queue.lock);
>-	device_kill_persistent_exec_queues(xe, xef);
>-
> 	mutex_lock(&xef->vm.lock);
> 	xa_for_each(&xef->vm.xa, idx, vm)
> 		xe_vm_close_and_put(vm);
>@@ -258,9 +253,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> 			xa_erase(&xe->usm.asid_to_vm, asid);
> 	}
>
>-	drmm_mutex_init(&xe->drm, &xe->persistent_engines.lock);
>-	INIT_LIST_HEAD(&xe->persistent_engines.list);
>-
> 	spin_lock_init(&xe->pinned.lock);
> 	INIT_LIST_HEAD(&xe->pinned.kernel_bo_present);
> 	INIT_LIST_HEAD(&xe->pinned.external_vram);
>@@ -599,37 +591,6 @@ void xe_device_shutdown(struct xe_device *xe)
> {
> }
>
>-void xe_device_add_persistent_exec_queues(struct xe_device *xe, struct xe_exec_queue *q)
>-{
>-	mutex_lock(&xe->persistent_engines.lock);
>-	list_add_tail(&q->persistent.link, &xe->persistent_engines.list);
>-	mutex_unlock(&xe->persistent_engines.lock);
>-}
>-
>-void xe_device_remove_persistent_exec_queues(struct xe_device *xe,
>-					     struct xe_exec_queue *q)
>-{
>-	mutex_lock(&xe->persistent_engines.lock);
>-	if (!list_empty(&q->persistent.link))
>-		list_del(&q->persistent.link);
>-	mutex_unlock(&xe->persistent_engines.lock);
>-}
>-
>-static void device_kill_persistent_exec_queues(struct xe_device *xe,
>-					       struct xe_file *xef)
>-{
>-	struct xe_exec_queue *q, *next;
>-
>-	mutex_lock(&xe->persistent_engines.lock);
>-	list_for_each_entry_safe(q, next, &xe->persistent_engines.list,
>-				 persistent.link)
>-		if (q->persistent.xef == xef) {
>-			xe_exec_queue_kill(q);
>-			list_del_init(&q->persistent.link);
>-		}
>-	mutex_unlock(&xe->persistent_engines.lock);
>-}
>-
> void xe_device_wmb(struct xe_device *xe)
> {
> 	struct xe_gt *gt = xe_root_mmio_gt(xe);
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 462f59e902b1..14be34d9f543 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -42,10 +42,6 @@ int xe_device_probe(struct xe_device *xe);
> void xe_device_remove(struct xe_device *xe);
> void xe_device_shutdown(struct xe_device *xe);
>
>-void xe_device_add_persistent_exec_queues(struct xe_device *xe, struct xe_exec_queue *q);
>-void xe_device_remove_persistent_exec_queues(struct xe_device *xe,
>-					     struct xe_exec_queue *q);
>-
> void xe_device_wmb(struct xe_device *xe);
>
> static inline struct xe_file *to_xe_file(const struct drm_file *file)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index eb2b806a1d23..9785eef2e5a4 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -348,14 +348,6 @@ struct xe_device {
> 		struct mutex lock;
> 	} usm;
>
>-	/** @persistent_engines: engines that are closed but still running */
>-	struct {
>-		/** @persistent_engines.lock: protects persistent engines */
>-		struct mutex lock;
>-		/** @persistent_engines.list: list of persistent engines */
>-		struct list_head list;
>-	} persistent_engines;
>-
> 	/** @pinned: pinned BO state */
> 	struct {
> 		/** @pinned.lock: protected pinned BO list state */
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 2976635be4d3..c2bcb5735e7b 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -60,7 +60,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> 	q->fence_irq = &gt->fence_irq[hwe->class];
> 	q->ring_ops = gt->ring_ops[hwe->class];
> 	q->ops = gt->exec_queue_ops;
>-	INIT_LIST_HEAD(&q->persistent.link);
> 	INIT_LIST_HEAD(&q->compute.link);
> 	INIT_LIST_HEAD(&q->multi_gt_link);
>
>@@ -379,23 +378,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> 	return 0;
> }
>
>-static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
>-				      u64 value, bool create)
>-{
>-	if (XE_IOCTL_DBG(xe, !create))
>-		return -EINVAL;
>-
>-	if (XE_IOCTL_DBG(xe, xe_vm_in_preempt_fence_mode(q->vm)))
>-		return -EINVAL;
>-
>-	if (value)
>-		q->flags |= EXEC_QUEUE_FLAG_PERSISTENT;
>-	else
>-		q->flags &= ~EXEC_QUEUE_FLAG_PERSISTENT;
>-
>-	return 0;
>-}
>-
> static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue *q,
> 				      u64 value, bool create)
> {
>@@ -469,7 +451,6 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
> 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
> 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
> 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
>-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
> 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
> 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
> 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] = exec_queue_set_acc_notify,
>@@ -496,6 +477,9 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
> 		return -EINVAL;
>
> 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
>+	if (!exec_queue_set_property_funcs[idx])
>+		return -EINVAL;
>+
> 	return exec_queue_set_property_funcs[idx](xe, q, ext.value,  create);
> }
>
>@@ -707,8 +691,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 			/* The migration vm doesn't hold rpm ref */
> 			xe_device_mem_access_get(xe);
>
>-			flags = EXEC_QUEUE_FLAG_PERSISTENT | EXEC_QUEUE_FLAG_VM |
>-				(id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
>+			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
>
> 			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
> 			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
>@@ -759,9 +742,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 		}
>
> 		q = xe_exec_queue_create(xe, vm, logical_mask,
>-					 args->width, hwe,
>-					 xe_vm_in_lr_mode(vm) ? 0 :
>-					 EXEC_QUEUE_FLAG_PERSISTENT,
>+					 args->width, hwe, 0,
> 					 args->extensions);
> 		up_read(&vm->lock);
> 		xe_vm_put(vm);
>@@ -778,8 +759,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 		}
> 	}
>
>-	q->persistent.xef = xef;
>-
> 	mutex_lock(&xef->exec_queue.lock);
> 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
> 	mutex_unlock(&xef->exec_queue.lock);
>@@ -922,10 +901,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> 	if (XE_IOCTL_DBG(xe, !q))
> 		return -ENOENT;
>
>-	if (!(q->flags & EXEC_QUEUE_FLAG_PERSISTENT))
>-		xe_exec_queue_kill(q);
>-	else
>-		xe_device_add_persistent_exec_queues(xe, q);
>+	xe_exec_queue_kill(q);
>
> 	trace_xe_exec_queue_close(q);
> 	xe_exec_queue_put(q);
>diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>index 58dfe6a78ffe..1788e78caf5c 100644
>--- a/drivers/gpu/drm/xe/xe_execlist.c
>+++ b/drivers/gpu/drm/xe/xe_execlist.c
>@@ -378,8 +378,6 @@ static void execlist_exec_queue_fini_async(struct work_struct *w)
> 		list_del(&exl->active_link);
> 	spin_unlock_irqrestore(&exl->port->lock, flags);
>
>-	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
>-		xe_device_remove_persistent_exec_queues(xe, q);
> 	drm_sched_entity_fini(&exl->entity);
> 	drm_sched_fini(&exl->sched);
> 	kfree(exl);
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 4744668ef60a..efee08680aea 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1031,8 +1031,6 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
>
> 	if (xe_exec_queue_is_lr(q))
> 		cancel_work_sync(&ge->lr_tdr);
>-	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
>-		xe_device_remove_persistent_exec_queues(gt_to_xe(q->gt), q);
> 	release_guc_id(guc, q);
> 	xe_sched_entity_fini(&ge->entity);
> 	xe_sched_fini(&ge->sched);
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 50bbea0992d9..ee4673d5d1c1 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1045,7 +1045,6 @@ struct drm_xe_exec_queue_create {
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
>-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
>-- 
>2.43.0
>
