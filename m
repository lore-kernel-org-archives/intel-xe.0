Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954CDEB28CB
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 05:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4327610E0A5;
	Fri,  6 Feb 2026 05:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfD2Rbe4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F8610E0A5
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 05:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770357067; x=1801893067;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=d+5Jsvt6nfMFPkJbx9iryhPgbvY3Q8ohPd/MqS+/UGA=;
 b=TfD2Rbe40YHbO7n42bMUZMtxeAgMNKs9CQZXhcUTBhV6XTlXbhgkE1l4
 NMCZGenaLy6nmnQBRBzJdJwFjxW6zJ/N65YMRmxzZEhtMXFXwORof3+MJ
 rqBOMMrBshmAz1kBwTE3Ko3omrn2WxmWwe9asdcnpNyF+XP0FDczfIScS
 o6AM4WvB3lOo4JpE5tndCct5tZDmyTxdn6CDXaddL1JA0CcQ/dr9OV343
 Ega34YT/KIR4tyUZ6m2UrqIM8U2N+Ew8vPL799fRLgm6yfkTAwnedWCzo
 /AJxKORmeys8LUymyNImTzW+c0Jy//K1CiATTE7ONOiTiUUcw6nHDJvco A==;
X-CSE-ConnectionGUID: c6sw6I0KThy6UMu5YegUPg==
X-CSE-MsgGUID: 9PqjLVkoTlOyQ+Cc+K1nJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71630277"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="71630277"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 21:51:06 -0800
X-CSE-ConnectionGUID: f/WQvkCDRu+a2UDEK47vqw==
X-CSE-MsgGUID: h1JWqAxXSmqtjCHPkOCK7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210699190"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 21:51:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 21:51:05 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 21:51:05 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 21:51:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3bFyViS2ojce+5u4SDHgnLJg2qeVoG7XmabxIfOk8YO7dCsRQLzeCaKt9Oy3AQ/zelO6WjLUcuefYukAoIJVx8OqMZYnLWoC4mw/BeS55f1VbJ63+yjIKwizahIL6F5cHs3+hg2a3UHQsDY++2AZH6b3lAF7bx+kp3yxdRdwihILgoZ3utXyhIH532P0evQ4ZBBZ3cGkV3GRNiFVA7iSiuwwKmSNz/XEShS7IeGZaJdWEIoYxu0Ysn7+F+rrd+mmDvdy0oL/UzMam19dCoo+4IdvPzyw5AP6l1xGAjlQ3Hq034JCIevwkaTYtNzFC9EIS4Qd1lAJMS/9BUU04tRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gtWsbTyLau60uJXbOJkjyfQfTmszDqL6fMeemZ0i1Y=;
 b=ifaAqX8n8V72OEs7AhtMqes3/RK1caFewP30IzJmKTI8usupJHaFUsqF/XXcL4eMmVURWWalFUbPl3zLlIiMTX/Db+gkalS+/tCBfjYF7OuVai53a6iCHnbUFNhx0Oqbm5Fy4Tr3FCB4ch+MJ09/bABOsDvpMHKh2JKhdImdWM3+pzBwrhv3rwt+Hhfnm9yEwgqU3SCsY7cp6iI0m2OdbieRzRPVHLvJLVnLYGUSBHSrtqGDwkjuJumA1WuLnNNafm4jskW2mtPmcIe8vn/t29FoyqC4Ti/kUI3QnQGzb0UfArkcjTCWhlyNovJNjsEeJWRlCEG4WQRlNWHkDKMlJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7414.namprd11.prod.outlook.com (2603:10b6:806:31c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Fri, 6 Feb
 2026 05:51:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 05:51:01 +0000
Date: Thu, 5 Feb 2026 21:50:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] drm/xe: Forcefully tear down exec queues in GuC
 submit fini
