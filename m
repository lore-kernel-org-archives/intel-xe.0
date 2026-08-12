Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C62C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 03:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3C610EE17;
	Wed, 12 Aug 2026 03:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMtLf9nz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A4310EE17
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 03:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786505062; x=1818041062;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zUCQT5VtffcUHGAhRruESsu0bQtR+BD0PJB/mCIAczg=;
 b=dMtLf9nzW1FMR8xKd4Om6yRWUNxUuugtLBZ+kg8A+WxbUB2GdSdVhtpZ
 Uvi2AqWqe4dqnGY/BQchCf8vJd/6eQFG/xfR53NOVQ+IpC9TyEPfjckxQ
 S31rCbPTLuhTNF9r2IIdkxld9KkmShpDqiSYE5Q+4J+8ejrl9HLjrtzJf
 SuBkuXcE6WY6FcqBaXI63lmV4zL6Lfmalyr4q9RF37z0HfhJPVnnQsexA
 7h26DVpUoVzFbfx9+4bpjiBwACrOJ/1YKBNK6L4RPb0wvYnYjaT7I9cer
 wFEEhWT7+HCnd4EmurjAqHzZThAgYUhpbADkW/OAH/eLs5hkNfxUurZql w==;
X-CSE-ConnectionGUID: sFqlvZdITR6eFSqm8jCrFA==
X-CSE-MsgGUID: wLSthSmuRN2ormD1BLTOYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104580514"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="104580514"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 20:24:22 -0700
X-CSE-ConnectionGUID: cjenr08fS5WcPoPSZ5T7Ag==
X-CSE-MsgGUID: mswdFlEwTtSdg2/zZBqMCg==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="263557138"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 20:24:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 20:24:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 20:24:21 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 20:24:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAA8fIn1u9zFxa+atTGuaYdVNkahmaR42hW94l/l3kE+ivTezrrEjY3VJAFG6BVp12JdxZCdixumEkJn6kr2y4zIcnEZv/i5oT2GkQzmpOBMTu/vWcdl6CnUyS4AgRYsYzTqCWxkrkz4kDv8ztebAI6MIvCKA7gkZqVpBVemcwWJRDZTAIoYNOrLfzdYTqeG93TcMiVAZYg868ukOj6AJ2nIoh35V1ynB9MMh1T85FByG1vEnZV6uDT9SJy3dKPHlRWRZs+WUrpzpCDYjqMaYgYKWZ7SW5+BuA14S8OB6ZXLK/LP/2muZEPf0jk9C/btN3MKcIMHw5lVuHyxjXuQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c++U+ACh8OSuxtzpJicRNLBbYr/g7EwgYFzQHEx3ZU0=;
 b=lBErfHrZOkwC4d3DQv0lRzWeWaeR7mZCgfWP92w1Xatv2GrKWRDIfwAYM0GSValfkTAHxzrRFSWOYVbr/4JvZOgO2kVPgIVT8vJjPa/02nEA0PbELTWU+bDTMhGvFomIUJrYcPwiYjdigf5jG3/gXBhWeq3o9Lowsbjmyb6zxHpsp3PjI4tCHXLbj5QJB3s7Nu+eNaIvjWl85hIdJItJG30vnJe1s1iu7kmVBO5zRsoZLYcnsrHDgJxHIKuPsB4/s6jXLtJLOaUbPcwzww4DsS3kXbLqxBS8cMgYS2tWMpi1icW//p+eU9G8zyIyhHDmKkHuyxcNQKwhTEtSgOvtXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS7PR11MB6103.namprd11.prod.outlook.com
 (2603:10b6:8:84::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 03:24:19 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0270.017; Wed, 12 Aug 2026
 03:24:18 +0000
Message-ID: <cfbbf77f-27d0-4489-984c-5a509ad85cbc@intel.com>
Date: Wed, 12 Aug 2026 08:54:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V15 06/14] drm/xe: Guard teardown paths against purged BOs
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
 <20260811124016.3614699-22-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260811124016.3614699-22-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS7PR11MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8756f9-2fa8-4e69-6c25-08def82131a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2VG0ArIKrtS4Q0i5M4D8j3yb8xvUQL4QJxvb90Acj2f8C2dk8tyKNgCh1atXMeGbAuh1TrCbLHijIUaeiSHwFZKnvHVwk48CDk0ZtN/7Gj5SyL50CKjXr/AH4t8q6kX8l1oGq4Xvx3asq4IpPTIKIr+ht0ygChlRKWpe308Xm0XQREYUCdx2Vdv+75G5GxFd6gkvkYEeukPjr4tpMJYQjM64dqKkNpQfirIOmcERlU9XuU2wGoTMYuPGnD8+ugP5iUbfRXyND+rGMoUv4I4uX1t72khzxpoCKDC53E/LmhK22kKE3qkC0UhsyWq+phAqQSLkmoTITSa2CeBNQlsRTvH1Rqiq4vHtj67vi2obpj5Q02g4njmwdmE8DMhWVxAygZjfnylf6P5ieGdCqleIEu3DszqJcj/HqcCtbvoZABoEU+kuXdX8bavGPK2Y0xOIki2bNKQ06CxZAQkz5TWv7tOzCftWTxdB/SP4dmtP/AyUQzAZrKPR3PPBDpeJvRRehKTsq5m5t9P96JLfTcf3QXo0kcdn6l/9wZHOSsZxzSwgDXERomUTdyLv36fCXFawHLPdXIm1cmEjkQO5hcfHx9OxUsJWU6Z0jnyfwRRrrM92v+WEVNuoh7kOc5d8Jbof2czeBJJL+cSd2CVEy3pf8BtDHvZvj7le9rQVq8sPl2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE1LekdHSWVUVnpkRmUxa3Zrb0kxczVJQ1p6QUIzVHFhaWZNNHpkTUZEZk1J?=
 =?utf-8?B?RkFuOVNGekE2NUk1RWppT09FdnRIdTNvL0ZLbTB4bVREa0dUQW5Na3c4dW9M?=
 =?utf-8?B?VTkvamZWWm4yU3RwQ0VmTnlQaDFqelllMTlOajIrSWo5cHh4UFRJL0hRQ0J4?=
 =?utf-8?B?SGVxTTBGLzJTZUlMM3MwMWV1OVgya1hHclE0cG9IODRJN3FZQ1FjeTNZTHVa?=
 =?utf-8?B?UUdIaVpsQjVwTEg1MjNJWVhhVi9pMzdkcXhFdGZJVHBRRVdyS0ttZS9WRlc1?=
 =?utf-8?B?QVMxdVpLdlQ5Qy8yMEkxWU10NGhKSHVzdnROam53Q1VDV2VGeklibjBOMkh4?=
 =?utf-8?B?K0V0QVlUYjR0cTgvdkdrQ0lvODI2MW9OT1l5R0pxc2ZSVU9pQ1BYMnJNcXE4?=
 =?utf-8?B?TDdyOWZzUHgvTDA5WUd4U1pBZkNlY21zaVdXa1Z3Y3pMa2JOazVHV2VsZFMz?=
 =?utf-8?B?bU5FU1RwdEFuM2o2VzVXbmxiRjRGbjRQdkhxNCsrOUhkaGJIN0FxelVDaGhp?=
 =?utf-8?B?YVhVNXNGNHYvbnVPYlpsYncrKzVBN3BWREdBQ01pdTNGQk5uVkxhTmVrd3dx?=
 =?utf-8?B?N0RRbHBjOEpqY20vWTdSK1JzMTZLaVY3eS9UU0xPdHdwUG1lYTgwWWxDK01i?=
 =?utf-8?B?RXFsNUdIbVQvSURuSWRFOEtnQ3ZMKzFVZXVBRWdsemhDVGc5eHovV1lWOVA2?=
 =?utf-8?B?QVJ0UE1ENmlSNHhKOXdsSTVXWGJPbFlxbStZWE1SVmxFc3BUMkpMV25qNTlR?=
 =?utf-8?B?bmljVVJMM1Y3RWJFdi9qNytCeUI3dU1Db2x0VFhsUE9PWHpvS0RqcVFzaHNx?=
 =?utf-8?B?RTR6MEU0c01yNi8vM0FPUENkZW9WdGE1YkVxcFJXb1p4cHk2VDMwOWNOelZt?=
 =?utf-8?B?anNycm5qaXFDQTY3MWJJRjNZTFBFU2laTXZCQURaVTBDUDlPRkU3OXlNakpP?=
 =?utf-8?B?bjgzSGI1RzFXR2FQbU9PMVNTS1ZQRTVIbVcxdjBLYjdRQVdocEdpOWd4UnNi?=
 =?utf-8?B?U0RkWThIRmFiOTg5d0JnRk41b1VmQlJ3Ukd5V3BNVXVmdDJWV215czM3NXF1?=
 =?utf-8?B?ME9zdVNWL0lkeklKRUJjN0hFZG1XeFgweGtxc01tSGNLdkpSa1R1bHlFZ1Ar?=
 =?utf-8?B?eC9QS2F4MzNGcFdqdzZ3cHREOU9tRHJwQzg2R2hsMm1aWXRFY0pQUm9Hb0pO?=
 =?utf-8?B?dUtyOWRvbFE1UjRTWnVnSHY0UElyV0RaalYxc1lTcnVWTDFWSkJLTit0WnV1?=
 =?utf-8?B?N0gvY3RJQUt5b1d4d2xmREIyT2lrYXZFZ2RXVFN0Si9TNXcvQUJFNzNUbXRI?=
 =?utf-8?B?cHI2K3QzUHJaV3hrTmdrQ1Q2SzVFc0NLMmllZVR1WXhBTWFHRmszOFlLczZs?=
 =?utf-8?B?Z2xrVTJReGJMWStJREVqd3BlZHVONjlnaUtPeVFEYU96eDdtVE1ZQmxRMFZE?=
 =?utf-8?B?c01vWWUwdytkMzZ0Z1dBZGFFam16cm1mbWZTRVhSUTNCcGJtSHhBV005YzZ3?=
 =?utf-8?B?WUpOdVp4a1k0MStVTHdoWGJFa0ZZSlVwaTl4RGxYNFl5RkNENkZPdUNKVjFr?=
 =?utf-8?B?cXhVNUFPd2pscFg4NDhBcUtyWVBkbUh4MUlsWFYwd2RpeG9MR0VKWU5HS2Fh?=
 =?utf-8?B?NlZoanBjUWtSNERDaXhLY05qdTJrSHpCZk13dlVTdE81cnRlOTM0T2kwTHRE?=
 =?utf-8?B?UWladWRGanN1TUs5NkRaTG5QeHVSWitiTm5wMTVSVDlOclVrL3dna3FpMitp?=
 =?utf-8?B?TGtkTEZTcmxmMlB6aDNrdTVTQ0JLTHBEZmhmVmpFN1ZUdHBGRDFXT29lYmVD?=
 =?utf-8?B?Zm1GQkdHaHd3UURCN2dlOUtZS282OWM3YmRta282Nkttb09MOVRwWUVqNWhZ?=
 =?utf-8?B?cnlnZU1VRzM2NzYzMW5MNXEzNnc0eHJBV2x3akM3NEwyQXRpOFczODdaSDc2?=
 =?utf-8?B?NnBIby9QQmNYRXREeTJoRldqSzdQalJrWVVEa3NvWTRZWmV4TFEybTFaY3Fk?=
 =?utf-8?B?ZzBITnR5T1Byd0ZHaDcvRGZvckNqQUZJRXgvVlllMGp5QXlHWGFrWjJNT2VF?=
 =?utf-8?B?OEh2bmVMT01TQWRoOHh3RGdhZk9sY1FpWmJ3REpOMEVzdkVCMlBJT21HSFZL?=
 =?utf-8?B?bFVGWksyUXg1UkZGMlZaNmpZSldCMFhCN2lCRXJvTE56dWtVVi9tbDEvYTJa?=
 =?utf-8?B?SE1oODgvRVMvVHJ4L2RWTVpFRHpEQ2lZMVRvWVQxYUtycU5lYnY1ZkxLSEFG?=
 =?utf-8?B?WTZsWTg2NEU3ZWpmQmlENWpIc1dMS1ZSWnMvTkF3dkFIVmcxZkg4UlV2VWNw?=
 =?utf-8?B?V1h0MG1tZFNMT2hqRnpta0FtdVF3SmQySmRjYWpwUGFJa1g0ejMzZ2JWLzND?=
 =?utf-8?Q?YUxUr7CN5GR1pT2s=3D?=
