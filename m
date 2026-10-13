Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B19CC6B08
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 12:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB3610E7FC;
	Tue, 13 Oct 2026 12:41:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59BC10E805;
 Tue, 13 Oct 2026 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791895277; x=1823431277;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=e9UDLjNnRdl2+PGGOVUeDItUU68FiQ7wCC5iHJ0SGfc=;
 b=lwSfmjKw9j0Az0HQZLCvF/IRpiRNT8R3q6tpnJ/jhj6pjsiwUB1uoE2S
 21HH/KpjGsF/UDxeL370LH1sCdBoMBmcXTlcXxqkEdVw1pcDtMBN08rMG
 MJF+yvo5ItNc2ibvRYACKqsGnsEsD1VeTIG3Qd1C0ytFLj4dPWPnCkFmr
 Y1KxBVa4PtqK8WDfvZWpBIaYFRErOxoz0mGzP9mtmdu4wyJCE/nq7fJsQ
 7wvSk8Wq7iwuUjQ4WTglz3OCp2XiDB2QxbYEROj/Nk6WoBeKeerorgHIG
 uAdSnJWifWDJHFRppCyCytI9I/m00Jbz9+8ix/bm18xqO5EhebVM9/Tr7 w==;
X-CSE-ConnectionGUID: IyDbw56KRwCjiLOGe0v8FQ==
X-CSE-MsgGUID: dRaDvasLRECIj6hwl+Rxug==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="515214"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="515214"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 05:41:17 -0700
X-CSE-ConnectionGUID: B+/tB79RSGWAo8dkHaJ0/Q==
X-CSE-MsgGUID: Zf5iloNRTwy/6lG9YuIPCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1228481"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 05:41:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 05:41:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 05:41:15 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 05:41:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCya1+jqqqlaA9DHKI5ECx+P13oYP8l6u5KeDsZ9Pg8iOfn6rLgvBAw9m8LcsZp3fLBPwFnmt4khh2LM/iu7rKici8Tk85wAC7Yk4c4x1gBrxACCJYy/mp19dX02IJT+08bSgrEPPxYBBYnSxdr6blKlBPTNCt31odhzCR+YHbPw2ClCrgl8yhRxT1xrywP+ttJ47BHmito9gv1+ZUjoKRW62zDYhU1XPpB6H+FzJGgSPVXwXAihNfa23b0FdAKUjxGHm+G+5vfSdOc2lLFTKum2L5WUjHV+XANsOfBqmCQOke7IXykH81NvEN3MHr3zVCBK94QTrYieS4RrLt1/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27lI5yvYjhGZmsuJMOkcrFg1/XI7d9Jg+E/6r6QAOgI=;
 b=MVdADf3YbPqOGDlHhttZ9JIrpldlezJtIw/71cANDyg0a0VFS0VyB/rnoGeWNn9NIrdYmzgViYISrp3yEKfnhvXG72WR+6g/rjVnjNhJCLP8I7Sf4x7ss4Otx1YNBO2aUYGl9L9LviebcbSJFTvkeMhJk1X8WJxCVXf2xWJjgBMPuwMKqeAIgRsZU4YrBvxrpfKE6LSkBJ5kvsmPSi/VdpXK07s5IYC4vb2tWmLkXZB5dAAMtoPqIW9HjJUG2vAKGsdwQaSJXC8bq09OiMHyrZtheJxmYiLbo1NYabGD7Ii6GiQ+Yzipc8nJheKf8GgPrcYRolzp7YO/9oHOU//+5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by SA1PR11MB6662.namprd11.prod.outlook.com (2603:10b6:806:256::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 12:41:02 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 12:41:02 +0000
Date: Tue, 13 Oct 2026 15:40:56 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Kahola, Mika" <mika.kahola@intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/i915/dpll: apply the PLL power save W/A to port
 A only
