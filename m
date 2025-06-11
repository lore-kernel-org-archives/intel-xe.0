Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCA1C71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 23:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F3210E740;
	Wed, 11 Jun 2025 23:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOdSJIvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6582610E74A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 23:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749682956; x=1781218956;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6Bs6eX14DVOsioiFrQTG8+xL0+ajjI2NhlRgm/89tuo=;
 b=cOdSJIvA3dmf5qxcsvJ59Lf1EklTq9nwAYisn+eGPd84XavP3fZ6hqLn
 O5Qzku+NmHaBg3fg38YkYeQJAmXyWt/u1dAVRbz0skX02UdNfuSy3uQ8c
 pfTnp1Sq5hv242+xEAy5+g+WJ7asS/A0v3pdy65sYh+etwX9fUP23g3Go
 r4FL7g2ZQNW84Qe1UWiqjLDFgdOZ4CvorIQo5Ai1DNQvi/x2RtKs5RpTW
 ofvtqg0og3GlzDaatPLXh+UiSX8uU5Gxexq+vRD5kJ8qXiF+lRmaGsASi
 kvPTUlO7yifW6hRbn5PHq3WBFfYu9ImXWefST/Fei1+lAE8zJlVrZMkN7 A==;
X-CSE-ConnectionGUID: apHpyLUlTP+MEAjQgZQ2XA==
X-CSE-MsgGUID: brILJVI1RSmI++Xq/b/rWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55641245"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="55641245"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 16:02:36 -0700
X-CSE-ConnectionGUID: WPefP9nRSDOOGBdF3xNLdw==
X-CSE-MsgGUID: nUIxXjK5TGKbbOKLTYV7og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="170505770"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 16:02:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 16:02:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 16:02:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 16:02:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/XRe9zabzp4Vl9C5JD2ZPyPzdrRfU4lK/tSfroHg2HjDSGf0nqRwd+HMc0jsG75P2e6SJerewVOS8/3CyPkx4zZrMDuhBgd8ZqocTC8CgLkn2RewhAQWitj2U3CwxwBRGe4YaEzdL+l9QGnOkR1fi7rhquIdNDym9pmcW3VRs8p4AuLW8PIkmuFN2rSKWOUcMmdqwxe6SDgowx6TLjYwH56143a8vHWoNRKcvLsB8s5fSTXNFE2uOAgv08kSnTQG/Gq2f3ctFBOg932TPmaVFrkFbsFQkQnpzVW1x+G17QzxLrNK44LKVmnKDttTAUE40sRYOTybH2HU7DZPcy3dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YUF3+vrLnppWCfc8tYo57uWn8wQva2TRA5dJZxSCXs=;
 b=Gm/9q+KpKZp1rEBsgmWn1N2ePapo2skiowIvgRaeCbbRVCyB25yr2VwGmM14rbXxfG6pX+GJSSXDPkhkvQ+LRSyEe+4b65Fcb7dpc1gLQXqLe3B9tQvsJwU1VIyHrohZv3QDC5xLHggLJnHcSqLmBvNLFSu8mdaxHDgIi/J8sKtbCv4AhgN9yiwmtw30G3TXqx262wAkj1cF1u7LM14Ty3pPDJHjjzGkI+RYJZQVhkez0FWwJ4q/kqHkw+wKF40uBMjDJ8gYG5YemNIgFSwkkDZIcBYSBPARtZvTEIvXdABZFuIeEbMZBCrKkvnwmyGwXEdSmD/ZwPnyJAFiOXLEGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6148.namprd11.prod.outlook.com (2603:10b6:208:3ec::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 23:02:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 23:02:13 +0000
Date: Wed, 11 Jun 2025 18:02:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Message-ID: <ckmq3cgq4onko4ls37uklvqd2gdzkj7noj36qiie23a77zem5d@xpxeo37h2s7f>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-2-vinay.belgaumkar@intel.com>
 <85316ce01b40c0cf8775833c29c4843bbf281315.camel@intel.com>
 <83ec77ee-1aed-4926-866b-e1a6301109e2@intel.com>
 <8afdac13617376dd5c9151e832921b5993443243.camel@intel.com>
 <5f834906-e62e-4a61-8dbc-7bed51904548@intel.com>
 <7094d8f3f850baed86783365bfbf5ffb84663edf.camel@intel.com>
 <c2dg4jybyfkmxgwpydvchso5bdpv46gpqat7zcjdrwcrjwjx7x@zxdu4py4iyki>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2dg4jybyfkmxgwpydvchso5bdpv46gpqat7zcjdrwcrjwjx7x@zxdu4py4iyki>
X-ClientProxiedBy: SJ0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 099c9f83-b07b-4dac-46d6-08dda93c00bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9CK+Nmx0vRsvdkKrPjUFGQW/N11U191GzM7fUp0A8F67Qfty7u4MwHY0dg?=
 =?iso-8859-1?Q?CpfA3/qq5YAVLJl4/LTZ/lWUb8/ypDJqEJHAuKy66Gutbc4si9KrpKWvMH?=
 =?iso-8859-1?Q?B4pdbFBuWNKq3c5+rzOizllH6sMVLA2mGhLKLCvyW6TUfqWwI0rmArDryV?=
 =?iso-8859-1?Q?kDSjE//rfw3AC+R4MNpTUGi4qsNR8x8neU5TyuVgq7I8Ovbey3uVyzOrhp?=
 =?iso-8859-1?Q?ulQ2Cx659toaO/rhW04N1nooK3sfY190ILIngeZ/QGjPpYmn/YBy1xfurm?=
 =?iso-8859-1?Q?BO0w3LLg90N/4HmtuOcJYjScG/sLsDZ1E3tIJf9UT4bHFupQCJmrxATsCJ?=
 =?iso-8859-1?Q?m46Ft4nt4N4JmLcd6CuTyirSbZllO9/up21xp0SH7RsVdKlzFEtJ7Zn0kO?=
 =?iso-8859-1?Q?r5ydfnTze0DctPglONelvwNJYWlIWH1srnGUNW2pJ9WIVyE+pMclYOxJKv?=
 =?iso-8859-1?Q?RP/sVgqP26KE7E8fmAOxmeQUyNxi9gzXoYtTkOygwLIBZ9eg40tqUCsaBv?=
 =?iso-8859-1?Q?7Q4VFfTqWQDTD/3uvThuM3X/rD7DIWNo28sLhn1xprypyoccVuFhZKGluE?=
 =?iso-8859-1?Q?bavSCiw1/oReh+Vwv/8Uhto3/dnq9SpXtj4HymL8q2nK8y6Sx6KTh5HkeE?=
 =?iso-8859-1?Q?Gu61tC4odeFqCvQlj0da1qmDGTQK8b1AQnNqxhb6srwvLdB8FIRlR+Iwsk?=
 =?iso-8859-1?Q?tBAp8jy56vxowEHMwLtbUd4hTOP/pBDo7pxjE/ODtBq6nMjc4grJnb6EJX?=
 =?iso-8859-1?Q?s5QKPyShei1UrIHMaRP6YZfdZRVsCPlhsXC67KpU+eL4HqzvqZ15sIP++e?=
 =?iso-8859-1?Q?wYrtKD+ciVdX8OjAft49ILzPn2aR2iGrs/Y7VcMsqsHF0Mi/MLgNzn01t5?=
 =?iso-8859-1?Q?/V948z2EmzHCrz/AbWpwXeCkJuG0z5WEtVag0akj38ucXq9+4DSazp6uYM?=
 =?iso-8859-1?Q?eIMzvb88SO+zLSNExNtpNXAleu+fl+7G91hwERc656v9RqzrC83EPWCYUW?=
 =?iso-8859-1?Q?7Y1ugyNOxhjT9nyvVGylwizPiUs0VfIdK8WnE1UoJ5kWKFoLhJ6Zdxa9jG?=
 =?iso-8859-1?Q?PHp9DQ70KXjV8ofAEwiALHjgjr9D54mjpNwbd2Qnf1uRaf8ge2JI4yBAu8?=
 =?iso-8859-1?Q?gnUa+XCpVxNUxg+E2mK3U4gRtuaK9cLX+GclAhnm4mUhop7wpaGC8End5i?=
 =?iso-8859-1?Q?hCgYeiYd0SEnMSLfzFXe7fbZ/rC7ZZ1+oOk6gORlyqr1vSKv42BiNBD8fB?=
 =?iso-8859-1?Q?uU8ifxBuPgxewLYWlTPaAq1fCnca4tYWXXYAHNlLdhitphLKQa5sky3e3t?=
 =?iso-8859-1?Q?t/yrFLciBzENU4e49KI0MZtaj9FjvkOgiJJMr9mDGLYVobjtXbtBgq0yiU?=
 =?iso-8859-1?Q?hLVg5IwE58sJTOIrCt/b7451NmOInZnGwu3v5MrAHgBq8SHKxeGy+fXqNF?=
 =?iso-8859-1?Q?RWwNAF1ScD/Sm3EOJxjDeczZHc6uq6oBKy/3GN8pwwbZ2eBJRtJl3dvatp?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DsS/tz5cyOVdv3upmWKHs2RlTgji4oul6GVwH+Cet1S/4IkmDTJMfqx+X+?=
 =?iso-8859-1?Q?JWtSH5ULOuCAtcXEOfGx8oknSrWVgN89pPQXbllqlP8ORXXag80vknWecs?=
 =?iso-8859-1?Q?7/F9/VJ2Jb43Wpw8Bdsp6aM5JXjRV69ChxqqNWA2fS4S8trZnwfQTamC0w?=
 =?iso-8859-1?Q?Z+5dRV7ogEwRJr4tbiRPXbd5ht4zT73+1YHwo23nHt3ZvkoFXma7ffwjAt?=
 =?iso-8859-1?Q?29W5XFAJ9LuIR+J0PqhO8/x0E9fODkI7QaBoWejIySfFg68T7vLmubsZNW?=
 =?iso-8859-1?Q?JFGO/7hoToEVtOMst1dnKKvdRDy8y1vQXI8R9xLH0CxJ1fgqwdkl1nbgHn?=
 =?iso-8859-1?Q?NDjplFw71bxFIr482WPU9XFORGaSLQ4dpDDOLJZVbrbS0c1PpOpEKjYgtf?=
 =?iso-8859-1?Q?z1PWWUVHujyJFfGUsESWPk6qtCSvj7O5S9N0fkdgnNkcB9e67euvZMscdI?=
 =?iso-8859-1?Q?U0Ob1zQW+TgXkHtrNXPquKvx8MAl6QtAOs+9SP39NPQJC9xAgOy5AAWCQf?=
 =?iso-8859-1?Q?DP1iWHeRyPnq0jJbhvOCCEx3yu95JrLnTZTqOwABzwN5Vd4TtGoV1ziSNb?=
 =?iso-8859-1?Q?GW99e2hXi9H8cf7DJXFGYhlBIU/C7LHjuvT5jWtHvgCIglzgff0xxyt+kx?=
 =?iso-8859-1?Q?Sti8f6YnlQLYcP6B3HzaKcQ/ehfc6WQORuPpJ9flPQ3IhQrtj6JWR0MRuT?=
 =?iso-8859-1?Q?6BcdGUdrY0k4/SqMRIaeuL1eZcfc5e2uJ499NOUBqJVPV1iLT10RQCa22Z?=
 =?iso-8859-1?Q?Si2m/oSGWGyJh4I4g69CPsU1h1Ux/ADYgutciJPBC95XmU7HoidwyapozL?=
 =?iso-8859-1?Q?MJwWgp7ziIu6PLl8NYbiz8QDMZj/Ha5GYpXmu0DjLstIuC1/WmOSueCLlT?=
 =?iso-8859-1?Q?g9Sl0k2KU9PMdkRXTBGcv8W8l2ERrWL5dhzdhtYY5QznAQAtnsbusKVt4Q?=
 =?iso-8859-1?Q?EljZDJR1RIYsWvBGOWdR15AVYTRKFfky0qfwMZOsMKj7RO1T25FWLfaf+r?=
 =?iso-8859-1?Q?YSc+Gv6q66kguHOzYM6Yp8Bn4WXWTvu7AHzli5b+MoIXyY/MerpTyEQesJ?=
 =?iso-8859-1?Q?CfOcRjlukqK75MN2MmXkXUXudR+YnEUF5ZZ/Ep9SYIq19d8ix63wlK7n3k?=
 =?iso-8859-1?Q?KLK8kdgjIRdCdkCnBAoR8x37QUdKCnmprGy4TvKnEbEfS4DhcNq4ucOJZ4?=
 =?iso-8859-1?Q?R5w6xS87xZ84s8RcHJQCvqDOyfrleBfFOUW+kDZE6JruDAVQOSGBbFzurn?=
 =?iso-8859-1?Q?O2L91/y6v+bTPrgAXVIZ9PODXTBI+W1GxwRdNGTS1dLVFyYY9wlXnu38Rx?=
 =?iso-8859-1?Q?Vs5BQQy2znTmo1aj7qjSd5t6uCdv7LjBOxsS9wxzVPYdrTEWlUAHNs8yqY?=
 =?iso-8859-1?Q?Uluu3o5e/R223RpZX+tSPj45khUa5vD84+pFk4Vw2QHp+Hzmej73Qu08q5?=
 =?iso-8859-1?Q?q7iALVJkcVvVY+P8ibV5PH+5MWZZc8+yFKJgqe9d3GPcrmwas3XGppubKG?=
 =?iso-8859-1?Q?98uRq+u2BQCppduMXglzfwqDFqVqg6u7sef//S5J53Su5e+O00yxPCVSXJ?=
 =?iso-8859-1?Q?O3/VzrpZoUanbXJYt0T12ieIdVlt6vSVTsWLy855rL9t4G2P+qJH0fmRDS?=
 =?iso-8859-1?Q?gj4Fyx7A2zvHBTKWG/zKmqXBFVFf9mR6mlEZFe0p6POd8rMyG+PAszfA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 099c9f83-b07b-4dac-46d6-08dda93c00bc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 23:02:13.3949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kT36Ij95z79QvpvBH0D3vCgj171MJuRR+JsLe1cBx9EMKbQekUNbhEYG6bmR8MXQDtpHzFQusJiPlZYA7EWokmCaP2//812OlXgN9+lICHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6148
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

On Fri, Jun 06, 2025 at 07:09:39PM -0500, Lucas De Marchi wrote:
>On Wed, Jun 04, 2025 at 12:06:52AM +0000, Stuart Summers wrote:
>>On Tue, 2025-06-03 at 13:31 -0700, Belgaumkar, Vinay wrote:
>>>
>>>On 6/3/2025 12:31 PM, Summers, Stuart wrote:
>>>> On Tue, 2025-06-03 at 11:41 -0700, Belgaumkar, Vinay wrote:
>>>> > On 6/3/2025 10:36 AM, Summers, Stuart wrote:
>>>> > > On Mon, 2025-06-02 at 16:44 -0700, Vinay Belgaumkar wrote:
>>>> > > > Set GT min frequency to 1200Mhz once driver load is
>>>> > > > complete.
>>>> > > >
>>>> > > > v2: Review comments (Rodrigo)
>>>> > > > v3: Apply Wa earlier so user_req_min is not clobbered.
>>>> > > >
>>>> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> > > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> > > > ---
>>>> > > >    drivers/gpu/drm/xe/xe_guc_pc.c     | 5 +++++
>>>> > > >    drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>>>> > > >    2 files changed, 6 insertions(+)
>>>> > > >
>>>> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> > > > b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> > > > index 18c623992035..cb0563494fcc 100644
>>>> > > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> > > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> > > > @@ -51,6 +51,7 @@
>>>> > > >   
>>>> > > >    #define LNL_MERT_FREQ_CAP      800
>>>> > > >    #define BMG_MERT_FREQ_CAP      2133
>>>> > > > +#define BMG_MIN_FREQ           1200
>>>> > > >   
>>>> > > >    #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no
>>>> > > > need for
>>>> > > > precision */
>>>> > > >    #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used
>>>> > > > only
>>>> > > > at
>>>> > > > pc_start */
>>>> > > > @@ -843,6 +844,9 @@ static int pc_adjust_freq_bounds(struct
>>>> > > > xe_guc_pc
>>>> > > > *pc)
>>>> > > >           if (pc_get_min_freq(pc) > pc->rp0_freq)
>>>> > > >                   ret = pc_set_min_freq(pc, pc->rp0_freq);
>>>> > > >   
>>>> > > > +       if (XE_WA(pc_to_gt(pc), 14022085890))
>>>> > > > +               ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ,
>>>> > > > pc_get_min_freq(pc)));
>>>> > > Do we want this above the get_min_freq() call above? Seems like
>>>> > > that
>>>> > > would further limit which is what we'd want in that case right?
>>>> > No, this is during SLPC init, we don't need to read the min freq
>>>> > at
>>>> > this
>>>> > point. We will adjust it later in the flow if there was a user
>>>> > request.
>>>
>>>This ensures min frequency is set to 1200. That is required by the
>>>WA.
>>>If there was no previous user request (like before a GT reset), the
>>>min
>>>will be set to 1200 instead of the usual RPe (which is around 500).
>>
>>Ok makes sense to me. I did confirm the workaround frequency called out
>>in bspec matches here:
>>Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>
>but why do we do 2 rmw instead of 1? Something like this
>
>	u32 min_freq;
>	...
>
>	/*
>	 * Same thing happens for Server platforms where min is listed as
>	 * RPMax
>	 */
>	min_freq = min(pc_get_min_freq(pc), pc->rp0_freq);
>
>	/* But shouldn't go to less than BMG_MIN_FREQ on affected platforms */
>	if (XE_WA(pc_to_gt(pc), 14022085890))
>		min_freq = max(BMG_MIN_FREQ, min_freq);
>
>	ret = pc_set_min_freq(pc, min_freq);

