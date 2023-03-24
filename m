Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC05C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 16:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4884C10E046;
	Fri, 24 Mar 2023 16:28:07 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE77710E046
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 16:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679675285; x=1711211285;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+7XQfd/+XoVxc+0ifLnWt5dNZIQzBLPcxugHRQuYsFc=;
 b=D59ErXOPIW7MgwjcLf82iKBW3Z7A5pXBhwU/df6/lmwdbKrDUSby9CWJ
 y/ugdMup5DP2k0qDOxhsHL6Ryb9Lw6RkGvgUIO5Td7ApukY6lmsHX+S3S
 aDpV52/FobwPLOvVLYI+mMneTh7X+OpZPjYaKIteSdAQZgZ1Di5liqaAJ
 41l1QIWWL75KDdBeUJverk8ulJQEHkUt2e/6g3jbQD2bDHEiD10vzCoSM
 3YmtuiTrQUjEVP23SJCbSAVI4FX+rhm0dY3TgfPOeJdksYcEO7pwPLAUY
 YbYIqJxHR7ZDYKhgQ7dIg3tDYych/rfY1fg/o5HHiTRsy1HdPCM6Kku2c g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="328243413"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="328243413"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 09:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="682746436"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="682746436"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 24 Mar 2023 09:27:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 09:27:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 09:27:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 09:27:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTBQ5FsPvbWWh6H8nZFexTvBEUjDY8f5uxn5rJbQlFSGeIvI8YEww0QIEhVtwPuaMpIdw/Yg3R+Ua2Buz17vUA9d246ECV75X6z6G32sOTOmPuKC4xzSQFRdPDL7sb30H6EeYjQ7Fg6NOlKL8WnmMpp9wmqfjk1uYOJdb7aPOa4CPZHssk72yu00jFc4BzDZE1yDHD8RcDaX0DU3D+bXaX7lPUk/pwQftJrDluhIgfHZB/mk234Nb2mbYcxAPOJqJFD4zpMjUAjd8F3G8zxK2pGkN8MmNVihDX2eZZ4QF0CH3Q/9tGhbRTdVd0o1bYdWxv5LsJz0ZqsUzZms4Lm9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THvAm1qfio4Io+OKjOx8/B1sabrym7fbgpImQcQxQQA=;
 b=FYEasPVF7i4NCVgb8RfZNfPrfvq8W9tS6I88K0thoet6XSo6j0dDlTNwdkaEeoh9VmYx5uFQPAEEtNcUlqLgVS5J/trs5cZDCl+ldCAGyssRcRWDWouBbyerY3eLk4thc2d6dcLJ4Z6Mqyy7Mo0yVfd+tJLwDC+c/JyxYm/6o2Y1EoH5dAflMW4P4n1OK0cLTn0F20ChcxuvbxMCO3HUES15KkBGQBAamL9XqBJwuRtVSp9PTQBNaG2Uw98H/5EawlmNsB2wWn0SaBFegK3G98Ellg7UNfdK2vA4/Xr0vSmRxalxC6wWCaunhDzsKESK3Ex+5EsPczZMiT3ohko/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7729.namprd11.prod.outlook.com (2603:10b6:930:70::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 16:27:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 16:27:47 +0000
Date: Fri, 24 Mar 2023 16:27:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ZB3PXOit5CvoYjWv@DUT025-TGLU.fm.intel.com>
References: <20230321234217.692726-1-matthew.brost@intel.com>
 <20230321234217.692726-3-matthew.brost@intel.com>
 <ZB0+yQ4RbWJkwwOZ@nvishwa1-DESK>
 <ZB1PRMW0fmWvuVs3@DUT025-TGLU.fm.intel.com>
 <884e2a18-25d2-864f-eb9a-e3daf1e0d87f@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <884e2a18-25d2-864f-eb9a-e3daf1e0d87f@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e9859f-c8a5-49ec-c0e6-08db2c84b460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9bu2LnURXCUEF4/wBClKfJCAQPCGPr5G1/k/Jej3s8BOwbBm170ilreD6ueQbWjbVY3c0lm6yJhZEQgYoJ3a7rIfUKlFFkXG/65B2489geZNO0mzu5Hcpyy4kzH6tHlIFvztcmD/catY76b54OpHDOqvtnoi7S5HWzdCPamINjSxqBb4I0uaeyb3li7EF/ZIZVaxB095XI48uhFCCQnf3olBX4cyuhx+qqNd1lIAXs48owAo2t/h7NEQGLg+Drxa7VdXiMPpVbRVSBzFywKqBs1ImEuiNyPJmh8v+wm68QJdYCSGm2L6GL+11tu/mku3Vgha/qkV6z6m+PInOuiSI/88Dja3PBLoSn862wcymqr8PV7YwjGvrlvfkD3JK9GfO/rfx34TksVZdE6TqM2v1Hwm4Xk/+Lq3Qi68riE4+jPc/VLn4uf0uT2e/Ss8Bn3+lJUMKTmqbIFwWmzXVcffMoS1CMcGuDe5HO2ZXCSI08K/fgwZtR8VgA1fzlo5zAd1Cp0DP979HAfCIxkvfyXLgk0K+vPyznNVRG7bGoPDiNPJh/wdPZ8toeZXQzwPGUazaQgRGN8TtANZS7UddcaCO1Ns3KQRLYnrHcxV7NtCZSNmE/LDxzMg/zdNC5iYX9ZXQk8x8pUgkYmjY0ov+5h2kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199018)(8676002)(4326008)(66946007)(66556008)(6916009)(41300700001)(5660300002)(44832011)(316002)(82960400001)(53546011)(6666004)(8936002)(6512007)(26005)(6506007)(186003)(66476007)(478600001)(6486002)(83380400001)(86362001)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GlKseIZRljFlFzET4SF6WKxkumUJCk9YtxiE+MqEmwC79mpKaXKMuWJCeUle?=
 =?us-ascii?Q?rbzHr1w3tJiyrRq9eVnPcF4wALABU7+7/nAk+vAAG3jQNZZHltvQVorN+nQv?=
 =?us-ascii?Q?bVM1sg+bbBpVShTGBKv0b/zlVgMkLl2qvQB6dtt18U+mZDZpBnozU77ORcUM?=
 =?us-ascii?Q?8u2WX14sny1cinvLnYRt7vXB4UYb1IlWMSFN78u/F4/1eWiUqoZQHhbuWBh/?=
 =?us-ascii?Q?6hLDX9LbJp5srucRCtCo0GOJT9GRSIXqumc4OFrmXVIqZ+A2MSOiDU5R4YES?=
 =?us-ascii?Q?Xo0MP8gjsyfTmO2AXLOI48ANg/d6bVXvVc5B/JPkkyUCvOijuK4X47W0hDK4?=
 =?us-ascii?Q?OfjHgxN3Ulp6FQzVhF8BwJMU39ZwG9VYvuf24A5v4L1ke8NJvNRdhF4+NQY1?=
 =?us-ascii?Q?GFlklS2dcP/Xt1G9UNUunAUIdaJ8E2WgEn3+zVy/wrt0ZSXPRBu4ZIzYV5WE?=
 =?us-ascii?Q?yFZF9sAs+lWoGdcDJlZZ96yZQuzJHEfFic3lOhAaQgNWt0IYKbZTwJfNQFcW?=
 =?us-ascii?Q?du8CjiK4bJyNa++04aAiLA6pgIOuY4ModdO231GzR7jXsWMyYQLSZzo0hrHB?=
 =?us-ascii?Q?5TiQUcrM0mrHhMH5QpJwucpMSUmJQd764aw0W31T+FhEg8k1dXDPoUxqenhO?=
 =?us-ascii?Q?utS3X78ptb46zDwC2HDXaZfML2odJNHAmvl2Xt/SskL+SLIPQu+bDwa9dN5T?=
 =?us-ascii?Q?fyK/epEsL/F/wu0D9bCL0vrY1rGNeGYYtMHN3OOH8W/ul6AayyMNtSC55VkF?=
 =?us-ascii?Q?v43h26t8sYo0BqMA2ZJjidXevg+07HyY4UPJWcF8H1IEEwvm9rgiRG+/Qk3d?=
 =?us-ascii?Q?37TM/EWh+SjQrT+4Rzp1e9jq/giXxWvRMq1Siw5KvK90wlv2i363RVPPZG0R?=
 =?us-ascii?Q?/Y/8eVUP8g+hmwcESqkzu577G1SVzHmJMCKuDEIFqchXljCxTKlVZKSYUMhU?=
 =?us-ascii?Q?71r3haxsBmsIzOLbv9EAXGJM+F1skCVPkJgEtOQfFCOJAhJ47Q8dReYqVR9l?=
 =?us-ascii?Q?UAqK4pdWfSFZTFmDo1jWSU1ei7gWgYEgnbZ9RH3c9yRJfh+YIifxPed73Owz?=
 =?us-ascii?Q?kFenyxaPduUUmFByE8m1k8tYIz1pYXMXRxJQfWtZTPel0mH9x/Ngg4r/YB/c?=
 =?us-ascii?Q?IQP57Cal3Z4rrvbtp0IqYJsU1SQDdl8QXE0Xh6diuLqkqvXbVa9JwFvCRyG3?=
 =?us-ascii?Q?PpaCMX101HAtdY72+IDEz14XNfaoKf9hcwzlsGJAvG8kkwt83kgb0/nNpBO+?=
 =?us-ascii?Q?eZVxY50dwbW9OVeJVtGK5rBdHtq0PYhZjjIshLtflwB0ZqE0jIlmKYrCpwcY?=
 =?us-ascii?Q?UcbH4JcvQCbgI7r3FG1EeJ2azoPpWc/g/dIQlWktDQfIAjs4pxqnYARNEZ/4?=
 =?us-ascii?Q?Kpfx6GEB6ZzOBuypC29fIvE4prRuEd8g+2zzbzexRXSMR/9kJumVQ13dbMdL?=
 =?us-ascii?Q?HH11ysmx9fe7e4siu3AbsyhqZ6flIbhcp7Wfx4uG/IS47gf7NObyY3hyzJLn?=
 =?us-ascii?Q?fVOdqjwX0hF9kiSze6ofGvlYuHyWC4gjVfiFRfMVqGrWhJyUR2Kw0fhXoqrc?=
 =?us-ascii?Q?FBQvgJDCf+msIvuw/DiHJeJKjZzfrwTws8hEFL52YQXqgHDmYEBQcz0XKLbb?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e9859f-c8a5-49ec-c0e6-08db2c84b460
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 16:27:47.8632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaCuYPzxEF2YBQGIj0XUvpu1aeFbg69R1x+0ZCn5CJ1/aJu+gmsg+auDjYoC0CqDikjd/bN2keJcdBT8ZjTprg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7729
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Move in fault mode / non-fault
 mode check to xe_vm_create
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

