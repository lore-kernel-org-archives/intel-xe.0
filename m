Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EE1C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 19:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C35710EFC1;
	Tue, 26 Mar 2024 19:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQf9K9yA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E2110EFC1
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 19:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711480323; x=1743016323;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oBXynQoVuFhPxnlDyFZNNjZNm7X/cI9nJNjMx1mTCnU=;
 b=LQf9K9yANkQRlgbGsi+OyhHQwrU8hMciJ1/4Nv+2bCse0Swv9OrKJlpa
 EIZu1WCmIsLfwX09KK0sNdg0ErD3tvpEaG3kmb1GxObVmOWWZ2TS45rCq
 6G2UvaKxnethBLHxBq4bNmdo63AG412HBl8LVQoysfqB/BnZWR2iY744n
 L7JJGrt75e0P3PnTLO8W41GEtz7qAdTQZMErj5qCHW83qRLjpGS2uPakh
 f7gf4W7xScoljUOuByQ8JNBCMm5OWPm+jwtnBB6OyTF/0AdmfDp7Y80VI
 L4mQS05O2A12fxvvpYlpEeZDArG3aER8AYJW5pC3Qki6qJevhta+vlIcW Q==;
X-CSE-ConnectionGUID: T0TDQoeESpO+WTOIG4rr6Q==
X-CSE-MsgGUID: /CwAPj/GSFW51sISVMICDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6417901"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6417901"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 12:12:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20765665"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 12:12:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 12:12:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 12:12:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 12:12:00 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 12:12:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNySt8jzGVjZjBFT1+QlqxoCGc5FVrSgHDo1fscGHmJ/yUkFUgABRZDA0XsbrpJuHM0YiVvnJeGyfLT1mnnG7n4pAZzYLcA1IOR/1DkTr2vcNi31Ut92iclwUTO6DAnGIejkegxwxrkcta+I9heGU1gt/g5RIKF10iD7/Ex1arkSW5MC5ZuRGJW4Uz5FR5unNWz0vxNmX8nb6Oob3RsS7akODPZNo1/Jp5V4Y2JJPTOZ5ACEW62n3Bi5duRwbfbvxu/aC1STZm9guqlFdzICmT0iEm/OIddzsSq7bQ9MVyFFPrB18bZjS5n2GEI7yD8ftKz2Q46dKX2UgvajA7qiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qyp3WC1PcF0xMooQm88RbXSAsUBWlrQ/GyiNdyABOwE=;
 b=ljcALHdvWM5CaW1BYjzSYekyshfcc6CxAQkSG1dJLGTx5a90onPiJIPn4ARfgLsGYu028qfivo0Eo9WkiL0BlcMBb/1UyVRdpzJz0Fx0P5ypwWZwE/zorVxhulalDZgagHLulJvQPPuB3cV6dzI+j9rmlE8Sfr0eXqm02y3D4/EfrmnH/WlRZWQhOSDGjUV/pUv9bThchGccOwFO2Pz1rw8qNOZci8jXZ+g0zy47JQMGepP5m473ATo2A7QmuXFrKG9L8KI6GDwDMO3ylHAaa4MjYEm+o5BFYyJz60DMRwLCWegQRh2TiPxxih2vlr16VwzYOPeOplBef+n5B45Afw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6114.namprd11.prod.outlook.com (2603:10b6:930:2d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 19:11:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 19:11:58 +0000
Date: Tue, 26 Mar 2024 19:10:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 16/30] drm/xe: Use ordered WQ for TLB invalidation
 fences
