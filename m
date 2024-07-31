Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B7DC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 17:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A135610E4A7;
	Wed, 31 Jul 2024 17:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvn4nXNP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F68E10E4A7
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 17:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722448355; x=1753984355;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6A0mreMO7LWGZmxl1ztZohUErgBMbY1y5Ai2ozCmZxU=;
 b=cvn4nXNPWxc8nZcTBh2O9AhZ7ivYo5uJOoD48r1ev4WIQ7klADFNkKJH
 uJC4IRXKdMM++mRGh1ztoP5jf4FFvkrB+drHd55Q2qmPB9ed+kQi4Gbqg
 kKqVItCsrQpwov1dkmONfhdJ+cfRDVCEbHV3bTEqaISTYlmMaCMWoChrn
 wNVLjBzjZmAw1Ld4700M4Y8Xax0wki1YHjiz6nCntGEDZUub8P/5ZsQwC
 Dts1vkBkBTTOlki75O0jx6lblQNTD2vBbOAD4TnipdjqgDIRSJo5yF6mO
 54BwwcKgXAkzIg0osp9woPjmqXeokFaK03Na7ZWGpPOfn3x5/xqCBL/To Q==;
X-CSE-ConnectionGUID: DMb26gKMQmClnYtcMy10Xg==
X-CSE-MsgGUID: Kc8wMtlkTYKj5aAhHRk/Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31010364"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31010364"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 10:52:34 -0700
X-CSE-ConnectionGUID: qbvo4P9SSQ+gUHHZuEtFNA==
X-CSE-MsgGUID: FW6CyLeaTqusG/bQdBMewQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59816632"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 10:52:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 10:52:28 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 10:52:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 10:52:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 10:52:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ld3a0MlR9cYRDFFVcfvawNJrC8xeY6/IsHq/myzq1SO9BjVDVgF1zTpb7j0cLRoCTPKEqzIhhOdRpo0Hrbdnmk+i0Tq8P/KWnKM3mTFgvEmelPX39zy5RwCT3zioFApWPXHV/HL6wX5thkPYNLZdYzSGnog9z8WD5F9e1Ch6EL8POIo3OBB2JydJ1IuknwM/fjwsQS6yzQ56gt5HTp+Jno0H/fIK2S/LzqHcAcEo6Lwxr3k0AgqWUuf63dAxPFfYkfEVGE5DSXE0Sc2rCJ58e3bcm/jjcriSM563ELMP0aMV3RB/WGNK0cKyuZht+cZoXY2WveksVCElR5DeE4B+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFDXJojnEFx2Va4Rz+21VN4Zc6tXsXwJdGxF6v3Qeg8=;
 b=Fa1bik4esDYBlCPqlx6MvwZ+iaS/eGusd8c5ta4PXcUXOF69A5XWe+dN7cLvigFdy4cK/SH/jGCLqGpeHrlTR4eNCELHFRKFbqnn6zchjb4VjSUXPerxHpqWVvy3fhupynRz7Er56vW2yTXFbGfao3r4Fc/cJPQtk+uRLztB0BvqP8oP4y7WyGATqgj0cjMjAoHG55ckjSl45zuuQOA2vyS6cslxem105StnPNHNiwuFxZOvfLVwIV2zJuTZ6RI3dyZunJHlQNb/iScYaM1ItXO2BhXYSQhLsvEJ/Gnom8LB5LuxNyIotKPM9zf7P08L3btnof7WZrvfkmd1QF/EOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5001.namprd11.prod.outlook.com (2603:10b6:806:118::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 17:52:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 17:52:24 +0000
Date: Wed, 31 Jul 2024 17:51:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
Subject: Re: [PATCH] fixup! drm/xe/eudebug: implement userptr_vma access
Message-ID: <Zqp5oYGygI97UglY@DUT025-TGLU>
References: <ZqRRQmDz9zF/IMUW@DUT025-TGLU.fm.intel.com>
 <20240731111112.2702343-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240731111112.2702343-1-andrzej.hajda@intel.com>
X-ClientProxiedBy: SJ0PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2e2481-a346-4816-f516-08dcb18988b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H6xEGfCtufqsEG0NTofTZiDPs0NlguULETuSF/xmgqrz+4ncFfx2cTXCrvp2?=
 =?us-ascii?Q?GmVpugYlMPU6MRxY94Ir/199HCq64Y5PoVhcAW9i97qwdv4pPNrfAyyhOUZ9?=
 =?us-ascii?Q?shFaIQpci24VI4KE9rDvc/X7OC4TKLfO0MLGWFLtIJRnXIZ82/35Ee9A/qYN?=
 =?us-ascii?Q?Wr70zQIKQYypO9x52g4NWQQpFwRGvLHFDC7ZamZktm7JD8DHg5oR+gsb1Qka?=
 =?us-ascii?Q?PcYU0bGNc6vi4LO64APsuQQkXOeUhKE+OhsajClSdKfeQVPSyEVhyx8kau0p?=
 =?us-ascii?Q?xYLKq14VkeFqCUI507nqxHhzNl9U+mlrAsry0c26UTlmVmm0SpxqBmLWvLS/?=
 =?us-ascii?Q?BeVkPODcIGrdEEtjFaICynsuTaMdMaMKxNhhcb54+cMx4SCTVI07QzYCllfK?=
 =?us-ascii?Q?QUiRJtIiQcK6wji9gn7ONgywcMNGFVDrz7lsGSQbLuN7bQfk9HdaoLn/KP5E?=
 =?us-ascii?Q?OE8j4peGgBUZZV7NgzkO1Kuu4EH+qzHCl8hcm+t2kBdbDY9ihqpyhbGUu+n7?=
 =?us-ascii?Q?GJQW1PdvH6Er7u2gSiJzdv8ZXGyXK8U8O8dINZRDLNWJCUFIGZsVa9Oh3pt1?=
 =?us-ascii?Q?jZXn9ARKdcQOE32eKvi87Mrd569jbd15T72n1Evf/p4At+wW4k00UQOYStLk?=
 =?us-ascii?Q?eXPVIi1Bf0dXZsp4LDktmiL7O72/mSQpSAqRgrMLApQn4Uwvb4MRTX4GuAm+?=
 =?us-ascii?Q?jYS31nrBe72demUYwyJLPlRjKuoZUjvSpugd3TZvrkCtvM+7/VU/hOnVQTwj?=
 =?us-ascii?Q?y+0I6NZzuQjSd5mDc8j/hXdzAdBzmItFHLuh85BoDcRgXKqSkAGcOCkyHLHU?=
 =?us-ascii?Q?2lCnVAETQCvb3KT3uIy7KSs03RBcb7ilQPDA5Az2XADDeQp42iXntRsmiEoi?=
 =?us-ascii?Q?E+JcKxylSXeR/+TOC26rypkvi00xSoqjEE7ixO5Ung2jts7eicfxUR2ZGEII?=
 =?us-ascii?Q?gnMP5lXlDksnQHOl92mCaZGI5RSGl+xr131kAgtlR3e4DFaE4BU1iFhhdEy9?=
 =?us-ascii?Q?gPuSgpZBiBHGk7BnU2IZ85arOA48+xNXfJyosoQhfUnRqdn+eT0PDXvN55x3?=
 =?us-ascii?Q?gs3qyM2xvkBEUHQzEUSvsP7QPU0xy+aQP2z2W+JCAycIUK/540IPIHI42itJ?=
 =?us-ascii?Q?mHt88O/gY6NyECjCTRVdKYzXo2XAtLnFdRuU8kiNwlBkDityGRt6KwymECPB?=
 =?us-ascii?Q?cZKjYttucLZGVY6T2ncof7jEVFH0Xv/4/zsp6pvEjDIaMsWGjv2dGPHxNuuX?=
 =?us-ascii?Q?sKjyky9qBOsb92ssASfJZyudlscQDC4QfrK0z6p44uRYG9RnCojLzmSo7y75?=
 =?us-ascii?Q?NG3HoQXZDkFUSuRzB3u8iISem7QsynWke/rcUBgLoylF6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QUt/e+GU02Zl0Ek/j5EWB76ddop7oFCIQO9uPn12rXHCD3Y2wpam3EcmILYU?=
 =?us-ascii?Q?AKpOs5xjbwzUADHp8AmCV4exuAAfUkt7BWjCTjFCCaizsDgcyXPhTGq+GT6r?=
 =?us-ascii?Q?c9YtLS4AretUkF4LmXdacgeXGSLCaarEP/uDqBJfbmvZgba2kN46YYTfEAFt?=
 =?us-ascii?Q?yt87U/5X6cSgLXtDz5y7kKorF9XBCYX/0bkTKXFRLbrm7ud3L5p1XIiO4ckk?=
 =?us-ascii?Q?p1cnA/hIqyeKPRQkJnmpheVk53BFspABtVSl7CjWLpsWeqAlOXBR9vHNqTiI?=
 =?us-ascii?Q?3dSjmACzEVQMHJWQQQIu6phDto4M8pTsNJpotQfUXvP+4mCmFNYJqvWHSs4D?=
 =?us-ascii?Q?3dkVgHg6Q+uyqtt9pY6k/9SYmMnypt9ZnsD5Yxpzfp5BIlHe5pHc8EDjqMWP?=
 =?us-ascii?Q?9BeoTQTc/WaiyneYgHLuU8ND55E8mE81+NWDvrXnvol0IbkGSd2wobAptNQl?=
 =?us-ascii?Q?X2PUOh4u/T0AE8j3KcH8To4KkLLI0wCIeiSO+ySUxavhs7vAnVtgDxcfpX+X?=
 =?us-ascii?Q?ZwKbPmubxpGQrV9qqRGZxsmNQv4nBKbDw0HVyaseBOhP9aMHDBz6CoVGJcWi?=
 =?us-ascii?Q?Mo3NQsLd7wcamU43nNBBwQ6zC78LwL3wAl76i8+SuMhOPUMNiJXSBOv5SwuU?=
 =?us-ascii?Q?OGAbeRMAVGV1mxOBeCn6MTL7AcKtCQB7ZgwpysLKzDPFFJbVfgPZrjbeRVcB?=
 =?us-ascii?Q?Pmq7SfKQYc9NpKUhJegQjKVaUFtBkVHYBtCU1oA0HLk2p4ak/KwXkh/vRGd/?=
 =?us-ascii?Q?JUBXV56nkIzGzQN4i4ecsnd8bXiuEDwKdNWMumQbQXF+sQfvCUdmlj++04Eo?=
 =?us-ascii?Q?dzL2HXIJ09KexV8+zdPtqYW+SvhbbtDb78DJU8v3/lTRWruAA+TLbnrkSPBw?=
 =?us-ascii?Q?r36COBRDP0DCsTdWGTIg5y+cF6jDQjq9CiJbIBQ0c5vEkUq0Xf0xzr+PeXfP?=
 =?us-ascii?Q?4KlUekGzjfmqQ44HomD9FQdvNFHdVOtkFaKfIQF36oWqhBHMFZXqr33qDAEg?=
 =?us-ascii?Q?5AHVDGF/e9of5g/hkoEPucvHo78/vtCXA1bqj4y+il0qdhYCljjoUnFhPavk?=
 =?us-ascii?Q?J/tzNypviDYEGEnAGAY/RV1evYAGVXBcq10npcuozUSXAHQOYrXMEqloNca1?=
 =?us-ascii?Q?SWFswn+/TZIB6buV+moh+73bPSJyrLaUwzNwAWXBy3m8tKjY0x/r6plPcdkF?=
 =?us-ascii?Q?jqA5BRKdqkJHl8HlIyRu2n6P4Ib5UzsbvFapd5Tc+++6CP+ogNlsjmncru9C?=
 =?us-ascii?Q?OERo89EmTn/8frPx/avggPk4Wu/x+45iKGAaciyWQHuCrYbVY4s6niVw0fry?=
 =?us-ascii?Q?3E6hVeGqcjwS8FSs+KYxxPcuC3/twkOhu13S96h66oUU12ICiF0UZWMPPMvD?=
 =?us-ascii?Q?/aabSHip1XbQETa733vncrpb7IDnG531v86GbVDyrK3q45g/kzSxHMDAoSxm?=
 =?us-ascii?Q?pLS7c3xKe/Aq5M/9qhJCxvN8QVx+e00Hh4nENL+BZ7GCiK+4suOVO1x8ACzo?=
 =?us-ascii?Q?Qi62abVwiBYFxf7SzbBzqaxz8sXzKuoizQ1612kSGxNW23FFm22InF0qULWN?=
 =?us-ascii?Q?h/WmERJOerHPW+Bj4MnFo12YmCDRPUCq1ilcgREM0uDPoaQwhQ/go5nsfWT5?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2e2481-a346-4816-f516-08dcb18988b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 17:52:24.3463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mpimu8ifVKb23Z5bs/JVRTIkvmvN1HBikkv2cDyLu6kVwPD5xBIme/Q/0r5bprE5u2lHSoiULRdsSECJivm0Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5001
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

On Wed, Jul 31, 2024 at 01:11:12PM +0200, Andrzej Hajda wrote:
> This fixup pulls call to xe_vma_userptr_pin_pages out of
> vm->userptr.notifier_lock.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
> Hi Matthew,
> 
> I hope this fixup should answer your concerns.
> It was tested on LNL with lockdep turned on and with your
> two patches mentioned earlier.
> 
> Posted in form of fixup to underline the difference,
> let me know if you insist on full patch.
> 

I think you change will work but I think this can be written cleaner and
also in a way in which the EU debug layer doesn't have to call into mmu
notifier functions (eventually we want to move all notifier interaction
to a DRM layer too).

How about:

retry:
	down_read(&vm->userptr.notifier_lock)

	/* re-pin if necessary */
	if (xe_vma_userptr_check_repin(uvma)) {
		up_read(&vm->userptr.notifier_lock)
		
		spin_lock(&vm->userptr.invalidated_lock);
		list_del_init(&uvma->userptr.invalidate_link);
		spin_unlock(&vm->userptr.invalidated_lock);

		ret = xe_vma_userptr_pin_pages(uvma);
		if (ret)
			return err;

		goto retry;
	}

	/* Do copy */

Also while you are here, maybe move the implementation for this function
in xe_vm.c as that seems to be a better place for this as this all
userptr specific code.

Matt

> Regards
> Andrzej
> ---
>  drivers/gpu/drm/xe/xe_eudebug.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index 472d9314505a..80d6f886969a 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -3343,6 +3343,7 @@ static int xe_eudebug_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
>  	struct xe_res_cursor cur = {};
>  	int cur_len, ret = 0;
>  
> +lock_notifier:
>  	/* lock notifier in non-invalidation state */
>  	for (unsigned long nseq = uvma->userptr.notifier_seq; true;
>  	     nseq = mmu_interval_read_begin(&uvma->userptr.notifier)) {
> @@ -3358,9 +3359,11 @@ static int xe_eudebug_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
>  		list_del_init(&uvma->userptr.invalidate_link);
>  		spin_unlock(&vm->userptr.invalidated_lock);
>  
> +		up_read(&vm->userptr.notifier_lock);
>  		ret = xe_vma_userptr_pin_pages(uvma);
>  		if (ret)
> -			goto out_unlock_notifier;
> +			return ret;
> +		goto lock_notifier;
>  	}
>  
>  	if (!up->sg) {
> -- 
> 2.34.1
> 
