Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0DBCDE032
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 18:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6C910E089;
	Thu, 26 Sep 2024 18:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhQ66fu+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFA110E089
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 18:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727376915; x=1758912915;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y4jBh1aa8NAofy4hNiOuR2KC8vqJnqrBMfLUAjc7s74=;
 b=mhQ66fu+z8mTX6Y25OV31tRmvAnaQnUx9M6CPFQ1KgcqQLtPJNDnP9yy
 Zmq8y/3F0LZCiqp5G0pB0qbNl33wwGMbUFtS7Itn+YmNm0EEi7CCMCcZR
 gCsHnRpmqSnXbC/hG1KENrhlB+FA5ZRd5bvlCi9NQiqMefH/8v5EdSeIM
 wRB2qgxnPS+Bxbi4y3oxPr4dwfg5Sw8hyvojkJTDQUpmdbbs6IKtCN9rB
 GGuTfeYRcCJsHL7OsnujpGf3lpZpDjwHPTRQ5iNpBuuNS5yorXAcw4LdT
 6QrvwKLyQ5VVQAHeW3JYAcbmKnL5mh2dI68RzpOcdIxDBC79s8CVosiyG w==;
X-CSE-ConnectionGUID: 9JDfX/woSsCCPfyGASlgGw==
X-CSE-MsgGUID: v0yRj3ezQLaJbs3PdmPhfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="25970638"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="25970638"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 11:55:12 -0700
X-CSE-ConnectionGUID: KbdQqUH4TQe1YCfRkXO68Q==
X-CSE-MsgGUID: KVAbF36ZQJeLhyd0N5kKBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="77084575"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 11:55:13 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 11:55:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 11:55:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 11:55:11 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 11:55:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yky+PxtjEhy9L3hivqmQMSryPR0s8PKOmNz8NBtMzyf4o8tB1hqQOCLOtbQ/CbABbuNSceIEPokdzePuI1hrN/kaHVcLaudFIN+hRx0TzlhCIxIsEPQ7Jx96QUuO7S82qyF+yn3U0WqtB8f8gwty7RUwXlufT78CQD81eBdjNkN6CsFtGoHAifgKUhocLIXICEeLom/mhCFDUfWcJRG77CdtB6u06yD5Miqi6EjjFjp0drihM3KOOEWECw4vgUG3oe0CY5sexhzyFwq1juZnfchfylJnt37UMKpMuq0HQnuz22xBwIqfAhbmrks+dQZTh6afub2sf1ERx43oiXeqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/ytGOMezA9FKoj4NeGpBznmZulqr4Ks9Ch+Zg2SWwg=;
 b=pz4hdU2w2JsIr/tktFul4vASEmgUGIM5yBpcow+3ju9MZW47kqdrVzdCP/vB0OmJEyX+vV/373PHtRJpWPQ+BA5fwGF6MwXq9FvT7NWSc++5/0lplPmoHNPuEXFqtXA4x5XPoUD1/IMuWdFoWLO6ed2N0wWwVk6YmQOUvmc7wYushM3uql28kvfi9nUP0AeHsPn+fxR7VT6ER6Y22Kf6G8VQWYX52GfFub53LsyyhiYCshE+xsMi86n5tFctU+LDVqhhgoopRaCKbsbxBsWSWUDhX/KOsWrKHkGHbtnSV6IJd+vOlVyRu8AT7GX3dnKtsxn35xcDnoNOElMnZOAtnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA0PR11MB7743.namprd11.prod.outlook.com (2603:10b6:208:401::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 18:55:08 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Thu, 26 Sep 2024
 18:55:08 +0000
Date: Thu, 26 Sep 2024 14:55:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
Subject: Re: [CI 00/12] Debug g2h timeout issue
Message-ID: <ZvWuCCBBJIFuQNFj@intel.com>
References: <20240920142922.618649-1-badal.nilawar@intel.com>
 <87bk0i8jol.fsf@intel.com>
 <d3db53f4-e061-4b4a-b90b-93687ad2fdfb@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d3db53f4-e061-4b4a-b90b-93687ad2fdfb@intel.com>
X-ClientProxiedBy: MW4P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::20) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA0PR11MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: 6453f5b6-0d03-4702-78fc-08dcde5cbdcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vf6qv3XZEwo3kX3tEOkpgEYD4lxSa+q5sMuXopvDcs8bLeX3ePiWqIi98L4Z?=
 =?us-ascii?Q?UNAor6164y5aVBZNx32r5W5FqHm7WFcIeusV71Xb3C5j08gVQrdYi6xNvcX3?=
 =?us-ascii?Q?GU9jRwfdFGDI4abkSyrp8pQuYunL1Nz5/DXDvRwWVRGc6POaeHTc4v8CyVSz?=
 =?us-ascii?Q?UczwGR+m2z6nG/AowHkWGi2WpccmGZ+DwDv+8s8IFndJIj021NDkk4emgj1O?=
 =?us-ascii?Q?vBaBWDx4WcZas5HxRNxjTl84k9UGe9oyXaorJlY38L6ptSdyN38HwER8PQlY?=
 =?us-ascii?Q?zfR557XOhwLI4I8VOz6484b2+ALaJMkOh77eqEqodofzeEQaSSkRtfehp1+w?=
 =?us-ascii?Q?bjmLNFpgGm+n3zu2yWu7UCIZ3sXjNe00+XTaJ8SNyozFqwiLIQVO9yH7cyh0?=
 =?us-ascii?Q?UgYPCkFkayCpdiWwDR5JXAcCQMAm0hpdfzGZjJf0smzrn4V+mWVsybX0ioGX?=
 =?us-ascii?Q?4T0sK1x+j7BiuJKw70iwD1vJtHhBWGLLyymxPPIfIPx9X7Wa6HAX5/yXVYcP?=
 =?us-ascii?Q?jyxbc/SC8aRlgpxR1Be8fBvsBOaT7KOC2OlSGyv8XVHxdUZk3jxmOR1A7d+b?=
 =?us-ascii?Q?92t1xOcurmb3Ou4/uSL6UzDD7v+96l6mgdXFLT8cjUu8GRDxnpfc7AMKISiF?=
 =?us-ascii?Q?vBhIq+SVJA5UztUtEXIe4Mj0ZFbg19DSp91CXHba8Q/wNk5+vNiNqOcFJRbA?=
 =?us-ascii?Q?WL3tx6UM47zBFeiSGh4vKUHxe0yz3M2RbaAMfJ9KLS+bsK/QcnWufKHzz4+Y?=
 =?us-ascii?Q?n/1DMUq309C10YvV2ABYvZBJyq3PH0E9nr/Pv9hbpykrRSF9uj4mqU0X/WZ4?=
 =?us-ascii?Q?hRyS4f4bNuIWYHZ1m3JdMErONYyTxuTrSxSBrnV36C+CpQ9J41rI5NNI9P/7?=
 =?us-ascii?Q?/eJMSpEEABUCiRUkYN11cJ2nOVwis6qtF4B9qf8lxVS88OxFJDD57ROdZMHw?=
 =?us-ascii?Q?oBH1+SDmz2Wa0K94nge0O1uH8NEyoMWNVObffki8UuP68R29E7EDAYU6ajAl?=
 =?us-ascii?Q?qMbX2VN7e5opJAC4tteGtVRLhqHzyOkHHVLeCsROzNeph0NTwbNYKS54wkhu?=
 =?us-ascii?Q?9vbQddjQ6HV2PRSJrwbOh6rLHl4PZFdxcNGDI1KVaTHqhZhn/299CxAkd30k?=
 =?us-ascii?Q?1uxz4gtIuLDpi8qvgQGzfSxlb3TDSGmOtPu3qSzzu5ucJcPKoWk3B4l5Uaeg?=
 =?us-ascii?Q?oUwU99SCUhWEQcwQMzn72GITEpxf4rk5rZnNElhuwKLgvsgs9fpN6LpW+dmc?=
 =?us-ascii?Q?5+6d4RedGizpzT/2zV/aYlfBK6YMT0eudIAimQbUCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nH3RQVVjbk6TfztLn3Ecy/o9yDpZuOBF1O9HwAxZ2QBt3o4vywTM73xDVvsq?=
 =?us-ascii?Q?27Y9Dqo1n7DRVCBWmhZmfev15klM04srJ96Vshfe4uYNkSBWaaPnK635UGSq?=
 =?us-ascii?Q?3n/rp0Di7HgXRqzETT1PtRAIf85yJTSvZxz7yhRpdeEKelrMLOlCah2Xcj/2?=
 =?us-ascii?Q?RsCdAHlRwbqBzSDcNlRapZYbkxrI7rtADkLkhxtNF5LoHZ5BZoaURFJbDwXi?=
 =?us-ascii?Q?B8R9HP5QuBIFm+lelAe53ABHGUCyxcGlpKWG7HZSjKfRKqIbDwB1lW7/Ija4?=
 =?us-ascii?Q?pdypP05DWUIOjvjgRsNIhuBPQH+An3aM19NAbW67ZkE7KoyWUI//nu1+fqfL?=
 =?us-ascii?Q?EKr37jaYtphhVmB+HpB0ARyRLrbSaahuOv2m+1Sg2mKreVx1kdjdCG5IMk9y?=
 =?us-ascii?Q?JOkGesLrfz0KcyNL/Kv5EdD70nAZxQWo146JifhDfwMUFylt1Du7IRngnl6m?=
 =?us-ascii?Q?3hxBe2Tf4rbpjqhalWmaPpIjpo5DMNwcRM2kXSNb4ob/+2csjOWHoqP/RCmD?=
 =?us-ascii?Q?9JDWKgwQ4Hblqv7UQWo+41EspO1q23RIJo5bkJMFdTfRJNG048CtL4HlQkUo?=
 =?us-ascii?Q?a5HpDGHxtoER6wbH5wsTYzABUtNb+Ki75K8gCsxs2t5i9KgDdqfJfOQsmMbK?=
 =?us-ascii?Q?s/FwGzcr4pS62ep+VOJ7yp54OX8D8zqDip3lPEvgor9VbpiJ81bVEJotPh1y?=
 =?us-ascii?Q?YWPtg8Lhz+bLwSvAKdlHcPgBQFlvYKTsGwEf0c+i7WAN6THFmNeWgUQOjFHz?=
 =?us-ascii?Q?q6mqT6TB0OmKy+7jhAr0OyT4AfXISi+SLGJGROoobkanwkQIT5JJJXAZfULY?=
 =?us-ascii?Q?dGj+GA5JMceLUEC3SgsaeXdBjYZXYY2xD3k/I/BTpreJtIM6h3H/Dh7LABZj?=
 =?us-ascii?Q?/w6WqlLhfMdEBqITBOF53YoXvPVjjVnUl1Nm4f4ft2NicGiXKOqs9K2Ovx17?=
 =?us-ascii?Q?mjZIq6LRYrHFjQrraOyYjpIG3eSD9f3lD5WPRu4n3BVQwqFFXNaJW1EyMBi/?=
 =?us-ascii?Q?jfs8tfkqyvELOd/P4ed6LKw26A1JaI6EWAnMNol3LOvHObZX49SSuErbL+U/?=
 =?us-ascii?Q?oYiTM0HlE/h00X0QHt2GyDRQZo/8qi3yNsaFAYmxgQkAPf1uVHtNh940NtCC?=
 =?us-ascii?Q?ZqwlCewX9g6F74yYsy9Tz3wDLkl+4V5Pvz9M9AsFUfMdogdG0ztBKjCGzW2h?=
 =?us-ascii?Q?M9zuPamRwVNS4ZXfr/6HQy6w/IS5BJ6krX6uy0Q3Ns52VTxCO0HCdPSXEmjU?=
 =?us-ascii?Q?LYA5KMCoVco6DkH2IlCvJkT1cVoU/+EW3xcdhlaKVl9lkPdrEVREGQnSGj7x?=
 =?us-ascii?Q?KfVvQleQbHueQFkWPF/Q+tp0XRchu7KwaEax0odP+T+yyo2a8TS2kGJVoaui?=
 =?us-ascii?Q?w/SIqsOHTbkVN6K4RKRkEKB8dttw3ZtIElMhmAqWQ+gRiHBd828+L4LBQFqZ?=
 =?us-ascii?Q?+yhb1gB8+eBrJz0+1qMOyfiaqDRJPz85wI3kfAUZS9OZodOC1+X/jFzRK7pi?=
 =?us-ascii?Q?DsyQKBtgybIFgoLzh6AIIfRSqkLBZZVE/qFxgbyY1lDxYjkT4Y4xTcjVErCC?=
 =?us-ascii?Q?l7xlmYbeR0iY2PpFT4oWJocpP8Ri2b9DNxB9zCoDXPQgP/9RQ3CAVUY59G1W?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6453f5b6-0d03-4702-78fc-08dcde5cbdcc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 18:55:08.7257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5aSl1doHEl3kBUX2XGnoqWyfar59pFmAHvoSwMFLgFZ1YUMEpipRsCfVQDCAJZ4Gbs5F0b6fURAiYcQqAQwPkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7743
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

