Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FDDCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 19:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED65F10E253;
	Wed, 24 Sep 2025 19:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btE9NUjR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17B110E253
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 19:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758742795; x=1790278795;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2a5Q275BumMnRAxyJ5K/JWJLY4bcN2w/nl1975jFltk=;
 b=btE9NUjROzP9ETXuvcdWNNW+Oi1D93hzEZc0cogixqqCThFWTB7dQWZq
 hVXyjZRm9H0pQYgo2ZqZOed1hoqujGSKHMwREDs79uXC2o6LKioY8RaOZ
 dZzB6kAP2dCA79Z6Vu3ROjXfyXdzzSUBrvlsaFJo/RfEzvwXwRqw48xym
 3kNTi7U6HFnHGJydD6UDOvwuLorq9fzt1zLSVKrFHRJE53kaNj4Y7O8aI
 bWZcZ/eE4lcW0/ihYCFy5bOpkzLbyfOy1xgtp1qzBGca4vnjcH716NSks
 i/z57K7z5cFOT/pmK5egxiwaXsyLhCBz48wOnYtrA6Pz9JO9+XbKu4FLk A==;
X-CSE-ConnectionGUID: Gz5mIpt5Rm2MQzynlNdSNA==
X-CSE-MsgGUID: tTaxBgm7TBW/akSZW6s8Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61160901"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="61160901"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 12:39:14 -0700
X-CSE-ConnectionGUID: gcUsFyoDQiSHEz1x0zp7YA==
X-CSE-MsgGUID: Dc1ooiwkSuum9XlcLTaWjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="177509798"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 12:39:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 12:39:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 12:39:13 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 12:39:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ree5WE/8Bd+6CGX0nMDDCZfY1D5TlQJ6mhJ+4LfeLgCSSNKoOGr5+oa8MtWT+Hm7+tuQRhsWNHQLzIlc8p7Znw5+hll8lK1pJdO7Si4jlVfOu9qw7pwnWkmyDiIsolj4LuJ9m8ryedmDPTl5tesg9CJDVxB4ptxyOguGx8q3DvMNYg51iFTfzKYOrszQ6nKN9ZOBRqMVpbXaEGw3PTDB85acXha3DrSRIx8s4tWiABEN7vQISw35UztiYvFtxVw1qOM9mUxK3qIFB5lOazLSK3Hhs8wNxR7o8iCRUCx6+4Eo85heLP5MgA/8mhGPVsKkehue7aSPsVMEg0zpCfqr7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f84+royHC84krH9+jSwbSX87KJOxqfXwkFwb+xVvAHc=;
 b=NCcXxt+txBdyZE5WUZ8WBR3c3PDzmhX3Z6j35oU9Xccd/Xqxd67U5NqrjBn/LEN6vptQOmw+CQ3UWGPOGeTY7SkTOORSloDyUSGVOWW2goavYQ2ha02fllFl8oXplW0chu3IKhrhATkBoWH3jLYtGiUIFMsiHXXcUXePHTCt30wPW0Z7v0Qt00VLH1fswtTYMIAUbHd3lvwm3rT4UNJUdbuetMwAE9fLWsdg1IZBVXSBa3hLAbj6uQJcofCG+YMEqWjkW+fLZttBEO25t5MQJS/E8g0fbj0l+7UimZiJiZjJSmkkgqIkd/hGIJmZmx9++cd1VyF6Wa7SELp8nxabwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 19:39:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 19:39:09 +0000
Date: Wed, 24 Sep 2025 12:39:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 11/34] drm/xe/vf: Add
 xe_gt_sriov_vf_recovery_inprogress helper
Message-ID: <aNRI24axOgeDirc+@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-12-matthew.brost@intel.com>
 <30efe3a4-0598-44e7-90aa-5283ed8247f9@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <30efe3a4-0598-44e7-90aa-5283ed8247f9@intel.com>
