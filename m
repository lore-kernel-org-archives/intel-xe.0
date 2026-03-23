Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBD7D58B03
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 06:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7F910E30D;
	Mon, 23 Mar 2026 06:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMjReoOx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B60C10E30D
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 06:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774248447; x=1805784447;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zWiguNT5RzwjkxqABK8N9omIASXz9vNHH0bym41Nilc=;
 b=kMjReoOxLG4C2ABLP9p2+slH6b6hAYFWWFSC7XPDIqde6LDlR1wx2yh/
 /9OmxMaUjzpXvcBHS2dkQ7JjvfQIf1GmP9PrbfrvbRjvuqCMyE3Iik/08
 47K/72o+DIOFy3WvxQm1YtXSUzORfFaFM5bLk6BIeHVDsEMXKxFJx3PCU
 emVIBmZc+8sxa5CYaB7JtEaZ6WgzuVHF3ZAi3o9BhgFT8+0ty2yya9r2+
 VJiKHL6ST3BIvZy4Xd+35VKs57Jyz29g3yt1kRFW/FwcRPO+wIv27Zm1L
 w6S4SLf8z5wqZjTAgR5FUYCQ3ovFv1/9/Gp4IFLP0wB4S0WXEuyuZQZ/+ w==;
X-CSE-ConnectionGUID: ZkKELf2TTaywjv5T3Ye3fg==
X-CSE-MsgGUID: /tsM+N9mSZKruWKKwg+dJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75361300"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="75361300"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 23:47:26 -0700
X-CSE-ConnectionGUID: KIursATZQD+oeq1dQb5z6w==
X-CSE-MsgGUID: C1NrK+DnRW+WiT8w0StuIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="246965240"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 23:47:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 23:47:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 22 Mar 2026 23:47:25 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 23:47:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S52Q8O/VL2qQkGga3MA8nHPKIUFhmANx/EVfTAYuEHe2QWfp61dKxRFhQxT5E/yJbHaxmmeoA/7BIKNJt+Y3GOvRRCxPi3d/8AxyHDSJpltbzTFODtt4jFtwYQq7CcjeXYrvlzIfhfNtKFpYQvPcIlIIBhzik7n+cuanKvW+9F4r5tWvdqoRse/xkEWgg7VP1BsxW1cSUeVtq5GnHBq0Qoea9RMYU+QnUl30ZZGIm5rl1TIwRLlgD/00IeUpZZ53td5AtdEbt8aINQ1P3nTYKR1LoCIpmXa5raK5U/qzuvBeAxrguUb67DzbV+DcTlp7crovKIGc13ik11yN10Bd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piwaoyivu4eV1R8ec0o8vCmBZhnGXPojZIZLU2EfI0I=;
 b=dKRNERgdoWJWchMV+usDtoctwweLgT6ZAZDTzYtpGaqn8atpLhkfA0nO9ecrKbdJ+Jr8KLniAeLBAac2Vo6Z5WEncjWlS1kK0TJ3PTIWTFg7RAqB514tMYkSldK0XywRFAPLCqvHRQWMztchwS1WAvZvzrV9qJypOe9IJHCZwfrGx/DdOrdloKXqz0U+r6v6WmOZW6qu4IHZ/G+DFiVtAvzCUHQAOM3upgJ0KKqHJ1Kafdo2LjsQwUkIcAcVA9X0OJmaQMEpuKCTU5sBDLzms+BVU/G2y/OUNXtkp3v94t26MkjQve4D2iKD+deE7jUyfmObBJFRYOnAhxe8/fQApQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by IA1PR11MB7855.namprd11.prod.outlook.com (2603:10b6:208:3f8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 06:47:24 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 06:47:23 +0000
Message-ID: <b1fef15d-1ab6-4fb7-b39c-eb1a4d30170a@intel.com>
Date: Mon, 23 Mar 2026 12:17:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/12] drm/xe/madvise: Implement per-VMA purgeable
 state tracking
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-7-arvind.yadav@intel.com>
 <a8a7c37dffefb4d5d01a76ccf1e327f4a3496ab9.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <a8a7c37dffefb4d5d01a76ccf1e327f4a3496ab9.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::14) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|IA1PR11MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7f0a41-4f35-4a5e-06b1-08de88a809e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: /BL1zcquDujOP24TtkBh/Eo0VKMqt29cd+CwWvSI/Xr0rIuCa0d6bkYGXLKtsPbEOb54Qqrf+WP08+dDqrYrhfDy+gA/Zi/phGmnpjDot0tJni1ULXbDgjgAs0wmESMQPazHl8/PK6mb3mBStrUbLV9rN2FxoQUZHqgI1kDp+NNbIQijE25CiOt3Vwl+KJ8m1iGYmiG2por3gPqOnLeFW7VD36dvd4fUwuImB804TaPcEURu/g9/KOxjp3qITc9tX1kVfdSxR2Wr+1dBOcw7njSi6eICVoiYMGVoQnpYV8RYtu8qdXO+4dZmvgCc1KUku+Vmr2dd0Rh2qeDdtnyuKPmGhXK3XkxtHqFZ43jz7wWulB5KGHhZC9UzKuPqbzoWRYhvFb7bV4lWs4havVQXpEUe8mpEJTeH+vGZvjw4nbzFzF1XiqylJxJ+wFaPsx5FY6OFk7bq9XLrzm+vdxehb7pLnQWiOeqd3GLs8OXmUgbNKUNTkeswxHKwejnWZjAiT/N1sl8CKB+9B+8uDWZ8LTRYoButzvVkRHYVo8xpdbb7/XA6XzzMo8q3+lGlpjXBhXswiLCiMhDTUqTV7RYcIYwjxHEnYwrWl0mX3xU+oLkn+V3Gg3vDNIE0J2pX+GAiV6ryRioniW4yLuFVsGJkUmIYqeBmTqK5m9viie4lgQXLlbH3bfsHUc978TZX+lLTTVgF4fUUn7itDpe9+SpF6cNQffTqh3oqXQRh8BpwMYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXdodGVaT1Yzd2RPMVJVRVNzRDhkVnhxbGx0RzM1UWZ1ekRWUGJRK1Y1Z0pN?=
 =?utf-8?B?SlVUeUx2UlBGa2pIL2pHWUtiRmVFYk1pZmtlT3ZMc3FDRGdxaGY0Zm8xblZY?=
 =?utf-8?B?aHlra0pCZHN4RTNvcVkrVHE0ZCtXbklndS9zK2NZUWdoRHp3QjhvenB4RGxG?=
 =?utf-8?B?NFNZUmxZVFpSWFR0RTFLN3VRcTJ1c1RxYndMLzQ0TkFBcVNvL1ExYmVCbVQ5?=
 =?utf-8?B?MmtNVmp0VGdPcHBSc2ttMGdTcjVabFJQRTJodmNUNHVhRURNVU5iV3lPZ1oz?=
 =?utf-8?B?L2VDSUVpMi9vUmEyWFJPM0pMUVBUcG1FSGFobXZwdHJoa1kyVUYxMklpS1pY?=
 =?utf-8?B?MkdVVGRzZ3kzeUU5L2lLekhYR2dTZG1Gb2lnWVBiQllYVllLQ04rbUZKYnps?=
 =?utf-8?B?ZHlja3A1OEpkUXJOS1czUVNxb1M2ckd1VS9zMUlwT0xmS1NxNUx4OXZFZVJW?=
 =?utf-8?B?WHRxYVNoc0dmWUxnaGdxMllMV3h0M2Q0WXRnb2NxdVV3bzl3SGNGL2JRQWVt?=
 =?utf-8?B?RE0vQzk2Sm1qRUcyNEpHa2dWYUx2YTBBTFRLN0FVNGtvYnBsL0pZbVRaQ1Nv?=
 =?utf-8?B?OTFuWFRza2RVMURDUmFSdzRXK01ocXM5djhqbEZhZkRKeWdqdm1pYVExaHFj?=
 =?utf-8?B?bkxzRGVoWGV4VEtXNy9GTDFpVUNGYjQxTlVXNmlDbUZVWFR1SlZ4SmhobHJB?=
 =?utf-8?B?dSsxWXh1UjJZWGF0L0F6QmFkWjlGYUZiR2FjM2pVWFM1SkVJTFZmTFlaTTNp?=
 =?utf-8?B?TXNScVZLc3ozQUJsRUx3YS9xVUxiREhmdHRxenl0SURVK2lSY1dxUFp1Zmda?=
 =?utf-8?B?b0QxVFV0TUlEMVMrZlpaQjIva2RTbi9lQWUrWEhDSVZJOVM0akJwTjN2aXYv?=
 =?utf-8?B?K05DMlVEYTRnOWFrTXpKTzcrcndTd0drK1ZPVWVjb3U3N09zU3ZRR1RLZHJJ?=
 =?utf-8?B?VDVPcXhqYm5Fdnl1UDhRWHNLTm1kakgyek1JbjF0d3F4eGprajFTSkptZ25u?=
 =?utf-8?B?TW5NcUNucXl6VE12Ri9BcUkrUzlUS0dmcFVOdGxjVDhpbDJOeHVOcXNaTWN4?=
 =?utf-8?B?MTRLeDcwaFpNMEQ0OTZSR3VpL2dGM3loeC9ObTU2cEQ5aWR3SEo3blRzMnd2?=
 =?utf-8?B?QXNVRWw4SnpvVkdsWGNZUkZaR3BSYWx1VXRwNFJpN0RvSWYxOWlIZGV3UEVx?=
 =?utf-8?B?aG5NMVZMdzhud2lGV1NiZzFjUW5qRTYzN3UxY1FXMHNtNVYxNkxxanlMeDVi?=
 =?utf-8?B?SHZ5emt5dHllYkVPU2F0Vy96b05sTlNQb0hrTDc5WG9mdGJ2UExEd1ppMjFV?=
 =?utf-8?B?ckpUeG1Sdjh6SFpaSFZMSEhmRXdGU2JnMDZxV3FDWUFySVV5YXdGeXlCQTlq?=
 =?utf-8?B?dzR1WUtmc3ZuRGFMOGZuSDhFRDNDUjBLNmlhN2dsSkVhR2J5Sitnem1iOUZN?=
 =?utf-8?B?MlFUOFovSk05OWNWeW9QeksyQjExL2lHeUttdWFoK3FZSkVaMGFxOFU4RFo1?=
 =?utf-8?B?MTFFZ3VDN1grSmN1WFRXSW5aNjkycWJ1bERsQVdkRzFJZ3BlbjYwWUx5Z2Z0?=
 =?utf-8?B?eG1FaG83Y2k1L1VBemZKY1Q0QmQvbnVPc2dnWjRGU0xvS3VuWi9XdlZNWmdj?=
 =?utf-8?B?Q1RjVmpRNHJSZVBJYXpscmFTL2piVEsxbVRGL3hvZmZIMDVFS3k1ZXJMK0wx?=
 =?utf-8?B?eXd0Z0d0WERFSlRDbmNPRmJlVXJDRlNTVlJSSlV2QTN5aTFPSit2d2wrTG9l?=
 =?utf-8?B?T2NyRmpQWmF4M0pjU29ERTFZVTBkd2t3a3VlRFpGeDVRRjRaVDRSMGFoSlYw?=
 =?utf-8?B?bXltNjBXNXQ1eEhvN29EdzhUVmg1OWJ0cU8wbVdnU2NJb3hRYm02cmZ2VWpx?=
 =?utf-8?B?ZysxZzI1cFBpWnRIc2N2a1FzdnlVZmdlMVNaNUVocUdmNzZ4YXdZMmtaVE9n?=
 =?utf-8?B?RU1lS0MybUsvWUlkc3lHNDFHNE9nZjdQWnBKRXdydXhwZ2RWcVVxVXlQaS84?=
 =?utf-8?B?OWFValN6S05yK1UxcXRrYjRhamxUOU5JNk9EdkI5V1RPUHRUeVJ4WXV2Unh6?=
 =?utf-8?B?d2lFbVRJSWozNWhjSGFCdnE3WVU0eFR2bEpvQWdidHdoYkkrSW9QQXNlNk1U?=
 =?utf-8?B?NFJzQmU2NmVGRitYZU56dVhKbEg2aUk2a201YnplNkpxZFJoREhac0xObmlQ?=
 =?utf-8?B?Q2s1cWZBYXFRRk1RNXU4cWF1b0RnbVlRYjVRa0lJSTd6L0pBQlpIbUFqWURp?=
 =?utf-8?B?Q1Z2Y2Zra3JyaHJlWlh5MnkvcG9zTUNsUnNJank5U2pwUTBhNzdNYWZ2aHpt?=
 =?utf-8?B?QlpQL3J1ZmNYck40aTlTVDRLOTFQOTdTT0xqV0pHQ0JEd3RJWWdZdz09?=
