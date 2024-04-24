Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656ECC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 07:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DA11138B6;
	Wed, 24 Apr 2024 07:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oiqxaeb3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475F71138B5
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713944049; x=1745480049;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=RMVMr2H6DJmj2c7JVkIL3k0OKpEq2cMuKUt7DMY/uuk=;
 b=Oiqxaeb3dMbzxv1T0VSq9NsxCiTmlzyzmXkKT+Pm4xFJHH5xhzvq5tPD
 UoeyHkTrFUNyArH6NXudMuYZibnWs2ztzrxLxx1zDHqgf3COoIHI5zz7n
 rTpGxfeAvdJKKzgM1pc1GutnO5nx5l4BBZFrrGRY7EDq57rnMrvIOjqI7
 SXRjvHi+IIuR/QvzcLcRrM9inIs0Gi7c/VrxLP+Zl924O0Pp7prm38K0n
 Sbl7cqyhwioUWR8c+3zUsNmB9V2HKv2hKIUUJtJ+6rlxvgrhmGi6lu4be
 spdqVdQwAyD09FzHHTrkQuFIEv1s6dMuz2Zaji299YAuCdenK59m6YhTf g==;
X-CSE-ConnectionGUID: PIeBPwuhRd6WwBEyH1s8Gg==
X-CSE-MsgGUID: LEA7RFQcTyKDAewRd00koA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="32050217"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208,217";a="32050217"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 00:34:08 -0700
X-CSE-ConnectionGUID: MhzNq/eBRc6/FmaQcq9+xA==
X-CSE-MsgGUID: xQcFBVqSTeKnJkGYvmk+bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208,217";a="55833571"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 00:34:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 00:34:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 00:34:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 00:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRrS+LCR43Ny/j+khM7LzgmBf2HM5RjMP5BPrXux3uuP+HDwkHnQWPQdHxKZbeC9Oh7bc8F6yWlJF9prTy7zl2PUDtRa2dKRy42LVU9fhKNPrN4AfHrN61dG/g+vbvZhd/a/5Ojr76PrH8xWmMdiLcrw+Cz5dGHc96KfDpMd4xRoEzN6bEcaDskXHqq8zi7VHWxwFdZE0jlu0YlwP9mVp5BDdRlDqEZyVhIs58xMQAefuBqMKxVSywrhz12bDF32Y8QS2PSag2CzPZ2rs3kwf2nSs9/NPXVnu8gQ5kEqi+NogwEofpM410KdaEye/fypf+APed0GlTrw2Qj1jO+b8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EqtrFYs/Ih5UkHeRxTNjay5VS+OwD/Jt+c7tjJq79E=;
 b=JXDQSHVjjwVZsVhV30vPQL6OYtzz6U0zWWU2TiSJ8ZBnkdYdG9A3IFXgrx0EQtatG7FRS34ZFSRWNeF6TeG98zaI38H+kCM5nod/VOgfgnN5d2w/14N0yP6VSSqhx1gGfTCVI2HOBBemkESDu5mjhmXkbLFQJ3Z/1gdZFhG43xbXODlLf7swDOrp3BA14G5EWhZ3NKWbLBuNefZPZkO+6xajcYpT1PDEEHU2HaWzerWv67W+lxInM0jSY0wm9oiHLcUdufOf8LO//82nsj2SXflKaZGydeGvlql3VvftP6dQwcMz1SSReOnaoj7cTKBZcUyQP/+vUnWyggzlvwcOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 07:34:05 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 07:34:05 +0000
Content-Type: multipart/alternative;
 boundary="------------NSEScSDCIqOVKchIhOvU8I5C"
Message-ID: <5a2c5f7a-2d88-43af-b890-b2d5f65c0223@intel.com>
Date: Wed, 24 Apr 2024 13:03:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH CI 3/3] drm/xe: Add INSTDONE registers to devcoredump
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>
References: <20240423160626.77110-1-jose.souza@intel.com>
 <20240423160626.77110-3-jose.souza@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240423160626.77110-3-jose.souza@intel.com>
