Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E881CD98C5
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 16:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA4110E38E;
	Tue,  9 Jun 2026 16:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeLVldxh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF66C10E38E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781021122; x=1812557122;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XQxK967MA7drAT9DE2QLtsgSgmAcBQak38qa8QhkazQ=;
 b=MeLVldxhDTq8pc8rMtENSRoQPwfTEUBmrU24jra2Xf576zmdZkcpQ0oM
 3f9G163Rq73/QXwl02cmYdLvXf3JPY1gxgykHJNrXwcUmLefdDARZHhJ2
 uEZV5uXHPQyRMh28B/n+T7T+yHiwXBXuLVjOxSwTc9CPua809CDIgab9l
 alAllI9AjM3ZTOIgg7ZdexPXBI07LYh0NeJ0j8Pwsg5Wn/ENCmT0qb0i0
 ctBoMabiA0zS3K0Bb8w+JfO6zsM+SeMgPfMOJZ1o6kY4+MOLnRgebszh9
 FY+7r+m/TlbsShjpqiyQBvljCDwg6F4Yfq5OHrvsN1z9SOE78MGun3VKn g==;
X-CSE-ConnectionGUID: b3Cl2zwOREW+LPb7UnjMRA==
X-CSE-MsgGUID: elvqiWrYRCatr+ddsnaNAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92108142"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="92108142"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 09:05:22 -0700
X-CSE-ConnectionGUID: 4leAIMYmRgmSpNkasei7uA==
X-CSE-MsgGUID: iTPlpgbDQheDiwxk/pPLlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="242939655"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 09:05:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 09:05:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 09:05:20 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 09:05:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiKjtN8+DFZE7iqnRV2s3bdZ7IfU47ycsoRkwcvLXey7u7we4GXKprVKGzjSDHZEH5riumRqqEyw+hmPBlWJCrVyYm9Gw2HeehJNyEOyrPEJZsugWyaDsxlDdF4E8q/4jpIjidTzOc3jZeILQikMTlFhNI1aNlFWIBBTWbjmFOGqFoQPZskkUSwJ/XJT9gsd2db7Abi/bBEPFFT2ds2Qfg3nBbROxGdvhXOPiCdBMObHJRXjEYw3YdCLtlkuTqtuVV633tBR+MwfpUf4LNkZoXG2InQVsILCTwo/dr2/ifdVxicNt7kc3GtgdCrPJncB5SwcLPD+obEJJiHyLksUOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qa6jKLpc2Cqr4Y4vR1aw4gfzGC2dDMyzPK6Sv2hM1AA=;
 b=KXC5v8P9re9UPAFJA+hRNimd0rAlhrs6DbnctrccNvGcO84N4gJJxr4ubpQ4uDZE5FUR0x9cDOMfwQBUssC1zMc66y3jUmmNRscRHJCgx0IsJRcnDteJCYaffMVYc16P50u5AlD4qfzrRNLHEsdu69/V1qJ1ZJlwhndQ0/vUauFFysIkZ1hCh2NbIYSi6J2MogxFn4RjUSDm+Lp3tgrKzpDlymSyE5+2GaKfk16M6eZzak1VDQjS7POufiz/YpUoVpa2JrXCQCqXF4c+GHZwvUaxonOfCMNxEPzdiMDjJ2aXaP7qUnbJiaxSOmfFefDRAaxlLripvMeNJFzNR8IQqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SN7PR11MB6654.namprd11.prod.outlook.com (2603:10b6:806:262::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Tue, 9 Jun 2026
 16:05:17 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 16:05:16 +0000
Date: Tue, 9 Jun 2026 12:05:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
Message-ID: <aig5uLonYEgjeZaA@intel.com>
References: <20260609144412.244678-3-rodrigo.vivi@intel.com>
 <aigyd1rBHQHc8FKl@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aigyd1rBHQHc8FKl@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::24) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SN7PR11MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 0836ff61-8c2a-4441-621d-08dec640e59a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PEsp1gs3YZXcjczMVtuiB1vITj94t3zbPEMRN1ooF9cSr/te4ELZ4SU39zjpcQ6Qdoma4a6SC1l1zR2tJZw5vftCKcNAkJcYbXI0VsLo6UcyVdRhPpO+2fi/UYJ/a0GJTuYUdzqxqAOTXjCJcDUXsCyqlFnDuUVU3aR/FlG7SpN1siJky/n5Nu++wRC8ZsqTiymk0Nnxy9qlgeTNMKm4CqijcdM/CVkDyf4LqWiV5VVGhvx3czvyDQdzUgB1mmaSbKCTpI5QDNevUBLDt8lR749vmUdvryfCJq/j04zsnD6uDDm6SPykUjaEo8zhLvPLua2iEKU1CljcTnerDldBDe/bhr74oeQhSxfXnjcVtq4K48NHEL7xyjWV3BDVBy/d00ulRFZ9KJmehKydp1YMaIsnDJMuPxihXO8KEh1M6a6HSjH0VKlvgApg3BhS5JEt7BVx/UoIojp1bguQLiOrilvQfYEsdfNypPwGXCJH56byaj2ih77yH8XLKuopltAeeMHwYlpBQNzZRiRy3VGM/75YaD0nJfKVYuQ/lKiERfp6FmqCIhpc5D05GhdckXaFWRYfAXBz05Gjlyz8NPcRCrExO7/YcqTe1xJ5v7ukdhQgQk8754Xd0vW/Zudndzio+SgOFtQVKqp1QlaASLf5wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDVBK2ZkbHNFZ2ttS2xFeXh5VDZwb1lVeEhYRmd6K1hnVkdEUWd6RFB2Tk4y?=
 =?utf-8?B?SjVrU2Zndi9HVHNFSCtTTjJaV1JkTFU0V0V0dE02VEJSbTRQTzc5aDdJeFN2?=
 =?utf-8?B?clZhUC9vSnJYd3BSYW1NenFiRXNGMklsYUdieG5Ed1puYkdQNW9UNHZyRURx?=
 =?utf-8?B?NHJOTU9PbWRsQi9GWkxkVER4eTQyaGpWOVJxQStVb2Q4aDFDNnZlVERVdUpq?=
 =?utf-8?B?SHR2cFNhMjhjaHlHNFBKcDlxNEpVRXJmbG1wZ2pvWERvdTBPaUU4ZDVqbnNu?=
 =?utf-8?B?WklKRUJ2THBWdTV3aDJ2WFNSNVRYcmVtaXNQZFFNdmlyazRCSkdPeDB3ZHJB?=
 =?utf-8?B?NXE3OFhsbDhKdWdLejdhUWJwYmlNbERuOUlHa2RXUERaczBQL3ZmL082TVVK?=
 =?utf-8?B?NUZuaEF4Sm93amVMTXNKTGNUN0xQK0pxZXZFT3RaMldLZ2tyZUxGTmdIQnRa?=
 =?utf-8?B?R1F6NGhyZTJlQ29XeXFTUTVNcGE1VFdUMjRnWm9TREFhc0N5VzhTSVVGbDlO?=
 =?utf-8?B?UmtWK0dtWjVCcTVnd1czRmM4bjJrN0Y3SmRrRXpyYUt3bVlPcnlSd2ZYVnp5?=
 =?utf-8?B?SlU1WmErZlFWRW1RZVRaT2FlVHVIODZwRnZVT1VVVkR2WWIzOXF5MGp1STZR?=
 =?utf-8?B?T2NwdzRjMkZ2V2RGa0xNWHVnQ04wNzFyaGJVSTlDZ0UrTFg3bEkzTyt4R2xm?=
 =?utf-8?B?c3V0Ym9yMTBXR3F0ejlKNk5jck00WGUzTmhJZDFsSUlPNUJuNm53UmdHUGRq?=
 =?utf-8?B?dThHUFRhNEJsNGFBU0RkaHBrdXFJcHZnQ056VjVkeFd1WEVFR0pXWUZ1K2FD?=
 =?utf-8?B?dzc5bFh1N2tSb2JFR0pHVkRvT2ltS2ttc1JQQlpsODBpclNSdXQ2MjJtVnRZ?=
 =?utf-8?B?dVJ4Ujl0UHBIRXQvTGRzdWxnWTJxNkVmWEJXUU9YS1k3dXE1L2oxTytuMVFJ?=
 =?utf-8?B?eks3SGNGTEp5cTlxTnZlZ2JMWmNYdU1ZcjlqL2ZOYTI3c1A2WTU0OEN2SVVJ?=
 =?utf-8?B?bjQwUDVYcTJZL2V0RitBVURGSmkyaG8yR1VSYVpCY0V5ODFuZ0dmYmlIS0Y0?=
 =?utf-8?B?NGFIMjBqYWxxRUl5SWpsMlk4Z0djMHJIdDErV0FnR0ZMTk1pejRnK01WU2VS?=
 =?utf-8?B?VEtxSmdkSXlzU0pjeFNtN25JSTlDanhKRUxTZFViV1NCdERNbm9PRGJwQ1hI?=
 =?utf-8?B?UnJLQ1UyNW9mc3IreFVYNU5jWFBkdnBnZWZRZG9wQTVuRjFTYmlDWFZybjdq?=
 =?utf-8?B?Z1lEdHVqWm02enE0dzgzZVFwdWxwNXd1Nll3REZSZHN4TTI1WG5iRDk0R3Zi?=
 =?utf-8?B?cGpaWVVuczIwSlJvSExIVktUdGpkQWZObXVIV25EKzlXeDVUYjFsVU9VYWZU?=
 =?utf-8?B?cFFQbndQU09pMmhQWVMweGMyUnJKZ3VXak1BRlFQUXdSNEd3aW1xZm9qV2Y4?=
 =?utf-8?B?VFFSRWdEUkFFTHc4OGFJY0lMN0tnVjdsdmxqVEtnMXRGSjlsT3dQY2U3Z1M0?=
 =?utf-8?B?aENDall5K2ErblkwZXIzbFBtZkZyb0UyK0NrS0tGT0R5MUFqT0E1OHhoK00x?=
 =?utf-8?B?Vnh4L3lLZVdYVWQxeDlOK2tjTmR1cUhWRFE0NWJpa2JuQnZRNzNuUTY3Nzh4?=
 =?utf-8?B?bE55RkJ5bEtzVWRJQSt0bWFtSHltVkhZck9MekJMeUJ5eENaUS9NSkE1cWE2?=
 =?utf-8?B?R3Z1NWJMckZ2NHRLWXpobExqa3RUbVhXdmhsbEF3Zy9KeHZGc09zVGpWcTFr?=
 =?utf-8?B?MUF0bkVVUEhwb2Y4aFFrRWx2NnJSUHNTM2pTMmlNcXF3cGNUUEUrNERadWt0?=
 =?utf-8?B?U2JWYWFPMkZKVlI5dkVDaDZJVDdTUXRIMEtpL1BjVDMvZ3BwK1MzbmxxOGVK?=
 =?utf-8?B?N2U0UDB3SHpaQVdGNWJVZWVYMnNicVBJMVlFai94c3BHM3RBOXk4Mk9nWmcv?=
 =?utf-8?B?WUx0RU5tVXJHVUFuUHV6N0t3VWF4YUpWdTFqRVY2N3U0L05meEYxcmlNaVNZ?=
 =?utf-8?B?dGU1clYvL1R6TVVCTlVnVUowTXNDNFV5MkVKbEo2VzluWjRYMURGNGxhT01G?=
 =?utf-8?B?cTJwdUZWcGRqYUJRY2JBOFF5MjhlWWdvNyt6dFVKT3lKOVhoenpBNjVsWnJS?=
 =?utf-8?B?N1B1aDdDUHBZMjVUQndxS3VqeERzUzFyUllsc0FMVHUvWUdQbDdnRlNFdHN5?=
 =?utf-8?B?WENsSkN5eUtvSmFPMGx0TW9zOHpKcUU3d3hqMVJuN1dTdmlkdXRvdjE0V2RM?=
 =?utf-8?B?YXBGWDdCU0JQZE05TDl3alQva3VWRWI3N2QzTVdvV05WbS9qc09OZVpLUHJw?=
 =?utf-8?B?b0FnRE96V1ZOdUttbG1XQkl1QVIzTFB6TlRvRDJIVDJEdUh5a09ndz09?=
