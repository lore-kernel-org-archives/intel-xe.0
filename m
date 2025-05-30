Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64EEC54FB3
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 00:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EC110E251;
	Fri, 30 May 2025 00:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8fp1er/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F5B10E17A
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 00:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748564583; x=1780100583;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y4e+xowyhBi77vZLG2qtCZQr+EF469Y2LhO3z0RIBm4=;
 b=i8fp1er/G4nRwufNXVcWePQu4YIbRbNVwZWUcdoKoyAWJgPcgedAxnIp
 Qj6f48ceAXRvg0B3AS/BvcxOulCKKA9bGmoP/IHF+F5R0ZzvkOnMtzb4f
 hHdj23wsuuNAN7g0FaFfK7AF5rGji8zQe18pZTkp4Hv6n6+2tB31VDrHk
 F9GoCswwVKgTr01P/9rQsUCc9hgg6wgHqnBCt21r4jNuYFTYFyrq+eZVa
 hxgZKDJ0Fux49h5yEFj7VaYEdZIMfclRjHId7VcrJ3Qz6fzSsS8MIYZTn
 pDSITKoejmBj0NhIf852aV7DpMcY9ops5mI7F5Cg711hWYG1blW6m07rR g==;
X-CSE-ConnectionGUID: oBU18HJuR1uap556D4YLRA==
X-CSE-MsgGUID: GkB2vuTBQw2T7Zy0PUTlCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50702836"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="50702836"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 17:23:02 -0700
X-CSE-ConnectionGUID: dOTfOG/WSFiqKqXaZuMxgA==
X-CSE-MsgGUID: hli1kRrxT/OUxcAl7awZug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="148997121"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 17:23:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 17:23:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 17:23:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.87)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 17:23:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdSwL4Y82yZmJOpF2vYqF0VKtVJaO+fejwtrRjgSKHNRz2U7ottRkm+ZXIcZi5wkokjS5VgrrvkieDVdEwhmcAYyWmG8WJDXaRtYockrFBdaNUbEI1eJ9wVz49fWy7XKdhtl+Gx95aKcXXJnX02goeSj5l341haE1iBy++2hK1XexjaJAEZ+6I6hPP/WApW1JdJ+iSYRbnSmOsiGS93SEhSDLV7h/iefuiLypm6Q7Uz/iKq5VgaZD0qTOztNijlEOqGqidSLId35gHm5C9g8BYfixGkpb1IzNh03fBABuJsGcSaUWcpZ/4pKpYos+N0og9v8V40dgUc2TNDCc/FijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sa9o9bi8mO6Gv3xWItQw06fAklennM1vYBBgRPMm/QI=;
 b=C1hmwwm+lJb8QoBHWtQOYZpbgK5oY6z6sDzusr8mntx2rLfrGpMtYqfztboVY3n2JCNe/FYmhULIPKhKy1pQVhNRS9SghHOa+IA8o1GEnSNciv5pB/mcKsH1OQ/ukxOybAUHLy6dafqIZDWJijNPMvx1uSdy3yJfkmgWl+Kika4leSpiLiL0U9bx+L4xqBh3+I1NcRLT4eNmWmKsY55rgZAmAw4Rv/Y149GkuKLfbuzUE3tgmf+c0am+o/NpeS3o3tyvf8rxGHMLOA/YJwYSuTadDdbEzSkuexIzP2vWTldR8REbFKU+adODRWool0xTBvHI5ZpyuOYUcNfALWGexg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 00:22:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 00:22:58 +0000
Date: Thu, 29 May 2025 17:24:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 14/19] drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory
 attribute
