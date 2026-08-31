Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAA2C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 16:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E271610E9EC;
	Mon, 31 Aug 2026 16:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYY90gOu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209CE10E9EB
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 16:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788193660; x=1819729660;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jV83+ntR8tQtx76dXxxGNPw0C+JDIEoEXd1a86eZYm4=;
 b=iYY90gOuia+Z5vnwlYAKaWPGFTgtdtG5jq9TEhyCg05WhD6qgbpuBaa1
 IWc86RGn/NjTjuFkuoe8EVC8lznB1iDCOarpoeO9tOfxhupBJFh3lias0
 w/MMz+RsPsH7h4g3EVYiUQv0aY5V2px6EwaQMOE8NRXoaSyXWayVNFxoO
 Xzh/sa0fB08itxPubIE8OGHXTU0BC8vOyTdqLxNvlSWiAWtOZzoN7jLaa
 45JSpNNlf1rPtp0JF8uUzZXLJBijbkWM/12suE57ckA4CUk/9Vrge0KKb
 NFLDOTSEc3L4Tu3TIBXm6OIv0WTAam3HU4LMosJTyyCFEK5gft7uiCGGu w==;
X-CSE-ConnectionGUID: tzhK1fs0R6q6ePBNxUe8dQ==
X-CSE-MsgGUID: OB6/TS+KRBWrr/j5oKYg1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="98942285"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="98942285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 09:27:40 -0700
X-CSE-ConnectionGUID: ueMqM5wARd6o1SM/2unStw==
X-CSE-MsgGUID: bsWy5UfeTmuat6ScIZo6OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="265130392"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 09:27:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 09:27:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 09:27:39 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 09:27:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRSaJpLFewkG6bE4fWaDCM9RkQjMrnbwmfUe9h6jtn+/l5lP1m2Vp20tOF5aYyuCGzIIJWtwCzUebWCVaGwyPzcrH/tRADdNqtE8QeEvHrnbmlc7eGwgMAJRVl+lCKPNF3bJz88xEAk5AEMsmJSOq24Ml8B7oA+UhSWIaZf30bTSQ7lXoirk5HRIIDIkjFZya+G3aLOlQGfeJqFkL9F2qNHQs7UeB3oblPt/jl37YxbRmTWDdODhI1Lff3xmyPc8fgcxvAD6qizmQLKBlq/JxbBoojtzZRjq2/2L5XEcjh8JXWxJW9UMiAXBAjPvx/oJfPuARL/B1UVpkAxu0P75xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alIlZ98Jl1Q2avDgoR20ftRUQ/l9KpOMgxq5K+4zgvI=;
 b=tCOZVc2gI+ZO4jhJPI53KD6G/Mki+7Kkv61usuj5jG7ZcSJ/ldINVZUnSGWt8sKNTYINf7D1RWvSzg7NcWfCxuAxfKuWCVKKaIFZDRJQODNDemKD4GZ7Sss10FS2AdZ7BiwPmtDcyBHn0uBHd6qmg7GSFMPlL7OJ/zKJT2QruCUGpkOJYjSZ5fZxq4AsP7DnPxtl6z+gZOzmdEQlTqKsn4ZbqS9/uceO2C4ioqmESL5S3LTGAGLEdHH+1Yk5cT6hH5Zw0zNUKhViEvkiz9LEdWIsQX8ifGDD5BGDYSHE08olFueH2tMeX05MqT5Ddc5dMuox6YU5266Wu6kbqfdf5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 16:27:34 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 16:27:34 +0000
