Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0648CC79FA0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 07:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A910710EA3E;
	Tue,  8 Sep 2026 07:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLkVgz7z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98B110EA3E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 07:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788853017; x=1820389017;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4vEK+pgNJnYi25KkDMjiRLnyCYnOtEo9+W7VLHY8Www=;
 b=XLkVgz7zKtKuTQR8lTv7eZ88dTEGRccXErVUpC85peuWjVWKtNq01e5B
 Z9dZXov3piELWBQRWwUOcCZJNtiFFG9mCT1kLY4GujriLTX8XpiE0hiMG
 1CM7TTBEwB+ib6DakD9N+/f8jD8jUJoYB7k/oEs2YF2L++JwM7nlly8hM
 5xLUCcrxHOf8qVUGUn6FjdpRjoYc6qlnJM8va29ZH4S4w/+XkwO6MU4C1
 OrjG+lpVdJo1ZmcbxJ6C9QSSmR8Eo+N8rMMFQ7MK0MciMx054kOerqXU7
 uJX9w/bhu7hvzgRDYypXBbbk1kPVhzCK4a9s4ezT+tRFr+/XbxF4G8m5B Q==;
X-CSE-ConnectionGUID: BZSx2f+pQnq9d8D0NHadcw==
X-CSE-MsgGUID: nt+j4hSCTFKlYS/SZRD+bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89264242"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89264242"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:36:56 -0700
X-CSE-ConnectionGUID: VLwlPzwOTfW5/i/eKoslpQ==
X-CSE-MsgGUID: 24nudeYRTXm45EkBeHjk1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="267678110"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:36:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:36:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 00:36:56 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:36:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRNkfxiIeP190fXodQE9Oqg8sQrHRFmWf7BgTBvhtvBm3yYYlFOopIMQB8D9O5KHBbLDutj0eRxROFIkK3d5jCVPbe64XXzNe8ESHItcb2c1X6T9vvdZVsuSGeyLZUKX+IDFw01jo3JzUMEluvUuOmDnGmzaFHfg/aDSR6LRxy9uSaV4fajo/81YKufIzkslGPHURgGT/l2+XohaYCnG3u3UVETnQ68PW/XgHHbUpiV1upyxpvq3hrcoZmHFzaWUcvPhjf7yFxt8qbwdwSIU5gsIvqSU+H7SGIIhUmFAGzeQYNChjWvDCsvuVgns1+s3g6Ja9JZYFaT2W9nw44chYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3PiaQpP68vk2xOTr3/INnubMm0ct42PYQzcOElLJWk=;
 b=Bw97V+RnGXWSXWKsi0fRby/17KlnUklbuxS0+ugWuo4Y6VG2QOQyPDQk/xuzDjKwKSMF6n25/4VpjCZOeIUYxPpTPWHbaKqQqKc0ay3i/782f3Ay6h1V+bcSzYVZ/rywGMVE0e2PRrnQuPEDKhBARsQQg2146OLHlsLJ8C2fAsmlewLkK+EZgn+kGU5vgzlZnPeakXydOObqjIDRv5p+dg98SJG046B8/FAIJlTlMByyb08/jnQwfWjJxps37k84uAx9cxwHyvhtRmeA5doAPQNaduHPmn1rMQcAp1gCroKakYIeZKGgYNLlurbYG1RQNcDq394SgESkYo/n7EVnnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS7PR11MB9450.namprd11.prod.outlook.com (2603:10b6:8:26b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 07:36:53 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 07:36:53 +0000
Message-ID: <2d76b1af-a34e-4325-b7b6-b8e1e30913cc@intel.com>
Date: Tue, 8 Sep 2026 13:06:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/9] drm/xe/sysctrl: Replace FIELD_GET() with
 REG_FIELD_GET()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
 <20260907105313.2208003-17-mallesh.koujalagi@intel.com>
 <3be73c89-0ad9-4299-8c6e-ed55120f6b64@intel.com>
 <6ea0523c-0a37-4fdb-be63-ff0f2b8d0774@intel.com>
 <f5cf7284-f9b8-4e80-af35-aa02a99bdac1@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <f5cf7284-f9b8-4e80-af35-aa02a99bdac1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0202.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::9) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS7PR11MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: a881c163-4f54-4597-8e79-08df0d7bf3cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1NRSA6HmHZZ9RGncCUNuSLUd0mK6VeEAOno7BnEczkUk2br6nZ4ZF66k+e0nvZUyCp5bqmO03oBzRML3LQrTXDC229rW5LNa/N+wB4GIh0iwakJsveRansvEUamgaE7u1oEmOI+9iVFYNYCtxcYlG0CmiCQcm1qDaanMg0arZ/kwPLyC8mRA2ZgIWlqdqThXA61BKDj8EAKyJB52BvwvLpzcf0WFj599Pj1tr2fH9k1fYXLrtKCAHP4T4pYS3HixMLTnBOdyrfk7slotZAkEEmJlT/XU4dKFk+gWuTWvMvpBTXC8tQ/YhiO5vDrjBkDXTNUl2X2TBIWjQsx4a8M98MaXRQVI0OOLhzxBXX1Dgh0mYkLv3QI6q0Lwj6uwuRxb49npc+Ygk5pgHH2NPgpwnsEFv2HQKhfE9jAXAUGZs8+lWyWn8tTHOtrc1NaJVSHN+Of15G0CtgluU2IFG1CCCpun4qRjFtzMbbqEPecyK/qO0tDkRHDWIMM1X2+XbDuEMGl7OKYUWBl6bEjf2IP/EoL1kU5I4lkmYWF6EexcJjnMfef4vrLBH585Xut2eX8GPQATAGem3Nskr5QcgJLdDnPFbSeri4GNkXNkbYlnURA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGNGbkpGWENWaWJoeEZWbkRKNEhyYU9zdHNadldwcUR4SVZRSStCTkpzOUZZ?=
 =?utf-8?B?QU1IaWloSnFsUXl0bFdLUGxkZnd0Y0VnY0ZFVHVWdy9DRS9mQU9oMUZUTS96?=
 =?utf-8?B?MHhBd1k5RnJxcUlVZFkyMVVoMFVZRW9hYnBFQmhoYWhUb3BOeFBKQk1uR2tZ?=
 =?utf-8?B?K2dLNFAyWUJXSmpYLzRBSXQrVTNpOGh0alpZVFB0TG1qVlQ5alJSb1hDRjho?=
 =?utf-8?B?aTFUTHdndDdpelVXdnQ0dlBzcHJTOEduQmlFekp5dkU4bXRHTEZxME5lQy9E?=
 =?utf-8?B?Ylk5RHJxVmw2SDJ0bkJJNGxVNzhVck4vaDdnUjBvSjQxS2UwWEhtY0hScUdY?=
 =?utf-8?B?djJmdDAvR0xlMll2QytpWXJwU1FlbDA1Vi9YaTJ0UUFLSGNMZGIzNjB5L2NQ?=
 =?utf-8?B?L0w4ZEJhbG1NUjYraTJUNk1wZTZyR3BJSDI1S202ZXdoazFGSlVibmNxQXdD?=
 =?utf-8?B?cWhkWXlzekdJWmREVlJxNWFUTEYxWmxtK0JWWHNqTEo3bmc0N3dxS3lNeURJ?=
 =?utf-8?B?anhjZWZSODhSRlVyYUlUOTljUUpyVmVmMW1Oc09saGx2SXNXT1FncGhZWkE5?=
 =?utf-8?B?bXJjTmZYaEtCenhJNFZTR3ZKeHFJbFdId3ZoQVM3WFo0c0dDNnRHc0JrMWVW?=
 =?utf-8?B?SG5oWXZMTjd1SGdkZXhSY3NzM2VuTUFhOS8xS3RQQlhNS1Vkd1lsbnFvMVEz?=
 =?utf-8?B?QmNvQWdLQlRIeU15aklyckI4T1c4N1NNMjhDU0YwTyt2RFdYYnNtTWxiL0sx?=
 =?utf-8?B?ek9qWWdDLzdFUllaZDhERTZOZkJzNW9OcDJlMm01SWhkbzVUaEJteEpPdTZI?=
 =?utf-8?B?S05xMm9jdlo4MGhEaGJmMWZlakFlUGx2Q0wwcjZISTRWelJZK2tmc3RmUTBr?=
 =?utf-8?B?aEx1YXg4L3cvZDcyVmw2T0RJRVdUQjRieU1tOVl0dDRhWENkdFBrQ290LzQv?=
 =?utf-8?B?Z2EySHhzSEp5ZGpxUlhrL0Q0SGRXeHlRQ3R1dzk3bis2V1lmNmRESTZ6SmdU?=
 =?utf-8?B?a2ZITlNHUktTYlJlYUJkTGd4amIwbU5ZNjNIRU81SVBualNWVkdVWGRMTUt1?=
 =?utf-8?B?Q1I1S3dzRWYxSGJySXFwd0xzWG1zYUFsNVY3SCtRcFRPU0dBenBHdFJVZHV5?=
 =?utf-8?B?TkxFalR0N0RHVnZEbHFJdEZLTUVSSTNHNVE5VFhSZ1o2QlYyYjhwNVdzNWVy?=
 =?utf-8?B?Qzk1OTZZUmlGSnNIV3JWbFJwaDZnV3pOUjc1aklXUWJoK0FXSjdaZ1ArLzQ2?=
 =?utf-8?B?TkZCc0dsZ1U2M2JCVDQzYnIrRUdrY09LR040N2NLVVdEb0pFeEJZREZiQmhG?=
 =?utf-8?B?b3pTSnhDc3hyeWswMlpFeWVORzlPeWNLVjlET2Y3Mm1uZmJ3R0ZJaVhmUHFU?=
 =?utf-8?B?cXM5bDgxeThKYk93bzlSQVJ3V2JZbWxxZXVibk4rbGtaMnZFQXVwTXFSS25v?=
 =?utf-8?B?VDBVVVdZUnhNYjBERXBndTNLQUhjbFJaTXROaDU4aXdUWTdBYzZIa0oxdnNW?=
 =?utf-8?B?WkRXaytJMFU1RUtQYklOb3llenBTKzhwQURIYzFFbnRxQng0UW8rQnorU254?=
 =?utf-8?B?cmVLUHJ4dHd2K3pVY2V2SHdNMitlT2JWSm9Bd0dRaWdxMmlEdENIVGdBN2E0?=
 =?utf-8?B?NnMyaCtFeENKWW54d0ZaVk1EK2QwaHdldmlUbFJ5RWNTcXoxVGhBZmp0TGgx?=
 =?utf-8?B?RGR0cXgvNGRaTWVqTXN0ZE1vdFRYUE12VFgvSUxMQVcxV29JV2ZWRVREb0k1?=
 =?utf-8?B?ZS9EVDBWMVZrZFc2YmM4QXlVazA1SzgyME1CTGhvYitQdDlJNlkra1RDT2oy?=
 =?utf-8?B?NEJ0OU8zUlkvajc5eERmNi90emZaZUZpMktRaG9hVlk0NFNQU0QrcmFSMVBx?=
 =?utf-8?B?d3RNS0pUVGUrYkVWWGRtVzNJejNBQWptTmpMTGdTYm5TRTlWbE5tZyt6cEl3?=
 =?utf-8?B?WS81Sys2L2YxMHdCK1NQWnlTWjE4MUtmMzl3dzFibW0zd1l2eWpxZlk3Qy9G?=
 =?utf-8?B?cHRXeGZKc1VlWjJJZTNXWnpOcmpablVUalZOU25pZ3ZRbXlobk11RHFXSmtO?=
 =?utf-8?B?VGdlOVN0aXZUTUMrYUVuSDNhWmJiamVuOGdlSHlrNUlEektrRmRsSzN0bmZ2?=
 =?utf-8?B?c2cyWWRTcldOSDJ2YmxpVGFVbm1QY3F6dzNrc1F0M3ppL24vOUFMcXdlRHAz?=
 =?utf-8?B?S04yYnFOK0VBamdLMlZOQlpITTQrTGlmUVBjT3pBNGNCVUhNdkJoazVyQkxQ?=
 =?utf-8?B?a3BEZUpyTHVDd0R1MzBvaXp2ZjA2aHU2bVlTb0wzYW14YjVWUTBRZk1aY3pR?=
 =?utf-8?B?SzUzUk1sNDBGOGdKOS9hRThER1Q2YWRnNm5RbUI4cXpjWkJLeEdTbWllbGdu?=
 =?utf-8?Q?eQ+4aHIDLei8b/cI=3D?=
