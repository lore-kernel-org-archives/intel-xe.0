Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E1ACA0ED1
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 20:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04BE10E280;
	Fri, 15 Aug 2025 20:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Od5d1HGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAE210E280
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 20:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755290926; x=1786826926;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sd+BxSoTHM2m+5ofpIpfOG+g3NDPVg3JDe9cMMvEnSQ=;
 b=Od5d1HGPmr5beC+kuHfLbmzEqoPUuQEjGSMTYfonTJcr+CX8Dw1z5gql
 HPGX0Mqa4LkM1W7s0cRqeqDmfQk7ZMI7N17XWAnJ2rf9gnZvK/SWVju9Z
 7w3kUxL7pYpmDTVvd26drQlekgdKt5nQEpaI2168GqusDBCA34Zkwvnc8
 jXoGhN0/3Sg9IEVFF08U8cVKL5QGKWaGZh7LHUkjP9y5OtjHoUr8D4SfI
 X56XFI6gP5OVMRzznHOf5n2pz9nCgaleJ7Wo7GLonrYEBBgt17G39RrVR
 8m9beFkFAWBhrw/RVXu/DLS+7o5HJQPrKfD0lJMH0pK9gBZg42+7H8WlJ A==;
X-CSE-ConnectionGUID: 5upp+ryNSyyYd/x7VveKlg==
X-CSE-MsgGUID: bQpaZ9EQRqe67FNlc6UtVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57525767"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57525767"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 13:48:46 -0700
X-CSE-ConnectionGUID: tLb+YJ6eQQOuDcfVEPNusg==
X-CSE-MsgGUID: ymq/91XjSb6kwi75gCYXqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167905659"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 13:48:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 13:48:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 13:48:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.83)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 13:48:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+/8Pxc/ss4URw22fI/sxNZspOaAHxZwxHdQPVeyMj7MFCc0Q6hbbKxL6wblBSbgaPDJDlfPhfcZl2kYKS1z6CIZVzz1iyMtgM1NKJR7UI/2FMDZ4PfgRGVrZbjhKBxQsqZ23CK8e/RIpxxY50bvGAsMhjZeEzPWBTuUwdoLSTqz7xgs+jkZeabGDQ9Dqv+usjL1oJNMVeCCNSFHARVW45TBjfycrbvI8wZARL77BYKbewT7DKooG5oU/IMm1HLc2t92+uF5my9LE6Ew4PxlKzF8hbj0odirCK+/hf5MRlGXQax/bzx6mG6D3aIu1q5VcrPnp2JuHRQ2Hsd1d0MxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMuN+3yEes3wQ0dy2CRs11cvquwHcFUxoydEMm0MUcw=;
 b=lH8ZslpClxlsYSQm9cZSEORpZmbpbkIX4JzIttqBVjJrEFMC4g6RWeSzvSGqdQPwrcUAWmNNlw0fV0ITJ/8Cbiws0PkZzxqsnqYS73TrjUc5VsLJMJ3fzpgGapSoD+VCrn1DVNuocZ2+EcjyvrMSY4i6mpbnWRvfEArnB8d2QOPW0dlX3JiIISOExJI+cTACepKifQA4uGrZ1P6MCyLZV9irLPApKdnuLdFPVbKrVfOnpZ5+yYEXdLCaBqSoJ0VdNcdLrE1fZweXOPvv/MogHgFXzrwZ9rsjTscXX2+SNoCQmiW0k8G9Nzcno8A7UKk7T4Eabax6KefjTr4EDJa9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4768.namprd11.prod.outlook.com (2603:10b6:806:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Fri, 15 Aug
 2025 20:48:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 20:48:42 +0000
Date: Fri, 15 Aug 2025 13:48:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kassabri, Farah" <farah.kassabri@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Stop the TLB fence timer on driver teardown
Message-ID: <aJ+dKGznmGTK9tRf@lstrano-desk.jf.intel.com>
References: <20250813194806.140500-1-stuart.summers@intel.com>
 <20250813194806.140500-3-stuart.summers@intel.com>
 <aJ0BWL5lxyIOjHvj@lstrano-desk.jf.intel.com>
 <aJ0ChtKtA9O8vcVv@lstrano-desk.jf.intel.com>
 <ea6baee7c2251d5c3c1a7f382ec7eb03fde78fb2.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea6baee7c2251d5c3c1a7f382ec7eb03fde78fb2.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0097.namprd04.prod.outlook.com
 (2603:10b6:303:83::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4768:EE_
X-MS-Office365-Filtering-Correlation-Id: 687594b1-15df-47b6-be50-08dddc3d1ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?qz9+SWzUfu+X9LqsECTGkAxv/TRVcGmoywr62uzt7Rzw8b1IBbWIvITTVM?=
 =?iso-8859-1?Q?a0vTfBjja+bPO+fqkaelyZZX81JaLE4iD/t2PaoRcYM0nXbat7Ax3J9uQw?=
 =?iso-8859-1?Q?CGNp2cMHtBYehIZJkVdkD5SG3qLh+JGIbcEQl1MCO4QIwxJcBlboXavRJm?=
 =?iso-8859-1?Q?iFQT21AynklPraUCxtRWg4a7bVEqtza8P7AbOXaGmoDPLG6G3+AIKKssWg?=
 =?iso-8859-1?Q?eUxZVok5CYIaeDVCP8wDaIUUwz9F2gOAZ7EuEiX0tVtrr8DBne1rCIAgmM?=
 =?iso-8859-1?Q?QzbVRw5qD3Cc+gJMomOYoi1/bud9Sb1ryn0i+dZw7oHfWKfvE77O55pnbV?=
 =?iso-8859-1?Q?jBXkOIkaopsEitF2RGHPSovYsTYvH+1IV6/Hs9Dm+Tzy4LzCcYT9az1dwu?=
 =?iso-8859-1?Q?ii1O77rIEp3SDsHAiPb8AXRRaRpuwjnKHh1kGCrv56hY+hyadAgPd7Z/fm?=
 =?iso-8859-1?Q?euLi5hin2rhvz58PmJwTsxEe2lKtvYpN65sYMggJlUmXZa14Cwp0g58rP6?=
 =?iso-8859-1?Q?QuWMkO2eSHPdr2XqiVTTsVMIDvv5PzC5R9QFOBbPTToB7N1yZfXUxzlP+R?=
 =?iso-8859-1?Q?fJ6aCQhfwt9M45jolIg0IfPNOwnvYT0gogZDKPfYdb3Y6/EBMJrmtbleVH?=
 =?iso-8859-1?Q?iOMOFIgEjnM0yNCXWTscdJ2Q1BE5/uYxVQo3qRM3RR9uLKTGzZEVrcfZRJ?=
 =?iso-8859-1?Q?C2G8VKFbPQx8tVvYFNdE0A0b1I6BCXm21Av17VRELbg9pIleXEilvrSRy8?=
 =?iso-8859-1?Q?Bc1ui76P9b7/R8baYFedx/y2NcwVDQmRc7aaXIureFXt4V1ZpECfVFHjKd?=
 =?iso-8859-1?Q?fvvB4pOm7Ft6Xupf5sHnohedzjn+vbYIJ3PmsXbKarxKxkMI6q76vXmvyr?=
 =?iso-8859-1?Q?KN9otCoVTG1TVUv6KKH+8hlly6mBhfU4oVqsMtlF+dZQqGsI7evgiBBsp6?=
 =?iso-8859-1?Q?Ny3eN7pUbISvbtvXY6qZomHLJNzT7egIQvWb5agbuCPYMHEt6p3HQcE1FE?=
 =?iso-8859-1?Q?g3amjJIIjd43ZAJZEB25SgZ9lRKp9VsxIVoCK05TloZnSbtct78QN9vzJN?=
 =?iso-8859-1?Q?cw1+hhPDYEeMxHoo4tp2q1g9S7qCRoPt7qKn1ZCc0l9rsjxoZJjeTPl8Fc?=
 =?iso-8859-1?Q?iv71TTpyf2zc2XJrheyB8S9ioNabgOWlKX+04LHN/6R6S5B0+EH+rel6BL?=
 =?iso-8859-1?Q?EQpDcKqfigmWWO96TXL/YMBC0wYk6vx7w67PxKcFfw562KNiPk5fkAjlTn?=
 =?iso-8859-1?Q?iyetqvfZRtCwvduou0rQEs+v799/D5VJQEoFcYyMqi3hKT7QIr1xXppQqO?=
 =?iso-8859-1?Q?nOQyYdzuSC0IExZKInQZ06PFi0q/dLGFH/815JE4EzEx/z8gf8QINeFJWI?=
 =?iso-8859-1?Q?Jzzqu4edWZEc6+9pO7jWFQ371ik6R0QUVy0auHI/LnfEFTS8div4c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hsN92z58aoWZsLZ+G3dc0xYA6roldP5gmA1bVXtyCyzTkjzQ/3nVB7boFa?=
 =?iso-8859-1?Q?WMiuZ4i+kcghT/Kt0jSEkI9avQ4ld5hl/0mDREWJbLho1XStodE8W9G9CT?=
 =?iso-8859-1?Q?nPjT68QiOP4C1ES99+6Z1wI3/EnbOa6/6nyJxQn/v0kf14ebZsUOv9keuf?=
 =?iso-8859-1?Q?JyDscrRl6ZeO/DOSuUTuXBqEhMi6DOx/RCqjLU7mH+zHG1bafPLeDOrn+6?=
 =?iso-8859-1?Q?DOB40k8wlrDXoL+KLnlAZVUvuqCGMop2z8BERN17r29xSpud6Py8409lp+?=
 =?iso-8859-1?Q?dEIz67vpOQHoUFhxkQBije0xV2bxidXfm66aSO9R7p6Q66++PKeXlEldaz?=
 =?iso-8859-1?Q?ICYqHuz7I/Z5b0nFxmniKjXmLXA87Hw3i11avxPgxPCw28RQDXeuAw57L8?=
 =?iso-8859-1?Q?F1Rcz3VpbZzXZdqlrR9Cg/13wdshwzQJwTi8uRYyunwiFQ5RcphYEiZmLV?=
 =?iso-8859-1?Q?0Yxefl1ArLir+F858qnFCerVXOfoi+mmWf3WitW/1rREyLz35aUuBitcBK?=
 =?iso-8859-1?Q?m0boVcogzb9Mvh9NQ3VHouEEJ4HzWR15Kal7KSp98qc1Dowt4EM0IwlJ3Q?=
 =?iso-8859-1?Q?eoEtWQB0pdFjxYcvkc7EcOP/+Pht+YkFuMTUvXdwGTpgbHIALw70bgIegq?=
 =?iso-8859-1?Q?UEI0h+alxJtGsfkA3hbDzCkyRuIh2Sz4rYI8UPlhcKsQs4YqBW2tT5pv38?=
 =?iso-8859-1?Q?DOLv+GoPCWNiYFPGKSMVLQzV60qVaiR2S3dqK2B455+TeCehMjHHiKgxJe?=
 =?iso-8859-1?Q?fQ2B7w41OUeOl2HjtMA5WS2wyDFkjvVlS6xC+xb0DzmXstzzFy4snf+pd7?=
 =?iso-8859-1?Q?JJC+KdDYe7tf6U5x6nzFVfeo/wGHvrDKqvf6KXaYgy9aQgpstNH79YFLBh?=
 =?iso-8859-1?Q?XbEexETdojqeh/jrXpJTicOByiDfmw+sdToIKYEFCVaLUSw+dr50Fn8PuG?=
 =?iso-8859-1?Q?WeGojIw7HMlBKLeDbwnNiXoweNW999u3m4FNRt8E79VeNH6XcNtNPSI/mr?=
 =?iso-8859-1?Q?ZR/vT7cfyQvczPmJoNLecdbfy/O16mbYdkbMXjOMfE1QAv/dEa+W085lO8?=
 =?iso-8859-1?Q?Jf9Gai5l4aBnvwIfxCY6eeJVu18BK7xT55JhUpAQJyfbPo5nKhc0WPCadu?=
 =?iso-8859-1?Q?0Kl9RlLu88+slY+03PRaPvLwEhGYcszpw3RrEAudKntWp8dhNz4L15PSuX?=
 =?iso-8859-1?Q?Py/8HeV40V16iC1kOLs7Iu1uQx8ASkD/JL90oAOg9x8GN59RPvvnRdSwIt?=
 =?iso-8859-1?Q?OFZn2zwhLT9Z9VQP5asgsaIdo2NHUr3bBd7W56EbIV+H3nfDDvZKG9JM3o?=
 =?iso-8859-1?Q?NOtW0xFoKXBdXyTQgfzl23xswqnGqbfA6T/JhHpr2jcU7RLhdMauePHiR4?=
 =?iso-8859-1?Q?TEYKTQs8At7O2MomxoZxaN4+NiAZUn0j/Bdvq89eUx9k7OHXlHASsHhcRh?=
 =?iso-8859-1?Q?p4JbGArbZLI58fN1GUlzb5m1LmhTDT/Jvad1YM7JUnIcvaKIwov07SFHtI?=
 =?iso-8859-1?Q?H1N1P4L2sykhsTHJ8mOUGhhvwduLABJvhPocP7WMiJrO6DmOYSPrtYcjDP?=
 =?iso-8859-1?Q?scmu+2a2zTiDkJXxE/ulqmLDS4Rta0Q3KfTBLH1sQZ/qFMQSXRSunQqDCm?=
 =?iso-8859-1?Q?UpVF/FjdqDGFobTTzDkqRE7Yz2H1idjjx+Ib840z2HmjPMOZLQc2sGVw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 687594b1-15df-47b6-be50-08dddc3d1ebb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 20:48:42.4872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVgkqAELnFnQAeka20iv5szVgnralXqqVPqZjOn0/0NN4tvAfz/HPlsN33+B38tAt0ttNmGo0p4S145gVZbphQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4768
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

On Fri, Aug 15, 2025 at 02:33:43PM -0600, Summers, Stuart wrote:
> On Wed, 2025-08-13 at 14:24 -0700, Matthew Brost wrote:
> > On Wed, Aug 13, 2025 at 02:19:20PM -0700, Matthew Brost wrote:
> > > On Wed, Aug 13, 2025 at 07:47:59PM +0000, stuartsummers wrote:
> > > > There is a small window of time during the driver teardown where
> > > > the TLB invalidation fence->gt is set to NULL but an invalidation
> > > > worker is still alive. This won't cause an issue currently
> > > > because
> > > > the tlb_invalidation structure itself is still present. However
> > > > as
> > > > part of a future refactor, we are looking to split that structure
> > > > out. To be safe, go ahead and cancel any outstanding TLB
> > > > invalidation
> > > > fence worker thread on _fini() since at that time we are already
> > > > tearing down the driverworker thread on _fini() since at that
> > > > time we
> > > > are already tearing down the driver and don't need to continue
> > > > monitoring this.
> > > > 
> > > > Signed-off-by: stuartsummers <stuart.summers@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > index 75854b963d66..08e882433b13 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > @@ -44,6 +44,8 @@ static void
> > > > xe_gt_tlb_invalidation_fence_fini(struct
> > > > xe_gt_tlb_invalidation_fenc
> > > >         if (WARN_ON_ONCE(!fence->gt))
> > > >                 return;
> > > >  
> > > > +       cancel_delayed_work(&fence->gt-
> > > > >tlb_invalidation.fence_tdr);
> > > 
> > > I think cancel_delayed_work_sync is what we want here.
> > > 
> > > Matt
> > 
> > Wait, I was thinking this was the fini handler called from drmm.
> > 
> > Would it work add drmm handler for driver teardown that
> > calls cancel_delayed_work_sync and signals any pending TLB
> > invalidation
> > fences?
> 
> Oops, I'm just realizing I had only replied to you the other day
> instead of adding Farah and the intel-xe list...
> 
> Anyway, yes, I agree with the drmm piece. I'll have something updated
> here shortly, just finishing up a little testing.
> 
> For the sync vs no sync, I did some testing and it seems like on
> teardown, we're in a race for doing the work cancel here and the actual
> teardown of the worker structure. So calling sync has a chance of
> hitting this WARN_ON:
> static bool __flush_work(struct work_struct *work, bool from_cancel)
> {
>         struct wq_barrier barr;
> 
>         if (WARN_ON(!wq_online))
>                 return false;
> 
>         if (WARN_ON(!work->func))
>                 return false;
> 
> Also, at this time we don't know whether the GuC is fully torn down and

If you are aware of this series [1], we should be tearing down the GuC
CTis very early in undriver load which has a side affect of immediately
signaling any TLB invalidation fences. I need to fully review this one,
but my initial thought is this is correct.

If drmm or devm handler here is run after the one above which cancels
the worker + signals any outstanding TLB fences, I think we'd be good.

[1] https://patchwork.freedesktop.org/series/152870/

> at least I've been able to observe in testing that active invalidation
> requests to GuC can still come back around the time of this cancel
> delayed work call. Meaning if we try doing an early signal here, we can
> run into issues where the transaction is already signaled causing hangs
> on driver unload. So IMO we should just let the normal GuC teardown and
> TLB invalidation signaling happen. The only thing missing is to cancel
> any ongoing timeout handling, basically. So this cancel work call is
> just making sure if we exit while the CT communication is held up (like
> on the error injection case here).
> 
> I'll have a little inline documentation in the upcoming code update to
> describe that.

Yes, some documentation would be good around the teardown sequence,
timeout tracking, and what happens if the backend is disabled. Feel free
to take a pass at this, do it in follow up, or ping to me to help write
this up.

Matt

> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > 
> > > > +
> > > >         xe_pm_runtime_put(gt_to_xe(fence->gt));
> > > >         fence->gt = NULL; /* fini() should be called once */
> > > >  }
> > > > -- 
> > > > 2.34.1
> > > > 
> 