Message-ID: <as4m2CWYG-lUzfta@ideak-desk.lan>
References: <20261009103552.1864818-1-mika.kahola@intel.com>
 <20261009103552.1864818-3-mika.kahola@intel.com>
 <as0Tgm77ARcfcHQI@ideak-desk.lan>
 <DS4PPF69154114FE5A707C5339FD36A7CF2EF9E2@DS4PPF69154114F.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DS4PPF69154114FE5A707C5339FD36A7CF2EF9E2@DS4PPF69154114F.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GV3P280CA0062.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::18) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|SA1PR11MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ea2d73-85a4-4145-91b1-08df29273d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|260925021311599003|260925022911599003|260925021911599003|10067099003|261009223027099003|11063799006|5023799004|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: x/eGDq8Td0T0IKgcvU5f+YdwVxkfIx6VK0OablDh7g3rxvWFvFbZ0hFu0l1/WNfV7L4fXRA4oCaFQN/1TEJUa7qeTZt0kL2ws/YdbaQXI7eL7H/m69jVN/VNs3mBvP5YD431kQZ+AVCAfq/z35AQvEsWoRmv6WsKMpEBHOmnhRQ2o4mzQZpmba2bVCGPfQOz+UxZwfwFAqlJGhK0rKDDBONj7xsh0VwTr9OuMFst/hsYgy9FQAPb2VPcbwS8KOL8vWWUNWjKe0POaJcvJ9cd2fiuv0xabFFYW7J2gKuqlZYYtx0UR+k6JOjwKjB+2wuNw3HY1Q+fNFCX3vCFiv9mHlxCTinZdIvr2Ry3BFi8zkVVl63THb9VSXi2y59+WzRj0bHGqI4Y+kUPppN3R/wDjiDhNNgWTOit9jS0vzTjIpy2WcA63D7Ve1IndSlOYQ6GFR8oRBfX11kW9oI4Ual8r0EVrNpx7okH+w2BcaXS+wnYWlun/Hko8ZITj13Jz35MTUJZ1xaE4Ak9uosu6/Thz9X5sf0X/SMrJ0blQxLyoJ/7d7lRJmmNsOJLC+2IqN69r9KEgv42q+5Pe94aakjpInrSX69+UxbcAmdJr2tkoSsm9+xa1+bV+5s+ip8CapbGgDXP75DHi7OG6jyDYYICHrLLGJ282lBETU7TQuh0qp8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(261009223027099003)(11063799006)(5023799004)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BFIHsf9ACCuQq6AkPnh/vw2x0u9t9Ry2wndaLRXZVTO4YZNVjxwPw/iTSPK0?=
 =?us-ascii?Q?5j36YM/2OkGGJC0UsYt9vD8sRIOAeNIAAEywH/tyKYK26DJ1/VpQ4GMj/ZLe?=
 =?us-ascii?Q?jAdGfAHIB2hRm5D22/iwT4rWcjS4ZviGKnw2HSH+ejN0hVuY2dzVAhRqBK0u?=
 =?us-ascii?Q?LXrEIEc26oeBrDvK3Wnn+XkGUVyDSSeh6ePd7abSvKJZ2/1xS/gAC2NOadKB?=
 =?us-ascii?Q?pEOvI67MUAVUZ7bpr4VDjQKi1VHGqcVZ/gaRZJeusaAxxEoxhY4C2jahFoFN?=
 =?us-ascii?Q?T63hxk82GtFZeVBTGDQjY/gbNn2jdZmGAw2Nn3xg1j4wR79yltpgFEWT+hIO?=
 =?us-ascii?Q?oygNt01+fYnQzWLekzX2CVqU6SakHJZX71BChODbu0MF/EX+oacNCWrJJX6f?=
 =?us-ascii?Q?IM7PQK94Okh3U+OF1cS8KKPORqcjqYizYv7t3Y7nerwKmAap8hEB7EuUgZYB?=
 =?us-ascii?Q?wyvf5ZCnk+QxCTjjqWZCKk749O5jAl/JxNsl8enNdi7RRivHOmT8m8ErcKOd?=
 =?us-ascii?Q?OBjhkhTiBZLE18Xs75Ha8IEdj+R+OconhX6sd1dKd3JIfbFKoDLntWJFn4N1?=
 =?us-ascii?Q?zjNGqKhc3FqezKaGgB3qvTqIVgjz3k4g9r1eyQzYdNNJcExpztSmvH8JNxxx?=
 =?us-ascii?Q?whT4zs5DAa3tNZgLMuewUMqXmJGdrCiB4zlEnSvokzyEFm0DNoInNPtp3EVH?=
 =?us-ascii?Q?9juU9l9H3Ni/wcblyaFT1g2MR04TCVR9xPYpjg+xq7UwFFNkfo2dOzwNa+pw?=
 =?us-ascii?Q?UgdQ0ZCSd0SFzLOC9IbLrN0DNf4NdQwBdNST+6e+geZU07wdWU67yhTLoOP6?=
 =?us-ascii?Q?Gy01O+2cxIg45A2YkyEt7xqGRbl97niRz/OmHjjAdYGu1ItDM5CpJJ4ywIR4?=
 =?us-ascii?Q?ninBnMiUXL7I3gpT6EIRkI9EJ0DrAnzkZ1MQrVIlkQqVagYc8mZ9V0cMhIJJ?=
 =?us-ascii?Q?SgT+ovqt6MPXBLC+yx5bmmiDjOsoHoTh+mmkpA2iCrKfctJoEhzMa/UYXi7M?=
 =?us-ascii?Q?QeKsl2tyjBLL8UvjppJCJAHYDne9xXA7KwuXhi1OijHYbZPwaD3vLXrovK6q?=
 =?us-ascii?Q?iu7pPlHJ3QMfUS+K4mQumMKVMSCBDfs91yJvxagRWAvZCGPi1pCi7NlaUO77?=
 =?us-ascii?Q?ftJQrKI61wu+DdSInSIF1zawcBqAfLsT3dK4uFK11we/slhYjo9ZnowOTS94?=
 =?us-ascii?Q?5+FXPdwFof98Q369jCSU8I7LMHc7f+TqQhIkwRqoaKaP4089JQ8fzLhbGVVI?=
 =?us-ascii?Q?wjwi3w5ezuOEX+T/ASoG7f78q+xqDIsUdlEqtZch00k+ltGMwh+YaWEk8OZv?=
 =?us-ascii?Q?L+qkzNHFx3eq7CI/D69GGmnY9SwCRi7NIh/ju2ltnG/yyBwWTEqpiI9xQbKM?=
 =?us-ascii?Q?OEr9wNJGSHuV9JFscjxx2lOuVbsAYt047lnknOdyJ5vqihOAofysFB10U9T6?=
 =?us-ascii?Q?DmVBKltGzwPqGYvXZ/PTfeJqx6nphrgdStXjgSiVU4CSD2OZO6uQ2uPPQiQs?=
 =?us-ascii?Q?aR1S58hBqWwb+bL2M6z4HDOqBNsEeZNWrb4Yy1ZRKShg56iyjjcuILV5Ea63?=
 =?us-ascii?Q?2t4291uzl2Bna1Fh1TwxkbfT8fr6CNL5RJI57K2k/HI7EbcdqvfzPIcAdVR+?=
 =?us-ascii?Q?OFSnkbUrSqPgu9COTuPkHWjFAEO93pWjt8tp5TLBxFpeHhp/V454RmesXeKG?=
 =?us-ascii?Q?Vvm4g7s2EX3i2566G8DjY4Ca3Y3lyoFEI6w/urFxq5rXnWpdPvtc4z2d+26/?=
 =?us-ascii?Q?j+VfB6lH1w=3D=3D?=