X-ClientProxiedBy: PN2PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH0PR11MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: af5477f4-14a4-4139-4cea-08dc6430eb97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHUyc3AxYVV2YnlmZFYxeWtZSTB1VFBVam5PNjFFMkpOTmFQSHRDVGZvMHcz?=
 =?utf-8?B?YTFaZHhRVUR2aGo2aUw5d2E5YkgwQU5MeWEyU2tFVzkvcytIN2M2MkRkUUtv?=
 =?utf-8?B?eFRGTjI0SkhIWm5xeko4bHJpc2padXphSktCaHNVbTN2eUxpSlNsQk8vNERw?=
 =?utf-8?B?Qk8wei95QmJxSUI2c2pLQUNUMWRaQjRHbkc5YVhUTjZVa1o0d3RXckdIaEhH?=
 =?utf-8?B?NUZpWmliSDIxYWMzN3hTR2l2ek8zVVNrWVRsU2lXNzEzUE4vVmpZTm0zaEJB?=
 =?utf-8?B?RHRIdHJhMkI2dUZyNzBJT3VDNVBJTVhidFNmclJEUUl6RURrUW1ldHlTUzhk?=
 =?utf-8?B?NnZyRGxTWGIyeWlEQk84VXFjazJjaDhWa2ZWeDdXNTlrbG44WEYycHBKRmR5?=
 =?utf-8?B?akMraEFtcVhnd3owclFHWVJ4VWlITHFycVNkNTNZN2g4WkE1VGc0S2p5ZVdG?=
 =?utf-8?B?cEs4SndkUWhmN25Wcm9JYVozemRHWTJIUHdaRVlFZVArdmowL05oM1doaDg2?=
 =?utf-8?B?YXFtWVdUTStkWm1yZnRDSEdDbVdSZ01BTXROVG5CVCtXdEVBd3hWbDloclly?=
 =?utf-8?B?V3FMTGxScjhZTm9Bd1JFcmtRazc0MStrNzNQTmxQQTROeDk5emdHclF0RlRG?=
 =?utf-8?B?TEZpODJkcVdiOEM0RVd0M3ROTWVLTkU3bnBsdVVGNkIyemdya045VEtPSVRL?=
 =?utf-8?B?UFpzeHpkU1ZQcjVHaWJZT1pSSllLeUJOU1k1ei9lbWF6R05ITHE1MXc2Sk5Q?=
 =?utf-8?B?My9XR1pnQlhaNkMzck1iWVpLOTV4cHk0Y1FXWThoTjh6UVd5Z09ZT0kya0VC?=
 =?utf-8?B?aU5rUmlzYU1hWHB4VTdhVDJ4K2lxZjFvMGxERHpLamxvRVVIclRwRzB6bTcv?=
 =?utf-8?B?Q05JMFFuczZvUGliTzdIWG8wVkduZEVqVVVqM3VOblRaWHVESFhVYXFNdnVm?=
 =?utf-8?B?dEZpa0JSZUY3SldkS1B0b1FUeUlzU0hPV29aZ3p6TU91SUtXL1NFQWI3VlJL?=
 =?utf-8?B?QTNPZ09NTzg0RGF3Y3F5d1BMVHNKQTN0YUdRRkFuYVhxeG16NTBUM3U0ZVBD?=
 =?utf-8?B?SDRGVzh3RHd4clhyWVlzR1VhYnN2SlUvRjhqM2gxVmNSMVc1bHo1eVBubWJS?=
 =?utf-8?B?Z2dNOUcvZTg3OEw0Y1NLbDRZZzR6NlVFK3lBek9sRXdWMWlzcldUN21CODNE?=
 =?utf-8?B?eXFXeng0TkZRNjBtQ2NQRnp5UDVMRXBJamQ4VVRvaXVlVnZQdlhBeHAwNHRq?=
 =?utf-8?B?eG45NTJTKzRaZGtpQzdsbVd6c3ZPay9tWG02YW9hWHJWeklSUWlGRHhoT2c5?=
 =?utf-8?B?Y29RQVcvRXluYVZzYWZnQnFkU1BVQ3pkWHBvdDZZSTBoRTVQbUV0OTZxZUt1?=
 =?utf-8?B?TEdweTh4L0lEUk1rRmZIOXE2VlRaVkhnT2hPR2NKUm9LM1UwRGhpVG55OU44?=
 =?utf-8?B?NUwrckFzOFlTa2Z2YmJRcU9oNkNJYXZXSDUvWEhmZy9mZG8yWUFpQ2V5VG1J?=
 =?utf-8?B?L2R6Q2dFMm9FczhVOGYyVkIwbXViOUtUSEF1eWU4Ykx4SXh5NE9mbVJncVYr?=
 =?utf-8?B?ZFdSRjRGMkhwYk1SdFFYbUhHMlMvVFVaUDI1UGErMmZEdE1JUnB4UHVmOEFt?=
 =?utf-8?B?eHFZaWF3ajVwVFlGVUhENjN6VmtsemxPZTVCTnRDb09nV29mQkFRVVBlZHFs?=
 =?utf-8?B?SmcySWtNWVhUSFpWV2lCbkg2YWVYK0NHNGJCNm9jcnFtdGhiRXZkZStRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWRDSnhnajkvZ0NFS0MwWjZPeVBXRWk1MWlGMmJPRkZDNzdLTFFsSjNNY054?=
 =?utf-8?B?VHhNYWtLQXdHNkNWL2FMWFRHTmlGRVJ6Ujk3VWo1cG5QTlpqZkpkZGVVaVVP?=
 =?utf-8?B?SUhKSWpSTHE4QWQyRldMTVlBbnYxWGJ3N0hWQXRra0RTQVBBd1dpMElBcDd2?=
 =?utf-8?B?WGg1bGRtWW1LOVZ2TXZENVJ6VUNsRG1ldFJ6M0V5SXdrZk1PcmZtS1Y5UVNr?=
 =?utf-8?B?NUVmWFRLRUpvekhIczlmSElmbGZGMnlwWkM2QUZxOXpDOU5Sb1lyYXMvT2Fn?=
 =?utf-8?B?bnpiYWZCRUViQktTZGtqeEFlblpDWisvWFNjZmpEc3BVc000Q3ArOXBwb0JM?=
 =?utf-8?B?bHZja2pTckVEb1kzV3RBb0lwakk3aTBoc1FrVDZzTGZuR2lJbUxSeEVHL25p?=
 =?utf-8?B?anpiNGZwalZGNHlZY2pCWk9OT1BlaXZTbFZMeEdYcDNmaTdmOGZ4V1g3UmJx?=
 =?utf-8?B?WWhpUEVOaElsQm1DV3VBbkJMSkJidDJrQklpMjFWS243OEN0ekRrdGhEWEVn?=
 =?utf-8?B?V0doZE5DcWFvajhJSlh4d2tuWklQenVTV05CRlVTaEpiMWg2bDNXWHMybDNn?=
 =?utf-8?B?MHBteVFJMEdHM2IxZndWOTRSc0cxeHVsS2pqbTgxT0ZueFdYNVhnaVo1djEz?=
 =?utf-8?B?Q2NDSERWUVpndTFSbVI4QlBaLzI5SGFLVlBmQlZGOVU1ZWJJTEpuVFc4dmVy?=
 =?utf-8?B?bjk0MitKK1czREw2YkhQMjI0ZUV1QktWLytDYTJZZU1mRXp4c084bytUQXN1?=
 =?utf-8?B?MXg1THhGVzZQekg1QmhpZ1BxZHF5YXBESjlJam1YMVlMRXJadHhCMGE3cDJh?=
 =?utf-8?B?bkpFZjBGTnRtNm9jdW0rYmJGa25iQTBwVXI4dEwySVgxWTRjOHFaSm1TU2hi?=
 =?utf-8?B?a1cra0FiWS8yODdCQ0U0ZjUwMjlwRjNNbENjT0FrVHlweDFQam1xa1JwdUFD?=
 =?utf-8?B?VXBFUDhsOXZQZDQzN1NXNXRwK0hmL1ZIV2o2bjN0QzZJVEtFNHpSMm81blQ0?=
 =?utf-8?B?MzZyeUsvVHJWMTRaZU9ydUQ3YnM0em8zNWk0a09pTFdDQWZDeGNGLzdUSm1B?=
 =?utf-8?B?WmRXT095UDlOWFNDaDJmZkdiQkRScXBvQmZUTXZiaHVtOFJKMnNocERpZ2d1?=
 =?utf-8?B?QnltNzVRUU5sTUx3NThtTDd1TDZpK3g2a203bUxlUkpyVmY2TElTdGYySEpN?=
 =?utf-8?B?aUZNT2VVTjhjR2NlNnZOOXZmYXlrSVd0bkM5QXJnMWdBZVQ0UWV2YkUwYndn?=
 =?utf-8?B?bTQydHVNTU80SXFiOHQyVVdOa2Y0aG02dHorZmNzem50dFVWbXFMQXFIWWM0?=
 =?utf-8?B?cjdoOUI2dmIrZUdZWHpZYkE4M005TnJ0N2ExeG1sL2RzeGtrdzNRQ0NSUTZB?=
 =?utf-8?B?R1kvNjNYVFZGbUtIM2w5bzlsd3N0SHFwc0RSNEpvRHJkaHNnNStOWFloQ1Rn?=
 =?utf-8?B?bkhNSlZYRzdxQmJDRVk2VGNhMkQwY3FaT2FEUGF5ZHdTcTQvc1FwNWJQTWhn?=
 =?utf-8?B?N0FJamc2cmVFMGQyUEdXay9tTFpia0thamVVR0JGeVZaWTRsVnFpckYrSTRk?=
 =?utf-8?B?UG9ZVTR2d2hzREhPN3J2akdiODZHR3phRDFJYzcvVXZjSHAvZUJWdGhVTjI4?=
 =?utf-8?B?TGMra1U0MERTdVBaM2IwY2YwLzhZNjR2R0Y5aDNHM0Z1Vi9tclNOY21CWFBr?=
 =?utf-8?B?YjhYKzdudlhwKy9LRkx1MTdjaENkMWhCNHM1TlJkVHU1Y0x1RU5QTitnNHdr?=
 =?utf-8?B?VnR3SFV3cnczUW5HNDdmcWcrMEVFY1NJSVJieGpncmE2ZURzK2ZvZGx4cEtw?=
 =?utf-8?B?aEFCTytIU2tvK3hWTStIaGZZQ3NFaUJYWXVNYzMrZnY0ZG45RWRFaXF4MWFC?=
 =?utf-8?B?S0pWS0MyRDJrM1BOSlVveG90VU53MFpmanBiQjNHOFdVUklOY253ajBwK3RC?=
 =?utf-8?B?eitKb1hJSHFBQnNoano1Wi93Nm1jalpRREprclliOHNJSmplYlU3eGFWMEJi?=
 =?utf-8?B?K1BwczhsY3BpcDhJdzEzbkVLM0RwQldLdndTS0kzczFnbndrdGdmeHBvOVEr?=
 =?utf-8?B?YXFIdDFLV2NYRnRkK1QyNnJtMkhScC9VS2NFQUtQZkpPS1F0SGNCNXhNWFBK?=
 =?utf-8?B?STdoWTV2emxaVXJDWVpCY3JzQVVXVVhIMHg4VG9zbisrdnNpdFp4ampLbGxo?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af5477f4-14a4-4139-4cea-08dc6430eb97
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 07:34:05.6528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmvbJx2xDPDo/rP6iw0QgrKfOSQNzFjuHFQMfWO6celW4NacFIVBmOlPfmyyD8qxZh6HR/NRAxmrn1bYbOrnUbwpMFF+OpLso10VVfCgVy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
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

