Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC56C83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 21:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBF010E4F1;
	Mon, 14 Jul 2025 21:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EbIbPd07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD23710E4F1
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 21:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752529743; x=1784065743;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6BuqS1NPLjb7FrYfsqruBKnmjvrbxbWY2HLvQl6qrUg=;
 b=EbIbPd07+psLmpREMv5oE2Jg3Ex5i4crUpG26MHgdVpBo9Rp2o4IelIc
 +/aTPVRkUDK5J3DpRVea/BKXQmOc5vyc8qpIGXUfft2Gjl0zAli+10WL7
 HuqEpTE2Xe0m97IO8GnOGVeQ3lrC9aoeZx8ari9H4pNQGsoyB1iWG/EYm
 /1iJi6dq7Szbl1HCHtJxBd0HWJZxt0rDXzAo7fIGtsW/yDQz7Galspo8/
 jRe67yaOffogthfxmLFqkAc2KK1r3AEA3krq0sOctK75B/lsjbXEidTVG
 r7dL7YZWYC72YneeoEhBxRgDyJatuNei43vo6XbfK42lqZcmWvlOYaxwr g==;
X-CSE-ConnectionGUID: PpiXIDBrRXm5n0LcNGTWKg==
X-CSE-MsgGUID: odjB8L2+TwK7YENiEMc92A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53956120"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="53956120"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 14:49:03 -0700
X-CSE-ConnectionGUID: jNQGfslbThWBkVPoRyUJOg==
X-CSE-MsgGUID: 7J2Z3dj9Tm+585vRhZAM1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="156446335"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 14:49:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 14:49:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 14 Jul 2025 14:49:02 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.77) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 14:49:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jILKqGegPjncIPbH3rG91vBhhh27gnMZP4NojYWc4Ks68rOW5WqYclDczstAKps892j2gP5T7CSr+PLjJNgBGVL2tcT/vuGGRGg7RWLBCTAy9ytkIoG3Q8Bkjf7G+Al0aH92GFJ9SnjgUeR44CcgCCwTixv8wEr6e81OotWi+17dCUaCij4RSMGpCTOCjy130XdhdzLe4e+gVxom96eDXjQSUS6IoFRy6f7RwT3PQRI4AVZ5si9xY9w6ARthNFd3W2scG6CIUs50T92NF4vi6gfghEjLUysBerl5LjtN7QBfpmFKVz6GfW6hFs9YeYeu6++/kHUBaEj9ILEOOMwnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acAS6FGRCAgI7oWZOfynwN79WIZYO9MxKPqAoTtYvJc=;
 b=hZr4kUiGRpWGg2117s5rUy2iO4gPgfnSnKBvAiVcxJKGiR1JaqDixMrZj2/zRU/zuNayyCKaKF8VeVW0RPeeiju5R81x7NU87VIvyKDFpr0hbgLbVucsXGU29MsTIaXpRZ62HbMYXXmHZyb2H33Wdh7jJQBEVUE6qkul5OK2oo6JQN5kZZ/Yn+po1kcIXyZMAg+45VhkCln/6cW/7+Bgj2Q5cIWdY1jCH+WtI+2fxJa0YS4K+k8Jf430GZyFnRFZ4vlPcIINtLC8ROVy2uaEQEjl/yRcJIRv5Nf4ppY2g2LnmkOjx0C2yfMz8v2psze+eNW4vnJTYTJZzVOK6/2rkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6934.namprd11.prod.outlook.com (2603:10b6:303:229::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Mon, 14 Jul
 2025 21:48:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Mon, 14 Jul 2025
 21:48:55 +0000
Date: Mon, 14 Jul 2025 14:50:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v4 5/6] drm/xe/pf: Invalidate LMTT during LMEM
 unprovisioning