On Fri, Mar 24, 2023 at 05:25:42PM +0100, Maarten Lankhorst wrote:
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> On 2023-03-24 08:20, Matthew Brost wrote:
> > On Thu, Mar 23, 2023 at 11:10:17PM -0700, Niranjana Vishwanathapura wrote:
> > > On Tue, Mar 21, 2023 at 04:42:17PM -0700, Matthew Brost wrote:
> > > > The check for fault mode / non-fault mode was in the VM create IOCTL
> > > > before VM creation and not under a lock. The increment was after VM
> > > > creation under the lock. This is racey. Move both the check and
> > > > increment to xe_vm_create before actual creation and have the lock for
> > > > both of these steps.
> > > > 
> > > > Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_vm.c | 45 ++++++++++++++++++++++++--------------
> > > > 1 file changed, 28 insertions(+), 17 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > index e7674612a57e..965cad81b02a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -1060,9 +1060,27 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > > > 	struct xe_gt *gt;
> > > > 	u8 id;
> > > > 
> > > > +	err = mutex_lock_interruptible(&xe->usm.lock);
> > > > +	if (err)
> > > > +		return ERR_PTR(err);
> > > > +	if (XE_IOCTL_ERR(xe, flags & XE_VM_FLAG_FAULT_MODE &&
> > > > +			 xe_device_in_non_fault_mode(xe)) ||
> > > > +	    XE_IOCTL_ERR(xe, !(flags & XE_VM_FLAG_MIGRATION) &&
> > > > +			 xe_device_in_fault_mode(xe))) {
> > > NIT...is below simplification any better?
> > > 
> > > bool fault_mode = !!(flags & XE_VM_FLAG_FAULT_MODE);
> > > if (XE_IOCTL_ERR(xe, fault_mode != xe_device_in_fault_mode(xe))
> > > 
> > Sure.
> 
> This will not work correctly when fault_mode and non_fault_mode are both
> false (eg first context created).
> 

Yep, realized this last night too and just sent an email stating that.

Matt

> I'd jsut leave this patch as it is now.
> 
> ~Maarten
> 
> > > > +		mutex_unlock(&xe->usm.lock);
> > > > +		return ERR_PTR(-EINVAL);
> > > > +	}
> > > > +	if (flags & XE_VM_FLAG_FAULT_MODE)
> > > > +		xe->usm.num_vm_in_fault_mode++;
> > > > +	else if (!(flags & XE_VM_FLAG_MIGRATION))
> > > > +		xe->usm.num_vm_in_non_fault_mode++;
> > > > +	mutex_unlock(&xe->usm.lock);
> > > > +
> > > > 	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
> > > > -	if (!vm)
> > > > -		return ERR_PTR(-ENOMEM);
> > > > +	if (!vm) {
> > > > +		err = -ENOMEM;
> > > > +		goto err_usm;
> > > > +	}
> > > > 
> > > > 	vm->xe = xe;
> > > > 	kref_init(&vm->refcount);
> > > > @@ -1182,13 +1200,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > > > 	if (number_gts > 1)
> > > > 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
> > > > 
> > > > -	mutex_lock(&xe->usm.lock);
> > > > -	if (flags & XE_VM_FLAG_FAULT_MODE)
> > > > -		xe->usm.num_vm_in_fault_mode++;
> > > > -	else if (!(flags & XE_VM_FLAG_MIGRATION))
> > > > -		xe->usm.num_vm_in_non_fault_mode++;
> > > > -	mutex_unlock(&xe->usm.lock);
> > > > -
> > > > 	trace_xe_vm_create(vm);
> > > > 
> > > > 	return vm;
> > > > @@ -1220,6 +1231,14 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > > > 		xe_device_mem_access_put(xe);
> > > > 		xe_pm_runtime_put(xe);
> > > > 	}
> > > > +err_usm:
> > > > +	mutex_lock(&xe->usm.lock);
> > > > +	if (flags & XE_VM_FLAG_FAULT_MODE)
> > > > +		xe->usm.num_vm_in_fault_mode--;
> > > > +	else if (!(flags & XE_VM_FLAG_MIGRATION))
> > > > +		xe->usm.num_vm_in_non_fault_mode--;
> > > > +	mutex_unlock(&xe->usm.lock);
> > > > +
> > > Perhaps put these counts increment/decrement blocks into functions
> > > instead of duplicating them?
> > > 
> > Sure.
> > 
> > Matt
> > > Niranjana
> > > 
> > > > 	return ERR_PTR(err);
> > > > }
> > > > 
> > > > @@ -1843,14 +1862,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > > > 			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> > > > 		return -EINVAL;
> > > > 
> > > > -	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
> > > > -			 xe_device_in_non_fault_mode(xe)))
> > > > -		return -EINVAL;
> > > > -
> > > > -	if (XE_IOCTL_ERR(xe, !(args->flags & DRM_XE_VM_CREATE_FAULT_MODE) &&
> > > > -			 xe_device_in_fault_mode(xe)))
> > > > -		return -EINVAL;
> > > > -
> > > > 	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
> > > > 			 !xe->info.supports_usm))
> > > > 		return -EINVAL;
> > > > -- 
> > > > 2.34.1
> > > > 
