Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9958E7FDE0
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 22:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8165410E3B6;
	Mon,  2 Feb 2026 22:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6uxbE74";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B7B10E0BC
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 22:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770071093; x=1801607093;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aaf3cGGN58vac49IURacvkOsz6Gess9mbS766WCihlk=;
 b=d6uxbE74KIQ6sbZZQbVdU/6FwEOhE9MVjedejWCgXhhjJ7aGY/vLOAHw
 WH6440OCBAvGb5SzSZq3kCnfYgHsCxFGjdKSPt9MIwDqmVjq87bNPBvLk
 RU2ev8rJNrUdPkqgEUfBNwBatvQ3zb31PgMJzbB2wsqRMlMZtNwKNMiyr
 nuFsMq44RjWq+nrsehoIm5J8JWW9/V6YwwMgyIiABFUCtULNiTapVrnBK
 vC9Kyhdrm/H1LQLN0rfxJJ0NC8YrJIw5bi68C4xWl+X9mGoakC7/OZOUr
 PJpXtkdQes3xnIzf9bA3jCbIfsdsYQQn7Sw2bU+9sqana3d7vL5Glqv/w Q==;
X-CSE-ConnectionGUID: LDusoxRqSpOEDcVRzdHrtw==
X-CSE-MsgGUID: NcqoteysRROf/sU19UchXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70442941"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="70442941"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 14:24:53 -0800
X-CSE-ConnectionGUID: 6jvpNXj9QzC6ZFDQ1e+L1w==
X-CSE-MsgGUID: 6IET649jRjq2jWBQsEr7Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="214131959"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 14:24:52 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 14:24:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 14:24:51 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 14:24:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDuqAEvo41hCklWOi18iDLlTP1ahx8I3zvu+VMZlrY9ZRz0zlerAr0hVjNhTpi1fkwAgZHIR0O4BP0ccx4zE5dWEXA8Gl0cZKwOgGHEHb9jjOhjPzEWtuDU51GeaAOYus9oq5eMK1ojlqIjFNE1y5usla8C4eXwT7VxYZvmXquAMw1TmsbVMxhv2a6OmKM91k1pInvpG3cP4h5aGfr/BDMxNPRf2fKlJx79DCc5wdfeulF2797C+Rt5PzK62EbvLmBMQaFWMspgqob3Db5AxS3DXVrouRMuEOHPN5Xv5bxem8ge4rXIq1jd7LXkl6Wybi9bupkiEqg5uXWQ/DFkGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETdC8l3ywEL1z3apxXxHbSjoY5aOtxjfApzEJwrawwY=;
 b=NHBrEB2Ipun+wz30dPSAhrLTBs3WfuMbwVXNmFjwc2Jkm83F7SlK1L0NDRWWsPkmXK4b4m5r5DR80Z4e3+j/i9j5Im/nXNWampJ8PX8WzYZdKVoV5yLRKKyei94pqPT/phj+nIVlmEtUq6W+dAqaYlys0zcZvYsIE9wVgAw5Nc+qmd1zgfbs0ZwcRv1PcxHrbb6nRpuIVNGBPbgeNyL1AVNlr73clGdnR8c7qBlhTFmIaznO1rXVGHR6evoncwQihIQsv9Ntps56uTKxnnBTxM9SJ0/nCVEfzfjQ/b6gmWT/kjkRdGZFMGnGsxq73NFb9XfMYuao8FtmGIuSU86puw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5815.namprd11.prod.outlook.com (2603:10b6:a03:426::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 22:24:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 22:24:49 +0000
Date: Mon, 2 Feb 2026 14:24:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Varun" <varun.gupta@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe: Add prefetch fault support for Xe3p
Message-ID: <aYEkLvxKS/TOCtOa@lstrano-desk.jf.intel.com>
References: <20260202052515.840084-1-varun.gupta@intel.com>
 <20260202052515.840084-3-varun.gupta@intel.com>
 <4df26053e236e0c32f3cb4d9a504d5c0aae1d250.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4df26053e236e0c32f3cb4d9a504d5c0aae1d250.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: 255296d9-c0ac-4fef-4591-08de62a9e0bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9e041UO7VPdXSSUFUEHqjwKXk9QH3661yf9Wiy+Fkoq+/DBqQEVVcuWCvR?=
 =?iso-8859-1?Q?Lz793POGTxwwQtgbU1wmTXkyYyeLPKJjc+1irZxQeGh4e4LquiBZHEBxg3?=
 =?iso-8859-1?Q?wbmxkQvSNenCWvmhx6sJblwHitBNQ5HGG1T96stvLKgPm36EFjYOqtg6AW?=
 =?iso-8859-1?Q?7o53oqhBcYaNKaBr+tMaxW2DA0GYNwbYai5N/LBXlhCq8+G0ftwJPupa2O?=
 =?iso-8859-1?Q?2WmV4TNJK3hzZPaCCe0ML9njtttmqlQYjiZPXkrVIQxR1jUei5sOn3wpWG?=
 =?iso-8859-1?Q?DE8RPwDtVAJqXoawpnOP44SMbaTjtCux6UtzQWZv1IkwVMITMLPn4jhHoR?=
 =?iso-8859-1?Q?sVhplEfbohAI9geVTzKanme13DbG0rw1EA3nXRQMq+iQ5WqV0K44rtiZ8H?=
 =?iso-8859-1?Q?mzL50caarGCk7to/4da0d8DUrh1PNuKepmtdGYIr4sMrWBCDWDJmxocvmu?=
 =?iso-8859-1?Q?s4sGY56gLi3OCLpYRYCKQeBw1HbY2zGryU0GqqNnzBEiv4We4MB/+gIP9c?=
 =?iso-8859-1?Q?ra71zbOQxsYQCct55RY98T7f0jn51XeoUW8TK9mY0THepukM0RTE8/2Ewo?=
 =?iso-8859-1?Q?HxVeqBItrZUwycBiOqxffBaiFuEEeOehYQtart4DOlf/QTs9Qp1fRRYdul?=
 =?iso-8859-1?Q?Q418YO9QDmPbnxOSTRFVVN2iXI+A5eHGP92tvkI+inB/h18HRpzAksn+sB?=
 =?iso-8859-1?Q?CDiceguC5WW/dIAIzpplM56mPqJM9XiGBgPFt8D5rNTqkNX6ndUKtc2KYp?=
 =?iso-8859-1?Q?v3TCsZgegPQrC2NbL3yB9lULngcDKi08mEXSYnkZwy9ysnXt/i90vOWVdh?=
 =?iso-8859-1?Q?8AJFnOtuV3FG0pqdNt/bhDHqu5UX8U6xbL97JHeEZSdx1BS/R2Gm+/HZoL?=
 =?iso-8859-1?Q?j8LHJ3Cn3vfr3+SkHiKSD3qRNEV2WpnoVE+k9f4V1SpXhlw6QvhpYMxN9C?=
 =?iso-8859-1?Q?HLSo92NZh4LDkEdjOcu1acgPPzUPQcG8gkSkUXmCZnA1MThcODShaGsoMg?=
 =?iso-8859-1?Q?OupuxaMYLxv7FyGp/wxrmdT0R8oQnC6kPAMKZjqKx4UjCKFgCv+r0PEptP?=
 =?iso-8859-1?Q?8F+TEuotL+tIFfr5KX593TAQzF2jzkvkX2rjc+t1wSQGXu9wMwfqYb5cL1?=
 =?iso-8859-1?Q?6aflDHIgR4XfedfqMgozfaeV/NuYGdpI2l0kJWYxJ59hs128FBv5HHt1ni?=
 =?iso-8859-1?Q?WjJNR+dmSTt+teD6wFzdzOb7XdawP5inRRC9NLOOyuKh9uL8za0PcXYPBW?=
 =?iso-8859-1?Q?34LZrlqIhzGjiwp9ul/T3HDdgtstHKL2k7jJp4ON9VqVCgSGaDLk4XyPjk?=
 =?iso-8859-1?Q?QO15QrQkeTWV6mXbJXRJgL+OsR1IU9UPw9cTfadcKyjF4V38dAQUqw3qva?=
 =?iso-8859-1?Q?gBrJtBLtfCE5/SbtI9nZdUKXlhK2dVoFHkyPAG5fyDbUfoaUFsRx44NtvD?=
 =?iso-8859-1?Q?Hnf4xDePKbGv536x490paKnG3AMDlvh+MrGosIAjMvE16ppi2IakMJ1ich?=
 =?iso-8859-1?Q?CYq0pV8uBrkDxaUNx7DQBJ/vr1r2k8lW6suoPoJPmhksGRgGfyxs0yczGx?=
 =?iso-8859-1?Q?4tiZQbFsA/+mUd5e9QqoMS93iPFVqrEzrtZX4pRIgF5S/VQYVQo1QFoJsu?=
 =?iso-8859-1?Q?RQoYCyozebGxU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rhW43o1crB+FR1N2LwrcM5mtSgqfWQTNiCx/YsvrkQ/Ibo3r5quJmRGzeY?=
 =?iso-8859-1?Q?q0903QWX9R5wtILv3PEEnhC0f5u6lNkCgO14q9A3oNzVHuKKBw5sih7cwO?=
 =?iso-8859-1?Q?2SFoPCX2nBiYa3aoyOHbTYJn3Lh+y3Cm1lRlv4Z2v6tRNmwm+7uo9tGWaI?=
 =?iso-8859-1?Q?Iz9KB0fMwa1UkdFX43KajSczPaVtA+kWaob2RV/Wc6AhD8K6nK4LBsWZcZ?=
 =?iso-8859-1?Q?elCoDa8fniBNlaUWTll6Jr3Cz8UooPIgB91Kwqw16xeMFrljHfjeXVnKF5?=
 =?iso-8859-1?Q?pJTRF9BVubhldyl9UWMMMZw1DB7xSNwXxvLOSz5vdG11zR4GwuKj5IcrG7?=
 =?iso-8859-1?Q?TOYZtAjSa/lPZJG2xtiSuXGc3AdvD3Hfv4q+RrCIBq3CR3s16JyhoZzfba?=
 =?iso-8859-1?Q?7NHG6bcJGO9SUHirPw4H9TRG4DatcBx0z63iV6s2Ni2kPtk9NlNiaBrJ7p?=
 =?iso-8859-1?Q?BdsHQyE5srBo9AWmMCSwiVAvxL818CqAohp5p60S7WHEQPY1ljfy56qgM8?=
 =?iso-8859-1?Q?bDT1OxIvVrZhOt3iLA9mtfyRQn5BCvfZU7koPhJCPTAR4PUziCXHfI/Ehl?=
 =?iso-8859-1?Q?Ec2bRpLEXr5oJcRiIo40qfJxNT0LPcmRclCxyI9FBXV4JaxpBEa3uZhdnX?=
 =?iso-8859-1?Q?iIuagG5zZ813ojlrL3XIKqHGZM8FvSzCB5NuejQrqmgnFSfb/w4Z7Zksll?=
 =?iso-8859-1?Q?WDg3gM8/nnyoTPFEfzEwKWWptLEZC5FgUjNTBoXk4RuF1AqFqDMRKiQk6t?=
 =?iso-8859-1?Q?WrM5FLrCRFHVXBq3udIozistlKCBrcDeBDrUzOjlLpKKbF5WxNheXvLqLc?=
 =?iso-8859-1?Q?lXb0LoZor8HLRqV1EF+kQXPf+Y6RbhjGOkMipYH0aPFpcgqeaeQzWD1G6Y?=
 =?iso-8859-1?Q?JI3NxpxwszifoaP1oF8UzWP26N9gmCaJbmM2zN3l6GoO2yZ+SZE21ERCA/?=
 =?iso-8859-1?Q?3Bsk/Bx4lpeB9GxY9/z0T2CUwqOwsKpDXl+lcPksJ5e6d5Ypi0gfm1oEae?=
 =?iso-8859-1?Q?swF646jrr2HSwNOZOdfkeB/tqVVy95fYa0doCFEwpIA4PaDOhw8YlnmedD?=
 =?iso-8859-1?Q?iKL57k3qeDKwWjKOTTAhUSS7XPTDsoXFyRQC247fGM25RYX3xDvJ4DRv/e?=
 =?iso-8859-1?Q?DHkRPRNWVP2eMg2vxsBih9Envdnoed+6BDVAqPdMp6SjLlfQFbLn5guo/S?=
 =?iso-8859-1?Q?wAnkNPf0bmIUYSutwKHskNvsuZSykBDOo944nch0ym5iZxMtgmgNwfgK2K?=
 =?iso-8859-1?Q?eNwh2Ps6WhZobzgqWJDR7eLNyMaQxKppuPG+6C3oNnceR+kOpr58btkJ5X?=
 =?iso-8859-1?Q?ER5h1xhoN0ulcsZe2pZA3x4EqUn6y6bX8B8dRg5PzklEGLIn3mr+oPf5GL?=
 =?iso-8859-1?Q?cW8xBmLvaXJF1EP+eUfHAPowNVDZ2OVzMGEiCw+aKWtYbT+/UdXrJw2thX?=
 =?iso-8859-1?Q?sD4IPVrsWolFzCvbUExaaQVSo4NLE1/1my7GT5xTyUcwBvYUjQvWnE3gPu?=
 =?iso-8859-1?Q?dlD3WUPOXsv/b3nZymIzcaZVb0Nm++g4KeR39pEfeDe54lh4ZcCHcrcvu9?=
 =?iso-8859-1?Q?z3MbnHvaVdU6pUT9W9iCXMx7GA5xcN5/kvrkWhdeO820+3uNCF7MGm7TI6?=
 =?iso-8859-1?Q?XMWAlhglNNmrRuT5ycqBgSOFCmNLUJF+juPv1StuyxG44A18NEHJ6YtIMH?=
 =?iso-8859-1?Q?UhXP82J1oQLPjCsnNq5czwC4Id+FRCfbk05Ox5Fjn0wdz9Lpj0yppTd1s6?=
 =?iso-8859-1?Q?W4avuVmK47TIThfvFZsdM7Mw9hu+Q8E38XyAlm9niyyHpuR9VfrcwKH/Zn?=
 =?iso-8859-1?Q?TqCs6B62mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 255296d9-c0ac-4fef-4591-08de62a9e0bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 22:24:49.4472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4s7x2TuQE8SG9Rem8YnTfykd/GZrzFlSGm8wgYuPDy+GeAOPZLtcxV3WQp6jzXobsOagitJ9UsNEJ8gnkwAZ0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5815
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

On Mon, Feb 02, 2026 at 01:50:01PM -0700, Summers, Stuart wrote:
> On Mon, 2026-02-02 at 10:55 +0530, Varun Gupta wrote:
> > Xe3p hardware prefetches memory ranges and notifies software via an
> > additional bit (bit 11) in the page fault descriptor that the fault
> > was caused by prefetch.
> > 
> > Extract the prefetch bit from the fault descriptor. When page fault
> > handling fails, echo the prefetch bit in the response (bit 6) to
> > allow
> > the HW to suppress CAT errors for unsuccessful prefetch faults. On
> > successful handling, clear the prefetch bit so it's not echoed.
> > 
> > For failed prefetch faults, increment a stats counter and print a
> > single-line error message with the prefetch bit value to reduce
> > excessive logging.
> > 
> > Based on original patches by Brian Welty <brian.welty@intel.com> and
> > Priyanka Dandamudi <priyanka.dandamudi@intel.com>.
> > 
> > Bspec: 59311
> > Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> > 
> > ---
> > v3:
> >  - Drop the rename patch, keep xe_pagefault_print() unchanged (Matt
> > Brost)
> >  - Move prefetch check to caller instead of inside print function
> > (Matt Brost)
> >  - Remove XE3P_ prefix from prefetch bit defines and add platform
> > comment (Matt Brost)
> >  - Show prefetch bit in error messages for debugging (Matt Brost)
> >  - Split stats counter into separate patch (Matt Brost)
> > 
> > v2:
> >  - Changed comment wording from "repairs" to "handling" for clarity
> > (Matt Roper)
> > ---
> >  drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
> >  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
> >  drivers/gpu/drm/xe/xe_pagefault.c       | 16 +++++++++++++---
> >  drivers/gpu/drm/xe/xe_pagefault_types.h |  8 +++++++-
> >  4 files changed, 25 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > index a33ea288b907..1a8674daa26e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > @@ -261,7 +261,8 @@ struct xe_guc_pagefault_desc {
> >  #define PFD_ACCESS_TYPE                GENMASK(1, 0)
> >  #define PFD_FAULT_TYPE         GENMASK(3, 2)
> >  #define PFD_VFID               GENMASK(9, 4)
> > -#define PFD_RSVD_1             GENMASK(11, 10)
> > +#define PFD_RSVD_1             BIT(10)
> > +#define PFD_PREFETCH           BIT(11) /* Only valid on Xe3+,
> > reserved on prior platforms */
> >  #define PFD_VIRTUAL_ADDR_LO    GENMASK(31, 12)
> >  #define PFD_VIRTUAL_ADDR_LO_SHIFT 12
> >  
> > @@ -281,7 +282,7 @@ struct xe_guc_pagefault_reply {
> >  
> >         u32 dw1;
> >  #define PFR_VFID               GENMASK(5, 0)
> > -#define PFR_RSVD_1             BIT(6)
> > +#define PFR_PREFETCH           BIT(6)  /* Only valid on Xe3+,
> > reserved on prior platforms */
> >  #define PFR_ENG_INSTANCE       GENMASK(12, 7)
> >  #define PFR_ENG_CLASS          GENMASK(15, 13)
> >  #define PFR_PDATA              GENMASK(31, 16)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > index 719a18187a31..ca7f769848a9 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > @@ -27,6 +27,7 @@ static void guc_ack_fault(struct xe_pagefault *pf,
> > int err)
> >                 FIELD_PREP(PFR_ASID, pf->consumer.asid),
> >  
> >                 FIELD_PREP(PFR_VFID, vfid) |
> > +               FIELD_PREP(PFR_PREFETCH, pf->consumer.prefetch) |
> >                 FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
> >                 FIELD_PREP(PFR_ENG_CLASS, engine_class) |
> >                 FIELD_PREP(PFR_PDATA, pdata),
> > @@ -77,6 +78,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc,
> > u32 *msg, u32 len)
> >         pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
> >         pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
> >         pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
> > +       pf.consumer.prefetch = FIELD_GET(PFD_PREFETCH, msg[2]);
> >         if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
> >                 pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
> >         else
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 6bee53d6ffc3..733d4ad28914 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -259,9 +259,19 @@ static void xe_pagefault_queue_work(struct
> > work_struct *w)
> >  
> >                 err = xe_pagefault_service(&pf);
> >                 if (err) {
> > -                       xe_pagefault_print(&pf);
> > -                       xe_gt_info(pf.gt, "Fault response:
> > Unsuccessful %pe\n",
> > -                                  ERR_PTR(err));
> > +                       if (!pf.consumer.prefetch) {
> > +                               xe_pagefault_print(&pf);
> > +                       } else {
> > +                               xe_gt_stats_incr(pf.gt,
> > XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
> > +                       }

You don't need {} in the if / else statement.

> > +                       xe_gt_info(pf.gt, "Fault response:
> > Unsuccessful %pe, prefetch=%d\n",
> > +                                  ERR_PTR(err),
> > pf.consumer.prefetch);
> 
> Does it make sense to rate limit this message in case the test sends
> this over and over? I guess this wouldn't be much different from the
> normal case though so not required in this patch.
> 

We only have xe_gt_err_ratelimited, so I'd say this probably fine as is.

Or maybe if prefetch is set we downgrade the message to dbg level? This
should avoid spam in typical production settings.

> > +               } else {
> > +                       /*
> > +                        * Clear prefetch bit - only needed to
> > suppress CAT errors
> > +                        * on unsuccessful handling.
> 
> So bspec indicates this response bit is used to indicate either a
> prefetch memory access response or to suppress fault related cat
> errors. So shouldn't we be leaving this as-is here?
>

I would agree we probably shouldn't be touching this bit here. I don't
have test platform, nor is one in CI yet, to verify that it is safe to
leave untouched though - bspec can be wrong.

> And if we aren't clearing this in the if (err) part of the condition
> above, we won't escalate to a cat fault (since it is suppressed), is
> that what we want here? Or we're worried about a storm of cat faults

I believe clearing if (err) should actually depend the VM's settings.

If the VM has scratch - we should probably print the fault + trigger a
CAT error as in this case prefetch shouldn't ever fail unless we have
software bug in the KMD.

If the VM doesn't have scratch - it is somewhat normal for a prefetch
fault to be unsuccessful. My understanding is compute kernel
regularly issue prefetches to what may be invalid memory as the
kernel compiler more or less blindly inserts these not knowing the
memory bounds. In this case, we don't want to kill the kernel. This is
part of reason we added scratch support on faulting VMs to avoid
prefetch fault storms to invalid memory and IIRC can turn off prefetch
faults (without scratch W/A) in subsequent platforms.

Matt

> and engine resets? But as I mentioned above, I don't see why this case
> would really be different from a normal cat fault in terms of frequency
> from a buggy application.
> 
> Thanks,
> Stuart
> 
> > +                        */
> > +                       pf.consumer.prefetch = 0;
> >                 }
> >  
> >                 pf.producer.ops->ack_fault(&pf, err);
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > index d3b516407d60..9e38d6e2dac5 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > @@ -84,8 +84,14 @@ struct xe_pagefault {
> >                 u8 engine_class;
> >                 /** @consumer.engine_instance: engine instance */
> >                 u8 engine_instance;
> > +               /**
> > +                * @consumer.prefetch: fault is caused by HW
> > prefetch.
> > +                * Echo in response to suppress CAT errors on
> > +                * unsuccessful handling.
> > +                */
> > +               u8 prefetch;
> >                 /** consumer.reserved: reserved bits for future
> > expansion */
> > -               u8 reserved[7];
> > +               u8 reserved[6];
> >         } consumer;
> >         /**
> >          * @producer: State for the producer (i.e., HW/FW interface).
> > Populated
> 