Message-ID: <aHV7sVJFhTagVPDy@lstrano-desk.jf.intel.com>
References: <20250711193316.1920-1-michal.wajdeczko@intel.com>
 <20250711193316.1920-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711193316.1920-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: a12ff9f7-f824-494f-3d3c-08ddc3203b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWp2NUYzWVRZdnVtQVVyVUdNOGpwaENYTjRiSDRXM0lrYnZlZVBmTDhGZ1p0?=
 =?utf-8?B?aEROcExnMitVMldUTTRNdytnajhJUGV5UTh4aTd1eUQxMDNkYXJvcVRQSWVj?=
 =?utf-8?B?QmpZUS9EbmMwemFwSzZJOFZibDdtNll2b1VRVGthRlZmQVZuNlE5RExmbVNs?=
 =?utf-8?B?Y2JraWtjRjV1R3ZVS3BmVGxackt4aExHdlYwdWtLTzdTMTNXRHNxUUp2WWJk?=
 =?utf-8?B?VnlmdmJqM0NGY3A0UDcxaVQxT3I1emR2b2EwbjJhblYvR0ZOei9CNXNMMG1H?=
 =?utf-8?B?eHMrZGdIQkZUSFdOdW5xRFN1SWJMRVM5VzROUE90WnVPcCtDUWUzbnk3YU9Q?=
 =?utf-8?B?YTNKMVBCNnFESjdyVGZIdlRVU1M5N2RPRTZZWWljenYrYTNkU09RMWd6amt4?=
 =?utf-8?B?ZTFodjBJVzdpTmp1RjdIdVVPbHZoK3J3cWxEa3VSRHFTNXpxamlNZkF5QnNr?=
 =?utf-8?B?Ujkxa1BiV0JmcGNEbUNVaWVHOGRDaURiQ2REbTRoQ0JTcUlwSHVsQWRhNmN3?=
 =?utf-8?B?YlVUYU0yM0hHMjg2VUxPOE9RR1RHd3Q0ZjVOcytTaVVHa2haZXczKytKYVlS?=
 =?utf-8?B?VEdzcG56ZXBJbUs4dEJIZHVjSTZiZE4yUVZZTVN6eHF1ZlRubXlNOSsyZWpH?=
 =?utf-8?B?SmtwS0RseFdiWDdPSlYrK2ZieWxNTGhxQXFUWWRrci9yM0hrejR3R3hKYmtj?=
 =?utf-8?B?Tk9ENkd2cmhrZUhhSXdrdnVHVkYzb2l2ckNhaXljYU03aHFBQ2NFUVFYUWRR?=
 =?utf-8?B?SUxFc0JlV08zSVBBUXEwcEE5RHA3dnAwdXBheEJwS3VTS0dVNzFJVlFUZHYy?=
 =?utf-8?B?U0VHa05US2NQQWE3bzhKb3pSK1IxL01lWmFPK3Rub1orUmhwUTU1Qk1RUmJY?=
 =?utf-8?B?dnNPa29PUnYxcXdVWlgwWWdvZDFVU01naW0rUWhhS3hQMENlRmQxdTNWUDBr?=
 =?utf-8?B?bnIwSjhseHVBbGRjZkJXZzR4NW1yYy8zUTZCbDE1WkpsVWU0dWZFMWhIWTMr?=
 =?utf-8?B?SlBUaktnV1hTVWI0QlZvdDJRUDNwaFllWGIwVWZ3eFFlUVI3U3F1d2hEb25Q?=
 =?utf-8?B?ZHVSZFo1L0Zla2ZkcUhnQVY1VDFzVVlHQ1Z0YXoxb2lLdncxbWhUZDBOTVVj?=
 =?utf-8?B?TC9KS1llalhIS0M4M1lwUFBsYWxSVXV1MWVRY2dqWEdhUCtNR0doR0tNbVdF?=
 =?utf-8?B?SlFNTU9oelNYWmRhQ2tHZkZ2NmFrRllJUEVSbjNoaWFLa3pDVW5FN3BweWJB?=
 =?utf-8?B?STJjTVVnSEVMaDV3alIwWlRDVk5acFZEMnFOS3Bjb1lLeThiUVc0eTVhdDcw?=
 =?utf-8?B?L2QyaVhwWVk3dHFMckFvcnBPK2lUUTVWd2ZwSVE0L1dXNVVQN05XTGxYUEZh?=
 =?utf-8?B?V1ZMM0RmbFErZ2ROWUgzL0U5ZFJXbit1cGF0bS9ITnhWVzhXMmd6cHkzOXBS?=
 =?utf-8?B?S1BKbTY5M2VCV0pHNEJ3L3RLMU04dVVpNWZVRzQvem1tS1U0SThOQm1Uc2FE?=
 =?utf-8?B?RFJMcTVKMWkrZTZnVlUyaitGRG5wNVFZSk5XSi9qbmxLbC8wUWRwN2h3ZzhZ?=
 =?utf-8?B?VkZuVC9nb2tPb21YOTBmVGJlSUwvTzd0MGhDVDFJVUpSUzBuVjBhdURva3Jl?=
 =?utf-8?B?cFhCbTRpc0I2MzllRDJ0TTkrQVdvWGRLQWFNTzVNd082VENKaHc0ZlAxZnVE?=
 =?utf-8?B?M3dKeDYyNkFYYlZZaHFTc2tweFBoOWZmaEwvMTVyY0JUMjRKVXV3clRUVmtG?=
 =?utf-8?B?MkRGUWR2Z2gwa1VRR1orbTlLSmYwYkRrY2lHeEkyRkZtV1JBY0V6R0JKc2xw?=
 =?utf-8?B?RU9KRVA5NU5LZythcUpiMWR6NU1QNnk1WGIwOEQrbUtnblhYeUM0TGhRaHI5?=
 =?utf-8?B?UlFFM0FJLzFaaGQ4RE9Ta05qWkJ2aWxYbGJ0UXlXSHkrek1vOGdoOVRxQm5w?=
 =?utf-8?Q?PdCVzWaziNY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3R0MDhadzhtbEJra000YjJCNzd6REZoZExyTHpLSUtVS015M2V2d21RUm56?=
 =?utf-8?B?VmNCUktMQlByd29QaS9YSnVJbWgvNnFaaWY1dE5vejB1UmxDRWRVbFFqbERQ?=
 =?utf-8?B?bXlJZWMyc3ZhSFYvV1BURkMySzVZZEx1L0VlT1VGWU02UGRiUDZ4TzdwWm5p?=
 =?utf-8?B?RzBTajF1eWk4N05nOU84dnIzRnBFOVZILzA2SDdyQmEreHZsTGhSNEJaSzdn?=
 =?utf-8?B?OWlpaHhXL3kwanpoemRyTU1JNnY3M1pIWEVJWmJOTmJza1hZTnV0TVRIU3gz?=
 =?utf-8?B?WHN3MHpjZVpuSkNmNE9GSHJVWlhpdW5ySllzNXdRbUprRGYxL3NLNkdQL2RV?=
 =?utf-8?B?M0tjTk9SVGs5Tyt3MitIa2NsYlBoSnVDUkpaRVNOc2o2ZXVPOEkxMmI2RXl5?=
 =?utf-8?B?Q2pWNTdKM21rNml1L1N5ckttZnN5azRBRlJBOGZGSzV5TlFzOUxMdGREdjdz?=
 =?utf-8?B?aXlBaGJLcjN1OEVUazJYQ0JRa1FUbXpvbkdEelJHa2oydWc5MllOd2p5VHQx?=
 =?utf-8?B?ZUZOTXVDVFE5TVNJWGtBTHZEaVV6dnZJU3RyYlgxTE14bGx1OVVvOUhMZTVj?=
 =?utf-8?B?VGVTcml5UGtpSkFSSFdqUDJoL2tWY3JWN2VDTUlqc3dmeEZBaUhMekpjMjNM?=
 =?utf-8?B?aS9zWkIxNzROckxFN3dRZ2xSR3RvaVg3RDlDZTUyblh2UFZNZU1ZWURUbGNV?=
 =?utf-8?B?c2kvQWozTGhZL3pLeUZrZ0crdUprTnpqeVBBTzFxVjljandBYy9kRmtjVEds?=
 =?utf-8?B?QzhNdDVGMXdWS3ppWm1NZ1YxYXRRMTE4eXRNUlJuLzBrQWYzelpTZFhQOGY1?=
 =?utf-8?B?S0VUV3RzTHA4c0JmcS9RK29jaHdUbEFKRytOWkhLNndjSGZtU1BFMGV6YVJI?=
 =?utf-8?B?SWlnS3cxSUk0V3dSc2Znd1ZNMCt4WTNIS3krczJlUHhNckxmRlhnREV1Q1Yr?=
 =?utf-8?B?UWhlTVNFbG5TQksxYlNDZHhoZllUMmdnaFV0eXc1OVV5bVM2WDA4N3NqeU5N?=
 =?utf-8?B?Wm9KV2xnZmhIV2t5Z3kxaStWU0h6RTAvNFBqMldUUENKOXRNZmtrV3ZJanA1?=
 =?utf-8?B?V2JMNk9ieisvTlc4RFY5YXFTbHNSdnNTWnltTitLdmE4ZmY4eDN0Z1daVmIz?=
 =?utf-8?B?Vi9WYzRCNEFaTVZGU1ZjR3N5c3NvQjRzZ1UxVENwRkhsaTlzc1l5VG5RT25V?=
 =?utf-8?B?bWJ3dFZaSXZGOVRucDhLbDY5ZmQ1VnpMcVM4eEJvak5TeGhoRFlKeXpZamxG?=
 =?utf-8?B?cy95RVROaVcrTkJ0V0hWSEhscDJZN0ZzMWl2NTNNbEtEcEZFYUpFQzFrY01F?=
 =?utf-8?B?RWFZQXJIL29UNlNVamVPVWxlQzNJcHFtYjU2RjRJaVVOcGt6YXpBYjlUZkpU?=
 =?utf-8?B?YzNPS0JjeHg0c0ZmTkFkK3JTTXl5dkxkUE9VRnJsL0k0STRtWmJ0Uy82aHhs?=
 =?utf-8?B?SVdyVkwyYlpsdmszdmhZRGdzTlVvMG9BODFtWGZrcmdPMDAxWmxoeWhlYStT?=
 =?utf-8?B?M1I5WmpwemZ0UHo1MFdkVnlPd2podzN1ZFpkNFFFN2dEYW9lZGh2TU5QUU5r?=
 =?utf-8?B?ci9vVWcxalBCNE13N1MvdjBkMytXS1BSOWJTdFpTcG1GQXdEYkxpTlJCb0x2?=
 =?utf-8?B?OWpmcVBhY2MwblZFVTMybWp0QWMzTG1qWFR4TGdtRGRrcGhqS2xIdHpuWE4z?=
 =?utf-8?B?amU1YURrTWc1UThKQ1Q1Wm1yZGFqZUNJMWtCMUJPMWt1SGtaemt6NGVKNmlB?=
 =?utf-8?B?THFNNVVvN3BkdndmNi9ZbUUySHFmZGY0dk9lbDlyaXBJZzUzcnZvVmtqb0pj?=
 =?utf-8?B?TGJZOWR2QytVZ3NrNi9mY3NFVE0rdzAzUGZMM0Z2clcwZzY2cUY0STF1Qko1?=
 =?utf-8?B?RS9DYWhtdTA5eXZYVVdRUVFZVFkraUJIMzNLd3poRDJHNXp3eHRGNGluanpY?=
 =?utf-8?B?MFNrZmhUdFBzWWpZS1FaR1NFNnNFN2VzeGFNQnRkT0VtNDNSczJiQndMZ0t5?=
 =?utf-8?B?SXlWa2RyOGw1aU9ILy9oSkJjaFBPbW93NDNyaVE1SEw4cnBRT1MwbE8ydzA2?=
 =?utf-8?B?VXc5NGlEajFkYUpESVd2QnlxeXFPaFkzNmc5WjB0U0F4VWdkLzJ1azJyNUhX?=
 =?utf-8?B?MThPcm5zUDJZS3ZYZXpISDhIYk5WWjJuUktPMTQveFJ6aE04MjJSMUY3dEls?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a12ff9f7-f824-494f-3d3c-08ddc3203b20
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 21:48:55.6909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfEio9Gg+TFzbYyoqKubu87zn/uedThWkG3ujDerTpY2Rh+QtpN5cAuicHF0CULLhiQHiWw22cWWC0b2f1RvMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6934
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

