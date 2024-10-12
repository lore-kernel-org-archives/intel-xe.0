Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DA1D1A431
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 04:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B8710E165;
	Sat, 12 Oct 2024 04:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PaNYMV9S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD0B10E165
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Oct 2024 04:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728708234; x=1760244234;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zqHiZTWfeAV90j4uQkGje0wdsmFXjxjllm1a2ftwgUo=;
 b=PaNYMV9SELCsYrRoUigDwRSeP5Ng4yC/pUfRmhkhsKYlNNKSK5cR8M3p
 zOG5G2SLLeZEpeZFMXAy0ylcYrjrfUV9V893eNW6C2sO/236vgzssXqDx
 /ZLWoLmmHotQUdNNqRL3/qqaFVPgi12B/ixpp8iKXEC25Zqx9+r7sjUrS
 1y/+tGQV1/jkBQfCIteEWCFIBRDrw3AcOWmBceKY0WSlSDv/RgY12uM0H
 J0qejOvB2+2BfypIex0o14A4V/FVvpGrTSpeHL1gjD7Dy0MCsoTm5Mpjn
 DjpmboBxpb02FObcJPB5DPT5CJuWHvhLH9Y5IgLe4xWk1fO2zDToNoJg3 A==;
X-CSE-ConnectionGUID: tL0bPBz2SzeQyh2tS0+/dw==
X-CSE-MsgGUID: ntvYCLU1SbO6JX5r1lRz0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32027108"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="32027108"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 21:43:54 -0700
X-CSE-ConnectionGUID: wbA1Vh8HQoGzotp7kG1m9g==
X-CSE-MsgGUID: 16PdGYn1RPK+clnH/tceqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="81094433"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 21:43:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 21:43:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 21:43:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 21:43:53 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 21:43:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nflahKNNWmglVaILWVzkiSWD2FPM64czGdW6YjSQP6C3X+QJAKMB3W0VZTLVL5WThd00ZSmXC8Yp6JKZGJQlxEv8U1GHJyTCjb+wWzMER3Gf0WGsZszgS3YpSCnaMaT097eHf5T0qua1ivNrIEgkT16n2motkLHo+DL9do6UTrmSIJtweBC76h+Agu8mJWSP/ed8qNqa2NbCdMS/ALkX+theciVpliFvKdAGMJ7d3WlTEKK2qaEd62Z6XncuTslEJkJcc6D0ObxoudOg+KFFF9sjWWV6mFWADhdPZbN6w9alJVE+sj8DJ1aNwdhUXo2a0zJBPkyLeygMn1aBUTCcjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxxPVje6+IwdHS8jbjo64bbjvVyT7Kl6cqP/Lr+8ATc=;
 b=twxjqKyZKwo4FCotqVvgLvOfjLVPLC+Nr4yr4LW58vM124S1lGeercri9kPvZftBe+otGaqeLMOoXTzBDuHh+6FX36PmBtVNmhRheGTqxj6g6PPionh53ImDujjUtWa5tciUJmOnR6Fo015I7JnnLbqS568btXqiO9q8uJjDAhmFWZSrNXfyHGhp2V4Sb4LlL1b4D3n1rDBUzZq6GCxMrzsBZ/1Kf5abZZ9d2AZVMQ0lWg4Ho7MaM9i7Rlt4k+Ox2c/UqRObFTT/87vALLWb1QpRitUSLJ4PZbUp2QIkOq0hJa/1bIsw/OzWGYN2Bi1GfW+hJpM96Fd6yP/OAOhN+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 04:43:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 04:43:41 +0000
Date: Sat, 12 Oct 2024 04:43:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Use the filelist from drm for ccs_mode
 change
Message-ID: <Zwn+ZGwd4o9wNx8e@DUT025-TGLU.fm.intel.com>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
 <20241008073628.377433-3-balasubramani.vivekanandan@intel.com>
 <ZwVHmw8KPluuPgvC@DUT025-TGLU.fm.intel.com>
 <bl3ildwwdjswvvfpim4fgqdmlqvonccfbavdxymyxr4bdp53bn@xwd5njyqad4d>
 <ZwVS0eVGUaa8Z3v3@DUT025-TGLU.fm.intel.com>
 <l2a4np3y6htwcp7emufsrajyrozpmguwm4ucosbu2ne444jpwa@2ohs4dowlmr6>
 <ZwVq0JIEz64OhROM@DUT025-TGLU.fm.intel.com>
 <ZwVzOahncbCljo1f@DUT025-TGLU.fm.intel.com>
 <Zwe0bJJkKs3p-9Q8@bvivekan-mobl1>
 <qkxumw627jw4ukxsdywxhlzziub2324ydn43isdrp7yn5cfwta@vpipjndue5is>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <qkxumw627jw4ukxsdywxhlzziub2324ydn43isdrp7yn5cfwta@vpipjndue5is>
