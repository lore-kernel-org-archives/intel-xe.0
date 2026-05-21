Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA6ACD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 00:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3BC10E444;
	Thu, 21 May 2026 00:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtmSlMiz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BE610E444
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 00:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779321930; x=1810857930;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/0xupJWp2ukBsMVkMFc+eJCpSDrB2dFhNiNRvvk9HNU=;
 b=jtmSlMizzz+fKY7ZCqAudYy4NItlP0ns4fWwvVhqxoaMKVE1500/6xWN
 GgariMTAcuOicqnClNFf2YbXmLpobq5KbGLFS4i3LSFen3WK60O3g7FWn
 nmCTQ1fra7fCsrcApGtr+NTONjBpYdo1203DGN80fDYb5YCs6Sl2r22r/
 zVdN3OjwyXCCsX9vKaM4mOdQkm7lo9vBj6t+EtOOsGoQQCK7TNio/wh2w
 lkDkjAS+fWRSEjhzSABCBGSKo965cTJgui6RmgrDTz0THxyr+pM1ivugx
 +Z3hVSU52H+q0tatAHHYHM4uN5iIW/IUZyVo4H4iEdPdu+/k8mbmzjZYV A==;
X-CSE-ConnectionGUID: bVRUulaUQGm5T4hP42HIIg==
X-CSE-MsgGUID: MQt4uRhLQ3CxjB189e+OmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90929906"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="90929906"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 17:05:14 -0700
X-CSE-ConnectionGUID: s6gkEFfrRe+eGt/Rf0JMAA==
X-CSE-MsgGUID: DRmq697ITj641rJ33KvMNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="235947938"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 17:05:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 17:05:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 17:05:13 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 17:05:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmc4/egMg7a+zv9IIE/PmFC54O3/X2meiDZgGV3X1DjMuPAnC9q35O3vJYdcSBDMndrw1P+mmJMgmIxnL40sNS5YohFMsJPfG2aU36qoDEWdbEVWioXk6peyLctQpjPYokjVsnG7v4Ss7Y4KKdT2hazrp2+TVv1gnhVme2vkyuJGagYIIri6gM/vAEY7Ufs2Qguim6G3q8gncOznXBzXY3SQw9IV5Ku+mlC4UqHzf6uvhSfYuW25Uei7F61q+MxtJWBpt1btPDpljoET8J70EfffXr5fyoZazAFsQByfKWXwEE2exwQpVVO7Rrn8UPXq4DQ4BSi9hdSQ1DnuZw9lAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1c7tsJ8GWhH64xyUQTTwZugD1xF/vLPbaTHiYCEkIc=;
 b=VqG7nso6sTMDB5dBIip2RxqnqzAmVGfMAbHhF9DGgkSO14H01s3IIOC9Ah/J3sSaiKH6cKxFiE+4vRZaKNCymEsMhO5o5hKNAYIqbltpUhJ0BuiToCKfsvUotZdjfrdRjAu2jjNFhblMDb+/7/+AdQog007jJJlLlFrj2y79EWE/jeICRsGwJR71PyDpgiWLBNlYOWbKrhr/vk15/dvusWPn+U48XDSyaGHvAq2l2WlmUhTu6ONNXpEAf7j5daIxBvuB8PWCQRb6ldLbtT3FubSXJGsHl+ev9e/a2zF0OmJWCDypwAOX27pcmUdupM+soj3Oby9dwndvaEbzEnSwxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Thu, 21 May
 2026 00:05:06 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::6bec:e86c:e75d:5caa]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::6bec:e86c:e75d:5caa%4]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 00:05:06 +0000