--------------NSEScSDCIqOVKchIhOvU8I5C
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 23-04-2024 21:35, José Roberto de Souza wrote:
> This registers contains important information that can help with debug
> of GPU hangs.
>
> While at it also fixing the double line jump at the end of engine
> registers for CCS engines.
>
> v2:
> - print other INSTDONE registers
>
> v3:
> - add for_each_geometry/compute_dss()
>
> v4:
> - print one slice_common_instdone per glice in DG2+
>
> v5:
> - rename registers prefix from DG2 to XEHPG (Zhanjun)
>
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Cc: Matt Roper<matthew.d.roper@intel.com>
> Cc: Zhanjun Dong<zhanjun.dong@intel.com>
> Reviewed-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Signed-off-by: José Roberto de Souza<jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  13 +++
>   drivers/gpu/drm/xe/xe_hw_engine.c        | 128 +++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hw_engine_types.h  |  16 +++
>   4 files changed, 158 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index af71b87d80301..97d2aed63e01c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -65,6 +65,7 @@
>   #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
>   #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
>   #define RING_IPEHR(base)			XE_REG((base) + 0x68)
> +#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
>   #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>   #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
>   #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 94445810ccc93..c7fbea46bb75e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -98,6 +98,8 @@
>   #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
>   #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>   
> +#define XEHPG_INSTDONE_GEOM_SVGUNIT		XE_REG_MCR(0x666c)
> +
>   #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
>   #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>   
> @@ -115,6 +117,14 @@
>   #define   FLSH_IGNORES_PSD			REG_BIT(10)
>   #define   FD_END_COLLECT			REG_BIT(5)
>   
> +#define SC_INSTDONE				XE_REG(0x7100)
> +#define SC_INSTDONE_EXTRA			XE_REG(0x7104)
> +#define SC_INSTDONE_EXTRA2			XE_REG(0x7108)
> +
> +#define XEHPG_SC_INSTDONE			XE_REG_MCR(0x7100)
> +#define XEHPG_SC_INSTDONE_EXTRA			XE_REG_MCR(0x7104)
> +#define XEHPG_SC_INSTDONE_EXTRA2		XE_REG_MCR(0x7108)
> +
>   #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
>   #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>   
> @@ -342,6 +352,9 @@
>   #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
>   #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>   
> +#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
> +#define ROW_INSTDONE				XE_REG_MCR(0xe164)
> +
>   #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>   #define   ENABLE_SMALLPL			REG_BIT(15)
>   #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c84dbe8a8ed1d..5d4a8f7b903e4 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -18,6 +18,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_ccs_mode.h"
>   #include "xe_gt_printk.h"
> +#include "xe_gt_mcr.h"
>   #include "xe_gt_topology.h"
>   #include "xe_hw_fence.h"
>   #include "xe_irq.h"
> @@ -766,6 +767,57 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>   		xe_hw_fence_irq_run(hwe->fence_irq);
>   }
>   
> +static bool
> +is_slice_common_per_gslice(struct xe_device *xe)
> +{
> +	return GRAPHICS_VERx100(xe) >= 1255;
> +}
> +
> +static void
> +xe_he_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
> +				       struct xe_hw_engine_snapshot *snapshot)