X-Exchange-RoutingPolicyChecked: Kqbn8K8yyn+Vf3REvgouwu/JTuAt46HuG4cPdcUNqNmDTSF5SPzDXPdegYOc9C/Om1Sg4FawfoHnP8sMMr024UD5R1EUhSeSiclcCGVEDMDKb15oSZsLdWJ7/l473ADne427AMtFKE8aS0tPkRox2SO4HMPP9S7s/eu8+kCQPYc7hje6HX/yVk//pcdO7NMEbzbd5/grrWN+WS1UDF1vGv0vDu8juNNq2ldPghKylhpY0H5fiRsahvdZku9e+qGxVJerDgVxR5AeMMnqF+0PoAaCCG8AwcPt502iw7UGAUXKtCTe+QAK+4FnvvWK8GrqPXcGZhmNx0I+6qz5WJq57g==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7f0a41-4f35-4a5e-06b1-08de88a809e7
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 06:47:23.8961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjG+VtsLe+r3hEKAJ8ZwiKj6aCCm+nQZ1QDAYXLv6Ob3Xqj25eVnQyo5t+2cqxeYnGEAxJ2WsTrsw06jEtAx6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7855
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


On 10-03-2026 15:27, Thomas Hellström wrote:
> On Tue, 2026-03-03 at 20:50 +0530, Arvind Yadav wrote:
>> Track purgeable state per-VMA instead of using a coarse shared
>> BO check. This prevents purging shared BOs until all VMAs across
>> all VMs are marked DONTNEED.
>>
>> Add xe_bo_all_vmas_dontneed() to check all VMAs before marking
>> a BO purgeable. Add xe_bo_recheck_purgeable_on_vma_unbind() to
>> handle state transitions when VMAs are destroyed - if all
>> remaining VMAs are DONTNEED the BO can become purgeable, or if
>> no VMAs remain it transitions to WILLNEED.
>>
>> The per-VMA purgeable_state field stores the madvise hint for
>> each mapping. Shared BOs can only be purged when all VMAs
>> unanimously indicate DONTNEED.
>>
>> This prevents the bug where unmapping the last VMA would incorrectly
>> flip
>> a DONTNEED BO back to WILLNEED. The enum-based state check preserves
>> BO
>> state when no VMAs remain, only updating when VMAs provide explicit
>> hints.
>>
>> v3:
>>    - This addresses Thomas Hellström's feedback: "loop over all vmas
>>      attached to the bo and check that they all say WONTNEED. This
>> will
>>      also need a check at VMA unbinding"
>>
>> v4:
>>    - @madv_purgeable atomic_t → u32 change across all relevant
>>      patches (Matt)
>>
>> v5:
>>    - Call xe_bo_recheck_purgeable_on_vma_unbind() from
>> xe_vma_destroy()
>>      right after drm_gpuva_unlink() where we already hold the BO lock,
>>      drop the trylock-based late destroy path (Matt)
>>    - Move purgeable_state into xe_vma_mem_attr with the other madvise
>>      attributes (Matt)
>>    - Drop READ_ONCE since the BO lock already protects us (Matt)
>>    - Keep returning false when there are no VMAs - otherwise we'd mark
>>      BOs purgeable without any user hint (Matt)
>>    - Use xe_bo_set_purgeable_state() instead of direct
>> initialization(Matt)
>>    - use xe_assert instead of drm_warn (Thomas)
>>
>> v6:
>>    - Fix state transition bug: don't flip DONTNEED → WILLNEED when
>> last
>>      VMA unmapped (Matt)
>>    - Change xe_bo_all_vmas_dontneed() from bool to enum to distinguish
>>      "no VMAs" from "has WILLNEED VMA" (Matt)
>>    - Preserve BO state on NO_VMAS instead of forcing WILLNEED.
>>    - Set skip_invalidation explicitly in madvise_purgeable() to ensure
>>      DONTNEED always zaps GPU PTEs regardless of prior madvise state.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c        |   1 +
>>   drivers/gpu/drm/xe/xe_vm.c         |   9 +-
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 127
>> +++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_vm_madvise.h |   3 +
>>   drivers/gpu/drm/xe/xe_vm_types.h   |  11 +++
>>   5 files changed, 144 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c
>> b/drivers/gpu/drm/xe/xe_svm.c
>> index 002b6c22ad3f..dffa0cab5f5d 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -318,6 +318,7 @@ static void xe_vma_set_default_attributes(struct
>> xe_vma *vma)
>>   		.preferred_loc.migration_policy =
>> DRM_XE_MIGRATE_ALL_PAGES,
>>   		.pat_index = vma->attr.default_pat_index,
>>   		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
>> +		.purgeable_state = XE_MADV_PURGEABLE_WILLNEED,
>>   	};
>>   
>>   	xe_vma_mem_attr_copy(&vma->attr, &default_attr);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 4a8abdcfb912..8e4c14fa3df2 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -39,6 +39,7 @@
>>   #include "xe_tile.h"
>>   #include "xe_tlb_inval.h"
>>   #include "xe_trace_bo.h"
>> +#include "xe_vm_madvise.h"
>>   #include "xe_wa.h"
>>   
>>   static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>> @@ -1085,6 +1086,7 @@ static struct xe_vma *xe_vma_create(struct
>> xe_vm *vm,
>>   static void xe_vma_destroy_late(struct xe_vma *vma)
>>   {
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>> +	struct xe_bo *bo = xe_vma_bo(vma);
>>   
>>   	if (vma->ufence) {
>>   		xe_sync_ufence_put(vma->ufence);
>> @@ -1099,7 +1101,7 @@ static void xe_vma_destroy_late(struct xe_vma
>> *vma)
>>   	} else if (xe_vma_is_null(vma) ||
>> xe_vma_is_cpu_addr_mirror(vma)) {
>>   		xe_vm_put(vm);
>>   	} else {
>> -		xe_bo_put(xe_vma_bo(vma));
>> +		xe_bo_put(bo);
>>   	}
>>   
>>   	xe_vma_free(vma);
>> @@ -1125,6 +1127,7 @@ static void vma_destroy_cb(struct dma_fence
>> *fence,
>>   static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence
>> *fence)
>>   {
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>> +	struct xe_bo *bo = xe_vma_bo(vma);
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>>   	xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
>> @@ -1133,9 +1136,10 @@ static void xe_vma_destroy(struct xe_vma *vma,
>> struct dma_fence *fence)
>>   		xe_assert(vm->xe, vma->gpuva.flags &
>> XE_VMA_DESTROYED);
>>   		xe_userptr_destroy(to_userptr_vma(vma));
>>   	} else if (!xe_vma_is_null(vma) &&
>> !xe_vma_is_cpu_addr_mirror(vma)) {
>> -		xe_bo_assert_held(xe_vma_bo(vma));
>> +		xe_bo_assert_held(bo);
>>   
>>   		drm_gpuva_unlink(&vma->gpuva);
>> +		xe_bo_recompute_purgeable_state(bo);
>>   	}
>>   
>>   	xe_vm_assert_held(vm);
>> @@ -2691,6 +2695,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
>> *vm, struct drm_gpuva_ops *ops,
>>   				.atomic_access =
>> DRM_XE_ATOMIC_UNDEFINED,
>>   				.default_pat_index = op-
>>> map.pat_index,
>>   				.pat_index = op->map.pat_index,
>> +				.purgeable_state =
>> XE_MADV_PURGEABLE_WILLNEED,
>>   			};
>>   
>>   			flags |= op->map.vma_flags &
>> XE_VMA_CREATE_MASK;
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index f7e767f21795..ca003e0db87b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -12,6 +12,7 @@
>>   #include "xe_pat.h"
>>   #include "xe_pt.h"
>>   #include "xe_svm.h"
>> +#include "xe_vm.h"
>>   
>>   struct xe_vmas_in_madvise_range {
>>   	u64 addr;
>> @@ -183,6 +184,112 @@ static void madvise_pat_index(struct xe_device
>> *xe, struct xe_vm *vm,
>>   	}
>>   }
>>   
>> +/**
>> + * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
>> + *
>> + * Distinguishes whether a BO's VMAs are all DONTNEED, have at least
>> + * one WILLNEED, or have no VMAs at all.
>> + *
>> + * Enum values align with XE_MADV_PURGEABLE_* states for
>> consistency.
>> + */
>> +enum xe_bo_vmas_purge_state {
>> +	/** @XE_BO_VMAS_STATE_WILLNEED: At least one VMA is WILLNEED
>> */
>> +	XE_BO_VMAS_STATE_WILLNEED = 0,
>> +	/** @XE_BO_VMAS_STATE_DONTNEED: All VMAs are DONTNEED */
>> +	XE_BO_VMAS_STATE_DONTNEED = 1,
>> +	/** @XE_BO_VMAS_STATE_NO_VMAS: BO has no VMAs */
>> +	XE_BO_VMAS_STATE_NO_VMAS = 2,
>> +};
>> +
>> +/**
>> + * xe_bo_all_vmas_dontneed() - Determine BO VMA purgeable state
>> + * @bo: Buffer object
>> + *
>> + * Check all VMAs across all VMs to determine aggregate purgeable
>> state.
>> + * Shared BOs require unanimous DONTNEED state from all mappings.
>> + *
>> + * Caller must hold BO dma-resv lock.
>> + *
>> + * Return: XE_BO_VMAS_STATE_DONTNEED if all VMAs are DONTNEED,
>> + *         XE_BO_VMAS_STATE_WILLNEED if at least one VMA is not
>> DONTNEED,
>> + *         XE_BO_VMAS_STATE_NO_VMAS if BO has no VMAs
>> + */
>> +static enum xe_bo_vmas_purge_state xe_bo_all_vmas_dontneed(struct
>> xe_bo *bo)
>> +{
>> +	struct drm_gpuvm_bo *vm_bo;
>> +	struct drm_gpuva *gpuva;
>> +	struct drm_gem_object *obj = &bo->ttm.base;
>> +	bool has_vmas = false;
>> +
>> +	xe_bo_assert_held(bo);
>> +
>> +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>> +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
>> +			struct xe_vma *vma = gpuva_to_vma(gpuva);
>> +
>> +			has_vmas = true;
>> +
>> +			/* Any non-DONTNEED VMA prevents purging */
>> +			if (vma->attr.purgeable_state !=
>> XE_MADV_PURGEABLE_DONTNEED)
>> +				return XE_BO_VMAS_STATE_WILLNEED;
>> +		}
>> +	}
>> +
>> +	/*
>> +	 * No VMAs => preserve existing BO purgeable state.
>> +	 * Avoids incorrectly flipping DONTNEED -> WILLNEED when
>> last VMA unmapped.
>> +	 */
>> +	if (!has_vmas)
>> +		return XE_BO_VMAS_STATE_NO_VMAS;
>> +
>> +	return XE_BO_VMAS_STATE_DONTNEED;
>> +}
>> +
>> +/**
>> + * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state
>> from VMAs
>> + * @bo: Buffer object
>> + *
>> + * Walk all VMAs to determine if BO should be purgeable or not.
>> + * Shared BOs require unanimous DONTNEED state from all mappings.
>> + *
>> + * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM
>> lists,
>> + * VM lock must also be held (write) to prevent concurrent VMA
>> modifications.
>> + * This is satisfied at both call sites:
>> + * - xe_vma_destroy(): holds vm->lock write
>> + * - madvise_purgeable(): holds vm->lock write (from madvise ioctl
>> path)
>> + *
>> + * Return: nothing
>> + */
>> +void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
>> +{
>> +	enum xe_bo_vmas_purge_state vma_state;
>> +
>> +	if (!bo)
>> +		return;
>> +
>> +	xe_bo_assert_held(bo);
>> +
>> +	/*
>> +	 * Once purged, always purged. Cannot transition back to
>> WILLNEED.
>> +	 * This matches i915 semantics where purged BOs are
>> permanently invalid.
>> +	 */
>> +	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
>> +		return;
>> +
>> +	vma_state = xe_bo_all_vmas_dontneed(bo);
>> +
>> +	if (vma_state == XE_BO_VMAS_STATE_DONTNEED) {
>> +		/* All VMAs are DONTNEED - mark BO purgeable */
>> +		if (bo->madv_purgeable !=
>> XE_MADV_PURGEABLE_DONTNEED)
>> +			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_DONTNEED);
>> +	} else if (vma_state == XE_BO_VMAS_STATE_WILLNEED) {
>> +		/* At least one VMA is WILLNEED - BO must not be
>> purgeable */
>> +		if (bo->madv_purgeable !=
>> XE_MADV_PURGEABLE_WILLNEED)
>> +			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_WILLNEED);
>> +	}
>> +	/* XE_BO_VMAS_STATE_NO_VMAS: Preserve existing BO state */
> Couldn't this be made:
>
> 	if (vma_state != bo->madv_purgeable && vma_state !=
> XE_BO_VMAS_STATE_NO_VMAS)
> 		xe_bo_set_purgeable_state(bo, vma_state);


