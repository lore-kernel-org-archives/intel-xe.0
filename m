Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC55C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 19:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8C710EDA5;
	Wed, 19 Jun 2024 19:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSZggFL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F7110EDA5
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 19:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718825783; x=1750361783;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5AAxmYdJFoncDw6YgwLCNCRa4Nr2pinT5AsreMMRO84=;
 b=PSZggFL/sjFkVs7cfviAJaQy++dux48H3y0M53FfuMHvD7TORc1gk/TM
 JDiTuu7Ltti8nGvy0uFMHgOzoKD/g4aZ+D8d9txkCZX5vbj8PKCH73UPG
 dL6YysDMdpqfAf4tgvXMF7pAJxw5ly1C835HMQe9PsLXMf2o4+uTI12ks
 VTeeU2h7ZQNBB7lL1AZR6LWep+f+w93w0XuCzEIwGSiT30psbQ3QZ4LpG
 Qle34IMcHu39l22RtFBHqO/10Z2TIqtCkQq9cfbBeTiKkGnRRMULR06LZ
 ho8Zw8jXsRysXJ2Qrjj2vIuxKnsBQxiyo2Has1SyzRgjnZc+DTzM4o4f4 w==;
X-CSE-ConnectionGUID: zRGc7C+pQjy9Br6REM8ruA==
X-CSE-MsgGUID: 2eMPt0B7Tf+xGbjoZlWeXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26370361"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="26370361"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 12:36:23 -0700
X-CSE-ConnectionGUID: bf78T77tSViDgmrE/IVu7w==
X-CSE-MsgGUID: 7f/vokVxQXOFrfduvj4oUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="41869587"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 12:36:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 12:36:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 12:36:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 12:36:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAKxEaFQOlQXmlY1uLKYA/oEyKn6pHPVW967GNN3E9wck4n8aMskZ8fNUST0LkQI+pkZ6bbskAEI/x4Sip2KUtytwziRhygBaOavHYIJsKI7T/0MNSziY1HhZ8EWUgGoYbcIzSHRADk9y/aA+5noThJljKtja6sHZFNYl3nTAAjTfShHc7naEriqqSRaZF85SetcmwH83d87bJX8fy/cXTW/awB+4K9WVUl95hry6MGCA96I6c52qEePtT0PjDVUizg4wqLKarItJ0C6oQDII2KClDe6blPU+0+HXgzD+N9RYcvxEEVVNseA4JGtqTUcHdVITI3MLxreOR2MF/z/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fKCFSVmnRzCMDqVHOnl5lAfsMPccTivmXs2FaW3HuI=;
 b=LjB03+g9zEgGqTXNNvsbeWr0kMP0g4FmsccbUxVpe9lPb9Ve5UeFd0kJoJZsuhyNvqJ4XGXnsKPhDsAH6PsfHH3W25JR2i60ZpDAgW795yKp8050XhYi0dgPmccTbkOXNFA0LWHHfgCmaeTuKtr5zkV9qmq/9OJWzDLCM7rdTh53ApYR6wlDnxjeMDWopWzCFkORHi5cDOqWGkWTfd1EDy25kjUuHIsoC3X/FEa0MvWcx1Jmz13bur1laZ0/xfn3didwa0hnztEC4iUB4daWE6aZDNaUynzOy22SvNiDTfbLKl3WnrTuNdPXeGkfkTaU0U2/G/b02U4gSSGuJbnrSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Wed, 19 Jun
 2024 19:36:17 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 19:36:17 +0000
Message-ID: <43bff441-3dba-4de5-9e67-702c8c2dc21a@intel.com>
Date: Wed, 19 Jun 2024 15:36:13 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v9 1/4] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240607000719.1012422-1-zhanjun.dong@intel.com>
 <20240607000719.1012422-2-zhanjun.dong@intel.com>
 <c2b2219f-5e8e-4006-8561-ebab0ae79ffe@intel.com>