Nit:

s/xe_he_engine_snapshot_instdone_capture/xe_hw_engine_snapshot_instdone_capture

Doesn't make much difference since functions are static but to keep 
consistency in *_capture and *_print functions.


> +{
> +	struct xe_gt *gt = hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int dss;
> +	u16 group, instance;
> +
> +	snapshot->reg.instdone.ring = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
> +
> +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return;
> +
> +	if (is_slice_common_per_gslice(xe) == false) {
> +		snapshot->reg.instdone.slice_common[0] =
> +			xe_mmio_read32(gt, SC_INSTDONE);
> +		snapshot->reg.instdone.slice_common_extra[0] =
> +			xe_mmio_read32(gt, SC_INSTDONE_EXTRA);
> +		snapshot->reg.instdone.slice_common_extra2[0] =
> +			xe_mmio_read32(gt, SC_INSTDONE_EXTRA2);
> +	} else {
> +		for_each_geometry_dss(dss, gt, group, instance) {
> +			snapshot->reg.instdone.slice_common[dss] =
> +				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE, group, instance);
> +			snapshot->reg.instdone.slice_common_extra[dss] =
> +				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA, group, instance);
> +			snapshot->reg.instdone.slice_common_extra2[dss] =
> +				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA2, group, instance);
> +		}
> +	}
> +
> +	for_each_geometry_dss(dss, gt, group, instance) {
> +		snapshot->reg.instdone.sampler[dss] =
> +			xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
> +		snapshot->reg.instdone.row[dss] =
> +			xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
> +
> +		if (GRAPHICS_VERx100(xe) >= 1255)
> +			snapshot->reg.instdone.geom_svg[dss] =
> +				xe_gt_mcr_unicast_read(gt, XEHPG_INSTDONE_GEOM_SVGUNIT,
> +						       group, instance);
> +	}
> +}
> +
>   /**
>    * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
>    * @hwe: Xe HW Engine.
> @@ -780,6 +832,7 @@ struct xe_hw_engine_snapshot *
>   xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>   {
>   	struct xe_hw_engine_snapshot *snapshot;
> +	size_t len;
>   	u64 val;
>   
>   	if (!xe_hw_engine_is_valid(hwe))
> @@ -790,6 +843,28 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>   	if (!snapshot)
>   		return NULL;
>   
> +	/* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
> +	 * includes xe_hw_engine_types.h the length of this 3 registers can't be
> +	 * set in struct xe_hw_engine_snapshot, so here doing additional
> +	 * allocations.
> +	 */
> +	len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
> +	snapshot->reg.instdone.slice_common = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.slice_common_extra = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.slice_common_extra2 = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.row = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
> +	if (!snapshot->reg.instdone.slice_common ||
> +	    !snapshot->reg.instdone.slice_common_extra ||
> +	    !snapshot->reg.instdone.slice_common_extra2 ||
> +	    !snapshot->reg.instdone.sampler ||
> +	    !snapshot->reg.instdone.row ||
> +	    !snapshot->reg.instdone.geom_svg) {
> +		xe_hw_engine_snapshot_free(snapshot);
> +		return NULL;
> +	}
> +
>   	snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
>   	snapshot->hwe = hwe;
>   	snapshot->logical_instance = hwe->logical_instance;
> @@ -841,6 +916,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>   	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
>   	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
>   	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> +	xe_he_engine_snapshot_instdone_capture(hwe, snapshot);
>   
>   	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>   		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> @@ -848,6 +924,49 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>   	return snapshot;
>   }
>   
> +static void
> +xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> +{
> +	struct xe_gt *gt = snapshot->hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u16 group, instance;
> +	unsigned int dss;
> +
> +	drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.instdone.ring);
> +
> +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return;
> +
> +	if (is_slice_common_per_gslice(xe) == false) {
> +		drm_printf(p, "\tSC_INSTDONE[0]: 0x%08x\n",
> +			   snapshot->reg.instdone.slice_common[0]);
> +		drm_printf(p, "\tSC_INSTDONE_EXTRA[0]: 0x%08x\n",
> +			   snapshot->reg.instdone.slice_common_extra[0]);
> +		drm_printf(p, "\tSC_INSTDONE_EXTRA2[0]: 0x%08x\n",
> +			   snapshot->reg.instdone.slice_common_extra2[0]);
> +	} else {
> +		for_each_geometry_dss(dss, gt, group, instance) {
> +			drm_printf(p, "\tSC_INSTDONE[%u]: 0x%08x\n", dss,
> +				   snapshot->reg.instdone.slice_common[dss]);
> +			drm_printf(p, "\tSC_INSTDONE_EXTRA[%u]: 0x%08x\n", dss,
> +				   snapshot->reg.instdone.slice_common_extra[dss]);
> +			drm_printf(p, "\tSC_INSTDONE_EXTRA2[%u]: 0x%08x\n", dss,
> +				   snapshot->reg.instdone.slice_common_extra2[dss]);
> +		}
> +	}
> +
> +	for_each_geometry_dss(dss, gt, group, instance) {
> +		drm_printf(p, "\tSAMPLER_INSTDONE[%u]: 0x%08x\n", dss,
> +			   snapshot->reg.instdone.sampler[dss]);
> +		drm_printf(p, "\tROW_INSTDONE[%u]: 0x%08x\n", dss,
> +			   snapshot->reg.instdone.row[dss]);
> +
> +		if (GRAPHICS_VERx100(xe) >= 1255)
> +			drm_printf(p, "\tINSTDONE_GEOM_SVGUNIT[%u]: 0x%08x\n",
> +				   dss, snapshot->reg.instdone.geom_svg[dss]);
> +	}
> +}
> +
>   /**
>    * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
>    * @snapshot: Xe HW Engine snapshot object.
> @@ -887,9 +1006,12 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>   	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
>   	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
>   	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
> +	xe_hw_engine_snapshot_instdone_print(snapshot, p);
> +
>   	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>   		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>   			   snapshot->reg.rcu_mode);
> +	drm_puts(p, "\n");
>   }
>   
>   /**
> @@ -904,6 +1026,12 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
>   	if (!snapshot)
>   		return;
>   
> +	kfree(snapshot->reg.instdone.slice_common);
> +	kfree(snapshot->reg.instdone.slice_common_extra);
> +	kfree(snapshot->reg.instdone.slice_common_extra2);
> +	kfree(snapshot->reg.instdone.sampler);
> +	kfree(snapshot->reg.instdone.row);
> +	kfree(snapshot->reg.instdone.geom_svg);
>   	kfree(snapshot->name);
>   	kfree(snapshot);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 27deaa31efd31..9f9755e31b9fe 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -211,6 +211,22 @@ struct xe_hw_engine_snapshot {
>   		u32 ipehr;
>   		/** @reg.rcu_mode: RCU_MODE */
>   		u32 rcu_mode;
> +		struct {
> +			/** @reg.instdone.ring: RING_INSTDONE */
> +			u32 ring;
> +			/** @reg.instdone.slice_common: SC_INSTDONE */
> +			u32 *slice_common;
> +			/** @reg.instdone.slice_common_extra: SC_INSTDONE_EXTRA */
> +			u32 *slice_common_extra;
> +			/** @reg.instdone.slice_common_extra2: SC_INSTDONE_EXTRA2 */
> +			u32 *slice_common_extra2;
> +			/** @reg.instdone.sampler: SAMPLER_INSTDONE */
> +			u32 *sampler;
> +			/** @reg.instdone.row: ROW_INSTDONE */
> +			u32 *row;
> +			/** @reg.instdone.geom_svg: INSTDONE_GEOM_SVGUNIT */
> +			u32 *geom_svg;
> +		} instdone;
>   	} reg;
>   };
>   
--------------NSEScSDCIqOVKchIhOvU8I5C
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 23-04-2024 21:35, José Roberto de
      Souza wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240423160626.77110-3-jose.souza@intel.com">
      <pre class="moz-quote-pre" wrap="">This registers contains important information that can help with debug