On Mon, Sep 23, 2024 at 12:45:18PM -0700, John Harrison wrote:
> On 9/20/2024 07:48, Jani Nikula wrote:
> > On Fri, 20 Sep 2024, Badal Nilawar <badal.nilawar@intel.com> wrote:
> > > Do not review
> > Explanation would go here.
> > 
> > [CI] Usually means everything's reviewed, and this is just a resend for
> > CI. And there's no need to resend multiple times for that. Patchwork has
> > a "test again" button.
> > 
> > Finally, the patches are missing your Signed-off-by.
> > 
> > BR,
> > Jani.
> I think the intention here is to just get extra CI runs with more debug
> output to debug a failure that is only happening inside CI and cannot be
> reproduced locally. Although it is generally simpler/clearer to just squash
> the patches down into a single "Add extra debug for CI failures" patch
> rather than re-submitting an entire series.
> 
> Of course, the ideal would be to actually get all this extremely useful
> stuff merged and then it wouldn't need to be reposted over and over to get
> more CI results with it enabled.

yeap, the lack of try-bot in xe side. But yes, next time please squash them all...

> 
> John.
> 
> 
> > 
> > > John Harrison (10):
> > >    drm/xe/guc: Remove spurious line feed in debug print
> > >    drm/xe/devcoredump: Use drm_puts and already cached local variables
> > >    drm/xe/devcoredump: Improve section headings and add tile info
> > >    drm/xe/devcoredump: Add ASCII85 dump helper function
> > >    drm/xe/guc: Copy GuC log prior to dumping
> > >    drm/xe/guc: Use a two stage dump for GuC logs and add more info
> > >    drm/xe/guc: Dead CT helper
> > >    drm/xe/guc: Dump entire CTB on errors
> > >    drm/xe/guc: Add GuC log to devcoredump captures
> > >    drm/xe/guc: Add a helper function for dumping GuC log to dmesg
> > > 
> > > Michal Wajdeczko (1):
> > >    drm/print: Introduce drm_line_printer
> > > 
> > > bnilawar (1):
> > >    [For CI] Debug prints/logs to debug G2H timeout issue
> > > 
> > >   drivers/gpu/drm/drm_print.c                   |  14 +
> > >   .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
> > >   drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   1 +
> > >   drivers/gpu/drm/xe/xe_devcoredump.c           | 144 +++++-
> > >   drivers/gpu/drm/xe/xe_devcoredump.h           |   6 +
> > >   drivers/gpu/drm/xe/xe_devcoredump_types.h     |  13 +-
> > >   drivers/gpu/drm/xe/xe_device.c                |   1 +
> > >   drivers/gpu/drm/xe/xe_guc.c                   |   6 +-
> > >   drivers/gpu/drm/xe/xe_guc_ct.c                | 416 ++++++++++++++----
> > >   drivers/gpu/drm/xe/xe_guc_ct.h                |  10 +-
> > >   drivers/gpu/drm/xe/xe_guc_ct_types.h          |  29 +-
> > >   drivers/gpu/drm/xe/xe_guc_log.c               | 208 ++++++++-
> > >   drivers/gpu/drm/xe/xe_guc_log.h               |   5 +
> > >   drivers/gpu/drm/xe/xe_guc_log_types.h         |  27 ++
> > >   drivers/gpu/drm/xe/xe_guc_submit.c            |   2 +-
> > >   drivers/gpu/drm/xe/xe_hw_engine.c             |   1 -
> > >   include/drm/drm_print.h                       |  64 +++
> > >   17 files changed, 804 insertions(+), 144 deletions(-)
> 