Message-ID: <ZgMduJN6nyeaRRFI@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-17-matthew.brost@intel.com>
 <SA1PR11MB69911151ADB30C51C718B44892362@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB69911151ADB30C51C718B44892362@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:a03:40::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6114:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/N706xkH7Lg5EBW0zdsrBNkjfSuIcrrRKyF/Vt0V37XPGwXdCoytkbl26x6jjM4Gr60M8pIJQ9Eklm1E1Ql3Lw/H6UYrYK4ytMalsxGeBwQEcezdwBdEzBUqTLPQR7dPulJPmlGjQD9EVf//cou7crK0HYEXsVfyS7npGgO+3Ax+5uCamma7KVxoKjCnoxZ3L0oasar/m2/gUAO2hZydbL9X1QUY8Xu40Kn5XEW9rS4YBFOfbAHdnk7e7UyqGP1JcQbN6bXaBaqnvHru9Whkik/TMntdg1X9aIaxOVtFNYx8CkjUl79xAIaQIe33s8Z8N9vciNNe3YlYfg0lTxLGRVdFbE2OXEbl/5237F//RwkfmyHSqarHamdEjJF/ml2HA8XvTaTUMBONKSbmcBpzWPogLsR8QCZlZBIPvGEipXUXq+2RrN3+28Qk/R1qjzXRnvlfRhyXOyROOYhC2U4ApSMSUzWPduFlwes3qNc3KTbum/1hOBFGPshhNrkR+CutFovQcQFcbxEPNpliHuNXmVasDnR/FzNaZx6Iw71HvUcNZrdqR3iLwQ0A57iKr2cuEesTnahG5KSzBgQYnrpsQGnX/45iUA0jpY0AAvTNfpEaFvq7Hwzh1WqbChyoYzsy3Fw2xsMsOEwscZ4mcgPooupkYONwHHQnI8A3bRqxUM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?No+y+DUCfxpP2MSF9dEbbiUFXGwEB+/1LcAlqxkD2bw+GJTZThKed6EkZUT4?=
 =?us-ascii?Q?fX/mFHWnets1vD5xivFG6GcnjHjNM97Kfm1XeU2vUYLVldxieGkkvEtCoRA9?=
 =?us-ascii?Q?vnXcCNkegsMGQurZ+Pv/ngN1zCTdHEOKg6dthl6t30SnbNkbBXM31OAm6P4q?=
 =?us-ascii?Q?tdQR8XvtYatvFOVgyoedLi4FwU2CqxCgAShH/0eA9Oyy30m6/Ep4V1GheeBP?=
 =?us-ascii?Q?Nm3NbYZ8zL+nOinYFMpk3KBAU1pxU/CUymjr6T28ytUTSlxRvvbbT76CAUWK?=
 =?us-ascii?Q?0QungysN1H8dIl+MUenEmpPy5U+j2hqhA29cWmkcvlxFnsMcyzqKNpTByJ/m?=
 =?us-ascii?Q?AMUyvQMva3IwTRcokqCJIg/X3ZA4+kM4BCjGqKy+hh4OFBPNMRcQOtXGyIyI?=
 =?us-ascii?Q?jx7Sd5QifFtHiPMD55OrbbsPmTtkEpxT8WvO1/0dbaOxHwiKiaMeUcFbt0nS?=
 =?us-ascii?Q?BCXO8Eyv8nExc/d/UFpIYmCHYYtnZiwED+pvCQO1FrFLT4s4yej1prjB7lMr?=
 =?us-ascii?Q?IQmCSvsR4OGDrkQwjG6hT9i9gD76K4AAOw/hUkztN5t2JkHz0CmBsC3JIMxD?=
 =?us-ascii?Q?2FuLXCNBJB+Z5YxUbRTRpuaCt9S316jo0g2OxBpo/f3DC5eUUX3qnBEW5lD6?=
 =?us-ascii?Q?P1aWU9Rv9vZ0cC4pz0bjCdGnKtmUAdi/9MgyX19seDA3Dq0aT42Nsvm94pBo?=
 =?us-ascii?Q?p58jzKeKZG//Yb6D9lID1KbgLqiog7UcmcqZqC/oBvKQW1bsR2w+/dplbBjW?=
 =?us-ascii?Q?qw5Jngmr8a+sCm3iyPOXTtRZyyT0oiPVPf5V3JzmktdkM7Aj21nplPIw2g/B?=
 =?us-ascii?Q?804DE9BI87V9SMSIP/o556O9E0+4dzVSIV3hFQWFuxog/adafzjXPp6z979A?=
 =?us-ascii?Q?zob4lMUExRxbxrXjrW3q6TfQ+pQh9+lloqvmNdA4MQTgH8DWk2lvRFuZZtdd?=
 =?us-ascii?Q?VjyNykqPMLJHAzsAR4DMI+wLEdb+28+5k/Xa0v2/eNUnQs7LUh7AnoFuqlum?=
 =?us-ascii?Q?k/+KQD7EoWi3iS18MKeNOTyDbdNHldAKS3j/0Rknxyte2/t99/nfcbF1UXvZ?=
 =?us-ascii?Q?oW3F2Su/LaFKC1udvtNdtdiIA3q2Iu0QdB9iu3gY8sSD+UmTdX6XEWpKgckA?=
 =?us-ascii?Q?YqpG6z2sOqCZw4k6x/8LhIPdGmHQq6fx6LFQuNIjfzRiyxbc+8PvCncDaAb/?=
 =?us-ascii?Q?83/fkhmfuDyDmTeSI6H3gR1qO+P4QJkP/eAsoj3dk+AkRVk/AnEmtWWScFli?=
 =?us-ascii?Q?rIS4DURsv4AKn44i8AhNwTRWDvl5bGGflDIJB7zfTj1ICXvd5W8MYgl8bnRz?=
 =?us-ascii?Q?crxogz54yTUKzZSkMX+sM7tJ7xBPAc3lUG4uqm86F2drNRRv0wNuqqHZqcbI?=
 =?us-ascii?Q?atI1q+tqxu+b606Fa6uEHvkS7QGcIHAYNWUIEAD+fiRNcerhRMuY5ePp4kRm?=
 =?us-ascii?Q?IjXZ0bhB0OqaeCb+VFikOLPC3EjaYeSjh3Z0BMEHckTWbaF9pwDaDxoa2sG8?=
 =?us-ascii?Q?twhMLSuPfn5MFgPeBw48QZk0s+QDNR/Cv2N3rF0HDiuDUYWD2PAtpf5h7OGd?=
 =?us-ascii?Q?yI8ojqv9Sow+0fwA1PRXJEICczVUM/2N78CY2WS+8wi2k0gYeYBj87R0kv4p?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b45f2c-98fe-42ef-b517-08dc4dc89bcd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 19:11:58.3615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdOIvd8HE5nRyEIY3ZEgeLSK1zepZWfG5Y49OCFcNplgEHoIXeqtsoY0+fw4eII4DpLq+Jp4Qpia/+yKtcDdBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6114
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