of GPU hangs.

While at it also fixing the double line jump at the end of engine
registers for CCS engines.

v2:
- print other INSTDONE registers

v3:
- add for_each_geometry/compute_dss()

v4:
- print one slice_common_instdone per glice in DG2+

v5:
- rename registers prefix from DG2 to XEHPG (Zhanjun)

Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
Cc: Zhanjun Dong <a class="moz-txt-link-rfc2396E" href="mailto:zhanjun.dong@intel.com">&lt;zhanjun.dong@intel.com&gt;</a>
Reviewed-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Signed-off-by: José Roberto de Souza <a class="moz-txt-link-rfc2396E" href="mailto:jose.souza@intel.com">&lt;jose.souza@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  13 +++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 128 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  16 +++
 4 files changed, 158 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index af71b87d80301..97d2aed63e01c 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -65,6 +65,7 @@
 #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
 #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
 #define RING_IPEHR(base)			XE_REG((base) + 0x68)
+#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
 #define RING_ACTHD(base)			XE_REG((base) + 0x74)
 #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
 #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 94445810ccc93..c7fbea46bb75e 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -98,6 +98,8 @@
 #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
 #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
 
+#define XEHPG_INSTDONE_GEOM_SVGUNIT		XE_REG_MCR(0x666c)
+
 #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
