Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FD1CA5FB9
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 17:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B746D10E643;
	Tue, 20 Jan 2026 17:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlrEjARD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4511110E639
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 17:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768929672; x=1800465672;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ysu7zVMHZ73upA6U9Xl6LloIxTu+42JkSQ6dPvjArB0=;
 b=XlrEjARDrnVbPay5uPCGOVvvl99RMg7gdCGxAEojLHbkWjJ3O34Xo1yj
 vktwoMw2x/FRbd2sGMNx9T9287CLxxeaqvaDMmXOSdTV/5ASK0uFt8QGl
 OV8oqnrxHvy6CZALV4T95yV0sb/HQCPT+KxjedEwc7gii2UdQwueZjiTP
 uzhKFpQ3VEZZioZddzza4+UWg87OLQl1kgX63UIPGX2SHsGjt9ZrSNOp0
 F/HmjfP+7mkPfcbgvW6aSKzqC1LH17nRSmAFt01+AudGbt2gAmqHBKhXx
 L5ogHf174jRxwIBkqBz4aZCRLDkUTs/f2n41M++PDwiRvildzGPsm8B3+ g==;
X-CSE-ConnectionGUID: EhnUuF/UQ/2+dMpldUMfuA==
X-CSE-MsgGUID: KnmGXSmSQPKMrEVW9FlBeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="72732347"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="72732347"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:21:12 -0800
X-CSE-ConnectionGUID: NDhKE2MtSsG+higMKstU2w==
X-CSE-MsgGUID: mw0Y5cW5QcakGmjVkD9J4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206223444"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:21:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:21:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 09:21:11 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:21:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWUmbGWenSejJFiMitIntxqyJkA1hg+5LuCO+qMSFYdkgiiToqpTqboRIfJ6qNlktx9na7iJCTkZmPal+kP3yirIdGQ3JBS0wRTFLmSfnTzzvF1UfImRctDWMj4tuVCMR6lf7p7k+SK0xyOg2MjQ0NfR9qQ7QSQpl9TD3ieIk7L8XW1UfOFX6cDupzB6AUDyRWUcFsqqM9FfzdVCuEA7PERBkS/MUvC4TuV4ECg+z4/k43UvpjL6EfdYudHVlSxcXN8IznBxtRSC3iHmY396zEaNiuwAG1FB88dH9mstzp9iqAN6mCRptqkrkIhStXGGOJhwcDszWOtLxVCYsEfuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wyv+STUrJAGsJLwML30D/+28i9YF7nBbeQGB8ZjdNXE=;
 b=akY0lDSJrsXaFFfMYFu7l4mHWTYp95RLsSzDHHww9ZozO/6qUSWEKllTG6u3yvZyN63Kx3aO8g0lYaEVHbdNYvCtaaP8ue0ByHxNhmXSFLYJ+s7XqNDx7RAz5fZdU9/vTWZpOUSD1eMhtQyNjs2XMVc9NtSIjIK948dwXeC8XUVjgFan1QcDgKscSGIX23ZTXUpn/r+ECwizgppG9anEedID0673T/NQK33Ozvj6zubeusZv2Lce+gLY+F5X/4S83R7+guZV0Ijd5UIRvkK5MSATnCoR9YPd80Upkh+GXyR2EZ6Wvv5dSwWoUHdEDBFOGiSjpmc2bbXYed/gG085Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:20:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 17:20:52 +0000
Date: Tue, 20 Jan 2026 09:20:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 1/8] drm/xe/uapi: Add UAPI support for purgeable
 buffer objects