X-ClientProxiedBy: BY3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:254::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 393b7976-a40c-49e2-cf10-08ddfba207e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HPFnxX0pE2r5rGnHLZ94ZVsYe+POXbXqRmtdOhUFt79I1cHWPSoyyarzQ50O?=
 =?us-ascii?Q?iy32DUqXfB2cqZHo7+bfxZPuznvvlh+ympGKfU+CLiTaRfeNKjukujOkTdyj?=
 =?us-ascii?Q?59/qKgfCjFaz2TmYArjIiY9Owbw8MKfnwSKToDlWl7LM5edZrduwaGHVGafb?=
 =?us-ascii?Q?To5YTwdM9eG2QWCqLfQi9RDXFNTt/tqv0jYsfWc4n2KE0Pvk7Ikf4wf59Ifs?=
 =?us-ascii?Q?1fXEKTSossuUl/BYMgvu/d3HdpG/Xaq30V4/g37b7fhV+7B9Ax2iAnRANt9p?=
 =?us-ascii?Q?eQHtOBkpJXdd9JkMX/fkmSka4x58L5jKS+bO26/6wtv8oFkk9mZiWILUj9i/?=
 =?us-ascii?Q?x00w+h/v6cISwVF02lL2qQBjmcsn1eAcpSjcWkZz+pLUW0uO+MtrWhIiyvRW?=
 =?us-ascii?Q?42aOj7MDFUNPjIChvZQsWVwIUO6JkJBRHLXMVWR5+4NqxGtDkwaKYtZW17Cu?=
 =?us-ascii?Q?YpJdIzV9+/EQvL60wQ2R6u4SpM9PQS8a/4qOjxMnmpshf9iW01H7JfugfpKe?=
 =?us-ascii?Q?l4UiMeBwcUJBFQDNWTzb9K8vzACaRG2RGyHq9YWUFCVzlqP/5iiMiZAMbFBO?=
 =?us-ascii?Q?UDatAXwDn0EKE7B5Z/kfmaOVRIJRs6wMuqJDzS34amw2jHe6z6RQd0uyOdxB?=
 =?us-ascii?Q?6+7UgFSXrE3I3ZU5v1S0zweFQ2heDemz71pszgHweOAFxhWp6qwocXlHLKtQ?=
 =?us-ascii?Q?eX41CCZ+H/gmbHBhWBN285zOc1/lt8Wnmf6ejaxms/taKfZNuR5ghcWHscIx?=
 =?us-ascii?Q?VYqdJNMQJCRFiTbnz3qDcKUwEVFZ1QoqYWnVvVXjFeR6TPf0UUWkCjmKe2+H?=
 =?us-ascii?Q?h75ehdzRgDYXPr6b/yEQV29VK77Ybve6weRoo4u1zc7APivCiFCM/h7n1HNZ?=
 =?us-ascii?Q?MiGNPvdXx0KneNBiUu7liGMrSALvO1129iScmj4vmGIrIMH5kyF365j2pQKc?=
 =?us-ascii?Q?lbZhsJTQsUVld05UlW/x5PmlcXhH3whZ554ve+QqnBlgKrbDsXWJbV0Wvyht?=
 =?us-ascii?Q?0wYYrVAa8uo02E2jbbTeCWzBW9qIpa1M1Gf+0hw5Y+Ptuh6MIlhFxiQdfCWI?=
 =?us-ascii?Q?/T2DS4+lC1677paUtjUhkdSavvfbRklZbuEo8ZCJUMKBhKwb5dSIAPfo6sjK?=
 =?us-ascii?Q?5s4OdNntLBDg/eQnk4vDiR6/wC2kHUWGxCIHOV59e2RCSSaef1AgJ9hNraMa?=
 =?us-ascii?Q?9NMXqGsJkIlOOQow0UWxbxGVOBXFXnWy7PcZVjyfbxgeH2s57VMbeVr3FSa5?=
 =?us-ascii?Q?1/5JSjTqdNUJQ7T96HV6KKvmdVSXwZLRZzSSkoUKa9DgFfmz7el82/GbFfic?=
 =?us-ascii?Q?YaUiavUFoSDYfMwUsLP6fdEYnm0U9Xy8wDKfAT+NUyk+IUn913j5Xd36IVj4?=
 =?us-ascii?Q?VU+rQMmRSVbwTG+onOjAEge35y17vGUc6W7BE0bQKBnK+O1TwUnstWNMKRrZ?=
 =?us-ascii?Q?2lvVSCj24Kg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y24CuouqpX9GbKyLZ9/YzAQxfx3e/zXFj6nCQwCnGrsWsV9oquDXBqwhXYfb?=
 =?us-ascii?Q?2aaKgmvdSKEhZHZbKmnVHrAD/11rN9yX19AZ0U8xguHv8sn6btKv9r23fizH?=
 =?us-ascii?Q?GB7FQ2tgIBVfV37EMtoNfLLtVu73I7CL44jxeiBCs20fgXuJ2t12SWHWB8j3?=
 =?us-ascii?Q?DHuYXqIvFo1NZBsCfX3N3lbzl0xKv6YO2M1SGkkA1G740nOsaa+8CRxZg/NX?=
 =?us-ascii?Q?CZ07t+95jFUyE0kKbi3yjWMqI1hTy820HUibpmceFLwm2e/OXPUUdqhnTpT6?=
 =?us-ascii?Q?QTq2kYGNlbDez4GtfDH8Y8DHTxWY0m4KnT+zpeb+yxNZ66/lZPDSs4eGB9ax?=
 =?us-ascii?Q?Y5hIFkQ99L1MPjOdyME/cUIQAPRzfj8usj5lJR0Xx1UlqymXwdK3umHA8o98?=
 =?us-ascii?Q?/FvAyCTxhsPR52M/EnH21sAjyK0m7wIrBeWC9yKBf7Hr4RBQ1cetl2zpMku0?=
 =?us-ascii?Q?3S+s25jCZWIukZFWK1MGvzxyh5fPVA7UhlFz/dPbdBXK3XSe4arIUntTdgB9?=
 =?us-ascii?Q?Xlp8F6WTutYmgrlNVgYQ293cph2LWVG9I8qYzUjFZ75Rl7Oj6+GTVmOlou4R?=
 =?us-ascii?Q?edhsuldDjgpQ9v+YL+I4QttmOZpeZwnPSWRViYa18GYUXh7k1LVRuRcJz/UW?=
 =?us-ascii?Q?Prf/3Xko07Iyk/hpKau6Cz/0SBVOUJhJ7NUUVP5QNWGxKaKbcKAROfmPxVBP?=
 =?us-ascii?Q?RdeUaStHw2H7risbOOVHogqOi+6XoxUpDv6/gEGhueEBacTqBra+wITSUcaX?=
 =?us-ascii?Q?3iqSAKMb9fePtMxyBwWQEK4Rij+slRTPVMpX8Z0uZwPp/9xANOtkZ4MZ0CcA?=
 =?us-ascii?Q?2Ne5xjV9WuIu/Fzx8w/kQXraE/HQvThbl9YX8BN3Glipe0JKyMJcGmyR04iB?=
 =?us-ascii?Q?yl8xQIwNDs7PqKkL3G/Ctv/YAkPUHZkyPVjcaA3wK4c4oSIiKGYpVnCY0HAS?=
 =?us-ascii?Q?FFKUYUNf71us5RVsi/A123Zp4Eot407OnzsnjKPHM0R7qoC6Fjh5jj1OUsob?=
 =?us-ascii?Q?1x90AaG2OuFaa8E03LzBpQsZZpTReJObkn+HCqPxoz/C28pVbMQFixbQTFLa?=
 =?us-ascii?Q?hhXV19we6bHvDgx1F6HUG3UC/FMdUf4/wCDtVjjGuW7QOhT54ytVm6XZ+DOS?=
 =?us-ascii?Q?HPK6UBtA+uuinVyeDpCgqcinvWUb752ObPUdIKCYcFt5qKtIqR6VL4xrksaO?=
 =?us-ascii?Q?fLtIRmlGEv8T91O3tQR4Mvzlnl2O5luGWU3RE45NV5i8tyMlTkk69Ijnc5Qc?=
 =?us-ascii?Q?jZWsL3tO2Yvvy0Q2XCNl7+7h23ybzb4eiugaKqEL6J420p0Q6UyS7BneWX6S?=
 =?us-ascii?Q?pYsw8xUvJ/7aDPXxQXy1Wq2ihD92crP/LlQq+RtHE4BDpUuzp/M9fQPdCpaR?=
 =?us-ascii?Q?HT65r/QaCP1MbIuzaYCm9IG+Qvj1B2/pQ6ILpGM7sSuCbhGU3/DQayBtN+01?=
 =?us-ascii?Q?h17sRrNy6ZdqR+JQ3AeS+cwmrgrCB/9jHYQkFeqC1qpbiDiVLr2GsTczaJU8?=
 =?us-ascii?Q?/XhYdjCZ2hTjICmTGjmYvxPRNdMFZQ3jJKfWm6L0hJu8a2HkP/SH14mEYY/r?=
 =?us-ascii?Q?ZL4Upr+FaEWuRy4Zk6Vv6ZN/K+vJ7Q1Qtq1iwl6XVxHH7IHjeZebLX/72pQt?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 393b7976-a40c-49e2-cf10-08ddfba207e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 19:39:09.4370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwLPh83ozMIwOZWBxEgSztKetofrTcMF9ar4oM2ICLkHWNALyQGx1GUJyk+SFgYaq+Ob9S/l2KosSodXqBW+aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
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

