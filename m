Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D98C3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 06:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAB710E32E;
	Thu,  8 May 2025 06:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8SG50ra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C4D10E32E
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 06:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746684775; x=1778220775;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CR77z8jr3Qkrb3xmuHjibLig8u+50gOyiQpxdWLDo34=;
 b=Z8SG50rasOlWWz71ASdS8NZrsn3wYPdE2rT72/NpWev5GNVq/PRxcV2I
 wRGxX10R6PNbYHACfijk81Sf1CGMuZiuV/i2Cl7og51gcbuVt4fFQFWqd
 eMqvlhyahQ4MWf5y78SCPGIch/rAzR9o/hyGiYxdxkr7Mtfl2Hz5I3VGa
 Vk4BS8UWiMno1IIrCcLzqVnZ6YhuQtRHngOwCUAJEnl7PfNBInmqaNoXL
 a+X0qd0NxW3aGvGiWktfnGRoAeFiS56fRWuBAwFTLcHptLpvGj8r4YLwG
 rvRC5Te4csMO9EFmlFPU8NcyeeCBFas9u72MW676SN4Ecmn+TbcYxCR2P A==;
X-CSE-ConnectionGUID: cqGwi6AOQrq9DyATcJR1mQ==
X-CSE-MsgGUID: p+vdvwIyTxWqXK7NWhhxyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59079056"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="59079056"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:12:55 -0700
X-CSE-ConnectionGUID: PsTXx70aRDaFasWFsHGjzg==
X-CSE-MsgGUID: N34PRxwNRamzNUy/EDuafA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="136075122"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:12:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 23:12:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 23:12:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 23:12:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3/y4MxBnJ82BeuvRZaScwTgfB++mnhuTBeKYlSCk9qnEZlaZ8z4wHhWHX3NsF75XkN4OoNKq0fkUVNX2BigWA6E7fjoxnSh15A0irvHukfkwapPuay/lUpsH6ApqY3tDvA4SrNnN/l4oQWNFtJlTmiu8tJxuZ0zbTXrk+TBx4Ul/smkdXNyyHVJdcpTCRKR9mN+X4GFw8MmNSn79wuO5Dt4uqq5kd4eKrWXGMwMHjDKLlZSmxj9PF3vKvyYBYAdFynLUHp8SS2bkVMsVMHhjBL02hZ1tcQoK2HNVzEpy/HATPhnYsQyhEJ/wBTtnliEmZLDjmv3VpM0cZCP1u09Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVJJmWWwFdovIohPb/Tct0j3wyOCI59Pc5p3BG/NdLA=;
 b=K1K7XPiXD0Qf+/ufQJNt1AglPI0pSD1iIwQY0+iQMb/4X/Pn72AF36YZuEaaV5R8nMIG6bR9+78OAwxkNullfTQFtc/smCyArA2CE50qPdG4Xt3DZph8OlVEiSQo6T4LnZ1qjvEP9HxkXeb1TnETNMCB2gqdiGmxX2p+DAeulXiqy1onPBjASUVGT5A4k/B5V0nl/hR+6hvxEJbEJZGMLtwgB0tVCd4gxZIugk/2xd7638QrI6WwmUJXBtEjsakLkDj7g8uRTs914ppkctAlwP57QBEfzdhDnaY3V2YeiWph0IXAqnHXhwlv+VaUTuDsujk1nz6wse7iT8UGkimV9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 06:12:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 06:12:48 +0000
Date: Wed, 7 May 2025 23:14:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Souza, 
 Jose" <jose.souza@intel.com>, "Santa, Carlos" <carlos.santa@intel.com>,
 "Venkatesh Reddy, Sushma" <sushma.venkatesh.reddy@intel.com>
Subject: Re: [PATCH v4 2/9] drm/xe: Add "null_sparse" type to VM snap
 properties