X-Exchange-RoutingPolicyChecked: fy9VNz7fU50EmbNZDfHRnV5UXnDMuSIYjafY3mCjDoGcC0xm9gI5ACKGMBxB2u6y3+yGMV4YbGHe9jWSu33K4BEjhfhMgDrIuJO0CEjcoT4OblsZrhA48TecY3P8U/1vZtUYSKK8rr9Lldhqr5rWdaUZnZ2PFiVJ2vec9PA4+deu5hi2OjWU/f0yiTsCRBs4wGAUYaS4UO7BliMr2scbd+38r1m0VOgXySAYDxJK8jhvS8NZYdgng1G1dcYBxLoIY/kssfip6qIL5uCgNHiA+7RaoQfj4nFZLpOaJHx2+jDYD8HRRAJ1m4d8GGiwFgsK3U9DVph+cmnCYszWAz7pXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0836ff61-8c2a-4441-621d-08dec640e59a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 16:05:16.8815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9o4FzgGrAP4dlslThCRwvHwKD4W9djsToDfzih2CU4v9W3WFbckb1xT0Eqe9U9wTe0r/yxP+i+HdktqtgmWuGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6654
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

On Tue, Jun 09, 2026 at 08:34:15AM -0700, Matthew Brost wrote:
> On Tue, Jun 09, 2026 at 10:44:13AM -0400, Rodrigo Vivi wrote:
> > Jobs that GuC never scheduled were silently errored out instead of
> > triggering a GT reset. Kernel jobs that exhaust all recovery attempts
> > should wedge the device rather than silently fail, and userspace VM bind
> > queues should stay permanently banned rather than being reset and retried.
> > 
> > The queue is banned early in the timeout handler to signal the G2H
> > scheduling-done handler so it wakes the disable-scheduling waiter; without
> > it the waiter sleeps the full 5s timeout. For not started works the ban is
> > cleared before rearming so that guc_exec_queue_start() can resubmit jobs
> > after the GT reset — a banned queue would block resubmission and cause an
> > infinite TDR loop.
> > 
> > v2: (Himal) Do it for any queue type, not just kernel/migration
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> > Assisted-by: GitHub-Copilot:claude-opus-4.8
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 41 ++++++++++++++++++++----------
> >  1 file changed, 27 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 4b247a3019d2..5c40eee41103 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -157,6 +157,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
> >  	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> >  }
> >  
> > +static void clear_exec_queue_banned(struct xe_exec_queue *q)
> > +{
> > +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> > +}
> > +
> >  static bool exec_queue_suspended(struct xe_exec_queue *q)
> >  {
> >  	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
> > @@ -1363,7 +1368,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> >  			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> >  			   q->guc->id);
> >  
> > -		return xe_sched_invalidate_job(job, 2);
> > +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
> > +		return true;
> 
> I think there are some edge cases in the VK conformance tests where,
> with a large number of queues, 5 seconds isn’t enough time for queues to
> start after submission. Based on a 1 ms timeslice, this would correspond
> to more than 5,000 queues.
> 
> The current code allows a 10-second window, which is just as arbitrary
> as 5s. This isn’t a blocker—just something to consider.

