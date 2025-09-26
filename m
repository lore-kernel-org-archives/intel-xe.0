Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D61CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 15:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E7B10EA87;
	Fri, 26 Sep 2025 15:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5ph/9h9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12AA10EA87
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758899370; x=1790435370;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uCIT26ch2QzhwvlyKzSwU27xZm9cKwWizYtpew9p6Uk=;
 b=U5ph/9h9SXnvpZVrvJ4cMATZEJytfu9MqvnzSBRKRymHyc1+399E8XBk
 sgR7JkOlHWOtEI0nb508H3EMd74rtISLmOCacPSbCq++/Y1NWkFTtjUWS
 LK0fb5jivTsPVcBUAPHaf2kez/1P9sl++9vNXxD2vK2/vGtD747BYHPpH
 RhQTfZX/1YtJ5aPH8YfypoFE8d4Kkzg8b4EkOKu0LWKFJ+YlSCdtnhqLB
 Op8CYa66pI+9Wr3bkGgW06Llxihoy3bIQ6/Q380oVy3mioFXpq8s2ETaU
 nm6JSl/oFkLWuVPMwF3LbqISE2766DWBDY5jBQWqlRPqvFlfpNRfFcrzI g==;
X-CSE-ConnectionGUID: fkjporqvSvi1X7h9mC4JOw==
X-CSE-MsgGUID: vcNiBMJJSje9bDWjoSUuhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61152652"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="61152652"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:09:29 -0700
X-CSE-ConnectionGUID: Xm77lc3jRBWE2G4A2IKT+A==
X-CSE-MsgGUID: 79ugo3x2SSmAm+CcUNsI8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="181635894"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:09:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:09:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 08:09:28 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.54)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:09:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrw97dDBnaJ5ePZRJAbLKa6/krPNV5dPW/IDGtlpFFZ+fGUuRXWZCYUszTnLrRvVZ+8JMWXLqkifT3XRGTOIOctm7z3ANBPiJh1tBQwong8zkY48wQ2al68wbJs03qs0FJI4WQwvm57vjw9mOCXaWgIfirMehUjbQ9FE5z2wTSoKWU7Uf329DbHpqjJlERHtXC4swtzK3OsBiKjqqESPgI92nKtR1k40+wssQ6RjfhozRprS3tW6Y6YCigCFHHgnBgPwgnowzmiS3Vimj108zThMVA3nblkh6eSdsgsF4zhSLD/2eSbEfyaqI+vDgBFd0oWeBf5sgHHudVbbNSABkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6XkURgEsT55fmOqSDBwV+Wjn4hMfuvFlHn46pB7ZSw=;
 b=w+134U4TF9MfXiEjAidtzoSn3AJfjXdKBD6Yz6gzLwFuMtHCfZfap8nfbMmXbmhiH9HydgeB4OTRGvYKkFUnc1HVmWU8Ppb0/GLkQcSu6yte+v2QQf5+IG/wc3DjR3ymjIEzzV5NiF6lmQeQdz/De0x0RHCXpjZsu1L0NIDxITAXnaLDk+IlCw71wn12BRYa3eM46iotAeliai70llWi4JJKReDNfSun6L6LY0yPeRraWYOKCBWD+tpe6zghFgzHLAdBpQwRO9OiREjOAXF3L9K4/Yt/SHnVXAFxW2+7CA5/lnnq5/3H//zhLIbsRw/yyWrtEH4YwYESZYeQ8lPNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7407.namprd11.prod.outlook.com (2603:10b6:8:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 15:09:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 15:09:26 +0000