Content-Language: en-US
In-Reply-To: <c2b2219f-5e8e-4006-8561-ebab0ae79ffe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0073.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::14) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA1PR11MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c165cc9-570a-4a0d-299c-08dc90971654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlpvSzZhMmtQVEE5b0cyTUJ2ZWhvNFQ4eFJmK2NWb05tbHpZazgvMHVwczFP?=
 =?utf-8?B?Wk53ZzN6eW5yU1BxT2tFN1JaMXQxdVNqckVBbStELytoV0ltdEVqY1BzT25C?=
 =?utf-8?B?Z2Y0cUlOVGJneVkzMStPOTFYejRHTzZTczdnMFNxOVFuWmV0ajV5N3JJSXRO?=
 =?utf-8?B?em1WN0RTZi8vMnJjSnJrZjFWZWErNjQ5VFdRWUFzRFMyY2ZUU3pJMmRGdVNq?=
 =?utf-8?B?WVA3T2tYMlRDV3JUN0VBQXFFTitjZXFZUVJXNkJPYUV0T0ExMjhXamNxZ0Z0?=
 =?utf-8?B?b1ZJMDdLRkxkMlVucjJhaFBtM1I2ZEJWOE5Nd01KNFdjaS9wa1NoRjFpSE5W?=
 =?utf-8?B?cCtxQXpCWHZvVFN0aVZ3MzRja3BTM0dNcUorTEZhMXRSeHhaQ1ZEVDBNNUFR?=
 =?utf-8?B?SDFLS1J0VzY0UnY3cHhUblpxemljeFBVb3JNUURlaEFjMTdlam5YS3RyclFK?=
 =?utf-8?B?ZVJpVXVyMVZzOXBwRzZuc2xpaTNTZ1liWUhpRDhNZGZDUmJSQXRwVUtCS2V5?=
 =?utf-8?B?cS9lR2M2NU52a0x3V0ZnUUhJdkZMcG8rUlhMeXM5WnA0MWNkd1gwOWNubU5M?=
 =?utf-8?B?MFV5V2lTdjNlL0tzTGgxVFdKWTU4S0NlekF0RjF5Ung2SmJBOHArbm9qUk5E?=
 =?utf-8?B?dnhhYXBkNmVJUVpPYTVEVFFXUnVwZ1VLcm9YSEFPbG52MnpmTXk1V1N1Qkdu?=
 =?utf-8?B?RlZGSXhveVZzT0NMc3AzTFd0Q3A2ZndvbC9JOEVESlFDS2tQbXl2alFiTkZX?=
 =?utf-8?B?NUtCRzhUOU9VUVVKNnVYcUtzbW9ielJMc242SnBEQWdkUy9XZ3ZZYjZSeDFT?=
 =?utf-8?B?dDM5QlRFK0QwQk5TbDhvU0QxOTg5TVFzRm5tU0RVQmZld2I4SEc0NXViWFJl?=
 =?utf-8?B?akZMY0hxR1diVytQMmdFSDc0TjFpZU0zVFlnVDI5VHowUHB5T3ZlZzNYRitm?=
 =?utf-8?B?OEoyQ2YyNkhMZ3RIUVJpTlNUaXM0Mnk1OW9KVlg5WmxEQ1cxZG1jL25ERHVO?=
 =?utf-8?B?MFhKVWpCU3p4OUVWZG1yQUVMRWsrOUxpaEptTnZ0dEJmMXBQdThmakxYelB1?=
 =?utf-8?B?SzVXSEpIWGlRR2VHSDZCWVVNaXd1OGtkRlBjazF6VDQyL1B6M2dWbmZla2ls?=
 =?utf-8?B?TkV4NElNNmxhRno3YWt4OFoyeEN5TkNJRUE3VjlFcnNyQUpncmJTWWJwcE8x?=
 =?utf-8?B?Mk5vMUY3d2VBdDN5K01jbDdDZWNXakZCRjRSbndxV0I0d2tkS01YSjdON20y?=
 =?utf-8?B?MjkvS2tBNTA1UHVRRmk4L2pwRmdjMjA5elk3WlliZUFzNHJid1FFb2FjYW1j?=
 =?utf-8?B?eWwvdFlQbmdlQ21FeHVQK2RReDUzNzRiZDFudUZQQVpPQTBOLzBubnlaRkc1?=
 =?utf-8?B?ZkVPVnBGNWdLSHVRNzdrS2MzcGJKZ3gwU2kvOTJ2d01CYjRtaktlaU9Ia2d1?=
 =?utf-8?B?RmJ3Sm5kRFRoM1ByUnNwcHR5cXlCL2x5cHladEpubXBkS3pWeTgrQ1ZuUStE?=
 =?utf-8?B?d0dERDBBR0NEWGozNGJSR3hwQjdEVGxkdi93YnRnU1VzZDQ0eFVBWWNYejIr?=
 =?utf-8?B?bjFvaE1YaUVpYkpPbDdLcGxYbVV4ZFl5bUwxRmRQcThqZ1NtWFRjS1FCVEJ4?=
 =?utf-8?B?bmF6QmtuZ2lMblhBblc5MDlFVW9NUmI2QTdRT3RxMGRGMXZkK2QwVDBKTjNv?=
 =?utf-8?B?SkVRQlczWCtkampLZmVDUkRqUkQvMlpjdGZZalJ0M2YvRy9qdHhqelZhMFo1?=
 =?utf-8?Q?024bWjI3sYkOf8l6OobAXrgnJQgr0LwQ3a8RwVy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWQ2cmJMM0lJSnk0UTNhWmsvN3kyblZ4Mjg5YWFQSElYU1lpd2JqTDlrTzA3?=
 =?utf-8?B?R2FBWWFPK2FjOVdJeGdobytuZFRUQnV1RCt1TDNCc1dCbytmaUErc1FyV3hS?=
 =?utf-8?B?RkxTVXlDQ3lnblduOW8ybkxKOVQ2Vzc2ZXcxRGhDUkZSTGVJa1h1bjlvT3BC?=
 =?utf-8?B?OUNBZXVOczVRNlUrOTA2NGpCMzVPejNjTTFtSGU5bm1KK2x4ZG51ODFPOTRV?=
 =?utf-8?B?STlLaENRaXJtS2FzTDRka2RjQWJoOEE2Yi9UNW9MaWpxc3l0T0FpTTlzNzRp?=
 =?utf-8?B?Uk5pb2NlMU1lVmh0RnFKb1VtOFBQNXNxRkxMdGNhWjZ2clpyb1hwOFQ2TVkv?=
 =?utf-8?B?bSs3S1NoQjA1KzQzN0ZjSHgyQmFIdnY3N2k5dmpKUzFFODF4RGFaVkpHMlJN?=
 =?utf-8?B?SVNHM2I3d2pqa3J2cEhyODAxUmVMMytlUkl3dG4zREZ3Sm1yQjIxNnpYN1pG?=
 =?utf-8?B?dld2OHZLNXd5SkRjanVkNVB6WEx0M2xFRlBuT09vVnk5UHlhVnJNbzBpcUt2?=
 =?utf-8?B?dHFZWVBzMTQwUmk0NEFUZUJxdjdOY0xGQ0V4eFBWbUQ3L3VPZHBqLytVV1hE?=
 =?utf-8?B?bnVoUC9tdjZ3S0I0cWtyV2hnSGdrZ0NSTlEyTFBsenNhSFo1TlYrWEs1aERm?=
 =?utf-8?B?anM5ejc3UHM2UTcvV2F5R2lpdEQweVRWWk9tdDgranF4NFhoL0JhSXl1dWdS?=
 =?utf-8?B?R0ZaSUI3blJGU1cwSW5aY3o2T1lEMW5rZVczU2xUWnpzdEMzNEZjUVRETWF4?=
 =?utf-8?B?Q2JaZnMzelczdzhiMVpCT25oR2dhK1lZZFlreEc5KzF6eW51QzA0bzhabUhx?=
 =?utf-8?B?T25QM2xkc1gwQnR1L1NGNkpFRzNOY2Q1bUc4SC8xL1k2bktSR2gyOUhRZUcy?=
 =?utf-8?B?Y3U2T1JUM3EybnZHWDk0a0pwbkZiL09ld2NjZ012MXEyTDQxKzhxUXpJdFRy?=
 =?utf-8?B?ZS9BZUNQUlVQT1plMG9yc3BYYUJJSUxPWDd5bzdQN2pHZm9yNXpmOHR5Wk5W?=
 =?utf-8?B?eERrcWFQZWFnRVJoRUVnK3dYSmprc2hMR3QvbXFFK2lWL3dxd2h6S2hwVitw?=
 =?utf-8?B?ZWtCbmNhbmJMUnZEcmt5WVprOEdvcEUwQU9yeXdzMkRMajlKM0ZnemJYZTNS?=
 =?utf-8?B?YWJEeGNlUWFZN0NRZGV0VkQ2emkwMDUvaFQ0MW8xSVJ4R0pkVmthZVVXWURw?=
 =?utf-8?B?bmdCckhhOHRLZjBWNnU0dnVJa3FZcFZIT1dqV3RlVWxSd0RZOFhtQk9TeXdN?=
 =?utf-8?B?M096OWVRdVVETGZjZlA2cXIvQlVlQm5XTExtTE9OaStBb1liZVNMZzdzZHlk?=
 =?utf-8?B?ZWJUY2VOMHU0TlcyendQd2h5UDBXRDFCSXRFd1V4alozODFNR25zQlkvYlZG?=
 =?utf-8?B?OTdCWXVDUVJkUU1wNlRhTFZjYWZRelRXb0JqNWpjNE5vbzJFc0l3VVJUbnRi?=
 =?utf-8?B?SGowWXBQejJ4UnFvc2k3WExJT0JDd0paRDJEUDhYdmdJd0NQQ3pQbk9DS3JT?=
 =?utf-8?B?TlpQVTZhbUd6Z3ZCMWl2aWlmRVFjZnNlRERMVEpkK3drTGo4djhzNlBjczJz?=
 =?utf-8?B?TzBDMUI2aWlpRFhIT2hERjh4ajJyR2pKSXpiVWhvVlJjZlRFbUF2MlBuSGJG?=
 =?utf-8?B?dFJRYkhJdkhKbkJIaUdNZjVLRzVQZitZWCtIZTgvTUtyMHVrVDZLMVRzOXNX?=
 =?utf-8?B?MFZwWlJCa1dnWHNocDVUUG5QNy9BOHdRNkZzbjJpdUFZcHhwSUxVOUdBL2pH?=
 =?utf-8?B?SUVYb05OV0hhc0hFUXJwSHRNc3BJd0VYT0RadGF6eTk1NzVWSWNXN1ZlVEVC?=
 =?utf-8?B?QlJ5SFYzcEdXZEMxQmpnZTNId0RaVnp3NnJ4Nm8rcU15V0RBbkRaSDRMZkM0?=
 =?utf-8?B?MzZDczlzY1FvMU1IVGt5VjJIcE42ZTVoQlVENmJUa1V4cXVucU1lT2xpVHF3?=
 =?utf-8?B?RzcvY05Bamkxd0ZWY0RwZnZza0RBUGwxc1V3N2Q0ZWkreTJyWkVtWUtmNWFP?=
 =?utf-8?B?U3F6ampBb1k2bWVJRUxlRDJ4dWJ5dWFPc2g2QmJsUkxqbll3ek1DcjJJS1RU?=
 =?utf-8?B?Zk85R3lpbTF5eTRDckRnL2pNcmZyamZCcDh1dGUwYW0xblNYLytUOFRrS01n?=
 =?utf-8?Q?/3IaJ8VD5jWkT/QXBBqnIIqyM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c165cc9-570a-4a0d-299c-08dc90971654
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 19:36:17.0566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U10kFI5Id9o564QSm8VrBherFBUZ2h1iPvxS0LtSgQsw0JF4WBogxi82a4Yc0QBlLZB4Ghu50SNfsx3qBQ3+KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7014
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