Message-ID: <aYWBQpKv7oLZ60Mi@lstrano-desk.jf.intel.com>
References: <20251218214418.4037401-1-matthew.brost@intel.com>
 <20251218214418.4037401-3-matthew.brost@intel.com>
 <5a99db81-ebbe-4dfe-a528-1063c4bcf1d1@intel.com>
 <aWAC4EyhqZZT5tbe@lstrano-desk.jf.intel.com>
 <ae2f2a0f-8ecf-406a-816b-5d62f50e1377@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae2f2a0f-8ecf-406a-816b-5d62f50e1377@intel.com>
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: b851d151-9495-4e3b-ca70-08de6543b575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnNyTE5KelJiUTY0anR2Q1ZTNC9EMHFlUDEzTFpuckxHVTF6QVdiNnFYSFdn?=
 =?utf-8?B?VnBjRUtscjlhOWRzSGFkWnl0djlBcmdkWU1WSDBiY2h5bzNKUW1tVzk3RTc1?=
 =?utf-8?B?ZGQzSFl1Rks3OWYza21QT1lsaTdjYUUzVVltaVZrdmlHUU9nMkUrNjdVSmdB?=
 =?utf-8?B?cUg4M0lJS0c1ZzJlaEZNa2RKNlJxWW1MekN6MmI2K296a0xva1VMSFhKbzg1?=
 =?utf-8?B?VXNoWEhuNVN5YUpUNzFMakVYbWVxQ25GV3BvMHlrbVJ4Y3Y0OVRBUitpb2Nr?=
 =?utf-8?B?SFg3YUdZYlY4MUUyRERrL2tyWFRMTzNzc250YmpXUUJjL0dEQ1ZyWUZONjJO?=
 =?utf-8?B?dm9tUTJiRG1pTjg3U2paOGU5eXhDWTBwaU1weEMybFNwb1BSaDA3YW1oMDJX?=
 =?utf-8?B?U2dwOXFxWE16Y2d1M0h0YnJhaHlCZG1YL2lBQ3JEdzRaQnBoMThET2lPUHlw?=
 =?utf-8?B?YzV0eW5pY2FnaXRFT3JiQjNEZ3hkNVNiVG9BSUl6SHhQUVNmUGxKcVJ1ZTVm?=
 =?utf-8?B?SENoOG1QT2tSUFdqRy9meGNYb0ZsNWl6NjNlUEYvaWpDZi9NTEFaZzRITS9G?=
 =?utf-8?B?ZTN5NmRjaEhRMW1TSytidTZCS1hjRVFZQStjTTlwOFNIcmhuY2NJeUlyK3NM?=
 =?utf-8?B?M3BtV0FxM3pYSE4wNUViQk9LQ0xpNXVQcHhkdjUxMXhMdmtXbE83YzRMbjNq?=
 =?utf-8?B?aGtaMTF1ZHRGT1VUUEo2YzdObGNIWllyeDNQNzR3ZlcybnZhak8vWllJT0V2?=
 =?utf-8?B?eEJOODhVMUxCd29zdVVsTHhIOHZKSC9hZ3BhQ0pCM3ZBMkptRmM4QTJrazJP?=
 =?utf-8?B?cEd4aHN3RTlENVZBclR5MFV2MnpndnpUVTBOVjhEVG5BK3VldGpYbnpGaUxG?=
 =?utf-8?B?eEFzUGlFRlYvR2NOOCs3SzFoK0NFQU5xTWlEbjVlc1dIQ1QvWkpBRVVPekRm?=
 =?utf-8?B?bkhvUE9yVVE0clJsa0tPeVZsNU9GNVBJZDlUckdEMVgxWWFXbnFMQkNSZngy?=
 =?utf-8?B?b3FWVEhueCt0T1RWSFIyUk4vNDdLMXZ0czI4bklZS3Q1aFVscFhlaFVVQkdx?=
 =?utf-8?B?UmhWcXY0eG5JbUI5YThPZ2hxM0VFWndocndYY2JNV0NiZUZOMkNJNTFtZmZJ?=
 =?utf-8?B?Zmw2bUg4dXZzOGdrbWFGZEVVY3c5QUtSdFZSWmpuM0o3VTJXV0szc3dqVXBw?=
 =?utf-8?B?NzR0cTNueWQyblQ0clBqVlRqRWNUK0FlNmRTWnpaNVJWNEtRRjJadmlYelJZ?=
 =?utf-8?B?NDdKVC9KNFVqeWJjdkJmNXd5UjdPVllYcVpvcXVqK2JKY2xHQ3BsRHBLUE1x?=
 =?utf-8?B?eUZ3L3dUdWozWUNqWUVMTEllb0xacklkQ1dJR3FXczltcVVOZDI5dnhrSFZS?=
 =?utf-8?B?NjJpM1lvdENNalE4TTl4M0o0T1pzakJ2Zk5ycGxxQjN4a0c5UURsTkRHZmh4?=
 =?utf-8?B?R0FGSUJJQUpPUkIrakd3c2kzRWtqUm9kdWpJNE10SlZPSC9kUTVaNW9wWTlq?=
 =?utf-8?B?Ykd5MXhpaVVrS0lPa3RkZjJ6cTB0b1ltUXJwNnRmakdsanhzM215YUhRd29U?=
 =?utf-8?B?YU5XN21FaGRLb3ltL2ZKWEtCVVJNd3FBMkx1RHByYkZDTHd2VjhMenpyKzli?=
 =?utf-8?B?REd4VENEL080RkI3bnRidTNKRTIyKzI5eUpiWUFDWHlKd1lQd0hNL0VCZHdI?=
 =?utf-8?B?Y1JjQWFWNnFRU2QxYTZ3eXdldkJuQWRSN05Nb0dPamROVXhFeDhlZEhwWlV6?=
 =?utf-8?B?Q3ZXaWdIODRXL0lzcjI5Vm56VGxWRnlYaEZGay9LT095LzhZbTMzUzJaQzA3?=
 =?utf-8?B?S0d4bGtzNTJFVkc0STdyTDVTZFZDc1MrcWxXd3lHcDhZM3o4aWJjYkVMSXFL?=
 =?utf-8?B?R0VpbDVyYU9xQU0xV21CMEdGanBiOUpsNFkzRDRtcmNqUFZkazNNMTRuN3E2?=
 =?utf-8?B?ZVhib1lpTGRwYlBPdmRUaEtYdUkwTUxYaEVnQW15c0FuelRSYnNBbFc5WlZ0?=
 =?utf-8?B?UXVBTDdNeHh5V2Q3MGdoSkpiWkt4L3F6bFJpREJ3bFpjZUFkZXRxWWIybVBo?=
 =?utf-8?B?VTRTazJwVlJRVTlBMU0zSkMySHhqUkZJejFCSlh1R015b2Q4QnQwcjFzcXVU?=
 =?utf-8?Q?RRcQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkMzWVZhRFdlRmkrYTBEU2N3QXJHaTQzN1RkalZXN01QU041NTc0V3N2djJO?=
 =?utf-8?B?a09KRDZpTFA2cVoySGFHYXY3ejNLM0ZNdnVqQnhsdW5KUStmUnN1NmNYQnBs?=
 =?utf-8?B?SWMwUTdTVEIzQVZNTU5FazF2U1ZUQUZqUHU0SDdHWkxUNHlCcTM2ZTR6US8w?=
 =?utf-8?B?U21UVU5TcHJNWnlJaHhFODYrc2hCekl0UVJJNEdGTXgvRmtvTWViSWZLcVVl?=
 =?utf-8?B?UTRtdm1VQ0dkUFNJRzVMc2hGdDRDZGNXRmpUamU5TWRCZVEydUdhRXZrQ0hN?=
 =?utf-8?B?K24wWjMzQks3MlFPKythaURiaTFFZEE2S1lmcnZVRXBQNHN5TDlJV2Q5bHdV?=
 =?utf-8?B?UEo0ajVpa0lnTlRvb21rTUZtNEZWK3FFelN6MWo3a1psUTcxOWU2Mk9Jd3VQ?=
 =?utf-8?B?WXJpVURZNTVFcWd3dFdFTTBYTnF4OEhaT1hMc0ZxUENxWjRzK1RYWTBQU3gv?=
 =?utf-8?B?akw5aGUwclhvenJSelVuc3VLMVFuQm9ZUGk0b0poNWtycVdXVHV6cjFITW5q?=
 =?utf-8?B?WlVLb20yd1lOWEwrS2k2eXdtUDR6b2tRbGlYNFZrdzBORFZLb0RDV0ZDbXA3?=
 =?utf-8?B?UXNNNXRWSi96eHJWb0g0TXBPb2ROMk9wNFVZTk9WTTlGMTk3UjJwK0hKaWdw?=
 =?utf-8?B?SGRlMnRyTVV3M3N3dyt3WUVRYXFlK0pId05WQnoxem9wbTlnYTIyd0pvU0Rp?=
 =?utf-8?B?Umc4MjhaNXVFTFVXZGdrSHhuckdjUGVWZVpRUEorYVNObVFQRWN2OFpYYkRy?=
 =?utf-8?B?c0VXMTJqWUtnbERCa2dKOTRhcXVqM2xlVHc0M2RwVmFNS0hPVVJIK21jaUMv?=
 =?utf-8?B?cFJhVE9jZU4wRnZ6N2JWd3B3VElLelVxbnovbWdYZDZkR2RHZHg1QmFlZGRN?=
 =?utf-8?B?MERtbjh0V0dYT0FmYjMzRW5XVyt4c3AxNS95dUxqUWVUYksxMGE4S1I3QmNO?=
 =?utf-8?B?KzBsa1p5Y21vQTdjOUxiTTNPcklXV0hUTExML2szMnVjeDB1UFBIRTQzd2dW?=
 =?utf-8?B?cU5RTHNSaE1UZ3RadXZSdzkvNFBSNzQ1TC93aGxJM0oxdWJ3MCtjbU5jQlFq?=
 =?utf-8?B?WGNFTERLREZ3TWJxTkZRbytmMFhMNkU1M1hweUxhand4Sk5xWkp5ZnhIb2ZB?=
 =?utf-8?B?b0tVdDNYVGF5YkFDM0J4OWtzOFlYejgxTko4aEhDbmJqRzJtU1pxWUVkajN1?=
 =?utf-8?B?b0V1UEtBZHFBWG9lOVYwMnRiSXV2eUExbXVQOGx6dUJvdVZhT0tvc2VPTGkw?=
 =?utf-8?B?QldrNnF3d29qd3FqK1g1Z2hGbWdxREZKWGVGbWxpU3dqb2NHMFVmOTkxU0hF?=
 =?utf-8?B?dWF3bzhPNzFlQWNRdVpTdlh4Zjg1MFJFbE1YVG9TOU1yZTJGcHg2NnZjajhK?=
 =?utf-8?B?YTMvcGM3aUxmSXZVYjVqd3BkUXpFd1lNTmxLNWV4SDZKNXlFLzNBclhyN2dQ?=
 =?utf-8?B?NG9ZKzJQQ2VxcVVzaFhNSzArNmc3ZnlOc3MybzNWeFA0aDh5elBBZ0s0UzlS?=
 =?utf-8?B?Y1pPYzBkRm9aUGNkS1lIcVFleHh2SUhwNnVBcTl5QlUxMlR5RjJFWFR6bHFY?=
 =?utf-8?B?cWNVcnRpVDBMRDVWN09HKzlBU1I2dUkxeXdVVjUvRFJSSUV0THdsN1dweGEy?=
 =?utf-8?B?V0RDZjJncm9mQ1dxeVkrVE9rTHExKzh6MWZ1MkJXeHh3c21Qa0Q2ZVVjUFlL?=
 =?utf-8?B?dm11eHRtRHZQU1B1bFZET3JjSVV3RmwrU0xmSnNuVXpGOEY0TU4zSnprbW0r?=
 =?utf-8?B?L2I3Z1ByUmFpeCtSbGI0QkM2dWpOSGZRQXFKbDExM0h2RWsvZjhVYWpQbzds?=
 =?utf-8?B?QkFudDRsR0V6Yi80SndWVlY2dFFTL09QT2NWdEtUZTdwaklCbnFlS1hNeDFv?=
 =?utf-8?B?YUl5WUV2b1J1QWNrV0xWVVZOTWxOS2lMUldleUJ5SUkvdFl5UjNwNXJ1M1NK?=
 =?utf-8?B?T2laMWk0emZxbHpONWlhSXBUN2dJbE52YkRNU0FqWlVHS1hQR0FHa0RqRGVk?=
 =?utf-8?B?MlA3endJV0NrSWoyb2p1M3Rhc0FyOW1qaS9yMDZnU0JuZVdOQmJndnFoT1Fs?=
 =?utf-8?B?bWlDQ1VTQ3llYkRrUEU4UU1EdlJyOHVleE5Qdmw4R29VRENjM2pFNTd1dytT?=
 =?utf-8?B?VWZ1cWlEeE1wOWxDNkYzNkYvYkpyMi9qUlBDSFNxd0tsUktDbE5LVEdOdmJj?=
 =?utf-8?B?Q1dudDViZHdXcUVhWCs0VXNVY0Vic0c0eFI5VWNLeDZiTDJ3Vm9rcXk2cmNk?=
 =?utf-8?B?UkRtM1F3ZTdLbld3Y2FUMFdBOUFYNUhvNFRrOEd1QXNEQUNZbG1WV3ovVDgw?=
 =?utf-8?B?Y2Y1aVQxOXZvTTNNUUs1MjhvdEk1YnZQYVRNc3RCR1pBVkpYRERNUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b851d151-9495-4e3b-ca70-08de6543b575
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 05:51:01.6992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOWEQIob/UV9yZjTcm/fvt14iafM3bf10WcMhjJwOCCfgH0h8bwOdchL0u11k31D/HooUWi6IzpybJHiVQgyjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7414
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

