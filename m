Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDF6D1D898
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 18:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB07510E5E2;
	Tue, 15 Oct 2024 18:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0P0pNYx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF99810E5EB
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 18:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729017163; x=1760553163;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2mDMQS5YzkVUyPy5HZdmvaH588XVd80W6j01uq2CPrM=;
 b=N0P0pNYx2Fs+msgYBA274AfM4OpS4efqAJZUw7k6ZHm8Rh5+wASN032D
 0cB2UI9r7KIWTvkr1qStym1POENWe06dMCzjT/4PYmaISnCb4ottgJKpF
 g8rDorJV9rBTdfCEPSVVvxfhjlIiQkEW4+FlrztQXA/6ndv/TbEncWSru
 iIuA4WVwMuNOJjEYkNmE1S4xuudOsA1dd5xx/Q+0ILtkExEkBQc+2XioT
 GmrQHV4OlS2DNwGZBdEdGLPOLPCdOIUp0rEqNqCAdz6GjOdsxP7weznRH
 jMfKP3EONgNgknP7NMBIUTGBzt1MA9RzJf0f6sM6us/SW3tFp+b3PZ++F A==;
X-CSE-ConnectionGUID: wqe9SdonR3O/EOHpRsEdhQ==
X-CSE-MsgGUID: wpZn54OnR1SK3rwijmDOTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39555787"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39555787"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 11:32:43 -0700
X-CSE-ConnectionGUID: UCx1rosUQpOXO7IZGCq9Qg==
X-CSE-MsgGUID: xm+l9l2hQDSKMMVAB4X40Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="108723338"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 11:32:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 11:32:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 11:32:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 11:32:41 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 11:32:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFJfD1/ZNJnMT9sCYxKBsqBSHYfJBXWC68QS/Lylk9dKNspxEDrjvzqH/0uRdnF2ME0qKhdBRqpZAFutJ/nwpMKHMrB4WIW6PoV5jgqtZ6rmRFI/9WEfxzX4/Q0WExY91op6bZTKqelvu/pJwRj45eyMFG0kVo9MgaKvUcYyy9Ae0c/2zRUBNFJtjbxzaanyI25q8+80CtfM057/edNOopcd6LkZlIHaWoCZ7vymIQ01+xLib4lfCdYg/G+64H71qIWoGu9NnbwaHxiy3DTYVnM3PDM/jbyaEQ2st31lEXdDBKsgRRXuZlCJOKDz78Dq0Te8+0BP/aOEgLmVuF6eNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsL1PoGBwmgpU0HB97Nk7nIrG8dBgrv9yVR1dnmBIs4=;
 b=lKQXDp2QnAgAcxWU6miKWzIiwbcxee4fZiZ02nfGwuzTLyLskJNAsQDbsZ9zLhcETTdyS5XjpLy+bl2cEfJQssnNAUKP+LYHScpjm1iNj4lHWkpVtrsJxcINmmP+RLjsv0dsbXgRemOQuacBzpx0EuDlTQLF8TYJ5ZanFGAM4mVisZ3sNVdGhaRb0EaVfC0y+v9o8SuNUGJH/FofNajOkICL6TVkopsjPh7KIV+JVimoHW4q7r0I/K1URbRTbycEPTbCJdaHFSUN7Y8WSRfns56MgIlTN+Lm7F8+ta4pZKsLQ44ni+hG6cHm4X5UQSHHipxmf8oDW1ngMRKUP4QE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Tue, 15 Oct
 2024 18:32:38 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 18:32:38 +0000