@@ -115,6 +117,14 @@
 #define   FLSH_IGNORES_PSD			REG_BIT(10)
 #define   FD_END_COLLECT			REG_BIT(5)
 
+#define SC_INSTDONE				XE_REG(0x7100)
+#define SC_INSTDONE_EXTRA			XE_REG(0x7104)
+#define SC_INSTDONE_EXTRA2			XE_REG(0x7108)
+
+#define XEHPG_SC_INSTDONE			XE_REG_MCR(0x7100)
+#define XEHPG_SC_INSTDONE_EXTRA			XE_REG_MCR(0x7104)
+#define XEHPG_SC_INSTDONE_EXTRA2		XE_REG_MCR(0x7108)
+
 #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
 #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
 
@@ -342,6 +352,9 @@
 #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
 #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
 
+#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
+#define ROW_INSTDONE				XE_REG_MCR(0xe164)
+
 #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
 #define   ENABLE_SMALLPL			REG_BIT(15)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c84dbe8a8ed1d..5d4a8f7b903e4 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -18,6 +18,7 @@
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_gt_ccs_mode.h&quot;
 #include &quot;xe_gt_printk.h&quot;
+#include &quot;xe_gt_mcr.h&quot;
 #include &quot;xe_gt_topology.h&quot;
 #include &quot;xe_hw_fence.h&quot;
 #include &quot;xe_irq.h&quot;
@@ -766,6 +767,57 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 		xe_hw_fence_irq_run(hwe-&gt;fence_irq);
 }
 