Message-ID: <481652c2-2865-4c89-834b-7d37a8b02de0@intel.com>
Date: Wed, 20 May 2026 17:04:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] drm/xe: batch CT pagefault acks with periodic
 flush
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <francois.dugast@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-12-matthew.brost@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20260226042834.2963245-12-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0264.namprd03.prod.outlook.com
 (2603:10b6:303:b4::29) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|SA1PR11MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cac179-b433-43a2-a464-08deb6cc9c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4143699003|22082099003|18002099003|56012099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: H0HN/T0jxxFnMEVuP4CucScclZd3AhUNKpx+uuZZyTv7dDyqZ2ks8Vp0KW1stVCQC9shFxU8QlU0eetUM3Wq6F0xbsLEb+IzJbLVqt4T+17znlBfuHfGOfj15UB4Ow4KQsEsBZdw1fQq28WwrizOQ/0kjLP+oW+mtzY+XH64JKUfKf3Bj4q3h0X+RYwRDixSgw/3YypeBRzDYQ/yJN9/jIFchtcT37tV45WFgytIFlT4oznaUOPrX6xCEQn7MksBk5HPCOmWkulbIHrjMLdoCRhN+O9aHSjHe0rhGui2DCGABBmse6woxdK50IEyxXN3GtAMQ3273T473PWEgcvcEDHiZyu+EVO3asCe+biT8YEOdi25Vz77BOO7SLRVuWp8LJZS1dS5vm0gKU7CvqMM/mtn8xNu52JzNDqPutviRkmvfUHdzsE/FltIpePpyYpnqUmL39MuRvpEn4qAX6b0FcO/XI2QjUmVeHU1KigdzV2JabZjVQRUt011HY/F0rCBH7UJt7mV5+AAKCVBJV3ugjbSxm+ing1IyWTS1OSjG3EQksaNODTj0OsrZQIrI61N9ssJItZVKB8tV9MumxOBRelAosgLFxw7hlzkV9aboYzp5EmXB6sF30pDQhYieJqqXwHUklNrLIgvZdikXx4xo0LDdFLiaNWlxrktEHCh3kIjKnJBVq6LeCtYOc9G95Kj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(22082099003)(18002099003)(56012099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVBlN1BsVWY3Y0dPS2pORWoyK2hmZG1nRnNkVjNZME02VUVYaVRkaWR6WUVh?=
 =?utf-8?B?aFUxdXdLSlJScENBTmlxSk10akVBRjJxWnMxSFBMVFNtWk9Uem02VHFvTmJ5?=
 =?utf-8?B?WmtNdUo5Z1FyWUcwZndQU3dGdG9zOFdmZFdVakE3ZjlJcGRneHdhandSS2dD?=
 =?utf-8?B?aXkrczhMWExjQmZKazdtUGlIRnRRSm1xb01GWm9kM0EwclJYY0NsWFF2M2Vp?=
 =?utf-8?B?T05BZE5pUEpsWndTY3ZVSmxGY1dXSHF5Rnd0cXFwUnZBcldPMHgzOFhkSmxC?=
 =?utf-8?B?YlZwUkNSbk9jRmhNRjErVUVHZVBOVzdlMDJBNjg5TmZWQ2RvQzdHUUVqcXlj?=
 =?utf-8?B?VnUxQXJuNjEwT1lnb2pNUHlDZjkrSVg5Qy9jTFZHUCtlOWxtaDlNUStvaGRP?=
 =?utf-8?B?a2txcVdiZjl5MXRNY05IbkpRajhHbzhMNWxnYlhaUDhYVUo5dm1BSUIzajQx?=
 =?utf-8?B?ZWdYdW9STGY0SEJ0WnpMRHRwRTdKQnZkMkFzQkgzNXJYYkFISEc2STdEM2tQ?=
 =?utf-8?B?cFdsOEZYTXlyR3ZKbHp3dDB0ZlMzVUV5ajk3NDNTRVFrbS9NWkNqclp3UkRj?=
 =?utf-8?B?TTFKV2Z4R1RoYWNlcHA3RTEwWVl3bDlHTDZ3dG1yb2o4YTZZYmNpdWMxaFVJ?=
 =?utf-8?B?cmI1N3doRFNnbUNwMk5ONGYzUFVlOTFBbkRlTnJIbDl1RXZPcjZwdExJVnFC?=
 =?utf-8?B?eERrQjBjcXRGVVRsckExM2R0YVlUR25TLzd1ZC9BSGJDQ1diTU44MHI0NGpL?=
 =?utf-8?B?SXJoY3dicjBNZklCdkxNc3JGTzczYXFzVTlQb3RuRmZManMxOGhYNHNiTzcr?=
 =?utf-8?B?SnZhZ2NsQUZjdHlEMUpOQ3NVQldqU2U5RUtvOEhqR291eUVXWFM2T2cwQTBt?=
 =?utf-8?B?SGYwRkxQVkIzSnh3ZjVKaW5TR0lSdXh3aldZVFViL1BPdE1IYWtnQjE5N2xV?=
 =?utf-8?B?bkk5SGJsWUNpUTdyTEEySUJjSzNoK0lLWXNYLzRLQ0FrSndlc3BkRmRjU1kv?=
 =?utf-8?B?ZGNFalNwTEV5VHUvMU8yWWFDdFQ2Q1Vib0xEUGNCcUlRN0tXTDFqREM4OXhB?=
 =?utf-8?B?aUtDblRpTGcySWVLbWc4TnltZVNuS0Jwd0FlSG1sUGdWR1RYZUx0dnRqekNj?=
 =?utf-8?B?cmFDT3o4WTNwQ3BBVkFrSjhObSsxTWtCTStMU1NkZjJGTjZTTDJsNXpCdlY2?=
 =?utf-8?B?ZEkwbGlFcS9XMkJsVWsyQlNZdTl1VUFBenZMaDlrdWZrRkVWSzMxbUVtU2t2?=
 =?utf-8?B?SFhLSHFCT2U5YUozNGRUYjF3UGxyNitsQTIrd0JpcVNYald6c2ErSW9QRlQ3?=
 =?utf-8?B?RTY3MUNxWXVHSTdLTi9xZWFZT0lvUzFvUlgwZnJ1a2RINDRBM1pJTFlqdUNy?=
 =?utf-8?B?ZTdXZHZkaUpZc1p3MzJ0UkVYNlZ5S1NYVzdMenI1QVZrTTg4aTFJMi9JbjdW?=
 =?utf-8?B?U3ZxYkdJRG1aZ3VTRWxhcm5rTStHaU15OWl5NGRuZkRtdHJRNUJJR0V3WmRG?=
 =?utf-8?B?a09nelp3bjE5K0kzZ2xpY3NJR2R0Q2VObU1DNy9QZ0R3bTRvRjhITkJzWFR4?=
 =?utf-8?B?K2hKOCtidGpEd3ZKVWlDNnpYc1hHN1dhMEg2SEpqaHYyUTFWUlZIN1NTMytE?=
 =?utf-8?B?b21ic1dBcEJ0UGpiMUtiRUZtUWpPTU5WVFl0Z1BlZW5oWm9IalpwV05XeG1l?=
 =?utf-8?B?bjRwMDd4VU5iQlRkbjZSRUc0Nm8vaWluR3ZjODJabW16Zi83RXVZT2x3SHJs?=
 =?utf-8?B?MkdmV0FvL3FMRUZvblZLdWxrUnVJUFJuRDdERmpYYkplYmFkQVVBYWZ3VlB4?=
 =?utf-8?B?QlNkNXAzQWJGdlFMT3RndUp2bHFFZFcyTDMxRnZjc2g3L0RxYS9pMEZZeFNY?=
 =?utf-8?B?VzRNM0c4LzJSU1BJVkRBT0x5NEJKelJRSjM4ZHJLZTJkd3ZzMC9ySkI1RlhW?=
 =?utf-8?B?c2krTlB4bWZPelR1WngyLzdZMzlRckZEcGhDQ3dNcjNvOE85WXpBbGt5VE92?=
 =?utf-8?B?c0VIdGNxOGpjOUxsUmVEL0hJalplOC9XdHd6VXpQWTZCTDVYU1ZMbXp4bjlI?=
 =?utf-8?B?MkMxMzFDU2xEZlhuK29Tdm1ob0FZb0NpMkY2OXFKK0pXcCs0ZlZQOUwwWXJi?=
 =?utf-8?B?bVFqQlR4bTZ3WHBIY0JZYUY5OUQzb0UzNVpGZjdBdFViajBPZWo3cEpaYy9y?=
 =?utf-8?B?NG5tQnRBdWVxZWNweWMzUzlpV1ZCQmJDYkFhUGgvZjloNnQ2ZlJvQzFqZEt5?=
 =?utf-8?B?YW5YSzN1T25odjBoZ0l1MzNOd0pMWnJLMm01TE14V0xsZ3I1YkQrZ3FHN3Bu?=
 =?utf-8?B?WXllOUE0WmJBVFJUSStzMForTDljQWwwbnF0RnN5NlVGMDBwcGlqQTREVUg0?=
 =?utf-8?Q?UeQCOb4qxu1IKssg=3D?=
X-Exchange-RoutingPolicyChecked: RhkW1G8RnsflZsB01ulElGn4r0OupOoSMF8Scc9yMWorGcbB5yyvuQkmQVx7fT4MMlhABaOU2tICZybBYXkORodPK2Uhx3+XC86EIK9mg5YlPB6JBpL/tnvj8n1Jym+WOTC2+ylUJfzY0dPTU+ei09Nn9ACU0y9zi7Wjf5dxY9aoDGfkPRyFyQ6KeMtLpHQZm3lj/U4zLpu1FWChGfMLkggawRCcMf8bcqQbbyDaX7NzmVWedAGMgWzkAVieroakFbBINFtd5C/a3Ej5GRLtkkf1aivi2bWZU9if0/WTKidcCNX62Song/NPVgkWJAiGxMlCCfPnqq5wbAowpMudxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cac179-b433-43a2-a464-08deb6cc9c7a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 00:05:04.9970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKQwuE7u2VfcSnUCp0O36ST0NRQ1UDv/+u4sJnKNsdJRfWI+1cAA37/CqalYzAtNgfPZggsO2ZRd8jDN9q1i+LFKGe+xyr2zpgNshnqj8DQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
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

Before having human reivew, here is suggestions and comments from Claude:
In addition to the typo and FLUSH_PERIOD matter reported earlier, there 
are additional comments from Claude.

commit 7e5fd6c830f91c066cc16954c2af600f0564df86
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: batch CT pagefault acks with periodic flush

Adds a write-only mode to xe_guc_ct_send_locked() that defers
descriptor publish and doorbell, plus ack_fault_begin/end callbacks so
the pagefault worker can hold ct->lock once and batch a chain of acks
with a periodic flush.

There is a typo in the trailer:

 >     Assistent-by: Chat-GPT # Documentation

"Assistent-by" should be "Assisted-by" (see
Documentation/process/coding-assistants.rst).

 > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c 
b/drivers/gpu/drm/xe/xe_guc_ct.c
 > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
 > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c

[ ... ]

 > @@ -939,7 +939,7 @@ static bool vf_action_can_safely_fail(struct 
xe_device *xe, u32 action)
 >  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header 
and one DW HxG header */
 >
 >  static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 > -		     u32 ct_fence_value, bool want_response)
 > +		     u32 ct_fence_value, bool want_response, bool write_only)
 >  {
 >  	struct xe_device *xe = ct_to_xe(ct);
 >  	struct xe_gt *gt = ct_to_gt(ct);
 > @@ -956,7 +956,6 @@ static int h2g_write(struct xe_guc_ct *ct, const 
u32 *action, u32 len,
 >  	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
 >
 >  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
 > -		u32 desc_tail = desc_read(xe, h2g, tail);
 >  		u32 desc_head = desc_read(xe, h2g, head);
 >  		u32 desc_status;
 >
 > @@ -966,12 +965,6 @@ static int h2g_write(struct xe_guc_ct *ct, const 
u32 *action, u32 len,
 >  			goto corrupted;
 >  		}
 >
 > -		if (tail != desc_tail) {
 > -			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
 > -			xe_gt_err(gt, "CT write: tail was modified %u != %u\n", 
desc_tail, tail);
 > -			goto corrupted;
 > -		}
 > -

The desc_tail mismatch check is removed unconditionally rather than
gated on !write_only. In write_only mode the software tail can
legitimately be ahead of the descriptor tail, so guarding the check
would still preserve coverage on the regular path. Was the intent to
drop this debug invariant for all callers, or only to relax it for
write_only sends?

 > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c 
b/drivers/gpu/drm/xe/xe_guc_pagefault.c
 > --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
 > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
 > @@ -10,6 +10,19 @@
 >  #include "xe_pagefault.h"
 >  #include "xe_pagefault_types.h"
 >
 > +#define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
 > +
 > +static void guc_ack_fault_begin(void *private)
 > +{
 > +	struct xe_guc *guc = private;
 > +
 > +	xe_guc_ct_lock(&guc->ct);
 > +
 > +	/* Ack the 2th, then 18th, etc... */
 > +	guc->pagefault_ack_counter =
 > +		XE_GUC_PAGEFAULT_FLUSH_PERIOD - 2;
 > +}

The comment says "Ack the 2th, then 18th, etc...". Tracing through:

	counter = 16 - 2 = 14
	ack 1: counter++ & 15 = 14 & 15 = 14    -> write_only
	ack 2: counter++ & 15 = 15 & 15 = 15    -> write_only
	ack 3: counter++ & 15 = 16 & 15 = 0     -> flush
	...
	ack 19: counter++ & 15 = 32 & 15 = 0    -> flush

The first flush lands on the 3rd ack and then every 16th after, not
on the 2nd/18th. Should the seed be FLUSH_PERIOD - 1, or should the
comment be updated to describe the actual cadence?

Assisted-by: Claude:claude-opus-4-7

On 2/25/26 8:28 PM, Matthew Brost wrote:
> Pagefault storms can generate long chains of acknowledgments back to the
> GuC. Sending each ack as a full CT submission forces a barrier,
> descriptor update and doorbell per fault.
> 
> Extend xe_guc_ct_send_locked() with a “write-only” mode that copies the
> message into the H2G ring but defers publishing the descriptor and
> ringing the doorbell. Add xe_guc_ct_send_flush() to publish pending
> writes and notify GuC once per batch. Wire this into the pagefault
> producer via new ack_fault_begin/ack_fault_end callbacks and CT lock
> wrappers.
> 
> To avoid excessive flush latency while still amortizing MMIO costs, use
> a simple periodic flush heuristic for GuC pagefault acks: batch most
> acks as write-only and force a publish at a fixed interval (e.g., every
> 16th ack), with a final flush at end-of-batch.
> 
> Also increase the H2G CTB size to 16K to better absorb bursts.
> 
> Assistent-by: Chat-GPT # Documentation
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c          | 94 +++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_guc_ct.h          | 35 ++++++++-
>   drivers/gpu/drm/xe/xe_guc_pagefault.c   | 28 +++++++-
>   drivers/gpu/drm/xe/xe_guc_types.h       |  6 ++
>   drivers/gpu/drm/xe/xe_pagefault.c       | 12 +++-
>   drivers/gpu/drm/xe/xe_pagefault_types.h | 14 ++++
>   6 files changed, 164 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3a262d3af8cf..5a126e19c53e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -255,7 +255,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
>   
>   #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>   #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> -#define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> +#define CTB_H2G_BUFFER_SIZE	(SZ_16K)
>   #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
>   #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
>   #define CTB_G2H_BUFFER_DWORDS	(CTB_G2H_BUFFER_SIZE / sizeof(u32))
> @@ -912,7 +912,7 @@ static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
>   #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>   
>   static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -		     u32 ct_fence_value, bool want_response)
> +		     u32 ct_fence_value, bool want_response, bool write_only)
>   {
>   	struct xe_device *xe = ct_to_xe(ct);
>   	struct xe_gt *gt = ct_to_gt(ct);
> @@ -936,15 +936,8 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	}
>   
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> -		u32 desc_tail = desc_read(xe, h2g, tail);
>   		u32 desc_head = desc_read(xe, h2g, head);
>   
> -		if (tail != desc_tail) {
> -			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
> -			xe_gt_err(gt, "CT write: tail was modified %u != %u\n", desc_tail, tail);
> -			goto corrupted;
> -		}
> -
>   		if (tail > h2g->info.size) {
>   			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>   			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
> @@ -966,7 +959,8 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   			      (h2g->info.size - tail) * sizeof(u32));
>   		h2g_reserve_space(ct, (h2g->info.size - tail));
>   		h2g->info.tail = 0;
> -		desc_write(xe, h2g, tail, h2g->info.tail);
> +		if (!write_only)
> +			desc_write(xe, h2g, tail, h2g->info.tail);
>   
>   		return -EAGAIN;
>   	}
> @@ -997,14 +991,15 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	/* Write H2G ensuring visible before descriptor update */
>   	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
>   	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
> -	xe_device_wmb(xe);
> -
>   	/* Update local copies */
>   	h2g->info.tail = (tail + full_len) % h2g->info.size;
>   	h2g_reserve_space(ct, full_len);
>   
>   	/* Update descriptor */
> -	desc_write(xe, h2g, tail, h2g->info.tail);
> +	if (!write_only) {
> +		xe_device_wmb(xe);
> +		desc_write(xe, h2g, tail, h2g->info.tail);
> +	}
>   
>   	trace_xe_guc_ctb_h2g(xe, gt->info.id, *(action - 1), full_len,
>   			     desc_read(xe, h2g, head), h2g->info.tail);
> @@ -1018,7 +1013,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   
>   static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   				u32 len, u32 g2h_len, u32 num_g2h,
> -				struct g2h_fence *g2h_fence)
> +				struct g2h_fence *g2h_fence, bool write_only)
>   {
>   	struct xe_gt *gt = ct_to_gt(ct);
>   	u16 seqno;
> @@ -1073,7 +1068,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   	if (unlikely(ret))
>   		goto out_unlock;
>   
> -	ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
> +	ret = h2g_write(ct, action, len, seqno, !!g2h_fence, write_only);
>   	if (unlikely(ret)) {
>   		if (ret == -EAGAIN)
>   			goto retry;
> @@ -1081,7 +1076,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   	}
>   
>   	__g2h_reserve_space(ct, g2h_len, num_g2h);
> -	xe_guc_notify(ct_to_guc(ct));
> +	if (!write_only)
> +		xe_guc_notify(ct_to_guc(ct));
>   out_unlock:
>   	if (g2h_len)
>   		spin_unlock_irq(&ct->fast_lock);
> @@ -1157,7 +1153,7 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
>   
>   static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   			      u32 g2h_len, u32 num_g2h,
> -			      struct g2h_fence *g2h_fence)
> +			      struct g2h_fence *g2h_fence, bool write_only)
>   {
>   	struct xe_gt *gt = ct_to_gt(ct);
>   	unsigned int sleep_period_ms = 1;
> @@ -1170,9 +1166,11 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   
>   try_again:
>   	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
> -				   g2h_fence);
> +				   g2h_fence, write_only);
>   
>   	if (unlikely(ret == -EBUSY)) {
> +		if (write_only)
> +			xe_guc_ct_send_flush(ct);
>   		if (!guc_ct_send_wait_for_retry(ct, len, g2h_len, g2h_fence,
>   						&sleep_period_ms, &sleep_total_ms))
>   			goto broken;
> @@ -1196,7 +1194,8 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	xe_gt_assert(ct_to_gt(ct), !g2h_len || !g2h_fence);
>   
>   	mutex_lock(&ct->lock);
> -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
> +	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence,
> +				 false);
>   	mutex_unlock(&ct->lock);
>   
>   	return ret;
> @@ -1214,25 +1213,76 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	return ret;
>   }
>   
> +/**
> + * xe_guc_ct_send_locked() - submit a GuC CT H2G message with CT lock held
> + * @ct: GuC CT object
> + * @action: payload dwords (HxG header dword is expected at @action[-1])
> + * @len: number of payload dwords in @action
> + * @write_only: defer publishing/doorbell for batching
> + *
> + * Sends a single H2G message to the GuC CT buffer while the caller already
> + * holds @ct->lock.
> + *
> + * If @write_only is false, the function completes the submission immediately:
> + * it makes the payload visible to the device, updates the H2G descriptor and
> + * rings the GuC doorbell.
> + *
> + * If @write_only is true, the message payload is copied into the H2G ring and
> + * the software tail is advanced, but the descriptor update and doorbell are
> + * deferred so multiple messages can be batched. In this mode, the caller must
> + * eventually call xe_guc_ct_send_flush() (still holding @ct->lock) to publish
> + * the descriptor and notify the GuC. On internal retry paths (-EBUSY), the
> + * implementation may force a flush to ensure forward progress.
> + *
> + * Return: 0 on success, negative errno on failure.
> + *
> + * Locking:
> + *   Must be called with @ct->lock held.
> + */
>   int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			  u32 g2h_len, u32 num_g2h)
> +			  bool write_only)
>   {
>   	int ret;
>   
> -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, NULL);
> +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, write_only);
>   	if (ret == -EDEADLK)
>   		kick_reset(ct);
>   
>   	return ret;
>   }
>   
> +/**
> + * xe_guc_ct_send_flush() - flush pending GuC CT H2G writes
> + * @ct: GuC CT instance
> + *
> + * Some callers batch multiple H2G writes using xe_guc_ct_send_locked() in
> + * "write-only" mode (i.e., queue the message payloads but defer ringing the
> + * doorbell / updating the CT descriptor). This helper completes the submission
> + * by ensuring the payload writes are visible to the device, updating the H2G
> + * descriptor, and ringing the GuC CT doorbell.
> + *
> + * Locking:
> + *   Must be called with @ct->lock held.
> + */
> +void xe_guc_ct_send_flush(struct xe_guc_ct *ct)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);
> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
> +
> +	lockdep_assert_held(&ct->lock);
> +
> +	xe_device_wmb(xe);
> +	desc_write(xe, h2g, tail, h2g->info.tail);
> +	xe_guc_notify(ct_to_guc(ct));
> +}
> +
>   int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
>   {
>   	int ret;
>   
>   	lockdep_assert_held(&ct->lock);
>   
> -	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL);
> +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, false);
>   	if (ret == -EDEADLK)
>   		kick_reset(ct);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 767365a33dee..2db4dded6b96 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -54,7 +54,7 @@ static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>   int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   		   u32 g2h_len, u32 num_g2h);
>   int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			  u32 g2h_len, u32 num_g2h);
> +			  bool write_only);
>   int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   			u32 *response_buffer);
>   static inline int
> @@ -62,6 +62,7 @@ xe_guc_ct_send_block(struct xe_guc_ct *ct, const u32 *action, u32 len)
>   {
>   	return xe_guc_ct_send_recv(ct, action, len, NULL);
>   }
> +void xe_guc_ct_send_flush(struct xe_guc_ct *ct);
>   
>   /* This is only version of the send CT you can call from a G2H handler */
>   int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action,
> @@ -87,4 +88,36 @@ static inline void xe_guc_ct_wake_waiters(struct xe_guc_ct *ct)
>   	wake_up_all(&ct->wq);
>   }
>   
> +/**
> + * xe_guc_ct_lock() - take the GuC CT mutex
> + * @ct: GuC CT object
> + *
> + * Wrapper around mutex_lock(&ct->lock) for cases where CT operations need to be
> + * performed from contexts that want an explicit "CT locked" pair without
> + * exporting the lock itself.
> + *
> + * Return/Locking:
> + *   Acquires @ct->lock.
> + */
> +static inline void xe_guc_ct_lock(struct xe_guc_ct *ct)
> +__acquires(&ct->lock)
> +{
> +	mutex_lock(&ct->lock);
> +}
> +
> +/**
> + * xe_guc_ct_unlock() - release the GuC CT mutex
> + * @ct: GuC CT object
> + *
> + * Counterpart to xe_guc_ct_lock().
> + *
> + * Locking:
> + *   Releases @ct->lock.
> + */
> +static inline void xe_guc_ct_unlock(struct xe_guc_ct *ct)
> +__releases(&ct->lock)
> +{
> +	mutex_unlock(&ct->lock);
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 2470faf3d5d8..cee653bf463b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -10,6 +10,19 @@
>   #include "xe_pagefault.h"
>   #include "xe_pagefault_types.h"
>   
> +#define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
> +
> +static void guc_ack_fault_begin(void *private)
> +{
> +	struct xe_guc *guc = private;
> +
> +	xe_guc_ct_lock(&guc->ct);
> +
> +	/* Ack the 2th, then 18th, etc... */
> +	guc->pagefault_ack_counter =
> +		XE_GUC_PAGEFAULT_FLUSH_PERIOD - 2;
> +}
> +
>   static void guc_ack_fault(struct xe_pagefault *pf, int err)
>   {
>   	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
> @@ -36,12 +49,25 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>   		FIELD_PREP(PFR_PDATA, pdata),
>   	};
>   	struct xe_guc *guc = pf->producer.private;
> +	bool write_only = guc->pagefault_ack_counter++ &
> +		(XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1);
> +
> +	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
> +			      write_only);
> +}
> +
> +static void guc_ack_fault_end(void *private)
> +{
> +	struct xe_guc *guc = private;
>   
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +	xe_guc_ct_send_flush(&guc->ct);
> +	xe_guc_ct_unlock(&guc->ct);
>   }
>   
>   static const struct xe_pagefault_ops guc_pagefault_ops = {
> +	.ack_fault_begin = guc_ack_fault_begin,
>   	.ack_fault = guc_ack_fault,
> +	.ack_fault_end = guc_ack_fault_end,
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index c7b9642b41ba..2996e5903ccb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -124,6 +124,12 @@ struct xe_guc {
>   	struct xe_reg notify_reg;
>   	/** @params: Control params for fw initialization */
>   	u32 params[GUC_CTL_MAX_DWORDS];
> +
> +	/**
> +	 * @pagefault_ack_counter: Counter to determine when periodically ack
> +	 * pagefaults in a batch.
> +	 */
> +	u32 pagefault_ack_counter;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 2cfda29321c9..d252a8c9d88c 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -425,6 +425,10 @@ static bool xe_pagefault_cache_hit(struct xe_pagefault_queue *pf_queue,
>   			xe_assert(xe, pf_work->cache.pf->consumer.alloc_state ==
>   				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
>   
> +			if (pf->producer.private !=
> +			    pf_work->cache.pf->producer.private)
> +				continue;
> +
>   			xe_gt_stats_incr(pf->gt,
>   					 XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
>   					 1);
> @@ -559,6 +563,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   
>   
>   	while (xe_pagefault_queue_pop(pf_queue, &pf, pf_work->id)) {
> +		const struct xe_pagefault_ops *ops = pf->producer.ops;
> +		void *private = pf->producer.private;
>   		struct xe_gt *gt = pf->gt;
>   		u32 asid = pf->consumer.asid;
>   		int err = 0;
> @@ -599,6 +605,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   			  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
>   		xe_assert(xe, pf == pf_work->cache.pf);
>   
> +		ops->ack_fault_begin(private);
>   		while (pf) {
>   			struct xe_pagefault *next;
>   
> @@ -606,8 +613,10 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   				  XE_PAGEFAULT_ALLOC_STATE_CHAINED ||
>   				  pf->consumer.alloc_state ==
>   				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> +			xe_assert(xe, ops == pf->producer.ops);
> +			xe_assert(xe, gt == pf->gt);
>   
> -			pf->producer.ops->ack_fault(pf, err);
> +			ops->ack_fault(pf, err);
>   
>   			if (pf->consumer.alloc_state ==
>   			    XE_PAGEFAULT_ALLOC_STATE_ACTIVE)
> @@ -635,6 +644,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   				pf = xe_pagefault_queue_requeue(pf_queue, pf,
>   								gt);
>   		}
> +		ops->ack_fault_end(private);
>   
>   		if (time_after(jiffies, threshold)) {
>   			queue_work(xe->usm.pf_wq, w);
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index 57cb292105d7..bc8f582b4e03 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -33,6 +33,13 @@ enum xe_pagefault_type {
>   
>   /** struct xe_pagefault_ops - Xe pagefault ops (producer) */
>   struct xe_pagefault_ops {
> +	/**
> +	 * @ack_fault_begin: Ack fault begin
> +	 * @private: producer private data
> +	 *
> +	 * Page fault producer begins acknowledgment from the consumer.
> +	 */
> +	void (*ack_fault_begin)(void *private);
>   	/**
>   	 * @ack_fault: Ack fault
>   	 * @pf: Page fault
> @@ -42,6 +49,13 @@ struct xe_pagefault_ops {
>   	 * sends the result to the HW/FW interface.
>   	 */
>   	void (*ack_fault)(struct xe_pagefault *pf, int err);
> +	/**
> +	 * @ack_fault_end: Ack fault end
> +	 * @private: producer private data
> +	 *
> +	 * Page fault producer ends acknowledgment from the consumer.
> +	 */
> +	void (*ack_fault_end)(void *private);
>   };
>   
>   /**