Date: Fri, 26 Sep 2025 10:09:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 4/6] drm/xe/pf: Move SR-IOV GT debugfs files to new tree
Message-ID: <d4bgrijd6k5s24ojpnjs5q2a2fmew7binacj34ilpilew3henr@dp7a6pbmwmaj>
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
 <20250925220425.196860-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925220425.196860-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: b9914017-5135-4008-ee8d-08ddfd0eaea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGQ0aW5NbmE2cHVtQThsdXM5bkcxaFFOSmpJYjFOaUNnREVJNGk5Uk55Q0ZY?=
 =?utf-8?B?N3pjc1B0YVdEYnZQQnpYY0Y3Q0prcDNXOHdQelBIQmlIQnZMUjBnZDVPT05u?=
 =?utf-8?B?VWdRSjMrZEkrcC9INk5TSWVOZi9PekoxR005dkJvb1NkaW5RRk42L1VmL1pI?=
 =?utf-8?B?clB0UWNlL2F3QUkrK0p0bEhnT2JneEpIZmxiTmFEOURKUWxqRFJaSTRSRmJS?=
 =?utf-8?B?NUN5cGkyd2JZUTlwOW15NzJLTVFPVVZqZW11QTJVN0p1Y1NKUWdndnF3ZVVN?=
 =?utf-8?B?L2poeUoxYWR4TGtNREx2YlNoVmEycWx6N0xGM1lFRlRjc09HQ3d2eng0cEVw?=
 =?utf-8?B?OTFqT3BxNDVPNTkwbzNRUEw4b0NmSGVOLzU3ZTl1bnJiaTZ3SkFWSGZZMU5B?=
 =?utf-8?B?V25yYk4xcDdrWTRJdXgxNFl2bzQzKzJ0RFdLeWlFM1djYnhOZVAxeVJPYWtM?=
 =?utf-8?B?b1gzVzR0K1FQN1djSXdkMEpxZlZ1elJ3bHJaTFRnVnFHSStIcEFKRStlN21Q?=
 =?utf-8?B?cHFwYjBZYjZqdHBZMVIyVEdPVjUzL2FzbjJwdktINUJNOVhUN25zVkdDU01j?=
 =?utf-8?B?ZzhxZnF6QjdqS2hlbVBxY2NkS0NYY1N1Uk5Vb0VxbzZxTGZLZFE0aWhWbDA2?=
 =?utf-8?B?QmZsaVNYb1NqamlNR21Rd1BMajNPcVJYOEF5a2R1cFpnbUZud04vZHBPYW1q?=
 =?utf-8?B?RHpnVjMva3Q1WGR6ZzlmZ3RmR1VvUDRTOEp1Smkyank5WlptS3JMamtlMk91?=
 =?utf-8?B?TnIxMDlIVnlTM2hiR3RtcUR6elNtanpWQTFUbGlaR2RCUmpRT3BEYm5JZ0hC?=
 =?utf-8?B?ZkVjd2ZHQ1ZMNWZGSVhFU0FkWWFwdm9UdEhkRTZiTTM0eGhEQTdta0VFRjkv?=
 =?utf-8?B?Q1ViRnFHc3FwaEc1SitsNFhMWjVZSjhBOTNiNFlLc0VncktyZjJoTUx6ak9h?=
 =?utf-8?B?Q3VEb2tBWUMxbGloY1pmT0VpaWF0eGh6a1VlVm1PbFowWURkdWhCQ1FjN3Vj?=
 =?utf-8?B?bW5kY25Rck9qMmRtMmkwSVlETFltYUNOZDVLK0ZkRUI1YmZweXlyVVltZmhv?=
 =?utf-8?B?VUVjelJaZFg2eVp4L20zQTZQU2dBV0ttMDE0QXhYeXUvS1JHRUpEZ3oxaTEy?=
 =?utf-8?B?YXdpbGxhMzFJd3FrdXN5UThrN0FnczlxRDIzeGEvdkJiNlhJcUlQbURJRDVC?=
 =?utf-8?B?M2F5clBzWEw4NUdkcWxHWVlLZlNJNmUvSG9Mdmt2WXFibGNtZDFzUE4vVUFB?=
 =?utf-8?B?Ri9VdkFyWVBkMXZyVmxpaGJSVFBSOWhhcEltRHI0aTZsZUZXbHJTWE5paVph?=
 =?utf-8?B?eWNJOFc3S0xkZ3ZXRUpuZDBxYkxSTjVMU3pmS0liOHh0N1ZNaFpaQXl2eTlK?=
 =?utf-8?B?dTV2aHlLUm9aWG04VjJGMlBaWTdZOHdETjhDNncwOWtodG41ZlJvNHJCak4x?=
 =?utf-8?B?QzV6K0Z2c2pJSFNTR2RQT1lQRTJQVWgrNmtRT3h2UU1Id3dqS0xTOTlISkJs?=
 =?utf-8?B?Q3EweVlSbUcybkc1d1hOdEg4aHBHZkw5aktkQ1B5eitXVVNLdDlxYlgwUFdU?=
 =?utf-8?B?LzZoN3dFYnZYUmNDU1o2ajFzbm1VTkVJbnhBM2hFamJiVmhidzl4eWxKaHE5?=
 =?utf-8?B?SnQ5c0xaTzZvaEF4YjZwcTc0ZkE1SDBSajNNR0g1dVhMaTlqMUltRE5ZcEN4?=
 =?utf-8?B?ems1UGgzNWdVQ2ZLeURHbEozY0xFVmVjZkZHWWpNdUVQQm9Qd0haV1FwYlRY?=
 =?utf-8?B?N3FtYm52aWo5T21OUnh6YXVEUk9hNzNQU3Rmc0JadFkrM05MTUJaMGZQQTBH?=
 =?utf-8?B?UEVJSnl4ODBteGRLWmtnYlNCRGpRZitrRU1ITVFoNGp0cXpKbHZybXNUbzZ1?=
 =?utf-8?B?UzcyWlU0UEVOcjArMnJINFN6aEFrWnh1elMwWGw2UW5wbm9iMnptR2lJY0sz?=
 =?utf-8?Q?o8dp3oACnUNv2w2y3Lr93iSBz2zS/Hdk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEE1SzN6dVZQdGlJcVQ1M3dUK3A5dVQ2eCtwQ1U1VG9QQzNrTHI4MmN2ZWUv?=
 =?utf-8?B?WHdBQ0xEVDB3cXJSc2JGQzRnN3dUSzNUUU45L3Z3b2dlTlgxdUVjMEtNbWZY?=
 =?utf-8?B?cHRjbG5OVkZsTkEzcFFsdmdoMzQ5NEdURHRERmNiejZvRzBsTEh6a1ZPMkMv?=
 =?utf-8?B?SUlORzM4UUFlZ3c3cjVncjNUK3kvY3Ntb1JOUk9wc2tiVjA4Z2JiV00wdUgw?=
 =?utf-8?B?T21JNGFuZUhSQUtiZXNqSFhUTHB6ZHRndXVmRXp0aXdrVytoeS9QVE1rcmNE?=
 =?utf-8?B?TXhBNE02bUM1MFcxZGNNTTdsMzdYZ1lFa0l5Lzd6dzB3dkY3SmtXeEU3dXFG?=
 =?utf-8?B?MllRRDVQODZVRDFUYVpUTVZUeCt1cUtFQWNjUXZGYkh6c3dud1NCcW1XOG9V?=
 =?utf-8?B?WTR6TDJ4MFN2R1dhVkwzcTJWK3kyYTB5SkRaekpvaGxjWXp4QVF1ODZLZ0FT?=
 =?utf-8?B?WW9zZXJ0NTVVclJMT1UwMTI3UUJFT1ZVSm9tQ3ZEcXNlS0F6OWUzemoxVU1z?=
 =?utf-8?B?cTIxY3hqQm9LS0VwMHFHS2FJQU9MQXA5UmYwdC9OdjlnNVd4R29EVFBBVWQw?=
 =?utf-8?B?dVh3aC9EU1pZYVI1b2orcU14RFZ3SEZWRTJqK3VHNENYbENSMkw3MS9xbTJy?=
 =?utf-8?B?WXVJYXZLUERQN2k2ZEhjcjdHUWREUHFUTXVId1JqN21WMWZkVTM2WlZsdFVi?=
 =?utf-8?B?a0YzWFpGT05iTlZjdkFhUFJSc1ozWmxNcnBZU1gyUm5CaUM5UnovNS8vRkVI?=
 =?utf-8?B?MXorYysraFlGWWtiNGg2RUN1L1ZUejZSUWMyZ1NUTktySjJ3U0gxUHRlZi9m?=
 =?utf-8?B?TTk3aWJVYXdtWnBZZUhiNmhYT2hacXlRU3ZXZmZQTGtUYnZSaklIRklRZzA4?=
 =?utf-8?B?S01IcWFoRmc1Z0tobDA3Y2FxRGdiOTVoaTdBUDZPTytTVFl3dS85c0ZlcERv?=
 =?utf-8?B?T1RGSHNGcDR5ekJqZjEyZUtOMTBaQUx6SWdjcXhUTUtGS216RHBLdjRtUTRj?=
 =?utf-8?B?UTlvMUpaZkU1eVFncWRweUxEeXdOL1dkS0I0Tm1OL0dOTFUrWFJWbGpzSXhh?=
 =?utf-8?B?dUJoVUU2OHdoUFZhSEFsRjZsY2FSRXAxWjRiRy82NlJFTURhbWIwd1FUejFS?=
 =?utf-8?B?UnpTRGp5U0pwU2NQNWdUT1VlWUo1Ujk1TUNjUVliRmI1UnVHYi9yelVnWUR3?=
 =?utf-8?B?bjBZY283ajQzcTcxSFZaV1JDYVRUVEx2azB4RjZlYTh1NVN1UTVTdHFNU3pS?=
 =?utf-8?B?SUVtR0hIWmJsa0M3b2kxZ2xCYVB2aWlOeWY3UkJtelhnRy9RNGx4SkJ1WXhR?=
 =?utf-8?B?cytYRE94OVljMEsyaENtL3J0eU5zRGVQeDhtQmx3Rk9tT3RuUTRUcDJjSTBp?=
 =?utf-8?B?RFpvOVltMDZCbDNSaVV0dUhPYW1uajZLZURMSituMms1TnVUMk9KbDZCVVZC?=
 =?utf-8?B?R1YwVEkwaVpKZVZVSlk2RkVoc2xUQWFOYXBpMzRZbTNBUi9rbDNrV2J6a3Fh?=
 =?utf-8?B?NDRXQ0xxMDhCZkdHZ1BPa2FEOVdaQ2luRTBBMUg0aXNQNHdtWnRBVzV6Y2lv?=
 =?utf-8?B?cTE0UnYzendlRWpHMTNseHR6WFM1ekZ2ckI2WFQ5empMQ1dBa0FkRTdEcUZC?=
 =?utf-8?B?UE40b0xnSE5ObkJQZFB1aUhJSHpaRXd0YktYV1BQUlBTbjBFZUdxN0xKdlhW?=
 =?utf-8?B?eHp4MU5XeTF3Q0lTa0hDbi9GcllPT2VlUTd2UmNyYVpjeWxYNGF5bldCWVdx?=
 =?utf-8?B?bGlMRi96MzlxSTdTUjZudXJmeFFsR1FJYVZ3V0tSVkFCK3g4dXIrblRjTnhM?=
 =?utf-8?B?bGFKanpjenlCaG14YkNEVGhEdDR0cVplNjZmaExTWk5tQlFNdEd6TTIzNTdr?=
 =?utf-8?B?dUVWdlBmZlBUY2VMSUZ6eW16bFV5MmVldW1vVE90a2VLbHBJWmNHeHZCVWdx?=
 =?utf-8?B?MS9XSnZIWTdERUdjRUg1aWgvNUo5NkxPVmZjWExwL1dRazJZT29kNDREb0FB?=
 =?utf-8?B?VzlmR0hJTTlhVFdMYXB2WE9BeUxYYmVWMHdLMG0vY0xiblRIRkhlOGRkT1Zn?=
 =?utf-8?B?bWVKeGxmTFg4eU81L2tRTkVuVmRGN1ovMUtaQ08xeTVOb2RFVmNRVDBLZzdr?=
 =?utf-8?B?ejFNcFgzZzdGaTV6SkJhWTlWTVgvd3hYY1J2K0JTRk5EdDU3ZEVEcWhIaDVt?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9914017-5135-4008-ee8d-08ddfd0eaea3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 15:09:25.9073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrUDGx52rGAVAP7CmtiwGR4cxsy9bdDXsn2EssjRVGSwZr7b8LNZ5kujKHtNZEdGMcxMp9/2mwAvWyFWdPSfRAHjNqifzz4kpd3Q/qVGedY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7407
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