On Mon, Mar 25, 2024 at 04:30:51PM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Friday, March 8, 2024 12:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v4 16/30] drm/xe: Use ordered WQ for TLB invalidation fences
> > 
> > TLB invalidation fences need to be ordered within an exec queue and if
> > an unordered WQ is used TLB invalidation fences could be reordered. Use
> > an ordered WQ to fix this.
> 
> 
> The code change below makes sense to me. But I think we should improve the description. I think we need to explain what need to be in order and why. As I understand it, we need things to be in below order (just an example):
> 1)Gpu page table update (such as invalidate certain page table)
> 2)Invalidate tlb entries for above page table entries
> 3)Notify/call back to user fence to let user know above vm_unbind is complete.
> 
> Obviously 1) and 2) can't be re-ordered, because 2) should be triggered by 1). But 2) and 3) can be reordered if we use unordered WQ - why we want to use ordered wq here.
> 
> Simply saying TLB invalidation fences need to be ordered is too simple, at least it is hard for me to understand. Better to improve it.
> 

Let me improve this in the next rev.

Matt

> Thanks,
> Oak
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 110d6917089b..a878e2217c7f 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1107,7 +1107,7 @@ static void invalidation_fence_cb(struct dma_fence
> > *fence,
> > 
> >  	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
> >  	if (!ifence->fence->error) {
> > -		queue_work(system_wq, &ifence->work);
> > +		queue_work(ifence->gt->ordered_wq, &ifence->work);
> >  	} else {
> >  		ifence->base.base.error = ifence->fence->error;
> >  		dma_fence_signal(&ifence->base.base);
> > --
> > 2.34.1
> 
