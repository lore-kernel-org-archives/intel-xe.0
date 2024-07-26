Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FBFC3DA7F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 12:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3471C10E0E8;
	Fri, 26 Jul 2024 12:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqZ2c7G5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC5310E0E8
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 12:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721996048; x=1753532048;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gfFAQpA+X5FQSOGCaNV2P+TbmRFmn0Ffy9p4xpukL7s=;
 b=mqZ2c7G53tOImsJDpyv7qFlgR5qwsL9qBMelspKTyHnW2kfrnpdhsSfF
 Y3ocHh4rahDmAOR+Tr5SeC7joT48UjO7s6xqLwLvMXsTpLNH0OKYrS+01
 2Ct7HY4deehcETFoZpPzVEC/NcxjT+D+dXhTOepy5347UDZhQkfeeSxuy
 +7QLq/CixmgH+mfFZfeR6sXhNI46/t7L+P5rXDXwboLcIwwMsB0vsF5wQ
 giqFeFg17Rs3sSTnq0DztCpBi1mlavqBR8VKLAw8WW4W0oJhIdvba71cc
 gD/tKdYnqscuVxzmXLN0mosdqVXosFLOdvW4bvi98xhm3ZjSBhNJ+5f/G g==;
X-CSE-ConnectionGUID: hKIBOKDqSoaWqvZ0E47Z2g==
X-CSE-MsgGUID: /oZ5cHuqTe2Uvr7QDlLfdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19633765"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19633765"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 05:14:08 -0700
X-CSE-ConnectionGUID: +xJ5SU9jRoGZrRdjHBlQlw==
X-CSE-MsgGUID: mMbKtI50Sr+QoPUTRlbgEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="53186705"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 05:14:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 05:14:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 05:14:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 05:14:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpUTF80DFN5k6fSnVJCl8i8Tt1Okd6U1ldancHVhvF9pYm5me8Nk6VpgiWvXSkBsDZBINMp32GTY0RE4g+bC5T4oFG6vPrGNXl8MMYig/rKDWEOJevdUpD+OgfVNBl0UCpKRVvP193PuQRdup5GAsq4nXSmG1AgfTcd/g35YECC2neINYcXpWmuDWV4y7UMf7e21fXPvG7EHdMSTbLOXYgbQ3uSArvp/s5iI8YhS1WBeNq3FGrh3QhYqtxn8vv4SGAv7dB5bs5lkz/WYOP9wRFn6aITQ1m0ZZVDoJmlmAR5iummiQlPSl5/MQoAIIjZ93syUQjPkrMGweuouQ2sxTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrwTn71gErEftwlgMsRr8+o+ZSy5XUm04bDroDuU+IA=;
 b=Y8HDryxeFoo2zabXnzYKmYMA8sZKSL2dx/asn0JqqQ/4tiD5CQo9C+Ih4I4OKA0ktJt1irEFzloxZm2d1MK7ftEbAYjfHsZBoKz2SGVbDhdWnYmggLXaMv75jSTeZRMi349gzl9JeoAePE8ZbJ+EDRKRsTuSsjCHa0hgIePRklhyqfLp+oSW1f+EwwfvKCA+IRg8HFTr2eRdwlPKErENBz87DfcV1cXG/il6J4Yt9zzm6Xe7uSEKLssDVxoCaJ+Pg7BwTHecIc5yIkolK60Z8G00zx8zRggFK+LLWrBheiC+9RIQRPWteDIDGgTnnqRamGp+ZHNTFSKNdADSnfYhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB7158.namprd11.prod.outlook.com (2603:10b6:806:24b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 12:14:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 12:14:04 +0000
Date: Fri, 26 Jul 2024 12:13:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Take ref to VM in delayed snapshot
Message-ID: <ZqOS2JknVn+/Ui/4@DUT025-TGLU.fm.intel.com>
References: <20240725232414.1958243-1-matthew.brost@intel.com>
 <SJ1PR11MB6204C26850EE7C5D5D115F7D81B42@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204C26850EE7C5D5D115F7D81B42@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 13826ff4-db9b-4bb9-d3b9-08dcad6c70cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XjMEICiv9gqPXwye4STYULGtW9vAZ9UtsKTAbm5897EblOVdH+MdWGRwkGcA?=
 =?us-ascii?Q?ho6kCm6u0WoSyQ/BEVG/VUbCC+1MtsLYB1GO9ZLRrnXxd20hkohjdMtzqVqE?=
 =?us-ascii?Q?cHieooxx3aI7HRW80L5rMSKN9lnVBI0lY/VR0/fbSO2ezQLQgBenZAIDQFzW?=
 =?us-ascii?Q?fkQh8lJ8KIuxOhOoxJvtJgfBuAPVNnRhZPe4L+oln18mwDzDhwBSgLZUIVwe?=
 =?us-ascii?Q?YT86LPU0hKbYTT8IBbIIuD34dTrE54w2R/wFoejnSrDeQq4oVu4yHxyUeelM?=
 =?us-ascii?Q?jkBMmG+y+xLB5juMYMQgxzoCVUuae/Lb0pPmdnmuOP825FODvwL32BTStjS5?=
 =?us-ascii?Q?jbfAFnZ6nzjFsMlcpJBLAUD2XePzF2lC3XbUKf4lIGsxr+hTX8SftgLeK+ij?=
 =?us-ascii?Q?dWlo5ZhRaZEFt+nKu/MHHrVu2PRoRkGhs/MfYlHCG3pTPl63t2uAn7tUdEZN?=
 =?us-ascii?Q?qXzB+8tCC8Pcq2VXbOmnE8HwnlvdZrIJkq9YEneChE1fCeS2LXMD29z6HWBx?=
 =?us-ascii?Q?VcYqqNP61vopiqma1M8BVMOHdqFhrGzFCsnXI6WU2YTenZMawpbNPiElYq03?=
 =?us-ascii?Q?UJqJ9eVo5bT/Of2qFG9k7QVZm8qw53LHeODmG25SrFPchAZzG+dxadXeGFAf?=
 =?us-ascii?Q?fYIfP4R/BYXfP9V+DoyNB1R0wSnudKS/iEdssUe0dAxMEhGatxf2FgRGXg8a?=
 =?us-ascii?Q?EuFjqkOJRWEo1xIHNUepsU7dkN343lTXJYJuBFDKnuVUZ0ssveN+WHVsbMr4?=
 =?us-ascii?Q?56zqSPFYNSYbpEUak8/4vyoYCqC2PNg/SJC0ULEMW929HdP1iwKKKcuP9yLx?=
 =?us-ascii?Q?WKPgS85OKSqRc4XIvvM4W5alcfyj+DescIzUJf4Gd9UwxlP5QA8mW6G0v24M?=
 =?us-ascii?Q?+pjytmA8P9x5KbU+wRcADOpSga73KgCpi+HljQxqypC+1tmZQouXFme7LIb9?=
 =?us-ascii?Q?Afeo1fXMJg+Bly4S8Tiku8GdALeTd6muZljjRl4yapZElj9S9XwhYGUm2WYV?=
 =?us-ascii?Q?wXF12i+gfww8ZhYEpUQWZivbt6HHQ8nwGY2vGZ2thLL2CZhH8M8b1yy8hksZ?=
 =?us-ascii?Q?/yieVyQHw3p5iutHMcML/cGXRkZ3Apm9E9eOR+lP9GlIlp+styBRG56/eea1?=
 =?us-ascii?Q?WEZXk3wD0OyjOSGHU2yz5GJ4r3oGqpgHmNsV8i1K2okL589Tkcp9d5G1DXHj?=
 =?us-ascii?Q?z8I4CQjLQqUmuQ/1IxRZy7WhvJ6N/D+mId+Xy6idG4UaR5TG+V5rFd6BFbXk?=
 =?us-ascii?Q?yukq8G86JjvTzYLcfsMGHO9qqPsG7NzJ7g1jAhfwSR5k7NzD3YJ3SAfGMP1F?=
 =?us-ascii?Q?H2wR9T4BE5dIK5ot1nNJI4xZgFbSpuYv/duO2DxWXlQGNg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mY0p6PH0gsq1XRp2qs1sCiLssxMQH+gwdGc7AtgAG81oVwSlR9ygMM0WB3mm?=
 =?us-ascii?Q?QL0jWsLSAyHggQsgHblT/rbHfpWGkBMNC/Q1ySL4OR1uiphPTB7RQn0DJfUS?=
 =?us-ascii?Q?Nawv+b47oG5RFC9ZrQbGkq6wErqVmgaq/U3btkhU0DXmGiGCGkkFU25cUlXv?=
 =?us-ascii?Q?2szXVFwoo5WfckOE8oRNFAq5MSe6mCFMPDf0GIzrlFljBu/wYf8H0+pjJ8Cv?=
 =?us-ascii?Q?SW2a7PpjBqBkZJsrnt2QfHVvxHbSSTTpeYSHXvo6G5e54Ah0o8MF+5wX+t9H?=
 =?us-ascii?Q?UeyLMI9EMijnhsMwNu86k5tYuZMfHLw4MhX8F6UeVZ2qjcwO+wrDSNwZNvPS?=
 =?us-ascii?Q?TApTpEGPmQfESEXS9vj332diNLEGMd8OlyzLMUTL2ApPhzoRnF5ANbwzR2le?=
 =?us-ascii?Q?uS4Zonv370QjEoEoROVOtAGWH1bApZlvSIXRo7lMOeczaULkiRyWjfH3Ztai?=
 =?us-ascii?Q?0XI0Gi+QJKGsQj7Zzs/sGyAz0whT2+FCT2ebeYs+cPuh3B+yN7BcAxp+qcUZ?=
 =?us-ascii?Q?jGAnCfD2sVTzACyTuhm2Mgv2UZDlM5LKf2JKlGU3rEf0fObH44X/qekN0fqk?=
 =?us-ascii?Q?NQTVIXBHg/iN0EAEUJTgOu3/VNsPTHofCri6o9i1SWeXJWu8S1rTzghP+3Fo?=
 =?us-ascii?Q?4pmCWwbLGLmbCx2DMLJ9BdcnX7bSSDpLPfqTB+Z5wdsmNgeM4+Bfgb6DMWAR?=
 =?us-ascii?Q?Y74YNv9Ssn45UNJwF3Xlj2xNA1j4A+P2s+X/oBWBpQxvmYAdJ6T+3pDeyyEl?=
 =?us-ascii?Q?DlrTPqD+yP1Lw5PLeWOFBTphtaQq4XE61k7GmqZd2V1dRSK5tCY5Ci+HABCM?=
 =?us-ascii?Q?cn7r/F0/HSLUflmR/kicabb9AykVf6S8/kiS5PPXOIGNoPuebX9otMgVOKu5?=
 =?us-ascii?Q?1gwn4Ktw0W2C2u9rPKghCuCUo4GYNWqKPr3AMZbfb3gSd/8ZJn6B8orBiZbp?=
 =?us-ascii?Q?QblpMRNscxn2t910baqc/rFGobH4yhYIQT+9CnfeTo6hR6TnT7hJLFoUnBG2?=
 =?us-ascii?Q?11IqsaYAU6qrkL+7pUvus8N87WvrPy/w7mtsjjqbog4zPF+6xTBWAVVw0mGz?=
 =?us-ascii?Q?LV3P3DWSwmPulj4CMOs9JViN33/hLuxgNbKCmL8tDGuXPzOlFEcxDdkEdOAG?=
 =?us-ascii?Q?5hGstzHIZ8lHQn8txNRAwCHZTTLEcTdbYoJjSmWRlveioQRcnrkRgA1Y5EiY?=
 =?us-ascii?Q?T9le3ax0gd5J0mHTqGxHwFMsSHEReDyyBwH4ro1qfe+LdZobh+uCuBq9TTGE?=
 =?us-ascii?Q?PMYnOQj0YFj8AMf13OzV18xUAgb2fh75+yd1dJ7ZPRYvlkRlxSJfZ4eGwQC3?=
 =?us-ascii?Q?OJK9Hzt3A91EzbY6V6DNniQyu7hkMLnpab/zSP+Wy8DPHYG3MlB9in75Oqth?=
 =?us-ascii?Q?LloFMHeQ7+lvdFvX5zubHUbQVwRD3rdFitiJZGntALQ8WHmPNzj9KkeVmhOE?=
 =?us-ascii?Q?koEDIZP1pdGCvDaZXv5GtC1Rmf25xyvLhsw3+fTL9grFem04vnwgBZ1WniPw?=
 =?us-ascii?Q?8egNRKhlWjNGDHC88vvZBtWgm0gxeLaRnjbWgR+k6KGOunH4Dorb+xV3+93v?=
 =?us-ascii?Q?mQTB1NxDptLOeSsLA4oYruXQcik19EA7b6BJQneqhSL0o6hTlFN+TODlyggC?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13826ff4-db9b-4bb9-d3b9-08dcad6c70cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 12:14:04.1342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXAy4bFWDw7+LwhUs2c/zIGeJKbo4FnYd5mD0I49n0eG9eI/U9IA0c8soFVvZqEe1GPo9yD+wreRfBZgVagTEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7158
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

On Fri, Jul 26, 2024 at 02:17:04AM -0600, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Matthew Brost
> > Sent: Friday, July 26, 2024 4:54 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Zanoni, Paulo R <paulo.r.zanoni@intel.com>;
> > maarten.lankhorst@linux.intel.com
> > Subject: [PATCH] drm/xe: Take ref to VM in delayed snapshot
> > 
> > Kernel BO's don't take a ref to the VM, we need to the VM for the delayed
> > snapshot, so take a ref to the VM in delayed snapshot.
> 
> Can you please give some details why VM needed now!
> 

If the BO has a VM it shares a dma-resv lock with the VM, thus if the VM
is freed before the TTM object individualized step of a BO we get a UAF.

Ideally we want kernel BOs with a VM to take ref to the VM in a BO layer
(see __xe_bo_create_locked) but there is circular dependency for kernel
BO and VMs which need to get worked out. I'll look into fix that when I
have sometime.

But in meantime this will fix a UAF so it would be good to get in.

Matt

> Tejas
> > 
> > 47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")
> > Cc: Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_lrc.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c index
> > 94ff62e1d95e..9ef9b45a3596 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -1634,6 +1634,8 @@ struct xe_lrc_snapshot
> > *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> >  	if (!snapshot)
> >  		return NULL;
> > 
> > +	xe_vm_get(lrc->bo->vm);
> > +
> >  	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> >  	snapshot->indirect_context_desc =
> > xe_lrc_indirect_ring_ggtt_addr(lrc);
> >  	snapshot->head = xe_lrc_ring_head(lrc); @@ -1653,12 +1655,14 @@
> > struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)  void
> > xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)  {
> >  	struct xe_bo *bo;
> > +	struct xe_vm *vm;
> >  	struct iosys_map src;
> > 
> >  	if (!snapshot)
> >  		return;
> > 
> >  	bo = snapshot->lrc_bo;
> > +	vm = bo->vm;
> >  	snapshot->lrc_bo = NULL;
> > 
> >  	snapshot->lrc_snapshot = kvmalloc(snapshot->lrc_size, GFP_KERNEL);
> > @@ -1678,6 +1682,7 @@ void xe_lrc_snapshot_capture_delayed(struct
> > xe_lrc_snapshot *snapshot)
> >  	xe_bo_unlock(bo);
> >  put_bo:
> >  	xe_bo_put(bo);
> > +	xe_vm_put(vm);
> >  }
> > 
> >  void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct
> > drm_printer *p)
> > --
> > 2.34.1
> 