Message-ID: <aW+5cVnfpNZNggeD@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-2-arvind.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120060900.3137984-2-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: d560d94e-0434-4890-6019-08de584842fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1FZdUU0U1huMDNyWSs3NUVVb0JVTFJxZkQ1VFBIanlIRkZTVERhOEVqU2V2?=
 =?utf-8?B?T3JqaVVXbkFIcjRkQWE2azdLRmcyZE8xc1Zqdld5bE5DOUZ0eEpQQTBGUmU1?=
 =?utf-8?B?aU5CQnpENFR1MU91QU1iOHdVbENQMmRQa2k0QWEzZGxTNCt1WjBoRVNBVTg3?=
 =?utf-8?B?OTBHNjlzSCtudVZoaDRRQ1lxa0xNNUd2Rlo4RzNxaThxMTdLZFAzc2lyakRm?=
 =?utf-8?B?d1FpdVpNL2NHS3h5bzd2cDVya0E3ZXBaK3Zka1JxblhYVGI3NWJmNW91Rkty?=
 =?utf-8?B?dlZsa0hFZlNWRjVDSXBxcUc4RFl4UmlOWUlaR1V6TGhZTGZrTXlKWlpTaG9s?=
 =?utf-8?B?aFpwR1dTUTRGMjY2cTRqTDRsbjNXaXFKWUcrRjJJbmJ6Y2JMTldvdXorMEg4?=
 =?utf-8?B?aGJhQVhGTVA4dENna25CbmtIa1d1bDdBZitBMlkzc1Q1TXVrV3Q1UDVKYXIx?=
 =?utf-8?B?OXUzT20waGpXdGZZRFd5S2pvRlY2Smd2a0wydUlMcVVaMGhycnhQNWo1bkRw?=
 =?utf-8?B?aVY0OW9saVBDck9NLy9kYXR5a0YwcjIvY2QxSGVnTnlLT0NSalBwZk9yMWpi?=
 =?utf-8?B?R1ZoMjJFbHVKRVZPaGNTSVNTMklUaHVBWDdQK0wrMk0rbEc0OE9ib1BBbG9t?=
 =?utf-8?B?dVZ4K1UvUmRnZkNrL2RBUzdvcndtNzRyQXJwYjBOUDhsUWFXamdpYjB6Rm1h?=
 =?utf-8?B?c2l3NmxiMWlYZG1wWjFjajNxaXErR2ZNeXNCRUpISmtBMFNEMzREWldaUjFs?=
 =?utf-8?B?V3Q1NFNXSCtocXRzOCtvT1ZVc2V3Wml1ckxUR3ZGUFhkOVRrcHlkMmdnSE8y?=
 =?utf-8?B?TFFscXM0cHFPdGNUVk8rcThIdXZEcnlVb291RDRzT01RYTBObHF2TzFwR0dT?=
 =?utf-8?B?RlJISkQ5YlBHaEhRZzFtNVF5a3VRWHNLeDFkMW9nZTFDajgzb0hWMXRsb2tM?=
 =?utf-8?B?YmxIY0hOa1I3QzQvcmhRMVlRQ1FLMEVtaC9pSWNrcWR3ZWMySDFqZHJUUjJW?=
 =?utf-8?B?eW1nWXJlV1k1VkNlQW9ZZldEejRpWGJUUzdUVVlFTkdidWgwbEUwWGlaOFdS?=
 =?utf-8?B?dVRCK3hIR211bHl2ZFQ3Z09qZGdZSEFYT3dsbEg1SExPMUR4aTFSZmtaUGo3?=
 =?utf-8?B?bUNhZUxzYzhYa08wd1FVbDdaN1ZlNVMrcG5NSlpFZmNzU0pRbjhzbURHZnhH?=
 =?utf-8?B?bjZYdjNKWVcyMlp0U0VlNU96R2lDREphanEvbi9MUFhTSmNqbERwYkd6dCtw?=
 =?utf-8?B?dTBiWWMwMjNNSDVpMFk1cm9BNEJ0RFNzbFM3aWIyazRtUm4wNk1GODlCTGRI?=
 =?utf-8?B?M1BHUk4xUUdvQnJOV2J0VmhUenZwWHRmSi9qeUJOalpkZUlNTzEyUzNBL2tv?=
 =?utf-8?B?aHpnb1QvOEFxTG5rTXFscEJHMVc0M1NvUzFteGxpNkRrTUx1OGNxSnk1Tjcz?=
 =?utf-8?B?aXhuTXAvOEtMYytraWZXa2FpNFN3dXVTMlZXQ09kNTloNUE0VENSY2JieGVa?=
 =?utf-8?B?QU9Gc3QvUitIK3dSbXVrUVd2ZUs5d1pOMUtDQXJyY1FMbWV0N1JDWS9KMCtK?=
 =?utf-8?B?TWNTdmN4LzQraERoazNSSGdKR2R3cGllQmZ3akR6S0ttZlBKNk5heHcrd3A1?=
 =?utf-8?B?R3R0RWRVbnQ4aWV5OXc4YjdXa08rRlVHdEUwclZuQ3RBK0hwczJueTQ3RXVJ?=
 =?utf-8?B?U3Z6T1ovOHEyVVp3cnA3K0NjYVBoZVladE1TbkZiN1M0cXlxdTRYWUJXL2lN?=
 =?utf-8?B?WE10Z2hCNkRwMTdZcmF3VFdKN3dRc3JUdmpGUWdvbDI5QjBqMFFKV0NscGxD?=
 =?utf-8?B?NERDTnNBdDFtbkxsZzEzOHZKQVIvZWlYT01sREpMcXc0L2licFFWdDl3QUF1?=
 =?utf-8?B?NVZ3WWx5L2VlWGc2MTBmOW1Nd1l3eXRCTnk0Ni9yZ2pRVWVXcE5wN2FES0pC?=
 =?utf-8?B?WkxKM0tvYituM29HcDhwYm9hRXhCMU1MVUJNQzE4eEUxOGhFdld6Y05lNVFG?=
 =?utf-8?B?dGhYNks1K29UdHJwdmM2QWoxa1FzbGh4anE0Tll0ZnhWYWFiWjVERzByTlkw?=
 =?utf-8?B?UmNGL3lUeVJkbktPc0ZaNTFTOFp1WU9wRkRxOVRRMTVkNkpCNzlyMTRhOVBF?=
 =?utf-8?Q?fkIU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDl2TW9DSFhPTFhSb3pJS253YnN6TW9pN3JmY3VjWENsdjdwNHZXMGRnaUh1?=
 =?utf-8?B?Tjc1Mml5SGpXQnNwYmx2N3VlcXZFOG5QVWIwRnFNVnFlVWJFU2JkMlZrenEv?=
 =?utf-8?B?eW9VOTVmS0pSeWdnUFQxZk5IZGthcUNSY0lETm9xRWNZRjlvcWZyWDV5dEYw?=
 =?utf-8?B?NnA1QnlFZ3dIN3VsNVJ0bEc0OGVEUEF5SDZpSWRSQW41VlVSVmVKb1A5djVJ?=
 =?utf-8?B?MExFd2JsSm9OS09oUWhkUTRxbEtFWW83d291U3k5OTNWSUdwd2NoNEJtS3Bt?=
 =?utf-8?B?N216OTdqYjM2YnNKbDBWV0cwT1VZbHVPYlJYYUZ6VDFLTEpvSW1IZXU3cHkz?=
 =?utf-8?B?c0dyRm1pRHlqNmpXd3ZLZVd6Y0hvSFQ3UWQ2VWFjSzhLY0pKWDlleFJBcVNM?=
 =?utf-8?B?cVp1VEl3dTVrdEJSZDBaV05XR0RtaUtjQm5VSlNTNUxUbXlXdi9PaFN2QzVE?=
 =?utf-8?B?ejMybjJRVUJ1M1lBdzNNZzdHV0VQcWlHakVTNWhtcTI3V2lUdm1TSmUvRkVG?=
 =?utf-8?B?cEJzOUgxeUxaQWFzazVyNjJ0Ri93UWNyTVBQakFMV2NKeEFjSVRoSzB2THh6?=
 =?utf-8?B?ZnlBV082dW9LcXZiY3dtM1ZadnBhc2FBWHZBVXFBVHZSeDJTelV3VDhzVWl1?=
 =?utf-8?B?Z3FPckt0QnB6MzJpYmZZZzBJNElpRzJQVUpLS3hpclZrZng5OGl3SmYvNzBH?=
 =?utf-8?B?UlZkSXdMc3ppWGdMcTdIeEJFYnhVc2haSVRDUXdlVE9oN0JkYnNJeklnUnVp?=
 =?utf-8?B?MTFIVmhoMVFXNjArbGx6VFNuWjlCa254SGR6T2lQdEVmQVFLZ3I1K2JJWUpL?=
 =?utf-8?B?WUlYTEtaWnU4em5OQ2lNTm9NMHZ5alBzOExwWVkwREhBYkNJN3FlVVI3dk1P?=
 =?utf-8?B?WDR1cnBjS0NzRmlxNmZ5K0tCYkE3dUlFMW5WdFdKU0N6VVdQOTFzc3dvelhv?=
 =?utf-8?B?TWx5Q1RMT2JKVWV1Z2kzWG5mNXJPeFlwUXF2K2lIcU4yNTU0ZWREdjE5UFRF?=
 =?utf-8?B?cGs0OWh1c3VoSnJQekVKbHpLN0ZaOW9Pckp4c1dvbzFFSC94cDZtV21ib1hR?=
 =?utf-8?B?dHhwNlp5L2V2a1ZvcmhVa08rVERpNDNqVm50aS8wdGJVT21jMHFhMjUxNElw?=
 =?utf-8?B?dnNwOWZDeUVBenNQU1crdVRZR3VMUGw4VloxV0ZFREQ2VDNvRzlXSWVWSEh1?=
 =?utf-8?B?TVloTE5vbkw4OENudnNYYmowTGJYTnNWWXhHMXVvTSs2blI3Z0I1RGU0Tndj?=
 =?utf-8?B?czc2czZOelJpaFhyZzdhekxwV0tGakVyd243TzNLbVFOOU9rNkpxclYrRG55?=
 =?utf-8?B?dU56ZE9lR3k5bTNzWHpESU5NNERtODQvL29CcTZWeEF6azlIZTRSYkk0OHFs?=
 =?utf-8?B?NEUwTFdhSWEvVEw1RUdxcnQ3WGNoSW1CN1hlS3R1YU8zMmZ2dDhGSzNQekpx?=
 =?utf-8?B?aXJBaG9kdEhWVVAvKzFFNDNJNVlaNXpQL3huWkJlQkFXRTNKLzE4MEFKT0lX?=
 =?utf-8?B?NFJZM2VEaWZ0b1hZNmZFV2RBMTVYb0FYUVdFdUtPTXg3ZGlrSmZqRGV1WjBm?=
 =?utf-8?B?bDhPNENaTHlhOCtJSnQvclFoN0I2bkVZVUY3YlJFV1psMys0c1VuczEvTHF5?=
 =?utf-8?B?eXlxOEZrRFJ4SzgxaWg3ZnQ0WnRSSUVUaytYTERpWDBaRU5hT0dvS2pHNmRI?=
 =?utf-8?B?L2dTYjVqNjFqSjc4UEk5eEhRZXFIOWlsc3ZsRzdPWjlENndicjRUYWphME95?=
 =?utf-8?B?WklVd1J4R1dpeldwdU1CLzRpdTNSNmZzUmpxd0NnTU52Zlp0VGlXa3E4WThj?=
 =?utf-8?B?cng1RmJvb2ZLaWFlVksyb0txV1RnWUV2VlArR2dRcXJIenBhUk9kRWNFWTVy?=
 =?utf-8?B?NENBclgwbEhQQzNUd09xcEVyWVBHWENxdmJQeWZKa1p3aFFMcURnNDEwUVBI?=
 =?utf-8?B?Wkk4QkV5Qmd6WVVMNzNSSE5XVU45N2pRdGx0ajlkWWk5U1RaTEM1U3U5b0l5?=
 =?utf-8?B?V1FYSDRGaG8ybExkRDZDQ0x3R2dEUXErcytQRHlFMTNyd0owd0FmUVhGaW53?=
 =?utf-8?B?QUZEdjhUU0srYUhpREthekFiWkZQMkVHYzFzd1hJS0trMVZCamk4T1duTnU4?=
 =?utf-8?B?YjUyNG14RE80eFVyOXIvdzVSQjV6N25jb2JDRDh0M3VVM2t6R0RYWTV6SHA4?=
 =?utf-8?B?dk1PeVprbVA1azMvQ0IrR3pmamF3N0pHZHBxSCtUczVPY0NhSnJoY0w2Z2F0?=
 =?utf-8?B?OE1JTnRZaDlxUk8vcGx4M0N0TFgrSU9udW5BLzMxaDVBSDhsNGNvTm9oaURH?=
 =?utf-8?B?WUpBbno3M1dwN2xDM1JZenNlaW9aUEF5ZFB5dm45N1oxU0xDbmlibVZlNnYv?=
 =?utf-8?Q?zsdQ/I2ngEacfGQ8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d560d94e-0434-4890-6019-08de584842fa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:20:52.0057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMLbWRnYaVASCaGxUsWEOPBAve5TU5AAg8UUVivyyIAYCEqkE/IKAa6TbLiKBXb6HXG2i3Bs5bETMXply6bQSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
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

