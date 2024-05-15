Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB9DC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 03:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCAB10E04A;
	Wed, 15 May 2024 03:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ArxheGka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8B010E04A
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 03:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715743854; x=1747279854;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AM9ZfL9AMuf4vJEazPoftECRKlPvcrnOmKGqd3CSaaw=;
 b=ArxheGkaNKFG94yPavsLbbt/jDhngAA6rieDv9IcuH+8Dzn7BoOonrSV
 9mGoMmg96lYby87DJDcUti65UgFs9Qp03PgoV6mWIUQ5o2LZnIKOw/fY7
 Pyql87Qji9pjBZ1XQKAgd7pCp/908uDYZ8oZXqEk5F/XvfDpx+Ydkryn9
 o7JiysXZXhNNnVj+bAVnL+gxtwnDYSWum0dfuak58n2ujEXQ6vs2EkEgD
 MjfYy7Nqp9SZEc7Qwhd4MSUJJ7fse6cw2y5nid6zFTMUUU3fIaDeENe+u
 UES27fRsamzdI8F0S0D5cgvcg6YpbJhgCUXov3Y+rH9XqY4BBWQTLISb0 g==;
X-CSE-ConnectionGUID: 6cVZkpUiTGOcCGdAaL3X/w==
X-CSE-MsgGUID: PeeJtCl+QhWxUmtdCSySxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="29258336"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="29258336"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 20:30:54 -0700
X-CSE-ConnectionGUID: +CqJHgRsRBukmVNr/p49mw==
X-CSE-MsgGUID: qTF78we4Qd6lI7Z1WN5BfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="31485387"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 20:30:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 20:30:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 20:30:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 20:30:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0CiPLPxfIqdrPazZwYTH38KVfgbK4dk7hsz9g9E/RTQ+Ed6cOALsiaC8NbBhtKEZeVfPKlW0lbvgE/cfSpt51lqrAJxVRF8zH++K5vloLb5DeN9mmhPdZLMn8QBz7bKoZxKhU11bH7E9gKF/E3r3sSp+UMhZiMxndijC51+zoDJUqBLuXx56MyMNOIbabnMa0mj4reDj6wVO22qD0prHVwr4Ct7ZLCS/2GZ7AQhdt9h4YPfw+d0OTiMhZrPTal3IVYkv6UafrD54NPPRQEAD78kEzVcowUSixDewqtWMVt7L441esv5yMFFLlS3sqFI0AF8bLGiBeZoaXZ/ZY3B7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vp+zc3fYrSpwxYAaFC7/1aej/A4c2IpxmoqqgCV4jWM=;
 b=m+b0jncEFvxv0fZQPB6jW3HZG21tTFGrzyPcoiDfYov16J0mfFd3qVBR2H9gVjoyd9c/Z3jb30SXIyBS8H7BoWfRZuDQvtHT6RzzM4cXwvLkzlGbs99dEhixokCelCkFW0rzol/UeVIhkrhSK5uRVIN/BRVZalGL4/5xamJXOfNXsPUm4mpinT/fKzP6fjODYuvcExM37X0N+ylqbtf3ye/BAuDtGHpKTHO9OyMk06ayvtpvsYqqAg1uN0/0+wy0/lzaIFAVdSNIp95Kxs/4lOD5Y1JL7a4IsMht5gMWlUfZ9oD96qbxLopooN7/TJJkh/WLfXZbBzULgX69KTdwKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM3PR11MB8736.namprd11.prod.outlook.com (2603:10b6:0:47::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.55; Wed, 15 May 2024 03:30:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 03:30:50 +0000
Date: Tue, 14 May 2024 20:30:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH V2 2/2] drm/xe/xe2lpm: Add permanent wa_14020756599
Message-ID: <20240515033047.GA2343622@mdroper-desk1.amr.corp.intel.com>
References: <20240430075609.2216291-1-tejas.upadhyay@intel.com>
 <20240430075609.2216291-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240430075609.2216291-3-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM3PR11MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f3f2d12-39ea-4c60-1b97-08dc748f6aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?icpq48VrksQpVbaV/CtrevRw2SJ4bLpv0ScJgbvrETUh6LEI/jBKyz9Tyc+2?=
 =?us-ascii?Q?zElH1iQPL700IGmXfC9Jyzlbo8/4wa5AOJowgvE70lxApISfgxt6vZaet+K8?=
 =?us-ascii?Q?6ZNlxkIBqN+mkAZUJBUBsbb+isrGa1LYTUaKQ6wqWvHFKCxZRnHjsm1ABFfk?=
 =?us-ascii?Q?P3acJ6TKpsDiJ1XFvR1yUZQjv8XjPHRvN8Nez56/xVuCBiB9y0qHmvA7YJmU?=
 =?us-ascii?Q?i9xkJNF6+IIUvQl/a66p3EcbiKpRLuttC0FChUYrIACOMLxKVaE1wYBZVoAY?=
 =?us-ascii?Q?vPT6MvQgECSv5Umg5BpoVsgwcNGF2BoaCsZ1wQx1AQwfXbbHjbmaZk5sPM1o?=
 =?us-ascii?Q?rWxcAlwT+t/Nqw3q3/piRxi3DiOv/nR7Y4GX38bBBSzQw2svwE9ciC3IBoMe?=
 =?us-ascii?Q?eS4BjuI5+NCQyoXNSN/zFCfLLl7uVMSqSq1KQIR+AdbRifLXZzmgTAZKHQCl?=
 =?us-ascii?Q?7JDfkWtyd7uGurUca0tEnYJewWdnegv2tLKwLMYmbbGUGT/TCAFZkatm1ozQ?=
 =?us-ascii?Q?MTxgWyI3+jS3CcpjkgulbsZdCZ2baH0kTIEvYMJNQNwnZh10PN00B9xadppT?=
 =?us-ascii?Q?vvNVfgT07RuwoNHKoXufxEurNUI8EEi+Hh6S7FxkOtRsjYmklXKsMD/Clbsc?=
 =?us-ascii?Q?Blt1tcf9h9xDQwQJZ+arFmaknY79MpWkLakrBIwK8xFRD8UvHou/gh/jsnYQ?=
 =?us-ascii?Q?wXORjM9CnFQtZ0TFQy+3xp2J0TQLX0+gi7X111pYDhZMfuu4CDKQrvwFJIV1?=
 =?us-ascii?Q?YwcAoD6Wpsq2x9KCxxUJaQVMsG/yxbOUwygn0g3WNLPUfQ0/L2+ULDXRRI3X?=
 =?us-ascii?Q?HvfL3sn9qJ7PlKrJ/U6OcIfGzQzjRk1DA7JJkhdkLawILsC+M4Ifqczj3/GY?=
 =?us-ascii?Q?5oTAYxYrK//wQAvQMcR7MQgKRDd9swtK6MGqCo3FN916RCcHEIl7FKuHp8/f?=
 =?us-ascii?Q?Tl5hb8OZxvA1C6QUeV6sg2uk+lBcZHy/1cksG7I9aCeopDI1NWk73zO3HDAj?=
 =?us-ascii?Q?vD+kdmWMNDSYUbEuS0QRLX2ioXVizvel+PIprUtKaKTDpusReK1qdsvWKDkX?=
 =?us-ascii?Q?QMq9AgzgFj5KPpSY3rrYK1suKDsWS0HgNTwi5/5Rxjpzb1jC6nbOUIQNxIxQ?=
 =?us-ascii?Q?MbNGyPm8Al+ZyqrsKV4XMjq6/WNpu0aj313qUlp82Gxm17wBSYkrnBG8NYDT?=
 =?us-ascii?Q?MJvHELS7sK0w+/C9GSEu9zWB/fM2kpb694vEiG3hQvAiP85lS6biggNSvXAl?=
 =?us-ascii?Q?CAgYkfyCRkxf1rHsh7dxqDbIj8uThqu1fmTt/79tkg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5D6VGyCHl/mkQOypoxCg1Cjm7+QQPUZ+Rfv2eLeR2uqov2iuPfUYEXNELyuo?=
 =?us-ascii?Q?x3Q0hyrtoRAEpYvGJSP+XWhXFmjWJwKIA2Or1zkOVKzg2CkZetVo8h0nWueN?=
 =?us-ascii?Q?pjUQAnAjBeS7niPFhQ4b6reVOHEgT5pYpnvFgVXN4mwc2bHVZdt7oyaHiurC?=
 =?us-ascii?Q?TR68IPnmTiiUbOotBtjaJt6MDxOz0IUrt4IMoRJkUSLcvfq2AWVjZcmcBXQv?=
 =?us-ascii?Q?wVjXUyXjfHADlnf4DwAx1StXE4UcQM0w1bbz+6P8CoOZxmvZ54JTLSEVNP+k?=
 =?us-ascii?Q?eMIaYjqSpXlOEo9HaKg5GhmlX4+sg8EwQygBN7znNGMM121kdW4I8IAucLPU?=
 =?us-ascii?Q?7Y09RGRsfDzoKSfax8Lm0kDtVYRGASY4SHRtfUfQURPvyNzEBJXVmyfJUW2N?=
 =?us-ascii?Q?fPqIDB4Al9uF2/RHdbSaBoySz1pYsvUo1Ml9Z4qVGx3/AGymDMaIS52lB8ca?=
 =?us-ascii?Q?3OQlNs/qnFUKXlcAKkieOXNTLhAIjyelSmD+UoCp5q6Q6P0aSAOzZh0Kg5gQ?=
 =?us-ascii?Q?A3MquIt7zKelsldTkOZmQLag26Ul630R6XxXAGgKRZ8NkK0rLiS3MrL5rljl?=
 =?us-ascii?Q?2YXLBrkm63NkxVaGLTtZFhkM2nA1336OEvS2k9nmBOXScX6ZSXZUQBPTZmg/?=
 =?us-ascii?Q?Zt54pyPldA3DXkyxVmcTbKd6kcW7dpz9UycKqn/c58Herm/fL515YkE2TGQF?=
 =?us-ascii?Q?i88hPC5/sKWDuZBgefFJOAf0q028ZjS30Q5MRd2+iIbyPhk88RjnorQnY9K8?=
 =?us-ascii?Q?sNexKOu6ao6sxdZ4wwERPiYX4LVwlra5BCvH3Osf2NtjkkDefnrSm9S76o4a?=
 =?us-ascii?Q?QhM1Z7KR4Tl7LM+9UT9H1Zre475Xwm0+tFu7K8x10dl8zYcX3QTN2FVkS1QU?=
 =?us-ascii?Q?SXp0B9vem78PMPYfH0NvuQH5AHYvbazswE4De5NfhM5L3oJotKptCGprQ15I?=
 =?us-ascii?Q?XTx/O9yBOEQbgpdPX+UO+YzmXH31TCdilELpOb3GaIvbVPz2QkDVZPmOH6XL?=
 =?us-ascii?Q?TuPzXG/P6hA4STJiP4ksRECEpQ6XFdE/nB6zC4GIpt92GuVBTzm7awvtGxF9?=
 =?us-ascii?Q?alDszMekrPWS1GeRo4HFIwf3qIZKgtfdyY7qSr1YhfxmVXwtvaAb/g5+Q3XE?=
 =?us-ascii?Q?adqZkEtDi21owyc6130p0wInvR750oWpp6vpczG/dmAfpLuaPpAkPirY2Pj1?=
 =?us-ascii?Q?fJeEW+5gZtOlcg9H11vzOvfRW4ZmTKZmkkIIVohJxJ1Qey39xxOmXRojCp8M?=
 =?us-ascii?Q?ywrmrzFmBRgYXyea0+00BBBwvRy+BY4mpxwL1n4BQWcI/9U8M4uBRYJz7s+R?=
 =?us-ascii?Q?UHRnDP8ns+dJ+jZL2MZYqDcZyTG0LHMRKvcGuE7pGuH/O0Fy031dNP6GSBsP?=
 =?us-ascii?Q?TCMfIVyUd7xy+6nIl/UMXmB4jiNEZXojGVcjGJ7IbK++P0YogzqQzC6bzd7J?=
 =?us-ascii?Q?RP7DofZg7bnmCCkTQk1REH8QRt5sxB5wVh5WpPD16EU+042AHHHmEBlx8RyT?=
 =?us-ascii?Q?BZiDl2V7QeE/s7k3fOXgC39PrNK7r/TGJ+aDW/L5/vCACrFJtQdZUkMbMHxJ?=
 =?us-ascii?Q?Zl19oAK9ypcUhVE4KGNkuLFk9TGQqMzb53dmUSsHNmW0lPhAIYs9tBeTONU7?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3f2d12-39ea-4c60-1b97-08dc748f6aec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 03:30:50.4015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2J0hI3JjdkJN7w2wnrPysf3+hvrc45pyB3OvR8fZ+v9tPp9K16do0PXhmq3ymI9fT42cNPOwoZxDfUoNtQ9zIsHQuvPooQMSLNPiu2cF3sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8736
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