Message-ID: <aBxLtX662kMWyvfE@lstrano-desk.jf.intel.com>
References: <20250507201539.1316770-1-matthew.brost@intel.com>
 <20250507201539.1316770-3-matthew.brost@intel.com>
 <CH0PR11MB54443926ECC62F6A064CDF9AE588A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB54443926ECC62F6A064CDF9AE588A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4P221CA0017.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e6f824-38dd-40dc-9d57-08dd8df75aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DwyTezUrZfwR0vHdL5Nkl0cNtDHOtxb6wiLvP5TRWnGzbvyc/ZOJZMOUpm?=
 =?iso-8859-1?Q?pcMxcjsdhKO0yGS3hrfUSQH/T2wLV49kFpomzYwSrUddEEydl7E/yFoJbn?=
 =?iso-8859-1?Q?+U0rXV4K6JghELe3sPaQS5a+UtpTNGxUsGcfgkHJzhDFWNIpA4Li9Rt+YR?=
 =?iso-8859-1?Q?hkHmGAlC8bjPDCIsZR2ruEiJRH2WEKCpZOOUsAmXSmL0iUyxLzBXqzn2mq?=
 =?iso-8859-1?Q?PDO8yC4dE3AyMgSfd1jRZQkFQl7XWmytDgrn7TfAJlotzbOMp4kZOQADh9?=
 =?iso-8859-1?Q?sv8eRN8WU06MsXZY0BROkG6Ic6lRTocq1y5jCFadK4uG4ZHs8YM04QLcA2?=
 =?iso-8859-1?Q?M16QIBNwDiu8xFVNyMQwG32Z4JwDYOS8EafW2UPyOXavNRYz10rZSbdoay?=
 =?iso-8859-1?Q?NzhNPQEUAL7Kt/JdzKVsIsLphN22ItP123bQnrGxMO4n/vypASyMDZ3NUi?=
 =?iso-8859-1?Q?B81LzW2IibBEsk8AjWHwns06K23M8JXX5dcrZIFPeKmJDIw6KI1cua9p/b?=
 =?iso-8859-1?Q?7fX3iGZ3FU9hQmkMw389QEOHjo+JBRVX7SttQN02lqnEjHMabq57SQtTEb?=
 =?iso-8859-1?Q?J+ASxLvxWXgAMK9haV9NVOk7WFbMUnnWPtDquHTA4oOcUblSxap2qYd2pq?=
 =?iso-8859-1?Q?n+QcAEDQ85PNfXIVl3c9puGEnezgyPJngVKWGkEaZw4RRRKL4TpF/jk1UA?=
 =?iso-8859-1?Q?Hxxy846NZXGKAxwhjj2BCCCI2pWyCD345aOpOkBXtyVPAIXInnXiEse88D?=
 =?iso-8859-1?Q?T0KztMnZC2WxGGh4rAhmEAev2ikyOclrOUdr2B7gmiGhLdnKu1FAwllf3X?=
 =?iso-8859-1?Q?4nrMQiQZqf8lTRM2d8sGKbaTv0DzMAI5W1CpwV6ll3betYjuca89rcEu8H?=
 =?iso-8859-1?Q?DEjjPu9Ymwmar5hARC6oFkR0ybn/nUwoW92UXLTKosJE7bRcVbsjDy64Bd?=
 =?iso-8859-1?Q?nAFNS7Jv8OCiOCtsY2cvc8Kc+5MK/256PNS/KTBKRrECESBq86L87TZ1oB?=
 =?iso-8859-1?Q?XelOVwDwjAUO5iuzhuBzXjBPAisBWntpObwy4Yt88OUm5RZOBV6fSzz8LH?=
 =?iso-8859-1?Q?H7RDCF1AFTI9PoysgN9+SV02A8dT0ScaMXd3IASTzoECdAz6Nlq0wC3VOi?=
 =?iso-8859-1?Q?UrqTWtntqTPTIkXpBGwRYYLp4amyxFlIkqVV3tHCAoA5sPjcjTaU7ntxzm?=
 =?iso-8859-1?Q?nFl0FzO/lhuynTPbcgi5VjDipC5VBnscyoU1HNeBwlzCbkOK6UmFhnzkuv?=
 =?iso-8859-1?Q?HbbGZDEex7rtRPKb5qlsrhmB4+9ZcB8MB84DufRi1CWtXGW9TRwEWgKdHZ?=
 =?iso-8859-1?Q?ngs9DWz5MOO7KRilS0b2kfvbgb48uxexYKorunwH93skOC6MJNCWpz5L+r?=
 =?iso-8859-1?Q?QZ39mP311UmWewKU7nBTAo8E66Xdz+fh/m2BqePVEP9nOAkuuSHqepNlhC?=
 =?iso-8859-1?Q?15YCeBO58LbNLCp7Nb9abx10+K8P54YEB7wkXWo6VUFiyU+aE+OESVR9Ky?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2uQOQJuGMW+o5HiybOxuNlYrYo6Iv2xWhu8ZpYhXIJIIaQIm6k3xSdNvGa?=
 =?iso-8859-1?Q?wjXxDx3YiZqVHjEknNu5xWppvZzC/CJvV5gRwmPyQdPJWIwg6ieYlpcrN/?=
 =?iso-8859-1?Q?JAPTC1mUaA+8sRo+46htilMP+zdY2EbagIqmtsHK754p+FZHgcD40mwybs?=
 =?iso-8859-1?Q?XhPaQ2nIU/dYS++NQ9yrM5fI9HbfCDSvYve+n+aDQAh0I+IRcknG+aJmVE?=
 =?iso-8859-1?Q?d8OIzV1mnk+uNF2gvVHuBqeE2g4esJJ0DPkE0x/aEUM79VbTr7DFrpeqGV?=
 =?iso-8859-1?Q?KYzEKeJYDN7iHf3g8eoBaTssTqOUi0KaIGbHNkUVKV+YnMWqR2/iMHqBBM?=
 =?iso-8859-1?Q?bdXzFQCeiB2/pRtBdA9b4zdMdW2bmvyHQQTVx7ybt0v270qqPU6+UPanDy?=
 =?iso-8859-1?Q?6nlVnLMoPx9KOYj9Pfye7DqhchqzAZndEzSCvu2ILeGF9SwNnLmOG/2I1L?=
 =?iso-8859-1?Q?FYqvyhhUEchfdsm34+JoPW+U91/18GXQ9qYL2Wh0h5idsriI9lNJGVCOcf?=
 =?iso-8859-1?Q?eK/KuAiXvmGrHqJzhYcepWIzQX5921DOr1t/qu2QHKfvjhKJIadGP/j3Zn?=
 =?iso-8859-1?Q?TZ1fKIB/OaALrkbTkkcf+q9lMkm16+OMFY3vjBSipknKqw+ujF/YRj6YR/?=
 =?iso-8859-1?Q?m8C9LNELOk9OWfLqdSzsCij4b+9tPXApcRlKSFTvaKIkx+kwMJpyOjoHrC?=
 =?iso-8859-1?Q?cLlgA15qN9guXnNvt+lpdOeig8KKQjmpsQ7kLll2psMVeDb8dE77WAosHk?=
 =?iso-8859-1?Q?blUo49/m/aAmGwz49Ehm1rDuRQqzu9MXP1V3GPKFG7UUsWqQx4pX83Hep3?=
 =?iso-8859-1?Q?KagmnAHeIs3SwxVSEuMkyxbQq9jbPCDJ+rrs4TlsUc7/I4/HSj3nudbESV?=
 =?iso-8859-1?Q?PIEZGZ6+8nRkMsXsr7gsP8ZIsQXcsWZ3luNANi4TN7q9wmfwiCoqTiGpyE?=
 =?iso-8859-1?Q?Q3LCJU/0R566DMsx4q6wAHjp9LdyhaDI9wf5QU8S7b9E+fvnmIQp3sxSdM?=
 =?iso-8859-1?Q?gvBcRhbLMAeEJCv5r6D+lmyetwvXE/7oay75crgJdTU5Ob26oG+WVPX/XP?=
 =?iso-8859-1?Q?APHfufMHpSTq6PZtfe9Gze6LvLUOwoqMYjF+ExEFsDZ2MeZRfKxdorfxcB?=
 =?iso-8859-1?Q?SIRILTzRcLhPcFmf9XwSs6IV2+h6i2V+cE1FMo/R+Fl2d3tAPYXW1MHlAJ?=
 =?iso-8859-1?Q?wIlF2HyeJs+JvVykG2RYVUr+Y4mSSD5oxP85+cpEa/rDd25uG9eEWjzZiY?=
 =?iso-8859-1?Q?tS1TLRsPLIOOTa6Z1rUT0BQPNgqha0MUbilWkWULFnLWJO0gXQQo/qlZqM?=
 =?iso-8859-1?Q?PvliKIMT+1WuIw3B+93ZLAB23dA5Oe+wYqhq1lkqt9XmT4Cf6AkEoUcEZt?=
 =?iso-8859-1?Q?wjEO+E5NeubsaI+8xlFAIZMxB3srujFJkckXKVSTqwNfsuseQueyU0MKYo?=
 =?iso-8859-1?Q?/UpI2bJrFMc4AphWtBmpwe0Y7QHP6gtJqgcoADg0awWXTuYrVPOmmUYgqu?=
 =?iso-8859-1?Q?Xbsi2ezOVj3yheKacjcuIqMI2wlJTDGnYq9bWuVjU4EVKeA0YAWuS2rDhZ?=
 =?iso-8859-1?Q?nAm6Jc1G+EWvsz5HJ71B012gT/xaa1Mh8fS0i/yjzpK95F31ZNt3DIoHpd?=
 =?iso-8859-1?Q?5JU+uz2fPrf7L1JO4Sx3bZjh8IA4yG62KfvIv0XHV3z1BJDh62OZZX9w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e6f824-38dd-40dc-9d57-08dd8df75aed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 06:12:48.0311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kgp2ML4OfgPMka9kHg3QMp/8gOXEgTd0WiRcobv/MTkckFFafEdznEtTraBW1XupgZuej62pqXR8NY7TR2qX4A==
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

