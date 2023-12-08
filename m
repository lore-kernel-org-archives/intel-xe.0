Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E69C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 19:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A3710EAF9;
	Fri,  8 Dec 2023 19:25:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EB910EAF9
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 19:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702063517; x=1733599517;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DTRqgD4pOFVpUlstnGK++kdHmaZ6JrADmBmOLv/a7Uw=;
 b=MKsU1Sqct3UsvKU1wZHLDOijlnnQQLfz9mFxM+hSKIfAMHd5+x7Fn4PF
 aCseQGBd15ii1+dW8ewv8RYFAZC65J/66fXxFbuOnm+rCAY5/VYDU1cXW
 1NhN9fJhe9A8859Kf2Z9RIwixNlZA37Z1oFK6A8fEl4Ku/k7Qcg6/uaLP
 SIlK0yq4zZqI5vewpqXwwDYjp+vSf6iZaH5eHNyPo/tGosrsmaoRrAvZ4
 cZSNPgjPMn175PUJEKMQpZFj98+46SaVV6Kl5bImiwyQ/7/9WNtWgRJvb
 NMkZfkjIm0yWJONyZ4EAE7Jb8TkZH3AyVo1ekaICbnR1NeK1qm7G+pYbd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1519728"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1519728"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 11:25:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="765579507"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="765579507"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 11:25:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:25:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:25:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 11:25:14 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 11:25:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejADHXSdw4ONhEQdyYZyhdnA18nMASVLLwebmqNqAQEoOvyE+cnoWut6aHoPR1xwYnBLL/AXB3hjmHjSAjycP21IaxuOIu4WjSAtioN6TLJzn1zNqFtODQMOsot2nh+WWf1Z/0nDZpWZtjDcDUuVMx6yblJvYqwErWVRe5ATfltY1qopcjHMUmjelI8hxdF/x5j5mSNaeu/2VhLLW63qUjrAUJ0NvVixF8JWhQWkyiZLZLE9UublQcoZSXit1vqVLXbCsQkO1f+8KRXzNnoFZrgJKh9p6CxOV071e77LEBB2T7s5U/KR7u9BB5/Mo6DEZklSjWKO85bE1IsdkyhJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kXRhEmGND0LinpXouU10MvaFCnG0BYIOn9lrkLIjxE=;
 b=LoAArPOS0GfrBqc/fyYGOuGHxvbr0h8ASplWNXXnbDsxEJRW4/Avm2FR1DmTFxjFaLt0NMJwgm9WN0OAuyDPZW8s2liuzJDu+gVCeL33QSATOFc0cx4pCPf0gsLd9tCnEyhSfOSVxj/d8PZLbTCjCwvBogSZasuZKY8hDnCv2KZEOB+cbs58xIbflk/+LFuDw70Z2tM4bHpZHUyOkJ8XsOpGEOFAzNcRxMX1nL0QRCZplCcNJyR/2g8Z5AW+Gz0eCBE04eQCZx8SlObWnpqO6sk/pd8xY/uOHzEuBIarNyTcqtWqC3rPyaEJ1ElrOBcANZeS6FI6q12yNCjrOFln5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6524.namprd11.prod.outlook.com (2603:10b6:510:210::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 19:25:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 19:25:11 +0000
Date: Fri, 8 Dec 2023 12:24:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC PATCH 7/7] drm/xe/uapi: Uniform async vs sync handling
Message-ID: <ZXMK7OpGuejR5Fdv@DUT025-TGLU.fm.intel.com>
References: <20231207055729.438642-1-matthew.brost@intel.com>
 <20231207055729.438642-8-matthew.brost@intel.com>
 <d7c25d14-fa14-4426-57a4-276675c7b2f9@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7c25d14-fa14-4426-57a4-276675c7b2f9@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0105.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: b7db558f-d205-4273-23bf-08dbf8236552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rC37rF1iVrzv9FqsIQScLTMq3n6vWWRCAI63mLFvxiRV6mwZCH9zH+JitAztcCL5xFhDS9JNalBwIbvMNmC//Wpi4l4nVQiAxPpeEQ4h/OohDIlUkBTyh5uECTHfSCbD2xK2TfEqf+Vbrk/xz/Zyk+XZlTKr55rtFXeD0z3fibotxT4NFBDh+6KUaq672bhgimwqTf15+tYsErhzNLtpTjvV8161bXJst6+wii8OrbzRxyquNlzxAuIXmba9eIjWt/fmpVU3IZyB7RSTNKiDyHdEl7dyqxp6DVbqG8fl9aWNP5kl+sr2qXLfoIzMNcb94KoJl/WgzYuX3Na/GS/hOahrsytcWLKxKvOPfP+KIUXgO+bF2Wvqw0/lBbDdHsFHqgvZHDmjp5Bj8UMLLLklp/d08jUiKnrUj6qm+Q5gdsqY8DguCROBJbufRJ/Z1mPG86pvf/r7O5sVKmVM44AU70XO/qOXC9RqtEWI64j0F31/vub5v6W3xLBbWtfHDTQ+wBu/KD1KOB1rU0aWkz7mP2EcHn0Z5w76N6xLh9fD44tQQbgIE5DSGzDqOxZWLL9Jf1FKmHiFiAJBHAVmEIhrr9MkuhYLDnIwqUe0qyqyoxdOAd9JU48Q4Y38uJ0UQ+2qNuNxjrCv4km+4rRbYy2CzGMCK/jnlGjH1fwJHji7GUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(376002)(346002)(366004)(230922051799003)(230173577357003)(230273577357003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(30864003)(2906002)(5660300002)(8676002)(8936002)(4326008)(53546011)(966005)(6512007)(6486002)(86362001)(6506007)(478600001)(38100700002)(6916009)(66556008)(54906003)(66476007)(82960400001)(66946007)(44832011)(83380400001)(66574015)(316002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?u8v50CiZuIrRKIQLogUMZpUplRPOwG4u9mwdb35gTDZCFIF3VM2Qf8Sl0O?=
 =?iso-8859-1?Q?ddAV2H+2QBrTuZm2jIZTvrNkKMkIB8F0KejPTz3TZ7k5OGaFLSqOcEvOcw?=
 =?iso-8859-1?Q?rjOdhDmo/e/KwbiRV58wGwGASo1a9XKyMFbnypwLG0Ktu9chkoS/5feAoV?=
 =?iso-8859-1?Q?ilZjeHemIkKLEQI0tPoGumoYJ/HlwhYc8SVinycb5i6QjgEjRjjItbNAMQ?=
 =?iso-8859-1?Q?7Ymuso8ytpYUXcu09LgwyohqzoZvDNqvT4m1SVuK1KfFdTaAx40MBM6Z+N?=
 =?iso-8859-1?Q?6w31fcqP7QFnjCoVNc7PfF6DaBu/vMmFbXVF4OirGTxs/nUyO8GqMDxkVb?=
 =?iso-8859-1?Q?v/i+rPZnI9iLJUoybijft5Zmut3SWe53RdRnWLmPb4tezkn7r3LhFAHJya?=
 =?iso-8859-1?Q?pKBY1CmyBNnbxPHxNM0pWdWmPgpApgyQ0vGuu7XbWO+3kgVfYRXMfi4vrV?=
 =?iso-8859-1?Q?gBUPfjjuzRDp+iQ9HgVsKrHbGBgLnyCQHVaxAtlmbilBs3ydcnhdTGFAit?=
 =?iso-8859-1?Q?HUtkaeaqs5rKmbWfsBxyFNvis55PhgrVy/TPCAos5sdQ7n7S7caE/jEDgg?=
 =?iso-8859-1?Q?jRaZBK36qHGuU2GhW/tS2HpYikc095AX3YpsgiG8t6w5pTII+tvb0AaJ/D?=
 =?iso-8859-1?Q?8lqSOEOeJvNdcF1MXjIkLK0m6SV+wx49Lhn/+4ZqIKI+t18bokFxfzV6uv?=
 =?iso-8859-1?Q?s064DDYUUz2gz4WcnMsvpPEYn+mxGlqRaPY0Q2tBhkaubPD6wvMPYYWnta?=
 =?iso-8859-1?Q?pVqrQ/s3AaWJncCGOekLVUPMGJJKKDrco9mUKIOQKBNfoXemnxRqfV4k0L?=
 =?iso-8859-1?Q?sPW8+MwzCW3kD2UsDCULiZvAn+8gsQZV3gRUBpelc8quJMycZaka593FnF?=
 =?iso-8859-1?Q?Jf6D5ynZAUNtiJ0n7Ap0aCP3oCRxjS9Hkn+1CKk3iXhTGK+MzDVeWevTb5?=
 =?iso-8859-1?Q?RmAkeYAgfMhUaGFlzpMxE1T7dDokNggehH/DFzaND1mmAjpa1Epdp3HHD3?=
 =?iso-8859-1?Q?cfAd0e6pqLJvwBY4SyxxIMtFKweit4ycdMxEg59FH291FKoNm0lm1JSomm?=
 =?iso-8859-1?Q?ujGrSGCiLD7aDcJLPhdXVBgUaJst8/dWBelN5j+aAC2wOdaZkl2P1JZjAh?=
 =?iso-8859-1?Q?3KGNLBq728jrHijfYBvVtpIJzuzaHiecKRYgRlNYSURB/ObsohpNoWRnW/?=
 =?iso-8859-1?Q?k4EoeJvfW2s/QzcUuMLj69GUq/iIpkkS2awFZrhmLPr9ZQGeoloAQO0fvv?=
 =?iso-8859-1?Q?Un9FSiPRZNlJ6BsNxWsspaYGRgKz7thlOXwpJQQKJd+CI3pBt0l+V3zvEQ?=
 =?iso-8859-1?Q?cxnYbT7OuFWyFXMdN25B4zC4bsZZ3jNsoFhbh1/4oPQgriZUtxnH8cUJ45?=
 =?iso-8859-1?Q?lJ+ENN1vbqnnbsWw8CPtH/pM7jSATACy5IWmH+BElljDl75hUR851h4uEF?=
 =?iso-8859-1?Q?79Hic3idT2id7zWTE7/+HRL7e940Cmtf+qcfQWZajQlzridcyQmKlEvcbv?=
 =?iso-8859-1?Q?WMdmFHIuKhLElP3c2p+5DSaptHA4r0hNCtYhWUZuoEtQ0sn/NQvYbAdGMw?=
 =?iso-8859-1?Q?/jek5py7ua7BqTnzSSIlLuPkxfJp4NdlEL4zwwaOhp5CLt1ig5p5Ul4ZEm?=
 =?iso-8859-1?Q?o7xmm3w5Xc7MxtigE9i/go5taXj+3B/Q94z5k/8nJfdK90lQyVefEtmw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7db558f-d205-4273-23bf-08dbf8236552
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 19:25:11.2789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vc7sZiecCFRJ8GRB/avhpVXAHveONQDOwzczLhYJwt/sJqKzcksDH9daJGAL1R1bjmLYRWqUFwGlpiCT+n0Hig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6524
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