X-ClientProxiedBy: BYAPR07CA0070.namprd07.prod.outlook.com
 (2603:10b6:a03:60::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4750:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e417551-4c3e-4a94-ae14-08dcea78721b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?STeBs1iNeftVSkeqH2f0i8bkpAvdDe/TwB3vlew2+3CpjrH3bqGDQxtO8J1Y?=
 =?us-ascii?Q?qEJL9E9XOjdZOljUBJEI6GQt+khIpboZ0YmCwGdzkib/KwTWNRDrs1ZVrt8r?=
 =?us-ascii?Q?AZG0ZPNRk4/9KNbNKu+SxYHKqUvuseptf5+QfszUwnqueiGMo9B87wttqwdi?=
 =?us-ascii?Q?jOWTRK9LykkIVlU345qWMwsnXGSfMtkqSypj9XwvUWcmH8rcLe+zqMNUqedT?=
 =?us-ascii?Q?RYgPjaMn7M+RFJRhuy1tH2jE+U6my2QNqea9x8ABMiwVgrQpRv/M8p8PnGJ0?=
 =?us-ascii?Q?D2CE5gjX6NCAdKm4ifOeNSFCH5l9H5kUGPHF4U98jTj7FXNLIsakzJN5J8pl?=
 =?us-ascii?Q?LIEokwsBUkjv4Mq0hcCQ9if/nbYmsaPFjKlv9KOa41UI5wg1gcU/uR21A5A3?=
 =?us-ascii?Q?BUIiEbBslV+gQCQCQtLIDWUChO2p493BZZ2eKvGoJfbm1D8ZeD1MfT0WMvka?=
 =?us-ascii?Q?c44xCg2uZ0kUKRuKJwfi3vq4qmezOA9q6ZCMqtDLp77mq/7fabHnKNCFVnF+?=
 =?us-ascii?Q?clVXreuBF1C2GVKkWFzxMgS6/5zdBPjRe1GcB+pfWTr++hcl15mncUoo+X+B?=
 =?us-ascii?Q?ALUpAWbNnXRn6JWSKm7bs6KGRewcMDEZ8LeB/wG3o6B2GcetbUvQ2/Owj6nj?=
 =?us-ascii?Q?XsKZ9ERevXX9RcaFR22s93UoWmq7Igx6bFf0sf+ZGSC3MFRzP3a+ksGfxlNI?=
 =?us-ascii?Q?XY62lMg+qwd7TlYR2Jt8ZxiRQbrjceEL34fggdS0gwiAVCe8HGvfCpw8YY3u?=
 =?us-ascii?Q?s9NUxruT5YPrXo8FWTQmtFMk57FiZ65itBWj3AKzyvzxCiejI5YamU+OzVGU?=
 =?us-ascii?Q?tMm/8/BFxQDAPDXuIviyNkOpUBcgAmfi9pnDCDybfSkKRVatwbKTMp9/qhZf?=
 =?us-ascii?Q?k1/DHPgSOmYWZJEz3o6neTrxrMsvb8c5M0uutYewjFUsppW/EcenQoPLYCH4?=
 =?us-ascii?Q?6680Jq4eBCD1o9JhreRwFd6qcRIZZbNSTz0FXCqb1vO5NG+HSt08xa060Ugp?=
 =?us-ascii?Q?yxkxeGD6nt2wiP92i7PNu6hVtrTw2eMaT/y+4BTXFJti36ycupzlnn+CQfzj?=
 =?us-ascii?Q?vNnWOBS043lMpSjmWU06W716jAXDhvTQJIGpevThs1UjtZ8aCIlCC5QhhWyY?=
 =?us-ascii?Q?PxdUk1q5ipi2fZK+8JxKhmLyy5YQkgth7Oatsisy9YiZ8aihHQQ3gA8x4YZD?=
 =?us-ascii?Q?r0ssCZ3TP2J5ylMe0RDzz1z2SPAIlL71WoapwQ6dvBNXrx5CSaNT0U73Mn48?=
 =?us-ascii?Q?zMUsZYHdhCPlITXZIUGQQLXImVhXqVTObHrop5ByMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mF7NkK7W2ZY6tAl7jw7xG9zD6yYv0Va4y7WaJGaKoFwbS4Rru5xOyAinRxne?=
 =?us-ascii?Q?tH9mrrBj0uIoXw5sAUMKpCo9IAy7SuEXo6uH7L7LxXRJjtLh1Oeg+7Sreh80?=
 =?us-ascii?Q?+6xy9o4iIkBUXUB4cma1fOLQYDt4y1+S6ujkCZgbPpzwl5+CGNdwSL9AVxhz?=
 =?us-ascii?Q?SVuzx8wW9EoN33rufyJHYgiMtQEVXEyL7XUjUZ56bOs26TwTJ3wDBFrtqFZg?=
 =?us-ascii?Q?VBaA/OxX1rCCTFGuj0dC5dnDKC23B+2eweBCuaPLRaUMxNprluLvD37plRpX?=
 =?us-ascii?Q?qS994jdx1Oe+C2+15L+fdTr9p6rywCOWdoTtb5SKxQk+6R6cy4f/j0gb1m/D?=
 =?us-ascii?Q?SAhRB7tFmpMk/wZfGdnrfIfceQ4zvptqmetqEJL7xfL4Si3Dl8d3l4ppv4ki?=
 =?us-ascii?Q?GljWL9NAZsqb+xd/KYh/1GJ4dA3fjh679W3VUNiqPftnnQyzpNnKISVHNqtB?=
 =?us-ascii?Q?8AE1yw6Zv6PIgj1jBwLL8o9MXyQw8L+qgvXQumb6trXUn7Rt7tJM2qdMuRy2?=
 =?us-ascii?Q?wOld5rEWidFLLAKhLmrKrz7to2+tBtt6Je2OyJOZ6mqzAzFXBAb1mUCdVCSh?=
 =?us-ascii?Q?xe48VNWJWFjtPXBu4E0QygcCl6o9+TVwSibB3jB3hjRgfDrvSyojL9sAg40B?=
 =?us-ascii?Q?f6D+vcg7szmkeGEmEh7/vdifn14hsSYWtut8+kkiBZZLXhaWe7740mPYcYyf?=
 =?us-ascii?Q?xLGnRjQE/t8/qtuBwAX/gaFR5spY2kK4it7Vyx/GZOKFdXYkRu3/D9Jer/vd?=
 =?us-ascii?Q?2QZiQkPd03ikeDHBMVWgw0Nvpbxzx6KrMd67DyuFkJy2RKyE4fO+YKmSwYqo?=
 =?us-ascii?Q?iCwKxVgi+J8EwFq22oQuW8139evASwgbcBuWyqRLRJS8Zws8TZHh40XCzuBL?=
 =?us-ascii?Q?PjGLJWtV46D6zDoP9I0GN8RXsLwp27kjTHTyvSHEHyFFgyRYYx3B7U5dz6Hu?=
 =?us-ascii?Q?Jhs3BVAjlMkJas14cYj24Hp0VgYs3dejkmyvTX38/mwt05+Feg0q3YscwrCS?=
 =?us-ascii?Q?rkZtl72xCeRCY9Nb7uVBDXGkX/ABA6FRVt4z4DaxbQlrjJvOgWnv0PAJFKSq?=
 =?us-ascii?Q?mp3+tYm2gK5Yb2kauCILyrTpNKLwv0duZGqcVqOpnFbKVJA5SRvLJU1TM1Xo?=
 =?us-ascii?Q?GcvVv5lJjHWVwsZ21Fs/CV/KnjC7dJ9K3ghsge91wCdtiBJGEq9z055iskLr?=
 =?us-ascii?Q?cX9ISUFU1ymzgQPChqwgrcuEeuC6D8OZO6+y76ZfAA9lF8NlLwkqjhYagYq+?=
 =?us-ascii?Q?nZEKZdvuN2i/7CWeQxe6RJhIeVLa6bbYCbUB0vW8L9+m82Z5V4Rtp8rJCGna?=
 =?us-ascii?Q?VA0fIsIdBtRo1KQzjH7VYyk28Wu5BHbWgN8rjL2o4Ng3Rfhx+hcWubdxrr+U?=
 =?us-ascii?Q?k7RDS5vO/Br1WGANRgKGZQ1OhiDsXR2c0KmqTK+N34ikmUDUm3NEDqyug60o?=
 =?us-ascii?Q?zctFK1WSw2TwJ+JYLQMVeRtYxut/cHyb6eJMjdmV+SvbUbh1jPiiaF+ZzNYn?=
 =?us-ascii?Q?mYzFT+MZ1HLyNN3xml/yj0pUBLDdrCg6XFXmNeuugigKi4qNFloNWyK5z05q?=
 =?us-ascii?Q?LQYkCWaUdy8USR5bD+pIrAEwDACurRDZl2ZiUafJn58m2nS1C0R5vZq9yzil?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e417551-4c3e-4a94-ae14-08dcea78721b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 04:43:41.2205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgWzTG8bqWNCLw4m4nSAa42nvmZU9xiuflgOGkTwBimUo9i7Vqb/A8t8BshtVglqNt8XoJKHd1H9FplA0jJM8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
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

On Thu, Oct 10, 2024 at 11:02:56AM -0500, Lucas De Marchi wrote:
> On Thu, Oct 10, 2024 at 04:33:08PM +0530, Vivekanandan, Balasubramani wrote:
> > On 08.10.2024 18:00, Matthew Brost wrote:
> > > On Tue, Oct 08, 2024 at 05:24:32PM +0000, Matthew Brost wrote:
> > > > On Tue, Oct 08, 2024 at 11:55:03AM -0500, Lucas De Marchi wrote:
> > > > > On Tue, Oct 08, 2024 at 03:42:09PM +0000, Matthew Brost wrote:
> > > > > > On Tue, Oct 08, 2024 at 10:20:15AM -0500, Lucas De Marchi wrote:
> > > > > > > On Tue, Oct 08, 2024 at 02:54:19PM +0000, Matthew Brost wrote:
> > > > > > > > On Tue, Oct 08, 2024 at 01:06:28PM +0530, Balasubramani Vivekanandan wrote:
> > > > > > > > > Drop the exclusive client count tracking and use the filelist from the
> > > > > > > > > drm to track the active clients. This also ensures the clients created
> > > > > > > > > internally by the driver won't block changing the ccs mode.
> > > > > > > > >
> > > > > > > > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
> > > > > > > >
> > > > > > > > Is this really fixing anything. As far as I can tell nothing upstream
> > > > > > > > opens a file internally (i.e. xe_file_open) is never called directly.
> > > > > > >
> > > > > > > should fix this case:
> > > > > > >
> > > > > > > 	open()
> > > > > > > 	close()
> > > > > > > 			<---- race here
> > > > > > > 	change_ccs_mode()
> > > > > > >
> > > > > > > because the close is not completely sync - the cleanup where the
> > > > > > > previous number of clients is decremented is executed too late and
> > > > > > > subject to a race fixed here.
> > > > > > >
> > > > > >
> > > > > > Ah, ok. But then IMO just move the clients.count decrement to
> > > > > > xe_file_close. I try to preach solid locking / layering and this seems
> > > > > > to go against this idea.
> > > > >
> > > > > why do you want to track the exact same thing in 2 ways, one in drm and
> > > > > the other in xe? "Are there clients connected?" is something drm_file
> > > > > answer and doesn't need to be duplicated in the individual drivers.
> > > > >
> > > >
> > > > Well layering, making assumptions about the file list means, and not
> > > > randomly deciding what we can and can't do with locks we don't own.
> > > >
> > > 
> > > I looked at this a bit more, if we want to do it this way then I think
> > > at a minimum we need a drm helper for this.
> > > 
> > > e.g.,
> > > 
> > > bool drm_device_user_clients_open(struct drm_device *dev)
> > > {
> > > 	lockdep_assert(&dev->filelist_mutex);
> > > 
> > > 	return !!list_empty(&dev->filelist);
> > > }
> > 
> > Still the driver would be required to use the filelist_mutex outside the
> > drm layer. So will not solve the layering problem completely.
> > Otherwise we can define two helper functions in drm, the first one would
> > check there are no open files and returns true holding the mutex.
> > The second function can be used to release the mutex.
> > Does it sound too invasive?

I'd say helper to acquire / release the file lock indicating it is ok
for other layers to use the lock. Then add helpers with annotaions (like
my example) for internal access to that layer. Maybe a bit much, I find
myself writing code in this style these days.

> 
> yes, and I'd rather prefer not adding these helpers.  If someone wants
> to add helpers later and convert the current use cases, that's a
> cleanup/refactor that can be done on top. For me, these helpers are not
> really helping.
> 
> Rodrigo / Thomas, any thought?

Another opinion would be good. I know this seems a bit pedantic but
locking is about the most important thing a driver and certainly the
most difficult to unwind is we do it incorrectly.

Matt

> 
> Lucas De Marchi
> 
> > 
> > Regards,
> > Bala
> > 
> > > 
> > > Matt
> > > 
> > > > > At least it's also used for similar reasons in amdgpu and vmwgfx:
> > > > >
> > > > > $ git grep -l -e "->filelist" -- drivers/gpu/drm/
> > > > > drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > > drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > > > drivers/gpu/drm/drm_client.c
> > > > > drivers/gpu/drm/drm_debugfs.c
> > > > > drivers/gpu/drm/drm_drv.c
> > > > > drivers/gpu/drm/drm_file.c
> > > > > drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> > > > >
> > > >
> > > > The AMD / VMWGFX usage certainly looks wrong to me. If the file list was
> > > > meant to be traversed by drivers there should be an exported iterator
> > > > IMO.
> > > >
> > > > Matt
> > > >
> > > > >
> > > > > Lucas De Marchi
