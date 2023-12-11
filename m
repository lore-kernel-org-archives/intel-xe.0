Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F759C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 16:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505EE10E488;
	Mon, 11 Dec 2023 16:49:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3CA10E488
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 16:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702313351; x=1733849351;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gHPSZwhjxLHg76QwrBk/kihH6BX8ykYp4+EUMbG/xzc=;
 b=iOepwbJKSPUpvzkAxrZDhlu35wb6YiFHQValIkCkDkE08jZd9YPF7JTh
 LOqxSLeV+fHUDSmpuDICV1nF/Y+J5gQcRS7fO/W+57YubE2vPE64YCyvj
 upD4i8U0LLjyY2SKTWSkODeoVHM8B7YZj8oU9T+ek9m4Y/HY19sOl3LPf
 0NLseUnahBMM8lm23w5HQgoekvwGITdVI7hskrkq35BXZghpPojfUaJP0
 wlpAPsBjclX1m0jwP8JsU/l+1o5V6XUAQ6AYAzf6yLJAA3ol8ZhOO9Jet
 ThvTHPHTpA9ZYwCfYlp4OiGZ1c4nuelQ09+e86qTODvkqGqJv0p4jE09b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1748695"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1748695"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 08:49:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1020303473"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="1020303473"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 08:49:06 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 08:49:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 08:49:06 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 08:49:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cL515HrHLGnrVcGR8XdMSaQX3Av3Q8apOpkzdKZvHzi5iS0QyzFNrJkOBVXDe1mDaBR/+iZmZO/MaZ9Atr8oP+56etBkVOPXd7mL5Gz1xWwco+FQSkylKhmdJyFkwmDKg8flIAf7KgiBvSn1Id7wijALaEIawEDlKCkCkgRo5o24FqkFck969FojFy5XlFKvgomlInTm7WEXxOLrcp9AVTTBybnE+7VpSxlx3JB0YiyDblHaEGjOH3u5k+utQpVXY85Fx40GUChX9VBLS140+PARGSaspK6hEoonkVhJVlxOYfwfTgVcVUffVVM+dVHc9Fm3RrgaoyyOxHSJ7ZBbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTRrE7noG7xIKJlcgJwHm50kGgZvnL8IsYz4TCFopoQ=;
 b=jnxnjWUxTULu3q0TmcV18OAy2WrzLCuZA+JdrUQ9+oMSl5nDp2JwBO0EEjWt2oafw6rT9th9ZYw37/fR5IKaafP9g/fseDeHWVm914Z9akUyjuCnbpx0NN+TM0cKsYl4axwZLmyhTvaOIQGYCBfbifYJCRsMtTi7bEAS1us2HtETTrRtWBMlo75vcoBsV2oKic2BfLPxRfpxKghyN0w+rji1v3+CgJzLjp1BBvgHT/Ne15oBm+oDxaI2+ERCBpJ0sa0/Bwu2wDz/WVr+cAbKp6ahYfUZdLBV+rCt4VTBHIblUG1LFIwt+yPJIUi6hNA7+8+zf4Il1yFq2tiqVF9tow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5596.namprd11.prod.outlook.com (2603:10b6:510:eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 16:49:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 16:49:00 +0000
Date: Mon, 11 Dec 2023 16:49:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC PATCH 7/7] drm/xe/uapi: Uniform async vs sync handling
Message-ID: <ZXc9i98QKBNPE1u9@DUT025-TGLU.fm.intel.com>
References: <20231207055729.438642-1-matthew.brost@intel.com>
 <20231207055729.438642-8-matthew.brost@intel.com>
 <d7c25d14-fa14-4426-57a4-276675c7b2f9@linux.intel.com>
 <ZXLluT3zXZFEH8V3@DUT025-TGLU.fm.intel.com>
 <4a814fc8-6e05-c5fb-8ff5-492a6e14aebc@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a814fc8-6e05-c5fb-8ff5-492a6e14aebc@linux.intel.com>