On Wed, May 07, 2025 at 02:36:28PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Wednesday, May 7, 2025 1:16 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Souza, Jose <jose.souza@intel.com>; Santa, Carlos <carlos.santa@intel.com>; Venkatesh Reddy, Sushma <sushma.venkatesh.reddy@intel.com>
> Subject: [PATCH v4 2/9] drm/xe: Add "null_sparse" type to VM snap properties
> > 
> > Add "null_sparse" type to VM snap properties indicating the VMA reads
> > zero and writes are droppped. This is useful information for debug and
> > will help build a robust GPU hang replay tool.
> > 
> > The current format is:
> > 
> > [<vma address>]: <permissions>|<type>
> > 
> > Permissions has two options, either "read_only" or "read_write".
> > 
> > Type has three options, either "userptr", "null_sparse", or "bo".
> > 
> > Cc: José Roberto de Souza <jose.souza@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Admittedly, this looks like it could or should be squashed with
> the previous patch in this series, but it's not a blocking request.
> 

Yea this one should probably be squashed. Will do.

Matt

> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index ddeec681f71f..95c51834c620 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3729,6 +3729,7 @@ struct xe_vm_snapshot {
> >  		unsigned long len;
> >  #define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
> >  #define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
> > +#define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
> >  		unsigned long flags;
> >  		struct xe_bo *bo;
> >  		void *data;
> > @@ -3786,6 +3787,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
> >  
> >  			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
> >  			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
> > +		} else if (xe_vma_is_null(vma)) {
> > +			snap->snap[i].flags |= XE_VM_SNAP_FLAG_IS_NULL;
> >  		} else {
> >  			snap->snap[i].data = ERR_PTR(-ENOENT);
> >  		}
> > @@ -3806,7 +3809,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
> >  		struct xe_bo *bo = snap->snap[i].bo;
> >  		int err;
> >  
> > -		if (IS_ERR(snap->snap[i].data))
> > +		if (IS_ERR(snap->snap[i].data) ||
> > +		    snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
> >  			continue;
> >  
> >  		snap->snap[i].data = kvmalloc(snap->snap[i].len, GFP_USER);
> > @@ -3858,6 +3862,8 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
> >  		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
> >  			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
> >  			   "read_only" : "read_write",
> > +			   snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL ?
> > +			   "null_sparse" :
> >  			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
> >  			   "userptr" : "bo");
> >  
> > @@ -3867,6 +3873,9 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
> >  			continue;
> >  		}
> >  
> > +		if (snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
> > +			continue;
> > +
> >  		drm_printf(p, "[%llx].data: ", snap->snap[i].ofs);
> >  
> >  		for (j = 0; j < snap->snap[i].len; j += sizeof(u32)) {
> > -- 
> > 2.34.1
> > 
> > 