X-Exchange-RoutingPolicyChecked: kll1kgt3Iec3luDazCYnmKsJec9oWyV5YW9oaFVyNTeXUaQqi8zAeRgfXhHdwMggUEeYbFZ3KkDKQE/h90s0VQRBCCkpUXFeqzoGpTb6EO7Q1Iw7WdKFBeM4w647osSdG/RSFgbjOtHv1mK+cX9TNHGiCTA3q/zJVSbA67HEbqVxXKseUPV45kMf6a/LmRW6SwIfJ0M2ZdQvy8ZQi/6RxIQU5zaVoYEC0347yI2VrRJObqPUo2428KKnOa2Oy5MCJLZhnPos5yGKPf0iV4QFrDwcLSfL4BLSG8tDWF7+/waEcvrZ8D1B6RkOmSgskd91m8UM+ohbAOpxm1SuloAZ4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ea2d73-85a4-4145-91b1-08df29273d84
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 12:41:02.4862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5H6WCMn8SYLSNIWLpigqtiY97KehPM0K1rn9l1411+iR03dwvjOWTvp3TSI0ZAG7A7lHw7GmBJpte83AxvfNSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6662
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2026 at 03:31:01PM +0300, Kahola, Mika wrote:
> > -----Original Message-----
> > From: Deak, Imre <imre.deak@intel.com>
> > Sent: Monday, 12 October 2026 20.06
> > To: Kahola, Mika <mika.kahola@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH 2/5] drm/i915/dpll: apply the PLL power save W/A to port A only
> > 
> > On Fri, Oct 09, 2026 at 10:35:48AM +0000, Mika Kahola wrote:
> > > W/A 14022081154 applies to port A,
> > 
> > Where is the above described? I only found that the WA is C10 PHY
> > specific and can't see how the port/PHY A/B being used would matter. It
> > seems more logical that the WA is needed whenever a C10 PHY is used, in
> > which case it's being correctly applied in the WCL's C10 port/PHY B case
> > atm.
> 
> The BSpec: 74151 
> 
> The title of the workaround only talks about phy on port A that needs
> this additional programming.

