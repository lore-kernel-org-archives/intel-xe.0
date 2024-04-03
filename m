Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE6ACD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 06:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01515112546;
	Wed,  3 Apr 2024 06:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cw62zTys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B282F112546
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 06:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712127269; x=1743663269;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VgRsc2uDDvh1+3ikmgU1teRjtaM4MfkKkRzdUOLnf6o=;
 b=Cw62zTyscFVdWxjmf6b01bk8OaQ5QTMlioVyvbayMtS9ikOl5P0yuPZ1
 V91OI8KugwtIat81ctvbQeRLqKk+GH7UuzjdPsMwvddLwR4E89u4k2Ov1
 AfKBdrv7CRdIk/5gCuPW54SfnGuMaXjHDUmWGQQNRFMQyhSCm6mrJruJW
 IJtzXPasCgt69wRKvxcqBSbqxlLcK4Z8mH1TgPfj9olDi5LOb0bPVtGI7
 frfUIUzJ73S3d9TMpEE5nLAKHsVNS4KYu09z1qfmeLiPzJSQHp1TRDygf
 LTI8cwnBY8o4CTtlfe23BSq7lafaz0GFRFf6Qzd3wCoHvVyd6KeIivbcz g==;
X-CSE-ConnectionGUID: CNYX9Q2wSDiXqvEbUaMBsQ==
X-CSE-MsgGUID: 2hVXydImSMip7veUfaFCYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7496372"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7496372"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 23:54:28 -0700
X-CSE-ConnectionGUID: 363t20aAS6ypEhivZEBuaw==
X-CSE-MsgGUID: 1PMYeEA+Q6yAXbLQhGzLXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="49556702"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 23:54:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 23:54:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 23:54:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 23:54:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 23:54:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxonT3UPlVlGn8/jYHDuL7TaIdHbuuuGYpfYrvXfnfko/CHe/HFD9eK35UEWNaNu6kWWBiCGNBNRfMe9S7yUYz2PbDaN1EtkPBthqabbbfwgajGXYJ97hjT2OZMJVvnRR+CuZjjGvqaxKRM9p2Aup0vyjMtk74tfa+5zZUt8/8B5KZe0o7L1tHyn32Nu6UyMtycvXyl+jxA45cBuXVJqlTBPdx5fcMfVId5ignyt4rR77uc+e7iM/7/+x+YiZXWCWIF25hOuvEj8cazN4X8+7Is0K0m7v60lDaAhHi37I9qomL78XS+OHS8EDg/hbG3GDLNgbbHMb0fOdPjo43QqyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivAryAvssOESIkJWKJ3Xd2HVNPLbnBO0X42hXb7jVTM=;
 b=kSHW9Jnqza8Jl/B7k4L8VA955Msj10qWD6R2iq47zjXUaJvLYObPEs1Q+AX1luqpuYiN7VL9slpEIcmSGvpSW9JpH0V57BYhM22SNiTfv3uRzUT994RBk/aq2rMfRFCq2XnJkXoxJYmt7QEcDsLgA04TmYt1hKMqgZeirfbuDPAcdGjVzJCQKi3fj1awsxzActDGuVrEon7Wv69uUAUe9f6ZiXTAGOTaLxvCi6Wn3+CE9i43iFz/w+5b6xJedyiNIbcLXG/wuiLjqrwjtJPmVbDtzelpDcK10psHdPxJcIDTlpXGkn6v7ul5aZb39VZAaP+nev00PC5mEawp115wGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 06:54:22 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::bf52:bbe7:ecec:9952]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::bf52:bbe7:ecec:9952%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 06:54:19 +0000