On Tue, Apr 30, 2024 at 01:26:09PM +0530, Tejas Upadhyay wrote:
> For xe2_lpm Wa_14020756599 is applied to
> all steppings.
> 
> V2:
>   - Remove engine filter video decode
>   - Fix typo GRAPHICS/MEDIA/s - Himal
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 7657aadf217c..76f7a7e3ee61 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -701,6 +701,12 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  			     DIS_AUTOSTRIP))
>  	},
>  
> +	/* Xe2_LPM */
> +	{ XE_RTP_NAME("14020756599"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000)),

Even though this workaround needs to be applied on any platform with
media version 20.00 (regardless of the primary GT's version), there's
still only a single copy of this register and it resides within the
primary GT as part of the render engine's LRC (bspec 65182).  This is a
pretty unusual case (turning off something in a different hardware unit
than what the workaround is marked against) and we might need to do
something special for this workaround since we need to emit this
workaround specifically as part of the RCS engine's LRC (you don't have
an engine filter here, so it's going to try to put it in every engine's
LRC), and the use of MEDIA_VERSION also implicitly makes our RTP
framework use the media GT to apply it rather than the primary GT.
Since this register is within the GSI range, applying the workaround
through the media GT will make it try to write to offset
(0x380000+0x5588) which won't do what we want.

For now the only platforms that have media 20.00 also have primary GT
versions that match the Xe2_LPG version number, so we could probably get
away with just putting a comment in the table saying that we're not
adding the Xe2_LPM entry for now since the Xe2_LPG entry already covers
the necessary programming.  But if they ever pair media 20.00 with some
other primary GT version that doesn't need this workaround, we may have
to think about adding more flags to RTP to deal with this kind of
situation.


Matt

> +	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
> +	},
> +
>  	{}
>  };
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