X-Exchange-RoutingPolicyChecked: oLJpBpEHwx2TOqEH4Vns2GJWHKK7/SQcKPkZfVsSP+R3dbZRYnpxEh11oL5mZEokQkhgwPRcfNXta1VUbx4RNOhfyzteFSDsj/6InOcQD7Wj+ozcZlMeTI5R0xjrgN/woaQOlgU/utuGFvK6IXf98ydqCpCYV9NNlfaAypDyD9/ymHq3/iLLmHldKVN4E2RYaRPsXtBHuFS/vuzoCj3JVzegOJ93L8VnNqhIf9BguAr5/7GMSDkfyIE3QhDX3R4pCDQi9xKT44KyA35lsvx1ul6uTfpszzGu7KZDycQPKQplqCRfm6McWDCVv3lhT1E4nKW7Qy+sO56+LEyL3bon3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8756f9-2fa8-4e69-6c25-08def82131a8
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 03:24:18.8432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6c03MOHRSrmvamHuZn40eQDPKuTtQnUqqgsw/ZgHc/6V+pYcPVdP9BW8jQnjWsL9LNbVOqBQ5UouNamfYtxhqXD2o6KrI3kCt5NwUkw0/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6103
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



On 11-08-2026 18:10, Tejas Upadhyay wrote:
> VRAM page offlining can purge BOs that are still referenced by page
> tables, exec queues, and DMA-buf exports. Add xe_bo_is_purged()
> guards in the teardown paths to prevent unpinning or mapping an
> already-purged BO:
> 
> - xe_bo_unpin_map_no_vm(): skip unpin if purged
> - xe_dma_buf_map(): return -ENOENT early if purged
> - xe_exec_queue_update_run_ticks(): skip LRC timestamp read if purged
> - xe_pt_destroy(): skip unpin if purged
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.h         | 3 ++-
>   drivers/gpu/drm/xe/xe_dma_buf.c    | 3 +++
>   drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++--
>   drivers/gpu/drm/xe/xe_pt.c         | 3 ++-
>   4 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index eede678ad303..dfcd0e57073b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -364,7 +364,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>   {
>   	if (likely(bo)) {
>   		xe_bo_lock(bo, false);
> -		xe_bo_unpin(bo);
> +		if (!xe_bo_is_purged(bo))
> +			xe_bo_unpin(bo);
>   		xe_bo_unlock(bo);
>   
>   		xe_bo_put(bo);
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index bf0728838ead..5d9f1cd24b7f 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -104,6 +104,9 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
>   	struct sg_table *sgt;
>   	int r = 0;
>   
> +	if (xe_bo_is_purged(bo))
> +		return ERR_PTR(-ENOENT);
> +
>   	if (!attach->peer2peer && !xe_bo_can_migrate(bo, XE_PL_TT))
>   		return ERR_PTR(-EOPNOTSUPP);
>   
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index d6c7f346f49b..5432710c1cfb 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1575,8 +1575,12 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>   	 * errors.
>   	 */
>   	lrc = q->lrc[0];
> -	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> -	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
> +	xe_bo_lock(lrc->bo, false);
> +	if (!xe_bo_is_purged(lrc->bo)) {
> +		new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> +		q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
> +	}
> +	xe_bo_unlock(lrc->bo);
>   
>   	drm_dev_exit(idx);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5d990c1c3740..dbf1aa26a21b 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -212,7 +212,8 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
>   		return;
>   
>   	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));

no dma_resv lock ?

> -	xe_bo_unpin(pt->bo);
> +	if (!xe_bo_is_purged(pt->bo))
> +		xe_bo_unpin(pt->bo);

>   	xe_bo_put_deferred(pt->bo, deferred);
>   
>   	if (pt->level > 0 && pt->num_live) {

