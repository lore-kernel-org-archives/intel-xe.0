Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0319C3A59D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 23:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8DB10EAF3;
	Fri,  5 Apr 2024 23:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PP97hnqe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA60810E1CE;
 Fri,  5 Apr 2024 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712360017; x=1743896017;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lPHOt1hYEoESbeqXZdRHEIhOYlEIvOzzTKkk17UXLD4=;
 b=PP97hnqel6vovAqccBsPLQM9E7UmBGiwlXjQcvKCjoZCs8YUj885FodR
 5AAd6CmBWuE1xlbDo/VdXhZws6CBIS2pIXLfY7uo4MxWEtGzUrud/lPob
 7ThVKA6hXUQbKTHMOWad/SSxBhuFzknZCbM+yJvLsiCpyqTlNMnDAsMId
 vKl+AU0JXVUhcvzE6Dx5em2Gz/prsMjH+DYLMahWacfgKJiMti3EMYV+J
 bFB+SPae9mBOiNLY9BUaI6EsSrH3zEaQG3qXvammBKXXl/xp/tSSnTALe
 goa++G9fmwBEQoDsmpVWZJuy2s2/MzIsxl9WiE5UkmfMl3lUJ59HY5GD1 w==;
X-CSE-ConnectionGUID: 0pwyrUQ7Qr+O0/JpV7iOog==
X-CSE-MsgGUID: J1+ipjpfQXWCnWmS2fiPeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7877175"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7877175"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 16:33:36 -0700
X-CSE-ConnectionGUID: 4KiLXUfiRqi0iKXAIxl0Ig==
X-CSE-MsgGUID: qbyPcAYiRYecr/Ujf3bZQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="24011074"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 16:33:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 16:33:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 16:33:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 16:33:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIIHI4Lk9I8R+3gtZN2Ti6DHU8WdFeJzVYZW2syI3Eekg50yzUkn0bbX3lO1Y4jiz3nrG4bGLmrBvLZQlEoR80eWMxZsgHSrqfcctx33Sk3qxs/y3P7n114Sy/QUxdnPQza8HJMoSExmfpPlEQ2ZwnBifXrVplFcYwq/Sdp+PKLfIF4wMFyLuRSzmX2XKc/9NZy+p/AXpLn9s493b8LE/B4M5yiiroWJYciKfjoqBDD7xWDN3vcw4GS9HzKC22EILmBVwy/Wzl2zk8AKUWyiciL/pNj7NsCPjPlMR8nmCpoV3dALoOb7oUsBEPpr514IZopTpmR1pEz6pilIJySEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwUJoxe/bGTH6Fjtcxpg710ACoa6MV+rAVfI6ho7t5M=;
 b=ni5lk+RCLBic03GQl88sY2JedQfqyiIqsRzMWQ/nFg+arPft0y2rzLRdoBOacGNID31568aY0FfbbhtS8n8M2gfukGpTCfsONJVcYTqfSKvHgME0twWz2MUYBU6iLw/ahTVnynBqE3Fx4o0ZG2ThZC4DNawdJedCMdydgtkt30milVpFo66GbHhAHzc0uUNlAXbRZrnboTDUUnH8Gb8Z1Kd4bJInoGRgm0MrI3zuuiNPG8Gj1Af6iTuPFuW/nxj0OTWDIEz952zfx9R9wve1AkP9tWQENvmJMRvGHlzGWY449QQLroHuy8oxbt5TPiQGuMoHFC5iBWPBRkP4MZpJVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7517.namprd11.prod.outlook.com (2603:10b6:a03:4cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 5 Apr
 2024 23:33:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 23:33:33 +0000
Date: Fri, 5 Apr 2024 23:33:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
Message-ID: <ZhCKOUi3cn+n2p8j@DUT025-TGLU.fm.intel.com>
References: <20240402122223.643413-1-tejas.upadhyay@intel.com>
 <20240402194017.GJ6574@mdroper-desk1.amr.corp.intel.com>
 <kss23fgx24bvhlarkvrivrvvh32pxugpvgavdo3tc4u55jmidf@rnr7terjza6w>
 <SJ1PR11MB62041F26676765342848070D813D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <7eac7b89-8c32-4261-b288-0cf2002b4e93@intel.com>
 <SJ1PR11MB6204AA1AFB30BFEF7EBAA3D281032@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <76010aec-7937-4e5a-afd2-672b338df8df@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <76010aec-7937-4e5a-afd2-672b338df8df@intel.com>
X-ClientProxiedBy: SJ0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7517:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /n1wrUwJfjHSRUcUFsCXxa8HKg6cCEo8hyMiu/W+zZunkMoOAop7mA2qLSTsD6HmKcJS998o6hKY0jaFv0/redNnpMltrAF1Q1gtPQs9CSjGiunY21SJ9uTRdTn1DNwrZFVDxlCY1IfF4E75WUYW9zgOymIRw4P8zxkP0VnvR/5gSj3qNjGgXBGaeQqTPxq8Cks/WDwij9R1N65HfnmpQ97o7ddd5ffbGWLErFdM0OgvUftUgt96NmOK/4lCDdf0JQ2PX08DP00F/QqA4pUo7qX2r2BrOaxPxbPR+iW3OZFe+EA5oXtLnhMR8UUTOResGEV3zBxqONFeINOLlcYJDu9fiB+FZsICe1UFZFD2jWdx9482GSvvWIv6MIRIKGk76SANJKEo9IpQKiJTsoFU9vLNXxkam9ALsFE6aL+cKMlmTqpMhh2cCB5APX+7YTTro0WYJKuURzuslrq/t+HUBlSThTNu9OR2BlbQ8hycPMzbU/Q7hmuJOiIK7vYqlZfKwyZt9GMmFPET3tv1bdDAyTID/VDmHjaa0nCKz5ZZOunJItH9O1qvtKlQYXiE55V16Tnzp81LYD1srRHX459KO2hsVFmZ+a1rOcGe2F5wAfJ+15Ne+q+AYrk00C+s0Pl+fFPHMDV8Sdx9TrcTE3VmrI2ZdiTSC+jembhJc/PunoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cougC3havwE+CNYtlzPfQXG4MyXJUOUGIsyo2Z2UnPBZCRQm+ZtvaqlcnQgT?=
 =?us-ascii?Q?900bo9T+XTHJATIBdvTDeahd4vMRu1WHRiZIrwxW7/vPg0AnChXjnVH9x+HA?=
 =?us-ascii?Q?kgVJMvtziNCzbWnfWY4TAawpbvXS+XsM0n7t651Ntcz/tMtKjx2/+D/gIUfe?=
 =?us-ascii?Q?Pzy0mDlSI5XmOzNR8goY3gkJVoUjIdMHnV4DqMVPi6xx0xlwZ7dR4B25mcFQ?=
 =?us-ascii?Q?CDvZ3xhTEOqG8Z2AKVVFNzcWKO5euca2odt/osFvS+NfzKWeSK87J4mwbciF?=
 =?us-ascii?Q?82IEkRQD7E53claYkXJRHHWFMDqtCDbgFJJ0pwU71jqU666ak9gNuhfZ0t6W?=
 =?us-ascii?Q?hmLw4yPmAYKWCes9SaiL89x5XTs36ReFkRuvZNYh8Zm4XpLJ2xOl3MFGwNFU?=
 =?us-ascii?Q?qhX2J3afSQxreQHBiaFOtE2gGYjXRDaXrTTEeNokA9D28CgWlWYR4P4n9que?=
 =?us-ascii?Q?7abhdsi+EQjDeThZd6/W0vajmn9uLXN6qBNWtfqO93h8vS7c31ss0XOLxcXC?=
 =?us-ascii?Q?sGjzSnFofIoTx5NseLdKyMNfWwvO2bTkLtBqod51kIkW2JcNKFGUvtsyji9S?=
 =?us-ascii?Q?amEXhWgRmQnuu1WDSnKvA27BFcQLDVP1Bre94gPJXuv82XoJTtdGPHJPUPTD?=
 =?us-ascii?Q?Ven/fI9nRQBKrXjnZbNJg+/Dy0sI5omKZRFfGUF/3nab9H4hsUc29WajCufq?=
 =?us-ascii?Q?tzj29KaRIRYoGcHF1sJwOBSVWOsdcKUCRoYDHxJsgm9FPTB/+r+TzkIXQ7ea?=
 =?us-ascii?Q?rgXh7M66Bxk5WTJN9y9zVcSL8QDRGm1aXQVGcquVUahZOZ10yybplk/umKBD?=
 =?us-ascii?Q?qOnVg4JY6qEabLmv5cNkxsnL+pKMVsJXY1oLO34i2SSiJf8DDjsxhBM2H/ag?=
 =?us-ascii?Q?Qe93RZkwxUQ2CwmqdW6N64imMlTez6DiOQeyZ3ZCQ8p8vsWbXyFtEBlqsMyd?=
 =?us-ascii?Q?8BtFEa66KOkU+/52DdexzUTuNcLB973jL0Pgy6Z2d8qiI+FCi/glTIztoLXq?=
 =?us-ascii?Q?1C9TvMsTPqxgcnOX9EodT5Wl08rxJ2tWB3JqytKEnnmfaiPFklgEJFmfAKTU?=
 =?us-ascii?Q?poKBYPgJfpmyr1zpgBt0hc8OP43vDsXdFHzOxjhYQ0ASrAAdIGcOBN+MKszk?=
 =?us-ascii?Q?irHTjx6o6fbJlEo1u7OoyqqFCyFnn7DZe+grorTzA4Dne21gE2KmPr5oqqXc?=
 =?us-ascii?Q?CxQN29w9KM9X+byFuzUJecbZ7etVJEse2ENsweHk44/4WU7E+zLBAIJEta52?=
 =?us-ascii?Q?jJp9i61qb8nXvlNKnhXFJ7hEVnHkQSYUS1M3pIR2eAsgxvTDEvSTj7yHLEs1?=
 =?us-ascii?Q?/V3DaI0pCcQx68XcPTMFDi3cAoLDdP34kY7eFqsm8z/wuOKpvK1ekHTxi/Vg?=
 =?us-ascii?Q?P74bBT29d1V9t1YmJTVOYL0qogybobEKTXHuqQvPyTDsPN4mDyxwyGHTfQUK?=
 =?us-ascii?Q?58DLjXTPXDJvXDeJcJvsaF7IVlwtBIL6A0lLhdzx5jh2JHVucIJrqRj3vFxp?=
 =?us-ascii?Q?UiIQBrW3mAcZa5ZAcoWDhr9ZBtaCsMZrUp3KWeQQRK2UAGCwfkMfF2A8wcEf?=
 =?us-ascii?Q?tVnfYwOjTfXFTZ4PVPYb7M/JMFReHegsQrrmgK+JFSicOYDIN2ldDFBTad/G?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbf7763-021c-4f48-bb82-08dc55c8ceee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 23:33:33.5498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eir+lUMHkhWGIycJ1v26SmqeEsw5lKT196yV8zZac3ZDfyMWYZ2Hlj/U2UOmFJicwfwRZDfSsmEX5Na9ht4YGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7517
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

On Fri, Apr 05, 2024 at 11:15:14AM -0700, John Harrison wrote:
> On 4/4/2024 21:47, Upadhyay, Tejas wrote:
> > > -----Original Message-----
> > > From: Harrison, John C<john.c.harrison@intel.com>
> > > Sent: Friday, April 5, 2024 4:53 AM
> > > To: Upadhyay, Tejas<tejas.upadhyay@intel.com>; De Marchi, Lucas
> > > <lucas.demarchi@intel.com>; Roper, Matthew D
> > > <matthew.d.roper@intel.com>
> > > Cc:igt-dev@lists.freedesktop.org;intel-xe@lists.freedesktop.org; Brost,
> > > Matthew<matthew.brost@intel.com>
> > > Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
> > > domain aware
> > > 
> > > On 4/2/2024 22:35, Upadhyay, Tejas wrote:
> > > > > -----Original Message-----
> > > > > From: De Marchi, Lucas<lucas.demarchi@intel.com>
> > > > > Sent: Wednesday, April 3, 2024 2:26 AM
> > > > > To: Roper, Matthew D<matthew.d.roper@intel.com>
> > > > > Cc: Upadhyay, Tejas<tejas.upadhyay@intel.com>; igt-
> > > > > dev@lists.freedesktop.org;intel-xe@lists.freedesktop.org; Brost,
> > > > > Matthew<matthew.brost@intel.com>
> > > > > Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests
> > > > > reset domain aware
> > > > > 
> > > > > On Tue, Apr 02, 2024 at 12:40:17PM -0700, Matt Roper wrote:
> > > > > > On Tue, Apr 02, 2024 at 05:52:23PM +0530, Tejas Upadhyay wrote:
> > > > > > > RCS/CCS are dependent engines as they are sharing reset domain.
> > > > > > > Whenever there is reset from CCS, all the exec queues running on
> > > > > > > RCS are victimised mainly on Lunarlake.
> > > > > > > 
> > > > > > > Lets skip parallel execution on CCS with RCS.
> > > > > > I haven't really looked at this specific test in detail, but based
> > > > > > on your explanation here, you're also going to run into problems
> > > > > > with multiple CCS engines since they all share the same reset.  You
> > > > > > won't see that on platforms like LNL that only have a single CCS,
> > > > > > but platforms
> > > > > but it is seen on LNL because of having both RCS and CCS.
> > > > > 
> > > > > > like PVC, ATS-M, DG2, etc. can all have multiple CCS where a reset
> > > > > > on one kills anything running on the others.
> > > > > > 
> > > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > > It helps in fixing following errors:
> > > > > > > 1. Test assertion failure function test_legacy_mode, file, Failed
> > > > > > > assertion: data[i].data == 0xc0ffee
> > > > > > > 
> > > > > > > 2.Test assertion failure function xe_exec, file
> > > > > > > ../lib/xe/xe_ioctl.c, Failed assertion: __xe_exec(fd, exec) == 0,
> > > > > > > error: -125 != 0
> > > > > > > 
> > > > > > > Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
> > > > > > > ---
> > > > > > >    tests/intel/xe_exec_threads.c | 26 +++++++++++++++++++++++++-
> > > > > > >    1 file changed, 25 insertions(+), 1 deletion(-)
> > > > > > > 
> > > > > > > diff --git a/tests/intel/xe_exec_threads.c
> > > > > > > b/tests/intel/xe_exec_threads.c index 8083980f9..31af61dc9 100644
> > > > > > > --- a/tests/intel/xe_exec_threads.c
> > > > > > > +++ b/tests/intel/xe_exec_threads.c
> > > > > > > @@ -710,6 +710,17 @@ static void *thread(void *data)
> > > > > > >    	return NULL;
> > > > > > >    }
> > > > > > > 
> > > > > > > +static bool is_engine_contexts_victimized(int fd, unsigned int
> > > > > > > +flags) {
> > > > > > > +	if (!IS_LUNARLAKE(intel_get_drm_devid(fd)))
> > > > > > > +		return false;
> > > > > as above, I don't think we should add any platform check here. It's
> > > > > impossible to keep it up to date and it's also testing the wrong thing.
> > > > > AFAIU you don't want parallel submission on engines that share the
> > > > > same reset domain. So, this is actually what should be tested.
> > > > Platforms like  PVC, ATS-M, DG2, etc. have some kind of WA/noWA which
> > > helps to run things parallelly on engines in same reset domain and apparently
> > > BMG/LNL does not have that kind of support so applicable for LNL/BMG with
> > > parallel submission on RCS/CCS only.
> > > > @Harrison, John C please reply if you have any other input here.
> > > I don't get what you mean by 'have some kind of WA/noWA'. All platforms
> > > with compute engines have shared reset domains. That is all there is to it. I.e.
> > > everything from TGL onwards. That includes RCS and all CCS engines. So RCS +
> > > CCS, CCS0 + CCS1, RCS + CC0 + CCS1, etc. Any platform with multiple engines
> > > that talk to EUs will reset all of those engines in parallel.
> > > 
> > > There are w/a's which make the situation even worse. E.g. on DG2/MTL you
> > > are not allowed to context switch one of those engines while another is busy.
> > > Which means that if one hangs, they all hang - you cannot just wait for other
> > > workloads to complete and/or pre-empt them off the engine prior to doing
> > > the shared reset. But there is nothing that makes it better.
> > > 
> > > I assume we are talking about GuC triggered engine resets here? As opposed
> > > to driver triggered full GT resets?
> > > 
> > > The GuC will attempt to idle all other connected engines first by pre-empting
> > > out any executing contexts. If those contexts are pre-emptible then they will
> > > survive - GuC will automatically restart them once the reset is complete. If
> > > they are not (or at least not pre-emptible within the pre-emption timeout
> > > limit) then they will be killed as collateral damage.
> > > 
> > > What are the workloads being submitted by this test? Are the pre-emptible
> > > spinners? If so, then they should survive (assuming you don't have the
> > > DG2/MTL RCS/CCS w/a in effect). If they are non-preemptible spinners then
> > > they are toast.
> > Main question here was, if this fix should be applied to all platforms who has RCS and CCS both or just LNL/BMG. Reason to ask is, only LNL/BMG are hitting this issue, with same tests PVC and other platforms are not hitting issue which we are addressing here.
> And the answer is that yes, shared reset domains are common to all platforms
> with compute engines. So if only LNL/BMG are failing then the problem is not
> understood. Which is not helped by this test code being extremely complex
> and having almost zero explanation in it at all :(.
> 

Let me explain what this test is doing...

- It creates a thread per hardware engine instance
- Within each thread it creates many exec queues targeting 1 hardware
  instance
- It submits a bunch of batches which do dword write the exec queues
- If the HANG flag is set, 1 of the exec queue per thread will insert a
  non-preemptable spinner. It is expected the GuC will reset this exec
  queue only. Cross CCS / RCS resets will break this as one of the 
  'good' exec queues from another thread could also be reset.
- I think the HANG sections can fail on PVC too (VLK-57725)
- This is racey, as if the resets occur when all the 'bad' exec queues
  are running the test will still work with cross CCS / RCS resets

As the author of this test, I am fine with compute class just being
skipped if HANF flag set. It is not testing individual engine instance
resets (we had tests for that but might be temporally removed) rather
falls into the class of tests which trying to do a bunch of things in
parallel to stress the KMD.

Matt

> As noted, PVC has multiple compute engines but no RCS engine. If any compute
> engine is reset then all are reset. So if the test is running correctly and
> passing on PVC then it cannot be failing on LNL/BMG purely due to shared
> domain resets.
> 
> Is the reset not happening on PVC? Is the test not actually running multiple
> contexts in parallel on PVC? Or are the spinners pre-emptible and are
> therefore supposed to survive the reset of a shared domain engine by being
> swapped out first? In which case LNL/BMG are broken because the killed
> contexts are not supposed to be killed even though the engine is reset?
> 
> John.
> 
> > 
> > Thanks,
> > Tejas
> > > John.
> > > 
> > > 
> > > > Thanks,
> > > > Tejas
> > > > > Lucas De Marchi
> > > > > 
> > > > > > > +
> > > > > > > +	if (flags & HANG)
> > > > > > > +		return true;
> > > > > > > +
> > > > > > > +	return false;
> > > > > > > +}
> > > > > > > +
> > > > > > >    /**
> > > > > > >     * SUBTEST: threads-%s
> > > > > > >     * Description: Run threads %arg[1] test with multi threads @@
> > > > > > > -955,9 +966,13 @@ static void threads(int fd, int flags)
> > > > > > >    	bool go = false;
> > > > > > >    	int n_threads = 0;
> > > > > > >    	int gt;
> > > > > > > +	bool has_rcs = false;
> > > > > > > 
> > > > > > > -	xe_for_each_engine(fd, hwe)
> > > > > > > +	xe_for_each_engine(fd, hwe) {
> > > > > > > +		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER)
> > > > > > > +			has_rcs = true;
> > > > > > >    		++n_engines;
> > > > > > > +	}
> > > > > > > 
> > > > > > >    	if (flags & BALANCER) {
> > > > > > >    		xe_for_each_gt(fd, gt)
> > > > > > > @@ -990,6 +1005,15 @@ static void threads(int fd, int flags)
> > > > > > >    	}
> > > > > > > 
> > > > > > >    	xe_for_each_engine(fd, hwe) {
> > > > > > > +		/* RCS/CCS sharing reset domain hence dependent engines.
> > > > > > > +		 * When CCS is doing reset, all the contexts of RCS are
> > > > > > > +		 * victimized, so skip the compute engine avoiding
> > > > > > > +		 * parallel execution with RCS
> > > > > > > +		 */
> > > > > > > +		if (has_rcs && hwe->engine_class ==
> > > > > DRM_XE_ENGINE_CLASS_COMPUTE &&
> > > > > > > +		    is_engine_contexts_victimized(fd, flags))
> > > > > > > +			continue;
> > > > > > > +
> > > > > > >    		threads_data[i].mutex = &mutex;
> > > > > > >    		threads_data[i].cond = &cond;
> > > > > > >    #define ADDRESS_SHIFT	39
> > > > > > > --
> > > > > > > 2.25.1
> > > > > > > 
> > > > > > --
> > > > > > Matt Roper
> > > > > > Graphics Software Engineer
> > > > > > Linux GPU Platform Enablement
> > > > > > Intel Corporation