+static bool
+is_slice_common_per_gslice(struct xe_device *xe)
+{
+	return GRAPHICS_VERx100(xe) &gt;= 1255;
+}
+
+static void
+xe_he_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
+				       struct xe_hw_engine_snapshot *snapshot)</pre>
    </blockquote>
    <p>Nit: <br>
    </p>
    <p><span style="white-space: pre-wrap">s/xe_he_engine_snapshot_instdone_capture/xe_hw_engine_snapshot_instdone_capture</span></p>
    <p><span style="white-space: pre-wrap">Doesn't make much difference since functions are static but to keep consistency in *_capture and *_print functions.
</span></p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240423160626.77110-3-jose.souza@intel.com">
      <pre class="moz-quote-pre" wrap="">
+{
+	struct xe_gt *gt = hwe-&gt;gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int dss;
+	u16 group, instance;
+
+	snapshot-&gt;reg.instdone.ring = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
+
+	if (snapshot-&gt;hwe-&gt;class != XE_ENGINE_CLASS_RENDER)
+		return;
+
+	if (is_slice_common_per_gslice(xe) == false) {
+		snapshot-&gt;reg.instdone.slice_common[0] =
+			xe_mmio_read32(gt, SC_INSTDONE);
+		snapshot-&gt;reg.instdone.slice_common_extra[0] =
+			xe_mmio_read32(gt, SC_INSTDONE_EXTRA);
+		snapshot-&gt;reg.instdone.slice_common_extra2[0] =
+			xe_mmio_read32(gt, SC_INSTDONE_EXTRA2);
+	} else {
+		for_each_geometry_dss(dss, gt, group, instance) {
+			snapshot-&gt;reg.instdone.slice_common[dss] =
+				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE, group, instance);
+			snapshot-&gt;reg.instdone.slice_common_extra[dss] =
+				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA, group, instance);
+			snapshot-&gt;reg.instdone.slice_common_extra2[dss] =
+				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA2, group, instance);
+		}
+	}
+
+	for_each_geometry_dss(dss, gt, group, instance) {
+		snapshot-&gt;reg.instdone.sampler[dss] =
+			xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
+		snapshot-&gt;reg.instdone.row[dss] =
+			xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
+
+		if (GRAPHICS_VERx100(xe) &gt;= 1255)
+			snapshot-&gt;reg.instdone.geom_svg[dss] =
+				xe_gt_mcr_unicast_read(gt, XEHPG_INSTDONE_GEOM_SVGUNIT,
+						       group, instance);
+	}
+}
+
 /**
  * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
  * @hwe: Xe HW Engine.
@@ -780,6 +832,7 @@ struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 {
 	struct xe_hw_engine_snapshot *snapshot;
+	size_t len;
 	u64 val;
 
 	if (!xe_hw_engine_is_valid(hwe))
@@ -790,6 +843,28 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	if (!snapshot)
 		return NULL;
 
+	/* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
+	 * includes xe_hw_engine_types.h the length of this 3 registers can't be
+	 * set in struct xe_hw_engine_snapshot, so here doing additional
+	 * allocations.
+	 */
+	len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
+	snapshot-&gt;reg.instdone.slice_common = kzalloc(len, GFP_ATOMIC);
+	snapshot-&gt;reg.instdone.slice_common_extra = kzalloc(len, GFP_ATOMIC);
+	snapshot-&gt;reg.instdone.slice_common_extra2 = kzalloc(len, GFP_ATOMIC);
+	snapshot-&gt;reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
+	snapshot-&gt;reg.instdone.row = kzalloc(len, GFP_ATOMIC);
+	snapshot-&gt;reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
+	if (!snapshot-&gt;reg.instdone.slice_common ||
+	    !snapshot-&gt;reg.instdone.slice_common_extra ||
+	    !snapshot-&gt;reg.instdone.slice_common_extra2 ||
+	    !snapshot-&gt;reg.instdone.sampler ||
+	    !snapshot-&gt;reg.instdone.row ||
+	    !snapshot-&gt;reg.instdone.geom_svg) {
+		xe_hw_engine_snapshot_free(snapshot);
+		return NULL;
+	}
+
 	snapshot-&gt;name = kstrdup(hwe-&gt;name, GFP_ATOMIC);
 	snapshot-&gt;hwe = hwe;
 	snapshot-&gt;logical_instance = hwe-&gt;logical_instance;
@@ -841,6 +916,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot-&gt;reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
 	snapshot-&gt;reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
 	snapshot-&gt;reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
+	xe_he_engine_snapshot_instdone_capture(hwe, snapshot);
 
 	if (snapshot-&gt;hwe-&gt;class == XE_ENGINE_CLASS_COMPUTE)
 		snapshot-&gt;reg.rcu_mode = xe_mmio_read32(hwe-&gt;gt, RCU_MODE);
@@ -848,6 +924,49 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	return snapshot;
 }
 
