Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF2CCD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 17:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC73B10F7FF;
	Mon,  8 Jun 2026 17:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGG2Ei/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D585610F7FE
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 17:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780940605; x=1812476605;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eo7Cg48lNXleys6QWBnYK7XYDOdZbfM5PYeiIZoDw6c=;
 b=oGG2Ei/+dMDGgBu7Lp5SAflyEg/JdkVsEnOjszOcXRJjq2ZcMQDHIEPJ
 ud0bhW8ZTdkMndU22ROQMZJw5VZrGSGFUgtWl96zdlxH8+fD2U3Uik4d0
 OPeHR68t7vOjCXjhq1U27/ysuJ31nrOWMtAKmdsi8zvS8w7ZWI8Ni1nGo
 odo+tupjGe0ZTYtakPicYgnFnQwvU+u1XaWqrWPReYD9WadJWskKaWRD5
 ZxeKowate70JyGbK3VbEEdI5m9cLaB7THEe91jIWhOf/tD4qUGWhdFn8V
 FGyckAe9ObB5B8YsJ0VVpTg7QMoMkitVHNsCEuapKDf0mI9lynlD9KoLs w==;
X-CSE-ConnectionGUID: 1webz31CSQ2HS94NLrZEmg==
X-CSE-MsgGUID: be/H5YFvQES/BxWgqHJuAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81801593"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81801593"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 10:43:24 -0700
X-CSE-ConnectionGUID: x/vbW5gyT7OBpZvvEbDrsA==
X-CSE-MsgGUID: txHOUypBTkyGtDTdsXaX7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="239284630"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 10:43:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 10:43:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 10:43:23 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 10:43:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jW8SRtF/E27QQXSIW5DeOK18YLVZbbivdlhISd7GlK4FY0uD+tYZe0Mw6f0pF/6qe8mOwJlV6OJR2LJkbch75w1s/JubGOxbjruTWTvh7ty1XgQY92z0JqBa4QvW9UELg9LYFX13i8GS8WUldDWPe+ZlRdFbAE6WDcpe7tddR6ayCaeswal7f8QHR9wWFN0fN+pNi6LNC09N2zOA5eKkJS7HUYWGD65b2t7qwvjX20G6FUkZXFiugTcpruFZKZ/jHnhcnvLKcU0nxcV6eC9AWi78gRrtMKXSQnRsqQ2jakKnIunhSjlCWhJKMxQOq/N0K3nFaWIuLr++rIwSEFNhcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aBdrUDBipVoLcSQk+8E+KIHnJ8kbTQbyrj3r98XiH4=;
 b=VU/dYwwDSjep61dxfua6Kz3BmR976pmMfshxB1EbaVxWS0+Cx86HJk9aq3uaX3c3/UPoFPdzM7PQaX8Vd1RIWk1zhenTjF2+wnGKJX02/2Lyw/eUhwrVElA9YC5YQXb9teFLE0ihiHjKwr1vjnbUt6gCORccsO4jHu97ItW8kpulY9rj+3GVuH50kqlMPnXA2wejwUicV6+tQ2GIYXzhZtdPw30g2YlVefVa23oXHtBTLOpcr6/YTKd+76w9c6k3EJINeokfWSm5oeV8KuwejBnYSvODC5hRQGK5oPLDXWGP1mpNSiyWgwn11HtRNI0cYjc24II1Q7WVQc+OslGpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5874.namprd11.prod.outlook.com (2603:10b6:806:229::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Mon, 8 Jun 2026
 17:43:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 17:43:14 +0000
Date: Mon, 8 Jun 2026 10:43:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix use-after-free race in xe_pt_zap_ptes and
 xe_pt_zap_ptes_range
Message-ID: <aib/Ly7js2PO6NCm@gsse-cloud1.jf.intel.com>
References: <20260605105202.1664464-1-francois.dugast@intel.com>
 <aib8+iiirtA0Wxz/@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aib8+iiirtA0Wxz/@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0090.namprd04.prod.outlook.com
 (2603:10b6:303:6b::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e133b5-8d20-471b-4c30-08dec5856a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yl+TiKY8ofk6gofO9jcovcd8Az9GXd6cdQYc4za5PjkX+hp/F4s9PkqxWihqZHVgVGOqhtcUKqL98r0+L5HBsH9BBw9ozuUoIMxtJhPM89FtO+/GvCoHNgF39XT16TSDzBTkR650VyjCKRj02G+ZCQK71J+K2IseAzaSJSCeAJU3ybdgDoBoK+1ujmSiXXXsMDY/zK0+Eb1MAMFqxfLRZ1C0XopLbp+ZV2vMXa94HcTzsWbwP4nxFoJ3kkEbuiS6CqBtSKs9Eu6uD581t9anPcZJNAWTpmD0iSxbdvMfvoG3FdZ9pEfzgtxM5vErj7x1A8hOYEeYrgmqS+c9YgbpBsnMxRC39L6rb7UNlrywKTAJyGsnzLYUzpT9XHQ5zzSnpKETE51P/8Vx4ykEl34LqPWw46he8nOfsQ2sn+CkHYmG4OsvygnnsujljnRBgrNUxhsDLIqW/Nc0PGCwBWP+19AcmXMpxZFwOSyzU03WHBSLuDSKNKtHM6X7fW3HCjWQ3K9mO+jSewU0NWim9QAloc1B+JDEh34RDvMXP0xNDQb3bifOItysjzR1oM0q/duRZ7vBqI8KXyT+lpQgy5CE7cSW2sS2vdvw6ZXo9pXXvGoE8HSwahoH9WupI49Il9Kn5Y71BDyKJ7cy6ugKhfNKFO6Wds0aiZvyPNaRCizFY661VXGGVRckjMvP7gvH7ele
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzZlOG11WTd1clQ5dUh3SVBaOXhBMitzR2JTVzhmZDVpTFNjdmtSQ25CSkMv?=
 =?utf-8?B?VU9iYnpIbVZiK1JOb0hxNzd2bXhKQ0JUeTM3eXdCRVRJMDhVaXNDRVpxd2s0?=
 =?utf-8?B?bFRPbWZ6eHBEYlBWL3ljdVk1SURJVnRTbkJ2QUg0aVFObnhGVGU5Rm1wY3Bi?=
 =?utf-8?B?QjNYMjR2K0lWVE9mM2hiWDMwK1V5MHBjaEUzMzc1ZThhbXBrc042bGlzdmVm?=
 =?utf-8?B?YTl2QmZ0ekpWby85d013Mm9rREc2RFV2NlA4Z3BWNXBMU2djbTlVSjIyTCtj?=
 =?utf-8?B?NUt4eHhTOEI2N3FWU3lqdXhQNzFibUxEZENWNDZGaDBwaHhtRW40MHIwOHdw?=
 =?utf-8?B?ZnQ0UmNyK21NOE9BK1BvUkpxbk1SYzg4SGxWMFc3TUVFUDI5cHc1OXEvbit0?=
 =?utf-8?B?d3VEOEpPWEJwRGk1L1ZyVnJoVTZ6WWFLbjBKRDdGQS9teThCYXFVa1NYVDBt?=
 =?utf-8?B?c2tzTnV6R2gxMWs3RThiWEdoUmt1c0N2QkJpV3lDUkhCcHBieTU4M0x0SDVT?=
 =?utf-8?B?TWpHT3FQSklsMklnY3hZb3JMSEs4VVFsSVVYa2k5ZWZDNW4xQ3drZHUwdEdn?=
 =?utf-8?B?cDZ3Um5aa0Nmb1BwRkp3ZHF3OFlyYzZYTWNyTVBpMWYwNkp0Q2xuNUR1WHNu?=
 =?utf-8?B?OXdhZ0YxVnhXQVNKS1NCalpoQk9yejBiVk1DbngyZ2htUTlHOFp4N0loR2tL?=
 =?utf-8?B?em9DZlB2K2d1czVmZzc3a05hc3VzN0dabytjdkxESTErSGlBS3JrMVV6VGJL?=
 =?utf-8?B?Rkxzc2M0MUZ0RlcraU5YN2gyaGNJVWN5QzFwb1hnanlncFlCQmt0WXdpNmsz?=
 =?utf-8?B?TExIUnlVdEVtazFxVmdnczQ2SzlrdXdLdHNTOGZ0cWRDR0lveDlBMWlRZ3Jh?=
 =?utf-8?B?aitRaHRndjUxbmVBTU5BaWtwOGozMSt2SEpzUmNKcDV1MkpwelRacVBjT0Fq?=
 =?utf-8?B?c0R2OEgxdGl3eDV3c2R0VnE5ZTZ4ZDZrc3VHVytVRkVXcUhVRngwQkxpQXFw?=
 =?utf-8?B?UjlBMk1yTmltNjNOT1Y2dTFPdlBXU2FxdUdlQWtKM0N4Rlo1dUMrNmlZRFRX?=
 =?utf-8?B?OVRYc3I4ZFdqTkJlTlQ2K2VBSXVxWGpTelJxTjl2T3NmazJDWC9tcmVjMWRP?=
 =?utf-8?B?SzdjUVlaMWVMT3BZRHFjb1hCdlJOUVpWYXF5WWxKbTkyTEpDOUFvSjVkYzJQ?=
 =?utf-8?B?bWdsalU5ZnhORVBFaitOU0dTR3F2ejVnOG4xbnlwSnpKazY5dmI4bDNXMHVJ?=
 =?utf-8?B?Zy95bjI5ZitCdS9BT1l4YUFYeTQwcEZBREE1Y0JGbG1GUFhnSnZCR1pDdjJS?=
 =?utf-8?B?RGMvbXAyTmJZOWxOaHR2VUYxTUxJNUszRHlIYjZ4bXlib0VZbTBJMGJienFp?=
 =?utf-8?B?MGJ2eVVKN2lJb2NxMW90VDFDN0pib0pDWS9IdVFFdENjRkFBWDNEcTVocGF1?=
 =?utf-8?B?OUpQZnpaMG5xVnlCMlNvQVhuNGpkYjZEWk56aWVIMlFxRDRyQWxEN05kY0Zy?=
 =?utf-8?B?RzVaeU52OWlvN29GN1Nib25BMDdmMTJZVlltNmFBakpJWm9PZUk0RFlVUkw3?=
 =?utf-8?B?SVY2UVUwUHc3Z3BnMW5CU3d1RDVlV0JPYUc0UWRwK2xBRldYZ0VuVkJzQTV0?=
 =?utf-8?B?a2FVSDltS1E0cHVxdzRkNE5DSGNpelZTR2FYZHdrRWg2TmZSbVBaeTBMRTVm?=
 =?utf-8?B?dTk2M0VsVFBUZkJyYlQ4K2tXODdHVnhRUW8vMGNyUkkvc1RmajRGMWxQWjdD?=
 =?utf-8?B?UWtLVzBoNndaRmtaeHJtVUJvSkR0NVdVK2gyNWFMUXhXQ1ZmT1QxNmx4RVBW?=
 =?utf-8?B?TUZpdStIUUp5VGNtKzhOZ2F6R1FxcjJmOVR3QS81THNuenZUdUhFK1ozQ0pS?=
 =?utf-8?B?WnZSMGNFaU1SbDVYVnFxZE5vTDJuTnI4R1ArVjhPd0c2cEk1T08zRmsxNktk?=
 =?utf-8?B?aFh1TkpqYmtDY1hEVGZmcmtoT2hBTGdJWVpmSlQrZDNxYXEzVnY2SEhjNGVB?=
 =?utf-8?B?WDNEK2xsc0xTL01KNjRZMGhQQ3JDZVZBbm5icFFqbUVSeUJHZzdwUzVUcGdX?=
 =?utf-8?B?MlZNUGJTOVAreTVaK0xYc1NUM0hrQngxWTZXN1JhVDdrMWx1NU9GMHduNUs5?=
 =?utf-8?B?QmVwQmdkdS9SOXVSckJ6NUd0VjJUd1RZN3hDSjl2MGpjU1ZkN0pKWUVlYVFp?=
 =?utf-8?B?eEVJa2tqcXRSTGVScFRjNWR2YzFQd3hJMFgrVGtNTStKa0NGSTluWWxUU2VF?=
 =?utf-8?B?Tld5TEkrcXBsOE10Umt6SkRqbFZka2NCempVaDBsbFV0bjljN1hjT0FHK2FL?=
 =?utf-8?B?MElQekRxajM3aDgrZk5iN2RhWEJiS2FJcFZ6UTUwc3JZY05PR1d5Zz09?=
X-Exchange-RoutingPolicyChecked: eKBssGw7FR8JR6yHWvUWJVyi+5GIIb5OTyikGAwUNr+pbupt3SMmVoGFZRhpYdf5OHOAeAI3sW183BQl/bt+NlXT/ouSEVzT4mhuuY5FIUVpZev62FGFGigUygKBUAACzrxpboHXJiD5sRMfogRf6HrgNw+H6ERRrEpVMqEGrBbZAUWxuvLChD9r+jqjGLOp2hsAmLAM1xidPiLztT6CPABj9GUBp2XNRq8i1YVdQ6UfV6rxz0IAXamk/rXLwzPbtqdEpwkRd4tBwryfVfDDrkB5lLppi6/QHu+TYMJYOYJjy5U/LjojaB8UAInig4GI5VoB9X+EYXyEi+FMaHxUVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e133b5-8d20-471b-4c30-08dec5856a8c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:43:14.3392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: It9zEE/bGIKKP5MhJCOonTpQi2pE2p/h2brEJKIIF8Ko5KJ0IDbmSNTEraRHW0AC97Nt+7cag0Vj7LAWWhQcww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5874
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

On Mon, Jun 08, 2026 at 10:33:46AM -0700, Matthew Brost wrote:
> On Fri, Jun 05, 2026 at 12:52:02PM +0200, Francois Dugast wrote:
> > xe_pt_zap_ptes() and xe_pt_zap_ptes_range() walk the page-table tree
> > holding only the BO reservation or SVM notifier_lock respectively.
> > Concurrently, xe_pt_update_ops_run() (vm->lock write) calls xe_pt_commit()
> > which swaps children[] pointers and immediately frees the replaced xe_pt
> > via xe_pt_destroy().  xe_vm_pt_destroy() has the same exposure during VM
> > teardown.  Either path can produce a use-after-free when a concurrent walk
> > dereferences a just-freed node. Fix by introducing a per-VM rw_semaphore
> > pt_lock.
> > 
> 
> This locking is very hard to reason about. I believe I understand the
> issue—zap holds the SVM notifier_lock, but an unbind with only the VM
> resv lock (non-userptr/SVM) could race and cause a UAF, right? These
> operations  should be touching different PTEs or they would both hold
> SVM notifier_lock so it ought to be safe, but perhaps I’m missing
> something.
> 

Another case I think is BO eviction for an external BO (dedicated resv
lock) and VM unbind of a different BO - but again the reasoning of
operating on different PTEs here is the same as above.

> Again, the existing code somewhat confusing and a bit hand-wavy. With
> that - regardless, I’m okay with introducing a dedicated lock, as this
> series does, to ensure safety / make the locking clear.
> 

Worth noting an alternative option could be always take the notifier
lock on bind, unbind (read mode for these two), and zaps (write mode).

Not sure if this better.

Matt

> A couple nits below.
> 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> 
> I’d also like Thomas’s input here before merging, as locking is
> difficult and the more eyes on it, the better.
> 
> > Assisted-by: GitHub Copilot:claude-sonnet-4.6
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c       | 47 ++++++++++++++++++++++----------
> >  drivers/gpu/drm/xe/xe_vm.c       |  3 ++
> >  drivers/gpu/drm/xe/xe_vm_types.h |  5 ++++
> >  3 files changed, 40 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 15ce77ce7793..2dada51469c9 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -919,10 +919,10 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
> >   * Eviction and Userptr invalidation needs to be able to zap the
> >   * gpu ptes of a given address range in pagefaulting mode.
> >   * In order to be able to do that, that function needs access to the shared
> > - * page-table entrieaso it can either clear the leaf PTEs or
> > - * clear the pointers to lower-level page-tables. The caller is required
> > - * to hold the necessary locks to ensure neither the page-table connectivity
> > - * nor the page-table entries of the range is updated from under us.
> > + * page-table entries so it can either clear the leaf PTEs or
> > + * clear the pointers to lower-level page-tables. The function acquires
> > + * vm->pt_lock (read) to protect against concurrent page-table tree
> > + * modifications by xe_pt_update_ops_run() and xe_vm_pt_destroy().
> >   *
> >   * Return: Whether ptes were actually updated and a TLB invalidation is
> >   * required.
> > @@ -937,19 +937,24 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
> >  		},
> >  		.tile = tile,
> >  	};
> > -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct xe_pt *pt;
> >  	u8 pt_mask = (vma->tile_present & ~vma->tile_invalidated);
> >  
> >  	if (xe_vma_bo(vma))
> >  		xe_bo_assert_held(xe_vma_bo(vma));
> >  	else if (xe_vma_is_userptr(vma))
> > -		lockdep_assert_held(&xe_vma_vm(vma)->svm.gpusvm.notifier_lock);
> > +		lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
> >  
> >  	if (!(pt_mask & BIT(tile->id)))
> >  		return false;
> >  
> > -	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
> > -				xe_vma_end(vma), &xe_walk.base);
> > +	down_read(&vm->pt_lock);
> 
> Style nit - can we use guards or scoped guards in this series?
> 
> > +	pt = vm->pt_root[tile->id];
> > +	if (pt)
> > +		(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
> > +					xe_vma_end(vma), &xe_walk.base);
> > +	up_read(&vm->pt_lock);
> >  
> >  	return xe_walk.needs_invalidate;
> >  }
> > @@ -963,8 +968,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
> >   * SVM invalidation needs to be able to zap the gpu ptes of a given address
> >   * range. In order to be able to do that, that function needs access to the
> >   * shared page-table entries so it can either clear the leaf PTEs or
> > - * clear the pointers to lower-level page-tables. The caller is required
> > - * to hold the SVM notifier lock.
> > + * clear the pointers to lower-level page-tables. The function acquires
> > + * vm->pt_lock (read) to protect against concurrent page-table tree
> > + * modifications by xe_pt_update_ops_run() and xe_vm_pt_destroy().
> >   *
> >   * Return: Whether ptes were actually updated and a TLB invalidation is
> >   * required.
> > @@ -980,14 +986,16 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> >  		},
> >  		.tile = tile,
> >  	};
> > -	struct xe_pt *pt = vm->pt_root[tile->id];
> > +	struct xe_pt *pt;
> >  	u8 pt_mask = (range->tile_present & ~range->tile_invalidated);
> >  
> >  	/*
> >  	 * Locking rules:
> >  	 *
> > -	 * - notifier_lock (write): full protection against page table changes
> > -	 *   and MMU notifier invalidations.
> > +	 * - notifier_lock (write): excludes concurrent MMU notifier
> > +	 *   invalidations, but does NOT exclude xe_pt_update_ops_run() which
> > +	 *   holds vm->lock (write).  pt_lock (read) is therefore required to
> > +	 *   serialise against concurrent xe_pt_commit() / xe_pt_destroy() calls.
> >  	 *
> >  	 * - notifier_lock (read) + vm_lock (write): combined protection against
> >  	 *   invalidations and concurrent page table modifications. (e.g., madvise)
> > @@ -1000,8 +1008,13 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> >  	if (!(pt_mask & BIT(tile->id)))
> >  		return false;
> >  
> > -	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_svm_range_start(range),
> > -				xe_svm_range_end(range), &xe_walk.base);
> > +	down_read(&vm->pt_lock);
> 
> Should be assert vm->pt_lock in held in xe_pt_zap_ptes_entry or do we
> not have the VM there?
> 
> Matt
> 
> > +	pt = vm->pt_root[tile->id];
> > +	if (pt)
> > +		(void)xe_pt_walk_shared(&pt->base, pt->level,
> > +					xe_svm_range_start(range),
> > +					xe_svm_range_end(range), &xe_walk.base);
> > +	up_read(&vm->pt_lock);
> >  
> >  	return xe_walk.needs_invalidate;
> >  }
> > @@ -1079,6 +1092,8 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> >  
> >  	if (xe_vma_is_userptr(vma))
> >  		xe_svm_assert_held_read(vm);
> > +
> > +	lockdep_assert_held_write(&vm->pt_lock);
> >  }
> >  
> >  static void xe_pt_commit(struct xe_vma *vma,
> > @@ -2638,6 +2653,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >  	}
> >  
> >  	/* Point of no return - VM killed if failure after this */
> > +	down_write(&vm->pt_lock);
> >  	for (i = 0; i < pt_update_ops->current_op; ++i) {
> >  		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> >  
> > @@ -2645,6 +2661,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >  			     pt_op->num_entries, &pt_update_ops->deferred);
> >  		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
> >  	}
> > +	up_write(&vm->pt_lock);
> >  
> >  	if (xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> >  				  &xe_range_fence_kfree_ops,
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 080c2fff0e95..b711c12bf751 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1580,12 +1580,14 @@ static void xe_vm_pt_destroy(struct xe_vm *vm)
> >  
> >  	xe_vm_assert_held(vm);
> >  
> > +	down_write(&vm->pt_lock);
> >  	for_each_tile(tile, vm->xe, id) {
> >  		if (vm->pt_root[id]) {
> >  			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
> >  			vm->pt_root[id] = NULL;
> >  		}
> >  	}
> > +	up_write(&vm->pt_lock);
> >  }
> >  
> >  static void xe_vm_init_prove_locking(struct xe_device *xe, struct xe_vm *vm)
> > @@ -1644,6 +1646,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
> >  	} else {
> >  		init_rwsem(&vm->lock);
> >  	}
> > +	init_rwsem(&vm->pt_lock);
> >  	mutex_init(&vm->snap_mutex);
> >  
> >  	INIT_LIST_HEAD(&vm->rebind_list);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 635ed29b9a69..3bc45991f607 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -271,6 +271,11 @@ struct xe_vm {
> >  	 * VM
> >  	 */
> >  	struct rw_semaphore lock;
> > +	/**
> > +	 * @pt_lock: Protects page-table tree structural modifications from
> > +	 * concurrent reads during page-table walks (e.g., xe_pt_zap_ptes).
> > +	 */
> > +	struct rw_semaphore pt_lock;
> >  	/**
> >  	 * @snap_mutex: Mutex used to guard insertions and removals from gpuva,
> >  	 * so we can take a snapshot safely from devcoredump.
> > -- 
> > 2.43.0
> > 