On Wed, Jan 14, 2026 at 05:35:38PM -0500, Dong, Zhanjun wrote:

This is actually larger problem.

> 
> 
> On 2026-01-08 2:17 p.m., Matthew Brost wrote:
> > On Thu, Jan 08, 2026 at 02:00:15PM -0500, Dong, Zhanjun wrote:
> > > 
> > > 
> > > On 2025-12-18 4:44 p.m., Matthew Brost wrote:
> > > > In GuC submit fini, forcefully tear down any exec queues by disabling
> > > > CTs, stopping the scheduler (which cleans up lost G2H), killing all
> > > > remaining queues, and resuming scheduling to allow any remaining cleanup
> > > > actions to complete and signal any remaining fences.
> > > > 
> > > > v2:
> > > >    - Fix VF failure (CI)
> > > > 
> > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > 
> > > > ---
> > > > 
> > > > This fix will not apply outright to any stable kernel as it depeneds on
> > > > functions which have added in the KMD since the original commit. Likely
> > > > will have to manually send out patches to stable for kernel which we'd
> > > > like to fix.
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_guc_submit.c | 27 ++++++++++++++++++++-------
> > > >    1 file changed, 20 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 071cbfec2401..58ec94439df1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -289,6 +289,8 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> > > >    		 EXEC_QUEUE_STATE_BANNED));
> > > >    }
> > > > +static int __xe_guc_submit_reset_prepare(struct xe_guc *guc);
> > > > +
> > > >    static void guc_submit_fini(struct drm_device *drm, void *arg)
> > > >    {
> > > >    	struct xe_guc *guc = arg;
> > > > @@ -296,6 +298,12 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
> > > >    	struct xe_gt *gt = guc_to_gt(guc);
> > > >    	int ret;
> > > > +	/* Forcefully kill any remaining exec queues */
> > > > +	xe_guc_ct_stop(&guc->ct);
> > > > +	__xe_guc_submit_reset_prepare(guc);
> > > > +	xe_guc_submit_stop(guc);
> > > > +	xe_guc_submit_pause_abort(guc);
> > > > +
> > > 
> > > Tested this series over
> > > 265d13795b45 drm-tip: 2026y-01m-06d-08h-06m-43s UTC integration manifest
> > > ===(CI_DRM_17772) and (xe-4335) with (IGT_8685)===
> > > 
> > > and run test xe_fault_injection --r probe-fail-guc-xe_guc_mmio_send_recv
> > > --debug
> > > got few problems:
> > > 1. Assertion ct->g2h_outstanding == 0 triggered
> > > call stack shows:
> > > [  708.967261]  xe_guc_ct_disable+0x17/0x80 [xe]
> > > [  709.043382]  xe_guc_sanitize+0x31/0x50 [xe]
> > > [  709.119557]  xe_uc_load_hw+0x187/0x2a0 [xe]
> > 
> > Above is a different problem. Just delete xe_guc_sanitize from
> > xe_uc_load_hw, that call is nonsense left over from the i915 port.
> > 
> > xe_guc_sanitize / xe_uc_sanitize everywhere probably needs a look if
> > those calls make any bit of sense.
> Agree
> > 
> > > 
> > > 2. Page fault
> > > [  740.822070] BUG: unable to handle page fault for address:
> > > ffffc9000c80fc50
> > > [  740.828896] #PF: supervisor write access in kernel mode
> > > [  740.834063] #PF: error_code(0x0002) - not-present page
> > > [  740.839145] PGD 100000067 P4D 100000067 PUD 100ad4067 PMD 0
> > > [  740.844738] Oops: Oops: 0002 [#2] SMP NOPTI
> > > [  740.848880] CPU: 2 UID: 0 PID: 169 Comm: kworker/2:2 Tainted: G S M UD W
> > > 6.19.0-rc4+xu4335+ #3 PREEMPT(voluntary)
> > > [  740.859964] Tainted: [S]=CPU_OUT_OF_SPEC, [M]=MACHINE_CHECK, [U]=USER,
> > > [D]=DIE, [W]=WARN
> > > [  740.867952] Hardware name: Intel Corporation Meteor Lake Client
> > > Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS MTLPFWI1.R00.4122.D21.2408281317
> > > 08/28/2024
> > > [  740.881081] Workqueue: xe-destroy-wq __guc_exec_queue_destroy_async [xe]
> > > [  740.887820] RIP: 0010:xe_ggtt_set_pte+0x53/0x350 [xe]
> > > [  740.892900] Code: e2 48 89 45 d0 31 c0 f7 c6 ff 0f 00 00 75 56 49 3b 5c
> > > 24 08 0f 83 a8 01 00 00 49 8b 84 24 b0 00 00 00 48 c1 eb 0c 48 8d 04 d8 <4c>
> > > 89 38 48 8b 45 d0 65 48 2b 05 e6 41 d1 e2 0f 85 e1 02 00 00 48
> > > [  740.911428] RSP: 0018:ffffc9000074b9f0 EFLAGS: 00010202
> > > [  740.916599] RAX: ffffc9000c80fc50 RBX: 0000000000001f8a RCX:
> > > 0000000000000000
> > > [  740.923653] RDX: 0000000000000000 RSI: 0000000001f8a000 RDI:
> > > ffff888132562628
> > > [  740.930705] RBP: ffffc9000074ba88 R08: 0000000000000000 R09:
> > > ffff888168188000
> > > [  740.937758] R10: 0000000000000000 R11: 0000000000000000 R12:
> > > ffff888132562628
> > > [  740.944807] R13: 0000000000000000 R14: ffff88816818a768 R15:
> > > 0000000000000000
> > > [  740.951861] FS:  0000000000000000(0000) GS:ffff8884ebbe0000(0000)
> > > knlGS:0000000000000000
> > > [  740.959850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [  740.965534] CR2: ffffc9000c80fc50 CR3: 0000000132923003 CR4:
> > > 0000000000f72ef0
> > > [  740.972585] PKRU: 55555554
> > > [  740.975268] Call Trace:
> > > [  740.977694]  <TASK>
> > > [  740.979778]  ? __mutex_lock+0xae/0x1080
> > > [  740.983583]  xe_ggtt_clear+0xa1/0x260 [xe]
> > > [  740.987716]  ? lock_release+0x1df/0x280
> > > [  740.991519]  ? pm_runtime_get_conditional+0x66/0x150
> > > [  740.996436]  ggtt_node_remove+0xb2/0x140 [xe]
> > > [  741.000829]  xe_ggtt_node_remove+0x40/0xa0 [xe]
> > > [  741.005393]  xe_ggtt_remove_bo+0x87/0x250 [xe]
> > > [  741.009874]  ? _raw_write_unlock+0x22/0x50
> > > [  741.013927]  ? drm_vma_offset_remove+0x65/0x80
> > > [  741.018324]  xe_ttm_bo_destroy+0xd4/0x310 [xe]
> > > [  741.022800]  ttm_bo_release+0x70/0x330 [ttm]
> > > [  741.027032]  ? vunmap+0x4a/0x70
> > > [  741.030147]  ? vunmap+0x4a/0x70
> > > [  741.033260]  ttm_bo_fini+0x3c/0x70 [ttm]
> > > [  741.037145]  xe_gem_object_free+0x1a/0x30 [xe]
> > > [  741.041618]  drm_gem_object_free+0x1d/0x40
> > > [  741.045671]  xe_bo_put+0x136/0x1c0 [xe]
> > > [  741.049548]  xe_lrc_destroy+0x47/0x60 [xe]
> > > [  741.053691]  xe_exec_queue_fini+0x85/0xd0 [xe]
> > > [  741.058172]  __guc_exec_queue_destroy_async+0x7c/0x190 [xe]
> > > [  741.063770]  process_one_work+0x22e/0x6b0
> > > [  741.067741]  worker_thread+0x1a0/0x370
> > > [  741.071456]  ? __pfx_worker_thread+0x10/0x10
> > > [  741.075683]  kthread+0x11f/0x250
> > > [  741.078882]  ? __pfx_kthread+0x10/0x10
> > > [  741.082594]  ret_from_fork+0x337/0x390
> > > [  741.086315]  ? __pfx_kthread+0x10/0x10
> > > [  741.090027]  ret_from_fork_asm+0x1a/0x30
> > > [  741.093909]  </TASK>
> > > 
> > > Sounds like call xe_guc_submit_pause_abort here might cause trouble. That's
> > > why I call it in guc_fini_hw, which make the test passed.
> > > 
> > 
> > Thanks for the info. guc_fini_hw isn't definitely isn't the right place
> > though as that is registered before xe_guc_submit_init is called.
> > 
> > If I'm understanding the trace correctly - guc_submit_fini should be on
> > the devm exit handler.
> > 
> > Want to give my two suggestions a try? Also feel free run with these
> > patch / take over if you bandwidth. It is unlikely I'll have bandwidth
> > to pick these back up for at least a week or so.
> 
> With more debug print on begin(^)/end($) of
> guc_fini_hw/mmio_fini/guc_submit_fini:
> [  183.000171] ZD guc_fini_hw ^
> [  183.000187] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: GT1:
> GuC CT communication channel disabled
> [  183.003374] ZD guc_fini_hw $
> [  183.116889] ZD __xe_exec_queue_fini q:ffff88816a92d000 flag:0
> lrc.bo:ffff88816baa8800
> [  183.129725] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: GT0:
> GuC CT communication channel stopped
> [  183.130487] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: GT0:
> GuC CT communication channel disabled
> [  183.131138] ZD guc_fini_hw ^
> [  183.131146] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: GT0:
> GuC CT communication channel disabled
> [  183.134163] ZD guc_fini_hw $
> [  183.235099] xe 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked [xe]]
> [ENCODER:505:DDI A/PHY A] PPS 0 turning VDD off
> [  183.238289] xe 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked [xe]]
> [ENCODER:505:DDI A/PHY A] PPS 0 PP_STATUS: 0x00000000 PP_CONTROL: 0x00000060
> [  183.238415] xe 0000:00:02.0: [drm:intel_power_well_disable [xe]]
> disabling AUX_A
> [  183.238621] xe 0000:00:02.0: [drm:wait_panel_power_cycle [xe]]
> [ENCODER:505:DDI A/PHY A] PPS 0 wait for panel power cycle (500 ms
> remaining)
> [  183.747985] xe 0000:00:02.0: [drm:wait_panel_status [xe]]
> [ENCODER:505:DDI A/PHY A] PPS 0 mask: 0xb800000f value: 0x00000000
> PP_STATUS: 0x00000000 PP_CONTROL: 0x00000060
> [  183.758418] xe 0000:00:02.0: [drm:wait_panel_status [xe]] Wait complete
> [  183.774541] ZD mmio_fini ^
> [  183.774551] ZD mmio_fini $
> [  183.777314] xe 0000:00:02.0: [drm:drm_pagemap_shrinker_fini
> [drm_gpusvm_helper]] Destroying dpagemap shrinker.
> [  183.789419] ZD guc_submit_fini ^
> [  183.792669] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: GT1:
> GuC CT communication channel stopped
> [  183.793409] ZD xe_guc_submit_pause_abort q:ffff88811d5fd000 flag:10
> [  183.799955] ZD __xe_exec_queue_fini q:ffff88811d5fd600 flag:10
> lrc.bo:ffff888168fa6800
> [  183.807866] ZD guc_submit_fini start drain_workqueue
> [  183.807920] ZD __xe_exec_queue_fini q:ffff88811d5fd000 flag:90
> lrc.bo:ffff888168fa5000
> [  183.820685] ZD xe_ggtt_remove_bo bo:ffff888168fa6800
> ggtt:ffff88812c695628
> [  183.827536] ZD xe_ggtt_remove_bo bo:ffff888168fa5000
> ggtt:ffff88812c695628
> [  183.834390] ZD xe_ggtt_clear ggtt:ffff88812c695628 start:33239040
> gsm:ffffc9000c800000 gsm.:ffffc9000c80fd98
> [  183.844343] BUG: unable to handle page fault for address:
> ffffc9000c80fd98
> [  183.851153] #PF: supervisor write access in kernel mode
> [  183.856324] #PF: error_code(0x0002) - not-present page
> [  183.861406] PGD 100000067 P4D 100000067 PUD 100ac9067 PMD 0
> [  183.867001] Oops: Oops: 0002 [#1] SMP NOPTI
> [  183.871143] CPU: 7 UID: 0 PID: 298 Comm: kworker/7:2 Tainted: G S M U  W
> 6.19.0-rc5+xu4373+ #13 PREEMPT(voluntary)
> [  183.882305] Tainted: [S]=CPU_OUT_OF_SPEC, [M]=MACHINE_CHECK, [U]=USER,
> [W]=WARN
> [  183.889524] Hardware name: Intel Corporation Meteor Lake Client
> Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS MTLPFWI1.R00.4122.D21.2408281317
> 08/28/2024
> [  183.902650] Workqueue: xe-destroy-wq __guc_exec_queue_destroy_async [xe]
> [  183.909399] RIP: 0010:xe_ggtt_set_pte+0x5b/0x360 [xe]
> [  183.914482] Code: c6 ff 0f 00 00 75 5e 49 8b 44 24 10 49 03 44 24 08 48
> 39 c3 0f 83 b0 01 00 00 49 8b 84 24 b8 00 00 00 48 c1 eb 0c 48 8d 04 d8 <4c>
> 89 38 48 8b 45 d0 65 48 2b 05 1e 41 d1 e2 0f 85 e9 02 00 00 48
> [  183.933007] RSP: 0018:ffffc90001ce79c8 EFLAGS: 00010202
> [  183.938179] RAX: ffffc9000c80fd98 RBX: 0000000000001fb3 RCX:
> 0000000000000000
> [  183.945234] RDX: 0000000000000000 RSI: 0000000001fb3000 RDI:
> ffff88812c695628
> [  183.952285] RBP: ffffc90001ce7a60 R08: 0000000000000000 R09:
> 0000000000000000
> [  183.959338] R10: 0000000000000000 R11: 0000000000000000 R12:
> ffff88812c695628
> [  183.966388] R13: ffff8881329ea768 R14: ffff8881329ea768 R15:
> 0000000000000000
> [  183.973438] FS:  0000000000000000(0000) GS:ffff8884ebe60000(0000)
> knlGS:0000000000000000
> [  183.981431] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  183.987110] CR2: ffffc9000c80fd98 CR3: 000000010b9c5006 CR4:
> 0000000000f72ef0
> [  183.994159] PKRU: 55555554
> [  183.996847] Call Trace:
> [  183.999267]  <TASK>
> [  184.001356]  ? vprintk_default+0x1d/0x30
> [  184.005244]  ? vprintk+0x18/0x50
> [  184.008446]  ? _printk+0x57/0x80
> [  184.011648]  xe_ggtt_clear+0x104/0x2a0 [xe]
> [  184.015878]  ? mark_held_locks+0x4d/0x90
> [  184.019767]  ggtt_node_remove+0xb2/0x140 [xe]

ggtt_node_remove has hotplug protection via drm_dev_enter, but it
appears that drm_dev_unplug isn't called if the driver load fails, so
the device still appears to be plugged in. This becomes an issue if, for
example, MMIO space is unmapped in mmio_fini then sometime later a BO is
freed with a GGTT mapping.

I checked all the drm_dev_enter usages believe we are ok aside from GGTT
case.

> [  184.024164]  xe_ggtt_node_remove+0x40/0xa0 [xe]
> [  184.028728]  xe_ggtt_remove_bo+0xa4/0x2e0 [xe]
> [  184.033210]  ? _raw_write_unlock+0x22/0x50
> [  184.037271]  ? drm_vma_offset_remove+0x65/0x80
> [  184.041672]  xe_ttm_bo_destroy+0xae/0x2d0 [xe]
> [  184.046150]  ttm_bo_release+0x70/0x330 [ttm]
> [  184.050382]  ? vunmap+0x4a/0x70
> [  184.053494]  ? vunmap+0x4a/0x70
> [  184.056609]  ttm_bo_fini+0x3c/0x70 [ttm]
> [  184.060491]  xe_gem_object_free+0x1a/0x30 [xe]
> [  184.064966]  drm_gem_object_free+0x1d/0x40
> [  184.069018]  xe_bo_put+0x123/0x180 [xe]
> [  184.072898]  xe_lrc_destroy+0x47/0x60 [xe]
> [  184.077041]  __xe_exec_queue_fini+0x93/0xd0 [xe]
> [  184.081693]  xe_exec_queue_fini+0x2b/0x60 [xe]
> [  184.086171]  __guc_exec_queue_destroy_async+0x6c/0x170 [xe]
> [  184.091769]  process_one_work+0x22e/0x6b0
> [  184.095737]  worker_thread+0x1a0/0x370
> [  184.099448]  ? __pfx_worker_thread+0x10/0x10
> [  184.103676]  kthread+0x11f/0x250
> [  184.106877]  ? __pfx_kthread+0x10/0x10
> [  184.110586]  ret_from_fork+0x337/0x390
> [  184.114301]  ? __pfx_kthread+0x10/0x10
> [  184.118011]  ret_from_fork_asm+0x1a/0x30
> [  184.121900]  </TASK>
> 
> So the root cause of the page fault should be:
> 1.mmio_fini do pci_iounmap
> 2.writeq in xe_ggtt_set_pte access valiad address (ffffc9000c80fd98)
> 3.Since already unmapped in step 1, the page fault tiggered.
> 
> The excution order of fini(s) is:
> guc_fini_hw (for each guc)
> mmio_fini
> guc_submit_fini
> 
> meanwhile, it is the destroy worker perform the bo release action, that
> causes problem, the worker out of sync with the managed actions.
> 

Yes, this is an issue with all versions of this series, even with some
of the further suggestions I sent over today off-list, if hotplug
protection doesn’t work in the GGTT code. We might need to open-code the
protection in the GGTT code rather than relying on hotplug.

Matt

> Regards,
> Zhanjun Dong
> 
> 
> > 
> > Matt
> > 
> > > Regards,
> > > Zhanjun Dong
> > > 
> > > >    	ret = wait_event_timeout(guc->submission_state.fini_wq,
> > > >    				 xa_empty(&guc->submission_state.exec_queue_lookup),
> > > >    				 HZ * 5);
> > > > @@ -2459,16 +2467,10 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> > > >    	}
> > > >    }
> > > > -int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> > > > +static int __xe_guc_submit_reset_prepare(struct xe_guc *guc)
> > > >    {
> > > >    	int ret;
> > > > -	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
> > > > -		return 0;
> > > > -
> > > > -	if (!guc->submission_state.initialized)
> > > > -		return 0;
> > > > -
> > > >    	/*
> > > >    	 * Using an atomic here rather than submission_state.lock as this
> > > >    	 * function can be called while holding the CT lock (engine reset
> > > > @@ -2483,6 +2485,17 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> > > >    	return ret;
> > > >    }
> > > > +int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> > > > +{
> > > > +	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
> > > > +		return 0;
> > > > +
> > > > +	if (!guc->submission_state.initialized)
> > > > +		return 0;
> > > > +
> > > > +	return __xe_guc_submit_reset_prepare(guc);
> > > > +}
> > > > +
> > > >    void xe_guc_submit_reset_wait(struct xe_guc *guc)
> > > >    {
> > > >    	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
> > > 
> 