X-ClientProxiedBy: BYAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: dbbd96dd-7d39-461a-2ee4-08dbfa691340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RpqxL/qsByqjqdF5BQ7e2iYmLzNGyucHkjswc1f9bDKs+Yg2wRdHI9pC7WbwckNpc9u9gMiYALGWyh8IOj+ezChssSANJJpsIAlsTqXFITVoO1vQQeoAg90rGhSvppCFx3phRVnYNeZnd0XTBxUGxzM1ENrKQ3buyjBZwSFKKJ0uaugDD+cvGCOyjSijwXcG9ncrIDkFcujzVlPz0oB6mrzo/+itImsGxNvmdu7IE0KkHKN7sTaNGrbqaR1+JzblfI7RchhRhPhYODeRKzXsqS/XnCKye0fXfppn7VVNX6FkiYXdGiG0J1R7EDwUHS4L0LJAiir4TCZrkHMuC5GfJkGM1vWv7cPqBhFgPC1mZBN0N8z3Zaq3UcFYH0mL3uuYCcUWnBM34VQC1VzqL+mgrVTcps0PHfxg6Jmd4ZesS4Ymj1644O6r41ycu7Pt/v+RjmVESh0nA+fKSy3/yS2U7IziIK2PH8nwwgMgHkm9SMAnVsjgec8RpNyOXPFd50NGhQBuWKlQc9mhklUAjiLAB2KCotZuJ7mI+no1OL4Oh6YIywTv1keHcoJP/M2LH66UEhADkQU7pjsMF8LE5lM6NVYLKIqUSBPmTkB7L8qyX34=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(30864003)(2906002)(41300700001)(38100700002)(86362001)(82960400001)(6512007)(26005)(6666004)(478600001)(53546011)(6486002)(83380400001)(6506007)(66574015)(966005)(4326008)(5660300002)(44832011)(316002)(6916009)(66556008)(66476007)(66946007)(54906003)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kM7BvzgFZRRMjWW9k3NAIkXStSo5hcoyPc6qSiea0B/MI/NY3WpH50UnsW?=
 =?iso-8859-1?Q?+lp6GH+MNLXmwyPBFAylaKETDI2I9pXJn1wfdZmDTgClHHeaExivIpaiJc?=
 =?iso-8859-1?Q?89sMToQ7vS2injiyeHmM00QPKbBLKqTJq7l3ycW9VOBxUcAaOKoONZRZsI?=
 =?iso-8859-1?Q?IrztcSdFSWiuvwHd4ZiQFwfrckGptK1F9qVPLspzE56BrYfE+sXqv29xMH?=
 =?iso-8859-1?Q?q1DS76xgQvmcCsERnf5fFA57zh/beBkUv7egrCXhKxiNfjYMZSjmT8FTwT?=
 =?iso-8859-1?Q?K4o2/devzdNz+QL1CCudQD7jNmxbKcsFtleIvUurCcmOHntY86U2GSPKcW?=
 =?iso-8859-1?Q?uFvKhUVFBOOyLTtjV3bvhnY9f9Q/xf4hhLdEAuAcU2lRRZexP4mEfuPynj?=
 =?iso-8859-1?Q?TTqzhqcMnq0rxBSt2IldZZBZSTyTZaMzSywvMfthMAwTHJ7Hfi95I3IbLq?=
 =?iso-8859-1?Q?VFfDHOrbOC7ON0In2Gilw/IfzGEu3Wync7IMha7mxcMh15cah1lXbO/P/h?=
 =?iso-8859-1?Q?unrRuMPd01Js/+gtW+zlxYZWNSlmON3d6hgP2xUD1YnIEeaklRsr4mXL1k?=
 =?iso-8859-1?Q?ZD8GedycjeKRc9Db17bGWfeQnQTtE3b1PW4aFYE0exRFgs0wYHgXjOnwf3?=
 =?iso-8859-1?Q?Qc3Jg9MRu91aK5UQOeHUJfyH2es31oe/FfdPY/ljeH3pgjkqjpfW9ivIsY?=
 =?iso-8859-1?Q?YNmpP5wQwAzDIRGsL5NMv6xWrDkmB0uuVnVjCH3sY+VbEWI71CBeqlcV6/?=
 =?iso-8859-1?Q?XTBYMxfIQQrAu52feuVN1SZtwexyWL7r5vjEUbUDa/6MUj40WHQhw59mTs?=
 =?iso-8859-1?Q?003nW7KTQJNgiiwrptdWplLKxvRelLquG3AyW0N0ViUZy5sdErFFtPmlvl?=
 =?iso-8859-1?Q?bI7x0b2g0b5Ce0dHlusXKgXmhDLIxvYstpxfZvlWZgZELsCRjQl3YRKiAq?=
 =?iso-8859-1?Q?OM3HItHSjdmuYq7Wf2oY1okxMhxhxINLY9hyqEGzJ62E76a6s7Gi525PJl?=
 =?iso-8859-1?Q?sd35Xsad5y54T7hN9zhJ0GxvJxlJmuZeN8n93/ZYijSgPPiLpR2mnugCMh?=
 =?iso-8859-1?Q?qWGp6k4m9vtQ4b9sL5cRLjepspYfSZx0pbsvDYAkcrYFDcCTcZQoYd+7jk?=
 =?iso-8859-1?Q?d4GnxuUNJTUOIBTQ13FeIucbq+KxCRhke6hf73L2zIEfPtnshvtdAnReTz?=
 =?iso-8859-1?Q?q86P0l0w9xmZqHo5X2klE92l4ZLS4nf2tA+htXusoaCnbKwbNuuxq+Pjaf?=
 =?iso-8859-1?Q?nVriPHezYxY5mJ6NTh3UKkfjAMD+4S3JBzK7uTs4YP5pPW/EheXGW9gdRk?=
 =?iso-8859-1?Q?kOJEJ0HYoZ8AN3FVgmEkCqgKz7gSV0ZUiY0QJaFG2XA9cagMWCRS/hoF2x?=
 =?iso-8859-1?Q?lxVBMekZ3tKoxMVnvV8NbWfFZpFC9iHSJJ/jAzmKsjqkULHu46el05cRPj?=
 =?iso-8859-1?Q?/u4VvduyBg/r7IZc7ANaRdHTgb2ryEYwZnuwa1KeOAcdKgPZn6c5fYkdrV?=
 =?iso-8859-1?Q?3mB+2hz4ntUf2OYuGWdOIAmnIY/55b3w6CvwiDEwQWLKM3dfr5IorgvcLP?=
 =?iso-8859-1?Q?vacJwxWLTF62mDbJSSvstVLc1ir7IxgQ3i88mPisGkmne++MUszzkLtgbX?=
 =?iso-8859-1?Q?xA2hOHt7yfDQ2u8kehArKvQHUtwMmbx/NQXsXMFERVKjTahtM3xwnUog?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbbd96dd-7d39-461a-2ee4-08dbfa691340
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 16:49:00.6059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGm8lZbUohVjavoBc9OlLYRKTP983kR1j8nT5J0XW2AoGJ/eFaX/EwivrUx55HLSclkX5gtWFJxIOFxe7At51A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5596
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 04:43:06PM +0100, Thomas Hellström wrote:
> 
> On 12/8/23 10:45, Matthew Brost wrote:
> > On Fri, Dec 08, 2023 at 04:00:37PM +0100, Thomas Hellström wrote:
> > > On 12/7/23 06:57, Matthew Brost wrote:
> > > > Remove concept of async vs sync VM bind queues, rather make async vs
> > > > sync a per IOCTL choice. Since this is per IOCTL, it makes sense to have
> > > > a singular flag IOCTL rather than per VM bind op flag too. Add
> > > > DRM_XE_SYNCS_FLAG_WAIT_FOR_OP which is an input sync flag to support
> > > > this. Support this new flag for both the VM bind IOCTL and the exec
> > > > IOCTL to match behavior.
> > > > 
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_exec.c             |  58 ++++++++----
> > > >    drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +-
> > > >    drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 -
> > > >    drivers/gpu/drm/xe/xe_vm.c               | 110 ++++++++++-------------
> > > >    drivers/gpu/drm/xe/xe_vm_types.h         |  15 ++--
> > > >    include/uapi/drm/xe_drm.h                |  56 +++++++-----
> > > >    6 files changed, 129 insertions(+), 119 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > > index 92b0da6580e8..c62cabfaa112 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > @@ -130,12 +130,15 @@ static int xe_exec_begin(struct drm_exec *exec, struct xe_vm *vm)
> > > >    	return err;
> > > >    }
> > > > +#define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> > > > +
> > > >    int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    {
> > > >    	struct xe_device *xe = to_xe_device(dev);
> > > >    	struct xe_file *xef = to_xe_file(file);
> > > >    	struct drm_xe_exec *args = data;
> > > > -	struct drm_xe_sync __user *syncs_user = u64_to_user_ptr(args->syncs);
> > > > +	struct drm_xe_sync __user *syncs_user =
> > > > +		u64_to_user_ptr(args->syncs.syncs);
> > > >    	u64 __user *addresses_user = u64_to_user_ptr(args->address);
> > > >    	struct xe_exec_queue *q;
> > > >    	struct xe_sync_entry *syncs = NULL;
> > > > @@ -143,15 +146,18 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    	struct drm_exec exec;
> > > >    	u32 i, num_syncs = 0;
> > > >    	struct xe_sched_job *job;
> > > > -	struct dma_fence *rebind_fence;
> > > > +	struct dma_fence *rebind_fence, *job_fence;
> > > >    	struct xe_vm *vm;
> > > > -	bool write_locked;
> > > > +	bool write_locked, skip_job_put = false;
> > > > +	bool wait = args->syncs.flags & DRM_XE_SYNCS_FLAG_WAIT_FOR_OP;
> > > >    	ktime_t end = 0;
> > > >    	int err = 0;
> > > >    	if (XE_IOCTL_DBG(xe, args->extensions) ||
> > > > -	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
> > > > -	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > > +	    XE_IOCTL_DBG(xe, args->pad || args->pad2[0] || args->pad2[1] || args->pad2[2]) ||
> > > > +	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]) ||
> > > > +	    XE_IOCTL_DBG(xe, args->syncs.flags & ~ALL_DRM_XE_SYNCS_FLAGS) ||
> > > > +	    XE_IOCTL_DBG(xe, wait && args->syncs.num_syncs))
> > > >    		return -EINVAL;
> > > >    	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> > > > @@ -170,8 +176,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    		goto err_exec_queue;
> > > >    	}
> > > > -	if (args->num_syncs) {
> > > > -		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
> > > > +	if (args->syncs.num_syncs) {
> > > > +		syncs = kcalloc(args->syncs.num_syncs, sizeof(*syncs),
> > > > +				GFP_KERNEL);
> > > >    		if (!syncs) {
> > > >    			err = -ENOMEM;
> > > >    			goto err_exec_queue;
> > > > @@ -180,7 +187,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    	vm = q->vm;
> > > > -	for (i = 0; i < args->num_syncs; i++) {
> > > > +	for (i = 0; i < args->syncs.num_syncs; i++) {
> > > >    		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
> > > >    					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
> > > >    					  (xe_vm_in_lr_mode(vm) ?
> > > > @@ -245,9 +252,17 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    				err = PTR_ERR(fence);
> > > >    				goto err_exec;
> > > >    			}
> > > > +
> > > >    			for (i = 0; i < num_syncs; i++)
> > > >    				xe_sync_entry_signal(&syncs[i], NULL, fence);
> > > > +
> > > >    			xe_exec_queue_last_fence_set(q, vm, fence);
> > > > +			if (wait) {
> > > > +				long timeout = dma_fence_wait(fence, true);
> > > > +
> > > > +				if (timeout < 0)
> > > > +					err = -EINTR;
> > > > +			}
> > > Here it looks like we will rerun the same IOCTL again if we return -EINTR.
> > > The user-space expected action on -EINTR is to just restart the IOCTL
> > > without any argument changes. Solution is to add an ioctl argument cookie
> > > (or to skip sync vm binds and have the user just use the 0 batch buffers /
> > > vm_binds calls or wait for an out-fence). If you go for the cookie solution
> > > then IMO we should keep the -ERESTARTSYS returned from dma_fence_wait()
> > > since it's converted to -EINTR on return-to-user-space, and the kernel
> > > restarts the IOCTL automatically if there was no requested-for-delivery
> > > signal pending.
> > > 
> > > I think the simplest solution at this point is to skip the sync behaviour,
> > > in particular if we enable the 0 batch / bind possibility.
> > > 
> > > If we still want to provide it, we could add a cookie address as an
> > > extension to the ioctl and activate sync if present? (Just throwing up ideas
> > > here).
> > > 
> > Hmm, forgot about this. A cookie is fairly easy, what about something like this:
> > 
> >   807 /**
> >   808  * struct drm_xe_syncs - In / out syncs for IOCTLs.
> >   809  */
> >   810 struct drm_xe_syncs {
> >   811         /** @num_syncs: amount of syncs to wait on */
> >   812         __u32 num_syncs;
> >   813
> >   814         /*
> >   815          * Block in IOCTL until operation complete, num_syncs MBZ if set.
> >   816          */
> >   817 #define DRM_XE_SYNCS_IN_FLAG_WAIT_FOR_OP (1 << 0)
> >   818         /** @in_flags: Input Sync flags */
> >   819         __u16 in_flags;
> >   820
> >   821         /*
> >   822          * IOCTL operation has started (no need for user to resubmit on
> >   823          * -ERESTARTSYS)
> >   824          */
> >   825 #define DRM_XE_SYNCS_OUT_FLAG_OP_COMMITTED (1 << 0)
> >   826         /** @out_flags: Output Sync flags */
> >   827         __u16 out_flags;
> >   828
> >   829         /** @syncs: pointer to struct drm_xe_sync array */
> >   830         __u64 syncs;
> >   831
> >   832         /** @reserved: Reserved */
> >   833         __u64 reserved[2];
> >   834 };
> > 
> > DRM_XE_SYNCS_OUT_FLAG_OP_COMMITTED gets set in exec / bind IOCTL after
> > the job is committed or in the of zero ops last-fence updated on the
> > queue. Note that for binds we don't yet do 1 job per IOCTL but after
> > landing some version of [1]
> > 
> > After DRM_XE_SYNCS_OUT_FLAG_OP_COMMITTED is set we return -ERESTARTSYS if
> > the wait is interrupted and -EINTR is still
> > DRM_XE_SYNCS_OUT_FLAG_OP_COMMITTED (interrupted before job is
> > committed).
> > 
> > I'd rather go with patch as we have to change the uAPI here regardless
> > so we might as well make this complete.
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/125608/
> 
> Yeah as we discussed in the meeting that means making the ioctl RW instead
> of W with some copying overhead.
> 
> I also think we should leave the EXEC ioctl out of this, meaning just having
> a single field in the VM_BIND ioctl. Basically the reason is that waiting
> like this after submission is a bit weird and does not align well with how
> -EINTR is typically used.
> 

I kinda like uniform behavior between exec and binds with the behavior
defined in a common sync structure. 

> So either a pointer to a cookie in the ioctl,
> 

What about:

119 > >   807 /**
120 > >   808  * struct drm_xe_syncs - In / out syncs for IOCTLs.
121 > >   809  */
122 > >   810 struct drm_xe_syncs {
123 > >   811         /** @num_syncs: amount of syncs to wait on */
124 > >   812         __u32 num_syncs;
125 > >   813
126 > >   814         /*
127 > >   815          * Block in IOCTL until operation complete, num_syncs MBZ if set.
128 > >   816          */
129 > >   817 #define DRM_XE_SYNCS_IN_FLAG_WAIT_FOR_OP (1 << 0)
130 > >   818         /** @flags: Sync flags */
131 > >   819         __u32 in_flags;
132 > >   820
138 > >   826         /** @cookie: userptr cookie written back with non-zero value once operation committed, only valid when IOCTL returns -EINTR */
139 > >   827         __u64 cookie;
140 > >   828
141 > >   829         /** @syncs: pointer to struct drm_xe_sync array */
142 > >   830         __u64 syncs;
143 > >   831
144 > >   832         /** @reserved: Reserved */
145 > >   833         __u64 reserved[2];
146 > >   834 };

Also if cookie is 0, we wait uninterruptable once the op is committed?

> or perhaps dig up again the idea we had of mostly waiting before the
> submission:
> 
> 1) Pull out the last_op fence for the queue from under the relevant lock.
> 2) Wait for all dependencies without any locks.
> 3) Lock, and (optionally) if the last_op fence changed, wait for it.
> 4) Submit
> 5) Wait for completion uninterruptible.
> 

