Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562F6EEC2BC
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 01:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C9D10E0A9;
	Tue, 24 Feb 2026 01:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNAu6iLR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF1910E0A9
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 01:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771897530; x=1803433530;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=D/CaGl0RmYBruA3uNUFIkDTqIA8YDDhWOuAUW0miBhY=;
 b=DNAu6iLRhlJ14sgTFDrtYR7OrmnvE64ZIcwNHOdw0dSSkfbo89lzrQAT
 PdgXvFOGFjYWM1Z8sTFXpFBgynWOYwqcNGLPGg/XhLkS2VJNG8gifPtbG
 6CIr3ShIAaRu9x1sDr/BkrcsL2ZSuAn+GSF66VYQLhUP5HtRjMNyw/W13
 vjSbxvk+pl5leppAKy1HryJDI5ChDFVKBIlKcIJXVhXH9HXYHB/lLnJZs
 p+UyLCEitxT8MDCMp+Qc7YabH8+LlAUX4fhs52CMlOBxmjbv/YsHAEakF
 E02bed++uRgavjbxdfPyc/meI9/WfXE/ApM4INk1M0sebb/iJzZLScR1s w==;
X-CSE-ConnectionGUID: JIVxfCmHRPiB/JHqd5J0ng==
X-CSE-MsgGUID: uZh1NvJ8RNKk/3LXOMvXBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72116311"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72116311"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 17:45:29 -0800
X-CSE-ConnectionGUID: W9Tz011mSO+USUXDWSTeNA==
X-CSE-MsgGUID: oXbEyhCkTeWPYi162WjKzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214819818"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 17:45:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 17:45:28 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 17:45:28 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 17:45:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTPHHX8NspBlo+ZrRDPMuJ4I+J8jDLgejfZqs+7nZq+AKv0Zpw5q28ZadR1uam4eudGX3zDGSmbW4LVecxrvcADIqnYh8QKyt+aVVXXF4SU/9lGoJOdatN/gjcC/zRiTOdbDgzJIfaGCXpbuiggofgiitV1QAYR2Fiy1c5FBi1SJGwvH76TKc0iaBQjlqDpEgAX02kwAkq2v0AXsMAliKfUpSHuQOUskGZkYnPLGh4z6m+xEYs862n5pdNn3uy0zq12rgCaPo5dpJle9oO06bDm8j3tOoK1EvcaW2wOh6w+sMYCDcC7FD6GFzrAQKJHWGCcSK3EdRnxM4Uomzg4NmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Un7+46dpUF0p+97DD/GWqvsOv3kvv/NqZqdXnZgTa8o=;
 b=oDPlCyJZ11SxOgdclCGVoX6j46cv6kFhA2KnTiBnFI6H+0as6spRoRMSPHuS5CCau9/PNEdGZLoC2YwDfS00L2oFVwWwUFwj8sDHQdrG3P5WAWvg2ekRn+dmO4YJweZrHtd1FK0DMcOCDkj7/B6aUXJO5qlcAoFgwbtwGNEvjLlJdqgMwxC+7ntFXfmEsG29S+MG0AV+iGIdowDh+udVBgo2cjFLeIESHEe2wE1MWg0bHJld5fisGuDp7A4aFgrQIjJxvqtBzTTOp9M8rrll2+uTYqvJyny94aSTcMwgXV86TUNppXNUeEVXBM6vtjqUEuwPsfGEA968UVPcPWwgTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS4PPF4B1ECA5EA.namprd11.prod.outlook.com (2603:10b6:f:fc02::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 01:45:26 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:45:26 +0000
Date: Mon, 23 Feb 2026 17:45:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Skip over non leaf pte for PRL generation
Message-ID: <aZ0Csw/3hh2Jv1/k@lstrano-desk.jf.intel.com>
References: <20260129082756.1096935-3-brian3.nguyen@intel.com>
 <be5e3d57544ece734dec2513ab4717e80b49adec.camel@intel.com>
 <aZzb5COhqfv/3SBF@lstrano-desk.jf.intel.com>
 <943064bb067941dd6883ebd60514bc147d346da6.camel@intel.com>
 <SA1PR11MB88390D32C4A1C2BDC6629BD3AA77A@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB88390D32C4A1C2BDC6629BD3AA77A@SA1PR11MB8839.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0174.namprd04.prod.outlook.com
 (2603:10b6:303:85::29) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS4PPF4B1ECA5EA:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb7d231-88d7-4017-915b-08de7346622c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVg0Vmo2NTByWVZ6ckFxVFJmdWNrNzh1aE9pYUVqOHAwSVF4eVk1azJZKzVs?=
 =?utf-8?B?dlZSS1dUV0ZiSnN4NXFlZ0Vrbjh6TzJjblJVQ1hIYWxrYmFyVzJHN1hPY3Fk?=
 =?utf-8?B?UmdoQXU4ZExiZzJudW04MzhBalNoS3gxU09CbDVrY01QV3U4NUMzSWRDT25r?=
 =?utf-8?B?OWcxdXV3YVJTak5Cb2V3L1RLWDFTRWlHRDRUQzQ0SmhOREY2N3RPcktweWwx?=
 =?utf-8?B?MWhINjlXNWMzaEdGMVRhRTRqV1BReWp2d00vZldKUk9WNnoxaGtudlJPN0xh?=
 =?utf-8?B?ZE9TdEVxL2NONVJ5TFoyN3ljNTIxa1NkRGNxdS9LM05ocG04OFY3YkFPcE1q?=
 =?utf-8?B?blV0WUVUMXc1b1htTTVHOS9LTGdHc1hSR2ZlKzV2MnBWTGxkZUJYaG55SThR?=
 =?utf-8?B?eGZpZUJUdHhlWkRuSlFqSVBDaUJ6VXdXbW9yQlUzOC94NjhtU1ZJc0xpWUM2?=
 =?utf-8?B?WWtOZWM1UXFVSXVreVRLVjFmcTFUVHFlck9rTGpsd0VBQVM4bUVwM0t6VkZx?=
 =?utf-8?B?VlNjSmFFM3d0QnhhNkdLamYvZ3BOUm9UTW9OS3llRGZiQStPYlJXVFowRTN3?=
 =?utf-8?B?WUJzejcvcG45M1pVOGl0cWFCa2ZxU3RzN1U4TTdUcVRZaWhncHIxNkZxN2tJ?=
 =?utf-8?B?ZE1jOTh0cWY3a2J0NmNVdHZhNWJ0bXpoM21hN0hlMTYrWFJPallvNHh6Z2Jv?=
 =?utf-8?B?eUtnc2V6Q2hjcjRjNHowclhSMi9xVWg1aGkzR0VtenhnelUwNlJLa0dacnUy?=
 =?utf-8?B?aW5BZGYyQVRTZVY4NHFrMzJ4cVNrditOV0xRQmRFTkw2YjVaSW40MVYzNmxN?=
 =?utf-8?B?Q2U2OXBMcWl1ZjFGNkd0aHBUQTFUalhKVlduS09hQVdlek1yajhZenpKajhm?=
 =?utf-8?B?N2lsQ3VJUVExb1lGd0dLL0ZVRFZLd01mNVdabExWREpZL29OQTFla05NRDFt?=
 =?utf-8?B?OUFEcnErZy81OUpzQWlMSS9GMkhEZVVBYTJMdE1COHJJcGZaT1hsOEs5ZDk1?=
 =?utf-8?B?OTl5SFpYZzVhLzBCell3SGxiRWN5eVRwVkx0MHc2OVRNbmJrRFlYaVFRY1ky?=
 =?utf-8?B?REFuRGw1M2tyQmZsYVB6SDFjNGMzWng3NG9ycld5VjQrM0FHRzBUVDdPWkRI?=
 =?utf-8?B?YVB1MmJzcXVuZlJOcTBibnFLNkVkTklhSDhmSkJwWkpPNXpaMjhqbUZFbG51?=
 =?utf-8?B?ZDFDNkVKd2F2SUFtZ1M2NWo4dXNDdGhjaDhjS3p5VVVKcW5SbTIxUWtaN0k4?=
 =?utf-8?B?enRYcTlXci80dllQRWhOUlFVbm1SajM0MlVSc0h0WmRqMDBKYzBpQytyMTVj?=
 =?utf-8?B?ZWhzdzl3enFmRUhiTWRFTG5BUTR1bGg3WEZPc2dRUGF5cE5DOURBdmxpS3Vs?=
 =?utf-8?B?ZVhnS2hDRjQ0aG1lRFJPWnZpVklna0F5dTk2b2lQbWtCa2FVUDVqVXVuZGls?=
 =?utf-8?B?NDlIKy92ZmtheWR4U0pHZHYxWlFLZnhpQm5Hc2IreUcvbEQvV3FNUktmTTZW?=
 =?utf-8?B?WkMrU29yV09lWnAwUjVPKzBNYzJGT20rNWk3MzNTZ0NaTFNyTVA4MEFRc2sw?=
 =?utf-8?B?TWd2clQ1ejVNYkY1eEp6YmtCOFBzSnc0K3pEYlZENktuSjRvUzhyVlhrWG1u?=
 =?utf-8?B?V1B0dGZldG93UFZDUDZZRVYxVkcycFhlVHZLRDdnY2FldVpSc2hWaUNkMDZ6?=
 =?utf-8?B?THVQODBtR3duc1dWSHdBTlltMVZWb3BTZHVlNnd6VHFoWTlhaExhMkxwQlBr?=
 =?utf-8?B?YXEzR2dkb1dCT3QrQy9ETHY1YzNYUGxUYjhHVzR5YmJUTmlDM2dBQXZpaEZs?=
 =?utf-8?B?VDdFdXAyVlVrdEIxbUZmc3VTZHVFaktvZk56WWhuT3h2OXU0RDIwVlVLbEdL?=
 =?utf-8?B?MUE4djNQeTJMcmx3QmJRdTNKd1dHQ2tYcjBtZG4zUko0TkZJNXByMGRTOGJG?=
 =?utf-8?B?Y1VKV0ttNUUzZFJTdlJjazZoN0JQcXZIdm80UkRNZHR1TENsWlpFYlcrMS8r?=
 =?utf-8?B?Z004Y2xhNGZXUVBKeGR4QnRYWmk0VDNIWVVNMjZ3dElnam1vTFJFUUVHcXNz?=
 =?utf-8?B?bkkzbDIrNk5uN1Axc3pVMzl2bWxkSC80TzdscnpvNlZNbGlQT1ZqTEtyVERq?=
 =?utf-8?Q?zQ18=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVRWMG4yTWw4a2twU3JSNkNwQUtlQVpzSitQYm9TcS9DSEQwNEhUNGpCeU1S?=
 =?utf-8?B?Q3lCb2I1WkVHSU9SOXhqVi9WRldxS0N6Vzg1TjgyZjJ3K25rUUlMTk9wbjRs?=
 =?utf-8?B?ZW5mbVRadGNoVllXRWZBdk9EK0Z0bUxMM0RVeDYrdUpoK2ZidkZLRkVrVk1k?=
 =?utf-8?B?d0lKZlVrbjM3M2wvczcwaUZXRm1lU2lmODNmVHl2cWh0bnc1MHpXNlQzcEFN?=
 =?utf-8?B?OWFaSmlsdFBoZUxhQkVjQk9TY2daZFRJSmtuUXJmN1E2VlB2OVlaOWpvT1M5?=
 =?utf-8?B?aVZEa2JMc3ovbHJIbTNTY0hlNmswVUlHcFgzWGNxZkZXejAwYmhjLzJvNmFw?=
 =?utf-8?B?T1RZYnBxN3o4RzhlMHkzVHhCUnZtU01vcTBVR3IzbXlkQ2tTcnlJQnp2WEg2?=
 =?utf-8?B?aEFTWGtBMkJSOWFJZlB0YUZRVjhvZ1IwZGwvOUZYazd3SFNCaE9yVVM5dzNO?=
 =?utf-8?B?MElVaDQ5SUM5b3QvOExIeGE1SWl2L2VyWTFBb1cvbnZqcjV2WjFwd1dvTitz?=
 =?utf-8?B?RnJoeERqOTJYbWJvOVAyZEtGTEJTaDRFdzlSVERyYzBERHY3a29lZHFHcDBE?=
 =?utf-8?B?VHRkNTlDWmgwQnNYTnNEbFlvZmJINjk5OFFQRHJ2dHlpaE1yTTVyRm5GT1l4?=
 =?utf-8?B?Y0dBOEhSdVNGTW9ZRDBUMXlodGdLMGtyaHNmQm1TNW04ZXVZLzc4T1V3a1dh?=
 =?utf-8?B?MmlwUUszRGJ6NmNzYXBtbVdFTU5KekZabWxSaHpUV3FBdUFtbDBOelJJeHlK?=
 =?utf-8?B?VWg5NTVuNWZkV21rOFMrQndzS3JhVC9NRmRIRHFLRjZGOW9YNTNoNTVUK0Ir?=
 =?utf-8?B?MUVuYmpCL1lTaXpNM3V4WmdFa2tzZ1lFWTBiSGVFWFdnM0dCdkRMRGpXRGhD?=
 =?utf-8?B?RXl2aHdkbjBsVUhmd3hyVjBMRk9pOTlVR2prWG82RklpN2JoM2ZudWsvVGdk?=
 =?utf-8?B?Tnk0UTRyWEJqT3p3YnRTWW8yRHlXUzBaVFUrc3BlaDZnSndVZVJVd1ZYUFls?=
 =?utf-8?B?SXZKNmFpYjlWaGVoeUI4VGRSWkVKaXYwSnVKaXUydFk0amp5dmhxR0s5c2Zm?=
 =?utf-8?B?cjllK0pjVkdFakwveXNKeXpDWnQ3SFNkdmpCTnQ5QlpZUko4VWozaUNWcE01?=
 =?utf-8?B?djFhaVhXcXZlSE5DZjZlaHZGVlRMOUFyNkdwWVdpckRzU2tPem4rVXJSTTdx?=
 =?utf-8?B?czdTaEFVY0ZkeWx5VlZwRVN5V2pyaGtrN2lNdTB2d2NCeUtzbzdOa09KYUJr?=
 =?utf-8?B?bUxaQldzSHVmL3daN3JqY1NUTzU3OC84UG51dkFkQU9uV2RRSmlHaXNJcXFU?=
 =?utf-8?B?OWdEa0hvZkUwNHZiZmZnOGJ4am9oS1dOZUxSeWdBK1RwcW9ubFhNM29jNDJS?=
 =?utf-8?B?R0hYQ3ArTUJsSk50V0JtakZtY0dYN0Mxb2Fjd0FYVVNlU2ZSN2M1SlFhMCtj?=
 =?utf-8?B?N0lTMkRsaFB2bUFpUHN2VzVTellWb0tlaDdDM1RhN0RqVzU2dE53UTZVbDBF?=
 =?utf-8?B?TW1XOUkra2xyZE16MDYrbDhnRURNS1hhSHZ3eExZNEJKY1lkakRKNjVLVjA1?=
 =?utf-8?B?bDF0VlhZS25CYzRWMWZXODVRYVo0eEdTRXh2WEZyRzBYdlY5c3d5emo2TGJn?=
 =?utf-8?B?cDhNRmdwZkF6S1o1eXp6eUxLck1BTGxhbWlMbHMxcFVXNEZhZDdzcFp4aXgx?=
 =?utf-8?B?RWlZSWpna2Z6VjZkdUZBcEZqN1B0RzBHdkVBYWpVMldScXBhVUZWL1huWVkz?=
 =?utf-8?B?UzJOYnJzVjlTNzVsdkdndFVpanRENnQxS2Qxc3pIT2hQVXRseUFkV1Z1V0ho?=
 =?utf-8?B?TFpCRzFzeFJVSmExZC8rQWpZcmNuKzJzSlQxbVNUT3hwYmQ2UkNoeTMvRFh3?=
 =?utf-8?B?MkFsbWNENzNtOERveSs3Y2dLRTBZcFhMWnhGVndhd1dMVHlUQkxLY2RxOHBW?=
 =?utf-8?B?OVJ3bjZhbTVSVC8rUVYvZFpYSE9NL1Y3di9rTHVzNTI0bXFxaHc0UzBVRC93?=
 =?utf-8?B?T2phOWpmVUpZZWltMnRWWHBnY1AyV0gzYVNqeTlUVVNiK3Mvd2NGQjJHOXcy?=
 =?utf-8?B?L09DamhkOHRjSThCaUk1U2luWW1hcjZxOXZFMEU0cWRkdzlNTXRCMmp5d21X?=
 =?utf-8?B?RDgxNDZHVVQza3Z0N1FkTVFRT0k5Zm1WNjFNakp2a0NaRGxCODgvMnNIQ0pD?=
 =?utf-8?B?d21vSjBCN2pNYzlzR3NwM3dOaWtSekNNRHhUVTlFZDFUQ1dpV2s2QWVWYndz?=
 =?utf-8?B?ZXBZZWVqTlZIcVEvSTRZcXdFNjBxeUlWMmZlZk16NlNLeUc4UEZsVWZsMUt0?=
 =?utf-8?B?aUhPSHU5ZDVsVXdnbFh4SDM4Q0FtdDVFS2dnZ0RJNlF2UlFPT3BleUhTSlE0?=
 =?utf-8?Q?iAfmjEoS7MB3MRXE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb7d231-88d7-4017-915b-08de7346622c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 01:45:26.6338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xw7kEe0imdKfzzm+HYwNsJaPRMD4qPP+xiC8iiu6wpCftqL1jCbuZy97/jL6mHYOQJbYuk0v6zYoSfwdo6UCVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF4B1ECA5EA
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

On Mon, Feb 23, 2026 at 04:33:30PM -0700, Nguyen, Brian3 wrote:
> On Monday, February 23, 2026 3:07 PM, Stuart Summers wrote:
> > On Mon, 2026-02-23 at 14:59 -0800, Matthew Brost wrote:
> > > On Mon, Feb 23, 2026 at 10:49:21PM +0000, Summers, Stuart wrote:
> > > > On Thu, 2026-01-29 at 08:27 +0000, Brian Nguyen wrote:
> > > > > The check using xe_child->base.children was insufficient in
> > > > > determining if a pte was a leaf node. So explicitly check for if a
> > > > > pte is a leaf through the bit checks.
> > > > >
> > > > > Fixes: b912138df299 ("drm/xe: Create page reclaim list on
> > > > > unbind")
> > >
> > > Move the Fixes tag by other tags (Signed-off-by, Cc)
> > >
> 
> Got it, will move.
> 
> > > > >
> > > > > v2:
> > > > >  - Remove old assert. (Matt R)
> > > > >
> > > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_pt.c | 13 ++++++++-----
> > > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > > b/drivers/gpu/drm/xe/xe_pt.c index 6703a7049227..b73a356d0fa1
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > @@ -1655,7 +1655,7 @@ static int xe_pt_stage_unbind_entry(struct
> > > > > xe_ptw *parent, pgoff_t offset,
> > > > >
> > > > >         XE_WARN_ON(!*child);
> > > > >         XE_WARN_ON(!level);
> > > > > -       /* Check for leaf node */
> > > > > +       /* Optimistically check for leaf node, may not be
> > > > > guaranteed
> > > >
> > > > I would keep the comments the same - we're still trying to check a
> > > > leaf node here and we aren't really doing anything special. If we
> > > > have questions, we can look at the commit history to determine what
> > > > changed from your prior implementation.
> > > >
> > > > Or if you want documentation here, it's more interesting to me
> > > > *why* we
> > > > can't see this from the child alone than just the fact that we can't
> > > > (which we can observe by the if condition).
> > > >
> > > > Also applies to the comment below too.
> > > >
> 
> Ahh got it. Let me reword the comments here with more details depending on the changes
> we make in the comments below. 
> 
> > > > Thanks,
> > > > Stuart
> > > >
> > > > > from children alone */
> > > > >         if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk-
> > > > > >prl)
> > > > > &&
> > > > >             (!xe_child->base.children || !xe_child-
> > > > > > base.children[first])) {
> > > > >                 struct iosys_map *leaf_map = &xe_child->bo->vmap;
> > > > > @@ -1675,10 +1675,13 @@ static int xe_pt_stage_unbind_entry(struct
> > > > > xe_ptw *parent, pgoff_t offset,
> > > > >                                 break;
> > > > >                         }
> > > > >
> > > > > -                       /* Ensure it is a defined page */
> > > > > -                       xe_tile_assert(xe_walk->tile,
> > > > > -                                      xe_child->level == 0 ||
> > > > > -                                      (pte & (XE_PTE_PS64 |
> > > > > XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> > > > > +                       /*
> > > > > +                        * The check for xe_pt's children is
> > > > > insufficient to determine leaf.
> > > > > +                        * If not leaf, break out and continue in
> > > > > next page walk level.
> > > > > +                        */
> > > > > +                       if (xe_child->level > 0 &&
> > > > > +                           !(pte & (XE_PTE_PS64 | XE_PDE_PS_2M |
> > > > > XE_PDPE_PS_1G)))
> > >
> > > I don't think XE_PTE_PS64 needs to be checked here as that should only
> > > be set at level 0.
> > 
> > Oh that's a good catch. PS64 has a specific meaning within the PDE. Are we trying to check if this is > 4K basically?
> > 
> 
> This was checking if one of the bits indicating that this is a leaf entry was raised and if not, skip adding this.
> So, checking for if it’s a leaf PTE (which would have one of those bits raised), not necessarily if it is just > 4K.
> 
> Previously I had thought to remove XE_PTE_PS64 since level == 0 covers the condition but just for clarity of
> checking all leaf PTE, I kept it with the assert and then kept it since I inverted condition in this patch.
> I'll remove XE_PTE_PS64 in next patch. Thanks.
> 
> > Thanks,
> > Stuart
> > 
> > >
> > > I agree we xe_child->base.children can be set at level > 0 but now I'm
> > > thinking the outer if statement is wrong wrt to
> > > 'xe_child->base.children[first]'. Couldn't
> > > xe_child->base.children[first] be NULL when subsequent
> > > xe_child->base.children[first + 1] be non-NULL?
> > >
> 
> I believe this was the issue I was running into with one of the test cases. Having some sort of non-NULL subsequent child declared here

Yes, but any check at outer level of individual children doesn't seem
right.

Let's give an example of a 6M unbind.

Case 1:
- children[0] == NULL (leaf)
- children[1] == Valid (not a leaf)
- children[2] == NULL (leaf)

I believe you correct code correctly generate PRL for children[0], break
on children[1], so children[3] is skipped. I don't think this is
correct... On hitting children[1], I believe in addition to breaking the
loop, you the PRL needs to be invalidated, right?

Case 2:
- children[0] == Valid (not a leaf)
- children[1] == NULL (leaf)
- children[2] == NULL (leaf)

The entire PRL generation is skipped but the PRL is not invalidated
which seems to be problem as leafs are skipped here.

So I believe this entire logic needs a bit more rework than this patch
alone.

I believe the logic is roughly - at level 1 / 0 always walk all the
PTEs in the PRL is valid, at level 1 if any non-2M pages are found
invalidate the PRL if we are not going to desend further down (i.e., we
cover the entire 2M range).

This fairly complicated, so I'd have to type this out + get on test
machine to provide further advise here.

Matt

> with the xe_child->base.children[first] = NULL. But determining if this PTE is a leaf entry would require us to iterate through all the childrens
> I believe, which is why I had kept that check (xe_child->base.children[first] != NULL) as sort of an optimistic filter and had this new inner if statement
> to ensure that these entries are leaf entries.
> 
> So, what is your suggestion here?
> 
> Thanks,
> Brian
> 
> > > Matt
> > >
> > > > > +                               break;
> > > > >
> > > > >                         /* An entry should be added for 64KB but
> > > > > contigious 4K have XE_PTE_PS64 */
> > > > >                         if (pte & XE_PTE_PS64)
> > > >
> 