Message-ID: <eb8ea8ab-d465-4105-bb1a-db05ddf930ee@intel.com>
Date: Mon, 31 Aug 2026 21:57:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Increase timeout for mailbox power
 limits
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
 <20260729171546.3368457-3-karthik.poosa@intel.com>
 <ad776a91-9b0a-4a72-8b05-8890a7b5a4cd@intel.com>
 <2c61329e-a7d0-4524-b585-5d10fd970ffe@intel.com>
 <dc04b171-55dd-4a9d-9ba6-fb3960582e33@intel.com>
 <apUwOZpuO1kOhyVs@black.igk.intel.com> <apWIek2rVOLgbTre@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <apWIek2rVOLgbTre@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0250.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::11) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA1PR11MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 55889b2e-722c-4038-a0da-08df077cc33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|3023799007|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: o1cLtWsVX6HArgL7J6qhGZ6CGEoeR7yNIyr9zbW0zg3CvXUyjflvNlQVwobNlzLhn+b5wUxRApr6RIBfpux9+JYPXUN4EphFrw/MMGxaSz4DOql7jtnVKIlSuj340tKOF07jdcs01DmDh68qRp9r+HZ+OkRNSfmbYc3iAmWed4wPbja9dRnAoKQsNgUwDTkqvw/aVv4cE3zgksdUDhqgiG9xF9uxSB7xdiTUQ4HcpByT+3rIxLk2m4XO+70WiUkxt9kyXpBUKUipRYhojWnpBk74KH3byW3Xp44qT9oo+toXEhsPlczYcGpqZaSardDwrOfRKu/L/K8uHAhOP8TIntuQV8hABK0I8cXucX1e+9iET4pf7e8ZHML2OtnBjZLXAnRUKD5nmmnli2p0in6O5FVakdWLr/kYDSKcAQldUCaf2ILDjoVoiHZUINsygh+BR1SzggS+KwFeqFHNl1v9rE71so3et0boAZYN07xtVzaJ5fjJq/DAQUvQK3Z/NRANR2tUQxIcBB7wPhpZ4ESjn+8WkdTNgMQSdEPqUFO8oAELqLXqZd1Scp9IW9D7izCQ3ujTTRvEVslxqgb1tVIZA1Ty2dQ3PYb5aarMixnpZoU57Kc4Mx6cTtkoaB2jYG77yFQbW4Qq/uh1S7CAAw2t1hFH8FQmMC/N1u5Kn5V6oME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3JXS1FSb3crWncyeE4vVTI2SDEwWkJpdkd1dENmK1lxMHFEVjdnQ2ZiU1Y4?=
 =?utf-8?B?RUZLREROY2gxSExGbHQybGRZa2R2cDBwUTEyeTNsNjRROUNwcGJsWnBEaXRt?=
 =?utf-8?B?WG1BSXBQSWluZi9JZmZocFpXM21YYnlIUm1aakhEN0NZMmZhNnAvemw4NkdL?=
 =?utf-8?B?UW5pM2UzME1RZGNzTVdQNnQ4cDd5K2lKekN3T25POVJLKzY0YnNtREZBVGFi?=
 =?utf-8?B?allCUUt4ZjljSWFuRHR6VXBFM2VPRXp3R3RpelB2UmQwNFpLMFJ0eXhScWxq?=
 =?utf-8?B?NWkrejFBQ3A4WWpnRXRRV1JmMkkwajNTQXZFVmxVak1iQ0Q2Tk1QYUc1ellh?=
 =?utf-8?B?RE1hYnhLZGhBTVpWWWZXYnNSTlNoRHZ2QlIraDN5WndWZllYOTYwY1NLekRI?=
 =?utf-8?B?eTJ4b2dkcnZubDBpd0NEOG9SREJtK0dvNWVHdDlwalpMa0NDbGwvckJOZTlu?=
 =?utf-8?B?NmViWjhPeGNxSVRLMTJsanM5ZVlsQVh6YnFrUlp0RHpjQ2d2TC93ckMybGlG?=
 =?utf-8?B?anJZbG4zc2NFWmhudStnV00xbzNZOXZOOUpUTmorU2VNUTdaREllbnBMbm5a?=
 =?utf-8?B?TEdlSmdNYXQzcFZjS3lyYWQ3ek5CQ2JMd21IRmFsamYzbG5iV0Z5cE1tUFRp?=
 =?utf-8?B?cHNhb3hidDhsZ3FVWjlCc1N5dGtRM0t1bHVZNG5qa1NIQlNpZG9xQ0JLZVBK?=
 =?utf-8?B?bWZNMTgwZFZYQ2hZY2dPTldVSnRZUWFwU3dBc0hwOFZCcFhueUNYS016RVJx?=
 =?utf-8?B?bkZYNURLaGo5dDhBV29TZVNSYi9rb1drcUdkSy9PUlphU3BqN0RQNEtCSHVG?=
 =?utf-8?B?VXA1WS9Ec0RmcGhIakorWjh1V1YrS0p5aE4xSlpBWVBIdDQ1TldIZ0FWTGRX?=
 =?utf-8?B?UWtlMWdDRitBbUlWNitQMEpha1lpZEZZV2NDOVY4YUd4RXI1Vm1oZXRBVytI?=
 =?utf-8?B?Ym9tQ1dqUENaRG5GWWt6anJrSDVkRnlnbnY5cE1BckVIRER1YkYwL0piZ2J4?=
 =?utf-8?B?RFBaZ0RMT2lwVkRHSG9tWDFiclpudGVReW5QNUZBNkhVemxUVEZEampNQzM0?=
 =?utf-8?B?cC9tRXlqNWFNdHdYdlp2aGl6QWtIS1E4czZ0K3dtbWQyUUJUY0ZJRzg5VDEr?=
 =?utf-8?B?dm16blg3Q0o1N05oNC9KWEtsRkFyWE5TVTA5RnhMYWo1V3h1RnRBTlJUaHNU?=
 =?utf-8?B?US9LbEluVisvcTA4TDRhRXB3ZE1zUXlCT3p5L1BZUW1PMTNCV0xsdUVHcTc1?=
 =?utf-8?B?UGRpYlBqamx4dlhETzJISHpIdHBRZjU4QVNWTmRFNUJkUFRRK00yT3JLSHVh?=
 =?utf-8?B?WFdyZU1TQXc3cGcvbVZ6Z0U5UER0VlJwWkpicTlsUjNqK2htM0x6Z2luczRW?=
 =?utf-8?B?Wm5hNG1ZRzJpbmRDK3lzK0Jkakpxd21lbk1GWHkveXEzZWNSemVqN2xydVZM?=
 =?utf-8?B?S2pTb2JJNS9sNnBRN2ZYYU81QTdhWktwalB4KzB2ek14SVQzcVVlZjhOUHVs?=
 =?utf-8?B?ZDNNbE9wS0FRWFpBM1JRZ3gwTCthQ1lBL3FEbUtQMkZTMlJtSVNTL1lDdURP?=
 =?utf-8?B?UkN0bXE1Z3pmUjlqbmhSYzF2dXlncjBhUlNIM0xkYlBvbXNYZ3VQMUhZL2N4?=
 =?utf-8?B?RTd3dnZ0bkF6Z3RkczBTVjhheWtZS0doNkYzV0NKTFc1S1I4c1JZSWlzWG01?=
 =?utf-8?B?QnRqZjFKd1F5UWQ2TGErSFRvTUZ3aHQ0dndGR1JZaFo4OC9rdXVmOEdjYUVr?=
 =?utf-8?B?TTUxcSsydUVrVGNzT0lkQ241bUloYWZCQVpVYVlpRk4vbHBnQ3lSbUxhQ1I4?=
 =?utf-8?B?WTlFQ3hldTZ4QTl2aFRtU0RlZUw4MnZKNHFFNzJXc1EzdDdCRjRYYkdXdERw?=
 =?utf-8?B?VmdwMDRYaHludUM0akJicWdEeFR4SWk1TXJhcWpLcXNZR3hTU05kRE9jSTEz?=
 =?utf-8?B?ejFOVDRHUnBRYmJPZmVja0dvZFBsZTM3ZlpYQXJnZUFOVnhyaG1takNlMDUv?=
 =?utf-8?B?SFN3cFNVK3dwNU9yUnppMzlycFdSZ0xFaDAxdlVoYWtvZ3VDWVpIaUdKUkVv?=
 =?utf-8?B?a0FjcVh0T1I3ejFYSkJKRW9XZHJ2NTBmcE1udTZkZGovTFA0Y2NueFdZZVA1?=
 =?utf-8?B?V29ZZWxCYVVzVHFMMnhOUnh6bjA0cGhXVXp1V2N3YWxYS0RQbVplOHY1aDY0?=
 =?utf-8?B?dkMzazl1OWxSUk1kckk1NVdnZGJVTHRKS3IzQVRpNSsrZGdxWDQ3R1U1ZW9X?=
 =?utf-8?B?ZS9hcldhMHQyWEkwcDdsbGlBOGt2WFVtWUtBZEtrcWtlVjZ6Zkx2Y2ZCYk9C?=
 =?utf-8?B?bzYxS3krc05id2VRL3NzczVPeXRIWnpabzQvazl1SHh1ekl0cm5ZUT09?=
