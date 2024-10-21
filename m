Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A14D17129
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 19:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFAF10E2DA;
	Mon, 21 Oct 2024 19:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7YcNe7a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C774910E2DA
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 19:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729538062; x=1761074062;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3PGdBeWiEUbcZ7xlGQr6XYob/s86MxraoepZaybR7S8=;
 b=I7YcNe7a09Z22WQF8rdzk//fMB0vuQI6itWAsdsE8h9RA2R2WVFcOPJs
 wl1EjIpu3zDcl5dVQ8OJ5NdSdJy/Cm2OOKfPLQXW+NX3oMPFbWQp45Zkv
 /PBzqrQkSDBX2PIXk8ZcKVXLk5vjL7atsCSIg8SSBTvueQ+MzgOxMw7MM
 2doiKa+X6ChGKujjZHUhGNCm47polpEIfB654Dx3PbHnv1MIkeFGkgsej
 EZ5al7fbGR7FC0IIU3Ttmqwa4QP/w083IPUG1yd25PxqZaAeUogbSo7Ip
 FBc8L5R45d4HoYFwxr044K+/DdTKxsvDPZuQrjsj0y1SwxB1tQbe3L01E g==;
X-CSE-ConnectionGUID: bsNwdAI4QnuvgalkpGxD8g==
X-CSE-MsgGUID: Mw/GkmoNQ6O+nVHDb4SrZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40161860"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40161860"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 12:14:21 -0700
X-CSE-ConnectionGUID: davoxLVoQLG8qcyFJaCsWw==
X-CSE-MsgGUID: AXeqTnk7SOKIidZL+ntXow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79700868"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 12:14:21 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 12:14:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 12:14:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 12:14:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3ZTkNmRhP76doSOFFxJ6Renmlx/bx6dM34U2eH4RMuo/c2rz0VWrtT213QMY1TOVJYaX+/yB5XE1Kv/yU6mSXf3g8Xugd7q7crzB3uWoiNOej/LO+pBTJeB5+DJCP6oHOTEMaQAwBg+8DSLa6cgXohvh8E9Z8IqUWm4b8ObwuIMnWHEeHeqi97e19LOvngZ0reo8pd9vMGZOLWKlhsfGJ05suwt78maSA0Fxuns/T+Lr+Sn6uPCOrKakFZ4K5ybIbGFYD/j8C22mfxHTzO3aw53oINduPZ0XXzKK0wd+UOTQAkbA+f/yRltVirDRhEpWCg5NQRzBYRhemHTdbLVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5ia1RZNv7gY4/sxkOykYq3LfjWX8dN3WKwEIM2oUQM=;
 b=Rg72/449ftCXFsUlHRwGTUXdnrn2QyDjg+dWfZQB5BqX3yIZ5xqc9HZeWEIQGfmDthCAhkiIoaSHvxEVbvBWjRpmrv5+kigaHMyWokYyXAL8ha/rae/XOb5B306KlACKMfAJOfeX7PGPSWqpIVqVJ6IRqLapijsRDGBD/DiA88TUDcyTWuh522njWfT4yMvXU0V4SHfaYP6S0SQRfR4DmkOEKWxeEVOLzZMD536EKyt/AFzcy2llQ/0gyvHG8YH1KXZneC4yU/ENrvakctyvONCHHUKVXoQpSmleemTHENENbfFKNGMiR0h0u2ZZsA2oeGZzVGzyEP2LT/2Wzsmkqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH8PR11MB7046.namprd11.prod.outlook.com (2603:10b6:510:216::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 19:14:14 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 19:14:14 +0000
Message-ID: <cd1e26ea-dba4-49fa-9314-30b82c9f6fda@intel.com>
Date: Mon, 21 Oct 2024 15:14:11 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=3A_Pr?=
 =?UTF-8?Q?event_GuC_register_capture_running_on_VF_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20241018224325.130754-1-zhanjun.dong@intel.com>
 <172936125064.1302338.1158493984412481659@2413ebb6fbb6>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <172936125064.1302338.1158493984412481659@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::21) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH8PR11MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e28da96-7ef2-4b8f-aaf3-08dcf2048d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUN0Z29teWlZZUZyZHhTV2lpN0R1U2JabmJwMUJhVHNwRG9lTWVxa2ZaUDB1?=
 =?utf-8?B?cUJ3R2Qrb0FTeGpjMk9Rc1FVcTh1eVF1clg3c2hneGFnUGtyNkdEZjZVNjJy?=
 =?utf-8?B?RnVraWRRNzJJdnZEV3JCVWFnZjJjbEp0enRiMHFEZExYdzkvUXBzKzB2YmlL?=
 =?utf-8?B?YWZLcTI0UUNMYk0yWGt3Y1orS3lVdVhCMEFSVWhSU0JSVmZ2R1JIdmY4dDh0?=
 =?utf-8?B?RWx4MHUrcnhyRnQxMFh1cmx1bmErQzFQYk9TbHBkaFIvMithS0Z4Y0s3MkZl?=
 =?utf-8?B?R2NTSndob1E2RDBzRjgwMnNJMmNvaDk1NFcyMGcxeUNWVVZuL1JIaHEwSUht?=
 =?utf-8?B?U3RvK1E0K2hPYmVBY3VYTGVXZ1NCNEtNVFpDcllsMDhuOEFwMzBxWlgrNys5?=
 =?utf-8?B?bXBtUW9MSThRWmdjaVl4ejRUV2lwS2lLUjZwR3N0VmIrVjNleFVWN2xiWCta?=
 =?utf-8?B?ZytReUp2UXBJRDN0Z2daTktmRjNVbDEwdCtUTWUvSnRVSG5yVkRmN0FIZTNL?=
 =?utf-8?B?aFRPK0IvT0hjQkdQOFg1OE5hMjhlSjA4dVA3V1c2QkRPaUc0TCszZjd5UWJo?=
 =?utf-8?B?RWkvSUIrUDhqemdML3lwbzF1YThBWW5zZ0VIYTEvSWhzRVVTbkFkM21ZTWpE?=
 =?utf-8?B?NlpEcmp5WW9QY2dmbVhhZUs2R1VwMDJiV3J1aFpqeHpTclhqN3VBUkQrdGtU?=
 =?utf-8?B?WC9uU1RrSGdlenRYZWV6bXF0a2hUeFR1TTMwQmpFRlJnT3RZZVA4K0hIODJV?=
 =?utf-8?B?ZVV6dkhlazg5dEwrZ0dWQVkzcGlHYUVSVTRtZ2dHeHlyTzdRelE0eHRPa1VO?=
 =?utf-8?B?ZDJkYnEzZ29HcXBVNWVBa3R2Y1dmL2k1dkVwR3k4cDBpTU13SDRLRndKaGRD?=
 =?utf-8?B?bzJQMWxwNzVVRjhBYVhkWHdsNFpGVWp1K3lZbGdOcURkL2lqUEVsUnlCVkt1?=
 =?utf-8?B?RHljVVRGMWJ3aHBWdWxlaTRNc3gvUFIveFdGempCWFhpMGlkK0VsVEp4NkVN?=
 =?utf-8?B?UE52MjQwa25vRXplMndtRGJKbXdWdldORzVuYjdISCtMd2U1ZTU5NExXMnRQ?=
 =?utf-8?B?U05jeWpSeVl6YlB0Q2htaUtaVXhmNDV3OFRJbnZDSTNIc0FMa1BlOHcvTjlO?=
 =?utf-8?B?aUVBYWRaZ0hiL1N3UHlLWlBGbEt4b0xJUEJrZDdnbmZnMnFoakxrd0ZNQTFU?=
 =?utf-8?B?WUxlK2FKVzR2SjJrVnBBQWNocVlNK0FkT3A0UXkzbDlTTTQxeFczVUVHc2F0?=
 =?utf-8?B?TnllZ2Nzd2daOFdRSlJOYjdWd2h1aTZTRk9RUHVON1FWOXgzamREVnlJbFpl?=
 =?utf-8?B?NDJOenozbVJxYVNLaXZsVldUaDhWY2c5dG15NWJ0MkNHaHR0MXpBRE1tN1JW?=
 =?utf-8?B?azU2L1p1bXoyenQzeFJBMm5GQkdKNm9GN3FhbnBDdzkwSi91dHZIRGYyaWZL?=
 =?utf-8?B?QkJyVHlSWDlsWVBVTDlxS1IzdW5Za2xCbWo3b0wybzg5RmlUVEI4ZmtGOGtq?=
 =?utf-8?B?aVZUdEtJd3g4SENNVnU0SWV4SDZGc2JuZVpXWmVobmh0S0xEQW9OMjUzdTVi?=
 =?utf-8?B?b3l5MXE5VTc1bnU1enVEa1FldDAxYlVhM292eERDK3FlMVg4ZmR1aXpVYmhY?=
 =?utf-8?B?c25YM1F3RGJvL2x5OCtwTjlSTHBxZElvdFV5eTF4Y1orK0UvMFhVek41RGJi?=
 =?utf-8?B?WlRqZkRiWXVHbXkyeU1EdFJpSlRFZE9vckdaa1RxN1ZJaWZoeThwQU5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0dTUThEenVEc2FvOHFLblN3bjdqcFRoNUNTeVNCVVJCdjMweVRDYnZYcEc3?=
 =?utf-8?B?RFpBeEhqQWpodnhyQ3E5REp6REUxTnBGcnJ4dzJMaDZuY2FGdFQ5SnRqT0ZT?=
 =?utf-8?B?Ryt3K28yMkxoSXpOR2wxZmQ3Q0p2R2JMeHorNHErQ2lTY1d4Z09LSkgzNG5l?=
 =?utf-8?B?ejM1U3lTblF1TFo4QUxpZnk3b0E4R2VFbkRNR2MxUStrNHBOSC9UMnpZbVJS?=
 =?utf-8?B?QUh3eS91TDdERXI2OThoVUtyWllpdmV5OUlrd3grVmNvbnB3bGswZithQ0k4?=
 =?utf-8?B?ZkdqZVVIalhpVFRkMG12YlpoaTlKRGVmeEhQNFJmckl4ckxsV0U3SXFCc0ZU?=
 =?utf-8?B?Zks2RU44a3U4a2NJamZSd2Z2MG5ML0hRK1A5R3Vjcm1CQTJla2RxZXRnUXVJ?=
 =?utf-8?B?ZjBYZzJrTWxQU04ya2RjY29BSXV5N2g3Uldabk1Cenhrand4TDBQb2szbU94?=
 =?utf-8?B?SnNHNzNhN2ZxeUxvMHlTZTV1R3dqK1F2UFJ2Yk1pM1poa3NEdkRBZ3pTWGFX?=
 =?utf-8?B?SmJNbkh5MVQ1bEtlOWdqbUY4SDJKaGxKdytXWVBydCtBQUVwQXVkMVBkTUZt?=
 =?utf-8?B?OFN0MkVySGpMSmVvd0Rya2J0cVNQYkMybDU3Vy9BQnhBZzhCaDI3U3VFcWs2?=
 =?utf-8?B?djJad090ZGlDeFhtdE1UcTI5THU1UU9JS2RTR1I2THpRY3hQTjFtaXZZdVFu?=
 =?utf-8?B?L29DQ1lDOHRSbzA2b1RzZVVCL3RYd2t3WEtNNmc0RzgxWUtGZkVDK01PcURk?=
 =?utf-8?B?WEJoM21KbGdBSFRiUG1KRjJGQnRVZnU1UU5qL2MrUDZ5bnRxaVIwd3U3TXVk?=
 =?utf-8?B?T3NuK1Z3bFpSR0NTK1dNVkdQSVRVeDZLV1A5WFFGYXBVMVZmV00zK2hvZWNX?=
 =?utf-8?B?eXYwVXExbmNEZEc3L1R1NDNqOFloY1lQRFU2SUVmYWQwMy9tU0xmSkxCblA5?=
 =?utf-8?B?b0cvSkJTS1liYWEyYi9BdXRscUNlVzlybjhrNUdxZDEyVDRkZEo0ZlZSM0Fm?=
 =?utf-8?B?aFBGRjlja0l1Y3ltZisrUkowVDhOdzdoMU13ZEg4Sk9POW12SFVoZlpWWXlU?=
 =?utf-8?B?ZCsrMFpJdnI2eUYyaWNIc08yZ3d2dlAvS3dyOVBNVlEzOEhhamRBcFVzSGNR?=
 =?utf-8?B?a3YvTVFncUY4azE1TUVjZWUwRjc0Z1VpSkxCaUYrRDdRazZlSGlKL3JtckpX?=
 =?utf-8?B?cHRDSHEra3UyZ1pEU3JlNkZtTDJZYjB2SkFqSE5seVpkTjVXTnJzV0NhdWpD?=
 =?utf-8?B?ajdQTlN0QXowN090RGxoRk9aMEJSeW1FZ2VRNGt3NDY0aExqVE4xeXhWTG9o?=
 =?utf-8?B?MldFT0ZnemdIWmNXTU9HVXpCSlhNZkZiK0NRVlNkZjhaa0cxZDlzOUVwaWF5?=
 =?utf-8?B?RUVNRUsybjliMG9lRktpcHFmZzQ0S0dRL0w2aEFiTFpWV1dCaXowc0xIVm1F?=
 =?utf-8?B?ZElCQ1NiS0hiUlVaSkxlNThVLzUrRi90bkFIKzJwTXpUTUxRVk9wc3AxZ1hv?=
 =?utf-8?B?SUlPNFNNMHNxaWFGT2FNRlhnaDFWb1Vvc1BlaEtGbURmdVNXYXBZc29MQ0h3?=
 =?utf-8?B?RU9rN2NmMThSejM3UnFISDdqcTdEdWRIeEFvalNmeVMvNmhVVHFpMFBuRFJI?=
 =?utf-8?B?eDZoTDBwVk5DTU80TjlEckJFSCtENXY1Nzhzam4xbDZWRUFKSllpaGJ5QTBC?=
 =?utf-8?B?RjVtMFdBTzlibDlIcXNXZzhlWHB2ZEs5KzdBOFptTlp1TmtMU1RVNGFwamNr?=
 =?utf-8?B?blZCS0FSMkEwa2lnQnBQSG96N3ZpMG4yYmdhS0J4VWgvNXkrWklBajU4c0tk?=
 =?utf-8?B?cFFNMzRFQzVoendhaVg3YUZISkMzc1oyaHV2UGdpOThkWnR0KzMyREgxbkpo?=
 =?utf-8?B?V1VNT0lKVitmamx3cTlBRWk2aE5KdXVvb1lVdUNHRkhzUjFBVjhpcTdHWURy?=
 =?utf-8?B?RFFJU2tBVi9mTHpNQVc2OWJka1p0cEM0anNHcFM0OUhQT0ROV0FUMm5ZK0xQ?=
 =?utf-8?B?bmFZcTBEdXZZMG9EMnpTM0hKR253VjZZdXRvMTIwbnBsOTU5TzczTWRHQVpK?=
 =?utf-8?B?VUh6QjcwTWhpMzZFVUd3K3hicDFkYmhtQit3SDExemNUZGludFJ5bG9ISXM5?=
 =?utf-8?Q?JoU/tF6qQD5CX98e+ypMtlipE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e28da96-7ef2-4b8f-aaf3-08dcf2048d5b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 19:14:14.7176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZlt7ToGOFb4Mfo3Kfnvf0p9mU6B8fa/CmvLR0BLvXQuJ7Q1UoJEjDZ4eU59hhdQZpj2/WcREZ9Y7+84uM4jKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7046
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

