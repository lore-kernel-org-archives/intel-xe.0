Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950E6C25B4F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 20:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C341121B4;
	Wed,  8 May 2024 20:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgmuJFWf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044DF10FCB0
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 20:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715198844; x=1746734844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aNm6zrScWdUN906d2QYsq7uutD+yE5gyqlV7LlH8uE8=;
 b=IgmuJFWfQe0vNXfQYjYUb/hjrDz4+EDkOV8MchSnzdTADzbuO3g9jusD
 HW0/XRFbK3+Tqx/gJVmCGYsCdqHx8N+Y9dFQ+0/I5xkNJK6fUxZIvDfU7
 gRu6qtYxRRPjkzd6JIwrscdioibTNWfvj5U2Bj4e6Jm25deic3/qJK6Sm
 AySGwWvDRmU6kfu1tTctans4W35qpRPPg8sgwsBD4jTB95Jo3ROBkRg/i
 NZqcjuO9j4DJZ0YlW/iM3sGOdGIlvq2VkkO2z+/R+4biMLDrs/c0JX7Uh
 GTeErGdizK61LkZizTaOKednklpz3thsGqu3HUIkGF5ub1lUII13muCor A==;
X-CSE-ConnectionGUID: mAW2zpFqSQqrrGnFkMnN0w==
X-CSE-MsgGUID: toZG4764SdGmTNbqbxeGAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="33595239"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33595239"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 13:07:19 -0700
X-CSE-ConnectionGUID: 3j/Ez7uoQ3SInqnngQaLrA==
X-CSE-MsgGUID: qDQuyzLcSkOaz/HXgQ1rpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33834356"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 13:07:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 13:07:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 13:07:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 13:07:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHTJSiPWFRUi1uxNaBmbCB+QKjgHsaYM7FOx45mSHiHDS4shmb2pVRP8rvDcU2k1/9EKWdU5HME0Tbog+i3pdQEV5VB3zykGYX+Ta2zriBisuFNCEfWVyjOaYqNCYwZ9wZfAUWfDCO+EUgJ97UUAYm4ymsYcRvsSw8hpl9xqEmxVSWTV6HLf9lQRvrju+g7OHOlGY8oxWN9mG+8wd6gUt+jhhB9Ci86tcAkQIWGLYbCDDAQPM6e2+iSYOOs56jTJCGquowOD4bRxvbVe7oYWliqeX9NDakSK72T5U5ar5g+NnumrNWse0HpOP47UrrAKrQdTjwcIDo5kN83ZX4aIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VflBNx16Zgn0Zx8i8xIDasJ0F8Lk80jHY00keBZMSpo=;
 b=blY14jJ1QnnUg5a+5zF0Xks9BvVaIbBQ6p+EZHIKk0GGdl7FWIFvYYf3+it55sDlOhBZPaCzFjS3EDxzcCCOqro/Ceak/ThoTmXxE+76/5b6ahJo9dirrAnFiSfjsI8ohRR9lFu8vugKfXD8I5ShCGxsxavPKXV0Rne5BGuLd8dBwGyF6O9jsRPZqkQJIRM+yRUWojrnb14EM+cJg2etj4JZUbzxwdjU8J2tlSZD4a/F3ARhDPKbJebfbrgMJTNVpIzGsFI7klvm2mHx59oXYPWxBCq9H/52arTWjpbf4SZwPDHlYSeixUmjArclefPnxKWltmosfb9Wtm6JFr87yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.34; Wed, 8 May
 2024 20:07:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 20:07:15 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/7] drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
