Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AC0C369BD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 00:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3523910E079;
	Thu, 17 Apr 2025 00:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqK1sUNR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E769710E079
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 00:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744848197; x=1776384197;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tbGylVzcnyQaBWkJ8EpCkGJQTtVbPQ6JfX/YWI0+hkU=;
 b=FqK1sUNR7dlRoUFwPaH+8l4q+vyn9ocy0+H/16G/FqQe1yMUaZU/PKQl
 vd+xuJtgU6K1vLXnqguBw/zdRmH1mt1ATWQD8Trcz17TIOiTAp87qGLp2
 ZnFXr03Qa37wUCpkLIFIoXGwLUBW8yJLEof1OZLCRor3ConLEYo0JYqW1
 tg7ifPTRsVCv7RRe46anEvWzdeA+1j3iVCmHFnJtwNuY9xyIw0QK+fQxE
 U7wNO1Bc0FU9K0+h2i0rhBTKHXDF+qnf3odSUutQu95877GLibnADMcYx
 kfA/D82tIcVAZ6pnPlAeET4Ru0e/bOKqQRdPq9omzGN026u9GS4hneOZw A==;
X-CSE-ConnectionGUID: KfnjdEJnQ2Kc47jMWBT7fA==
X-CSE-MsgGUID: fHkyWvKPSJSxp/T81u07VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57087324"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="57087324"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 17:03:15 -0700
X-CSE-ConnectionGUID: BTqTwTznRbqEXnt6eEM0VQ==
X-CSE-MsgGUID: R571pUcaSJqbabNg46RMGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="135490082"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 17:03:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 17:03:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 17:03:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 17:03:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqNw321ETiCv3Ri/iKz7G4Cn9ZJV7dWn/w4V2tu5nwg95oe/sp55cGQbWs6ZUE1AU3tnAfOYUVSun4fF5+qJqCRGVO3GrRsrhuS8llnEXeTKkcERDvwEWiNL27kJIGm4r+7VbkZmcpSGa/aN9jIrj3xoMpw387qvp5n4OOeuOhZdI4J1lbBbY5ibcKsCWi//rWVzTuITgsDIPiuL6LPQnNnkdJhn5c3DJSR8Z02EH0WwbrHdlEdvAe1GqiH9rAzGk5rkCc00e31U9JkXdQTJbZWJQP19UHg2rRREO8kzIHg2S1yRF5P3ApoR4FPPaf5gxUcWi9FhCfCLzDVEPCPuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+P+6wpqe1HMlAifVghwkRDhngIIjJcJkUa/hnRSUgw=;
 b=DzpkQh8Iev4EUajQSAVWbasHyyuaBaamrzDLOcsAeVPDvqqDu734lcFwaaK2XmjCqfq2T1KzII5L0jXSQsv0p3sewtx1p7cgJA9BiNRt+F+YA26n0ByrXik4ODh79hZG9WL/2iNUsNU2JhxaIk99+pyuZTt4J/dkkAobwo5RpJ+cw7CfDbksWTDFTZNgtwxUoDn9fMsR3hQVCTCvwd3OQetlYrlN+OeHTsd7HPBwBjAzox+StKSGJ35+lEKuoBvwltwFyIh5LO14+c5cxP2VBVteA96sVDEC8wQdLx1eiRLjTkNCC1iaduqpi8/JazdXTXu5cliV3sBg5sxPHiQY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 00:03:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 00:03:09 +0000
Date: Wed, 16 Apr 2025 17:04:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/4] drm/xe: Add devcoredump chunking
Message-ID: <aABFjLcK7OZQ0y4x@lstrano-desk.jf.intel.com>
References: <20250415183916.332202-1-matthew.brost@intel.com>
 <20250415183916.332202-2-matthew.brost@intel.com>
 <9aa30608-7a74-42de-be19-1c3c6e0a7e5c@intel.com>
 <Z/9DyT1rzA2tOEOo@lstrano-desk.jf.intel.com>
 <b0634792-f2e3-4402-8b48-58b83f773426@intel.com>
 <aAAUnDb+EqjPFQ7M@lstrano-desk.jf.intel.com>
 <0da60d60-08f9-4da8-bf8b-ad62cfe3245d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0da60d60-08f9-4da8-bf8b-ad62cfe3245d@intel.com>