Good catch — since static_assert already enforces the enum value 
alignment, the explicit casts are redundant. Will simplify in v8.

>
> (see upcoming email for shrinker implication).
>
> I also wonder if you ever explored the idea of having a "willneed_maps"
> refcount on each bo. Each willneed vma as well as each exported dma-buf
> would then take such a refcount, and state-transitions would happen
> when the refcount goes from 0->1 and 1->0? That could possibly save a
> lot of processing in xe_bo_all_vmas_dontneed?
>

The willneed_maps refcount idea is clean and I plan to take it as a 
separate follow-up after this series to keep things simple for now.


Thanks,
Arvind

> /Thomas
>
>
>> +}
>> +
>>   /**
>>    * madvise_purgeable - Handle purgeable buffer object advice
>>    * @xe: XE device
>> @@ -214,8 +321,11 @@ static void __maybe_unused
>> madvise_purgeable(struct xe_device *xe,
>>   	for (i = 0; i < num_vmas; i++) {
>>   		struct xe_bo *bo = xe_vma_bo(vmas[i]);
>>   
>> -		if (!bo)
>> +		if (!bo) {
>> +			/* Purgeable state applies to BOs only, skip
>> non-BO VMAs */
>> +			vmas[i]->skip_invalidation = true;
>>   			continue;
>> +		}
>>   
>>   		/* BO must be locked before modifying madv state */
>>   		xe_bo_assert_held(bo);
>> @@ -226,19 +336,26 @@ static void __maybe_unused
>> madvise_purgeable(struct xe_device *xe,
>>   		 */
>>   		if (xe_bo_is_purged(bo)) {
>>   			details->has_purged_bo = true;
>> +			vmas[i]->skip_invalidation = true;
>>   			continue;
>>   		}
>>   
>>   		switch (op->purge_state_val.val) {
>>   		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>> -			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_WILLNEED);
>> +			vmas[i]->attr.purgeable_state =
>> XE_MADV_PURGEABLE_WILLNEED;
>> +			vmas[i]->skip_invalidation = true;
>> +
>> +			xe_bo_recompute_purgeable_state(bo);
>>   			break;
>>   		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>> -			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_DONTNEED);
>> +			vmas[i]->attr.purgeable_state =
>> XE_MADV_PURGEABLE_DONTNEED;
>> +			vmas[i]->skip_invalidation = false;
>> +
>> +			xe_bo_recompute_purgeable_state(bo);
>>   			break;
>>   		default:
>> -			drm_warn(&vm->xe->drm, "Invalid madvice
>> value = %d\n",
>> -				 op->purge_state_val.val);
>> +			/* Should never hit - values validated in
>> madvise_args_are_sane() */
>> +			xe_assert(vm->xe, 0);
>>   			return;
>>   		}
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
>> b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> index b0e1fc445f23..39acd2689ca0 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> @@ -8,8 +8,11 @@
>>   
>>   struct drm_device;
>>   struct drm_file;
>> +struct xe_bo;
>>   
>>   int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>>   			struct drm_file *file);
>>   
>> +void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
>> b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 1f6f7e30e751..bfe7157756ad 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -94,6 +94,17 @@ struct xe_vma_mem_attr {
>>   	 * same as default_pat_index unless overwritten by madvise.
>>   	 */
>>   	u16 pat_index;
>> +
>> +	/**
>> +	 * @purgeable_state: Purgeable hint for this VMA mapping
>> +	 *
>> +	 * Per-VMA purgeable state from madvise. Valid states are
>> WILLNEED (0)
>> +	 * or DONTNEED (1). Shared BOs require all VMAs to be
>> DONTNEED before
>> +	 * the BO can be purged. PURGED state exists only at BO
>> level.
>> +	 *
>> +	 * Protected by BO dma-resv lock. Set via
>> DRM_IOCTL_XE_MADVISE.
>> +	 */
>> +	u32 purgeable_state;
>>   };
>>   
>>   struct xe_vma {