Date: Wed, 8 May 2024 16:07:02 -0400
Message-ID: <20240508200707.375414-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508200707.375414-1-rodrigo.vivi@intel.com>
References: <20240508200707.375414-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a018f31-ec76-42ab-6a97-08dc6f9a74a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXVlWGJ5ZWxPNVBWTkpacmpMUFk0eUZQdVd4Yi92QThPT1JxTEt2MVBzNWx1?=
 =?utf-8?B?Mm5xNFNpUERnSnJiMVhWMlkzaVEyZVZscGxHeWJ2c0F4QnFwVjFkajRobzND?=
 =?utf-8?B?TlVsVEVWTEhYdXlFVWNCZkw2M3lVNnloek43cmpzQmFtZjBjVFZjTzI0d2FG?=
 =?utf-8?B?eHQ3dVV1WVVHZGoxZTFPZGZqQ1VVcDV1SVZpMENBMFkwM0tVbDY4NFh4a2Zh?=
 =?utf-8?B?cDVZRmZ1V00rcXFWcnNMeG5TYmtGS3VrSE5UMDdPV0Iwb0IrQ25EanJYbjFO?=
 =?utf-8?B?MWkrNTkwYzdWVGNjZjFnais4SGJ0V0VxVDRHeXgvaXhvVStjMlIrWURDWTlE?=
 =?utf-8?B?REFzUFJHajNCaDBUZlg1Z3NOcFJjd0t2cDV5TnM0ZlZtVG9SamU2bXpaVkJH?=
 =?utf-8?B?WDNCMjJ5NWZpYU1TMnpCb1FFR3dja0cvK1UxK0ZqaUhzZDNOSTFablMwT2Zk?=
 =?utf-8?B?RTlJN3JyTmd3OXo0bXhwNVZiSGFKVVkwZnYrTTV1c2dXeFFvUi9KTThoVitU?=
 =?utf-8?B?YzdwV0h3R0l0dnBhckpOVXVNUVViUFBPT0Fpd3VoN1E3NzNJWVBDN1NsWmow?=
 =?utf-8?B?c29FNzhFZDhwWklMRm9vQmQ2TDhTNGR1NFB4cHRmSFdTcVdKRWZTdmN3Z1Ni?=
 =?utf-8?B?aHpBNHZtRWFFbks2NEx1UVIyMFRZZWhGajVHNTgrLzFrZHVHTk1salVDQkpS?=
 =?utf-8?B?MjliZ0MzUlhucjN3R2U2T0FPSXdCdU1ZUzhUZGMvWFhGQ2JKVVBtWi90UVdq?=
 =?utf-8?B?N2xpb3BVc1Y1d1NmS2IzQStiWFNkTVpPV0lvbU5HSVczSFFSbTdwbUpIT3Y4?=
 =?utf-8?B?Wm51Y2Q5ekFoSlhLYVBxek5HRDgyUXlscGFSU1FodEkvdmZ6ZXB6MmxoMi9S?=
 =?utf-8?B?eEgrQ0dXbFY0MXJZK2I3VFUwREhsUExBNngrakNwcEg3UzFsdGdudGNqZXBy?=
 =?utf-8?B?bzczUTV0SUduY1V1cG9EQ1l4VXRnSndsMFBFNkNuZkFiZUZtYVdDZitvWGZW?=
 =?utf-8?B?UmdqZzNtTkM5SmtIU3hnYU5UZ3FwTUN3d2dvZTNyc0FFV2pQdVZyMm52aVNo?=
 =?utf-8?B?Y1gzZkFEamdSVUJIYzFsTjNIWmRmUVNBcG9XZUlMMklLUkFmZnBYbnpOR3pV?=
 =?utf-8?B?TUdMUU5HZkRPaDk0akRJOWdKcVRCbXlVU0xaVVUwVjJvc0ZCNStkN3drYUVB?=
 =?utf-8?B?SlJDMFhvdUZndEYyOUl6SDQ5M2dDN1J2OER5QkVsUGcyK2t0YW1TTzkvZmd3?=
 =?utf-8?B?N0FwMGNrTTBHOFRuNmh0OVhxY2pVVGxVbFkybjl4MmZnVDhsNk1BTDBYaitp?=
 =?utf-8?B?ak10SGtnZXdTbEpFU1dHYllQb29oQkZlZGY5bXZmZ05MREdLU20vNE5QUDEy?=
 =?utf-8?B?WXArL2diOE1qOVVIK2ltT1JHekw5Z3lBaFlraVlLSktoaXdWZUo2RC9JdzI0?=
 =?utf-8?B?ZzcvajdPOHFNbXhxRkVoVUExRnh4S0UwSkpPL0lWQmNHaWhSM2hyT3NTOGRD?=
 =?utf-8?B?QW10SlZXd3NCQ0tLaUt5RzFTNmZzUS80SHZ1MDkyMnpCZ091eU9rSE11dHgy?=
 =?utf-8?B?L2FRYm1jK0pRVGZRTzcyMWVoSjY4OXk2OE1SeFRMYjhHYzJuQW4wVUlrYjdu?=
 =?utf-8?B?RVg5VEZSOVJ1U1JmaFA5K1p1YVNyVjh2cUVkSnFVVXpBRHM4WjJid0ZSUFph?=
 =?utf-8?B?aTRwRlQ1Y3lMSi90Tk0wcURlWUZtR3R1bHN0dWd1ZWV5MmpCUDhxWWJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2lTYkl0aFdWQnhGWkJzeUtsdUhYeXM0c3lnZndDMnd2QWllS1NSanA4RmtV?=
 =?utf-8?B?eW82eUZOcjBCSWpUTzRDaTJDcEFGM3BZN2tYZVJvZ2REYzR0a3JzeVZnd2Rl?=
 =?utf-8?B?QjdxbytXcDRXdnM2Z1NaMXYwL2tZSlg5Y2thM1F5SHRxVEdnOUlKalJqYlZM?=
 =?utf-8?B?Y1lsTmlhdmZ3WmUyTk5wUERNczl0L0dxdkIreG1BUmlQTDZ2bDVQeTc1WUcy?=
 =?utf-8?B?dWo3U0duNy84dkgyK1c1WENxM3owckpsUkEvU29PRW5KekRxZ0dCNnNucEFW?=
 =?utf-8?B?RnNjTXo5dE5FbkoxWTRxT2N4SXZuRElTMExjUzVubGc4M1FoZk94emJHalIz?=
 =?utf-8?B?VUdDTVBORi9JbkUzRDd2d0hRS0t5SjhScVBYaTRrRENNdE1NQ2xvbzlMZVBD?=
 =?utf-8?B?c2tkYU1zWCs4WTJBSFhyL3YxZEhlOEdkT0YwS3VWYXJseXRDdi8rdWphcEky?=
 =?utf-8?B?bFd1ZjVBaGYxWlUyL0xnTlk1Sm5QYmtQVUJYKzMyMmxFNE0yYUgrVHh4Sjgx?=
 =?utf-8?B?WUpWemNaZEMvVFJvV3RDcDVpbEFRREQyZWlzT3V4bDFpL0RBL1R0dmlxZ3l0?=
 =?utf-8?B?VUtxek9WM0p2MEgrSXdOVG1vbkV6YjdlaGJiSXV3UytYQWU4ZG9hTVlvdity?=
 =?utf-8?B?WEtpNkRGMkJtV2FpQnFXc1VrL0EwMkVCODFJWXd5TVFRTE1MNjBqczJtSFB6?=
 =?utf-8?B?YUVsNDVrMmRHQnlMYklZUTB5NkdKN1ZMemVKMm82ZG93SjlRRG5aN2RGWmNO?=
 =?utf-8?B?cTdhcEZkQVZ2TlZEaWVkbFhKaFVxY21WV05SQ3BUY2RlZDlHWXE4dmJhdVhv?=
 =?utf-8?B?Q2RRSmwvdFF1Vk5UNTdYU3BjNU1BT3B2TVB3MTVNVzkwQkVOVTA1Mk9xVW80?=
 =?utf-8?B?OWNJVE1OU21uczdJaDVFaEJDZENMRUMyVGZJK0M0RFRNRVRsendza1Azc1pG?=
 =?utf-8?B?aU8yWWczY2NVd05MSDhBNWJWajFNZVdNenNMMU1SaHBJbjRCYVljdzEzVGl0?=
 =?utf-8?B?WWpINjVzTXg1KzFYN3lTdUMrRGJscURzOWRMQm1aWHhpOXh1eFFjc3JIaUJx?=
 =?utf-8?B?KzdFcTVZak0wQnhlV2pRcDhpQjVqbEpocldRSDAvcnU0Z2p4Y01BaUtCSlZj?=
 =?utf-8?B?Zms3Sm44VUQ5QnVacVlmK3ZxVnk5V3lBUy8wNHUxZ3N1SWxIenM4dHA0T3JY?=
 =?utf-8?B?UTBFYU9Pdk1RcjFHVllFNzJIV3lIWmkyM2g5NlY3ZG1abDk4ZGpvdFBsN09Y?=
 =?utf-8?B?MHB4MUtLdHlMZ3FEY3ZtVmhnbkVmYWRkTmZlVDc2QTBSdTFTNHN2UFNDcG9M?=
 =?utf-8?B?aVllQUZpM0lOUjZFTmRxTnJnb3lTWGhManluNkdOZUJGcC8wREpxMHF1T29K?=
 =?utf-8?B?VjRhUXVZeUFIamI4bDB2djVRWnpPY0pCM2lFRFp1WUZ1eGVtbXJmSnhpU1Nq?=
 =?utf-8?B?c3BYSVBKbWNwT3BubWNmY29JeVEvbTBncC9PWDFEZXQ1WEZiZGErS3A2MnFk?=
 =?utf-8?B?V2RnbTdhSUxqZ1gzSWFJRVZSY0IrUDd2Q0FJelF0SG1EdWxPMjNGTHZTd3Bu?=
 =?utf-8?B?Rkd6MnFBM01xUWZNYm15M2JLbVJoVVV3eGI0a0s4c2ZrWFlNMkNzaDN5aTh3?=
 =?utf-8?B?azVsaHMxS1p2bHpCWjlWMWtSK20wazgraEJlekRxa1hza0RRRUhpSXlma0dJ?=
 =?utf-8?B?OWdXazJtZUxUdzI2NFQ1RWlJWnVjb0p0ajJxS2RIME1tTmZLbU8zUHR3U2Rr?=
 =?utf-8?B?L0t2cGpLMHpiL1FzeU5vSzQyR2U4S1A3K3kyemJQZmtDVnNPR2VRaFdmdWRC?=
 =?utf-8?B?WUVyRGc5UGhSZEtVQlpQZDM4TzVucEZ0TStxRWxOWnFJY1BaUUtMMmFONkps?=
 =?utf-8?B?NGxXTndNTlhVdldjeE5MbkhvQm85elJySHdwL0pxeXBKUWtVMDByTkVUeTR0?=
 =?utf-8?B?QXFjTmtYc0pOZUhmSXlBVEpWOTZ5MVB4VDJrS1JzNTVQT1BjT2sxb3VVQldV?=
 =?utf-8?B?b2RTNHhsdnZMU011T1lBaHJWVU1hdnIxeDJreEtNN3BRdGh1ZytyOHFuWE1O?=
 =?utf-8?B?Nlp3RVh0OURhR3dYU2JqY3RZY1Rwem14ZWZoVGo1YjEwREdKVmNkSm9mZFdB?=
 =?utf-8?B?R293THRZbWFzZkoxaWg4b3YySGt3Q1NDQXJoT0Y1Y3ZFcXBqTlF3TXhwcmhO?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a018f31-ec76-42ab-6a97-08dc6f9a74a5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 20:07:15.4526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJQyCLx1vudowHqREWHjeijLWp7555bSBNgWaBYGmDzOKfXMYA5Dn8aC/kuWn9fXWvDxeq7JKBYi4b5H7Fz3/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
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

Let's be clear on what it is actually doing and align with
xe_pm_runtime_get_if_active doc style.

Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index d14741f35cc4..c3ef2283770f 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -514,10 +514,11 @@ bool xe_pm_runtime_get_if_active(struct xe_device *xe)
 }
 
 /**
- * xe_pm_runtime_get_if_in_use - Get a runtime_pm reference and resume if needed
+ * xe_pm_runtime_get_if_in_use - Get a new reference if device is active with previous ref taken
  * @xe: xe device instance
  *
- * Returns: True if device is awake and the reference was taken, false otherwise.
+ * Return: True if device is awake, a previous reference had been already taken,
+ * and a new reference was now taken, false otherwise.
  */
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 {
-- 
2.44.0