humn... but that would mean we would always have a call to
pc_set_min_freq(), even if not needed, i.e.
pc_get_min_freq() <= pc->rp0_freq and for platforms affected by
14022085890, pc_get_min_freq() >= BMG_MIN_FREQ.

still trying to figure out one thing though: in BMG this will apply only
to the main gt. media gt will not set it and since pc is per gt, it's
not the correct thing to do.

Matt Roper, what about add the diff below?  Untested, will do later
today.

| diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
| index 3861e947387fd..04e112c751096 100644
| --- a/drivers/gpu/drm/xe/xe_guc_pc.c
| +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
| @@ -818,6 +818,7 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
|  
|  static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
|  {
| +       struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
|         int ret;
|  
|         lockdep_assert_held(&pc->freq_lock);
| @@ -844,7 +845,7 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
|         if (pc_get_min_freq(pc) > pc->rp0_freq)
|                 ret = pc_set_min_freq(pc, pc->rp0_freq);
|  
| -       if (XE_WA(pc_to_gt(pc), 14022085890))
| +       if (XE_WA(tile->primary_gt, 14022085890))
|                 ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_freq(pc)));
|  
|  out:
| diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
| index bda025ab900da..38b589fe9198d 100644
| --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
| +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
| @@ -59,4 +59,7 @@ no_media_l3   MEDIA_VERSION(3000)
|                 MEDIA_VERSION_RANGE(1301, 3000)
|  16026508708    GRAPHICS_VERSION_RANGE(1200, 3001)
|                 MEDIA_VERSION_RANGE(1300, 3000)
| +
| +# SoC workaround - should apply to all platforms using this
| +# graphics version in tile->primary_gt
|  14022085890    GRAPHICS_VERSION(2001)

Lucas De Marchi