Please see my comments inline below.

Zhanjun

On 2024-06-14 7:50 a.m., Michal Wajdeczko wrote:
...
>> @@ -388,6 +391,48 @@ static int calculate_waklv_size(struct xe_guc_ads *ads)
>>   	return SZ_4K;
>>   }
>>   
>> +/**
>> + * xe_guc_capture_ads_input_worst_size - Calculate the worst size for GuC register capture
>> + * @guc: point to xe_guc structure
>> + *
>> + * Calculate the worst size for GuC register capture by including all possible engines classes.
>> + *
>> + * Returns: Calculated size
>> + */
>> +int xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
> 
> shouldn't this function be located in xe_guc_capture.c ?
> seems to better fit than xe_guc_ads.c
> 
> also, since it's returning "size" the maybe it should be of type
> "size_t" like the local var total_size ?
> 
Will be changed as advised

>> +{
>> +	size_t total_size, class_size, instance_size, global_size;
>> +	int i, j;
>> +
>> +	/* This function calculates the worst case register lists size by
>> +	 * including all possible engines classes. It is called during the
>> +	 * first of a two-phase GuC (and ADS-population) initialization
>> +	 * sequence, that is, during the pre-hwconfig phase before we have
>> +	 * the exact engine fusing info.
>> +	 */
> 
> for multi-line comments there is little different format of the first line:
> 
> /*
>   * This function calculates the worst case register lists size by
>   * including all possible engines classes. It is called during the
>   ...
> 
>> +	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
>> +	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
>> +		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
>> +			if (xe_guc_capture_getlistsize(guc, i,
>> +						       GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
>> +						       j, &class_size) < 0)
>> +				class_size = 0;
>> +			if (xe_guc_capture_getlistsize(guc, i,
>> +						       GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
>> +						       j, &instance_size) < 0)
>> +				instance_size = 0;
>> +			total_size += class_size + instance_size;
>> +		}
>> +		if (xe_guc_capture_getlistsize(guc, i,
>> +					       GUC_CAPTURE_LIST_TYPE_GLOBAL,
>> +					       0, &global_size) < 0)
>> +			global_size = 0;
>> +		total_size += global_size;
>> +	}
>> +
>> +	return PAGE_ALIGN(total_size);
>> +}
>> +
>>   #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
>>   
>>   int xe_guc_ads_init(struct xe_guc_ads *ads)
>> @@ -398,6 +443,10 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>>   	struct xe_bo *bo;
>>   
>>   	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>> +	/* At time of ads init, hwconfig was not loaded, engine info like engine mask is not ready.
>> +	 * Capture size is using the worst size calculation.
>> +	 */
> 
> comments are usually wrapped at column 80 (just code is allowed to 100)
> and make it in proper style
> 
>> +	ads->capture_size = xe_guc_capture_ads_input_worst_size(ads_to_guc(ads));
>>   	ads->regset_size = calculate_regset_size(gt);
>>   	ads->ads_waklv_size = calculate_waklv_size(ads);
>>   
>> @@ -431,10 +480,11 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>>   	xe_gt_assert(gt, ads->bo);
>>   
>>   	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>> +	/* Calculate Capture size with worst size */
>> +	ads->capture_size = xe_guc_capture_ads_input_worst_size(ads_to_guc(ads));
>>   	ads->regset_size = calculate_regset_size(gt);
>>   
>> -	xe_gt_assert(gt, ads->golden_lrc_size +
>> -		     (ads->regset_size - prev_regset_size) <=
>> +	xe_gt_assert(gt, ads->golden_lrc_size + (ads->regset_size - prev_regset_size) <=
>>   		     MAX_GOLDEN_LRC_SIZE);
>>   
>>   	return 0;
>> @@ -530,20 +580,159 @@ static void guc_mapping_table_init(struct xe_gt *gt,
>>   	}
>>   }
>>   
>> -static void guc_capture_list_init(struct xe_guc_ads *ads)
>> +static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map *info_map,
>> +				       u32 capture_class)
>>   {
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 mask;
>> +
>> +	switch (capture_class) {
>> +	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
>> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_RENDER_CLASS]);
>> +		mask |= info_map_read(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS]);
>> +		break;
>> +	case GUC_CAPTURE_LIST_CLASS_VIDEO:
>> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEO_CLASS]);
>> +		break;
>> +	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
>> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS]);
>> +		break;
>> +	case GUC_CAPTURE_LIST_CLASS_BLITTER:
>> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_BLITTER_CLASS]);
>> +		break;
>> +	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
>> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
>> +		break;
>> +	default:
>> +		mask = 0;
>> +	}
>> +
>> +	return mask;
>> +}
>> +
>> +static int guc_capture_prep_lists(struct xe_guc_ads *ads)
>> +{
>> +	struct xe_guc *guc = ads_to_guc(ads);
>> +	struct xe_gt *gt = ads_to_gt(ads);
>> +	u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
>> +	struct iosys_map info_map;
>> +	size_t size = 0;
>> +	void *ptr;
>>   	int i, j;
>> -	u32 addr = xe_bo_ggtt_addr(ads->bo) + guc_ads_capture_offset(ads);
>>   
>> -	/* FIXME: Populate a proper capture list */
>> +	capture_offset = guc_ads_capture_offset(ads);
>> +	ads_ggtt = xe_bo_ggtt_addr(ads->bo);
>> +	info_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
>> +					 offsetof(struct __guc_ads_blob, system_info));
>> +
>> +	/* first, set aside the first page for a capture_list with zero descriptors */
>> +	total_size = PAGE_SIZE;
>> +	if (!xe_guc_capture_getnullheader(guc, &ptr, &size))
>> +		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr, size);
>> +
>> +	null_ggtt = ads_ggtt + capture_offset;
>> +	capture_offset += PAGE_SIZE;
>> +
>> +	/* Populate capture list : at this point adps is already allocated and mapped to worst case
>> +	 * size
>> +	 */
>>   	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
>> -		for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
>> -			ads_blob_write(ads, ads.capture_instance[i][j], addr);
>> -			ads_blob_write(ads, ads.capture_class[i][j], addr);
>> +		bool write_empty_list;
>> +
>> +		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
>> +			u32 engine_mask = guc_get_capture_engine_mask(gt, &info_map, j);
>> +			/* null list if we dont have said engine or list */
>> +			if (!engine_mask) {
>> +				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
>> +				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
>> +				continue;
>> +			}
>> +			/********************************************************/
>> +			/*** engine exists: start with engine-class registers ***/
>> +			/********************************************************/
> 
> we usually don't use extensive code decorations like this
> 
> if function is too long (and in this case it is) then rather try to
> split it smaller ones
will split it
> 
>> +			write_empty_list = true; /* starting assumption is an empty list */
>> +			size = 0;
>> +			if (!xe_guc_capture_getlistsize(guc, i,
>> +							GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
>> +							j, &size)) {
>> +				if (total_size + size > ads->capture_size)
>> +					xe_gt_dbg(gt, "Capture size overflow :%zu vs %d\n",
>> +						  total_size + size, ads->capture_size);
>> +				else if (!xe_guc_capture_getlist(guc, i,
>> +								 GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
>> +								 j, &ptr))
>> +					/* everything checked out, populate! */
>> +					write_empty_list = false;
>> +			}
>> +			if (!write_empty_list) {
>> +				ads_blob_write(ads, ads.capture_class[i][j],
>> +					       ads_ggtt + capture_offset);
>> +				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
>> +						 ptr, size);
>> +				total_size += size;
>> +				capture_offset += size;
>> +			} else {
>> +				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
>> +			}
>> +
>> +			/********************************************************/
>> +			/*** engine exists: next, engine-instance registers   ***/
>> +			/********************************************************/
>> +			write_empty_list = true; /* starting assumption is an empty list */
>> +			size = 0;
>> +			if (!xe_guc_capture_getlistsize(guc, i,
>> +							GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
>> +							j, &size)) {
>> +				if (total_size + size > ads->capture_size)
>> +					xe_gt_dbg(gt, "Capture size overflow :%zu vs %d\n",
>> +						  total_size + size, ads->capture_size);
>> +				else if (!xe_guc_capture_getlist(guc, i,
>> +								 GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
>> +								 j, &ptr))
>> +					/* everything checked out, populate! */
>> +					write_empty_list = false;
>> +			}
>> +
>> +			if (!write_empty_list) {
>> +				ads_blob_write(ads, ads.capture_instance[i][j],
>> +					       ads_ggtt + capture_offset);
>> +				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
>> +						 ptr, size);
>> +				total_size += size;
>> +				capture_offset += size;
>> +			} else {
>> +				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
>> +			}
>>   		}
>>   
>> -		ads_blob_write(ads, ads.capture_global[i], addr);
>> +		/********************************************************/
>> +		/*** global registers is last in our PF/VF loops      ***/
>> +		/********************************************************/
>> +		write_empty_list = true; /* starting assumption is an empty list */
>> +		size = 0;
>> +		if (!xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &size)) {
>> +			if (total_size + size > ads->capture_size)
>> +				xe_gt_dbg(gt, "Capture size overflow :%zu vs %d\n",
>> +					  total_size + size, ads->capture_size);
>> +			else if (!xe_guc_capture_getlist(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0,
>> +							 &ptr))
>> +				write_empty_list = false; /* everything checked out, populate! */
>> +		}
>> +		if (!write_empty_list) {
>> +			ads_blob_write(ads, ads.capture_global[i], ads_ggtt + capture_offset);
>> +			xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr,
>> +					 size);
>> +			total_size += size;
>> +			capture_offset += size;
>> +		} else {
>> +			ads_blob_write(ads, ads.capture_global[i], null_ggtt);
>> +		}
>>   	}
>> +
>> +	if (ads->capture_size != PAGE_ALIGN(total_size))
>> +		xe_gt_info(gt, "ADS capture alloc size changed from %d to %d\n",
> 
> maybe xe_gt_dbg as it doesn't seem important for an ordinary user
Will do that way
> 
>> +			   ads->capture_size, PAGE_ALIGN(total_size));
>> +	return PAGE_ALIGN(total_size);
>>   }
>>   
>>   static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
>> @@ -732,7 +921,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>>   	guc_mmio_reg_state_init(ads);
>>   	guc_prep_golden_lrc_null(ads);
>>   	guc_mapping_table_init(gt, &info_map);
>> -	guc_capture_list_init(ads);
>> +	guc_capture_prep_lists(ads);
>>   	guc_doorbell_init(ads);
>>   	guc_waklv_init(ads);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
>> index 2e6674c760ff..11b6e3ea3d9f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
>> @@ -8,11 +8,14 @@
>>   
>>   struct xe_guc_ads;
>>   
> 
> please keep forward decls together, but
> 
>> +struct xe_guc;
>> +
>>   int xe_guc_ads_init(struct xe_guc_ads *ads);
>>   int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
>>   int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
>> +int xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
> 
> likely this function should be defined elsewhere (as clearly it does not
> fit here)
Sure, will do
> 
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> index 2de5decfe0fd..70c132458ac3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> @@ -22,6 +22,8 @@ struct xe_guc_ads {
>>   	u32 regset_size;
>>   	/** @ads_waklv_size: total waklv size supported by platform */
>>   	u32 ads_waklv_size;
>> +	/** @capture_size: size of register set passed to GuC for capture */
>> +	u32 capture_size;
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> new file mode 100644
>> index 000000000000..19bd79285061
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -0,0 +1,352 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021-2022 Intel Corporation
> 
> 2024 ?
> 
>> + */
>> +
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "abi/guc_actions_abi.h"
>> +#include "regs/xe_engine_regs.h"
>> +#include "regs/xe_gt_regs.h"
>> +#include "regs/xe_guc_regs.h"
>> +#include "regs/xe_regs.h"
>> +
>> +#include "xe_bo.h"
>> +#include "xe_device.h"
>> +#include "xe_exec_queue_types.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_mcr.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_capture.h"
>> +#include "xe_guc_capture_fwif.h"
>> +#include "xe_guc_ct.h"
>> +#include "xe_guc_log.h"
>> +#include "xe_guc_submit.h"
>> +#include "xe_hw_engine_types.h"
>> +#include "xe_macros.h"
>> +#include "xe_map.h"
>> +
>> +/*
>> + * Define all device tables of GuC error capture register lists
>> + * NOTE: For engine-registers, GuC only needs the register offsets
>> + *       from the engine-mmio-base
>> + */
>> +#define COMMON_XELP_BASE_GLOBAL \
>> +	{ FORCEWAKE_GT,		    0,      0}
>> +
>> +#define COMMON_BASE_ENGINE_INSTANCE \
>> +	{ RING_ESR(0),              0,      0}, \
>> +	{ RING_EMR(0),              0,      0}, \
>> +	{ RING_EIR(0),              0,      0}, \
>> +	{ RING_EXECLIST_STATUS_HI(0), 0,    0}, \
>> +	{ RING_EXECLIST_STATUS_LO(0), 0,    0}, \
>> +	{ RING_DMA_FADD(0),         0,      0}, \
>> +	{ RING_DMA_FADD_UDW(0),     0,      0}, \
>> +	{ RING_IPEHR(0),            0,      0}, \
>> +	{ RING_BBADDR(0),           0,      0}, \
>> +	{ RING_BBADDR_UDW(0),       0,      0}, \
>> +	{ RING_ACTHD(0),            0,      0}, \
>> +	{ RING_ACTHD_UDW(0),        0,      0}, \
>> +	{ RING_START(0),            0,      0}, \
>> +	{ RING_HEAD(0),             0,      0}, \
>> +	{ RING_TAIL(0),             0,      0}, \
>> +	{ RING_CTL(0),              0,      0}, \
>> +	{ RING_MI_MODE(0),          0,      0}, \
>> +	{ RING_HWS_PGA(0),          0,      0}, \
>> +	{ RING_MODE(0),             0,      0}
>> +
>> +/* XE_LP Global */
>> +static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
>> +	COMMON_XELP_BASE_GLOBAL,
>> +};
>> +
>> +/* Render / Compute Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe_rc_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/* Media Decode/Encode Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe_vd_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/* Video Enhancement Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe_vec_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/* Blitter Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe_blt_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/* XE_LP - GSC Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/*
>> + * Empty list to prevent warnings about unknown class/instance types
>> + * as not all class/instanace types have entries on all platforms.
>> + */
>> +static const struct __guc_mmio_reg_descr empty_regs_list[] = {
>> +};
>> +
>> +#define TO_GCAP_DEF_OWNER(x) (GUC_CAPTURE_LIST_INDEX_##x)
>> +#define TO_GCAP_DEF_TYPE(x) (GUC_CAPTURE_LIST_TYPE_##x)
>> +#define MAKE_REGLIST(regslist, regsowner, regstype, class) \
>> +	{ \
>> +		regslist, \
>> +		ARRAY_SIZE(regslist), \
>> +		TO_GCAP_DEF_OWNER(regsowner), \
>> +		TO_GCAP_DEF_TYPE(regstype), \
>> +		class, \
> 
> 		GUC_CAPTURE_LIST_CLASS_##class ?
The class here is for GUC_CAPTURE_LIST_CLASS_xxx.
The MAKE_REGLIST macro was used for all of list types, the above list 
class is for engine class/instance type, but for glbal type, as it has 
no associated engine class, so helper macro is not used here like other 
2 (TO_GCAP_DEF_TYPE/TO_GCAP_DEF_OWNER).
This is by purpose.

> 
>> +	}
>> +
>> +/* List of lists */
>> +static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
>> +	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
>> +	MAKE_REGLIST(xe_rc_inst_regs, PF, ENGINE_INSTANCE,
>> +		     GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
>> +	MAKE_REGLIST(xe_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>> +	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE,
>> +		     GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
>> +	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>> +	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>> +	{}
>> +};
>> +
>> +static const char * const capture_list_type_names[] = {
>> +	"Global",
>> +	"Class",
>> +	"Instance",
>> +	"unknown",	/* Default name, if out of bound */
> 
> do we really need this last item ?
> maybe just add xe_assert() in the code to make sure it's correct?
> 
>> +};
>> +
>> +static const char * const capture_engine_class_names[] = {
>> +	"Render/Compute",
>> +	"Video",
>> +	"VideoEnhance",
>> +	"Blitter",
>> +	"GSC-Other",
>> +	"unknown",	/* Default name, if out of bound */
> 
> ditto

> 
>> +};
>> +
>> +/* Get item from array by index.
>> + * The last item is the default value, referenced for index out of bound condition.
>> + */
>> +#define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
>> +									 (index)])
Emm, with the xe_assert in code, the above "Default name" could be 
removed, and this macro is no longer needed as well.