On Wed, Sep 24, 2025 at 12:14:28PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > Add xe_gt_sriov_vf_recovery_inprogress helper.
> > 
> > This helper serves as the singular point to determine whether a VF
> 
> hmm, this "singular" looks like a GT-level only, not global
> 

Yes, it is GT scoped. I will adjust the commit message.

> > post-migration recovery is currently in progress. Expected callers
> > include the GuC CT layer and the GuC submission layer. Atomically
> > visable as soon as vCPU are unhalted until VF recovery completes.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 17 ++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
> >  drivers/gpu/drm/xe/xe_memirq.c            | 48 ++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_memirq.h            |  3 ++
> >  5 files changed, 79 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 016c867e5e2b..c9d0e32e7a15 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -26,6 +26,7 @@
> >  #include "xe_guc_hxg_helpers.h"
> >  #include "xe_guc_relay.h"
> >  #include "xe_lrc.h"
> > +#include "xe_memirq.h"
> >  #include "xe_mmio.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_vf.h"
> > @@ -828,6 +829,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> > +	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
> >  
> >  	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
> >  	/*
> > @@ -1172,3 +1174,18 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
> >  	drm_printf(p, "\thandshake:\t%u.%u\n",
> >  		   pf_version->major, pf_version->minor);
> >  }
> > +
> > +/**
> > + * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
> > + * @gt: the &xe_gt
> > + *
> > + * Return: True if VF post migration recovery in progress, False otherwise
> > + */
> > +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
> > +{
> > +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> > +
> > +	return IS_SRIOV_VF(gt_to_xe(gt)) &&
> 
> this is xe_gt_sriov_vf function, so it is expected to be called only by
> the VF code, thus we should rather use xe_gt_assert here and the caller
> is responsible for the IS_SRIOV_VF check
> 

That is not how I have coded this. I blindly call this in various places
and I don't think it could at call site to determine if it is a VF as we
have if (VF) statements all over the driver. If perf is the concern, we
could move the IS_SRIOV_VF(gt_to_xe(gt)) part of function to static
inline and reset of the function in an exported function.

> > +		(xe_memirq_vf_recovery_irq_pending(memirq, &gt->uc.guc) ||
> > +		 READ_ONCE(gt->sriov.vf.migration.recovery_inprogress));
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index 0af1dc769fe0..bb5f8eace19b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
> >  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
> >  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> >  
> > +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> > +
> >  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> >  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> >  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index d95857bd789b..7b10b8e1e10e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -49,6 +49,14 @@ struct xe_gt_sriov_vf_runtime {
> >  	} *regs;
> >  };
> >  
> > +/**
> > + * xe_gt_sriov_vf_migration - VF migration data.
> > + */
> > +struct xe_gt_sriov_vf_migration {
> > +	/** @recovery_inprogress: VF post migration recovery in progress */
> > +	bool recovery_inprogress;
> > +};
> > +
> >  /**
> >   * struct xe_gt_sriov_vf - GT level VF virtualization data.
> >   */
> > @@ -61,6 +69,8 @@ struct xe_gt_sriov_vf {
> >  	struct xe_gt_sriov_vf_selfconfig self_config;
> >  	/** @runtime: runtime data retrieved from the PF. */
> >  	struct xe_gt_sriov_vf_runtime runtime;
> > +	/** @migration: migration data for the VF. */
> > +	struct xe_gt_sriov_vf_migration migration;
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> > index 49c45ec3e83c..94d5d6859aab 100644
> > --- a/drivers/gpu/drm/xe/xe_memirq.c
> > +++ b/drivers/gpu/drm/xe/xe_memirq.c
> > @@ -398,6 +398,23 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
> >  		memirq_set_enable(memirq, true);
> >  }
> >  
> > +static bool memirq_received_noclear(struct xe_memirq *memirq,
> > +				    struct iosys_map *vector,
> > +				    u16 offset, const char *name)
> 
> maybe instead of duplicating code of memirq_received() in 90% just add there
> the "bool clear" flag?
> 