X-ClientProxiedBy: MW4P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: c714123c-3597-40d2-0285-08dd7d433cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cT3wtujRBsHH5FVhXaWDAcMv+FDpm08H8I3coU7k506obS6SS2HpyumPvzPf?=
 =?us-ascii?Q?t+x8bjYR4i7KvpYUslQF51SFN0f3r27F2ugkHJ4IukOcC3wGIg5r6x9Wy9d0?=
 =?us-ascii?Q?okT0weegdl0Xzyf03N84AVQmlS2IQN/9PrFZqWj62kpaAICSn48nGk3d9rQ+?=
 =?us-ascii?Q?8OupyVM82RLczJurDrvlJQTGzV9Blkmn8gFrVjCFxBVViV4L+t2LIgM0Gx3s?=
 =?us-ascii?Q?D+RfdGPs3jzSPjM7kB7vpASLK19UeN6QizriOinpyz9REZoTo4Qqvjh65Wji?=
 =?us-ascii?Q?mOExEB9JmEn4/UqLar5CCYqlUOxRG4kvdF7KIsod64Xx/Mah+q0JEGhqf9OM?=
 =?us-ascii?Q?6l7LttGnnZq4fuQMAeJXzfRDGleaLI3tktRCw/vyF2anCY3m4vEi0ykvk23O?=
 =?us-ascii?Q?ML+KqHEZMbc7O+tAlZUAc5EPlVpUZKtSuPHchCPmdITdThudZfdZJjAVyjD5?=
 =?us-ascii?Q?49oAMWxfW8FGM/nu471pKLPS1u6dFHzxhhmBE2jj6ohO0J4hl1TRwkMv+EFt?=
 =?us-ascii?Q?jdbZh15osd8x9S+a7RXes9Bq2PKWMLRUWikagMJcgUeZ1qojK345tjYtp6zD?=
 =?us-ascii?Q?sIG4UcO0p0lvhYrpzHcT+vx+0LM2jexsxvDEEfLq+AuPeO1voWu4bWu0GXsd?=
 =?us-ascii?Q?vuV2tqpix+mjOgbgtYo9xR0z3j5Fi7y2nII0wv265f0+yCaVt4Ps0E8kqQej?=
 =?us-ascii?Q?l1qwCtr/Nn76UR/+nKyRMoueGFRCJTVEnrURxqfSf2Lr4r6lyBScb/ScISJE?=
 =?us-ascii?Q?DgsJBqoA1W4mf4jAQyTgWnrQrFNQZnGro/zPpR+frn2ALNsDwDTL3B8Bhn/t?=
 =?us-ascii?Q?UENogLElrclXq31WYR0c/2Y7b4zQAK96pTGBt3UUNN9121Ceb0FjKZi0xvwG?=
 =?us-ascii?Q?XP3iULlPbqwYHCGLLQRa2Vum6+u1tHXA+QcofY/Fx1ZdSeJ72d61Nwo0zoR7?=
 =?us-ascii?Q?8gCKn8p73j31rUdxuXQnfQyUm10xYagWjg1N0VF4RaYyAGV06yW+5QOFB6gU?=
 =?us-ascii?Q?UebRYrnpaDexfXYJBfkiC0BeicTfMwWmmYrDG+aR+5H01+p07rHQKjQoSLLB?=
 =?us-ascii?Q?5P83Af7yvJk+KICKumyLMQOE4fOKGZemgVf6O3PvZH6qPTwfsOgDEo+hqjds?=
 =?us-ascii?Q?Yn8jr0aHYHAgscIgMJu4azT2XZBMeFZE7qrEH4uCwgF7cv02F/WGy+lzO16E?=
 =?us-ascii?Q?xN/pelPMisHmRVHwf2rfClCtvtwvrc3XQo6GN7H2w9p00noaR84AyKH9BRfS?=
 =?us-ascii?Q?v4WuvlAkuFXjiCnEISfQWlLdIibfwtKiGk4b/BMFTmdsxZjzY5HC5sCUL/eW?=
 =?us-ascii?Q?1v+MSIk0mTKhuLrGd2XaH0HSKyiHHatMaawks3lsWQmJjbHivsODKmKQVPhj?=
 =?us-ascii?Q?sNIeYMI8+eWSU2dPajoPq5Mg0+NLxiRLBx0CwSOzDLuYtez5hmXUDVdKMlEU?=
 =?us-ascii?Q?aY8zaks09bE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eKCwoQcMwbwYdYyFtAYlOheXamNW9jdHTMH3DjDNkE+xuscoX26w3YNtOpsV?=
 =?us-ascii?Q?6xFHIT8a4InKMpuNTtHuum+feAHxZZdClwCDHQGs/mBlR11xY4M9JwgNqjlI?=
 =?us-ascii?Q?AFzeOYXDv/3pyvcg6nOJ3jgLPHgLo2hawF2mPadC0yFjooDFwLViMxtPmomT?=
 =?us-ascii?Q?q2zgTmdItw3XJKnpyS0KsapvUkfth2IZRu5+wsM0LLDkh0zzISewFSnYGemu?=
 =?us-ascii?Q?+e9w3O4P1i9wBgbJuAmoypMyxxVSil0Lz2ut3OYHARNYK/9BTZVsu4Ns14Vb?=
 =?us-ascii?Q?/QiJhUkJw0nsAjnOt4ePjhlL8JY+RHKRQsAmbRPU2CThlf4stg6RecOlBWgG?=
 =?us-ascii?Q?YV9mZo4ES2ZvYXIySmr1UIZ7T+CuYtcSR2eu5ssMRvsSIrue7jayT0jf9lxq?=
 =?us-ascii?Q?IBafOXvGJ4ejp6yyweGk6fWTAFrfXJ34sPln8H5OZlCzJVEab41rh03eZVlm?=
 =?us-ascii?Q?grzAeGcVLpz8PYrL8ud57aAp/abT41rKJKQ68spLBpfYqjv7W/k7wCmKV1ea?=
 =?us-ascii?Q?IQQ6cfFkM2NPQm2cJwSkvWoCHAqTSBMLkKMZFvB83tnX6pmIajBglstHQcKQ?=
 =?us-ascii?Q?mbPpFIPT4rWIhuBWrIMD5v7mV667GbZC91quVB8jJs5f/YDm8Fem8L6S0j8o?=
 =?us-ascii?Q?XDt6oj9xpn+WIQBcDyQlhHoraql4Y7a3nu/GLCM2hPsPRX+eboIvwCal1ZfO?=
 =?us-ascii?Q?5Akqmb50k2hkhFOpWEiySVyr5ANJF0jYPilzahf4x3hGtRv+60iJyi+ODC5Q?=
 =?us-ascii?Q?gjE5i0L8KB8uq2zWYkr5eFo5/oj76paOfjookYxnk3ZTx4flyJecyPjQZKSC?=
 =?us-ascii?Q?oTx1Fx/fkAKycUjq5/HhcF5vpGQvxYv7dsUsgarFJNm4swzPBEaQUI01laaE?=
 =?us-ascii?Q?WQf70RPr7dT6Ufm8CzKRpi8sPJ0STFOSM5+q6s/QKYPF0xA9Fs+ieJAM9dJ6?=
 =?us-ascii?Q?uFD/hrEtayd+S15iqgwUc2FDkMYUTiE/hYjbsD9ncfBx3INrnge29ZBSwtY4?=
 =?us-ascii?Q?3TaLUAYf/qXzf++lNU+pP07lt3mwJvmjyveMKXxKIxl07pLQTswA+JcjBVYt?=
 =?us-ascii?Q?Ri7hFhBHN/0U3GA7FFcuvxgz5fPQXvJNA3TY4csqg3+PEAa4t/zKaibW007s?=
 =?us-ascii?Q?6W/iR7tWyfGtgGXi3PvJO06VuA9BJSVs6e31qxotNLH6BxCDXKu6ObkCO0HG?=
 =?us-ascii?Q?tz4RJwyp/6QxXiJe6vtGW62EPk0JmflLUS41rwLNL7+xDqSAlJGlkrFBSs2O?=
 =?us-ascii?Q?AIFj+pZcJ9Zwe0vUaW1dUJTerBb8O+4d5EXygfrycSnU0cRnr4Rg5lEn0Ilf?=
 =?us-ascii?Q?01R0+qzxKIGWUyhvPk44bPGM72FLPFEdWqbcxA293NfRKTl+RgbJlryMSfOZ?=
 =?us-ascii?Q?Al08hM5lwAPURDxrZmFCj4xO3fVRNAwddx7YM4GLAu5I9ipER99IL16Pu6Cj?=
 =?us-ascii?Q?BNGUeGMxSWmWRngJ4kLZjtkdQ/fhB2Yl/qYGdjtDxZkF+JbpgLtt+2KLkcKP?=
 =?us-ascii?Q?bQEkLPVuweK8Mffwqf6QSG9F7/QwaVXV+RDdSJrwVfrIUG8vFDhqgRGjnkLW?=
 =?us-ascii?Q?GqWAGKJBASDg/NRNQ0QPPCSpwzEo7C0f+Ii2qnmyDeyDV9FS+/wy+mj6iYys?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c714123c-3597-40d2-0285-08dd7d433cb3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 00:03:09.2623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SK9SuBDzeVLeRtq8mJcEMG3YecPM4CWdTc1oEv5uAW/kt4PJgEr8fv8RUCcnuYVxU2zMZJlSXOUNY3rYqqGsiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
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