>> +
>> +static const struct __guc_mmio_reg_descr_group *
>> +guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
>> +			 u32 owner, u32 type, u32 id)
>> +{
>> +	int i;
>> +
>> +	if (!reglists)
>> +		return NULL;
>> +
>> +	for (i = 0; reglists[i].list; ++i) {
>> +		if (reglists[i].owner == owner && reglists[i].type == type &&
>> +		    (reglists[i].engine == id || reglists[i].type == GUC_CAPTURE_LIST_TYPE_GLOBAL))
>> +			return &reglists[i];
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static const struct __guc_mmio_reg_descr_group *
>> +guc_capture_get_device_reglist(struct xe_guc *guc)
>> +{
>> +	return xe_lp_lists;
>> +}
>> +
>> +static int
>> +guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
>> +		      struct guc_mmio_reg *ptr, u16 num_entries)
>> +{
>> +	u32 i = 0;
>> +	const struct __guc_mmio_reg_descr_group *reglists = guc->capture->reglists;
>> +	const struct __guc_mmio_reg_descr_group *match;
>> +
>> +	if (!reglists)
>> +		return -ENODEV;
>> +
>> +	match = guc_capture_get_one_list(reglists, owner, type, classid);
>> +	if (!match)
>> +		return -ENODATA;
>> +
>> +	for (i = 0; i < num_entries && i < match->num_regs; ++i) {
>> +		ptr[i].offset = match->list[i].reg.addr;
>> +		ptr[i].value = 0xDEADF00D;
>> +		ptr[i].flags = match->list[i].flags;
>> +		ptr[i].mask = match->list[i].mask;
>> +	}
>> +
>> +	if (i < num_entries)
>> +		xe_gt_dbg(guc_to_gt(guc), "Got short capture reglist init: %d out %d.\n", i,
>> +			  num_entries);
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +guc_cap_list_num_regs(struct xe_guc_state_capture *gc, u32 owner, u32 type, u32 classid)
>> +{
>> +	const struct __guc_mmio_reg_descr_group *match;
>> +
>> +	match = guc_capture_get_one_list(gc->reglists, owner, type, classid);
>> +	if (!match)
>> +		return 0;
>> +
>> +	return match->num_regs;
>> +}
>> +
>> +static int
>> +guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
>> +			size_t *size, bool is_purpose_est)
>> +{
>> +	struct xe_guc_state_capture *gc = guc->capture;
>> +	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
>> +	int num_regs;
>> +
>> +	if (!gc->reglists) {
>> +		xe_gt_warn(guc_to_gt(guc), "No capture reglist for this device\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (cache->is_valid) {
>> +		*size = cache->size;
>> +		return cache->status;
>> +	}
>> +
>> +	if (!is_purpose_est && owner == GUC_CAPTURE_LIST_INDEX_PF &&
>> +	    !guc_capture_get_one_list(gc->reglists, owner, type, classid)) {
>> +		if (type == GUC_CAPTURE_LIST_TYPE_GLOBAL)
>> +			xe_gt_warn(guc_to_gt(guc), "Missing capture reglist: global!\n");
>> +		else
>> +			xe_gt_warn(guc_to_gt(guc), "Missing capture reglist: %s(%u):%s(%u)!\n",
>> +				   get_item_with_default(capture_list_type_names, type), type,
>> +				   get_item_with_default(capture_engine_class_names, classid),
>> +				   classid);
>> +		return -ENODEV;
>> +	}
>> +
>> +	num_regs = guc_cap_list_num_regs(gc, owner, type, classid);
>> +	/* intentional empty lists can exist depending on hw config */
>> +	if (!num_regs)
>> +		return -ENODATA;
>> +
>> +	if (size)
>> +		*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
>> +				   (num_regs * sizeof(struct guc_mmio_reg)));
>> +
>> +	return 0;
>> +}
>> +
>> +int
>> +xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size)
> 
> add kernel-doc for all public functions
Will add
> 
>> +{
>> +	return guc_capture_getlistsize(guc, owner, type, classid, size, false);
>> +}
>> +
>> +int
>> +xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr)
> 
> ditto
> 
>> +{
>> +	struct xe_guc_state_capture *gc = guc->capture;
>> +	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
>> +	struct guc_debug_capture_list *listnode;
>> +	int ret, num_regs;
>> +	u8 *caplist, *tmp;
>> +	size_t size = 0;
>> +
>> +	if (!gc->reglists)
>> +		return -ENODEV;
>> +
>> +	if (cache->is_valid) {
>> +		*outptr = cache->ptr;
>> +		return cache->status;
>> +	}
>> +
>> +	ret = xe_guc_capture_getlistsize(guc, owner, type, classid, &size);
>> +	if (ret) {
>> +		cache->is_valid = true;
>> +		cache->ptr = NULL;
>> +		cache->size = 0;
>> +		cache->status = ret;
>> +		return ret;
>> +	}
>> +
>> +	caplist = drmm_kzalloc(guc_to_drm(guc), size, GFP_KERNEL);
>> +	if (!caplist) {
>> +		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture list");
> 
> we usually don't add extra messages for OOM condition as it will be
> already reported
Will be removed.
> 
>> +		return -ENOMEM;
>> +	}
>> +
>> +	/* populate capture list header */
>> +	tmp = caplist;
>> +	num_regs = guc_cap_list_num_regs(guc->capture, owner, type, classid);
>> +	listnode = (struct guc_debug_capture_list *)tmp;
>> +	listnode->header.info = FIELD_PREP(GUC_CAPTURELISTHDR_NUMDESCR, (u32)num_regs);
>> +
>> +	/* populate list of register descriptor */
>> +	tmp += sizeof(struct guc_debug_capture_list);
>> +	guc_capture_list_init(guc, owner, type, classid, (struct guc_mmio_reg *)tmp, num_regs);
>> +
>> +	/* cache this list */
>> +	cache->is_valid = true;
>> +	cache->ptr = caplist;
>> +	cache->size = size;
>> +	cache->status = 0;
>> +
>> +	*outptr = caplist;
>> +
>> +	return 0;
>> +}
>> +
>> +int
>> +xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size)
>> +{
>> +	struct xe_guc_state_capture *gc = guc->capture;
>> +	int tmp = sizeof(u32) * 4;
>> +	void *null_header;
>> +
>> +	if (gc->ads_null_cache) {
>> +		*outptr = gc->ads_null_cache;
>> +		*size = tmp;
>> +		return 0;
>> +	}
>> +
>> +	null_header = drmm_kzalloc(guc_to_drm(guc), tmp, GFP_KERNEL);
>> +	if (!null_header) {
>> +		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture null list");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	gc->ads_null_cache = null_header;
>> +	*outptr = null_header;
>> +	*size = tmp;
>> +
>> +	return 0;
>> +}
>> +
>> +int xe_guc_capture_init(struct xe_guc *guc)
>> +{
>> +	guc->capture = drmm_kzalloc(guc_to_drm(guc), sizeof(*guc->capture), GFP_KERNEL);
>> +	if (!guc->capture)
>> +		return -ENOMEM;
>> +
>> +	guc->capture->reglists = guc_capture_get_device_reglist(guc);
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
>> new file mode 100644
>> index 000000000000..ba3e0aabee01
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
>> @@ -0,0 +1,43 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021-2021 Intel Corporation
> 
> 2024
> 
>> + */
>> +
>> +#ifndef _XE_GUC_CAPTURE_H
>> +#define _XE_GUC_CAPTURE_H
>> +
>> +#include <linux/types.h>
>> +#include "regs/xe_reg_defs.h"
>> +
>> +struct xe_guc;
>> +
>> +/*
>> + * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
>> + *
>> + * xe_guc_capture module uses these structures to maintain static
>> + * tables (per unique platform) that consists of lists of registers
>> + * (offsets, names, flags,...) that are used at the ADS regisration
>> + * time as well as during runtime processing and reporting of error-
>> + * capture states generated by GuC just prior to engine reset events.
>> + */
>> +struct __guc_mmio_reg_descr {
>> +	struct xe_reg reg;
>> +	u32 flags;
>> +	u32 mask;
>> +	const char *regname;
>> +};
>> +
>> +struct __guc_mmio_reg_descr_group {
>> +	const struct __guc_mmio_reg_descr *list;
>> +	u32 num_regs;
>> +	u32 owner; /* see enum guc_capture_owner */
>> +	u32 type; /* see enum guc_capture_type */
>> +	u32 engine; /* as per MAX_ENGINE_CLASS */
>> +};
>> +
>> +int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr);
>> +int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size);
>> +int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
>> +int xe_guc_capture_init(struct xe_guc *guc);
>> +
>> +#endif /* _XE_GUC_CAPTURE_H */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
>> new file mode 100644
>> index 000000000000..1b08388b0b94
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
>> @@ -0,0 +1,145 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021-2022 Intel Corporation
> 
> 2024
> 
>> + */
>> +
>> +#ifndef _XE_GUC_CAPTURE_FWIF_H
>> +#define _XE_GUC_CAPTURE_FWIF_H
>> +
>> +#include <linux/types.h>
>> +
>> +#include "xe_guc_fwif.h"
>> +
>> +/*
>> + * struct guc_debug_capture_list_header / struct guc_debug_capture_list
>> + *
>> + * As part of ADS registration, these header structures (followed by
>> + * an array of 'struct guc_mmio_reg' entries) are used to register with
>> + * GuC microkernel the list of registers we want it to dump out prior
>> + * to a engine reset.
>> + */
>> +struct guc_debug_capture_list_header {
>> +	u32 info;
>> +#define GUC_CAPTURELISTHDR_NUMDESCR GENMASK(15, 0)
>> +} __packed;
>> +
>> +struct guc_debug_capture_list {
>> +	struct guc_debug_capture_list_header header;
>> +	struct guc_mmio_reg regs[];
>> +} __packed;
>> +
>> +/*
>> + * struct guc_state_capture_header_t / struct guc_state_capture_t /
>> + * guc_state_capture_group_header_t / guc_state_capture_group_t
>> + *
>> + * Prior to resetting engines that have hung or faulted, GuC microkernel
>> + * reports the engine error-state (register values that was read) by
>> + * logging them into the shared GuC log buffer using these hierarchy
>> + * of structures.
>> + */
>> +struct guc_state_capture_header_t {
>> +	u32 owner;
>> +#define CAP_HDR_CAPTURE_VFID GENMASK(7, 0)
>> +	u32 info;
>> +#define CAP_HDR_CAPTURE_TYPE GENMASK(3, 0) /* see enum guc_capture_type */
>> +#define CAP_HDR_ENGINE_CLASS GENMASK(7, 4) /* see GUC_MAX_ENGINE_CLASSES */
>> +#define CAP_HDR_ENGINE_INSTANCE GENMASK(11, 8)
>> +	u32 lrca; /* if type-instance, LRCA (address) that hung, else set to ~0 */
>> +	u32 guc_id; /* if type-instance, context index of hung context, else set to ~0 */
>> +	u32 num_mmios;
>> +#define CAP_HDR_NUM_MMIOS GENMASK(9, 0)
>> +} __packed;
>> +
>> +struct guc_state_capture_t {
>> +	struct guc_state_capture_header_t header;
>> +	struct guc_mmio_reg mmio_entries[];
>> +} __packed;
>> +
>> +enum guc_capture_group_types {
>> +	GUC_STATE_CAPTURE_GROUP_TYPE_FULL,
>> +	GUC_STATE_CAPTURE_GROUP_TYPE_PARTIAL,
>> +	GUC_STATE_CAPTURE_GROUP_TYPE_MAX,
>> +};
>> +
>> +struct guc_state_capture_group_header_t {
>> +	u32 owner;
>> +#define CAP_GRP_HDR_CAPTURE_VFID GENMASK(7, 0)
>> +	u32 info;
>> +#define CAP_GRP_HDR_NUM_CAPTURES GENMASK(7, 0)
>> +#define CAP_GRP_HDR_CAPTURE_TYPE GENMASK(15, 8) /* guc_capture_group_types */
>> +} __packed;
>> +
>> +/* this is the top level structure where an error-capture dump starts */
>> +struct guc_state_capture_group_t {
>> +	struct guc_state_capture_group_header_t grp_header;
>> +	struct guc_state_capture_t capture_entries[];
>> +} __packed;
> 
> all above definitions looks like pure GuC ABI and for that we have
> dedicated folder xe/abi where we keep such defs
> 
> -------
> 
> and all below definitions looks like Xe driver specific related to
> xe_guc_capture so by convention they should be placed in
> xe_guc_capture_types.h file
will do