On Fri, Dec 08, 2023 at 04:00:37PM +0100, Thomas Hellström wrote:
> 

Missed a comment, addressing below.

> On 12/7/23 06:57, Matthew Brost wrote:
> > Remove concept of async vs sync VM bind queues, rather make async vs
> > sync a per IOCTL choice. Since this is per IOCTL, it makes sense to have
> > a singular flag IOCTL rather than per VM bind op flag too. Add
> > DRM_XE_SYNCS_FLAG_WAIT_FOR_OP which is an input sync flag to support
> > this. Support this new flag for both the VM bind IOCTL and the exec
> > IOCTL to match behavior.
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec.c             |  58 ++++++++----
> >   drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +-
> >   drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 -
> >   drivers/gpu/drm/xe/xe_vm.c               | 110 ++++++++++-------------
> >   drivers/gpu/drm/xe/xe_vm_types.h         |  15 ++--
> >   include/uapi/drm/xe_drm.h                |  56 +++++++-----
> >   6 files changed, 129 insertions(+), 119 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index 92b0da6580e8..c62cabfaa112 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -130,12 +130,15 @@ static int xe_exec_begin(struct drm_exec *exec, struct xe_vm *vm)
> >   	return err;
> >   }
> > +#define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> > +
> >   int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   {
> >   	struct xe_device *xe = to_xe_device(dev);
> >   	struct xe_file *xef = to_xe_file(file);
> >   	struct drm_xe_exec *args = data;
> > -	struct drm_xe_sync __user *syncs_user = u64_to_user_ptr(args->syncs);
> > +	struct drm_xe_sync __user *syncs_user =
> > +		u64_to_user_ptr(args->syncs.syncs);
> >   	u64 __user *addresses_user = u64_to_user_ptr(args->address);
> >   	struct xe_exec_queue *q;
> >   	struct xe_sync_entry *syncs = NULL;
> > @@ -143,15 +146,18 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	struct drm_exec exec;
> >   	u32 i, num_syncs = 0;
> >   	struct xe_sched_job *job;
> > -	struct dma_fence *rebind_fence;
> > +	struct dma_fence *rebind_fence, *job_fence;
> >   	struct xe_vm *vm;
> > -	bool write_locked;
> > +	bool write_locked, skip_job_put = false;
> > +	bool wait = args->syncs.flags & DRM_XE_SYNCS_FLAG_WAIT_FOR_OP;
> >   	ktime_t end = 0;
> >   	int err = 0;
> >   	if (XE_IOCTL_DBG(xe, args->extensions) ||
> > -	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
> > -	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > +	    XE_IOCTL_DBG(xe, args->pad || args->pad2[0] || args->pad2[1] || args->pad2[2]) ||
> > +	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]) ||
> > +	    XE_IOCTL_DBG(xe, args->syncs.flags & ~ALL_DRM_XE_SYNCS_FLAGS) ||
> > +	    XE_IOCTL_DBG(xe, wait && args->syncs.num_syncs))
> >   		return -EINVAL;
> >   	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> > @@ -170,8 +176,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		goto err_exec_queue;
> >   	}
> > -	if (args->num_syncs) {
> > -		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
> > +	if (args->syncs.num_syncs) {
> > +		syncs = kcalloc(args->syncs.num_syncs, sizeof(*syncs),
> > +				GFP_KERNEL);
> >   		if (!syncs) {
> >   			err = -ENOMEM;
> >   			goto err_exec_queue;
> > @@ -180,7 +187,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	vm = q->vm;
> > -	for (i = 0; i < args->num_syncs; i++) {
> > +	for (i = 0; i < args->syncs.num_syncs; i++) {
> >   		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
> >   					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
> >   					  (xe_vm_in_lr_mode(vm) ?
> > @@ -245,9 +252,17 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   				err = PTR_ERR(fence);
> >   				goto err_exec;
> >   			}
> > +
> >   			for (i = 0; i < num_syncs; i++)
> >   				xe_sync_entry_signal(&syncs[i], NULL, fence);
> > +
> >   			xe_exec_queue_last_fence_set(q, vm, fence);
> > +			if (wait) {
> > +				long timeout = dma_fence_wait(fence, true);
> > +
> > +				if (timeout < 0)
> > +					err = -EINTR;
> > +			}
> 
> Here it looks like we will rerun the same IOCTL again if we return -EINTR.
> The user-space expected action on -EINTR is to just restart the IOCTL
> without any argument changes. Solution is to add an ioctl argument cookie
> (or to skip sync vm binds and have the user just use the 0 batch buffers /
> vm_binds calls or wait for an out-fence). If you go for the cookie solution
> then IMO we should keep the -ERESTARTSYS returned from dma_fence_wait()
> since it's converted to -EINTR on return-to-user-space, and the kernel
> restarts the IOCTL automatically if there was no requested-for-delivery
> signal pending.
> 
> I think the simplest solution at this point is to skip the sync behaviour,
> in particular if we enable the 0 batch / bind possibility.
> 
> If we still want to provide it, we could add a cookie address as an
> extension to the ioctl and activate sync if present? (Just throwing up ideas
> here).
> 
> >   			dma_fence_put(fence);
> >   		}
> > @@ -331,42 +346,51 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	 * the job and let the DRM scheduler / backend clean up the job.
> >   	 */
> >   	xe_sched_job_arm(job);
> > +	job_fence = &job->drm.s_fence->finished;
> > +	if (wait)
> > +		dma_fence_get(job_fence);
> >   	if (!xe_vm_in_lr_mode(vm)) {
> >   		/* Block userptr invalidations / BO eviction */
> > -		dma_resv_add_fence(&vm->resv,
> > -				   &job->drm.s_fence->finished,
> > +		dma_resv_add_fence(&vm->resv, job_fence,
> >   				   DMA_RESV_USAGE_BOOKKEEP);
> >   		/*
> >   		 * Make implicit sync work across drivers, assuming all external
> >   		 * BOs are written as we don't pass in a read / write list.
> >   		 */
> > -		xe_vm_fence_all_extobjs(vm, &job->drm.s_fence->finished,
> > -					DMA_RESV_USAGE_WRITE);
> > +		xe_vm_fence_all_extobjs(vm, job_fence, DMA_RESV_USAGE_WRITE);
> >   	}
> >   	for (i = 0; i < num_syncs; i++)
> > -		xe_sync_entry_signal(&syncs[i], job,
> > -				     &job->drm.s_fence->finished);
> > +		xe_sync_entry_signal(&syncs[i], job, job_fence);
> >   	if (xe_exec_queue_is_lr(q))
> >   		q->ring_ops->emit_job(job);
> >   	if (!xe_vm_in_lr_mode(vm))
> > -		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
> > +		xe_exec_queue_last_fence_set(q, vm, job_fence);
> >   	xe_sched_job_push(job);
> >   	xe_vm_reactivate_rebind(vm);
> > -	if (!err && !xe_vm_in_lr_mode(vm)) {
> > +	if (!xe_vm_in_lr_mode(vm)) {
> >   		spin_lock(&xe->ttm.lru_lock);
> >   		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> >   		spin_unlock(&xe->ttm.lru_lock);
> >   	}
> > +	skip_job_put = true;
> > +	if (wait) {
> > +		long timeout = dma_fence_wait(job_fence, true);
> > +
> > +		dma_fence_put(job_fence);
> > +		if (timeout < 0)
> > +			err = -EINTR;
> > +	}
> > +
> >   err_repin:
> >   	if (!xe_vm_in_lr_mode(vm))
> >   		up_read(&vm->userptr.notifier_lock);
> >   err_put_job:
> > -	if (err)
> > +	if (err && !skip_job_put)
> >   		xe_sched_job_put(job);
> >   err_exec:
> >   	drm_exec_fini(&exec);
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 3911d14522ee..98776d02d634 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -625,10 +625,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >   	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
> >   		return -EINVAL;
> > -	if (eci[0].engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC) {
> > -		bool sync = eci[0].engine_class ==
> > -			DRM_XE_ENGINE_CLASS_VM_BIND_SYNC;
> > -
> > +	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
> >   		for_each_gt(gt, xe, id) {
> >   			struct xe_exec_queue *new;
> > @@ -654,8 +651,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >   						   args->width, hwe,
> >   						   EXEC_QUEUE_FLAG_PERSISTENT |
> >   						   EXEC_QUEUE_FLAG_VM |
> > -						   (sync ? 0 :
> > -						    EXEC_QUEUE_FLAG_VM_ASYNC) |
> >   						   (id ?
> >   						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
> >   						    0));
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 52f0927d0d9b..c78f6e8b41c4 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -74,8 +74,6 @@ struct xe_exec_queue {
> >   #define EXEC_QUEUE_FLAG_VM			BIT(4)
> >   /* child of VM queue for multi-tile VM jobs */
> >   #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
> > -/* VM jobs for this queue are asynchronous */
> > -#define EXEC_QUEUE_FLAG_VM_ASYNC		BIT(6)
> >   	/**
> >   	 * @flags: flags for this exec queue, should statically setup aside from ban
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index cf2eb44a71db..4b0c976c003a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1433,9 +1433,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> >   			struct xe_gt *gt = tile->primary_gt;
> >   			struct xe_vm *migrate_vm;
> >   			struct xe_exec_queue *q;
> > -			u32 create_flags = EXEC_QUEUE_FLAG_VM |
> > -				((flags & XE_VM_FLAG_ASYNC_DEFAULT) ?
> > -				EXEC_QUEUE_FLAG_VM_ASYNC : 0);
> > +			u32 create_flags = EXEC_QUEUE_FLAG_VM;
> >   			if (!vm->pt_root[id])
> >   				continue;
> > @@ -1835,16 +1833,10 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> >   	return ERR_PTR(err);
> >   }
> > -static bool xe_vm_sync_mode(struct xe_vm *vm, struct xe_exec_queue *q)
> > -{
> > -	return q ? !(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC) :
> > -		!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT);
> > -}
> > -
> >   static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> >   			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> >   			u32 num_syncs, bool immediate, bool first_op,
> > -			bool last_op)
> > +			bool last_op, bool async)
> >   {
> >   	struct dma_fence *fence;
> >   	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
> > @@ -1870,7 +1862,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> >   	if (last_op)
> >   		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > -	if (last_op && xe_vm_sync_mode(vm, q))
> > +	if (last_op && !async)
> >   		dma_fence_wait(fence, true);
> >   	dma_fence_put(fence);
> > @@ -1880,7 +1872,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> >   static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
> >   		      struct xe_bo *bo, struct xe_sync_entry *syncs,
> >   		      u32 num_syncs, bool immediate, bool first_op,
> > -		      bool last_op)
> > +		      bool last_op, bool async)
> >   {
> >   	int err;
> > @@ -1894,12 +1886,12 @@ static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue
> >   	}
> >   	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate, first_op,
> > -			    last_op);
> > +			    last_op, async);
> >   }
> >   static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> >   			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > -			u32 num_syncs, bool first_op, bool last_op)
> > +			u32 num_syncs, bool first_op, bool last_op, bool async)
> >   {
> >   	struct dma_fence *fence;
> >   	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
> > @@ -1914,7 +1906,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> >   	xe_vma_destroy(vma, fence);
> >   	if (last_op)
> >   		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > -	if (last_op && xe_vm_sync_mode(vm, q))
> > +	if (last_op && !async)
> >   		dma_fence_wait(fence, true);
> 
> It looks like we're dropping the error return code here.
> 

I am aware of this. This is fixed in the larger refactor of the VM bind
error handling [1]. The idea with this series is land the uAPI and get
the implementation 100% correct in the larger follow up series.

Matt

[1] https://patchwork.freedesktop.org/series/125608/

> 
> >   	dma_fence_put(fence);
> > @@ -1923,7 +1915,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> >   #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> >   				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
> > -				    DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT | \
> >   				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> >   int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > @@ -1977,8 +1968,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> >   		flags |= XE_VM_FLAG_SCRATCH_PAGE;
> >   	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
> >   		flags |= XE_VM_FLAG_LR_MODE;
> > -	if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
> > -		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
> >   	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> >   		flags |= XE_VM_FLAG_FAULT_MODE;
> > @@ -2062,7 +2051,7 @@ static const u32 region_to_mem_type[] = {
> >   static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> >   			  struct xe_exec_queue *q, u32 region,
> >   			  struct xe_sync_entry *syncs, u32 num_syncs,
> > -			  bool first_op, bool last_op)
> > +			  bool first_op, bool last_op, bool async)
> >   {
> >   	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
> >   	int err;
> > @@ -2077,7 +2066,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> >   	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated)) {
> >   		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
> > -				  true, first_op, last_op);
> > +				  true, first_op, last_op, async);
> >   	} else {
> >   		int i;
> > @@ -2400,6 +2389,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> >   		}
> >   		op->q = q;
> > +		if (async)
> > +			op->flags |= XE_VMA_OP_ASYNC;
> >   		switch (op->base.op) {
> >   		case DRM_GPUVA_OP_MAP:
> > @@ -2538,7 +2529,8 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> >   				 op->syncs, op->num_syncs,
> >   				 op->map.immediate || !xe_vm_in_fault_mode(vm),
> >   				 op->flags & XE_VMA_OP_FIRST,
> > -				 op->flags & XE_VMA_OP_LAST);
> > +				 op->flags & XE_VMA_OP_LAST,
> > +				 op->flags & XE_VMA_OP_ASYNC);
> >   		break;
> >   	case DRM_GPUVA_OP_REMAP:
> >   	{
> > @@ -2552,7 +2544,8 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> >   					   op->num_syncs,
> >   					   op->flags & XE_VMA_OP_FIRST,
> >   					   op->flags & XE_VMA_OP_LAST &&
> > -					   !prev && !next);
> > +					   !prev && !next,
> > +					   op->flags & XE_VMA_OP_ASYNC);
> >   			if (err)
> >   				break;
> >   			op->remap.unmap_done = true;
> > @@ -2563,7 +2556,8 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> >   			err = xe_vm_bind(vm, op->remap.prev, op->q,
> >   					 xe_vma_bo(op->remap.prev), op->syncs,
> >   					 op->num_syncs, true, false,
> > -					 op->flags & XE_VMA_OP_LAST && !next);
> > +					 op->flags & XE_VMA_OP_LAST && !next,
> > +					 op->flags & XE_VMA_OP_ASYNC);
> >   			op->remap.prev->gpuva.flags &= ~XE_VMA_LAST_REBIND;
> >   			if (err)
> >   				break;
> > @@ -2576,7 +2570,8 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> >   					 xe_vma_bo(op->remap.next),
> >   					 op->syncs, op->num_syncs,
> >   					 true, false,
> > -					 op->flags & XE_VMA_OP_LAST);
> > +					 op->flags & XE_VMA_OP_LAST,
> > +					 op->flags & XE_VMA_OP_ASYNC);
> >   			op->remap.next->gpuva.flags &= ~XE_VMA_LAST_REBIND;
> >   			if (err)
> >   				break;
> > @@ -2588,13 +2583,15 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> >   	case DRM_GPUVA_OP_UNMAP:
> >   		err = xe_vm_unbind(vm, vma, op->q, op->syncs,
> >   				   op->num_syncs, op->flags & XE_VMA_OP_FIRST,
> > -				   op->flags & XE_VMA_OP_LAST);
> > +				   op->flags & XE_VMA_OP_LAST,
> > +				   op->flags & XE_VMA_OP_ASYNC);
> >   		break;
> >   	case DRM_GPUVA_OP_PREFETCH:
> >   		err = xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
> >   				     op->syncs, op->num_syncs,
> >   				     op->flags & XE_VMA_OP_FIRST,
> > -				     op->flags & XE_VMA_OP_LAST);
> > +				     op->flags & XE_VMA_OP_LAST,
> > +				     op->flags & XE_VMA_OP_ASYNC);
> >   		break;
> >   	default:
> >   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > @@ -2808,16 +2805,16 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> >   #ifdef TEST_VM_ASYNC_OPS_ERROR
> >   #define SUPPORTED_FLAGS	\
> > -	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_ASYNC | \
> > -	 DRM_XE_VM_BIND_FLAG_READONLY | DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> > -	 DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
> > +	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_READONLY | \
> > +	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
> >   #else
> >   #define SUPPORTED_FLAGS	\
> > -	(DRM_XE_VM_BIND_FLAG_ASYNC | DRM_XE_VM_BIND_FLAG_READONLY | \
> > +	(DRM_XE_VM_BIND_FLAG_READONLY | \
> >   	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
> >   	 0xffff)
> >   #endif
> >   #define XE_64K_PAGE_MASK 0xffffull
> > +#define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> >   #define MAX_BINDS	512	/* FIXME: Picking random upper limit */
> > @@ -2829,7 +2826,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> >   	int err;
> >   	int i;
> > -	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > +	if (XE_IOCTL_DBG(xe, args->pad) ||
> >   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >   		return -EINVAL;
> > @@ -2857,6 +2854,14 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> >   		*bind_ops = &args->bind;
> >   	}
> > +	*async = !(args->syncs.flags & DRM_XE_SYNCS_FLAG_WAIT_FOR_OP);
> > +
> > +	if (XE_IOCTL_DBG(xe, args->syncs.flags & ~ALL_DRM_XE_SYNCS_FLAGS) ||
> > +	    XE_IOCTL_DBG(xe, !*async && args->syncs.num_syncs)) {
> > +		err = -EINVAL;
> > +		goto free_bind_ops;
> > +	}
> > +
> >   	for (i = 0; i < args->num_binds; ++i) {
> >   		u64 range = (*bind_ops)[i].range;
> >   		u64 addr = (*bind_ops)[i].addr;
> > @@ -2887,18 +2892,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> >   			goto free_bind_ops;
> >   		}
> > -		if (i == 0) {
> > -			*async = !!(flags & DRM_XE_VM_BIND_FLAG_ASYNC);
> > -			if (XE_IOCTL_DBG(xe, !*async && args->num_syncs)) {
> > -				err = -EINVAL;
> > -				goto free_bind_ops;
> > -			}
> > -		} else if (XE_IOCTL_DBG(xe, *async !=
> > -					!!(flags & DRM_XE_VM_BIND_FLAG_ASYNC))) {
> > -			err = -EINVAL;
> > -			goto free_bind_ops;
> > -		}
> > -
> >   		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
> >   		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
> >   		    XE_IOCTL_DBG(xe, obj && is_null) ||
> > @@ -2951,7 +2944,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> >   static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
> >   				       struct xe_exec_queue *q,
> >   				       struct xe_sync_entry *syncs,
> > -				       int num_syncs)
> > +				       int num_syncs, bool async)
> >   {
> >   	struct dma_fence *fence;
> >   	int i, err = 0;
> > @@ -2967,7 +2960,7 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
> >   	xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
> >   				     fence);
> > -	if (xe_vm_sync_mode(vm, q)) {
> > +	if (!async) {
> >   		long timeout = dma_fence_wait(fence, true);
> >   		if (timeout < 0)
> > @@ -3001,7 +2994,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	if (err)
> >   		return err;
> > -	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > +	if (XE_IOCTL_DBG(xe, args->pad) ||
> >   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >   		return -EINVAL;
> > @@ -3016,12 +3009,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   			err = -EINVAL;
> >   			goto put_exec_queue;
> >   		}
> > -
> > -		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > -				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
> > -			err = -EINVAL;
> > -			goto put_exec_queue;
> > -		}
> >   	}
> >   	vm = xe_vm_lookup(xef, args->vm_id);
> > @@ -3030,14 +3017,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		goto put_exec_queue;
> >   	}
> > -	if (!args->exec_queue_id) {
> > -		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > -				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
> > -			err = -EINVAL;
> > -			goto put_vm;
> > -		}
> > -	}
> > -
> >   	err = down_write_killable(&vm->lock);
> >   	if (err)
> >   		goto put_vm;
> > @@ -3127,16 +3106,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		}
> >   	}
> > -	if (args->num_syncs) {
> > -		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
> > +	if (args->syncs.num_syncs) {
> > +		syncs = kcalloc(args->syncs.num_syncs, sizeof(*syncs), GFP_KERNEL);
> >   		if (!syncs) {
> >   			err = -ENOMEM;
> >   			goto put_obj;
> >   		}
> >   	}
> > -	syncs_user = u64_to_user_ptr(args->syncs);
> > -	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
> > +	syncs_user = u64_to_user_ptr(args->syncs.syncs);
> > +	for (num_syncs = 0; num_syncs < args->syncs.num_syncs; num_syncs++) {
> >   		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
> >   					  &syncs_user[num_syncs],
> >   					  (xe_vm_in_lr_mode(vm) ?
> > @@ -3210,7 +3189,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> >   free_syncs:
> >   	if (err == -ENODATA)
> > -		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
> > +		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs,
> > +						  async);
> >   	while (num_syncs--)
> >   		xe_sync_entry_cleanup(&syncs[num_syncs]);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 23abdfd8622f..ce8b9bde7e9c 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -167,13 +167,12 @@ struct xe_vm {
> >   	 */
> >   #define XE_VM_FLAG_64K			BIT(0)
> >   #define XE_VM_FLAG_LR_MODE		BIT(1)
> > -#define XE_VM_FLAG_ASYNC_DEFAULT	BIT(2)
> > -#define XE_VM_FLAG_MIGRATION		BIT(3)
> > -#define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
> > -#define XE_VM_FLAG_FAULT_MODE		BIT(5)
> > -#define XE_VM_FLAG_BANNED		BIT(6)
> > -#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(8, 7), flags)
> > -#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(8, 7), (tile)->id)
> > +#define XE_VM_FLAG_MIGRATION		BIT(2)
> > +#define XE_VM_FLAG_SCRATCH_PAGE		BIT(3)
> > +#define XE_VM_FLAG_FAULT_MODE		BIT(4)
> > +#define XE_VM_FLAG_BANNED		BIT(5)
> > +#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
> > +#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
> >   	unsigned long flags;
> >   	/** @composite_fence_ctx: context composite fence */
> > @@ -385,6 +384,8 @@ enum xe_vma_op_flags {
> >   	XE_VMA_OP_PREV_COMMITTED	= BIT(3),
> >   	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed */
> >   	XE_VMA_OP_NEXT_COMMITTED	= BIT(4),
> > +	/** @XE_VMA_OP_ASYNC: operation is async */
> > +	XE_VMA_OP_ASYNC			= BIT(5),
> >   };
> >   /** struct xe_vma_op - VMA operation */
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index eb03a49c17a1..fd8172fe2d9a 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -141,8 +141,7 @@ struct drm_xe_engine_class_instance {
> >   	 * Kernel only classes (not actual hardware engine class). Used for
> >   	 * creating ordered queues of VM bind operations.
> >   	 */
> > -#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
> > -#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
> > +#define DRM_XE_ENGINE_CLASS_VM_BIND		5
> >   	__u16 engine_class;
> >   	__u16 engine_instance;
> > @@ -660,7 +659,6 @@ struct drm_xe_vm_create {
> >   	 * still enable recoverable pagefaults if supported by the device.
> >   	 */
> >   #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
> > -#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
> >   	/*
> >   	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
> >   	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
> > @@ -668,7 +666,7 @@ struct drm_xe_vm_create {
> >   	 * The xe driver internally uses recoverable pagefaults to implement
> >   	 * this.
> >   	 */
> > -#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
> > +#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
> >   	/** @flags: Flags */
> >   	__u32 flags;
> > @@ -776,12 +774,11 @@ struct drm_xe_vm_bind_op {
> >   	__u32 op;
> >   #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> > -#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
> >   	/*
> >   	 * Valid on a faulting VM only, do the MAP operation immediately rather
> >   	 * than deferring the MAP to the page fault handler.
> >   	 */
> > -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
> > +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> >   	/*
> >   	 * When the NULL flag is set, the page tables are setup with a special
> >   	 * bit which indicates writes are dropped and all reads return zero.  In
> > @@ -789,7 +786,7 @@ struct drm_xe_vm_bind_op {
> >   	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
> >   	 * intended to implement VK sparse bindings.
> >   	 */
> > -#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
> > +#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> >   	/** @flags: Bind flags */
> >   	__u32 flags;
> > @@ -807,6 +804,27 @@ struct drm_xe_vm_bind_op {
> >   	__u64 reserved[3];
> >   };
> > +/**
> > + * struct drm_xe_syncs - In / out syncs for IOCTLs.
> > + */
> > +struct drm_xe_syncs {
> > +	/** @num_syncs: amount of syncs to wait on */
> > +	__u32 num_syncs;
> > +
> > +	/*
> > +	 * Block in IOCTL until operation complete, num_syncs MBZ if set.
> > +	 */
> > +#define DRM_XE_SYNCS_FLAG_WAIT_FOR_OP (1 << 0)
> > +	/** @flags: Sync flags */
> > +	__u32 flags;
> > +
> > +	/** @syncs: pointer to struct drm_xe_sync array */
> > +	__u64 syncs;
> > +
> > +	/** @reserved: Reserved */
> > +	__u64 reserved[2];
> > +};
> > +
> >   struct drm_xe_vm_bind {
> >   	/** @extensions: Pointer to the first extension struct, if any */
> >   	__u64 extensions;
> > @@ -838,14 +856,8 @@ struct drm_xe_vm_bind {
> >   		__u64 vector_of_binds;
> >   	};
> > -	/** @pad: MBZ */
> > -	__u32 pad2;
> > -
> > -	/** @num_syncs: amount of syncs to wait on */
> > -	__u32 num_syncs;
> > -
> > -	/** @syncs: pointer to struct drm_xe_sync array */
> > -	__u64 syncs;
> > +	/** @syncs: syncs for bind */
> > +	struct drm_xe_syncs syncs;
> >   	/** @reserved: Reserved */
> >   	__u64 reserved[2];
> > @@ -974,14 +986,14 @@ struct drm_xe_exec {
> >   	/** @extensions: Pointer to the first extension struct, if any */
> >   	__u64 extensions;
> > +	/** @pad: MBZ */
> > +	__u32 pad;
> > +
> >   	/** @exec_queue_id: Exec queue ID for the batch buffer */
> >   	__u32 exec_queue_id;
> > -	/** @num_syncs: Amount of struct drm_xe_sync in array. */
> > -	__u32 num_syncs;
> > -
> > -	/** @syncs: Pointer to struct drm_xe_sync array. */
> > -	__u64 syncs;
> > +	/** @syncs: syncs for exec */
> > +	struct drm_xe_syncs syncs;
> >   	/**
> >   	 * @address: address of batch buffer if num_batch_buffer == 1 or an
> > @@ -995,8 +1007,8 @@ struct drm_xe_exec {
> >   	 */
> >   	__u16 num_batch_buffer;
> > -	/** @pad: MBZ */
> > -	__u16 pad[3];
> > +	/** @pad2: MBZ */
> > +	__u16 pad2[3];
> >   	/** @reserved: Reserved */
> >   	__u64 reserved[2];