Sure.

> > +{
> > +	u8 value;
> > +
> > +	value = iosys_map_rd(vector, offset, u8);
> > +	if (value) {
> > +		if (value != 0xff)
> > +			memirq_err_ratelimited(memirq,
> > +					       "Unexpected memirq value %#x from %s at %u\n",
> > +					       value, name, offset);
> > +	}
> > +
> > +	return value;
> > +}
> > +
> >  static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> >  			    u16 offset, const char *name)
> >  {
> > @@ -434,8 +451,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
> >  	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
> >  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
> >  
> > -	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
> > +	/*
> > +	 * We must wait to perform the clear operation until after
> > +	 * xe_gt_sriov_vf_start_migration_recovery() runs, to avoid race
> > +	 * conditions where xe_gt_sriov_vf_recovery_inprogress() returns false.
> 
> but the VF recovery "inprogress" shall be already set in the top level
> 
> 	xe_sriov_vf_start_migration_recovery()
> 
> even before the GT-level recovery starts, where is this race ?
> 

If we clear the interrupt it here, this is before the IRQ handler is
called which flips the software bit for "inprogress". There would be
window where xe_gt_sriov_vf_recovery_inprogress could return false which
is problematic.

> > +	 */
> > +	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
> > +				    name)) {
> >  		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
> 
> what if new MEMIRQ will arrive just here
> 
> is it ok that we will clear it immediately?
> 
> the whole memirq flow is that we clear irq byte first and then process
> it, so if anything comes right after we finish processing will be noticed
> on next iteration
> 

I don't see why that matters in this case. In either case multiple IRQs
could happen and single IRQ handler runs.

> I assume any races due to double migration shall be handled on the VF2GUC
> communication level while sending RESFIX_START/DONE, not here

I don't think it should be possible to get multiple RESFIX_START IRQs
before DONE is complete. This existing code upstream seems to handle
these cases, so my series attempts to handle this too, but it seems like
something that shouldn't be possible.

> > +		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
> > +	}
> >  }
> >  
> >  /**
> > @@ -460,6 +485,27 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
> >  	}
> >  }
> >  
> > +/**
> > + * xe_memirq_vf_recovery_irq_pending() - VF recovery IRQ is pending
> 
> this function isn't really using anything VF specific except that on the
> VF the SW_INT_0 means "migrated"
> 
> maybe we can drop the _vf from function name?
> 

Sure, so 'xe_memirq_recovery_irq_pending'?

Or 'xe_memirq_sw_int0_irq_pending'?

> 	xe_memirq_pending_guc(memirq, guc, bit)
> > + * @memirq: the &xe_memirq
> > + * @guc: the &xe_guc to check for IRQ
> > + *
> > + * Return: True if VF recovery IRQ is pending on @guc, False otherwise
> > + */
> > +bool xe_memirq_vf_recovery_irq_pending(struct xe_memirq *memirq,
> > +				       struct xe_guc *guc)
> > +{
> > +	struct xe_gt *gt = guc_to_gt(guc);
> > +	struct iosys_map map;
> > +
> > +	if (xe_gt_is_media_type(gt))
> > +		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_MGUC) * SZ_16);
> > +	else
> > +		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_GUC) * SZ_16);
> 
> nit: maybe just calc offset conditionally?
> 
> 	u32 offset = is_media ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
> 

Sure.

> > +
> > +	return iosys_map_rd(&map, ilog2(GUC_INTR_SW_INT_0), u8);
> 
> as we have helpers we should use them
> 
> 	return memirq_received_noclear(...)

Sure.

Matt

> 
> > +}
> > +
> >  /**
> >   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
> >   * @memirq: the &xe_memirq
> > diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> > index 06130650e9d6..476b8cba179d 100644
> > --- a/drivers/gpu/drm/xe/xe_memirq.h
> > +++ b/drivers/gpu/drm/xe/xe_memirq.h
> > @@ -25,4 +25,7 @@ void xe_memirq_handler(struct xe_memirq *memirq);
> >  
> >  int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
> >  
> > +bool xe_memirq_vf_recovery_irq_pending(struct xe_memirq *memirq,
> > +				       struct xe_guc *guc);
> > +
> >  #endif
> 