Date: Wed, 3 Apr 2024 12:23:34 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 06/11] drm/xe/xe2hpg: Determine flat ccs offset for vram
Message-ID: <Zgz6Si0AaY2A8x8c@bvivekan-mobl2>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-7-balasubramani.vivekanandan@intel.com>
 <20240402143053.GD6574@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20240402143053.GD6574@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS0PR11MB7578:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4y7ew0Rk/TulL8x/uI8wh1+N8MPusztwDTJHKoH9xZ4r5yFXWj39miblTQCsASOC0Rkb1/AMNEK6T/fRj7gylDEMuoi6yVD6o+wEUwbJRK5bIv/ugx8tmX8esyFphBgd0alzRssDRNJGy3jPZuqHh2j8RIfyl2erT1RdVf5rBVVlpNcA0MbkmfHe9Abs/UAHlTo/US1qi7aHcAgCvI2qfq/gqlJD3nosXI7ZLEZo3EvC17o7Mr7R9/18EyT7Rt2vI7hhvOF3lYX4m9QUOOlJ0ppkJGXFv+0ZZyiSTBvzL8tufJNJLZwMPD3Zxieg44dtmO8ywqxRJidd1BgSefb37cWdg/AdjJQGEaS/7bAt4RLaM2DYgrkDy5nI6xrWeE5vic5iTQgUmliLtzbr6ZUToIMvqr6zctLCXjpscnoEGb+V8RNgK92phIv1uWpt68ddweEd77u9iNTkC+B682uR2Uucxk1+hfJZhxDlfT13YCroEoRH7F6Df6sF96sfj3oJN9LY8P4vCpfqkgUqArdSmcBKGrRXUinuYy3kuBGvuFSAujZh/7DFl5Bh6MWTtdu46IYtJrIWTkqovAIU161kuv5SncASa+7y9dAHVwnlU+PmzIhGO+wTZ5xiXl7f6RJOgkYyubaK17FqQ7o/aBkoRtAJdwBuhRHgiZW6rCgEHbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmRaZTIvL2x1VVRLSTdRWEluQ0xvN2k3YTltdS9mME5rYUhaTE5vazlBTHll?=
 =?utf-8?B?M0ZCM0JUekllWjAvNXY1aGsvWU9TYitpVWFUN3VLMkRXY1hUa01XSGtHZ0Fk?=
 =?utf-8?B?b0ZrSjlmRExKYXRPRy9COThtSVBubFg1L09UNWlWVjc0L1QyZFEzRDJDSG5h?=
 =?utf-8?B?TmJzTUhwbzJLMkN5cWR1eGU1Tk5EVTUzOSt2cWRac3VxeDJReDBHUG9oSFY4?=
 =?utf-8?B?a0ovNnczY3hWK2tMbzV3Umh2RklMY29BSTZqSHJ2RCtmRVdWYmNWaDZyOXBr?=
 =?utf-8?B?dzgyZ0gxVEdnZ2pzenkraW94MmtWQjd0K2pKZjc1aEU5ZjljcmQzZVE5ZThT?=
 =?utf-8?B?cGNZeUplS2Nnc1NBWGdVSHhpNVNiU1lpaEJNd20wQmljUmNGKzZXMGIyQUp4?=
 =?utf-8?B?UndPZlZab2pFVWVFZUlWTE9iOU1wdDBiTy8rTnRJK2tOMEphN1RRdXFrSklQ?=
 =?utf-8?B?aEpRWCtQU3N5anAxM1lGV1pJMTU2ZDJnR3RhSnFmZTdvQ0ZzaUdOZThSSUoy?=
 =?utf-8?B?LzVITHRyVzZBQUdFdXF6bnlvc1VFSjh1NTBiWmU4VnR3aWVvRjlRdFNlRzZh?=
 =?utf-8?B?SDkxNVV4ZWowRU4yQjdDM2NLWWdUSllaa01mNkw5TlRwaXhjYTBhaTk5aDh4?=
 =?utf-8?B?cjJMZEk2cFgveEV5Q3hoSmVrSVlCc3RmSzNSMS9NenF6WkxwS3JEb1ROdGJZ?=
 =?utf-8?B?R2cwWFY5cUFua2Rnc3JHMCtUSlBDTUtwRHd2bFdLaHRCbzhIRmdqb0JMSStq?=
 =?utf-8?B?UzdZL3pRaWtHVWhGOURzTjR0d0RkKzVoWTFRZmd0UEhyL3d1MHdBVFVPa05X?=
 =?utf-8?B?eUpsM0tlS3g3d0VyZjVxU1BZY0gxR0p6OUpNNXN5cGdBczBROElaUDNraktR?=
 =?utf-8?B?U1VNem1CZ2laRTd0ak9SWURYSlZFZlJ1dlQydzBDMnI4dHJnY0lrOUV4cERB?=
 =?utf-8?B?MngzSENGZ0JMYmJvYTdhbVkrR05heHQ1cnd3eGY3R2NRMkJETkc3cXNza01w?=
 =?utf-8?B?dTBjajUrUXFIR1l1YTNxalZPTUN2cit6bklPa1NackNzMGJQUWQ0dU5EcVNQ?=
 =?utf-8?B?N3hZR1FLTUpNTTIvbnl5NTNjcjl5RHNmOVJxTGNDM0gyVVJBWFZGZXZXayt6?=
 =?utf-8?B?M1p5RDY2ZVhBV2FCU2c2N3pqZHp1RThFZEJxVStTclBSTjQzUzRyVzlEV2RW?=
 =?utf-8?B?eHI2U2tBdDZvcy9PWXR1V1dYc284MUw1ZTRoSUZnUThZNUNZZjBYdkJUbDVy?=
 =?utf-8?B?WUUxUER0ZllzblhHaENCNUZYNjc1RTBxNXB4cjM2bUIyLzZVVXM3Y2RGRTI3?=
 =?utf-8?B?VEpaWU5kdEV6aWxMSE8yVzd2NjVXZmpmSFQ5cEd1Q3BtYVNSUnFMOGs4bzli?=
 =?utf-8?B?R1ZCNm0wUVJzV2FPem04VlFhcUJWQUIwcndFOVJ1d3RWN1JvaHRDMWt5ZFo4?=
 =?utf-8?B?aHlNMkpYcmNkN1RIVDg2b1RybFh3OGpOd2tvelcvbWc1UEpFRVBycG5naURz?=
 =?utf-8?B?cXVCT09RNHZRbTk2YjBicXQ0TGwxT2tVMTBXQ0FvZ0tmZHk0aUFYYWdRek9C?=
 =?utf-8?B?MzJuSVZEcXhsMS9VelhWOGtCWDFrM1I4QlpGYjFZaU04UDJ4SVppcHI5WDZH?=
 =?utf-8?B?YnREK2xicTNlYzZZVmF3TUVEbTViWWdueWxYTGlaTDdBeHJKZmR3dXhLbmxD?=
 =?utf-8?B?c0o3emFtOUdzV09qd2I0K2hYZ3FFWmVGQk9uRkRuMmpMZk8wVXNZY3lKM0tr?=
 =?utf-8?B?dENVeFNnM1MwcUJqaUpEaEhtTklFRGlZUXF5OUpOWmFVc3lKVmJNdGtyQ2N4?=
 =?utf-8?B?eW9DQzFVbzVOSHNMS3JJSkhtM01zL09MV1JpV3oxSzh0NTdaeXdnQVhrV2g4?=
 =?utf-8?B?YzMzelN2YmUzdTFEYWZaUnZOM1pSZ3ZqSnhyNkFJbi95Y0p3NENHWTRhbDRY?=
 =?utf-8?B?MGE3c1pyTXlscEw1VHV1UTdTcmhFVEtYT3lDWkMxc08vTStmT0pvVWJvYnRC?=
 =?utf-8?B?V0h6a0w1bXp6cHZqL0plNVhZYWU3czdWQk04RkhGOE1iMHJjejRLMHdqZi9q?=
 =?utf-8?B?Ykx3ZE1aL0l3cHNMNm9JaTFnSUZtRjRSekdaaDIrZW1GSDYwckIxS0FZNThQ?=
 =?utf-8?B?OC84QW8vTkJBRnpLaGx0TTBUdkpSQXM5WWpoalZJaEtocXlMcjRUZWVEVlhQ?=
 =?utf-8?Q?G4F62TneS+Vp6oz84jgvpEg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c69deb-71c1-48ac-74ac-08dc53aae2e1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 06:54:19.9004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jp9MVlo3Tt7jJkz73OtJm9n2SpjG0MJ/w1p0qiKGg8jj0PcKKDQbKc0XT+UqF8d3MxOfMgO9GIbXM9s8jRCIb8446+s41jC7ZpSeLoO+9jFSc67CX7fS+EtqhisbYFzd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7578
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