Message-ID: <04e5f3bb-6b66-40f3-9ca9-fe837691aea0@intel.com>
Date: Wed, 16 Oct 2024 00:02:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/26] drm/xe/guc: Update handling of xe_force_wake_get
 return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-17-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-17-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a57336-bcd7-4eec-f5a6-08dced47bf1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzR4blRmU2xZK1FwdmVZQTdPQkdwWGJ2WGZ4anlQTW1IK2VMVGpzY2VmMGZZ?=
 =?utf-8?B?b3lmOUwxYmNiRTBleUxXUnovaEtiWXhRR29hZExkd25GYk9iVHlzMENhOUI3?=
 =?utf-8?B?S3Q3cG5rLzdOZTBkSTN1SGlQRFVHeURzcjIxWWN4K3ZBdk1LYzZBUnM1ODU4?=
 =?utf-8?B?cHhIUEprR2ZhbVZEOFUxMWxiQnRUVGFYN1p6d1p6dXVVelhYQTVUNWFiZks3?=
 =?utf-8?B?TWhpdEtTMG9sY004WU84dHVyV0xmbTluMWFyZ200RitVanFhSm03ZTdZOWxV?=
 =?utf-8?B?U1F5cFFLSjdRc2lYcXpSZ1c0QTJucTg1K0pqc2lzaFV6QW5TeGJMYnZPUDVM?=
 =?utf-8?B?YVQ5WnVXeUFCVzA2dVE1WXYySG5JcG5zWXYrWFQ3cWl6R2V4RWs2UXJvWStK?=
 =?utf-8?B?dlFZdWd4bnU4cHpPdEVXVWoxaGdwSXNNQ056K2NDaVJhNG1VNDJ3ZlBBcVUv?=
 =?utf-8?B?WDJramhGL0xVaVlyV0kzUWoyblVNa3JOWGx6bGJ6RkJrMlZjZ05OUHVMb2Zh?=
 =?utf-8?B?VzBBazZqQVZ4UjZOT1V3c0hYNU9tZ091aFhqKy9ibnM5aXdrR0VhVlNSU1Q1?=
 =?utf-8?B?TVhvQmwvTGRCOWxHR2hGd1BtbFN6clpGODhTZFRVSlVrbnhsYXBDQmFJN2Zw?=
 =?utf-8?B?eW93ZEhCdVloZDZZZVR3cVpKenhodm5mOW0vMEsxejkwVkcyZUIzWUNKU3Zp?=
 =?utf-8?B?S1BZT3dWN2dTMEh3NVM1L2hTSUNydm1FMGJMald3ZWdRcHZYSDhzR2t5RHlo?=
 =?utf-8?B?bzRPd21QeFlUdU51YnBWSWwrU0tjVVhkd0J3U3VmTWdkUHlsZi9lNTN6Z1Qw?=
 =?utf-8?B?WDZsVjJ6WmJYYjdGaFQrQ2ZmOE5SK3NTZXNtMFk2UFhXYUp0cnFSRTI2MU5N?=
 =?utf-8?B?cTJTeThsUFBkSDNucUdQQ1l5T3pOWUNhbzVnbUIxcERzUFFQeGxtRjU2M0dh?=
 =?utf-8?B?UW5UbEM3dFhkeGZwSFV4cTluT21NWUdxNm1CTkZic1Y5UWkxckNZTVV4Q3Vw?=
 =?utf-8?B?U01HUGovb1RTc2ttNEhsVW9aM2svZUFBU0NBdHRjS3ZlTEVGSCtjK2l0TDdG?=
 =?utf-8?B?Zm5Lb3NiT0xmMStTU2tqUE83QXRLSHA4QVhEcHBGQ1ZSZ2IyZ2Q0Nm5WLzRn?=
 =?utf-8?B?bVJLSTVUK3hPbi9yNFVEbjJnVjhaVW8zK25oVlRuWkNjVUNWSzc5S3ZxZ3Ax?=
 =?utf-8?B?ZEVNR0VSNXFNdm9ReUxQT1pHUC83M0hHS1g4TTFCbXdMa2gycHJEd0VRa0Q0?=
 =?utf-8?B?WHZjc2tJMEFOMXhUb2o3eVpScXZ3R0c2aXQ0OFNxWFZRMWxRSlRZYU1scTE4?=
 =?utf-8?B?RXlUN2dxM1R2Z3V0M0xGdDRGVjF0TlFWbERhRWtDMnhUQmNNRE1XQ3M1U3Fh?=
 =?utf-8?B?TWVOa2RuVWlJTm95ZFhpK0tkOGVxRHVRRGpFSjZkamw0TEM5YjBGNG11eXcx?=
 =?utf-8?B?cXNSTWIyREdIRDJSeHVYZ2xjaHJ0dXNXUU5pSVV6UUpZT1RZWUlIQlhpR0xD?=
 =?utf-8?B?U3UrMXMrcFFTcWhmQklRcEtOZm5FZ3Mwano2bTBGQW13NjBqS2xQL0oxY2I4?=
 =?utf-8?B?c3NYQy9nR0o5NmYzaHRqczRwWFJBZm8rckhRM05UR1hPMU5LRkpUaDZGdXlo?=
 =?utf-8?B?MVA3ZFRXckhUOEppVUdTYmU0WW9FWWtVK21uMmQxZG51REhsaTg1MkltT21K?=
 =?utf-8?B?aWdnRzZLM0oxSWM2ZUJ4dGhXblR0ak5uMXhnRDNlalpRN3ZKdC8ycm9RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWN5cXBLRTl0WHhsSUEvWThOSlk2bldBMGpDaFFFUTNSdmpKRURyMUl2S1Uv?=
 =?utf-8?B?S0UwRHhqNS9iS1o4MUhMUXI3dEFYMVB3K29MK2I5OWQxTXpHYWswbGlYdVEw?=
 =?utf-8?B?WlVNVlhWeGZrVkxva0pWbTNQQUJyREowUUlZaHpPOVhnRHdaMUlUcUx4Z0JC?=
 =?utf-8?B?Q3dJb08xaklNZEcvVXFPeXl5b2QxWllweXgxMEJySFZxQXJMWGZyS1ZIVWIv?=
 =?utf-8?B?Sys2cC9PMGRmTXcxdURMbGVmYWorbmlZZVlYd3RvWWtRamUzZVZDdGJEbS9p?=
 =?utf-8?B?YnY1bk9NT3JwQS9FOHYxa1lIMlVYVno4d2EvU0NIeTlsSEdBQzJNbGpFdTZS?=
 =?utf-8?B?Vk5MamlYTDNEcWg5bWxNYmxnTURCWHNhQlcremZuMkc0cVk3Vm1rYWhMWUMz?=
 =?utf-8?B?ZG5wUmR6K2p2NlB6QmRkRWxYTXFoSHV5VlBWbDRzSFpzdTI0dFMrSldIWlYy?=
 =?utf-8?B?eEs5UnNZZGh4Mm1TT0pQQ3VJR3BnMkpiaHoybkhkK3hzOS9JSnFpZ1JEb1pt?=
 =?utf-8?B?MXNDNkZ5NFpodkxhRHNnVTJLWHV6MEZwUkZVS0V4UFErOWJVV0Ewc2dqaVNI?=
 =?utf-8?B?VHNkTzRtaFJ0WjI2L2R4dWN6bS9kTDVIZGhSMVdGWkF3QXYvMkwxMkdmclFz?=
 =?utf-8?B?SG50a2JQenhjdzlyZk1jWTVJWVQvcUpzNUdoeG9JK3lzMWVQVjMxVFN1RkhI?=
 =?utf-8?B?U1A5YThpUisrU05sa3hCQW5PVGw5aW1XS0IwekVocjJjZ1NDSHhZaWdwTWsv?=
 =?utf-8?B?bGx1V1ZtU1B6V0czdktBdjdoN1A5T0cxeFJLaWtpQVZQOGJuaEY3KzBHcFAz?=
 =?utf-8?B?SldCRHpDbytybm9oNHdSZEtJTkV5WG9VaVBBMGh2TXQrZ2Y0cjFZS3V3UHVS?=
 =?utf-8?B?NGlrTzFEUUJ0TjQwNHVld05reFB2OTRObk5jbmtJZkRSanU1N25lWjhzRksv?=
 =?utf-8?B?Umxrby9WTDRGMU5xdTVReDhHZUdobENzWWFpQ2FJcEVmc2FXL00vZk4yMUlo?=
 =?utf-8?B?MUVRVnRuMzVxcE1FY2pmOXZ6aFJHck1TNDNUNEFrV1FSNkl2bEI1VGJ5ajlT?=
 =?utf-8?B?dk9OTVUxSHV6N1NKRU5rSzdSUE5TcFQ1Vm9oc3Vyc2xSckY5bjlSWVAvSDJX?=
 =?utf-8?B?MlhUVG54VlVKL05ZWmlHbWhlTmtDb1M4SG9NcFMwcEdMbmtZVUlyTWIxQnd6?=
 =?utf-8?B?dEN3cWc4U2E0enRyZFl0TmZISHRwbTFlS2lwY3ZCSE5kY2FiMUw3TkRTL0ds?=
 =?utf-8?B?Z0EwZ24wZ0xvMWVQMzJkN210cFNiVkRWWTljanF1bkk0YzNnNXpvd1E0RDVv?=
 =?utf-8?B?TGJ6MmJHUVpRdzNRS21YSWZ0SXJoeTBBUHVwaXpEQnRrY2hpcytadElzcU5Y?=
 =?utf-8?B?UnBhaVJLbXdub0tzNmwwZXhlem1lZHZBU1Fsd0JvYUdENWVvdS83V1ZJY2Ev?=
 =?utf-8?B?eVBLTmRlWlVYZFp1Z0hObzZsRExOV0NDT3NiL1diS1RlMGhIdCtuWldxYmlB?=
 =?utf-8?B?YityeWo3MXo5WHY1QklKRmt5eW11c01uMHQ3bkZWK09hZGp1NjFPdyt2bFVn?=
 =?utf-8?B?ZzJDMytJd3JuSDZyaEFGTTFhRitUcXk2dDByMWJxVmZLd2hQMFR2dVI2M0lz?=
 =?utf-8?B?UGNoeEw3dnF1ZlZVY256Y24rbFBtTVl4WnZOdEFTMkZPY09KOEtUTmVnOTRI?=
 =?utf-8?B?MW4ybVgwRzdaZ0gyMkhqbVErOERVSmlObGU3NnJqejJ5V3FpM00ya0xMdWhn?=
 =?utf-8?B?MlVyalRtSTJ4a09jbEJud1o1ZjQ5Q2FMVzZIK2NRWUpNTEF0b3czOThmL3pM?=
 =?utf-8?B?YmJacW1EdStUVVBwMVRVRWx5aHdWUzFqUGZUWkxjbXhnVVhKRnBwNlRKS1JH?=
 =?utf-8?B?ZEVBd2YvM0krbDRiUXZqOGlCdWlyVFFMWmhDaUE1S1lvOVRLd0YxUlZFMmVh?=
 =?utf-8?B?UHo4aVFUWUhPWFlxTzRiYUZ0S0IxcDV3NDNWdzRka2xzazhHUXlqRFhHWU1M?=
 =?utf-8?B?eklSK3pobS95QTNMNm4xQjNmSEkzWThlVGttNUlUOWpWaWV1SlRIYjA4UXY0?=
 =?utf-8?B?a3hhYWlLR1E0dW5HUkRvS2tEa0IrSHZEbmFCQ2U4UmdmWk1HN1lrL3RRQXJW?=
 =?utf-8?B?QlZFTTBta1J5YjlDRkl4U21oYWxjVGFxa05LZ0diSCtzRGt0MzdJakVibEhY?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a57336-bcd7-4eec-f5a6-08dced47bf1e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 18:32:38.7832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAuLAxa+NZQojwdcwRUUeqLrw/w9YtrrbEo07dMSOT8QvvonAUmW3LNwiGvu2Fz11p+5RpMBGd1/dB2c8c0CfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Use helper xe_force_wake_ref_has_domain to