+ Thomas

On Fri, Sep 26, 2025 at 12:04:21AM +0200, Michal Wajdeczko wrote:
>@@ -107,10 +124,12 @@ static const struct drm_info_list pf_ggtt_info[] = {
> };
>
> /*
>- *      /sys/kernel/debug/dri/0/
>- *      ├── gt0
>- *      │   ├── pf
>- *      │   │   ├── lmem_provisioned

here

>@@ -122,12 +141,14 @@ static const struct drm_info_list pf_lmem_info[] = {

here

>@@ -173,24 +194,28 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
> }
>
> /*
>- *      /sys/kernel/debug/dri/0/
>- *      ├── gt0
>- *      │   ├── pf
>- *      │   │   ├── ggtt_spare
>- *      │   │   ├── lmem_spare

here

>- *      │   │   ├── doorbells_spare
>- *      │   │   ├── contexts_spare
>- *      │   │   ├── exec_quantum_ms
>- *      │   │   ├── preempt_timeout_us
>- *      │   │   ├── sched_priority
>- *      │   ├── vf1
>- *      │   │   ├── ggtt_quota
>- *      │   │   ├── lmem_quota

here

we usually refer to lmembar for the PCI BAR since this is how it's
defined in HW spec. However we usually refer to the lmem/device_memory
as vram in xe. SR-IOV is the main offender of using lmem while the rest
of the driver uses vram. We should probably make it consistent or
justify the difference.

Lucas De Marchi