On 02.04.2024 07:30, Matt Roper wrote:
> On Tue, Apr 02, 2024 at 06:17:19PM +0530, Balasubramani Vivekanandan wrote:
> > From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > 
> > on Xe2 dgfx platform determine the offset using Flat CCS size
> > bitfield of XE2_FLAT_CCS_BASE_RANGE_[UPPER/LOWER] mcr registers.
> > 
> > Bspec: 68023
> > 
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  5 ++++
> >  drivers/gpu/drm/xe/xe_mmio.c         | 39 ++++++++++++++++++++++++++--
> >  2 files changed, 42 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index d5b21f03beaa..ea75c1f0ebd0 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -69,6 +69,7 @@
> >  
> >  #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
> >  #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
> > +#define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
> >  
> >  #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
> >  #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
> > @@ -141,6 +142,10 @@
> >  
> >  #define XE2_FLAT_CCS_BASE_RANGE_LOWER		XE_REG_MCR(0x8800)
> >  #define   XE2_FLAT_CCS_ENABLE			REG_BIT(0)
> > +#define XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK	REG_GENMASK(31, 6)
> > +
> > +#define XE2_FLAT_CCS_BASE_RANGE_UPPER		XE_REG_MCR(0x8804)
> > +#define XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK	REG_GENMASK(7, 0)
> >  
> >  #define GSCPSMI_BASE				XE_REG(0x880c)
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 5d13fc7cb9d2..49a32b03fcf8 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -163,6 +163,42 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
> >  	return 0;
> >  }
> >  
> > +static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 *tile_size)
> 
> It doesn't seem to be necessary to pass by reference for tile_size.
Correct, I will change it.
> 
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	u64 offset;
> > +	u32 reg;
> > +
> > +	if (GRAPHICS_VER(xe) >= 20) {
> > +		u64 ccs_size = *tile_size / 512;
> 
> This value only gets used for the assertion below, but should we be 
> taking the value from 0x8804[23:14] rather than deriving it from
> TILE_ADDR_RANGE?
The intention of the assertion is to verify if the flatccs base address
provided by XE2_FLAT_CCS_BASE_RANGE_* register pair results in flatccs
size which exactly matches the tile_size/512. In other words, it is
validating the XE2_FLAT_CCS_BASE_RANGE_* content. 
Therefore getting the flat_Css size from the
XE2_FLAT_CCS_BASE_RANGE_UPPER(0x8804) itself doesn't seem to be the
right approach to me.

> 
> > +		u64 offset_hi, offset_lo;
> > +		u32 nodes, num_enabled;
> > +
> > +		reg = xe_mmio_read32(gt, MIRROR_FUSE3);
> > +		nodes = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, reg);
> > +		num_enabled = hweight32(nodes); /* Number of enabled l3 nodes */
> > +
> > +		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
> > +		offset_lo = REG_FIELD_GET(XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK, reg);
> 
> This register also appears to have a general "enable" bit for FlatCCS in
> bit(0).  Should we be reading that to make sure FlatCCS hasn't been
> fused off or disabled by the IFWI?
yes, makes sense. I will update the patch.

Regards,
Bala

> 
> 
> Matt
> 
> > +
> > +		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_UPPER);
> > +		offset_hi = REG_FIELD_GET(XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK, reg);
> > +
> > +		offset = offset_hi << 32; /* HW view bits 39:32 */
> > +		offset |= offset_lo << 6; /* HW view bits 31:6 */
> > +		offset *= num_enabled; /* convert to SW view */
> > +
> > +		/* We don't expect any holes */
> > +		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(gt, GSMBASE) - ccs_size),
> > +			      "Hole between CCS and GSM.\n");
> > +	} else {
> > +		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
> > +		offset = (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * SZ_64K;
> > +	}
> > +
> > +	return offset;
> > +}
> > +
> >  /**
> >   * xe_mmio_tile_vram_size() - Collect vram size and offset information
> >   * @tile: tile to get info for
> > @@ -207,8 +243,7 @@ static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> >  
> >  	/* minus device usage */
> >  	if (xe->info.has_flat_ccs) {
> > -		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
> > -		offset = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
> > +		offset = get_flat_ccs_offset(gt, tile_size);
> >  	} else {
> >  		offset = xe_mmio_read64_2x32(gt, GSMBASE);
> >  	}
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
