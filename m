Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76E6C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 17:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B87C113506;
	Tue, 23 Apr 2024 17:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOfknM7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9E6113506
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 17:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713892640; x=1745428640;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1nKQa2KeJtvkX7sNWkuXUTFwPZvIbtSc0hi6Co/KGX4=;
 b=IOfknM7P0K9zT0wSRLn24AOoFANU7JqTl64nS8FOM59ZYXChNzdn4rRg
 kOdujitlxdNNiCmRnt8XdsFB4FuQO5bFA4piTUP/NDDn/wSxuZPQ1EoPD
 usYL9SQqpSbyn3534H88m8E16kX1TIDq40iQAIQ1eUETXPGZCb0MRkjs4
 G9yKeI+Ir/lB5HT4xJPTvYssZestU1RsXdRY6PLxNNDuRfv5K1roqezpj
 AIN4ThqxQs2WRZZzHeiZiC+/8lGu18oKBYdZnGvuuTNrk1hLE1BPWcx0b
 ow8575rVQ+4kqV8EtY/Z69lFWoiFuVtr/nKU5i44LFgZGVUoNcE1L9HNT Q==;
X-CSE-ConnectionGUID: wjB2fb+7SeqYPTcGAXXmwQ==
X-CSE-MsgGUID: hlGVwbppRqKObNdqCHbiIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20640039"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20640039"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 10:17:20 -0700
X-CSE-ConnectionGUID: WdeIWmsRTt+hieln2V2hRA==
X-CSE-MsgGUID: RMoAnzPuSmqlzHPP8QQjXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="61887112"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 10:17:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 10:17:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 10:17:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 10:17:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 10:17:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaiT2VJqVc3vk/WgaTlDDWoa76184568zb0jkN5ZeK//FOg3Nsk4enqK6x7z7Md9UMBE9vO1u8XePqTGZOjaTPQcwa3W2cOa0VMLef6fePrV/mhU7wNYkOT+3yHbVmH7GRhxFA4yWM827lLXgeNIlAsBoAwubO8kL4ev19Y8PfFPX78eCfvj4JafFfJV/Uqaofoz+Oj7umPjYvnVCJmw9/3bUZOA3WibM5CK0Yvt76uVQLv+9eptjOtlKwYmjI5g9+zEa36rWE9jMORfv1Zoz1r6v3w2oTpX17Uanpd6COvMvoLyOotp2tMzlX2iliCGt0UhhV0vUVnzzOvLQRhQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZ3W6ilL+s1Q+yZzIcN4j0SOVd69rkM+4zfPfjU7ImI=;
 b=oMHYXuM9H08cYT+A+6RslLEZoCbSA06+62Q1iiRh+aFVFctbZdWTbTQ79JBR/TT9C8lqEN9Jb/F/xEPgkXbeA9GAP3RlZUI0DiNaEW1Ivut2Pg26JTEMpDW4LuYkKjXuRUo5yqUWZocJc/h2WNP5gQU8DpVebYgtQOE1bu6ulxmUvIFvj9hyMRtMEKgGXkYzmYFzWDcZPRgFKL+bnCA3hpiOqrK527uELhzWdJWuoHAGP8mLctv3QVUMr+5i2v1cMRY4zxVRtqzVeq2c8LCe17YvwhDTwQadrQNQh0C7PQFeLv6JUfof6aRz2DipU6ZcCJ7WwvKTr4e4MtecJ29kWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4881.namprd11.prod.outlook.com (2603:10b6:303:91::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 17:17:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Tue, 23 Apr 2024
 17:17:16 +0000
Date: Tue, 23 Apr 2024 17:16:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vm: Use xe_vm_lock() helper for locking
Message-ID: <Zifs/D2+T9qwZNEj@DUT025-TGLU.fm.intel.com>
References: <20240423070332.2036539-1-himal.prasad.ghimiray@intel.com>
 <855xw8m7ep.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <855xw8m7ep.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR16CA0014.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e6cc712-08d0-4dc4-3e97-08dc63b939a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xDTFk98CNOem219MIIvQkm1oryKePhc5Y5hI4l1K4EvJ7xHGy/RnuwHdS87t?=
 =?us-ascii?Q?2382iXKYayled2tkSOZ0O7fH2SKRjGM52JU33FxbOEfdG+/Vn7pY3Ma/Pd6n?=
 =?us-ascii?Q?l5NZ1G3IjCZCAanTXc2WH3TScjYgSrf5TluzBX1vXn+kibouP2GQ0UPSak/P?=
 =?us-ascii?Q?2fPYDbqJkLLi8cNc+huBEEM2dYzbm8JTVT/YEDbEcaZmAbJmGsTRuJ9cizhP?=
 =?us-ascii?Q?nzwBBz+POHbcxXVf4Y3keCQ+u/fJtDsRS09wNflbbZz/+OEQARVEGJ81J23P?=
 =?us-ascii?Q?STIus4psEe+J3PjYewTSz7HJ/FRwk64+t/2HAWtqx6X7UaDuXfHUr2i5zEZK?=
 =?us-ascii?Q?smT0Gm4CN7sUI9srmMWbzCCZkFTymL8rJOKJwtuY9E06z45rzvvXKhlyaCuK?=
 =?us-ascii?Q?g134rZQC6olNR4REUM39yatAerWqwPsFpVLwUAT1a+LGsLw1P4uatdxQgqCD?=
 =?us-ascii?Q?/ckDMbmH84i4K8SXxhEQRw5rB/A6IJ58iV+V0U4nSRb2FZR5TyT/Hr030IXj?=
 =?us-ascii?Q?KcN569w2K4oiuiUUE6HWKgFjuQiaO4OXuX7JgsuTVLy49uSr8FBTYQXlUdaM?=
 =?us-ascii?Q?n1IBEa4a2K4wP8vVJSHa0Wdpl5OYxh8BHwdJPvXWQg0BY73x/COX0kyjRL/I?=
 =?us-ascii?Q?4ZaBesKqZ46p8VteXWW63o9XbdxvtAdGgYmvFsufSSgT9LfTrND7aohio0Ji?=
 =?us-ascii?Q?U3wzugcZK4HWa2y48x60eRqpisMPDe0AVuj5RzzA1PoZqYAXqy+GP3Vpk9GT?=
 =?us-ascii?Q?OVcroWDhlMXP85KQMMCgXtW+XqZOOjxm8nfOrFgUD90Arq2k0u8BUy+M3CLo?=
 =?us-ascii?Q?juzDc6zmlp96SdcNes5urnoll2U18Ih08AnNKEaxuLLiJKr1j8SHaVFDy4I6?=
 =?us-ascii?Q?YtegWcWEbbyZ4f+RRz1TqBVVABF5XeHsQQKXbOaKXws6e4oIhImiZLvOyBDa?=
 =?us-ascii?Q?QTBwsfpkVnWcMaDnAfAzcX2+FrRtWU+9My40dc3iV+JRD/ovBLYyEEbgKZwF?=
 =?us-ascii?Q?ETU4HZ3UqtPFhuPTHKL/niXqLQQVm7BNcSJCput6KpPam5DFaRN0pUxfcA3G?=
 =?us-ascii?Q?IIkwed8qbQlPDQm+S0PCZvgUd5XkNXfI+18bgW6qaWOLhUxDKAmUrG/LkFo/?=
 =?us-ascii?Q?2baKB7j/CodWuCy96UAcihhxmh1RfGN1f6CAYSKWMsf+UQ09on88PyJGN5Hb?=
 =?us-ascii?Q?NZiZdTpUcihnmFiY/tZAnSX3lFBF4XNPJizJwEl0ODpXFv58LByQ2uwwqVoR?=
 =?us-ascii?Q?ixuxo5OiVt4Odur511TJBfOpo8AesjkaGIQHH4ZdCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mfs63rPR7RozhoEtiTaYMdWUGOibxqLthsiNyN0oBL1B8n4YwV875gD1IvOL?=
 =?us-ascii?Q?t9vqVbwEqpuTwaquEjMaKvPUO5KUyIodj1uLR/3rGxZVOcNC/zUV9gK4dp+I?=
 =?us-ascii?Q?924cJ1W+5i1fpjhJH5Kiw7Dkkfq2DzcwxOVhvlbOUTp6TaoN7GiQE5h9laiE?=
 =?us-ascii?Q?3dOpgcuX2qe4ZWj3B/eoAg2rFCc7hjFIqcYJwcKu9QSfUA6g6o8k9cvBrpbD?=
 =?us-ascii?Q?EVbNpMMxPdDeO6hM4BOlUbvZLFVo2gCkaviiqF9J3XTUM5ZILEhM+OiKJufo?=
 =?us-ascii?Q?UQizjHkFGe2i1befGG3Cjs7mWO/kxo0AcWoFHUR6kkRJzK1hbiNOqO0mQzr6?=
 =?us-ascii?Q?4U4Go2r7+jM/JShk2Q1uP4u1DSCLoIMxZ4vJqxSpEFkfTOxaPAB5Y6Ep/QAr?=
 =?us-ascii?Q?Q1hAiDwpevUJsb91c4MmXOInGSMaLoGXKNaEvBap4ZKZAnT71ERvhpR7xk8e?=
 =?us-ascii?Q?fuW15abuiXg0tcO248rMbOpKTOtzGb+VXrwLY8tSUv7fwICG0xoTn1bqLo7r?=
 =?us-ascii?Q?pWOwEqdanV80LfF2k4EZ3+RKcgwGvWObqnyYsUHA3SS2d7sbTxVnCvKnRYSt?=
 =?us-ascii?Q?dw58Myu5BYvL9TqkUg4no0DglmRAYcjUgvH7e71D77ohO4KJ2+xgAh39Bjqy?=
 =?us-ascii?Q?cEyDgP668KYSUO52AQL/I9V6qLEiNltxh1k1n5uB+bjxqtVhBcLaR6BRrTVv?=
 =?us-ascii?Q?nbdJ07x+kly5O7I1kas60T97yxCTns1yScuBv8k2KPG6NXIQ0dp+EaifJ2Zb?=
 =?us-ascii?Q?YwM3/EjgrKoQdC6JHsToNHfMC4dH93R5vbRiAJxz9LDXOBonsWO281cYYivp?=
 =?us-ascii?Q?w8zmOFFZ17qjPvlQ5+lSfrBzxbIrlupE079K8EBBus2CvpP4iqAGLEwPmZhq?=
 =?us-ascii?Q?ymuGOMMlGabzlEQOVktQiB0DAAlgacTrGG66mdzSDbDBEG0+tXvsWMK6B3QO?=
 =?us-ascii?Q?RYfhSxkIwcTzCCShLru1tqAS1Gi6XzbcU/Fa9YoabXWakoMnybxqnQK2/1mG?=
 =?us-ascii?Q?IQGD8VCNtb6JWyoR4Q+dsC/a5Z3TNXcoA4mzzDg4eI8ZX4+2Yo0gjcEx8sDY?=
 =?us-ascii?Q?Pq20qRqoTWrgjXsnis+d83u6+P94Khbg/5Yfm08+3ZFhFqJGvjvwbo0IuFC+?=
 =?us-ascii?Q?X0QUnr9FWshJiMpNEr1kwxboLo2wD+1mqRYppgPc34rj6ZY48Jp5e9YMSdwo?=
 =?us-ascii?Q?GQi7cLQkWtIk6g9aH1HagvRv656p+XtVUb6gndrfJGd9k3D923oDp4ZWCVx7?=
 =?us-ascii?Q?TNDSpW+Lcqy0WnSVlyNZmo+5y2uBisWhNi/UxVZ0CckJsu7LXca8dMrfw1Gd?=
 =?us-ascii?Q?5Zu/Q6Ber7aNWH411Q7tCoIezJqUcKR6Cf56rCO06PQAbSODibqrMSZ51aDO?=
 =?us-ascii?Q?SwmS5DD0+f/+E4830ZjRUT2thZkcqn+DzJbroMoFru1V7mDmOqtelkOzz0gJ?=
 =?us-ascii?Q?DJY/sDjti78NNXXeIq7oABt1RBpuWsz149Fs5LKrNPIwyIirEnx0rcVyb/Lm?=
 =?us-ascii?Q?4cpW3e8/emTqH46/EnjGOyjSvOaWTiFcr8r6LyRq7Aoz7CjIa5su6vcSg9RS?=
 =?us-ascii?Q?cHRkmcviPefvsDXQ0WdyXVDXFKw28w+46elSQyrmeThP99/JRBOhmTOUQf8j?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6cc712-08d0-4dc4-3e97-08dc63b939a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 17:17:16.8515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWr5JVdo8wAhWqGfrguILHjo7p7X2QSOF9lLj3c6AHhRCQ3OyzEbprhrC7ScWSAzztfMFxlHN/x/GdAO7QUQPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4881
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

On Tue, Apr 23, 2024 at 08:21:34AM -0700, Dixit, Ashutosh wrote:
> On Tue, 23 Apr 2024 00:03:32 -0700, Himal Prasad Ghimiray wrote:
> >
> 
> Hi Himal,
> 
> > There is no change in functionality. Using the helper function
> > defined within the driver.
> >
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 85d6f359142d..e9c8dc6d7b83 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1279,7 +1279,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> >
> >	drm_gem_object_put(vm_resv_obj);
> >
> > -	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
> > +	err = xe_vm_lock(vm, true);
> >	if (err)
> >		goto err_close;
> 
> But isn't dma_resv_lock coupled with dma_resv_unlock? So that should also
> be changed, if at all? And what about other places in Xe which still

Yes, this function should be updated with s/dma_resv_unlock/xe_vm_unlock
now.

> contain dma_resv_lock_interruptible?
> 

I found two places that also could be updated to use the locking
wrappers:

xe_lrc_snapshot_capture_delayed should be updated with xe_bo_lock
xe_vm_snapshot_capture_delayed should be updated with xe_bo_lock

Matt

> Ashutosh