Indeed. The ambiguous 'reasonable time'. But better this then the loop I believe...

> 
> >  	}
> >  
> >  	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> > @@ -1460,6 +1466,12 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> >  			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> >  }
> >  
> > +/* Unstarted jobs (GuC scheduling failure) and kernel queues recover via GT reset */
> > +static bool timeout_needs_gt_reset(struct xe_exec_queue *q, struct xe_sched_job *job)
> > +{
> > +	return !xe_sched_job_started(job) || (q->flags & EXEC_QUEUE_FLAG_KERNEL);
> > +}
> > +
> >  static enum drm_gpu_sched_stat
> >  guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  {
> > @@ -1608,19 +1620,20 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> >  			       q->guc->id, q->flags);
> >  
> > -	/*
> > -	 * Kernel jobs should never fail, nor should VM jobs if they do
> > -	 * somethings has gone wrong and the GT needs a reset
> > -	 */
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > -		   "Kernel-submitted job timed out\n");
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > -		   "VM job timed out on non-killed execqueue\n");
> > -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > -		if (!xe_sched_invalidate_job(job, 2)) {
> > -			xe_gt_reset_async(q->gt);
> > -			goto rearm;
> > +	if (!wedged) {
> > +		if (timeout_needs_gt_reset(q, job)) {
> > +			/* Retry after a GT reset; wedge a kernel queue once karma is exhausted */
> > +			if (!xe_sched_invalidate_job(job, 2)) {
> > +				clear_exec_queue_banned(q);
> > +				xe_gt_reset_async(q->gt);
> > +				goto rearm;
> > +			}
> > +			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
> > +				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> > +				xe_device_declare_wedged(gt_to_xe(q->gt));
> > +			}
> 
> This part LGTM. I have seen when a device gets in a bad state and kernel
> jobs fail (typically a bug somewhere else in the driver) kernel jobs
> just spun forever - I never spent the time trying to fix that. I think
> this should fix this problem?

That's exactly my hope.

Issues like Linus was facing here:
https://lore.kernel.org/intel-xe/CAHk-=whiv=b+dAvjaZDsZkfUEzjZMSSLExDOWVcbJ0exsCj6_Q@mail.gmail.com/

and some other issues that had similar signatures:

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7810
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7814
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7893
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8003

I don't believe that this patch here will solve any of these issues themselves.
At least not the source of the initial GPU Hang.

But at least the machine won't be locked in the infinite TDR handling
with never started jobs, what will allow us to debug the true bug when
that happens...

Thanks,
Rodrigo.

> 
> Matt
> 
> > +		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
> > +			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
> >  		}
> >  	}
> >  
> > -- 
> > 2.54.0
> > 