+static void
+xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
+{
+	struct xe_gt *gt = snapshot-&gt;hwe-&gt;gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	u16 group, instance;
+	unsigned int dss;
+
+	drm_printf(p, &quot;\tRING_INSTDONE: 0x%08x\n&quot;, snapshot-&gt;reg.instdone.ring);
+
+	if (snapshot-&gt;hwe-&gt;class != XE_ENGINE_CLASS_RENDER)
+		return;
+
+	if (is_slice_common_per_gslice(xe) == false) {
+		drm_printf(p, &quot;\tSC_INSTDONE[0]: 0x%08x\n&quot;,
+			   snapshot-&gt;reg.instdone.slice_common[0]);
+		drm_printf(p, &quot;\tSC_INSTDONE_EXTRA[0]: 0x%08x\n&quot;,
+			   snapshot-&gt;reg.instdone.slice_common_extra[0]);
+		drm_printf(p, &quot;\tSC_INSTDONE_EXTRA2[0]: 0x%08x\n&quot;,
+			   snapshot-&gt;reg.instdone.slice_common_extra2[0]);
+	} else {
+		for_each_geometry_dss(dss, gt, group, instance) {
+			drm_printf(p, &quot;\tSC_INSTDONE[%u]: 0x%08x\n&quot;, dss,
+				   snapshot-&gt;reg.instdone.slice_common[dss]);
+			drm_printf(p, &quot;\tSC_INSTDONE_EXTRA[%u]: 0x%08x\n&quot;, dss,
+				   snapshot-&gt;reg.instdone.slice_common_extra[dss]);
+			drm_printf(p, &quot;\tSC_INSTDONE_EXTRA2[%u]: 0x%08x\n&quot;, dss,
+				   snapshot-&gt;reg.instdone.slice_common_extra2[dss]);
+		}
+	}
+
+	for_each_geometry_dss(dss, gt, group, instance) {
+		drm_printf(p, &quot;\tSAMPLER_INSTDONE[%u]: 0x%08x\n&quot;, dss,
+			   snapshot-&gt;reg.instdone.sampler[dss]);
+		drm_printf(p, &quot;\tROW_INSTDONE[%u]: 0x%08x\n&quot;, dss,
+			   snapshot-&gt;reg.instdone.row[dss]);
+
+		if (GRAPHICS_VERx100(xe) &gt;= 1255)
+			drm_printf(p, &quot;\tINSTDONE_GEOM_SVGUNIT[%u]: 0x%08x\n&quot;,
+				   dss, snapshot-&gt;reg.instdone.geom_svg[dss]);
+	}
+}
+
 /**
  * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
  * @snapshot: Xe HW Engine snapshot object.
@@ -887,9 +1006,12 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	drm_printf(p, &quot;\tBBADDR: 0x%016llx\n&quot;, snapshot-&gt;reg.ring_bbaddr);
 	drm_printf(p, &quot;\tDMA_FADDR: 0x%016llx\n&quot;, snapshot-&gt;reg.ring_dma_fadd);
 	drm_printf(p, &quot;\tIPEHR: 0x%08x\n&quot;, snapshot-&gt;reg.ipehr);
+	xe_hw_engine_snapshot_instdone_print(snapshot, p);
+
 	if (snapshot-&gt;hwe-&gt;class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, &quot;\tRCU_MODE: 0x%08x\n&quot;,
 			   snapshot-&gt;reg.rcu_mode);
+	drm_puts(p, &quot;\n&quot;);
 }
 
 /**
@@ -904,6 +1026,12 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
 	if (!snapshot)
 		return;
 
+	kfree(snapshot-&gt;reg.instdone.slice_common);
+	kfree(snapshot-&gt;reg.instdone.slice_common_extra);
+	kfree(snapshot-&gt;reg.instdone.slice_common_extra2);
+	kfree(snapshot-&gt;reg.instdone.sampler);
+	kfree(snapshot-&gt;reg.instdone.row);
+	kfree(snapshot-&gt;reg.instdone.geom_svg);
 	kfree(snapshot-&gt;name);
 	kfree(snapshot);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 27deaa31efd31..9f9755e31b9fe 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -211,6 +211,22 @@ struct xe_hw_engine_snapshot {
 		u32 ipehr;
 		/** @reg.rcu_mode: RCU_MODE */
 		u32 rcu_mode;
+		struct {
+			/** @reg.instdone.ring: RING_INSTDONE */
+			u32 ring;
+			/** @reg.instdone.slice_common: SC_INSTDONE */
+			u32 *slice_common;
+			/** @reg.instdone.slice_common_extra: SC_INSTDONE_EXTRA */
+			u32 *slice_common_extra;
+			/** @reg.instdone.slice_common_extra2: SC_INSTDONE_EXTRA2 */
+			u32 *slice_common_extra2;
+			/** @reg.instdone.sampler: SAMPLER_INSTDONE */
+			u32 *sampler;
+			/** @reg.instdone.row: ROW_INSTDONE */
+			u32 *row;
+			/** @reg.instdone.geom_svg: INSTDONE_GEOM_SVGUNIT */
+			u32 *geom_svg;
+		} instdone;
 	} reg;
 };
 
</pre>
    </blockquote>
  </body>
</html>

--------------NSEScSDCIqOVKchIhOvU8I5C--