We can always change the internal implementation to something like this
after [1]. That series makes refactors like this quite a bit easier.

Matt

[1] https://patchwork.freedesktop.org/series/125608/ 

> I actually like this last one best, but we'd recommend UMD to uses
> out-fences whenever possible.
> 
> Thoughts?
> 
> > 
> > > >    			dma_fence_put(fence);
> > > >    		}
> > > > @@ -331,42 +346,51 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    	 * the job and let the DRM scheduler / backend clean up the job.
> > > >    	 */
> > > >    	xe_sched_job_arm(job);
> > > > +	job_fence = &job->drm.s_fence->finished;
> > > > +	if (wait)
> > > > +		dma_fence_get(job_fence);
> > > >    	if (!xe_vm_in_lr_mode(vm)) {
> > > >    		/* Block userptr invalidations / BO eviction */
> > > > -		dma_resv_add_fence(&vm->resv,
> > > > -				   &job->drm.s_fence->finished,
> > > > +		dma_resv_add_fence(&vm->resv, job_fence,
> > > >    				   DMA_RESV_USAGE_BOOKKEEP);
> > > >    		/*
> > > >    		 * Make implicit sync work across drivers, assuming all external
> > > >    		 * BOs are written as we don't pass in a read / write list.
> > > >    		 */
> > > > -		xe_vm_fence_all_extobjs(vm, &job->drm.s_fence->finished,
> > > > -					DMA_RESV_USAGE_WRITE);
> > > > +		xe_vm_fence_all_extobjs(vm, job_fence, DMA_RESV_USAGE_WRITE);
> > > >    	}
> > > >    	for (i = 0; i < num_syncs; i++)
> > > > -		xe_sync_entry_signal(&syncs[i], job,
> > > > -				     &job->drm.s_fence->finished);
> > > > +		xe_sync_entry_signal(&syncs[i], job, job_fence);
> > > >    	if (xe_exec_queue_is_lr(q))
> > > >    		q->ring_ops->emit_job(job);
> > > >    	if (!xe_vm_in_lr_mode(vm))
> > > > -		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
> > > > +		xe_exec_queue_last_fence_set(q, vm, job_fence);
> > > >    	xe_sched_job_push(job);
> > > >    	xe_vm_reactivate_rebind(vm);
> > > > -	if (!err && !xe_vm_in_lr_mode(vm)) {
> > > > +	if (!xe_vm_in_lr_mode(vm)) {
> > > >    		spin_lock(&xe->ttm.lru_lock);
> > > >    		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > > >    		spin_unlock(&xe->ttm.lru_lock);
> > > >    	}
> > > > +	skip_job_put = true;
> > > > +	if (wait) {
> > > > +		long timeout = dma_fence_wait(job_fence, true);
> > > > +
> > > > +		dma_fence_put(job_fence);
> > > > +		if (timeout < 0)
> > > > +			err = -EINTR;
> > > > +	}
> > > > +
> > > >    err_repin:
> > > >    	if (!xe_vm_in_lr_mode(vm))
> > > >    		up_read(&vm->userptr.notifier_lock);
> > > >    err_put_job:
> > > > -	if (err)
> > > > +	if (err && !skip_job_put)
> > > >    		xe_sched_job_put(job);
> > > >    err_exec:
> > > >    	drm_exec_fini(&exec);
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index 3911d14522ee..98776d02d634 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -625,10 +625,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > > >    	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
> > > >    		return -EINVAL;
> > > > -	if (eci[0].engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC) {
> > > > -		bool sync = eci[0].engine_class ==
> > > > -			DRM_XE_ENGINE_CLASS_VM_BIND_SYNC;
> > > > -
> > > > +	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
> > > >    		for_each_gt(gt, xe, id) {
> > > >    			struct xe_exec_queue *new;
> > > > @@ -654,8 +651,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > > >    						   args->width, hwe,
> > > >    						   EXEC_QUEUE_FLAG_PERSISTENT |
> > > >    						   EXEC_QUEUE_FLAG_VM |
> > > > -						   (sync ? 0 :
> > > > -						    EXEC_QUEUE_FLAG_VM_ASYNC) |
> > > >    						   (id ?
> > > >    						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
> > > >    						    0));
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > index 52f0927d0d9b..c78f6e8b41c4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > @@ -74,8 +74,6 @@ struct xe_exec_queue {
> > > >    #define EXEC_QUEUE_FLAG_VM			BIT(4)
> > > >    /* child of VM queue for multi-tile VM jobs */
> > > >    #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
> > > > -/* VM jobs for this queue are asynchronous */
> > > > -#define EXEC_QUEUE_FLAG_VM_ASYNC		BIT(6)
> > > >    	/**
> > > >    	 * @flags: flags for this exec queue, should statically setup aside from ban
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > index cf2eb44a71db..4b0c976c003a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -1433,9 +1433,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > > >    			struct xe_gt *gt = tile->primary_gt;
> > > >    			struct xe_vm *migrate_vm;
> > > >    			struct xe_exec_queue *q;
> > > > -			u32 create_flags = EXEC_QUEUE_FLAG_VM |
> > > > -				((flags & XE_VM_FLAG_ASYNC_DEFAULT) ?
> > > > -				EXEC_QUEUE_FLAG_VM_ASYNC : 0);
> > > > +			u32 create_flags = EXEC_QUEUE_FLAG_VM;
> > > >    			if (!vm->pt_root[id])
> > > >    				continue;
> > > > @@ -1835,16 +1833,10 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> > > >    	return ERR_PTR(err);
> > > >    }
> > > > -static bool xe_vm_sync_mode(struct xe_vm *vm, struct xe_exec_queue *q)
> > > > -{
> > > > -	return q ? !(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC) :
> > > > -		!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT);
> > > > -}
> > > > -
> > > >    static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > > >    			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > > >    			u32 num_syncs, bool immediate, bool first_op,
> > > > -			bool last_op)
> > > > +			bool last_op, bool async)
> > > >    {
> > > >    	struct dma_fence *fence;
> > > >    	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
> > > > @@ -1870,7 +1862,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > > >    	if (last_op)
> > > >    		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > > > -	if (last_op && xe_vm_sync_mode(vm, q))
> > > > +	if (last_op && !async)
> > > >    		dma_fence_wait(fence, true);
> > > >    	dma_fence_put(fence);
> > > > @@ -1880,7 +1872,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > > >    static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
> > > >    		      struct xe_bo *bo, struct xe_sync_entry *syncs,
> > > >    		      u32 num_syncs, bool immediate, bool first_op,
> > > > -		      bool last_op)
> > > > +		      bool last_op, bool async)
> > > >    {
> > > >    	int err;
> > > > @@ -1894,12 +1886,12 @@ static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue
> > > >    	}
> > > >    	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate, first_op,
> > > > -			    last_op);
> > > > +			    last_op, async);
> > > >    }
> > > >    static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > > >    			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > > > -			u32 num_syncs, bool first_op, bool last_op)
> > > > +			u32 num_syncs, bool first_op, bool last_op, bool async)
> > > >    {
> > > >    	struct dma_fence *fence;
> > > >    	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
> > > > @@ -1914,7 +1906,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > > >    	xe_vma_destroy(vma, fence);
> > > >    	if (last_op)
> > > >    		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > > > -	if (last_op && xe_vm_sync_mode(vm, q))
> > > > +	if (last_op && !async)
> > > >    		dma_fence_wait(fence, true);
> > > It looks like we're dropping the error return code here.
> > > 
> > > 
> > > >    	dma_fence_put(fence);
> > > > @@ -1923,7 +1915,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > > >    #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> > > >    				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
> > > > -				    DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT | \
> > > >    				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> > > >    int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > > > @@ -1977,8 +1968,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > > >    		flags |= XE_VM_FLAG_SCRATCH_PAGE;
> > > >    	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
> > > >    		flags |= XE_VM_FLAG_LR_MODE;
> > > > -	if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
> > > > -		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
> > > >    	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> > > >    		flags |= XE_VM_FLAG_FAULT_MODE;
> > > > @@ -2062,7 +2051,7 @@ static const u32 region_to_mem_type[] = {
> > > >    static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> > > >    			  struct xe_exec_queue *q, u32 region,
> > > >    			  struct xe_sync_entry *syncs, u32 num_syncs,
> > > > -			  bool first_op, bool last_op)
> > > > +			  bool first_op, bool last_op, bool async)
> > > >    {
> > > >    	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
> > > >    	int err;
> > > > @@ -2077,7 +2066,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> > > >    	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated)) {
> > > >    		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
> > > > -				  true, first_op, last_op);
> > > > +				  true, first_op, last_op, async);
> > > >    	} else {
> > > >    		int i;
> > > > @@ -2400,6 +2389,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> > > >    		}
> > > >    		op->q = q;
> > > > +		if (async)
> > > > +			op->flags |= XE_VMA_OP_ASYNC;
> > > >    		switch (op->base.op) {
> > > >    		case DRM_GPUVA_OP_MAP:
> > > > @@ -2538,7 +2529,8 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> > > >    				 op->syncs, op->num_syncs,
> > > >    				 op->map.immediate || !xe_vm_in_fault_mode(vm),
> > > >    				 op->flags & XE_VMA_OP_FIRST,
> > > > -				 op->flags & XE_VMA_OP_LAST);
> > > > +				 op->flags & XE_VMA_OP_LAST,
> > > > +				 op->flags & XE_VMA_OP_ASYNC);
> > > >    		break;
> > > >    	case DRM_GPUVA_OP_REMAP:
> > > >    	{
> > > > @@ -2552,7 +2544,8 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> > > >    					   op->num_syncs,
> > > >    					   op->flags & XE_VMA_OP_FIRST,
> > > >    					   op->flags & XE_VMA_OP_LAST &&
> > > > -					   !prev && !next);
> > > > +					   !prev && !next,
> > > > +					   op->flags & XE_VMA_OP_ASYNC);
> > > >    			if (err)
> > > >    				break;
> > > >    			op->remap.unmap_done = true;
> > > > @@ -2563,7 +2556,8 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> > > >    			err = xe_vm_bind(vm, op->remap.prev, op->q,
> > > >    					 xe_vma_bo(op->remap.prev), op->syncs,
> > > >    					 op->num_syncs, true, false,
> > > > -					 op->flags & XE_VMA_OP_LAST && !next);
> > > > +					 op->flags & XE_VMA_OP_LAST && !next,
> > > > +					 op->flags & XE_VMA_OP_ASYNC);
> > > >    			op->remap.prev->gpuva.flags &= ~XE_VMA_LAST_REBIND;
> > > >    			if (err)
> > > >    				break;
> > > > @@ -2576,7 +2570,8 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> > > >    					 xe_vma_bo(op->remap.next),
> > > >    					 op->syncs, op->num_syncs,
> > > >    					 true, false,
> > > > -					 op->flags & XE_VMA_OP_LAST);
> > > > +					 op->flags & XE_VMA_OP_LAST,
> > > > +					 op->flags & XE_VMA_OP_ASYNC);
> > > >    			op->remap.next->gpuva.flags &= ~XE_VMA_LAST_REBIND;
> > > >    			if (err)
> > > >    				break;
> > > > @@ -2588,13 +2583,15 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> > > >    	case DRM_GPUVA_OP_UNMAP:
> > > >    		err = xe_vm_unbind(vm, vma, op->q, op->syncs,
> > > >    				   op->num_syncs, op->flags & XE_VMA_OP_FIRST,
> > > > -				   op->flags & XE_VMA_OP_LAST);
> > > > +				   op->flags & XE_VMA_OP_LAST,
> > > > +				   op->flags & XE_VMA_OP_ASYNC);
> > > >    		break;
> > > >    	case DRM_GPUVA_OP_PREFETCH:
> > > >    		err = xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
> > > >    				     op->syncs, op->num_syncs,
> > > >    				     op->flags & XE_VMA_OP_FIRST,
> > > > -				     op->flags & XE_VMA_OP_LAST);
> > > > +				     op->flags & XE_VMA_OP_LAST,
> > > > +				     op->flags & XE_VMA_OP_ASYNC);
> > > >    		break;
> > > >    	default:
> > > >    		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > > > @@ -2808,16 +2805,16 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > > >    #ifdef TEST_VM_ASYNC_OPS_ERROR
> > > >    #define SUPPORTED_FLAGS	\
> > > > -	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_ASYNC | \
> > > > -	 DRM_XE_VM_BIND_FLAG_READONLY | DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> > > > -	 DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
> > > > +	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_READONLY | \
> > > > +	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
> > > >    #else
> > > >    #define SUPPORTED_FLAGS	\
> > > > -	(DRM_XE_VM_BIND_FLAG_ASYNC | DRM_XE_VM_BIND_FLAG_READONLY | \
> > > > +	(DRM_XE_VM_BIND_FLAG_READONLY | \
> > > >    	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
> > > >    	 0xffff)
> > > >    #endif
> > > >    #define XE_64K_PAGE_MASK 0xffffull
> > > > +#define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> > > >    #define MAX_BINDS	512	/* FIXME: Picking random upper limit */
> > > > @@ -2829,7 +2826,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > > >    	int err;
> > > >    	int i;
> > > > -	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > > > +	if (XE_IOCTL_DBG(xe, args->pad) ||
> > > >    	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > >    		return -EINVAL;
> > > > @@ -2857,6 +2854,14 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > > >    		*bind_ops = &args->bind;
> > > >    	}
> > > > +	*async = !(args->syncs.flags & DRM_XE_SYNCS_FLAG_WAIT_FOR_OP);
> > > > +
> > > > +	if (XE_IOCTL_DBG(xe, args->syncs.flags & ~ALL_DRM_XE_SYNCS_FLAGS) ||
> > > > +	    XE_IOCTL_DBG(xe, !*async && args->syncs.num_syncs)) {
> > > > +		err = -EINVAL;
> > > > +		goto free_bind_ops;
> > > > +	}
> > > > +
> > > >    	for (i = 0; i < args->num_binds; ++i) {
> > > >    		u64 range = (*bind_ops)[i].range;
> > > >    		u64 addr = (*bind_ops)[i].addr;
> > > > @@ -2887,18 +2892,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > > >    			goto free_bind_ops;
> > > >    		}
> > > > -		if (i == 0) {
> > > > -			*async = !!(flags & DRM_XE_VM_BIND_FLAG_ASYNC);
> > > > -			if (XE_IOCTL_DBG(xe, !*async && args->num_syncs)) {
> > > > -				err = -EINVAL;
> > > > -				goto free_bind_ops;
> > > > -			}
> > > > -		} else if (XE_IOCTL_DBG(xe, *async !=
> > > > -					!!(flags & DRM_XE_VM_BIND_FLAG_ASYNC))) {
> > > > -			err = -EINVAL;
> > > > -			goto free_bind_ops;
> > > > -		}
> > > > -
> > > >    		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
> > > >    		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
> > > >    		    XE_IOCTL_DBG(xe, obj && is_null) ||
> > > > @@ -2951,7 +2944,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > > >    static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
> > > >    				       struct xe_exec_queue *q,
> > > >    				       struct xe_sync_entry *syncs,
> > > > -				       int num_syncs)
> > > > +				       int num_syncs, bool async)
> > > >    {
> > > >    	struct dma_fence *fence;
> > > >    	int i, err = 0;
> > > > @@ -2967,7 +2960,7 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
> > > >    	xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
> > > >    				     fence);
> > > > -	if (xe_vm_sync_mode(vm, q)) {
> > > > +	if (!async) {
> > > >    		long timeout = dma_fence_wait(fence, true);
> > > >    		if (timeout < 0)
> > > > @@ -3001,7 +2994,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    	if (err)
> > > >    		return err;
> > > > -	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > > > +	if (XE_IOCTL_DBG(xe, args->pad) ||
> > > >    	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > >    		return -EINVAL;
> > > > @@ -3016,12 +3009,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    			err = -EINVAL;
> > > >    			goto put_exec_queue;
> > > >    		}
> > > > -
> > > > -		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > > > -				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
> > > > -			err = -EINVAL;
> > > > -			goto put_exec_queue;
> > > > -		}
> > > >    	}
> > > >    	vm = xe_vm_lookup(xef, args->vm_id);
> > > > @@ -3030,14 +3017,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    		goto put_exec_queue;
> > > >    	}
> > > > -	if (!args->exec_queue_id) {
> > > > -		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > > > -				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
> > > > -			err = -EINVAL;
> > > > -			goto put_vm;
> > > > -		}
> > > > -	}
> > > > -
> > > >    	err = down_write_killable(&vm->lock);
> > > >    	if (err)
> > > >    		goto put_vm;
> > > > @@ -3127,16 +3106,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    		}
> > > >    	}
> > > > -	if (args->num_syncs) {
> > > > -		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
> > > > +	if (args->syncs.num_syncs) {
> > > > +		syncs = kcalloc(args->syncs.num_syncs, sizeof(*syncs), GFP_KERNEL);
> > > >    		if (!syncs) {
> > > >    			err = -ENOMEM;
> > > >    			goto put_obj;
> > > >    		}
> > > >    	}
> > > > -	syncs_user = u64_to_user_ptr(args->syncs);
> > > > -	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
> > > > +	syncs_user = u64_to_user_ptr(args->syncs.syncs);
> > > > +	for (num_syncs = 0; num_syncs < args->syncs.num_syncs; num_syncs++) {
> > > >    		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
> > > >    					  &syncs_user[num_syncs],
> > > >    					  (xe_vm_in_lr_mode(vm) ?
> > > > @@ -3210,7 +3189,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> > > >    free_syncs:
> > > >    	if (err == -ENODATA)
> > > > -		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
> > > > +		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs,
> > > > +						  async);
> > > >    	while (num_syncs--)
> > > >    		xe_sync_entry_cleanup(&syncs[num_syncs]);
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > index 23abdfd8622f..ce8b9bde7e9c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > @@ -167,13 +167,12 @@ struct xe_vm {
> > > >    	 */
> > > >    #define XE_VM_FLAG_64K			BIT(0)
> > > >    #define XE_VM_FLAG_LR_MODE		BIT(1)
> > > > -#define XE_VM_FLAG_ASYNC_DEFAULT	BIT(2)
> > > > -#define XE_VM_FLAG_MIGRATION		BIT(3)
> > > > -#define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
> > > > -#define XE_VM_FLAG_FAULT_MODE		BIT(5)
> > > > -#define XE_VM_FLAG_BANNED		BIT(6)
> > > > -#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(8, 7), flags)
> > > > -#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(8, 7), (tile)->id)
> > > > +#define XE_VM_FLAG_MIGRATION		BIT(2)
> > > > +#define XE_VM_FLAG_SCRATCH_PAGE		BIT(3)
> > > > +#define XE_VM_FLAG_FAULT_MODE		BIT(4)
> > > > +#define XE_VM_FLAG_BANNED		BIT(5)
> > > > +#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
> > > > +#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
> > > >    	unsigned long flags;
> > > >    	/** @composite_fence_ctx: context composite fence */
> > > > @@ -385,6 +384,8 @@ enum xe_vma_op_flags {
> > > >    	XE_VMA_OP_PREV_COMMITTED	= BIT(3),
> > > >    	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed */
> > > >    	XE_VMA_OP_NEXT_COMMITTED	= BIT(4),
> > > > +	/** @XE_VMA_OP_ASYNC: operation is async */
> > > > +	XE_VMA_OP_ASYNC			= BIT(5),
> > > >    };
> > > >    /** struct xe_vma_op - VMA operation */
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index eb03a49c17a1..fd8172fe2d9a 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -141,8 +141,7 @@ struct drm_xe_engine_class_instance {
> > > >    	 * Kernel only classes (not actual hardware engine class). Used for
> > > >    	 * creating ordered queues of VM bind operations.
> > > >    	 */
> > > > -#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
> > > > -#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
> > > > +#define DRM_XE_ENGINE_CLASS_VM_BIND		5
> > > >    	__u16 engine_class;
> > > >    	__u16 engine_instance;
> > > > @@ -660,7 +659,6 @@ struct drm_xe_vm_create {
> > > >    	 * still enable recoverable pagefaults if supported by the device.
> > > >    	 */
> > > >    #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
> > > > -#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
> > > >    	/*
> > > >    	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
> > > >    	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
> > > > @@ -668,7 +666,7 @@ struct drm_xe_vm_create {
> > > >    	 * The xe driver internally uses recoverable pagefaults to implement
> > > >    	 * this.
> > > >    	 */
> > > > -#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
> > > > +#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
> > > >    	/** @flags: Flags */
> > > >    	__u32 flags;
> > > > @@ -776,12 +774,11 @@ struct drm_xe_vm_bind_op {
> > > >    	__u32 op;
> > > >    #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> > > > -#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
> > > >    	/*
> > > >    	 * Valid on a faulting VM only, do the MAP operation immediately rather
> > > >    	 * than deferring the MAP to the page fault handler.
> > > >    	 */
> > > > -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
> > > > +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> > > >    	/*
> > > >    	 * When the NULL flag is set, the page tables are setup with a special
> > > >    	 * bit which indicates writes are dropped and all reads return zero.  In
> > > > @@ -789,7 +786,7 @@ struct drm_xe_vm_bind_op {
> > > >    	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
> > > >    	 * intended to implement VK sparse bindings.
> > > >    	 */
> > > > -#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
> > > > +#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> > > >    	/** @flags: Bind flags */
> > > >    	__u32 flags;
> > > > @@ -807,6 +804,27 @@ struct drm_xe_vm_bind_op {
> > > >    	__u64 reserved[3];
> > > >    };
> > > > +/**
> > > > + * struct drm_xe_syncs - In / out syncs for IOCTLs.
> > > > + */
> > > > +struct drm_xe_syncs {
> > > > +	/** @num_syncs: amount of syncs to wait on */
> > > > +	__u32 num_syncs;
> > > > +
> > > > +	/*
> > > > +	 * Block in IOCTL until operation complete, num_syncs MBZ if set.
> > > > +	 */
> > > > +#define DRM_XE_SYNCS_FLAG_WAIT_FOR_OP (1 << 0)
> > > > +	/** @flags: Sync flags */
> > > > +	__u32 flags;
> > > > +
> > > > +	/** @syncs: pointer to struct drm_xe_sync array */
> > > > +	__u64 syncs;
> > > > +
> > > > +	/** @reserved: Reserved */
> > > > +	__u64 reserved[2];
> > > > +};
> > > > +
> > > >    struct drm_xe_vm_bind {
> > > >    	/** @extensions: Pointer to the first extension struct, if any */
> > > >    	__u64 extensions;
> > > > @@ -838,14 +856,8 @@ struct drm_xe_vm_bind {
> > > >    		__u64 vector_of_binds;
> > > >    	};
> > > > -	/** @pad: MBZ */
> > > > -	__u32 pad2;
> > > > -
> > > > -	/** @num_syncs: amount of syncs to wait on */
> > > > -	__u32 num_syncs;
> > > > -
> > > > -	/** @syncs: pointer to struct drm_xe_sync array */
> > > > -	__u64 syncs;
> > > > +	/** @syncs: syncs for bind */
> > > > +	struct drm_xe_syncs syncs;
> > > >    	/** @reserved: Reserved */
> > > >    	__u64 reserved[2];
> > > > @@ -974,14 +986,14 @@ struct drm_xe_exec {
> > > >    	/** @extensions: Pointer to the first extension struct, if any */
> > > >    	__u64 extensions;
> > > > +	/** @pad: MBZ */
> > > > +	__u32 pad;
> > > > +
> > > >    	/** @exec_queue_id: Exec queue ID for the batch buffer */
> > > >    	__u32 exec_queue_id;
> > > > -	/** @num_syncs: Amount of struct drm_xe_sync in array. */
> > > > -	__u32 num_syncs;
> > > > -
> > > > -	/** @syncs: Pointer to struct drm_xe_sync array. */
> > > > -	__u64 syncs;
> > > > +	/** @syncs: syncs for exec */
> > > > +	struct drm_xe_syncs syncs;
> > > >    	/**
> > > >    	 * @address: address of batch buffer if num_batch_buffer == 1 or an
> > > > @@ -995,8 +1007,8 @@ struct drm_xe_exec {
> > > >    	 */
> > > >    	__u16 num_batch_buffer;
> > > > -	/** @pad: MBZ */
> > > > -	__u16 pad[3];
> > > > +	/** @pad2: MBZ */
> > > > +	__u16 pad2[3];
> > > >    	/** @reserved: Reserved */
> > > >    	__u64 reserved[2];