All failures is not related to this patch.

Regards,
Zhanjun Dong

On 2024-10-19 2:07 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Prevent GuC register capture running on VF (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/140208/ 
> <https://patchwork.freedesktop.org/series/140208/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403_full ->
>   xe-pw-140208v2_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-140208v2_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-140208v2_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> xe-pw-140208v2_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html>
>   *
> 
>     igt@kms_lease@lease-invalid-crtc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-433/igt@kms_lease@lease-invalid-crtc.html> +25 other tests skip
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms@plane-59:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html> +2 other tests dmesg-warn
>   *
> 
>     igt@xe_pm@s3-mocs:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-432/igt@xe_pm@s3-mocs.html>
> 
> 
>         Warnings
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@xe_pm@d3hot-multiple-execs:
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-bmg-2/igt@xe_pm@d3hot-multiple-execs.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-bmg-5/igt@xe_pm@d3hot-multiple-execs.html>
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-140208v2_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@core_hotunplug@hotreplug-lateclose:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-4/igt@core_hotunplug@hotreplug-lateclose.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel XE#623 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-180:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +7 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html> (Intel XE#829 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/829>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-1920x1080p:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +2 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +27 other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +6 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests skip
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@kms_content_protection@legacy.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_edge_walk@128x128-top-bottom:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-top-bottom.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-7/igt@kms_cursor_edge_walk@128x128-top-bottom.html> (Intel XE#2577 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577>) +1 other test fail
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +6 other tests fail
>   *
> 
>     igt@kms_flip@blocking-wf_vblank:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +6 other tests fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +15 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +16 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +1 other test timeout
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-suspend.html> (Intel XE#2625 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html> (Intel XE#783 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/783>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-suspend:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-suspend.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html> (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +5 other tests skip
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html> (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html> (Intel XE#2042 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042>)
>   *
> 
>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +6 other tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@kms_psr2_su@page_flip-p010.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-render.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +6 other tests skip
>   *
> 
>     igt@kms_psr@psr-primary-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@kms_psr@psr-primary-blt.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1 other test skip
>   *
> 
>     igt@kms_psr@psr2-cursor-blt@edp-1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-7/igt@kms_psr@psr2-cursor-blt@edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-4/igt@kms_psr@psr2-cursor-blt@edp-1.html> (Intel XE#2948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) +1 other test fail
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (Intel XE#2939 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>   *
> 
>     igt@kms_vrr@cmrr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@kms_vrr@cmrr.html> (Intel XE#2168 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>   *
> 
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel XE#2159 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159>) +1 other test fail
>   *
> 
>     igt@xe_compute_preempt@compute-preempt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html> (Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@xe_eudebug@basic-close:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@xe_eudebug@basic-close.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>   *
> 
>     igt@xe_eudebug_online@resume-dss:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@xe_eudebug_online@resume-dss.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +7 other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test skip
>   *
> 
>     igt@xe_exec_fault_mode@many-basic-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@xe_exec_fault_mode@many-basic-prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +16 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +3 other tests skip
>   *
> 
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html> (Intel XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>   *
> 
>     igt@xe_module_load@reload-no-display:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-433/igt@xe_module_load@reload-no-display.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204> / Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>   *
> 
>     igt@xe_oa@privileged-forked-access-vaddr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-463/igt@xe_oa@privileged-forked-access-vaddr.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +3 other tests skip
>   *
> 
>     igt@xe_pat@display-vs-wb-transient:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html> (Intel XE#1337 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>)
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>   *
> 
>     igt@xe_pm@s4-mocs:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-2/igt@xe_pm@s4-mocs.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-9/igt@xe_pm@s4-mocs.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm_residency@idle-residency-on-exec:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-464/igt@xe_pm_residency@idle-residency-on-exec.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-434/igt@xe_pm_residency@idle-residency-on-exec.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test incomplete
>   *
> 
>     igt@xe_query@multigpu-query-engines:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-435/igt@xe_query@multigpu-query-engines.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_tlb@basic-tlb:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-433/igt@xe_tlb@basic-tlb.html> (Intel XE#2922 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>   *
> 
>     igt@kms_cursor_edge_walk@128x128-top-edge:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-1/igt@kms_cursor_edge_walk@128x128-top-edge.html> (Intel XE#2577 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-6/igt@kms_cursor_edge_walk@128x128-top-edge.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html> +8 other tests pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend:
> 
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html> (Intel XE#2625 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html>
>   *
> 
>     igt@kms_flip@basic-flip-vs-wf_vblank:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank.html> (Intel XE#3098 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank.html>
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html> +4 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o {shard-bmg}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html>
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
> 
>       o {shard-bmg}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html> (Intel XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597> / Intel XE#2635 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html>
>   *
> 
>     igt@kms_invalid_mode@uint-max-clock@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-4/igt@kms_invalid_mode@uint-max-clock@pipe-a-hdmi-a-1.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-1/igt@kms_invalid_mode@uint-max-clock@pipe-a-hdmi-a-1.html> +2 other tests pass
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html> (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-plane-move:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html> (Intel XE#2948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html> +1 other test pass
>   *
> 
>     igt@kms_psr@psr2-cursor-render@edp-1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-8/igt@kms_psr@psr2-cursor-render@edp-1.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-8/igt@kms_psr@psr2-cursor-render@edp-1.html> +1 other test pass
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html>
>   *
> 
>     igt@xe_dma_buf_sync@export-dma-buf-many-write-read-sync:
> 
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-8/igt@xe_dma_buf_sync@export-dma-buf-many-write-read-sync.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-9/igt@xe_dma_buf_sync@export-dma-buf-many-write-read-sync.html> +1 other test pass
>   *
> 
>     igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-6/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind.html> +1 other test pass
>   *
> 
>     igt@xe_exec_compute_mode@once-userptr-invalidate-race:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-4/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html> (Intel XE#2687 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html>
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-5/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html> (Intel XE#1630 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html>
>   *
> 
>     igt@xe_pm@d3hot-mocs:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-lnl-6/igt@xe_pm@d3hot-mocs.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-lnl-5/igt@xe_pm@d3hot-mocs.html>
>   *
> 
>     igt@xe_pm@s4-vm-bind-prefetch:
> 
>       o shard-adlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html> (Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-3/igt@xe_pm@s4-vm-bind-prefetch.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +1 other test timeout
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
> 
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) +1 other test fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +1 other test timeout
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
> 
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc:
> 
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-adlp-6/igt@kms_setmode@invalid-clone-single-crtc.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-adlp-8/igt@kms_setmode@invalid-clone-single-crtc.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140208v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403 ->
>     xe-pw-140208v2
> 
> IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2094-fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403: 
> fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403
> xe-pw-140208v2: 140208v2
> 