X-Exchange-RoutingPolicyChecked: Z0svFXNPNx79983AyzSu4M5fYZ4GbzCi3XcTxaU+vRddbRXxQOxqp5p0s1sXoMtXTacBmi/qfnhqiteRYOyXG0CCt0AXCD1aiHDbSQpltz2tK9bpGMj47s3uvs10saHg+thed5XjV5ZVmqUODjIM6aLDmrd10q7nBqKKHL4fc7z77psEXNnCw1NurtZIjBkmJt8rvQQdfdgY793cfOse0Zian8ObxTVUU2eMJKaDWRaCGm9JPdinn2xRdEXQlpTncvm1J5jGcVFVTQBmr3geBRAn5tVLjFp2YqWz1Jkmjs6qxsR6FG4266PYJLD1X7bBY4Qqh8u2okana0UOZDmO8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 55889b2e-722c-4038-a0da-08df077cc33b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 16:27:34.6568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKR+RcPTOshZ48zRPw2KCQ1qgO0DVek4kmb/B/Zlpozn0XuXvciLtJbn82w/R73dQ40m2sB1moNCmu1EFWFIww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
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


On 31-08-2026 19:28, Rodrigo Vivi wrote:
> On Mon, Aug 31, 2026 at 09:41:45AM +0200, Raag Jadav wrote:
>> On Mon, Aug 31, 2026 at 12:39:50PM +0530, Tauro, Riana wrote:
>>> On 31-08-2026 12:24, Poosa, Karthik wrote:
>>>> On 31-08-2026 10:59, Tauro, Riana wrote:
>>>>> On 29-07-2026 22:45, Karthik Poosa wrote:
>>>>>> Mailbox power limit operations can occasionally take longer than the
>>>>>> current 1 ms timeout, causing sporadic failures.
>> Why?
>>
>>>>>> Increase the timeout to 10 ms and rename PL_WRITE_MBX_TIMEOUT_MS to
>>>>>> PL_MBX_TIMEOUT_MS to better reflect its usage.
>>>>> Why is the timeout applicable only for power and not the other
>>>>> attribute reads?
>>>> Because the timeout is seen only with mailbox power limit commands only,
>>>> default 1ms timeout wasn't enough here.
>>> Any reason why this is not seen for the other reads?
>> +1, these things should be coming from a hard spec with valid technical
>> justification and not some random email asking us to do so.
> Well, you have such high expectations :)
> Sometimes we have to live with the empirical... while we hunt other teams asking
> them to do their job correctly, of course...
>
> Interestingly enough, I just found in some of the many spread pcode docs:
>
> driver_to_pcode_mailbox_spec.html#mailbox-response-time
>
> """
> Mailbox response time
> Mailbox response timeout shoudl be set to 10ms as worst case.
> """
>
> Perhaps we should simply change the default to 10ms.

Investigation is ongoing to understand why some pcode mailbox commands 
occasionally take longer to complete.

Until then, using the documented worst-case timeout as default timeout 
seems the better approach.

>
>> Raag