X-Exchange-RoutingPolicyChecked: ZYNbt2VzLWZfkvaYD4QOIFKMUUzNAOxatoZ9d8G4bRTUweHEIZ5R9hpRxfaEJEa8ErUmTziFd4XAaTsyS3tm3VU1c+QFqtnAO6GUV4/p7/NUD88FMUz6jMNrZarXgqMzG322mMmvzwH0D+XPg/Tjrm2un/19RzCMOpm1q2r/jQxveIuqO1Zbwt5tZBJNuawFfMIcTpUs7jqShARkH8UWWGgs3H3qlFwtMWz3ejCd1ASYnNxqR095FiBNhruNG+Ibp84M2su/8N95rW1bF66QRlkIxySX/ozbp7BhvbMiWfZSaYa4F3m26Anqu3RoqbIoF4NGWGCXDwHNrTZgTOsh3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: a881c163-4f54-4597-8e79-08df0d7bf3cd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 07:36:53.6984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n96OnjL/rpw+uMnh/JJngCQ/yCOG7z7ZPnbIIZGPkGCg3r/QCRrgORBVC6i6AbMlG3QBIwG6UWNqizo3vxoP6ydCSmBizx7veTQpHt5Vcr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9450
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


On 07-09-2026 07:37 pm, Michal Wajdeczko wrote:
>
> On 9/7/2026 2:07 PM, Mallesh, Koujalagi wrote:
>> On 07-09-2026 05:17 pm, Michal Wajdeczko wrote:
>>> On 9/7/2026 12:53 PM, Mallesh Koujalagi wrote:
>>>> Use REG_FIELD_GET() when extracting fields from SysCtrl and
>>> nit:
>>>
>>> Use REG_FIELD_GET()and REG_FIELD_PREP() when working with fields
>> Sure!
>>>> application headers. This better reflects that the masks
>>>> represent register-style bitfields and improves consistency.
>>>>
>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>> v7:
>>>> - Update FIELD_PREP to REG_FIELD_PREP. (Sashiko)
>>>> - Update FIELD_GET to REG_FIELD_GET.
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 20 ++++++++++----------
>>>>    drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |  6 +++---
>>>>    2 files changed, 13 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>> index 50bbdab072de..cdd929ebed4a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>> @@ -24,16 +24,16 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>>>    } __packed;
>>>>      #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
>>>> -    FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>>>> +    REG_FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>>>>      #define XE_SYSCTRL_HDR_COMMAND(hdr) \
>>>> -    FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>>>> +    REG_FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>>>>      #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
>>>> -    FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>>>> +    REG_FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>>>>      #define XE_SYSCTRL_HDR_RESULT(hdr) \
>>>> -    FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>>> +    REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>>>      static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>>>                      unsigned int timeout_ms)
>>>> @@ -112,8 +112,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
>>>>            return -ENOMEM;
>>>>          hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
>>>> -    hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>>>> -                     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
>>>> +    hdr->data = cpu_to_le32(REG_FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>>>> +                REG_FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
>>>>          if (data_in && data_in_len)
>>>>            memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
>>>> @@ -186,8 +186,8 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>>>>        }
>>>>          ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>>>> -    total_frames = FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
>>>> -    curr_frame = FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
>>>> +    total_frames = REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
>>>> +    curr_frame = REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
>>>>          sysctrl_read_frame(sc, out, frame_size);
>>>>        sysctrl_clear_response(sc);
>>>> @@ -295,8 +295,8 @@ void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 gr
>>>>    {
>>>>        struct xe_sysctrl_app_msg_hdr header = {0};
>>>>    -    header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
>>>> -              FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
>>>> +    header.data = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
>>>> +              REG_FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
>>> hmm, shouldn't we use le32 conversion here?
>>> other sysctrl cmd/hdr parsing/prep seems to use it
>> le32 conversion is not required.
>>
>> le32 already removed in the code, find the change: https://patchwork.freedesktop.org/patch/717045/?series=164526&rev=1
> hmm, but was this fix correct? maybe the problem is elsewhere?
>
> today we have:
>
> struct xe_sysctrl_mailbox_msg_hdr {
> 	__le32 data;

If we change __l32 data to u32 data, no conversion required (le32_to_cpu 
or cpu_to_le32) , it's cleaner one.

> } __packed;
>
> and:
>
> struct xe_sysctrl_app_msg_hdr {
> 	u32 data;
> } __packed;
>
> both used during sysctrl communication but only one is using __le32
>
> IMO either both or none should use __le32,
Agreed! IMO we can use both as u32, let me know you thoughts?
> or I'm missing something?
>
>>>>          command->header = header;
>>>>        command->data_in = request;
>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>>>> index f0d5e3d7f5e3..5a3dd14e3a11 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>>>> @@ -15,13 +15,13 @@ struct xe_sysctrl;
>>>>    struct xe_sysctrl_mailbox_command;
>>>>      #define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
>>>> -    FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
>>>> +    REG_FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
>>>>      #define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
>>>> -    FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
>>>> +    REG_FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
>>>>      #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>>>> -    FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>>>> +    REG_FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>>> ditto
>> ditto
>>>>      void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
>>>>                       void *request, size_t request_len, void *response,