On Fri, Jul 11, 2025 at 09:33:15PM +0200, Michal Wajdeczko wrote:
> Invalidate LMTT immediately after removing VF's LMTT page tables
> and clearing root PTE in the LMTT PD to avoid any invalid access
> by the hardware (and VF) due to stale data.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2: drop unused num_fences (CI)
> v3: rebase (drm-tip)
> v4: drop sync suffix (Matt)
> ---
>  drivers/gpu/drm/xe/xe_device.h              |  4 ++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 34 +++++++++++++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  1 +
>  drivers/gpu/drm/xe/xe_lmtt.c                | 54 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lmtt.h                |  1 +
>  5 files changed, 94 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index f0eb8150f185..bc802e066a7d 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -131,6 +131,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  	for ((id__) = 0; (id__) < (xe__)->info.tile_count * (xe__)->info.max_gt_per_tile; (id__)++) \
>  		for_each_if((gt__) = xe_device_get_gt((xe__), (id__)))
>  
> +#define for_each_gt_on_tile(gt__, tile__, id__) \
> +	for_each_gt((gt__), (tile__)->xe, (id__)) \
> +		for_each_if((gt__)->tile == (tile__))
> +
>  static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
>  {
>  	return &gt->pm.fw;
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 6088df8e159c..086c12ee3d9d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -330,6 +330,40 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static int send_tlb_invalidation_all(struct xe_gt *gt,
> +				     struct xe_gt_tlb_invalidation_fence *fence)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_TLB_INVALIDATION_ALL,
> +		0,  /* seqno, replaced in send_tlb_invalidation */
> +		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> +	};
> +
> +	return send_tlb_invalidation(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
> +}
> +
> +/**
> + * xe_gt_tlb_invalidation_all - Invalidate all TLBs across PF and all VFs.
> + * @gt: the &xe_gt structure
> + * @fence: the &xe_gt_tlb_invalidation_fence to be signaled on completion
> + *
> + * Send a request to invalidate all TLBs across PF and all VFs.
> + *
> + * Return: 0 on success, negative error code on error
> + */
> +int xe_gt_tlb_invalidation_all(struct xe_gt *gt, struct xe_gt_tlb_invalidation_fence *fence)
> +{
> +	int err;
> +
> +	xe_gt_assert(gt, gt == fence->gt);
> +
> +	err = send_tlb_invalidation_all(gt, fence);
> +	if (err)
> +		xe_gt_err(gt, "TLB invalidation request failed (%pe)", ERR_PTR(err));
> +
> +	return err;
> +}
> +
>  /*
>   * Ensure that roundup_pow_of_two(length) doesn't overflow.
>   * Note that roundup_pow_of_two() operates on unsigned long,
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index 31072dbcad8e..f7f0f2eaf4b5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -20,6 +20,7 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
>  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
>  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
>  void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
> +int xe_gt_tlb_invalidation_all(struct xe_gt *gt, struct xe_gt_tlb_invalidation_fence *fence);
>  int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>  				 struct xe_gt_tlb_invalidation_fence *fence,
>  				 u64 start, u64 end, u32 asid);
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index 381f576036d0..a2000307d5bf 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -11,6 +11,7 @@
>  
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> +#include "xe_gt_tlb_invalidation.h"
>  #include "xe_lmtt.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> @@ -222,6 +223,58 @@ void xe_lmtt_init_hw(struct xe_lmtt *lmtt)
>  	lmtt_setup_dir_ptr(lmtt);
>  }
>  
> +static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
> +{
> +	struct xe_gt_tlb_invalidation_fence fences[XE_MAX_GT_PER_TILE];
> +	struct xe_gt_tlb_invalidation_fence *fence = fences;
> +	struct xe_tile *tile = lmtt_to_tile(lmtt);
> +	struct xe_gt *gt;
> +	int result = 0;
> +	int err;
> +	u8 id;
> +
> +	for_each_gt_on_tile(gt, tile, id) {
> +		xe_gt_tlb_invalidation_fence_init(gt, fence, true);
> +		err = xe_gt_tlb_invalidation_all(gt, fence);
> +		result = result ?: err;
> +		fence++;
> +	}
> +
> +	lmtt_debug(lmtt, "num_fences=%d err=%d\n", (int)(fence - fences), result);
> +
> +	/*
> +	 * It is fine to wait for all fences, even for those which covers the
> +	 * invalidation request that failed, as such fence should be already
> +	 * marked as signaled.
> +	 */
> +	fence = fences;
> +	for_each_gt_on_tile(gt, tile, id)
> +		xe_gt_tlb_invalidation_fence_wait(fence++);
> +
> +	return result;
> +}
> +
> +/**
> + * xe_lmtt_invalidate_hw - Invalidate LMTT hardware.
> + * @lmtt: the &xe_lmtt to invalidate
> + *
> + * Send requests to all GuCs on this tile to invalidate all TLBs.
> + *
> + * This function should be called only when running as a PF driver.
> + */
> +void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
> +{
> +	struct xe_device *xe = lmtt_to_xe(lmtt);
> +	int err;
> +
> +	lmtt_assert(lmtt, IS_SRIOV_PF(xe));
> +
> +	err = lmtt_invalidate_hw(lmtt);
> +	if (err)
> +		xe_sriov_warn(xe, "LMTT%u invalidation failed (%pe)",
> +			      lmtt_to_tile(lmtt)->id, ERR_PTR(err));
> +}
> +
>  static void lmtt_write_pte(struct xe_lmtt *lmtt, struct xe_lmtt_pt *pt,
>  			   u64 pte, unsigned int idx)
>  {
> @@ -276,6 +329,7 @@ static void lmtt_drop_pages(struct xe_lmtt *lmtt, unsigned int vfid)
>  		return;
>  
>  	lmtt_write_pte(lmtt, pd, LMTT_PTE_INVALID, vfid);
> +	lmtt_invalidate_hw(lmtt);
>  
>  	lmtt_assert(lmtt, pd->level > 0);
>  	lmtt_assert(lmtt, pt->level == pd->level - 1);
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.h b/drivers/gpu/drm/xe/xe_lmtt.h
> index cb10ef994db6..75a234fbf367 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.h
> +++ b/drivers/gpu/drm/xe/xe_lmtt.h
> @@ -15,6 +15,7 @@ struct xe_lmtt_ops;
>  #ifdef CONFIG_PCI_IOV
>  int xe_lmtt_init(struct xe_lmtt *lmtt);
>  void xe_lmtt_init_hw(struct xe_lmtt *lmtt);
> +void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt);
>  int xe_lmtt_prepare_pages(struct xe_lmtt *lmtt, unsigned int vfid, u64 range);
>  int xe_lmtt_populate_pages(struct xe_lmtt *lmtt, unsigned int vfid, struct xe_bo *bo, u64 offset);
>  void xe_lmtt_drop_pages(struct xe_lmtt *lmtt, unsigned int vfid);
> -- 
> 2.47.1
> 