> verify all domains are initialized or not. Update the return handling of
> xe_force_wake_get() to reflect this behavior, and ensure that the return
> value is passed as input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
> 
> v5
> - return unsigned int from xe_force_wake_get()
> - Remove redundant xe_gt_WARN_ON
> 
> v6
> - use helper xe_force_wake_ref_has_domain()
> 
> v7
> - Fix commit message
> 
> v9
> - Rebase
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c        | 13 ++++----
>   drivers/gpu/drm/xe/xe_guc_log.c    |  9 +++---
>   drivers/gpu/drm/xe/xe_guc_pc.c     | 50 ++++++++++++++++++------------
>   drivers/gpu/drm/xe/xe_guc_submit.c |  6 ++--
>   4 files changed, 47 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 8570b1218287..76437d42b8a1 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -248,10 +248,11 @@ static void guc_fini_hw(void *arg)
>   {
>   	struct xe_guc *guc = arg;
>   	struct xe_gt *gt = guc_to_gt(guc);
> +	unsigned int fw_ref;
>   
> -	xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   /**
> @@ -1155,14 +1156,14 @@ int xe_guc_start(struct xe_guc *guc)
>   void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
> +	unsigned int fw_ref;
>   	u32 status;
> -	int err;
>   	int i;
>   
>   	xe_uc_fw_print(&guc->fw, p);
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
>   		return;
>   
>   	status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
> @@ -1183,7 +1184,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>   			   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
>   	}
>   
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   
>   	xe_guc_ct_print(&guc->ct, p);
>   	xe_guc_submit_print(guc, p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index cc70f448d879..fead96216243 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -145,8 +145,9 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>   	struct xe_device *xe = log_to_xe(log);
>   	struct xe_guc *guc = log_to_guc(log);
>   	struct xe_gt *gt = log_to_gt(log);
> +	unsigned int fw_ref;
>   	size_t remain;
> -	int i, err;
> +	int i;
>   
>   	if (!log->bo) {
>   		xe_gt_err(gt, "GuC log buffer not allocated\n");
> @@ -168,12 +169,12 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>   		remain -= size;
>   	}
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err) {
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref) {
>   		snapshot->stamp = ~0;
>   	} else {
>   		snapshot->stamp = xe_mmio_read32(&gt->mmio, GUC_PMTIMESTAMP);
> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	}
>   	snapshot->ktime = ktime_get_boottime_ns();
>   	snapshot->level = log->level;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 2b654f820ae2..e8b9faeaef64 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -415,22 +415,24 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
>   int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
> -	int ret;
> +	unsigned int fw_ref;
>   
>   	/*
>   	 * GuC SLPC plays with cur freq request when GuCRC is enabled
>   	 * Block RC6 for a more reliable read.
>   	 */
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (ret)
> -		return ret;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +		return -ETIMEDOUT;
> +	}
>   
>   	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
>   
>   	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
>   	*freq = decode_freq(*freq);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return 0;
>   }
>   
> @@ -480,6 +482,7 @@ u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc)
>   int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
> +	unsigned int fw_ref;
>   	int ret;
>   
>   	mutex_lock(&pc->freq_lock);
> @@ -493,9 +496,11 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>   	 * GuC SLPC plays with min freq request when GuCRC is enabled
>   	 * Block RC6 for a more reliable read.
>   	 */
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (ret)
> -		goto out;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		ret = -ETIMEDOUT;
> +		goto fw;
> +	}
>   
>   	ret = pc_action_query_task_state(pc);
>   	if (ret)
> @@ -504,7 +509,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>   	*freq = pc_get_min_freq(pc);
>   
>   fw:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   out:
>   	mutex_unlock(&pc->freq_lock);
>   	return ret;
> @@ -855,6 +860,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>   {
>   	struct xe_device *xe = pc_to_xe(pc);
>   	struct xe_gt *gt = pc_to_gt(pc);
> +	unsigned int fw_ref;
>   	int ret = 0;
>   
>   	if (xe->info.skip_guc_pc)
> @@ -864,13 +870,15 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>   	if (ret)
>   		return ret;
>   
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (ret)
> -		return ret;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +		return -ETIMEDOUT;
> +	}
>   
>   	xe_gt_idle_disable_c6(gt);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   
>   	return 0;
>   }
> @@ -956,13 +964,16 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	struct xe_device *xe = pc_to_xe(pc);
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> +	unsigned int fw_ref;
>   	int ret;
>   
>   	xe_gt_assert(gt, xe_device_uc_enabled(xe));
>   
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (ret)
> -		return ret;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +		return -ETIMEDOUT;
> +	}
>   
>   	if (xe->info.skip_guc_pc) {
>   		if (xe->info.platform != XE_PVC)
> @@ -1005,7 +1016,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>   
>   out:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return ret;
>   }
>   
> @@ -1037,18 +1048,19 @@ static void xe_guc_pc_fini_hw(void *arg)
>   {
>   	struct xe_guc_pc *pc = arg;
>   	struct xe_device *xe = pc_to_xe(pc);
> +	unsigned int fw_ref;
>   
>   	if (xe_device_wedged(xe))
>   		return;
>   
> -	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
> +	fw_ref = xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>   	xe_guc_pc_gucrc_disable(pc);
>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>   
>   	/* Bind requested freq to mert_freq_cap before unload */
>   	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
>   
> -	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0e5649b394b6..fc8ababc79fb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1098,6 +1098,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	const char *process_name = "no process";
>   	struct xe_device *xe = guc_to_xe(guc);
> +	unsigned int fw_ref;
>   	int err = -ETIME;
>   	pid_t pid = -1;
>   	int i = 0;
> @@ -1135,12 +1136,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
>   	    !xe_guc_capture_get_matching_and_lock(job)) {
>   		/* take force wake before engine register manual capture */
> -		if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
> +		fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> +		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>   			xe_gt_info(q->gt, "failed to get forcewake for coredump capture\n");
>   
>   		xe_engine_snapshot_capture_for_job(job);
>   
> -		xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> +		xe_force_wake_put(gt_to_fw(q->gt), fw_ref);

LGTM.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   	}
>   
>   	/*