On Wed, Apr 16, 2025 at 02:35:42PM -0700, John Harrison wrote:
> On 4/16/2025 1:35 PM, Matthew Brost wrote:
> > On Wed, Apr 16, 2025 at 12:30:27PM -0700, John Harrison wrote:
> > > On 4/15/2025 10:44 PM, Matthew Brost wrote:
> > > > On Tue, Apr 15, 2025 at 04:18:29PM -0700, John Harrison wrote:
> > > > > On 4/15/2025 11:39 AM, Matthew Brost wrote:
> > > > > > Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
> > > > > > of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
> > > > > > callback as needed.
> > > > > > 
> > > > > > Some memory allocations are changed to GFP_ATOMIC as they done in
> > > > > > xe_devcoredump_read which holds lock in the path of reclaim. The
> > > > > > allocations are small, so in practice should never fail.
> > > > > > 
> > > > > > v2:
> > > > > >     - Update commit message wrt gfp atomic (John H)
> > > > > > 
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > > ---
> > > > > >     drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
> > > > > >     drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
> > > > > >     drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
> > > > > >     3 files changed, 50 insertions(+), 13 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > > > index 81b9d9bb3f57..a9e618abf8ac 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > > > @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
> > > > > >     	return &q->gt->uc.guc;
> > > > > >     }
> > > > > > -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> > > > > > +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
> > > > > > +				     ssize_t start,
> > > > > >     				     struct xe_devcoredump *coredump)
> > > > > >     {
> > > > > >     	struct xe_device *xe;
> > > > > > @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> > > > > >     	ss = &coredump->snapshot;
> > > > > >     	iter.data = buffer;
> > > > > > -	iter.start = 0;
> > > > > > +	iter.start = start;
> > > > > >     	iter.remain = count;
> > > > > >     	p = drm_coredump_printer(&iter);
> > > > > > @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
> > > > > >     	ss->vm = NULL;
> > > > > >     }
> > > > > > +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
> > > > > > +
> > > > > >     static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > > > >     				   size_t count, void *data, size_t datalen)
> > > > > >     {
> > > > > > @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > > > >     	/* Ensure delayed work is captured before continuing */
> > > > > >     	flush_work(&ss->work);
> > > > > > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> > > > > > +		xe_pm_runtime_get(gt_to_xe(ss->gt));
> > > > > > +
> > > > > >     	mutex_lock(&coredump->lock);
> > > > > >     	if (!ss->read.buffer) {
> > > > > > @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > > > >     		return 0;
> > > > > >     	}
> > > > > > +	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
> > > > > > +	    offset < ss->read.chunk_position) {
> > > > > > +		ss->read.chunk_position =
> > > > > > +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
> > > > > > +
> > > > > > +		__xe_devcoredump_read(ss->read.buffer,
> > > > > > +				      XE_DEVCOREDUMP_CHUNK_MAX,
> > > > > > +				      ss->read.chunk_position, coredump);
> > > > > > +	}
> > > > > > +
> > > > > >     	byte_copied = count < ss->read.size - offset ? count :
> > > > > >     		ss->read.size - offset;
> > > > > > -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
> > > > > > +	memcpy(buffer, ss->read.buffer +
> > > > > > +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
> > > > > >     	mutex_unlock(&coredump->lock);
> > > > > > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> > > > > > +		xe_pm_runtime_put(gt_to_xe(ss->gt));
> > > > > > +
> > > > > >     	return byte_copied;
> > > > > >     }
> > > > > > @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> > > > > >     	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> > > > > >     	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
> > > > > > -	xe_pm_runtime_put(xe);
> > > > > > +	ss->read.chunk_position = 0;
> > > > > >     	/* Calculate devcoredump size */
> > > > > > -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> > > > > > -
> > > > > > -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> > > > > > -	if (!ss->read.buffer)
> > > > > > -		return;
> > > > > > +	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
> > > > > > +
> > > > > > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
> > > > > > +		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
> > > > > > +					   GFP_USER);
> > > > > > +		if (!ss->read.buffer)
> > > > > > +			goto put_pm;
> > > > > > +
> > > > > > +		__xe_devcoredump_read(ss->read.buffer,
> > > > > > +				      XE_DEVCOREDUMP_CHUNK_MAX,
> > > > > > +				      0, coredump);
> > > > > > +	} else {
> > > > > > +		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> > > > > > +		if (!ss->read.buffer)
> > > > > > +			goto put_pm;
> > > > > > +
> > > > > > +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
> > > > > > +				      coredump);
> > > > > > +		xe_devcoredump_snapshot_free(ss);
> > > > > > +	}
> > > > > > -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
> > > > > > -	xe_devcoredump_snapshot_free(ss);
> > > > > > +put_pm:
> > > > > > +	xe_pm_runtime_put(xe);
> > > > > >     }
> > > > > >     static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > > > > > @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
> > > > > >     	if (offset & 3)
> > > > > >     		drm_printf(p, "Offset not word aligned: %zu", offset);
> > > > > > -	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> > > > > > +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
> > > > > >     	if (!line_buff) {
> > > > > >     		drm_printf(p, "Failed to allocate line buffer\n");
> > > > > >     		return;
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > > > index 1a1d16a96b2d..a174385a6d83 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > > > @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
> > > > > >     	struct {
> > > > > >     		/** @read.size: size of devcoredump in human readable format */
> > > > > >     		ssize_t size;
> > > > > > +		/** @read.chunk_position: position of devcoredump chunk */
> > > > > > +		ssize_t chunk_position;
> > > > > >     		/** @read.buffer: buffer of devcoredump in human readable format */
> > > > > >     		char *buffer;
> > > > > >     	} read;
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > > > index af2c817d552c..21403a250834 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > > > @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
> > > > > >     	if (num_dw == 0)
> > > > > >     		return -EINVAL;
> > > > > > -	hwconfig = kzalloc(size, GFP_KERNEL);
> > > > > > +	hwconfig = kzalloc(size, GFP_ATOMIC);
> > > > > As per earlier comments, this should not be happening while dumping a core
> > > > > dump. The only code which uses this is steering related. That implies we are
> > > > > reading EU registers while printing out a previously saved core dump. That
> > > > > either means we are unnecessarily reading registers during the print or we
> > > > > are not capturing state in advance and only actually reading it out when
> > > > > printing. Neither of which is good.
> > > > > 
> > > > Ok, I don't have bandwidth to fix that. I'll let this series die then.
> > > > 
> > > > Matt
> > > Or maybe just add a FIXME comment? I've been meaning to take a look at this
> > > myself but just haven't had the time.
> > > 
> > I guess that is a better option. I can add a FIXME when merging.
> > 
> > > If we need the large file support to allow people to debug issues then we
> > > should get it in. Your patch is not causing the bad register accesses (I
> > Yes, this is an ask. And no, this patch isn't causing bad register
> > access rather exposing it via a lockdep splat.
> > 
> > > don't think), that is something that is already broken in the driver. But I
> > > don't think you should make this change with a comment suggesting it is all
> > > fine and happy. The commit description should be more like "FIXME: This
> > > should not not be happening, but until the unexpected register reads are
> > > removed/moved make the alloc atomic so it doesn't go boom" and add a similar
> > > comment to the allocation itself.
> > > 
> > Ok, can fix commit too when merging.
> > 
> > Matt
> Sounds good.
> 
> Although I've worked out where the dodgy reads are coming from. It's the GuC
> backend for the register capture code. And it's not actually doing register
> reads, but just re-calculating the steering for the register value that it
> had previously read at capture time. It should be possible to cache that
> information as well, rather than re-calculate it at dump time. And that will
> get rid of the need for the atomic alloc. Will try to get something posted
> later today. Up to you if you want to hold off merging for another day or
> not.
> 

I'll wait then I guess.

Matt

> John.
> 
> 
> > 
> > > John.
> > > 
> > > > > Rather than making allocations atomic when they don't need to be, we should
> > > > > be fixing why the coredump is not doing a clean separation of save versus
> > > > > print.
> > > > > 
> > > > > John.
> > > > > 
> > > > > 
> > > > > >     	if (!hwconfig)
> > > > > >     		return -ENOMEM;
> 
