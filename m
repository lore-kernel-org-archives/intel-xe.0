Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D660EE6B6B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 23:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC4410E15A;
	Fri,  6 Feb 2026 23:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsgWH346";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971B610E15A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 23:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770422264; x=1801958264;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IfQVpRWvzLvkHv3+SwCeOF4/iUVNtDXozAg9lpnHXds=;
 b=jsgWH346U7czejur3NGklao3LSJhzRL/YOgaYp+BcycNO9TOMYBTOG8m
 4G1vSUCJt5Oj+r2gr1xnMKmJs2BPFHOsZ9bahCWM5F29CfrKN3TPNnCiU
 4su12lDmAOKNofFPqOSuhdB7+fuVdQ50ZGxJFqoGuKYouafrmyhz1UW+9
 u8nURjHqD3X45yBC7/j78bABRPPbs+Jls70+J9qMPdQuxwydvdriwetqR
 Cqx+R2QhhMwaB1aKfU8i+NLx4J6/29RkuoqmtUzm4P+dtIfwVYIWkPx78
 5nxTv3gFE00sJdfil5PncRqcw496+eTNfm5TQZC2euJxRA7ZqhcUsz2ET Q==;
X-CSE-ConnectionGUID: aJwoif7/RaypAh7QB8PqYA==
X-CSE-MsgGUID: d9RaSbMSSj2vxCObsTs7Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71535082"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="71535082"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 15:57:44 -0800
X-CSE-ConnectionGUID: pdfamr3TR4SHiUyF/51mVg==
X-CSE-MsgGUID: RPh61F2RRnCXtz7o0gGJvA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 15:57:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 15:57:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 15:57:42 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 15:57:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jq5nvb5MSqrlAAr//gRHqePl80fOZFI2MJNOJmqweR+16PSxRFGrKqOvErIJq/gjQ7NRG8ASQzQBrmtrvYcKbWJ5cIU804umdNV1v21hQHLTjlYY2I/4eUIBBzNhedxQWcqK3jJBv8897KFYAmTxtrGm4YTVKRX6GFFtjimyCqR6BSR3rzAjYwXq1jk6dbHRNANNcjn4gFuoWxWb8hygceV0Jr826TpQf1MCFJbjVzUIEJHxIbJoKeYKeeneVyF2AawJrZZbGQ+Q8iy6wHuug9unX+aKUhuZW/tFxpQcSq6hYufsEBlghaKeMqOgo75fLUvUAhKHzeUoA6oxlxIrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRzsewm6PC+EyWMEgJszEdufK5StVdEsqm2BxNvnT/U=;
 b=qiATYR2woSLUepd4fhPSQKpchCuQNPtvBu5o1j4nzkP8Mkes1cw1LEcncMAZms9Gr/4fzkQTTCCtXEal1Sg1U8kxpwn3npZUSyfo3BK9NedwEVgA08ZI/ApJXEWL0dAUU5slm96po+dYizNvbMAw1lBJxd+pqdnXWS3t7MRbQHRIHUpV2mC2r+6t4RAK/9mXW0g08Cwz1IbwLNbfE6yVMt3WxVB5vHehVHxe73Clgd1ehVvNTkrCWabm100qjakCRjAOx/KLyKCqrWdKIJ6VNAvtIKFSQueDt4gnbyt4gwQEOPtqyoMkbZCMTOnVrMpjyGJ/SAErzDBaX2Y+eWQG2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4919.namprd11.prod.outlook.com (2603:10b6:510:34::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 23:57:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 23:57:40 +0000
Date: Fri, 6 Feb 2026 15:57:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?=
 =?utf-8?Q?e_for_drm=2Fxe=2Fwa?= =?utf-8?Q?=3A?= Steer RMW of MCR registers
 while building default LRC
Message-ID: <20260206235738.GD458797@mdroper-desk1.amr.corp.intel.com>
References: <20260206223058.387014-2-matthew.d.roper@intel.com>
 <177041971619.235359.15714116294103961937@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177041971619.235359.15714116294103961937@a3b018990fe9>
X-ClientProxiedBy: BYAPR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:a03:80::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a78d01-f8c9-4f1f-c906-08de65db8332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wfZcsvhoK9ObNI/uRjiEzvfJWFM7tVy47B9i+rWRrfHGBzO7XIVSeT/Fo2Fh?=
 =?us-ascii?Q?vxNgYBsJoV8h+/kU02S6I3PlTYsT86Wrx6hqYwTy8o+rbBEqyKhmCnwGRATz?=
 =?us-ascii?Q?u6DwujCcSbnU+QWDZpkrMHlOh3wRItUGa43q98KTlSzaBtRlFdDnBF6mlBqF?=
 =?us-ascii?Q?A1L5x+GZN5IVru55S7H3Om4cJ3Ix3eCp77wj61cmmnHi7nziJ7pH/JKKMM3a?=
 =?us-ascii?Q?0aod6Ft/VilFOI+c05uN3NQaYk3Wdi4vlBW5bkpkt7VSXemj9rOJh6Eoyv6e?=
 =?us-ascii?Q?1QeleQJwPvaTrjDk/0zrnXZzHRz7fsKxvTgUpjVptmHNafPjrRY6N/FBlKA/?=
 =?us-ascii?Q?jzzgADQ4FtSkZp0GBbsZa9YMRrPUh8yEJukWtOpIsB9oLkTWNO7kKJypV5TY?=
 =?us-ascii?Q?IjWJZqU76uH7ida3X8A7bS0+NPGU5LbFCUf4XcH9htm9No8/WO//Te6poeVZ?=
 =?us-ascii?Q?gX1uCLoHtdEDT+O6/UPEbIm7oYGkChDmeWsbVvyyiAuxpiINqZbc0u3ZOL40?=
 =?us-ascii?Q?yUWsj4Hp8p1EtpifRHcqa7olOVdZV4gGd5BQAYd9mFdr4tWmT0bD7kCeUeSi?=
 =?us-ascii?Q?WyLCyV8fRfgYns+muxg2WUEuX9w6w+TyaGk4aE81hDrhlueNJTDjYBiCcfMV?=
 =?us-ascii?Q?cpLYIat516xHxLKsmE5DofZcRWSji+CF6YaUyt/uuhnDneVLRzzP7/SFnkXn?=
 =?us-ascii?Q?38gbtXeIBBYBC+VRjyyALH5nwNn770Pagih7zMP50wIuFexNMtmApqbkXZWK?=
 =?us-ascii?Q?gfxperpCyZ3f6zlDpqOXjmwZ+9Xl34bxSeuyDoa0Ru9Mv2iDXlyNB94PNlKL?=
 =?us-ascii?Q?Q+i6tOrlgure2WCD4iYlKUOOI+MHFhk8S3tx5rI2yc2w+6Ls6IkAMJcqlgPt?=
 =?us-ascii?Q?ikx0ulE6Z3ZuvA+tRuyiMBxaIEx8C6+o1i+Af3bXBIQYmmoyD3Sdrz2jusas?=
 =?us-ascii?Q?7GEvlIloQ+TNHFT5SemL26cR5jwR3FF8YsNcAo9O1Sni5ZqBy9IH4d0h0cm8?=
 =?us-ascii?Q?HkM8+dNj8VzppJudkJY/t+LquhkzB0sQsVq+IQvYB8mQDhvfhX5xsKln/UuE?=
 =?us-ascii?Q?AQ7aJr1fkokuSMJREyRIJRH9CSRy2BjzpNTEly0t1PG+V1oEbjby9paZtzJP?=
 =?us-ascii?Q?Ke2snGZMEBt5cT0+sU2eFvJ/Ql+X/nqoFJxepXtLFBwGxbapkdjczw034vfk?=
 =?us-ascii?Q?XZJJvSRrTJSWfkNgXQNlsLLsuX3479/zCzoV0HCGUQPPhib4+EGNrmzaKuTY?=
 =?us-ascii?Q?10Lm+i+qn3hrMFUN/1e6VVouZFMQGmvOYW5P2nsFTvVVyRYWOGGHcoR8uRk6?=
 =?us-ascii?Q?jpyhZek3TQwMlp7AxbX7THRpAM9x2P/0s5FP4xwjjXM7F85gfXVpdi547H4u?=
 =?us-ascii?Q?ONSk2ycuMsQxFfj64hc+6biTECbvFPMZFXBvDMJ5/ZaPHwSRYOMq38CBbT94?=
 =?us-ascii?Q?aceiTV3/rOyx98fJ2e9ZEC2P2SRk/b0O65YbFNmuVKutLP+ebyBQVjzXRksp?=
 =?us-ascii?Q?xOi78beLTW1awo9CfQgK4E4BEsceuhRJsRBT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CqU1dHYZcWxZNU7pbK+dRPKMW5TeNoS/9iCJCx8RhO4o3L9B88kd5qMasuV1?=
 =?us-ascii?Q?/+bwtGnEbgB5Lxcp043zeTeTpRePZ2EbtKmcBf7ulIGCE18PHBO9aDE3tAAW?=
 =?us-ascii?Q?JksCnZ0Jm3t5yIu71Tyn5kssdnKGN+6M3cYQPqE9ZZcxdFOa4QfG/NjIIk1Y?=
 =?us-ascii?Q?CSVFgjFBcuoqkXbnoXihwMqNZ3OWdWA4kiHL+Ik5y2n/1wHJjedp4WFTs5v1?=
 =?us-ascii?Q?8nKuWbqWdWFGCiJDkZDVx3wWb3tWVSLKgtOEHQyuwNRdXHXk+PipoQXQnNCy?=
 =?us-ascii?Q?1XwAUDQgXll2fdfjlSN/BOrRUhpRfGLTg0tKypULMow6dAQhD9GBDQSSt8DY?=
 =?us-ascii?Q?T0jVurqIR/z1hynZbyW+qsu1zOGrBSNgsYx6QojMo3+Pv8ZqsQ1nWNVhn1g0?=
 =?us-ascii?Q?h9MzURAnHXEDTpynQSoq+xG7EZqHfOIwliRm5beXTv03DFv8iaG3Uq5JdENW?=
 =?us-ascii?Q?XC2dyPvdw3GpdmlLKZJ/jTGOWXp6i1lrJ+VxvnxaeTYS6k00J7gak7Z6viyT?=
 =?us-ascii?Q?5US2H3x6+Sxc9b7is8XkqDiipMzb+aR9zx71dB9zJma4dOKhM4BjFKAHjG5H?=
 =?us-ascii?Q?LGmVRNdbPVtl0OzB92nAUqI/7skPXW2jaz+Dzp7AgZIpIwbdLPPsim8ypFml?=
 =?us-ascii?Q?j9tk8JwqBN8uFbc8O5sC/o/rxIDKaeuQmucTKZH1+xRN0NYMFbfQYpAI29ev?=
 =?us-ascii?Q?975UyVDlnDrN7oWRs4IgfMzCpxzdfS+P+B70uBGGMHaYsB1GB2KuylCfcKZQ?=
 =?us-ascii?Q?pqNGETVhwC8Z63i0qP86obltcbIFTGf6KWskBk/lmA206vQF3ucpb3NMz4KK?=
 =?us-ascii?Q?+4yG1qexk6igESFCgoqS2LsHhV0I9GssUwHGMqMMIxqp6hYWcA1JfftldJ7e?=
 =?us-ascii?Q?v+pbCFUo2MGvNkRAM9B2FW5vmo12cCLf8uPZchxvTR1AnQMV1Z44flziB2ha?=
 =?us-ascii?Q?xAaWA/EUIOEEPwI3lXZevGZIw2S3UXgQkMo5KAtV0898ioxI0ccUlTvanqzY?=
 =?us-ascii?Q?ARgijfRFgjzKQGUMb+VUGsE8XMZQ1kdrxSa28XKB/4sSLy/Q2ql1SkqNhQd5?=
 =?us-ascii?Q?Xq3l7O8nXctY1EesI4nTO1QB/kc8fj4VW5U6jdCxPCMSFbukkS5ADda0HS9w?=
 =?us-ascii?Q?n0mVhtYRiC4aM+Yv+/C8dMLpS/ME/eKbnXbC0wMzd4q9hKp4SH6eKLD40s1F?=
 =?us-ascii?Q?DVRDe81/nqZB7PowhFGPL/Q34KeInzfQvJvAC9CxcIzvSAfH1jzwiq6uYHNu?=
 =?us-ascii?Q?6JMXstQA9AdW5fkLL9gdplgEwXo7j98QGJdSkY8o+SfPi99vkBGLSkzn+Z1t?=
 =?us-ascii?Q?Y8Bz+VHLSvz8I7qY4zwJRD80ktQtEi6t87VwWmzuQVKn+HEq0B3Vbku8dnvg?=
 =?us-ascii?Q?EKevNabJqzMJA3F5u5iZ8xQmo7Thf3v4QI/zMzJynHcgjLbIQxpazbUZVpbl?=
 =?us-ascii?Q?dOjsxb2cN3u9/d7STuqAkNjc0gd4tkEeUFB0lqkrXAHliAwJ08iwyi2EzVuT?=
 =?us-ascii?Q?p6bLnkRGpwKHhUMjSG+UC81Et2ovICiZCiFdzgdgXsASD/UTHl/IfTUags4w?=
 =?us-ascii?Q?9h4g/7spZcR748MOHTDaN/+UE80Al1Ov1wd2oz6goyhvnbtIHPuabsKw418X?=
 =?us-ascii?Q?W5E5iEztkwfbOU6fbQDHJVvQHQkES/wELP2bfXpP2R+Q9sJBhDNqZRaKWCh3?=
 =?us-ascii?Q?69Aw4mXHgXiceKAkx9QIrf8HQqN6VOHk9R0/0ZeLT2tANUdUd/caY7IzIv9N?=
 =?us-ascii?Q?2C+BPDatb/okDsXTWeWiWEE3HVpLinQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a78d01-f8c9-4f1f-c906-08de65db8332
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 23:57:40.7975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKDBHkzL4RC7ucdUZCqwqdl+X5yBvUvwaRy55HHoqZhoWQgyg/S/tpuaisTjlNecvDvCGopFs7CZ98C74GOcY0uzulqGD+xp9IVzOc0x4jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4919
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

On Fri, Feb 06, 2026 at 11:15:16PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/wa: Steer RMW of MCR registers while building default LRC
> URL   : https://patchwork.freedesktop.org/series/161300/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5_BAT -> xe-pw-161300v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**

Hmm, it looks like this is problematic in SRIOV VF environments because
the VF doesn't know how to steer (because it doesn't have access to the
fuse registers that provide the necessary details).  Lack of steering
knowledge usually isn't a problem since the VF also doesn't need to do
any CPU-originated MCR accesses (steered via 0xFD4).  But in this case
to do a CS-originated RMW operation on an MCR register, the ability to
steer properly does become important, and the VF just doesn't have a way
to get the information it needs.

I'm not sure how to fix that gap.  Michal, any thoughts?


Matt

> 
>   Serious unknown changes coming with xe-pw-161300v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-161300v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (12 -> 11)
> ------------------------------
> 
>   Missing    (1): bat-bmg-3 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-161300v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - bat-bmg-2:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
>     - bat-bmg-1:          [PASS][3] -> [ABORT][4] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>     - bat-atsm-2:         [PASS][5] -> [ABORT][6] +1 other test abort
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
> 
>   
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5 -> xe-pw-161300v1
> 
>   IGT_8742: 8742
>   xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5: ab5b6da7d4879640bce3197597e0bc707bd60ab5
>   xe-pw-161300v1: 161300v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