Message-ID: <aDj6vnlcNZruffmC@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-15-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-15-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:303:8f::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: dc85acaa-6a01-462f-829e-08dd9f102167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w0x5tx9bUzWIwIfUuc7RXsUmP/QY1vNPa0gWkzkNzMEeCwf8xuCLUpc8ApcP?=
 =?us-ascii?Q?sCVcMW9HTRzTNgjl0IBmXYeyF/ft9/BjPjt6zcoltVovSpTfnunpnV4fI729?=
 =?us-ascii?Q?zrzrobaGjlPissRNlIzFS/O1HBJNAxM4rkK6tbq9u7wUBB64IHSpl1E9sCn+?=
 =?us-ascii?Q?ZBgg+O/ofVPA05TMkn3UyN7z/8eoxo58UK8Ktz32pkKaf2L5f54z7BRYvzEB?=
 =?us-ascii?Q?xP9XJBDSKY2l5P1qb9mbTraPvCZUyTr6qHyFP/fb+BpXpHIUQbocGl40fDrh?=
 =?us-ascii?Q?S7hvPhTryZrvrb7d6Zdu0qlmn6AYVA/gFC90bIpgYSCQshONTwJcyEofWEUA?=
 =?us-ascii?Q?r/uCCW4jz3ImehUsta5ORJBkULdKCNmKx/Wv2pfNq9oKSrfZ81zJtDI6FaoS?=
 =?us-ascii?Q?k908BVbB2n+N897DNV3pnHGWnqLxldTQYAmXz7IxELbXhURUJmgI0TL5roi2?=
 =?us-ascii?Q?5VakXO74tu+13GdfIo6jBjUBFuQr1wFQIBs6tNOjVkk0ChDmtMsaH8MF8srt?=
 =?us-ascii?Q?q4DOYTaFAItRWgaU3d2qjXK0+QCeChAHy1SB0in7dgw90TITs2RWpymKNQ+l?=
 =?us-ascii?Q?hYqGA0kyS/oiCGzYzueXd1nL32XbAxFpG/gVccZwyZRpnxdHXvL3WerMBeOG?=
 =?us-ascii?Q?ZRjvHe2bDYZuQrCXkKIvgdIrJzmBetOB12LCmCWcz/Rq96nOshYQGZx6ODj5?=
 =?us-ascii?Q?bxeT0r7LN0j5QBsm6YLkv5l+brYUdbwoxKBM3CqG/uO14JlG0f1qoFS5gfIC?=
 =?us-ascii?Q?wc2dDfTaWl/a7kF2tpLI9yesahKE6UAM3C/4zhmIH/P/ltfcm031dYfy0QGR?=
 =?us-ascii?Q?iP/qsZBq00icFPtCD/eLFwHH9NlzsmaCqrSwX+q8mEwj2XL139ghwzL7r31R?=
 =?us-ascii?Q?tc/cSbtWkSH33aQoamEQYayMQ/LhkUNpRnaxsh5REtOVYpDQP58NcawYdXTj?=
 =?us-ascii?Q?ADy/jvdWrNsGq5J6XMXLLzDdM23LTm3/SO8POFhAjYOuLG5QApJwejoBsbFo?=
 =?us-ascii?Q?GydzSolT2Fqh6RI4zHTbj3a/jtdFlXPo5uj7qHf6heVlPP4nbTeSasSfsZWZ?=
 =?us-ascii?Q?WHwDLjhsFa5o5qV3KHC93qvAQYhgEFCHePwroJ8ZNwWt1McV1qx2Y0Z9MCoi?=
 =?us-ascii?Q?CMaQFAYk2nLoVOxFsrWWL6cJacytfq4mFzV10K9SrpEv4h7NH/sWYlhNtOEt?=
 =?us-ascii?Q?R+hKbNkpHIxKzXDKPkPqlZrC8ITSk5LD2+P4K9HRQaJ5jhT9l74GVMWTXrex?=
 =?us-ascii?Q?vw/clLVQS5tfh0F1CgJx/CQi0RNVOtFPkG2qyp/TG2+W5Y5sigXVdq9N4Nfc?=
 =?us-ascii?Q?rw5OxMHuVmNL5rcjVG/TwB/K3IdF94tUhKeUuKAPJtLqaMPlCwOReSFzr0Fa?=
 =?us-ascii?Q?g3ceVTFWpgRQTOd94AzWhr9CQpUQJZPhWSYwoEokUJC7BHkIWwI+fMqBUf/E?=
 =?us-ascii?Q?AAQuSLL9UL0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bjeotb/3t/2rkUrqoPf4dOUP/dQJGWkFJGrkiMzGr4mEVzXCr2JkDsFGDR3m?=
 =?us-ascii?Q?01yy7H9T1KRJEHu+QgmSjmUkSH22Ew5w8nAg55aKPkXpK1e4IAUQETDSAlGB?=
 =?us-ascii?Q?5u9ccd3EfEF51b34ULrhKjq8HI15HSzwhzWltZCgfqN6ajQ265CV1tmirGMY?=
 =?us-ascii?Q?1RLk1I5kICBfQC3xnO6m5qgMHfg2KLQwbaFbU+PN96e4vm9qXnVIQxWJv3b3?=
 =?us-ascii?Q?I8paeEDaKx2a+jeZI+x8Bb7bGzD+lk+f6zDLEnUlgsqm+SvYntrPO1Q+lq1g?=
 =?us-ascii?Q?6y1jU5DITFoNHz82MZxdxoPFRGzardPPxjFmK7t37MhhsLtYpGEyWimwKt6W?=
 =?us-ascii?Q?WKfDEUcIYrY4CaceBjHSr4DWZqkUo24k/YPRjL3Uh/8yoEEOURmUVcHz8Uka?=
 =?us-ascii?Q?2uB6MhDmilpmxRKkrVc77i5Ypv7Be940kZp6273W7M7/GJWM4en+s78z7yjk?=
 =?us-ascii?Q?3oc5DzhBAkdWX724/6u9zWpERuNEipUIGYotpqmeXDx6oCTEoIej/HsuICq/?=
 =?us-ascii?Q?FDmcnomIqNf5izM0vRzjpcaWlJjpevkog7k5xq6OyOkXmHQTkrNYk+jYm6FJ?=
 =?us-ascii?Q?UiepM5UM6f7VNi00cjvhlf1rp921ykfUME3/IijrwSzNACsBEGgXHBzKVB7r?=
 =?us-ascii?Q?FLcLQURmAwQ3zAA6PNDw3ed+nEC5V4j+e49lZZNy4xLkS316VACZ2D2ztBMM?=
 =?us-ascii?Q?6n1iJrV4Ouy1PRtEC3dhVb0uYmB++5sAoHdeI10/TlyBRHK66gu+tfJhtvIy?=
 =?us-ascii?Q?RUJUjq6tLZ2+Gl1II3l/0EZOMQVGr5giG3bm1t6nZVRbeviWUCZEnqu9q2Y7?=
 =?us-ascii?Q?TfAB+gjxu/S3TXwlfzeeWg8jbXkOvr2QLHZ10ZWrNDkUdl8rXGMeS5UjJKLz?=
 =?us-ascii?Q?HU1Vl8IKyXknQRfg+n3Hs1P3+msRyYi/OSqs/RcRWrfPC5USe7di/Wf2Lrfj?=
 =?us-ascii?Q?cEZfglo6LHF9ADrU4TBoaW5HMrhQixMx1ZwDkPeFDuljz1+kRWCkTSQ7i/94?=
 =?us-ascii?Q?vryH8g31LESeWcLCJ+mYOMtWD5pUuhteWIBus2/G8W6oYJyshK3sa5zodsF+?=
 =?us-ascii?Q?IqWRqh2WA1oTpPnofYgvqvnU/o2rdO41aCiTynQSBOauzywIdvrQjPR4/M67?=
 =?us-ascii?Q?uAJ0UrJrBmRgFQ2SmU9C+h7zpPhD4JNv1PbW90eG4ggaOGW6tth2F+WW3UAP?=
 =?us-ascii?Q?p0iUgXQkvGcA2cFD+FlZ+k93c0oRfUEae91HenfxdJ1FYYQ9F5HoV2GR0Ds6?=
 =?us-ascii?Q?dTyOrLyOQPf5z9/gAiJynQIiV9usr+u/ch0Wxb0n7tU2DUXEIbas5JLf0pxF?=
 =?us-ascii?Q?z2zd+MDxL9vSXjdggPjbTsk9ST6mJy9LGNN+vFiZfYwPB6bb3vm2KIZjNXbH?=
 =?us-ascii?Q?k5QIoS0ksRZrU4DBYoLxzu0rviL+rj3t7JyXgsFF9bsPa6tNGJ3QFkOuYvJ2?=
 =?us-ascii?Q?pwy3ExylpdbuYPJUdzl6dYBaPPiJH9754E7UpOeU3gMyhiNYvOBzt6yA9mok?=
 =?us-ascii?Q?2fW5bA5oSQPDD7H5PEhJUFKqWcsx1H5sg5AbO07y5V/SrFMYmHyKNlqRowDZ?=
 =?us-ascii?Q?i/sOj9oloG5miTgtBWtF4mSsi2qLM5AcjFwv00Jqqa1YixujzcWBe2D0bEM3?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc85acaa-6a01-462f-829e-08dd9f102167
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 00:22:58.7345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTdEqf0g8Sq65GwyMSJOp1VlN6VG0hGH4FvD5yOPhPWffjdoqQAptT40tss1gTJdeh7h5lfXZkzbBwvYpL9fuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
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

On Tue, May 27, 2025 at 10:09:58PM +0530, Himal Prasad Ghimiray wrote:
> This attributes sets the pat_index for the svm used vma range, which is
> utilized to ascertain the coherence.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 1b31e41b3331..0f0b94cb43f2 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -98,7 +98,13 @@ static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  			     struct xe_vma **vmas, int num_vmas,
>  			     struct drm_xe_madvise_ops ops)
>  {
> -	/* Implementation pending */
> +	int i;
> +
> +	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_PAT);
> +
> +	for (i = 0; i < num_vmas; i++)
> +		vmas[i]->attr.pat_index = ops.pat_index.val;
> +

Again as discussed in other patches maybe drop the return value on the
vfuncs.

But you will need to validate the pat_index ahead of this like VM bind
does:

coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
	err = -EINVAL;
	goto free_bind_ops;
}

if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY)) {
	err = -EINVAL;
	goto free_bind_ops;
}

Matt

>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