I think that LNL workaround wording only means that the workaround is to
be applied on the C10 PHY, which on LNL can be only on port A. There is
no PHY connected to port B or any other port on LNL.

> Hence, I think even with the WCL case we should limit this to port A.

I think the workaround should be applied on C10 PHYs always even if the
PHY is connected to port B (or any other port if that would be
possible).

> Thanks!
> Mika 
> 
> > 
> > > but intel_encoder_is_c10phy() also matches PHY B on WCL, so the W/A
> > > ran on port B there. Filter on PHY_A.
> > >
> > > On PTL nothing changes, intel_encoder_is_c10phy() already matched port
> > > A only. MTL and LNL are not affected either, the W/A is for PTL+.
> > >
> > > Assisted-by: Copilot:claude-opus-5
> > > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> > > index e899b2eb0871..164fe7104545 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> > > @@ -5226,8 +5226,7 @@ static void sanitize_dpll_state(struct intel_display *display,
> > >   * The dedicated display PHYs reset to a power state that blocks S0ix, increasing idle
> > >   * system power. After a system reset (cold boot, S3/4/5, warm reset) if a dedicated
> > >   * PHY is not being brought up shortly, use these steps to move the PHY to the lowest
> > > - * power state to save power. For PTL the workaround is needed only for port A. Port B
> > > - * is not connected.
> > > + * power state to save power. The workaround is needed only for port A.
> > >   *
> > >   * 1. Follow the PLL Enable Sequence, using any valid frequency such as DP 1.62 GHz.
> > >   *    This brings lanes out of reset and enables the PLL to allow powerdown to be moved
> > > @@ -5245,6 +5244,9 @@ void intel_dpll_power_save_wa(struct intel_display *display)
> > >  		if (!intel_encoder_is_dig_port(encoder))
> > >  			continue;
> > >
> > > +		if (intel_encoder_to_phy(encoder) != PHY_A)
> > > +			continue;
> > > +
> > >  		intel_cx0_pll_power_save_wa(encoder);
> > >  	}
> > >  }
> > > --
> > > 2.43.0
> > >
