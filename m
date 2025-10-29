Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA61CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 20:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1769410E159;
	Wed, 29 Oct 2025 20:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/ToZ5j8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899AC10E159
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 20:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761769667; x=1793305667;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rjB20Pgtmmt9mKyRFl+A/GzUJWimZWI+rub+aJqf+s8=;
 b=P/ToZ5j8MyOqJrTQuj8vMlsh3bxx0i7QEtovX3sy24tmCGdOuJpB0Shg
 DtIAqAwwnA4A9cPI2oQrpsN8FRBg1YkwRY3Bj2YcdIiG0lyHhJIiv7o4r
 E0F7aJktu5veBbTxY5R2lniVoqNzy236C3FD02cjXfJglS8x041eHstTk
 e2BjD/0Bwjx1SAvzBvQeT4/+wML9kwsy8ZgsboP6Rll/ry5Ay82M+hCVG
 tF/z/s4KxZaOQ5bXuvmrawf9TRHQ0HRw5q7a/xh+dl689IahiBuxVrxxA
 DmnU2bx2e1mam1h88HdKEVepa7cefxd5UxfOE2359v/0wpDNnL293nQow A==;
X-CSE-ConnectionGUID: Z1mEdxrEQyatvCbv3Fk+pQ==
X-CSE-MsgGUID: 1PU2AH+/RUi74Iee61ETXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="51476785"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="51476785"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:27:47 -0700
X-CSE-ConnectionGUID: vrra4oWNRAqTwuqYhxyyhQ==
X-CSE-MsgGUID: xx/fmbYkToe4f+ZZZl+ZNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190897343"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:27:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:27:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 13:27:45 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:27:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkKN/nooRw4khrQ0KdEXNWAgCyiw5oky6Uhrs1DRNJ5W7GLeGk6Owqw+Ty1BQCamzInUlKHvU9dnm5ymoxl1V5TaTA4JnS840zH3z5aEttOreF711WOJFJdirrKq9BISIY3rf8rchjKgXiMECLZeHcbOklM3CKP+x46Clq/BBflJKO8zx0mnkr4Jc1C2FQxnt8bkUsePjKVBsBeFTY60zJ5cAT4EUSrrAJKKxfX4iObhcvn/SWT6Vr6QmaJ2FVJjSJzA9AV3xg0jC8P2vokSNfo83HJ0ZKN+ybsOMYm0ZbJ8pQreAPjRgWwjvmE02f4FbeKJqLe8/kbaC4n2etMh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjB20Pgtmmt9mKyRFl+A/GzUJWimZWI+rub+aJqf+s8=;
 b=S3rUemBSR1wqY8aZPeCFcEN6wd4niKQromAXafY0zL+EEES8rl6OCwm5JUnDMJgFhH/bsfDka2PWOmfLhENl0njjCCT2FpESD2Psr+c/fffX5JFqsLzoZ7wiDiZEJuq4PywVr2rEkIbl8hzjWSfYWQk7dwgpgKxl02ioMo64hm0OhzknOCntBC800fxymYGSFiwqgiCw5z73dBiUS6TrgmSNhRWel2WMUCYBR8fF6alqRchS25+p3bEX79YoOQP5B763+YBpFiFtG9TBBKxjoN1WXFZ2Q5g9OfmNFTmwytZ6xP53i4bSXNs8OWmNuZ0SFsUuAwUxbWxV8PKQwhWOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7900.namprd11.prod.outlook.com (2603:10b6:930:7a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 20:27:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 20:27:42 +0000
Date: Wed, 29 Oct 2025 15:27:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 04/17] drm/xe/pf: Add _locked variants of the VF PT
 config functions