> 
>> +
>> +/*
>> + * struct __guc_capture_ads_cache
>> + *
>> + * A structure to cache register lists that were populated and registered
>> + * with GuC at startup during ADS registration. This allows much quicker
>> + * GuC resets without re-parsing all the tables for the given gt.
>> + */
>> +struct __guc_capture_ads_cache {
>> +	bool is_valid;
>> +	void *ptr;
>> +	size_t size;
>> +	int status;
>> +};
>> +
>> +/**
>> + * struct xe_guc_state_capture
>> + *
>> + * Internal context of the xe_guc_capture module.
>> + */
>> +struct xe_guc_state_capture {
>> +	/**
>> +	 * @reglists: static table of register lists used for error-capture state.
>> +	 */
>> +	const struct __guc_mmio_reg_descr_group *reglists;
>> +
>> +	/**
>> +	 * @ads_cache: cached register lists that is ADS format ready
>> +	 */
>> +	struct __guc_capture_ads_cache ads_cache[GUC_CAPTURE_LIST_INDEX_MAX]
>> +						[GUC_CAPTURE_LIST_TYPE_MAX]
>> +						[GUC_MAX_ENGINE_CLASSES];
>> +
>> +	/**
>> +	 * @ads_null_cache: ADS null cache.
>> +	 */
>> +	void *ads_null_cache;
>> +
>> +	/**
>> +	 * @cachelist: Pool of pre-allocated nodes for error capture output
>> +	 *
>> +	 * We need this pool of pre-allocated nodes because we cannot
>> +	 * dynamically allocate new nodes when receiving the G2H notification
>> +	 * because the event handlers for all G2H event-processing is called
>> +	 * by the ct processing worker queue and when that queue is being
>> +	 * processed, there is no absoluate guarantee that we are not in the
>> +	 * midst of a GT reset operation (which doesn't allow allocations).
>> +	 */
>> +	struct list_head cachelist;
>> +#define PREALLOC_NODES_MAX_COUNT (3 * GUC_MAX_ENGINE_CLASSES * GUC_MAX_INSTANCES_PER_CLASS)
>> +#define PREALLOC_NODES_DEFAULT_NUMREGS 64
>> +
>> +	/**
>> +	 * @max_mmio_per_node: Max MMIO per node.
>> +	 */
>> +	int max_mmio_per_node;
>> +
>> +	/**
>> +	 * @outlist: Pool of pre-allocated nodes for error capture output
>> +	 *
>> +	 * A linked list of parsed GuC error-capture output data before
>> +	 * reporting with formatting via xe_devcoredump. Each node in this linked list shall
>> +	 * contain a single engine-capture including global, engine-class and
>> +	 * engine-instance register dumps as per guc_capture_parsed_output_node
>> +	 */
>> +	struct list_head outlist;
>> +};
>> +
>> +#endif /* _XE_GUC_CAPTURE_FWIF_H */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index 19ee71aeaf17..04b03c398191 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -9,6 +9,7 @@
>>   #include <linux/bits.h>
>>   
>>   #include "abi/guc_klvs_abi.h"
>> +#include "xe_hw_engine_types.h"
>>   
>>   #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	4
>>   #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>> @@ -164,8 +165,11 @@ struct guc_mmio_reg {
>>   	u32 flags;
>>   	u32 mask;
>>   #define GUC_REGSET_MASKED		BIT(0)
>> +#define GUC_REGSET_STEERING_NEEDED	BIT(1)
>>   #define GUC_REGSET_MASKED_WITH_VALUE	BIT(2)
>>   #define GUC_REGSET_RESTORE_ONLY		BIT(3)
>> +#define GUC_REGSET_STEERING_GROUP       GENMASK(16, 12)
>> +#define GUC_REGSET_STEERING_INSTANCE    GENMASK(23, 20)
>>   } __packed;
>>   
>>   /* GuC register sets */
>> @@ -194,6 +198,24 @@ enum {
>>   	GUC_CAPTURE_LIST_INDEX_MAX = 2,
>>   };
>>   
>> +/*Register-types of GuC capture register lists */
>> +enum guc_capture_type {
>> +	GUC_CAPTURE_LIST_TYPE_GLOBAL = 0,
>> +	GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
>> +	GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
>> +	GUC_CAPTURE_LIST_TYPE_MAX,
>> +};
>> +
>> +/* Class indecies for capture_class and capture_instance arrays */
>> +enum {
>> +	GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE = 0,
>> +	GUC_CAPTURE_LIST_CLASS_VIDEO = 1,
>> +	GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE = 2,
>> +	GUC_CAPTURE_LIST_CLASS_BLITTER = 3,
>> +	GUC_CAPTURE_LIST_CLASS_GSC_OTHER = 4,
>> +	GUC_CAPTURE_LIST_CLASS_MAX  = 5
>> +};
>> +
>>   /* GuC Additional Data Struct */
>>   struct guc_ads {
>>   	struct guc_mmio_reg_set reg_state_list[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>> index 546ac6350a31..6d7d0976b7af 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -58,6 +58,8 @@ struct xe_guc {
>>   	struct xe_guc_ads ads;
>>   	/** @ct: GuC ct */
>>   	struct xe_guc_ct ct;
>> +	/** @capture: the error-state-capture module's data and objects */
>> +	struct xe_guc_state_capture *capture;
>>   	/** @pc: GuC Power Conservation */
>>   	struct xe_guc_pc pc;
>>   	/** @dbm: GuC Doorbell Manager */