On Tue, Jan 20, 2026 at 11:38:47AM +0530, Arvind Yadav wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> Extend the DRM_XE_MADVISE ioctl to support purgeable buffer object
> management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute type.
> 
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
> 
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
> 
> - WILLNEED: Buffer is needed and should not be purged. If the BO was
>   previously purged, retained field returns 0 indicating backing store
>   was lost (once purged, always purged semantics matching i915).
> 
> - DONTNEED: Buffer is not currently needed and may be purged by the
>   kernel under memory pressure to free resources. Only applies to
>   non-shared BOs.
> 
> The implementation includes a 'retained' output field (matching i915's
> drm_i915_gem_madvise.retained) that indicates whether the BO's backing
> store still exists (1) or has been purged (0).
> 
> v2:
>   - Add PURGED state for read-only status, change ioctl to DRM_IOWR,
>     add retained field for i915 compatibility
> 
> v3:
>   - UAPI rule should not be changed (Matthew Brost)
>   - Make 'retained' a userptr (Matthew Brost)
> 
> v4:
>   - You cannot make this part of the union (purge_state_val) larger
>     than the existing union (16 bytes). So just drop the '__u64 reserved'
>     field. (Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 077e66a682e2..7b3901e4b85e 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2099,6 +2099,7 @@ struct drm_xe_madvise {
>  #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
>  #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
>  #define DRM_XE_MEM_RANGE_ATTR_PAT		2
> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
>  	/** @type: type of attribute */
>  	__u32 type;
>  
> @@ -2189,6 +2190,42 @@ struct drm_xe_madvise {
>  			/** @pat_index.reserved: Reserved */
>  			__u64 reserved;
>  		} pat_index;
> +
> +		/**
> +		 * @purge_state_val: Purgeable state configuration
> +		 *
> +		 * Used when @type == DRM_XE_VMA_ATTR_PURGEABLE_STATE.
> +		 *
> +		 * Configures the purgeable state of buffer objects in the specified
> +		 * virtual address range. This allows applications to hint to the kernel
> +		 * about bo's usage patterns for better memory management.
> +		 *
> +		 * Supported values for @purge_state_val.val:
> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks BO as needed.
> +		 *    If BO was purged, returns retained=0 (backing store lost).
> +		 *
> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Hints that BO is not
> +		 *    currently needed. Kernel may purge it under memory pressure.
> +		 *    Only applies to non-shared BOs. Returns retained=1 if not purged.
> +		 */
> +		struct {
> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> +			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> +			__u32 val;
> +
> +			/* @purge_state_val.pad */
> +			__u32 pad;
> +			/**
> +			 * @purge_state_val.retained: Pointer to output field for backing
> +			 * store status.
> +			 *
> +			 * Userspace provides a pointer to u32. Kernel writes to it:
> +			 * 1 if backing store exists, 0 if purged.
> +			 * Similar to i915's drm_i915_gem_madvise.retained field.
> +			 */
> +			__u64 retained;

@Rodrigo + @Thomas.

Here we are adding a userptr for copying the result back to userspace
because the existing madvise IOCTL is IOW. If we could change this IOCTL
to IOWR, we could let DRM handle this for us. I'm not sure whether
changing an IOCTL from IOW to IOWR is allowed. My understanding is that
the ioctl encoding is basically the same aside from some control bits,
so switching from IOW → IOWR shouldn’t break anything, but I'm unclear
on the rules. 

What do you two think?

Matt

> +		} purge_state_val;
>  	};
>  
>  	/** @reserved: Reserved */
> -- 
> 2.43.0
> 