Message-ID: <g7jkr4bqaamoqzfz2rz6ig4shp4c5ah2si4whw5432uv33fvpr@q2mc3ptotk3u>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251028175832.184534-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:a03:255::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: a9862a06-cc84-43a3-64ac-08de17299c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?il7gy8nPrKVZWaYmcdxmtKlLVFkP4xNtHE/smMnb9EXGaXgxPpG58JTM0VUa?=
 =?us-ascii?Q?96NOenOR1Orsc1dOYHlF+icFCzDVPp3GC7Oa6erxAVlvPiJ7EI2Qj0BXuG5e?=
 =?us-ascii?Q?rsYaknUoCe2tKVjgPX0p8v534sGt22p+1lxUsH7nQqYGfVGIGqw3Zu0FQtj9?=
 =?us-ascii?Q?iuJaGBr9EuRR6/AyKbInBY8ju9t2S7DuEdo5YogwqFfcpjNEsHB3yNJYx+uG?=
 =?us-ascii?Q?NrVg/Y9mi+eyW9UraMukiZNYoJWjrk0eqD2xoAL5iH5WBUOd/S7lBPBdtC8g?=
 =?us-ascii?Q?dKR+Tphbbcmnf/e30dqLPVg6p1PSUSxs2DaMgzEp9pdI6CO0UhDL6pJcCavp?=
 =?us-ascii?Q?VLxRgOroXQcJ6ZOknD7UP0Kj7mTYc6qtR1QaRSF08hlrTJHpIy4xB43BMi65?=
 =?us-ascii?Q?6Xos8Bo0k24+TNoEZT3PAKFMVXWQwSk6FbHum2oQr7SlXV/g9IbnWVO1le0F?=
 =?us-ascii?Q?9XgPMRlC3/6ZjxTsXv183x8PD4bsOfSO1SL3lzq/+ZPtkkp6Vwbo1/IVZRbG?=
 =?us-ascii?Q?DODBw8hEtyYvcscgN2PZLuGQGcxWSMoIqKh1PDixhxdrqtsP116H0QFDgvOP?=
 =?us-ascii?Q?jYoEtakZN6Ww/kwhNTgcPWNYKvPJ34t5ixNG28x46uFvlO33Nea1pUJ6ZnNT?=
 =?us-ascii?Q?thtdFNJpjg0GBoFH7NWr/9jkZXrlfLR4ljQRX8KgoblgTj3hx12psmaddWib?=
 =?us-ascii?Q?wOaenpdZkkD5wZburKaf5vps5yjHuSXo9qkYqM1nSM2llGUk5dEn6aHiFbxo?=
 =?us-ascii?Q?2hE18eKJ7XbNNqyfvNuTt+ERhv/rZOXHg0LXvh95aCKLWNcxvtd94Xw9/K7/?=
 =?us-ascii?Q?a6JGAe19tRngzVh3hXGS4NqRvauy6GoUVRVuBOilR/byaiy9Xt5QrnsOJJOT?=
 =?us-ascii?Q?BN0P4DlgETIysbFprs5O8ulC7q3PmrZWMDVGgDb+pbMQmSzZwpehG+htRPxp?=
 =?us-ascii?Q?LDPgqNmYXt1t91klTz5CBBsjxer+GwH9FEr47wiKy4mTznbRdyTezkDVwDlN?=
 =?us-ascii?Q?pmloj+pdzCPoDueopC1yj81ALbJNTv0BTWB81P68Ni4i9rPc+3MKwfolWaRy?=
 =?us-ascii?Q?3IU9UmIVLVFMGjFFePl5NZHd4nB1CRkPS2o2EnwDLNoUwnk1QbU5vk59ZKl1?=
 =?us-ascii?Q?Yp2cqtk8xrjt18X7n+6yNGh8v/gVuOSRsMtT3rn0O91HGIT+NEeB+cW25MPG?=
 =?us-ascii?Q?fX6RcfrIdGm36qT8GjXS3uAhdqe3bnfL3q776WpUhISD0m1sd52coFK5dLeX?=
 =?us-ascii?Q?kZMIb20lRBdw5/MymAunsdh4KE9A8YL1GiB73OAHGdqXb266e6wL8CroIWEO?=
 =?us-ascii?Q?GCD16KptGXNAVzKCnSjzwQf4u9Ay3ZaRoSI+SlH2clyAlW4nITsTf7+f6dBG?=
 =?us-ascii?Q?F/PAsNeALjPi56tZrSmzpBGDqUtr5juRIW4McvAXzDehsSxTrktyMfZZOI6L?=
 =?us-ascii?Q?8c5b2fRU/DpOTa/cP50hvaJHGVNR7Klf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y88N6ENj+/L86y7itPgpSjMm7cnIbnqxkfUj8KQwzgq1CVAk73G+8uvcZ8+C?=
 =?us-ascii?Q?s8iEK1DNZcnktBhClOdCFOwV3TxUYaRjSYniv16zpf2vm3SnokoNHaS3GdXj?=
 =?us-ascii?Q?+mgRfprFPkKb5MHgcSmJOxYb6fLVJWF2xbqhLbQDNTRiRuy0wit5syYTtXfF?=
 =?us-ascii?Q?j1yCKNsePNMAZPbD+YnwNRu0+l5TRPiHLHUbkMdjUpVC1q5O/3GUG/G7F+BL?=
 =?us-ascii?Q?hkcdBQV2tvWoyAJDaioJ4X9BCpeVu5wOlD7t+NrGCnjhn0OoeHIZX0xwBntI?=
 =?us-ascii?Q?X044R1+pltBSp07sVq9KYZkkaVOe9HRWuyfZmT9T6o2Oqp+UfCa1HZzryi9i?=
 =?us-ascii?Q?/za0gHaLT1j0JYDErkgpb2hepImL+v4m5rOr9hsUTm5vJokUYvoLRIMw4Opd?=
 =?us-ascii?Q?Dluo19oTCREv4rBIMUlsFoCZykJjxNImd3hBVF3H+eJrV4h3GyMbysYOyqTX?=
 =?us-ascii?Q?KNAXs/dTWvAcs2MikLBMfgVivsVJTVGSGJtFq6brm31LF1EPbJX+0mjhCQOl?=
 =?us-ascii?Q?h3jier5RfUcd46fhKPv+npKXJlHyE08tGqQOAMg0dYsb0a2cftnv0bw/ku/D?=
 =?us-ascii?Q?e9b/ziFT4SmkWbv9VBIqn/+MGAEbRPKDUKaDxYyUGNMPMrq640og4wkNsCRN?=
 =?us-ascii?Q?khXhf0cNhH6rMQWl2bysC2grkES5N7ESFeQXfE0kqyZSYWUgw0zNYwhYc3RN?=
 =?us-ascii?Q?8KQOpqUGBHiddgU1bnIhZcGlmNZPsDZ3iUUHQ6ZRxi36JmdIzDIXjicAcoNK?=
 =?us-ascii?Q?g3yjIvdjG8VpYeNT0ts9Z4+ABqqu1x7vaX8pF7IUpijlVP11n5s3uoFPnS5d?=
 =?us-ascii?Q?sYB6nBogjhKfx2JfMs9swMIz1v8nhDy2CRerrCmGPb8cg0SADV2YgUwNPnXD?=
 =?us-ascii?Q?0ZZUyM1NYtdrqUcHwFi27gTfLrqnXrWidyd6ytNX0zzFNnXtpMy/uBvQCpxx?=
 =?us-ascii?Q?GF0tnIq9ir/fDHYkvlnObJfM2Mbjb9TzvYNw0oeuKnyADlENCGb/9cmbnsNh?=
 =?us-ascii?Q?0/cxDauDWIbJ5nsIxi4+05Ie9Frs5FhTEb7c7Un4DjWLMaUDKaLLrWtc5tDg?=
 =?us-ascii?Q?CVQYxIsEIPngSEz+hvVs+Jz6JXcoU6BDAh1U+sU2hvSRD2Eg2ETmb1jIfrvW?=
 =?us-ascii?Q?VAn4jDSbtHam4+J4AYIsTTWr72BdKDCKcbjlH1WB1mYI209OG/pzIfs5Xj2v?=
 =?us-ascii?Q?dFQhtPciM/YhYGTPEOdB0kOybBX0BQ+iLFzfLUKu/nauyR0QJ5qVGJjBxnhm?=
 =?us-ascii?Q?IKQIObruR99spIDFOb/+XOXjfq45Ii2LVGz0wW44RrBn1+MGr/N8jSfnOsxs?=
 =?us-ascii?Q?lWst42txR4WwEh//gcFEeg6pZsRs0CC+0E1piRCwLtQWimDRah1Vh9MKySrn?=
 =?us-ascii?Q?ULOcSFlkpd6Zl71c9g8asg9Z3nHaZuut6tb7Y6ZtUbQJjqHRYYGD0D/4ijJ2?=
 =?us-ascii?Q?doRZ21IonJ4I8CQ5FJWbmLifpqEpKizkS2boXT64MJPK2uqy2JAcsoYOUqpl?=
 =?us-ascii?Q?LWu6GUd1h8BeCZ4wL1Nd1OwNisSZEmr30/Rcc16ZITwaFDpaUeHjSnyRjWVj?=
 =?us-ascii?Q?FB8Jgwict3us0WbA+2VVVzoep84i1KGqNNoj8uqPxkMPS5drh5/HfETpNAU7?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9862a06-cc84-43a3-64ac-08de17299c9d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:27:42.2927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBi6kN+wCMR4WREJU+pigAyxtbfRR0rul4UT5DEkBe56R6hET1cpgID+oke8Kfm/ifldoo52oUA8gffACH3RNGkMeVnilKvOOeqcRLXigmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7900
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

On Tue, Oct 28, 2025 at 06:58:18PM +0100, Michal Wajdeczko wrote:
>In upcoming patches we will want to configure VF's preemption
>timeout (PT) on all GTs under single lock to avoid potential
>races due to parallel GT configuration attempts.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
